; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125606 () Bool)

(assert start!125606)

(declare-fun b!1469977 () Bool)

(declare-fun res!998404 () Bool)

(declare-fun e!825187 () Bool)

(assert (=> b!1469977 (=> (not res!998404) (not e!825187))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469977 (= res!998404 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!642738 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1469978 () Bool)

(declare-fun e!825189 () Bool)

(declare-datatypes ((SeekEntryResult!12055 0))(
  ( (MissingZero!12055 (index!50612 (_ BitVec 32))) (Found!12055 (index!50613 (_ BitVec 32))) (Intermediate!12055 (undefined!12867 Bool) (index!50614 (_ BitVec 32)) (x!132184 (_ BitVec 32))) (Undefined!12055) (MissingVacant!12055 (index!50615 (_ BitVec 32))) )
))
(declare-fun lt!642737 () SeekEntryResult!12055)

(declare-datatypes ((array!99054 0))(
  ( (array!99055 (arr!47815 (Array (_ BitVec 32) (_ BitVec 64))) (size!48365 (_ BitVec 32))) )
))
(declare-fun lt!642741 () array!99054)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99054 (_ BitVec 32)) SeekEntryResult!12055)

(assert (=> b!1469978 (= e!825189 (= lt!642737 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642738 lt!642741 mask!2687)))))

(declare-fun b!1469979 () Bool)

(declare-fun res!998399 () Bool)

(declare-fun e!825191 () Bool)

(assert (=> b!1469979 (=> (not res!998399) (not e!825191))))

(declare-fun a!2862 () array!99054)

(declare-datatypes ((List!34316 0))(
  ( (Nil!34313) (Cons!34312 (h!35662 (_ BitVec 64)) (t!49010 List!34316)) )
))
(declare-fun arrayNoDuplicates!0 (array!99054 (_ BitVec 32) List!34316) Bool)

(assert (=> b!1469979 (= res!998399 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34313))))

(declare-fun b!1469980 () Bool)

(declare-fun e!825188 () Bool)

(declare-fun e!825186 () Bool)

(assert (=> b!1469980 (= e!825188 e!825186)))

(declare-fun res!998393 () Bool)

(assert (=> b!1469980 (=> (not res!998393) (not e!825186))))

