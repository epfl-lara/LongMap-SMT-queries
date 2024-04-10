; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125288 () Bool)

(assert start!125288)

(declare-fun b!1462977 () Bool)

(declare-fun e!822316 () Bool)

(declare-fun e!822317 () Bool)

(assert (=> b!1462977 (= e!822316 e!822317)))

(declare-fun res!992327 () Bool)

(assert (=> b!1462977 (=> (not res!992327) (not e!822317))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11908 0))(
  ( (MissingZero!11908 (index!50024 (_ BitVec 32))) (Found!11908 (index!50025 (_ BitVec 32))) (Intermediate!11908 (undefined!12720 Bool) (index!50026 (_ BitVec 32)) (x!131613 (_ BitVec 32))) (Undefined!11908) (MissingVacant!11908 (index!50027 (_ BitVec 32))) )
))
(declare-fun lt!640624 () SeekEntryResult!11908)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462977 (= res!992327 (= lt!640624 (Intermediate!11908 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640620 () (_ BitVec 64))

(declare-datatypes ((array!98736 0))(
  ( (array!98737 (arr!47656 (Array (_ BitVec 32) (_ BitVec 64))) (size!48206 (_ BitVec 32))) )
))
(declare-fun lt!640622 () array!98736)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98736 (_ BitVec 32)) SeekEntryResult!11908)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462977 (= lt!640624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640620 mask!2687) lt!640620 lt!640622 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98736)

