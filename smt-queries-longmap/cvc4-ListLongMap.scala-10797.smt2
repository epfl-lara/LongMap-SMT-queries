; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126374 () Bool)

(assert start!126374)

(declare-fun b!1481363 () Bool)

(declare-fun res!1006705 () Bool)

(declare-fun e!830845 () Bool)

(assert (=> b!1481363 (=> (not res!1006705) (not e!830845))))

(declare-fun e!830846 () Bool)

(assert (=> b!1481363 (= res!1006705 e!830846)))

(declare-fun c!136854 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481363 (= c!136854 (bvsle x!665 intermediateAfterX!19))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646756 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99393 0))(
  ( (array!99394 (arr!47974 (Array (_ BitVec 32) (_ BitVec 64))) (size!48524 (_ BitVec 32))) )
))
(declare-fun lt!646757 () array!99393)

(declare-datatypes ((SeekEntryResult!12214 0))(
  ( (MissingZero!12214 (index!51248 (_ BitVec 32))) (Found!12214 (index!51249 (_ BitVec 32))) (Intermediate!12214 (undefined!13026 Bool) (index!51250 (_ BitVec 32)) (x!132833 (_ BitVec 32))) (Undefined!12214) (MissingVacant!12214 (index!51251 (_ BitVec 32))) )
))
(declare-fun lt!646758 () SeekEntryResult!12214)

(declare-fun b!1481364 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99393 (_ BitVec 32)) SeekEntryResult!12214)

(assert (=> b!1481364 (= e!830846 (= lt!646758 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646756 lt!646757 mask!2687)))))

(declare-fun b!1481366 () Bool)

(declare-fun res!1006708 () Bool)

(assert (=> b!1481366 (=> (not res!1006708) (not e!830845))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481366 (= res!1006708 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481367 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99393 (_ BitVec 32)) SeekEntryResult!12214)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99393 (_ BitVec 32)) SeekEntryResult!12214)

(assert (=> b!1481367 (= e!830846 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646756 lt!646757 mask!2687) (seekEntryOrOpen!0 lt!646756 lt!646757 mask!2687)))))

(declare-fun b!1481368 () Bool)

(declare-fun res!1006704 () Bool)

(declare-fun e!830849 () Bool)

(assert (=> b!1481368 (=> (not res!1006704) (not e!830849))))

(declare-fun a!2862 () array!99393)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481368 (= res!1006704 (validKeyInArray!0 (select (arr!47974 a!2862) i!1006)))))

(declare-fun b!1481369 () Bool)

(declare-fun res!1006707 () Bool)

(assert (=> b!1481369 (=> (not res!1006707) (not e!830849))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1481369 (= res!1006707 (validKeyInArray!0 (select (arr!47974 a!2862) j!93)))))

(declare-fun b!1481370 () Bool)

(declare-fun res!1006706 () Bool)

(declare-fun e!830847 () Bool)

(assert (=> b!1481370 (=> (not res!1006706) (not e!830847))))

(assert (=> b!1481370 (= res!1006706 (= (seekEntryOrOpen!0 (select (arr!47974 a!2862) j!93) a!2862 mask!2687) (Found!12214 j!93)))))

(declare-fun b!1481371 () Bool)

(declare-fun e!830848 () Bool)

(assert (=> b!1481371 (= e!830848 e!830845)))

(declare-fun res!1006710 () Bool)

(assert (=> b!1481371 (=> (not res!1006710) (not e!830845))))

