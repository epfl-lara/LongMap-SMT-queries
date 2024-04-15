; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123074 () Bool)

(assert start!123074)

(declare-fun b!1427190 () Bool)

(declare-fun e!806128 () Bool)

(declare-fun e!806127 () Bool)

(assert (=> b!1427190 (= e!806128 e!806127)))

(declare-fun res!962275 () Bool)

(assert (=> b!1427190 (=> (not res!962275) (not e!806127))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97290 0))(
  ( (array!97291 (arr!46960 (Array (_ BitVec 32) (_ BitVec 64))) (size!47512 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97290)

(declare-datatypes ((SeekEntryResult!11266 0))(
  ( (MissingZero!11266 (index!47456 (_ BitVec 32))) (Found!11266 (index!47457 (_ BitVec 32))) (Intermediate!11266 (undefined!12078 Bool) (index!47458 (_ BitVec 32)) (x!129085 (_ BitVec 32))) (Undefined!11266) (MissingVacant!11266 (index!47459 (_ BitVec 32))) )
))
(declare-fun lt!628318 () SeekEntryResult!11266)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97290 (_ BitVec 32)) SeekEntryResult!11266)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427190 (= res!962275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46960 a!2831) j!81) mask!2608) (select (arr!46960 a!2831) j!81) a!2831 mask!2608) lt!628318))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427190 (= lt!628318 (Intermediate!11266 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427191 () Bool)

(declare-fun res!962284 () Bool)

(assert (=> b!1427191 (=> (not res!962284) (not e!806128))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427191 (= res!962284 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47512 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47512 a!2831))))))

(declare-fun b!1427192 () Bool)

(declare-fun res!962278 () Bool)

(assert (=> b!1427192 (=> (not res!962278) (not e!806128))))

(declare-datatypes ((List!33548 0))(
  ( (Nil!33545) (Cons!33544 (h!34852 (_ BitVec 64)) (t!48234 List!33548)) )
))
(declare-fun arrayNoDuplicates!0 (array!97290 (_ BitVec 32) List!33548) Bool)

(assert (=> b!1427192 (= res!962278 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33545))))

(declare-fun b!1427193 () Bool)

(declare-fun res!962273 () Bool)

