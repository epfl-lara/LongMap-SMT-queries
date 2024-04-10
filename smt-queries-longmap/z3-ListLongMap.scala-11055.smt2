; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129164 () Bool)

(assert start!129164)

(declare-fun b!1516015 () Bool)

(declare-fun res!1035927 () Bool)

(declare-fun e!845990 () Bool)

(assert (=> b!1516015 (=> (not res!1035927) (not e!845990))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101020 0))(
  ( (array!101021 (arr!48747 (Array (_ BitVec 32) (_ BitVec 64))) (size!49297 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101020)

(assert (=> b!1516015 (= res!1035927 (and (= (size!49297 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49297 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49297 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516016 () Bool)

(declare-fun res!1035928 () Bool)

(assert (=> b!1516016 (=> (not res!1035928) (not e!845990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101020 (_ BitVec 32)) Bool)

(assert (=> b!1516016 (= res!1035928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516017 () Bool)

(declare-fun res!1035919 () Bool)

(assert (=> b!1516017 (=> (not res!1035919) (not e!845990))))

(declare-datatypes ((List!35230 0))(
  ( (Nil!35227) (Cons!35226 (h!36638 (_ BitVec 64)) (t!49924 List!35230)) )
))
(declare-fun arrayNoDuplicates!0 (array!101020 (_ BitVec 32) List!35230) Bool)

(assert (=> b!1516017 (= res!1035919 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35227))))

(declare-fun b!1516018 () Bool)

(declare-fun res!1035922 () Bool)

(assert (=> b!1516018 (=> (not res!1035922) (not e!845990))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516018 (= res!1035922 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49297 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49297 a!2804))))))

(declare-fun b!1516019 () Bool)

(declare-fun res!1035920 () Bool)

(assert (=> b!1516019 (=> (not res!1035920) (not e!845990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516019 (= res!1035920 (validKeyInArray!0 (select (arr!48747 a!2804) j!70)))))

(declare-fun b!1516020 () Bool)

(declare-fun res!1035926 () Bool)

(declare-fun e!845989 () Bool)

(assert (=> b!1516020 (=> (not res!1035926) (not e!845989))))

(declare-datatypes ((SeekEntryResult!12918 0))(
  ( (MissingZero!12918 (index!54067 (_ BitVec 32))) (Found!12918 (index!54068 (_ BitVec 32))) (Intermediate!12918 (undefined!13730 Bool) (index!54069 (_ BitVec 32)) (x!135764 (_ BitVec 32))) (Undefined!12918) (MissingVacant!12918 (index!54070 (_ BitVec 32))) )
))
(declare-fun lt!657276 () SeekEntryResult!12918)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101020 (_ BitVec 32)) SeekEntryResult!12918)

(assert (=> b!1516020 (= res!1035926 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48747 a!2804) j!70) a!2804 mask!2512) lt!657276))))

(declare-fun res!1035925 () Bool)

(assert (=> start!129164 (=> (not res!1035925) (not e!845990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129164 (= res!1035925 (validMask!0 mask!2512))))

(assert (=> start!129164 e!845990))

(assert (=> start!129164 true))

(declare-fun array_inv!37775 (array!101020) Bool)

(assert (=> start!129164 (array_inv!37775 a!2804)))

(declare-fun b!1516021 () Bool)

(assert (=> b!1516021 (= e!845990 e!845989)))

(declare-fun res!1035924 () Bool)

(assert (=> b!1516021 (=> (not res!1035924) (not e!845989))))

(declare-fun lt!657275 () SeekEntryResult!12918)

(assert (=> b!1516021 (= res!1035924 (= lt!657275 lt!657276))))

(assert (=> b!1516021 (= lt!657276 (Intermediate!12918 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516021 (= lt!657275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48747 a!2804) j!70) mask!2512) (select (arr!48747 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516022 () Bool)

(declare-fun res!1035921 () Bool)

(assert (=> b!1516022 (=> (not res!1035921) (not e!845989))))

(assert (=> b!1516022 (= res!1035921 (= lt!657275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48747 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48747 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101021 (store (arr!48747 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49297 a!2804)) mask!2512)))))

(declare-fun b!1516023 () Bool)

(declare-fun res!1035923 () Bool)

(assert (=> b!1516023 (=> (not res!1035923) (not e!845990))))

(assert (=> b!1516023 (= res!1035923 (validKeyInArray!0 (select (arr!48747 a!2804) i!961)))))

(declare-fun b!1516024 () Bool)

(assert (=> b!1516024 (= e!845989 (not true))))

(declare-fun e!845991 () Bool)

(assert (=> b!1516024 e!845991))

(declare-fun res!1035918 () Bool)

(assert (=> b!1516024 (=> (not res!1035918) (not e!845991))))

(assert (=> b!1516024 (= res!1035918 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50704 0))(
  ( (Unit!50705) )
))
(declare-fun lt!657277 () Unit!50704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50704)

(assert (=> b!1516024 (= lt!657277 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516025 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101020 (_ BitVec 32)) SeekEntryResult!12918)

(assert (=> b!1516025 (= e!845991 (= (seekEntry!0 (select (arr!48747 a!2804) j!70) a!2804 mask!2512) (Found!12918 j!70)))))

(assert (= (and start!129164 res!1035925) b!1516015))

(assert (= (and b!1516015 res!1035927) b!1516023))

(assert (= (and b!1516023 res!1035923) b!1516019))

(assert (= (and b!1516019 res!1035920) b!1516016))

(assert (= (and b!1516016 res!1035928) b!1516017))

(assert (= (and b!1516017 res!1035919) b!1516018))

(assert (= (and b!1516018 res!1035922) b!1516021))

(assert (= (and b!1516021 res!1035924) b!1516020))

(assert (= (and b!1516020 res!1035926) b!1516022))

(assert (= (and b!1516022 res!1035921) b!1516024))

(assert (= (and b!1516024 res!1035918) b!1516025))

(declare-fun m!1399249 () Bool)

(assert (=> start!129164 m!1399249))

(declare-fun m!1399251 () Bool)

(assert (=> start!129164 m!1399251))

(declare-fun m!1399253 () Bool)

(assert (=> b!1516025 m!1399253))

(assert (=> b!1516025 m!1399253))

(declare-fun m!1399255 () Bool)

(assert (=> b!1516025 m!1399255))

(assert (=> b!1516019 m!1399253))

(assert (=> b!1516019 m!1399253))

(declare-fun m!1399257 () Bool)

(assert (=> b!1516019 m!1399257))

(assert (=> b!1516020 m!1399253))

(assert (=> b!1516020 m!1399253))

(declare-fun m!1399259 () Bool)

(assert (=> b!1516020 m!1399259))

(declare-fun m!1399261 () Bool)

(assert (=> b!1516016 m!1399261))

(assert (=> b!1516021 m!1399253))

(assert (=> b!1516021 m!1399253))

(declare-fun m!1399263 () Bool)

(assert (=> b!1516021 m!1399263))

(assert (=> b!1516021 m!1399263))

(assert (=> b!1516021 m!1399253))

(declare-fun m!1399265 () Bool)

(assert (=> b!1516021 m!1399265))

(declare-fun m!1399267 () Bool)

(assert (=> b!1516023 m!1399267))

(assert (=> b!1516023 m!1399267))

(declare-fun m!1399269 () Bool)

(assert (=> b!1516023 m!1399269))

(declare-fun m!1399271 () Bool)

(assert (=> b!1516017 m!1399271))

(declare-fun m!1399273 () Bool)

(assert (=> b!1516022 m!1399273))

(declare-fun m!1399275 () Bool)

(assert (=> b!1516022 m!1399275))

(assert (=> b!1516022 m!1399275))

(declare-fun m!1399277 () Bool)

(assert (=> b!1516022 m!1399277))

(assert (=> b!1516022 m!1399277))

(assert (=> b!1516022 m!1399275))

(declare-fun m!1399279 () Bool)

(assert (=> b!1516022 m!1399279))

(declare-fun m!1399281 () Bool)

(assert (=> b!1516024 m!1399281))

(declare-fun m!1399283 () Bool)

(assert (=> b!1516024 m!1399283))

(check-sat (not b!1516020) (not start!129164) (not b!1516019) (not b!1516022) (not b!1516024) (not b!1516021) (not b!1516025) (not b!1516016) (not b!1516017) (not b!1516023))
(check-sat)
