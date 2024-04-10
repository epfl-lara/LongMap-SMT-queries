; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125416 () Bool)

(assert start!125416)

(declare-fun b!1467203 () Bool)

(declare-fun e!824170 () Bool)

(declare-fun e!824173 () Bool)

(assert (=> b!1467203 (= e!824170 e!824173)))

(declare-fun res!995774 () Bool)

(assert (=> b!1467203 (=> (not res!995774) (not e!824173))))

(declare-datatypes ((SeekEntryResult!11972 0))(
  ( (MissingZero!11972 (index!50280 (_ BitVec 32))) (Found!11972 (index!50281 (_ BitVec 32))) (Intermediate!11972 (undefined!12784 Bool) (index!50282 (_ BitVec 32)) (x!131853 (_ BitVec 32))) (Undefined!11972) (MissingVacant!11972 (index!50283 (_ BitVec 32))) )
))
(declare-fun lt!642029 () SeekEntryResult!11972)

(declare-datatypes ((array!98864 0))(
  ( (array!98865 (arr!47720 (Array (_ BitVec 32) (_ BitVec 64))) (size!48270 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98864)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98864 (_ BitVec 32)) SeekEntryResult!11972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467203 (= res!995774 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47720 a!2862) j!93) mask!2687) (select (arr!47720 a!2862) j!93) a!2862 mask!2687) lt!642029))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467203 (= lt!642029 (Intermediate!11972 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467204 () Bool)

(declare-fun res!995776 () Bool)

(declare-fun e!824175 () Bool)

(assert (=> b!1467204 (=> (not res!995776) (not e!824175))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467204 (= res!995776 (and (= (size!48270 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48270 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48270 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467205 () Bool)

(declare-fun res!995784 () Bool)

(declare-fun e!824168 () Bool)

(assert (=> b!1467205 (=> res!995784 e!824168)))

(declare-fun lt!642036 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1467205 (= res!995784 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642036 (select (arr!47720 a!2862) j!93) a!2862 mask!2687) lt!642029)))))

(declare-fun b!1467206 () Bool)

(assert (=> b!1467206 (= e!824175 e!824170)))

(declare-fun res!995775 () Bool)

(assert (=> b!1467206 (=> (not res!995775) (not e!824170))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467206 (= res!995775 (= (select (store (arr!47720 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642032 () array!98864)

(assert (=> b!1467206 (= lt!642032 (array!98865 (store (arr!47720 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48270 a!2862)))))

(declare-fun b!1467207 () Bool)

(declare-fun res!995785 () Bool)

(assert (=> b!1467207 (=> (not res!995785) (not e!824175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98864 (_ BitVec 32)) Bool)

(assert (=> b!1467207 (= res!995785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!642034 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!642033 () SeekEntryResult!11972)

(declare-fun e!824177 () Bool)

(declare-fun b!1467208 () Bool)

(assert (=> b!1467208 (= e!824177 (= lt!642033 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642034 lt!642032 mask!2687)))))

(declare-fun b!1467209 () Bool)

(declare-fun res!995783 () Bool)

(assert (=> b!1467209 (=> (not res!995783) (not e!824175))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1467209 (= res!995783 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48270 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48270 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48270 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1467210 () Bool)

(declare-fun res!995788 () Bool)

(declare-fun e!824169 () Bool)

(assert (=> b!1467210 (=> (not res!995788) (not e!824169))))

(assert (=> b!1467210 (= res!995788 e!824177)))

(declare-fun c!135228 () Bool)

(assert (=> b!1467210 (= c!135228 (bvsle x!665 intermediateAfterX!19))))

(declare-fun e!824176 () Bool)

(declare-fun b!1467211 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98864 (_ BitVec 32)) SeekEntryResult!11972)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98864 (_ BitVec 32)) SeekEntryResult!11972)

(assert (=> b!1467211 (= e!824176 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642036 intermediateAfterIndex!19 lt!642034 lt!642032 mask!2687) (seekEntryOrOpen!0 lt!642034 lt!642032 mask!2687))))))

(declare-fun b!1467212 () Bool)

(declare-fun res!995773 () Bool)

(assert (=> b!1467212 (=> res!995773 e!824168)))

(assert (=> b!1467212 (= res!995773 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467213 () Bool)

(declare-fun res!995787 () Bool)

(assert (=> b!1467213 (=> (not res!995787) (not e!824169))))

(assert (=> b!1467213 (= res!995787 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467214 () Bool)

(declare-fun res!995781 () Bool)

(assert (=> b!1467214 (=> (not res!995781) (not e!824173))))

(assert (=> b!1467214 (= res!995781 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47720 a!2862) j!93) a!2862 mask!2687) lt!642029))))

(declare-fun b!1467215 () Bool)

(declare-fun e!824174 () Bool)

(assert (=> b!1467215 (= e!824168 e!824174)))

(declare-fun res!995779 () Bool)

(assert (=> b!1467215 (=> res!995779 e!824174)))

(assert (=> b!1467215 (= res!995779 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!642035 () SeekEntryResult!11972)

(assert (=> b!1467215 (= lt!642035 (seekEntryOrOpen!0 lt!642034 lt!642032 mask!2687))))

(declare-datatypes ((Unit!49440 0))(
  ( (Unit!49441) )
))
(declare-fun lt!642030 () Unit!49440)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49440)

(assert (=> b!1467215 (= lt!642030 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642036 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467216 () Bool)

(declare-fun res!995771 () Bool)

(assert (=> b!1467216 (=> (not res!995771) (not e!824175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467216 (= res!995771 (validKeyInArray!0 (select (arr!47720 a!2862) j!93)))))

(declare-fun b!1467217 () Bool)

(assert (=> b!1467217 (= e!824177 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642034 lt!642032 mask!2687) (seekEntryOrOpen!0 lt!642034 lt!642032 mask!2687)))))

(declare-fun b!1467218 () Bool)

(declare-fun res!995772 () Bool)

(assert (=> b!1467218 (=> res!995772 e!824168)))

(assert (=> b!1467218 (= res!995772 e!824176)))

(declare-fun c!135227 () Bool)

(assert (=> b!1467218 (= c!135227 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467219 () Bool)

(declare-fun res!995777 () Bool)

(assert (=> b!1467219 (=> (not res!995777) (not e!824175))))

(assert (=> b!1467219 (= res!995777 (validKeyInArray!0 (select (arr!47720 a!2862) i!1006)))))

(declare-fun b!1467220 () Bool)

(declare-fun res!995780 () Bool)

(assert (=> b!1467220 (=> (not res!995780) (not e!824175))))

(declare-datatypes ((List!34221 0))(
  ( (Nil!34218) (Cons!34217 (h!35567 (_ BitVec 64)) (t!48915 List!34221)) )
))
(declare-fun arrayNoDuplicates!0 (array!98864 (_ BitVec 32) List!34221) Bool)

(assert (=> b!1467220 (= res!995780 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34218))))

(declare-fun b!1467221 () Bool)

(assert (=> b!1467221 (= e!824174 (validKeyInArray!0 lt!642034))))

(declare-fun b!1467222 () Bool)

(assert (=> b!1467222 (= e!824173 e!824169)))

(declare-fun res!995786 () Bool)

(assert (=> b!1467222 (=> (not res!995786) (not e!824169))))

(assert (=> b!1467222 (= res!995786 (= lt!642033 (Intermediate!11972 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1467222 (= lt!642033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642034 mask!2687) lt!642034 lt!642032 mask!2687))))

(assert (=> b!1467222 (= lt!642034 (select (store (arr!47720 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467223 () Bool)

(declare-fun e!824171 () Bool)

(assert (=> b!1467223 (= e!824169 (not e!824171))))

(declare-fun res!995770 () Bool)

(assert (=> b!1467223 (=> res!995770 e!824171)))

(assert (=> b!1467223 (= res!995770 (or (and (= (select (arr!47720 a!2862) index!646) (select (store (arr!47720 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47720 a!2862) index!646) (select (arr!47720 a!2862) j!93))) (= (select (arr!47720 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1467223 (and (= lt!642035 (Found!11972 j!93)) (or (= (select (arr!47720 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47720 a!2862) intermediateBeforeIndex!19) (select (arr!47720 a!2862) j!93))))))

(assert (=> b!1467223 (= lt!642035 (seekEntryOrOpen!0 (select (arr!47720 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1467223 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642031 () Unit!49440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49440)

(assert (=> b!1467223 (= lt!642031 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!995782 () Bool)

(assert (=> start!125416 (=> (not res!995782) (not e!824175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125416 (= res!995782 (validMask!0 mask!2687))))

(assert (=> start!125416 e!824175))

(assert (=> start!125416 true))

(declare-fun array_inv!36748 (array!98864) Bool)

(assert (=> start!125416 (array_inv!36748 a!2862)))

(declare-fun b!1467224 () Bool)

(assert (=> b!1467224 (= e!824171 e!824168)))

(declare-fun res!995778 () Bool)

(assert (=> b!1467224 (=> res!995778 e!824168)))

(assert (=> b!1467224 (= res!995778 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642036 #b00000000000000000000000000000000) (bvsge lt!642036 (size!48270 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467224 (= lt!642036 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1467225 () Bool)

(assert (=> b!1467225 (= e!824176 (not (= lt!642033 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642036 lt!642034 lt!642032 mask!2687))))))

(assert (= (and start!125416 res!995782) b!1467204))

(assert (= (and b!1467204 res!995776) b!1467219))

(assert (= (and b!1467219 res!995777) b!1467216))

(assert (= (and b!1467216 res!995771) b!1467207))

(assert (= (and b!1467207 res!995785) b!1467220))

(assert (= (and b!1467220 res!995780) b!1467209))

(assert (= (and b!1467209 res!995783) b!1467206))

(assert (= (and b!1467206 res!995775) b!1467203))

(assert (= (and b!1467203 res!995774) b!1467214))

(assert (= (and b!1467214 res!995781) b!1467222))

(assert (= (and b!1467222 res!995786) b!1467210))

(assert (= (and b!1467210 c!135228) b!1467208))

(assert (= (and b!1467210 (not c!135228)) b!1467217))

(assert (= (and b!1467210 res!995788) b!1467213))

(assert (= (and b!1467213 res!995787) b!1467223))

(assert (= (and b!1467223 (not res!995770)) b!1467224))

(assert (= (and b!1467224 (not res!995778)) b!1467205))

(assert (= (and b!1467205 (not res!995784)) b!1467218))

(assert (= (and b!1467218 c!135227) b!1467225))

(assert (= (and b!1467218 (not c!135227)) b!1467211))

(assert (= (and b!1467218 (not res!995772)) b!1467212))

(assert (= (and b!1467212 (not res!995773)) b!1467215))

(assert (= (and b!1467215 (not res!995779)) b!1467221))

(declare-fun m!1354123 () Bool)

(assert (=> b!1467217 m!1354123))

(declare-fun m!1354125 () Bool)

(assert (=> b!1467217 m!1354125))

(declare-fun m!1354127 () Bool)

(assert (=> b!1467206 m!1354127))

(declare-fun m!1354129 () Bool)

(assert (=> b!1467206 m!1354129))

(declare-fun m!1354131 () Bool)

(assert (=> b!1467224 m!1354131))

(declare-fun m!1354133 () Bool)

(assert (=> b!1467214 m!1354133))

(assert (=> b!1467214 m!1354133))

(declare-fun m!1354135 () Bool)

(assert (=> b!1467214 m!1354135))

(declare-fun m!1354137 () Bool)

(assert (=> b!1467225 m!1354137))

(assert (=> b!1467205 m!1354133))

(assert (=> b!1467205 m!1354133))

(declare-fun m!1354139 () Bool)

(assert (=> b!1467205 m!1354139))

(assert (=> b!1467203 m!1354133))

(assert (=> b!1467203 m!1354133))

(declare-fun m!1354141 () Bool)

(assert (=> b!1467203 m!1354141))

(assert (=> b!1467203 m!1354141))

(assert (=> b!1467203 m!1354133))

(declare-fun m!1354143 () Bool)

(assert (=> b!1467203 m!1354143))

(declare-fun m!1354145 () Bool)

(assert (=> b!1467221 m!1354145))

(assert (=> b!1467215 m!1354125))

(declare-fun m!1354147 () Bool)

(assert (=> b!1467215 m!1354147))

(declare-fun m!1354149 () Bool)

(assert (=> b!1467219 m!1354149))

(assert (=> b!1467219 m!1354149))

(declare-fun m!1354151 () Bool)

(assert (=> b!1467219 m!1354151))

(declare-fun m!1354153 () Bool)

(assert (=> b!1467211 m!1354153))

(assert (=> b!1467211 m!1354125))

(declare-fun m!1354155 () Bool)

(assert (=> b!1467207 m!1354155))

(declare-fun m!1354157 () Bool)

(assert (=> b!1467208 m!1354157))

(declare-fun m!1354159 () Bool)

(assert (=> b!1467222 m!1354159))

(assert (=> b!1467222 m!1354159))

(declare-fun m!1354161 () Bool)

(assert (=> b!1467222 m!1354161))

(assert (=> b!1467222 m!1354127))

(declare-fun m!1354163 () Bool)

(assert (=> b!1467222 m!1354163))

(declare-fun m!1354165 () Bool)

(assert (=> b!1467220 m!1354165))

(declare-fun m!1354167 () Bool)

(assert (=> b!1467223 m!1354167))

(assert (=> b!1467223 m!1354127))

(declare-fun m!1354169 () Bool)

(assert (=> b!1467223 m!1354169))

(declare-fun m!1354171 () Bool)

(assert (=> b!1467223 m!1354171))

(declare-fun m!1354173 () Bool)

(assert (=> b!1467223 m!1354173))

(assert (=> b!1467223 m!1354133))

(declare-fun m!1354175 () Bool)

(assert (=> b!1467223 m!1354175))

(declare-fun m!1354177 () Bool)

(assert (=> b!1467223 m!1354177))

(assert (=> b!1467223 m!1354133))

(assert (=> b!1467216 m!1354133))

(assert (=> b!1467216 m!1354133))

(declare-fun m!1354179 () Bool)

(assert (=> b!1467216 m!1354179))

(declare-fun m!1354181 () Bool)

(assert (=> start!125416 m!1354181))

(declare-fun m!1354183 () Bool)

(assert (=> start!125416 m!1354183))

(push 1)

