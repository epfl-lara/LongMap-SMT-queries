; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44618 () Bool)

(assert start!44618)

(declare-fun b!489435 () Bool)

(declare-fun e!287861 () Bool)

(assert (=> b!489435 (= e!287861 (not true))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31677 0))(
  ( (array!31678 (arr!15226 (Array (_ BitVec 32) (_ BitVec 64))) (size!15590 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31677)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3693 0))(
  ( (MissingZero!3693 (index!16951 (_ BitVec 32))) (Found!3693 (index!16952 (_ BitVec 32))) (Intermediate!3693 (undefined!4505 Bool) (index!16953 (_ BitVec 32)) (x!46063 (_ BitVec 32))) (Undefined!3693) (MissingVacant!3693 (index!16954 (_ BitVec 32))) )
))
(declare-fun lt!220826 () SeekEntryResult!3693)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!220824 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31677 (_ BitVec 32)) SeekEntryResult!3693)

(assert (=> b!489435 (= lt!220826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220824 (select (store (arr!15226 a!3235) i!1204 k0!2280) j!176) (array!31678 (store (arr!15226 a!3235) i!1204 k0!2280) (size!15590 a!3235)) mask!3524))))

(declare-fun lt!220828 () (_ BitVec 32))

(declare-fun lt!220823 () SeekEntryResult!3693)

(assert (=> b!489435 (= lt!220823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220828 (select (arr!15226 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489435 (= lt!220824 (toIndex!0 (select (store (arr!15226 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489435 (= lt!220828 (toIndex!0 (select (arr!15226 a!3235) j!176) mask!3524))))

(declare-fun e!287860 () Bool)

(assert (=> b!489435 e!287860))

(declare-fun res!292373 () Bool)

(assert (=> b!489435 (=> (not res!292373) (not e!287860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31677 (_ BitVec 32)) Bool)

(assert (=> b!489435 (= res!292373 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14332 0))(
  ( (Unit!14333) )
))
(declare-fun lt!220827 () Unit!14332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14332)

(assert (=> b!489435 (= lt!220827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489436 () Bool)

(declare-fun res!292374 () Bool)

(declare-fun e!287862 () Bool)

(assert (=> b!489436 (=> (not res!292374) (not e!287862))))

(assert (=> b!489436 (= res!292374 (and (= (size!15590 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15590 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15590 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489437 () Bool)

(declare-fun res!292378 () Bool)

(assert (=> b!489437 (=> (not res!292378) (not e!287861))))

(declare-datatypes ((List!9384 0))(
  ( (Nil!9381) (Cons!9380 (h!10242 (_ BitVec 64)) (t!15612 List!9384)) )
))
(declare-fun arrayNoDuplicates!0 (array!31677 (_ BitVec 32) List!9384) Bool)

(assert (=> b!489437 (= res!292378 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9381))))

(declare-fun b!489438 () Bool)

(declare-fun res!292376 () Bool)

(assert (=> b!489438 (=> (not res!292376) (not e!287861))))

(assert (=> b!489438 (= res!292376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489439 () Bool)

(assert (=> b!489439 (= e!287862 e!287861)))

(declare-fun res!292377 () Bool)

(assert (=> b!489439 (=> (not res!292377) (not e!287861))))

(declare-fun lt!220825 () SeekEntryResult!3693)

(assert (=> b!489439 (= res!292377 (or (= lt!220825 (MissingZero!3693 i!1204)) (= lt!220825 (MissingVacant!3693 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31677 (_ BitVec 32)) SeekEntryResult!3693)

(assert (=> b!489439 (= lt!220825 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489440 () Bool)

(declare-fun res!292372 () Bool)

(assert (=> b!489440 (=> (not res!292372) (not e!287862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489440 (= res!292372 (validKeyInArray!0 k0!2280))))

(declare-fun b!489441 () Bool)

(declare-fun res!292371 () Bool)

(assert (=> b!489441 (=> (not res!292371) (not e!287862))))

(assert (=> b!489441 (= res!292371 (validKeyInArray!0 (select (arr!15226 a!3235) j!176)))))

(declare-fun res!292379 () Bool)

(assert (=> start!44618 (=> (not res!292379) (not e!287862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44618 (= res!292379 (validMask!0 mask!3524))))

(assert (=> start!44618 e!287862))

(assert (=> start!44618 true))

(declare-fun array_inv!11022 (array!31677) Bool)

(assert (=> start!44618 (array_inv!11022 a!3235)))

(declare-fun b!489442 () Bool)

(assert (=> b!489442 (= e!287860 (= (seekEntryOrOpen!0 (select (arr!15226 a!3235) j!176) a!3235 mask!3524) (Found!3693 j!176)))))

(declare-fun b!489443 () Bool)

(declare-fun res!292375 () Bool)

(assert (=> b!489443 (=> (not res!292375) (not e!287862))))

(declare-fun arrayContainsKey!0 (array!31677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489443 (= res!292375 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44618 res!292379) b!489436))

(assert (= (and b!489436 res!292374) b!489441))

(assert (= (and b!489441 res!292371) b!489440))

(assert (= (and b!489440 res!292372) b!489443))

(assert (= (and b!489443 res!292375) b!489439))

(assert (= (and b!489439 res!292377) b!489438))

(assert (= (and b!489438 res!292376) b!489437))

(assert (= (and b!489437 res!292378) b!489435))

(assert (= (and b!489435 res!292373) b!489442))

(declare-fun m!469209 () Bool)

(assert (=> b!489437 m!469209))

(declare-fun m!469211 () Bool)

(assert (=> b!489441 m!469211))

(assert (=> b!489441 m!469211))

(declare-fun m!469213 () Bool)

(assert (=> b!489441 m!469213))

(declare-fun m!469215 () Bool)

(assert (=> b!489443 m!469215))

(declare-fun m!469217 () Bool)

(assert (=> b!489438 m!469217))

(declare-fun m!469219 () Bool)

(assert (=> start!44618 m!469219))

(declare-fun m!469221 () Bool)

(assert (=> start!44618 m!469221))

(declare-fun m!469223 () Bool)

(assert (=> b!489435 m!469223))

(declare-fun m!469225 () Bool)

(assert (=> b!489435 m!469225))

(declare-fun m!469227 () Bool)

(assert (=> b!489435 m!469227))

(assert (=> b!489435 m!469211))

(declare-fun m!469229 () Bool)

(assert (=> b!489435 m!469229))

(assert (=> b!489435 m!469211))

(declare-fun m!469231 () Bool)

(assert (=> b!489435 m!469231))

(assert (=> b!489435 m!469211))

(declare-fun m!469233 () Bool)

(assert (=> b!489435 m!469233))

(assert (=> b!489435 m!469227))

(declare-fun m!469235 () Bool)

(assert (=> b!489435 m!469235))

(assert (=> b!489435 m!469227))

(declare-fun m!469237 () Bool)

(assert (=> b!489435 m!469237))

(assert (=> b!489442 m!469211))

(assert (=> b!489442 m!469211))

(declare-fun m!469239 () Bool)

(assert (=> b!489442 m!469239))

(declare-fun m!469241 () Bool)

(assert (=> b!489440 m!469241))

(declare-fun m!469243 () Bool)

(assert (=> b!489439 m!469243))

(check-sat (not b!489437) (not start!44618) (not b!489435) (not b!489443) (not b!489441) (not b!489439) (not b!489438) (not b!489442) (not b!489440))
(check-sat)
