; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129290 () Bool)

(assert start!129290)

(declare-fun e!845345 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100960 0))(
  ( (array!100961 (arr!48712 (Array (_ BitVec 32) (_ BitVec 64))) (size!49263 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100960)

(declare-fun b!1514263 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12776 0))(
  ( (MissingZero!12776 (index!53499 (_ BitVec 32))) (Found!12776 (index!53500 (_ BitVec 32))) (Intermediate!12776 (undefined!13588 Bool) (index!53501 (_ BitVec 32)) (x!135427 (_ BitVec 32))) (Undefined!12776) (MissingVacant!12776 (index!53502 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12776)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12776)

(assert (=> b!1514263 (= e!845345 (= (seekEntryOrOpen!0 (select (arr!48712 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48712 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514264 () Bool)

(declare-fun res!1032994 () Bool)

(declare-fun e!845344 () Bool)

(assert (=> b!1514264 (=> (not res!1032994) (not e!845344))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514264 (= res!1032994 (validKeyInArray!0 (select (arr!48712 a!2804) i!961)))))

(declare-fun b!1514265 () Bool)

(declare-fun res!1032989 () Bool)

(assert (=> b!1514265 (=> (not res!1032989) (not e!845344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100960 (_ BitVec 32)) Bool)

(assert (=> b!1514265 (= res!1032989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514266 () Bool)

(declare-fun res!1032995 () Bool)

(declare-fun e!845346 () Bool)

(assert (=> b!1514266 (=> (not res!1032995) (not e!845346))))

(declare-fun lt!656336 () SeekEntryResult!12776)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12776)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514266 (= res!1032995 (= lt!656336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100961 (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49263 a!2804)) mask!2512)))))

(declare-fun b!1514267 () Bool)

(declare-fun e!845342 () Bool)

(assert (=> b!1514267 (= e!845342 e!845345)))

(declare-fun res!1032996 () Bool)

(assert (=> b!1514267 (=> res!1032996 e!845345)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514267 (= res!1032996 (or (not (= (select (arr!48712 a!2804) j!70) (select (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48712 a!2804) index!487) (select (arr!48712 a!2804) j!70)) (not (= (select (arr!48712 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514268 () Bool)

(declare-fun res!1033001 () Bool)

(assert (=> b!1514268 (=> (not res!1033001) (not e!845344))))

(assert (=> b!1514268 (= res!1033001 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49263 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49263 a!2804))))))

(declare-fun res!1032991 () Bool)

(assert (=> start!129290 (=> (not res!1032991) (not e!845344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129290 (= res!1032991 (validMask!0 mask!2512))))

(assert (=> start!129290 e!845344))

(assert (=> start!129290 true))

(declare-fun array_inv!37993 (array!100960) Bool)

(assert (=> start!129290 (array_inv!37993 a!2804)))

(declare-fun b!1514269 () Bool)

(assert (=> b!1514269 (= e!845344 e!845346)))

(declare-fun res!1032990 () Bool)

(assert (=> b!1514269 (=> (not res!1032990) (not e!845346))))

(declare-fun lt!656337 () SeekEntryResult!12776)

(assert (=> b!1514269 (= res!1032990 (= lt!656336 lt!656337))))

(assert (=> b!1514269 (= lt!656337 (Intermediate!12776 false resIndex!21 resX!21))))

(assert (=> b!1514269 (= lt!656336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48712 a!2804) j!70) mask!2512) (select (arr!48712 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514270 () Bool)

(declare-fun res!1032993 () Bool)

(assert (=> b!1514270 (=> (not res!1032993) (not e!845344))))

(assert (=> b!1514270 (= res!1032993 (validKeyInArray!0 (select (arr!48712 a!2804) j!70)))))

(declare-fun b!1514271 () Bool)

(declare-fun res!1032999 () Bool)

(assert (=> b!1514271 (=> (not res!1032999) (not e!845344))))

(declare-datatypes ((List!35182 0))(
  ( (Nil!35179) (Cons!35178 (h!36605 (_ BitVec 64)) (t!49868 List!35182)) )
))
(declare-fun arrayNoDuplicates!0 (array!100960 (_ BitVec 32) List!35182) Bool)

(assert (=> b!1514271 (= res!1032999 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35179))))

(declare-fun b!1514272 () Bool)

(declare-fun res!1032998 () Bool)

(assert (=> b!1514272 (=> (not res!1032998) (not e!845342))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12776)

(assert (=> b!1514272 (= res!1032998 (= (seekEntry!0 (select (arr!48712 a!2804) j!70) a!2804 mask!2512) (Found!12776 j!70)))))

(declare-fun b!1514273 () Bool)

(assert (=> b!1514273 (= e!845346 (not (or (not (= (select (arr!48712 a!2804) j!70) (select (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48712 a!2804) index!487) (select (arr!48712 a!2804) j!70)) (not (= (select (arr!48712 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(assert (=> b!1514273 e!845342))

(declare-fun res!1032997 () Bool)

(assert (=> b!1514273 (=> (not res!1032997) (not e!845342))))

(assert (=> b!1514273 (= res!1032997 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50455 0))(
  ( (Unit!50456) )
))
(declare-fun lt!656338 () Unit!50455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50455)

(assert (=> b!1514273 (= lt!656338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514274 () Bool)

(declare-fun res!1032992 () Bool)

(assert (=> b!1514274 (=> (not res!1032992) (not e!845346))))

(assert (=> b!1514274 (= res!1032992 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48712 a!2804) j!70) a!2804 mask!2512) lt!656337))))

(declare-fun b!1514275 () Bool)

(declare-fun res!1033000 () Bool)

(assert (=> b!1514275 (=> (not res!1033000) (not e!845344))))

(assert (=> b!1514275 (= res!1033000 (and (= (size!49263 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49263 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49263 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129290 res!1032991) b!1514275))

(assert (= (and b!1514275 res!1033000) b!1514264))

(assert (= (and b!1514264 res!1032994) b!1514270))

(assert (= (and b!1514270 res!1032993) b!1514265))

(assert (= (and b!1514265 res!1032989) b!1514271))

(assert (= (and b!1514271 res!1032999) b!1514268))

(assert (= (and b!1514268 res!1033001) b!1514269))

(assert (= (and b!1514269 res!1032990) b!1514274))

(assert (= (and b!1514274 res!1032992) b!1514266))

(assert (= (and b!1514266 res!1032995) b!1514273))

(assert (= (and b!1514273 res!1032997) b!1514272))

(assert (= (and b!1514272 res!1032998) b!1514267))

(assert (= (and b!1514267 (not res!1032996)) b!1514263))

(declare-fun m!1396995 () Bool)

(assert (=> b!1514269 m!1396995))

(assert (=> b!1514269 m!1396995))

(declare-fun m!1396997 () Bool)

(assert (=> b!1514269 m!1396997))

(assert (=> b!1514269 m!1396997))

(assert (=> b!1514269 m!1396995))

(declare-fun m!1396999 () Bool)

(assert (=> b!1514269 m!1396999))

(assert (=> b!1514267 m!1396995))

(declare-fun m!1397001 () Bool)

(assert (=> b!1514267 m!1397001))

(declare-fun m!1397003 () Bool)

(assert (=> b!1514267 m!1397003))

(declare-fun m!1397005 () Bool)

(assert (=> b!1514267 m!1397005))

(declare-fun m!1397007 () Bool)

(assert (=> b!1514271 m!1397007))

(declare-fun m!1397009 () Bool)

(assert (=> b!1514265 m!1397009))

(declare-fun m!1397011 () Bool)

(assert (=> start!129290 m!1397011))

(declare-fun m!1397013 () Bool)

(assert (=> start!129290 m!1397013))

(declare-fun m!1397015 () Bool)

(assert (=> b!1514264 m!1397015))

(assert (=> b!1514264 m!1397015))

(declare-fun m!1397017 () Bool)

(assert (=> b!1514264 m!1397017))

(assert (=> b!1514273 m!1396995))

(declare-fun m!1397019 () Bool)

(assert (=> b!1514273 m!1397019))

(assert (=> b!1514273 m!1397001))

(assert (=> b!1514273 m!1397005))

(assert (=> b!1514273 m!1397003))

(declare-fun m!1397021 () Bool)

(assert (=> b!1514273 m!1397021))

(assert (=> b!1514270 m!1396995))

(assert (=> b!1514270 m!1396995))

(declare-fun m!1397023 () Bool)

(assert (=> b!1514270 m!1397023))

(assert (=> b!1514274 m!1396995))

(assert (=> b!1514274 m!1396995))

(declare-fun m!1397025 () Bool)

(assert (=> b!1514274 m!1397025))

(assert (=> b!1514263 m!1396995))

(assert (=> b!1514263 m!1396995))

(declare-fun m!1397027 () Bool)

(assert (=> b!1514263 m!1397027))

(assert (=> b!1514263 m!1396995))

(declare-fun m!1397029 () Bool)

(assert (=> b!1514263 m!1397029))

(assert (=> b!1514266 m!1397001))

(assert (=> b!1514266 m!1397003))

(assert (=> b!1514266 m!1397003))

(declare-fun m!1397031 () Bool)

(assert (=> b!1514266 m!1397031))

(assert (=> b!1514266 m!1397031))

(assert (=> b!1514266 m!1397003))

(declare-fun m!1397033 () Bool)

(assert (=> b!1514266 m!1397033))

(assert (=> b!1514272 m!1396995))

(assert (=> b!1514272 m!1396995))

(declare-fun m!1397035 () Bool)

(assert (=> b!1514272 m!1397035))

(check-sat (not b!1514263) (not b!1514272) (not b!1514270) (not b!1514273) (not start!129290) (not b!1514271) (not b!1514265) (not b!1514274) (not b!1514269) (not b!1514264) (not b!1514266))
(check-sat)
