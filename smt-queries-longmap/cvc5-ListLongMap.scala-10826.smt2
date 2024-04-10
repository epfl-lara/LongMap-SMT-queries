; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126670 () Bool)

(assert start!126670)

(declare-fun b!1487199 () Bool)

(declare-fun e!833643 () Bool)

(declare-fun e!833637 () Bool)

(assert (=> b!1487199 (= e!833643 e!833637)))

(declare-fun res!1011494 () Bool)

(assert (=> b!1487199 (=> (not res!1011494) (not e!833637))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99569 0))(
  ( (array!99570 (arr!48059 (Array (_ BitVec 32) (_ BitVec 64))) (size!48609 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99569)

(assert (=> b!1487199 (= res!1011494 (= (select (store (arr!48059 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648721 () array!99569)

(assert (=> b!1487199 (= lt!648721 (array!99570 (store (arr!48059 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48609 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1487200 () Bool)

(declare-fun lt!648722 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!833644 () Bool)

(declare-datatypes ((SeekEntryResult!12299 0))(
  ( (MissingZero!12299 (index!51588 (_ BitVec 32))) (Found!12299 (index!51589 (_ BitVec 32))) (Intermediate!12299 (undefined!13111 Bool) (index!51590 (_ BitVec 32)) (x!133171 (_ BitVec 32))) (Undefined!12299) (MissingVacant!12299 (index!51591 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99569 (_ BitVec 32)) SeekEntryResult!12299)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99569 (_ BitVec 32)) SeekEntryResult!12299)

(assert (=> b!1487200 (= e!833644 (= (seekEntryOrOpen!0 lt!648722 lt!648721 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648722 lt!648721 mask!2687)))))

(declare-fun b!1487201 () Bool)

(declare-fun e!833640 () Bool)

(declare-fun e!833636 () Bool)

(assert (=> b!1487201 (= e!833640 (not e!833636))))

(declare-fun res!1011477 () Bool)

(assert (=> b!1487201 (=> res!1011477 e!833636)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1487201 (= res!1011477 (or (and (= (select (arr!48059 a!2862) index!646) (select (store (arr!48059 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48059 a!2862) index!646) (select (arr!48059 a!2862) j!93))) (= (select (arr!48059 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833638 () Bool)

(assert (=> b!1487201 e!833638))

(declare-fun res!1011482 () Bool)

(assert (=> b!1487201 (=> (not res!1011482) (not e!833638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99569 (_ BitVec 32)) Bool)

(assert (=> b!1487201 (= res!1011482 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49938 0))(
  ( (Unit!49939) )
))
(declare-fun lt!648726 () Unit!49938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49938)

(assert (=> b!1487201 (= lt!648726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487202 () Bool)

(declare-fun res!1011478 () Bool)

(assert (=> b!1487202 (=> (not res!1011478) (not e!833643))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487202 (= res!1011478 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48609 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48609 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48609 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487203 () Bool)

(declare-fun res!1011481 () Bool)

(assert (=> b!1487203 (=> (not res!1011481) (not e!833638))))

(assert (=> b!1487203 (= res!1011481 (= (seekEntryOrOpen!0 (select (arr!48059 a!2862) j!93) a!2862 mask!2687) (Found!12299 j!93)))))

(declare-fun b!1487205 () Bool)

(declare-fun e!833639 () Bool)

(assert (=> b!1487205 (= e!833637 e!833639)))

(declare-fun res!1011487 () Bool)

(assert (=> b!1487205 (=> (not res!1011487) (not e!833639))))

(declare-fun lt!648725 () SeekEntryResult!12299)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99569 (_ BitVec 32)) SeekEntryResult!12299)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487205 (= res!1011487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48059 a!2862) j!93) mask!2687) (select (arr!48059 a!2862) j!93) a!2862 mask!2687) lt!648725))))

(assert (=> b!1487205 (= lt!648725 (Intermediate!12299 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487206 () Bool)

(declare-fun res!1011483 () Bool)

(assert (=> b!1487206 (=> (not res!1011483) (not e!833643))))

(assert (=> b!1487206 (= res!1011483 (and (= (size!48609 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48609 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48609 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!833642 () Bool)

(declare-fun b!1487207 () Bool)

(declare-fun lt!648724 () SeekEntryResult!12299)

(assert (=> b!1487207 (= e!833642 (= lt!648724 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648722 lt!648721 mask!2687)))))

(declare-fun b!1487208 () Bool)

(declare-fun res!1011480 () Bool)

(assert (=> b!1487208 (=> (not res!1011480) (not e!833643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487208 (= res!1011480 (validKeyInArray!0 (select (arr!48059 a!2862) i!1006)))))

(declare-fun b!1487209 () Bool)

(declare-fun e!833635 () Bool)

(assert (=> b!1487209 (= e!833638 e!833635)))

(declare-fun res!1011495 () Bool)

(assert (=> b!1487209 (=> res!1011495 e!833635)))

(declare-fun lt!648720 () (_ BitVec 64))

(assert (=> b!1487209 (= res!1011495 (or (and (= (select (arr!48059 a!2862) index!646) lt!648720) (= (select (arr!48059 a!2862) index!646) (select (arr!48059 a!2862) j!93))) (= (select (arr!48059 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487209 (= lt!648720 (select (store (arr!48059 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487210 () Bool)

(declare-fun res!1011491 () Bool)

(assert (=> b!1487210 (=> (not res!1011491) (not e!833638))))

(assert (=> b!1487210 (= res!1011491 (or (= (select (arr!48059 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48059 a!2862) intermediateBeforeIndex!19) (select (arr!48059 a!2862) j!93))))))

(declare-fun b!1487211 () Bool)

(declare-fun res!1011490 () Bool)

(assert (=> b!1487211 (=> (not res!1011490) (not e!833643))))

(assert (=> b!1487211 (= res!1011490 (validKeyInArray!0 (select (arr!48059 a!2862) j!93)))))

(declare-fun b!1487212 () Bool)

(declare-fun res!1011489 () Bool)

(assert (=> b!1487212 (=> (not res!1011489) (not e!833640))))

(assert (=> b!1487212 (= res!1011489 e!833642)))

(declare-fun c!137385 () Bool)

(assert (=> b!1487212 (= c!137385 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487213 () Bool)

(declare-fun res!1011485 () Bool)

(assert (=> b!1487213 (=> (not res!1011485) (not e!833643))))

(assert (=> b!1487213 (= res!1011485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!833645 () Bool)

(declare-fun b!1487214 () Bool)

(declare-fun lt!648723 () (_ BitVec 32))

(assert (=> b!1487214 (= e!833645 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648723 (select (arr!48059 a!2862) j!93) a!2862 mask!2687) lt!648725))))

(declare-fun b!1487215 () Bool)

(declare-fun res!1011486 () Bool)

(assert (=> b!1487215 (=> (not res!1011486) (not e!833639))))

(assert (=> b!1487215 (= res!1011486 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48059 a!2862) j!93) a!2862 mask!2687) lt!648725))))

(declare-fun b!1487216 () Bool)

(declare-fun res!1011496 () Bool)

(assert (=> b!1487216 (=> (not res!1011496) (not e!833640))))

(assert (=> b!1487216 (= res!1011496 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487217 () Bool)

(assert (=> b!1487217 (= e!833635 e!833644)))

(declare-fun res!1011492 () Bool)

(assert (=> b!1487217 (=> (not res!1011492) (not e!833644))))

(assert (=> b!1487217 (= res!1011492 (and (= index!646 intermediateAfterIndex!19) (= lt!648720 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487218 () Bool)

(assert (=> b!1487218 (= e!833639 e!833640)))

(declare-fun res!1011479 () Bool)

(assert (=> b!1487218 (=> (not res!1011479) (not e!833640))))

(assert (=> b!1487218 (= res!1011479 (= lt!648724 (Intermediate!12299 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1487218 (= lt!648724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648722 mask!2687) lt!648722 lt!648721 mask!2687))))

(assert (=> b!1487218 (= lt!648722 (select (store (arr!48059 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1011488 () Bool)

(assert (=> start!126670 (=> (not res!1011488) (not e!833643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126670 (= res!1011488 (validMask!0 mask!2687))))

(assert (=> start!126670 e!833643))

(assert (=> start!126670 true))

(declare-fun array_inv!37087 (array!99569) Bool)

(assert (=> start!126670 (array_inv!37087 a!2862)))

(declare-fun b!1487204 () Bool)

(assert (=> b!1487204 (= e!833642 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648722 lt!648721 mask!2687) (seekEntryOrOpen!0 lt!648722 lt!648721 mask!2687)))))

(declare-fun b!1487219 () Bool)

(declare-fun res!1011484 () Bool)

(assert (=> b!1487219 (=> (not res!1011484) (not e!833643))))

(declare-datatypes ((List!34560 0))(
  ( (Nil!34557) (Cons!34556 (h!35933 (_ BitVec 64)) (t!49254 List!34560)) )
))
(declare-fun arrayNoDuplicates!0 (array!99569 (_ BitVec 32) List!34560) Bool)

(assert (=> b!1487219 (= res!1011484 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34557))))

(declare-fun b!1487220 () Bool)

(assert (=> b!1487220 (= e!833636 e!833645)))

(declare-fun res!1011493 () Bool)

(assert (=> b!1487220 (=> res!1011493 e!833645)))

(assert (=> b!1487220 (= res!1011493 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648723 #b00000000000000000000000000000000) (bvsge lt!648723 (size!48609 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487220 (= lt!648723 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!126670 res!1011488) b!1487206))

(assert (= (and b!1487206 res!1011483) b!1487208))

(assert (= (and b!1487208 res!1011480) b!1487211))

(assert (= (and b!1487211 res!1011490) b!1487213))

(assert (= (and b!1487213 res!1011485) b!1487219))

(assert (= (and b!1487219 res!1011484) b!1487202))

(assert (= (and b!1487202 res!1011478) b!1487199))

(assert (= (and b!1487199 res!1011494) b!1487205))

(assert (= (and b!1487205 res!1011487) b!1487215))

(assert (= (and b!1487215 res!1011486) b!1487218))

(assert (= (and b!1487218 res!1011479) b!1487212))

(assert (= (and b!1487212 c!137385) b!1487207))

(assert (= (and b!1487212 (not c!137385)) b!1487204))

(assert (= (and b!1487212 res!1011489) b!1487216))

(assert (= (and b!1487216 res!1011496) b!1487201))

(assert (= (and b!1487201 res!1011482) b!1487203))

(assert (= (and b!1487203 res!1011481) b!1487210))

(assert (= (and b!1487210 res!1011491) b!1487209))

(assert (= (and b!1487209 (not res!1011495)) b!1487217))

(assert (= (and b!1487217 res!1011492) b!1487200))

(assert (= (and b!1487201 (not res!1011477)) b!1487220))

(assert (= (and b!1487220 (not res!1011493)) b!1487214))

(declare-fun m!1371943 () Bool)

(assert (=> b!1487199 m!1371943))

(declare-fun m!1371945 () Bool)

(assert (=> b!1487199 m!1371945))

(declare-fun m!1371947 () Bool)

(assert (=> b!1487220 m!1371947))

(declare-fun m!1371949 () Bool)

(assert (=> b!1487200 m!1371949))

(declare-fun m!1371951 () Bool)

(assert (=> b!1487200 m!1371951))

(declare-fun m!1371953 () Bool)

(assert (=> b!1487205 m!1371953))

(assert (=> b!1487205 m!1371953))

(declare-fun m!1371955 () Bool)

(assert (=> b!1487205 m!1371955))

(assert (=> b!1487205 m!1371955))

(assert (=> b!1487205 m!1371953))

(declare-fun m!1371957 () Bool)

(assert (=> b!1487205 m!1371957))

(declare-fun m!1371959 () Bool)

(assert (=> b!1487213 m!1371959))

(declare-fun m!1371961 () Bool)

(assert (=> b!1487208 m!1371961))

(assert (=> b!1487208 m!1371961))

(declare-fun m!1371963 () Bool)

(assert (=> b!1487208 m!1371963))

(declare-fun m!1371965 () Bool)

(assert (=> b!1487210 m!1371965))

(assert (=> b!1487210 m!1371953))

(assert (=> b!1487203 m!1371953))

(assert (=> b!1487203 m!1371953))

(declare-fun m!1371967 () Bool)

(assert (=> b!1487203 m!1371967))

(declare-fun m!1371969 () Bool)

(assert (=> b!1487219 m!1371969))

(declare-fun m!1371971 () Bool)

(assert (=> b!1487201 m!1371971))

(assert (=> b!1487201 m!1371943))

(declare-fun m!1371973 () Bool)

(assert (=> b!1487201 m!1371973))

(declare-fun m!1371975 () Bool)

(assert (=> b!1487201 m!1371975))

(declare-fun m!1371977 () Bool)

(assert (=> b!1487201 m!1371977))

(assert (=> b!1487201 m!1371953))

(assert (=> b!1487214 m!1371953))

(assert (=> b!1487214 m!1371953))

(declare-fun m!1371979 () Bool)

(assert (=> b!1487214 m!1371979))

(assert (=> b!1487211 m!1371953))

(assert (=> b!1487211 m!1371953))

(declare-fun m!1371981 () Bool)

(assert (=> b!1487211 m!1371981))

(declare-fun m!1371983 () Bool)

(assert (=> start!126670 m!1371983))

(declare-fun m!1371985 () Bool)

(assert (=> start!126670 m!1371985))

(declare-fun m!1371987 () Bool)

(assert (=> b!1487207 m!1371987))

(assert (=> b!1487204 m!1371951))

(assert (=> b!1487204 m!1371949))

(declare-fun m!1371989 () Bool)

(assert (=> b!1487218 m!1371989))

(assert (=> b!1487218 m!1371989))

(declare-fun m!1371991 () Bool)

(assert (=> b!1487218 m!1371991))

(assert (=> b!1487218 m!1371943))

(declare-fun m!1371993 () Bool)

(assert (=> b!1487218 m!1371993))

(assert (=> b!1487215 m!1371953))

(assert (=> b!1487215 m!1371953))

(declare-fun m!1371995 () Bool)

(assert (=> b!1487215 m!1371995))

(assert (=> b!1487209 m!1371975))

(assert (=> b!1487209 m!1371953))

(assert (=> b!1487209 m!1371943))

(assert (=> b!1487209 m!1371973))

(push 1)

(assert (not b!1487208))

(assert (not b!1487213))

(assert (not b!1487220))

(assert (not b!1487201))

(assert (not b!1487205))

(assert (not b!1487204))

(assert (not b!1487203))

(assert (not b!1487214))

(assert (not b!1487218))

(assert (not b!1487215))

(assert (not b!1487200))

(assert (not b!1487207))

(assert (not b!1487211))

(assert (not start!126670))

(assert (not b!1487219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!156551 () Bool)

(assert (=> d!156551 (= (validKeyInArray!0 (select (arr!48059 a!2862) i!1006)) (and (not (= (select (arr!48059 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48059 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487208 d!156551))

(declare-fun b!1487411 () Bool)

(declare-fun e!833747 () Bool)

(declare-fun e!833750 () Bool)

(assert (=> b!1487411 (= e!833747 e!833750)))

(declare-fun c!137415 () Bool)

(assert (=> b!1487411 (= c!137415 (validKeyInArray!0 (select (arr!48059 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67897 () Bool)

(declare-fun call!67900 () Bool)

(assert (=> bm!67897 (= call!67900 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137415 (Cons!34556 (select (arr!48059 a!2862) #b00000000000000000000000000000000) Nil!34557) Nil!34557)))))

(declare-fun b!1487412 () Bool)

(assert (=> b!1487412 (= e!833750 call!67900)))

(declare-fun b!1487413 () Bool)

(declare-fun e!833749 () Bool)

(declare-fun contains!9919 (List!34560 (_ BitVec 64)) Bool)

(assert (=> b!1487413 (= e!833749 (contains!9919 Nil!34557 (select (arr!48059 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156553 () Bool)

(declare-fun res!1011631 () Bool)

(declare-fun e!833748 () Bool)

(assert (=> d!156553 (=> res!1011631 e!833748)))

(assert (=> d!156553 (= res!1011631 (bvsge #b00000000000000000000000000000000 (size!48609 a!2862)))))

(assert (=> d!156553 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34557) e!833748)))

(declare-fun b!1487414 () Bool)

(assert (=> b!1487414 (= e!833750 call!67900)))

(declare-fun b!1487415 () Bool)

(assert (=> b!1487415 (= e!833748 e!833747)))

(declare-fun res!1011629 () Bool)

(assert (=> b!1487415 (=> (not res!1011629) (not e!833747))))

(assert (=> b!1487415 (= res!1011629 (not e!833749))))

(declare-fun res!1011630 () Bool)

(assert (=> b!1487415 (=> (not res!1011630) (not e!833749))))

(assert (=> b!1487415 (= res!1011630 (validKeyInArray!0 (select (arr!48059 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156553 (not res!1011631)) b!1487415))

(assert (= (and b!1487415 res!1011630) b!1487413))

(assert (= (and b!1487415 res!1011629) b!1487411))

(assert (= (and b!1487411 c!137415) b!1487414))

(assert (= (and b!1487411 (not c!137415)) b!1487412))

(assert (= (or b!1487414 b!1487412) bm!67897))

(declare-fun m!1372131 () Bool)

(assert (=> b!1487411 m!1372131))

(assert (=> b!1487411 m!1372131))

(declare-fun m!1372133 () Bool)

(assert (=> b!1487411 m!1372133))

(assert (=> bm!67897 m!1372131))

(declare-fun m!1372135 () Bool)

(assert (=> bm!67897 m!1372135))

(assert (=> b!1487413 m!1372131))

(assert (=> b!1487413 m!1372131))

(declare-fun m!1372137 () Bool)

(assert (=> b!1487413 m!1372137))

(assert (=> b!1487415 m!1372131))

(assert (=> b!1487415 m!1372131))

(assert (=> b!1487415 m!1372133))

(assert (=> b!1487219 d!156553))

(declare-fun d!156555 () Bool)

(declare-fun lt!648798 () (_ BitVec 32))

(assert (=> d!156555 (and (bvsge lt!648798 #b00000000000000000000000000000000) (bvslt lt!648798 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156555 (= lt!648798 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156555 (validMask!0 mask!2687)))

(assert (=> d!156555 (= (nextIndex!0 index!646 x!665 mask!2687) lt!648798)))

(declare-fun bs!42783 () Bool)

(assert (= bs!42783 d!156555))

(declare-fun m!1372139 () Bool)

(assert (=> bs!42783 m!1372139))

(assert (=> bs!42783 m!1371983))

(assert (=> b!1487220 d!156555))

(declare-fun b!1487514 () Bool)

(declare-fun e!833811 () Bool)

(declare-fun e!833810 () Bool)

(assert (=> b!1487514 (= e!833811 e!833810)))

(declare-fun res!1011668 () Bool)

(declare-fun lt!648843 () SeekEntryResult!12299)

(assert (=> b!1487514 (= res!1011668 (and (is-Intermediate!12299 lt!648843) (not (undefined!13111 lt!648843)) (bvslt (x!133171 lt!648843) #b01111111111111111111111111111110) (bvsge (x!133171 lt!648843) #b00000000000000000000000000000000) (bvsge (x!133171 lt!648843) #b00000000000000000000000000000000)))))

(assert (=> b!1487514 (=> (not res!1011668) (not e!833810))))

(declare-fun b!1487515 () Bool)

(declare-fun e!833813 () SeekEntryResult!12299)

(declare-fun e!833812 () SeekEntryResult!12299)

(assert (=> b!1487515 (= e!833813 e!833812)))

(declare-fun lt!648842 () (_ BitVec 64))

(declare-fun c!137449 () Bool)

(assert (=> b!1487515 (= c!137449 (or (= lt!648842 (select (arr!48059 a!2862) j!93)) (= (bvadd lt!648842 lt!648842) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487516 () Bool)

(assert (=> b!1487516 (= e!833811 (bvsge (x!133171 lt!648843) #b01111111111111111111111111111110))))

(declare-fun b!1487517 () Bool)

(assert (=> b!1487517 (= e!833813 (Intermediate!12299 true (toIndex!0 (select (arr!48059 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487518 () Bool)

(assert (=> b!1487518 (and (bvsge (index!51590 lt!648843) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648843) (size!48609 a!2862)))))

(declare-fun res!1011667 () Bool)

(assert (=> b!1487518 (= res!1011667 (= (select (arr!48059 a!2862) (index!51590 lt!648843)) (select (arr!48059 a!2862) j!93)))))

(declare-fun e!833809 () Bool)

(assert (=> b!1487518 (=> res!1011667 e!833809)))

(assert (=> b!1487518 (= e!833810 e!833809)))

(declare-fun b!1487519 () Bool)

(assert (=> b!1487519 (= e!833812 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48059 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48059 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156559 () Bool)

(assert (=> d!156559 e!833811))

(declare-fun c!137450 () Bool)

(assert (=> d!156559 (= c!137450 (and (is-Intermediate!12299 lt!648843) (undefined!13111 lt!648843)))))

(assert (=> d!156559 (= lt!648843 e!833813)))

(declare-fun c!137448 () Bool)

(assert (=> d!156559 (= c!137448 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156559 (= lt!648842 (select (arr!48059 a!2862) (toIndex!0 (select (arr!48059 a!2862) j!93) mask!2687)))))

(assert (=> d!156559 (validMask!0 mask!2687)))

(assert (=> d!156559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48059 a!2862) j!93) mask!2687) (select (arr!48059 a!2862) j!93) a!2862 mask!2687) lt!648843)))

(declare-fun b!1487520 () Bool)

(assert (=> b!1487520 (= e!833812 (Intermediate!12299 false (toIndex!0 (select (arr!48059 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487521 () Bool)

(assert (=> b!1487521 (and (bvsge (index!51590 lt!648843) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648843) (size!48609 a!2862)))))

(assert (=> b!1487521 (= e!833809 (= (select (arr!48059 a!2862) (index!51590 lt!648843)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487522 () Bool)

(assert (=> b!1487522 (and (bvsge (index!51590 lt!648843) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648843) (size!48609 a!2862)))))

(declare-fun res!1011669 () Bool)

(assert (=> b!1487522 (= res!1011669 (= (select (arr!48059 a!2862) (index!51590 lt!648843)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487522 (=> res!1011669 e!833809)))

(assert (= (and d!156559 c!137448) b!1487517))

(assert (= (and d!156559 (not c!137448)) b!1487515))

(assert (= (and b!1487515 c!137449) b!1487520))

(assert (= (and b!1487515 (not c!137449)) b!1487519))

(assert (= (and d!156559 c!137450) b!1487516))

(assert (= (and d!156559 (not c!137450)) b!1487514))

(assert (= (and b!1487514 res!1011668) b!1487518))

(assert (= (and b!1487518 (not res!1011667)) b!1487522))

(assert (= (and b!1487522 (not res!1011669)) b!1487521))

(declare-fun m!1372207 () Bool)

(assert (=> b!1487518 m!1372207))

(assert (=> b!1487519 m!1371955))

(declare-fun m!1372209 () Bool)

(assert (=> b!1487519 m!1372209))

(assert (=> b!1487519 m!1372209))

(assert (=> b!1487519 m!1371953))

(declare-fun m!1372211 () Bool)

(assert (=> b!1487519 m!1372211))

(assert (=> b!1487521 m!1372207))

(assert (=> b!1487522 m!1372207))

(assert (=> d!156559 m!1371955))

(declare-fun m!1372213 () Bool)

(assert (=> d!156559 m!1372213))

(assert (=> d!156559 m!1371983))

(assert (=> b!1487205 d!156559))

(declare-fun d!156587 () Bool)

(declare-fun lt!648849 () (_ BitVec 32))

(declare-fun lt!648848 () (_ BitVec 32))

(assert (=> d!156587 (= lt!648849 (bvmul (bvxor lt!648848 (bvlshr lt!648848 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156587 (= lt!648848 ((_ extract 31 0) (bvand (bvxor (select (arr!48059 a!2862) j!93) (bvlshr (select (arr!48059 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156587 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011670 (let ((h!35937 ((_ extract 31 0) (bvand (bvxor (select (arr!48059 a!2862) j!93) (bvlshr (select (arr!48059 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133179 (bvmul (bvxor h!35937 (bvlshr h!35937 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133179 (bvlshr x!133179 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011670 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011670 #b00000000000000000000000000000000))))))

(assert (=> d!156587 (= (toIndex!0 (select (arr!48059 a!2862) j!93) mask!2687) (bvand (bvxor lt!648849 (bvlshr lt!648849 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487205 d!156587))

(declare-fun b!1487523 () Bool)

(declare-fun e!833816 () Bool)

(declare-fun e!833815 () Bool)

(assert (=> b!1487523 (= e!833816 e!833815)))

(declare-fun res!1011672 () Bool)

(declare-fun lt!648851 () SeekEntryResult!12299)

(assert (=> b!1487523 (= res!1011672 (and (is-Intermediate!12299 lt!648851) (not (undefined!13111 lt!648851)) (bvslt (x!133171 lt!648851) #b01111111111111111111111111111110) (bvsge (x!133171 lt!648851) #b00000000000000000000000000000000) (bvsge (x!133171 lt!648851) x!665)))))

(assert (=> b!1487523 (=> (not res!1011672) (not e!833815))))

(declare-fun b!1487524 () Bool)

(declare-fun e!833818 () SeekEntryResult!12299)

(declare-fun e!833817 () SeekEntryResult!12299)

(assert (=> b!1487524 (= e!833818 e!833817)))

(declare-fun c!137452 () Bool)

(declare-fun lt!648850 () (_ BitVec 64))

(assert (=> b!1487524 (= c!137452 (or (= lt!648850 lt!648722) (= (bvadd lt!648850 lt!648850) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487525 () Bool)

(assert (=> b!1487525 (= e!833816 (bvsge (x!133171 lt!648851) #b01111111111111111111111111111110))))

(declare-fun b!1487526 () Bool)

(assert (=> b!1487526 (= e!833818 (Intermediate!12299 true index!646 x!665))))

(declare-fun b!1487527 () Bool)

(assert (=> b!1487527 (and (bvsge (index!51590 lt!648851) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648851) (size!48609 lt!648721)))))

(declare-fun res!1011671 () Bool)

(assert (=> b!1487527 (= res!1011671 (= (select (arr!48059 lt!648721) (index!51590 lt!648851)) lt!648722))))

(declare-fun e!833814 () Bool)

(assert (=> b!1487527 (=> res!1011671 e!833814)))

(assert (=> b!1487527 (= e!833815 e!833814)))

(declare-fun b!1487528 () Bool)

(assert (=> b!1487528 (= e!833817 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!648722 lt!648721 mask!2687))))

(declare-fun d!156589 () Bool)

(assert (=> d!156589 e!833816))

(declare-fun c!137453 () Bool)

(assert (=> d!156589 (= c!137453 (and (is-Intermediate!12299 lt!648851) (undefined!13111 lt!648851)))))

(assert (=> d!156589 (= lt!648851 e!833818)))

(declare-fun c!137451 () Bool)

(assert (=> d!156589 (= c!137451 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156589 (= lt!648850 (select (arr!48059 lt!648721) index!646))))

(assert (=> d!156589 (validMask!0 mask!2687)))

(assert (=> d!156589 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648722 lt!648721 mask!2687) lt!648851)))

(declare-fun b!1487529 () Bool)

(assert (=> b!1487529 (= e!833817 (Intermediate!12299 false index!646 x!665))))

(declare-fun b!1487530 () Bool)

(assert (=> b!1487530 (and (bvsge (index!51590 lt!648851) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648851) (size!48609 lt!648721)))))

(assert (=> b!1487530 (= e!833814 (= (select (arr!48059 lt!648721) (index!51590 lt!648851)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487531 () Bool)

(assert (=> b!1487531 (and (bvsge (index!51590 lt!648851) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648851) (size!48609 lt!648721)))))

(declare-fun res!1011673 () Bool)

(assert (=> b!1487531 (= res!1011673 (= (select (arr!48059 lt!648721) (index!51590 lt!648851)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487531 (=> res!1011673 e!833814)))

(assert (= (and d!156589 c!137451) b!1487526))

(assert (= (and d!156589 (not c!137451)) b!1487524))

(assert (= (and b!1487524 c!137452) b!1487529))

(assert (= (and b!1487524 (not c!137452)) b!1487528))

(assert (= (and d!156589 c!137453) b!1487525))

(assert (= (and d!156589 (not c!137453)) b!1487523))

(assert (= (and b!1487523 res!1011672) b!1487527))

(assert (= (and b!1487527 (not res!1011671)) b!1487531))

(assert (= (and b!1487531 (not res!1011673)) b!1487530))

(declare-fun m!1372215 () Bool)

(assert (=> b!1487527 m!1372215))

(assert (=> b!1487528 m!1371947))

(assert (=> b!1487528 m!1371947))

(declare-fun m!1372217 () Bool)

(assert (=> b!1487528 m!1372217))

(assert (=> b!1487530 m!1372215))

(assert (=> b!1487531 m!1372215))

(declare-fun m!1372219 () Bool)

(assert (=> d!156589 m!1372219))

(assert (=> d!156589 m!1371983))

(assert (=> b!1487207 d!156589))

(declare-fun b!1487532 () Bool)

(declare-fun e!833821 () Bool)

(declare-fun e!833820 () Bool)

(assert (=> b!1487532 (= e!833821 e!833820)))

(declare-fun res!1011675 () Bool)

(declare-fun lt!648853 () SeekEntryResult!12299)

(assert (=> b!1487532 (= res!1011675 (and (is-Intermediate!12299 lt!648853) (not (undefined!13111 lt!648853)) (bvslt (x!133171 lt!648853) #b01111111111111111111111111111110) (bvsge (x!133171 lt!648853) #b00000000000000000000000000000000) (bvsge (x!133171 lt!648853) #b00000000000000000000000000000000)))))

(assert (=> b!1487532 (=> (not res!1011675) (not e!833820))))

(declare-fun b!1487533 () Bool)

(declare-fun e!833823 () SeekEntryResult!12299)

(declare-fun e!833822 () SeekEntryResult!12299)

(assert (=> b!1487533 (= e!833823 e!833822)))

(declare-fun c!137455 () Bool)

(declare-fun lt!648852 () (_ BitVec 64))

(assert (=> b!1487533 (= c!137455 (or (= lt!648852 lt!648722) (= (bvadd lt!648852 lt!648852) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487534 () Bool)

(assert (=> b!1487534 (= e!833821 (bvsge (x!133171 lt!648853) #b01111111111111111111111111111110))))

(declare-fun b!1487535 () Bool)

(assert (=> b!1487535 (= e!833823 (Intermediate!12299 true (toIndex!0 lt!648722 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487536 () Bool)

(assert (=> b!1487536 (and (bvsge (index!51590 lt!648853) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648853) (size!48609 lt!648721)))))

(declare-fun res!1011674 () Bool)

(assert (=> b!1487536 (= res!1011674 (= (select (arr!48059 lt!648721) (index!51590 lt!648853)) lt!648722))))

(declare-fun e!833819 () Bool)

(assert (=> b!1487536 (=> res!1011674 e!833819)))

(assert (=> b!1487536 (= e!833820 e!833819)))

(declare-fun b!1487537 () Bool)

(assert (=> b!1487537 (= e!833822 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648722 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!648722 lt!648721 mask!2687))))

(declare-fun d!156591 () Bool)

(assert (=> d!156591 e!833821))

(declare-fun c!137456 () Bool)

(assert (=> d!156591 (= c!137456 (and (is-Intermediate!12299 lt!648853) (undefined!13111 lt!648853)))))

(assert (=> d!156591 (= lt!648853 e!833823)))

(declare-fun c!137454 () Bool)

(assert (=> d!156591 (= c!137454 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156591 (= lt!648852 (select (arr!48059 lt!648721) (toIndex!0 lt!648722 mask!2687)))))

(assert (=> d!156591 (validMask!0 mask!2687)))

(assert (=> d!156591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648722 mask!2687) lt!648722 lt!648721 mask!2687) lt!648853)))

(declare-fun b!1487538 () Bool)

(assert (=> b!1487538 (= e!833822 (Intermediate!12299 false (toIndex!0 lt!648722 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487539 () Bool)

(assert (=> b!1487539 (and (bvsge (index!51590 lt!648853) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648853) (size!48609 lt!648721)))))

(assert (=> b!1487539 (= e!833819 (= (select (arr!48059 lt!648721) (index!51590 lt!648853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487540 () Bool)

(assert (=> b!1487540 (and (bvsge (index!51590 lt!648853) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648853) (size!48609 lt!648721)))))

(declare-fun res!1011676 () Bool)

(assert (=> b!1487540 (= res!1011676 (= (select (arr!48059 lt!648721) (index!51590 lt!648853)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487540 (=> res!1011676 e!833819)))

(assert (= (and d!156591 c!137454) b!1487535))

(assert (= (and d!156591 (not c!137454)) b!1487533))

(assert (= (and b!1487533 c!137455) b!1487538))

(assert (= (and b!1487533 (not c!137455)) b!1487537))

(assert (= (and d!156591 c!137456) b!1487534))

(assert (= (and d!156591 (not c!137456)) b!1487532))

(assert (= (and b!1487532 res!1011675) b!1487536))

(assert (= (and b!1487536 (not res!1011674)) b!1487540))

(assert (= (and b!1487540 (not res!1011676)) b!1487539))

(declare-fun m!1372221 () Bool)

(assert (=> b!1487536 m!1372221))

(assert (=> b!1487537 m!1371989))

(declare-fun m!1372223 () Bool)

(assert (=> b!1487537 m!1372223))

(assert (=> b!1487537 m!1372223))

(declare-fun m!1372225 () Bool)

(assert (=> b!1487537 m!1372225))

(assert (=> b!1487539 m!1372221))

(assert (=> b!1487540 m!1372221))

(assert (=> d!156591 m!1371989))

(declare-fun m!1372227 () Bool)

(assert (=> d!156591 m!1372227))

(assert (=> d!156591 m!1371983))

(assert (=> b!1487218 d!156591))

(declare-fun d!156593 () Bool)

(declare-fun lt!648855 () (_ BitVec 32))

(declare-fun lt!648854 () (_ BitVec 32))

(assert (=> d!156593 (= lt!648855 (bvmul (bvxor lt!648854 (bvlshr lt!648854 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156593 (= lt!648854 ((_ extract 31 0) (bvand (bvxor lt!648722 (bvlshr lt!648722 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156593 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011670 (let ((h!35937 ((_ extract 31 0) (bvand (bvxor lt!648722 (bvlshr lt!648722 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133179 (bvmul (bvxor h!35937 (bvlshr h!35937 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133179 (bvlshr x!133179 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011670 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011670 #b00000000000000000000000000000000))))))

(assert (=> d!156593 (= (toIndex!0 lt!648722 mask!2687) (bvand (bvxor lt!648855 (bvlshr lt!648855 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487218 d!156593))

(declare-fun b!1487591 () Bool)

(declare-fun e!833858 () Bool)

(declare-fun e!833857 () Bool)

(assert (=> b!1487591 (= e!833858 e!833857)))

(declare-fun lt!648870 () (_ BitVec 64))

(assert (=> b!1487591 (= lt!648870 (select (arr!48059 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648869 () Unit!49938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99569 (_ BitVec 64) (_ BitVec 32)) Unit!49938)

(assert (=> b!1487591 (= lt!648869 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648870 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1487591 (arrayContainsKey!0 a!2862 lt!648870 #b00000000000000000000000000000000)))

(declare-fun lt!648868 () Unit!49938)

(assert (=> b!1487591 (= lt!648868 lt!648869)))

(declare-fun res!1011700 () Bool)

(assert (=> b!1487591 (= res!1011700 (= (seekEntryOrOpen!0 (select (arr!48059 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12299 #b00000000000000000000000000000000)))))

(assert (=> b!1487591 (=> (not res!1011700) (not e!833857))))

(declare-fun d!156595 () Bool)

(declare-fun res!1011701 () Bool)

(declare-fun e!833859 () Bool)

(assert (=> d!156595 (=> res!1011701 e!833859)))

(assert (=> d!156595 (= res!1011701 (bvsge #b00000000000000000000000000000000 (size!48609 a!2862)))))

(assert (=> d!156595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!833859)))

(declare-fun b!1487592 () Bool)

(assert (=> b!1487592 (= e!833859 e!833858)))

(declare-fun c!137471 () Bool)

(assert (=> b!1487592 (= c!137471 (validKeyInArray!0 (select (arr!48059 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67908 () Bool)

(declare-fun call!67911 () Bool)

(assert (=> bm!67908 (= call!67911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1487593 () Bool)

(assert (=> b!1487593 (= e!833858 call!67911)))

(declare-fun b!1487594 () Bool)

(assert (=> b!1487594 (= e!833857 call!67911)))

(assert (= (and d!156595 (not res!1011701)) b!1487592))

(assert (= (and b!1487592 c!137471) b!1487591))

(assert (= (and b!1487592 (not c!137471)) b!1487593))

(assert (= (and b!1487591 res!1011700) b!1487594))

(assert (= (or b!1487594 b!1487593) bm!67908))

(assert (=> b!1487591 m!1372131))

(declare-fun m!1372241 () Bool)

(assert (=> b!1487591 m!1372241))

(declare-fun m!1372243 () Bool)

(assert (=> b!1487591 m!1372243))

(assert (=> b!1487591 m!1372131))

(declare-fun m!1372245 () Bool)

(assert (=> b!1487591 m!1372245))

(assert (=> b!1487592 m!1372131))

(assert (=> b!1487592 m!1372131))

(assert (=> b!1487592 m!1372133))

(declare-fun m!1372247 () Bool)

(assert (=> bm!67908 m!1372247))

(assert (=> b!1487213 d!156595))

(declare-fun b!1487634 () Bool)

(declare-fun e!833881 () SeekEntryResult!12299)

(declare-fun lt!648900 () SeekEntryResult!12299)

(assert (=> b!1487634 (= e!833881 (Found!12299 (index!51590 lt!648900)))))

(declare-fun b!1487635 () Bool)

(declare-fun c!137491 () Bool)

(declare-fun lt!648901 () (_ BitVec 64))

(assert (=> b!1487635 (= c!137491 (= lt!648901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833882 () SeekEntryResult!12299)

(assert (=> b!1487635 (= e!833881 e!833882)))

(declare-fun b!1487636 () Bool)

(assert (=> b!1487636 (= e!833882 (seekKeyOrZeroReturnVacant!0 (x!133171 lt!648900) (index!51590 lt!648900) (index!51590 lt!648900) (select (arr!48059 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487637 () Bool)

(declare-fun e!833880 () SeekEntryResult!12299)

(assert (=> b!1487637 (= e!833880 e!833881)))

(assert (=> b!1487637 (= lt!648901 (select (arr!48059 a!2862) (index!51590 lt!648900)))))

(declare-fun c!137490 () Bool)

(assert (=> b!1487637 (= c!137490 (= lt!648901 (select (arr!48059 a!2862) j!93)))))

(declare-fun b!1487639 () Bool)

(assert (=> b!1487639 (= e!833882 (MissingZero!12299 (index!51590 lt!648900)))))

(declare-fun d!156605 () Bool)

(declare-fun lt!648899 () SeekEntryResult!12299)

(assert (=> d!156605 (and (or (is-Undefined!12299 lt!648899) (not (is-Found!12299 lt!648899)) (and (bvsge (index!51589 lt!648899) #b00000000000000000000000000000000) (bvslt (index!51589 lt!648899) (size!48609 a!2862)))) (or (is-Undefined!12299 lt!648899) (is-Found!12299 lt!648899) (not (is-MissingZero!12299 lt!648899)) (and (bvsge (index!51588 lt!648899) #b00000000000000000000000000000000) (bvslt (index!51588 lt!648899) (size!48609 a!2862)))) (or (is-Undefined!12299 lt!648899) (is-Found!12299 lt!648899) (is-MissingZero!12299 lt!648899) (not (is-MissingVacant!12299 lt!648899)) (and (bvsge (index!51591 lt!648899) #b00000000000000000000000000000000) (bvslt (index!51591 lt!648899) (size!48609 a!2862)))) (or (is-Undefined!12299 lt!648899) (ite (is-Found!12299 lt!648899) (= (select (arr!48059 a!2862) (index!51589 lt!648899)) (select (arr!48059 a!2862) j!93)) (ite (is-MissingZero!12299 lt!648899) (= (select (arr!48059 a!2862) (index!51588 lt!648899)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12299 lt!648899) (= (select (arr!48059 a!2862) (index!51591 lt!648899)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156605 (= lt!648899 e!833880)))

(declare-fun c!137492 () Bool)

(assert (=> d!156605 (= c!137492 (and (is-Intermediate!12299 lt!648900) (undefined!13111 lt!648900)))))

(assert (=> d!156605 (= lt!648900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48059 a!2862) j!93) mask!2687) (select (arr!48059 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156605 (validMask!0 mask!2687)))

(assert (=> d!156605 (= (seekEntryOrOpen!0 (select (arr!48059 a!2862) j!93) a!2862 mask!2687) lt!648899)))

(declare-fun b!1487638 () Bool)

(assert (=> b!1487638 (= e!833880 Undefined!12299)))

(assert (= (and d!156605 c!137492) b!1487638))

(assert (= (and d!156605 (not c!137492)) b!1487637))

(assert (= (and b!1487637 c!137490) b!1487634))

(assert (= (and b!1487637 (not c!137490)) b!1487635))

(assert (= (and b!1487635 c!137491) b!1487639))

(assert (= (and b!1487635 (not c!137491)) b!1487636))

(assert (=> b!1487636 m!1371953))

(declare-fun m!1372269 () Bool)

(assert (=> b!1487636 m!1372269))

(declare-fun m!1372271 () Bool)

(assert (=> b!1487637 m!1372271))

(assert (=> d!156605 m!1371953))

(assert (=> d!156605 m!1371955))

(declare-fun m!1372273 () Bool)

(assert (=> d!156605 m!1372273))

(declare-fun m!1372275 () Bool)

(assert (=> d!156605 m!1372275))

(assert (=> d!156605 m!1371983))

(declare-fun m!1372277 () Bool)

(assert (=> d!156605 m!1372277))

(assert (=> d!156605 m!1371955))

(assert (=> d!156605 m!1371953))

(assert (=> d!156605 m!1371957))

(assert (=> b!1487203 d!156605))

(declare-fun b!1487640 () Bool)

(declare-fun e!833885 () Bool)

(declare-fun e!833884 () Bool)

(assert (=> b!1487640 (= e!833885 e!833884)))

(declare-fun res!1011706 () Bool)

(declare-fun lt!648903 () SeekEntryResult!12299)

(assert (=> b!1487640 (= res!1011706 (and (is-Intermediate!12299 lt!648903) (not (undefined!13111 lt!648903)) (bvslt (x!133171 lt!648903) #b01111111111111111111111111111110) (bvsge (x!133171 lt!648903) #b00000000000000000000000000000000) (bvsge (x!133171 lt!648903) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1487640 (=> (not res!1011706) (not e!833884))))

(declare-fun b!1487641 () Bool)

(declare-fun e!833887 () SeekEntryResult!12299)

(declare-fun e!833886 () SeekEntryResult!12299)

(assert (=> b!1487641 (= e!833887 e!833886)))

(declare-fun c!137494 () Bool)

(declare-fun lt!648902 () (_ BitVec 64))

(assert (=> b!1487641 (= c!137494 (or (= lt!648902 (select (arr!48059 a!2862) j!93)) (= (bvadd lt!648902 lt!648902) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487642 () Bool)

(assert (=> b!1487642 (= e!833885 (bvsge (x!133171 lt!648903) #b01111111111111111111111111111110))))

(declare-fun b!1487643 () Bool)

(assert (=> b!1487643 (= e!833887 (Intermediate!12299 true lt!648723 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487644 () Bool)

(assert (=> b!1487644 (and (bvsge (index!51590 lt!648903) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648903) (size!48609 a!2862)))))

(declare-fun res!1011705 () Bool)

(assert (=> b!1487644 (= res!1011705 (= (select (arr!48059 a!2862) (index!51590 lt!648903)) (select (arr!48059 a!2862) j!93)))))

(declare-fun e!833883 () Bool)

(assert (=> b!1487644 (=> res!1011705 e!833883)))

(assert (=> b!1487644 (= e!833884 e!833883)))

(declare-fun b!1487645 () Bool)

(assert (=> b!1487645 (= e!833886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!648723 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48059 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156615 () Bool)

(assert (=> d!156615 e!833885))

(declare-fun c!137495 () Bool)

(assert (=> d!156615 (= c!137495 (and (is-Intermediate!12299 lt!648903) (undefined!13111 lt!648903)))))

(assert (=> d!156615 (= lt!648903 e!833887)))

(declare-fun c!137493 () Bool)

(assert (=> d!156615 (= c!137493 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!156615 (= lt!648902 (select (arr!48059 a!2862) lt!648723))))

(assert (=> d!156615 (validMask!0 mask!2687)))

(assert (=> d!156615 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648723 (select (arr!48059 a!2862) j!93) a!2862 mask!2687) lt!648903)))

(declare-fun b!1487646 () Bool)

(assert (=> b!1487646 (= e!833886 (Intermediate!12299 false lt!648723 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487647 () Bool)

(assert (=> b!1487647 (and (bvsge (index!51590 lt!648903) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648903) (size!48609 a!2862)))))

(assert (=> b!1487647 (= e!833883 (= (select (arr!48059 a!2862) (index!51590 lt!648903)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487648 () Bool)

(assert (=> b!1487648 (and (bvsge (index!51590 lt!648903) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648903) (size!48609 a!2862)))))

(declare-fun res!1011707 () Bool)

(assert (=> b!1487648 (= res!1011707 (= (select (arr!48059 a!2862) (index!51590 lt!648903)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487648 (=> res!1011707 e!833883)))

(assert (= (and d!156615 c!137493) b!1487643))

(assert (= (and d!156615 (not c!137493)) b!1487641))

(assert (= (and b!1487641 c!137494) b!1487646))

(assert (= (and b!1487641 (not c!137494)) b!1487645))

(assert (= (and d!156615 c!137495) b!1487642))

(assert (= (and d!156615 (not c!137495)) b!1487640))

(assert (= (and b!1487640 res!1011706) b!1487644))

(assert (= (and b!1487644 (not res!1011705)) b!1487648))

(assert (= (and b!1487648 (not res!1011707)) b!1487647))

(declare-fun m!1372279 () Bool)

(assert (=> b!1487644 m!1372279))

(declare-fun m!1372281 () Bool)

(assert (=> b!1487645 m!1372281))

(assert (=> b!1487645 m!1372281))

(assert (=> b!1487645 m!1371953))

(declare-fun m!1372283 () Bool)

(assert (=> b!1487645 m!1372283))

(assert (=> b!1487647 m!1372279))

(assert (=> b!1487648 m!1372279))

(declare-fun m!1372285 () Bool)

(assert (=> d!156615 m!1372285))

(assert (=> d!156615 m!1371983))

(assert (=> b!1487214 d!156615))

(declare-fun b!1487685 () Bool)

(declare-fun e!833906 () SeekEntryResult!12299)

(declare-fun e!833908 () SeekEntryResult!12299)

(assert (=> b!1487685 (= e!833906 e!833908)))

(declare-fun c!137515 () Bool)

(declare-fun lt!648917 () (_ BitVec 64))

(assert (=> b!1487685 (= c!137515 (= lt!648917 lt!648722))))

(declare-fun e!833907 () SeekEntryResult!12299)

(declare-fun b!1487686 () Bool)

(assert (=> b!1487686 (= e!833907 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!648722 lt!648721 mask!2687))))

(declare-fun b!1487687 () Bool)

(assert (=> b!1487687 (= e!833906 Undefined!12299)))

(declare-fun b!1487688 () Bool)

(assert (=> b!1487688 (= e!833908 (Found!12299 index!646))))

(declare-fun b!1487689 () Bool)

(assert (=> b!1487689 (= e!833907 (MissingVacant!12299 intermediateAfterIndex!19))))

(declare-fun lt!648918 () SeekEntryResult!12299)

(declare-fun d!156617 () Bool)

(assert (=> d!156617 (and (or (is-Undefined!12299 lt!648918) (not (is-Found!12299 lt!648918)) (and (bvsge (index!51589 lt!648918) #b00000000000000000000000000000000) (bvslt (index!51589 lt!648918) (size!48609 lt!648721)))) (or (is-Undefined!12299 lt!648918) (is-Found!12299 lt!648918) (not (is-MissingVacant!12299 lt!648918)) (not (= (index!51591 lt!648918) intermediateAfterIndex!19)) (and (bvsge (index!51591 lt!648918) #b00000000000000000000000000000000) (bvslt (index!51591 lt!648918) (size!48609 lt!648721)))) (or (is-Undefined!12299 lt!648918) (ite (is-Found!12299 lt!648918) (= (select (arr!48059 lt!648721) (index!51589 lt!648918)) lt!648722) (and (is-MissingVacant!12299 lt!648918) (= (index!51591 lt!648918) intermediateAfterIndex!19) (= (select (arr!48059 lt!648721) (index!51591 lt!648918)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156617 (= lt!648918 e!833906)))

(declare-fun c!137514 () Bool)

(assert (=> d!156617 (= c!137514 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156617 (= lt!648917 (select (arr!48059 lt!648721) index!646))))

(assert (=> d!156617 (validMask!0 mask!2687)))

(assert (=> d!156617 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648722 lt!648721 mask!2687) lt!648918)))

(declare-fun b!1487690 () Bool)

(declare-fun c!137516 () Bool)

(assert (=> b!1487690 (= c!137516 (= lt!648917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487690 (= e!833908 e!833907)))

(assert (= (and d!156617 c!137514) b!1487687))

(assert (= (and d!156617 (not c!137514)) b!1487685))

(assert (= (and b!1487685 c!137515) b!1487688))

(assert (= (and b!1487685 (not c!137515)) b!1487690))

(assert (= (and b!1487690 c!137516) b!1487689))

(assert (= (and b!1487690 (not c!137516)) b!1487686))

(assert (=> b!1487686 m!1371947))

(assert (=> b!1487686 m!1371947))

(declare-fun m!1372305 () Bool)

(assert (=> b!1487686 m!1372305))

(declare-fun m!1372307 () Bool)

(assert (=> d!156617 m!1372307))

(declare-fun m!1372309 () Bool)

(assert (=> d!156617 m!1372309))

(assert (=> d!156617 m!1372219))

(assert (=> d!156617 m!1371983))

(assert (=> b!1487204 d!156617))

(declare-fun b!1487691 () Bool)

(declare-fun e!833910 () SeekEntryResult!12299)

(declare-fun lt!648920 () SeekEntryResult!12299)

(assert (=> b!1487691 (= e!833910 (Found!12299 (index!51590 lt!648920)))))

(declare-fun b!1487692 () Bool)

(declare-fun c!137518 () Bool)

(declare-fun lt!648921 () (_ BitVec 64))

(assert (=> b!1487692 (= c!137518 (= lt!648921 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833911 () SeekEntryResult!12299)

(assert (=> b!1487692 (= e!833910 e!833911)))

(declare-fun b!1487693 () Bool)

(assert (=> b!1487693 (= e!833911 (seekKeyOrZeroReturnVacant!0 (x!133171 lt!648920) (index!51590 lt!648920) (index!51590 lt!648920) lt!648722 lt!648721 mask!2687))))

(declare-fun b!1487694 () Bool)

(declare-fun e!833909 () SeekEntryResult!12299)

(assert (=> b!1487694 (= e!833909 e!833910)))

(assert (=> b!1487694 (= lt!648921 (select (arr!48059 lt!648721) (index!51590 lt!648920)))))

(declare-fun c!137517 () Bool)

(assert (=> b!1487694 (= c!137517 (= lt!648921 lt!648722))))

(declare-fun b!1487696 () Bool)

(assert (=> b!1487696 (= e!833911 (MissingZero!12299 (index!51590 lt!648920)))))

(declare-fun d!156625 () Bool)

(declare-fun lt!648919 () SeekEntryResult!12299)

(assert (=> d!156625 (and (or (is-Undefined!12299 lt!648919) (not (is-Found!12299 lt!648919)) (and (bvsge (index!51589 lt!648919) #b00000000000000000000000000000000) (bvslt (index!51589 lt!648919) (size!48609 lt!648721)))) (or (is-Undefined!12299 lt!648919) (is-Found!12299 lt!648919) (not (is-MissingZero!12299 lt!648919)) (and (bvsge (index!51588 lt!648919) #b00000000000000000000000000000000) (bvslt (index!51588 lt!648919) (size!48609 lt!648721)))) (or (is-Undefined!12299 lt!648919) (is-Found!12299 lt!648919) (is-MissingZero!12299 lt!648919) (not (is-MissingVacant!12299 lt!648919)) (and (bvsge (index!51591 lt!648919) #b00000000000000000000000000000000) (bvslt (index!51591 lt!648919) (size!48609 lt!648721)))) (or (is-Undefined!12299 lt!648919) (ite (is-Found!12299 lt!648919) (= (select (arr!48059 lt!648721) (index!51589 lt!648919)) lt!648722) (ite (is-MissingZero!12299 lt!648919) (= (select (arr!48059 lt!648721) (index!51588 lt!648919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12299 lt!648919) (= (select (arr!48059 lt!648721) (index!51591 lt!648919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156625 (= lt!648919 e!833909)))

(declare-fun c!137519 () Bool)

(assert (=> d!156625 (= c!137519 (and (is-Intermediate!12299 lt!648920) (undefined!13111 lt!648920)))))

(assert (=> d!156625 (= lt!648920 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648722 mask!2687) lt!648722 lt!648721 mask!2687))))

(assert (=> d!156625 (validMask!0 mask!2687)))

(assert (=> d!156625 (= (seekEntryOrOpen!0 lt!648722 lt!648721 mask!2687) lt!648919)))

(declare-fun b!1487695 () Bool)

(assert (=> b!1487695 (= e!833909 Undefined!12299)))

(assert (= (and d!156625 c!137519) b!1487695))

(assert (= (and d!156625 (not c!137519)) b!1487694))

(assert (= (and b!1487694 c!137517) b!1487691))

(assert (= (and b!1487694 (not c!137517)) b!1487692))

(assert (= (and b!1487692 c!137518) b!1487696))

(assert (= (and b!1487692 (not c!137518)) b!1487693))

(declare-fun m!1372311 () Bool)

(assert (=> b!1487693 m!1372311))

(declare-fun m!1372313 () Bool)

(assert (=> b!1487694 m!1372313))

(assert (=> d!156625 m!1371989))

(declare-fun m!1372315 () Bool)

(assert (=> d!156625 m!1372315))

(declare-fun m!1372317 () Bool)

(assert (=> d!156625 m!1372317))

(assert (=> d!156625 m!1371983))

(declare-fun m!1372319 () Bool)

(assert (=> d!156625 m!1372319))

(assert (=> d!156625 m!1371989))

(assert (=> d!156625 m!1371991))

(assert (=> b!1487204 d!156625))

(declare-fun b!1487697 () Bool)

(declare-fun e!833914 () Bool)

(declare-fun e!833913 () Bool)

(assert (=> b!1487697 (= e!833914 e!833913)))

(declare-fun res!1011709 () Bool)

(declare-fun lt!648923 () SeekEntryResult!12299)

(assert (=> b!1487697 (= res!1011709 (and (is-Intermediate!12299 lt!648923) (not (undefined!13111 lt!648923)) (bvslt (x!133171 lt!648923) #b01111111111111111111111111111110) (bvsge (x!133171 lt!648923) #b00000000000000000000000000000000) (bvsge (x!133171 lt!648923) x!665)))))

(assert (=> b!1487697 (=> (not res!1011709) (not e!833913))))

(declare-fun b!1487698 () Bool)

(declare-fun e!833916 () SeekEntryResult!12299)

(declare-fun e!833915 () SeekEntryResult!12299)

(assert (=> b!1487698 (= e!833916 e!833915)))

(declare-fun lt!648922 () (_ BitVec 64))

(declare-fun c!137521 () Bool)

(assert (=> b!1487698 (= c!137521 (or (= lt!648922 (select (arr!48059 a!2862) j!93)) (= (bvadd lt!648922 lt!648922) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487699 () Bool)

(assert (=> b!1487699 (= e!833914 (bvsge (x!133171 lt!648923) #b01111111111111111111111111111110))))

(declare-fun b!1487700 () Bool)

(assert (=> b!1487700 (= e!833916 (Intermediate!12299 true index!646 x!665))))

(declare-fun b!1487701 () Bool)

(assert (=> b!1487701 (and (bvsge (index!51590 lt!648923) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648923) (size!48609 a!2862)))))

(declare-fun res!1011708 () Bool)

(assert (=> b!1487701 (= res!1011708 (= (select (arr!48059 a!2862) (index!51590 lt!648923)) (select (arr!48059 a!2862) j!93)))))

(declare-fun e!833912 () Bool)

(assert (=> b!1487701 (=> res!1011708 e!833912)))

(assert (=> b!1487701 (= e!833913 e!833912)))

(declare-fun b!1487702 () Bool)

(assert (=> b!1487702 (= e!833915 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48059 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156627 () Bool)

(assert (=> d!156627 e!833914))

(declare-fun c!137522 () Bool)

(assert (=> d!156627 (= c!137522 (and (is-Intermediate!12299 lt!648923) (undefined!13111 lt!648923)))))

(assert (=> d!156627 (= lt!648923 e!833916)))

(declare-fun c!137520 () Bool)

(assert (=> d!156627 (= c!137520 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156627 (= lt!648922 (select (arr!48059 a!2862) index!646))))

(assert (=> d!156627 (validMask!0 mask!2687)))

(assert (=> d!156627 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48059 a!2862) j!93) a!2862 mask!2687) lt!648923)))

(declare-fun b!1487703 () Bool)

(assert (=> b!1487703 (= e!833915 (Intermediate!12299 false index!646 x!665))))

(declare-fun b!1487704 () Bool)

(assert (=> b!1487704 (and (bvsge (index!51590 lt!648923) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648923) (size!48609 a!2862)))))

(assert (=> b!1487704 (= e!833912 (= (select (arr!48059 a!2862) (index!51590 lt!648923)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487705 () Bool)

(assert (=> b!1487705 (and (bvsge (index!51590 lt!648923) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648923) (size!48609 a!2862)))))

(declare-fun res!1011710 () Bool)

(assert (=> b!1487705 (= res!1011710 (= (select (arr!48059 a!2862) (index!51590 lt!648923)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487705 (=> res!1011710 e!833912)))

(assert (= (and d!156627 c!137520) b!1487700))

(assert (= (and d!156627 (not c!137520)) b!1487698))

(assert (= (and b!1487698 c!137521) b!1487703))

(assert (= (and b!1487698 (not c!137521)) b!1487702))

(assert (= (and d!156627 c!137522) b!1487699))

(assert (= (and d!156627 (not c!137522)) b!1487697))

(assert (= (and b!1487697 res!1011709) b!1487701))

(assert (= (and b!1487701 (not res!1011708)) b!1487705))

(assert (= (and b!1487705 (not res!1011710)) b!1487704))

(declare-fun m!1372321 () Bool)

(assert (=> b!1487701 m!1372321))

(assert (=> b!1487702 m!1371947))

(assert (=> b!1487702 m!1371947))

(assert (=> b!1487702 m!1371953))

(declare-fun m!1372323 () Bool)

(assert (=> b!1487702 m!1372323))

(assert (=> b!1487704 m!1372321))

(assert (=> b!1487705 m!1372321))

(assert (=> d!156627 m!1371975))

(assert (=> d!156627 m!1371983))

(assert (=> b!1487215 d!156627))

(declare-fun d!156631 () Bool)

(assert (=> d!156631 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126670 d!156631))

(declare-fun d!156643 () Bool)

(assert (=> d!156643 (= (array_inv!37087 a!2862) (bvsge (size!48609 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126670 d!156643))

(assert (=> b!1487200 d!156625))

(assert (=> b!1487200 d!156617))

(declare-fun d!156647 () Bool)

(assert (=> d!156647 (= (validKeyInArray!0 (select (arr!48059 a!2862) j!93)) (and (not (= (select (arr!48059 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48059 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487211 d!156647))

(declare-fun b!1487748 () Bool)

(declare-fun e!833945 () Bool)

(declare-fun e!833944 () Bool)

(assert (=> b!1487748 (= e!833945 e!833944)))

(declare-fun lt!648937 () (_ BitVec 64))

(assert (=> b!1487748 (= lt!648937 (select (arr!48059 a!2862) j!93))))

(declare-fun lt!648936 () Unit!49938)

(assert (=> b!1487748 (= lt!648936 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648937 j!93))))

(assert (=> b!1487748 (arrayContainsKey!0 a!2862 lt!648937 #b00000000000000000000000000000000)))

(declare-fun lt!648935 () Unit!49938)

(assert (=> b!1487748 (= lt!648935 lt!648936)))

(declare-fun res!1011729 () Bool)

(assert (=> b!1487748 (= res!1011729 (= (seekEntryOrOpen!0 (select (arr!48059 a!2862) j!93) a!2862 mask!2687) (Found!12299 j!93)))))

(assert (=> b!1487748 (=> (not res!1011729) (not e!833944))))

(declare-fun d!156649 () Bool)

(declare-fun res!1011730 () Bool)

(declare-fun e!833946 () Bool)

(assert (=> d!156649 (=> res!1011730 e!833946)))

(assert (=> d!156649 (= res!1011730 (bvsge j!93 (size!48609 a!2862)))))

(assert (=> d!156649 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!833946)))

(declare-fun b!1487749 () Bool)

(assert (=> b!1487749 (= e!833946 e!833945)))

(declare-fun c!137535 () Bool)

(assert (=> b!1487749 (= c!137535 (validKeyInArray!0 (select (arr!48059 a!2862) j!93)))))

(declare-fun call!67915 () Bool)

(declare-fun bm!67912 () Bool)

(assert (=> bm!67912 (= call!67915 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

