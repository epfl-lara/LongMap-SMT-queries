; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130278 () Bool)

(assert start!130278)

(declare-fun b!1529568 () Bool)

(declare-fun res!1047282 () Bool)

(declare-fun e!852384 () Bool)

(assert (=> b!1529568 (=> (not res!1047282) (not e!852384))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101628 0))(
  ( (array!101629 (arr!49039 (Array (_ BitVec 32) (_ BitVec 64))) (size!49589 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101628)

(assert (=> b!1529568 (= res!1047282 (and (= (size!49589 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49589 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49589 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529569 () Bool)

(declare-fun res!1047285 () Bool)

(assert (=> b!1529569 (=> (not res!1047285) (not e!852384))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529569 (= res!1047285 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49589 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49589 a!2804))))))

(declare-fun b!1529570 () Bool)

(declare-fun e!852385 () Bool)

(declare-datatypes ((SeekEntryResult!13204 0))(
  ( (MissingZero!13204 (index!55211 (_ BitVec 32))) (Found!13204 (index!55212 (_ BitVec 32))) (Intermediate!13204 (undefined!14016 Bool) (index!55213 (_ BitVec 32)) (x!136891 (_ BitVec 32))) (Undefined!13204) (MissingVacant!13204 (index!55214 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101628 (_ BitVec 32)) SeekEntryResult!13204)

(assert (=> b!1529570 (= e!852385 (= (seekEntry!0 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) (Found!13204 j!70)))))

(declare-fun b!1529571 () Bool)

(declare-fun e!852386 () Bool)

(assert (=> b!1529571 (= e!852386 true)))

(declare-fun lt!662479 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529571 (= lt!662479 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1047277 () Bool)

(assert (=> start!130278 (=> (not res!1047277) (not e!852384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130278 (= res!1047277 (validMask!0 mask!2512))))

(assert (=> start!130278 e!852384))

(assert (=> start!130278 true))

(declare-fun array_inv!38067 (array!101628) Bool)

(assert (=> start!130278 (array_inv!38067 a!2804)))

(declare-fun b!1529572 () Bool)

(declare-fun e!852388 () Bool)

(assert (=> b!1529572 (= e!852384 e!852388)))

(declare-fun res!1047275 () Bool)

(assert (=> b!1529572 (=> (not res!1047275) (not e!852388))))

(declare-fun lt!662478 () SeekEntryResult!13204)

(declare-fun lt!662476 () SeekEntryResult!13204)

(assert (=> b!1529572 (= res!1047275 (= lt!662478 lt!662476))))

(assert (=> b!1529572 (= lt!662476 (Intermediate!13204 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101628 (_ BitVec 32)) SeekEntryResult!13204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529572 (= lt!662478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) (select (arr!49039 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529573 () Bool)

(assert (=> b!1529573 (= e!852388 (not e!852386))))

(declare-fun res!1047286 () Bool)

(assert (=> b!1529573 (=> res!1047286 e!852386)))

(assert (=> b!1529573 (= res!1047286 (or (not (= (select (arr!49039 a!2804) j!70) (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529573 e!852385))

(declare-fun res!1047278 () Bool)

(assert (=> b!1529573 (=> (not res!1047278) (not e!852385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101628 (_ BitVec 32)) Bool)

(assert (=> b!1529573 (= res!1047278 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51192 0))(
  ( (Unit!51193) )
))
(declare-fun lt!662477 () Unit!51192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51192)

(assert (=> b!1529573 (= lt!662477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529574 () Bool)

(declare-fun res!1047279 () Bool)

(assert (=> b!1529574 (=> (not res!1047279) (not e!852384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529574 (= res!1047279 (validKeyInArray!0 (select (arr!49039 a!2804) i!961)))))

(declare-fun b!1529575 () Bool)

(declare-fun res!1047283 () Bool)

(assert (=> b!1529575 (=> (not res!1047283) (not e!852384))))

(declare-datatypes ((List!35522 0))(
  ( (Nil!35519) (Cons!35518 (h!36954 (_ BitVec 64)) (t!50216 List!35522)) )
))
(declare-fun arrayNoDuplicates!0 (array!101628 (_ BitVec 32) List!35522) Bool)

(assert (=> b!1529575 (= res!1047283 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35519))))

(declare-fun b!1529576 () Bool)

(declare-fun res!1047284 () Bool)

(assert (=> b!1529576 (=> (not res!1047284) (not e!852388))))

(assert (=> b!1529576 (= res!1047284 (= lt!662478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101629 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49589 a!2804)) mask!2512)))))

(declare-fun b!1529577 () Bool)

(declare-fun res!1047280 () Bool)

(assert (=> b!1529577 (=> (not res!1047280) (not e!852384))))

(assert (=> b!1529577 (= res!1047280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529578 () Bool)

(declare-fun res!1047276 () Bool)

(assert (=> b!1529578 (=> (not res!1047276) (not e!852388))))

(assert (=> b!1529578 (= res!1047276 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) lt!662476))))

(declare-fun b!1529579 () Bool)

(declare-fun res!1047281 () Bool)

(assert (=> b!1529579 (=> (not res!1047281) (not e!852384))))

(assert (=> b!1529579 (= res!1047281 (validKeyInArray!0 (select (arr!49039 a!2804) j!70)))))

(assert (= (and start!130278 res!1047277) b!1529568))

(assert (= (and b!1529568 res!1047282) b!1529574))

(assert (= (and b!1529574 res!1047279) b!1529579))

(assert (= (and b!1529579 res!1047281) b!1529577))

(assert (= (and b!1529577 res!1047280) b!1529575))

(assert (= (and b!1529575 res!1047283) b!1529569))

(assert (= (and b!1529569 res!1047285) b!1529572))

(assert (= (and b!1529572 res!1047275) b!1529578))

(assert (= (and b!1529578 res!1047276) b!1529576))

(assert (= (and b!1529576 res!1047284) b!1529573))

(assert (= (and b!1529573 res!1047278) b!1529570))

(assert (= (and b!1529573 (not res!1047286)) b!1529571))

(declare-fun m!1412521 () Bool)

(assert (=> b!1529571 m!1412521))

(declare-fun m!1412523 () Bool)

(assert (=> b!1529574 m!1412523))

(assert (=> b!1529574 m!1412523))

(declare-fun m!1412525 () Bool)

(assert (=> b!1529574 m!1412525))

(declare-fun m!1412527 () Bool)

(assert (=> b!1529573 m!1412527))

(declare-fun m!1412529 () Bool)

(assert (=> b!1529573 m!1412529))

(declare-fun m!1412531 () Bool)

(assert (=> b!1529573 m!1412531))

(declare-fun m!1412533 () Bool)

(assert (=> b!1529573 m!1412533))

(declare-fun m!1412535 () Bool)

(assert (=> b!1529573 m!1412535))

(assert (=> b!1529579 m!1412527))

(assert (=> b!1529579 m!1412527))

(declare-fun m!1412537 () Bool)

(assert (=> b!1529579 m!1412537))

(assert (=> b!1529572 m!1412527))

(assert (=> b!1529572 m!1412527))

(declare-fun m!1412539 () Bool)

(assert (=> b!1529572 m!1412539))

(assert (=> b!1529572 m!1412539))

(assert (=> b!1529572 m!1412527))

(declare-fun m!1412541 () Bool)

(assert (=> b!1529572 m!1412541))

(declare-fun m!1412543 () Bool)

(assert (=> b!1529577 m!1412543))

(declare-fun m!1412545 () Bool)

(assert (=> start!130278 m!1412545))

(declare-fun m!1412547 () Bool)

(assert (=> start!130278 m!1412547))

(assert (=> b!1529570 m!1412527))

(assert (=> b!1529570 m!1412527))

(declare-fun m!1412549 () Bool)

(assert (=> b!1529570 m!1412549))

(assert (=> b!1529578 m!1412527))

(assert (=> b!1529578 m!1412527))

(declare-fun m!1412551 () Bool)

(assert (=> b!1529578 m!1412551))

(assert (=> b!1529576 m!1412531))

(assert (=> b!1529576 m!1412533))

(assert (=> b!1529576 m!1412533))

(declare-fun m!1412553 () Bool)

(assert (=> b!1529576 m!1412553))

(assert (=> b!1529576 m!1412553))

(assert (=> b!1529576 m!1412533))

(declare-fun m!1412555 () Bool)

(assert (=> b!1529576 m!1412555))

(declare-fun m!1412557 () Bool)

(assert (=> b!1529575 m!1412557))

(push 1)

