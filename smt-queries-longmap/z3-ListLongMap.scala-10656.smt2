; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125076 () Bool)

(assert start!125076)

(declare-fun b!1456152 () Bool)

(declare-fun res!986689 () Bool)

(declare-fun e!819308 () Bool)

(assert (=> b!1456152 (=> (not res!986689) (not e!819308))))

(declare-fun e!819302 () Bool)

(assert (=> b!1456152 (= res!986689 e!819302)))

(declare-fun c!134244 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456152 (= c!134244 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456153 () Bool)

(declare-fun res!986688 () Bool)

(declare-fun e!819304 () Bool)

(assert (=> b!1456153 (=> (not res!986688) (not e!819304))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98524 0))(
  ( (array!98525 (arr!47550 (Array (_ BitVec 32) (_ BitVec 64))) (size!48100 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98524)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1456153 (= res!986688 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48100 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48100 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48100 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456154 () Bool)

(declare-fun res!986692 () Bool)

(declare-fun e!819306 () Bool)

(assert (=> b!1456154 (=> res!986692 e!819306)))

(declare-fun lt!638214 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11802 0))(
  ( (MissingZero!11802 (index!49600 (_ BitVec 32))) (Found!11802 (index!49601 (_ BitVec 32))) (Intermediate!11802 (undefined!12614 Bool) (index!49602 (_ BitVec 32)) (x!131227 (_ BitVec 32))) (Undefined!11802) (MissingVacant!11802 (index!49603 (_ BitVec 32))) )
))
(declare-fun lt!638211 () SeekEntryResult!11802)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98524 (_ BitVec 32)) SeekEntryResult!11802)

(assert (=> b!1456154 (= res!986692 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638214 (select (arr!47550 a!2862) j!93) a!2862 mask!2687) lt!638211)))))

(declare-fun b!1456155 () Bool)

(declare-fun e!819311 () Bool)

(assert (=> b!1456155 (= e!819311 e!819308)))

(declare-fun res!986704 () Bool)

(assert (=> b!1456155 (=> (not res!986704) (not e!819308))))

(declare-fun lt!638210 () SeekEntryResult!11802)

