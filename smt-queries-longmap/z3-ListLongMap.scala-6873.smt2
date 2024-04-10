; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86494 () Bool)

(assert start!86494)

(declare-fun b!1001805 () Bool)

(declare-fun e!564458 () Bool)

(declare-fun e!564459 () Bool)

(assert (=> b!1001805 (= e!564458 e!564459)))

(declare-fun res!671284 () Bool)

(assert (=> b!1001805 (=> (not res!671284) (not e!564459))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9405 0))(
  ( (MissingZero!9405 (index!39991 (_ BitVec 32))) (Found!9405 (index!39992 (_ BitVec 32))) (Intermediate!9405 (undefined!10217 Bool) (index!39993 (_ BitVec 32)) (x!87409 (_ BitVec 32))) (Undefined!9405) (MissingVacant!9405 (index!39994 (_ BitVec 32))) )
))
(declare-fun lt!442864 () SeekEntryResult!9405)

(declare-datatypes ((array!63295 0))(
  ( (array!63296 (arr!30473 (Array (_ BitVec 32) (_ BitVec 64))) (size!30975 (_ BitVec 32))) )
))
(declare-fun lt!442862 () array!63295)

(declare-fun lt!442865 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63295 (_ BitVec 32)) SeekEntryResult!9405)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001805 (= res!671284 (not (= lt!442864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442865 mask!3464) lt!442865 lt!442862 mask!3464))))))

