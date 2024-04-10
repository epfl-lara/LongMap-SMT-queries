; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128896 () Bool)

(assert start!128896)

(declare-fun b!1510774 () Bool)

(declare-fun res!1030677 () Bool)

(declare-fun e!843581 () Bool)

(assert (=> b!1510774 (=> (not res!1030677) (not e!843581))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100752 0))(
  ( (array!100753 (arr!48613 (Array (_ BitVec 32) (_ BitVec 64))) (size!49163 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100752)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12784 0))(
  ( (MissingZero!12784 (index!53531 (_ BitVec 32))) (Found!12784 (index!53532 (_ BitVec 32))) (Intermediate!12784 (undefined!13596 Bool) (index!53533 (_ BitVec 32)) (x!135270 (_ BitVec 32))) (Undefined!12784) (MissingVacant!12784 (index!53534 (_ BitVec 32))) )
))
(declare-fun lt!655259 () SeekEntryResult!12784)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100752 (_ BitVec 32)) SeekEntryResult!12784)

(assert (=> b!1510774 (= res!1030677 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48613 a!2804) j!70) a!2804 mask!2512) lt!655259))))

(declare-fun b!1510775 () Bool)

(declare-fun res!1030678 () Bool)

(assert (=> b!1510775 (=> (not res!1030678) (not e!843581))))

(declare-fun lt!655260 () SeekEntryResult!12784)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510775 (= res!1030678 (= lt!655260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100753 (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49163 a!2804)) mask!2512)))))

(declare-fun b!1510776 () Bool)

(declare-fun res!1030686 () Bool)

(declare-fun e!843583 () Bool)

