; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126788 () Bool)

(assert start!126788)

(declare-fun b!1488897 () Bool)

(declare-fun res!1012610 () Bool)

(declare-fun e!834472 () Bool)

(assert (=> b!1488897 (=> (not res!1012610) (not e!834472))))

(declare-fun e!834465 () Bool)

(assert (=> b!1488897 (= res!1012610 e!834465)))

(declare-fun c!137680 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1488897 (= c!137680 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488898 () Bool)

(declare-fun res!1012603 () Bool)

(declare-fun e!834471 () Bool)

(assert (=> b!1488898 (=> (not res!1012603) (not e!834471))))

(declare-datatypes ((array!99559 0))(
  ( (array!99560 (arr!48052 (Array (_ BitVec 32) (_ BitVec 64))) (size!48604 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99559)

(declare-datatypes ((List!34631 0))(
  ( (Nil!34628) (Cons!34627 (h!36010 (_ BitVec 64)) (t!49317 List!34631)) )
))
(declare-fun arrayNoDuplicates!0 (array!99559 (_ BitVec 32) List!34631) Bool)

(assert (=> b!1488898 (= res!1012603 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34628))))

(declare-fun b!1488899 () Bool)

(declare-fun e!834466 () Bool)

(assert (=> b!1488899 (= e!834466 e!834472)))

(declare-fun res!1012611 () Bool)

(assert (=> b!1488899 (=> (not res!1012611) (not e!834472))))

(declare-datatypes ((SeekEntryResult!12317 0))(
  ( (MissingZero!12317 (index!51660 (_ BitVec 32))) (Found!12317 (index!51661 (_ BitVec 32))) (Intermediate!12317 (undefined!13129 Bool) (index!51662 (_ BitVec 32)) (x!133254 (_ BitVec 32))) (Undefined!12317) (MissingVacant!12317 (index!51663 (_ BitVec 32))) )
))
(declare-fun lt!649180 () SeekEntryResult!12317)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1488899 (= res!1012611 (= lt!649180 (Intermediate!12317 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649176 () array!99559)

(declare-fun lt!649178 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99559 (_ BitVec 32)) SeekEntryResult!12317)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488899 (= lt!649180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649178 mask!2687) lt!649178 lt!649176 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488899 (= lt!649178 (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488900 () Bool)

(declare-fun res!1012605 () Bool)

(declare-fun e!834467 () Bool)

(assert (=> b!1488900 (=> res!1012605 e!834467)))

(declare-fun lt!649179 () (_ BitVec 32))

(declare-fun lt!649184 () SeekEntryResult!12317)

(assert (=> b!1488900 (= res!1012605 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649179 (select (arr!48052 a!2862) j!93) a!2862 mask!2687) lt!649184)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1488901 () Bool)

(assert (=> b!1488901 (= e!834465 (= lt!649180 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649178 lt!649176 mask!2687)))))

(declare-fun b!1488902 () Bool)

(declare-fun res!1012614 () Bool)

(assert (=> b!1488902 (=> res!1012614 e!834467)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488902 (= res!1012614 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1488903 () Bool)

(declare-fun res!1012607 () Bool)

(assert (=> b!1488903 (=> (not res!1012607) (not e!834471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488903 (= res!1012607 (validKeyInArray!0 (select (arr!48052 a!2862) j!93)))))

(declare-fun b!1488904 () Bool)

(assert (=> b!1488904 (= e!834467 true)))

(declare-fun lt!649182 () SeekEntryResult!12317)

(declare-fun lt!649177 () SeekEntryResult!12317)

(assert (=> b!1488904 (= lt!649182 lt!649177)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49815 0))(
  ( (Unit!49816) )
))
(declare-fun lt!649183 () Unit!49815)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49815)

(assert (=> b!1488904 (= lt!649183 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649179 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1488905 () Bool)

(declare-fun res!1012604 () Bool)

(assert (=> b!1488905 (=> (not res!1012604) (not e!834471))))

(assert (=> b!1488905 (= res!1012604 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48604 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48604 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48604 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488906 () Bool)

(declare-fun e!834468 () Bool)

(assert (=> b!1488906 (= e!834468 e!834467)))

(declare-fun res!1012601 () Bool)

(assert (=> b!1488906 (=> res!1012601 e!834467)))

(assert (=> b!1488906 (= res!1012601 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649179 #b00000000000000000000000000000000) (bvsge lt!649179 (size!48604 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488906 (= lt!649179 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99559 (_ BitVec 32)) SeekEntryResult!12317)

(assert (=> b!1488906 (= lt!649177 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649178 lt!649176 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99559 (_ BitVec 32)) SeekEntryResult!12317)

(assert (=> b!1488906 (= lt!649177 (seekEntryOrOpen!0 lt!649178 lt!649176 mask!2687))))

(declare-fun e!834473 () Bool)

(declare-fun b!1488907 () Bool)

(assert (=> b!1488907 (= e!834473 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649179 intermediateAfterIndex!19 lt!649178 lt!649176 mask!2687) lt!649177)))))

(declare-fun b!1488908 () Bool)

(declare-fun res!1012600 () Bool)

(assert (=> b!1488908 (=> res!1012600 e!834467)))

(assert (=> b!1488908 (= res!1012600 e!834473)))

(declare-fun c!137679 () Bool)

(assert (=> b!1488908 (= c!137679 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!1012612 () Bool)

(assert (=> start!126788 (=> (not res!1012612) (not e!834471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126788 (= res!1012612 (validMask!0 mask!2687))))

(assert (=> start!126788 e!834471))

(assert (=> start!126788 true))

(declare-fun array_inv!37285 (array!99559) Bool)

(assert (=> start!126788 (array_inv!37285 a!2862)))

(declare-fun b!1488909 () Bool)

(declare-fun res!1012602 () Bool)

(assert (=> b!1488909 (=> (not res!1012602) (not e!834466))))

(assert (=> b!1488909 (= res!1012602 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48052 a!2862) j!93) a!2862 mask!2687) lt!649184))))

(declare-fun b!1488910 () Bool)

(declare-fun res!1012609 () Bool)

(assert (=> b!1488910 (=> (not res!1012609) (not e!834471))))

(assert (=> b!1488910 (= res!1012609 (and (= (size!48604 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48604 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48604 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488911 () Bool)

(declare-fun res!1012599 () Bool)

(assert (=> b!1488911 (=> (not res!1012599) (not e!834471))))

(assert (=> b!1488911 (= res!1012599 (validKeyInArray!0 (select (arr!48052 a!2862) i!1006)))))

(declare-fun b!1488912 () Bool)

(declare-fun e!834469 () Bool)

(assert (=> b!1488912 (= e!834469 e!834466)))

(declare-fun res!1012613 () Bool)

(assert (=> b!1488912 (=> (not res!1012613) (not e!834466))))

(assert (=> b!1488912 (= res!1012613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48052 a!2862) j!93) mask!2687) (select (arr!48052 a!2862) j!93) a!2862 mask!2687) lt!649184))))

(assert (=> b!1488912 (= lt!649184 (Intermediate!12317 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488913 () Bool)

(declare-fun res!1012608 () Bool)

(assert (=> b!1488913 (=> (not res!1012608) (not e!834471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99559 (_ BitVec 32)) Bool)

(assert (=> b!1488913 (= res!1012608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488914 () Bool)

(assert (=> b!1488914 (= e!834471 e!834469)))

(declare-fun res!1012598 () Bool)

(assert (=> b!1488914 (=> (not res!1012598) (not e!834469))))

(assert (=> b!1488914 (= res!1012598 (= (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488914 (= lt!649176 (array!99560 (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48604 a!2862)))))

(declare-fun b!1488915 () Bool)

(declare-fun res!1012615 () Bool)

(assert (=> b!1488915 (=> (not res!1012615) (not e!834472))))

(assert (=> b!1488915 (= res!1012615 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488916 () Bool)

(assert (=> b!1488916 (= e!834473 (not (= lt!649180 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649179 lt!649178 lt!649176 mask!2687))))))

(declare-fun b!1488917 () Bool)

(assert (=> b!1488917 (= e!834472 (not e!834468))))

(declare-fun res!1012606 () Bool)

(assert (=> b!1488917 (=> res!1012606 e!834468)))

(assert (=> b!1488917 (= res!1012606 (or (and (= (select (arr!48052 a!2862) index!646) (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48052 a!2862) index!646) (select (arr!48052 a!2862) j!93))) (= (select (arr!48052 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488917 (and (= lt!649182 (Found!12317 j!93)) (or (= (select (arr!48052 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48052 a!2862) intermediateBeforeIndex!19) (select (arr!48052 a!2862) j!93))) (let ((bdg!54706 (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48052 a!2862) index!646) bdg!54706) (= (select (arr!48052 a!2862) index!646) (select (arr!48052 a!2862) j!93))) (= (select (arr!48052 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54706 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1488917 (= lt!649182 (seekEntryOrOpen!0 (select (arr!48052 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1488917 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649181 () Unit!49815)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49815)

(assert (=> b!1488917 (= lt!649181 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488918 () Bool)

(assert (=> b!1488918 (= e!834465 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649178 lt!649176 mask!2687) (seekEntryOrOpen!0 lt!649178 lt!649176 mask!2687)))))

(assert (= (and start!126788 res!1012612) b!1488910))

(assert (= (and b!1488910 res!1012609) b!1488911))

(assert (= (and b!1488911 res!1012599) b!1488903))

(assert (= (and b!1488903 res!1012607) b!1488913))

(assert (= (and b!1488913 res!1012608) b!1488898))

(assert (= (and b!1488898 res!1012603) b!1488905))

(assert (= (and b!1488905 res!1012604) b!1488914))

(assert (= (and b!1488914 res!1012598) b!1488912))

(assert (= (and b!1488912 res!1012613) b!1488909))

(assert (= (and b!1488909 res!1012602) b!1488899))

(assert (= (and b!1488899 res!1012611) b!1488897))

(assert (= (and b!1488897 c!137680) b!1488901))

(assert (= (and b!1488897 (not c!137680)) b!1488918))

(assert (= (and b!1488897 res!1012610) b!1488915))

(assert (= (and b!1488915 res!1012615) b!1488917))

(assert (= (and b!1488917 (not res!1012606)) b!1488906))

(assert (= (and b!1488906 (not res!1012601)) b!1488900))

(assert (= (and b!1488900 (not res!1012605)) b!1488908))

(assert (= (and b!1488908 c!137679) b!1488916))

(assert (= (and b!1488908 (not c!137679)) b!1488907))

(assert (= (and b!1488908 (not res!1012600)) b!1488902))

(assert (= (and b!1488902 (not res!1012614)) b!1488904))

(declare-fun m!1372611 () Bool)

(assert (=> b!1488911 m!1372611))

(assert (=> b!1488911 m!1372611))

(declare-fun m!1372613 () Bool)

(assert (=> b!1488911 m!1372613))

(declare-fun m!1372615 () Bool)

(assert (=> b!1488917 m!1372615))

(declare-fun m!1372617 () Bool)

(assert (=> b!1488917 m!1372617))

(declare-fun m!1372619 () Bool)

(assert (=> b!1488917 m!1372619))

(declare-fun m!1372621 () Bool)

(assert (=> b!1488917 m!1372621))

(declare-fun m!1372623 () Bool)

(assert (=> b!1488917 m!1372623))

(declare-fun m!1372625 () Bool)

(assert (=> b!1488917 m!1372625))

(declare-fun m!1372627 () Bool)

(assert (=> b!1488917 m!1372627))

(declare-fun m!1372629 () Bool)

(assert (=> b!1488917 m!1372629))

(assert (=> b!1488917 m!1372625))

(declare-fun m!1372631 () Bool)

(assert (=> start!126788 m!1372631))

(declare-fun m!1372633 () Bool)

(assert (=> start!126788 m!1372633))

(assert (=> b!1488909 m!1372625))

(assert (=> b!1488909 m!1372625))

(declare-fun m!1372635 () Bool)

(assert (=> b!1488909 m!1372635))

(assert (=> b!1488903 m!1372625))

(assert (=> b!1488903 m!1372625))

(declare-fun m!1372637 () Bool)

(assert (=> b!1488903 m!1372637))

(declare-fun m!1372639 () Bool)

(assert (=> b!1488906 m!1372639))

(declare-fun m!1372641 () Bool)

(assert (=> b!1488906 m!1372641))

(declare-fun m!1372643 () Bool)

(assert (=> b!1488906 m!1372643))

(assert (=> b!1488912 m!1372625))

(assert (=> b!1488912 m!1372625))

(declare-fun m!1372645 () Bool)

(assert (=> b!1488912 m!1372645))

(assert (=> b!1488912 m!1372645))

(assert (=> b!1488912 m!1372625))

(declare-fun m!1372647 () Bool)

(assert (=> b!1488912 m!1372647))

(declare-fun m!1372649 () Bool)

(assert (=> b!1488898 m!1372649))

(declare-fun m!1372651 () Bool)

(assert (=> b!1488904 m!1372651))

(declare-fun m!1372653 () Bool)

(assert (=> b!1488901 m!1372653))

(declare-fun m!1372655 () Bool)

(assert (=> b!1488913 m!1372655))

(declare-fun m!1372657 () Bool)

(assert (=> b!1488907 m!1372657))

(declare-fun m!1372659 () Bool)

(assert (=> b!1488916 m!1372659))

(assert (=> b!1488914 m!1372617))

(declare-fun m!1372661 () Bool)

(assert (=> b!1488914 m!1372661))

(declare-fun m!1372663 () Bool)

(assert (=> b!1488899 m!1372663))

(assert (=> b!1488899 m!1372663))

(declare-fun m!1372665 () Bool)

(assert (=> b!1488899 m!1372665))

(assert (=> b!1488899 m!1372617))

(declare-fun m!1372667 () Bool)

(assert (=> b!1488899 m!1372667))

(assert (=> b!1488900 m!1372625))

(assert (=> b!1488900 m!1372625))

(declare-fun m!1372669 () Bool)

(assert (=> b!1488900 m!1372669))

(assert (=> b!1488918 m!1372641))

(assert (=> b!1488918 m!1372643))

(check-sat (not b!1488903) (not b!1488898) (not b!1488906) (not b!1488900) (not b!1488918) (not b!1488904) (not b!1488913) (not b!1488911) (not start!126788) (not b!1488917) (not b!1488912) (not b!1488901) (not b!1488909) (not b!1488916) (not b!1488907) (not b!1488899))
(check-sat)
