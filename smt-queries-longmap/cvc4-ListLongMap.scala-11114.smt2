; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129792 () Bool)

(assert start!129792)

(declare-fun b!1523545 () Bool)

(declare-fun res!1042457 () Bool)

(declare-fun e!849377 () Bool)

(assert (=> b!1523545 (=> (not res!1042457) (not e!849377))))

(declare-datatypes ((array!101388 0))(
  ( (array!101389 (arr!48925 (Array (_ BitVec 32) (_ BitVec 64))) (size!49475 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101388)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523545 (= res!1042457 (validKeyInArray!0 (select (arr!48925 a!2804) j!70)))))

(declare-fun b!1523546 () Bool)

(declare-fun res!1042461 () Bool)

(assert (=> b!1523546 (=> (not res!1042461) (not e!849377))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523546 (= res!1042461 (validKeyInArray!0 (select (arr!48925 a!2804) i!961)))))

(declare-fun b!1523547 () Bool)

(declare-fun res!1042454 () Bool)

(assert (=> b!1523547 (=> (not res!1042454) (not e!849377))))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1523547 (= res!1042454 (and (= (size!49475 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49475 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49475 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523548 () Bool)

(declare-fun e!849376 () Bool)

(assert (=> b!1523548 (= e!849377 e!849376)))

(declare-fun res!1042453 () Bool)

(assert (=> b!1523548 (=> (not res!1042453) (not e!849376))))

(declare-datatypes ((SeekEntryResult!13090 0))(
  ( (MissingZero!13090 (index!54755 (_ BitVec 32))) (Found!13090 (index!54756 (_ BitVec 32))) (Intermediate!13090 (undefined!13902 Bool) (index!54757 (_ BitVec 32)) (x!136440 (_ BitVec 32))) (Undefined!13090) (MissingVacant!13090 (index!54758 (_ BitVec 32))) )
))
(declare-fun lt!659983 () SeekEntryResult!13090)

(declare-fun lt!659981 () SeekEntryResult!13090)

(assert (=> b!1523548 (= res!1042453 (= lt!659983 lt!659981))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523548 (= lt!659981 (Intermediate!13090 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101388 (_ BitVec 32)) SeekEntryResult!13090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523548 (= lt!659983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523549 () Bool)

(declare-fun res!1042456 () Bool)

(assert (=> b!1523549 (=> (not res!1042456) (not e!849377))))

(declare-datatypes ((List!35408 0))(
  ( (Nil!35405) (Cons!35404 (h!36828 (_ BitVec 64)) (t!50102 List!35408)) )
))
(declare-fun arrayNoDuplicates!0 (array!101388 (_ BitVec 32) List!35408) Bool)

(assert (=> b!1523549 (= res!1042456 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35405))))

(declare-fun res!1042455 () Bool)

(assert (=> start!129792 (=> (not res!1042455) (not e!849377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129792 (= res!1042455 (validMask!0 mask!2512))))

(assert (=> start!129792 e!849377))

(assert (=> start!129792 true))

(declare-fun array_inv!37953 (array!101388) Bool)

(assert (=> start!129792 (array_inv!37953 a!2804)))

(declare-fun b!1523550 () Bool)

(assert (=> b!1523550 (= e!849376 (not true))))

(declare-fun e!849378 () Bool)

(assert (=> b!1523550 e!849378))

(declare-fun res!1042462 () Bool)

(assert (=> b!1523550 (=> (not res!1042462) (not e!849378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101388 (_ BitVec 32)) Bool)

(assert (=> b!1523550 (= res!1042462 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50964 0))(
  ( (Unit!50965) )
))
(declare-fun lt!659982 () Unit!50964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50964)

(assert (=> b!1523550 (= lt!659982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523551 () Bool)

(declare-fun res!1042459 () Bool)

(assert (=> b!1523551 (=> (not res!1042459) (not e!849377))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523551 (= res!1042459 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49475 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49475 a!2804))))))

(declare-fun b!1523552 () Bool)

(declare-fun res!1042458 () Bool)

(assert (=> b!1523552 (=> (not res!1042458) (not e!849377))))

(assert (=> b!1523552 (= res!1042458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523553 () Bool)

(declare-fun res!1042460 () Bool)

(assert (=> b!1523553 (=> (not res!1042460) (not e!849376))))

(assert (=> b!1523553 (= res!1042460 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!659981))))

(declare-fun b!1523554 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101388 (_ BitVec 32)) SeekEntryResult!13090)

(assert (=> b!1523554 (= e!849378 (= (seekEntry!0 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) (Found!13090 j!70)))))

(declare-fun b!1523555 () Bool)

(declare-fun res!1042452 () Bool)

(assert (=> b!1523555 (=> (not res!1042452) (not e!849376))))

(assert (=> b!1523555 (= res!1042452 (= lt!659983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48925 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48925 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101389 (store (arr!48925 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49475 a!2804)) mask!2512)))))

(assert (= (and start!129792 res!1042455) b!1523547))

(assert (= (and b!1523547 res!1042454) b!1523546))

(assert (= (and b!1523546 res!1042461) b!1523545))

(assert (= (and b!1523545 res!1042457) b!1523552))

(assert (= (and b!1523552 res!1042458) b!1523549))

(assert (= (and b!1523549 res!1042456) b!1523551))

(assert (= (and b!1523551 res!1042459) b!1523548))

(assert (= (and b!1523548 res!1042453) b!1523553))

(assert (= (and b!1523553 res!1042460) b!1523555))

(assert (= (and b!1523555 res!1042452) b!1523550))

(assert (= (and b!1523550 res!1042462) b!1523554))

(declare-fun m!1406673 () Bool)

(assert (=> b!1523555 m!1406673))

(declare-fun m!1406675 () Bool)

(assert (=> b!1523555 m!1406675))

(assert (=> b!1523555 m!1406675))

(declare-fun m!1406677 () Bool)

(assert (=> b!1523555 m!1406677))

(assert (=> b!1523555 m!1406677))

(assert (=> b!1523555 m!1406675))

(declare-fun m!1406679 () Bool)

(assert (=> b!1523555 m!1406679))

(declare-fun m!1406681 () Bool)

(assert (=> b!1523552 m!1406681))

(declare-fun m!1406683 () Bool)

(assert (=> b!1523548 m!1406683))

(assert (=> b!1523548 m!1406683))

(declare-fun m!1406685 () Bool)

(assert (=> b!1523548 m!1406685))

(assert (=> b!1523548 m!1406685))

(assert (=> b!1523548 m!1406683))

(declare-fun m!1406687 () Bool)

(assert (=> b!1523548 m!1406687))

(declare-fun m!1406689 () Bool)

(assert (=> b!1523546 m!1406689))

(assert (=> b!1523546 m!1406689))

(declare-fun m!1406691 () Bool)

(assert (=> b!1523546 m!1406691))

(assert (=> b!1523545 m!1406683))

(assert (=> b!1523545 m!1406683))

(declare-fun m!1406693 () Bool)

(assert (=> b!1523545 m!1406693))

(assert (=> b!1523553 m!1406683))

(assert (=> b!1523553 m!1406683))

(declare-fun m!1406695 () Bool)

(assert (=> b!1523553 m!1406695))

(declare-fun m!1406697 () Bool)

(assert (=> b!1523549 m!1406697))

(declare-fun m!1406699 () Bool)

(assert (=> start!129792 m!1406699))

(declare-fun m!1406701 () Bool)

(assert (=> start!129792 m!1406701))

(assert (=> b!1523554 m!1406683))

(assert (=> b!1523554 m!1406683))

(declare-fun m!1406703 () Bool)

(assert (=> b!1523554 m!1406703))

(declare-fun m!1406705 () Bool)

(assert (=> b!1523550 m!1406705))

(declare-fun m!1406707 () Bool)

(assert (=> b!1523550 m!1406707))

(push 1)

(assert (not start!129792))

(assert (not b!1523552))

