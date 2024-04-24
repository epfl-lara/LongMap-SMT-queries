; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129476 () Bool)

(assert start!129476)

(declare-fun b!1518012 () Bool)

(declare-fun e!847186 () Bool)

(declare-fun e!847187 () Bool)

(assert (=> b!1518012 (= e!847186 e!847187)))

(declare-fun res!1036745 () Bool)

(assert (=> b!1518012 (=> (not res!1036745) (not e!847187))))

(declare-datatypes ((SeekEntryResult!12869 0))(
  ( (MissingZero!12869 (index!53871 (_ BitVec 32))) (Found!12869 (index!53872 (_ BitVec 32))) (Intermediate!12869 (undefined!13681 Bool) (index!53873 (_ BitVec 32)) (x!135768 (_ BitVec 32))) (Undefined!12869) (MissingVacant!12869 (index!53874 (_ BitVec 32))) )
))
(declare-fun lt!657983 () SeekEntryResult!12869)

(declare-fun lt!657984 () SeekEntryResult!12869)

(assert (=> b!1518012 (= res!1036745 (= lt!657983 lt!657984))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518012 (= lt!657984 (Intermediate!12869 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101146 0))(
  ( (array!101147 (arr!48805 (Array (_ BitVec 32) (_ BitVec 64))) (size!49356 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101146)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101146 (_ BitVec 32)) SeekEntryResult!12869)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518012 (= lt!657983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48805 a!2804) j!70) mask!2512) (select (arr!48805 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518013 () Bool)

(declare-fun res!1036740 () Bool)

(assert (=> b!1518013 (=> (not res!1036740) (not e!847186))))

(declare-datatypes ((List!35275 0))(
  ( (Nil!35272) (Cons!35271 (h!36698 (_ BitVec 64)) (t!49961 List!35275)) )
))
(declare-fun arrayNoDuplicates!0 (array!101146 (_ BitVec 32) List!35275) Bool)

(assert (=> b!1518013 (= res!1036740 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35272))))

(declare-fun b!1518014 () Bool)

(declare-fun res!1036742 () Bool)

(assert (=> b!1518014 (=> (not res!1036742) (not e!847186))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518014 (= res!1036742 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49356 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49356 a!2804))))))

(declare-fun b!1518015 () Bool)

(declare-fun res!1036747 () Bool)

