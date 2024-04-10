; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126398 () Bool)

(assert start!126398)

(declare-fun b!1481975 () Bool)

(declare-fun e!831095 () Bool)

(assert (=> b!1481975 (= e!831095 (not true))))

(declare-fun e!831099 () Bool)

(assert (=> b!1481975 e!831099))

(declare-fun res!1007243 () Bool)

(assert (=> b!1481975 (=> (not res!1007243) (not e!831099))))

(declare-datatypes ((array!99417 0))(
  ( (array!99418 (arr!47986 (Array (_ BitVec 32) (_ BitVec 64))) (size!48536 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99417)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99417 (_ BitVec 32)) Bool)

(assert (=> b!1481975 (= res!1007243 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49792 0))(
  ( (Unit!49793) )
))
(declare-fun lt!646938 () Unit!49792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49792)

(assert (=> b!1481975 (= lt!646938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481976 () Bool)

(declare-fun res!1007240 () Bool)

(assert (=> b!1481976 (=> (not res!1007240) (not e!831095))))

(declare-fun e!831100 () Bool)

(assert (=> b!1481976 (= res!1007240 e!831100)))

(declare-fun c!136890 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481976 (= c!136890 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481977 () Bool)

(declare-fun res!1007251 () Bool)

(declare-fun e!831101 () Bool)

(assert (=> b!1481977 (=> (not res!1007251) (not e!831101))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481977 (= res!1007251 (and (= (size!48536 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48536 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48536 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481978 () Bool)

(declare-fun res!1007247 () Bool)

(declare-fun e!831098 () Bool)

(assert (=> b!1481978 (=> (not res!1007247) (not e!831098))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12226 0))(
  ( (MissingZero!12226 (index!51296 (_ BitVec 32))) (Found!12226 (index!51297 (_ BitVec 32))) (Intermediate!12226 (undefined!13038 Bool) (index!51298 (_ BitVec 32)) (x!132877 (_ BitVec 32))) (Undefined!12226) (MissingVacant!12226 (index!51299 (_ BitVec 32))) )
))
(declare-fun lt!646935 () SeekEntryResult!12226)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99417 (_ BitVec 32)) SeekEntryResult!12226)

(assert (=> b!1481978 (= res!1007247 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47986 a!2862) j!93) a!2862 mask!2687) lt!646935))))

(declare-fun res!1007239 () Bool)

(assert (=> start!126398 (=> (not res!1007239) (not e!831101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126398 (= res!1007239 (validMask!0 mask!2687))))

(assert (=> start!126398 e!831101))

(assert (=> start!126398 true))

(declare-fun array_inv!37014 (array!99417) Bool)

(assert (=> start!126398 (array_inv!37014 a!2862)))

(declare-fun b!1481979 () Bool)

(declare-fun lt!646934 () (_ BitVec 64))

(declare-fun lt!646936 () array!99417)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99417 (_ BitVec 32)) SeekEntryResult!12226)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99417 (_ BitVec 32)) SeekEntryResult!12226)

(assert (=> b!1481979 (= e!831100 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646934 lt!646936 mask!2687) (seekEntryOrOpen!0 lt!646934 lt!646936 mask!2687)))))

(declare-fun b!1481980 () Bool)

(declare-fun res!1007241 () Bool)

(assert (=> b!1481980 (=> (not res!1007241) (not e!831101))))

