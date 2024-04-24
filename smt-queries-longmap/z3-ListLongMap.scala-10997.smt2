; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129116 () Bool)

(assert start!129116)

(declare-fun b!1511260 () Bool)

(declare-fun e!844231 () Bool)

(assert (=> b!1511260 (= e!844231 (not true))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100786 0))(
  ( (array!100787 (arr!48625 (Array (_ BitVec 32) (_ BitVec 64))) (size!49176 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100786)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100786 (_ BitVec 32)) Bool)

(assert (=> b!1511260 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50281 0))(
  ( (Unit!50282) )
))
(declare-fun lt!655555 () Unit!50281)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50281)

(assert (=> b!1511260 (= lt!655555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511261 () Bool)

(declare-fun res!1029991 () Bool)

(declare-fun e!844233 () Bool)

(assert (=> b!1511261 (=> (not res!1029991) (not e!844233))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511261 (= res!1029991 (and (= (size!49176 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49176 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49176 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511262 () Bool)

(declare-fun res!1029990 () Bool)

(assert (=> b!1511262 (=> (not res!1029990) (not e!844233))))

(declare-datatypes ((List!35095 0))(
  ( (Nil!35092) (Cons!35091 (h!36518 (_ BitVec 64)) (t!49781 List!35095)) )
))
(declare-fun arrayNoDuplicates!0 (array!100786 (_ BitVec 32) List!35095) Bool)

(assert (=> b!1511262 (= res!1029990 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35092))))

(declare-fun b!1511263 () Bool)

(assert (=> b!1511263 (= e!844233 e!844231)))

(declare-fun res!1029995 () Bool)

(assert (=> b!1511263 (=> (not res!1029995) (not e!844231))))

(declare-datatypes ((SeekEntryResult!12689 0))(
  ( (MissingZero!12689 (index!53151 (_ BitVec 32))) (Found!12689 (index!53152 (_ BitVec 32))) (Intermediate!12689 (undefined!13501 Bool) (index!53153 (_ BitVec 32)) (x!135108 (_ BitVec 32))) (Undefined!12689) (MissingVacant!12689 (index!53154 (_ BitVec 32))) )
))
(declare-fun lt!655554 () SeekEntryResult!12689)

(declare-fun lt!655553 () SeekEntryResult!12689)

(assert (=> b!1511263 (= res!1029995 (= lt!655554 lt!655553))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511263 (= lt!655553 (Intermediate!12689 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100786 (_ BitVec 32)) SeekEntryResult!12689)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511263 (= lt!655554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48625 a!2804) j!70) mask!2512) (select (arr!48625 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1029987 () Bool)

(assert (=> start!129116 (=> (not res!1029987) (not e!844233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129116 (= res!1029987 (validMask!0 mask!2512))))

(assert (=> start!129116 e!844233))

(assert (=> start!129116 true))

(declare-fun array_inv!37906 (array!100786) Bool)

(assert (=> start!129116 (array_inv!37906 a!2804)))

(declare-fun b!1511264 () Bool)

(declare-fun res!1029989 () Bool)

(assert (=> b!1511264 (=> (not res!1029989) (not e!844233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511264 (= res!1029989 (validKeyInArray!0 (select (arr!48625 a!2804) i!961)))))

(declare-fun b!1511265 () Bool)

(declare-fun res!1029993 () Bool)

(assert (=> b!1511265 (=> (not res!1029993) (not e!844231))))

(assert (=> b!1511265 (= res!1029993 (= lt!655554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100787 (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49176 a!2804)) mask!2512)))))

(declare-fun b!1511266 () Bool)

(declare-fun res!1029988 () Bool)

(assert (=> b!1511266 (=> (not res!1029988) (not e!844231))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511266 (= res!1029988 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48625 a!2804) j!70) a!2804 mask!2512) lt!655553))))

(declare-fun b!1511267 () Bool)

(declare-fun res!1029986 () Bool)

(assert (=> b!1511267 (=> (not res!1029986) (not e!844233))))

(assert (=> b!1511267 (= res!1029986 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49176 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49176 a!2804))))))

(declare-fun b!1511268 () Bool)

(declare-fun res!1029994 () Bool)

(assert (=> b!1511268 (=> (not res!1029994) (not e!844233))))

(assert (=> b!1511268 (= res!1029994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511269 () Bool)

(declare-fun res!1029992 () Bool)

(assert (=> b!1511269 (=> (not res!1029992) (not e!844233))))

(assert (=> b!1511269 (= res!1029992 (validKeyInArray!0 (select (arr!48625 a!2804) j!70)))))

(assert (= (and start!129116 res!1029987) b!1511261))

(assert (= (and b!1511261 res!1029991) b!1511264))

(assert (= (and b!1511264 res!1029989) b!1511269))

(assert (= (and b!1511269 res!1029992) b!1511268))

(assert (= (and b!1511268 res!1029994) b!1511262))

(assert (= (and b!1511262 res!1029990) b!1511267))

(assert (= (and b!1511267 res!1029986) b!1511263))

(assert (= (and b!1511263 res!1029995) b!1511266))

(assert (= (and b!1511266 res!1029988) b!1511265))

(assert (= (and b!1511265 res!1029993) b!1511260))

(declare-fun m!1393701 () Bool)

(assert (=> b!1511265 m!1393701))

(declare-fun m!1393703 () Bool)

(assert (=> b!1511265 m!1393703))

(assert (=> b!1511265 m!1393703))

(declare-fun m!1393705 () Bool)

(assert (=> b!1511265 m!1393705))

(assert (=> b!1511265 m!1393705))

(assert (=> b!1511265 m!1393703))

(declare-fun m!1393707 () Bool)

(assert (=> b!1511265 m!1393707))

(declare-fun m!1393709 () Bool)

(assert (=> b!1511262 m!1393709))

(declare-fun m!1393711 () Bool)

(assert (=> b!1511264 m!1393711))

(assert (=> b!1511264 m!1393711))

(declare-fun m!1393713 () Bool)

(assert (=> b!1511264 m!1393713))

(declare-fun m!1393715 () Bool)

(assert (=> b!1511260 m!1393715))

(declare-fun m!1393717 () Bool)

(assert (=> b!1511260 m!1393717))

(declare-fun m!1393719 () Bool)

(assert (=> b!1511263 m!1393719))

(assert (=> b!1511263 m!1393719))

(declare-fun m!1393721 () Bool)

(assert (=> b!1511263 m!1393721))

(assert (=> b!1511263 m!1393721))

(assert (=> b!1511263 m!1393719))

(declare-fun m!1393723 () Bool)

(assert (=> b!1511263 m!1393723))

(declare-fun m!1393725 () Bool)

(assert (=> start!129116 m!1393725))

(declare-fun m!1393727 () Bool)

(assert (=> start!129116 m!1393727))

(assert (=> b!1511269 m!1393719))

(assert (=> b!1511269 m!1393719))

(declare-fun m!1393729 () Bool)

(assert (=> b!1511269 m!1393729))

(declare-fun m!1393731 () Bool)

(assert (=> b!1511268 m!1393731))

(assert (=> b!1511266 m!1393719))

(assert (=> b!1511266 m!1393719))

(declare-fun m!1393733 () Bool)

(assert (=> b!1511266 m!1393733))

(check-sat (not b!1511269) (not start!129116) (not b!1511262) (not b!1511265) (not b!1511260) (not b!1511264) (not b!1511263) (not b!1511268) (not b!1511266))
(check-sat)
