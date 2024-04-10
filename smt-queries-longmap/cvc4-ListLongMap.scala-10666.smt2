; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125138 () Bool)

(assert start!125138)

(declare-fun b!1458198 () Bool)

(declare-fun e!820237 () Bool)

(declare-fun e!820238 () Bool)

(assert (=> b!1458198 (= e!820237 e!820238)))

(declare-fun res!988370 () Bool)

(assert (=> b!1458198 (=> (not res!988370) (not e!820238))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11833 0))(
  ( (MissingZero!11833 (index!49724 (_ BitVec 32))) (Found!11833 (index!49725 (_ BitVec 32))) (Intermediate!11833 (undefined!12645 Bool) (index!49726 (_ BitVec 32)) (x!131338 (_ BitVec 32))) (Undefined!11833) (MissingVacant!11833 (index!49727 (_ BitVec 32))) )
))
(declare-fun lt!638956 () SeekEntryResult!11833)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458198 (= res!988370 (= lt!638956 (Intermediate!11833 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!638957 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98586 0))(
  ( (array!98587 (arr!47581 (Array (_ BitVec 32) (_ BitVec 64))) (size!48131 (_ BitVec 32))) )
))
(declare-fun lt!638955 () array!98586)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98586 (_ BitVec 32)) SeekEntryResult!11833)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458198 (= lt!638956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638957 mask!2687) lt!638957 lt!638955 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98586)

