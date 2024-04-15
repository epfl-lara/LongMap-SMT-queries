; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45378 () Bool)

(assert start!45378)

(declare-fun b!498467 () Bool)

(declare-fun e!292125 () Bool)

(declare-fun e!292127 () Bool)

(assert (=> b!498467 (= e!292125 (not e!292127))))

(declare-fun res!300665 () Bool)

(assert (=> b!498467 (=> res!300665 e!292127)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!225753 () (_ BitVec 64))

(declare-fun lt!225749 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3952 0))(
  ( (MissingZero!3952 (index!17990 (_ BitVec 32))) (Found!3952 (index!17991 (_ BitVec 32))) (Intermediate!3952 (undefined!4764 Bool) (index!17992 (_ BitVec 32)) (x!47048 (_ BitVec 32))) (Undefined!3952) (MissingVacant!3952 (index!17993 (_ BitVec 32))) )
))
(declare-fun lt!225752 () SeekEntryResult!3952)

(declare-datatypes ((array!32213 0))(
  ( (array!32214 (arr!15488 (Array (_ BitVec 32) (_ BitVec 64))) (size!15853 (_ BitVec 32))) )
))
(declare-fun lt!225751 () array!32213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32213 (_ BitVec 32)) SeekEntryResult!3952)

(assert (=> b!498467 (= res!300665 (= lt!225752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225749 lt!225753 lt!225751 mask!3524)))))

(declare-fun a!3235 () array!32213)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!225754 () (_ BitVec 32))

