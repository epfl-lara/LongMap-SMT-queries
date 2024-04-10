; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129228 () Bool)

(assert start!129228)

(declare-fun b!1517201 () Bool)

(declare-fun res!1037113 () Bool)

(declare-fun e!846508 () Bool)

(assert (=> b!1517201 (=> (not res!1037113) (not e!846508))))

(declare-datatypes ((array!101084 0))(
  ( (array!101085 (arr!48779 (Array (_ BitVec 32) (_ BitVec 64))) (size!49329 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101084)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517201 (= res!1037113 (validKeyInArray!0 (select (arr!48779 a!2804) j!70)))))

(declare-fun b!1517202 () Bool)

(declare-fun e!846507 () Bool)

(assert (=> b!1517202 (= e!846507 true)))

(declare-fun lt!657697 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12950 0))(
  ( (MissingZero!12950 (index!54195 (_ BitVec 32))) (Found!12950 (index!54196 (_ BitVec 32))) (Intermediate!12950 (undefined!13762 Bool) (index!54197 (_ BitVec 32)) (x!135884 (_ BitVec 32))) (Undefined!12950) (MissingVacant!12950 (index!54198 (_ BitVec 32))) )
))
(declare-fun lt!657693 () SeekEntryResult!12950)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101084 (_ BitVec 32)) SeekEntryResult!12950)

