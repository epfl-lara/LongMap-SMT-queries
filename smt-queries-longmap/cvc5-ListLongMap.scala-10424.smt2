; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122706 () Bool)

(assert start!122706)

(declare-fun b!1421658 () Bool)

(declare-fun res!957093 () Bool)

(declare-fun e!803815 () Bool)

(assert (=> b!1421658 (=> (not res!957093) (not e!803815))))

(declare-datatypes ((SeekEntryResult!11138 0))(
  ( (MissingZero!11138 (index!46944 (_ BitVec 32))) (Found!11138 (index!46945 (_ BitVec 32))) (Intermediate!11138 (undefined!11950 Bool) (index!46946 (_ BitVec 32)) (x!128596 (_ BitVec 32))) (Undefined!11138) (MissingVacant!11138 (index!46947 (_ BitVec 32))) )
))
(declare-fun lt!626354 () SeekEntryResult!11138)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97071 0))(
  ( (array!97072 (arr!46853 (Array (_ BitVec 32) (_ BitVec 64))) (size!47403 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97071)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97071 (_ BitVec 32)) SeekEntryResult!11138)

(assert (=> b!1421658 (= res!957093 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46853 a!2831) j!81) a!2831 mask!2608) lt!626354))))

(declare-fun b!1421659 () Bool)

(declare-fun res!957097 () Bool)

(declare-fun e!803818 () Bool)

