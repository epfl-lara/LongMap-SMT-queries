; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123166 () Bool)

(assert start!123166)

(declare-fun b!1428243 () Bool)

(declare-fun res!963077 () Bool)

(declare-fun e!806608 () Bool)

(assert (=> b!1428243 (=> (not res!963077) (not e!806608))))

(declare-datatypes ((array!97378 0))(
  ( (array!97379 (arr!47002 (Array (_ BitVec 32) (_ BitVec 64))) (size!47552 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97378)

(declare-datatypes ((List!33512 0))(
  ( (Nil!33509) (Cons!33508 (h!34819 (_ BitVec 64)) (t!48206 List!33512)) )
))
(declare-fun arrayNoDuplicates!0 (array!97378 (_ BitVec 32) List!33512) Bool)

(assert (=> b!1428243 (= res!963077 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33509))))

(declare-fun res!963076 () Bool)

(assert (=> start!123166 (=> (not res!963076) (not e!806608))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123166 (= res!963076 (validMask!0 mask!2608))))

(assert (=> start!123166 e!806608))

(assert (=> start!123166 true))

(declare-fun array_inv!36030 (array!97378) Bool)

(assert (=> start!123166 (array_inv!36030 a!2831)))

(declare-fun b!1428244 () Bool)

(declare-fun res!963081 () Bool)

(declare-fun e!806610 () Bool)

(assert (=> b!1428244 (=> (not res!963081) (not e!806610))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11281 0))(
  ( (MissingZero!11281 (index!47516 (_ BitVec 32))) (Found!11281 (index!47517 (_ BitVec 32))) (Intermediate!11281 (undefined!12093 Bool) (index!47518 (_ BitVec 32)) (x!129149 (_ BitVec 32))) (Undefined!11281) (MissingVacant!11281 (index!47519 (_ BitVec 32))) )
))
(declare-fun lt!628892 () SeekEntryResult!11281)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97378 (_ BitVec 32)) SeekEntryResult!11281)

(assert (=> b!1428244 (= res!963081 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47002 a!2831) j!81) a!2831 mask!2608) lt!628892))))

(declare-fun b!1428245 () Bool)

(declare-fun res!963074 () Bool)

