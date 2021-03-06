//=============================================================================
// Item.
//=============================================================================
class Item expands RenderActor
	native;

var() travel vector		PlayerViewOffset;   // Offset from view center.
var() float				BobDamping;		    // how much to damp view bob

var() class<Actor>		AdditionalHitEffectClass;

// Network replication.
replication
{
	// Things the server should send to the client.
	reliable if( Role==ROLE_Authority && bNetOwner )
		PlayerViewOffset;
}

simulated event RenderOverlays( canvas Canvas )
{
	if ( Decoration(self) == none )
	{
		SetRotation( Pawn(Owner).ViewRotation + CalcDrawRotOffset() );
		SetLocation( Owner.Location + CalcDrawOffset() );
	} else if ( (PlayerPawn(Base) != none) && (PlayerPawn(Base).CarriedDecoration == self) )
		PlayerPawn(Base).PositionDecoration();

	Canvas.SetClampMode( false );
	Canvas.DrawActor( self, false );
	Canvas.SetClampMode( true );
}

// Compute offset for drawing.
simulated final function vector CalcDrawOffset()
{
	local vector DrawOffset, WeaponBob, X, Y, Z;
	local Pawn PawnOwner;
	local PlayerPawn PlayerOwner;
	local vector vel;

	PawnOwner = Pawn(Owner);
	DrawOffset = ((0.9/90 * PlayerViewOffset) >> PawnOwner.ViewRotation);

	if ( (Level.NetMode == NM_DedicatedServer) 
		|| ((Level.NetMode == NM_ListenServer) && (Owner.RemoteRole == ROLE_AutonomousProxy)) )
		DrawOffset += (PawnOwner.BaseEyeHeight * vect(0,0,1));
	else
	{
		DrawOffset += (PawnOwner.EyeHeight * vect(0,0,1));
		WeaponBob = BobDamping * PawnOwner.WalkBob;
		WeaponBob.Z = (0.45 + 0.55 * BobDamping) * PawnOwner.WalkBob.Z;
		DrawOffset += WeaponBob;
	}
	if ( Owner.IsA('PlayerPawn') )
	{
		GetAxes( PawnOwner.ViewRotation, X, Y, Z );
		DrawOffset -= X*PlayerPawn(Owner).WeapShakeOffset;
		DrawOffset += PlayerPawn(Owner).VibrationVector;
	}

	PlayerOwner = PlayerPawn(Owner);

	// Get the velocity to use in weapon lag
	// could try out some g-force calculation, my favorite...
	// -x
	vel = PlayerOwner.Velocity * -PlayerOwner.LagIntensity;
	PlayerOwner.targetvel.x = lerp(10.0 * Level.TimeDeltaSeconds, PlayerOwner.targetvel.x, vel.x);
	PlayerOwner.targetvel.y = lerp(10.0 * Level.TimeDeltaSeconds, PlayerOwner.targetvel.y, vel.y);
	PlayerOwner.targetvel.z = lerp(10.0 * Level.TimeDeltaSeconds, PlayerOwner.targetvel.z, vel.z);

	DrawOffset += PlayerOwner.targetvel;

	// 					I KNOW WHAT IM DOING -x
	DrawOffset += (PlayerOwner.VibrationVector * 0.1);

	return DrawOffset;
}

simulated final function Rotator CalcDrawRotOffset()
{
	local Rotator DrawOffset;
	local PlayerPawn PlayerOwner;

	PlayerOwner = PlayerPawn(Owner);

	// WEAPON SWAAAAAAY -x
	// smooth out the sway with lerp
	PlayerOwner.targetpitch = lerp(10.0 * Level.TimeDeltaSeconds, PlayerOwner.targetpitch, (PlayerOwner.UpDownSpeed) * PlayerOwner.SwayIntensity / 250.0);
	PlayerOwner.targetyaw = lerp(10.0 * Level.TimeDeltaSeconds, PlayerOwner.targetyaw, (PlayerOwner.LeftRightSpeed) * PlayerOwner.SwayIntensity / 250.0);

	// apply the sway
	//TargetRotation = PlayerOwner.ViewRotation;
	DrawOffset.Pitch -= PlayerOwner.targetpitch;
	DrawOffset.Yaw -= PlayerOwner.targetyaw;

	// clamp the sway
	// there might be a better way than just plonking the value to zero -x
	if ( ( PlayerOwner.ViewRotation.Pitch == 18000 ) || ( PlayerOwner.ViewRotation.Pitch == 49152 ) )
		DrawOffset.Pitch = 0;

	return DrawOffset;
}

simulated function HitEffect( vector HitLocation, class<DamageType> DamageType, vector Momentum, float DecoHealth, float HitDamage, bool bNoCreationSounds )
{
	if ( AdditionalHitEffectClass != None )
		spawn( AdditionalHitEffectClass, Self, , HitLocation, rotator(Momentum) );
}

defaultproperties
{
	BobDamping=0.801
    PlayerViewOffset=(X=20.000000,Y=-3.000000,Z=-27.719999)
    PhysNoneOnStop=True
	HitPackageClass=class'HitPackage_Decoration'
}
