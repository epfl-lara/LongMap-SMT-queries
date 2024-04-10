; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126414 () Bool)

(assert start!126414)

(declare-fun b!1482383 () Bool)

(declare-fun e!831269 () Bool)

(declare-fun e!831264 () Bool)

(assert (=> b!1482383 (= e!831269 e!831264)))

(declare-fun res!1007599 () Bool)

(assert (=> b!1482383 (=> (not res!1007599) (not e!831264))))

(declare-datatypes ((SeekEntryResult!12234 0))(
  ( (MissingZero!12234 (index!51328 (_ BitVec 32))) (Found!12234 (index!51329 (_ BitVec 32))) (Intermediate!12234 (undefined!13046 Bool) (index!51330 (_ BitVec 32)) (x!132909 (_ BitVec 32))) (Undefined!12234) (MissingVacant!12234 (index!51331 (_ BitVec 32))) )
))
(declare-fun lt!647054 () SeekEntryResult!12234)

(declare-datatypes ((array!99433 0))(
  ( (array!99434 (arr!47994 (Array (_ BitVec 32) (_ BitVec 64))) (size!48544 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99433)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99433 (_ BitVec 32)) SeekEntryResult!12234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482383 (= res!1007599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47994 a!2862) j!93) mask!2687) (select (arr!47994 a!2862) j!93) a!2862 mask!2687) lt!647054))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482383 (= lt!647054 (Intermediate!12234 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482384 () Bool)

(declare-fun res!1007606 () Bool)

(declare-fun e!831267 () Bool)

(assert (=> b!1482384 (=> (not res!1007606) (not e!831267))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1482384 (= res!1007606 (and (= (size!48544 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48544 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48544 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482385 () Bool)

(assert (=> b!1482385 (= e!831267 e!831269)))

(declare-fun res!1007600 () Bool)

(assert (=> b!1482385 (=> (not res!1007600) (not e!831269))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482385 (= res!1007600 (= (select (store (arr!47994 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647058 () array!99433)

(assert (=> b!1482385 (= lt!647058 (array!99434 (store (arr!47994 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48544 a!2862)))))

(declare-fun b!1482386 () Bool)

(declare-fun res!1007607 () Bool)

(assert (=> b!1482386 (=> (not res!1007607) (not e!831267))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1482386 (= res!1007607 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48544 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48544 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48544 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!647057 () (_ BitVec 64))

(declare-fun lt!647056 () SeekEntryResult!12234)

(declare-fun b!1482387 () Bool)

(declare-fun e!831265 () Bool)

(assert (=> b!1482387 (= e!831265 (= lt!647056 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647057 lt!647058 mask!2687)))))

(declare-fun res!1007602 () Bool)

(assert (=> start!126414 (=> (not res!1007602) (not e!831267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126414 (= res!1007602 (validMask!0 mask!2687))))

(assert (=> start!126414 e!831267))

(assert (=> start!126414 true))

(declare-fun array_inv!37022 (array!99433) Bool)

(assert (=> start!126414 (array_inv!37022 a!2862)))

(declare-fun b!1482388 () Bool)

(declare-fun res!1007597 () Bool)

(assert (=> b!1482388 (=> (not res!1007597) (not e!831267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482388 (= res!1007597 (validKeyInArray!0 (select (arr!47994 a!2862) j!93)))))

(declare-fun b!1482389 () Bool)

(declare-fun res!1007604 () Bool)

(declare-fun e!831263 () Bool)

(assert (=> b!1482389 (=> (not res!1007604) (not e!831263))))

(assert (=> b!1482389 (= res!1007604 e!831265)))

(declare-fun c!136914 () Bool)

(assert (=> b!1482389 (= c!136914 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482390 () Bool)

(declare-fun res!1007608 () Bool)

(assert (=> b!1482390 (=> (not res!1007608) (not e!831267))))

(declare-datatypes ((List!34495 0))(
  ( (Nil!34492) (Cons!34491 (h!35862 (_ BitVec 64)) (t!49189 List!34495)) )
))
(declare-fun arrayNoDuplicates!0 (array!99433 (_ BitVec 32) List!34495) Bool)

(assert (=> b!1482390 (= res!1007608 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34492))))

(declare-fun b!1482391 () Bool)

(declare-fun res!1007610 () Bool)

(assert (=> b!1482391 (=> (not res!1007610) (not e!831264))))

(assert (=> b!1482391 (= res!1007610 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47994 a!2862) j!93) a!2862 mask!2687) lt!647054))))

(declare-fun b!1482392 () Bool)

(assert (=> b!1482392 (= e!831264 e!831263)))

(declare-fun res!1007609 () Bool)

(assert (=> b!1482392 (=> (not res!1007609) (not e!831263))))

(assert (=> b!1482392 (= res!1007609 (= lt!647056 (Intermediate!12234 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482392 (= lt!647056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647057 mask!2687) lt!647057 lt!647058 mask!2687))))

(assert (=> b!1482392 (= lt!647057 (select (store (arr!47994 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482393 () Bool)

(declare-fun res!1007605 () Bool)

(assert (=> b!1482393 (=> (not res!1007605) (not e!831267))))

(assert (=> b!1482393 (= res!1007605 (validKeyInArray!0 (select (arr!47994 a!2862) i!1006)))))

(declare-fun b!1482394 () Bool)

(declare-fun e!831268 () Bool)

(assert (=> b!1482394 (= e!831268 (and (or (= (select (arr!47994 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47994 a!2862) intermediateBeforeIndex!19) (select (arr!47994 a!2862) j!93))) (or (and (= (select (arr!47994 a!2862) index!646) (select (store (arr!47994 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47994 a!2862) index!646) (select (arr!47994 a!2862) j!93))) (= (select (arr!47994 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47994 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1482395 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99433 (_ BitVec 32)) SeekEntryResult!12234)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99433 (_ BitVec 32)) SeekEntryResult!12234)

(assert (=> b!1482395 (= e!831265 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647057 lt!647058 mask!2687) (seekEntryOrOpen!0 lt!647057 lt!647058 mask!2687)))))

(declare-fun b!1482396 () Bool)

(declare-fun res!1007601 () Bool)

(assert (=> b!1482396 (=> (not res!1007601) (not e!831263))))

(assert (=> b!1482396 (= res!1007601 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482397 () Bool)

(assert (=> b!1482397 (= e!831263 (not true))))

(assert (=> b!1482397 e!831268))

(declare-fun res!1007603 () Bool)

(assert (=> b!1482397 (=> (not res!1007603) (not e!831268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99433 (_ BitVec 32)) Bool)

(assert (=> b!1482397 (= res!1007603 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49808 0))(
  ( (Unit!49809) )
))
(declare-fun lt!647055 () Unit!49808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49808)

(assert (=> b!1482397 (= lt!647055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482398 () Bool)

(declare-fun res!1007611 () Bool)

(assert (=> b!1482398 (=> (not res!1007611) (not e!831267))))

(assert (=> b!1482398 (= res!1007611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482399 () Bool)

(declare-fun res!1007598 () Bool)

(assert (=> b!1482399 (=> (not res!1007598) (not e!831268))))

(assert (=> b!1482399 (= res!1007598 (= (seekEntryOrOpen!0 (select (arr!47994 a!2862) j!93) a!2862 mask!2687) (Found!12234 j!93)))))

(assert (= (and start!126414 res!1007602) b!1482384))

(assert (= (and b!1482384 res!1007606) b!1482393))

(assert (= (and b!1482393 res!1007605) b!1482388))

(assert (= (and b!1482388 res!1007597) b!1482398))

(assert (= (and b!1482398 res!1007611) b!1482390))

(assert (= (and b!1482390 res!1007608) b!1482386))

(assert (= (and b!1482386 res!1007607) b!1482385))

(assert (= (and b!1482385 res!1007600) b!1482383))

(assert (= (and b!1482383 res!1007599) b!1482391))

(assert (= (and b!1482391 res!1007610) b!1482392))

(assert (= (and b!1482392 res!1007609) b!1482389))

(assert (= (and b!1482389 c!136914) b!1482387))

(assert (= (and b!1482389 (not c!136914)) b!1482395))

(assert (= (and b!1482389 res!1007604) b!1482396))

(assert (= (and b!1482396 res!1007601) b!1482397))

(assert (= (and b!1482397 res!1007603) b!1482399))

(assert (= (and b!1482399 res!1007598) b!1482394))

(declare-fun m!1368105 () Bool)

(assert (=> b!1482387 m!1368105))

(declare-fun m!1368107 () Bool)

(assert (=> b!1482399 m!1368107))

(assert (=> b!1482399 m!1368107))

(declare-fun m!1368109 () Bool)

(assert (=> b!1482399 m!1368109))

(assert (=> b!1482388 m!1368107))

(assert (=> b!1482388 m!1368107))

(declare-fun m!1368111 () Bool)

(assert (=> b!1482388 m!1368111))

(assert (=> b!1482383 m!1368107))

(assert (=> b!1482383 m!1368107))

(declare-fun m!1368113 () Bool)

(assert (=> b!1482383 m!1368113))

(assert (=> b!1482383 m!1368113))

(assert (=> b!1482383 m!1368107))

(declare-fun m!1368115 () Bool)

(assert (=> b!1482383 m!1368115))

(assert (=> b!1482391 m!1368107))

(assert (=> b!1482391 m!1368107))

(declare-fun m!1368117 () Bool)

(assert (=> b!1482391 m!1368117))

(declare-fun m!1368119 () Bool)

(assert (=> b!1482394 m!1368119))

(declare-fun m!1368121 () Bool)

(assert (=> b!1482394 m!1368121))

(declare-fun m!1368123 () Bool)

(assert (=> b!1482394 m!1368123))

(declare-fun m!1368125 () Bool)

(assert (=> b!1482394 m!1368125))

(assert (=> b!1482394 m!1368107))

(declare-fun m!1368127 () Bool)

(assert (=> b!1482398 m!1368127))

(declare-fun m!1368129 () Bool)

(assert (=> b!1482397 m!1368129))

(declare-fun m!1368131 () Bool)

(assert (=> b!1482397 m!1368131))

(declare-fun m!1368133 () Bool)

(assert (=> b!1482390 m!1368133))

(declare-fun m!1368135 () Bool)

(assert (=> start!126414 m!1368135))

(declare-fun m!1368137 () Bool)

(assert (=> start!126414 m!1368137))

(assert (=> b!1482385 m!1368119))

(declare-fun m!1368139 () Bool)

(assert (=> b!1482385 m!1368139))

(declare-fun m!1368141 () Bool)

(assert (=> b!1482392 m!1368141))

(assert (=> b!1482392 m!1368141))

(declare-fun m!1368143 () Bool)

(assert (=> b!1482392 m!1368143))

(assert (=> b!1482392 m!1368119))

(declare-fun m!1368145 () Bool)

(assert (=> b!1482392 m!1368145))

(declare-fun m!1368147 () Bool)

(assert (=> b!1482395 m!1368147))

(declare-fun m!1368149 () Bool)

(assert (=> b!1482395 m!1368149))

(declare-fun m!1368151 () Bool)

(assert (=> b!1482393 m!1368151))

(assert (=> b!1482393 m!1368151))

(declare-fun m!1368153 () Bool)

(assert (=> b!1482393 m!1368153))

(check-sat (not b!1482399) (not b!1482398) (not b!1482383) (not b!1482390) (not b!1482395) (not b!1482393) (not b!1482392) (not b!1482387) (not b!1482397) (not start!126414) (not b!1482391) (not b!1482388))
(check-sat)
