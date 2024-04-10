; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124612 () Bool)

(assert start!124612)

(declare-fun res!975154 () Bool)

(declare-fun e!813211 () Bool)

(assert (=> start!124612 (=> (not res!975154) (not e!813211))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124612 (= res!975154 (validMask!0 mask!2687))))

(assert (=> start!124612 e!813211))

(assert (=> start!124612 true))

(declare-datatypes ((array!98060 0))(
  ( (array!98061 (arr!47318 (Array (_ BitVec 32) (_ BitVec 64))) (size!47868 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98060)

(declare-fun array_inv!36346 (array!98060) Bool)

(assert (=> start!124612 (array_inv!36346 a!2862)))

(declare-fun b!1442999 () Bool)

(declare-fun res!975159 () Bool)

(assert (=> b!1442999 (=> (not res!975159) (not e!813211))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442999 (= res!975159 (validKeyInArray!0 (select (arr!47318 a!2862) i!1006)))))

(declare-fun e!813213 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633728 () (_ BitVec 64))

(declare-fun b!1443000 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!633725 () array!98060)

(declare-datatypes ((SeekEntryResult!11570 0))(
  ( (MissingZero!11570 (index!48672 (_ BitVec 32))) (Found!11570 (index!48673 (_ BitVec 32))) (Intermediate!11570 (undefined!12382 Bool) (index!48674 (_ BitVec 32)) (x!130379 (_ BitVec 32))) (Undefined!11570) (MissingVacant!11570 (index!48675 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98060 (_ BitVec 32)) SeekEntryResult!11570)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98060 (_ BitVec 32)) SeekEntryResult!11570)

(assert (=> b!1443000 (= e!813213 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633728 lt!633725 mask!2687) (seekEntryOrOpen!0 lt!633728 lt!633725 mask!2687)))))

(declare-fun b!1443001 () Bool)

(declare-fun res!975164 () Bool)

(assert (=> b!1443001 (=> (not res!975164) (not e!813211))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443001 (= res!975164 (validKeyInArray!0 (select (arr!47318 a!2862) j!93)))))

(declare-fun b!1443002 () Bool)

(declare-fun res!975163 () Bool)

(declare-fun e!813212 () Bool)

(assert (=> b!1443002 (=> (not res!975163) (not e!813212))))

(declare-fun lt!633729 () SeekEntryResult!11570)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98060 (_ BitVec 32)) SeekEntryResult!11570)

(assert (=> b!1443002 (= res!975163 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47318 a!2862) j!93) a!2862 mask!2687) lt!633729))))

(declare-fun b!1443003 () Bool)

(declare-fun res!975155 () Bool)

(assert (=> b!1443003 (=> (not res!975155) (not e!813211))))

(declare-datatypes ((List!33819 0))(
  ( (Nil!33816) (Cons!33815 (h!35165 (_ BitVec 64)) (t!48513 List!33819)) )
))
(declare-fun arrayNoDuplicates!0 (array!98060 (_ BitVec 32) List!33819) Bool)

(assert (=> b!1443003 (= res!975155 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33816))))

(declare-fun b!1443004 () Bool)

(declare-fun e!813209 () Bool)

(assert (=> b!1443004 (= e!813211 e!813209)))

(declare-fun res!975153 () Bool)

(assert (=> b!1443004 (=> (not res!975153) (not e!813209))))

