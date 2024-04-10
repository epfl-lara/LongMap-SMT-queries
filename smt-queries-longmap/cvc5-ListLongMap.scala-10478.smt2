; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123246 () Bool)

(assert start!123246)

(declare-fun b!1429059 () Bool)

(declare-fun res!963690 () Bool)

(declare-fun e!806992 () Bool)

(assert (=> b!1429059 (=> (not res!963690) (not e!806992))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97407 0))(
  ( (array!97408 (arr!47015 (Array (_ BitVec 32) (_ BitVec 64))) (size!47565 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97407)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429059 (= res!963690 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47565 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47565 a!2831))))))

(declare-fun b!1429060 () Bool)

(declare-fun res!963693 () Bool)

(assert (=> b!1429060 (=> (not res!963693) (not e!806992))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429060 (= res!963693 (and (= (size!47565 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47565 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47565 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!963696 () Bool)

(assert (=> start!123246 (=> (not res!963696) (not e!806992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123246 (= res!963696 (validMask!0 mask!2608))))

(assert (=> start!123246 e!806992))

(assert (=> start!123246 true))

(declare-fun array_inv!36043 (array!97407) Bool)

(assert (=> start!123246 (array_inv!36043 a!2831)))

(declare-fun b!1429061 () Bool)

(declare-fun e!806996 () Bool)

(assert (=> b!1429061 (= e!806992 e!806996)))

(declare-fun res!963692 () Bool)

(assert (=> b!1429061 (=> (not res!963692) (not e!806996))))

(declare-datatypes ((SeekEntryResult!11294 0))(
  ( (MissingZero!11294 (index!47568 (_ BitVec 32))) (Found!11294 (index!47569 (_ BitVec 32))) (Intermediate!11294 (undefined!12106 Bool) (index!47570 (_ BitVec 32)) (x!129208 (_ BitVec 32))) (Undefined!11294) (MissingVacant!11294 (index!47571 (_ BitVec 32))) )
))
(declare-fun lt!629222 () SeekEntryResult!11294)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97407 (_ BitVec 32)) SeekEntryResult!11294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429061 (= res!963692 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47015 a!2831) j!81) mask!2608) (select (arr!47015 a!2831) j!81) a!2831 mask!2608) lt!629222))))

(assert (=> b!1429061 (= lt!629222 (Intermediate!11294 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429062 () Bool)

(declare-fun res!963695 () Bool)

(declare-fun e!806993 () Bool)

(assert (=> b!1429062 (=> (not res!963695) (not e!806993))))

(declare-fun lt!629223 () array!97407)

(declare-fun lt!629220 () (_ BitVec 64))

(declare-fun lt!629219 () SeekEntryResult!11294)

(assert (=> b!1429062 (= res!963695 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629220 lt!629223 mask!2608) lt!629219))))

(declare-fun e!806995 () Bool)

(declare-fun b!1429063 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97407 (_ BitVec 32)) SeekEntryResult!11294)

(assert (=> b!1429063 (= e!806995 (= (seekEntryOrOpen!0 (select (arr!47015 a!2831) j!81) a!2831 mask!2608) (Found!11294 j!81)))))

(declare-fun b!1429064 () Bool)

(declare-fun res!963699 () Bool)

