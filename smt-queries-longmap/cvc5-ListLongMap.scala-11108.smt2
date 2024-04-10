; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129752 () Bool)

(assert start!129752)

(declare-fun b!1522885 () Bool)

(declare-fun res!1041792 () Bool)

(declare-fun e!849137 () Bool)

(assert (=> b!1522885 (=> (not res!1041792) (not e!849137))))

(declare-datatypes ((array!101348 0))(
  ( (array!101349 (arr!48905 (Array (_ BitVec 32) (_ BitVec 64))) (size!49455 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101348)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101348 (_ BitVec 32)) Bool)

(assert (=> b!1522885 (= res!1041792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522886 () Bool)

(declare-fun e!849139 () Bool)

(assert (=> b!1522886 (= e!849137 e!849139)))

(declare-fun res!1041801 () Bool)

(assert (=> b!1522886 (=> (not res!1041801) (not e!849139))))

(declare-datatypes ((SeekEntryResult!13070 0))(
  ( (MissingZero!13070 (index!54675 (_ BitVec 32))) (Found!13070 (index!54676 (_ BitVec 32))) (Intermediate!13070 (undefined!13882 Bool) (index!54677 (_ BitVec 32)) (x!136372 (_ BitVec 32))) (Undefined!13070) (MissingVacant!13070 (index!54678 (_ BitVec 32))) )
))
(declare-fun lt!659802 () SeekEntryResult!13070)

(declare-fun lt!659801 () SeekEntryResult!13070)

(assert (=> b!1522886 (= res!1041801 (= lt!659802 lt!659801))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522886 (= lt!659801 (Intermediate!13070 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101348 (_ BitVec 32)) SeekEntryResult!13070)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522886 (= lt!659802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48905 a!2804) j!70) mask!2512) (select (arr!48905 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522887 () Bool)

(declare-fun res!1041798 () Bool)

(assert (=> b!1522887 (=> (not res!1041798) (not e!849139))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522887 (= res!1041798 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48905 a!2804) j!70) a!2804 mask!2512) lt!659801))))

(declare-fun b!1522888 () Bool)

(declare-fun res!1041797 () Bool)

(assert (=> b!1522888 (=> (not res!1041797) (not e!849137))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522888 (= res!1041797 (and (= (size!49455 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49455 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49455 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522889 () Bool)

(declare-fun e!849138 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101348 (_ BitVec 32)) SeekEntryResult!13070)

(assert (=> b!1522889 (= e!849138 (= (seekEntry!0 (select (arr!48905 a!2804) j!70) a!2804 mask!2512) (Found!13070 j!70)))))

(declare-fun res!1041796 () Bool)

(assert (=> start!129752 (=> (not res!1041796) (not e!849137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129752 (= res!1041796 (validMask!0 mask!2512))))

(assert (=> start!129752 e!849137))

(assert (=> start!129752 true))

(declare-fun array_inv!37933 (array!101348) Bool)

(assert (=> start!129752 (array_inv!37933 a!2804)))

(declare-fun b!1522890 () Bool)

(declare-fun res!1041799 () Bool)

(assert (=> b!1522890 (=> (not res!1041799) (not e!849139))))

(assert (=> b!1522890 (= res!1041799 (= lt!659802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48905 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48905 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101349 (store (arr!48905 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49455 a!2804)) mask!2512)))))

(declare-fun b!1522891 () Bool)

(declare-fun res!1041793 () Bool)

(assert (=> b!1522891 (=> (not res!1041793) (not e!849137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522891 (= res!1041793 (validKeyInArray!0 (select (arr!48905 a!2804) j!70)))))

(declare-fun b!1522892 () Bool)

(declare-fun res!1041794 () Bool)

(assert (=> b!1522892 (=> (not res!1041794) (not e!849137))))

(assert (=> b!1522892 (= res!1041794 (validKeyInArray!0 (select (arr!48905 a!2804) i!961)))))

(declare-fun b!1522893 () Bool)

(declare-fun res!1041795 () Bool)

(assert (=> b!1522893 (=> (not res!1041795) (not e!849137))))

(declare-datatypes ((List!35388 0))(
  ( (Nil!35385) (Cons!35384 (h!36808 (_ BitVec 64)) (t!50082 List!35388)) )
))
(declare-fun arrayNoDuplicates!0 (array!101348 (_ BitVec 32) List!35388) Bool)

(assert (=> b!1522893 (= res!1041795 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35385))))

(declare-fun b!1522894 () Bool)

(assert (=> b!1522894 (= e!849139 (not true))))

(assert (=> b!1522894 e!849138))

(declare-fun res!1041802 () Bool)

(assert (=> b!1522894 (=> (not res!1041802) (not e!849138))))

(assert (=> b!1522894 (= res!1041802 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50924 0))(
  ( (Unit!50925) )
))
(declare-fun lt!659803 () Unit!50924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50924)

(assert (=> b!1522894 (= lt!659803 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522895 () Bool)

(declare-fun res!1041800 () Bool)

(assert (=> b!1522895 (=> (not res!1041800) (not e!849137))))

(assert (=> b!1522895 (= res!1041800 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49455 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49455 a!2804))))))

(assert (= (and start!129752 res!1041796) b!1522888))

(assert (= (and b!1522888 res!1041797) b!1522892))

(assert (= (and b!1522892 res!1041794) b!1522891))

(assert (= (and b!1522891 res!1041793) b!1522885))

(assert (= (and b!1522885 res!1041792) b!1522893))

(assert (= (and b!1522893 res!1041795) b!1522895))

(assert (= (and b!1522895 res!1041800) b!1522886))

(assert (= (and b!1522886 res!1041801) b!1522887))

(assert (= (and b!1522887 res!1041798) b!1522890))

(assert (= (and b!1522890 res!1041799) b!1522894))

(assert (= (and b!1522894 res!1041802) b!1522889))

(declare-fun m!1405953 () Bool)

(assert (=> b!1522891 m!1405953))

(assert (=> b!1522891 m!1405953))

(declare-fun m!1405955 () Bool)

(assert (=> b!1522891 m!1405955))

(declare-fun m!1405957 () Bool)

(assert (=> b!1522885 m!1405957))

(declare-fun m!1405959 () Bool)

(assert (=> b!1522893 m!1405959))

(declare-fun m!1405961 () Bool)

(assert (=> b!1522894 m!1405961))

(declare-fun m!1405963 () Bool)

(assert (=> b!1522894 m!1405963))

(declare-fun m!1405965 () Bool)

(assert (=> b!1522890 m!1405965))

(declare-fun m!1405967 () Bool)

(assert (=> b!1522890 m!1405967))

(assert (=> b!1522890 m!1405967))

(declare-fun m!1405969 () Bool)

(assert (=> b!1522890 m!1405969))

(assert (=> b!1522890 m!1405969))

(assert (=> b!1522890 m!1405967))

(declare-fun m!1405971 () Bool)

(assert (=> b!1522890 m!1405971))

(declare-fun m!1405973 () Bool)

(assert (=> start!129752 m!1405973))

(declare-fun m!1405975 () Bool)

(assert (=> start!129752 m!1405975))

(assert (=> b!1522889 m!1405953))

(assert (=> b!1522889 m!1405953))

(declare-fun m!1405977 () Bool)

(assert (=> b!1522889 m!1405977))

(assert (=> b!1522886 m!1405953))

(assert (=> b!1522886 m!1405953))

(declare-fun m!1405979 () Bool)

(assert (=> b!1522886 m!1405979))

(assert (=> b!1522886 m!1405979))

(assert (=> b!1522886 m!1405953))

(declare-fun m!1405981 () Bool)

(assert (=> b!1522886 m!1405981))

(assert (=> b!1522887 m!1405953))

(assert (=> b!1522887 m!1405953))

(declare-fun m!1405983 () Bool)

(assert (=> b!1522887 m!1405983))

(declare-fun m!1405985 () Bool)

(assert (=> b!1522892 m!1405985))

(assert (=> b!1522892 m!1405985))

(declare-fun m!1405987 () Bool)

(assert (=> b!1522892 m!1405987))

(push 1)