(assert (=> b!1443004 (= res!975153 (= (select (store (arr!47318 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443004 (= lt!633725 (array!98061 (store (arr!47318 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47868 a!2862)))))

(declare-fun b!1443005 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!813215 () Bool)

(assert (=> b!1443005 (= e!813215 (or (= (select (arr!47318 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47318 a!2862) intermediateBeforeIndex!19) (select (arr!47318 a!2862) j!93))))))

(declare-fun b!1443006 () Bool)

(declare-fun res!975166 () Bool)

(declare-fun e!813210 () Bool)

(assert (=> b!1443006 (=> (not res!975166) (not e!813210))))

(assert (=> b!1443006 (= res!975166 e!813213)))

(declare-fun c!133434 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443006 (= c!133434 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443007 () Bool)

(assert (=> b!1443007 (= e!813212 e!813210)))

(declare-fun res!975160 () Bool)

(assert (=> b!1443007 (=> (not res!975160) (not e!813210))))

(declare-fun lt!633727 () SeekEntryResult!11570)

(assert (=> b!1443007 (= res!975160 (= lt!633727 (Intermediate!11570 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443007 (= lt!633727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633728 mask!2687) lt!633728 lt!633725 mask!2687))))

(assert (=> b!1443007 (= lt!633728 (select (store (arr!47318 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443008 () Bool)

(declare-fun res!975156 () Bool)

(assert (=> b!1443008 (=> (not res!975156) (not e!813211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98060 (_ BitVec 32)) Bool)

(assert (=> b!1443008 (= res!975156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443009 () Bool)

(declare-fun res!975152 () Bool)

(assert (=> b!1443009 (=> (not res!975152) (not e!813211))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443009 (= res!975152 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47868 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47868 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47868 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443010 () Bool)

(declare-fun res!975162 () Bool)

(assert (=> b!1443010 (=> (not res!975162) (not e!813210))))

(assert (=> b!1443010 (= res!975162 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443011 () Bool)

(assert (=> b!1443011 (= e!813210 (not true))))

(assert (=> b!1443011 e!813215))

(declare-fun res!975165 () Bool)

(assert (=> b!1443011 (=> (not res!975165) (not e!813215))))

(assert (=> b!1443011 (= res!975165 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48636 0))(
  ( (Unit!48637) )
))
(declare-fun lt!633726 () Unit!48636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48636)

(assert (=> b!1443011 (= lt!633726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443012 () Bool)

(assert (=> b!1443012 (= e!813213 (= lt!633727 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633728 lt!633725 mask!2687)))))

(declare-fun b!1443013 () Bool)

(declare-fun res!975158 () Bool)

(assert (=> b!1443013 (=> (not res!975158) (not e!813215))))

(assert (=> b!1443013 (= res!975158 (= (seekEntryOrOpen!0 (select (arr!47318 a!2862) j!93) a!2862 mask!2687) (Found!11570 j!93)))))

(declare-fun b!1443014 () Bool)

(assert (=> b!1443014 (= e!813209 e!813212)))

(declare-fun res!975157 () Bool)

(assert (=> b!1443014 (=> (not res!975157) (not e!813212))))

(assert (=> b!1443014 (= res!975157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47318 a!2862) j!93) mask!2687) (select (arr!47318 a!2862) j!93) a!2862 mask!2687) lt!633729))))

(assert (=> b!1443014 (= lt!633729 (Intermediate!11570 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443015 () Bool)

(declare-fun res!975161 () Bool)

(assert (=> b!1443015 (=> (not res!975161) (not e!813211))))

(assert (=> b!1443015 (= res!975161 (and (= (size!47868 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47868 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47868 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124612 res!975154) b!1443015))

(assert (= (and b!1443015 res!975161) b!1442999))

(assert (= (and b!1442999 res!975159) b!1443001))

(assert (= (and b!1443001 res!975164) b!1443008))

(assert (= (and b!1443008 res!975156) b!1443003))

(assert (= (and b!1443003 res!975155) b!1443009))

(assert (= (and b!1443009 res!975152) b!1443004))

(assert (= (and b!1443004 res!975153) b!1443014))

(assert (= (and b!1443014 res!975157) b!1443002))

(assert (= (and b!1443002 res!975163) b!1443007))

(assert (= (and b!1443007 res!975160) b!1443006))

(assert (= (and b!1443006 c!133434) b!1443012))

(assert (= (and b!1443006 (not c!133434)) b!1443000))

(assert (= (and b!1443006 res!975166) b!1443010))

(assert (= (and b!1443010 res!975162) b!1443011))

(assert (= (and b!1443011 res!975165) b!1443013))

(assert (= (and b!1443013 res!975158) b!1443005))

(declare-fun m!1332109 () Bool)

(assert (=> b!1443013 m!1332109))

(assert (=> b!1443013 m!1332109))

(declare-fun m!1332111 () Bool)

(assert (=> b!1443013 m!1332111))

(declare-fun m!1332113 () Bool)

(assert (=> b!1443007 m!1332113))

(assert (=> b!1443007 m!1332113))

(declare-fun m!1332115 () Bool)

(assert (=> b!1443007 m!1332115))

(declare-fun m!1332117 () Bool)

(assert (=> b!1443007 m!1332117))

(declare-fun m!1332119 () Bool)

(assert (=> b!1443007 m!1332119))

(declare-fun m!1332121 () Bool)

(assert (=> b!1443003 m!1332121))

(declare-fun m!1332123 () Bool)

(assert (=> b!1443011 m!1332123))

(declare-fun m!1332125 () Bool)

(assert (=> b!1443011 m!1332125))

(declare-fun m!1332127 () Bool)

(assert (=> b!1443000 m!1332127))

(declare-fun m!1332129 () Bool)

(assert (=> b!1443000 m!1332129))

(declare-fun m!1332131 () Bool)

(assert (=> start!124612 m!1332131))

(declare-fun m!1332133 () Bool)

(assert (=> start!124612 m!1332133))

(declare-fun m!1332135 () Bool)

(assert (=> b!1443005 m!1332135))

(assert (=> b!1443005 m!1332109))

(assert (=> b!1443014 m!1332109))

(assert (=> b!1443014 m!1332109))

(declare-fun m!1332137 () Bool)

(assert (=> b!1443014 m!1332137))

(assert (=> b!1443014 m!1332137))

(assert (=> b!1443014 m!1332109))

(declare-fun m!1332139 () Bool)

(assert (=> b!1443014 m!1332139))

(assert (=> b!1443004 m!1332117))

(declare-fun m!1332141 () Bool)

(assert (=> b!1443004 m!1332141))

(declare-fun m!1332143 () Bool)

(assert (=> b!1443008 m!1332143))

(assert (=> b!1443001 m!1332109))

(assert (=> b!1443001 m!1332109))

(declare-fun m!1332145 () Bool)

(assert (=> b!1443001 m!1332145))

(declare-fun m!1332147 () Bool)

(assert (=> b!1442999 m!1332147))

(assert (=> b!1442999 m!1332147))

(declare-fun m!1332149 () Bool)

(assert (=> b!1442999 m!1332149))

(assert (=> b!1443002 m!1332109))

(assert (=> b!1443002 m!1332109))

(declare-fun m!1332151 () Bool)

(assert (=> b!1443002 m!1332151))

(declare-fun m!1332153 () Bool)

(assert (=> b!1443012 m!1332153))

(push 1)

