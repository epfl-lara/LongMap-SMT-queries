; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129106 () Bool)

(assert start!129106)

(declare-fun b!1514875 () Bool)

(declare-fun res!1034790 () Bool)

(declare-fun e!845390 () Bool)

(assert (=> b!1514875 (=> (not res!1034790) (not e!845390))))

(declare-datatypes ((array!100962 0))(
  ( (array!100963 (arr!48718 (Array (_ BitVec 32) (_ BitVec 64))) (size!49268 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100962)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514875 (= res!1034790 (validKeyInArray!0 (select (arr!48718 a!2804) i!961)))))

(declare-fun res!1034785 () Bool)

(assert (=> start!129106 (=> (not res!1034785) (not e!845390))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129106 (= res!1034785 (validMask!0 mask!2512))))

(assert (=> start!129106 e!845390))

(assert (=> start!129106 true))

(declare-fun array_inv!37746 (array!100962) Bool)

(assert (=> start!129106 (array_inv!37746 a!2804)))

(declare-fun b!1514876 () Bool)

(declare-fun e!845386 () Bool)

(declare-fun e!845389 () Bool)

(assert (=> b!1514876 (= e!845386 e!845389)))

(declare-fun res!1034788 () Bool)

(assert (=> b!1514876 (=> (not res!1034788) (not e!845389))))

(declare-datatypes ((SeekEntryResult!12889 0))(
  ( (MissingZero!12889 (index!53951 (_ BitVec 32))) (Found!12889 (index!53952 (_ BitVec 32))) (Intermediate!12889 (undefined!13701 Bool) (index!53953 (_ BitVec 32)) (x!135655 (_ BitVec 32))) (Undefined!12889) (MissingVacant!12889 (index!53954 (_ BitVec 32))) )
))
(declare-fun lt!656492 () SeekEntryResult!12889)

(declare-fun lt!656494 () array!100962)

(declare-fun lt!656491 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100962 (_ BitVec 32)) SeekEntryResult!12889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514876 (= res!1034788 (= lt!656492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656491 mask!2512) lt!656491 lt!656494 mask!2512)))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1514876 (= lt!656491 (select (store (arr!48718 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514876 (= lt!656494 (array!100963 (store (arr!48718 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49268 a!2804)))))

(declare-fun b!1514877 () Bool)

(declare-fun res!1034779 () Bool)

(assert (=> b!1514877 (=> (not res!1034779) (not e!845390))))

(declare-datatypes ((List!35201 0))(
  ( (Nil!35198) (Cons!35197 (h!36609 (_ BitVec 64)) (t!49895 List!35201)) )
))
(declare-fun arrayNoDuplicates!0 (array!100962 (_ BitVec 32) List!35201) Bool)

(assert (=> b!1514877 (= res!1034779 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35198))))

(declare-fun b!1514878 () Bool)

(assert (=> b!1514878 (= e!845390 e!845386)))

(declare-fun res!1034778 () Bool)

(assert (=> b!1514878 (=> (not res!1034778) (not e!845386))))

(declare-fun lt!656490 () SeekEntryResult!12889)

(assert (=> b!1514878 (= res!1034778 (= lt!656492 lt!656490))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514878 (= lt!656490 (Intermediate!12889 false resIndex!21 resX!21))))

(assert (=> b!1514878 (= lt!656492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48718 a!2804) j!70) mask!2512) (select (arr!48718 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514879 () Bool)

(declare-fun res!1034782 () Bool)

(assert (=> b!1514879 (=> (not res!1034782) (not e!845390))))

(assert (=> b!1514879 (= res!1034782 (and (= (size!49268 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49268 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49268 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514880 () Bool)

(declare-fun res!1034787 () Bool)

(assert (=> b!1514880 (=> (not res!1034787) (not e!845386))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1514880 (= res!1034787 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48718 a!2804) j!70) a!2804 mask!2512) lt!656490))))

(declare-fun b!1514881 () Bool)

(declare-fun e!845387 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100962 (_ BitVec 32)) SeekEntryResult!12889)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100962 (_ BitVec 32)) SeekEntryResult!12889)

(assert (=> b!1514881 (= e!845387 (= (seekEntryOrOpen!0 lt!656491 lt!656494 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656491 lt!656494 mask!2512)))))

(declare-fun b!1514882 () Bool)

(declare-fun res!1034789 () Bool)

(declare-fun e!845391 () Bool)

(assert (=> b!1514882 (=> (not res!1034789) (not e!845391))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100962 (_ BitVec 32)) SeekEntryResult!12889)

(assert (=> b!1514882 (= res!1034789 (= (seekEntry!0 (select (arr!48718 a!2804) j!70) a!2804 mask!2512) (Found!12889 j!70)))))

(declare-fun b!1514883 () Bool)

(declare-fun res!1034791 () Bool)

(assert (=> b!1514883 (=> (not res!1034791) (not e!845390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100962 (_ BitVec 32)) Bool)

(assert (=> b!1514883 (= res!1034791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514884 () Bool)

(declare-fun res!1034783 () Bool)

(assert (=> b!1514884 (=> (not res!1034783) (not e!845390))))

(assert (=> b!1514884 (= res!1034783 (validKeyInArray!0 (select (arr!48718 a!2804) j!70)))))

(declare-fun b!1514885 () Bool)

(declare-fun res!1034781 () Bool)

(assert (=> b!1514885 (=> (not res!1034781) (not e!845390))))

(assert (=> b!1514885 (= res!1034781 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49268 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49268 a!2804))))))

(declare-fun b!1514886 () Bool)

(declare-fun e!845392 () Bool)

(assert (=> b!1514886 (= e!845392 e!845387)))

(declare-fun res!1034784 () Bool)

(assert (=> b!1514886 (=> (not res!1034784) (not e!845387))))

(assert (=> b!1514886 (= res!1034784 (= (seekEntryOrOpen!0 (select (arr!48718 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48718 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514887 () Bool)

(assert (=> b!1514887 (= e!845389 (not true))))

(assert (=> b!1514887 e!845391))

(declare-fun res!1034786 () Bool)

(assert (=> b!1514887 (=> (not res!1034786) (not e!845391))))

(assert (=> b!1514887 (= res!1034786 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50646 0))(
  ( (Unit!50647) )
))
(declare-fun lt!656493 () Unit!50646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50646)

(assert (=> b!1514887 (= lt!656493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514888 () Bool)

(assert (=> b!1514888 (= e!845391 e!845392)))

(declare-fun res!1034780 () Bool)

(assert (=> b!1514888 (=> res!1034780 e!845392)))

(assert (=> b!1514888 (= res!1034780 (or (not (= (select (arr!48718 a!2804) j!70) lt!656491)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48718 a!2804) index!487) (select (arr!48718 a!2804) j!70)) (not (= (select (arr!48718 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!129106 res!1034785) b!1514879))

(assert (= (and b!1514879 res!1034782) b!1514875))

(assert (= (and b!1514875 res!1034790) b!1514884))

(assert (= (and b!1514884 res!1034783) b!1514883))

(assert (= (and b!1514883 res!1034791) b!1514877))

(assert (= (and b!1514877 res!1034779) b!1514885))

(assert (= (and b!1514885 res!1034781) b!1514878))

(assert (= (and b!1514878 res!1034778) b!1514880))

(assert (= (and b!1514880 res!1034787) b!1514876))

(assert (= (and b!1514876 res!1034788) b!1514887))

(assert (= (and b!1514887 res!1034786) b!1514882))

(assert (= (and b!1514882 res!1034789) b!1514888))

(assert (= (and b!1514888 (not res!1034780)) b!1514886))

(assert (= (and b!1514886 res!1034784) b!1514881))

(declare-fun m!1397871 () Bool)

(assert (=> b!1514875 m!1397871))

(assert (=> b!1514875 m!1397871))

(declare-fun m!1397873 () Bool)

(assert (=> b!1514875 m!1397873))

(declare-fun m!1397875 () Bool)

(assert (=> b!1514882 m!1397875))

(assert (=> b!1514882 m!1397875))

(declare-fun m!1397877 () Bool)

(assert (=> b!1514882 m!1397877))

(declare-fun m!1397879 () Bool)

(assert (=> b!1514883 m!1397879))

(assert (=> b!1514880 m!1397875))

(assert (=> b!1514880 m!1397875))

(declare-fun m!1397881 () Bool)

(assert (=> b!1514880 m!1397881))

(assert (=> b!1514886 m!1397875))

(assert (=> b!1514886 m!1397875))

(declare-fun m!1397883 () Bool)

(assert (=> b!1514886 m!1397883))

(assert (=> b!1514886 m!1397875))

(declare-fun m!1397885 () Bool)

(assert (=> b!1514886 m!1397885))

(declare-fun m!1397887 () Bool)

(assert (=> b!1514881 m!1397887))

(declare-fun m!1397889 () Bool)

(assert (=> b!1514881 m!1397889))

(assert (=> b!1514878 m!1397875))

(assert (=> b!1514878 m!1397875))

(declare-fun m!1397891 () Bool)

(assert (=> b!1514878 m!1397891))

(assert (=> b!1514878 m!1397891))

(assert (=> b!1514878 m!1397875))

(declare-fun m!1397893 () Bool)

(assert (=> b!1514878 m!1397893))

(assert (=> b!1514888 m!1397875))

(declare-fun m!1397895 () Bool)

(assert (=> b!1514888 m!1397895))

(declare-fun m!1397897 () Bool)

(assert (=> b!1514887 m!1397897))

(declare-fun m!1397899 () Bool)

(assert (=> b!1514887 m!1397899))

(declare-fun m!1397901 () Bool)

(assert (=> b!1514877 m!1397901))

(declare-fun m!1397903 () Bool)

(assert (=> b!1514876 m!1397903))

(assert (=> b!1514876 m!1397903))

(declare-fun m!1397905 () Bool)

(assert (=> b!1514876 m!1397905))

(declare-fun m!1397907 () Bool)

(assert (=> b!1514876 m!1397907))

(declare-fun m!1397909 () Bool)

(assert (=> b!1514876 m!1397909))

(assert (=> b!1514884 m!1397875))

(assert (=> b!1514884 m!1397875))

(declare-fun m!1397911 () Bool)

(assert (=> b!1514884 m!1397911))

(declare-fun m!1397913 () Bool)

(assert (=> start!129106 m!1397913))

(declare-fun m!1397915 () Bool)

(assert (=> start!129106 m!1397915))

(push 1)

