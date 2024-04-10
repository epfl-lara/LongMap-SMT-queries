; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129804 () Bool)

(assert start!129804)

(declare-fun b!1523751 () Bool)

(declare-fun e!849465 () Bool)

(declare-fun e!849468 () Bool)

(assert (=> b!1523751 (= e!849465 e!849468)))

(declare-fun res!1042661 () Bool)

(assert (=> b!1523751 (=> (not res!1042661) (not e!849468))))

(declare-datatypes ((SeekEntryResult!13096 0))(
  ( (MissingZero!13096 (index!54779 (_ BitVec 32))) (Found!13096 (index!54780 (_ BitVec 32))) (Intermediate!13096 (undefined!13908 Bool) (index!54781 (_ BitVec 32)) (x!136462 (_ BitVec 32))) (Undefined!13096) (MissingVacant!13096 (index!54782 (_ BitVec 32))) )
))
(declare-fun lt!660051 () SeekEntryResult!13096)

(declare-fun lt!660052 () SeekEntryResult!13096)

(assert (=> b!1523751 (= res!1042661 (= lt!660051 lt!660052))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523751 (= lt!660052 (Intermediate!13096 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101400 0))(
  ( (array!101401 (arr!48931 (Array (_ BitVec 32) (_ BitVec 64))) (size!49481 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101400)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101400 (_ BitVec 32)) SeekEntryResult!13096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523751 (= lt!660051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) (select (arr!48931 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1042666 () Bool)

(assert (=> start!129804 (=> (not res!1042666) (not e!849465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129804 (= res!1042666 (validMask!0 mask!2512))))

(assert (=> start!129804 e!849465))

(assert (=> start!129804 true))

(declare-fun array_inv!37959 (array!101400) Bool)

(assert (=> start!129804 (array_inv!37959 a!2804)))

(declare-fun b!1523752 () Bool)

(declare-fun res!1042665 () Bool)

(assert (=> b!1523752 (=> (not res!1042665) (not e!849465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101400 (_ BitVec 32)) Bool)

(assert (=> b!1523752 (= res!1042665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523753 () Bool)

(declare-fun e!849469 () Bool)

(assert (=> b!1523753 (= e!849468 e!849469)))

(declare-fun res!1042669 () Bool)

(assert (=> b!1523753 (=> (not res!1042669) (not e!849469))))

(declare-fun lt!660053 () (_ BitVec 64))

(declare-fun lt!660055 () array!101400)

(assert (=> b!1523753 (= res!1042669 (= lt!660051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660053 mask!2512) lt!660053 lt!660055 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523753 (= lt!660053 (select (store (arr!48931 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1523753 (= lt!660055 (array!101401 (store (arr!48931 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49481 a!2804)))))

(declare-fun b!1523754 () Bool)

(declare-fun res!1042664 () Bool)

(assert (=> b!1523754 (=> (not res!1042664) (not e!849465))))

(declare-datatypes ((List!35414 0))(
  ( (Nil!35411) (Cons!35410 (h!36834 (_ BitVec 64)) (t!50108 List!35414)) )
))
(declare-fun arrayNoDuplicates!0 (array!101400 (_ BitVec 32) List!35414) Bool)

(assert (=> b!1523754 (= res!1042664 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35411))))

(declare-fun b!1523755 () Bool)

(declare-fun res!1042667 () Bool)

(assert (=> b!1523755 (=> (not res!1042667) (not e!849465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523755 (= res!1042667 (validKeyInArray!0 (select (arr!48931 a!2804) i!961)))))

(declare-fun b!1523756 () Bool)

(declare-fun res!1042668 () Bool)

(assert (=> b!1523756 (=> (not res!1042668) (not e!849465))))

(assert (=> b!1523756 (= res!1042668 (and (= (size!49481 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49481 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49481 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!849466 () Bool)

(declare-fun b!1523757 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101400 (_ BitVec 32)) SeekEntryResult!13096)

(assert (=> b!1523757 (= e!849466 (= (seekEntry!0 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) (Found!13096 j!70)))))

(declare-fun b!1523758 () Bool)

(declare-fun e!849467 () Bool)

(assert (=> b!1523758 (= e!849469 (not e!849467))))

(declare-fun res!1042660 () Bool)

(assert (=> b!1523758 (=> res!1042660 e!849467)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523758 (= res!1042660 (or (not (= (select (arr!48931 a!2804) j!70) lt!660053)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48931 a!2804) index!487) (select (arr!48931 a!2804) j!70))) (not (= j!70 index!487))))))

(assert (=> b!1523758 e!849466))

(declare-fun res!1042659 () Bool)

(assert (=> b!1523758 (=> (not res!1042659) (not e!849466))))

(assert (=> b!1523758 (= res!1042659 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50976 0))(
  ( (Unit!50977) )
))
(declare-fun lt!660054 () Unit!50976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50976)

(assert (=> b!1523758 (= lt!660054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523759 () Bool)

(declare-fun res!1042658 () Bool)

(assert (=> b!1523759 (=> (not res!1042658) (not e!849468))))

(assert (=> b!1523759 (= res!1042658 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) lt!660052))))

(declare-fun b!1523760 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101400 (_ BitVec 32)) SeekEntryResult!13096)

(assert (=> b!1523760 (= e!849467 (= (seekEntryOrOpen!0 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!660053 lt!660055 mask!2512)))))

(declare-fun b!1523761 () Bool)

(declare-fun res!1042662 () Bool)

(assert (=> b!1523761 (=> (not res!1042662) (not e!849465))))

(assert (=> b!1523761 (= res!1042662 (validKeyInArray!0 (select (arr!48931 a!2804) j!70)))))

(declare-fun b!1523762 () Bool)

(declare-fun res!1042663 () Bool)

(assert (=> b!1523762 (=> (not res!1042663) (not e!849465))))

(assert (=> b!1523762 (= res!1042663 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49481 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49481 a!2804))))))

(assert (= (and start!129804 res!1042666) b!1523756))

(assert (= (and b!1523756 res!1042668) b!1523755))

(assert (= (and b!1523755 res!1042667) b!1523761))

(assert (= (and b!1523761 res!1042662) b!1523752))

(assert (= (and b!1523752 res!1042665) b!1523754))

(assert (= (and b!1523754 res!1042664) b!1523762))

(assert (= (and b!1523762 res!1042663) b!1523751))

(assert (= (and b!1523751 res!1042661) b!1523759))

(assert (= (and b!1523759 res!1042658) b!1523753))

(assert (= (and b!1523753 res!1042669) b!1523758))

(assert (= (and b!1523758 res!1042659) b!1523757))

(assert (= (and b!1523758 (not res!1042660)) b!1523760))

(declare-fun m!1406901 () Bool)

(assert (=> b!1523758 m!1406901))

(declare-fun m!1406903 () Bool)

(assert (=> b!1523758 m!1406903))

(declare-fun m!1406905 () Bool)

(assert (=> b!1523758 m!1406905))

(declare-fun m!1406907 () Bool)

(assert (=> b!1523758 m!1406907))

(assert (=> b!1523757 m!1406901))

(assert (=> b!1523757 m!1406901))

(declare-fun m!1406909 () Bool)

(assert (=> b!1523757 m!1406909))

(declare-fun m!1406911 () Bool)

(assert (=> b!1523755 m!1406911))

(assert (=> b!1523755 m!1406911))

(declare-fun m!1406913 () Bool)

(assert (=> b!1523755 m!1406913))

(declare-fun m!1406915 () Bool)

(assert (=> start!129804 m!1406915))

(declare-fun m!1406917 () Bool)

(assert (=> start!129804 m!1406917))

(declare-fun m!1406919 () Bool)

(assert (=> b!1523754 m!1406919))

(declare-fun m!1406921 () Bool)

(assert (=> b!1523753 m!1406921))

(assert (=> b!1523753 m!1406921))

(declare-fun m!1406923 () Bool)

(assert (=> b!1523753 m!1406923))

(declare-fun m!1406925 () Bool)

(assert (=> b!1523753 m!1406925))

(declare-fun m!1406927 () Bool)

(assert (=> b!1523753 m!1406927))

(assert (=> b!1523759 m!1406901))

(assert (=> b!1523759 m!1406901))

(declare-fun m!1406929 () Bool)

(assert (=> b!1523759 m!1406929))

(assert (=> b!1523761 m!1406901))

(assert (=> b!1523761 m!1406901))

(declare-fun m!1406931 () Bool)

(assert (=> b!1523761 m!1406931))

(declare-fun m!1406933 () Bool)

(assert (=> b!1523752 m!1406933))

(assert (=> b!1523760 m!1406901))

(assert (=> b!1523760 m!1406901))

(declare-fun m!1406935 () Bool)

(assert (=> b!1523760 m!1406935))

(declare-fun m!1406937 () Bool)

(assert (=> b!1523760 m!1406937))

(assert (=> b!1523751 m!1406901))

(assert (=> b!1523751 m!1406901))

(declare-fun m!1406939 () Bool)

(assert (=> b!1523751 m!1406939))

(assert (=> b!1523751 m!1406939))

(assert (=> b!1523751 m!1406901))

(declare-fun m!1406941 () Bool)

(assert (=> b!1523751 m!1406941))

(push 1)

(assert (not b!1523753))

(assert (not b!1523759))

(assert (not b!1523752))

(assert (not b!1523751))

(assert (not b!1523754))

(assert (not start!129804))

(assert (not b!1523758))

(assert (not b!1523755))

(assert (not b!1523757))

(assert (not b!1523760))

(assert (not b!1523761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1523859 () Bool)

(declare-fun e!849525 () SeekEntryResult!13096)

(assert (=> b!1523859 (= e!849525 Undefined!13096)))

(declare-fun d!159261 () Bool)

(declare-fun lt!660095 () SeekEntryResult!13096)

(assert (=> d!159261 (and (or (is-MissingVacant!13096 lt!660095) (not (is-Found!13096 lt!660095)) (and (bvsge (index!54780 lt!660095) #b00000000000000000000000000000000) (bvslt (index!54780 lt!660095) (size!49481 a!2804)))) (not (is-MissingVacant!13096 lt!660095)) (or (not (is-Found!13096 lt!660095)) (= (select (arr!48931 a!2804) (index!54780 lt!660095)) (select (arr!48931 a!2804) j!70))))))

(assert (=> d!159261 (= lt!660095 e!849525)))

(declare-fun c!140133 () Bool)

(declare-fun lt!660096 () SeekEntryResult!13096)

(assert (=> d!159261 (= c!140133 (and (is-Intermediate!13096 lt!660096) (undefined!13908 lt!660096)))))

(assert (=> d!159261 (= lt!660096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) (select (arr!48931 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159261 (validMask!0 mask!2512)))

(assert (=> d!159261 (= (seekEntry!0 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) lt!660095)))

(declare-fun b!1523860 () Bool)

(declare-fun e!849524 () SeekEntryResult!13096)

(assert (=> b!1523860 (= e!849524 (Found!13096 (index!54781 lt!660096)))))

(declare-fun b!1523861 () Bool)

(assert (=> b!1523861 (= e!849525 e!849524)))

(declare-fun lt!660097 () (_ BitVec 64))

(assert (=> b!1523861 (= lt!660097 (select (arr!48931 a!2804) (index!54781 lt!660096)))))

(declare-fun c!140135 () Bool)

(assert (=> b!1523861 (= c!140135 (= lt!660097 (select (arr!48931 a!2804) j!70)))))

(declare-fun b!1523862 () Bool)

(declare-fun e!849526 () SeekEntryResult!13096)

(declare-fun lt!660094 () SeekEntryResult!13096)

(assert (=> b!1523862 (= e!849526 (ite (is-MissingVacant!13096 lt!660094) (MissingZero!13096 (index!54782 lt!660094)) lt!660094))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101400 (_ BitVec 32)) SeekEntryResult!13096)

(assert (=> b!1523862 (= lt!660094 (seekKeyOrZeroReturnVacant!0 (x!136462 lt!660096) (index!54781 lt!660096) (index!54781 lt!660096) (select (arr!48931 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523863 () Bool)

(declare-fun c!140134 () Bool)

(assert (=> b!1523863 (= c!140134 (= lt!660097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523863 (= e!849524 e!849526)))

(declare-fun b!1523864 () Bool)

(assert (=> b!1523864 (= e!849526 (MissingZero!13096 (index!54781 lt!660096)))))

(assert (= (and d!159261 c!140133) b!1523859))

(assert (= (and d!159261 (not c!140133)) b!1523861))

(assert (= (and b!1523861 c!140135) b!1523860))

(assert (= (and b!1523861 (not c!140135)) b!1523863))

(assert (= (and b!1523863 c!140134) b!1523864))

(assert (= (and b!1523863 (not c!140134)) b!1523862))

(declare-fun m!1406983 () Bool)

(assert (=> d!159261 m!1406983))

(assert (=> d!159261 m!1406901))

(assert (=> d!159261 m!1406939))

(assert (=> d!159261 m!1406939))

(assert (=> d!159261 m!1406901))

(assert (=> d!159261 m!1406941))

(assert (=> d!159261 m!1406915))

(declare-fun m!1406985 () Bool)

(assert (=> b!1523861 m!1406985))

(assert (=> b!1523862 m!1406901))

(declare-fun m!1406987 () Bool)

(assert (=> b!1523862 m!1406987))

(assert (=> b!1523757 d!159261))

(declare-fun b!1523891 () Bool)

(declare-fun e!849545 () Bool)

(declare-fun e!849544 () Bool)

(assert (=> b!1523891 (= e!849545 e!849544)))

(declare-fun c!140143 () Bool)

(assert (=> b!1523891 (= c!140143 (validKeyInArray!0 (select (arr!48931 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68412 () Bool)

(declare-fun call!68415 () Bool)

(assert (=> bm!68412 (= call!68415 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1523892 () Bool)

(declare-fun e!849546 () Bool)

(assert (=> b!1523892 (= e!849546 call!68415)))

(declare-fun d!159269 () Bool)

(declare-fun res!1042698 () Bool)

(assert (=> d!159269 (=> res!1042698 e!849545)))

(assert (=> d!159269 (= res!1042698 (bvsge #b00000000000000000000000000000000 (size!49481 a!2804)))))

(assert (=> d!159269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849545)))

(declare-fun b!1523894 () Bool)

(assert (=> b!1523894 (= e!849544 e!849546)))

(declare-fun lt!660119 () (_ BitVec 64))

(assert (=> b!1523894 (= lt!660119 (select (arr!48931 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660120 () Unit!50976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101400 (_ BitVec 64) (_ BitVec 32)) Unit!50976)

(assert (=> b!1523894 (= lt!660120 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660119 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1523894 (arrayContainsKey!0 a!2804 lt!660119 #b00000000000000000000000000000000)))

(declare-fun lt!660121 () Unit!50976)

(assert (=> b!1523894 (= lt!660121 lt!660120)))

(declare-fun res!1042699 () Bool)

(assert (=> b!1523894 (= res!1042699 (= (seekEntryOrOpen!0 (select (arr!48931 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13096 #b00000000000000000000000000000000)))))

(assert (=> b!1523894 (=> (not res!1042699) (not e!849546))))

(declare-fun b!1523896 () Bool)

(assert (=> b!1523896 (= e!849544 call!68415)))

(assert (= (and d!159269 (not res!1042698)) b!1523891))

(assert (= (and b!1523891 c!140143) b!1523894))

(assert (= (and b!1523891 (not c!140143)) b!1523896))

(assert (= (and b!1523894 res!1042699) b!1523892))

(assert (= (or b!1523892 b!1523896) bm!68412))

(declare-fun m!1407001 () Bool)

(assert (=> b!1523891 m!1407001))

(assert (=> b!1523891 m!1407001))

(declare-fun m!1407003 () Bool)

(assert (=> b!1523891 m!1407003))

(declare-fun m!1407005 () Bool)

(assert (=> bm!68412 m!1407005))

(assert (=> b!1523894 m!1407001))

(declare-fun m!1407007 () Bool)

(assert (=> b!1523894 m!1407007))

(declare-fun m!1407009 () Bool)

(assert (=> b!1523894 m!1407009))

(assert (=> b!1523894 m!1407001))

(declare-fun m!1407011 () Bool)

(assert (=> b!1523894 m!1407011))

(assert (=> b!1523752 d!159269))

(declare-fun b!1523909 () Bool)

(declare-fun e!849558 () Bool)

(declare-fun e!849557 () Bool)

(assert (=> b!1523909 (= e!849558 e!849557)))

(declare-fun c!140148 () Bool)

(assert (=> b!1523909 (= c!140148 (validKeyInArray!0 (select (arr!48931 a!2804) j!70)))))

(declare-fun bm!68413 () Bool)

(declare-fun call!68416 () Bool)

(assert (=> bm!68413 (= call!68416 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1523910 () Bool)

(declare-fun e!849559 () Bool)

(assert (=> b!1523910 (= e!849559 call!68416)))

(declare-fun d!159273 () Bool)

(declare-fun res!1042706 () Bool)

(assert (=> d!159273 (=> res!1042706 e!849558)))

(assert (=> d!159273 (= res!1042706 (bvsge j!70 (size!49481 a!2804)))))

(assert (=> d!159273 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849558)))

(declare-fun b!1523911 () Bool)

(assert (=> b!1523911 (= e!849557 e!849559)))

(declare-fun lt!660122 () (_ BitVec 64))

(assert (=> b!1523911 (= lt!660122 (select (arr!48931 a!2804) j!70))))

(declare-fun lt!660123 () Unit!50976)

(assert (=> b!1523911 (= lt!660123 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660122 j!70))))

(assert (=> b!1523911 (arrayContainsKey!0 a!2804 lt!660122 #b00000000000000000000000000000000)))

(declare-fun lt!660124 () Unit!50976)

(assert (=> b!1523911 (= lt!660124 lt!660123)))

(declare-fun res!1042707 () Bool)

(assert (=> b!1523911 (= res!1042707 (= (seekEntryOrOpen!0 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) (Found!13096 j!70)))))

(assert (=> b!1523911 (=> (not res!1042707) (not e!849559))))

(declare-fun b!1523912 () Bool)

(assert (=> b!1523912 (= e!849557 call!68416)))

(assert (= (and d!159273 (not res!1042706)) b!1523909))

(assert (= (and b!1523909 c!140148) b!1523911))

(assert (= (and b!1523909 (not c!140148)) b!1523912))

(assert (= (and b!1523911 res!1042707) b!1523910))

(assert (= (or b!1523910 b!1523912) bm!68413))

(assert (=> b!1523909 m!1406901))

(assert (=> b!1523909 m!1406901))

(assert (=> b!1523909 m!1406931))

(declare-fun m!1407013 () Bool)

(assert (=> bm!68413 m!1407013))

(assert (=> b!1523911 m!1406901))

(declare-fun m!1407015 () Bool)

(assert (=> b!1523911 m!1407015))

(declare-fun m!1407017 () Bool)

(assert (=> b!1523911 m!1407017))

(assert (=> b!1523911 m!1406901))

(assert (=> b!1523911 m!1406935))

(assert (=> b!1523758 d!159273))

(declare-fun d!159275 () Bool)

(assert (=> d!159275 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660133 () Unit!50976)

(declare-fun choose!38 (array!101400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50976)

(assert (=> d!159275 (= lt!660133 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159275 (validMask!0 mask!2512)))

(assert (=> d!159275 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660133)))

(declare-fun bs!43741 () Bool)

(assert (= bs!43741 d!159275))

(assert (=> bs!43741 m!1406905))

(declare-fun m!1407033 () Bool)

(assert (=> bs!43741 m!1407033))

(assert (=> bs!43741 m!1406915))

(assert (=> b!1523758 d!159275))

(declare-fun d!159281 () Bool)

(assert (=> d!159281 (= (validKeyInArray!0 (select (arr!48931 a!2804) j!70)) (and (not (= (select (arr!48931 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48931 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1523761 d!159281))

(declare-fun b!1523999 () Bool)

(declare-fun e!849614 () SeekEntryResult!13096)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523999 (= e!849614 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48931 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524000 () Bool)

(assert (=> b!1524000 (= e!849614 (Intermediate!13096 false (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524001 () Bool)

(declare-fun e!849612 () Bool)

(declare-fun e!849610 () Bool)

(assert (=> b!1524001 (= e!849612 e!849610)))

(declare-fun res!1042735 () Bool)

(declare-fun lt!660160 () SeekEntryResult!13096)

(assert (=> b!1524001 (= res!1042735 (and (is-Intermediate!13096 lt!660160) (not (undefined!13908 lt!660160)) (bvslt (x!136462 lt!660160) #b01111111111111111111111111111110) (bvsge (x!136462 lt!660160) #b00000000000000000000000000000000) (bvsge (x!136462 lt!660160) #b00000000000000000000000000000000)))))

(assert (=> b!1524001 (=> (not res!1042735) (not e!849610))))

(declare-fun b!1524002 () Bool)

(assert (=> b!1524002 (and (bvsge (index!54781 lt!660160) #b00000000000000000000000000000000) (bvslt (index!54781 lt!660160) (size!49481 a!2804)))))

(declare-fun res!1042737 () Bool)

(assert (=> b!1524002 (= res!1042737 (= (select (arr!48931 a!2804) (index!54781 lt!660160)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849613 () Bool)

(assert (=> b!1524002 (=> res!1042737 e!849613)))

(declare-fun d!159285 () Bool)

(assert (=> d!159285 e!849612))

(declare-fun c!140181 () Bool)

(assert (=> d!159285 (= c!140181 (and (is-Intermediate!13096 lt!660160) (undefined!13908 lt!660160)))))

(declare-fun e!849611 () SeekEntryResult!13096)

(assert (=> d!159285 (= lt!660160 e!849611)))

(declare-fun c!140182 () Bool)

(assert (=> d!159285 (= c!140182 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660159 () (_ BitVec 64))

(assert (=> d!159285 (= lt!660159 (select (arr!48931 a!2804) (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512)))))

(assert (=> d!159285 (validMask!0 mask!2512)))

(assert (=> d!159285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) (select (arr!48931 a!2804) j!70) a!2804 mask!2512) lt!660160)))

(declare-fun b!1524003 () Bool)

(assert (=> b!1524003 (and (bvsge (index!54781 lt!660160) #b00000000000000000000000000000000) (bvslt (index!54781 lt!660160) (size!49481 a!2804)))))

(declare-fun res!1042736 () Bool)

(assert (=> b!1524003 (= res!1042736 (= (select (arr!48931 a!2804) (index!54781 lt!660160)) (select (arr!48931 a!2804) j!70)))))

(assert (=> b!1524003 (=> res!1042736 e!849613)))

(assert (=> b!1524003 (= e!849610 e!849613)))

(declare-fun b!1524004 () Bool)

(assert (=> b!1524004 (= e!849611 e!849614)))

(declare-fun c!140180 () Bool)

(assert (=> b!1524004 (= c!140180 (or (= lt!660159 (select (arr!48931 a!2804) j!70)) (= (bvadd lt!660159 lt!660159) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524005 () Bool)

(assert (=> b!1524005 (and (bvsge (index!54781 lt!660160) #b00000000000000000000000000000000) (bvslt (index!54781 lt!660160) (size!49481 a!2804)))))

(assert (=> b!1524005 (= e!849613 (= (select (arr!48931 a!2804) (index!54781 lt!660160)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1524006 () Bool)

(assert (=> b!1524006 (= e!849612 (bvsge (x!136462 lt!660160) #b01111111111111111111111111111110))))

(declare-fun b!1524007 () Bool)

(assert (=> b!1524007 (= e!849611 (Intermediate!13096 true (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159285 c!140182) b!1524007))

(assert (= (and d!159285 (not c!140182)) b!1524004))

(assert (= (and b!1524004 c!140180) b!1524000))

(assert (= (and b!1524004 (not c!140180)) b!1523999))

(assert (= (and d!159285 c!140181) b!1524006))

(assert (= (and d!159285 (not c!140181)) b!1524001))

(assert (= (and b!1524001 res!1042735) b!1524003))

(assert (= (and b!1524003 (not res!1042736)) b!1524002))

(assert (= (and b!1524002 (not res!1042737)) b!1524005))

(assert (=> d!159285 m!1406939))

(declare-fun m!1407073 () Bool)

(assert (=> d!159285 m!1407073))

(assert (=> d!159285 m!1406915))

(declare-fun m!1407075 () Bool)

(assert (=> b!1524002 m!1407075))

(assert (=> b!1523999 m!1406939))

(declare-fun m!1407077 () Bool)

(assert (=> b!1523999 m!1407077))

(assert (=> b!1523999 m!1407077))

(assert (=> b!1523999 m!1406901))

(declare-fun m!1407079 () Bool)

(assert (=> b!1523999 m!1407079))

(assert (=> b!1524003 m!1407075))

(assert (=> b!1524005 m!1407075))

(assert (=> b!1523751 d!159285))

(declare-fun d!159305 () Bool)

(declare-fun lt!660171 () (_ BitVec 32))

(declare-fun lt!660170 () (_ BitVec 32))

(assert (=> d!159305 (= lt!660171 (bvmul (bvxor lt!660170 (bvlshr lt!660170 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159305 (= lt!660170 ((_ extract 31 0) (bvand (bvxor (select (arr!48931 a!2804) j!70) (bvlshr (select (arr!48931 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159305 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042738 (let ((h!36836 ((_ extract 31 0) (bvand (bvxor (select (arr!48931 a!2804) j!70) (bvlshr (select (arr!48931 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136467 (bvmul (bvxor h!36836 (bvlshr h!36836 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136467 (bvlshr x!136467 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042738 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042738 #b00000000000000000000000000000000))))))

(assert (=> d!159305 (= (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) (bvand (bvxor lt!660171 (bvlshr lt!660171 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1523751 d!159305))

(declare-fun b!1524072 () Bool)

(declare-fun e!849654 () SeekEntryResult!13096)

(assert (=> b!1524072 (= e!849654 Undefined!13096)))

(declare-fun b!1524073 () Bool)

(declare-fun c!140208 () Bool)

(declare-fun lt!660213 () (_ BitVec 64))

(assert (=> b!1524073 (= c!140208 (= lt!660213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849653 () SeekEntryResult!13096)

(declare-fun e!849652 () SeekEntryResult!13096)

(assert (=> b!1524073 (= e!849653 e!849652)))

(declare-fun b!1524074 () Bool)

(declare-fun lt!660214 () SeekEntryResult!13096)

(assert (=> b!1524074 (= e!849652 (MissingZero!13096 (index!54781 lt!660214)))))

(declare-fun b!1524075 () Bool)

(assert (=> b!1524075 (= e!849652 (seekKeyOrZeroReturnVacant!0 (x!136462 lt!660214) (index!54781 lt!660214) (index!54781 lt!660214) (select (arr!48931 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524076 () Bool)

(assert (=> b!1524076 (= e!849654 e!849653)))

(assert (=> b!1524076 (= lt!660213 (select (arr!48931 a!2804) (index!54781 lt!660214)))))

(declare-fun c!140210 () Bool)

(assert (=> b!1524076 (= c!140210 (= lt!660213 (select (arr!48931 a!2804) j!70)))))

(declare-fun b!1524077 () Bool)

(assert (=> b!1524077 (= e!849653 (Found!13096 (index!54781 lt!660214)))))

(declare-fun d!159311 () Bool)

(declare-fun lt!660212 () SeekEntryResult!13096)

(assert (=> d!159311 (and (or (is-Undefined!13096 lt!660212) (not (is-Found!13096 lt!660212)) (and (bvsge (index!54780 lt!660212) #b00000000000000000000000000000000) (bvslt (index!54780 lt!660212) (size!49481 a!2804)))) (or (is-Undefined!13096 lt!660212) (is-Found!13096 lt!660212) (not (is-MissingZero!13096 lt!660212)) (and (bvsge (index!54779 lt!660212) #b00000000000000000000000000000000) (bvslt (index!54779 lt!660212) (size!49481 a!2804)))) (or (is-Undefined!13096 lt!660212) (is-Found!13096 lt!660212) (is-MissingZero!13096 lt!660212) (not (is-MissingVacant!13096 lt!660212)) (and (bvsge (index!54782 lt!660212) #b00000000000000000000000000000000) (bvslt (index!54782 lt!660212) (size!49481 a!2804)))) (or (is-Undefined!13096 lt!660212) (ite (is-Found!13096 lt!660212) (= (select (arr!48931 a!2804) (index!54780 lt!660212)) (select (arr!48931 a!2804) j!70)) (ite (is-MissingZero!13096 lt!660212) (= (select (arr!48931 a!2804) (index!54779 lt!660212)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13096 lt!660212) (= (select (arr!48931 a!2804) (index!54782 lt!660212)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159311 (= lt!660212 e!849654)))

(declare-fun c!140209 () Bool)

(assert (=> d!159311 (= c!140209 (and (is-Intermediate!13096 lt!660214) (undefined!13908 lt!660214)))))

(assert (=> d!159311 (= lt!660214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) (select (arr!48931 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159311 (validMask!0 mask!2512)))

(assert (=> d!159311 (= (seekEntryOrOpen!0 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) lt!660212)))

(assert (= (and d!159311 c!140209) b!1524072))

(assert (= (and d!159311 (not c!140209)) b!1524076))

(assert (= (and b!1524076 c!140210) b!1524077))

(assert (= (and b!1524076 (not c!140210)) b!1524073))

(assert (= (and b!1524073 c!140208) b!1524074))

(assert (= (and b!1524073 (not c!140208)) b!1524075))

(assert (=> b!1524075 m!1406901))

(declare-fun m!1407119 () Bool)

(assert (=> b!1524075 m!1407119))

(declare-fun m!1407121 () Bool)

(assert (=> b!1524076 m!1407121))

(assert (=> d!159311 m!1406901))

(assert (=> d!159311 m!1406939))

(assert (=> d!159311 m!1406939))

(assert (=> d!159311 m!1406901))

(assert (=> d!159311 m!1406941))

(declare-fun m!1407123 () Bool)

(assert (=> d!159311 m!1407123))

(declare-fun m!1407125 () Bool)

(assert (=> d!159311 m!1407125))

(declare-fun m!1407127 () Bool)

(assert (=> d!159311 m!1407127))

(assert (=> d!159311 m!1406915))

(assert (=> b!1523760 d!159311))

(declare-fun b!1524078 () Bool)

(declare-fun e!849657 () SeekEntryResult!13096)

(assert (=> b!1524078 (= e!849657 Undefined!13096)))

(declare-fun b!1524079 () Bool)

(declare-fun c!140211 () Bool)

(declare-fun lt!660216 () (_ BitVec 64))

(assert (=> b!1524079 (= c!140211 (= lt!660216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849656 () SeekEntryResult!13096)

(declare-fun e!849655 () SeekEntryResult!13096)

(assert (=> b!1524079 (= e!849656 e!849655)))

(declare-fun b!1524080 () Bool)

(declare-fun lt!660217 () SeekEntryResult!13096)

(assert (=> b!1524080 (= e!849655 (MissingZero!13096 (index!54781 lt!660217)))))

(declare-fun b!1524081 () Bool)

(assert (=> b!1524081 (= e!849655 (seekKeyOrZeroReturnVacant!0 (x!136462 lt!660217) (index!54781 lt!660217) (index!54781 lt!660217) lt!660053 lt!660055 mask!2512))))

(declare-fun b!1524082 () Bool)

(assert (=> b!1524082 (= e!849657 e!849656)))

(assert (=> b!1524082 (= lt!660216 (select (arr!48931 lt!660055) (index!54781 lt!660217)))))

(declare-fun c!140213 () Bool)

(assert (=> b!1524082 (= c!140213 (= lt!660216 lt!660053))))

(declare-fun b!1524083 () Bool)

(assert (=> b!1524083 (= e!849656 (Found!13096 (index!54781 lt!660217)))))

(declare-fun d!159329 () Bool)

(declare-fun lt!660215 () SeekEntryResult!13096)

(assert (=> d!159329 (and (or (is-Undefined!13096 lt!660215) (not (is-Found!13096 lt!660215)) (and (bvsge (index!54780 lt!660215) #b00000000000000000000000000000000) (bvslt (index!54780 lt!660215) (size!49481 lt!660055)))) (or (is-Undefined!13096 lt!660215) (is-Found!13096 lt!660215) (not (is-MissingZero!13096 lt!660215)) (and (bvsge (index!54779 lt!660215) #b00000000000000000000000000000000) (bvslt (index!54779 lt!660215) (size!49481 lt!660055)))) (or (is-Undefined!13096 lt!660215) (is-Found!13096 lt!660215) (is-MissingZero!13096 lt!660215) (not (is-MissingVacant!13096 lt!660215)) (and (bvsge (index!54782 lt!660215) #b00000000000000000000000000000000) (bvslt (index!54782 lt!660215) (size!49481 lt!660055)))) (or (is-Undefined!13096 lt!660215) (ite (is-Found!13096 lt!660215) (= (select (arr!48931 lt!660055) (index!54780 lt!660215)) lt!660053) (ite (is-MissingZero!13096 lt!660215) (= (select (arr!48931 lt!660055) (index!54779 lt!660215)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13096 lt!660215) (= (select (arr!48931 lt!660055) (index!54782 lt!660215)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159329 (= lt!660215 e!849657)))

(declare-fun c!140212 () Bool)

(assert (=> d!159329 (= c!140212 (and (is-Intermediate!13096 lt!660217) (undefined!13908 lt!660217)))))

