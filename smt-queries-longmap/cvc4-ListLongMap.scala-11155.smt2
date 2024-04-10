; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130296 () Bool)

(assert start!130296)

(declare-fun b!1529892 () Bool)

(declare-fun e!852522 () Bool)

(assert (=> b!1529892 (= e!852522 true)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!662587 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529892 (= lt!662587 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529893 () Bool)

(declare-fun e!852520 () Bool)

(assert (=> b!1529893 (= e!852520 (not e!852522))))

(declare-fun res!1047601 () Bool)

(assert (=> b!1529893 (=> res!1047601 e!852522)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101646 0))(
  ( (array!101647 (arr!49048 (Array (_ BitVec 32) (_ BitVec 64))) (size!49598 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101646)

(assert (=> b!1529893 (= res!1047601 (or (not (= (select (arr!49048 a!2804) j!70) (select (store (arr!49048 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852519 () Bool)

(assert (=> b!1529893 e!852519))

(declare-fun res!1047599 () Bool)

(assert (=> b!1529893 (=> (not res!1047599) (not e!852519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101646 (_ BitVec 32)) Bool)

(assert (=> b!1529893 (= res!1047599 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51210 0))(
  ( (Unit!51211) )
))
(declare-fun lt!662585 () Unit!51210)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51210)

(assert (=> b!1529893 (= lt!662585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529894 () Bool)

(declare-fun res!1047607 () Bool)

(declare-fun e!852521 () Bool)

(assert (=> b!1529894 (=> (not res!1047607) (not e!852521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529894 (= res!1047607 (validKeyInArray!0 (select (arr!49048 a!2804) j!70)))))

(declare-fun b!1529895 () Bool)

(declare-datatypes ((SeekEntryResult!13213 0))(
  ( (MissingZero!13213 (index!55247 (_ BitVec 32))) (Found!13213 (index!55248 (_ BitVec 32))) (Intermediate!13213 (undefined!14025 Bool) (index!55249 (_ BitVec 32)) (x!136924 (_ BitVec 32))) (Undefined!13213) (MissingVacant!13213 (index!55250 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101646 (_ BitVec 32)) SeekEntryResult!13213)

(assert (=> b!1529895 (= e!852519 (= (seekEntry!0 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) (Found!13213 j!70)))))

(declare-fun b!1529896 () Bool)

(declare-fun res!1047604 () Bool)

(assert (=> b!1529896 (=> (not res!1047604) (not e!852521))))

(assert (=> b!1529896 (= res!1047604 (validKeyInArray!0 (select (arr!49048 a!2804) i!961)))))

(declare-fun b!1529897 () Bool)

(declare-fun res!1047602 () Bool)

(assert (=> b!1529897 (=> (not res!1047602) (not e!852521))))

(assert (=> b!1529897 (= res!1047602 (and (= (size!49598 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49598 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49598 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529898 () Bool)

(declare-fun res!1047600 () Bool)

(assert (=> b!1529898 (=> (not res!1047600) (not e!852521))))

(assert (=> b!1529898 (= res!1047600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529899 () Bool)

(declare-fun res!1047610 () Bool)

(assert (=> b!1529899 (=> (not res!1047610) (not e!852520))))

(declare-fun lt!662586 () SeekEntryResult!13213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101646 (_ BitVec 32)) SeekEntryResult!13213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529899 (= res!1047610 (= lt!662586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49048 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49048 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101647 (store (arr!49048 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49598 a!2804)) mask!2512)))))

(declare-fun b!1529900 () Bool)

(declare-fun res!1047605 () Bool)

(assert (=> b!1529900 (=> (not res!1047605) (not e!852521))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529900 (= res!1047605 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49598 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49598 a!2804))))))

(declare-fun b!1529901 () Bool)

(declare-fun res!1047608 () Bool)

(assert (=> b!1529901 (=> (not res!1047608) (not e!852521))))

(declare-datatypes ((List!35531 0))(
  ( (Nil!35528) (Cons!35527 (h!36963 (_ BitVec 64)) (t!50225 List!35531)) )
))
(declare-fun arrayNoDuplicates!0 (array!101646 (_ BitVec 32) List!35531) Bool)

(assert (=> b!1529901 (= res!1047608 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35528))))

(declare-fun res!1047606 () Bool)

(assert (=> start!130296 (=> (not res!1047606) (not e!852521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130296 (= res!1047606 (validMask!0 mask!2512))))

(assert (=> start!130296 e!852521))

(assert (=> start!130296 true))

(declare-fun array_inv!38076 (array!101646) Bool)

(assert (=> start!130296 (array_inv!38076 a!2804)))

(declare-fun b!1529902 () Bool)

(assert (=> b!1529902 (= e!852521 e!852520)))

(declare-fun res!1047609 () Bool)

(assert (=> b!1529902 (=> (not res!1047609) (not e!852520))))

(declare-fun lt!662584 () SeekEntryResult!13213)

(assert (=> b!1529902 (= res!1047609 (= lt!662586 lt!662584))))

(assert (=> b!1529902 (= lt!662584 (Intermediate!13213 false resIndex!21 resX!21))))

(assert (=> b!1529902 (= lt!662586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49048 a!2804) j!70) mask!2512) (select (arr!49048 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529903 () Bool)

(declare-fun res!1047603 () Bool)

(assert (=> b!1529903 (=> (not res!1047603) (not e!852520))))

(assert (=> b!1529903 (= res!1047603 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) lt!662584))))

(assert (= (and start!130296 res!1047606) b!1529897))

(assert (= (and b!1529897 res!1047602) b!1529896))

(assert (= (and b!1529896 res!1047604) b!1529894))

(assert (= (and b!1529894 res!1047607) b!1529898))

(assert (= (and b!1529898 res!1047600) b!1529901))

(assert (= (and b!1529901 res!1047608) b!1529900))

(assert (= (and b!1529900 res!1047605) b!1529902))

(assert (= (and b!1529902 res!1047609) b!1529903))

(assert (= (and b!1529903 res!1047603) b!1529899))

(assert (= (and b!1529899 res!1047610) b!1529893))

(assert (= (and b!1529893 res!1047599) b!1529895))

(assert (= (and b!1529893 (not res!1047601)) b!1529892))

(declare-fun m!1412863 () Bool)

(assert (=> b!1529903 m!1412863))

(assert (=> b!1529903 m!1412863))

(declare-fun m!1412865 () Bool)

(assert (=> b!1529903 m!1412865))

(declare-fun m!1412867 () Bool)

(assert (=> b!1529892 m!1412867))

(assert (=> b!1529893 m!1412863))

(declare-fun m!1412869 () Bool)

(assert (=> b!1529893 m!1412869))

(declare-fun m!1412871 () Bool)

(assert (=> b!1529893 m!1412871))

(declare-fun m!1412873 () Bool)

(assert (=> b!1529893 m!1412873))

(declare-fun m!1412875 () Bool)

(assert (=> b!1529893 m!1412875))

(assert (=> b!1529894 m!1412863))

(assert (=> b!1529894 m!1412863))

(declare-fun m!1412877 () Bool)

(assert (=> b!1529894 m!1412877))

(declare-fun m!1412879 () Bool)

(assert (=> start!130296 m!1412879))

(declare-fun m!1412881 () Bool)

(assert (=> start!130296 m!1412881))

(assert (=> b!1529895 m!1412863))

(assert (=> b!1529895 m!1412863))

(declare-fun m!1412883 () Bool)

(assert (=> b!1529895 m!1412883))

(declare-fun m!1412885 () Bool)

(assert (=> b!1529898 m!1412885))

(declare-fun m!1412887 () Bool)

(assert (=> b!1529901 m!1412887))

(assert (=> b!1529899 m!1412871))

(assert (=> b!1529899 m!1412873))

(assert (=> b!1529899 m!1412873))

(declare-fun m!1412889 () Bool)

(assert (=> b!1529899 m!1412889))

(assert (=> b!1529899 m!1412889))

(assert (=> b!1529899 m!1412873))

(declare-fun m!1412891 () Bool)

(assert (=> b!1529899 m!1412891))

(declare-fun m!1412893 () Bool)

(assert (=> b!1529896 m!1412893))

(assert (=> b!1529896 m!1412893))

(declare-fun m!1412895 () Bool)

(assert (=> b!1529896 m!1412895))

(assert (=> b!1529902 m!1412863))

(assert (=> b!1529902 m!1412863))

(declare-fun m!1412897 () Bool)

(assert (=> b!1529902 m!1412897))

(assert (=> b!1529902 m!1412897))

(assert (=> b!1529902 m!1412863))

(declare-fun m!1412899 () Bool)

(assert (=> b!1529902 m!1412899))

(push 1)

