; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122796 () Bool)

(assert start!122796)

(declare-fun b!1421243 () Bool)

(declare-fun res!955997 () Bool)

(declare-fun e!804038 () Bool)

(assert (=> b!1421243 (=> (not res!955997) (not e!804038))))

(declare-datatypes ((array!97083 0))(
  ( (array!97084 (arr!46857 (Array (_ BitVec 32) (_ BitVec 64))) (size!47408 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97083)

(declare-datatypes ((List!33354 0))(
  ( (Nil!33351) (Cons!33350 (h!34660 (_ BitVec 64)) (t!48040 List!33354)) )
))
(declare-fun arrayNoDuplicates!0 (array!97083 (_ BitVec 32) List!33354) Bool)

(assert (=> b!1421243 (= res!955997 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33351))))

(declare-fun b!1421244 () Bool)

(declare-fun res!955993 () Bool)

(assert (=> b!1421244 (=> (not res!955993) (not e!804038))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421244 (= res!955993 (validKeyInArray!0 (select (arr!46857 a!2831) j!81)))))

(declare-fun b!1421245 () Bool)

(declare-fun res!955992 () Bool)

(assert (=> b!1421245 (=> (not res!955992) (not e!804038))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421245 (= res!955992 (and (= (size!47408 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47408 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47408 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421247 () Bool)

(assert (=> b!1421247 (= e!804038 false)))

(declare-datatypes ((SeekEntryResult!11044 0))(
  ( (MissingZero!11044 (index!46568 (_ BitVec 32))) (Found!11044 (index!46569 (_ BitVec 32))) (Intermediate!11044 (undefined!11856 Bool) (index!46570 (_ BitVec 32)) (x!128385 (_ BitVec 32))) (Undefined!11044) (MissingVacant!11044 (index!46571 (_ BitVec 32))) )
))
(declare-fun lt!626279 () SeekEntryResult!11044)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97083 (_ BitVec 32)) SeekEntryResult!11044)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421247 (= lt!626279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46857 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46857 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97084 (store (arr!46857 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47408 a!2831)) mask!2608))))

(declare-fun b!1421248 () Bool)

(declare-fun res!955995 () Bool)

(assert (=> b!1421248 (=> (not res!955995) (not e!804038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97083 (_ BitVec 32)) Bool)

(assert (=> b!1421248 (= res!955995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421249 () Bool)

(declare-fun res!955998 () Bool)

(assert (=> b!1421249 (=> (not res!955998) (not e!804038))))

(assert (=> b!1421249 (= res!955998 (validKeyInArray!0 (select (arr!46857 a!2831) i!982)))))

(declare-fun b!1421250 () Bool)

(declare-fun res!955999 () Bool)

(assert (=> b!1421250 (=> (not res!955999) (not e!804038))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421250 (= res!955999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46857 a!2831) j!81) mask!2608) (select (arr!46857 a!2831) j!81) a!2831 mask!2608) (Intermediate!11044 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!955994 () Bool)

(assert (=> start!122796 (=> (not res!955994) (not e!804038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122796 (= res!955994 (validMask!0 mask!2608))))

(assert (=> start!122796 e!804038))

(assert (=> start!122796 true))

(declare-fun array_inv!36138 (array!97083) Bool)

(assert (=> start!122796 (array_inv!36138 a!2831)))

(declare-fun b!1421246 () Bool)

(declare-fun res!955996 () Bool)

(assert (=> b!1421246 (=> (not res!955996) (not e!804038))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421246 (= res!955996 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47408 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47408 a!2831))))))

(assert (= (and start!122796 res!955994) b!1421245))

(assert (= (and b!1421245 res!955992) b!1421249))

(assert (= (and b!1421249 res!955998) b!1421244))

(assert (= (and b!1421244 res!955993) b!1421248))

(assert (= (and b!1421248 res!955995) b!1421243))

(assert (= (and b!1421243 res!955997) b!1421246))

(assert (= (and b!1421246 res!955996) b!1421250))

(assert (= (and b!1421250 res!955999) b!1421247))

(declare-fun m!1311965 () Bool)

(assert (=> b!1421247 m!1311965))

(declare-fun m!1311967 () Bool)

(assert (=> b!1421247 m!1311967))

(assert (=> b!1421247 m!1311967))

(declare-fun m!1311969 () Bool)

(assert (=> b!1421247 m!1311969))

(assert (=> b!1421247 m!1311969))

(assert (=> b!1421247 m!1311967))

(declare-fun m!1311971 () Bool)

(assert (=> b!1421247 m!1311971))

(declare-fun m!1311973 () Bool)

(assert (=> b!1421244 m!1311973))

(assert (=> b!1421244 m!1311973))

(declare-fun m!1311975 () Bool)

(assert (=> b!1421244 m!1311975))

(assert (=> b!1421250 m!1311973))

(assert (=> b!1421250 m!1311973))

(declare-fun m!1311977 () Bool)

(assert (=> b!1421250 m!1311977))

(assert (=> b!1421250 m!1311977))

(assert (=> b!1421250 m!1311973))

(declare-fun m!1311979 () Bool)

(assert (=> b!1421250 m!1311979))

(declare-fun m!1311981 () Bool)

(assert (=> start!122796 m!1311981))

(declare-fun m!1311983 () Bool)

(assert (=> start!122796 m!1311983))

(declare-fun m!1311985 () Bool)

(assert (=> b!1421248 m!1311985))

(declare-fun m!1311987 () Bool)

(assert (=> b!1421249 m!1311987))

(assert (=> b!1421249 m!1311987))

(declare-fun m!1311989 () Bool)

(assert (=> b!1421249 m!1311989))

(declare-fun m!1311991 () Bool)

(assert (=> b!1421243 m!1311991))

(push 1)

(assert (not start!122796))

(assert (not b!1421244))

(assert (not b!1421247))

(assert (not b!1421249))

(assert (not b!1421243))

(assert (not b!1421248))

(assert (not b!1421250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

