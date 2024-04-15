; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124750 () Bool)

(assert start!124750)

(declare-fun b!1447263 () Bool)

(declare-fun e!815081 () Bool)

(assert (=> b!1447263 (= e!815081 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11654 0))(
  ( (MissingZero!11654 (index!49008 (_ BitVec 32))) (Found!11654 (index!49009 (_ BitVec 32))) (Intermediate!11654 (undefined!12466 Bool) (index!49010 (_ BitVec 32)) (x!130682 (_ BitVec 32))) (Undefined!11654) (MissingVacant!11654 (index!49011 (_ BitVec 32))) )
))
(declare-fun lt!634936 () SeekEntryResult!11654)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98176 0))(
  ( (array!98177 (arr!47377 (Array (_ BitVec 32) (_ BitVec 64))) (size!47929 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98176)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98176 (_ BitVec 32)) SeekEntryResult!11654)

(assert (=> b!1447263 (= lt!634936 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47377 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447264 () Bool)

(declare-fun res!979033 () Bool)

(declare-fun e!815084 () Bool)

(assert (=> b!1447264 (=> (not res!979033) (not e!815084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98176 (_ BitVec 32)) Bool)

(assert (=> b!1447264 (= res!979033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447265 () Bool)

(declare-fun res!979030 () Bool)

(declare-fun e!815085 () Bool)

(assert (=> b!1447265 (=> (not res!979030) (not e!815085))))

(declare-fun lt!634940 () SeekEntryResult!11654)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98176 (_ BitVec 32)) SeekEntryResult!11654)

(assert (=> b!1447265 (= res!979030 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47377 a!2862) j!93) a!2862 mask!2687) lt!634940))))

(declare-fun b!1447266 () Bool)

(declare-fun res!979032 () Bool)

(declare-fun e!815088 () Bool)

(assert (=> b!1447266 (=> (not res!979032) (not e!815088))))

(declare-fun e!815087 () Bool)

(assert (=> b!1447266 (= res!979032 e!815087)))

(declare-fun c!133630 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447266 (= c!133630 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447267 () Bool)

(declare-fun res!979035 () Bool)

(assert (=> b!1447267 (=> (not res!979035) (not e!815084))))

(declare-datatypes ((List!33956 0))(
  ( (Nil!33953) (Cons!33952 (h!35302 (_ BitVec 64)) (t!48642 List!33956)) )
))
(declare-fun arrayNoDuplicates!0 (array!98176 (_ BitVec 32) List!33956) Bool)

(assert (=> b!1447267 (= res!979035 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33953))))

(declare-fun b!1447268 () Bool)

(declare-fun res!979045 () Bool)

(assert (=> b!1447268 (=> (not res!979045) (not e!815084))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447268 (= res!979045 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47929 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47929 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47929 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447269 () Bool)

(declare-fun res!979042 () Bool)

(assert (=> b!1447269 (=> (not res!979042) (not e!815084))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447269 (= res!979042 (and (= (size!47929 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47929 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47929 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!979044 () Bool)

(assert (=> start!124750 (=> (not res!979044) (not e!815084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124750 (= res!979044 (validMask!0 mask!2687))))

(assert (=> start!124750 e!815084))

(assert (=> start!124750 true))

(declare-fun array_inv!36610 (array!98176) Bool)

(assert (=> start!124750 (array_inv!36610 a!2862)))

(declare-fun b!1447270 () Bool)

(declare-fun e!815083 () Bool)

(assert (=> b!1447270 (= e!815083 e!815085)))

(declare-fun res!979040 () Bool)

(assert (=> b!1447270 (=> (not res!979040) (not e!815085))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447270 (= res!979040 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47377 a!2862) j!93) mask!2687) (select (arr!47377 a!2862) j!93) a!2862 mask!2687) lt!634940))))

(assert (=> b!1447270 (= lt!634940 (Intermediate!11654 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!634935 () (_ BitVec 64))

(declare-fun b!1447271 () Bool)

(declare-fun lt!634938 () array!98176)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98176 (_ BitVec 32)) SeekEntryResult!11654)

(assert (=> b!1447271 (= e!815087 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634935 lt!634938 mask!2687) (seekEntryOrOpen!0 lt!634935 lt!634938 mask!2687)))))

(declare-fun e!815086 () Bool)

(declare-fun b!1447272 () Bool)

(assert (=> b!1447272 (= e!815086 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447273 () Bool)

(declare-fun res!979034 () Bool)

(assert (=> b!1447273 (=> (not res!979034) (not e!815084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447273 (= res!979034 (validKeyInArray!0 (select (arr!47377 a!2862) j!93)))))

(declare-fun b!1447274 () Bool)

(declare-fun res!979031 () Bool)

(assert (=> b!1447274 (=> (not res!979031) (not e!815088))))

(assert (=> b!1447274 (= res!979031 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447275 () Bool)

(declare-fun lt!634941 () SeekEntryResult!11654)

(assert (=> b!1447275 (= e!815087 (= lt!634941 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634935 lt!634938 mask!2687)))))

(declare-fun b!1447276 () Bool)

(declare-fun e!815082 () Bool)

(assert (=> b!1447276 (= e!815082 e!815086)))

(declare-fun res!979038 () Bool)

(assert (=> b!1447276 (=> (not res!979038) (not e!815086))))

(declare-fun lt!634939 () SeekEntryResult!11654)

(assert (=> b!1447276 (= res!979038 (= lt!634939 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47377 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447277 () Bool)

(assert (=> b!1447277 (= e!815084 e!815083)))

(declare-fun res!979043 () Bool)

(assert (=> b!1447277 (=> (not res!979043) (not e!815083))))

(assert (=> b!1447277 (= res!979043 (= (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447277 (= lt!634938 (array!98177 (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47929 a!2862)))))

(declare-fun b!1447278 () Bool)

(declare-fun res!979029 () Bool)

(assert (=> b!1447278 (=> (not res!979029) (not e!815084))))

(assert (=> b!1447278 (= res!979029 (validKeyInArray!0 (select (arr!47377 a!2862) i!1006)))))

(declare-fun b!1447279 () Bool)

(assert (=> b!1447279 (= e!815088 (not e!815081))))

(declare-fun res!979036 () Bool)

(assert (=> b!1447279 (=> res!979036 e!815081)))

(assert (=> b!1447279 (= res!979036 (or (and (= (select (arr!47377 a!2862) index!646) (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47377 a!2862) index!646) (select (arr!47377 a!2862) j!93))) (not (= (select (arr!47377 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47377 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815079 () Bool)

(assert (=> b!1447279 e!815079))

(declare-fun res!979037 () Bool)

(assert (=> b!1447279 (=> (not res!979037) (not e!815079))))

(assert (=> b!1447279 (= res!979037 (and (= lt!634939 (Found!11654 j!93)) (or (= (select (arr!47377 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47377 a!2862) intermediateBeforeIndex!19) (select (arr!47377 a!2862) j!93)))))))

(assert (=> b!1447279 (= lt!634939 (seekEntryOrOpen!0 (select (arr!47377 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447279 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48645 0))(
  ( (Unit!48646) )
))
(declare-fun lt!634937 () Unit!48645)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48645)

(assert (=> b!1447279 (= lt!634937 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447280 () Bool)

(assert (=> b!1447280 (= e!815079 e!815082)))

(declare-fun res!979041 () Bool)

(assert (=> b!1447280 (=> res!979041 e!815082)))

(assert (=> b!1447280 (= res!979041 (or (and (= (select (arr!47377 a!2862) index!646) (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47377 a!2862) index!646) (select (arr!47377 a!2862) j!93))) (not (= (select (arr!47377 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447281 () Bool)

(assert (=> b!1447281 (= e!815085 e!815088)))

(declare-fun res!979039 () Bool)

(assert (=> b!1447281 (=> (not res!979039) (not e!815088))))

(assert (=> b!1447281 (= res!979039 (= lt!634941 (Intermediate!11654 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447281 (= lt!634941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634935 mask!2687) lt!634935 lt!634938 mask!2687))))

(assert (=> b!1447281 (= lt!634935 (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124750 res!979044) b!1447269))

(assert (= (and b!1447269 res!979042) b!1447278))

(assert (= (and b!1447278 res!979029) b!1447273))

(assert (= (and b!1447273 res!979034) b!1447264))

(assert (= (and b!1447264 res!979033) b!1447267))

(assert (= (and b!1447267 res!979035) b!1447268))

(assert (= (and b!1447268 res!979045) b!1447277))

(assert (= (and b!1447277 res!979043) b!1447270))

(assert (= (and b!1447270 res!979040) b!1447265))

(assert (= (and b!1447265 res!979030) b!1447281))

(assert (= (and b!1447281 res!979039) b!1447266))

(assert (= (and b!1447266 c!133630) b!1447275))

(assert (= (and b!1447266 (not c!133630)) b!1447271))

(assert (= (and b!1447266 res!979032) b!1447274))

(assert (= (and b!1447274 res!979031) b!1447279))

(assert (= (and b!1447279 res!979037) b!1447280))

(assert (= (and b!1447280 (not res!979041)) b!1447276))

(assert (= (and b!1447276 res!979038) b!1447272))

(assert (= (and b!1447279 (not res!979036)) b!1447263))

(declare-fun m!1335597 () Bool)

(assert (=> b!1447281 m!1335597))

(assert (=> b!1447281 m!1335597))

(declare-fun m!1335599 () Bool)

(assert (=> b!1447281 m!1335599))

(declare-fun m!1335601 () Bool)

(assert (=> b!1447281 m!1335601))

(declare-fun m!1335603 () Bool)

(assert (=> b!1447281 m!1335603))

(declare-fun m!1335605 () Bool)

(assert (=> b!1447275 m!1335605))

(declare-fun m!1335607 () Bool)

(assert (=> b!1447264 m!1335607))

(declare-fun m!1335609 () Bool)

(assert (=> b!1447280 m!1335609))

(assert (=> b!1447280 m!1335601))

(declare-fun m!1335611 () Bool)

(assert (=> b!1447280 m!1335611))

(declare-fun m!1335613 () Bool)

(assert (=> b!1447280 m!1335613))

(assert (=> b!1447270 m!1335613))

(assert (=> b!1447270 m!1335613))

(declare-fun m!1335615 () Bool)

(assert (=> b!1447270 m!1335615))

(assert (=> b!1447270 m!1335615))

(assert (=> b!1447270 m!1335613))

(declare-fun m!1335617 () Bool)

(assert (=> b!1447270 m!1335617))

(declare-fun m!1335619 () Bool)

(assert (=> b!1447278 m!1335619))

(assert (=> b!1447278 m!1335619))

(declare-fun m!1335621 () Bool)

(assert (=> b!1447278 m!1335621))

(declare-fun m!1335623 () Bool)

(assert (=> b!1447271 m!1335623))

(declare-fun m!1335625 () Bool)

(assert (=> b!1447271 m!1335625))

(declare-fun m!1335627 () Bool)

(assert (=> start!124750 m!1335627))

(declare-fun m!1335629 () Bool)

(assert (=> start!124750 m!1335629))

(assert (=> b!1447265 m!1335613))

(assert (=> b!1447265 m!1335613))

(declare-fun m!1335631 () Bool)

(assert (=> b!1447265 m!1335631))

(assert (=> b!1447277 m!1335601))

(declare-fun m!1335633 () Bool)

(assert (=> b!1447277 m!1335633))

(declare-fun m!1335635 () Bool)

(assert (=> b!1447267 m!1335635))

(assert (=> b!1447273 m!1335613))

(assert (=> b!1447273 m!1335613))

(declare-fun m!1335637 () Bool)

(assert (=> b!1447273 m!1335637))

(declare-fun m!1335639 () Bool)

(assert (=> b!1447279 m!1335639))

(assert (=> b!1447279 m!1335601))

(declare-fun m!1335641 () Bool)

(assert (=> b!1447279 m!1335641))

(assert (=> b!1447279 m!1335611))

(assert (=> b!1447279 m!1335609))

(assert (=> b!1447279 m!1335613))

(declare-fun m!1335643 () Bool)

(assert (=> b!1447279 m!1335643))

(declare-fun m!1335645 () Bool)

(assert (=> b!1447279 m!1335645))

(assert (=> b!1447279 m!1335613))

(assert (=> b!1447276 m!1335613))

(assert (=> b!1447276 m!1335613))

(declare-fun m!1335647 () Bool)

(assert (=> b!1447276 m!1335647))

(assert (=> b!1447263 m!1335613))

(assert (=> b!1447263 m!1335613))

(declare-fun m!1335649 () Bool)

(assert (=> b!1447263 m!1335649))

(check-sat (not b!1447275) (not b!1447273) (not b!1447271) (not b!1447276) (not b!1447278) (not b!1447263) (not b!1447265) (not b!1447267) (not start!124750) (not b!1447264) (not b!1447281) (not b!1447279) (not b!1447270))
(check-sat)
