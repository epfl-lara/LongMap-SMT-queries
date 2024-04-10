; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122792 () Bool)

(assert start!122792)

(declare-fun b!1423647 () Bool)

(declare-fun res!959086 () Bool)

(declare-fun e!804670 () Bool)

(assert (=> b!1423647 (=> (not res!959086) (not e!804670))))

(declare-datatypes ((array!97157 0))(
  ( (array!97158 (arr!46896 (Array (_ BitVec 32) (_ BitVec 64))) (size!47446 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97157)

(declare-datatypes ((List!33406 0))(
  ( (Nil!33403) (Cons!33402 (h!34704 (_ BitVec 64)) (t!48100 List!33406)) )
))
(declare-fun arrayNoDuplicates!0 (array!97157 (_ BitVec 32) List!33406) Bool)

(assert (=> b!1423647 (= res!959086 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33403))))

(declare-fun b!1423648 () Bool)

(declare-fun e!804673 () Bool)

(assert (=> b!1423648 (= e!804673 true)))

(declare-fun lt!627205 () array!97157)

(declare-fun lt!627207 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11181 0))(
  ( (MissingZero!11181 (index!47116 (_ BitVec 32))) (Found!11181 (index!47117 (_ BitVec 32))) (Intermediate!11181 (undefined!11993 Bool) (index!47118 (_ BitVec 32)) (x!128751 (_ BitVec 32))) (Undefined!11181) (MissingVacant!11181 (index!47119 (_ BitVec 32))) )
))
(declare-fun lt!627210 () SeekEntryResult!11181)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627206 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97157 (_ BitVec 32)) SeekEntryResult!11181)

(assert (=> b!1423648 (= lt!627210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627206 lt!627207 lt!627205 mask!2608))))

(declare-fun b!1423649 () Bool)

(declare-fun res!959095 () Bool)

(assert (=> b!1423649 (=> res!959095 e!804673)))

(declare-fun lt!627204 () SeekEntryResult!11181)

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1423649 (= res!959095 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627206 (select (arr!46896 a!2831) j!81) a!2831 mask!2608) lt!627204)))))

(declare-fun b!1423650 () Bool)

(declare-fun res!959080 () Bool)

(assert (=> b!1423650 (=> (not res!959080) (not e!804670))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423650 (= res!959080 (validKeyInArray!0 (select (arr!46896 a!2831) i!982)))))

(declare-fun b!1423651 () Bool)

(declare-fun e!804674 () Bool)

(assert (=> b!1423651 (= e!804674 e!804673)))

(declare-fun res!959081 () Bool)

(assert (=> b!1423651 (=> res!959081 e!804673)))

(assert (=> b!1423651 (= res!959081 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627206 #b00000000000000000000000000000000) (bvsge lt!627206 (size!47446 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423651 (= lt!627206 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423652 () Bool)

(declare-fun res!959087 () Bool)

(assert (=> b!1423652 (=> (not res!959087) (not e!804670))))

(assert (=> b!1423652 (= res!959087 (validKeyInArray!0 (select (arr!46896 a!2831) j!81)))))

(declare-fun b!1423653 () Bool)

(declare-fun res!959089 () Bool)

(declare-fun e!804669 () Bool)

(assert (=> b!1423653 (=> (not res!959089) (not e!804669))))

(assert (=> b!1423653 (= res!959089 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46896 a!2831) j!81) a!2831 mask!2608) lt!627204))))

(declare-fun res!959088 () Bool)

