; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128902 () Bool)

(assert start!128902)

(declare-fun b!1510873 () Bool)

(declare-fun e!843617 () Bool)

(assert (=> b!1510873 (= e!843617 (not true))))

(declare-fun e!843616 () Bool)

(assert (=> b!1510873 e!843616))

(declare-fun res!1030786 () Bool)

(assert (=> b!1510873 (=> (not res!1030786) (not e!843616))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100758 0))(
  ( (array!100759 (arr!48616 (Array (_ BitVec 32) (_ BitVec 64))) (size!49166 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100758)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100758 (_ BitVec 32)) Bool)

(assert (=> b!1510873 (= res!1030786 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50442 0))(
  ( (Unit!50443) )
))
(declare-fun lt!655286 () Unit!50442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50442)

(assert (=> b!1510873 (= lt!655286 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510874 () Bool)

(declare-fun res!1030781 () Bool)

(declare-fun e!843619 () Bool)

(assert (=> b!1510874 (=> (not res!1030781) (not e!843619))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510874 (= res!1030781 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49166 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49166 a!2804))))))

(declare-fun b!1510875 () Bool)

(declare-fun res!1030777 () Bool)

(assert (=> b!1510875 (=> (not res!1030777) (not e!843619))))

(assert (=> b!1510875 (= res!1030777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1030783 () Bool)

(assert (=> start!128902 (=> (not res!1030783) (not e!843619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128902 (= res!1030783 (validMask!0 mask!2512))))

(assert (=> start!128902 e!843619))

(assert (=> start!128902 true))

(declare-fun array_inv!37644 (array!100758) Bool)

(assert (=> start!128902 (array_inv!37644 a!2804)))

(declare-fun b!1510876 () Bool)

(declare-fun res!1030780 () Bool)

(assert (=> b!1510876 (=> (not res!1030780) (not e!843619))))

(declare-datatypes ((List!35099 0))(
  ( (Nil!35096) (Cons!35095 (h!36507 (_ BitVec 64)) (t!49793 List!35099)) )
))
(declare-fun arrayNoDuplicates!0 (array!100758 (_ BitVec 32) List!35099) Bool)

(assert (=> b!1510876 (= res!1030780 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35096))))

(declare-fun b!1510877 () Bool)

(assert (=> b!1510877 (= e!843619 e!843617)))

(declare-fun res!1030779 () Bool)

(assert (=> b!1510877 (=> (not res!1030779) (not e!843617))))

(declare-datatypes ((SeekEntryResult!12787 0))(
  ( (MissingZero!12787 (index!53543 (_ BitVec 32))) (Found!12787 (index!53544 (_ BitVec 32))) (Intermediate!12787 (undefined!13599 Bool) (index!53545 (_ BitVec 32)) (x!135281 (_ BitVec 32))) (Undefined!12787) (MissingVacant!12787 (index!53546 (_ BitVec 32))) )
))
(declare-fun lt!655288 () SeekEntryResult!12787)

(declare-fun lt!655287 () SeekEntryResult!12787)

(assert (=> b!1510877 (= res!1030779 (= lt!655288 lt!655287))))

(assert (=> b!1510877 (= lt!655287 (Intermediate!12787 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100758 (_ BitVec 32)) SeekEntryResult!12787)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510877 (= lt!655288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48616 a!2804) j!70) mask!2512) (select (arr!48616 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510878 () Bool)

(declare-fun res!1030776 () Bool)

(assert (=> b!1510878 (=> (not res!1030776) (not e!843619))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510878 (= res!1030776 (validKeyInArray!0 (select (arr!48616 a!2804) i!961)))))

(declare-fun b!1510879 () Bool)

(declare-fun res!1030782 () Bool)

(assert (=> b!1510879 (=> (not res!1030782) (not e!843619))))

(assert (=> b!1510879 (= res!1030782 (and (= (size!49166 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49166 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49166 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510880 () Bool)

(declare-fun res!1030784 () Bool)

(assert (=> b!1510880 (=> (not res!1030784) (not e!843617))))

(assert (=> b!1510880 (= res!1030784 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48616 a!2804) j!70) a!2804 mask!2512) lt!655287))))

(declare-fun b!1510881 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100758 (_ BitVec 32)) SeekEntryResult!12787)

(assert (=> b!1510881 (= e!843616 (= (seekEntry!0 (select (arr!48616 a!2804) j!70) a!2804 mask!2512) (Found!12787 j!70)))))

(declare-fun b!1510882 () Bool)

(declare-fun res!1030778 () Bool)

(assert (=> b!1510882 (=> (not res!1030778) (not e!843617))))

(assert (=> b!1510882 (= res!1030778 (= lt!655288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100759 (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49166 a!2804)) mask!2512)))))

(declare-fun b!1510883 () Bool)

(declare-fun res!1030785 () Bool)

(assert (=> b!1510883 (=> (not res!1030785) (not e!843619))))

(assert (=> b!1510883 (= res!1030785 (validKeyInArray!0 (select (arr!48616 a!2804) j!70)))))

(assert (= (and start!128902 res!1030783) b!1510879))

(assert (= (and b!1510879 res!1030782) b!1510878))

(assert (= (and b!1510878 res!1030776) b!1510883))

(assert (= (and b!1510883 res!1030785) b!1510875))

(assert (= (and b!1510875 res!1030777) b!1510876))

(assert (= (and b!1510876 res!1030780) b!1510874))

(assert (= (and b!1510874 res!1030781) b!1510877))

(assert (= (and b!1510877 res!1030779) b!1510880))

(assert (= (and b!1510880 res!1030784) b!1510882))

(assert (= (and b!1510882 res!1030778) b!1510873))

(assert (= (and b!1510873 res!1030786) b!1510881))

(declare-fun m!1393507 () Bool)

(assert (=> start!128902 m!1393507))

(declare-fun m!1393509 () Bool)

(assert (=> start!128902 m!1393509))

(declare-fun m!1393511 () Bool)

(assert (=> b!1510875 m!1393511))

(declare-fun m!1393513 () Bool)

(assert (=> b!1510881 m!1393513))

(assert (=> b!1510881 m!1393513))

(declare-fun m!1393515 () Bool)

(assert (=> b!1510881 m!1393515))

(assert (=> b!1510877 m!1393513))

(assert (=> b!1510877 m!1393513))

(declare-fun m!1393517 () Bool)

(assert (=> b!1510877 m!1393517))

(assert (=> b!1510877 m!1393517))

(assert (=> b!1510877 m!1393513))

(declare-fun m!1393519 () Bool)

(assert (=> b!1510877 m!1393519))

(declare-fun m!1393521 () Bool)

(assert (=> b!1510878 m!1393521))

(assert (=> b!1510878 m!1393521))

(declare-fun m!1393523 () Bool)

(assert (=> b!1510878 m!1393523))

(declare-fun m!1393525 () Bool)

(assert (=> b!1510882 m!1393525))

(declare-fun m!1393527 () Bool)

(assert (=> b!1510882 m!1393527))

(assert (=> b!1510882 m!1393527))

(declare-fun m!1393529 () Bool)

(assert (=> b!1510882 m!1393529))

(assert (=> b!1510882 m!1393529))

(assert (=> b!1510882 m!1393527))

(declare-fun m!1393531 () Bool)

(assert (=> b!1510882 m!1393531))

(declare-fun m!1393533 () Bool)

(assert (=> b!1510873 m!1393533))

(declare-fun m!1393535 () Bool)

(assert (=> b!1510873 m!1393535))

(assert (=> b!1510883 m!1393513))

(assert (=> b!1510883 m!1393513))

(declare-fun m!1393537 () Bool)

(assert (=> b!1510883 m!1393537))

(declare-fun m!1393539 () Bool)

(assert (=> b!1510876 m!1393539))

(assert (=> b!1510880 m!1393513))

(assert (=> b!1510880 m!1393513))

(declare-fun m!1393541 () Bool)

(assert (=> b!1510880 m!1393541))

(push 1)

(assert (not b!1510875))

(assert (not b!1510877))