(declare-fun a!3219 () array!63295)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001805 (= lt!442865 (select (store (arr!30473 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001805 (= lt!442862 (array!63296 (store (arr!30473 a!3219) i!1194 k0!2224) (size!30975 a!3219)))))

(declare-fun b!1001806 () Bool)

(declare-fun res!671297 () Bool)

(declare-fun e!564456 () Bool)

(assert (=> b!1001806 (=> (not res!671297) (not e!564456))))

(declare-datatypes ((List!21149 0))(
  ( (Nil!21146) (Cons!21145 (h!22322 (_ BitVec 64)) (t!30150 List!21149)) )
))
(declare-fun arrayNoDuplicates!0 (array!63295 (_ BitVec 32) List!21149) Bool)

(assert (=> b!1001806 (= res!671297 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21146))))

(declare-fun b!1001807 () Bool)

(declare-fun e!564457 () Bool)

(assert (=> b!1001807 (= e!564457 e!564456)))

(declare-fun res!671296 () Bool)

(assert (=> b!1001807 (=> (not res!671296) (not e!564456))))

(declare-fun lt!442863 () SeekEntryResult!9405)

(assert (=> b!1001807 (= res!671296 (or (= lt!442863 (MissingVacant!9405 i!1194)) (= lt!442863 (MissingZero!9405 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63295 (_ BitVec 32)) SeekEntryResult!9405)

(assert (=> b!1001807 (= lt!442863 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001808 () Bool)

(declare-fun e!564455 () Bool)

(assert (=> b!1001808 (= e!564459 e!564455)))

(declare-fun res!671298 () Bool)

(assert (=> b!1001808 (=> (not res!671298) (not e!564455))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!442860 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001808 (= res!671298 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442860 #b00000000000000000000000000000000) (bvslt lt!442860 (size!30975 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001808 (= lt!442860 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!671294 () Bool)

(assert (=> start!86494 (=> (not res!671294) (not e!564457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86494 (= res!671294 (validMask!0 mask!3464))))

(assert (=> start!86494 e!564457))

(declare-fun array_inv!23597 (array!63295) Bool)

(assert (=> start!86494 (array_inv!23597 a!3219)))

(assert (=> start!86494 true))

(declare-fun b!1001809 () Bool)

(declare-fun e!564460 () Bool)

(assert (=> b!1001809 (= e!564460 e!564458)))

(declare-fun res!671289 () Bool)

(assert (=> b!1001809 (=> (not res!671289) (not e!564458))))

(declare-fun lt!442861 () SeekEntryResult!9405)

(declare-fun lt!442859 () SeekEntryResult!9405)

(assert (=> b!1001809 (= res!671289 (= lt!442861 lt!442859))))

(assert (=> b!1001809 (= lt!442861 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30473 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001810 () Bool)

(declare-fun res!671295 () Bool)

(assert (=> b!1001810 (=> (not res!671295) (not e!564457))))

(declare-fun arrayContainsKey!0 (array!63295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001810 (= res!671295 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001811 () Bool)

(declare-fun res!671287 () Bool)

(assert (=> b!1001811 (=> (not res!671287) (not e!564459))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001811 (= res!671287 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001812 () Bool)

(assert (=> b!1001812 (= e!564456 e!564460)))

(declare-fun res!671291 () Bool)

(assert (=> b!1001812 (=> (not res!671291) (not e!564460))))

(assert (=> b!1001812 (= res!671291 (= lt!442864 lt!442859))))

(assert (=> b!1001812 (= lt!442859 (Intermediate!9405 false resIndex!38 resX!38))))

(assert (=> b!1001812 (= lt!442864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30473 a!3219) j!170) mask!3464) (select (arr!30473 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001813 () Bool)

(assert (=> b!1001813 (= e!564455 false)))

(declare-fun lt!442858 () SeekEntryResult!9405)

(assert (=> b!1001813 (= lt!442858 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442860 lt!442865 lt!442862 mask!3464))))

(declare-fun b!1001814 () Bool)

(declare-fun res!671285 () Bool)

(assert (=> b!1001814 (=> (not res!671285) (not e!564456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63295 (_ BitVec 32)) Bool)

(assert (=> b!1001814 (= res!671285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001815 () Bool)

(declare-fun res!671288 () Bool)

(assert (=> b!1001815 (=> (not res!671288) (not e!564459))))

(assert (=> b!1001815 (= res!671288 (not (= lt!442861 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442865 lt!442862 mask!3464))))))

(declare-fun b!1001816 () Bool)

(declare-fun res!671286 () Bool)

(assert (=> b!1001816 (=> (not res!671286) (not e!564457))))

(assert (=> b!1001816 (= res!671286 (and (= (size!30975 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30975 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30975 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001817 () Bool)

(declare-fun res!671292 () Bool)

(assert (=> b!1001817 (=> (not res!671292) (not e!564456))))

(assert (=> b!1001817 (= res!671292 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30975 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30975 a!3219))))))

(declare-fun b!1001818 () Bool)

(declare-fun res!671283 () Bool)

(assert (=> b!1001818 (=> (not res!671283) (not e!564457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001818 (= res!671283 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001819 () Bool)

(declare-fun res!671290 () Bool)

(assert (=> b!1001819 (=> (not res!671290) (not e!564457))))

(assert (=> b!1001819 (= res!671290 (validKeyInArray!0 (select (arr!30473 a!3219) j!170)))))

(declare-fun b!1001820 () Bool)

(declare-fun res!671293 () Bool)

(assert (=> b!1001820 (=> (not res!671293) (not e!564455))))

(assert (=> b!1001820 (= res!671293 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442860 (select (arr!30473 a!3219) j!170) a!3219 mask!3464) lt!442859))))

(assert (= (and start!86494 res!671294) b!1001816))

(assert (= (and b!1001816 res!671286) b!1001819))

(assert (= (and b!1001819 res!671290) b!1001818))

(assert (= (and b!1001818 res!671283) b!1001810))

(assert (= (and b!1001810 res!671295) b!1001807))

(assert (= (and b!1001807 res!671296) b!1001814))

(assert (= (and b!1001814 res!671285) b!1001806))

(assert (= (and b!1001806 res!671297) b!1001817))

(assert (= (and b!1001817 res!671292) b!1001812))

(assert (= (and b!1001812 res!671291) b!1001809))

(assert (= (and b!1001809 res!671289) b!1001805))

(assert (= (and b!1001805 res!671284) b!1001815))

(assert (= (and b!1001815 res!671288) b!1001811))

(assert (= (and b!1001811 res!671287) b!1001808))

(assert (= (and b!1001808 res!671298) b!1001820))

(assert (= (and b!1001820 res!671293) b!1001813))

(declare-fun m!927789 () Bool)

(assert (=> b!1001813 m!927789))

(declare-fun m!927791 () Bool)

(assert (=> b!1001820 m!927791))

(assert (=> b!1001820 m!927791))

(declare-fun m!927793 () Bool)

(assert (=> b!1001820 m!927793))

(declare-fun m!927795 () Bool)

(assert (=> b!1001805 m!927795))

(assert (=> b!1001805 m!927795))

(declare-fun m!927797 () Bool)

(assert (=> b!1001805 m!927797))

(declare-fun m!927799 () Bool)

(assert (=> b!1001805 m!927799))

(declare-fun m!927801 () Bool)

(assert (=> b!1001805 m!927801))

(declare-fun m!927803 () Bool)

(assert (=> b!1001815 m!927803))

(declare-fun m!927805 () Bool)

(assert (=> b!1001814 m!927805))

(declare-fun m!927807 () Bool)

(assert (=> b!1001808 m!927807))

(declare-fun m!927809 () Bool)

(assert (=> b!1001810 m!927809))

(declare-fun m!927811 () Bool)

(assert (=> b!1001807 m!927811))

(declare-fun m!927813 () Bool)

(assert (=> b!1001818 m!927813))

(declare-fun m!927815 () Bool)

(assert (=> b!1001806 m!927815))

(declare-fun m!927817 () Bool)

(assert (=> start!86494 m!927817))

(declare-fun m!927819 () Bool)

(assert (=> start!86494 m!927819))

(assert (=> b!1001809 m!927791))

(assert (=> b!1001809 m!927791))

(declare-fun m!927821 () Bool)

(assert (=> b!1001809 m!927821))

(assert (=> b!1001819 m!927791))

(assert (=> b!1001819 m!927791))

(declare-fun m!927823 () Bool)

(assert (=> b!1001819 m!927823))

(assert (=> b!1001812 m!927791))

(assert (=> b!1001812 m!927791))

(declare-fun m!927825 () Bool)

(assert (=> b!1001812 m!927825))

(assert (=> b!1001812 m!927825))

(assert (=> b!1001812 m!927791))

(declare-fun m!927827 () Bool)

(assert (=> b!1001812 m!927827))

(check-sat (not b!1001814) (not b!1001806) (not b!1001812) (not b!1001820) (not b!1001810) (not b!1001815) (not b!1001819) (not b!1001808) (not b!1001809) (not b!1001813) (not start!86494) (not b!1001805) (not b!1001807) (not b!1001818))
(check-sat)