(assert (=> b!1427193 (=> (not res!962273) (not e!806128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97290 (_ BitVec 32)) Bool)

(assert (=> b!1427193 (= res!962273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427194 () Bool)

(declare-fun res!962277 () Bool)

(assert (=> b!1427194 (=> (not res!962277) (not e!806128))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427194 (= res!962277 (validKeyInArray!0 (select (arr!46960 a!2831) i!982)))))

(declare-fun res!962281 () Bool)

(assert (=> start!123074 (=> (not res!962281) (not e!806128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123074 (= res!962281 (validMask!0 mask!2608))))

(assert (=> start!123074 e!806128))

(assert (=> start!123074 true))

(declare-fun array_inv!36193 (array!97290) Bool)

(assert (=> start!123074 (array_inv!36193 a!2831)))

(declare-fun b!1427195 () Bool)

(declare-fun res!962276 () Bool)

(declare-fun e!806129 () Bool)

(assert (=> b!1427195 (=> (not res!962276) (not e!806129))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427195 (= res!962276 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427196 () Bool)

(declare-fun res!962272 () Bool)

(assert (=> b!1427196 (=> (not res!962272) (not e!806128))))

(assert (=> b!1427196 (= res!962272 (validKeyInArray!0 (select (arr!46960 a!2831) j!81)))))

(declare-fun b!1427197 () Bool)

(declare-fun res!962283 () Bool)

(assert (=> b!1427197 (=> (not res!962283) (not e!806129))))

(declare-fun lt!628319 () array!97290)

(declare-fun lt!628316 () SeekEntryResult!11266)

(declare-fun lt!628317 () (_ BitVec 64))

(assert (=> b!1427197 (= res!962283 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628317 lt!628319 mask!2608) lt!628316))))

(declare-fun b!1427198 () Bool)

(declare-fun e!806125 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97290 (_ BitVec 32)) SeekEntryResult!11266)

(assert (=> b!1427198 (= e!806125 (= (seekEntryOrOpen!0 (select (arr!46960 a!2831) j!81) a!2831 mask!2608) (Found!11266 j!81)))))

(declare-fun b!1427199 () Bool)

(assert (=> b!1427199 (= e!806129 (not true))))

(assert (=> b!1427199 e!806125))

(declare-fun res!962282 () Bool)

(assert (=> b!1427199 (=> (not res!962282) (not e!806125))))

(assert (=> b!1427199 (= res!962282 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48117 0))(
  ( (Unit!48118) )
))
(declare-fun lt!628315 () Unit!48117)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48117)

(assert (=> b!1427199 (= lt!628315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427200 () Bool)

(declare-fun res!962280 () Bool)

(assert (=> b!1427200 (=> (not res!962280) (not e!806128))))

(assert (=> b!1427200 (= res!962280 (and (= (size!47512 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47512 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47512 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427201 () Bool)

(assert (=> b!1427201 (= e!806127 e!806129)))

(declare-fun res!962274 () Bool)

(assert (=> b!1427201 (=> (not res!962274) (not e!806129))))

(assert (=> b!1427201 (= res!962274 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628317 mask!2608) lt!628317 lt!628319 mask!2608) lt!628316))))

(assert (=> b!1427201 (= lt!628316 (Intermediate!11266 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427201 (= lt!628317 (select (store (arr!46960 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427201 (= lt!628319 (array!97291 (store (arr!46960 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47512 a!2831)))))

(declare-fun b!1427202 () Bool)

(declare-fun res!962279 () Bool)

(assert (=> b!1427202 (=> (not res!962279) (not e!806129))))

(assert (=> b!1427202 (= res!962279 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46960 a!2831) j!81) a!2831 mask!2608) lt!628318))))

(assert (= (and start!123074 res!962281) b!1427200))

(assert (= (and b!1427200 res!962280) b!1427194))

(assert (= (and b!1427194 res!962277) b!1427196))

(assert (= (and b!1427196 res!962272) b!1427193))

(assert (= (and b!1427193 res!962273) b!1427192))

(assert (= (and b!1427192 res!962278) b!1427191))

(assert (= (and b!1427191 res!962284) b!1427190))

(assert (= (and b!1427190 res!962275) b!1427201))

(assert (= (and b!1427201 res!962274) b!1427202))

(assert (= (and b!1427202 res!962279) b!1427197))

(assert (= (and b!1427197 res!962283) b!1427195))

(assert (= (and b!1427195 res!962276) b!1427199))

(assert (= (and b!1427199 res!962282) b!1427198))

(declare-fun m!1317093 () Bool)

(assert (=> start!123074 m!1317093))

(declare-fun m!1317095 () Bool)

(assert (=> start!123074 m!1317095))

(declare-fun m!1317097 () Bool)

(assert (=> b!1427193 m!1317097))

(declare-fun m!1317099 () Bool)

(assert (=> b!1427190 m!1317099))

(assert (=> b!1427190 m!1317099))

(declare-fun m!1317101 () Bool)

(assert (=> b!1427190 m!1317101))

(assert (=> b!1427190 m!1317101))

(assert (=> b!1427190 m!1317099))

(declare-fun m!1317103 () Bool)

(assert (=> b!1427190 m!1317103))

(declare-fun m!1317105 () Bool)

(assert (=> b!1427194 m!1317105))

(assert (=> b!1427194 m!1317105))

(declare-fun m!1317107 () Bool)

(assert (=> b!1427194 m!1317107))

(assert (=> b!1427198 m!1317099))

(assert (=> b!1427198 m!1317099))

(declare-fun m!1317109 () Bool)

(assert (=> b!1427198 m!1317109))

(assert (=> b!1427202 m!1317099))

(assert (=> b!1427202 m!1317099))

(declare-fun m!1317111 () Bool)

(assert (=> b!1427202 m!1317111))

(assert (=> b!1427196 m!1317099))

(assert (=> b!1427196 m!1317099))

(declare-fun m!1317113 () Bool)

(assert (=> b!1427196 m!1317113))

(declare-fun m!1317115 () Bool)

(assert (=> b!1427192 m!1317115))

(declare-fun m!1317117 () Bool)

(assert (=> b!1427199 m!1317117))

(declare-fun m!1317119 () Bool)

(assert (=> b!1427199 m!1317119))

(declare-fun m!1317121 () Bool)

(assert (=> b!1427197 m!1317121))

(declare-fun m!1317123 () Bool)

(assert (=> b!1427201 m!1317123))

(assert (=> b!1427201 m!1317123))

(declare-fun m!1317125 () Bool)

(assert (=> b!1427201 m!1317125))

(declare-fun m!1317127 () Bool)

(assert (=> b!1427201 m!1317127))

(declare-fun m!1317129 () Bool)

(assert (=> b!1427201 m!1317129))

(check-sat (not b!1427196) (not start!123074) (not b!1427199) (not b!1427193) (not b!1427192) (not b!1427202) (not b!1427197) (not b!1427201) (not b!1427198) (not b!1427190) (not b!1427194))
(check-sat)