(assert (=> b!1481980 (= res!1007241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481981 () Bool)

(declare-fun res!1007244 () Bool)

(assert (=> b!1481981 (=> (not res!1007244) (not e!831099))))

(assert (=> b!1481981 (= res!1007244 (= (seekEntryOrOpen!0 (select (arr!47986 a!2862) j!93) a!2862 mask!2687) (Found!12226 j!93)))))

(declare-fun b!1481982 () Bool)

(declare-fun res!1007249 () Bool)

(assert (=> b!1481982 (=> (not res!1007249) (not e!831101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481982 (= res!1007249 (validKeyInArray!0 (select (arr!47986 a!2862) j!93)))))

(declare-fun b!1481983 () Bool)

(declare-fun e!831096 () Bool)

(assert (=> b!1481983 (= e!831101 e!831096)))

(declare-fun res!1007245 () Bool)

(assert (=> b!1481983 (=> (not res!1007245) (not e!831096))))

(assert (=> b!1481983 (= res!1007245 (= (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481983 (= lt!646936 (array!99418 (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48536 a!2862)))))

(declare-fun b!1481984 () Bool)

(declare-fun res!1007250 () Bool)

(assert (=> b!1481984 (=> (not res!1007250) (not e!831101))))

(declare-datatypes ((List!34487 0))(
  ( (Nil!34484) (Cons!34483 (h!35854 (_ BitVec 64)) (t!49181 List!34487)) )
))
(declare-fun arrayNoDuplicates!0 (array!99417 (_ BitVec 32) List!34487) Bool)

(assert (=> b!1481984 (= res!1007250 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34484))))

(declare-fun b!1481985 () Bool)

(assert (=> b!1481985 (= e!831096 e!831098)))

(declare-fun res!1007248 () Bool)

(assert (=> b!1481985 (=> (not res!1007248) (not e!831098))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481985 (= res!1007248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47986 a!2862) j!93) mask!2687) (select (arr!47986 a!2862) j!93) a!2862 mask!2687) lt!646935))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481985 (= lt!646935 (Intermediate!12226 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481986 () Bool)

(declare-fun res!1007242 () Bool)

(assert (=> b!1481986 (=> (not res!1007242) (not e!831095))))

(assert (=> b!1481986 (= res!1007242 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481987 () Bool)

(declare-fun res!1007237 () Bool)

(assert (=> b!1481987 (=> (not res!1007237) (not e!831101))))

(assert (=> b!1481987 (= res!1007237 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48536 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48536 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48536 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481988 () Bool)

(declare-fun lt!646937 () SeekEntryResult!12226)

(assert (=> b!1481988 (= e!831100 (= lt!646937 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646934 lt!646936 mask!2687)))))

(declare-fun b!1481989 () Bool)

(declare-fun res!1007246 () Bool)

(assert (=> b!1481989 (=> (not res!1007246) (not e!831101))))

(assert (=> b!1481989 (= res!1007246 (validKeyInArray!0 (select (arr!47986 a!2862) i!1006)))))

(declare-fun b!1481990 () Bool)

(assert (=> b!1481990 (= e!831099 (and (or (= (select (arr!47986 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47986 a!2862) intermediateBeforeIndex!19) (select (arr!47986 a!2862) j!93))) (or (and (= (select (arr!47986 a!2862) index!646) (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47986 a!2862) index!646) (select (arr!47986 a!2862) j!93))) (= (select (arr!47986 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481991 () Bool)

(assert (=> b!1481991 (= e!831098 e!831095)))

(declare-fun res!1007238 () Bool)

(assert (=> b!1481991 (=> (not res!1007238) (not e!831095))))

(assert (=> b!1481991 (= res!1007238 (= lt!646937 (Intermediate!12226 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481991 (= lt!646937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646934 mask!2687) lt!646934 lt!646936 mask!2687))))

(assert (=> b!1481991 (= lt!646934 (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126398 res!1007239) b!1481977))

(assert (= (and b!1481977 res!1007251) b!1481989))

(assert (= (and b!1481989 res!1007246) b!1481982))

(assert (= (and b!1481982 res!1007249) b!1481980))

(assert (= (and b!1481980 res!1007241) b!1481984))

(assert (= (and b!1481984 res!1007250) b!1481987))

(assert (= (and b!1481987 res!1007237) b!1481983))

(assert (= (and b!1481983 res!1007245) b!1481985))

(assert (= (and b!1481985 res!1007248) b!1481978))

(assert (= (and b!1481978 res!1007247) b!1481991))

(assert (= (and b!1481991 res!1007238) b!1481976))

(assert (= (and b!1481976 c!136890) b!1481988))

(assert (= (and b!1481976 (not c!136890)) b!1481979))

(assert (= (and b!1481976 res!1007240) b!1481986))

(assert (= (and b!1481986 res!1007242) b!1481975))

(assert (= (and b!1481975 res!1007243) b!1481981))

(assert (= (and b!1481981 res!1007244) b!1481990))

(declare-fun m!1367705 () Bool)

(assert (=> b!1481982 m!1367705))

(assert (=> b!1481982 m!1367705))

(declare-fun m!1367707 () Bool)

(assert (=> b!1481982 m!1367707))

(declare-fun m!1367709 () Bool)

(assert (=> b!1481984 m!1367709))

(declare-fun m!1367711 () Bool)

(assert (=> b!1481979 m!1367711))

(declare-fun m!1367713 () Bool)

(assert (=> b!1481979 m!1367713))

(assert (=> b!1481985 m!1367705))

(assert (=> b!1481985 m!1367705))

(declare-fun m!1367715 () Bool)

(assert (=> b!1481985 m!1367715))

(assert (=> b!1481985 m!1367715))

(assert (=> b!1481985 m!1367705))

(declare-fun m!1367717 () Bool)

(assert (=> b!1481985 m!1367717))

(declare-fun m!1367719 () Bool)

(assert (=> b!1481983 m!1367719))

(declare-fun m!1367721 () Bool)

(assert (=> b!1481983 m!1367721))

(declare-fun m!1367723 () Bool)

(assert (=> b!1481989 m!1367723))

(assert (=> b!1481989 m!1367723))

(declare-fun m!1367725 () Bool)

(assert (=> b!1481989 m!1367725))

(assert (=> b!1481990 m!1367719))

(declare-fun m!1367727 () Bool)

(assert (=> b!1481990 m!1367727))

(declare-fun m!1367729 () Bool)

(assert (=> b!1481990 m!1367729))

(declare-fun m!1367731 () Bool)

(assert (=> b!1481990 m!1367731))

(assert (=> b!1481990 m!1367705))

(declare-fun m!1367733 () Bool)

(assert (=> b!1481988 m!1367733))

(assert (=> b!1481981 m!1367705))

(assert (=> b!1481981 m!1367705))

(declare-fun m!1367735 () Bool)

(assert (=> b!1481981 m!1367735))

(assert (=> b!1481978 m!1367705))

(assert (=> b!1481978 m!1367705))

(declare-fun m!1367737 () Bool)

(assert (=> b!1481978 m!1367737))

(declare-fun m!1367739 () Bool)

(assert (=> b!1481980 m!1367739))

(declare-fun m!1367741 () Bool)

(assert (=> b!1481975 m!1367741))

(declare-fun m!1367743 () Bool)

(assert (=> b!1481975 m!1367743))

(declare-fun m!1367745 () Bool)

(assert (=> b!1481991 m!1367745))

(assert (=> b!1481991 m!1367745))

(declare-fun m!1367747 () Bool)

(assert (=> b!1481991 m!1367747))

(assert (=> b!1481991 m!1367719))

(declare-fun m!1367749 () Bool)

(assert (=> b!1481991 m!1367749))

(declare-fun m!1367751 () Bool)

(assert (=> start!126398 m!1367751))

(declare-fun m!1367753 () Bool)

(assert (=> start!126398 m!1367753))

(push 1)

