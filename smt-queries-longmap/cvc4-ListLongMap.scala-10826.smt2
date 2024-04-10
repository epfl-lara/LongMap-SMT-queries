; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126674 () Bool)

(assert start!126674)

(declare-fun b!1487331 () Bool)

(declare-fun res!1011598 () Bool)

(declare-fun e!833705 () Bool)

(assert (=> b!1487331 (=> (not res!1011598) (not e!833705))))

(declare-datatypes ((array!99573 0))(
  ( (array!99574 (arr!48061 (Array (_ BitVec 32) (_ BitVec 64))) (size!48611 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99573)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487331 (= res!1011598 (validKeyInArray!0 (select (arr!48061 a!2862) j!93)))))

(declare-fun b!1487332 () Bool)

(declare-fun res!1011603 () Bool)

(assert (=> b!1487332 (=> (not res!1011603) (not e!833705))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487332 (= res!1011603 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48611 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48611 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48611 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487333 () Bool)

(declare-fun e!833707 () Bool)

(declare-fun e!833709 () Bool)

(assert (=> b!1487333 (= e!833707 e!833709)))

(declare-fun res!1011614 () Bool)

(assert (=> b!1487333 (=> res!1011614 e!833709)))

(declare-fun lt!648764 () (_ BitVec 64))

(assert (=> b!1487333 (= res!1011614 (or (and (= (select (arr!48061 a!2862) index!646) lt!648764) (= (select (arr!48061 a!2862) index!646) (select (arr!48061 a!2862) j!93))) (= (select (arr!48061 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1487333 (= lt!648764 (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487334 () Bool)

(declare-fun res!1011613 () Bool)

(declare-fun e!833711 () Bool)

(assert (=> b!1487334 (=> (not res!1011613) (not e!833711))))

(declare-fun e!833703 () Bool)

(assert (=> b!1487334 (= res!1011613 e!833703)))

(declare-fun c!137391 () Bool)

(assert (=> b!1487334 (= c!137391 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487335 () Bool)

(declare-fun e!833702 () Bool)

(assert (=> b!1487335 (= e!833705 e!833702)))

(declare-fun res!1011606 () Bool)

(assert (=> b!1487335 (=> (not res!1011606) (not e!833702))))

(assert (=> b!1487335 (= res!1011606 (= (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648767 () array!99573)

(assert (=> b!1487335 (= lt!648767 (array!99574 (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48611 a!2862)))))

(declare-fun b!1487336 () Bool)

(declare-fun res!1011601 () Bool)

(declare-fun e!833710 () Bool)

(assert (=> b!1487336 (=> (not res!1011601) (not e!833710))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12301 0))(
  ( (MissingZero!12301 (index!51596 (_ BitVec 32))) (Found!12301 (index!51597 (_ BitVec 32))) (Intermediate!12301 (undefined!13113 Bool) (index!51598 (_ BitVec 32)) (x!133173 (_ BitVec 32))) (Undefined!12301) (MissingVacant!12301 (index!51599 (_ BitVec 32))) )
))
(declare-fun lt!648765 () SeekEntryResult!12301)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99573 (_ BitVec 32)) SeekEntryResult!12301)

(assert (=> b!1487336 (= res!1011601 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648765))))

(declare-fun res!1011604 () Bool)

(assert (=> start!126674 (=> (not res!1011604) (not e!833705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126674 (= res!1011604 (validMask!0 mask!2687))))

(assert (=> start!126674 e!833705))

(assert (=> start!126674 true))

(declare-fun array_inv!37089 (array!99573) Bool)

(assert (=> start!126674 (array_inv!37089 a!2862)))

(declare-fun b!1487337 () Bool)

(declare-fun e!833706 () Bool)

(declare-fun e!833701 () Bool)

(assert (=> b!1487337 (= e!833706 e!833701)))

(declare-fun res!1011610 () Bool)

(assert (=> b!1487337 (=> res!1011610 e!833701)))

(declare-fun lt!648766 () (_ BitVec 32))

(assert (=> b!1487337 (= res!1011610 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648766 #b00000000000000000000000000000000) (bvsge lt!648766 (size!48611 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487337 (= lt!648766 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1487338 () Bool)

(assert (=> b!1487338 (= e!833702 e!833710)))

(declare-fun res!1011602 () Bool)

(assert (=> b!1487338 (=> (not res!1011602) (not e!833710))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487338 (= res!1011602 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648765))))

(assert (=> b!1487338 (= lt!648765 (Intermediate!12301 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487339 () Bool)

(declare-fun res!1011599 () Bool)

(assert (=> b!1487339 (=> (not res!1011599) (not e!833705))))

(assert (=> b!1487339 (= res!1011599 (validKeyInArray!0 (select (arr!48061 a!2862) i!1006)))))

(declare-fun b!1487340 () Bool)

(declare-fun res!1011611 () Bool)

(assert (=> b!1487340 (=> (not res!1011611) (not e!833705))))

(assert (=> b!1487340 (= res!1011611 (and (= (size!48611 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48611 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48611 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487341 () Bool)

(declare-fun lt!648768 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99573 (_ BitVec 32)) SeekEntryResult!12301)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99573 (_ BitVec 32)) SeekEntryResult!12301)

(assert (=> b!1487341 (= e!833703 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648768 lt!648767 mask!2687) (seekEntryOrOpen!0 lt!648768 lt!648767 mask!2687)))))

(declare-fun b!1487342 () Bool)

(declare-fun res!1011597 () Bool)

(assert (=> b!1487342 (=> (not res!1011597) (not e!833707))))

(assert (=> b!1487342 (= res!1011597 (= (seekEntryOrOpen!0 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) (Found!12301 j!93)))))

(declare-fun b!1487343 () Bool)

(declare-fun e!833708 () Bool)

(assert (=> b!1487343 (= e!833708 (= (seekEntryOrOpen!0 lt!648768 lt!648767 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648768 lt!648767 mask!2687)))))

(declare-fun b!1487344 () Bool)

(declare-fun res!1011612 () Bool)

(assert (=> b!1487344 (=> (not res!1011612) (not e!833705))))

(declare-datatypes ((List!34562 0))(
  ( (Nil!34559) (Cons!34558 (h!35935 (_ BitVec 64)) (t!49256 List!34562)) )
))
(declare-fun arrayNoDuplicates!0 (array!99573 (_ BitVec 32) List!34562) Bool)

(assert (=> b!1487344 (= res!1011612 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34559))))

(declare-fun b!1487345 () Bool)

(declare-fun res!1011600 () Bool)

(assert (=> b!1487345 (=> (not res!1011600) (not e!833711))))

(assert (=> b!1487345 (= res!1011600 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487346 () Bool)

(assert (=> b!1487346 (= e!833709 e!833708)))

(declare-fun res!1011609 () Bool)

(assert (=> b!1487346 (=> (not res!1011609) (not e!833708))))

(assert (=> b!1487346 (= res!1011609 (and (= index!646 intermediateAfterIndex!19) (= lt!648764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487347 () Bool)

(assert (=> b!1487347 (= e!833701 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648766 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648765))))

(declare-fun b!1487348 () Bool)

(declare-fun lt!648762 () SeekEntryResult!12301)

(assert (=> b!1487348 (= e!833703 (= lt!648762 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648768 lt!648767 mask!2687)))))

(declare-fun b!1487349 () Bool)

(assert (=> b!1487349 (= e!833710 e!833711)))

(declare-fun res!1011605 () Bool)

(assert (=> b!1487349 (=> (not res!1011605) (not e!833711))))

(assert (=> b!1487349 (= res!1011605 (= lt!648762 (Intermediate!12301 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1487349 (= lt!648762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648768 mask!2687) lt!648768 lt!648767 mask!2687))))

(assert (=> b!1487349 (= lt!648768 (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487350 () Bool)

(declare-fun res!1011607 () Bool)

(assert (=> b!1487350 (=> (not res!1011607) (not e!833705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99573 (_ BitVec 32)) Bool)

(assert (=> b!1487350 (= res!1011607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487351 () Bool)

(assert (=> b!1487351 (= e!833711 (not e!833706))))

(declare-fun res!1011608 () Bool)

(assert (=> b!1487351 (=> res!1011608 e!833706)))

(assert (=> b!1487351 (= res!1011608 (or (and (= (select (arr!48061 a!2862) index!646) (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48061 a!2862) index!646) (select (arr!48061 a!2862) j!93))) (= (select (arr!48061 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487351 e!833707))

(declare-fun res!1011615 () Bool)

(assert (=> b!1487351 (=> (not res!1011615) (not e!833707))))

(assert (=> b!1487351 (= res!1011615 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49942 0))(
  ( (Unit!49943) )
))
(declare-fun lt!648763 () Unit!49942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49942)

(assert (=> b!1487351 (= lt!648763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487352 () Bool)

(declare-fun res!1011616 () Bool)

(assert (=> b!1487352 (=> (not res!1011616) (not e!833707))))

(assert (=> b!1487352 (= res!1011616 (or (= (select (arr!48061 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48061 a!2862) intermediateBeforeIndex!19) (select (arr!48061 a!2862) j!93))))))

(assert (= (and start!126674 res!1011604) b!1487340))

(assert (= (and b!1487340 res!1011611) b!1487339))

(assert (= (and b!1487339 res!1011599) b!1487331))

(assert (= (and b!1487331 res!1011598) b!1487350))

(assert (= (and b!1487350 res!1011607) b!1487344))

(assert (= (and b!1487344 res!1011612) b!1487332))

(assert (= (and b!1487332 res!1011603) b!1487335))

(assert (= (and b!1487335 res!1011606) b!1487338))

(assert (= (and b!1487338 res!1011602) b!1487336))

(assert (= (and b!1487336 res!1011601) b!1487349))

(assert (= (and b!1487349 res!1011605) b!1487334))

(assert (= (and b!1487334 c!137391) b!1487348))

(assert (= (and b!1487334 (not c!137391)) b!1487341))

(assert (= (and b!1487334 res!1011613) b!1487345))

(assert (= (and b!1487345 res!1011600) b!1487351))

(assert (= (and b!1487351 res!1011615) b!1487342))

(assert (= (and b!1487342 res!1011597) b!1487352))

(assert (= (and b!1487352 res!1011616) b!1487333))

(assert (= (and b!1487333 (not res!1011614)) b!1487346))

(assert (= (and b!1487346 res!1011609) b!1487343))

(assert (= (and b!1487351 (not res!1011608)) b!1487337))

(assert (= (and b!1487337 (not res!1011610)) b!1487347))

(declare-fun m!1372051 () Bool)

(assert (=> b!1487331 m!1372051))

(assert (=> b!1487331 m!1372051))

(declare-fun m!1372053 () Bool)

(assert (=> b!1487331 m!1372053))

(declare-fun m!1372055 () Bool)

(assert (=> b!1487341 m!1372055))

(declare-fun m!1372057 () Bool)

(assert (=> b!1487341 m!1372057))

(declare-fun m!1372059 () Bool)

(assert (=> b!1487352 m!1372059))

(assert (=> b!1487352 m!1372051))

(declare-fun m!1372061 () Bool)

(assert (=> b!1487337 m!1372061))

(assert (=> b!1487342 m!1372051))

(assert (=> b!1487342 m!1372051))

(declare-fun m!1372063 () Bool)

(assert (=> b!1487342 m!1372063))

(declare-fun m!1372065 () Bool)

(assert (=> start!126674 m!1372065))

(declare-fun m!1372067 () Bool)

(assert (=> start!126674 m!1372067))

(declare-fun m!1372069 () Bool)

(assert (=> b!1487349 m!1372069))

(assert (=> b!1487349 m!1372069))

(declare-fun m!1372071 () Bool)

(assert (=> b!1487349 m!1372071))

(declare-fun m!1372073 () Bool)

(assert (=> b!1487349 m!1372073))

(declare-fun m!1372075 () Bool)

(assert (=> b!1487349 m!1372075))

(assert (=> b!1487336 m!1372051))

(assert (=> b!1487336 m!1372051))

(declare-fun m!1372077 () Bool)

(assert (=> b!1487336 m!1372077))

(declare-fun m!1372079 () Bool)

(assert (=> b!1487344 m!1372079))

(declare-fun m!1372081 () Bool)

(assert (=> b!1487339 m!1372081))

(assert (=> b!1487339 m!1372081))

(declare-fun m!1372083 () Bool)

(assert (=> b!1487339 m!1372083))

(assert (=> b!1487343 m!1372057))

(assert (=> b!1487343 m!1372055))

(assert (=> b!1487347 m!1372051))

(assert (=> b!1487347 m!1372051))

(declare-fun m!1372085 () Bool)

(assert (=> b!1487347 m!1372085))

(declare-fun m!1372087 () Bool)

(assert (=> b!1487350 m!1372087))

(declare-fun m!1372089 () Bool)

(assert (=> b!1487348 m!1372089))

(assert (=> b!1487338 m!1372051))

(assert (=> b!1487338 m!1372051))

(declare-fun m!1372091 () Bool)

(assert (=> b!1487338 m!1372091))

(assert (=> b!1487338 m!1372091))

(assert (=> b!1487338 m!1372051))

(declare-fun m!1372093 () Bool)

(assert (=> b!1487338 m!1372093))

(declare-fun m!1372095 () Bool)

(assert (=> b!1487333 m!1372095))

(assert (=> b!1487333 m!1372051))

(assert (=> b!1487333 m!1372073))

(declare-fun m!1372097 () Bool)

(assert (=> b!1487333 m!1372097))

(assert (=> b!1487335 m!1372073))

(declare-fun m!1372099 () Bool)

(assert (=> b!1487335 m!1372099))

(declare-fun m!1372101 () Bool)

(assert (=> b!1487351 m!1372101))

(assert (=> b!1487351 m!1372073))

(assert (=> b!1487351 m!1372097))

(assert (=> b!1487351 m!1372095))

(declare-fun m!1372103 () Bool)

(assert (=> b!1487351 m!1372103))

(assert (=> b!1487351 m!1372051))

(push 1)

(assert (not b!1487331))

(assert (not b!1487341))

(assert (not b!1487343))

(assert (not b!1487342))

(assert (not b!1487336))

(assert (not b!1487344))

(assert (not b!1487349))

(assert (not start!126674))

(assert (not b!1487351))

(assert (not b!1487338))

(assert (not b!1487339))

(assert (not b!1487348))

(assert (not b!1487337))

(assert (not b!1487347))

(assert (not b!1487350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun call!67903 () Bool)

(declare-fun bm!67900 () Bool)

(assert (=> bm!67900 (= call!67903 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1487451 () Bool)

(declare-fun e!833774 () Bool)

(assert (=> b!1487451 (= e!833774 call!67903)))

(declare-fun d!156557 () Bool)

(declare-fun res!1011646 () Bool)

(declare-fun e!833773 () Bool)

(assert (=> d!156557 (=> res!1011646 e!833773)))

(assert (=> d!156557 (= res!1011646 (bvsge j!93 (size!48611 a!2862)))))

(assert (=> d!156557 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!833773)))

(declare-fun b!1487452 () Bool)

(assert (=> b!1487452 (= e!833773 e!833774)))

(declare-fun c!137427 () Bool)

(assert (=> b!1487452 (= c!137427 (validKeyInArray!0 (select (arr!48061 a!2862) j!93)))))

(declare-fun b!1487453 () Bool)

(declare-fun e!833772 () Bool)

(assert (=> b!1487453 (= e!833772 call!67903)))

(declare-fun b!1487454 () Bool)

(assert (=> b!1487454 (= e!833774 e!833772)))

(declare-fun lt!648813 () (_ BitVec 64))

(assert (=> b!1487454 (= lt!648813 (select (arr!48061 a!2862) j!93))))

(declare-fun lt!648812 () Unit!49942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99573 (_ BitVec 64) (_ BitVec 32)) Unit!49942)

(assert (=> b!1487454 (= lt!648812 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648813 j!93))))

(declare-fun arrayContainsKey!0 (array!99573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1487454 (arrayContainsKey!0 a!2862 lt!648813 #b00000000000000000000000000000000)))

(declare-fun lt!648811 () Unit!49942)

(assert (=> b!1487454 (= lt!648811 lt!648812)))

(declare-fun res!1011645 () Bool)

(assert (=> b!1487454 (= res!1011645 (= (seekEntryOrOpen!0 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) (Found!12301 j!93)))))

(assert (=> b!1487454 (=> (not res!1011645) (not e!833772))))

(assert (= (and d!156557 (not res!1011646)) b!1487452))

(assert (= (and b!1487452 c!137427) b!1487454))

(assert (= (and b!1487452 (not c!137427)) b!1487451))

(assert (= (and b!1487454 res!1011645) b!1487453))

(assert (= (or b!1487453 b!1487451) bm!67900))

(declare-fun m!1372145 () Bool)

(assert (=> bm!67900 m!1372145))

(assert (=> b!1487452 m!1372051))

(assert (=> b!1487452 m!1372051))

(assert (=> b!1487452 m!1372053))

(assert (=> b!1487454 m!1372051))

(declare-fun m!1372147 () Bool)

(assert (=> b!1487454 m!1372147))

(declare-fun m!1372149 () Bool)

(assert (=> b!1487454 m!1372149))

(assert (=> b!1487454 m!1372051))

(assert (=> b!1487454 m!1372063))

(assert (=> b!1487351 d!156557))

(declare-fun d!156563 () Bool)

(assert (=> d!156563 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!648821 () Unit!49942)

(declare-fun choose!38 (array!99573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49942)

(assert (=> d!156563 (= lt!648821 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156563 (validMask!0 mask!2687)))

(assert (=> d!156563 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!648821)))

(declare-fun bs!42784 () Bool)

(assert (= bs!42784 d!156563))

(assert (=> bs!42784 m!1372103))

(declare-fun m!1372169 () Bool)

(assert (=> bs!42784 m!1372169))

(assert (=> bs!42784 m!1372065))

(assert (=> b!1487351 d!156563))

(declare-fun bm!67901 () Bool)

(declare-fun call!67904 () Bool)

(assert (=> bm!67901 (= call!67904 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1487470 () Bool)

(declare-fun e!833785 () Bool)

(assert (=> b!1487470 (= e!833785 call!67904)))

(declare-fun d!156571 () Bool)

(declare-fun res!1011652 () Bool)

(declare-fun e!833784 () Bool)

(assert (=> d!156571 (=> res!1011652 e!833784)))

(assert (=> d!156571 (= res!1011652 (bvsge #b00000000000000000000000000000000 (size!48611 a!2862)))))

(assert (=> d!156571 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!833784)))

(declare-fun b!1487471 () Bool)

(assert (=> b!1487471 (= e!833784 e!833785)))

(declare-fun c!137434 () Bool)

(assert (=> b!1487471 (= c!137434 (validKeyInArray!0 (select (arr!48061 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487472 () Bool)

(declare-fun e!833783 () Bool)

(assert (=> b!1487472 (= e!833783 call!67904)))

(declare-fun b!1487473 () Bool)

(assert (=> b!1487473 (= e!833785 e!833783)))

(declare-fun lt!648824 () (_ BitVec 64))

(assert (=> b!1487473 (= lt!648824 (select (arr!48061 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648823 () Unit!49942)

(assert (=> b!1487473 (= lt!648823 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648824 #b00000000000000000000000000000000))))

(assert (=> b!1487473 (arrayContainsKey!0 a!2862 lt!648824 #b00000000000000000000000000000000)))

(declare-fun lt!648822 () Unit!49942)

(assert (=> b!1487473 (= lt!648822 lt!648823)))

(declare-fun res!1011651 () Bool)

(assert (=> b!1487473 (= res!1011651 (= (seekEntryOrOpen!0 (select (arr!48061 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12301 #b00000000000000000000000000000000)))))

(assert (=> b!1487473 (=> (not res!1011651) (not e!833783))))

(assert (= (and d!156571 (not res!1011652)) b!1487471))

(assert (= (and b!1487471 c!137434) b!1487473))

(assert (= (and b!1487471 (not c!137434)) b!1487470))

(assert (= (and b!1487473 res!1011651) b!1487472))

(assert (= (or b!1487472 b!1487470) bm!67901))

(declare-fun m!1372171 () Bool)

(assert (=> bm!67901 m!1372171))

(declare-fun m!1372173 () Bool)

(assert (=> b!1487471 m!1372173))

(assert (=> b!1487471 m!1372173))

(declare-fun m!1372175 () Bool)

(assert (=> b!1487471 m!1372175))

(assert (=> b!1487473 m!1372173))

(declare-fun m!1372177 () Bool)

(assert (=> b!1487473 m!1372177))

(declare-fun m!1372179 () Bool)

(assert (=> b!1487473 m!1372179))

(assert (=> b!1487473 m!1372173))

(declare-fun m!1372181 () Bool)

(assert (=> b!1487473 m!1372181))

(assert (=> b!1487350 d!156571))

(declare-fun d!156573 () Bool)

(assert (=> d!156573 (= (validKeyInArray!0 (select (arr!48061 a!2862) i!1006)) (and (not (= (select (arr!48061 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48061 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487339 d!156573))

(declare-fun b!1487575 () Bool)

(declare-fun e!833846 () SeekEntryResult!12301)

(assert (=> b!1487575 (= e!833846 (Intermediate!12301 false (toIndex!0 lt!648768 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487576 () Bool)

(assert (=> b!1487576 (= e!833846 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648768 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!648768 lt!648767 mask!2687))))

(declare-fun b!1487577 () Bool)

(declare-fun e!833850 () SeekEntryResult!12301)

(assert (=> b!1487577 (= e!833850 (Intermediate!12301 true (toIndex!0 lt!648768 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487578 () Bool)

(declare-fun e!833847 () Bool)

(declare-fun lt!648865 () SeekEntryResult!12301)

(assert (=> b!1487578 (= e!833847 (bvsge (x!133173 lt!648865) #b01111111111111111111111111111110))))

(declare-fun b!1487579 () Bool)

(assert (=> b!1487579 (= e!833850 e!833846)))

(declare-fun c!137469 () Bool)

(declare-fun lt!648864 () (_ BitVec 64))

(assert (=> b!1487579 (= c!137469 (or (= lt!648864 lt!648768) (= (bvadd lt!648864 lt!648864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156575 () Bool)

(assert (=> d!156575 e!833847))

(declare-fun c!137467 () Bool)

(assert (=> d!156575 (= c!137467 (and (is-Intermediate!12301 lt!648865) (undefined!13113 lt!648865)))))

(assert (=> d!156575 (= lt!648865 e!833850)))

(declare-fun c!137468 () Bool)

(assert (=> d!156575 (= c!137468 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156575 (= lt!648864 (select (arr!48061 lt!648767) (toIndex!0 lt!648768 mask!2687)))))

(assert (=> d!156575 (validMask!0 mask!2687)))

(assert (=> d!156575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648768 mask!2687) lt!648768 lt!648767 mask!2687) lt!648865)))

(declare-fun b!1487580 () Bool)

(assert (=> b!1487580 (and (bvsge (index!51598 lt!648865) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648865) (size!48611 lt!648767)))))

(declare-fun e!833848 () Bool)

(assert (=> b!1487580 (= e!833848 (= (select (arr!48061 lt!648767) (index!51598 lt!648865)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487581 () Bool)

(assert (=> b!1487581 (and (bvsge (index!51598 lt!648865) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648865) (size!48611 lt!648767)))))

(declare-fun res!1011691 () Bool)

(assert (=> b!1487581 (= res!1011691 (= (select (arr!48061 lt!648767) (index!51598 lt!648865)) lt!648768))))

(assert (=> b!1487581 (=> res!1011691 e!833848)))

(declare-fun e!833849 () Bool)

(assert (=> b!1487581 (= e!833849 e!833848)))

(declare-fun b!1487582 () Bool)

(assert (=> b!1487582 (and (bvsge (index!51598 lt!648865) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648865) (size!48611 lt!648767)))))

(declare-fun res!1011693 () Bool)

(assert (=> b!1487582 (= res!1011693 (= (select (arr!48061 lt!648767) (index!51598 lt!648865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487582 (=> res!1011693 e!833848)))

(declare-fun b!1487583 () Bool)

(assert (=> b!1487583 (= e!833847 e!833849)))

(declare-fun res!1011692 () Bool)

(assert (=> b!1487583 (= res!1011692 (and (is-Intermediate!12301 lt!648865) (not (undefined!13113 lt!648865)) (bvslt (x!133173 lt!648865) #b01111111111111111111111111111110) (bvsge (x!133173 lt!648865) #b00000000000000000000000000000000) (bvsge (x!133173 lt!648865) #b00000000000000000000000000000000)))))

(assert (=> b!1487583 (=> (not res!1011692) (not e!833849))))

(assert (= (and d!156575 c!137468) b!1487577))

(assert (= (and d!156575 (not c!137468)) b!1487579))

(assert (= (and b!1487579 c!137469) b!1487575))

(assert (= (and b!1487579 (not c!137469)) b!1487576))

(assert (= (and d!156575 c!137467) b!1487578))

(assert (= (and d!156575 (not c!137467)) b!1487583))

(assert (= (and b!1487583 res!1011692) b!1487581))

(assert (= (and b!1487581 (not res!1011691)) b!1487582))

(assert (= (and b!1487582 (not res!1011693)) b!1487580))

(declare-fun m!1372229 () Bool)

(assert (=> b!1487580 m!1372229))

(assert (=> b!1487582 m!1372229))

(assert (=> b!1487581 m!1372229))

(assert (=> d!156575 m!1372069))

(declare-fun m!1372231 () Bool)

(assert (=> d!156575 m!1372231))

(assert (=> d!156575 m!1372065))

(assert (=> b!1487576 m!1372069))

(declare-fun m!1372233 () Bool)

(assert (=> b!1487576 m!1372233))

(assert (=> b!1487576 m!1372233))

(declare-fun m!1372235 () Bool)

(assert (=> b!1487576 m!1372235))

(assert (=> b!1487349 d!156575))

(declare-fun d!156601 () Bool)

(declare-fun lt!648881 () (_ BitVec 32))

(declare-fun lt!648880 () (_ BitVec 32))

(assert (=> d!156601 (= lt!648881 (bvmul (bvxor lt!648880 (bvlshr lt!648880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156601 (= lt!648880 ((_ extract 31 0) (bvand (bvxor lt!648768 (bvlshr lt!648768 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156601 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011699 (let ((h!35938 ((_ extract 31 0) (bvand (bvxor lt!648768 (bvlshr lt!648768 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133181 (bvmul (bvxor h!35938 (bvlshr h!35938 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133181 (bvlshr x!133181 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011699 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011699 #b00000000000000000000000000000000))))))

(assert (=> d!156601 (= (toIndex!0 lt!648768 mask!2687) (bvand (bvxor lt!648881 (bvlshr lt!648881 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487349 d!156601))

(declare-fun b!1487628 () Bool)

(declare-fun e!833877 () SeekEntryResult!12301)

(declare-fun lt!648897 () SeekEntryResult!12301)

(assert (=> b!1487628 (= e!833877 (MissingZero!12301 (index!51598 lt!648897)))))

(declare-fun d!156609 () Bool)

(declare-fun lt!648896 () SeekEntryResult!12301)

(assert (=> d!156609 (and (or (is-Undefined!12301 lt!648896) (not (is-Found!12301 lt!648896)) (and (bvsge (index!51597 lt!648896) #b00000000000000000000000000000000) (bvslt (index!51597 lt!648896) (size!48611 lt!648767)))) (or (is-Undefined!12301 lt!648896) (is-Found!12301 lt!648896) (not (is-MissingZero!12301 lt!648896)) (and (bvsge (index!51596 lt!648896) #b00000000000000000000000000000000) (bvslt (index!51596 lt!648896) (size!48611 lt!648767)))) (or (is-Undefined!12301 lt!648896) (is-Found!12301 lt!648896) (is-MissingZero!12301 lt!648896) (not (is-MissingVacant!12301 lt!648896)) (and (bvsge (index!51599 lt!648896) #b00000000000000000000000000000000) (bvslt (index!51599 lt!648896) (size!48611 lt!648767)))) (or (is-Undefined!12301 lt!648896) (ite (is-Found!12301 lt!648896) (= (select (arr!48061 lt!648767) (index!51597 lt!648896)) lt!648768) (ite (is-MissingZero!12301 lt!648896) (= (select (arr!48061 lt!648767) (index!51596 lt!648896)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12301 lt!648896) (= (select (arr!48061 lt!648767) (index!51599 lt!648896)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!833878 () SeekEntryResult!12301)

(assert (=> d!156609 (= lt!648896 e!833878)))

(declare-fun c!137488 () Bool)

(assert (=> d!156609 (= c!137488 (and (is-Intermediate!12301 lt!648897) (undefined!13113 lt!648897)))))

(assert (=> d!156609 (= lt!648897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648768 mask!2687) lt!648768 lt!648767 mask!2687))))

(assert (=> d!156609 (validMask!0 mask!2687)))

(assert (=> d!156609 (= (seekEntryOrOpen!0 lt!648768 lt!648767 mask!2687) lt!648896)))

(declare-fun b!1487629 () Bool)

(assert (=> b!1487629 (= e!833878 Undefined!12301)))

(declare-fun b!1487630 () Bool)

(declare-fun e!833879 () SeekEntryResult!12301)

(assert (=> b!1487630 (= e!833878 e!833879)))

(declare-fun lt!648898 () (_ BitVec 64))

(assert (=> b!1487630 (= lt!648898 (select (arr!48061 lt!648767) (index!51598 lt!648897)))))

(declare-fun c!137489 () Bool)

(assert (=> b!1487630 (= c!137489 (= lt!648898 lt!648768))))

(declare-fun b!1487631 () Bool)

(declare-fun c!137487 () Bool)

(assert (=> b!1487631 (= c!137487 (= lt!648898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487631 (= e!833879 e!833877)))

(declare-fun b!1487632 () Bool)

(assert (=> b!1487632 (= e!833877 (seekKeyOrZeroReturnVacant!0 (x!133173 lt!648897) (index!51598 lt!648897) (index!51598 lt!648897) lt!648768 lt!648767 mask!2687))))

(declare-fun b!1487633 () Bool)

(assert (=> b!1487633 (= e!833879 (Found!12301 (index!51598 lt!648897)))))

(assert (= (and d!156609 c!137488) b!1487629))

(assert (= (and d!156609 (not c!137488)) b!1487630))

(assert (= (and b!1487630 c!137489) b!1487633))

(assert (= (and b!1487630 (not c!137489)) b!1487631))

(assert (= (and b!1487631 c!137487) b!1487628))

(assert (= (and b!1487631 (not c!137487)) b!1487632))

(assert (=> d!156609 m!1372069))

(assert (=> d!156609 m!1372071))

(declare-fun m!1372259 () Bool)

(assert (=> d!156609 m!1372259))

(declare-fun m!1372261 () Bool)

(assert (=> d!156609 m!1372261))

(assert (=> d!156609 m!1372065))

(assert (=> d!156609 m!1372069))

(declare-fun m!1372263 () Bool)

(assert (=> d!156609 m!1372263))

(declare-fun m!1372265 () Bool)

(assert (=> b!1487630 m!1372265))

(declare-fun m!1372267 () Bool)

(assert (=> b!1487632 m!1372267))

(assert (=> b!1487343 d!156609))

(declare-fun b!1487661 () Bool)

(declare-fun e!833895 () SeekEntryResult!12301)

(declare-fun e!833896 () SeekEntryResult!12301)

(assert (=> b!1487661 (= e!833895 e!833896)))

(declare-fun c!137502 () Bool)

(declare-fun lt!648909 () (_ BitVec 64))

(assert (=> b!1487661 (= c!137502 (= lt!648909 lt!648768))))

(declare-fun b!1487662 () Bool)

(assert (=> b!1487662 (= e!833896 (Found!12301 index!646))))

(declare-fun b!1487663 () Bool)

(declare-fun e!833894 () SeekEntryResult!12301)

(assert (=> b!1487663 (= e!833894 (MissingVacant!12301 intermediateAfterIndex!19))))

(declare-fun lt!648908 () SeekEntryResult!12301)

(declare-fun d!156613 () Bool)

(assert (=> d!156613 (and (or (is-Undefined!12301 lt!648908) (not (is-Found!12301 lt!648908)) (and (bvsge (index!51597 lt!648908) #b00000000000000000000000000000000) (bvslt (index!51597 lt!648908) (size!48611 lt!648767)))) (or (is-Undefined!12301 lt!648908) (is-Found!12301 lt!648908) (not (is-MissingVacant!12301 lt!648908)) (not (= (index!51599 lt!648908) intermediateAfterIndex!19)) (and (bvsge (index!51599 lt!648908) #b00000000000000000000000000000000) (bvslt (index!51599 lt!648908) (size!48611 lt!648767)))) (or (is-Undefined!12301 lt!648908) (ite (is-Found!12301 lt!648908) (= (select (arr!48061 lt!648767) (index!51597 lt!648908)) lt!648768) (and (is-MissingVacant!12301 lt!648908) (= (index!51599 lt!648908) intermediateAfterIndex!19) (= (select (arr!48061 lt!648767) (index!51599 lt!648908)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156613 (= lt!648908 e!833895)))

(declare-fun c!137503 () Bool)

(assert (=> d!156613 (= c!137503 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156613 (= lt!648909 (select (arr!48061 lt!648767) index!646))))

(assert (=> d!156613 (validMask!0 mask!2687)))

(assert (=> d!156613 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648768 lt!648767 mask!2687) lt!648908)))

(declare-fun b!1487664 () Bool)

(assert (=> b!1487664 (= e!833895 Undefined!12301)))

(declare-fun b!1487665 () Bool)

(assert (=> b!1487665 (= e!833894 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!648768 lt!648767 mask!2687))))

(declare-fun b!1487666 () Bool)

(declare-fun c!137504 () Bool)

(assert (=> b!1487666 (= c!137504 (= lt!648909 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487666 (= e!833896 e!833894)))

(assert (= (and d!156613 c!137503) b!1487664))

(assert (= (and d!156613 (not c!137503)) b!1487661))

(assert (= (and b!1487661 c!137502) b!1487662))

(assert (= (and b!1487661 (not c!137502)) b!1487666))

(assert (= (and b!1487666 c!137504) b!1487663))

(assert (= (and b!1487666 (not c!137504)) b!1487665))

(declare-fun m!1372287 () Bool)

(assert (=> d!156613 m!1372287))

(declare-fun m!1372289 () Bool)

(assert (=> d!156613 m!1372289))

(declare-fun m!1372291 () Bool)

(assert (=> d!156613 m!1372291))

(assert (=> d!156613 m!1372065))

(assert (=> b!1487665 m!1372061))

(assert (=> b!1487665 m!1372061))

(declare-fun m!1372293 () Bool)

(assert (=> b!1487665 m!1372293))

(assert (=> b!1487343 d!156613))

(declare-fun b!1487667 () Bool)

(declare-fun e!833897 () SeekEntryResult!12301)

(declare-fun lt!648911 () SeekEntryResult!12301)

(assert (=> b!1487667 (= e!833897 (MissingZero!12301 (index!51598 lt!648911)))))

(declare-fun d!156619 () Bool)

(declare-fun lt!648910 () SeekEntryResult!12301)

(assert (=> d!156619 (and (or (is-Undefined!12301 lt!648910) (not (is-Found!12301 lt!648910)) (and (bvsge (index!51597 lt!648910) #b00000000000000000000000000000000) (bvslt (index!51597 lt!648910) (size!48611 a!2862)))) (or (is-Undefined!12301 lt!648910) (is-Found!12301 lt!648910) (not (is-MissingZero!12301 lt!648910)) (and (bvsge (index!51596 lt!648910) #b00000000000000000000000000000000) (bvslt (index!51596 lt!648910) (size!48611 a!2862)))) (or (is-Undefined!12301 lt!648910) (is-Found!12301 lt!648910) (is-MissingZero!12301 lt!648910) (not (is-MissingVacant!12301 lt!648910)) (and (bvsge (index!51599 lt!648910) #b00000000000000000000000000000000) (bvslt (index!51599 lt!648910) (size!48611 a!2862)))) (or (is-Undefined!12301 lt!648910) (ite (is-Found!12301 lt!648910) (= (select (arr!48061 a!2862) (index!51597 lt!648910)) (select (arr!48061 a!2862) j!93)) (ite (is-MissingZero!12301 lt!648910) (= (select (arr!48061 a!2862) (index!51596 lt!648910)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12301 lt!648910) (= (select (arr!48061 a!2862) (index!51599 lt!648910)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!833898 () SeekEntryResult!12301)

(assert (=> d!156619 (= lt!648910 e!833898)))

(declare-fun c!137506 () Bool)

(assert (=> d!156619 (= c!137506 (and (is-Intermediate!12301 lt!648911) (undefined!13113 lt!648911)))))

(assert (=> d!156619 (= lt!648911 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) (select (arr!48061 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156619 (validMask!0 mask!2687)))

(assert (=> d!156619 (= (seekEntryOrOpen!0 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648910)))

(declare-fun b!1487668 () Bool)

(assert (=> b!1487668 (= e!833898 Undefined!12301)))

(declare-fun b!1487669 () Bool)

(declare-fun e!833899 () SeekEntryResult!12301)

(assert (=> b!1487669 (= e!833898 e!833899)))

(declare-fun lt!648912 () (_ BitVec 64))

(assert (=> b!1487669 (= lt!648912 (select (arr!48061 a!2862) (index!51598 lt!648911)))))

(declare-fun c!137507 () Bool)

(assert (=> b!1487669 (= c!137507 (= lt!648912 (select (arr!48061 a!2862) j!93)))))

(declare-fun b!1487670 () Bool)

(declare-fun c!137505 () Bool)

(assert (=> b!1487670 (= c!137505 (= lt!648912 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487670 (= e!833899 e!833897)))

(declare-fun b!1487671 () Bool)

(assert (=> b!1487671 (= e!833897 (seekKeyOrZeroReturnVacant!0 (x!133173 lt!648911) (index!51598 lt!648911) (index!51598 lt!648911) (select (arr!48061 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487672 () Bool)

(assert (=> b!1487672 (= e!833899 (Found!12301 (index!51598 lt!648911)))))

(assert (= (and d!156619 c!137506) b!1487668))

(assert (= (and d!156619 (not c!137506)) b!1487669))

(assert (= (and b!1487669 c!137507) b!1487672))

(assert (= (and b!1487669 (not c!137507)) b!1487670))

(assert (= (and b!1487670 c!137505) b!1487667))

(assert (= (and b!1487670 (not c!137505)) b!1487671))

(assert (=> d!156619 m!1372091))

(assert (=> d!156619 m!1372051))

(assert (=> d!156619 m!1372093))

(declare-fun m!1372295 () Bool)

(assert (=> d!156619 m!1372295))

(declare-fun m!1372297 () Bool)

(assert (=> d!156619 m!1372297))

(assert (=> d!156619 m!1372065))

(assert (=> d!156619 m!1372051))

(assert (=> d!156619 m!1372091))

(declare-fun m!1372299 () Bool)

(assert (=> d!156619 m!1372299))

(declare-fun m!1372301 () Bool)

(assert (=> b!1487669 m!1372301))

(assert (=> b!1487671 m!1372051))

(declare-fun m!1372303 () Bool)

(assert (=> b!1487671 m!1372303))

(assert (=> b!1487342 d!156619))

(declare-fun d!156621 () Bool)

(assert (=> d!156621 (= (validKeyInArray!0 (select (arr!48061 a!2862) j!93)) (and (not (= (select (arr!48061 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48061 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487331 d!156621))

(assert (=> b!1487341 d!156613))

(assert (=> b!1487341 d!156609))

(declare-fun d!156623 () Bool)

(assert (=> d!156623 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126674 d!156623))

(declare-fun d!156629 () Bool)

(assert (=> d!156629 (= (array_inv!37089 a!2862) (bvsge (size!48611 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126674 d!156629))

(declare-fun b!1487716 () Bool)

(declare-fun e!833928 () Bool)

(declare-fun call!67914 () Bool)

(assert (=> b!1487716 (= e!833928 call!67914)))

(declare-fun b!1487717 () Bool)

(declare-fun e!833925 () Bool)

(declare-fun contains!9921 (List!34562 (_ BitVec 64)) Bool)

(assert (=> b!1487717 (= e!833925 (contains!9921 Nil!34559 (select (arr!48061 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67911 () Bool)

(declare-fun c!137525 () Bool)

(assert (=> bm!67911 (= call!67914 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137525 (Cons!34558 (select (arr!48061 a!2862) #b00000000000000000000000000000000) Nil!34559) Nil!34559)))))

(declare-fun b!1487718 () Bool)

(assert (=> b!1487718 (= e!833928 call!67914)))

(declare-fun b!1487719 () Bool)

(declare-fun e!833926 () Bool)

(declare-fun e!833927 () Bool)

(assert (=> b!1487719 (= e!833926 e!833927)))

(declare-fun res!1011718 () Bool)

(assert (=> b!1487719 (=> (not res!1011718) (not e!833927))))

(assert (=> b!1487719 (= res!1011718 (not e!833925))))

(declare-fun res!1011717 () Bool)

(assert (=> b!1487719 (=> (not res!1011717) (not e!833925))))

(assert (=> b!1487719 (= res!1011717 (validKeyInArray!0 (select (arr!48061 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487720 () Bool)

(assert (=> b!1487720 (= e!833927 e!833928)))

(assert (=> b!1487720 (= c!137525 (validKeyInArray!0 (select (arr!48061 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156633 () Bool)

(declare-fun res!1011719 () Bool)

(assert (=> d!156633 (=> res!1011719 e!833926)))

(assert (=> d!156633 (= res!1011719 (bvsge #b00000000000000000000000000000000 (size!48611 a!2862)))))

(assert (=> d!156633 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34559) e!833926)))

(assert (= (and d!156633 (not res!1011719)) b!1487719))

(assert (= (and b!1487719 res!1011717) b!1487717))

(assert (= (and b!1487719 res!1011718) b!1487720))

(assert (= (and b!1487720 c!137525) b!1487716))

(assert (= (and b!1487720 (not c!137525)) b!1487718))

(assert (= (or b!1487716 b!1487718) bm!67911))

(assert (=> b!1487717 m!1372173))

(assert (=> b!1487717 m!1372173))

(declare-fun m!1372325 () Bool)

(assert (=> b!1487717 m!1372325))

(assert (=> bm!67911 m!1372173))

(declare-fun m!1372327 () Bool)

(assert (=> bm!67911 m!1372327))

(assert (=> b!1487719 m!1372173))

(assert (=> b!1487719 m!1372173))

(assert (=> b!1487719 m!1372175))

(assert (=> b!1487720 m!1372173))

(assert (=> b!1487720 m!1372173))

(assert (=> b!1487720 m!1372175))

(assert (=> b!1487344 d!156633))

(declare-fun b!1487721 () Bool)

(declare-fun e!833929 () SeekEntryResult!12301)

(assert (=> b!1487721 (= e!833929 (Intermediate!12301 false (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487722 () Bool)

(assert (=> b!1487722 (= e!833929 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48061 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487723 () Bool)

(declare-fun e!833933 () SeekEntryResult!12301)

(assert (=> b!1487723 (= e!833933 (Intermediate!12301 true (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487724 () Bool)

(declare-fun e!833930 () Bool)

(declare-fun lt!648925 () SeekEntryResult!12301)

(assert (=> b!1487724 (= e!833930 (bvsge (x!133173 lt!648925) #b01111111111111111111111111111110))))

(declare-fun b!1487725 () Bool)

(assert (=> b!1487725 (= e!833933 e!833929)))

(declare-fun lt!648924 () (_ BitVec 64))

(declare-fun c!137528 () Bool)

(assert (=> b!1487725 (= c!137528 (or (= lt!648924 (select (arr!48061 a!2862) j!93)) (= (bvadd lt!648924 lt!648924) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156635 () Bool)

(assert (=> d!156635 e!833930))

(declare-fun c!137526 () Bool)

(assert (=> d!156635 (= c!137526 (and (is-Intermediate!12301 lt!648925) (undefined!13113 lt!648925)))))

(assert (=> d!156635 (= lt!648925 e!833933)))

(declare-fun c!137527 () Bool)

(assert (=> d!156635 (= c!137527 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156635 (= lt!648924 (select (arr!48061 a!2862) (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687)))))

(assert (=> d!156635 (validMask!0 mask!2687)))

(assert (=> d!156635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648925)))

(declare-fun b!1487726 () Bool)

(assert (=> b!1487726 (and (bvsge (index!51598 lt!648925) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648925) (size!48611 a!2862)))))

(declare-fun e!833931 () Bool)

(assert (=> b!1487726 (= e!833931 (= (select (arr!48061 a!2862) (index!51598 lt!648925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487727 () Bool)

(assert (=> b!1487727 (and (bvsge (index!51598 lt!648925) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648925) (size!48611 a!2862)))))

(declare-fun res!1011720 () Bool)

(assert (=> b!1487727 (= res!1011720 (= (select (arr!48061 a!2862) (index!51598 lt!648925)) (select (arr!48061 a!2862) j!93)))))

(assert (=> b!1487727 (=> res!1011720 e!833931)))

(declare-fun e!833932 () Bool)

(assert (=> b!1487727 (= e!833932 e!833931)))

(declare-fun b!1487728 () Bool)

(assert (=> b!1487728 (and (bvsge (index!51598 lt!648925) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648925) (size!48611 a!2862)))))

(declare-fun res!1011722 () Bool)

(assert (=> b!1487728 (= res!1011722 (= (select (arr!48061 a!2862) (index!51598 lt!648925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487728 (=> res!1011722 e!833931)))

(declare-fun b!1487729 () Bool)

(assert (=> b!1487729 (= e!833930 e!833932)))

(declare-fun res!1011721 () Bool)

(assert (=> b!1487729 (= res!1011721 (and (is-Intermediate!12301 lt!648925) (not (undefined!13113 lt!648925)) (bvslt (x!133173 lt!648925) #b01111111111111111111111111111110) (bvsge (x!133173 lt!648925) #b00000000000000000000000000000000) (bvsge (x!133173 lt!648925) #b00000000000000000000000000000000)))))

(assert (=> b!1487729 (=> (not res!1011721) (not e!833932))))

(assert (= (and d!156635 c!137527) b!1487723))

(assert (= (and d!156635 (not c!137527)) b!1487725))

(assert (= (and b!1487725 c!137528) b!1487721))

(assert (= (and b!1487725 (not c!137528)) b!1487722))

(assert (= (and d!156635 c!137526) b!1487724))

(assert (= (and d!156635 (not c!137526)) b!1487729))

(assert (= (and b!1487729 res!1011721) b!1487727))

(assert (= (and b!1487727 (not res!1011720)) b!1487728))

(assert (= (and b!1487728 (not res!1011722)) b!1487726))

(declare-fun m!1372329 () Bool)

(assert (=> b!1487726 m!1372329))

(assert (=> b!1487728 m!1372329))

(assert (=> b!1487727 m!1372329))

(assert (=> d!156635 m!1372091))

(declare-fun m!1372331 () Bool)

(assert (=> d!156635 m!1372331))

(assert (=> d!156635 m!1372065))

(assert (=> b!1487722 m!1372091))

(declare-fun m!1372333 () Bool)

(assert (=> b!1487722 m!1372333))

(assert (=> b!1487722 m!1372333))

(assert (=> b!1487722 m!1372051))

(declare-fun m!1372335 () Bool)

(assert (=> b!1487722 m!1372335))

(assert (=> b!1487338 d!156635))

(declare-fun d!156637 () Bool)

(declare-fun lt!648927 () (_ BitVec 32))

(declare-fun lt!648926 () (_ BitVec 32))

(assert (=> d!156637 (= lt!648927 (bvmul (bvxor lt!648926 (bvlshr lt!648926 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156637 (= lt!648926 ((_ extract 31 0) (bvand (bvxor (select (arr!48061 a!2862) j!93) (bvlshr (select (arr!48061 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156637 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011699 (let ((h!35938 ((_ extract 31 0) (bvand (bvxor (select (arr!48061 a!2862) j!93) (bvlshr (select (arr!48061 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133181 (bvmul (bvxor h!35938 (bvlshr h!35938 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133181 (bvlshr x!133181 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011699 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011699 #b00000000000000000000000000000000))))))

(assert (=> d!156637 (= (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) (bvand (bvxor lt!648927 (bvlshr lt!648927 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487338 d!156637))

(declare-fun b!1487730 () Bool)

(declare-fun e!833934 () SeekEntryResult!12301)

(assert (=> b!1487730 (= e!833934 (Intermediate!12301 false index!646 x!665))))

(declare-fun b!1487731 () Bool)

(assert (=> b!1487731 (= e!833934 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!648768 lt!648767 mask!2687))))

(declare-fun b!1487732 () Bool)

(declare-fun e!833938 () SeekEntryResult!12301)

(assert (=> b!1487732 (= e!833938 (Intermediate!12301 true index!646 x!665))))

(declare-fun b!1487733 () Bool)

(declare-fun e!833935 () Bool)

(declare-fun lt!648929 () SeekEntryResult!12301)

(assert (=> b!1487733 (= e!833935 (bvsge (x!133173 lt!648929) #b01111111111111111111111111111110))))

(declare-fun b!1487734 () Bool)

(assert (=> b!1487734 (= e!833938 e!833934)))

(declare-fun c!137531 () Bool)

(declare-fun lt!648928 () (_ BitVec 64))

(assert (=> b!1487734 (= c!137531 (or (= lt!648928 lt!648768) (= (bvadd lt!648928 lt!648928) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156639 () Bool)

(assert (=> d!156639 e!833935))

(declare-fun c!137529 () Bool)

(assert (=> d!156639 (= c!137529 (and (is-Intermediate!12301 lt!648929) (undefined!13113 lt!648929)))))

(assert (=> d!156639 (= lt!648929 e!833938)))

(declare-fun c!137530 () Bool)

(assert (=> d!156639 (= c!137530 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156639 (= lt!648928 (select (arr!48061 lt!648767) index!646))))

(assert (=> d!156639 (validMask!0 mask!2687)))

(assert (=> d!156639 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648768 lt!648767 mask!2687) lt!648929)))

(declare-fun b!1487735 () Bool)

(assert (=> b!1487735 (and (bvsge (index!51598 lt!648929) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648929) (size!48611 lt!648767)))))

(declare-fun e!833936 () Bool)

(assert (=> b!1487735 (= e!833936 (= (select (arr!48061 lt!648767) (index!51598 lt!648929)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487736 () Bool)

(assert (=> b!1487736 (and (bvsge (index!51598 lt!648929) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648929) (size!48611 lt!648767)))))

(declare-fun res!1011723 () Bool)

(assert (=> b!1487736 (= res!1011723 (= (select (arr!48061 lt!648767) (index!51598 lt!648929)) lt!648768))))

(assert (=> b!1487736 (=> res!1011723 e!833936)))

(declare-fun e!833937 () Bool)

(assert (=> b!1487736 (= e!833937 e!833936)))

(declare-fun b!1487737 () Bool)

(assert (=> b!1487737 (and (bvsge (index!51598 lt!648929) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648929) (size!48611 lt!648767)))))

(declare-fun res!1011725 () Bool)

(assert (=> b!1487737 (= res!1011725 (= (select (arr!48061 lt!648767) (index!51598 lt!648929)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487737 (=> res!1011725 e!833936)))

(declare-fun b!1487738 () Bool)

(assert (=> b!1487738 (= e!833935 e!833937)))

(declare-fun res!1011724 () Bool)

(assert (=> b!1487738 (= res!1011724 (and (is-Intermediate!12301 lt!648929) (not (undefined!13113 lt!648929)) (bvslt (x!133173 lt!648929) #b01111111111111111111111111111110) (bvsge (x!133173 lt!648929) #b00000000000000000000000000000000) (bvsge (x!133173 lt!648929) x!665)))))

(assert (=> b!1487738 (=> (not res!1011724) (not e!833937))))

(assert (= (and d!156639 c!137530) b!1487732))

(assert (= (and d!156639 (not c!137530)) b!1487734))

(assert (= (and b!1487734 c!137531) b!1487730))

(assert (= (and b!1487734 (not c!137531)) b!1487731))

(assert (= (and d!156639 c!137529) b!1487733))

(assert (= (and d!156639 (not c!137529)) b!1487738))

(assert (= (and b!1487738 res!1011724) b!1487736))

(assert (= (and b!1487736 (not res!1011723)) b!1487737))

(assert (= (and b!1487737 (not res!1011725)) b!1487735))

(declare-fun m!1372337 () Bool)

(assert (=> b!1487735 m!1372337))

(assert (=> b!1487737 m!1372337))

(assert (=> b!1487736 m!1372337))

(assert (=> d!156639 m!1372291))

(assert (=> d!156639 m!1372065))

(assert (=> b!1487731 m!1372061))

(assert (=> b!1487731 m!1372061))

(declare-fun m!1372339 () Bool)

(assert (=> b!1487731 m!1372339))

(assert (=> b!1487348 d!156639))

(declare-fun d!156641 () Bool)

(declare-fun lt!648932 () (_ BitVec 32))

(assert (=> d!156641 (and (bvsge lt!648932 #b00000000000000000000000000000000) (bvslt lt!648932 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156641 (= lt!648932 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156641 (validMask!0 mask!2687)))

(assert (=> d!156641 (= (nextIndex!0 index!646 x!665 mask!2687) lt!648932)))

(declare-fun bs!42786 () Bool)

(assert (= bs!42786 d!156641))

(declare-fun m!1372341 () Bool)

(assert (=> bs!42786 m!1372341))

(assert (=> bs!42786 m!1372065))

(assert (=> b!1487337 d!156641))

(declare-fun b!1487739 () Bool)

(declare-fun e!833939 () SeekEntryResult!12301)

(assert (=> b!1487739 (= e!833939 (Intermediate!12301 false lt!648766 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487740 () Bool)

(assert (=> b!1487740 (= e!833939 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!648766 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48061 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487741 () Bool)

(declare-fun e!833943 () SeekEntryResult!12301)

(assert (=> b!1487741 (= e!833943 (Intermediate!12301 true lt!648766 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487742 () Bool)

(declare-fun e!833940 () Bool)

(declare-fun lt!648934 () SeekEntryResult!12301)

(assert (=> b!1487742 (= e!833940 (bvsge (x!133173 lt!648934) #b01111111111111111111111111111110))))

(declare-fun b!1487743 () Bool)

(assert (=> b!1487743 (= e!833943 e!833939)))

(declare-fun c!137534 () Bool)

(declare-fun lt!648933 () (_ BitVec 64))

(assert (=> b!1487743 (= c!137534 (or (= lt!648933 (select (arr!48061 a!2862) j!93)) (= (bvadd lt!648933 lt!648933) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156645 () Bool)

(assert (=> d!156645 e!833940))

(declare-fun c!137532 () Bool)

(assert (=> d!156645 (= c!137532 (and (is-Intermediate!12301 lt!648934) (undefined!13113 lt!648934)))))

(assert (=> d!156645 (= lt!648934 e!833943)))

(declare-fun c!137533 () Bool)

(assert (=> d!156645 (= c!137533 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!156645 (= lt!648933 (select (arr!48061 a!2862) lt!648766))))

(assert (=> d!156645 (validMask!0 mask!2687)))

(assert (=> d!156645 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648766 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648934)))

(declare-fun b!1487744 () Bool)

(assert (=> b!1487744 (and (bvsge (index!51598 lt!648934) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648934) (size!48611 a!2862)))))

(declare-fun e!833941 () Bool)

(assert (=> b!1487744 (= e!833941 (= (select (arr!48061 a!2862) (index!51598 lt!648934)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487745 () Bool)

(assert (=> b!1487745 (and (bvsge (index!51598 lt!648934) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648934) (size!48611 a!2862)))))

(declare-fun res!1011726 () Bool)

(assert (=> b!1487745 (= res!1011726 (= (select (arr!48061 a!2862) (index!51598 lt!648934)) (select (arr!48061 a!2862) j!93)))))

(assert (=> b!1487745 (=> res!1011726 e!833941)))

(declare-fun e!833942 () Bool)

(assert (=> b!1487745 (= e!833942 e!833941)))

(declare-fun b!1487746 () Bool)

(assert (=> b!1487746 (and (bvsge (index!51598 lt!648934) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648934) (size!48611 a!2862)))))

(declare-fun res!1011728 () Bool)

(assert (=> b!1487746 (= res!1011728 (= (select (arr!48061 a!2862) (index!51598 lt!648934)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487746 (=> res!1011728 e!833941)))

(declare-fun b!1487747 () Bool)

(assert (=> b!1487747 (= e!833940 e!833942)))

(declare-fun res!1011727 () Bool)

(assert (=> b!1487747 (= res!1011727 (and (is-Intermediate!12301 lt!648934) (not (undefined!13113 lt!648934)) (bvslt (x!133173 lt!648934) #b01111111111111111111111111111110) (bvsge (x!133173 lt!648934) #b00000000000000000000000000000000) (bvsge (x!133173 lt!648934) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1487747 (=> (not res!1011727) (not e!833942))))

(assert (= (and d!156645 c!137533) b!1487741))

(assert (= (and d!156645 (not c!137533)) b!1487743))

(assert (= (and b!1487743 c!137534) b!1487739))

(assert (= (and b!1487743 (not c!137534)) b!1487740))

(assert (= (and d!156645 c!137532) b!1487742))

(assert (= (and d!156645 (not c!137532)) b!1487747))

(assert (= (and b!1487747 res!1011727) b!1487745))

(assert (= (and b!1487745 (not res!1011726)) b!1487746))

(assert (= (and b!1487746 (not res!1011728)) b!1487744))

(declare-fun m!1372343 () Bool)

(assert (=> b!1487744 m!1372343))

(assert (=> b!1487746 m!1372343))

(assert (=> b!1487745 m!1372343))

(declare-fun m!1372345 () Bool)

(assert (=> d!156645 m!1372345))

(assert (=> d!156645 m!1372065))

(declare-fun m!1372347 () Bool)

(assert (=> b!1487740 m!1372347))

(assert (=> b!1487740 m!1372347))

(assert (=> b!1487740 m!1372051))

(declare-fun m!1372349 () Bool)

(assert (=> b!1487740 m!1372349))

(assert (=> b!1487347 d!156645))

(declare-fun b!1487752 () Bool)

(declare-fun e!833947 () SeekEntryResult!12301)

(assert (=> b!1487752 (= e!833947 (Intermediate!12301 false index!646 x!665))))

(declare-fun b!1487753 () Bool)

(assert (=> b!1487753 (= e!833947 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48061 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487754 () Bool)

(declare-fun e!833951 () SeekEntryResult!12301)

(assert (=> b!1487754 (= e!833951 (Intermediate!12301 true index!646 x!665))))

(declare-fun b!1487755 () Bool)

(declare-fun e!833948 () Bool)

(declare-fun lt!648939 () SeekEntryResult!12301)

(assert (=> b!1487755 (= e!833948 (bvsge (x!133173 lt!648939) #b01111111111111111111111111111110))))

(declare-fun b!1487756 () Bool)

(assert (=> b!1487756 (= e!833951 e!833947)))

(declare-fun c!137538 () Bool)

(declare-fun lt!648938 () (_ BitVec 64))

(assert (=> b!1487756 (= c!137538 (or (= lt!648938 (select (arr!48061 a!2862) j!93)) (= (bvadd lt!648938 lt!648938) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156651 () Bool)

(assert (=> d!156651 e!833948))

(declare-fun c!137536 () Bool)

(assert (=> d!156651 (= c!137536 (and (is-Intermediate!12301 lt!648939) (undefined!13113 lt!648939)))))

(assert (=> d!156651 (= lt!648939 e!833951)))

(declare-fun c!137537 () Bool)

(assert (=> d!156651 (= c!137537 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156651 (= lt!648938 (select (arr!48061 a!2862) index!646))))

(assert (=> d!156651 (validMask!0 mask!2687)))

(assert (=> d!156651 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648939)))

(declare-fun b!1487757 () Bool)

(assert (=> b!1487757 (and (bvsge (index!51598 lt!648939) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648939) (size!48611 a!2862)))))

(declare-fun e!833949 () Bool)

(assert (=> b!1487757 (= e!833949 (= (select (arr!48061 a!2862) (index!51598 lt!648939)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487758 () Bool)

(assert (=> b!1487758 (and (bvsge (index!51598 lt!648939) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648939) (size!48611 a!2862)))))

(declare-fun res!1011731 () Bool)

(assert (=> b!1487758 (= res!1011731 (= (select (arr!48061 a!2862) (index!51598 lt!648939)) (select (arr!48061 a!2862) j!93)))))

(assert (=> b!1487758 (=> res!1011731 e!833949)))

(declare-fun e!833950 () Bool)

(assert (=> b!1487758 (= e!833950 e!833949)))

(declare-fun b!1487759 () Bool)

(assert (=> b!1487759 (and (bvsge (index!51598 lt!648939) #b00000000000000000000000000000000) (bvslt (index!51598 lt!648939) (size!48611 a!2862)))))

(declare-fun res!1011733 () Bool)

(assert (=> b!1487759 (= res!1011733 (= (select (arr!48061 a!2862) (index!51598 lt!648939)) #b0000000000000000000000000000000000000000000000000000000000000000))))