(assert (=> b!1429064 (=> (not res!963699) (not e!806992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429064 (= res!963699 (validKeyInArray!0 (select (arr!47015 a!2831) i!982)))))

(declare-fun b!1429065 () Bool)

(declare-fun res!963689 () Bool)

(assert (=> b!1429065 (=> (not res!963689) (not e!806992))))

(declare-datatypes ((List!33525 0))(
  ( (Nil!33522) (Cons!33521 (h!34835 (_ BitVec 64)) (t!48219 List!33525)) )
))
(declare-fun arrayNoDuplicates!0 (array!97407 (_ BitVec 32) List!33525) Bool)

(assert (=> b!1429065 (= res!963689 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33522))))

(declare-fun b!1429066 () Bool)

(assert (=> b!1429066 (= e!806996 e!806993)))

(declare-fun res!963688 () Bool)

(assert (=> b!1429066 (=> (not res!963688) (not e!806993))))

(assert (=> b!1429066 (= res!963688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629220 mask!2608) lt!629220 lt!629223 mask!2608) lt!629219))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429066 (= lt!629219 (Intermediate!11294 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429066 (= lt!629220 (select (store (arr!47015 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429066 (= lt!629223 (array!97408 (store (arr!47015 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47565 a!2831)))))

(declare-fun b!1429067 () Bool)

(declare-fun res!963694 () Bool)

(assert (=> b!1429067 (=> (not res!963694) (not e!806992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97407 (_ BitVec 32)) Bool)

(assert (=> b!1429067 (= res!963694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429068 () Bool)

(assert (=> b!1429068 (= e!806993 (not true))))

(assert (=> b!1429068 e!806995))

(declare-fun res!963691 () Bool)

(assert (=> b!1429068 (=> (not res!963691) (not e!806995))))

(assert (=> b!1429068 (= res!963691 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48334 0))(
  ( (Unit!48335) )
))
(declare-fun lt!629221 () Unit!48334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48334)

(assert (=> b!1429068 (= lt!629221 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429069 () Bool)

(declare-fun res!963700 () Bool)

(assert (=> b!1429069 (=> (not res!963700) (not e!806993))))

(assert (=> b!1429069 (= res!963700 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47015 a!2831) j!81) a!2831 mask!2608) lt!629222))))

(declare-fun b!1429070 () Bool)

(declare-fun res!963697 () Bool)

(assert (=> b!1429070 (=> (not res!963697) (not e!806992))))

(assert (=> b!1429070 (= res!963697 (validKeyInArray!0 (select (arr!47015 a!2831) j!81)))))

(declare-fun b!1429071 () Bool)

(declare-fun res!963698 () Bool)

(assert (=> b!1429071 (=> (not res!963698) (not e!806993))))

(assert (=> b!1429071 (= res!963698 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123246 res!963696) b!1429060))

(assert (= (and b!1429060 res!963693) b!1429064))

(assert (= (and b!1429064 res!963699) b!1429070))

(assert (= (and b!1429070 res!963697) b!1429067))

(assert (= (and b!1429067 res!963694) b!1429065))

(assert (= (and b!1429065 res!963689) b!1429059))

(assert (= (and b!1429059 res!963690) b!1429061))

(assert (= (and b!1429061 res!963692) b!1429066))

(assert (= (and b!1429066 res!963688) b!1429069))

(assert (= (and b!1429069 res!963700) b!1429062))

(assert (= (and b!1429062 res!963695) b!1429071))

(assert (= (and b!1429071 res!963698) b!1429068))

(assert (= (and b!1429068 res!963691) b!1429063))

(declare-fun m!1319169 () Bool)

(assert (=> b!1429061 m!1319169))

(assert (=> b!1429061 m!1319169))

(declare-fun m!1319171 () Bool)

(assert (=> b!1429061 m!1319171))

(assert (=> b!1429061 m!1319171))

(assert (=> b!1429061 m!1319169))

(declare-fun m!1319173 () Bool)

(assert (=> b!1429061 m!1319173))

(declare-fun m!1319175 () Bool)

(assert (=> b!1429068 m!1319175))

(declare-fun m!1319177 () Bool)

(assert (=> b!1429068 m!1319177))

(declare-fun m!1319179 () Bool)

(assert (=> b!1429067 m!1319179))

(assert (=> b!1429069 m!1319169))

(assert (=> b!1429069 m!1319169))

(declare-fun m!1319181 () Bool)

(assert (=> b!1429069 m!1319181))

(assert (=> b!1429063 m!1319169))

(assert (=> b!1429063 m!1319169))

(declare-fun m!1319183 () Bool)

(assert (=> b!1429063 m!1319183))

(declare-fun m!1319185 () Bool)

(assert (=> b!1429065 m!1319185))

(declare-fun m!1319187 () Bool)

(assert (=> b!1429066 m!1319187))

(assert (=> b!1429066 m!1319187))

(declare-fun m!1319189 () Bool)

(assert (=> b!1429066 m!1319189))

(declare-fun m!1319191 () Bool)

(assert (=> b!1429066 m!1319191))

(declare-fun m!1319193 () Bool)

(assert (=> b!1429066 m!1319193))

(assert (=> b!1429070 m!1319169))

(assert (=> b!1429070 m!1319169))

(declare-fun m!1319195 () Bool)

(assert (=> b!1429070 m!1319195))

(declare-fun m!1319197 () Bool)

(assert (=> b!1429062 m!1319197))

(declare-fun m!1319199 () Bool)

(assert (=> start!123246 m!1319199))

(declare-fun m!1319201 () Bool)

(assert (=> start!123246 m!1319201))

(declare-fun m!1319203 () Bool)

(assert (=> b!1429064 m!1319203))

(assert (=> b!1429064 m!1319203))

(declare-fun m!1319205 () Bool)

(assert (=> b!1429064 m!1319205))

(push 1)

