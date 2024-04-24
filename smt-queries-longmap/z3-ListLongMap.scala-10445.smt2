; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123074 () Bool)

(assert start!123074)

(declare-fun b!1426056 () Bool)

(declare-fun e!806016 () Bool)

(declare-fun e!806019 () Bool)

(assert (=> b!1426056 (= e!806016 e!806019)))

(declare-fun res!960619 () Bool)

(assert (=> b!1426056 (=> (not res!960619) (not e!806019))))

(declare-datatypes ((SeekEntryResult!11156 0))(
  ( (MissingZero!11156 (index!47016 (_ BitVec 32))) (Found!11156 (index!47017 (_ BitVec 32))) (Intermediate!11156 (undefined!11968 Bool) (index!47018 (_ BitVec 32)) (x!128807 (_ BitVec 32))) (Undefined!11156) (MissingVacant!11156 (index!47019 (_ BitVec 32))) )
))
(declare-fun lt!628159 () SeekEntryResult!11156)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97310 0))(
  ( (array!97311 (arr!46969 (Array (_ BitVec 32) (_ BitVec 64))) (size!47520 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97310)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97310 (_ BitVec 32)) SeekEntryResult!11156)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426056 (= res!960619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46969 a!2831) j!81) mask!2608) (select (arr!46969 a!2831) j!81) a!2831 mask!2608) lt!628159))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426056 (= lt!628159 (Intermediate!11156 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426057 () Bool)

(declare-fun res!960610 () Bool)

(assert (=> b!1426057 (=> (not res!960610) (not e!806016))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426057 (= res!960610 (validKeyInArray!0 (select (arr!46969 a!2831) i!982)))))

(declare-fun b!1426058 () Bool)

(declare-fun res!960611 () Bool)

(declare-fun e!806020 () Bool)

(assert (=> b!1426058 (=> res!960611 e!806020)))

(declare-fun lt!628160 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1426058 (= res!960611 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!628160 (select (arr!46969 a!2831) j!81) a!2831 mask!2608) lt!628159)))))

(declare-fun b!1426059 () Bool)

(assert (=> b!1426059 (= e!806020 true)))

(declare-fun lt!628156 () (_ BitVec 64))

(declare-fun lt!628154 () SeekEntryResult!11156)

(declare-fun lt!628157 () array!97310)

(assert (=> b!1426059 (= lt!628154 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!628160 lt!628156 lt!628157 mask!2608))))

(declare-fun b!1426060 () Bool)

(declare-fun res!960612 () Bool)

(assert (=> b!1426060 (=> (not res!960612) (not e!806016))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426060 (= res!960612 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47520 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47520 a!2831))))))

(declare-fun b!1426061 () Bool)

(declare-fun res!960615 () Bool)

(declare-fun e!806018 () Bool)