(assert (=> b!1456155 (= res!986704 (= lt!638210 (Intermediate!11802 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!638215 () array!98524)

(declare-fun lt!638212 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456155 (= lt!638210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638212 mask!2687) lt!638212 lt!638215 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456155 (= lt!638212 (select (store (arr!47550 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456156 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98524 (_ BitVec 32)) SeekEntryResult!11802)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98524 (_ BitVec 32)) SeekEntryResult!11802)

(assert (=> b!1456156 (= e!819302 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638212 lt!638215 mask!2687) (seekEntryOrOpen!0 lt!638212 lt!638215 mask!2687)))))

(declare-fun b!1456157 () Bool)

(declare-fun res!986695 () Bool)

(assert (=> b!1456157 (=> (not res!986695) (not e!819304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98524 (_ BitVec 32)) Bool)

(assert (=> b!1456157 (= res!986695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456158 () Bool)

(declare-fun e!819310 () Bool)

(assert (=> b!1456158 (= e!819310 (and (or (= (select (arr!47550 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47550 a!2862) intermediateBeforeIndex!19) (select (arr!47550 a!2862) j!93))) (let ((bdg!53218 (select (store (arr!47550 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47550 a!2862) index!646) bdg!53218) (= (select (arr!47550 a!2862) index!646) (select (arr!47550 a!2862) j!93))) (= (select (arr!47550 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53218 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456159 () Bool)

(declare-fun e!819307 () Bool)

(assert (=> b!1456159 (= e!819307 (not (= lt!638210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638214 lt!638212 lt!638215 mask!2687))))))

(declare-fun b!1456160 () Bool)

(declare-fun res!986700 () Bool)

(assert (=> b!1456160 (=> (not res!986700) (not e!819304))))

(assert (=> b!1456160 (= res!986700 (and (= (size!48100 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48100 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48100 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456161 () Bool)

(declare-fun res!986698 () Bool)

(assert (=> b!1456161 (=> (not res!986698) (not e!819304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456161 (= res!986698 (validKeyInArray!0 (select (arr!47550 a!2862) i!1006)))))

(declare-fun b!1456162 () Bool)

(declare-fun e!819305 () Bool)

(assert (=> b!1456162 (= e!819305 e!819311)))

(declare-fun res!986703 () Bool)

(assert (=> b!1456162 (=> (not res!986703) (not e!819311))))

(assert (=> b!1456162 (= res!986703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47550 a!2862) j!93) mask!2687) (select (arr!47550 a!2862) j!93) a!2862 mask!2687) lt!638211))))

(assert (=> b!1456162 (= lt!638211 (Intermediate!11802 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!986702 () Bool)

(assert (=> start!125076 (=> (not res!986702) (not e!819304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125076 (= res!986702 (validMask!0 mask!2687))))

(assert (=> start!125076 e!819304))

(assert (=> start!125076 true))

(declare-fun array_inv!36578 (array!98524) Bool)

(assert (=> start!125076 (array_inv!36578 a!2862)))

(declare-fun b!1456163 () Bool)

(declare-fun res!986699 () Bool)

(assert (=> b!1456163 (=> (not res!986699) (not e!819304))))

(declare-datatypes ((List!34051 0))(
  ( (Nil!34048) (Cons!34047 (h!35397 (_ BitVec 64)) (t!48745 List!34051)) )
))
(declare-fun arrayNoDuplicates!0 (array!98524 (_ BitVec 32) List!34051) Bool)

(assert (=> b!1456163 (= res!986699 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34048))))

(declare-fun b!1456164 () Bool)

(declare-fun e!819303 () Bool)

(assert (=> b!1456164 (= e!819308 (not e!819303))))

(declare-fun res!986696 () Bool)

(assert (=> b!1456164 (=> res!986696 e!819303)))

(assert (=> b!1456164 (= res!986696 (or (and (= (select (arr!47550 a!2862) index!646) (select (store (arr!47550 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47550 a!2862) index!646) (select (arr!47550 a!2862) j!93))) (= (select (arr!47550 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456164 e!819310))

(declare-fun res!986694 () Bool)

(assert (=> b!1456164 (=> (not res!986694) (not e!819310))))

(assert (=> b!1456164 (= res!986694 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49100 0))(
  ( (Unit!49101) )
))
(declare-fun lt!638217 () Unit!49100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49100)

(assert (=> b!1456164 (= lt!638217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456165 () Bool)

(declare-fun res!986690 () Bool)

(assert (=> b!1456165 (=> (not res!986690) (not e!819310))))

(assert (=> b!1456165 (= res!986690 (= (seekEntryOrOpen!0 (select (arr!47550 a!2862) j!93) a!2862 mask!2687) (Found!11802 j!93)))))

(declare-fun b!1456166 () Bool)

(assert (=> b!1456166 (= e!819303 e!819306)))

(declare-fun res!986701 () Bool)

(assert (=> b!1456166 (=> res!986701 e!819306)))

(assert (=> b!1456166 (= res!986701 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638214 #b00000000000000000000000000000000) (bvsge lt!638214 (size!48100 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456166 (= lt!638214 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638213 () SeekEntryResult!11802)

(assert (=> b!1456166 (= lt!638213 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638212 lt!638215 mask!2687))))

(assert (=> b!1456166 (= lt!638213 (seekEntryOrOpen!0 lt!638212 lt!638215 mask!2687))))

(declare-fun b!1456167 () Bool)

(assert (=> b!1456167 (= e!819307 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638214 intermediateAfterIndex!19 lt!638212 lt!638215 mask!2687) lt!638213)))))

(declare-fun b!1456168 () Bool)

(declare-fun res!986693 () Bool)

(assert (=> b!1456168 (=> (not res!986693) (not e!819311))))

(assert (=> b!1456168 (= res!986693 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47550 a!2862) j!93) a!2862 mask!2687) lt!638211))))

(declare-fun b!1456169 () Bool)

(assert (=> b!1456169 (= e!819302 (= lt!638210 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638212 lt!638215 mask!2687)))))

(declare-fun b!1456170 () Bool)

(assert (=> b!1456170 (= e!819304 e!819305)))

(declare-fun res!986697 () Bool)

(assert (=> b!1456170 (=> (not res!986697) (not e!819305))))

(assert (=> b!1456170 (= res!986697 (= (select (store (arr!47550 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456170 (= lt!638215 (array!98525 (store (arr!47550 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48100 a!2862)))))

(declare-fun b!1456171 () Bool)

(declare-fun res!986687 () Bool)

(assert (=> b!1456171 (=> (not res!986687) (not e!819308))))

(assert (=> b!1456171 (= res!986687 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456172 () Bool)

(assert (=> b!1456172 (= e!819306 true)))

(declare-fun lt!638216 () Bool)

(assert (=> b!1456172 (= lt!638216 e!819307)))

(declare-fun c!134243 () Bool)

(assert (=> b!1456172 (= c!134243 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456173 () Bool)

(declare-fun res!986691 () Bool)

(assert (=> b!1456173 (=> (not res!986691) (not e!819304))))

(assert (=> b!1456173 (= res!986691 (validKeyInArray!0 (select (arr!47550 a!2862) j!93)))))

(assert (= (and start!125076 res!986702) b!1456160))

(assert (= (and b!1456160 res!986700) b!1456161))

(assert (= (and b!1456161 res!986698) b!1456173))

(assert (= (and b!1456173 res!986691) b!1456157))

(assert (= (and b!1456157 res!986695) b!1456163))

(assert (= (and b!1456163 res!986699) b!1456153))

(assert (= (and b!1456153 res!986688) b!1456170))

(assert (= (and b!1456170 res!986697) b!1456162))

(assert (= (and b!1456162 res!986703) b!1456168))

(assert (= (and b!1456168 res!986693) b!1456155))

(assert (= (and b!1456155 res!986704) b!1456152))

(assert (= (and b!1456152 c!134244) b!1456169))

(assert (= (and b!1456152 (not c!134244)) b!1456156))

(assert (= (and b!1456152 res!986689) b!1456171))

(assert (= (and b!1456171 res!986687) b!1456164))

(assert (= (and b!1456164 res!986694) b!1456165))

(assert (= (and b!1456165 res!986690) b!1456158))

(assert (= (and b!1456164 (not res!986696)) b!1456166))

(assert (= (and b!1456166 (not res!986701)) b!1456154))

(assert (= (and b!1456154 (not res!986692)) b!1456172))

(assert (= (and b!1456172 c!134243) b!1456159))

(assert (= (and b!1456172 (not c!134243)) b!1456167))

(declare-fun m!1344287 () Bool)

(assert (=> b!1456162 m!1344287))

(assert (=> b!1456162 m!1344287))

(declare-fun m!1344289 () Bool)

(assert (=> b!1456162 m!1344289))

(assert (=> b!1456162 m!1344289))

(assert (=> b!1456162 m!1344287))

(declare-fun m!1344291 () Bool)

(assert (=> b!1456162 m!1344291))

(assert (=> b!1456154 m!1344287))

(assert (=> b!1456154 m!1344287))

(declare-fun m!1344293 () Bool)

(assert (=> b!1456154 m!1344293))

(declare-fun m!1344295 () Bool)

(assert (=> b!1456161 m!1344295))

(assert (=> b!1456161 m!1344295))

(declare-fun m!1344297 () Bool)

(assert (=> b!1456161 m!1344297))

(declare-fun m!1344299 () Bool)

(assert (=> b!1456169 m!1344299))

(assert (=> b!1456173 m!1344287))

(assert (=> b!1456173 m!1344287))

(declare-fun m!1344301 () Bool)

(assert (=> b!1456173 m!1344301))

(declare-fun m!1344303 () Bool)

(assert (=> b!1456159 m!1344303))

(declare-fun m!1344305 () Bool)

(assert (=> b!1456157 m!1344305))

(assert (=> b!1456165 m!1344287))

(assert (=> b!1456165 m!1344287))

(declare-fun m!1344307 () Bool)

(assert (=> b!1456165 m!1344307))

(declare-fun m!1344309 () Bool)

(assert (=> b!1456155 m!1344309))

(assert (=> b!1456155 m!1344309))

(declare-fun m!1344311 () Bool)

(assert (=> b!1456155 m!1344311))

(declare-fun m!1344313 () Bool)

(assert (=> b!1456155 m!1344313))

(declare-fun m!1344315 () Bool)

(assert (=> b!1456155 m!1344315))

(declare-fun m!1344317 () Bool)

(assert (=> start!125076 m!1344317))

(declare-fun m!1344319 () Bool)

(assert (=> start!125076 m!1344319))

(declare-fun m!1344321 () Bool)

(assert (=> b!1456156 m!1344321))

(declare-fun m!1344323 () Bool)

(assert (=> b!1456156 m!1344323))

(declare-fun m!1344325 () Bool)

(assert (=> b!1456163 m!1344325))

(declare-fun m!1344327 () Bool)

(assert (=> b!1456166 m!1344327))

(assert (=> b!1456166 m!1344321))

(assert (=> b!1456166 m!1344323))

(assert (=> b!1456158 m!1344313))

(declare-fun m!1344329 () Bool)

(assert (=> b!1456158 m!1344329))

(declare-fun m!1344331 () Bool)

(assert (=> b!1456158 m!1344331))

(declare-fun m!1344333 () Bool)

(assert (=> b!1456158 m!1344333))

(assert (=> b!1456158 m!1344287))

(declare-fun m!1344335 () Bool)

(assert (=> b!1456167 m!1344335))

(assert (=> b!1456168 m!1344287))

(assert (=> b!1456168 m!1344287))

(declare-fun m!1344337 () Bool)

(assert (=> b!1456168 m!1344337))

(declare-fun m!1344339 () Bool)

(assert (=> b!1456164 m!1344339))

(assert (=> b!1456164 m!1344313))

(assert (=> b!1456164 m!1344331))

(assert (=> b!1456164 m!1344333))

(declare-fun m!1344341 () Bool)

(assert (=> b!1456164 m!1344341))

(assert (=> b!1456164 m!1344287))

(assert (=> b!1456170 m!1344313))

(declare-fun m!1344343 () Bool)

(assert (=> b!1456170 m!1344343))

(check-sat (not b!1456154) (not b!1456166) (not b!1456173) (not b!1456164) (not b!1456161) (not b!1456155) (not b!1456169) (not b!1456165) (not b!1456157) (not b!1456156) (not b!1456163) (not b!1456168) (not b!1456159) (not start!125076) (not b!1456162) (not b!1456167))
(check-sat)
