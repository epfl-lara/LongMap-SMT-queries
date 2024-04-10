; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122834 () Bool)

(assert start!122834)

(declare-fun b!1424655 () Bool)

(declare-fun res!960095 () Bool)

(declare-fun e!805113 () Bool)

(assert (=> b!1424655 (=> (not res!960095) (not e!805113))))

(declare-datatypes ((array!97199 0))(
  ( (array!97200 (arr!46917 (Array (_ BitVec 32) (_ BitVec 64))) (size!47467 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97199)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424655 (= res!960095 (validKeyInArray!0 (select (arr!46917 a!2831) j!81)))))

(declare-fun b!1424656 () Bool)

(declare-fun e!805114 () Bool)

(declare-fun e!805110 () Bool)

(assert (=> b!1424656 (= e!805114 (not e!805110))))

(declare-fun res!960099 () Bool)

(assert (=> b!1424656 (=> res!960099 e!805110)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424656 (= res!960099 (or (= (select (arr!46917 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46917 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46917 a!2831) index!585) (select (arr!46917 a!2831) j!81)) (= (select (store (arr!46917 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805111 () Bool)

(assert (=> b!1424656 e!805111))

(declare-fun res!960097 () Bool)

(assert (=> b!1424656 (=> (not res!960097) (not e!805111))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97199 (_ BitVec 32)) Bool)

(assert (=> b!1424656 (= res!960097 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48240 0))(
  ( (Unit!48241) )
))
(declare-fun lt!627646 () Unit!48240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48240)

(assert (=> b!1424656 (= lt!627646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424657 () Bool)

(declare-fun res!960090 () Bool)

(assert (=> b!1424657 (=> (not res!960090) (not e!805113))))

(declare-datatypes ((List!33427 0))(
  ( (Nil!33424) (Cons!33423 (h!34725 (_ BitVec 64)) (t!48121 List!33427)) )
))
(declare-fun arrayNoDuplicates!0 (array!97199 (_ BitVec 32) List!33427) Bool)

(assert (=> b!1424657 (= res!960090 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33424))))

(declare-fun b!1424659 () Bool)

(declare-fun res!960102 () Bool)

(assert (=> b!1424659 (=> (not res!960102) (not e!805113))))

(assert (=> b!1424659 (= res!960102 (validKeyInArray!0 (select (arr!46917 a!2831) i!982)))))

(declare-fun b!1424660 () Bool)

(declare-fun e!805109 () Bool)

(assert (=> b!1424660 (= e!805113 e!805109)))

(declare-fun res!960103 () Bool)

(assert (=> b!1424660 (=> (not res!960103) (not e!805109))))

(declare-datatypes ((SeekEntryResult!11202 0))(
  ( (MissingZero!11202 (index!47200 (_ BitVec 32))) (Found!11202 (index!47201 (_ BitVec 32))) (Intermediate!11202 (undefined!12014 Bool) (index!47202 (_ BitVec 32)) (x!128828 (_ BitVec 32))) (Undefined!11202) (MissingVacant!11202 (index!47203 (_ BitVec 32))) )
))
(declare-fun lt!627651 () SeekEntryResult!11202)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97199 (_ BitVec 32)) SeekEntryResult!11202)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424660 (= res!960103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46917 a!2831) j!81) mask!2608) (select (arr!46917 a!2831) j!81) a!2831 mask!2608) lt!627651))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424660 (= lt!627651 (Intermediate!11202 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424661 () Bool)

(declare-fun res!960096 () Bool)

(assert (=> b!1424661 (=> (not res!960096) (not e!805113))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1424661 (= res!960096 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47467 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47467 a!2831))))))

(declare-fun b!1424662 () Bool)

(declare-fun e!805115 () Bool)

(assert (=> b!1424662 (= e!805110 e!805115)))

(declare-fun res!960088 () Bool)

(assert (=> b!1424662 (=> res!960088 e!805115)))

(declare-fun lt!627650 () (_ BitVec 32))

(assert (=> b!1424662 (= res!960088 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627650 #b00000000000000000000000000000000) (bvsge lt!627650 (size!47467 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424662 (= lt!627650 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424663 () Bool)

(declare-fun res!960098 () Bool)

(assert (=> b!1424663 (=> (not res!960098) (not e!805113))))

(assert (=> b!1424663 (= res!960098 (and (= (size!47467 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47467 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47467 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424664 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97199 (_ BitVec 32)) SeekEntryResult!11202)

(assert (=> b!1424664 (= e!805111 (= (seekEntryOrOpen!0 (select (arr!46917 a!2831) j!81) a!2831 mask!2608) (Found!11202 j!81)))))

(declare-fun b!1424665 () Bool)

(assert (=> b!1424665 (= e!805109 e!805114)))

(declare-fun res!960092 () Bool)

(assert (=> b!1424665 (=> (not res!960092) (not e!805114))))

(declare-fun lt!627649 () SeekEntryResult!11202)

(declare-fun lt!627645 () (_ BitVec 64))

(declare-fun lt!627648 () array!97199)

(assert (=> b!1424665 (= res!960092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627645 mask!2608) lt!627645 lt!627648 mask!2608) lt!627649))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424665 (= lt!627649 (Intermediate!11202 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424665 (= lt!627645 (select (store (arr!46917 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424665 (= lt!627648 (array!97200 (store (arr!46917 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47467 a!2831)))))

(declare-fun b!1424666 () Bool)

(declare-fun res!960089 () Bool)

(assert (=> b!1424666 (=> (not res!960089) (not e!805114))))

(assert (=> b!1424666 (= res!960089 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627645 lt!627648 mask!2608) lt!627649))))

(declare-fun b!1424667 () Bool)

(declare-fun res!960094 () Bool)

(assert (=> b!1424667 (=> res!960094 e!805115)))

(assert (=> b!1424667 (= res!960094 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627650 (select (arr!46917 a!2831) j!81) a!2831 mask!2608) lt!627651)))))

(declare-fun b!1424668 () Bool)

(assert (=> b!1424668 (= e!805115 true)))

(declare-fun lt!627647 () SeekEntryResult!11202)

(assert (=> b!1424668 (= lt!627647 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627650 lt!627645 lt!627648 mask!2608))))

(declare-fun b!1424669 () Bool)

(declare-fun res!960101 () Bool)

(assert (=> b!1424669 (=> (not res!960101) (not e!805114))))

(assert (=> b!1424669 (= res!960101 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46917 a!2831) j!81) a!2831 mask!2608) lt!627651))))

(declare-fun b!1424670 () Bool)

(declare-fun res!960100 () Bool)

(assert (=> b!1424670 (=> (not res!960100) (not e!805113))))

(assert (=> b!1424670 (= res!960100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!960091 () Bool)

(assert (=> start!122834 (=> (not res!960091) (not e!805113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122834 (= res!960091 (validMask!0 mask!2608))))

(assert (=> start!122834 e!805113))

(assert (=> start!122834 true))

(declare-fun array_inv!35945 (array!97199) Bool)

(assert (=> start!122834 (array_inv!35945 a!2831)))

(declare-fun b!1424658 () Bool)

(declare-fun res!960093 () Bool)

(assert (=> b!1424658 (=> (not res!960093) (not e!805114))))

(assert (=> b!1424658 (= res!960093 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122834 res!960091) b!1424663))

(assert (= (and b!1424663 res!960098) b!1424659))

(assert (= (and b!1424659 res!960102) b!1424655))

(assert (= (and b!1424655 res!960095) b!1424670))

(assert (= (and b!1424670 res!960100) b!1424657))

(assert (= (and b!1424657 res!960090) b!1424661))

(assert (= (and b!1424661 res!960096) b!1424660))

(assert (= (and b!1424660 res!960103) b!1424665))

(assert (= (and b!1424665 res!960092) b!1424669))

(assert (= (and b!1424669 res!960101) b!1424666))

(assert (= (and b!1424666 res!960089) b!1424658))

(assert (= (and b!1424658 res!960093) b!1424656))

(assert (= (and b!1424656 res!960097) b!1424664))

(assert (= (and b!1424656 (not res!960099)) b!1424662))

(assert (= (and b!1424662 (not res!960088)) b!1424667))

(assert (= (and b!1424667 (not res!960094)) b!1424668))

(declare-fun m!1315203 () Bool)

(assert (=> b!1424659 m!1315203))

(assert (=> b!1424659 m!1315203))

(declare-fun m!1315205 () Bool)

(assert (=> b!1424659 m!1315205))

(declare-fun m!1315207 () Bool)

(assert (=> b!1424655 m!1315207))

(assert (=> b!1424655 m!1315207))

(declare-fun m!1315209 () Bool)

(assert (=> b!1424655 m!1315209))

(declare-fun m!1315211 () Bool)

(assert (=> b!1424665 m!1315211))

(assert (=> b!1424665 m!1315211))

(declare-fun m!1315213 () Bool)

(assert (=> b!1424665 m!1315213))

(declare-fun m!1315215 () Bool)

(assert (=> b!1424665 m!1315215))

(declare-fun m!1315217 () Bool)

(assert (=> b!1424665 m!1315217))

(declare-fun m!1315219 () Bool)

(assert (=> b!1424666 m!1315219))

(declare-fun m!1315221 () Bool)

(assert (=> b!1424662 m!1315221))

(declare-fun m!1315223 () Bool)

(assert (=> start!122834 m!1315223))

(declare-fun m!1315225 () Bool)

(assert (=> start!122834 m!1315225))

(assert (=> b!1424667 m!1315207))

(assert (=> b!1424667 m!1315207))

(declare-fun m!1315227 () Bool)

(assert (=> b!1424667 m!1315227))

(declare-fun m!1315229 () Bool)

(assert (=> b!1424668 m!1315229))

(assert (=> b!1424664 m!1315207))

(assert (=> b!1424664 m!1315207))

(declare-fun m!1315231 () Bool)

(assert (=> b!1424664 m!1315231))

(declare-fun m!1315233 () Bool)

(assert (=> b!1424657 m!1315233))

(assert (=> b!1424669 m!1315207))

(assert (=> b!1424669 m!1315207))

(declare-fun m!1315235 () Bool)

(assert (=> b!1424669 m!1315235))

(assert (=> b!1424660 m!1315207))

(assert (=> b!1424660 m!1315207))

(declare-fun m!1315237 () Bool)

(assert (=> b!1424660 m!1315237))

(assert (=> b!1424660 m!1315237))

(assert (=> b!1424660 m!1315207))

(declare-fun m!1315239 () Bool)

(assert (=> b!1424660 m!1315239))

(declare-fun m!1315241 () Bool)

(assert (=> b!1424670 m!1315241))

(assert (=> b!1424656 m!1315215))

(declare-fun m!1315243 () Bool)

(assert (=> b!1424656 m!1315243))

(declare-fun m!1315245 () Bool)

(assert (=> b!1424656 m!1315245))

(declare-fun m!1315247 () Bool)

(assert (=> b!1424656 m!1315247))

(assert (=> b!1424656 m!1315207))

(declare-fun m!1315249 () Bool)

(assert (=> b!1424656 m!1315249))

(check-sat (not b!1424656) (not start!122834) (not b!1424669) (not b!1424664) (not b!1424657) (not b!1424668) (not b!1424666) (not b!1424655) (not b!1424670) (not b!1424659) (not b!1424667) (not b!1424662) (not b!1424660) (not b!1424665))
(check-sat)
