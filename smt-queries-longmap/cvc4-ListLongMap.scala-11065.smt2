; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129226 () Bool)

(assert start!129226)

(declare-fun b!1517162 () Bool)

(declare-fun res!1037071 () Bool)

(declare-fun e!846486 () Bool)

(assert (=> b!1517162 (=> (not res!1037071) (not e!846486))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101082 0))(
  ( (array!101083 (arr!48778 (Array (_ BitVec 32) (_ BitVec 64))) (size!49328 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101082)

(declare-datatypes ((SeekEntryResult!12949 0))(
  ( (MissingZero!12949 (index!54191 (_ BitVec 32))) (Found!12949 (index!54192 (_ BitVec 32))) (Intermediate!12949 (undefined!13761 Bool) (index!54193 (_ BitVec 32)) (x!135875 (_ BitVec 32))) (Undefined!12949) (MissingVacant!12949 (index!54194 (_ BitVec 32))) )
))
(declare-fun lt!657682 () SeekEntryResult!12949)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101082 (_ BitVec 32)) SeekEntryResult!12949)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517162 (= res!1037071 (= lt!657682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101083 (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49328 a!2804)) mask!2512)))))

(declare-fun b!1517163 () Bool)

(declare-fun res!1037072 () Bool)

(assert (=> b!1517163 (=> (not res!1037072) (not e!846486))))

(declare-fun lt!657681 () SeekEntryResult!12949)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517163 (= res!1037072 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48778 a!2804) j!70) a!2804 mask!2512) lt!657681))))

(declare-fun e!846488 () Bool)

(declare-fun b!1517164 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101082 (_ BitVec 32)) SeekEntryResult!12949)

(assert (=> b!1517164 (= e!846488 (= (seekEntry!0 (select (arr!48778 a!2804) j!70) a!2804 mask!2512) (Found!12949 j!70)))))

(declare-fun res!1037070 () Bool)

(declare-fun e!846487 () Bool)