(assert (=> b!1462977 (= lt!640620 (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462978 () Bool)

(declare-fun res!992323 () Bool)

(declare-fun e!822311 () Bool)

(assert (=> b!1462978 (=> (not res!992323) (not e!822311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98736 (_ BitVec 32)) Bool)

(assert (=> b!1462978 (= res!992323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!822313 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1462979 () Bool)

(assert (=> b!1462979 (= e!822313 (or (= (select (arr!47656 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47656 a!2862) intermediateBeforeIndex!19) (select (arr!47656 a!2862) j!93))))))

(declare-fun b!1462981 () Bool)

(declare-fun res!992312 () Bool)

(assert (=> b!1462981 (=> (not res!992312) (not e!822311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462981 (= res!992312 (validKeyInArray!0 (select (arr!47656 a!2862) j!93)))))

(declare-fun b!1462982 () Bool)

(declare-fun res!992319 () Bool)

(assert (=> b!1462982 (=> (not res!992319) (not e!822317))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462982 (= res!992319 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!822312 () Bool)

(declare-fun b!1462983 () Bool)

(declare-fun lt!640626 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98736 (_ BitVec 32)) SeekEntryResult!11908)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98736 (_ BitVec 32)) SeekEntryResult!11908)

(assert (=> b!1462983 (= e!822312 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640626 intermediateAfterIndex!19 lt!640620 lt!640622 mask!2687) (seekEntryOrOpen!0 lt!640620 lt!640622 mask!2687))))))

(declare-fun e!822314 () Bool)

(declare-fun b!1462984 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1462984 (= e!822314 (= lt!640624 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640620 lt!640622 mask!2687)))))

(declare-fun b!1462985 () Bool)

(declare-fun e!822319 () Bool)

(assert (=> b!1462985 (= e!822311 e!822319)))

(declare-fun res!992328 () Bool)

(assert (=> b!1462985 (=> (not res!992328) (not e!822319))))

(assert (=> b!1462985 (= res!992328 (= (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462985 (= lt!640622 (array!98737 (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48206 a!2862)))))

(declare-fun b!1462986 () Bool)

(assert (=> b!1462986 (= e!822314 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640620 lt!640622 mask!2687) (seekEntryOrOpen!0 lt!640620 lt!640622 mask!2687)))))

(declare-fun b!1462987 () Bool)

(declare-fun res!992317 () Bool)

(assert (=> b!1462987 (=> (not res!992317) (not e!822311))))

(assert (=> b!1462987 (= res!992317 (validKeyInArray!0 (select (arr!47656 a!2862) i!1006)))))

(declare-fun b!1462988 () Bool)

(declare-fun e!822320 () Bool)

(declare-fun e!822315 () Bool)

(assert (=> b!1462988 (= e!822320 e!822315)))

(declare-fun res!992320 () Bool)

(assert (=> b!1462988 (=> res!992320 e!822315)))

(assert (=> b!1462988 (= res!992320 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640626 #b00000000000000000000000000000000) (bvsge lt!640626 (size!48206 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462988 (= lt!640626 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462989 () Bool)

(declare-fun res!992315 () Bool)

(assert (=> b!1462989 (=> (not res!992315) (not e!822311))))

(assert (=> b!1462989 (= res!992315 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48206 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48206 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48206 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462990 () Bool)

(assert (=> b!1462990 (= e!822312 (not (= lt!640624 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640626 lt!640620 lt!640622 mask!2687))))))

(declare-fun res!992324 () Bool)

(assert (=> start!125288 (=> (not res!992324) (not e!822311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125288 (= res!992324 (validMask!0 mask!2687))))

(assert (=> start!125288 e!822311))

(assert (=> start!125288 true))

(declare-fun array_inv!36684 (array!98736) Bool)

(assert (=> start!125288 (array_inv!36684 a!2862)))

(declare-fun b!1462980 () Bool)

(assert (=> b!1462980 (= e!822319 e!822316)))

(declare-fun res!992316 () Bool)

(assert (=> b!1462980 (=> (not res!992316) (not e!822316))))

(declare-fun lt!640621 () SeekEntryResult!11908)

(assert (=> b!1462980 (= res!992316 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47656 a!2862) j!93) mask!2687) (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640621))))

(assert (=> b!1462980 (= lt!640621 (Intermediate!11908 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462991 () Bool)

(declare-fun res!992329 () Bool)

(assert (=> b!1462991 (=> (not res!992329) (not e!822317))))

(assert (=> b!1462991 (= res!992329 e!822314)))

(declare-fun c!134843 () Bool)

(assert (=> b!1462991 (= c!134843 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462992 () Bool)

(declare-fun res!992321 () Bool)

(assert (=> b!1462992 (=> (not res!992321) (not e!822316))))

(assert (=> b!1462992 (= res!992321 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640621))))

(declare-fun b!1462993 () Bool)

(assert (=> b!1462993 (= e!822317 (not e!822320))))

(declare-fun res!992314 () Bool)

(assert (=> b!1462993 (=> res!992314 e!822320)))

(assert (=> b!1462993 (= res!992314 (or (and (= (select (arr!47656 a!2862) index!646) (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47656 a!2862) index!646) (select (arr!47656 a!2862) j!93))) (= (select (arr!47656 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462993 e!822313))

(declare-fun res!992322 () Bool)

(assert (=> b!1462993 (=> (not res!992322) (not e!822313))))

(assert (=> b!1462993 (= res!992322 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49312 0))(
  ( (Unit!49313) )
))
(declare-fun lt!640625 () Unit!49312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49312)

(assert (=> b!1462993 (= lt!640625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462994 () Bool)

(declare-fun res!992326 () Bool)

(assert (=> b!1462994 (=> (not res!992326) (not e!822311))))

(assert (=> b!1462994 (= res!992326 (and (= (size!48206 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48206 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48206 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462995 () Bool)

(assert (=> b!1462995 (= e!822315 true)))

(declare-fun lt!640623 () Bool)

(assert (=> b!1462995 (= lt!640623 e!822312)))

(declare-fun c!134844 () Bool)

(assert (=> b!1462995 (= c!134844 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462996 () Bool)

(declare-fun res!992318 () Bool)

(assert (=> b!1462996 (=> (not res!992318) (not e!822313))))

(assert (=> b!1462996 (= res!992318 (= (seekEntryOrOpen!0 (select (arr!47656 a!2862) j!93) a!2862 mask!2687) (Found!11908 j!93)))))

(declare-fun b!1462997 () Bool)

(declare-fun res!992325 () Bool)

(assert (=> b!1462997 (=> res!992325 e!822315)))

(assert (=> b!1462997 (= res!992325 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640626 (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640621)))))

(declare-fun b!1462998 () Bool)

(declare-fun res!992313 () Bool)

(assert (=> b!1462998 (=> (not res!992313) (not e!822311))))

(declare-datatypes ((List!34157 0))(
  ( (Nil!34154) (Cons!34153 (h!35503 (_ BitVec 64)) (t!48851 List!34157)) )
))
(declare-fun arrayNoDuplicates!0 (array!98736 (_ BitVec 32) List!34157) Bool)

(assert (=> b!1462998 (= res!992313 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34154))))

(assert (= (and start!125288 res!992324) b!1462994))

(assert (= (and b!1462994 res!992326) b!1462987))

(assert (= (and b!1462987 res!992317) b!1462981))

(assert (= (and b!1462981 res!992312) b!1462978))

(assert (= (and b!1462978 res!992323) b!1462998))

(assert (= (and b!1462998 res!992313) b!1462989))

(assert (= (and b!1462989 res!992315) b!1462985))

(assert (= (and b!1462985 res!992328) b!1462980))

(assert (= (and b!1462980 res!992316) b!1462992))

(assert (= (and b!1462992 res!992321) b!1462977))

(assert (= (and b!1462977 res!992327) b!1462991))

(assert (= (and b!1462991 c!134843) b!1462984))

(assert (= (and b!1462991 (not c!134843)) b!1462986))

(assert (= (and b!1462991 res!992329) b!1462982))

(assert (= (and b!1462982 res!992319) b!1462993))

(assert (= (and b!1462993 res!992322) b!1462996))

(assert (= (and b!1462996 res!992318) b!1462979))

(assert (= (and b!1462993 (not res!992314)) b!1462988))

(assert (= (and b!1462988 (not res!992320)) b!1462997))

(assert (= (and b!1462997 (not res!992325)) b!1462995))

(assert (= (and b!1462995 c!134844) b!1462990))

(assert (= (and b!1462995 (not c!134844)) b!1462983))

(declare-fun m!1350369 () Bool)

(assert (=> start!125288 m!1350369))

(declare-fun m!1350371 () Bool)

(assert (=> start!125288 m!1350371))

(declare-fun m!1350373 () Bool)

(assert (=> b!1462997 m!1350373))

(assert (=> b!1462997 m!1350373))

(declare-fun m!1350375 () Bool)

(assert (=> b!1462997 m!1350375))

(declare-fun m!1350377 () Bool)

(assert (=> b!1462984 m!1350377))

(declare-fun m!1350379 () Bool)

(assert (=> b!1462990 m!1350379))

(declare-fun m!1350381 () Bool)

(assert (=> b!1462978 m!1350381))

(assert (=> b!1462996 m!1350373))

(assert (=> b!1462996 m!1350373))

(declare-fun m!1350383 () Bool)

(assert (=> b!1462996 m!1350383))

(declare-fun m!1350385 () Bool)

(assert (=> b!1462985 m!1350385))

(declare-fun m!1350387 () Bool)

(assert (=> b!1462985 m!1350387))

(declare-fun m!1350389 () Bool)

(assert (=> b!1462986 m!1350389))

(declare-fun m!1350391 () Bool)

(assert (=> b!1462986 m!1350391))

(assert (=> b!1462981 m!1350373))

(assert (=> b!1462981 m!1350373))

(declare-fun m!1350393 () Bool)

(assert (=> b!1462981 m!1350393))

(declare-fun m!1350395 () Bool)

(assert (=> b!1462979 m!1350395))

(assert (=> b!1462979 m!1350373))

(declare-fun m!1350397 () Bool)

(assert (=> b!1462977 m!1350397))

(assert (=> b!1462977 m!1350397))

(declare-fun m!1350399 () Bool)

(assert (=> b!1462977 m!1350399))

(assert (=> b!1462977 m!1350385))

(declare-fun m!1350401 () Bool)

(assert (=> b!1462977 m!1350401))

(declare-fun m!1350403 () Bool)

(assert (=> b!1462988 m!1350403))

(assert (=> b!1462992 m!1350373))

(assert (=> b!1462992 m!1350373))

(declare-fun m!1350405 () Bool)

(assert (=> b!1462992 m!1350405))

(assert (=> b!1462980 m!1350373))

(assert (=> b!1462980 m!1350373))

(declare-fun m!1350407 () Bool)

(assert (=> b!1462980 m!1350407))

(assert (=> b!1462980 m!1350407))

(assert (=> b!1462980 m!1350373))

(declare-fun m!1350409 () Bool)

(assert (=> b!1462980 m!1350409))

(declare-fun m!1350411 () Bool)

(assert (=> b!1462987 m!1350411))

(assert (=> b!1462987 m!1350411))

(declare-fun m!1350413 () Bool)

(assert (=> b!1462987 m!1350413))

(declare-fun m!1350415 () Bool)

(assert (=> b!1462983 m!1350415))

(assert (=> b!1462983 m!1350391))

(declare-fun m!1350417 () Bool)

(assert (=> b!1462993 m!1350417))

(assert (=> b!1462993 m!1350385))

(declare-fun m!1350419 () Bool)

(assert (=> b!1462993 m!1350419))

(declare-fun m!1350421 () Bool)

(assert (=> b!1462993 m!1350421))

(declare-fun m!1350423 () Bool)

(assert (=> b!1462993 m!1350423))

(assert (=> b!1462993 m!1350373))

(declare-fun m!1350425 () Bool)

(assert (=> b!1462998 m!1350425))

(push 1)