(assert (=> b!1426061 (=> (not res!960615) (not e!806018))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426061 (= res!960615 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426062 () Bool)

(declare-fun res!960616 () Bool)

(assert (=> b!1426062 (=> (not res!960616) (not e!806016))))

(declare-datatypes ((List!33466 0))(
  ( (Nil!33463) (Cons!33462 (h!34775 (_ BitVec 64)) (t!48152 List!33466)) )
))
(declare-fun arrayNoDuplicates!0 (array!97310 (_ BitVec 32) List!33466) Bool)

(assert (=> b!1426062 (= res!960616 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33463))))

(declare-fun b!1426063 () Bool)

(declare-fun e!806017 () Bool)

(assert (=> b!1426063 (= e!806018 (not e!806017))))

(declare-fun res!960613 () Bool)

(assert (=> b!1426063 (=> res!960613 e!806017)))

(assert (=> b!1426063 (= res!960613 (or (= (select (arr!46969 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46969 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46969 a!2831) index!585) (select (arr!46969 a!2831) j!81)) (= (select (store (arr!46969 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!806015 () Bool)

(assert (=> b!1426063 e!806015))

(declare-fun res!960614 () Bool)

(assert (=> b!1426063 (=> (not res!960614) (not e!806015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97310 (_ BitVec 32)) Bool)

(assert (=> b!1426063 (= res!960614 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48179 0))(
  ( (Unit!48180) )
))
(declare-fun lt!628155 () Unit!48179)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48179)

(assert (=> b!1426063 (= lt!628155 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426064 () Bool)

(declare-fun res!960618 () Bool)

(assert (=> b!1426064 (=> (not res!960618) (not e!806016))))

(assert (=> b!1426064 (= res!960618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426065 () Bool)

(declare-fun res!960617 () Bool)

(assert (=> b!1426065 (=> (not res!960617) (not e!806016))))

(assert (=> b!1426065 (= res!960617 (validKeyInArray!0 (select (arr!46969 a!2831) j!81)))))

(declare-fun b!1426066 () Bool)

(assert (=> b!1426066 (= e!806019 e!806018)))

(declare-fun res!960609 () Bool)

(assert (=> b!1426066 (=> (not res!960609) (not e!806018))))

(declare-fun lt!628158 () SeekEntryResult!11156)

(assert (=> b!1426066 (= res!960609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628156 mask!2608) lt!628156 lt!628157 mask!2608) lt!628158))))

(assert (=> b!1426066 (= lt!628158 (Intermediate!11156 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426066 (= lt!628156 (select (store (arr!46969 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426066 (= lt!628157 (array!97311 (store (arr!46969 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47520 a!2831)))))

(declare-fun b!1426067 () Bool)

(assert (=> b!1426067 (= e!806017 e!806020)))

(declare-fun res!960606 () Bool)

(assert (=> b!1426067 (=> res!960606 e!806020)))

(assert (=> b!1426067 (= res!960606 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!628160 #b00000000000000000000000000000000) (bvsge lt!628160 (size!47520 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426067 (= lt!628160 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1426068 () Bool)

(declare-fun res!960608 () Bool)

(assert (=> b!1426068 (=> (not res!960608) (not e!806016))))

(assert (=> b!1426068 (= res!960608 (and (= (size!47520 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47520 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47520 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426069 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97310 (_ BitVec 32)) SeekEntryResult!11156)

(assert (=> b!1426069 (= e!806015 (= (seekEntryOrOpen!0 (select (arr!46969 a!2831) j!81) a!2831 mask!2608) (Found!11156 j!81)))))

(declare-fun b!1426070 () Bool)

(declare-fun res!960605 () Bool)

(assert (=> b!1426070 (=> (not res!960605) (not e!806018))))

(assert (=> b!1426070 (= res!960605 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628156 lt!628157 mask!2608) lt!628158))))

(declare-fun res!960607 () Bool)

(assert (=> start!123074 (=> (not res!960607) (not e!806016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123074 (= res!960607 (validMask!0 mask!2608))))

(assert (=> start!123074 e!806016))

(assert (=> start!123074 true))

(declare-fun array_inv!36250 (array!97310) Bool)

(assert (=> start!123074 (array_inv!36250 a!2831)))

(declare-fun b!1426071 () Bool)

(declare-fun res!960604 () Bool)

(assert (=> b!1426071 (=> (not res!960604) (not e!806018))))

(assert (=> b!1426071 (= res!960604 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46969 a!2831) j!81) a!2831 mask!2608) lt!628159))))

(assert (= (and start!123074 res!960607) b!1426068))

(assert (= (and b!1426068 res!960608) b!1426057))

(assert (= (and b!1426057 res!960610) b!1426065))

(assert (= (and b!1426065 res!960617) b!1426064))

(assert (= (and b!1426064 res!960618) b!1426062))

(assert (= (and b!1426062 res!960616) b!1426060))

(assert (= (and b!1426060 res!960612) b!1426056))

(assert (= (and b!1426056 res!960619) b!1426066))

(assert (= (and b!1426066 res!960609) b!1426071))

(assert (= (and b!1426071 res!960604) b!1426070))

(assert (= (and b!1426070 res!960605) b!1426061))

(assert (= (and b!1426061 res!960615) b!1426063))

(assert (= (and b!1426063 res!960614) b!1426069))

(assert (= (and b!1426063 (not res!960613)) b!1426067))

(assert (= (and b!1426067 (not res!960606)) b!1426058))

(assert (= (and b!1426058 (not res!960611)) b!1426059))

(declare-fun m!1316721 () Bool)

(assert (=> b!1426058 m!1316721))

(assert (=> b!1426058 m!1316721))

(declare-fun m!1316723 () Bool)

(assert (=> b!1426058 m!1316723))

(declare-fun m!1316725 () Bool)

(assert (=> b!1426066 m!1316725))

(assert (=> b!1426066 m!1316725))

(declare-fun m!1316727 () Bool)

(assert (=> b!1426066 m!1316727))

(declare-fun m!1316729 () Bool)

(assert (=> b!1426066 m!1316729))

(declare-fun m!1316731 () Bool)

(assert (=> b!1426066 m!1316731))

(declare-fun m!1316733 () Bool)

(assert (=> start!123074 m!1316733))

(declare-fun m!1316735 () Bool)

(assert (=> start!123074 m!1316735))

(declare-fun m!1316737 () Bool)

(assert (=> b!1426057 m!1316737))

(assert (=> b!1426057 m!1316737))

(declare-fun m!1316739 () Bool)

(assert (=> b!1426057 m!1316739))

(declare-fun m!1316741 () Bool)

(assert (=> b!1426064 m!1316741))

(assert (=> b!1426056 m!1316721))

(assert (=> b!1426056 m!1316721))

(declare-fun m!1316743 () Bool)

(assert (=> b!1426056 m!1316743))

(assert (=> b!1426056 m!1316743))

(assert (=> b!1426056 m!1316721))

(declare-fun m!1316745 () Bool)

(assert (=> b!1426056 m!1316745))

(declare-fun m!1316747 () Bool)

(assert (=> b!1426070 m!1316747))

(assert (=> b!1426063 m!1316729))

(declare-fun m!1316749 () Bool)

(assert (=> b!1426063 m!1316749))

(declare-fun m!1316751 () Bool)

(assert (=> b!1426063 m!1316751))

(declare-fun m!1316753 () Bool)

(assert (=> b!1426063 m!1316753))

(assert (=> b!1426063 m!1316721))

(declare-fun m!1316755 () Bool)

(assert (=> b!1426063 m!1316755))

(declare-fun m!1316757 () Bool)

(assert (=> b!1426062 m!1316757))

(assert (=> b!1426069 m!1316721))

(assert (=> b!1426069 m!1316721))

(declare-fun m!1316759 () Bool)

(assert (=> b!1426069 m!1316759))

(declare-fun m!1316761 () Bool)

(assert (=> b!1426059 m!1316761))

(assert (=> b!1426065 m!1316721))

(assert (=> b!1426065 m!1316721))

(declare-fun m!1316763 () Bool)

(assert (=> b!1426065 m!1316763))

(declare-fun m!1316765 () Bool)

(assert (=> b!1426067 m!1316765))

(assert (=> b!1426071 m!1316721))

(assert (=> b!1426071 m!1316721))

(declare-fun m!1316767 () Bool)

(assert (=> b!1426071 m!1316767))

(check-sat (not b!1426057) (not b!1426059) (not b!1426065) (not b!1426069) (not b!1426062) (not b!1426070) (not b!1426071) (not b!1426067) (not b!1426063) (not b!1426056) (not b!1426064) (not b!1426058) (not b!1426066) (not start!123074))
(check-sat)
