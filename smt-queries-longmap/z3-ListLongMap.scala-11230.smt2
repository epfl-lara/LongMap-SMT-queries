; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131430 () Bool)

(assert start!131430)

(declare-fun b!1539568 () Bool)

(declare-fun res!1055078 () Bool)

(declare-fun e!857010 () Bool)

(assert (=> b!1539568 (=> (not res!1055078) (not e!857010))))

(declare-datatypes ((array!102232 0))(
  ( (array!102233 (arr!49324 (Array (_ BitVec 32) (_ BitVec 64))) (size!49875 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102232)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539568 (= res!1055078 (validKeyInArray!0 (select (arr!49324 a!2792) j!64)))))

(declare-fun b!1539569 () Bool)

(declare-fun res!1055085 () Bool)

(assert (=> b!1539569 (=> (not res!1055085) (not e!857010))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539569 (= res!1055085 (validKeyInArray!0 (select (arr!49324 a!2792) i!951)))))

(declare-fun b!1539571 () Bool)

(declare-fun res!1055080 () Bool)

(assert (=> b!1539571 (=> (not res!1055080) (not e!857010))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102232 (_ BitVec 32)) Bool)

(assert (=> b!1539571 (= res!1055080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539572 () Bool)

(declare-fun e!857008 () Bool)

(declare-fun e!857007 () Bool)

(assert (=> b!1539572 (= e!857008 e!857007)))

(declare-fun res!1055081 () Bool)

(assert (=> b!1539572 (=> (not res!1055081) (not e!857007))))

(declare-datatypes ((SeekEntryResult!13351 0))(
  ( (MissingZero!13351 (index!55799 (_ BitVec 32))) (Found!13351 (index!55800 (_ BitVec 32))) (Intermediate!13351 (undefined!14163 Bool) (index!55801 (_ BitVec 32)) (x!137739 (_ BitVec 32))) (Undefined!13351) (MissingVacant!13351 (index!55802 (_ BitVec 32))) )
))
(declare-fun lt!665514 () SeekEntryResult!13351)

(declare-fun lt!665517 () SeekEntryResult!13351)

(assert (=> b!1539572 (= res!1055081 (= lt!665514 lt!665517))))

(declare-fun lt!665515 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102232 (_ BitVec 32)) SeekEntryResult!13351)

(assert (=> b!1539572 (= lt!665514 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665515 vacantIndex!5 (select (arr!49324 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539573 () Bool)

(declare-fun e!857011 () Bool)

(assert (=> b!1539573 (= e!857011 e!857008)))

(declare-fun res!1055079 () Bool)

(assert (=> b!1539573 (=> (not res!1055079) (not e!857008))))

(assert (=> b!1539573 (= res!1055079 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665515 #b00000000000000000000000000000000) (bvslt lt!665515 (size!49875 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539573 (= lt!665515 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1539574 () Bool)

(assert (=> b!1539574 (= e!857010 e!857011)))

(declare-fun res!1055083 () Bool)

(assert (=> b!1539574 (=> (not res!1055083) (not e!857011))))

(assert (=> b!1539574 (= res!1055083 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49324 a!2792) j!64) a!2792 mask!2480) lt!665517))))

(assert (=> b!1539574 (= lt!665517 (Found!13351 j!64))))

(declare-fun b!1539575 () Bool)

(declare-fun res!1055086 () Bool)

(assert (=> b!1539575 (=> (not res!1055086) (not e!857010))))

(assert (=> b!1539575 (= res!1055086 (and (= (size!49875 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49875 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49875 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539570 () Bool)

(declare-fun res!1055082 () Bool)

(assert (=> b!1539570 (=> (not res!1055082) (not e!857010))))

(declare-datatypes ((List!35785 0))(
  ( (Nil!35782) (Cons!35781 (h!37244 (_ BitVec 64)) (t!50471 List!35785)) )
))
(declare-fun arrayNoDuplicates!0 (array!102232 (_ BitVec 32) List!35785) Bool)

(assert (=> b!1539570 (= res!1055082 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35782))))

(declare-fun res!1055084 () Bool)

(assert (=> start!131430 (=> (not res!1055084) (not e!857010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131430 (= res!1055084 (validMask!0 mask!2480))))

(assert (=> start!131430 e!857010))

(assert (=> start!131430 true))

(declare-fun array_inv!38605 (array!102232) Bool)

(assert (=> start!131430 (array_inv!38605 a!2792)))

(declare-fun b!1539576 () Bool)

(declare-fun res!1055087 () Bool)

(assert (=> b!1539576 (=> (not res!1055087) (not e!857010))))

(assert (=> b!1539576 (= res!1055087 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49875 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49875 a!2792)) (= (select (arr!49324 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539577 () Bool)

(declare-fun res!1055088 () Bool)

(assert (=> b!1539577 (=> (not res!1055088) (not e!857011))))

(assert (=> b!1539577 (= res!1055088 (not (= (select (arr!49324 a!2792) index!463) (select (arr!49324 a!2792) j!64))))))

(declare-fun b!1539578 () Bool)

(assert (=> b!1539578 (= e!857007 (not true))))

(assert (=> b!1539578 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665515 vacantIndex!5 (select (store (arr!49324 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102233 (store (arr!49324 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49875 a!2792)) mask!2480) lt!665514)))

(declare-datatypes ((Unit!51311 0))(
  ( (Unit!51312) )
))
(declare-fun lt!665516 () Unit!51311)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51311)

(assert (=> b!1539578 (= lt!665516 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665515 vacantIndex!5 mask!2480))))

(assert (= (and start!131430 res!1055084) b!1539575))

(assert (= (and b!1539575 res!1055086) b!1539569))

(assert (= (and b!1539569 res!1055085) b!1539568))

(assert (= (and b!1539568 res!1055078) b!1539571))

(assert (= (and b!1539571 res!1055080) b!1539570))

(assert (= (and b!1539570 res!1055082) b!1539576))

(assert (= (and b!1539576 res!1055087) b!1539574))

(assert (= (and b!1539574 res!1055083) b!1539577))

(assert (= (and b!1539577 res!1055088) b!1539573))

(assert (= (and b!1539573 res!1055079) b!1539572))

(assert (= (and b!1539572 res!1055081) b!1539578))

(declare-fun m!1421863 () Bool)

(assert (=> b!1539577 m!1421863))

(declare-fun m!1421865 () Bool)

(assert (=> b!1539577 m!1421865))

(declare-fun m!1421867 () Bool)

(assert (=> b!1539571 m!1421867))

(declare-fun m!1421869 () Bool)

(assert (=> b!1539569 m!1421869))

(assert (=> b!1539569 m!1421869))

(declare-fun m!1421871 () Bool)

(assert (=> b!1539569 m!1421871))

(assert (=> b!1539568 m!1421865))

(assert (=> b!1539568 m!1421865))

(declare-fun m!1421873 () Bool)

(assert (=> b!1539568 m!1421873))

(assert (=> b!1539574 m!1421865))

(assert (=> b!1539574 m!1421865))

(declare-fun m!1421875 () Bool)

(assert (=> b!1539574 m!1421875))

(declare-fun m!1421877 () Bool)

(assert (=> start!131430 m!1421877))

(declare-fun m!1421879 () Bool)

(assert (=> start!131430 m!1421879))

(assert (=> b!1539572 m!1421865))

(assert (=> b!1539572 m!1421865))

(declare-fun m!1421881 () Bool)

(assert (=> b!1539572 m!1421881))

(declare-fun m!1421883 () Bool)

(assert (=> b!1539573 m!1421883))

(declare-fun m!1421885 () Bool)

(assert (=> b!1539576 m!1421885))

(declare-fun m!1421887 () Bool)

(assert (=> b!1539578 m!1421887))

(declare-fun m!1421889 () Bool)

(assert (=> b!1539578 m!1421889))

(assert (=> b!1539578 m!1421889))

(declare-fun m!1421891 () Bool)

(assert (=> b!1539578 m!1421891))

(declare-fun m!1421893 () Bool)

(assert (=> b!1539578 m!1421893))

(declare-fun m!1421895 () Bool)

(assert (=> b!1539570 m!1421895))

(check-sat (not b!1539572) (not b!1539578) (not b!1539573) (not b!1539574) (not b!1539568) (not b!1539570) (not start!131430) (not b!1539569) (not b!1539571))
(check-sat)