(assert (=> b!498467 (= lt!225752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225754 (select (arr!15488 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498467 (= lt!225749 (toIndex!0 lt!225753 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498467 (= lt!225753 (select (store (arr!15488 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498467 (= lt!225754 (toIndex!0 (select (arr!15488 a!3235) j!176) mask!3524))))

(assert (=> b!498467 (= lt!225751 (array!32214 (store (arr!15488 a!3235) i!1204 k0!2280) (size!15853 a!3235)))))

(declare-fun e!292122 () Bool)

(assert (=> b!498467 e!292122))

(declare-fun res!300667 () Bool)

(assert (=> b!498467 (=> (not res!300667) (not e!292122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32213 (_ BitVec 32)) Bool)

(assert (=> b!498467 (= res!300667 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14878 0))(
  ( (Unit!14879) )
))
(declare-fun lt!225745 () Unit!14878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14878)

(assert (=> b!498467 (= lt!225745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498468 () Bool)

(declare-fun res!300671 () Bool)

(declare-fun e!292128 () Bool)

(assert (=> b!498468 (=> (not res!300671) (not e!292128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498468 (= res!300671 (validKeyInArray!0 k0!2280))))

(declare-fun b!498469 () Bool)

(declare-fun res!300676 () Bool)

(assert (=> b!498469 (=> (not res!300676) (not e!292128))))

(assert (=> b!498469 (= res!300676 (and (= (size!15853 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15853 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15853 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498470 () Bool)

(declare-fun res!300674 () Bool)

(assert (=> b!498470 (=> (not res!300674) (not e!292128))))

(declare-fun arrayContainsKey!0 (array!32213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498470 (= res!300674 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498471 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32213 (_ BitVec 32)) SeekEntryResult!3952)

(assert (=> b!498471 (= e!292122 (= (seekEntryOrOpen!0 (select (arr!15488 a!3235) j!176) a!3235 mask!3524) (Found!3952 j!176)))))

(declare-fun b!498472 () Bool)

(assert (=> b!498472 (= e!292128 e!292125)))

(declare-fun res!300672 () Bool)

(assert (=> b!498472 (=> (not res!300672) (not e!292125))))

(declare-fun lt!225746 () SeekEntryResult!3952)

(assert (=> b!498472 (= res!300672 (or (= lt!225746 (MissingZero!3952 i!1204)) (= lt!225746 (MissingVacant!3952 i!1204))))))

(assert (=> b!498472 (= lt!225746 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498473 () Bool)

(declare-fun e!292126 () Bool)

(assert (=> b!498473 (= e!292126 false)))

(declare-fun res!300673 () Bool)

(assert (=> start!45378 (=> (not res!300673) (not e!292128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45378 (= res!300673 (validMask!0 mask!3524))))

(assert (=> start!45378 e!292128))

(assert (=> start!45378 true))

(declare-fun array_inv!11371 (array!32213) Bool)

(assert (=> start!45378 (array_inv!11371 a!3235)))

(declare-fun b!498474 () Bool)

(declare-fun res!300675 () Bool)

(assert (=> b!498474 (=> (not res!300675) (not e!292128))))

(assert (=> b!498474 (= res!300675 (validKeyInArray!0 (select (arr!15488 a!3235) j!176)))))

(declare-fun b!498475 () Bool)

(declare-fun e!292121 () Bool)

(assert (=> b!498475 (= e!292127 e!292121)))

(declare-fun res!300677 () Bool)

(assert (=> b!498475 (=> res!300677 e!292121)))

(assert (=> b!498475 (= res!300677 (or (bvsgt #b00000000000000000000000000000000 (x!47048 lt!225752)) (bvsgt (x!47048 lt!225752) #b01111111111111111111111111111110) (bvslt lt!225754 #b00000000000000000000000000000000) (bvsge lt!225754 (size!15853 a!3235)) (bvslt (index!17992 lt!225752) #b00000000000000000000000000000000) (bvsge (index!17992 lt!225752) (size!15853 a!3235)) (not (= lt!225752 (Intermediate!3952 false (index!17992 lt!225752) (x!47048 lt!225752))))))))

(assert (=> b!498475 (and (or (= (select (arr!15488 a!3235) (index!17992 lt!225752)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15488 a!3235) (index!17992 lt!225752)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15488 a!3235) (index!17992 lt!225752)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15488 a!3235) (index!17992 lt!225752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225750 () Unit!14878)

(declare-fun e!292123 () Unit!14878)

(assert (=> b!498475 (= lt!225750 e!292123)))

(declare-fun c!59178 () Bool)

(assert (=> b!498475 (= c!59178 (= (select (arr!15488 a!3235) (index!17992 lt!225752)) (select (arr!15488 a!3235) j!176)))))

(assert (=> b!498475 (and (bvslt (x!47048 lt!225752) #b01111111111111111111111111111110) (or (= (select (arr!15488 a!3235) (index!17992 lt!225752)) (select (arr!15488 a!3235) j!176)) (= (select (arr!15488 a!3235) (index!17992 lt!225752)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15488 a!3235) (index!17992 lt!225752)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498476 () Bool)

(declare-fun Unit!14880 () Unit!14878)

(assert (=> b!498476 (= e!292123 Unit!14880)))

(declare-fun b!498477 () Bool)

(declare-fun res!300670 () Bool)

(assert (=> b!498477 (=> (not res!300670) (not e!292125))))

(assert (=> b!498477 (= res!300670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498478 () Bool)

(assert (=> b!498478 (= e!292121 true)))

(declare-fun lt!225748 () SeekEntryResult!3952)

(assert (=> b!498478 (= lt!225748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225754 lt!225753 lt!225751 mask!3524))))

(declare-fun b!498479 () Bool)

(declare-fun res!300666 () Bool)

(assert (=> b!498479 (=> res!300666 e!292127)))

(get-info :version)

(assert (=> b!498479 (= res!300666 (or (undefined!4764 lt!225752) (not ((_ is Intermediate!3952) lt!225752))))))

(declare-fun b!498480 () Bool)

(declare-fun Unit!14881 () Unit!14878)

(assert (=> b!498480 (= e!292123 Unit!14881)))

(declare-fun lt!225747 () Unit!14878)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32213 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14878)

(assert (=> b!498480 (= lt!225747 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225754 #b00000000000000000000000000000000 (index!17992 lt!225752) (x!47048 lt!225752) mask!3524))))

(declare-fun res!300668 () Bool)

(assert (=> b!498480 (= res!300668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225754 lt!225753 lt!225751 mask!3524) (Intermediate!3952 false (index!17992 lt!225752) (x!47048 lt!225752))))))

(assert (=> b!498480 (=> (not res!300668) (not e!292126))))

(assert (=> b!498480 e!292126))

(declare-fun b!498481 () Bool)

(declare-fun res!300669 () Bool)

(assert (=> b!498481 (=> (not res!300669) (not e!292125))))

(declare-datatypes ((List!9685 0))(
  ( (Nil!9682) (Cons!9681 (h!10555 (_ BitVec 64)) (t!15904 List!9685)) )
))
(declare-fun arrayNoDuplicates!0 (array!32213 (_ BitVec 32) List!9685) Bool)

(assert (=> b!498481 (= res!300669 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9682))))

(assert (= (and start!45378 res!300673) b!498469))

(assert (= (and b!498469 res!300676) b!498474))

(assert (= (and b!498474 res!300675) b!498468))

(assert (= (and b!498468 res!300671) b!498470))

(assert (= (and b!498470 res!300674) b!498472))

(assert (= (and b!498472 res!300672) b!498477))

(assert (= (and b!498477 res!300670) b!498481))

(assert (= (and b!498481 res!300669) b!498467))

(assert (= (and b!498467 res!300667) b!498471))

(assert (= (and b!498467 (not res!300665)) b!498479))

(assert (= (and b!498479 (not res!300666)) b!498475))

(assert (= (and b!498475 c!59178) b!498480))

(assert (= (and b!498475 (not c!59178)) b!498476))

(assert (= (and b!498480 res!300668) b!498473))

(assert (= (and b!498475 (not res!300677)) b!498478))

(declare-fun m!479233 () Bool)

(assert (=> b!498468 m!479233))

(declare-fun m!479235 () Bool)

(assert (=> b!498481 m!479235))

(declare-fun m!479237 () Bool)

(assert (=> b!498478 m!479237))

(declare-fun m!479239 () Bool)

(assert (=> b!498475 m!479239))

(declare-fun m!479241 () Bool)

(assert (=> b!498475 m!479241))

(assert (=> b!498474 m!479241))

(assert (=> b!498474 m!479241))

(declare-fun m!479243 () Bool)

(assert (=> b!498474 m!479243))

(assert (=> b!498471 m!479241))

(assert (=> b!498471 m!479241))

(declare-fun m!479245 () Bool)

(assert (=> b!498471 m!479245))

(declare-fun m!479247 () Bool)

(assert (=> b!498470 m!479247))

(declare-fun m!479249 () Bool)

(assert (=> b!498467 m!479249))

(declare-fun m!479251 () Bool)

(assert (=> b!498467 m!479251))

(declare-fun m!479253 () Bool)

(assert (=> b!498467 m!479253))

(declare-fun m!479255 () Bool)

(assert (=> b!498467 m!479255))

(assert (=> b!498467 m!479241))

(declare-fun m!479257 () Bool)

(assert (=> b!498467 m!479257))

(assert (=> b!498467 m!479241))

(declare-fun m!479259 () Bool)

(assert (=> b!498467 m!479259))

(assert (=> b!498467 m!479241))

(declare-fun m!479261 () Bool)

(assert (=> b!498467 m!479261))

(declare-fun m!479263 () Bool)

(assert (=> b!498467 m!479263))

(declare-fun m!479265 () Bool)

(assert (=> b!498477 m!479265))

(declare-fun m!479267 () Bool)

(assert (=> b!498472 m!479267))

(declare-fun m!479269 () Bool)

(assert (=> start!45378 m!479269))

(declare-fun m!479271 () Bool)

(assert (=> start!45378 m!479271))

(declare-fun m!479273 () Bool)

(assert (=> b!498480 m!479273))

(assert (=> b!498480 m!479237))

(check-sat (not b!498474) (not b!498467) (not b!498481) (not b!498471) (not b!498478) (not b!498480) (not start!45378) (not b!498477) (not b!498468) (not b!498470) (not b!498472))
(check-sat)
