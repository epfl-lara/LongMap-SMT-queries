; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125794 () Bool)

(assert start!125794)

(declare-fun b!1472417 () Bool)

(declare-fun e!826344 () Bool)

(declare-fun e!826342 () Bool)

(assert (=> b!1472417 (= e!826344 e!826342)))

(declare-fun res!1000095 () Bool)

(assert (=> b!1472417 (=> (not res!1000095) (not e!826342))))

(declare-datatypes ((array!99128 0))(
  ( (array!99129 (arr!47849 (Array (_ BitVec 32) (_ BitVec 64))) (size!48399 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99128)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12089 0))(
  ( (MissingZero!12089 (index!50748 (_ BitVec 32))) (Found!12089 (index!50749 (_ BitVec 32))) (Intermediate!12089 (undefined!12901 Bool) (index!50750 (_ BitVec 32)) (x!132332 (_ BitVec 32))) (Undefined!12089) (MissingVacant!12089 (index!50751 (_ BitVec 32))) )
))
(declare-fun lt!643566 () SeekEntryResult!12089)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99128 (_ BitVec 32)) SeekEntryResult!12089)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472417 (= res!1000095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47849 a!2862) j!93) mask!2687) (select (arr!47849 a!2862) j!93) a!2862 mask!2687) lt!643566))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472417 (= lt!643566 (Intermediate!12089 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643568 () (_ BitVec 64))

(declare-fun b!1472418 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!826341 () Bool)

(declare-fun lt!643567 () array!99128)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99128 (_ BitVec 32)) SeekEntryResult!12089)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99128 (_ BitVec 32)) SeekEntryResult!12089)

(assert (=> b!1472418 (= e!826341 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643568 lt!643567 mask!2687) (seekEntryOrOpen!0 lt!643568 lt!643567 mask!2687)))))

(declare-fun b!1472419 () Bool)

(declare-fun res!1000091 () Bool)

(declare-fun e!826346 () Bool)

(assert (=> b!1472419 (=> (not res!1000091) (not e!826346))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472419 (= res!1000091 (validKeyInArray!0 (select (arr!47849 a!2862) i!1006)))))

(declare-fun b!1472420 () Bool)

(declare-fun e!826343 () Bool)

(assert (=> b!1472420 (= e!826342 e!826343)))

(declare-fun res!1000096 () Bool)

