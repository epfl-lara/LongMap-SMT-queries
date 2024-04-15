; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125560 () Bool)

(assert start!125560)

(declare-fun b!1469447 () Bool)

(declare-fun res!998038 () Bool)

(declare-fun e!824929 () Bool)

(assert (=> b!1469447 (=> (not res!998038) (not e!824929))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98986 0))(
  ( (array!98987 (arr!47782 (Array (_ BitVec 32) (_ BitVec 64))) (size!48334 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98986)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469447 (= res!998038 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48334 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48334 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48334 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!998033 () Bool)

(assert (=> start!125560 (=> (not res!998033) (not e!824929))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125560 (= res!998033 (validMask!0 mask!2687))))

(assert (=> start!125560 e!824929))

(assert (=> start!125560 true))

(declare-fun array_inv!37015 (array!98986) Bool)

(assert (=> start!125560 (array_inv!37015 a!2862)))

(declare-fun b!1469448 () Bool)

(declare-fun res!998034 () Bool)

(declare-fun e!824926 () Bool)

(assert (=> b!1469448 (=> (not res!998034) (not e!824926))))

(declare-datatypes ((SeekEntryResult!12047 0))(
  ( (MissingZero!12047 (index!50580 (_ BitVec 32))) (Found!12047 (index!50581 (_ BitVec 32))) (Intermediate!12047 (undefined!12859 Bool) (index!50582 (_ BitVec 32)) (x!132155 (_ BitVec 32))) (Undefined!12047) (MissingVacant!12047 (index!50583 (_ BitVec 32))) )
))
(declare-fun lt!642391 () SeekEntryResult!12047)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98986 (_ BitVec 32)) SeekEntryResult!12047)

(assert (=> b!1469448 (= res!998034 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47782 a!2862) j!93) a!2862 mask!2687) lt!642391))))

(declare-fun b!1469449 () Bool)

(declare-fun e!824928 () Bool)

(assert (=> b!1469449 (= e!824928 e!824926)))

(declare-fun res!998029 () Bool)

(assert (=> b!1469449 (=> (not res!998029) (not e!824926))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469449 (= res!998029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47782 a!2862) j!93) mask!2687) (select (arr!47782 a!2862) j!93) a!2862 mask!2687) lt!642391))))

