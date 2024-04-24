; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120632 () Bool)

(assert start!120632)

(declare-fun b!1403463 () Bool)

(declare-fun res!941295 () Bool)

(declare-fun e!794822 () Bool)

(assert (=> b!1403463 (=> (not res!941295) (not e!794822))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95963 0))(
  ( (array!95964 (arr!46330 (Array (_ BitVec 32) (_ BitVec 64))) (size!46881 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95963)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403463 (= res!941295 (and (= (size!46881 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46881 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46881 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403464 () Bool)

(declare-fun res!941291 () Bool)

(assert (=> b!1403464 (=> (not res!941291) (not e!794822))))

(declare-datatypes ((List!32836 0))(
  ( (Nil!32833) (Cons!32832 (h!34088 (_ BitVec 64)) (t!47522 List!32836)) )
))
(declare-fun arrayNoDuplicates!0 (array!95963 (_ BitVec 32) List!32836) Bool)

(assert (=> b!1403464 (= res!941291 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32833))))

(declare-fun b!1403465 () Bool)

(declare-fun res!941297 () Bool)

(assert (=> b!1403465 (=> (not res!941297) (not e!794822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403465 (= res!941297 (validKeyInArray!0 (select (arr!46330 a!2901) j!112)))))

(declare-fun b!1403466 () Bool)

(declare-fun res!941290 () Bool)

(declare-fun e!794818 () Bool)

(assert (=> b!1403466 (=> res!941290 e!794818)))

(declare-fun lt!618006 () (_ BitVec 64))

(declare-fun lt!618005 () (_ BitVec 32))

(declare-fun lt!618011 () array!95963)

(declare-datatypes ((SeekEntryResult!10550 0))(
  ( (MissingZero!10550 (index!44577 (_ BitVec 32))) (Found!10550 (index!44578 (_ BitVec 32))) (Intermediate!10550 (undefined!11362 Bool) (index!44579 (_ BitVec 32)) (x!126356 (_ BitVec 32))) (Undefined!10550) (MissingVacant!10550 (index!44580 (_ BitVec 32))) )
))
(declare-fun lt!618002 () SeekEntryResult!10550)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95963 (_ BitVec 32)) SeekEntryResult!10550)

(assert (=> b!1403466 (= res!941290 (not (= lt!618002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618005 lt!618006 lt!618011 mask!2840))))))

(declare-fun b!1403467 () Bool)

(declare-fun e!794821 () Bool)

(assert (=> b!1403467 (= e!794822 (not e!794821))))

(declare-fun res!941296 () Bool)

(assert (=> b!1403467 (=> res!941296 e!794821)))

(declare-fun lt!618010 () SeekEntryResult!10550)

(get-info :version)

(assert (=> b!1403467 (= res!941296 (or (not ((_ is Intermediate!10550) lt!618010)) (undefined!11362 lt!618010)))))

(declare-fun lt!618004 () SeekEntryResult!10550)

(assert (=> b!1403467 (= lt!618004 (Found!10550 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95963 (_ BitVec 32)) SeekEntryResult!10550)

(assert (=> b!1403467 (= lt!618004 (seekEntryOrOpen!0 (select (arr!46330 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95963 (_ BitVec 32)) Bool)

(assert (=> b!1403467 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47131 0))(
  ( (Unit!47132) )
))
(declare-fun lt!618008 () Unit!47131)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47131)

(assert (=> b!1403467 (= lt!618008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403467 (= lt!618010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618005 (select (arr!46330 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403467 (= lt!618005 (toIndex!0 (select (arr!46330 a!2901) j!112) mask!2840))))

(declare-fun b!1403468 () Bool)

(declare-fun res!941292 () Bool)

(assert (=> b!1403468 (=> (not res!941292) (not e!794822))))

(assert (=> b!1403468 (= res!941292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!941299 () Bool)

(assert (=> start!120632 (=> (not res!941299) (not e!794822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120632 (= res!941299 (validMask!0 mask!2840))))

(assert (=> start!120632 e!794822))

(assert (=> start!120632 true))

(declare-fun array_inv!35611 (array!95963) Bool)

(assert (=> start!120632 (array_inv!35611 a!2901)))

(declare-fun b!1403469 () Bool)

(assert (=> b!1403469 (= e!794818 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!618009 () SeekEntryResult!10550)

(assert (=> b!1403469 (= lt!618004 lt!618009)))

(declare-fun lt!618007 () Unit!47131)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47131)

(assert (=> b!1403469 (= lt!618007 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618005 (x!126356 lt!618010) (index!44579 lt!618010) (x!126356 lt!618002) (index!44579 lt!618002) mask!2840))))

(declare-fun b!1403470 () Bool)

(declare-fun res!941298 () Bool)

(assert (=> b!1403470 (=> (not res!941298) (not e!794822))))

(assert (=> b!1403470 (= res!941298 (validKeyInArray!0 (select (arr!46330 a!2901) i!1037)))))

(declare-fun b!1403471 () Bool)

(declare-fun e!794819 () Bool)

(assert (=> b!1403471 (= e!794821 e!794819)))

(declare-fun res!941294 () Bool)

(assert (=> b!1403471 (=> res!941294 e!794819)))

(assert (=> b!1403471 (= res!941294 (or (= lt!618010 lt!618002) (not ((_ is Intermediate!10550) lt!618002))))))

(assert (=> b!1403471 (= lt!618002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618006 mask!2840) lt!618006 lt!618011 mask!2840))))

(assert (=> b!1403471 (= lt!618006 (select (store (arr!46330 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403471 (= lt!618011 (array!95964 (store (arr!46330 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46881 a!2901)))))

(declare-fun b!1403472 () Bool)

(assert (=> b!1403472 (= e!794819 e!794818)))

(declare-fun res!941293 () Bool)

(assert (=> b!1403472 (=> res!941293 e!794818)))

(assert (=> b!1403472 (= res!941293 (or (bvslt (x!126356 lt!618010) #b00000000000000000000000000000000) (bvsgt (x!126356 lt!618010) #b01111111111111111111111111111110) (bvslt (x!126356 lt!618002) #b00000000000000000000000000000000) (bvsgt (x!126356 lt!618002) #b01111111111111111111111111111110) (bvslt lt!618005 #b00000000000000000000000000000000) (bvsge lt!618005 (size!46881 a!2901)) (bvslt (index!44579 lt!618010) #b00000000000000000000000000000000) (bvsge (index!44579 lt!618010) (size!46881 a!2901)) (bvslt (index!44579 lt!618002) #b00000000000000000000000000000000) (bvsge (index!44579 lt!618002) (size!46881 a!2901)) (not (= lt!618010 (Intermediate!10550 false (index!44579 lt!618010) (x!126356 lt!618010)))) (not (= lt!618002 (Intermediate!10550 false (index!44579 lt!618002) (x!126356 lt!618002))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95963 (_ BitVec 32)) SeekEntryResult!10550)

(assert (=> b!1403472 (= lt!618009 (seekKeyOrZeroReturnVacant!0 (x!126356 lt!618002) (index!44579 lt!618002) (index!44579 lt!618002) (select (arr!46330 a!2901) j!112) lt!618011 mask!2840))))

(assert (=> b!1403472 (= lt!618009 (seekEntryOrOpen!0 lt!618006 lt!618011 mask!2840))))

(assert (=> b!1403472 (and (not (undefined!11362 lt!618002)) (= (index!44579 lt!618002) i!1037) (bvslt (x!126356 lt!618002) (x!126356 lt!618010)) (= (select (store (arr!46330 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44579 lt!618002)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!618003 () Unit!47131)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47131)

(assert (=> b!1403472 (= lt!618003 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618005 (x!126356 lt!618010) (index!44579 lt!618010) (x!126356 lt!618002) (index!44579 lt!618002) (undefined!11362 lt!618002) mask!2840))))

(assert (= (and start!120632 res!941299) b!1403463))

(assert (= (and b!1403463 res!941295) b!1403470))

(assert (= (and b!1403470 res!941298) b!1403465))

(assert (= (and b!1403465 res!941297) b!1403468))

(assert (= (and b!1403468 res!941292) b!1403464))

(assert (= (and b!1403464 res!941291) b!1403467))

(assert (= (and b!1403467 (not res!941296)) b!1403471))

(assert (= (and b!1403471 (not res!941294)) b!1403472))

(assert (= (and b!1403472 (not res!941293)) b!1403466))

(assert (= (and b!1403466 (not res!941290)) b!1403469))

(declare-fun m!1291795 () Bool)

(assert (=> start!120632 m!1291795))

(declare-fun m!1291797 () Bool)

(assert (=> start!120632 m!1291797))

(declare-fun m!1291799 () Bool)

(assert (=> b!1403472 m!1291799))

(declare-fun m!1291801 () Bool)

(assert (=> b!1403472 m!1291801))

(declare-fun m!1291803 () Bool)

(assert (=> b!1403472 m!1291803))

(declare-fun m!1291805 () Bool)

(assert (=> b!1403472 m!1291805))

(assert (=> b!1403472 m!1291801))

(declare-fun m!1291807 () Bool)

(assert (=> b!1403472 m!1291807))

(declare-fun m!1291809 () Bool)

(assert (=> b!1403472 m!1291809))

(declare-fun m!1291811 () Bool)

(assert (=> b!1403466 m!1291811))

(declare-fun m!1291813 () Bool)

(assert (=> b!1403468 m!1291813))

(declare-fun m!1291815 () Bool)

(assert (=> b!1403470 m!1291815))

(assert (=> b!1403470 m!1291815))

(declare-fun m!1291817 () Bool)

(assert (=> b!1403470 m!1291817))

(assert (=> b!1403467 m!1291801))

(declare-fun m!1291819 () Bool)

(assert (=> b!1403467 m!1291819))

(assert (=> b!1403467 m!1291801))

(assert (=> b!1403467 m!1291801))

(declare-fun m!1291821 () Bool)

(assert (=> b!1403467 m!1291821))

(declare-fun m!1291823 () Bool)

(assert (=> b!1403467 m!1291823))

(assert (=> b!1403467 m!1291801))

(declare-fun m!1291825 () Bool)

(assert (=> b!1403467 m!1291825))

(declare-fun m!1291827 () Bool)

(assert (=> b!1403467 m!1291827))

(declare-fun m!1291829 () Bool)

(assert (=> b!1403464 m!1291829))

(assert (=> b!1403465 m!1291801))

(assert (=> b!1403465 m!1291801))

(declare-fun m!1291831 () Bool)

(assert (=> b!1403465 m!1291831))

(declare-fun m!1291833 () Bool)

(assert (=> b!1403471 m!1291833))

(assert (=> b!1403471 m!1291833))

(declare-fun m!1291835 () Bool)

(assert (=> b!1403471 m!1291835))

(assert (=> b!1403471 m!1291809))

(declare-fun m!1291837 () Bool)

(assert (=> b!1403471 m!1291837))

(declare-fun m!1291839 () Bool)

(assert (=> b!1403469 m!1291839))

(check-sat (not b!1403464) (not b!1403471) (not b!1403472) (not b!1403469) (not b!1403470) (not b!1403465) (not b!1403467) (not b!1403466) (not start!120632) (not b!1403468))
(check-sat)