(assert (=> b!1428245 (=> (not res!963074) (not e!806608))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428245 (= res!963074 (and (= (size!47552 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47552 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47552 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428246 () Bool)

(declare-fun res!963085 () Bool)

(assert (=> b!1428246 (=> (not res!963085) (not e!806608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428246 (= res!963085 (validKeyInArray!0 (select (arr!47002 a!2831) j!81)))))

(declare-fun b!1428247 () Bool)

(declare-fun e!806612 () Bool)

(assert (=> b!1428247 (= e!806608 e!806612)))

(declare-fun res!963079 () Bool)

(assert (=> b!1428247 (=> (not res!963079) (not e!806612))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428247 (= res!963079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47002 a!2831) j!81) mask!2608) (select (arr!47002 a!2831) j!81) a!2831 mask!2608) lt!628892))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428247 (= lt!628892 (Intermediate!11281 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428248 () Bool)

(assert (=> b!1428248 (= e!806610 (not true))))

(declare-fun e!806611 () Bool)

(assert (=> b!1428248 e!806611))

(declare-fun res!963082 () Bool)

(assert (=> b!1428248 (=> (not res!963082) (not e!806611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97378 (_ BitVec 32)) Bool)

(assert (=> b!1428248 (= res!963082 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48308 0))(
  ( (Unit!48309) )
))
(declare-fun lt!628894 () Unit!48308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48308)

(assert (=> b!1428248 (= lt!628894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428249 () Bool)

(assert (=> b!1428249 (= e!806612 e!806610)))

(declare-fun res!963083 () Bool)

(assert (=> b!1428249 (=> (not res!963083) (not e!806610))))

(declare-fun lt!628895 () (_ BitVec 64))

(declare-fun lt!628893 () array!97378)

(declare-fun lt!628896 () SeekEntryResult!11281)

(assert (=> b!1428249 (= res!963083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628895 mask!2608) lt!628895 lt!628893 mask!2608) lt!628896))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1428249 (= lt!628896 (Intermediate!11281 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428249 (= lt!628895 (select (store (arr!47002 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428249 (= lt!628893 (array!97379 (store (arr!47002 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47552 a!2831)))))

(declare-fun b!1428250 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97378 (_ BitVec 32)) SeekEntryResult!11281)

(assert (=> b!1428250 (= e!806611 (= (seekEntryOrOpen!0 (select (arr!47002 a!2831) j!81) a!2831 mask!2608) (Found!11281 j!81)))))

(declare-fun b!1428251 () Bool)

(declare-fun res!963078 () Bool)

(assert (=> b!1428251 (=> (not res!963078) (not e!806608))))

(assert (=> b!1428251 (= res!963078 (validKeyInArray!0 (select (arr!47002 a!2831) i!982)))))

(declare-fun b!1428252 () Bool)

(declare-fun res!963075 () Bool)

(assert (=> b!1428252 (=> (not res!963075) (not e!806610))))

(assert (=> b!1428252 (= res!963075 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628895 lt!628893 mask!2608) lt!628896))))

(declare-fun b!1428253 () Bool)

(declare-fun res!963080 () Bool)

(assert (=> b!1428253 (=> (not res!963080) (not e!806608))))

(assert (=> b!1428253 (= res!963080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428254 () Bool)

(declare-fun res!963073 () Bool)

(assert (=> b!1428254 (=> (not res!963073) (not e!806608))))

(assert (=> b!1428254 (= res!963073 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47552 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47552 a!2831))))))

(declare-fun b!1428255 () Bool)

(declare-fun res!963084 () Bool)

(assert (=> b!1428255 (=> (not res!963084) (not e!806610))))

(assert (=> b!1428255 (= res!963084 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123166 res!963076) b!1428245))

(assert (= (and b!1428245 res!963074) b!1428251))

(assert (= (and b!1428251 res!963078) b!1428246))

(assert (= (and b!1428246 res!963085) b!1428253))

(assert (= (and b!1428253 res!963080) b!1428243))

(assert (= (and b!1428243 res!963077) b!1428254))

(assert (= (and b!1428254 res!963073) b!1428247))

(assert (= (and b!1428247 res!963079) b!1428249))

(assert (= (and b!1428249 res!963083) b!1428244))

(assert (= (and b!1428244 res!963081) b!1428252))

(assert (= (and b!1428252 res!963075) b!1428255))

(assert (= (and b!1428255 res!963084) b!1428248))

(assert (= (and b!1428248 res!963082) b!1428250))

(declare-fun m!1318483 () Bool)

(assert (=> b!1428250 m!1318483))

(assert (=> b!1428250 m!1318483))

(declare-fun m!1318485 () Bool)

(assert (=> b!1428250 m!1318485))

(declare-fun m!1318487 () Bool)

(assert (=> b!1428249 m!1318487))

(assert (=> b!1428249 m!1318487))

(declare-fun m!1318489 () Bool)

(assert (=> b!1428249 m!1318489))

(declare-fun m!1318491 () Bool)

(assert (=> b!1428249 m!1318491))

(declare-fun m!1318493 () Bool)

(assert (=> b!1428249 m!1318493))

(declare-fun m!1318495 () Bool)

(assert (=> start!123166 m!1318495))

(declare-fun m!1318497 () Bool)

(assert (=> start!123166 m!1318497))

(assert (=> b!1428246 m!1318483))

(assert (=> b!1428246 m!1318483))

(declare-fun m!1318499 () Bool)

(assert (=> b!1428246 m!1318499))

(assert (=> b!1428247 m!1318483))

(assert (=> b!1428247 m!1318483))

(declare-fun m!1318501 () Bool)

(assert (=> b!1428247 m!1318501))

(assert (=> b!1428247 m!1318501))

(assert (=> b!1428247 m!1318483))

(declare-fun m!1318503 () Bool)

(assert (=> b!1428247 m!1318503))

(declare-fun m!1318505 () Bool)

(assert (=> b!1428252 m!1318505))

(declare-fun m!1318507 () Bool)

(assert (=> b!1428253 m!1318507))

(declare-fun m!1318509 () Bool)

(assert (=> b!1428251 m!1318509))

(assert (=> b!1428251 m!1318509))

(declare-fun m!1318511 () Bool)

(assert (=> b!1428251 m!1318511))

(declare-fun m!1318513 () Bool)

(assert (=> b!1428243 m!1318513))

(declare-fun m!1318515 () Bool)

(assert (=> b!1428248 m!1318515))

(declare-fun m!1318517 () Bool)

(assert (=> b!1428248 m!1318517))

(assert (=> b!1428244 m!1318483))

(assert (=> b!1428244 m!1318483))

(declare-fun m!1318519 () Bool)

(assert (=> b!1428244 m!1318519))

(push 1)