(assert (=> b!1458198 (= lt!638957 (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458199 () Bool)

(declare-fun res!988371 () Bool)

(declare-fun e!820233 () Bool)

(assert (=> b!1458199 (=> (not res!988371) (not e!820233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458199 (= res!988371 (validKeyInArray!0 (select (arr!47581 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!820240 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1458200 () Bool)

(assert (=> b!1458200 (= e!820240 (and (or (= (select (arr!47581 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47581 a!2862) intermediateBeforeIndex!19) (select (arr!47581 a!2862) j!93))) (let ((bdg!53401 (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47581 a!2862) index!646) bdg!53401) (= (select (arr!47581 a!2862) index!646) (select (arr!47581 a!2862) j!93))) (= (select (arr!47581 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53401 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458201 () Bool)

(declare-fun res!988373 () Bool)

(declare-fun e!820241 () Bool)

(assert (=> b!1458201 (=> res!988373 e!820241)))

(declare-fun lt!638958 () (_ BitVec 32))

(declare-fun lt!638961 () SeekEntryResult!11833)

(assert (=> b!1458201 (= res!988373 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638958 (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!638961)))))

(declare-fun b!1458202 () Bool)

(declare-fun res!988367 () Bool)

(assert (=> b!1458202 (=> (not res!988367) (not e!820238))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458202 (= res!988367 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!638954 () SeekEntryResult!11833)

(declare-fun b!1458203 () Bool)

(declare-fun e!820234 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98586 (_ BitVec 32)) SeekEntryResult!11833)

(assert (=> b!1458203 (= e!820234 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638958 intermediateAfterIndex!19 lt!638957 lt!638955 mask!2687) lt!638954)))))

(declare-fun b!1458204 () Bool)

(declare-fun res!988361 () Bool)

(assert (=> b!1458204 (=> (not res!988361) (not e!820233))))

(assert (=> b!1458204 (= res!988361 (validKeyInArray!0 (select (arr!47581 a!2862) j!93)))))

(declare-fun b!1458205 () Bool)

(declare-fun res!988365 () Bool)

(assert (=> b!1458205 (=> (not res!988365) (not e!820233))))

(declare-datatypes ((List!34082 0))(
  ( (Nil!34079) (Cons!34078 (h!35428 (_ BitVec 64)) (t!48776 List!34082)) )
))
(declare-fun arrayNoDuplicates!0 (array!98586 (_ BitVec 32) List!34082) Bool)

(assert (=> b!1458205 (= res!988365 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34079))))

(declare-fun b!1458206 () Bool)

(declare-fun e!820235 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98586 (_ BitVec 32)) SeekEntryResult!11833)

(assert (=> b!1458206 (= e!820235 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638957 lt!638955 mask!2687) (seekEntryOrOpen!0 lt!638957 lt!638955 mask!2687)))))

(declare-fun b!1458207 () Bool)

(declare-fun e!820239 () Bool)

(assert (=> b!1458207 (= e!820238 (not e!820239))))

(declare-fun res!988364 () Bool)

(assert (=> b!1458207 (=> res!988364 e!820239)))

(assert (=> b!1458207 (= res!988364 (or (and (= (select (arr!47581 a!2862) index!646) (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47581 a!2862) index!646) (select (arr!47581 a!2862) j!93))) (= (select (arr!47581 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458207 e!820240))

(declare-fun res!988375 () Bool)

(assert (=> b!1458207 (=> (not res!988375) (not e!820240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98586 (_ BitVec 32)) Bool)

(assert (=> b!1458207 (= res!988375 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49162 0))(
  ( (Unit!49163) )
))
(declare-fun lt!638960 () Unit!49162)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49162)

(assert (=> b!1458207 (= lt!638960 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458208 () Bool)

(declare-fun res!988378 () Bool)

(assert (=> b!1458208 (=> (not res!988378) (not e!820233))))

(assert (=> b!1458208 (= res!988378 (and (= (size!48131 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48131 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48131 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458209 () Bool)

(declare-fun res!988366 () Bool)

(assert (=> b!1458209 (=> (not res!988366) (not e!820233))))

(assert (=> b!1458209 (= res!988366 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48131 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48131 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48131 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458210 () Bool)

(assert (=> b!1458210 (= e!820234 (not (= lt!638956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638958 lt!638957 lt!638955 mask!2687))))))

(declare-fun b!1458211 () Bool)

(assert (=> b!1458211 (= e!820235 (= lt!638956 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638957 lt!638955 mask!2687)))))

(declare-fun b!1458212 () Bool)

(declare-fun res!988372 () Bool)

(assert (=> b!1458212 (=> (not res!988372) (not e!820237))))

(assert (=> b!1458212 (= res!988372 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!638961))))

(declare-fun b!1458213 () Bool)

(declare-fun res!988362 () Bool)

(assert (=> b!1458213 (=> (not res!988362) (not e!820233))))

(assert (=> b!1458213 (= res!988362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458214 () Bool)

(assert (=> b!1458214 (= e!820241 true)))

(declare-fun lt!638959 () Bool)

(assert (=> b!1458214 (= lt!638959 e!820234)))

(declare-fun c!134430 () Bool)

(assert (=> b!1458214 (= c!134430 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458215 () Bool)

(declare-fun e!820232 () Bool)

(assert (=> b!1458215 (= e!820232 e!820237)))

(declare-fun res!988374 () Bool)

(assert (=> b!1458215 (=> (not res!988374) (not e!820237))))

(assert (=> b!1458215 (= res!988374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47581 a!2862) j!93) mask!2687) (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!638961))))

(assert (=> b!1458215 (= lt!638961 (Intermediate!11833 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458216 () Bool)

(declare-fun res!988377 () Bool)

(assert (=> b!1458216 (=> (not res!988377) (not e!820240))))

(assert (=> b!1458216 (= res!988377 (= (seekEntryOrOpen!0 (select (arr!47581 a!2862) j!93) a!2862 mask!2687) (Found!11833 j!93)))))

(declare-fun res!988363 () Bool)

(assert (=> start!125138 (=> (not res!988363) (not e!820233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125138 (= res!988363 (validMask!0 mask!2687))))

(assert (=> start!125138 e!820233))

(assert (=> start!125138 true))

(declare-fun array_inv!36609 (array!98586) Bool)

(assert (=> start!125138 (array_inv!36609 a!2862)))

(declare-fun b!1458217 () Bool)

(assert (=> b!1458217 (= e!820239 e!820241)))

(declare-fun res!988369 () Bool)

(assert (=> b!1458217 (=> res!988369 e!820241)))

(assert (=> b!1458217 (= res!988369 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638958 #b00000000000000000000000000000000) (bvsge lt!638958 (size!48131 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458217 (= lt!638958 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458217 (= lt!638954 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638957 lt!638955 mask!2687))))

(assert (=> b!1458217 (= lt!638954 (seekEntryOrOpen!0 lt!638957 lt!638955 mask!2687))))

(declare-fun b!1458218 () Bool)

(declare-fun res!988368 () Bool)

(assert (=> b!1458218 (=> (not res!988368) (not e!820238))))

(assert (=> b!1458218 (= res!988368 e!820235)))

(declare-fun c!134429 () Bool)

(assert (=> b!1458218 (= c!134429 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458219 () Bool)

(assert (=> b!1458219 (= e!820233 e!820232)))

(declare-fun res!988376 () Bool)

(assert (=> b!1458219 (=> (not res!988376) (not e!820232))))

(assert (=> b!1458219 (= res!988376 (= (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458219 (= lt!638955 (array!98587 (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48131 a!2862)))))

(assert (= (and start!125138 res!988363) b!1458208))

(assert (= (and b!1458208 res!988378) b!1458199))

(assert (= (and b!1458199 res!988371) b!1458204))

(assert (= (and b!1458204 res!988361) b!1458213))

(assert (= (and b!1458213 res!988362) b!1458205))

(assert (= (and b!1458205 res!988365) b!1458209))

(assert (= (and b!1458209 res!988366) b!1458219))

(assert (= (and b!1458219 res!988376) b!1458215))

(assert (= (and b!1458215 res!988374) b!1458212))

(assert (= (and b!1458212 res!988372) b!1458198))

(assert (= (and b!1458198 res!988370) b!1458218))

(assert (= (and b!1458218 c!134429) b!1458211))

(assert (= (and b!1458218 (not c!134429)) b!1458206))

(assert (= (and b!1458218 res!988368) b!1458202))

(assert (= (and b!1458202 res!988367) b!1458207))

(assert (= (and b!1458207 res!988375) b!1458216))

(assert (= (and b!1458216 res!988377) b!1458200))

(assert (= (and b!1458207 (not res!988364)) b!1458217))

(assert (= (and b!1458217 (not res!988369)) b!1458201))

(assert (= (and b!1458201 (not res!988373)) b!1458214))

(assert (= (and b!1458214 c!134430) b!1458210))

(assert (= (and b!1458214 (not c!134430)) b!1458203))

(declare-fun m!1346085 () Bool)

(assert (=> b!1458210 m!1346085))

(declare-fun m!1346087 () Bool)

(assert (=> b!1458203 m!1346087))

(declare-fun m!1346089 () Bool)

(assert (=> b!1458207 m!1346089))

(declare-fun m!1346091 () Bool)

(assert (=> b!1458207 m!1346091))

(declare-fun m!1346093 () Bool)

(assert (=> b!1458207 m!1346093))

(declare-fun m!1346095 () Bool)

(assert (=> b!1458207 m!1346095))

(declare-fun m!1346097 () Bool)

(assert (=> b!1458207 m!1346097))

(declare-fun m!1346099 () Bool)

(assert (=> b!1458207 m!1346099))

(assert (=> b!1458212 m!1346099))

(assert (=> b!1458212 m!1346099))

(declare-fun m!1346101 () Bool)

(assert (=> b!1458212 m!1346101))

(declare-fun m!1346103 () Bool)

(assert (=> b!1458198 m!1346103))

(assert (=> b!1458198 m!1346103))

(declare-fun m!1346105 () Bool)

(assert (=> b!1458198 m!1346105))

(assert (=> b!1458198 m!1346091))

(declare-fun m!1346107 () Bool)

(assert (=> b!1458198 m!1346107))

(assert (=> b!1458200 m!1346091))

(declare-fun m!1346109 () Bool)

(assert (=> b!1458200 m!1346109))

(assert (=> b!1458200 m!1346093))

(assert (=> b!1458200 m!1346095))

(assert (=> b!1458200 m!1346099))

(assert (=> b!1458204 m!1346099))

(assert (=> b!1458204 m!1346099))

(declare-fun m!1346111 () Bool)

(assert (=> b!1458204 m!1346111))

(declare-fun m!1346113 () Bool)

(assert (=> b!1458211 m!1346113))

(assert (=> b!1458215 m!1346099))

(assert (=> b!1458215 m!1346099))

(declare-fun m!1346115 () Bool)

(assert (=> b!1458215 m!1346115))

(assert (=> b!1458215 m!1346115))

(assert (=> b!1458215 m!1346099))

(declare-fun m!1346117 () Bool)

(assert (=> b!1458215 m!1346117))

(assert (=> b!1458201 m!1346099))

(assert (=> b!1458201 m!1346099))

(declare-fun m!1346119 () Bool)

(assert (=> b!1458201 m!1346119))

(assert (=> b!1458219 m!1346091))

(declare-fun m!1346121 () Bool)

(assert (=> b!1458219 m!1346121))

(assert (=> b!1458216 m!1346099))

(assert (=> b!1458216 m!1346099))

(declare-fun m!1346123 () Bool)

(assert (=> b!1458216 m!1346123))

(declare-fun m!1346125 () Bool)

(assert (=> b!1458217 m!1346125))

(declare-fun m!1346127 () Bool)

(assert (=> b!1458217 m!1346127))

(declare-fun m!1346129 () Bool)

(assert (=> b!1458217 m!1346129))

(assert (=> b!1458206 m!1346127))

(assert (=> b!1458206 m!1346129))

(declare-fun m!1346131 () Bool)

(assert (=> b!1458213 m!1346131))

(declare-fun m!1346133 () Bool)

(assert (=> b!1458205 m!1346133))

(declare-fun m!1346135 () Bool)

(assert (=> start!125138 m!1346135))

(declare-fun m!1346137 () Bool)

(assert (=> start!125138 m!1346137))

(declare-fun m!1346139 () Bool)

(assert (=> b!1458199 m!1346139))

(assert (=> b!1458199 m!1346139))

(declare-fun m!1346141 () Bool)

(assert (=> b!1458199 m!1346141))

(push 1)