(assert (=> b!1518015 (=> (not res!1036747) (not e!847186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518015 (= res!1036747 (validKeyInArray!0 (select (arr!48805 a!2804) j!70)))))

(declare-fun b!1518017 () Bool)

(declare-fun res!1036738 () Bool)

(assert (=> b!1518017 (=> (not res!1036738) (not e!847186))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518017 (= res!1036738 (validKeyInArray!0 (select (arr!48805 a!2804) i!961)))))

(declare-fun b!1518018 () Bool)

(declare-fun res!1036744 () Bool)

(assert (=> b!1518018 (=> (not res!1036744) (not e!847186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101146 (_ BitVec 32)) Bool)

(assert (=> b!1518018 (= res!1036744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518019 () Bool)

(assert (=> b!1518019 (= e!847187 (not (or (not (= (select (arr!48805 a!2804) j!70) (select (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!847185 () Bool)

(assert (=> b!1518019 e!847185))

(declare-fun res!1036739 () Bool)

(assert (=> b!1518019 (=> (not res!1036739) (not e!847185))))

(assert (=> b!1518019 (= res!1036739 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50641 0))(
  ( (Unit!50642) )
))
(declare-fun lt!657985 () Unit!50641)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50641)

(assert (=> b!1518019 (= lt!657985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518020 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101146 (_ BitVec 32)) SeekEntryResult!12869)

(assert (=> b!1518020 (= e!847185 (= (seekEntry!0 (select (arr!48805 a!2804) j!70) a!2804 mask!2512) (Found!12869 j!70)))))

(declare-fun res!1036748 () Bool)

(assert (=> start!129476 (=> (not res!1036748) (not e!847186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129476 (= res!1036748 (validMask!0 mask!2512))))

(assert (=> start!129476 e!847186))

(assert (=> start!129476 true))

(declare-fun array_inv!38086 (array!101146) Bool)

(assert (=> start!129476 (array_inv!38086 a!2804)))

(declare-fun b!1518016 () Bool)

(declare-fun res!1036741 () Bool)

(assert (=> b!1518016 (=> (not res!1036741) (not e!847187))))

(assert (=> b!1518016 (= res!1036741 (= lt!657983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101147 (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49356 a!2804)) mask!2512)))))

(declare-fun b!1518021 () Bool)

(declare-fun res!1036746 () Bool)

(assert (=> b!1518021 (=> (not res!1036746) (not e!847186))))

(assert (=> b!1518021 (= res!1036746 (and (= (size!49356 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49356 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49356 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518022 () Bool)

(declare-fun res!1036743 () Bool)

(assert (=> b!1518022 (=> (not res!1036743) (not e!847187))))

(assert (=> b!1518022 (= res!1036743 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48805 a!2804) j!70) a!2804 mask!2512) lt!657984))))

(assert (= (and start!129476 res!1036748) b!1518021))

(assert (= (and b!1518021 res!1036746) b!1518017))

(assert (= (and b!1518017 res!1036738) b!1518015))

(assert (= (and b!1518015 res!1036747) b!1518018))

(assert (= (and b!1518018 res!1036744) b!1518013))

(assert (= (and b!1518013 res!1036740) b!1518014))

(assert (= (and b!1518014 res!1036742) b!1518012))

(assert (= (and b!1518012 res!1036745) b!1518022))

(assert (= (and b!1518022 res!1036743) b!1518016))

(assert (= (and b!1518016 res!1036741) b!1518019))

(assert (= (and b!1518019 res!1036739) b!1518020))

(declare-fun m!1401225 () Bool)

(assert (=> b!1518016 m!1401225))

(declare-fun m!1401227 () Bool)

(assert (=> b!1518016 m!1401227))

(assert (=> b!1518016 m!1401227))

(declare-fun m!1401229 () Bool)

(assert (=> b!1518016 m!1401229))

(assert (=> b!1518016 m!1401229))

(assert (=> b!1518016 m!1401227))

(declare-fun m!1401231 () Bool)

(assert (=> b!1518016 m!1401231))

(declare-fun m!1401233 () Bool)

(assert (=> b!1518018 m!1401233))

(declare-fun m!1401235 () Bool)

(assert (=> b!1518019 m!1401235))

(declare-fun m!1401237 () Bool)

(assert (=> b!1518019 m!1401237))

(assert (=> b!1518019 m!1401225))

(assert (=> b!1518019 m!1401227))

(declare-fun m!1401239 () Bool)

(assert (=> b!1518019 m!1401239))

(declare-fun m!1401241 () Bool)

(assert (=> b!1518013 m!1401241))

(declare-fun m!1401243 () Bool)

(assert (=> start!129476 m!1401243))

(declare-fun m!1401245 () Bool)

(assert (=> start!129476 m!1401245))

(assert (=> b!1518020 m!1401235))

(assert (=> b!1518020 m!1401235))

(declare-fun m!1401247 () Bool)

(assert (=> b!1518020 m!1401247))

(assert (=> b!1518015 m!1401235))

(assert (=> b!1518015 m!1401235))

(declare-fun m!1401249 () Bool)

(assert (=> b!1518015 m!1401249))

(assert (=> b!1518022 m!1401235))

(assert (=> b!1518022 m!1401235))

(declare-fun m!1401251 () Bool)

(assert (=> b!1518022 m!1401251))

(assert (=> b!1518012 m!1401235))

(assert (=> b!1518012 m!1401235))

(declare-fun m!1401253 () Bool)

(assert (=> b!1518012 m!1401253))

(assert (=> b!1518012 m!1401253))

(assert (=> b!1518012 m!1401235))

(declare-fun m!1401255 () Bool)

(assert (=> b!1518012 m!1401255))

(declare-fun m!1401257 () Bool)

(assert (=> b!1518017 m!1401257))

(assert (=> b!1518017 m!1401257))

(declare-fun m!1401259 () Bool)

(assert (=> b!1518017 m!1401259))

(check-sat (not b!1518013) (not b!1518017) (not b!1518016) (not b!1518020) (not b!1518012) (not b!1518022) (not b!1518019) (not b!1518015) (not start!129476) (not b!1518018))
(check-sat)