(assert (=> b!1510776 (=> (not res!1030686) (not e!843583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510776 (= res!1030686 (validKeyInArray!0 (select (arr!48613 a!2804) i!961)))))

(declare-fun b!1510777 () Bool)

(declare-fun res!1030685 () Bool)

(assert (=> b!1510777 (=> (not res!1030685) (not e!843583))))

(declare-datatypes ((List!35096 0))(
  ( (Nil!35093) (Cons!35092 (h!36504 (_ BitVec 64)) (t!49790 List!35096)) )
))
(declare-fun arrayNoDuplicates!0 (array!100752 (_ BitVec 32) List!35096) Bool)

(assert (=> b!1510777 (= res!1030685 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35093))))

(declare-fun b!1510778 () Bool)

(assert (=> b!1510778 (= e!843581 (not true))))

(declare-fun e!843580 () Bool)

(assert (=> b!1510778 e!843580))

(declare-fun res!1030679 () Bool)

(assert (=> b!1510778 (=> (not res!1030679) (not e!843580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100752 (_ BitVec 32)) Bool)

(assert (=> b!1510778 (= res!1030679 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50436 0))(
  ( (Unit!50437) )
))
(declare-fun lt!655261 () Unit!50436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50436)

(assert (=> b!1510778 (= lt!655261 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510779 () Bool)

(declare-fun res!1030682 () Bool)

(assert (=> b!1510779 (=> (not res!1030682) (not e!843583))))

(assert (=> b!1510779 (= res!1030682 (validKeyInArray!0 (select (arr!48613 a!2804) j!70)))))

(declare-fun b!1510780 () Bool)

(declare-fun res!1030683 () Bool)

(assert (=> b!1510780 (=> (not res!1030683) (not e!843583))))

(assert (=> b!1510780 (= res!1030683 (and (= (size!49163 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49163 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49163 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1030681 () Bool)

(assert (=> start!128896 (=> (not res!1030681) (not e!843583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128896 (= res!1030681 (validMask!0 mask!2512))))

(assert (=> start!128896 e!843583))

(assert (=> start!128896 true))

(declare-fun array_inv!37641 (array!100752) Bool)

(assert (=> start!128896 (array_inv!37641 a!2804)))

(declare-fun b!1510781 () Bool)

(assert (=> b!1510781 (= e!843583 e!843581)))

(declare-fun res!1030687 () Bool)

(assert (=> b!1510781 (=> (not res!1030687) (not e!843581))))

(assert (=> b!1510781 (= res!1030687 (= lt!655260 lt!655259))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510781 (= lt!655259 (Intermediate!12784 false resIndex!21 resX!21))))

(assert (=> b!1510781 (= lt!655260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48613 a!2804) j!70) mask!2512) (select (arr!48613 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510782 () Bool)

(declare-fun res!1030684 () Bool)

(assert (=> b!1510782 (=> (not res!1030684) (not e!843583))))

(assert (=> b!1510782 (= res!1030684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510783 () Bool)

(declare-fun res!1030680 () Bool)

(assert (=> b!1510783 (=> (not res!1030680) (not e!843583))))

(assert (=> b!1510783 (= res!1030680 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49163 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49163 a!2804))))))

(declare-fun b!1510784 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100752 (_ BitVec 32)) SeekEntryResult!12784)

(assert (=> b!1510784 (= e!843580 (= (seekEntry!0 (select (arr!48613 a!2804) j!70) a!2804 mask!2512) (Found!12784 j!70)))))

(assert (= (and start!128896 res!1030681) b!1510780))

(assert (= (and b!1510780 res!1030683) b!1510776))

(assert (= (and b!1510776 res!1030686) b!1510779))

(assert (= (and b!1510779 res!1030682) b!1510782))

(assert (= (and b!1510782 res!1030684) b!1510777))

(assert (= (and b!1510777 res!1030685) b!1510783))

(assert (= (and b!1510783 res!1030680) b!1510781))

(assert (= (and b!1510781 res!1030687) b!1510774))

(assert (= (and b!1510774 res!1030677) b!1510775))

(assert (= (and b!1510775 res!1030678) b!1510778))

(assert (= (and b!1510778 res!1030679) b!1510784))

(declare-fun m!1393399 () Bool)

(assert (=> b!1510779 m!1393399))

(assert (=> b!1510779 m!1393399))

(declare-fun m!1393401 () Bool)

(assert (=> b!1510779 m!1393401))

(declare-fun m!1393403 () Bool)

(assert (=> b!1510777 m!1393403))

(declare-fun m!1393405 () Bool)

(assert (=> start!128896 m!1393405))

(declare-fun m!1393407 () Bool)

(assert (=> start!128896 m!1393407))

(declare-fun m!1393409 () Bool)

(assert (=> b!1510775 m!1393409))

(declare-fun m!1393411 () Bool)

(assert (=> b!1510775 m!1393411))

(assert (=> b!1510775 m!1393411))

(declare-fun m!1393413 () Bool)

(assert (=> b!1510775 m!1393413))

(assert (=> b!1510775 m!1393413))

(assert (=> b!1510775 m!1393411))

(declare-fun m!1393415 () Bool)

(assert (=> b!1510775 m!1393415))

(assert (=> b!1510774 m!1393399))

(assert (=> b!1510774 m!1393399))

(declare-fun m!1393417 () Bool)

(assert (=> b!1510774 m!1393417))

(declare-fun m!1393419 () Bool)

(assert (=> b!1510776 m!1393419))

(assert (=> b!1510776 m!1393419))

(declare-fun m!1393421 () Bool)

(assert (=> b!1510776 m!1393421))

(assert (=> b!1510784 m!1393399))

(assert (=> b!1510784 m!1393399))

(declare-fun m!1393423 () Bool)

(assert (=> b!1510784 m!1393423))

(declare-fun m!1393425 () Bool)

(assert (=> b!1510778 m!1393425))

(declare-fun m!1393427 () Bool)

(assert (=> b!1510778 m!1393427))

(assert (=> b!1510781 m!1393399))

(assert (=> b!1510781 m!1393399))

(declare-fun m!1393429 () Bool)

(assert (=> b!1510781 m!1393429))

(assert (=> b!1510781 m!1393429))

(assert (=> b!1510781 m!1393399))

(declare-fun m!1393431 () Bool)

(assert (=> b!1510781 m!1393431))

(declare-fun m!1393433 () Bool)

(assert (=> b!1510782 m!1393433))

(push 1)

(assert (not b!1510777))

