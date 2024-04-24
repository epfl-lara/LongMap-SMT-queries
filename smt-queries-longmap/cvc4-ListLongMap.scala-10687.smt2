; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125540 () Bool)

(assert start!125540)

(declare-fun b!1463827 () Bool)

(declare-fun res!992227 () Bool)

(declare-fun e!822985 () Bool)

(assert (=> b!1463827 (=> (not res!992227) (not e!822985))))

(declare-datatypes ((array!98826 0))(
  ( (array!98827 (arr!47696 (Array (_ BitVec 32) (_ BitVec 64))) (size!48247 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98826)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98826 (_ BitVec 32)) Bool)

(assert (=> b!1463827 (= res!992227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463828 () Bool)

(declare-fun res!992237 () Bool)

(declare-fun e!822989 () Bool)

(assert (=> b!1463828 (=> (not res!992237) (not e!822989))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11845 0))(
  ( (MissingZero!11845 (index!49772 (_ BitVec 32))) (Found!11845 (index!49773 (_ BitVec 32))) (Intermediate!11845 (undefined!12657 Bool) (index!49774 (_ BitVec 32)) (x!131551 (_ BitVec 32))) (Undefined!11845) (MissingVacant!11845 (index!49775 (_ BitVec 32))) )
))
(declare-fun lt!640986 () SeekEntryResult!11845)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98826 (_ BitVec 32)) SeekEntryResult!11845)

(assert (=> b!1463828 (= res!992237 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47696 a!2862) j!93) a!2862 mask!2687) lt!640986))))

(declare-fun b!1463830 () Bool)

(declare-fun e!822986 () Bool)

(declare-fun e!822987 () Bool)

(assert (=> b!1463830 (= e!822986 e!822987)))

(declare-fun res!992221 () Bool)

(assert (=> b!1463830 (=> res!992221 e!822987)))

(declare-fun lt!640984 () (_ BitVec 32))

(assert (=> b!1463830 (= res!992221 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640984 #b00000000000000000000000000000000) (bvsge lt!640984 (size!48247 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463830 (= lt!640984 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1463831 () Bool)

(declare-fun res!992223 () Bool)

(assert (=> b!1463831 (=> res!992223 e!822987)))

(assert (=> b!1463831 (= res!992223 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640984 (select (arr!47696 a!2862) j!93) a!2862 mask!2687) lt!640986)))))

(declare-fun lt!640988 () (_ BitVec 64))

(declare-fun lt!640985 () array!98826)

(declare-fun e!822988 () Bool)

(declare-fun b!1463832 () Bool)

(declare-fun lt!640989 () SeekEntryResult!11845)

(assert (=> b!1463832 (= e!822988 (not (= lt!640989 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640984 lt!640988 lt!640985 mask!2687))))))

(declare-fun b!1463833 () Bool)

(declare-fun e!822993 () Bool)

(assert (=> b!1463833 (= e!822993 e!822989)))

(declare-fun res!992229 () Bool)

