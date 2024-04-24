; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129236 () Bool)

(assert start!129236)

(declare-fun b!1513233 () Bool)

(declare-fun res!1031965 () Bool)

(declare-fun e!844947 () Bool)

(assert (=> b!1513233 (=> (not res!1031965) (not e!844947))))

(declare-datatypes ((array!100906 0))(
  ( (array!100907 (arr!48685 (Array (_ BitVec 32) (_ BitVec 64))) (size!49236 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100906)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100906 (_ BitVec 32)) Bool)

(assert (=> b!1513233 (= res!1031965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513234 () Bool)

(declare-fun e!844944 () Bool)

(assert (=> b!1513234 (= e!844944 (not true))))

(declare-fun e!844945 () Bool)

(assert (=> b!1513234 e!844945))

(declare-fun res!1031960 () Bool)

(assert (=> b!1513234 (=> (not res!1031960) (not e!844945))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1513234 (= res!1031960 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50401 0))(
  ( (Unit!50402) )
))
(declare-fun lt!656095 () Unit!50401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50401)

(assert (=> b!1513234 (= lt!656095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513235 () Bool)

(assert (=> b!1513235 (= e!844947 e!844944)))

(declare-fun res!1031969 () Bool)

(assert (=> b!1513235 (=> (not res!1031969) (not e!844944))))

(declare-datatypes ((SeekEntryResult!12749 0))(
  ( (MissingZero!12749 (index!53391 (_ BitVec 32))) (Found!12749 (index!53392 (_ BitVec 32))) (Intermediate!12749 (undefined!13561 Bool) (index!53393 (_ BitVec 32)) (x!135328 (_ BitVec 32))) (Undefined!12749) (MissingVacant!12749 (index!53394 (_ BitVec 32))) )
))
(declare-fun lt!656094 () SeekEntryResult!12749)

(declare-fun lt!656093 () SeekEntryResult!12749)

(assert (=> b!1513235 (= res!1031969 (= lt!656094 lt!656093))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513235 (= lt!656093 (Intermediate!12749 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513235 (= lt!656094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48685 a!2804) j!70) mask!2512) (select (arr!48685 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513236 () Bool)

(declare-fun res!1031961 () Bool)

(assert (=> b!1513236 (=> (not res!1031961) (not e!844947))))

(declare-datatypes ((List!35155 0))(
  ( (Nil!35152) (Cons!35151 (h!36578 (_ BitVec 64)) (t!49841 List!35155)) )
))
(declare-fun arrayNoDuplicates!0 (array!100906 (_ BitVec 32) List!35155) Bool)

(assert (=> b!1513236 (= res!1031961 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35152))))

(declare-fun b!1513237 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12749)

(assert (=> b!1513237 (= e!844945 (= (seekEntry!0 (select (arr!48685 a!2804) j!70) a!2804 mask!2512) (Found!12749 j!70)))))

(declare-fun res!1031966 () Bool)

(assert (=> start!129236 (=> (not res!1031966) (not e!844947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129236 (= res!1031966 (validMask!0 mask!2512))))

(assert (=> start!129236 e!844947))

(assert (=> start!129236 true))

(declare-fun array_inv!37966 (array!100906) Bool)

(assert (=> start!129236 (array_inv!37966 a!2804)))

(declare-fun b!1513238 () Bool)

(declare-fun res!1031967 () Bool)

(assert (=> b!1513238 (=> (not res!1031967) (not e!844947))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513238 (= res!1031967 (and (= (size!49236 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49236 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49236 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513239 () Bool)

(declare-fun res!1031968 () Bool)

(assert (=> b!1513239 (=> (not res!1031968) (not e!844947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513239 (= res!1031968 (validKeyInArray!0 (select (arr!48685 a!2804) i!961)))))

(declare-fun b!1513240 () Bool)

(declare-fun res!1031959 () Bool)

(assert (=> b!1513240 (=> (not res!1031959) (not e!844947))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1513240 (= res!1031959 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49236 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49236 a!2804))))))

(declare-fun b!1513241 () Bool)

(declare-fun res!1031964 () Bool)

(assert (=> b!1513241 (=> (not res!1031964) (not e!844947))))

(assert (=> b!1513241 (= res!1031964 (validKeyInArray!0 (select (arr!48685 a!2804) j!70)))))

(declare-fun b!1513242 () Bool)

(declare-fun res!1031963 () Bool)

(assert (=> b!1513242 (=> (not res!1031963) (not e!844944))))

(assert (=> b!1513242 (= res!1031963 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48685 a!2804) j!70) a!2804 mask!2512) lt!656093))))

(declare-fun b!1513243 () Bool)

(declare-fun res!1031962 () Bool)

(assert (=> b!1513243 (=> (not res!1031962) (not e!844944))))

(assert (=> b!1513243 (= res!1031962 (= lt!656094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48685 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48685 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100907 (store (arr!48685 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49236 a!2804)) mask!2512)))))

(assert (= (and start!129236 res!1031966) b!1513238))

(assert (= (and b!1513238 res!1031967) b!1513239))

(assert (= (and b!1513239 res!1031968) b!1513241))

(assert (= (and b!1513241 res!1031964) b!1513233))

(assert (= (and b!1513233 res!1031965) b!1513236))

(assert (= (and b!1513236 res!1031961) b!1513240))

(assert (= (and b!1513240 res!1031959) b!1513235))

(assert (= (and b!1513235 res!1031969) b!1513242))

(assert (= (and b!1513242 res!1031963) b!1513243))

(assert (= (and b!1513243 res!1031962) b!1513234))

(assert (= (and b!1513234 res!1031960) b!1513237))

(declare-fun m!1395891 () Bool)

(assert (=> b!1513235 m!1395891))

(assert (=> b!1513235 m!1395891))

(declare-fun m!1395893 () Bool)

(assert (=> b!1513235 m!1395893))

(assert (=> b!1513235 m!1395893))

(assert (=> b!1513235 m!1395891))

(declare-fun m!1395895 () Bool)

(assert (=> b!1513235 m!1395895))

(assert (=> b!1513241 m!1395891))

(assert (=> b!1513241 m!1395891))

(declare-fun m!1395897 () Bool)

(assert (=> b!1513241 m!1395897))

(declare-fun m!1395899 () Bool)

(assert (=> start!129236 m!1395899))

(declare-fun m!1395901 () Bool)

(assert (=> start!129236 m!1395901))

(declare-fun m!1395903 () Bool)

(assert (=> b!1513236 m!1395903))

(declare-fun m!1395905 () Bool)

(assert (=> b!1513234 m!1395905))

(declare-fun m!1395907 () Bool)

(assert (=> b!1513234 m!1395907))

(declare-fun m!1395909 () Bool)

(assert (=> b!1513239 m!1395909))

(assert (=> b!1513239 m!1395909))

(declare-fun m!1395911 () Bool)

(assert (=> b!1513239 m!1395911))

(declare-fun m!1395913 () Bool)

(assert (=> b!1513243 m!1395913))

(declare-fun m!1395915 () Bool)

(assert (=> b!1513243 m!1395915))

(assert (=> b!1513243 m!1395915))

(declare-fun m!1395917 () Bool)

(assert (=> b!1513243 m!1395917))

(assert (=> b!1513243 m!1395917))

(assert (=> b!1513243 m!1395915))

(declare-fun m!1395919 () Bool)

(assert (=> b!1513243 m!1395919))

(assert (=> b!1513237 m!1395891))

(assert (=> b!1513237 m!1395891))

(declare-fun m!1395921 () Bool)

(assert (=> b!1513237 m!1395921))

(assert (=> b!1513242 m!1395891))

(assert (=> b!1513242 m!1395891))

(declare-fun m!1395923 () Bool)

(assert (=> b!1513242 m!1395923))

(declare-fun m!1395925 () Bool)

(assert (=> b!1513233 m!1395925))

(check-sat (not start!129236) (not b!1513235) (not b!1513237) (not b!1513236) (not b!1513242) (not b!1513233) (not b!1513239) (not b!1513243) (not b!1513241) (not b!1513234))
(check-sat)