(assert (=> b!1421659 (=> (not res!957097) (not e!803818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421659 (= res!957097 (validKeyInArray!0 (select (arr!46853 a!2831) j!81)))))

(declare-fun b!1421660 () Bool)

(declare-fun e!803819 () Bool)

(assert (=> b!1421660 (= e!803819 e!803815)))

(declare-fun res!957101 () Bool)

(assert (=> b!1421660 (=> (not res!957101) (not e!803815))))

(declare-fun lt!626353 () (_ BitVec 64))

(declare-fun lt!626355 () array!97071)

(declare-fun lt!626352 () SeekEntryResult!11138)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421660 (= res!957101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626353 mask!2608) lt!626353 lt!626355 mask!2608) lt!626352))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421660 (= lt!626352 (Intermediate!11138 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421660 (= lt!626353 (select (store (arr!46853 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421660 (= lt!626355 (array!97072 (store (arr!46853 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47403 a!2831)))))

(declare-fun b!1421661 () Bool)

(declare-fun res!957091 () Bool)

(assert (=> b!1421661 (=> (not res!957091) (not e!803818))))

(declare-datatypes ((List!33363 0))(
  ( (Nil!33360) (Cons!33359 (h!34661 (_ BitVec 64)) (t!48057 List!33363)) )
))
(declare-fun arrayNoDuplicates!0 (array!97071 (_ BitVec 32) List!33363) Bool)

(assert (=> b!1421661 (= res!957091 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33360))))

(declare-fun res!957099 () Bool)

(assert (=> start!122706 (=> (not res!957099) (not e!803818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122706 (= res!957099 (validMask!0 mask!2608))))

(assert (=> start!122706 e!803818))

(assert (=> start!122706 true))

(declare-fun array_inv!35881 (array!97071) Bool)

(assert (=> start!122706 (array_inv!35881 a!2831)))

(declare-fun b!1421662 () Bool)

(declare-fun e!803817 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97071 (_ BitVec 32)) SeekEntryResult!11138)

(assert (=> b!1421662 (= e!803817 (= (seekEntryOrOpen!0 (select (arr!46853 a!2831) j!81) a!2831 mask!2608) (Found!11138 j!81)))))

(declare-fun b!1421663 () Bool)

(declare-fun res!957092 () Bool)

(assert (=> b!1421663 (=> (not res!957092) (not e!803818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97071 (_ BitVec 32)) Bool)

(assert (=> b!1421663 (= res!957092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421664 () Bool)

(declare-fun res!957103 () Bool)

(assert (=> b!1421664 (=> (not res!957103) (not e!803815))))

(assert (=> b!1421664 (= res!957103 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626353 lt!626355 mask!2608) lt!626352))))

(declare-fun b!1421665 () Bool)

(declare-fun res!957095 () Bool)

(assert (=> b!1421665 (=> (not res!957095) (not e!803818))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421665 (= res!957095 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47403 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47403 a!2831))))))

(declare-fun b!1421666 () Bool)

(declare-fun res!957096 () Bool)

(assert (=> b!1421666 (=> (not res!957096) (not e!803818))))

(assert (=> b!1421666 (= res!957096 (and (= (size!47403 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47403 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47403 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421667 () Bool)

(declare-fun res!957098 () Bool)

(assert (=> b!1421667 (=> (not res!957098) (not e!803815))))

(assert (=> b!1421667 (= res!957098 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421668 () Bool)

(declare-fun res!957094 () Bool)

(assert (=> b!1421668 (=> (not res!957094) (not e!803818))))

(assert (=> b!1421668 (= res!957094 (validKeyInArray!0 (select (arr!46853 a!2831) i!982)))))

(declare-fun b!1421669 () Bool)

(assert (=> b!1421669 (= e!803815 (not (or (= (select (arr!46853 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46853 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46853 a!2831) index!585) (select (arr!46853 a!2831) j!81)) (= (select (store (arr!46853 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2608 #b00000000000000000000000000000000))))))

(assert (=> b!1421669 e!803817))

(declare-fun res!957102 () Bool)

(assert (=> b!1421669 (=> (not res!957102) (not e!803817))))

(assert (=> b!1421669 (= res!957102 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48112 0))(
  ( (Unit!48113) )
))
(declare-fun lt!626351 () Unit!48112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48112)

(assert (=> b!1421669 (= lt!626351 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421670 () Bool)

(assert (=> b!1421670 (= e!803818 e!803819)))

(declare-fun res!957100 () Bool)

(assert (=> b!1421670 (=> (not res!957100) (not e!803819))))

(assert (=> b!1421670 (= res!957100 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46853 a!2831) j!81) mask!2608) (select (arr!46853 a!2831) j!81) a!2831 mask!2608) lt!626354))))

(assert (=> b!1421670 (= lt!626354 (Intermediate!11138 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122706 res!957099) b!1421666))

(assert (= (and b!1421666 res!957096) b!1421668))

(assert (= (and b!1421668 res!957094) b!1421659))

(assert (= (and b!1421659 res!957097) b!1421663))

(assert (= (and b!1421663 res!957092) b!1421661))

(assert (= (and b!1421661 res!957091) b!1421665))

(assert (= (and b!1421665 res!957095) b!1421670))

(assert (= (and b!1421670 res!957100) b!1421660))

(assert (= (and b!1421660 res!957101) b!1421658))

(assert (= (and b!1421658 res!957093) b!1421664))

(assert (= (and b!1421664 res!957103) b!1421667))

(assert (= (and b!1421667 res!957098) b!1421669))

(assert (= (and b!1421669 res!957102) b!1421662))

(declare-fun m!1312197 () Bool)

(assert (=> b!1421660 m!1312197))

(assert (=> b!1421660 m!1312197))

(declare-fun m!1312199 () Bool)

(assert (=> b!1421660 m!1312199))

(declare-fun m!1312201 () Bool)

(assert (=> b!1421660 m!1312201))

(declare-fun m!1312203 () Bool)

(assert (=> b!1421660 m!1312203))

(declare-fun m!1312205 () Bool)

(assert (=> b!1421662 m!1312205))

(assert (=> b!1421662 m!1312205))

(declare-fun m!1312207 () Bool)

(assert (=> b!1421662 m!1312207))

(declare-fun m!1312209 () Bool)

(assert (=> start!122706 m!1312209))

(declare-fun m!1312211 () Bool)

(assert (=> start!122706 m!1312211))

(assert (=> b!1421658 m!1312205))

(assert (=> b!1421658 m!1312205))

(declare-fun m!1312213 () Bool)

(assert (=> b!1421658 m!1312213))

(declare-fun m!1312215 () Bool)

(assert (=> b!1421661 m!1312215))

(declare-fun m!1312217 () Bool)

(assert (=> b!1421663 m!1312217))

(declare-fun m!1312219 () Bool)

(assert (=> b!1421668 m!1312219))

(assert (=> b!1421668 m!1312219))

(declare-fun m!1312221 () Bool)

(assert (=> b!1421668 m!1312221))

(declare-fun m!1312223 () Bool)

(assert (=> b!1421664 m!1312223))

(assert (=> b!1421670 m!1312205))

(assert (=> b!1421670 m!1312205))

(declare-fun m!1312225 () Bool)

(assert (=> b!1421670 m!1312225))

(assert (=> b!1421670 m!1312225))

(assert (=> b!1421670 m!1312205))

(declare-fun m!1312227 () Bool)

(assert (=> b!1421670 m!1312227))

(assert (=> b!1421669 m!1312201))

(declare-fun m!1312229 () Bool)

(assert (=> b!1421669 m!1312229))

(declare-fun m!1312231 () Bool)

(assert (=> b!1421669 m!1312231))

(declare-fun m!1312233 () Bool)

(assert (=> b!1421669 m!1312233))

(assert (=> b!1421669 m!1312205))

(declare-fun m!1312235 () Bool)

(assert (=> b!1421669 m!1312235))

(assert (=> b!1421659 m!1312205))

(assert (=> b!1421659 m!1312205))

(declare-fun m!1312237 () Bool)

(assert (=> b!1421659 m!1312237))

(push 1)

