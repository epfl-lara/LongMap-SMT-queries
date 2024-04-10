; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45206 () Bool)

(assert start!45206)

(declare-fun b!496222 () Bool)

(declare-fun e!291027 () Bool)

(assert (=> b!496222 (= e!291027 true)))

(declare-datatypes ((SeekEntryResult!3897 0))(
  ( (MissingZero!3897 (index!17767 (_ BitVec 32))) (Found!3897 (index!17768 (_ BitVec 32))) (Intermediate!3897 (undefined!4709 Bool) (index!17769 (_ BitVec 32)) (x!46829 (_ BitVec 32))) (Undefined!3897) (MissingVacant!3897 (index!17770 (_ BitVec 32))) )
))
(declare-fun lt!224646 () SeekEntryResult!3897)

(declare-datatypes ((array!32094 0))(
  ( (array!32095 (arr!15430 (Array (_ BitVec 32) (_ BitVec 64))) (size!15794 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32094)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496222 (and (bvslt (x!46829 lt!224646) #b01111111111111111111111111111110) (or (= (select (arr!15430 a!3235) (index!17769 lt!224646)) (select (arr!15430 a!3235) j!176)) (= (select (arr!15430 a!3235) (index!17769 lt!224646)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15430 a!3235) (index!17769 lt!224646)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496223 () Bool)

(declare-fun res!298613 () Bool)

(declare-fun e!291025 () Bool)

(assert (=> b!496223 (=> (not res!298613) (not e!291025))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496223 (= res!298613 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!291023 () Bool)

(declare-fun b!496224 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32094 (_ BitVec 32)) SeekEntryResult!3897)

(assert (=> b!496224 (= e!291023 (= (seekEntryOrOpen!0 (select (arr!15430 a!3235) j!176) a!3235 mask!3524) (Found!3897 j!176)))))

(declare-fun b!496225 () Bool)

(declare-fun res!298614 () Bool)

(assert (=> b!496225 (=> (not res!298614) (not e!291025))))

(declare-fun arrayContainsKey!0 (array!32094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496225 (= res!298614 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!298611 () Bool)

(assert (=> start!45206 (=> (not res!298611) (not e!291025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45206 (= res!298611 (validMask!0 mask!3524))))

(assert (=> start!45206 e!291025))

(assert (=> start!45206 true))

(declare-fun array_inv!11226 (array!32094) Bool)

(assert (=> start!45206 (array_inv!11226 a!3235)))

(declare-fun b!496226 () Bool)

(declare-fun res!298617 () Bool)

(assert (=> b!496226 (=> (not res!298617) (not e!291025))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496226 (= res!298617 (and (= (size!15794 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15794 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15794 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496227 () Bool)

(declare-fun res!298616 () Bool)

(declare-fun e!291026 () Bool)

(assert (=> b!496227 (=> (not res!298616) (not e!291026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32094 (_ BitVec 32)) Bool)

(assert (=> b!496227 (= res!298616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496228 () Bool)

(assert (=> b!496228 (= e!291026 (not e!291027))))

(declare-fun res!298618 () Bool)

(assert (=> b!496228 (=> res!298618 e!291027)))

(declare-fun lt!224645 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32094 (_ BitVec 32)) SeekEntryResult!3897)

(assert (=> b!496228 (= res!298618 (= lt!224646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224645 (select (store (arr!15430 a!3235) i!1204 k0!2280) j!176) (array!32095 (store (arr!15430 a!3235) i!1204 k0!2280) (size!15794 a!3235)) mask!3524)))))

(declare-fun lt!224643 () (_ BitVec 32))

(assert (=> b!496228 (= lt!224646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224643 (select (arr!15430 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496228 (= lt!224645 (toIndex!0 (select (store (arr!15430 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496228 (= lt!224643 (toIndex!0 (select (arr!15430 a!3235) j!176) mask!3524))))

(assert (=> b!496228 e!291023))

(declare-fun res!298619 () Bool)

(assert (=> b!496228 (=> (not res!298619) (not e!291023))))

(assert (=> b!496228 (= res!298619 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14740 0))(
  ( (Unit!14741) )
))
(declare-fun lt!224644 () Unit!14740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14740)

(assert (=> b!496228 (= lt!224644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496229 () Bool)

(assert (=> b!496229 (= e!291025 e!291026)))

(declare-fun res!298609 () Bool)

(assert (=> b!496229 (=> (not res!298609) (not e!291026))))

(declare-fun lt!224647 () SeekEntryResult!3897)

(assert (=> b!496229 (= res!298609 (or (= lt!224647 (MissingZero!3897 i!1204)) (= lt!224647 (MissingVacant!3897 i!1204))))))

(assert (=> b!496229 (= lt!224647 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496230 () Bool)

(declare-fun res!298612 () Bool)

(assert (=> b!496230 (=> (not res!298612) (not e!291025))))

(assert (=> b!496230 (= res!298612 (validKeyInArray!0 (select (arr!15430 a!3235) j!176)))))

(declare-fun b!496231 () Bool)

(declare-fun res!298610 () Bool)

(assert (=> b!496231 (=> (not res!298610) (not e!291026))))

(declare-datatypes ((List!9588 0))(
  ( (Nil!9585) (Cons!9584 (h!10455 (_ BitVec 64)) (t!15816 List!9588)) )
))
(declare-fun arrayNoDuplicates!0 (array!32094 (_ BitVec 32) List!9588) Bool)

(assert (=> b!496231 (= res!298610 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9585))))

(declare-fun b!496232 () Bool)

(declare-fun res!298615 () Bool)

(assert (=> b!496232 (=> res!298615 e!291027)))

(get-info :version)

(assert (=> b!496232 (= res!298615 (or (undefined!4709 lt!224646) (not ((_ is Intermediate!3897) lt!224646))))))

(assert (= (and start!45206 res!298611) b!496226))

(assert (= (and b!496226 res!298617) b!496230))

(assert (= (and b!496230 res!298612) b!496223))

(assert (= (and b!496223 res!298613) b!496225))

(assert (= (and b!496225 res!298614) b!496229))

(assert (= (and b!496229 res!298609) b!496227))

(assert (= (and b!496227 res!298616) b!496231))

(assert (= (and b!496231 res!298610) b!496228))

(assert (= (and b!496228 res!298619) b!496224))

(assert (= (and b!496228 (not res!298618)) b!496232))

(assert (= (and b!496232 (not res!298615)) b!496222))

(declare-fun m!477425 () Bool)

(assert (=> b!496227 m!477425))

(declare-fun m!477427 () Bool)

(assert (=> b!496222 m!477427))

(declare-fun m!477429 () Bool)

(assert (=> b!496222 m!477429))

(assert (=> b!496224 m!477429))

(assert (=> b!496224 m!477429))

(declare-fun m!477431 () Bool)

(assert (=> b!496224 m!477431))

(declare-fun m!477433 () Bool)

(assert (=> b!496228 m!477433))

(declare-fun m!477435 () Bool)

(assert (=> b!496228 m!477435))

(declare-fun m!477437 () Bool)

(assert (=> b!496228 m!477437))

(assert (=> b!496228 m!477429))

(declare-fun m!477439 () Bool)

(assert (=> b!496228 m!477439))

(assert (=> b!496228 m!477429))

(declare-fun m!477441 () Bool)

(assert (=> b!496228 m!477441))

(assert (=> b!496228 m!477429))

(declare-fun m!477443 () Bool)

(assert (=> b!496228 m!477443))

(assert (=> b!496228 m!477437))

(declare-fun m!477445 () Bool)

(assert (=> b!496228 m!477445))

(assert (=> b!496228 m!477437))

(declare-fun m!477447 () Bool)

(assert (=> b!496228 m!477447))

(declare-fun m!477449 () Bool)

(assert (=> b!496223 m!477449))

(declare-fun m!477451 () Bool)

(assert (=> b!496225 m!477451))

(declare-fun m!477453 () Bool)

(assert (=> b!496229 m!477453))

(declare-fun m!477455 () Bool)

(assert (=> b!496231 m!477455))

(declare-fun m!477457 () Bool)

(assert (=> start!45206 m!477457))

(declare-fun m!477459 () Bool)

(assert (=> start!45206 m!477459))

(assert (=> b!496230 m!477429))

(assert (=> b!496230 m!477429))

(declare-fun m!477461 () Bool)

(assert (=> b!496230 m!477461))

(check-sat (not b!496229) (not b!496228) (not b!496231) (not b!496223) (not b!496230) (not start!45206) (not b!496224) (not b!496227) (not b!496225))
(check-sat)
