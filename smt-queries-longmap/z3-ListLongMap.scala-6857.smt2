; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86572 () Bool)

(assert start!86572)

(declare-fun b!1000835 () Bool)

(declare-fun res!669747 () Bool)

(declare-fun e!564314 () Bool)

(assert (=> b!1000835 (=> (not res!669747) (not e!564314))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000835 (= res!669747 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000837 () Bool)

(declare-fun e!564313 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000837 (= e!564313 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1000838 () Bool)

(declare-fun res!669749 () Bool)

(assert (=> b!1000838 (=> (not res!669749) (not e!564314))))

(declare-datatypes ((array!63243 0))(
  ( (array!63244 (arr!30442 (Array (_ BitVec 32) (_ BitVec 64))) (size!30945 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63243)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1000838 (= res!669749 (validKeyInArray!0 (select (arr!30442 a!3219) j!170)))))

(declare-fun b!1000839 () Bool)

(declare-fun e!564312 () Bool)

(assert (=> b!1000839 (= e!564314 e!564312)))

(declare-fun res!669758 () Bool)

(assert (=> b!1000839 (=> (not res!669758) (not e!564312))))

(declare-datatypes ((SeekEntryResult!9310 0))(
  ( (MissingZero!9310 (index!39611 (_ BitVec 32))) (Found!9310 (index!39612 (_ BitVec 32))) (Intermediate!9310 (undefined!10122 Bool) (index!39613 (_ BitVec 32)) (x!87200 (_ BitVec 32))) (Undefined!9310) (MissingVacant!9310 (index!39614 (_ BitVec 32))) )
))
(declare-fun lt!442517 () SeekEntryResult!9310)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000839 (= res!669758 (or (= lt!442517 (MissingVacant!9310 i!1194)) (= lt!442517 (MissingZero!9310 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63243 (_ BitVec 32)) SeekEntryResult!9310)

(assert (=> b!1000839 (= lt!442517 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000840 () Bool)

(assert (=> b!1000840 (= e!564312 e!564313)))

(declare-fun res!669757 () Bool)

(assert (=> b!1000840 (=> (not res!669757) (not e!564313))))

(declare-fun lt!442516 () SeekEntryResult!9310)

(declare-fun lt!442515 () SeekEntryResult!9310)

(assert (=> b!1000840 (= res!669757 (= lt!442516 lt!442515))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000840 (= lt!442515 (Intermediate!9310 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63243 (_ BitVec 32)) SeekEntryResult!9310)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000840 (= lt!442516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30442 a!3219) j!170) mask!3464) (select (arr!30442 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000841 () Bool)

(declare-fun res!669756 () Bool)

(assert (=> b!1000841 (=> (not res!669756) (not e!564314))))

(assert (=> b!1000841 (= res!669756 (and (= (size!30945 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30945 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30945 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000842 () Bool)

(declare-fun res!669755 () Bool)

(assert (=> b!1000842 (=> (not res!669755) (not e!564314))))

(declare-fun arrayContainsKey!0 (array!63243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000842 (= res!669755 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000843 () Bool)

(declare-fun res!669751 () Bool)

(assert (=> b!1000843 (=> (not res!669751) (not e!564313))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000843 (= res!669751 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30442 a!3219) j!170) a!3219 mask!3464) lt!442515))))

(declare-fun b!1000844 () Bool)

(declare-fun res!669748 () Bool)

(assert (=> b!1000844 (=> (not res!669748) (not e!564312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63243 (_ BitVec 32)) Bool)

(assert (=> b!1000844 (= res!669748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000845 () Bool)

(declare-fun res!669752 () Bool)

(assert (=> b!1000845 (=> (not res!669752) (not e!564313))))

(assert (=> b!1000845 (= res!669752 (not (= lt!442516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30442 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30442 a!3219) i!1194 k0!2224) j!170) (array!63244 (store (arr!30442 a!3219) i!1194 k0!2224) (size!30945 a!3219)) mask!3464))))))

(declare-fun b!1000846 () Bool)

(declare-fun res!669753 () Bool)

(assert (=> b!1000846 (=> (not res!669753) (not e!564312))))

(declare-datatypes ((List!21089 0))(
  ( (Nil!21086) (Cons!21085 (h!22268 (_ BitVec 64)) (t!30082 List!21089)) )
))
(declare-fun arrayNoDuplicates!0 (array!63243 (_ BitVec 32) List!21089) Bool)

(assert (=> b!1000846 (= res!669753 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21086))))

(declare-fun b!1000836 () Bool)

(declare-fun res!669750 () Bool)

(assert (=> b!1000836 (=> (not res!669750) (not e!564312))))

(assert (=> b!1000836 (= res!669750 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30945 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30945 a!3219))))))

(declare-fun res!669754 () Bool)

(assert (=> start!86572 (=> (not res!669754) (not e!564314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86572 (= res!669754 (validMask!0 mask!3464))))

(assert (=> start!86572 e!564314))

(declare-fun array_inv!23578 (array!63243) Bool)

(assert (=> start!86572 (array_inv!23578 a!3219)))

(assert (=> start!86572 true))

(assert (= (and start!86572 res!669754) b!1000841))

(assert (= (and b!1000841 res!669756) b!1000838))

(assert (= (and b!1000838 res!669749) b!1000835))

(assert (= (and b!1000835 res!669747) b!1000842))

(assert (= (and b!1000842 res!669755) b!1000839))

(assert (= (and b!1000839 res!669758) b!1000844))

(assert (= (and b!1000844 res!669748) b!1000846))

(assert (= (and b!1000846 res!669753) b!1000836))

(assert (= (and b!1000836 res!669750) b!1000840))

(assert (= (and b!1000840 res!669757) b!1000843))

(assert (= (and b!1000843 res!669751) b!1000845))

(assert (= (and b!1000845 res!669752) b!1000837))

(declare-fun m!927449 () Bool)

(assert (=> b!1000839 m!927449))

(declare-fun m!927451 () Bool)

(assert (=> start!86572 m!927451))

(declare-fun m!927453 () Bool)

(assert (=> start!86572 m!927453))

(declare-fun m!927455 () Bool)

(assert (=> b!1000845 m!927455))

(declare-fun m!927457 () Bool)

(assert (=> b!1000845 m!927457))

(assert (=> b!1000845 m!927457))

(declare-fun m!927459 () Bool)

(assert (=> b!1000845 m!927459))

(assert (=> b!1000845 m!927459))

(assert (=> b!1000845 m!927457))

(declare-fun m!927461 () Bool)

(assert (=> b!1000845 m!927461))

(declare-fun m!927463 () Bool)

(assert (=> b!1000846 m!927463))

(declare-fun m!927465 () Bool)

(assert (=> b!1000840 m!927465))

(assert (=> b!1000840 m!927465))

(declare-fun m!927467 () Bool)

(assert (=> b!1000840 m!927467))

(assert (=> b!1000840 m!927467))

(assert (=> b!1000840 m!927465))

(declare-fun m!927469 () Bool)

(assert (=> b!1000840 m!927469))

(declare-fun m!927471 () Bool)

(assert (=> b!1000835 m!927471))

(assert (=> b!1000838 m!927465))

(assert (=> b!1000838 m!927465))

(declare-fun m!927473 () Bool)

(assert (=> b!1000838 m!927473))

(declare-fun m!927475 () Bool)

(assert (=> b!1000844 m!927475))

(declare-fun m!927477 () Bool)

(assert (=> b!1000842 m!927477))

(assert (=> b!1000843 m!927465))

(assert (=> b!1000843 m!927465))

(declare-fun m!927479 () Bool)

(assert (=> b!1000843 m!927479))

(check-sat (not b!1000838) (not b!1000845) (not b!1000839) (not b!1000840) (not b!1000843) (not b!1000844) (not start!86572) (not b!1000846) (not b!1000835) (not b!1000842))
(check-sat)
