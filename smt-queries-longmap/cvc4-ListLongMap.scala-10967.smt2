; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128470 () Bool)

(assert start!128470)

(declare-fun b!1506422 () Bool)

(declare-fun res!1026751 () Bool)

(declare-fun e!841902 () Bool)

(assert (=> b!1506422 (=> (not res!1026751) (not e!841902))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100482 0))(
  ( (array!100483 (arr!48484 (Array (_ BitVec 32) (_ BitVec 64))) (size!49034 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100482)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506422 (= res!1026751 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49034 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49034 a!2804))))))

(declare-fun b!1506423 () Bool)

(declare-fun res!1026750 () Bool)

(assert (=> b!1506423 (=> (not res!1026750) (not e!841902))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100482 (_ BitVec 32)) Bool)

(assert (=> b!1506423 (= res!1026750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506424 () Bool)

(declare-fun res!1026747 () Bool)

(assert (=> b!1506424 (=> (not res!1026747) (not e!841902))))

(declare-datatypes ((List!34967 0))(
  ( (Nil!34964) (Cons!34963 (h!36363 (_ BitVec 64)) (t!49661 List!34967)) )
))
(declare-fun arrayNoDuplicates!0 (array!100482 (_ BitVec 32) List!34967) Bool)

(assert (=> b!1506424 (= res!1026747 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34964))))

(declare-fun res!1026746 () Bool)

(assert (=> start!128470 (=> (not res!1026746) (not e!841902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128470 (= res!1026746 (validMask!0 mask!2512))))

(assert (=> start!128470 e!841902))

(assert (=> start!128470 true))

(declare-fun array_inv!37512 (array!100482) Bool)

(assert (=> start!128470 (array_inv!37512 a!2804)))

(declare-fun b!1506425 () Bool)

(declare-fun res!1026745 () Bool)

(assert (=> b!1506425 (=> (not res!1026745) (not e!841902))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506425 (= res!1026745 (validKeyInArray!0 (select (arr!48484 a!2804) i!961)))))

(declare-fun b!1506426 () Bool)

(declare-fun res!1026749 () Bool)

(assert (=> b!1506426 (=> (not res!1026749) (not e!841902))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506426 (= res!1026749 (and (= (size!49034 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49034 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49034 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506427 () Bool)

(declare-fun res!1026748 () Bool)

(assert (=> b!1506427 (=> (not res!1026748) (not e!841902))))

(assert (=> b!1506427 (= res!1026748 (validKeyInArray!0 (select (arr!48484 a!2804) j!70)))))

(declare-fun b!1506428 () Bool)

(assert (=> b!1506428 (= e!841902 false)))

(declare-fun lt!654232 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506428 (= lt!654232 (toIndex!0 (select (arr!48484 a!2804) j!70) mask!2512))))

(assert (= (and start!128470 res!1026746) b!1506426))

(assert (= (and b!1506426 res!1026749) b!1506425))

(assert (= (and b!1506425 res!1026745) b!1506427))

(assert (= (and b!1506427 res!1026748) b!1506423))

(assert (= (and b!1506423 res!1026750) b!1506424))

(assert (= (and b!1506424 res!1026747) b!1506422))

(assert (= (and b!1506422 res!1026751) b!1506428))

(declare-fun m!1389367 () Bool)

(assert (=> b!1506428 m!1389367))

(assert (=> b!1506428 m!1389367))

(declare-fun m!1389369 () Bool)

(assert (=> b!1506428 m!1389369))

(assert (=> b!1506427 m!1389367))

(assert (=> b!1506427 m!1389367))

(declare-fun m!1389371 () Bool)

(assert (=> b!1506427 m!1389371))

(declare-fun m!1389373 () Bool)

(assert (=> b!1506425 m!1389373))

(assert (=> b!1506425 m!1389373))

(declare-fun m!1389375 () Bool)

(assert (=> b!1506425 m!1389375))

(declare-fun m!1389377 () Bool)

(assert (=> b!1506424 m!1389377))

(declare-fun m!1389379 () Bool)

(assert (=> b!1506423 m!1389379))

(declare-fun m!1389381 () Bool)

(assert (=> start!128470 m!1389381))

(declare-fun m!1389383 () Bool)

(assert (=> start!128470 m!1389383))

(push 1)

(assert (not b!1506428))

(assert (not b!1506427))

(assert (not start!128470))

(assert (not b!1506424))

(assert (not b!1506425))

(assert (not b!1506423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