(assert (=> start!129226 (=> (not res!1037070) (not e!846487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129226 (= res!1037070 (validMask!0 mask!2512))))

(assert (=> start!129226 e!846487))

(assert (=> start!129226 true))

(declare-fun array_inv!37806 (array!101082) Bool)

(assert (=> start!129226 (array_inv!37806 a!2804)))

(declare-fun b!1517165 () Bool)

(declare-fun res!1037074 () Bool)

(assert (=> b!1517165 (=> (not res!1037074) (not e!846487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101082 (_ BitVec 32)) Bool)

(assert (=> b!1517165 (= res!1037074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517166 () Bool)

(declare-fun res!1037077 () Bool)

(assert (=> b!1517166 (=> (not res!1037077) (not e!846487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517166 (= res!1037077 (validKeyInArray!0 (select (arr!48778 a!2804) i!961)))))

(declare-fun b!1517167 () Bool)

(declare-fun res!1037066 () Bool)

(assert (=> b!1517167 (=> (not res!1037066) (not e!846487))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517167 (= res!1037066 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49328 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49328 a!2804))))))

(declare-fun b!1517168 () Bool)

(declare-fun res!1037075 () Bool)

(assert (=> b!1517168 (=> (not res!1037075) (not e!846487))))

(assert (=> b!1517168 (= res!1037075 (and (= (size!49328 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49328 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49328 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517169 () Bool)

(assert (=> b!1517169 (= e!846487 e!846486)))

(declare-fun res!1037065 () Bool)

(assert (=> b!1517169 (=> (not res!1037065) (not e!846486))))

(assert (=> b!1517169 (= res!1037065 (= lt!657682 lt!657681))))

(assert (=> b!1517169 (= lt!657681 (Intermediate!12949 false resIndex!21 resX!21))))

(assert (=> b!1517169 (= lt!657682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48778 a!2804) j!70) mask!2512) (select (arr!48778 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517170 () Bool)

(declare-fun res!1037076 () Bool)

(assert (=> b!1517170 (=> (not res!1037076) (not e!846487))))

(declare-datatypes ((List!35261 0))(
  ( (Nil!35258) (Cons!35257 (h!36669 (_ BitVec 64)) (t!49955 List!35261)) )
))
(declare-fun arrayNoDuplicates!0 (array!101082 (_ BitVec 32) List!35261) Bool)

(assert (=> b!1517170 (= res!1037076 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35258))))

(declare-fun b!1517171 () Bool)

(declare-fun e!846489 () Bool)

(assert (=> b!1517171 (= e!846489 true)))

(declare-fun lt!657680 () (_ BitVec 32))

(declare-fun lt!657679 () SeekEntryResult!12949)

(assert (=> b!1517171 (= lt!657679 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657680 (select (arr!48778 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517172 () Bool)

(declare-fun res!1037069 () Bool)

(assert (=> b!1517172 (=> (not res!1037069) (not e!846487))))

(assert (=> b!1517172 (= res!1037069 (validKeyInArray!0 (select (arr!48778 a!2804) j!70)))))

(declare-fun b!1517173 () Bool)

(declare-fun e!846490 () Bool)

(assert (=> b!1517173 (= e!846490 e!846489)))

(declare-fun res!1037073 () Bool)

(assert (=> b!1517173 (=> res!1037073 e!846489)))

(assert (=> b!1517173 (= res!1037073 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657680 #b00000000000000000000000000000000) (bvsge lt!657680 (size!49328 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517173 (= lt!657680 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517174 () Bool)

(assert (=> b!1517174 (= e!846486 (not e!846490))))

(declare-fun res!1037067 () Bool)

(assert (=> b!1517174 (=> res!1037067 e!846490)))

(assert (=> b!1517174 (= res!1037067 (or (not (= (select (arr!48778 a!2804) j!70) (select (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517174 e!846488))

(declare-fun res!1037068 () Bool)

(assert (=> b!1517174 (=> (not res!1037068) (not e!846488))))

(assert (=> b!1517174 (= res!1037068 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50766 0))(
  ( (Unit!50767) )
))
(declare-fun lt!657678 () Unit!50766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50766)

(assert (=> b!1517174 (= lt!657678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129226 res!1037070) b!1517168))

(assert (= (and b!1517168 res!1037075) b!1517166))

(assert (= (and b!1517166 res!1037077) b!1517172))

(assert (= (and b!1517172 res!1037069) b!1517165))

(assert (= (and b!1517165 res!1037074) b!1517170))

(assert (= (and b!1517170 res!1037076) b!1517167))

(assert (= (and b!1517167 res!1037066) b!1517169))

(assert (= (and b!1517169 res!1037065) b!1517163))

(assert (= (and b!1517163 res!1037072) b!1517162))

(assert (= (and b!1517162 res!1037071) b!1517174))

(assert (= (and b!1517174 res!1037068) b!1517164))

(assert (= (and b!1517174 (not res!1037067)) b!1517173))

(assert (= (and b!1517173 (not res!1037073)) b!1517171))

(declare-fun m!1400445 () Bool)

(assert (=> b!1517162 m!1400445))

(declare-fun m!1400447 () Bool)

(assert (=> b!1517162 m!1400447))

(assert (=> b!1517162 m!1400447))

(declare-fun m!1400449 () Bool)

(assert (=> b!1517162 m!1400449))

(assert (=> b!1517162 m!1400449))

(assert (=> b!1517162 m!1400447))

(declare-fun m!1400451 () Bool)

(assert (=> b!1517162 m!1400451))

(declare-fun m!1400453 () Bool)

(assert (=> b!1517164 m!1400453))

(assert (=> b!1517164 m!1400453))

(declare-fun m!1400455 () Bool)

(assert (=> b!1517164 m!1400455))

(assert (=> b!1517169 m!1400453))

(assert (=> b!1517169 m!1400453))

(declare-fun m!1400457 () Bool)

(assert (=> b!1517169 m!1400457))

(assert (=> b!1517169 m!1400457))

(assert (=> b!1517169 m!1400453))

(declare-fun m!1400459 () Bool)

(assert (=> b!1517169 m!1400459))

(declare-fun m!1400461 () Bool)

(assert (=> b!1517173 m!1400461))

(assert (=> b!1517171 m!1400453))

(assert (=> b!1517171 m!1400453))

(declare-fun m!1400463 () Bool)

(assert (=> b!1517171 m!1400463))

(assert (=> b!1517163 m!1400453))

(assert (=> b!1517163 m!1400453))

(declare-fun m!1400465 () Bool)

(assert (=> b!1517163 m!1400465))

(declare-fun m!1400467 () Bool)

(assert (=> b!1517170 m!1400467))

(assert (=> b!1517172 m!1400453))

(assert (=> b!1517172 m!1400453))

(declare-fun m!1400469 () Bool)

(assert (=> b!1517172 m!1400469))

(declare-fun m!1400471 () Bool)

(assert (=> b!1517166 m!1400471))

(assert (=> b!1517166 m!1400471))

(declare-fun m!1400473 () Bool)

(assert (=> b!1517166 m!1400473))

(declare-fun m!1400475 () Bool)

(assert (=> b!1517165 m!1400475))

(assert (=> b!1517174 m!1400453))

(declare-fun m!1400477 () Bool)

(assert (=> b!1517174 m!1400477))

(assert (=> b!1517174 m!1400445))

(assert (=> b!1517174 m!1400447))

(declare-fun m!1400479 () Bool)

(assert (=> b!1517174 m!1400479))

(declare-fun m!1400481 () Bool)

(assert (=> start!129226 m!1400481))

(declare-fun m!1400483 () Bool)

(assert (=> start!129226 m!1400483))

(push 1)

(assert (not b!1517173))

(assert (not start!129226))

(assert (not b!1517169))

