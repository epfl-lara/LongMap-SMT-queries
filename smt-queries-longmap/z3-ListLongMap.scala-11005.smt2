; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128810 () Bool)

(assert start!128810)

(declare-fun b!1509864 () Bool)

(declare-fun e!843156 () Bool)

(declare-fun e!843154 () Bool)

(assert (=> b!1509864 (= e!843156 e!843154)))

(declare-fun res!1029983 () Bool)

(assert (=> b!1509864 (=> (not res!1029983) (not e!843154))))

(declare-datatypes ((SeekEntryResult!12765 0))(
  ( (MissingZero!12765 (index!53455 (_ BitVec 32))) (Found!12765 (index!53456 (_ BitVec 32))) (Intermediate!12765 (undefined!13577 Bool) (index!53457 (_ BitVec 32)) (x!135205 (_ BitVec 32))) (Undefined!12765) (MissingVacant!12765 (index!53458 (_ BitVec 32))) )
))
(declare-fun lt!654811 () SeekEntryResult!12765)

(declare-fun lt!654813 () SeekEntryResult!12765)

(assert (=> b!1509864 (= res!1029983 (= lt!654811 lt!654813))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509864 (= lt!654813 (Intermediate!12765 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100666 0))(
  ( (array!100667 (arr!48571 (Array (_ BitVec 32) (_ BitVec 64))) (size!49123 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100666 (_ BitVec 32)) SeekEntryResult!12765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509864 (= lt!654811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48571 a!2804) j!70) mask!2512) (select (arr!48571 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509865 () Bool)

(declare-fun e!843153 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100666 (_ BitVec 32)) SeekEntryResult!12765)

(assert (=> b!1509865 (= e!843153 (= (seekEntry!0 (select (arr!48571 a!2804) j!70) a!2804 mask!2512) (Found!12765 j!70)))))

(declare-fun b!1509866 () Bool)

(declare-fun res!1029978 () Bool)

(assert (=> b!1509866 (=> (not res!1029978) (not e!843154))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509866 (= res!1029978 (= lt!654811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48571 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48571 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100667 (store (arr!48571 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49123 a!2804)) mask!2512)))))

(declare-fun b!1509868 () Bool)

(assert (=> b!1509868 (= e!843154 (not true))))

(assert (=> b!1509868 e!843153))

(declare-fun res!1029981 () Bool)

(assert (=> b!1509868 (=> (not res!1029981) (not e!843153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100666 (_ BitVec 32)) Bool)

(assert (=> b!1509868 (= res!1029981 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50237 0))(
  ( (Unit!50238) )
))
(declare-fun lt!654812 () Unit!50237)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50237)

(assert (=> b!1509868 (= lt!654812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509869 () Bool)

(declare-fun res!1029979 () Bool)

(assert (=> b!1509869 (=> (not res!1029979) (not e!843156))))

(assert (=> b!1509869 (= res!1029979 (and (= (size!49123 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49123 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49123 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509870 () Bool)

(declare-fun res!1029975 () Bool)

(assert (=> b!1509870 (=> (not res!1029975) (not e!843156))))

(assert (=> b!1509870 (= res!1029975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509871 () Bool)

(declare-fun res!1029973 () Bool)

(assert (=> b!1509871 (=> (not res!1029973) (not e!843156))))

(declare-datatypes ((List!35132 0))(
  ( (Nil!35129) (Cons!35128 (h!36541 (_ BitVec 64)) (t!49818 List!35132)) )
))
(declare-fun arrayNoDuplicates!0 (array!100666 (_ BitVec 32) List!35132) Bool)

(assert (=> b!1509871 (= res!1029973 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35129))))

(declare-fun b!1509872 () Bool)

(declare-fun res!1029982 () Bool)

(assert (=> b!1509872 (=> (not res!1029982) (not e!843156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509872 (= res!1029982 (validKeyInArray!0 (select (arr!48571 a!2804) j!70)))))

(declare-fun res!1029977 () Bool)

(assert (=> start!128810 (=> (not res!1029977) (not e!843156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128810 (= res!1029977 (validMask!0 mask!2512))))

(assert (=> start!128810 e!843156))

(assert (=> start!128810 true))

(declare-fun array_inv!37804 (array!100666) Bool)

(assert (=> start!128810 (array_inv!37804 a!2804)))

(declare-fun b!1509867 () Bool)

(declare-fun res!1029974 () Bool)

(assert (=> b!1509867 (=> (not res!1029974) (not e!843156))))

(assert (=> b!1509867 (= res!1029974 (validKeyInArray!0 (select (arr!48571 a!2804) i!961)))))

(declare-fun b!1509873 () Bool)

(declare-fun res!1029980 () Bool)

(assert (=> b!1509873 (=> (not res!1029980) (not e!843154))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509873 (= res!1029980 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48571 a!2804) j!70) a!2804 mask!2512) lt!654813))))

(declare-fun b!1509874 () Bool)

(declare-fun res!1029976 () Bool)

(assert (=> b!1509874 (=> (not res!1029976) (not e!843156))))

(assert (=> b!1509874 (= res!1029976 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49123 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49123 a!2804))))))

(assert (= (and start!128810 res!1029977) b!1509869))

(assert (= (and b!1509869 res!1029979) b!1509867))

(assert (= (and b!1509867 res!1029974) b!1509872))

(assert (= (and b!1509872 res!1029982) b!1509870))

(assert (= (and b!1509870 res!1029975) b!1509871))

(assert (= (and b!1509871 res!1029973) b!1509874))

(assert (= (and b!1509874 res!1029976) b!1509864))

(assert (= (and b!1509864 res!1029983) b!1509873))

(assert (= (and b!1509873 res!1029980) b!1509866))

(assert (= (and b!1509866 res!1029978) b!1509868))

(assert (= (and b!1509868 res!1029981) b!1509865))

(declare-fun m!1391861 () Bool)

(assert (=> b!1509870 m!1391861))

(declare-fun m!1391863 () Bool)

(assert (=> b!1509868 m!1391863))

(declare-fun m!1391865 () Bool)

(assert (=> b!1509868 m!1391865))

(declare-fun m!1391867 () Bool)

(assert (=> b!1509867 m!1391867))

(assert (=> b!1509867 m!1391867))

(declare-fun m!1391869 () Bool)

(assert (=> b!1509867 m!1391869))

(declare-fun m!1391871 () Bool)

(assert (=> b!1509866 m!1391871))

(declare-fun m!1391873 () Bool)

(assert (=> b!1509866 m!1391873))

(assert (=> b!1509866 m!1391873))

(declare-fun m!1391875 () Bool)

(assert (=> b!1509866 m!1391875))

(assert (=> b!1509866 m!1391875))

(assert (=> b!1509866 m!1391873))

(declare-fun m!1391877 () Bool)

(assert (=> b!1509866 m!1391877))

(declare-fun m!1391879 () Bool)

(assert (=> b!1509873 m!1391879))

(assert (=> b!1509873 m!1391879))

(declare-fun m!1391881 () Bool)

(assert (=> b!1509873 m!1391881))

(assert (=> b!1509865 m!1391879))

(assert (=> b!1509865 m!1391879))

(declare-fun m!1391883 () Bool)

(assert (=> b!1509865 m!1391883))

(declare-fun m!1391885 () Bool)

(assert (=> start!128810 m!1391885))

(declare-fun m!1391887 () Bool)

(assert (=> start!128810 m!1391887))

(declare-fun m!1391889 () Bool)

(assert (=> b!1509871 m!1391889))

(assert (=> b!1509864 m!1391879))

(assert (=> b!1509864 m!1391879))

(declare-fun m!1391891 () Bool)

(assert (=> b!1509864 m!1391891))

(assert (=> b!1509864 m!1391891))

(assert (=> b!1509864 m!1391879))

(declare-fun m!1391893 () Bool)

(assert (=> b!1509864 m!1391893))

(assert (=> b!1509872 m!1391879))

(assert (=> b!1509872 m!1391879))

(declare-fun m!1391895 () Bool)

(assert (=> b!1509872 m!1391895))

(check-sat (not b!1509873) (not b!1509867) (not b!1509868) (not start!128810) (not b!1509871) (not b!1509866) (not b!1509864) (not b!1509870) (not b!1509872) (not b!1509865))
(check-sat)
