; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87016 () Bool)

(assert start!87016)

(declare-fun b!1007466 () Bool)

(declare-fun res!675794 () Bool)

(declare-fun e!567221 () Bool)

(assert (=> b!1007466 (=> (not res!675794) (not e!567221))))

(declare-datatypes ((array!63534 0))(
  ( (array!63535 (arr!30583 (Array (_ BitVec 32) (_ BitVec 64))) (size!31086 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63534)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007466 (= res!675794 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007467 () Bool)

(declare-fun res!675798 () Bool)

(declare-fun e!567222 () Bool)

(assert (=> b!1007467 (=> (not res!675798) (not e!567222))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9451 0))(
  ( (MissingZero!9451 (index!40175 (_ BitVec 32))) (Found!9451 (index!40176 (_ BitVec 32))) (Intermediate!9451 (undefined!10263 Bool) (index!40177 (_ BitVec 32)) (x!87735 (_ BitVec 32))) (Undefined!9451) (MissingVacant!9451 (index!40178 (_ BitVec 32))) )
))
(declare-fun lt!445207 () SeekEntryResult!9451)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63534 (_ BitVec 32)) SeekEntryResult!9451)

(assert (=> b!1007467 (= res!675798 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30583 a!3219) j!170) a!3219 mask!3464) lt!445207))))

(declare-fun b!1007468 () Bool)

(declare-fun e!567219 () Bool)

(assert (=> b!1007468 (= e!567221 e!567219)))

(declare-fun res!675801 () Bool)

(assert (=> b!1007468 (=> (not res!675801) (not e!567219))))

(declare-fun lt!445208 () SeekEntryResult!9451)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007468 (= res!675801 (or (= lt!445208 (MissingVacant!9451 i!1194)) (= lt!445208 (MissingZero!9451 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63534 (_ BitVec 32)) SeekEntryResult!9451)

(assert (=> b!1007468 (= lt!445208 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007469 () Bool)

(declare-fun res!675802 () Bool)

(assert (=> b!1007469 (=> (not res!675802) (not e!567221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007469 (= res!675802 (validKeyInArray!0 (select (arr!30583 a!3219) j!170)))))

(declare-fun b!1007470 () Bool)

(declare-fun res!675793 () Bool)

(assert (=> b!1007470 (=> (not res!675793) (not e!567219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63534 (_ BitVec 32)) Bool)

(assert (=> b!1007470 (= res!675793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007471 () Bool)

(assert (=> b!1007471 (= e!567219 e!567222)))

(declare-fun res!675795 () Bool)

(assert (=> b!1007471 (=> (not res!675795) (not e!567222))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007471 (= res!675795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30583 a!3219) j!170) mask!3464) (select (arr!30583 a!3219) j!170) a!3219 mask!3464) lt!445207))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007471 (= lt!445207 (Intermediate!9451 false resIndex!38 resX!38))))

(declare-fun b!1007472 () Bool)

(declare-fun res!675799 () Bool)

(assert (=> b!1007472 (=> (not res!675799) (not e!567219))))

(assert (=> b!1007472 (= res!675799 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31086 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31086 a!3219))))))

(declare-fun b!1007473 () Bool)

(declare-fun res!675797 () Bool)

(assert (=> b!1007473 (=> (not res!675797) (not e!567221))))

(assert (=> b!1007473 (= res!675797 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007474 () Bool)

(declare-fun res!675803 () Bool)

(assert (=> b!1007474 (=> (not res!675803) (not e!567221))))

(assert (=> b!1007474 (= res!675803 (and (= (size!31086 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31086 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31086 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!675796 () Bool)

(assert (=> start!87016 (=> (not res!675796) (not e!567221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87016 (= res!675796 (validMask!0 mask!3464))))

(assert (=> start!87016 e!567221))

(declare-fun array_inv!23719 (array!63534) Bool)

(assert (=> start!87016 (array_inv!23719 a!3219)))

(assert (=> start!87016 true))

(declare-fun b!1007475 () Bool)

(declare-fun res!675800 () Bool)

(assert (=> b!1007475 (=> (not res!675800) (not e!567219))))

(declare-datatypes ((List!21230 0))(
  ( (Nil!21227) (Cons!21226 (h!22418 (_ BitVec 64)) (t!30223 List!21230)) )
))
(declare-fun arrayNoDuplicates!0 (array!63534 (_ BitVec 32) List!21230) Bool)

(assert (=> b!1007475 (= res!675800 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21227))))

(declare-fun b!1007476 () Bool)

(assert (=> b!1007476 (= e!567222 false)))

(declare-fun lt!445206 () SeekEntryResult!9451)

(assert (=> b!1007476 (= lt!445206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30583 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30583 a!3219) i!1194 k0!2224) j!170) (array!63535 (store (arr!30583 a!3219) i!1194 k0!2224) (size!31086 a!3219)) mask!3464))))

(assert (= (and start!87016 res!675796) b!1007474))

(assert (= (and b!1007474 res!675803) b!1007469))

(assert (= (and b!1007469 res!675802) b!1007473))

(assert (= (and b!1007473 res!675797) b!1007466))

(assert (= (and b!1007466 res!675794) b!1007468))

(assert (= (and b!1007468 res!675801) b!1007470))

(assert (= (and b!1007470 res!675793) b!1007475))

(assert (= (and b!1007475 res!675800) b!1007472))

(assert (= (and b!1007472 res!675799) b!1007471))

(assert (= (and b!1007471 res!675795) b!1007467))

(assert (= (and b!1007467 res!675798) b!1007476))

(declare-fun m!932849 () Bool)

(assert (=> b!1007467 m!932849))

(assert (=> b!1007467 m!932849))

(declare-fun m!932851 () Bool)

(assert (=> b!1007467 m!932851))

(declare-fun m!932853 () Bool)

(assert (=> b!1007473 m!932853))

(declare-fun m!932855 () Bool)

(assert (=> start!87016 m!932855))

(declare-fun m!932857 () Bool)

(assert (=> start!87016 m!932857))

(declare-fun m!932859 () Bool)

(assert (=> b!1007470 m!932859))

(declare-fun m!932861 () Bool)

(assert (=> b!1007468 m!932861))

(declare-fun m!932863 () Bool)

(assert (=> b!1007476 m!932863))

(declare-fun m!932865 () Bool)

(assert (=> b!1007476 m!932865))

(assert (=> b!1007476 m!932865))

(declare-fun m!932867 () Bool)

(assert (=> b!1007476 m!932867))

(assert (=> b!1007476 m!932867))

(assert (=> b!1007476 m!932865))

(declare-fun m!932869 () Bool)

(assert (=> b!1007476 m!932869))

(assert (=> b!1007471 m!932849))

(assert (=> b!1007471 m!932849))

(declare-fun m!932871 () Bool)

(assert (=> b!1007471 m!932871))

(assert (=> b!1007471 m!932871))

(assert (=> b!1007471 m!932849))

(declare-fun m!932873 () Bool)

(assert (=> b!1007471 m!932873))

(declare-fun m!932875 () Bool)

(assert (=> b!1007475 m!932875))

(assert (=> b!1007469 m!932849))

(assert (=> b!1007469 m!932849))

(declare-fun m!932877 () Bool)

(assert (=> b!1007469 m!932877))

(declare-fun m!932879 () Bool)

(assert (=> b!1007466 m!932879))

(check-sat (not b!1007468) (not start!87016) (not b!1007469) (not b!1007471) (not b!1007470) (not b!1007473) (not b!1007476) (not b!1007467) (not b!1007466) (not b!1007475))
(check-sat)