(assert (=> b!1469449 (= lt!642391 (Intermediate!12047 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469450 () Bool)

(declare-fun res!998027 () Bool)

(assert (=> b!1469450 (=> (not res!998027) (not e!824929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98986 (_ BitVec 32)) Bool)

(assert (=> b!1469450 (= res!998027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469451 () Bool)

(declare-fun res!998032 () Bool)

(assert (=> b!1469451 (=> (not res!998032) (not e!824929))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469451 (= res!998032 (and (= (size!48334 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48334 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48334 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469452 () Bool)

(declare-fun res!998036 () Bool)

(assert (=> b!1469452 (=> (not res!998036) (not e!824929))))

(declare-datatypes ((List!34361 0))(
  ( (Nil!34358) (Cons!34357 (h!35707 (_ BitVec 64)) (t!49047 List!34361)) )
))
(declare-fun arrayNoDuplicates!0 (array!98986 (_ BitVec 32) List!34361) Bool)

(assert (=> b!1469452 (= res!998036 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34358))))

(declare-fun b!1469453 () Bool)

(declare-fun res!998035 () Bool)

(assert (=> b!1469453 (=> (not res!998035) (not e!824929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469453 (= res!998035 (validKeyInArray!0 (select (arr!47782 a!2862) j!93)))))

(declare-fun b!1469454 () Bool)

(declare-fun e!824930 () Bool)

(declare-fun lt!642393 () (_ BitVec 64))

(declare-fun lt!642390 () array!98986)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98986 (_ BitVec 32)) SeekEntryResult!12047)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98986 (_ BitVec 32)) SeekEntryResult!12047)

(assert (=> b!1469454 (= e!824930 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642393 lt!642390 mask!2687) (seekEntryOrOpen!0 lt!642393 lt!642390 mask!2687)))))

(declare-fun b!1469455 () Bool)

(declare-fun res!998037 () Bool)

(assert (=> b!1469455 (=> (not res!998037) (not e!824929))))

(assert (=> b!1469455 (= res!998037 (validKeyInArray!0 (select (arr!47782 a!2862) i!1006)))))

(declare-fun b!1469456 () Bool)

(declare-fun e!824927 () Bool)

(assert (=> b!1469456 (= e!824926 e!824927)))

(declare-fun res!998028 () Bool)

(assert (=> b!1469456 (=> (not res!998028) (not e!824927))))

(declare-fun lt!642392 () SeekEntryResult!12047)

(assert (=> b!1469456 (= res!998028 (= lt!642392 (Intermediate!12047 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469456 (= lt!642392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642393 mask!2687) lt!642393 lt!642390 mask!2687))))

(assert (=> b!1469456 (= lt!642393 (select (store (arr!47782 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469457 () Bool)

(assert (=> b!1469457 (= e!824929 e!824928)))

(declare-fun res!998030 () Bool)

(assert (=> b!1469457 (=> (not res!998030) (not e!824928))))

(assert (=> b!1469457 (= res!998030 (= (select (store (arr!47782 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469457 (= lt!642390 (array!98987 (store (arr!47782 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48334 a!2862)))))

(declare-fun b!1469458 () Bool)

(assert (=> b!1469458 (= e!824927 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsle #b00000000000000000000000000000000 (size!48334 a!2862)) (bvsgt j!93 (size!48334 a!2862))))))

(declare-fun b!1469459 () Bool)

(assert (=> b!1469459 (= e!824930 (= lt!642392 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642393 lt!642390 mask!2687)))))

(declare-fun b!1469460 () Bool)

(declare-fun res!998031 () Bool)

(assert (=> b!1469460 (=> (not res!998031) (not e!824927))))

(assert (=> b!1469460 (= res!998031 e!824930)))

(declare-fun c!135223 () Bool)

(assert (=> b!1469460 (= c!135223 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125560 res!998033) b!1469451))

(assert (= (and b!1469451 res!998032) b!1469455))

(assert (= (and b!1469455 res!998037) b!1469453))

(assert (= (and b!1469453 res!998035) b!1469450))

(assert (= (and b!1469450 res!998027) b!1469452))

(assert (= (and b!1469452 res!998036) b!1469447))

(assert (= (and b!1469447 res!998038) b!1469457))

(assert (= (and b!1469457 res!998030) b!1469449))

(assert (= (and b!1469449 res!998029) b!1469448))

(assert (= (and b!1469448 res!998034) b!1469456))

(assert (= (and b!1469456 res!998028) b!1469460))

(assert (= (and b!1469460 c!135223) b!1469459))

(assert (= (and b!1469460 (not c!135223)) b!1469454))

(assert (= (and b!1469460 res!998031) b!1469458))

(declare-fun m!1356129 () Bool)

(assert (=> b!1469453 m!1356129))

(assert (=> b!1469453 m!1356129))

(declare-fun m!1356131 () Bool)

(assert (=> b!1469453 m!1356131))

(declare-fun m!1356133 () Bool)

(assert (=> b!1469454 m!1356133))

(declare-fun m!1356135 () Bool)

(assert (=> b!1469454 m!1356135))

(declare-fun m!1356137 () Bool)

(assert (=> b!1469455 m!1356137))

(assert (=> b!1469455 m!1356137))

(declare-fun m!1356139 () Bool)

(assert (=> b!1469455 m!1356139))

(declare-fun m!1356141 () Bool)

(assert (=> start!125560 m!1356141))

(declare-fun m!1356143 () Bool)

(assert (=> start!125560 m!1356143))

(declare-fun m!1356145 () Bool)

(assert (=> b!1469452 m!1356145))

(declare-fun m!1356147 () Bool)

(assert (=> b!1469450 m!1356147))

(declare-fun m!1356149 () Bool)

(assert (=> b!1469456 m!1356149))

(assert (=> b!1469456 m!1356149))

(declare-fun m!1356151 () Bool)

(assert (=> b!1469456 m!1356151))

(declare-fun m!1356153 () Bool)

(assert (=> b!1469456 m!1356153))

(declare-fun m!1356155 () Bool)

(assert (=> b!1469456 m!1356155))

(assert (=> b!1469457 m!1356153))

(declare-fun m!1356157 () Bool)

(assert (=> b!1469457 m!1356157))

(declare-fun m!1356159 () Bool)

(assert (=> b!1469459 m!1356159))

(assert (=> b!1469449 m!1356129))

(assert (=> b!1469449 m!1356129))

(declare-fun m!1356161 () Bool)

(assert (=> b!1469449 m!1356161))

(assert (=> b!1469449 m!1356161))

(assert (=> b!1469449 m!1356129))

(declare-fun m!1356163 () Bool)

(assert (=> b!1469449 m!1356163))

(assert (=> b!1469448 m!1356129))

(assert (=> b!1469448 m!1356129))

(declare-fun m!1356165 () Bool)

(assert (=> b!1469448 m!1356165))

(check-sat (not b!1469449) (not b!1469450) (not b!1469452) (not b!1469459) (not b!1469456) (not b!1469453) (not start!125560) (not b!1469455) (not b!1469448) (not b!1469454))
(check-sat)