(assert (=> b!1517202 (= lt!657693 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657697 (select (arr!48779 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517204 () Bool)

(declare-fun res!1037111 () Bool)

(declare-fun e!846505 () Bool)

(assert (=> b!1517204 (=> (not res!1037111) (not e!846505))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!657695 () SeekEntryResult!12950)

(assert (=> b!1517204 (= res!1037111 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48779 a!2804) j!70) a!2804 mask!2512) lt!657695))))

(declare-fun b!1517205 () Bool)

(declare-fun res!1037105 () Bool)

(assert (=> b!1517205 (=> (not res!1037105) (not e!846508))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517205 (= res!1037105 (validKeyInArray!0 (select (arr!48779 a!2804) i!961)))))

(declare-fun b!1517206 () Bool)

(declare-fun res!1037108 () Bool)

(assert (=> b!1517206 (=> (not res!1037108) (not e!846508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101084 (_ BitVec 32)) Bool)

(assert (=> b!1517206 (= res!1037108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517207 () Bool)

(declare-fun res!1037114 () Bool)

(assert (=> b!1517207 (=> (not res!1037114) (not e!846508))))

(declare-datatypes ((List!35262 0))(
  ( (Nil!35259) (Cons!35258 (h!36670 (_ BitVec 64)) (t!49956 List!35262)) )
))
(declare-fun arrayNoDuplicates!0 (array!101084 (_ BitVec 32) List!35262) Bool)

(assert (=> b!1517207 (= res!1037114 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35259))))

(declare-fun b!1517208 () Bool)

(declare-fun res!1037116 () Bool)

(assert (=> b!1517208 (=> (not res!1037116) (not e!846505))))

(declare-fun lt!657696 () SeekEntryResult!12950)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517208 (= res!1037116 (= lt!657696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48779 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48779 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101085 (store (arr!48779 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49329 a!2804)) mask!2512)))))

(declare-fun b!1517209 () Bool)

(assert (=> b!1517209 (= e!846508 e!846505)))

(declare-fun res!1037104 () Bool)

(assert (=> b!1517209 (=> (not res!1037104) (not e!846505))))

(assert (=> b!1517209 (= res!1037104 (= lt!657696 lt!657695))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517209 (= lt!657695 (Intermediate!12950 false resIndex!21 resX!21))))

(assert (=> b!1517209 (= lt!657696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48779 a!2804) j!70) mask!2512) (select (arr!48779 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517210 () Bool)

(declare-fun e!846503 () Bool)

(assert (=> b!1517210 (= e!846505 (not e!846503))))

(declare-fun res!1037115 () Bool)

(assert (=> b!1517210 (=> res!1037115 e!846503)))

(assert (=> b!1517210 (= res!1037115 (or (not (= (select (arr!48779 a!2804) j!70) (select (store (arr!48779 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846506 () Bool)

(assert (=> b!1517210 e!846506))

(declare-fun res!1037112 () Bool)

(assert (=> b!1517210 (=> (not res!1037112) (not e!846506))))

(assert (=> b!1517210 (= res!1037112 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50768 0))(
  ( (Unit!50769) )
))
(declare-fun lt!657694 () Unit!50768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50768)

(assert (=> b!1517210 (= lt!657694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517211 () Bool)

(declare-fun res!1037106 () Bool)

(assert (=> b!1517211 (=> (not res!1037106) (not e!846508))))

(assert (=> b!1517211 (= res!1037106 (and (= (size!49329 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49329 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49329 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517203 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101084 (_ BitVec 32)) SeekEntryResult!12950)

(assert (=> b!1517203 (= e!846506 (= (seekEntry!0 (select (arr!48779 a!2804) j!70) a!2804 mask!2512) (Found!12950 j!70)))))

(declare-fun res!1037107 () Bool)

(assert (=> start!129228 (=> (not res!1037107) (not e!846508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129228 (= res!1037107 (validMask!0 mask!2512))))

(assert (=> start!129228 e!846508))

(assert (=> start!129228 true))

(declare-fun array_inv!37807 (array!101084) Bool)

(assert (=> start!129228 (array_inv!37807 a!2804)))

(declare-fun b!1517212 () Bool)

(declare-fun res!1037110 () Bool)

(assert (=> b!1517212 (=> (not res!1037110) (not e!846508))))

(assert (=> b!1517212 (= res!1037110 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49329 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49329 a!2804))))))

(declare-fun b!1517213 () Bool)

(assert (=> b!1517213 (= e!846503 e!846507)))

(declare-fun res!1037109 () Bool)

(assert (=> b!1517213 (=> res!1037109 e!846507)))

(assert (=> b!1517213 (= res!1037109 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657697 #b00000000000000000000000000000000) (bvsge lt!657697 (size!49329 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517213 (= lt!657697 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!129228 res!1037107) b!1517211))

(assert (= (and b!1517211 res!1037106) b!1517205))

(assert (= (and b!1517205 res!1037105) b!1517201))

(assert (= (and b!1517201 res!1037113) b!1517206))

(assert (= (and b!1517206 res!1037108) b!1517207))

(assert (= (and b!1517207 res!1037114) b!1517212))

(assert (= (and b!1517212 res!1037110) b!1517209))

(assert (= (and b!1517209 res!1037104) b!1517204))

(assert (= (and b!1517204 res!1037111) b!1517208))

(assert (= (and b!1517208 res!1037116) b!1517210))

(assert (= (and b!1517210 res!1037112) b!1517203))

(assert (= (and b!1517210 (not res!1037115)) b!1517213))

(assert (= (and b!1517213 (not res!1037109)) b!1517202))

(declare-fun m!1400485 () Bool)

(assert (=> b!1517210 m!1400485))

(declare-fun m!1400487 () Bool)

(assert (=> b!1517210 m!1400487))

(declare-fun m!1400489 () Bool)

(assert (=> b!1517210 m!1400489))

(declare-fun m!1400491 () Bool)

(assert (=> b!1517210 m!1400491))

(declare-fun m!1400493 () Bool)

(assert (=> b!1517210 m!1400493))

(declare-fun m!1400495 () Bool)

(assert (=> b!1517207 m!1400495))

(declare-fun m!1400497 () Bool)

(assert (=> b!1517206 m!1400497))

(assert (=> b!1517208 m!1400489))

(assert (=> b!1517208 m!1400491))

(assert (=> b!1517208 m!1400491))

(declare-fun m!1400499 () Bool)

(assert (=> b!1517208 m!1400499))

(assert (=> b!1517208 m!1400499))

(assert (=> b!1517208 m!1400491))

(declare-fun m!1400501 () Bool)

(assert (=> b!1517208 m!1400501))

(assert (=> b!1517202 m!1400485))

(assert (=> b!1517202 m!1400485))

(declare-fun m!1400503 () Bool)

(assert (=> b!1517202 m!1400503))

(assert (=> b!1517203 m!1400485))

(assert (=> b!1517203 m!1400485))

(declare-fun m!1400505 () Bool)

(assert (=> b!1517203 m!1400505))

(declare-fun m!1400507 () Bool)

(assert (=> start!129228 m!1400507))

(declare-fun m!1400509 () Bool)

(assert (=> start!129228 m!1400509))

(declare-fun m!1400511 () Bool)

(assert (=> b!1517205 m!1400511))

(assert (=> b!1517205 m!1400511))

(declare-fun m!1400513 () Bool)

(assert (=> b!1517205 m!1400513))

(assert (=> b!1517201 m!1400485))

(assert (=> b!1517201 m!1400485))

(declare-fun m!1400515 () Bool)

(assert (=> b!1517201 m!1400515))

(declare-fun m!1400517 () Bool)

(assert (=> b!1517213 m!1400517))

(assert (=> b!1517204 m!1400485))

(assert (=> b!1517204 m!1400485))

(declare-fun m!1400519 () Bool)

(assert (=> b!1517204 m!1400519))

(assert (=> b!1517209 m!1400485))

(assert (=> b!1517209 m!1400485))

(declare-fun m!1400521 () Bool)

(assert (=> b!1517209 m!1400521))

(assert (=> b!1517209 m!1400521))

(assert (=> b!1517209 m!1400485))

(declare-fun m!1400523 () Bool)

(assert (=> b!1517209 m!1400523))

(push 1)

