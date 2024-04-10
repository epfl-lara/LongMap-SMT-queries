; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128974 () Bool)

(assert start!128974)

(declare-fun b!1512158 () Bool)

(declare-fun res!1032068 () Bool)

(declare-fun e!844103 () Bool)

(assert (=> b!1512158 (=> (not res!1032068) (not e!844103))))

(declare-datatypes ((array!100830 0))(
  ( (array!100831 (arr!48652 (Array (_ BitVec 32) (_ BitVec 64))) (size!49202 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100830)

(declare-datatypes ((List!35135 0))(
  ( (Nil!35132) (Cons!35131 (h!36543 (_ BitVec 64)) (t!49829 List!35135)) )
))
(declare-fun arrayNoDuplicates!0 (array!100830 (_ BitVec 32) List!35135) Bool)

(assert (=> b!1512158 (= res!1032068 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35132))))

(declare-fun b!1512159 () Bool)

(declare-fun res!1032065 () Bool)

(assert (=> b!1512159 (=> (not res!1032065) (not e!844103))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512159 (= res!1032065 (validKeyInArray!0 (select (arr!48652 a!2804) i!961)))))

(declare-fun b!1512160 () Bool)

(declare-fun e!844101 () Bool)

(assert (=> b!1512160 (= e!844101 (not true))))

(declare-fun e!844105 () Bool)

(assert (=> b!1512160 e!844105))

(declare-fun res!1032062 () Bool)

(assert (=> b!1512160 (=> (not res!1032062) (not e!844105))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100830 (_ BitVec 32)) Bool)

(assert (=> b!1512160 (= res!1032062 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50514 0))(
  ( (Unit!50515) )
))
(declare-fun lt!655612 () Unit!50514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50514)

(assert (=> b!1512160 (= lt!655612 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!844104 () Bool)

(declare-fun b!1512161 () Bool)

(declare-datatypes ((SeekEntryResult!12823 0))(
  ( (MissingZero!12823 (index!53687 (_ BitVec 32))) (Found!12823 (index!53688 (_ BitVec 32))) (Intermediate!12823 (undefined!13635 Bool) (index!53689 (_ BitVec 32)) (x!135413 (_ BitVec 32))) (Undefined!12823) (MissingVacant!12823 (index!53690 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100830 (_ BitVec 32)) SeekEntryResult!12823)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100830 (_ BitVec 32)) SeekEntryResult!12823)

(assert (=> b!1512161 (= e!844104 (= (seekEntryOrOpen!0 (select (arr!48652 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48652 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1032064 () Bool)

(assert (=> start!128974 (=> (not res!1032064) (not e!844103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128974 (= res!1032064 (validMask!0 mask!2512))))

(assert (=> start!128974 e!844103))

(assert (=> start!128974 true))

(declare-fun array_inv!37680 (array!100830) Bool)

(assert (=> start!128974 (array_inv!37680 a!2804)))

(declare-fun b!1512162 () Bool)

(assert (=> b!1512162 (= e!844105 e!844104)))

(declare-fun res!1032063 () Bool)

(assert (=> b!1512162 (=> res!1032063 e!844104)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512162 (= res!1032063 (or (not (= (select (arr!48652 a!2804) j!70) (select (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48652 a!2804) index!487) (select (arr!48652 a!2804) j!70)) (not (= (select (arr!48652 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512163 () Bool)

(declare-fun res!1032067 () Bool)

(assert (=> b!1512163 (=> (not res!1032067) (not e!844101))))

(declare-fun lt!655610 () SeekEntryResult!12823)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100830 (_ BitVec 32)) SeekEntryResult!12823)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512163 (= res!1032067 (= lt!655610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100831 (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49202 a!2804)) mask!2512)))))

(declare-fun b!1512164 () Bool)

(assert (=> b!1512164 (= e!844103 e!844101)))

(declare-fun res!1032066 () Bool)

(assert (=> b!1512164 (=> (not res!1032066) (not e!844101))))

(declare-fun lt!655611 () SeekEntryResult!12823)

(assert (=> b!1512164 (= res!1032066 (= lt!655610 lt!655611))))

(assert (=> b!1512164 (= lt!655611 (Intermediate!12823 false resIndex!21 resX!21))))

(assert (=> b!1512164 (= lt!655610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48652 a!2804) j!70) mask!2512) (select (arr!48652 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512165 () Bool)

(declare-fun res!1032069 () Bool)

(assert (=> b!1512165 (=> (not res!1032069) (not e!844105))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100830 (_ BitVec 32)) SeekEntryResult!12823)

(assert (=> b!1512165 (= res!1032069 (= (seekEntry!0 (select (arr!48652 a!2804) j!70) a!2804 mask!2512) (Found!12823 j!70)))))

(declare-fun b!1512166 () Bool)

(declare-fun res!1032071 () Bool)

(assert (=> b!1512166 (=> (not res!1032071) (not e!844103))))

(assert (=> b!1512166 (= res!1032071 (and (= (size!49202 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49202 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49202 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512167 () Bool)

(declare-fun res!1032061 () Bool)

(assert (=> b!1512167 (=> (not res!1032061) (not e!844103))))

(assert (=> b!1512167 (= res!1032061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512168 () Bool)

(declare-fun res!1032072 () Bool)

(assert (=> b!1512168 (=> (not res!1032072) (not e!844103))))

(assert (=> b!1512168 (= res!1032072 (validKeyInArray!0 (select (arr!48652 a!2804) j!70)))))

(declare-fun b!1512169 () Bool)

(declare-fun res!1032070 () Bool)

(assert (=> b!1512169 (=> (not res!1032070) (not e!844101))))

(assert (=> b!1512169 (= res!1032070 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48652 a!2804) j!70) a!2804 mask!2512) lt!655611))))

(declare-fun b!1512170 () Bool)

(declare-fun res!1032073 () Bool)

(assert (=> b!1512170 (=> (not res!1032073) (not e!844103))))

(assert (=> b!1512170 (= res!1032073 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49202 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49202 a!2804))))))

(assert (= (and start!128974 res!1032064) b!1512166))

(assert (= (and b!1512166 res!1032071) b!1512159))

(assert (= (and b!1512159 res!1032065) b!1512168))

(assert (= (and b!1512168 res!1032072) b!1512167))

(assert (= (and b!1512167 res!1032061) b!1512158))

(assert (= (and b!1512158 res!1032068) b!1512170))

(assert (= (and b!1512170 res!1032073) b!1512164))

(assert (= (and b!1512164 res!1032066) b!1512169))

(assert (= (and b!1512169 res!1032070) b!1512163))

(assert (= (and b!1512163 res!1032067) b!1512160))

(assert (= (and b!1512160 res!1032062) b!1512165))

(assert (= (and b!1512165 res!1032069) b!1512162))

(assert (= (and b!1512162 (not res!1032063)) b!1512161))

(declare-fun m!1394905 () Bool)

(assert (=> b!1512165 m!1394905))

(assert (=> b!1512165 m!1394905))

(declare-fun m!1394907 () Bool)

(assert (=> b!1512165 m!1394907))

(assert (=> b!1512164 m!1394905))

(assert (=> b!1512164 m!1394905))

(declare-fun m!1394909 () Bool)

(assert (=> b!1512164 m!1394909))

(assert (=> b!1512164 m!1394909))

(assert (=> b!1512164 m!1394905))

(declare-fun m!1394911 () Bool)

(assert (=> b!1512164 m!1394911))

(declare-fun m!1394913 () Bool)

(assert (=> start!128974 m!1394913))

(declare-fun m!1394915 () Bool)

(assert (=> start!128974 m!1394915))

(assert (=> b!1512161 m!1394905))

(assert (=> b!1512161 m!1394905))

(declare-fun m!1394917 () Bool)

(assert (=> b!1512161 m!1394917))

(assert (=> b!1512161 m!1394905))

(declare-fun m!1394919 () Bool)

(assert (=> b!1512161 m!1394919))

(assert (=> b!1512168 m!1394905))

(assert (=> b!1512168 m!1394905))

(declare-fun m!1394921 () Bool)

(assert (=> b!1512168 m!1394921))

(declare-fun m!1394923 () Bool)

(assert (=> b!1512160 m!1394923))

(declare-fun m!1394925 () Bool)

(assert (=> b!1512160 m!1394925))

(declare-fun m!1394927 () Bool)

(assert (=> b!1512158 m!1394927))

(declare-fun m!1394929 () Bool)

(assert (=> b!1512159 m!1394929))

(assert (=> b!1512159 m!1394929))

(declare-fun m!1394931 () Bool)

(assert (=> b!1512159 m!1394931))

(assert (=> b!1512169 m!1394905))

(assert (=> b!1512169 m!1394905))

(declare-fun m!1394933 () Bool)

(assert (=> b!1512169 m!1394933))

(declare-fun m!1394935 () Bool)

(assert (=> b!1512167 m!1394935))

(declare-fun m!1394937 () Bool)

(assert (=> b!1512163 m!1394937))

(declare-fun m!1394939 () Bool)

(assert (=> b!1512163 m!1394939))

(assert (=> b!1512163 m!1394939))

(declare-fun m!1394941 () Bool)

(assert (=> b!1512163 m!1394941))

(assert (=> b!1512163 m!1394941))

(assert (=> b!1512163 m!1394939))

(declare-fun m!1394943 () Bool)

(assert (=> b!1512163 m!1394943))

(assert (=> b!1512162 m!1394905))

(assert (=> b!1512162 m!1394937))

(assert (=> b!1512162 m!1394939))

(declare-fun m!1394945 () Bool)

(assert (=> b!1512162 m!1394945))

(push 1)

