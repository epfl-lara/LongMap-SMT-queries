; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124546 () Bool)

(assert start!124546)

(declare-fun b!1441886 () Bool)

(declare-fun res!974271 () Bool)

(declare-fun e!812721 () Bool)

(assert (=> b!1441886 (=> (not res!974271) (not e!812721))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441886 (= res!974271 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441887 () Bool)

(declare-fun e!812715 () Bool)

(assert (=> b!1441887 (= e!812715 e!812721)))

(declare-fun res!974270 () Bool)

(assert (=> b!1441887 (=> (not res!974270) (not e!812721))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11552 0))(
  ( (MissingZero!11552 (index!48600 (_ BitVec 32))) (Found!11552 (index!48601 (_ BitVec 32))) (Intermediate!11552 (undefined!12364 Bool) (index!48602 (_ BitVec 32)) (x!130308 (_ BitVec 32))) (Undefined!11552) (MissingVacant!11552 (index!48603 (_ BitVec 32))) )
))
(declare-fun lt!633223 () SeekEntryResult!11552)

(assert (=> b!1441887 (= res!974270 (= lt!633223 (Intermediate!11552 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!97972 0))(
  ( (array!97973 (arr!47275 (Array (_ BitVec 32) (_ BitVec 64))) (size!47827 (_ BitVec 32))) )
))
(declare-fun lt!633225 () array!97972)

(declare-fun lt!633222 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97972 (_ BitVec 32)) SeekEntryResult!11552)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441887 (= lt!633223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633222 mask!2687) lt!633222 lt!633225 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun a!2862 () array!97972)

(assert (=> b!1441887 (= lt!633222 (select (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441888 () Bool)

(declare-fun e!812716 () Bool)

(declare-fun e!812717 () Bool)

(assert (=> b!1441888 (= e!812716 e!812717)))

(declare-fun res!974264 () Bool)

(assert (=> b!1441888 (=> (not res!974264) (not e!812717))))

(assert (=> b!1441888 (= res!974264 (= (select (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441888 (= lt!633225 (array!97973 (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47827 a!2862)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!812719 () Bool)

(declare-fun b!1441889 () Bool)

(assert (=> b!1441889 (= e!812719 (or (= (select (arr!47275 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47275 a!2862) intermediateBeforeIndex!19) (select (arr!47275 a!2862) j!93))))))

(declare-fun b!1441890 () Bool)

(declare-fun res!974278 () Bool)

(assert (=> b!1441890 (=> (not res!974278) (not e!812716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97972 (_ BitVec 32)) Bool)

(assert (=> b!1441890 (= res!974278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441891 () Bool)

(declare-fun res!974267 () Bool)

(assert (=> b!1441891 (=> (not res!974267) (not e!812716))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441891 (= res!974267 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47827 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47827 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47827 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!812720 () Bool)

(declare-fun b!1441892 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97972 (_ BitVec 32)) SeekEntryResult!11552)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97972 (_ BitVec 32)) SeekEntryResult!11552)

(assert (=> b!1441892 (= e!812720 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633222 lt!633225 mask!2687) (seekEntryOrOpen!0 lt!633222 lt!633225 mask!2687)))))

(declare-fun b!1441893 () Bool)

(declare-fun res!974268 () Bool)

(assert (=> b!1441893 (=> (not res!974268) (not e!812721))))

(assert (=> b!1441893 (= res!974268 e!812720)))

(declare-fun c!133324 () Bool)

(assert (=> b!1441893 (= c!133324 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441894 () Bool)

(declare-fun res!974277 () Bool)

(assert (=> b!1441894 (=> (not res!974277) (not e!812719))))

(assert (=> b!1441894 (= res!974277 (= (seekEntryOrOpen!0 (select (arr!47275 a!2862) j!93) a!2862 mask!2687) (Found!11552 j!93)))))

(declare-fun b!1441895 () Bool)

(declare-fun res!974265 () Bool)

(assert (=> b!1441895 (=> (not res!974265) (not e!812716))))

(assert (=> b!1441895 (= res!974265 (and (= (size!47827 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47827 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47827 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441897 () Bool)

(declare-fun res!974269 () Bool)

(assert (=> b!1441897 (=> (not res!974269) (not e!812716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441897 (= res!974269 (validKeyInArray!0 (select (arr!47275 a!2862) i!1006)))))

(declare-fun b!1441898 () Bool)

(declare-fun res!974274 () Bool)

(assert (=> b!1441898 (=> (not res!974274) (not e!812716))))

(declare-datatypes ((List!33854 0))(
  ( (Nil!33851) (Cons!33850 (h!35200 (_ BitVec 64)) (t!48540 List!33854)) )
))
(declare-fun arrayNoDuplicates!0 (array!97972 (_ BitVec 32) List!33854) Bool)

(assert (=> b!1441898 (= res!974274 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33851))))

(declare-fun b!1441899 () Bool)

(assert (=> b!1441899 (= e!812720 (= lt!633223 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633222 lt!633225 mask!2687)))))

(declare-fun b!1441900 () Bool)

(assert (=> b!1441900 (= e!812721 (not true))))

(assert (=> b!1441900 e!812719))

(declare-fun res!974272 () Bool)

(assert (=> b!1441900 (=> (not res!974272) (not e!812719))))

(assert (=> b!1441900 (= res!974272 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48441 0))(
  ( (Unit!48442) )
))
(declare-fun lt!633224 () Unit!48441)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48441)

(assert (=> b!1441900 (= lt!633224 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441901 () Bool)

(declare-fun res!974273 () Bool)

(assert (=> b!1441901 (=> (not res!974273) (not e!812716))))

(assert (=> b!1441901 (= res!974273 (validKeyInArray!0 (select (arr!47275 a!2862) j!93)))))

(declare-fun b!1441902 () Bool)

(declare-fun res!974266 () Bool)

(assert (=> b!1441902 (=> (not res!974266) (not e!812715))))

(declare-fun lt!633221 () SeekEntryResult!11552)

(assert (=> b!1441902 (= res!974266 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47275 a!2862) j!93) a!2862 mask!2687) lt!633221))))

(declare-fun res!974275 () Bool)

(assert (=> start!124546 (=> (not res!974275) (not e!812716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124546 (= res!974275 (validMask!0 mask!2687))))

(assert (=> start!124546 e!812716))

(assert (=> start!124546 true))

(declare-fun array_inv!36508 (array!97972) Bool)

(assert (=> start!124546 (array_inv!36508 a!2862)))

(declare-fun b!1441896 () Bool)

(assert (=> b!1441896 (= e!812717 e!812715)))

(declare-fun res!974276 () Bool)

(assert (=> b!1441896 (=> (not res!974276) (not e!812715))))

(assert (=> b!1441896 (= res!974276 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47275 a!2862) j!93) mask!2687) (select (arr!47275 a!2862) j!93) a!2862 mask!2687) lt!633221))))

(assert (=> b!1441896 (= lt!633221 (Intermediate!11552 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124546 res!974275) b!1441895))

(assert (= (and b!1441895 res!974265) b!1441897))

(assert (= (and b!1441897 res!974269) b!1441901))

(assert (= (and b!1441901 res!974273) b!1441890))

(assert (= (and b!1441890 res!974278) b!1441898))

(assert (= (and b!1441898 res!974274) b!1441891))

(assert (= (and b!1441891 res!974267) b!1441888))

(assert (= (and b!1441888 res!974264) b!1441896))

(assert (= (and b!1441896 res!974276) b!1441902))

(assert (= (and b!1441902 res!974266) b!1441887))

(assert (= (and b!1441887 res!974270) b!1441893))

(assert (= (and b!1441893 c!133324) b!1441899))

(assert (= (and b!1441893 (not c!133324)) b!1441892))

(assert (= (and b!1441893 res!974268) b!1441886))

(assert (= (and b!1441886 res!974271) b!1441900))

(assert (= (and b!1441900 res!974272) b!1441894))

(assert (= (and b!1441894 res!974277) b!1441889))

(declare-fun m!1330581 () Bool)

(assert (=> start!124546 m!1330581))

(declare-fun m!1330583 () Bool)

(assert (=> start!124546 m!1330583))

(declare-fun m!1330585 () Bool)

(assert (=> b!1441901 m!1330585))

(assert (=> b!1441901 m!1330585))

(declare-fun m!1330587 () Bool)

(assert (=> b!1441901 m!1330587))

(assert (=> b!1441894 m!1330585))

(assert (=> b!1441894 m!1330585))

(declare-fun m!1330589 () Bool)

(assert (=> b!1441894 m!1330589))

(declare-fun m!1330591 () Bool)

(assert (=> b!1441888 m!1330591))

(declare-fun m!1330593 () Bool)

(assert (=> b!1441888 m!1330593))

(declare-fun m!1330595 () Bool)

(assert (=> b!1441892 m!1330595))

(declare-fun m!1330597 () Bool)

(assert (=> b!1441892 m!1330597))

(declare-fun m!1330599 () Bool)

(assert (=> b!1441897 m!1330599))

(assert (=> b!1441897 m!1330599))

(declare-fun m!1330601 () Bool)

(assert (=> b!1441897 m!1330601))

(declare-fun m!1330603 () Bool)

(assert (=> b!1441889 m!1330603))

(assert (=> b!1441889 m!1330585))

(declare-fun m!1330605 () Bool)

(assert (=> b!1441887 m!1330605))

(assert (=> b!1441887 m!1330605))

(declare-fun m!1330607 () Bool)

(assert (=> b!1441887 m!1330607))

(assert (=> b!1441887 m!1330591))

(declare-fun m!1330609 () Bool)

(assert (=> b!1441887 m!1330609))

(declare-fun m!1330611 () Bool)

(assert (=> b!1441898 m!1330611))

(declare-fun m!1330613 () Bool)

(assert (=> b!1441890 m!1330613))

(assert (=> b!1441902 m!1330585))

(assert (=> b!1441902 m!1330585))

(declare-fun m!1330615 () Bool)

(assert (=> b!1441902 m!1330615))

(assert (=> b!1441896 m!1330585))

(assert (=> b!1441896 m!1330585))

(declare-fun m!1330617 () Bool)

(assert (=> b!1441896 m!1330617))

(assert (=> b!1441896 m!1330617))

(assert (=> b!1441896 m!1330585))

(declare-fun m!1330619 () Bool)

(assert (=> b!1441896 m!1330619))

(declare-fun m!1330621 () Bool)

(assert (=> b!1441899 m!1330621))

(declare-fun m!1330623 () Bool)

(assert (=> b!1441900 m!1330623))

(declare-fun m!1330625 () Bool)

(assert (=> b!1441900 m!1330625))

(check-sat (not b!1441898) (not b!1441894) (not b!1441902) (not b!1441887) (not b!1441897) (not b!1441900) (not b!1441892) (not b!1441901) (not b!1441890) (not b!1441899) (not start!124546) (not b!1441896))
(check-sat)
