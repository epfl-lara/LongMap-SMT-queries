; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44612 () Bool)

(assert start!44612)

(declare-fun b!489428 () Bool)

(declare-fun res!292425 () Bool)

(declare-fun e!287847 () Bool)

(assert (=> b!489428 (=> (not res!292425) (not e!287847))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31672 0))(
  ( (array!31673 (arr!15223 (Array (_ BitVec 32) (_ BitVec 64))) (size!15587 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31672)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489428 (= res!292425 (and (= (size!15587 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15587 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15587 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489429 () Bool)

(declare-fun res!292426 () Bool)

(assert (=> b!489429 (=> (not res!292426) (not e!287847))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489429 (= res!292426 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!292423 () Bool)

(assert (=> start!44612 (=> (not res!292423) (not e!287847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44612 (= res!292423 (validMask!0 mask!3524))))

(assert (=> start!44612 e!287847))

(assert (=> start!44612 true))

(declare-fun array_inv!11082 (array!31672) Bool)

(assert (=> start!44612 (array_inv!11082 a!3235)))

(declare-fun b!489430 () Bool)

(declare-fun e!287845 () Bool)

(assert (=> b!489430 (= e!287847 e!287845)))

(declare-fun res!292424 () Bool)

(assert (=> b!489430 (=> (not res!292424) (not e!287845))))

(declare-datatypes ((SeekEntryResult!3646 0))(
  ( (MissingZero!3646 (index!16763 (_ BitVec 32))) (Found!3646 (index!16764 (_ BitVec 32))) (Intermediate!3646 (undefined!4458 Bool) (index!16765 (_ BitVec 32)) (x!46021 (_ BitVec 32))) (Undefined!3646) (MissingVacant!3646 (index!16766 (_ BitVec 32))) )
))
(declare-fun lt!220874 () SeekEntryResult!3646)

(assert (=> b!489430 (= res!292424 (or (= lt!220874 (MissingZero!3646 i!1204)) (= lt!220874 (MissingVacant!3646 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31672 (_ BitVec 32)) SeekEntryResult!3646)

(assert (=> b!489430 (= lt!220874 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489431 () Bool)

(declare-fun res!292420 () Bool)

(assert (=> b!489431 (=> (not res!292420) (not e!287847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489431 (= res!292420 (validKeyInArray!0 k0!2280))))

(declare-fun b!489432 () Bool)

(declare-fun e!287846 () Bool)

(assert (=> b!489432 (= e!287846 (= (seekEntryOrOpen!0 (select (arr!15223 a!3235) j!176) a!3235 mask!3524) (Found!3646 j!176)))))

(declare-fun b!489433 () Bool)

(assert (=> b!489433 (= e!287845 (not true))))

(declare-fun lt!220873 () (_ BitVec 32))

(declare-fun lt!220871 () SeekEntryResult!3646)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31672 (_ BitVec 32)) SeekEntryResult!3646)

(assert (=> b!489433 (= lt!220871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220873 (select (store (arr!15223 a!3235) i!1204 k0!2280) j!176) (array!31673 (store (arr!15223 a!3235) i!1204 k0!2280) (size!15587 a!3235)) mask!3524))))

(declare-fun lt!220872 () (_ BitVec 32))

(declare-fun lt!220876 () SeekEntryResult!3646)

(assert (=> b!489433 (= lt!220876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220872 (select (arr!15223 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489433 (= lt!220873 (toIndex!0 (select (store (arr!15223 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489433 (= lt!220872 (toIndex!0 (select (arr!15223 a!3235) j!176) mask!3524))))

(assert (=> b!489433 e!287846))

(declare-fun res!292421 () Bool)

(assert (=> b!489433 (=> (not res!292421) (not e!287846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31672 (_ BitVec 32)) Bool)

(assert (=> b!489433 (= res!292421 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14299 0))(
  ( (Unit!14300) )
))
(declare-fun lt!220875 () Unit!14299)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14299)

(assert (=> b!489433 (= lt!220875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489434 () Bool)

(declare-fun res!292422 () Bool)

(assert (=> b!489434 (=> (not res!292422) (not e!287845))))

(declare-datatypes ((List!9288 0))(
  ( (Nil!9285) (Cons!9284 (h!10146 (_ BitVec 64)) (t!15508 List!9288)) )
))
(declare-fun arrayNoDuplicates!0 (array!31672 (_ BitVec 32) List!9288) Bool)

(assert (=> b!489434 (= res!292422 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9285))))

(declare-fun b!489435 () Bool)

(declare-fun res!292418 () Bool)

(assert (=> b!489435 (=> (not res!292418) (not e!287847))))

(assert (=> b!489435 (= res!292418 (validKeyInArray!0 (select (arr!15223 a!3235) j!176)))))

(declare-fun b!489436 () Bool)

(declare-fun res!292419 () Bool)

(assert (=> b!489436 (=> (not res!292419) (not e!287845))))

(assert (=> b!489436 (= res!292419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44612 res!292423) b!489428))

(assert (= (and b!489428 res!292425) b!489435))

(assert (= (and b!489435 res!292418) b!489431))

(assert (= (and b!489431 res!292420) b!489429))

(assert (= (and b!489429 res!292426) b!489430))

(assert (= (and b!489430 res!292424) b!489436))

(assert (= (and b!489436 res!292419) b!489434))

(assert (= (and b!489434 res!292422) b!489433))

(assert (= (and b!489433 res!292421) b!489432))

(declare-fun m!469465 () Bool)

(assert (=> b!489433 m!469465))

(declare-fun m!469467 () Bool)

(assert (=> b!489433 m!469467))

(declare-fun m!469469 () Bool)

(assert (=> b!489433 m!469469))

(declare-fun m!469471 () Bool)

(assert (=> b!489433 m!469471))

(assert (=> b!489433 m!469465))

(declare-fun m!469473 () Bool)

(assert (=> b!489433 m!469473))

(declare-fun m!469475 () Bool)

(assert (=> b!489433 m!469475))

(assert (=> b!489433 m!469473))

(declare-fun m!469477 () Bool)

(assert (=> b!489433 m!469477))

(assert (=> b!489433 m!469473))

(declare-fun m!469479 () Bool)

(assert (=> b!489433 m!469479))

(assert (=> b!489433 m!469465))

(declare-fun m!469481 () Bool)

(assert (=> b!489433 m!469481))

(declare-fun m!469483 () Bool)

(assert (=> b!489431 m!469483))

(assert (=> b!489432 m!469473))

(assert (=> b!489432 m!469473))

(declare-fun m!469485 () Bool)

(assert (=> b!489432 m!469485))

(declare-fun m!469487 () Bool)

(assert (=> b!489429 m!469487))

(declare-fun m!469489 () Bool)

(assert (=> b!489434 m!469489))

(declare-fun m!469491 () Bool)

(assert (=> start!44612 m!469491))

(declare-fun m!469493 () Bool)

(assert (=> start!44612 m!469493))

(assert (=> b!489435 m!469473))

(assert (=> b!489435 m!469473))

(declare-fun m!469495 () Bool)

(assert (=> b!489435 m!469495))

(declare-fun m!469497 () Bool)

(assert (=> b!489430 m!469497))

(declare-fun m!469499 () Bool)

(assert (=> b!489436 m!469499))

(check-sat (not b!489435) (not b!489436) (not b!489434) (not b!489430) (not b!489433) (not b!489429) (not start!44612) (not b!489432) (not b!489431))
(check-sat)