(assert (=> b!1481371 (= res!1006710 (= lt!646758 (Intermediate!12214 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481371 (= lt!646758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646756 mask!2687) lt!646756 lt!646757 mask!2687))))

(assert (=> b!1481371 (= lt!646756 (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481365 () Bool)

(declare-fun res!1006699 () Bool)

(assert (=> b!1481365 (=> (not res!1006699) (not e!830849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99393 (_ BitVec 32)) Bool)

(assert (=> b!1481365 (= res!1006699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1006702 () Bool)

(assert (=> start!126374 (=> (not res!1006702) (not e!830849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126374 (= res!1006702 (validMask!0 mask!2687))))

(assert (=> start!126374 e!830849))

(assert (=> start!126374 true))

(declare-fun array_inv!37002 (array!99393) Bool)

(assert (=> start!126374 (array_inv!37002 a!2862)))

(declare-fun b!1481372 () Bool)

(assert (=> b!1481372 (= e!830845 (not true))))

(assert (=> b!1481372 e!830847))

(declare-fun res!1006709 () Bool)

(assert (=> b!1481372 (=> (not res!1006709) (not e!830847))))

(assert (=> b!1481372 (= res!1006709 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49768 0))(
  ( (Unit!49769) )
))
(declare-fun lt!646754 () Unit!49768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49768)

(assert (=> b!1481372 (= lt!646754 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481373 () Bool)

(declare-fun e!830843 () Bool)

(assert (=> b!1481373 (= e!830843 e!830848)))

(declare-fun res!1006698 () Bool)

(assert (=> b!1481373 (=> (not res!1006698) (not e!830848))))

(declare-fun lt!646755 () SeekEntryResult!12214)

(assert (=> b!1481373 (= res!1006698 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47974 a!2862) j!93) mask!2687) (select (arr!47974 a!2862) j!93) a!2862 mask!2687) lt!646755))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1481373 (= lt!646755 (Intermediate!12214 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481374 () Bool)

(declare-fun res!1006703 () Bool)

(assert (=> b!1481374 (=> (not res!1006703) (not e!830849))))

(assert (=> b!1481374 (= res!1006703 (and (= (size!48524 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48524 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48524 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481375 () Bool)

(assert (=> b!1481375 (= e!830847 (and (or (= (select (arr!47974 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47974 a!2862) intermediateBeforeIndex!19) (select (arr!47974 a!2862) j!93))) (or (and (= (select (arr!47974 a!2862) index!646) (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47974 a!2862) index!646) (select (arr!47974 a!2862) j!93))) (= (select (arr!47974 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481376 () Bool)

(declare-fun res!1006697 () Bool)

(assert (=> b!1481376 (=> (not res!1006697) (not e!830849))))

(declare-datatypes ((List!34475 0))(
  ( (Nil!34472) (Cons!34471 (h!35842 (_ BitVec 64)) (t!49169 List!34475)) )
))
(declare-fun arrayNoDuplicates!0 (array!99393 (_ BitVec 32) List!34475) Bool)

(assert (=> b!1481376 (= res!1006697 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34472))))

(declare-fun b!1481377 () Bool)

(declare-fun res!1006701 () Bool)

(assert (=> b!1481377 (=> (not res!1006701) (not e!830848))))

(assert (=> b!1481377 (= res!1006701 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47974 a!2862) j!93) a!2862 mask!2687) lt!646755))))

(declare-fun b!1481378 () Bool)

(assert (=> b!1481378 (= e!830849 e!830843)))

(declare-fun res!1006711 () Bool)

(assert (=> b!1481378 (=> (not res!1006711) (not e!830843))))

(assert (=> b!1481378 (= res!1006711 (= (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481378 (= lt!646757 (array!99394 (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48524 a!2862)))))

(declare-fun b!1481379 () Bool)

(declare-fun res!1006700 () Bool)

(assert (=> b!1481379 (=> (not res!1006700) (not e!830849))))

(assert (=> b!1481379 (= res!1006700 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48524 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48524 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48524 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126374 res!1006702) b!1481374))

(assert (= (and b!1481374 res!1006703) b!1481368))

(assert (= (and b!1481368 res!1006704) b!1481369))

(assert (= (and b!1481369 res!1006707) b!1481365))

(assert (= (and b!1481365 res!1006699) b!1481376))

(assert (= (and b!1481376 res!1006697) b!1481379))

(assert (= (and b!1481379 res!1006700) b!1481378))

(assert (= (and b!1481378 res!1006711) b!1481373))

(assert (= (and b!1481373 res!1006698) b!1481377))

(assert (= (and b!1481377 res!1006701) b!1481371))

(assert (= (and b!1481371 res!1006710) b!1481363))

(assert (= (and b!1481363 c!136854) b!1481364))

(assert (= (and b!1481363 (not c!136854)) b!1481367))

(assert (= (and b!1481363 res!1006705) b!1481366))

(assert (= (and b!1481366 res!1006708) b!1481372))

(assert (= (and b!1481372 res!1006709) b!1481370))

(assert (= (and b!1481370 res!1006706) b!1481375))

(declare-fun m!1367105 () Bool)

(assert (=> b!1481376 m!1367105))

(declare-fun m!1367107 () Bool)

(assert (=> b!1481377 m!1367107))

(assert (=> b!1481377 m!1367107))

(declare-fun m!1367109 () Bool)

(assert (=> b!1481377 m!1367109))

(declare-fun m!1367111 () Bool)

(assert (=> b!1481375 m!1367111))

(declare-fun m!1367113 () Bool)

(assert (=> b!1481375 m!1367113))

(declare-fun m!1367115 () Bool)

(assert (=> b!1481375 m!1367115))

(declare-fun m!1367117 () Bool)

(assert (=> b!1481375 m!1367117))

(assert (=> b!1481375 m!1367107))

(assert (=> b!1481378 m!1367111))

(declare-fun m!1367119 () Bool)

(assert (=> b!1481378 m!1367119))

(declare-fun m!1367121 () Bool)

(assert (=> b!1481371 m!1367121))

(assert (=> b!1481371 m!1367121))

(declare-fun m!1367123 () Bool)

(assert (=> b!1481371 m!1367123))

(assert (=> b!1481371 m!1367111))

(declare-fun m!1367125 () Bool)

(assert (=> b!1481371 m!1367125))

(assert (=> b!1481369 m!1367107))

(assert (=> b!1481369 m!1367107))

(declare-fun m!1367127 () Bool)

(assert (=> b!1481369 m!1367127))

(assert (=> b!1481373 m!1367107))

(assert (=> b!1481373 m!1367107))

(declare-fun m!1367129 () Bool)

(assert (=> b!1481373 m!1367129))

(assert (=> b!1481373 m!1367129))

(assert (=> b!1481373 m!1367107))

(declare-fun m!1367131 () Bool)

(assert (=> b!1481373 m!1367131))

(declare-fun m!1367133 () Bool)

(assert (=> b!1481365 m!1367133))

(assert (=> b!1481370 m!1367107))

(assert (=> b!1481370 m!1367107))

(declare-fun m!1367135 () Bool)

(assert (=> b!1481370 m!1367135))

(declare-fun m!1367137 () Bool)

(assert (=> b!1481364 m!1367137))

(declare-fun m!1367139 () Bool)

(assert (=> b!1481372 m!1367139))

(declare-fun m!1367141 () Bool)

(assert (=> b!1481372 m!1367141))

(declare-fun m!1367143 () Bool)

(assert (=> b!1481367 m!1367143))

(declare-fun m!1367145 () Bool)

(assert (=> b!1481367 m!1367145))

(declare-fun m!1367147 () Bool)

(assert (=> start!126374 m!1367147))

(declare-fun m!1367149 () Bool)

(assert (=> start!126374 m!1367149))

(declare-fun m!1367151 () Bool)

(assert (=> b!1481368 m!1367151))

(assert (=> b!1481368 m!1367151))

(declare-fun m!1367153 () Bool)

(assert (=> b!1481368 m!1367153))

(push 1)