(assert (=> start!122792 (=> (not res!959088) (not e!804670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122792 (= res!959088 (validMask!0 mask!2608))))

(assert (=> start!122792 e!804670))

(assert (=> start!122792 true))

(declare-fun array_inv!35924 (array!97157) Bool)

(assert (=> start!122792 (array_inv!35924 a!2831)))

(declare-fun b!1423654 () Bool)

(declare-fun res!959093 () Bool)

(assert (=> b!1423654 (=> (not res!959093) (not e!804670))))

(assert (=> b!1423654 (= res!959093 (and (= (size!47446 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47446 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47446 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423655 () Bool)

(declare-fun res!959083 () Bool)

(assert (=> b!1423655 (=> (not res!959083) (not e!804669))))

(declare-fun lt!627208 () SeekEntryResult!11181)

(assert (=> b!1423655 (= res!959083 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627207 lt!627205 mask!2608) lt!627208))))

(declare-fun b!1423656 () Bool)

(declare-fun e!804672 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97157 (_ BitVec 32)) SeekEntryResult!11181)

(assert (=> b!1423656 (= e!804672 (= (seekEntryOrOpen!0 (select (arr!46896 a!2831) j!81) a!2831 mask!2608) (Found!11181 j!81)))))

(declare-fun b!1423657 () Bool)

(declare-fun e!804671 () Bool)

(assert (=> b!1423657 (= e!804671 e!804669)))

(declare-fun res!959090 () Bool)

(assert (=> b!1423657 (=> (not res!959090) (not e!804669))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423657 (= res!959090 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627207 mask!2608) lt!627207 lt!627205 mask!2608) lt!627208))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423657 (= lt!627208 (Intermediate!11181 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423657 (= lt!627207 (select (store (arr!46896 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423657 (= lt!627205 (array!97158 (store (arr!46896 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47446 a!2831)))))

(declare-fun b!1423658 () Bool)

(declare-fun res!959082 () Bool)

(assert (=> b!1423658 (=> (not res!959082) (not e!804670))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423658 (= res!959082 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47446 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47446 a!2831))))))

(declare-fun b!1423659 () Bool)

(declare-fun res!959092 () Bool)

(assert (=> b!1423659 (=> (not res!959092) (not e!804670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97157 (_ BitVec 32)) Bool)

(assert (=> b!1423659 (= res!959092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423660 () Bool)

(assert (=> b!1423660 (= e!804669 (not e!804674))))

(declare-fun res!959094 () Bool)

(assert (=> b!1423660 (=> res!959094 e!804674)))

(assert (=> b!1423660 (= res!959094 (or (= (select (arr!46896 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46896 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46896 a!2831) index!585) (select (arr!46896 a!2831) j!81)) (= (select (store (arr!46896 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423660 e!804672))

(declare-fun res!959084 () Bool)

(assert (=> b!1423660 (=> (not res!959084) (not e!804672))))

(assert (=> b!1423660 (= res!959084 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48198 0))(
  ( (Unit!48199) )
))
(declare-fun lt!627209 () Unit!48198)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48198)

(assert (=> b!1423660 (= lt!627209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423661 () Bool)

(declare-fun res!959091 () Bool)

(assert (=> b!1423661 (=> (not res!959091) (not e!804669))))

(assert (=> b!1423661 (= res!959091 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423662 () Bool)

(assert (=> b!1423662 (= e!804670 e!804671)))

(declare-fun res!959085 () Bool)

(assert (=> b!1423662 (=> (not res!959085) (not e!804671))))

(assert (=> b!1423662 (= res!959085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46896 a!2831) j!81) mask!2608) (select (arr!46896 a!2831) j!81) a!2831 mask!2608) lt!627204))))

(assert (=> b!1423662 (= lt!627204 (Intermediate!11181 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122792 res!959088) b!1423654))

(assert (= (and b!1423654 res!959093) b!1423650))

(assert (= (and b!1423650 res!959080) b!1423652))

(assert (= (and b!1423652 res!959087) b!1423659))

(assert (= (and b!1423659 res!959092) b!1423647))

(assert (= (and b!1423647 res!959086) b!1423658))

(assert (= (and b!1423658 res!959082) b!1423662))

(assert (= (and b!1423662 res!959085) b!1423657))

(assert (= (and b!1423657 res!959090) b!1423653))

(assert (= (and b!1423653 res!959089) b!1423655))

(assert (= (and b!1423655 res!959083) b!1423661))

(assert (= (and b!1423661 res!959091) b!1423660))

(assert (= (and b!1423660 res!959084) b!1423656))

(assert (= (and b!1423660 (not res!959094)) b!1423651))

(assert (= (and b!1423651 (not res!959081)) b!1423649))

(assert (= (and b!1423649 (not res!959095)) b!1423648))

(declare-fun m!1314195 () Bool)

(assert (=> b!1423648 m!1314195))

(declare-fun m!1314197 () Bool)

(assert (=> b!1423656 m!1314197))

(assert (=> b!1423656 m!1314197))

(declare-fun m!1314199 () Bool)

(assert (=> b!1423656 m!1314199))

(declare-fun m!1314201 () Bool)

(assert (=> b!1423660 m!1314201))

(declare-fun m!1314203 () Bool)

(assert (=> b!1423660 m!1314203))

(declare-fun m!1314205 () Bool)

(assert (=> b!1423660 m!1314205))

(declare-fun m!1314207 () Bool)

(assert (=> b!1423660 m!1314207))

(assert (=> b!1423660 m!1314197))

(declare-fun m!1314209 () Bool)

(assert (=> b!1423660 m!1314209))

(declare-fun m!1314211 () Bool)

(assert (=> b!1423647 m!1314211))

(assert (=> b!1423662 m!1314197))

(assert (=> b!1423662 m!1314197))

(declare-fun m!1314213 () Bool)

(assert (=> b!1423662 m!1314213))

(assert (=> b!1423662 m!1314213))

(assert (=> b!1423662 m!1314197))

(declare-fun m!1314215 () Bool)

(assert (=> b!1423662 m!1314215))

(assert (=> b!1423653 m!1314197))

(assert (=> b!1423653 m!1314197))

(declare-fun m!1314217 () Bool)

(assert (=> b!1423653 m!1314217))

(declare-fun m!1314219 () Bool)

(assert (=> b!1423657 m!1314219))

(assert (=> b!1423657 m!1314219))

(declare-fun m!1314221 () Bool)

(assert (=> b!1423657 m!1314221))

(assert (=> b!1423657 m!1314201))

(declare-fun m!1314223 () Bool)

(assert (=> b!1423657 m!1314223))

(assert (=> b!1423649 m!1314197))

(assert (=> b!1423649 m!1314197))

(declare-fun m!1314225 () Bool)

(assert (=> b!1423649 m!1314225))

(assert (=> b!1423652 m!1314197))

(assert (=> b!1423652 m!1314197))

(declare-fun m!1314227 () Bool)

(assert (=> b!1423652 m!1314227))

(declare-fun m!1314229 () Bool)

(assert (=> start!122792 m!1314229))

(declare-fun m!1314231 () Bool)

(assert (=> start!122792 m!1314231))

(declare-fun m!1314233 () Bool)

(assert (=> b!1423659 m!1314233))

(declare-fun m!1314235 () Bool)

(assert (=> b!1423650 m!1314235))

(assert (=> b!1423650 m!1314235))

(declare-fun m!1314237 () Bool)

(assert (=> b!1423650 m!1314237))

(declare-fun m!1314239 () Bool)

(assert (=> b!1423655 m!1314239))

(declare-fun m!1314241 () Bool)

(assert (=> b!1423651 m!1314241))

(check-sat (not b!1423660) (not b!1423651) (not b!1423656) (not b!1423657) (not b!1423662) (not start!122792) (not b!1423647) (not b!1423650) (not b!1423648) (not b!1423659) (not b!1423653) (not b!1423655) (not b!1423652) (not b!1423649))
(check-sat)
