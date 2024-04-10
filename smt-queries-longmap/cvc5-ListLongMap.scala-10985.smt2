; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128700 () Bool)

(assert start!128700)

(declare-fun res!1028263 () Bool)

(declare-fun e!842639 () Bool)

(assert (=> start!128700 (=> (not res!1028263) (not e!842639))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128700 (= res!1028263 (validMask!0 mask!2512))))

(assert (=> start!128700 e!842639))

(assert (=> start!128700 true))

(declare-datatypes ((array!100595 0))(
  ( (array!100596 (arr!48536 (Array (_ BitVec 32) (_ BitVec 64))) (size!49086 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100595)

(declare-fun array_inv!37564 (array!100595) Bool)

(assert (=> start!128700 (array_inv!37564 a!2804)))

(declare-fun b!1508247 () Bool)

(declare-fun e!842641 () Bool)

(assert (=> b!1508247 (= e!842639 e!842641)))

(declare-fun res!1028259 () Bool)

(assert (=> b!1508247 (=> (not res!1028259) (not e!842641))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12707 0))(
  ( (MissingZero!12707 (index!53223 (_ BitVec 32))) (Found!12707 (index!53224 (_ BitVec 32))) (Intermediate!12707 (undefined!13519 Bool) (index!53225 (_ BitVec 32)) (x!134987 (_ BitVec 32))) (Undefined!12707) (MissingVacant!12707 (index!53226 (_ BitVec 32))) )
))
(declare-fun lt!654588 () SeekEntryResult!12707)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100595 (_ BitVec 32)) SeekEntryResult!12707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508247 (= res!1028259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48536 a!2804) j!70) mask!2512) (select (arr!48536 a!2804) j!70) a!2804 mask!2512) lt!654588))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508247 (= lt!654588 (Intermediate!12707 false resIndex!21 resX!21))))

(declare-fun b!1508248 () Bool)

(declare-fun res!1028257 () Bool)

(assert (=> b!1508248 (=> (not res!1028257) (not e!842639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100595 (_ BitVec 32)) Bool)

(assert (=> b!1508248 (= res!1028257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508249 () Bool)

(declare-fun res!1028258 () Bool)

(assert (=> b!1508249 (=> (not res!1028258) (not e!842639))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508249 (= res!1028258 (validKeyInArray!0 (select (arr!48536 a!2804) i!961)))))

(declare-fun b!1508250 () Bool)

(declare-fun res!1028256 () Bool)

(assert (=> b!1508250 (=> (not res!1028256) (not e!842639))))

(assert (=> b!1508250 (= res!1028256 (validKeyInArray!0 (select (arr!48536 a!2804) j!70)))))

(declare-fun b!1508251 () Bool)

(assert (=> b!1508251 (= e!842641 false)))

(declare-fun lt!654589 () (_ BitVec 32))

(assert (=> b!1508251 (= lt!654589 (toIndex!0 (select (store (arr!48536 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508252 () Bool)

(declare-fun res!1028262 () Bool)

(assert (=> b!1508252 (=> (not res!1028262) (not e!842639))))

(declare-datatypes ((List!35019 0))(
  ( (Nil!35016) (Cons!35015 (h!36424 (_ BitVec 64)) (t!49713 List!35019)) )
))
(declare-fun arrayNoDuplicates!0 (array!100595 (_ BitVec 32) List!35019) Bool)

(assert (=> b!1508252 (= res!1028262 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35016))))

(declare-fun b!1508253 () Bool)

(declare-fun res!1028261 () Bool)

(assert (=> b!1508253 (=> (not res!1028261) (not e!842639))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508253 (= res!1028261 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49086 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49086 a!2804))))))

(declare-fun b!1508254 () Bool)

(declare-fun res!1028260 () Bool)

(assert (=> b!1508254 (=> (not res!1028260) (not e!842639))))

(assert (=> b!1508254 (= res!1028260 (and (= (size!49086 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49086 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49086 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508255 () Bool)

(declare-fun res!1028255 () Bool)

(assert (=> b!1508255 (=> (not res!1028255) (not e!842641))))

(assert (=> b!1508255 (= res!1028255 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48536 a!2804) j!70) a!2804 mask!2512) lt!654588))))

(assert (= (and start!128700 res!1028263) b!1508254))

(assert (= (and b!1508254 res!1028260) b!1508249))

(assert (= (and b!1508249 res!1028258) b!1508250))

(assert (= (and b!1508250 res!1028256) b!1508248))

(assert (= (and b!1508248 res!1028257) b!1508252))

(assert (= (and b!1508252 res!1028262) b!1508253))

(assert (= (and b!1508253 res!1028261) b!1508247))

(assert (= (and b!1508247 res!1028259) b!1508255))

(assert (= (and b!1508255 res!1028255) b!1508251))

(declare-fun m!1390747 () Bool)

(assert (=> b!1508251 m!1390747))

(declare-fun m!1390749 () Bool)

(assert (=> b!1508251 m!1390749))

(assert (=> b!1508251 m!1390749))

(declare-fun m!1390751 () Bool)

(assert (=> b!1508251 m!1390751))

(declare-fun m!1390753 () Bool)

(assert (=> b!1508255 m!1390753))

(assert (=> b!1508255 m!1390753))

(declare-fun m!1390755 () Bool)

(assert (=> b!1508255 m!1390755))

(declare-fun m!1390757 () Bool)

(assert (=> b!1508252 m!1390757))

(declare-fun m!1390759 () Bool)

(assert (=> b!1508249 m!1390759))

(assert (=> b!1508249 m!1390759))

(declare-fun m!1390761 () Bool)

(assert (=> b!1508249 m!1390761))

(assert (=> b!1508247 m!1390753))

(assert (=> b!1508247 m!1390753))

(declare-fun m!1390763 () Bool)

(assert (=> b!1508247 m!1390763))

(assert (=> b!1508247 m!1390763))

(assert (=> b!1508247 m!1390753))

(declare-fun m!1390765 () Bool)

(assert (=> b!1508247 m!1390765))

(assert (=> b!1508250 m!1390753))

(assert (=> b!1508250 m!1390753))

(declare-fun m!1390767 () Bool)

(assert (=> b!1508250 m!1390767))

(declare-fun m!1390769 () Bool)

(assert (=> start!128700 m!1390769))

(declare-fun m!1390771 () Bool)

(assert (=> start!128700 m!1390771))

(declare-fun m!1390773 () Bool)

(assert (=> b!1508248 m!1390773))

(push 1)

