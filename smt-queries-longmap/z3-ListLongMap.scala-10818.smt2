; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126834 () Bool)

(assert start!126834)

(declare-fun res!1010622 () Bool)

(declare-fun e!833758 () Bool)

(assert (=> start!126834 (=> (not res!1010622) (not e!833758))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126834 (= res!1010622 (validMask!0 mask!2687))))

(assert (=> start!126834 e!833758))

(assert (=> start!126834 true))

(declare-datatypes ((array!99634 0))(
  ( (array!99635 (arr!48088 (Array (_ BitVec 32) (_ BitVec 64))) (size!48639 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99634)

(declare-fun array_inv!37369 (array!99634) Bool)

(assert (=> start!126834 (array_inv!37369 a!2862)))

(declare-fun b!1487012 () Bool)

(declare-fun e!833760 () Bool)

(declare-fun e!833755 () Bool)

(assert (=> b!1487012 (= e!833760 e!833755)))

(declare-fun res!1010625 () Bool)

(assert (=> b!1487012 (=> (not res!1010625) (not e!833755))))

(declare-datatypes ((SeekEntryResult!12225 0))(
  ( (MissingZero!12225 (index!51292 (_ BitVec 32))) (Found!12225 (index!51293 (_ BitVec 32))) (Intermediate!12225 (undefined!13037 Bool) (index!51294 (_ BitVec 32)) (x!133054 (_ BitVec 32))) (Undefined!12225) (MissingVacant!12225 (index!51295 (_ BitVec 32))) )
))
(declare-fun lt!648687 () SeekEntryResult!12225)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99634 (_ BitVec 32)) SeekEntryResult!12225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487012 (= res!1010625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48088 a!2862) j!93) mask!2687) (select (arr!48088 a!2862) j!93) a!2862 mask!2687) lt!648687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487012 (= lt!648687 (Intermediate!12225 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487013 () Bool)

(declare-fun e!833759 () Bool)

(assert (=> b!1487013 (= e!833755 e!833759)))

(declare-fun res!1010613 () Bool)

(assert (=> b!1487013 (=> (not res!1010613) (not e!833759))))

(declare-fun lt!648685 () SeekEntryResult!12225)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487013 (= res!1010613 (= lt!648685 (Intermediate!12225 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!648691 () (_ BitVec 64))

(declare-fun lt!648690 () array!99634)

(assert (=> b!1487013 (= lt!648685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648691 mask!2687) lt!648691 lt!648690 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1487013 (= lt!648691 (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487014 () Bool)

(declare-fun res!1010620 () Bool)

(assert (=> b!1487014 (=> (not res!1010620) (not e!833758))))

(declare-datatypes ((List!34576 0))(
  ( (Nil!34573) (Cons!34572 (h!35960 (_ BitVec 64)) (t!49262 List!34576)) )
))
(declare-fun arrayNoDuplicates!0 (array!99634 (_ BitVec 32) List!34576) Bool)

(assert (=> b!1487014 (= res!1010620 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34573))))

(declare-fun b!1487015 () Bool)

(declare-fun res!1010610 () Bool)

(assert (=> b!1487015 (=> (not res!1010610) (not e!833758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487015 (= res!1010610 (validKeyInArray!0 (select (arr!48088 a!2862) j!93)))))

(declare-fun b!1487016 () Bool)

(declare-fun e!833751 () Bool)

(declare-fun e!833756 () Bool)

(assert (=> b!1487016 (= e!833751 e!833756)))

(declare-fun res!1010621 () Bool)

(assert (=> b!1487016 (=> (not res!1010621) (not e!833756))))

(declare-fun lt!648688 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1487016 (= res!1010621 (and (= index!646 intermediateAfterIndex!19) (= lt!648688 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487017 () Bool)

(declare-fun res!1010623 () Bool)

(declare-fun e!833757 () Bool)

(assert (=> b!1487017 (=> (not res!1010623) (not e!833757))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99634 (_ BitVec 32)) SeekEntryResult!12225)

(assert (=> b!1487017 (= res!1010623 (= (seekEntryOrOpen!0 (select (arr!48088 a!2862) j!93) a!2862 mask!2687) (Found!12225 j!93)))))

(declare-fun b!1487018 () Bool)

(declare-fun res!1010609 () Bool)

(assert (=> b!1487018 (=> (not res!1010609) (not e!833758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99634 (_ BitVec 32)) Bool)

(assert (=> b!1487018 (= res!1010609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487019 () Bool)

(declare-fun e!833752 () Bool)

(assert (=> b!1487019 (= e!833759 (not e!833752))))

(declare-fun res!1010615 () Bool)

(assert (=> b!1487019 (=> res!1010615 e!833752)))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1487019 (= res!1010615 (or (and (= (select (arr!48088 a!2862) index!646) (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48088 a!2862) index!646) (select (arr!48088 a!2862) j!93))) (= (select (arr!48088 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487019 e!833757))

(declare-fun res!1010624 () Bool)

(assert (=> b!1487019 (=> (not res!1010624) (not e!833757))))

(assert (=> b!1487019 (= res!1010624 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49823 0))(
  ( (Unit!49824) )
))
(declare-fun lt!648689 () Unit!49823)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49823)

(assert (=> b!1487019 (= lt!648689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487020 () Bool)

(assert (=> b!1487020 (= e!833758 e!833760)))

(declare-fun res!1010614 () Bool)

(assert (=> b!1487020 (=> (not res!1010614) (not e!833760))))

(assert (=> b!1487020 (= res!1010614 (= (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487020 (= lt!648690 (array!99635 (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48639 a!2862)))))

(declare-fun b!1487021 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99634 (_ BitVec 32)) SeekEntryResult!12225)

(assert (=> b!1487021 (= e!833756 (= (seekEntryOrOpen!0 lt!648691 lt!648690 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648691 lt!648690 mask!2687)))))

(declare-fun e!833753 () Bool)

(declare-fun b!1487022 () Bool)

(assert (=> b!1487022 (= e!833753 (= lt!648685 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648691 lt!648690 mask!2687)))))

(declare-fun b!1487023 () Bool)

(declare-fun res!1010612 () Bool)

(assert (=> b!1487023 (=> (not res!1010612) (not e!833759))))

(assert (=> b!1487023 (= res!1010612 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487024 () Bool)

(assert (=> b!1487024 (= e!833757 e!833751)))

(declare-fun res!1010611 () Bool)

(assert (=> b!1487024 (=> res!1010611 e!833751)))

(assert (=> b!1487024 (= res!1010611 (or (and (= (select (arr!48088 a!2862) index!646) lt!648688) (= (select (arr!48088 a!2862) index!646) (select (arr!48088 a!2862) j!93))) (= (select (arr!48088 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487024 (= lt!648688 (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487025 () Bool)

(declare-fun res!1010618 () Bool)

(assert (=> b!1487025 (=> (not res!1010618) (not e!833755))))

(assert (=> b!1487025 (= res!1010618 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48088 a!2862) j!93) a!2862 mask!2687) lt!648687))))

(declare-fun b!1487026 () Bool)

(assert (=> b!1487026 (= e!833752 true)))

(declare-fun lt!648686 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487026 (= lt!648686 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1487027 () Bool)

(declare-fun res!1010619 () Bool)

(assert (=> b!1487027 (=> (not res!1010619) (not e!833757))))

(assert (=> b!1487027 (= res!1010619 (or (= (select (arr!48088 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48088 a!2862) intermediateBeforeIndex!19) (select (arr!48088 a!2862) j!93))))))

(declare-fun b!1487028 () Bool)

(declare-fun res!1010627 () Bool)

(assert (=> b!1487028 (=> (not res!1010627) (not e!833758))))

(assert (=> b!1487028 (= res!1010627 (validKeyInArray!0 (select (arr!48088 a!2862) i!1006)))))

(declare-fun b!1487029 () Bool)

(declare-fun res!1010626 () Bool)

(assert (=> b!1487029 (=> (not res!1010626) (not e!833759))))

(assert (=> b!1487029 (= res!1010626 e!833753)))

(declare-fun c!137734 () Bool)

(assert (=> b!1487029 (= c!137734 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487030 () Bool)

(assert (=> b!1487030 (= e!833753 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648691 lt!648690 mask!2687) (seekEntryOrOpen!0 lt!648691 lt!648690 mask!2687)))))

(declare-fun b!1487031 () Bool)

(declare-fun res!1010616 () Bool)

(assert (=> b!1487031 (=> (not res!1010616) (not e!833758))))

(assert (=> b!1487031 (= res!1010616 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48639 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48639 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48639 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487032 () Bool)

(declare-fun res!1010617 () Bool)

(assert (=> b!1487032 (=> (not res!1010617) (not e!833758))))

(assert (=> b!1487032 (= res!1010617 (and (= (size!48639 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48639 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48639 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126834 res!1010622) b!1487032))

(assert (= (and b!1487032 res!1010617) b!1487028))

(assert (= (and b!1487028 res!1010627) b!1487015))

(assert (= (and b!1487015 res!1010610) b!1487018))

(assert (= (and b!1487018 res!1010609) b!1487014))

(assert (= (and b!1487014 res!1010620) b!1487031))

(assert (= (and b!1487031 res!1010616) b!1487020))

(assert (= (and b!1487020 res!1010614) b!1487012))

(assert (= (and b!1487012 res!1010625) b!1487025))

(assert (= (and b!1487025 res!1010618) b!1487013))

(assert (= (and b!1487013 res!1010613) b!1487029))

(assert (= (and b!1487029 c!137734) b!1487022))

(assert (= (and b!1487029 (not c!137734)) b!1487030))

(assert (= (and b!1487029 res!1010626) b!1487023))

(assert (= (and b!1487023 res!1010612) b!1487019))

(assert (= (and b!1487019 res!1010624) b!1487017))

(assert (= (and b!1487017 res!1010623) b!1487027))

(assert (= (and b!1487027 res!1010619) b!1487024))

(assert (= (and b!1487024 (not res!1010611)) b!1487016))

(assert (= (and b!1487016 res!1010621) b!1487021))

(assert (= (and b!1487019 (not res!1010615)) b!1487026))

(declare-fun m!1372147 () Bool)

(assert (=> b!1487027 m!1372147))

(declare-fun m!1372149 () Bool)

(assert (=> b!1487027 m!1372149))

(declare-fun m!1372151 () Bool)

(assert (=> b!1487021 m!1372151))

(declare-fun m!1372153 () Bool)

(assert (=> b!1487021 m!1372153))

(declare-fun m!1372155 () Bool)

(assert (=> b!1487014 m!1372155))

(declare-fun m!1372157 () Bool)

(assert (=> b!1487024 m!1372157))

(assert (=> b!1487024 m!1372149))

(declare-fun m!1372159 () Bool)

(assert (=> b!1487024 m!1372159))

(declare-fun m!1372161 () Bool)

(assert (=> b!1487024 m!1372161))

(assert (=> b!1487015 m!1372149))

(assert (=> b!1487015 m!1372149))

(declare-fun m!1372163 () Bool)

(assert (=> b!1487015 m!1372163))

(assert (=> b!1487012 m!1372149))

(assert (=> b!1487012 m!1372149))

(declare-fun m!1372165 () Bool)

(assert (=> b!1487012 m!1372165))

(assert (=> b!1487012 m!1372165))

(assert (=> b!1487012 m!1372149))

(declare-fun m!1372167 () Bool)

(assert (=> b!1487012 m!1372167))

(assert (=> b!1487020 m!1372159))

(declare-fun m!1372169 () Bool)

(assert (=> b!1487020 m!1372169))

(declare-fun m!1372171 () Bool)

(assert (=> b!1487028 m!1372171))

(assert (=> b!1487028 m!1372171))

(declare-fun m!1372173 () Bool)

(assert (=> b!1487028 m!1372173))

(declare-fun m!1372175 () Bool)

(assert (=> b!1487018 m!1372175))

(declare-fun m!1372177 () Bool)

(assert (=> start!126834 m!1372177))

(declare-fun m!1372179 () Bool)

(assert (=> start!126834 m!1372179))

(assert (=> b!1487017 m!1372149))

(assert (=> b!1487017 m!1372149))

(declare-fun m!1372181 () Bool)

(assert (=> b!1487017 m!1372181))

(assert (=> b!1487030 m!1372153))

(assert (=> b!1487030 m!1372151))

(declare-fun m!1372183 () Bool)

(assert (=> b!1487026 m!1372183))

(assert (=> b!1487025 m!1372149))

(assert (=> b!1487025 m!1372149))

(declare-fun m!1372185 () Bool)

(assert (=> b!1487025 m!1372185))

(declare-fun m!1372187 () Bool)

(assert (=> b!1487022 m!1372187))

(declare-fun m!1372189 () Bool)

(assert (=> b!1487013 m!1372189))

(assert (=> b!1487013 m!1372189))

(declare-fun m!1372191 () Bool)

(assert (=> b!1487013 m!1372191))

(assert (=> b!1487013 m!1372159))

(declare-fun m!1372193 () Bool)

(assert (=> b!1487013 m!1372193))

(declare-fun m!1372195 () Bool)

(assert (=> b!1487019 m!1372195))

(assert (=> b!1487019 m!1372159))

(assert (=> b!1487019 m!1372161))

(assert (=> b!1487019 m!1372157))

(declare-fun m!1372197 () Bool)

(assert (=> b!1487019 m!1372197))

(assert (=> b!1487019 m!1372149))

(check-sat (not b!1487012) (not b!1487028) (not b!1487017) (not b!1487019) (not b!1487030) (not b!1487013) (not b!1487018) (not b!1487021) (not b!1487015) (not b!1487025) (not b!1487026) (not start!126834) (not b!1487022) (not b!1487014))
(check-sat)
