; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130536 () Bool)

(assert start!130536)

(declare-fun b!1531915 () Bool)

(declare-fun e!853570 () Bool)

(declare-fun e!853568 () Bool)

(assert (=> b!1531915 (= e!853570 e!853568)))

(declare-fun res!1049065 () Bool)

(assert (=> b!1531915 (=> res!1049065 e!853568)))

(declare-datatypes ((array!101715 0))(
  ( (array!101716 (arr!49078 (Array (_ BitVec 32) (_ BitVec 64))) (size!49628 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101715)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!663442 () (_ BitVec 32))

(assert (=> b!1531915 (= res!1049065 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663442 #b00000000000000000000000000000000) (bvsge lt!663442 (size!49628 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531915 (= lt!663442 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531916 () Bool)

(declare-fun res!1049059 () Bool)

(declare-fun e!853569 () Bool)

(assert (=> b!1531916 (=> (not res!1049059) (not e!853569))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531916 (= res!1049059 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49628 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49628 a!2804))))))

(declare-fun b!1531917 () Bool)

(declare-fun e!853572 () Bool)

(assert (=> b!1531917 (= e!853569 e!853572)))

(declare-fun res!1049055 () Bool)

(assert (=> b!1531917 (=> (not res!1049055) (not e!853572))))

(declare-datatypes ((SeekEntryResult!13243 0))(
  ( (MissingZero!13243 (index!55367 (_ BitVec 32))) (Found!13243 (index!55368 (_ BitVec 32))) (Intermediate!13243 (undefined!14055 Bool) (index!55369 (_ BitVec 32)) (x!137061 (_ BitVec 32))) (Undefined!13243) (MissingVacant!13243 (index!55370 (_ BitVec 32))) )
))
(declare-fun lt!663444 () SeekEntryResult!13243)

(declare-fun lt!663446 () SeekEntryResult!13243)

(assert (=> b!1531917 (= res!1049055 (= lt!663444 lt!663446))))

(assert (=> b!1531917 (= lt!663446 (Intermediate!13243 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101715 (_ BitVec 32)) SeekEntryResult!13243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531917 (= lt!663444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49078 a!2804) j!70) mask!2512) (select (arr!49078 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531918 () Bool)

(declare-fun res!1049058 () Bool)

(assert (=> b!1531918 (=> res!1049058 e!853568)))

(assert (=> b!1531918 (= res!1049058 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663442 (select (arr!49078 a!2804) j!70) a!2804 mask!2512) lt!663446)))))

(declare-fun b!1531919 () Bool)

(declare-fun e!853573 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101715 (_ BitVec 32)) SeekEntryResult!13243)

(assert (=> b!1531919 (= e!853573 (= (seekEntry!0 (select (arr!49078 a!2804) j!70) a!2804 mask!2512) (Found!13243 j!70)))))

(declare-fun b!1531920 () Bool)

(assert (=> b!1531920 (= e!853568 true)))

(declare-fun lt!663443 () array!101715)

(declare-fun lt!663445 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101715 (_ BitVec 32)) SeekEntryResult!13243)

