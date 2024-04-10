; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129596 () Bool)

(assert start!129596)

(declare-fun b!1521364 () Bool)

(declare-fun res!1040588 () Bool)

(declare-fun e!848508 () Bool)

(assert (=> b!1521364 (=> (not res!1040588) (not e!848508))))

(declare-datatypes ((array!101271 0))(
  ( (array!101272 (arr!48868 (Array (_ BitVec 32) (_ BitVec 64))) (size!49418 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101271)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521364 (= res!1040588 (validKeyInArray!0 (select (arr!48868 a!2804) j!70)))))

(declare-fun b!1521365 () Bool)

(declare-fun res!1040592 () Bool)

(assert (=> b!1521365 (=> (not res!1040592) (not e!848508))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13033 0))(
  ( (MissingZero!13033 (index!54527 (_ BitVec 32))) (Found!13033 (index!54528 (_ BitVec 32))) (Intermediate!13033 (undefined!13845 Bool) (index!54529 (_ BitVec 32)) (x!136221 (_ BitVec 32))) (Undefined!13033) (MissingVacant!13033 (index!54530 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101271 (_ BitVec 32)) SeekEntryResult!13033)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521365 (= res!1040592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48868 a!2804) j!70) mask!2512) (select (arr!48868 a!2804) j!70) a!2804 mask!2512) (Intermediate!13033 false resIndex!21 resX!21)))))

(declare-fun b!1521366 () Bool)

(declare-fun res!1040589 () Bool)

(assert (=> b!1521366 (=> (not res!1040589) (not e!848508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101271 (_ BitVec 32)) Bool)

(assert (=> b!1521366 (= res!1040589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521367 () Bool)

(declare-fun res!1040586 () Bool)

(assert (=> b!1521367 (=> (not res!1040586) (not e!848508))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521367 (= res!1040586 (validKeyInArray!0 (select (arr!48868 a!2804) i!961)))))

(declare-fun b!1521368 () Bool)

(declare-fun res!1040590 () Bool)

(assert (=> b!1521368 (=> (not res!1040590) (not e!848508))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521368 (= res!1040590 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49418 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49418 a!2804))))))

(declare-fun res!1040587 () Bool)

(assert (=> start!129596 (=> (not res!1040587) (not e!848508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129596 (= res!1040587 (validMask!0 mask!2512))))

(assert (=> start!129596 e!848508))

(assert (=> start!129596 true))

(declare-fun array_inv!37896 (array!101271) Bool)

(assert (=> start!129596 (array_inv!37896 a!2804)))

(declare-fun b!1521369 () Bool)

(assert (=> b!1521369 (= e!848508 false)))

(declare-fun lt!659341 () SeekEntryResult!13033)

(assert (=> b!1521369 (= lt!659341 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48868 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521370 () Bool)

(declare-fun res!1040591 () Bool)

(assert (=> b!1521370 (=> (not res!1040591) (not e!848508))))

(declare-datatypes ((List!35351 0))(
  ( (Nil!35348) (Cons!35347 (h!36768 (_ BitVec 64)) (t!50045 List!35351)) )
))
(declare-fun arrayNoDuplicates!0 (array!101271 (_ BitVec 32) List!35351) Bool)

(assert (=> b!1521370 (= res!1040591 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35348))))

(declare-fun b!1521371 () Bool)

(declare-fun res!1040593 () Bool)

(assert (=> b!1521371 (=> (not res!1040593) (not e!848508))))

(assert (=> b!1521371 (= res!1040593 (and (= (size!49418 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49418 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49418 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129596 res!1040587) b!1521371))

(assert (= (and b!1521371 res!1040593) b!1521367))

(assert (= (and b!1521367 res!1040586) b!1521364))

(assert (= (and b!1521364 res!1040588) b!1521366))

(assert (= (and b!1521366 res!1040589) b!1521370))

(assert (= (and b!1521370 res!1040591) b!1521368))

(assert (= (and b!1521368 res!1040590) b!1521365))

(assert (= (and b!1521365 res!1040592) b!1521369))

(declare-fun m!1404463 () Bool)

(assert (=> b!1521369 m!1404463))

(assert (=> b!1521369 m!1404463))

(declare-fun m!1404465 () Bool)

(assert (=> b!1521369 m!1404465))

(declare-fun m!1404467 () Bool)

(assert (=> b!1521367 m!1404467))

(assert (=> b!1521367 m!1404467))

(declare-fun m!1404469 () Bool)

(assert (=> b!1521367 m!1404469))

(declare-fun m!1404471 () Bool)

(assert (=> start!129596 m!1404471))

(declare-fun m!1404473 () Bool)

(assert (=> start!129596 m!1404473))

(assert (=> b!1521364 m!1404463))

(assert (=> b!1521364 m!1404463))

(declare-fun m!1404475 () Bool)

(assert (=> b!1521364 m!1404475))

(declare-fun m!1404477 () Bool)

(assert (=> b!1521370 m!1404477))

(assert (=> b!1521365 m!1404463))

(assert (=> b!1521365 m!1404463))

(declare-fun m!1404479 () Bool)

(assert (=> b!1521365 m!1404479))

(assert (=> b!1521365 m!1404479))

(assert (=> b!1521365 m!1404463))

(declare-fun m!1404481 () Bool)

(assert (=> b!1521365 m!1404481))

(declare-fun m!1404483 () Bool)

(assert (=> b!1521366 m!1404483))

(push 1)

(assert (not start!129596))

(assert (not b!1521367))

(assert (not b!1521366))

(assert (not b!1521365))

(assert (not b!1521369))

(assert (not b!1521370))

(assert (not b!1521364))

(check-sat)

