; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122946 () Bool)

(assert start!122946)

(declare-fun b!1426201 () Bool)

(declare-fun res!961642 () Bool)

(declare-fun e!805624 () Bool)

(assert (=> b!1426201 (=> (not res!961642) (not e!805624))))

(declare-datatypes ((array!97311 0))(
  ( (array!97312 (arr!46973 (Array (_ BitVec 32) (_ BitVec 64))) (size!47523 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97311)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97311 (_ BitVec 32)) Bool)

(assert (=> b!1426201 (= res!961642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426202 () Bool)

(declare-fun res!961635 () Bool)

(assert (=> b!1426202 (=> (not res!961635) (not e!805624))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426202 (= res!961635 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47523 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47523 a!2831))))))

(declare-fun b!1426203 () Bool)

(declare-fun e!805622 () Bool)

(declare-fun e!805625 () Bool)

(assert (=> b!1426203 (= e!805622 e!805625)))

(declare-fun res!961643 () Bool)

(assert (=> b!1426203 (=> (not res!961643) (not e!805625))))

(declare-fun lt!628062 () array!97311)

(declare-fun lt!628063 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11252 0))(
  ( (MissingZero!11252 (index!47400 (_ BitVec 32))) (Found!11252 (index!47401 (_ BitVec 32))) (Intermediate!11252 (undefined!12064 Bool) (index!47402 (_ BitVec 32)) (x!129030 (_ BitVec 32))) (Undefined!11252) (MissingVacant!11252 (index!47403 (_ BitVec 32))) )
))
(declare-fun lt!628065 () SeekEntryResult!11252)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97311 (_ BitVec 32)) SeekEntryResult!11252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426203 (= res!961643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628063 mask!2608) lt!628063 lt!628062 mask!2608) lt!628065))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426203 (= lt!628065 (Intermediate!11252 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426203 (= lt!628063 (select (store (arr!46973 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426203 (= lt!628062 (array!97312 (store (arr!46973 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47523 a!2831)))))

(declare-fun b!1426204 () Bool)

(declare-fun res!961644 () Bool)

(assert (=> b!1426204 (=> (not res!961644) (not e!805624))))

(declare-datatypes ((List!33483 0))(
  ( (Nil!33480) (Cons!33479 (h!34781 (_ BitVec 64)) (t!48177 List!33483)) )
))
(declare-fun arrayNoDuplicates!0 (array!97311 (_ BitVec 32) List!33483) Bool)

(assert (=> b!1426204 (= res!961644 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33480))))

(declare-fun b!1426205 () Bool)

(declare-fun res!961641 () Bool)

(assert (=> b!1426205 (=> (not res!961641) (not e!805624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426205 (= res!961641 (validKeyInArray!0 (select (arr!46973 a!2831) j!81)))))

(declare-fun res!961640 () Bool)

(assert (=> start!122946 (=> (not res!961640) (not e!805624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122946 (= res!961640 (validMask!0 mask!2608))))

(assert (=> start!122946 e!805624))

(assert (=> start!122946 true))

(declare-fun array_inv!36001 (array!97311) Bool)

(assert (=> start!122946 (array_inv!36001 a!2831)))

(declare-fun b!1426206 () Bool)

(declare-fun res!961636 () Bool)

(assert (=> b!1426206 (=> (not res!961636) (not e!805624))))

(assert (=> b!1426206 (= res!961636 (validKeyInArray!0 (select (arr!46973 a!2831) i!982)))))

(declare-fun b!1426207 () Bool)

(declare-fun res!961634 () Bool)

(assert (=> b!1426207 (=> (not res!961634) (not e!805625))))

(assert (=> b!1426207 (= res!961634 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628063 lt!628062 mask!2608) lt!628065))))

(declare-fun b!1426208 () Bool)

(declare-fun res!961639 () Bool)

(assert (=> b!1426208 (=> (not res!961639) (not e!805625))))

(declare-fun lt!628061 () SeekEntryResult!11252)

(assert (=> b!1426208 (= res!961639 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46973 a!2831) j!81) a!2831 mask!2608) lt!628061))))

(declare-fun b!1426209 () Bool)

(declare-fun res!961637 () Bool)

(assert (=> b!1426209 (=> (not res!961637) (not e!805625))))

(assert (=> b!1426209 (= res!961637 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426210 () Bool)

(assert (=> b!1426210 (= e!805625 (not true))))

(assert (=> b!1426210 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48250 0))(
  ( (Unit!48251) )
))
(declare-fun lt!628064 () Unit!48250)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48250)

(assert (=> b!1426210 (= lt!628064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426211 () Bool)

(declare-fun res!961638 () Bool)

(assert (=> b!1426211 (=> (not res!961638) (not e!805624))))

(assert (=> b!1426211 (= res!961638 (and (= (size!47523 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47523 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47523 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426212 () Bool)

(assert (=> b!1426212 (= e!805624 e!805622)))

(declare-fun res!961645 () Bool)

(assert (=> b!1426212 (=> (not res!961645) (not e!805622))))

(assert (=> b!1426212 (= res!961645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46973 a!2831) j!81) mask!2608) (select (arr!46973 a!2831) j!81) a!2831 mask!2608) lt!628061))))

(assert (=> b!1426212 (= lt!628061 (Intermediate!11252 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122946 res!961640) b!1426211))

(assert (= (and b!1426211 res!961638) b!1426206))

(assert (= (and b!1426206 res!961636) b!1426205))

(assert (= (and b!1426205 res!961641) b!1426201))

(assert (= (and b!1426201 res!961642) b!1426204))

(assert (= (and b!1426204 res!961644) b!1426202))

(assert (= (and b!1426202 res!961635) b!1426212))

(assert (= (and b!1426212 res!961645) b!1426203))

(assert (= (and b!1426203 res!961643) b!1426208))

(assert (= (and b!1426208 res!961639) b!1426207))

(assert (= (and b!1426207 res!961634) b!1426209))

(assert (= (and b!1426209 res!961637) b!1426210))

(declare-fun m!1316811 () Bool)

(assert (=> b!1426210 m!1316811))

(declare-fun m!1316813 () Bool)

(assert (=> b!1426210 m!1316813))

(declare-fun m!1316815 () Bool)

(assert (=> b!1426208 m!1316815))

(assert (=> b!1426208 m!1316815))

(declare-fun m!1316817 () Bool)

(assert (=> b!1426208 m!1316817))

(declare-fun m!1316819 () Bool)

(assert (=> b!1426207 m!1316819))

(declare-fun m!1316821 () Bool)

(assert (=> b!1426204 m!1316821))

(declare-fun m!1316823 () Bool)

(assert (=> start!122946 m!1316823))

(declare-fun m!1316825 () Bool)

(assert (=> start!122946 m!1316825))

(declare-fun m!1316827 () Bool)

(assert (=> b!1426203 m!1316827))

(assert (=> b!1426203 m!1316827))

(declare-fun m!1316829 () Bool)

(assert (=> b!1426203 m!1316829))

(declare-fun m!1316831 () Bool)

(assert (=> b!1426203 m!1316831))

(declare-fun m!1316833 () Bool)

(assert (=> b!1426203 m!1316833))

(declare-fun m!1316835 () Bool)

(assert (=> b!1426206 m!1316835))

(assert (=> b!1426206 m!1316835))

(declare-fun m!1316837 () Bool)

(assert (=> b!1426206 m!1316837))

(declare-fun m!1316839 () Bool)

(assert (=> b!1426201 m!1316839))

(assert (=> b!1426205 m!1316815))

(assert (=> b!1426205 m!1316815))

(declare-fun m!1316841 () Bool)

(assert (=> b!1426205 m!1316841))

(assert (=> b!1426212 m!1316815))

(assert (=> b!1426212 m!1316815))

(declare-fun m!1316843 () Bool)

(assert (=> b!1426212 m!1316843))

(assert (=> b!1426212 m!1316843))

(assert (=> b!1426212 m!1316815))

(declare-fun m!1316845 () Bool)

(assert (=> b!1426212 m!1316845))

(push 1)

