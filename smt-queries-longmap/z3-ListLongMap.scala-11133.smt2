; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130096 () Bool)

(assert start!130096)

(declare-fun res!1044938 () Bool)

(declare-fun e!851062 () Bool)

(assert (=> start!130096 (=> (not res!1044938) (not e!851062))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130096 (= res!1044938 (validMask!0 mask!2512))))

(assert (=> start!130096 e!851062))

(assert (=> start!130096 true))

(declare-datatypes ((array!101509 0))(
  ( (array!101510 (arr!48981 (Array (_ BitVec 32) (_ BitVec 64))) (size!49531 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101509)

(declare-fun array_inv!38009 (array!101509) Bool)

(assert (=> start!130096 (array_inv!38009 a!2804)))

(declare-fun b!1526902 () Bool)

(declare-fun res!1044941 () Bool)

(assert (=> b!1526902 (=> (not res!1044941) (not e!851062))))

(declare-datatypes ((List!35464 0))(
  ( (Nil!35461) (Cons!35460 (h!36893 (_ BitVec 64)) (t!50158 List!35464)) )
))
(declare-fun arrayNoDuplicates!0 (array!101509 (_ BitVec 32) List!35464) Bool)

(assert (=> b!1526902 (= res!1044941 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35461))))

(declare-fun b!1526903 () Bool)

(declare-fun res!1044936 () Bool)

(assert (=> b!1526903 (=> (not res!1044936) (not e!851062))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1526903 (= res!1044936 (and (= (size!49531 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49531 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49531 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526904 () Bool)

(declare-fun res!1044940 () Bool)

(assert (=> b!1526904 (=> (not res!1044940) (not e!851062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526904 (= res!1044940 (validKeyInArray!0 (select (arr!48981 a!2804) i!961)))))

(declare-fun b!1526905 () Bool)

(declare-fun res!1044944 () Bool)

(assert (=> b!1526905 (=> (not res!1044944) (not e!851062))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1526905 (= res!1044944 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49531 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49531 a!2804))))))

(declare-fun b!1526906 () Bool)

(declare-fun e!851064 () Bool)

(assert (=> b!1526906 (= e!851062 e!851064)))

(declare-fun res!1044942 () Bool)

(assert (=> b!1526906 (=> (not res!1044942) (not e!851064))))

(declare-datatypes ((SeekEntryResult!13146 0))(
  ( (MissingZero!13146 (index!54979 (_ BitVec 32))) (Found!13146 (index!54980 (_ BitVec 32))) (Intermediate!13146 (undefined!13958 Bool) (index!54981 (_ BitVec 32)) (x!136672 (_ BitVec 32))) (Undefined!13146) (MissingVacant!13146 (index!54982 (_ BitVec 32))) )
))
(declare-fun lt!661242 () SeekEntryResult!13146)

(declare-fun lt!661243 () SeekEntryResult!13146)

(assert (=> b!1526906 (= res!1044942 (= lt!661242 lt!661243))))

(assert (=> b!1526906 (= lt!661243 (Intermediate!13146 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101509 (_ BitVec 32)) SeekEntryResult!13146)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526906 (= lt!661242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48981 a!2804) j!70) mask!2512) (select (arr!48981 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526907 () Bool)

(declare-fun res!1044943 () Bool)

(assert (=> b!1526907 (=> (not res!1044943) (not e!851062))))

(assert (=> b!1526907 (= res!1044943 (validKeyInArray!0 (select (arr!48981 a!2804) j!70)))))

(declare-fun b!1526908 () Bool)

(declare-fun e!851067 () Bool)

(declare-fun lt!661240 () (_ BitVec 64))

(declare-fun lt!661241 () array!101509)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101509 (_ BitVec 32)) SeekEntryResult!13146)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101509 (_ BitVec 32)) SeekEntryResult!13146)

(assert (=> b!1526908 (= e!851067 (= (seekEntryOrOpen!0 lt!661240 lt!661241 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661240 lt!661241 mask!2512)))))

(declare-fun b!1526909 () Bool)

(declare-fun res!1044945 () Bool)

(declare-fun e!851066 () Bool)

(assert (=> b!1526909 (=> (not res!1044945) (not e!851066))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101509 (_ BitVec 32)) SeekEntryResult!13146)

(assert (=> b!1526909 (= res!1044945 (= (seekEntry!0 (select (arr!48981 a!2804) j!70) a!2804 mask!2512) (Found!13146 j!70)))))

(declare-fun b!1526910 () Bool)

(declare-fun res!1044949 () Bool)

(assert (=> b!1526910 (=> (not res!1044949) (not e!851062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101509 (_ BitVec 32)) Bool)

(assert (=> b!1526910 (= res!1044949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526911 () Bool)

(declare-fun e!851068 () Bool)

(assert (=> b!1526911 (= e!851068 e!851067)))

(declare-fun res!1044946 () Bool)

(assert (=> b!1526911 (=> (not res!1044946) (not e!851067))))

(assert (=> b!1526911 (= res!1044946 (= (seekEntryOrOpen!0 (select (arr!48981 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48981 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526912 () Bool)

(assert (=> b!1526912 (= e!851066 e!851068)))

(declare-fun res!1044937 () Bool)

(assert (=> b!1526912 (=> res!1044937 e!851068)))

(assert (=> b!1526912 (= res!1044937 (or (not (= (select (arr!48981 a!2804) j!70) lt!661240)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48981 a!2804) index!487) (select (arr!48981 a!2804) j!70)) (not (= (select (arr!48981 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526913 () Bool)

(declare-fun e!851065 () Bool)

(assert (=> b!1526913 (= e!851065 (not true))))

(assert (=> b!1526913 e!851066))

(declare-fun res!1044947 () Bool)

(assert (=> b!1526913 (=> (not res!1044947) (not e!851066))))

(assert (=> b!1526913 (= res!1044947 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51076 0))(
  ( (Unit!51077) )
))
(declare-fun lt!661239 () Unit!51076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51076)

(assert (=> b!1526913 (= lt!661239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526914 () Bool)

(assert (=> b!1526914 (= e!851064 e!851065)))

(declare-fun res!1044939 () Bool)

(assert (=> b!1526914 (=> (not res!1044939) (not e!851065))))

(assert (=> b!1526914 (= res!1044939 (= lt!661242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661240 mask!2512) lt!661240 lt!661241 mask!2512)))))

(assert (=> b!1526914 (= lt!661240 (select (store (arr!48981 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526914 (= lt!661241 (array!101510 (store (arr!48981 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49531 a!2804)))))

(declare-fun b!1526915 () Bool)

(declare-fun res!1044948 () Bool)

(assert (=> b!1526915 (=> (not res!1044948) (not e!851064))))

(assert (=> b!1526915 (= res!1044948 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48981 a!2804) j!70) a!2804 mask!2512) lt!661243))))

(assert (= (and start!130096 res!1044938) b!1526903))

(assert (= (and b!1526903 res!1044936) b!1526904))

(assert (= (and b!1526904 res!1044940) b!1526907))

(assert (= (and b!1526907 res!1044943) b!1526910))

(assert (= (and b!1526910 res!1044949) b!1526902))

(assert (= (and b!1526902 res!1044941) b!1526905))

(assert (= (and b!1526905 res!1044944) b!1526906))

(assert (= (and b!1526906 res!1044942) b!1526915))

(assert (= (and b!1526915 res!1044948) b!1526914))

(assert (= (and b!1526914 res!1044939) b!1526913))

(assert (= (and b!1526913 res!1044947) b!1526909))

(assert (= (and b!1526909 res!1044945) b!1526912))

(assert (= (and b!1526912 (not res!1044937)) b!1526911))

(assert (= (and b!1526911 res!1044946) b!1526908))

(declare-fun m!1409749 () Bool)

(assert (=> start!130096 m!1409749))

(declare-fun m!1409751 () Bool)

(assert (=> start!130096 m!1409751))

(declare-fun m!1409753 () Bool)

(assert (=> b!1526910 m!1409753))

(declare-fun m!1409755 () Bool)

(assert (=> b!1526912 m!1409755))

(declare-fun m!1409757 () Bool)

(assert (=> b!1526912 m!1409757))

(assert (=> b!1526909 m!1409755))

(assert (=> b!1526909 m!1409755))

(declare-fun m!1409759 () Bool)

(assert (=> b!1526909 m!1409759))

(declare-fun m!1409761 () Bool)

(assert (=> b!1526913 m!1409761))

(declare-fun m!1409763 () Bool)

(assert (=> b!1526913 m!1409763))

(assert (=> b!1526906 m!1409755))

(assert (=> b!1526906 m!1409755))

(declare-fun m!1409765 () Bool)

(assert (=> b!1526906 m!1409765))

(assert (=> b!1526906 m!1409765))

(assert (=> b!1526906 m!1409755))

(declare-fun m!1409767 () Bool)

(assert (=> b!1526906 m!1409767))

(assert (=> b!1526911 m!1409755))

(assert (=> b!1526911 m!1409755))

(declare-fun m!1409769 () Bool)

(assert (=> b!1526911 m!1409769))

(assert (=> b!1526911 m!1409755))

(declare-fun m!1409771 () Bool)

(assert (=> b!1526911 m!1409771))

(assert (=> b!1526907 m!1409755))

(assert (=> b!1526907 m!1409755))

(declare-fun m!1409773 () Bool)

(assert (=> b!1526907 m!1409773))

(declare-fun m!1409775 () Bool)

(assert (=> b!1526914 m!1409775))

(assert (=> b!1526914 m!1409775))

(declare-fun m!1409777 () Bool)

(assert (=> b!1526914 m!1409777))

(declare-fun m!1409779 () Bool)

(assert (=> b!1526914 m!1409779))

(declare-fun m!1409781 () Bool)

(assert (=> b!1526914 m!1409781))

(declare-fun m!1409783 () Bool)

(assert (=> b!1526902 m!1409783))

(declare-fun m!1409785 () Bool)

(assert (=> b!1526904 m!1409785))

(assert (=> b!1526904 m!1409785))

(declare-fun m!1409787 () Bool)

(assert (=> b!1526904 m!1409787))

(declare-fun m!1409789 () Bool)

(assert (=> b!1526908 m!1409789))

(declare-fun m!1409791 () Bool)

(assert (=> b!1526908 m!1409791))

(assert (=> b!1526915 m!1409755))

(assert (=> b!1526915 m!1409755))

(declare-fun m!1409793 () Bool)

(assert (=> b!1526915 m!1409793))

(check-sat (not b!1526908) (not b!1526907) (not b!1526909) (not b!1526915) (not b!1526911) (not start!130096) (not b!1526910) (not b!1526906) (not b!1526902) (not b!1526914) (not b!1526904) (not b!1526913))
(check-sat)