(assert (=> b!1463833 (=> (not res!992229) (not e!822989))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463833 (= res!992229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47696 a!2862) j!93) mask!2687) (select (arr!47696 a!2862) j!93) a!2862 mask!2687) lt!640986))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463833 (= lt!640986 (Intermediate!11845 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463834 () Bool)

(declare-fun e!822984 () Bool)

(assert (=> b!1463834 (= e!822984 (not e!822986))))

(declare-fun res!992225 () Bool)

(assert (=> b!1463834 (=> res!992225 e!822986)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463834 (= res!992225 (or (and (= (select (arr!47696 a!2862) index!646) (select (store (arr!47696 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47696 a!2862) index!646) (select (arr!47696 a!2862) j!93))) (= (select (arr!47696 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822991 () Bool)

(assert (=> b!1463834 e!822991))

(declare-fun res!992224 () Bool)

(assert (=> b!1463834 (=> (not res!992224) (not e!822991))))

(assert (=> b!1463834 (= res!992224 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49219 0))(
  ( (Unit!49220) )
))
(declare-fun lt!640987 () Unit!49219)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49219)

(assert (=> b!1463834 (= lt!640987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463835 () Bool)

(declare-fun res!992222 () Bool)

(assert (=> b!1463835 (=> (not res!992222) (not e!822985))))

(assert (=> b!1463835 (= res!992222 (and (= (size!48247 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48247 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48247 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463836 () Bool)

(declare-fun res!992226 () Bool)

(assert (=> b!1463836 (=> (not res!992226) (not e!822984))))

(declare-fun e!822992 () Bool)

(assert (=> b!1463836 (= res!992226 e!822992)))

(declare-fun c!135325 () Bool)

(assert (=> b!1463836 (= c!135325 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463837 () Bool)

(declare-fun res!992231 () Bool)

(assert (=> b!1463837 (=> (not res!992231) (not e!822991))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98826 (_ BitVec 32)) SeekEntryResult!11845)

(assert (=> b!1463837 (= res!992231 (= (seekEntryOrOpen!0 (select (arr!47696 a!2862) j!93) a!2862 mask!2687) (Found!11845 j!93)))))

(declare-fun b!1463838 () Bool)

(declare-fun res!992230 () Bool)

(assert (=> b!1463838 (=> (not res!992230) (not e!822985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463838 (= res!992230 (validKeyInArray!0 (select (arr!47696 a!2862) i!1006)))))

(declare-fun b!1463839 () Bool)

(declare-fun res!992233 () Bool)

(assert (=> b!1463839 (=> (not res!992233) (not e!822985))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463839 (= res!992233 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48247 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48247 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48247 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463840 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98826 (_ BitVec 32)) SeekEntryResult!11845)

(assert (=> b!1463840 (= e!822988 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640984 intermediateAfterIndex!19 lt!640988 lt!640985 mask!2687) (seekEntryOrOpen!0 lt!640988 lt!640985 mask!2687))))))

(declare-fun b!1463829 () Bool)

(assert (=> b!1463829 (= e!822992 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640988 lt!640985 mask!2687) (seekEntryOrOpen!0 lt!640988 lt!640985 mask!2687)))))

(declare-fun res!992220 () Bool)

(assert (=> start!125540 (=> (not res!992220) (not e!822985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125540 (= res!992220 (validMask!0 mask!2687))))

(assert (=> start!125540 e!822985))

(assert (=> start!125540 true))

(declare-fun array_inv!36977 (array!98826) Bool)

(assert (=> start!125540 (array_inv!36977 a!2862)))

(declare-fun b!1463841 () Bool)

(assert (=> b!1463841 (= e!822987 true)))

(declare-fun lt!640990 () Bool)

(assert (=> b!1463841 (= lt!640990 e!822988)))

(declare-fun c!135324 () Bool)

(assert (=> b!1463841 (= c!135324 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463842 () Bool)

(declare-fun res!992236 () Bool)

(assert (=> b!1463842 (=> (not res!992236) (not e!822985))))

(assert (=> b!1463842 (= res!992236 (validKeyInArray!0 (select (arr!47696 a!2862) j!93)))))

(declare-fun b!1463843 () Bool)

(assert (=> b!1463843 (= e!822992 (= lt!640989 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640988 lt!640985 mask!2687)))))

(declare-fun b!1463844 () Bool)

(assert (=> b!1463844 (= e!822989 e!822984)))

(declare-fun res!992234 () Bool)

(assert (=> b!1463844 (=> (not res!992234) (not e!822984))))

(assert (=> b!1463844 (= res!992234 (= lt!640989 (Intermediate!11845 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1463844 (= lt!640989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640988 mask!2687) lt!640988 lt!640985 mask!2687))))

(assert (=> b!1463844 (= lt!640988 (select (store (arr!47696 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463845 () Bool)

(assert (=> b!1463845 (= e!822991 (or (= (select (arr!47696 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47696 a!2862) intermediateBeforeIndex!19) (select (arr!47696 a!2862) j!93))))))

(declare-fun b!1463846 () Bool)

(assert (=> b!1463846 (= e!822985 e!822993)))

(declare-fun res!992235 () Bool)

(assert (=> b!1463846 (=> (not res!992235) (not e!822993))))

(assert (=> b!1463846 (= res!992235 (= (select (store (arr!47696 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463846 (= lt!640985 (array!98827 (store (arr!47696 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48247 a!2862)))))

(declare-fun b!1463847 () Bool)

(declare-fun res!992228 () Bool)

(assert (=> b!1463847 (=> (not res!992228) (not e!822985))))

(declare-datatypes ((List!34184 0))(
  ( (Nil!34181) (Cons!34180 (h!35544 (_ BitVec 64)) (t!48870 List!34184)) )
))
(declare-fun arrayNoDuplicates!0 (array!98826 (_ BitVec 32) List!34184) Bool)

(assert (=> b!1463847 (= res!992228 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34181))))

(declare-fun b!1463848 () Bool)

(declare-fun res!992232 () Bool)

(assert (=> b!1463848 (=> (not res!992232) (not e!822984))))

(assert (=> b!1463848 (= res!992232 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125540 res!992220) b!1463835))

(assert (= (and b!1463835 res!992222) b!1463838))

(assert (= (and b!1463838 res!992230) b!1463842))

(assert (= (and b!1463842 res!992236) b!1463827))

(assert (= (and b!1463827 res!992227) b!1463847))

(assert (= (and b!1463847 res!992228) b!1463839))

(assert (= (and b!1463839 res!992233) b!1463846))

(assert (= (and b!1463846 res!992235) b!1463833))

(assert (= (and b!1463833 res!992229) b!1463828))

(assert (= (and b!1463828 res!992237) b!1463844))

(assert (= (and b!1463844 res!992234) b!1463836))

(assert (= (and b!1463836 c!135325) b!1463843))

(assert (= (and b!1463836 (not c!135325)) b!1463829))

(assert (= (and b!1463836 res!992226) b!1463848))

(assert (= (and b!1463848 res!992232) b!1463834))

(assert (= (and b!1463834 res!992224) b!1463837))

(assert (= (and b!1463837 res!992231) b!1463845))

(assert (= (and b!1463834 (not res!992225)) b!1463830))

(assert (= (and b!1463830 (not res!992221)) b!1463831))

(assert (= (and b!1463831 (not res!992223)) b!1463841))

(assert (= (and b!1463841 c!135324) b!1463832))

(assert (= (and b!1463841 (not c!135324)) b!1463840))

(declare-fun m!1351301 () Bool)

(assert (=> b!1463840 m!1351301))

(declare-fun m!1351303 () Bool)

(assert (=> b!1463840 m!1351303))

(declare-fun m!1351305 () Bool)

(assert (=> b!1463843 m!1351305))

(declare-fun m!1351307 () Bool)

(assert (=> b!1463842 m!1351307))

(assert (=> b!1463842 m!1351307))

(declare-fun m!1351309 () Bool)

(assert (=> b!1463842 m!1351309))

(declare-fun m!1351311 () Bool)

(assert (=> b!1463846 m!1351311))

(declare-fun m!1351313 () Bool)

(assert (=> b!1463846 m!1351313))

(declare-fun m!1351315 () Bool)

(assert (=> b!1463829 m!1351315))

(assert (=> b!1463829 m!1351303))

(assert (=> b!1463833 m!1351307))

(assert (=> b!1463833 m!1351307))

(declare-fun m!1351317 () Bool)

(assert (=> b!1463833 m!1351317))

(assert (=> b!1463833 m!1351317))

(assert (=> b!1463833 m!1351307))

(declare-fun m!1351319 () Bool)

(assert (=> b!1463833 m!1351319))

(declare-fun m!1351321 () Bool)

(assert (=> start!125540 m!1351321))

(declare-fun m!1351323 () Bool)

(assert (=> start!125540 m!1351323))

(assert (=> b!1463828 m!1351307))

(assert (=> b!1463828 m!1351307))

(declare-fun m!1351325 () Bool)

(assert (=> b!1463828 m!1351325))

(assert (=> b!1463831 m!1351307))

(assert (=> b!1463831 m!1351307))

(declare-fun m!1351327 () Bool)

(assert (=> b!1463831 m!1351327))

(declare-fun m!1351329 () Bool)

(assert (=> b!1463830 m!1351329))

(declare-fun m!1351331 () Bool)

(assert (=> b!1463834 m!1351331))

(assert (=> b!1463834 m!1351311))

(declare-fun m!1351333 () Bool)

(assert (=> b!1463834 m!1351333))

(declare-fun m!1351335 () Bool)

(assert (=> b!1463834 m!1351335))

(declare-fun m!1351337 () Bool)

(assert (=> b!1463834 m!1351337))

(assert (=> b!1463834 m!1351307))

(assert (=> b!1463837 m!1351307))

(assert (=> b!1463837 m!1351307))

(declare-fun m!1351339 () Bool)

(assert (=> b!1463837 m!1351339))

(declare-fun m!1351341 () Bool)

(assert (=> b!1463827 m!1351341))

(declare-fun m!1351343 () Bool)

(assert (=> b!1463844 m!1351343))

(assert (=> b!1463844 m!1351343))

(declare-fun m!1351345 () Bool)

(assert (=> b!1463844 m!1351345))

(assert (=> b!1463844 m!1351311))

(declare-fun m!1351347 () Bool)

(assert (=> b!1463844 m!1351347))

(declare-fun m!1351349 () Bool)

(assert (=> b!1463832 m!1351349))

(declare-fun m!1351351 () Bool)

(assert (=> b!1463845 m!1351351))

(assert (=> b!1463845 m!1351307))

(declare-fun m!1351353 () Bool)

(assert (=> b!1463847 m!1351353))

(declare-fun m!1351355 () Bool)

(assert (=> b!1463838 m!1351355))

(assert (=> b!1463838 m!1351355))

(declare-fun m!1351357 () Bool)

(assert (=> b!1463838 m!1351357))

(push 1)

(assert (not b!1463834))

(assert (not b!1463837))

(assert (not b!1463832))

(assert (not b!1463838))

(assert (not b!1463828))

(assert (not start!125540))

(assert (not b!1463847))

(assert (not b!1463844))

(assert (not b!1463843))

(assert (not b!1463842))

(assert (not b!1463840))

(assert (not b!1463829))

(assert (not b!1463830))

(assert (not b!1463833))

(assert (not b!1463827))

(assert (not b!1463831))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

