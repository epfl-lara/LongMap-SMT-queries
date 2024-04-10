; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128904 () Bool)

(assert start!128904)

(declare-fun b!1510906 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100760 0))(
  ( (array!100761 (arr!48617 (Array (_ BitVec 32) (_ BitVec 64))) (size!49167 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100760)

(declare-fun e!843630 () Bool)

(declare-datatypes ((SeekEntryResult!12788 0))(
  ( (MissingZero!12788 (index!53547 (_ BitVec 32))) (Found!12788 (index!53548 (_ BitVec 32))) (Intermediate!12788 (undefined!13600 Bool) (index!53549 (_ BitVec 32)) (x!135290 (_ BitVec 32))) (Undefined!12788) (MissingVacant!12788 (index!53550 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100760 (_ BitVec 32)) SeekEntryResult!12788)

(assert (=> b!1510906 (= e!843630 (= (seekEntry!0 (select (arr!48617 a!2804) j!70) a!2804 mask!2512) (Found!12788 j!70)))))

(declare-fun b!1510907 () Bool)

(declare-fun res!1030811 () Bool)

(declare-fun e!843628 () Bool)

(assert (=> b!1510907 (=> (not res!1030811) (not e!843628))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510907 (= res!1030811 (and (= (size!49167 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49167 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49167 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1030809 () Bool)

(assert (=> start!128904 (=> (not res!1030809) (not e!843628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128904 (= res!1030809 (validMask!0 mask!2512))))

(assert (=> start!128904 e!843628))

(assert (=> start!128904 true))

(declare-fun array_inv!37645 (array!100760) Bool)

(assert (=> start!128904 (array_inv!37645 a!2804)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun e!843629 () Bool)

(declare-fun b!1510908 () Bool)

(assert (=> b!1510908 (= e!843629 (not (or (not (= (select (arr!48617 a!2804) j!70) (select (store (arr!48617 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48617 a!2804) index!487) (select (arr!48617 a!2804) j!70)) (not (= (select (arr!48617 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1510908 e!843630))

(declare-fun res!1030816 () Bool)

(assert (=> b!1510908 (=> (not res!1030816) (not e!843630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100760 (_ BitVec 32)) Bool)

(assert (=> b!1510908 (= res!1030816 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50444 0))(
  ( (Unit!50445) )
))
(declare-fun lt!655295 () Unit!50444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50444)

(assert (=> b!1510908 (= lt!655295 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510909 () Bool)

(declare-fun res!1030812 () Bool)

(assert (=> b!1510909 (=> (not res!1030812) (not e!843628))))

(assert (=> b!1510909 (= res!1030812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510910 () Bool)

(declare-fun res!1030819 () Bool)

(assert (=> b!1510910 (=> (not res!1030819) (not e!843629))))

(declare-fun lt!655296 () SeekEntryResult!12788)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100760 (_ BitVec 32)) SeekEntryResult!12788)

(assert (=> b!1510910 (= res!1030819 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48617 a!2804) j!70) a!2804 mask!2512) lt!655296))))

(declare-fun b!1510911 () Bool)

(declare-fun res!1030818 () Bool)

(assert (=> b!1510911 (=> (not res!1030818) (not e!843628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510911 (= res!1030818 (validKeyInArray!0 (select (arr!48617 a!2804) j!70)))))

(declare-fun b!1510912 () Bool)

(declare-fun res!1030817 () Bool)

(assert (=> b!1510912 (=> (not res!1030817) (not e!843628))))

(assert (=> b!1510912 (= res!1030817 (validKeyInArray!0 (select (arr!48617 a!2804) i!961)))))

(declare-fun b!1510913 () Bool)

(declare-fun res!1030814 () Bool)

(assert (=> b!1510913 (=> (not res!1030814) (not e!843628))))

(declare-datatypes ((List!35100 0))(
  ( (Nil!35097) (Cons!35096 (h!36508 (_ BitVec 64)) (t!49794 List!35100)) )
))
(declare-fun arrayNoDuplicates!0 (array!100760 (_ BitVec 32) List!35100) Bool)

(assert (=> b!1510913 (= res!1030814 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35097))))

(declare-fun b!1510914 () Bool)

(declare-fun res!1030810 () Bool)

(assert (=> b!1510914 (=> (not res!1030810) (not e!843628))))

(assert (=> b!1510914 (= res!1030810 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49167 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49167 a!2804))))))

(declare-fun b!1510915 () Bool)

(declare-fun res!1030815 () Bool)

(assert (=> b!1510915 (=> (not res!1030815) (not e!843629))))

(declare-fun lt!655297 () SeekEntryResult!12788)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510915 (= res!1030815 (= lt!655297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48617 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48617 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100761 (store (arr!48617 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49167 a!2804)) mask!2512)))))

(declare-fun b!1510916 () Bool)

(assert (=> b!1510916 (= e!843628 e!843629)))

(declare-fun res!1030813 () Bool)

(assert (=> b!1510916 (=> (not res!1030813) (not e!843629))))

(assert (=> b!1510916 (= res!1030813 (= lt!655297 lt!655296))))

(assert (=> b!1510916 (= lt!655296 (Intermediate!12788 false resIndex!21 resX!21))))

(assert (=> b!1510916 (= lt!655297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48617 a!2804) j!70) mask!2512) (select (arr!48617 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!128904 res!1030809) b!1510907))

(assert (= (and b!1510907 res!1030811) b!1510912))

(assert (= (and b!1510912 res!1030817) b!1510911))

(assert (= (and b!1510911 res!1030818) b!1510909))

(assert (= (and b!1510909 res!1030812) b!1510913))

(assert (= (and b!1510913 res!1030814) b!1510914))

(assert (= (and b!1510914 res!1030810) b!1510916))

(assert (= (and b!1510916 res!1030813) b!1510910))

(assert (= (and b!1510910 res!1030819) b!1510915))

(assert (= (and b!1510915 res!1030815) b!1510908))

(assert (= (and b!1510908 res!1030816) b!1510906))

(declare-fun m!1393543 () Bool)

(assert (=> b!1510913 m!1393543))

(declare-fun m!1393545 () Bool)

(assert (=> b!1510908 m!1393545))

(declare-fun m!1393547 () Bool)

(assert (=> b!1510908 m!1393547))

(declare-fun m!1393549 () Bool)

(assert (=> b!1510908 m!1393549))

(declare-fun m!1393551 () Bool)

(assert (=> b!1510908 m!1393551))

(declare-fun m!1393553 () Bool)

(assert (=> b!1510908 m!1393553))

(declare-fun m!1393555 () Bool)

(assert (=> b!1510908 m!1393555))

(declare-fun m!1393557 () Bool)

(assert (=> start!128904 m!1393557))

(declare-fun m!1393559 () Bool)

(assert (=> start!128904 m!1393559))

(assert (=> b!1510911 m!1393545))

(assert (=> b!1510911 m!1393545))

(declare-fun m!1393561 () Bool)

(assert (=> b!1510911 m!1393561))

(assert (=> b!1510906 m!1393545))

(assert (=> b!1510906 m!1393545))

(declare-fun m!1393563 () Bool)

(assert (=> b!1510906 m!1393563))

(assert (=> b!1510910 m!1393545))

(assert (=> b!1510910 m!1393545))

(declare-fun m!1393565 () Bool)

(assert (=> b!1510910 m!1393565))

(assert (=> b!1510915 m!1393549))

(assert (=> b!1510915 m!1393553))

(assert (=> b!1510915 m!1393553))

(declare-fun m!1393567 () Bool)

(assert (=> b!1510915 m!1393567))

(assert (=> b!1510915 m!1393567))

(assert (=> b!1510915 m!1393553))

(declare-fun m!1393569 () Bool)

(assert (=> b!1510915 m!1393569))

(declare-fun m!1393571 () Bool)

(assert (=> b!1510909 m!1393571))

(declare-fun m!1393573 () Bool)

(assert (=> b!1510912 m!1393573))

(assert (=> b!1510912 m!1393573))

(declare-fun m!1393575 () Bool)

(assert (=> b!1510912 m!1393575))

(assert (=> b!1510916 m!1393545))

(assert (=> b!1510916 m!1393545))

(declare-fun m!1393577 () Bool)

(assert (=> b!1510916 m!1393577))

(assert (=> b!1510916 m!1393577))

(assert (=> b!1510916 m!1393545))

(declare-fun m!1393579 () Bool)

(assert (=> b!1510916 m!1393579))

(push 1)