(assert (=> b!1531920 (= (seekEntryOrOpen!0 (select (arr!49078 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663445 lt!663443 mask!2512))))

(declare-datatypes ((Unit!51270 0))(
  ( (Unit!51271) )
))
(declare-fun lt!663448 () Unit!51270)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51270)

(assert (=> b!1531920 (= lt!663448 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663442 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1531921 () Bool)

(declare-fun res!1049056 () Bool)

(assert (=> b!1531921 (=> (not res!1049056) (not e!853569))))

(assert (=> b!1531921 (= res!1049056 (and (= (size!49628 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49628 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49628 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1049066 () Bool)

(assert (=> start!130536 (=> (not res!1049066) (not e!853569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130536 (= res!1049066 (validMask!0 mask!2512))))

(assert (=> start!130536 e!853569))

(assert (=> start!130536 true))

(declare-fun array_inv!38106 (array!101715) Bool)

(assert (=> start!130536 (array_inv!38106 a!2804)))

(declare-fun b!1531922 () Bool)

(declare-fun e!853567 () Bool)

(assert (=> b!1531922 (= e!853567 (not e!853570))))

(declare-fun res!1049062 () Bool)

(assert (=> b!1531922 (=> res!1049062 e!853570)))

(assert (=> b!1531922 (= res!1049062 (or (not (= (select (arr!49078 a!2804) j!70) lt!663445)) (= x!534 resX!21)))))

(assert (=> b!1531922 e!853573))

(declare-fun res!1049063 () Bool)

(assert (=> b!1531922 (=> (not res!1049063) (not e!853573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101715 (_ BitVec 32)) Bool)

(assert (=> b!1531922 (= res!1049063 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663447 () Unit!51270)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51270)

(assert (=> b!1531922 (= lt!663447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531923 () Bool)

(declare-fun res!1049061 () Bool)

(assert (=> b!1531923 (=> (not res!1049061) (not e!853569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531923 (= res!1049061 (validKeyInArray!0 (select (arr!49078 a!2804) j!70)))))

(declare-fun b!1531924 () Bool)

(declare-fun res!1049057 () Bool)

(assert (=> b!1531924 (=> (not res!1049057) (not e!853569))))

(assert (=> b!1531924 (= res!1049057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531925 () Bool)

(assert (=> b!1531925 (= e!853572 e!853567)))

(declare-fun res!1049064 () Bool)

(assert (=> b!1531925 (=> (not res!1049064) (not e!853567))))

(assert (=> b!1531925 (= res!1049064 (= lt!663444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663445 mask!2512) lt!663445 lt!663443 mask!2512)))))

(assert (=> b!1531925 (= lt!663445 (select (store (arr!49078 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531925 (= lt!663443 (array!101716 (store (arr!49078 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49628 a!2804)))))

(declare-fun b!1531926 () Bool)

(declare-fun res!1049067 () Bool)

(assert (=> b!1531926 (=> (not res!1049067) (not e!853569))))

(declare-datatypes ((List!35561 0))(
  ( (Nil!35558) (Cons!35557 (h!37002 (_ BitVec 64)) (t!50255 List!35561)) )
))
(declare-fun arrayNoDuplicates!0 (array!101715 (_ BitVec 32) List!35561) Bool)

(assert (=> b!1531926 (= res!1049067 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35558))))

(declare-fun b!1531927 () Bool)

(declare-fun res!1049060 () Bool)

(assert (=> b!1531927 (=> (not res!1049060) (not e!853572))))

(assert (=> b!1531927 (= res!1049060 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49078 a!2804) j!70) a!2804 mask!2512) lt!663446))))

(declare-fun b!1531928 () Bool)

(declare-fun res!1049068 () Bool)

(assert (=> b!1531928 (=> (not res!1049068) (not e!853569))))

(assert (=> b!1531928 (= res!1049068 (validKeyInArray!0 (select (arr!49078 a!2804) i!961)))))

(assert (= (and start!130536 res!1049066) b!1531921))

(assert (= (and b!1531921 res!1049056) b!1531928))

(assert (= (and b!1531928 res!1049068) b!1531923))

(assert (= (and b!1531923 res!1049061) b!1531924))

(assert (= (and b!1531924 res!1049057) b!1531926))

(assert (= (and b!1531926 res!1049067) b!1531916))

(assert (= (and b!1531916 res!1049059) b!1531917))

(assert (= (and b!1531917 res!1049055) b!1531927))

(assert (= (and b!1531927 res!1049060) b!1531925))

(assert (= (and b!1531925 res!1049064) b!1531922))

(assert (= (and b!1531922 res!1049063) b!1531919))

(assert (= (and b!1531922 (not res!1049062)) b!1531915))

(assert (= (and b!1531915 (not res!1049065)) b!1531918))

(assert (= (and b!1531918 (not res!1049058)) b!1531920))

(declare-fun m!1414589 () Bool)

(assert (=> b!1531925 m!1414589))

(assert (=> b!1531925 m!1414589))

(declare-fun m!1414591 () Bool)

(assert (=> b!1531925 m!1414591))

(declare-fun m!1414593 () Bool)

(assert (=> b!1531925 m!1414593))

(declare-fun m!1414595 () Bool)

(assert (=> b!1531925 m!1414595))

(declare-fun m!1414597 () Bool)

(assert (=> b!1531923 m!1414597))

(assert (=> b!1531923 m!1414597))

(declare-fun m!1414599 () Bool)

(assert (=> b!1531923 m!1414599))

(assert (=> b!1531920 m!1414597))

(assert (=> b!1531920 m!1414597))

(declare-fun m!1414601 () Bool)

(assert (=> b!1531920 m!1414601))

(declare-fun m!1414603 () Bool)

(assert (=> b!1531920 m!1414603))

(declare-fun m!1414605 () Bool)

(assert (=> b!1531920 m!1414605))

(assert (=> b!1531917 m!1414597))

(assert (=> b!1531917 m!1414597))

(declare-fun m!1414607 () Bool)

(assert (=> b!1531917 m!1414607))

(assert (=> b!1531917 m!1414607))

(assert (=> b!1531917 m!1414597))

(declare-fun m!1414609 () Bool)

(assert (=> b!1531917 m!1414609))

(declare-fun m!1414611 () Bool)

(assert (=> start!130536 m!1414611))

(declare-fun m!1414613 () Bool)

(assert (=> start!130536 m!1414613))

(declare-fun m!1414615 () Bool)

(assert (=> b!1531926 m!1414615))

(declare-fun m!1414617 () Bool)

(assert (=> b!1531924 m!1414617))

(declare-fun m!1414619 () Bool)

(assert (=> b!1531928 m!1414619))

(assert (=> b!1531928 m!1414619))

(declare-fun m!1414621 () Bool)

(assert (=> b!1531928 m!1414621))

(assert (=> b!1531927 m!1414597))

(assert (=> b!1531927 m!1414597))

(declare-fun m!1414623 () Bool)

(assert (=> b!1531927 m!1414623))

(assert (=> b!1531922 m!1414597))

(declare-fun m!1414625 () Bool)

(assert (=> b!1531922 m!1414625))

(declare-fun m!1414627 () Bool)

(assert (=> b!1531922 m!1414627))

(assert (=> b!1531918 m!1414597))

(assert (=> b!1531918 m!1414597))

(declare-fun m!1414629 () Bool)

(assert (=> b!1531918 m!1414629))

(declare-fun m!1414631 () Bool)

(assert (=> b!1531915 m!1414631))

(assert (=> b!1531919 m!1414597))

(assert (=> b!1531919 m!1414597))

(declare-fun m!1414633 () Bool)

(assert (=> b!1531919 m!1414633))

(push 1)

