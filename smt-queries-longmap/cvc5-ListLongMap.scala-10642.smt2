; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124990 () Bool)

(assert start!124990)

(declare-fun b!1453346 () Bool)

(declare-fun res!984368 () Bool)

(declare-fun e!818028 () Bool)

(assert (=> b!1453346 (=> (not res!984368) (not e!818028))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453346 (= res!984368 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453347 () Bool)

(declare-fun res!984377 () Bool)

(declare-fun e!818031 () Bool)

(assert (=> b!1453347 (=> (not res!984377) (not e!818031))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98438 0))(
  ( (array!98439 (arr!47507 (Array (_ BitVec 32) (_ BitVec 64))) (size!48057 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98438)

(assert (=> b!1453347 (= res!984377 (and (= (size!48057 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48057 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48057 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453348 () Bool)

(declare-fun res!984375 () Bool)

(assert (=> b!1453348 (=> (not res!984375) (not e!818031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98438 (_ BitVec 32)) Bool)

(assert (=> b!1453348 (= res!984375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453349 () Bool)

(declare-fun res!984380 () Bool)

(assert (=> b!1453349 (=> (not res!984380) (not e!818031))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1453349 (= res!984380 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48057 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48057 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48057 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453350 () Bool)

(declare-fun res!984367 () Bool)

(assert (=> b!1453350 (=> (not res!984367) (not e!818031))))

(declare-datatypes ((List!34008 0))(
  ( (Nil!34005) (Cons!34004 (h!35354 (_ BitVec 64)) (t!48702 List!34008)) )
))
(declare-fun arrayNoDuplicates!0 (array!98438 (_ BitVec 32) List!34008) Bool)

(assert (=> b!1453350 (= res!984367 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34005))))

(declare-fun b!1453351 () Bool)

(declare-fun res!984371 () Bool)

(declare-fun e!818032 () Bool)

(assert (=> b!1453351 (=> (not res!984371) (not e!818032))))

(assert (=> b!1453351 (= res!984371 (or (= (select (arr!47507 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47507 a!2862) intermediateBeforeIndex!19) (select (arr!47507 a!2862) j!93))))))

(declare-fun b!1453352 () Bool)

(declare-fun res!984373 () Bool)

(assert (=> b!1453352 (=> (not res!984373) (not e!818031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453352 (= res!984373 (validKeyInArray!0 (select (arr!47507 a!2862) j!93)))))

(declare-fun b!1453353 () Bool)

(declare-fun res!984370 () Bool)

(assert (=> b!1453353 (=> (not res!984370) (not e!818031))))

(assert (=> b!1453353 (= res!984370 (validKeyInArray!0 (select (arr!47507 a!2862) i!1006)))))

(declare-fun b!1453354 () Bool)

(declare-fun lt!637215 () (_ BitVec 64))

(declare-fun lt!637212 () array!98438)

(declare-fun e!818035 () Bool)

(declare-datatypes ((SeekEntryResult!11759 0))(
  ( (MissingZero!11759 (index!49428 (_ BitVec 32))) (Found!11759 (index!49429 (_ BitVec 32))) (Intermediate!11759 (undefined!12571 Bool) (index!49430 (_ BitVec 32)) (x!131072 (_ BitVec 32))) (Undefined!11759) (MissingVacant!11759 (index!49431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98438 (_ BitVec 32)) SeekEntryResult!11759)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98438 (_ BitVec 32)) SeekEntryResult!11759)

(assert (=> b!1453354 (= e!818035 (= (seekEntryOrOpen!0 lt!637215 lt!637212 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637215 lt!637212 mask!2687)))))

(declare-fun b!1453355 () Bool)

(declare-fun e!818029 () Bool)

(assert (=> b!1453355 (= e!818029 e!818028)))

(declare-fun res!984366 () Bool)

(assert (=> b!1453355 (=> (not res!984366) (not e!818028))))

(declare-fun lt!637210 () SeekEntryResult!11759)

(assert (=> b!1453355 (= res!984366 (= lt!637210 (Intermediate!11759 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98438 (_ BitVec 32)) SeekEntryResult!11759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453355 (= lt!637210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637215 mask!2687) lt!637215 lt!637212 mask!2687))))

(assert (=> b!1453355 (= lt!637215 (select (store (arr!47507 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453356 () Bool)

(assert (=> b!1453356 (= e!818028 (not (or (and (= (select (arr!47507 a!2862) index!646) (select (store (arr!47507 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47507 a!2862) index!646) (select (arr!47507 a!2862) j!93))) (= (select (arr!47507 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1453356 e!818032))

(declare-fun res!984374 () Bool)

(assert (=> b!1453356 (=> (not res!984374) (not e!818032))))

(assert (=> b!1453356 (= res!984374 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49014 0))(
  ( (Unit!49015) )
))
(declare-fun lt!637214 () Unit!49014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49014)

(assert (=> b!1453356 (= lt!637214 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453357 () Bool)

(declare-fun res!984369 () Bool)

(assert (=> b!1453357 (=> (not res!984369) (not e!818032))))

(assert (=> b!1453357 (= res!984369 (= (seekEntryOrOpen!0 (select (arr!47507 a!2862) j!93) a!2862 mask!2687) (Found!11759 j!93)))))

(declare-fun res!984376 () Bool)

(assert (=> start!124990 (=> (not res!984376) (not e!818031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124990 (= res!984376 (validMask!0 mask!2687))))

(assert (=> start!124990 e!818031))

(assert (=> start!124990 true))

(declare-fun array_inv!36535 (array!98438) Bool)

(assert (=> start!124990 (array_inv!36535 a!2862)))

(declare-fun b!1453358 () Bool)

(declare-fun e!818030 () Bool)

(assert (=> b!1453358 (= e!818030 e!818035)))

(declare-fun res!984365 () Bool)

(assert (=> b!1453358 (=> (not res!984365) (not e!818035))))

(declare-fun lt!637211 () (_ BitVec 64))

(assert (=> b!1453358 (= res!984365 (and (= index!646 intermediateAfterIndex!19) (= lt!637211 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453359 () Bool)

(declare-fun e!818034 () Bool)

(assert (=> b!1453359 (= e!818034 e!818029)))

(declare-fun res!984378 () Bool)

(assert (=> b!1453359 (=> (not res!984378) (not e!818029))))

(declare-fun lt!637213 () SeekEntryResult!11759)

(assert (=> b!1453359 (= res!984378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47507 a!2862) j!93) mask!2687) (select (arr!47507 a!2862) j!93) a!2862 mask!2687) lt!637213))))

(assert (=> b!1453359 (= lt!637213 (Intermediate!11759 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!818033 () Bool)

(declare-fun b!1453360 () Bool)

(assert (=> b!1453360 (= e!818033 (= lt!637210 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637215 lt!637212 mask!2687)))))

(declare-fun b!1453361 () Bool)

(assert (=> b!1453361 (= e!818031 e!818034)))

(declare-fun res!984379 () Bool)

(assert (=> b!1453361 (=> (not res!984379) (not e!818034))))

(assert (=> b!1453361 (= res!984379 (= (select (store (arr!47507 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453361 (= lt!637212 (array!98439 (store (arr!47507 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48057 a!2862)))))

(declare-fun b!1453362 () Bool)

(declare-fun res!984381 () Bool)

(assert (=> b!1453362 (=> (not res!984381) (not e!818028))))

(assert (=> b!1453362 (= res!984381 e!818033)))

(declare-fun c!134001 () Bool)

(assert (=> b!1453362 (= c!134001 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453363 () Bool)

(declare-fun res!984382 () Bool)

(assert (=> b!1453363 (=> (not res!984382) (not e!818029))))

(assert (=> b!1453363 (= res!984382 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47507 a!2862) j!93) a!2862 mask!2687) lt!637213))))

(declare-fun b!1453364 () Bool)

(assert (=> b!1453364 (= e!818033 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637215 lt!637212 mask!2687) (seekEntryOrOpen!0 lt!637215 lt!637212 mask!2687)))))

(declare-fun b!1453365 () Bool)

(assert (=> b!1453365 (= e!818032 e!818030)))

(declare-fun res!984372 () Bool)

(assert (=> b!1453365 (=> res!984372 e!818030)))

(assert (=> b!1453365 (= res!984372 (or (and (= (select (arr!47507 a!2862) index!646) lt!637211) (= (select (arr!47507 a!2862) index!646) (select (arr!47507 a!2862) j!93))) (= (select (arr!47507 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453365 (= lt!637211 (select (store (arr!47507 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(assert (= (and start!124990 res!984376) b!1453347))

(assert (= (and b!1453347 res!984377) b!1453353))

(assert (= (and b!1453353 res!984370) b!1453352))

(assert (= (and b!1453352 res!984373) b!1453348))

(assert (= (and b!1453348 res!984375) b!1453350))

(assert (= (and b!1453350 res!984367) b!1453349))

(assert (= (and b!1453349 res!984380) b!1453361))

(assert (= (and b!1453361 res!984379) b!1453359))

(assert (= (and b!1453359 res!984378) b!1453363))

(assert (= (and b!1453363 res!984382) b!1453355))

(assert (= (and b!1453355 res!984366) b!1453362))

(assert (= (and b!1453362 c!134001) b!1453360))

(assert (= (and b!1453362 (not c!134001)) b!1453364))

(assert (= (and b!1453362 res!984381) b!1453346))

(assert (= (and b!1453346 res!984368) b!1453356))

(assert (= (and b!1453356 res!984374) b!1453357))

(assert (= (and b!1453357 res!984369) b!1453351))

(assert (= (and b!1453351 res!984371) b!1453365))

(assert (= (and b!1453365 (not res!984372)) b!1453358))

(assert (= (and b!1453358 res!984365) b!1453354))

(declare-fun m!1341841 () Bool)

(assert (=> b!1453360 m!1341841))

(declare-fun m!1341843 () Bool)

(assert (=> b!1453359 m!1341843))

(assert (=> b!1453359 m!1341843))

(declare-fun m!1341845 () Bool)

(assert (=> b!1453359 m!1341845))

(assert (=> b!1453359 m!1341845))

(assert (=> b!1453359 m!1341843))

(declare-fun m!1341847 () Bool)

(assert (=> b!1453359 m!1341847))

(assert (=> b!1453357 m!1341843))

(assert (=> b!1453357 m!1341843))

(declare-fun m!1341849 () Bool)

(assert (=> b!1453357 m!1341849))

(declare-fun m!1341851 () Bool)

(assert (=> b!1453348 m!1341851))

(declare-fun m!1341853 () Bool)

(assert (=> b!1453350 m!1341853))

(declare-fun m!1341855 () Bool)

(assert (=> b!1453364 m!1341855))

(declare-fun m!1341857 () Bool)

(assert (=> b!1453364 m!1341857))

(declare-fun m!1341859 () Bool)

(assert (=> b!1453365 m!1341859))

(assert (=> b!1453365 m!1341843))

(declare-fun m!1341861 () Bool)

(assert (=> b!1453365 m!1341861))

(declare-fun m!1341863 () Bool)

(assert (=> b!1453365 m!1341863))

(declare-fun m!1341865 () Bool)

(assert (=> start!124990 m!1341865))

(declare-fun m!1341867 () Bool)

(assert (=> start!124990 m!1341867))

(declare-fun m!1341869 () Bool)

(assert (=> b!1453353 m!1341869))

(assert (=> b!1453353 m!1341869))

(declare-fun m!1341871 () Bool)

(assert (=> b!1453353 m!1341871))

(declare-fun m!1341873 () Bool)

(assert (=> b!1453355 m!1341873))

(assert (=> b!1453355 m!1341873))

(declare-fun m!1341875 () Bool)

(assert (=> b!1453355 m!1341875))

(assert (=> b!1453355 m!1341861))

(declare-fun m!1341877 () Bool)

(assert (=> b!1453355 m!1341877))

(assert (=> b!1453354 m!1341857))

(assert (=> b!1453354 m!1341855))

(assert (=> b!1453361 m!1341861))

(declare-fun m!1341879 () Bool)

(assert (=> b!1453361 m!1341879))

(declare-fun m!1341881 () Bool)

(assert (=> b!1453356 m!1341881))

(assert (=> b!1453356 m!1341861))

(assert (=> b!1453356 m!1341863))

(assert (=> b!1453356 m!1341859))

(declare-fun m!1341883 () Bool)

(assert (=> b!1453356 m!1341883))

(assert (=> b!1453356 m!1341843))

(assert (=> b!1453363 m!1341843))

(assert (=> b!1453363 m!1341843))

(declare-fun m!1341885 () Bool)

(assert (=> b!1453363 m!1341885))

(declare-fun m!1341887 () Bool)

(assert (=> b!1453351 m!1341887))

(assert (=> b!1453351 m!1341843))

(assert (=> b!1453352 m!1341843))

(assert (=> b!1453352 m!1341843))

(declare-fun m!1341889 () Bool)

(assert (=> b!1453352 m!1341889))

(push 1)

(assert (not b!1453364))

(assert (not b!1453360))

(assert (not b!1453355))

(assert (not start!124990))

(assert (not b!1453354))

(assert (not b!1453359))

(assert (not b!1453350))

(assert (not b!1453353))

(assert (not b!1453356))

(assert (not b!1453348))

(assert (not b!1453363))

(assert (not b!1453357))

(assert (not b!1453352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

