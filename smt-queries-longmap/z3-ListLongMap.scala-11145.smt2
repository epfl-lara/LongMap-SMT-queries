; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130234 () Bool)

(assert start!130234)

(declare-fun res!1046485 () Bool)

(declare-fun e!852057 () Bool)

(assert (=> start!130234 (=> (not res!1046485) (not e!852057))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130234 (= res!1046485 (validMask!0 mask!2512))))

(assert (=> start!130234 e!852057))

(assert (=> start!130234 true))

(declare-datatypes ((array!101584 0))(
  ( (array!101585 (arr!49017 (Array (_ BitVec 32) (_ BitVec 64))) (size!49567 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101584)

(declare-fun array_inv!38045 (array!101584) Bool)

(assert (=> start!130234 (array_inv!38045 a!2804)))

(declare-fun b!1528776 () Bool)

(declare-fun e!852055 () Bool)

(assert (=> b!1528776 (= e!852055 true)))

(declare-fun lt!662215 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528776 (= lt!662215 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!852058 () Bool)

(declare-fun b!1528777 () Bool)

(declare-datatypes ((SeekEntryResult!13182 0))(
  ( (MissingZero!13182 (index!55123 (_ BitVec 32))) (Found!13182 (index!55124 (_ BitVec 32))) (Intermediate!13182 (undefined!13994 Bool) (index!55125 (_ BitVec 32)) (x!136813 (_ BitVec 32))) (Undefined!13182) (MissingVacant!13182 (index!55126 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101584 (_ BitVec 32)) SeekEntryResult!13182)

(assert (=> b!1528777 (= e!852058 (= (seekEntry!0 (select (arr!49017 a!2804) j!70) a!2804 mask!2512) (Found!13182 j!70)))))

(declare-fun b!1528778 () Bool)

(declare-fun e!852056 () Bool)

(assert (=> b!1528778 (= e!852056 (not e!852055))))

(declare-fun res!1046483 () Bool)

(assert (=> b!1528778 (=> res!1046483 e!852055)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528778 (= res!1046483 (or (not (= (select (arr!49017 a!2804) j!70) (select (store (arr!49017 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1528778 e!852058))

(declare-fun res!1046488 () Bool)

(assert (=> b!1528778 (=> (not res!1046488) (not e!852058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101584 (_ BitVec 32)) Bool)

(assert (=> b!1528778 (= res!1046488 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51148 0))(
  ( (Unit!51149) )
))
(declare-fun lt!662214 () Unit!51148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51148)

(assert (=> b!1528778 (= lt!662214 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528779 () Bool)

(declare-fun res!1046487 () Bool)

(assert (=> b!1528779 (=> (not res!1046487) (not e!852057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528779 (= res!1046487 (validKeyInArray!0 (select (arr!49017 a!2804) i!961)))))

(declare-fun b!1528780 () Bool)

(declare-fun res!1046493 () Bool)

(assert (=> b!1528780 (=> (not res!1046493) (not e!852057))))

(assert (=> b!1528780 (= res!1046493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528781 () Bool)

(declare-fun res!1046489 () Bool)

(assert (=> b!1528781 (=> (not res!1046489) (not e!852056))))

(declare-fun lt!662213 () SeekEntryResult!13182)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101584 (_ BitVec 32)) SeekEntryResult!13182)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528781 (= res!1046489 (= lt!662213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49017 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49017 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101585 (store (arr!49017 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49567 a!2804)) mask!2512)))))

(declare-fun b!1528782 () Bool)

(declare-fun res!1046484 () Bool)

(assert (=> b!1528782 (=> (not res!1046484) (not e!852057))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528782 (= res!1046484 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49567 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49567 a!2804))))))

(declare-fun b!1528783 () Bool)

(declare-fun res!1046491 () Bool)

(assert (=> b!1528783 (=> (not res!1046491) (not e!852057))))

(declare-datatypes ((List!35500 0))(
  ( (Nil!35497) (Cons!35496 (h!36932 (_ BitVec 64)) (t!50194 List!35500)) )
))
(declare-fun arrayNoDuplicates!0 (array!101584 (_ BitVec 32) List!35500) Bool)

(assert (=> b!1528783 (= res!1046491 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35497))))

(declare-fun b!1528784 () Bool)

(assert (=> b!1528784 (= e!852057 e!852056)))

(declare-fun res!1046494 () Bool)

(assert (=> b!1528784 (=> (not res!1046494) (not e!852056))))

(declare-fun lt!662212 () SeekEntryResult!13182)

(assert (=> b!1528784 (= res!1046494 (= lt!662213 lt!662212))))

(assert (=> b!1528784 (= lt!662212 (Intermediate!13182 false resIndex!21 resX!21))))

(assert (=> b!1528784 (= lt!662213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49017 a!2804) j!70) mask!2512) (select (arr!49017 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528785 () Bool)

(declare-fun res!1046490 () Bool)

(assert (=> b!1528785 (=> (not res!1046490) (not e!852057))))

(assert (=> b!1528785 (= res!1046490 (validKeyInArray!0 (select (arr!49017 a!2804) j!70)))))

(declare-fun b!1528786 () Bool)

(declare-fun res!1046492 () Bool)

(assert (=> b!1528786 (=> (not res!1046492) (not e!852056))))

(assert (=> b!1528786 (= res!1046492 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49017 a!2804) j!70) a!2804 mask!2512) lt!662212))))

(declare-fun b!1528787 () Bool)

(declare-fun res!1046486 () Bool)

(assert (=> b!1528787 (=> (not res!1046486) (not e!852057))))

(assert (=> b!1528787 (= res!1046486 (and (= (size!49567 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49567 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49567 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130234 res!1046485) b!1528787))

(assert (= (and b!1528787 res!1046486) b!1528779))

(assert (= (and b!1528779 res!1046487) b!1528785))

(assert (= (and b!1528785 res!1046490) b!1528780))

(assert (= (and b!1528780 res!1046493) b!1528783))

(assert (= (and b!1528783 res!1046491) b!1528782))

(assert (= (and b!1528782 res!1046484) b!1528784))

(assert (= (and b!1528784 res!1046494) b!1528786))

(assert (= (and b!1528786 res!1046492) b!1528781))

(assert (= (and b!1528781 res!1046489) b!1528778))

(assert (= (and b!1528778 res!1046488) b!1528777))

(assert (= (and b!1528778 (not res!1046483)) b!1528776))

(declare-fun m!1411685 () Bool)

(assert (=> b!1528786 m!1411685))

(assert (=> b!1528786 m!1411685))

(declare-fun m!1411687 () Bool)

(assert (=> b!1528786 m!1411687))

(declare-fun m!1411689 () Bool)

(assert (=> start!130234 m!1411689))

(declare-fun m!1411691 () Bool)

(assert (=> start!130234 m!1411691))

(assert (=> b!1528785 m!1411685))

(assert (=> b!1528785 m!1411685))

(declare-fun m!1411693 () Bool)

(assert (=> b!1528785 m!1411693))

(declare-fun m!1411695 () Bool)

(assert (=> b!1528779 m!1411695))

(assert (=> b!1528779 m!1411695))

(declare-fun m!1411697 () Bool)

(assert (=> b!1528779 m!1411697))

(declare-fun m!1411699 () Bool)

(assert (=> b!1528780 m!1411699))

(declare-fun m!1411701 () Bool)

(assert (=> b!1528783 m!1411701))

(assert (=> b!1528777 m!1411685))

(assert (=> b!1528777 m!1411685))

(declare-fun m!1411703 () Bool)

(assert (=> b!1528777 m!1411703))

(declare-fun m!1411705 () Bool)

(assert (=> b!1528776 m!1411705))

(assert (=> b!1528784 m!1411685))

(assert (=> b!1528784 m!1411685))

(declare-fun m!1411707 () Bool)

(assert (=> b!1528784 m!1411707))

(assert (=> b!1528784 m!1411707))

(assert (=> b!1528784 m!1411685))

(declare-fun m!1411709 () Bool)

(assert (=> b!1528784 m!1411709))

(declare-fun m!1411711 () Bool)

(assert (=> b!1528781 m!1411711))

(declare-fun m!1411713 () Bool)

(assert (=> b!1528781 m!1411713))

(assert (=> b!1528781 m!1411713))

(declare-fun m!1411715 () Bool)

(assert (=> b!1528781 m!1411715))

(assert (=> b!1528781 m!1411715))

(assert (=> b!1528781 m!1411713))

(declare-fun m!1411717 () Bool)

(assert (=> b!1528781 m!1411717))

(assert (=> b!1528778 m!1411685))

(declare-fun m!1411719 () Bool)

(assert (=> b!1528778 m!1411719))

(assert (=> b!1528778 m!1411711))

(assert (=> b!1528778 m!1411713))

(declare-fun m!1411721 () Bool)

(assert (=> b!1528778 m!1411721))

(check-sat (not b!1528785) (not b!1528783) (not b!1528780) (not b!1528784) (not b!1528778) (not start!130234) (not b!1528779) (not b!1528776) (not b!1528777) (not b!1528786) (not b!1528781))
(check-sat)