(declare-fun lt!642739 () SeekEntryResult!12055)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469980 (= res!998393 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47815 a!2862) j!93) mask!2687) (select (arr!47815 a!2862) j!93) a!2862 mask!2687) lt!642739))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1469980 (= lt!642739 (Intermediate!12055 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469981 () Bool)

(assert (=> b!1469981 (= e!825187 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99054 (_ BitVec 32)) Bool)

(assert (=> b!1469981 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49450 0))(
  ( (Unit!49451) )
))
(declare-fun lt!642740 () Unit!49450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49450)

(assert (=> b!1469981 (= lt!642740 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1469982 () Bool)

(declare-fun res!998403 () Bool)

(assert (=> b!1469982 (=> (not res!998403) (not e!825191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469982 (= res!998403 (validKeyInArray!0 (select (arr!47815 a!2862) j!93)))))

(declare-fun b!1469983 () Bool)

(declare-fun res!998397 () Bool)

(assert (=> b!1469983 (=> (not res!998397) (not e!825187))))

(assert (=> b!1469983 (= res!998397 e!825189)))

(declare-fun c!135303 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469983 (= c!135303 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469984 () Bool)

(declare-fun res!998394 () Bool)

(assert (=> b!1469984 (=> (not res!998394) (not e!825191))))

(assert (=> b!1469984 (= res!998394 (validKeyInArray!0 (select (arr!47815 a!2862) i!1006)))))

(declare-fun b!1469985 () Bool)

(declare-fun res!998396 () Bool)

(assert (=> b!1469985 (=> (not res!998396) (not e!825191))))

(assert (=> b!1469985 (= res!998396 (and (= (size!48365 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48365 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48365 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469986 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99054 (_ BitVec 32)) SeekEntryResult!12055)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99054 (_ BitVec 32)) SeekEntryResult!12055)

(assert (=> b!1469986 (= e!825189 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642738 lt!642741 mask!2687) (seekEntryOrOpen!0 lt!642738 lt!642741 mask!2687)))))

(declare-fun b!1469987 () Bool)

(assert (=> b!1469987 (= e!825191 e!825188)))

(declare-fun res!998400 () Bool)

(assert (=> b!1469987 (=> (not res!998400) (not e!825188))))

(assert (=> b!1469987 (= res!998400 (= (select (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469987 (= lt!642741 (array!99055 (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48365 a!2862)))))

(declare-fun res!998395 () Bool)

(assert (=> start!125606 (=> (not res!998395) (not e!825191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125606 (= res!998395 (validMask!0 mask!2687))))

(assert (=> start!125606 e!825191))

(assert (=> start!125606 true))

(declare-fun array_inv!36843 (array!99054) Bool)

(assert (=> start!125606 (array_inv!36843 a!2862)))

(declare-fun b!1469988 () Bool)

(assert (=> b!1469988 (= e!825186 e!825187)))

(declare-fun res!998392 () Bool)

(assert (=> b!1469988 (=> (not res!998392) (not e!825187))))

(assert (=> b!1469988 (= res!998392 (= lt!642737 (Intermediate!12055 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469988 (= lt!642737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642738 mask!2687) lt!642738 lt!642741 mask!2687))))

(assert (=> b!1469988 (= lt!642738 (select (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469989 () Bool)

(declare-fun res!998401 () Bool)

(assert (=> b!1469989 (=> (not res!998401) (not e!825191))))

(assert (=> b!1469989 (= res!998401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469990 () Bool)

(declare-fun res!998402 () Bool)

(assert (=> b!1469990 (=> (not res!998402) (not e!825191))))

(assert (=> b!1469990 (= res!998402 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48365 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48365 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48365 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469991 () Bool)

(declare-fun res!998398 () Bool)

(assert (=> b!1469991 (=> (not res!998398) (not e!825186))))

(assert (=> b!1469991 (= res!998398 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47815 a!2862) j!93) a!2862 mask!2687) lt!642739))))

(assert (= (and start!125606 res!998395) b!1469985))

(assert (= (and b!1469985 res!998396) b!1469984))

(assert (= (and b!1469984 res!998394) b!1469982))

(assert (= (and b!1469982 res!998403) b!1469989))

(assert (= (and b!1469989 res!998401) b!1469979))

(assert (= (and b!1469979 res!998399) b!1469990))

(assert (= (and b!1469990 res!998402) b!1469987))

(assert (= (and b!1469987 res!998400) b!1469980))

(assert (= (and b!1469980 res!998393) b!1469991))

(assert (= (and b!1469991 res!998398) b!1469988))

(assert (= (and b!1469988 res!998392) b!1469983))

(assert (= (and b!1469983 c!135303) b!1469978))

(assert (= (and b!1469983 (not c!135303)) b!1469986))

(assert (= (and b!1469983 res!998397) b!1469977))

(assert (= (and b!1469977 res!998404) b!1469981))

(declare-fun m!1357117 () Bool)

(assert (=> b!1469982 m!1357117))

(assert (=> b!1469982 m!1357117))

(declare-fun m!1357119 () Bool)

(assert (=> b!1469982 m!1357119))

(assert (=> b!1469980 m!1357117))

(assert (=> b!1469980 m!1357117))

(declare-fun m!1357121 () Bool)

(assert (=> b!1469980 m!1357121))

(assert (=> b!1469980 m!1357121))

(assert (=> b!1469980 m!1357117))

(declare-fun m!1357123 () Bool)

(assert (=> b!1469980 m!1357123))

(declare-fun m!1357125 () Bool)

(assert (=> b!1469987 m!1357125))

(declare-fun m!1357127 () Bool)

(assert (=> b!1469987 m!1357127))

(declare-fun m!1357129 () Bool)

(assert (=> b!1469988 m!1357129))

(assert (=> b!1469988 m!1357129))

(declare-fun m!1357131 () Bool)

(assert (=> b!1469988 m!1357131))

(assert (=> b!1469988 m!1357125))

(declare-fun m!1357133 () Bool)

(assert (=> b!1469988 m!1357133))

(declare-fun m!1357135 () Bool)

(assert (=> start!125606 m!1357135))

(declare-fun m!1357137 () Bool)

(assert (=> start!125606 m!1357137))

(declare-fun m!1357139 () Bool)

(assert (=> b!1469981 m!1357139))

(declare-fun m!1357141 () Bool)

(assert (=> b!1469981 m!1357141))

(declare-fun m!1357143 () Bool)

(assert (=> b!1469984 m!1357143))

(assert (=> b!1469984 m!1357143))

(declare-fun m!1357145 () Bool)

(assert (=> b!1469984 m!1357145))

(declare-fun m!1357147 () Bool)

(assert (=> b!1469979 m!1357147))

(assert (=> b!1469991 m!1357117))

(assert (=> b!1469991 m!1357117))

(declare-fun m!1357149 () Bool)

(assert (=> b!1469991 m!1357149))

(declare-fun m!1357151 () Bool)

(assert (=> b!1469986 m!1357151))

(declare-fun m!1357153 () Bool)

(assert (=> b!1469986 m!1357153))

(declare-fun m!1357155 () Bool)

(assert (=> b!1469978 m!1357155))

(declare-fun m!1357157 () Bool)

(assert (=> b!1469989 m!1357157))

(push 1)

(assert (not b!1469978))

(assert (not b!1469982))