(assert (=> b!1472420 (=> (not res!1000096) (not e!826343))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!643569 () SeekEntryResult!12089)

(assert (=> b!1472420 (= res!1000096 (= lt!643569 (Intermediate!12089 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472420 (= lt!643569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643568 mask!2687) lt!643568 lt!643567 mask!2687))))

(assert (=> b!1472420 (= lt!643568 (select (store (arr!47849 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472421 () Bool)

(declare-fun res!1000092 () Bool)

(declare-fun e!826340 () Bool)

(assert (=> b!1472421 (=> (not res!1000092) (not e!826340))))

(assert (=> b!1472421 (= res!1000092 (= (seekEntryOrOpen!0 (select (arr!47849 a!2862) j!93) a!2862 mask!2687) (Found!12089 j!93)))))

(declare-fun b!1472422 () Bool)

(assert (=> b!1472422 (= e!826340 (or (= (select (arr!47849 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47849 a!2862) intermediateBeforeIndex!19) (select (arr!47849 a!2862) j!93))))))

(declare-fun b!1472423 () Bool)

(assert (=> b!1472423 (= e!826343 (not true))))

(assert (=> b!1472423 e!826340))

(declare-fun res!1000082 () Bool)

(assert (=> b!1472423 (=> (not res!1000082) (not e!826340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99128 (_ BitVec 32)) Bool)

(assert (=> b!1472423 (= res!1000082 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49518 0))(
  ( (Unit!49519) )
))
(declare-fun lt!643565 () Unit!49518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49518)

(assert (=> b!1472423 (= lt!643565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472424 () Bool)

(declare-fun res!1000086 () Bool)

(assert (=> b!1472424 (=> (not res!1000086) (not e!826343))))

(assert (=> b!1472424 (= res!1000086 e!826341)))

(declare-fun c!135681 () Bool)

(assert (=> b!1472424 (= c!135681 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472425 () Bool)

(assert (=> b!1472425 (= e!826346 e!826344)))

(declare-fun res!1000087 () Bool)

(assert (=> b!1472425 (=> (not res!1000087) (not e!826344))))

(assert (=> b!1472425 (= res!1000087 (= (select (store (arr!47849 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472425 (= lt!643567 (array!99129 (store (arr!47849 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48399 a!2862)))))

(declare-fun b!1472426 () Bool)

(assert (=> b!1472426 (= e!826341 (= lt!643569 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643568 lt!643567 mask!2687)))))

(declare-fun b!1472427 () Bool)

(declare-fun res!1000084 () Bool)

(assert (=> b!1472427 (=> (not res!1000084) (not e!826346))))

(assert (=> b!1472427 (= res!1000084 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48399 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48399 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48399 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472428 () Bool)

(declare-fun res!1000094 () Bool)

(assert (=> b!1472428 (=> (not res!1000094) (not e!826346))))

(assert (=> b!1472428 (= res!1000094 (and (= (size!48399 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48399 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48399 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1000089 () Bool)

(assert (=> start!125794 (=> (not res!1000089) (not e!826346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125794 (= res!1000089 (validMask!0 mask!2687))))

(assert (=> start!125794 e!826346))

(assert (=> start!125794 true))

(declare-fun array_inv!36877 (array!99128) Bool)

(assert (=> start!125794 (array_inv!36877 a!2862)))

(declare-fun b!1472429 () Bool)

(declare-fun res!1000088 () Bool)

(assert (=> b!1472429 (=> (not res!1000088) (not e!826346))))

(assert (=> b!1472429 (= res!1000088 (validKeyInArray!0 (select (arr!47849 a!2862) j!93)))))

(declare-fun b!1472430 () Bool)

(declare-fun res!1000093 () Bool)

(assert (=> b!1472430 (=> (not res!1000093) (not e!826346))))

(declare-datatypes ((List!34350 0))(
  ( (Nil!34347) (Cons!34346 (h!35702 (_ BitVec 64)) (t!49044 List!34350)) )
))
(declare-fun arrayNoDuplicates!0 (array!99128 (_ BitVec 32) List!34350) Bool)

(assert (=> b!1472430 (= res!1000093 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34347))))

(declare-fun b!1472431 () Bool)

(declare-fun res!1000090 () Bool)

(assert (=> b!1472431 (=> (not res!1000090) (not e!826343))))

(assert (=> b!1472431 (= res!1000090 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472432 () Bool)

(declare-fun res!1000083 () Bool)

(assert (=> b!1472432 (=> (not res!1000083) (not e!826346))))

(assert (=> b!1472432 (= res!1000083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472433 () Bool)

(declare-fun res!1000085 () Bool)

(assert (=> b!1472433 (=> (not res!1000085) (not e!826342))))

(assert (=> b!1472433 (= res!1000085 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47849 a!2862) j!93) a!2862 mask!2687) lt!643566))))

(assert (= (and start!125794 res!1000089) b!1472428))

(assert (= (and b!1472428 res!1000094) b!1472419))

(assert (= (and b!1472419 res!1000091) b!1472429))

(assert (= (and b!1472429 res!1000088) b!1472432))

(assert (= (and b!1472432 res!1000083) b!1472430))

(assert (= (and b!1472430 res!1000093) b!1472427))

(assert (= (and b!1472427 res!1000084) b!1472425))

(assert (= (and b!1472425 res!1000087) b!1472417))

(assert (= (and b!1472417 res!1000095) b!1472433))

(assert (= (and b!1472433 res!1000085) b!1472420))

(assert (= (and b!1472420 res!1000096) b!1472424))

(assert (= (and b!1472424 c!135681) b!1472426))

(assert (= (and b!1472424 (not c!135681)) b!1472418))

(assert (= (and b!1472424 res!1000086) b!1472431))

(assert (= (and b!1472431 res!1000090) b!1472423))

(assert (= (and b!1472423 res!1000082) b!1472421))

(assert (= (and b!1472421 res!1000092) b!1472422))

(declare-fun m!1359133 () Bool)

(assert (=> b!1472423 m!1359133))

(declare-fun m!1359135 () Bool)

(assert (=> b!1472423 m!1359135))

(declare-fun m!1359137 () Bool)

(assert (=> b!1472426 m!1359137))

(declare-fun m!1359139 () Bool)

(assert (=> start!125794 m!1359139))

(declare-fun m!1359141 () Bool)

(assert (=> start!125794 m!1359141))

(declare-fun m!1359143 () Bool)

(assert (=> b!1472432 m!1359143))

(declare-fun m!1359145 () Bool)

(assert (=> b!1472425 m!1359145))

(declare-fun m!1359147 () Bool)

(assert (=> b!1472425 m!1359147))

(declare-fun m!1359149 () Bool)

(assert (=> b!1472418 m!1359149))

(declare-fun m!1359151 () Bool)

(assert (=> b!1472418 m!1359151))

(declare-fun m!1359153 () Bool)

(assert (=> b!1472433 m!1359153))

(assert (=> b!1472433 m!1359153))

(declare-fun m!1359155 () Bool)

(assert (=> b!1472433 m!1359155))

(assert (=> b!1472421 m!1359153))

(assert (=> b!1472421 m!1359153))

(declare-fun m!1359157 () Bool)

(assert (=> b!1472421 m!1359157))

(assert (=> b!1472417 m!1359153))

(assert (=> b!1472417 m!1359153))

(declare-fun m!1359159 () Bool)

(assert (=> b!1472417 m!1359159))

(assert (=> b!1472417 m!1359159))

(assert (=> b!1472417 m!1359153))

(declare-fun m!1359161 () Bool)

(assert (=> b!1472417 m!1359161))

(assert (=> b!1472429 m!1359153))

(assert (=> b!1472429 m!1359153))

(declare-fun m!1359163 () Bool)

(assert (=> b!1472429 m!1359163))

(declare-fun m!1359165 () Bool)

(assert (=> b!1472420 m!1359165))

(assert (=> b!1472420 m!1359165))

(declare-fun m!1359167 () Bool)

(assert (=> b!1472420 m!1359167))

(assert (=> b!1472420 m!1359145))

(declare-fun m!1359169 () Bool)

(assert (=> b!1472420 m!1359169))

(declare-fun m!1359171 () Bool)

(assert (=> b!1472419 m!1359171))

(assert (=> b!1472419 m!1359171))

(declare-fun m!1359173 () Bool)

(assert (=> b!1472419 m!1359173))

(declare-fun m!1359175 () Bool)

(assert (=> b!1472422 m!1359175))

(assert (=> b!1472422 m!1359153))

(declare-fun m!1359177 () Bool)

(assert (=> b!1472430 m!1359177))

(push 1)

