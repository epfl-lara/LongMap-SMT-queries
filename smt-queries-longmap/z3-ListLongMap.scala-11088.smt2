; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129866 () Bool)

(assert start!129866)

(declare-fun b!1522764 () Bool)

(declare-fun e!849555 () Bool)

(declare-fun e!849554 () Bool)

(assert (=> b!1522764 (= e!849555 e!849554)))

(declare-fun res!1040750 () Bool)

(assert (=> b!1522764 (=> (not res!1040750) (not e!849554))))

(declare-datatypes ((SeekEntryResult!12962 0))(
  ( (MissingZero!12962 (index!54243 (_ BitVec 32))) (Found!12962 (index!54244 (_ BitVec 32))) (Intermediate!12962 (undefined!13774 Bool) (index!54245 (_ BitVec 32)) (x!136133 (_ BitVec 32))) (Undefined!12962) (MissingVacant!12962 (index!54246 (_ BitVec 32))) )
))
(declare-fun lt!659965 () SeekEntryResult!12962)

(declare-fun lt!659963 () SeekEntryResult!12962)

(assert (=> b!1522764 (= res!1040750 (= lt!659965 lt!659963))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522764 (= lt!659963 (Intermediate!12962 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101341 0))(
  ( (array!101342 (arr!48898 (Array (_ BitVec 32) (_ BitVec 64))) (size!49449 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101341)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101341 (_ BitVec 32)) SeekEntryResult!12962)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522764 (= lt!659965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) (select (arr!48898 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522765 () Bool)

(declare-fun res!1040753 () Bool)

(assert (=> b!1522765 (=> (not res!1040753) (not e!849554))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522765 (= res!1040753 (= lt!659965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)) mask!2512)))))

(declare-fun b!1522766 () Bool)

(declare-fun res!1040751 () Bool)

(assert (=> b!1522766 (=> (not res!1040751) (not e!849555))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522766 (= res!1040751 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49449 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49449 a!2804))))))

(declare-fun res!1040746 () Bool)

(assert (=> start!129866 (=> (not res!1040746) (not e!849555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129866 (= res!1040746 (validMask!0 mask!2512))))

(assert (=> start!129866 e!849555))

(assert (=> start!129866 true))

(declare-fun array_inv!38179 (array!101341) Bool)

(assert (=> start!129866 (array_inv!38179 a!2804)))

(declare-fun b!1522767 () Bool)

(declare-fun res!1040752 () Bool)

(assert (=> b!1522767 (=> (not res!1040752) (not e!849555))))

(declare-datatypes ((List!35368 0))(
  ( (Nil!35365) (Cons!35364 (h!36800 (_ BitVec 64)) (t!50054 List!35368)) )
))
(declare-fun arrayNoDuplicates!0 (array!101341 (_ BitVec 32) List!35368) Bool)

(assert (=> b!1522767 (= res!1040752 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35365))))

(declare-fun e!849553 () Bool)

(declare-fun b!1522768 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101341 (_ BitVec 32)) SeekEntryResult!12962)

(assert (=> b!1522768 (= e!849553 (= (seekEntry!0 (select (arr!48898 a!2804) j!70) a!2804 mask!2512) (Found!12962 j!70)))))

(declare-fun b!1522769 () Bool)

(declare-fun res!1040745 () Bool)

(assert (=> b!1522769 (=> (not res!1040745) (not e!849555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522769 (= res!1040745 (validKeyInArray!0 (select (arr!48898 a!2804) i!961)))))

(declare-fun b!1522770 () Bool)

(declare-fun res!1040744 () Bool)

(assert (=> b!1522770 (=> (not res!1040744) (not e!849555))))

(assert (=> b!1522770 (= res!1040744 (validKeyInArray!0 (select (arr!48898 a!2804) j!70)))))

(declare-fun b!1522771 () Bool)

(declare-fun res!1040749 () Bool)

(assert (=> b!1522771 (=> (not res!1040749) (not e!849554))))

(assert (=> b!1522771 (= res!1040749 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48898 a!2804) j!70) a!2804 mask!2512) lt!659963))))

(declare-fun b!1522772 () Bool)

(declare-fun res!1040743 () Bool)

(assert (=> b!1522772 (=> (not res!1040743) (not e!849555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101341 (_ BitVec 32)) Bool)

(assert (=> b!1522772 (= res!1040743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522773 () Bool)

(assert (=> b!1522773 (= e!849554 (not (or (not (= (select (arr!48898 a!2804) j!70) (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48898 a!2804) index!487) (select (arr!48898 a!2804) j!70)) (= (select (arr!48898 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522773 e!849553))

(declare-fun res!1040747 () Bool)

(assert (=> b!1522773 (=> (not res!1040747) (not e!849553))))

(assert (=> b!1522773 (= res!1040747 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50827 0))(
  ( (Unit!50828) )
))
(declare-fun lt!659964 () Unit!50827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50827)

(assert (=> b!1522773 (= lt!659964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522774 () Bool)

(declare-fun res!1040748 () Bool)

(assert (=> b!1522774 (=> (not res!1040748) (not e!849555))))

(assert (=> b!1522774 (= res!1040748 (and (= (size!49449 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49449 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49449 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129866 res!1040746) b!1522774))

(assert (= (and b!1522774 res!1040748) b!1522769))

(assert (= (and b!1522769 res!1040745) b!1522770))

(assert (= (and b!1522770 res!1040744) b!1522772))

(assert (= (and b!1522772 res!1040743) b!1522767))

(assert (= (and b!1522767 res!1040752) b!1522766))

(assert (= (and b!1522766 res!1040751) b!1522764))

(assert (= (and b!1522764 res!1040750) b!1522771))

(assert (= (and b!1522771 res!1040749) b!1522765))

(assert (= (and b!1522765 res!1040753) b!1522773))

(assert (= (and b!1522773 res!1040747) b!1522768))

(declare-fun m!1405851 () Bool)

(assert (=> b!1522767 m!1405851))

(declare-fun m!1405853 () Bool)

(assert (=> b!1522765 m!1405853))

(declare-fun m!1405855 () Bool)

(assert (=> b!1522765 m!1405855))

(assert (=> b!1522765 m!1405855))

(declare-fun m!1405857 () Bool)

(assert (=> b!1522765 m!1405857))

(assert (=> b!1522765 m!1405857))

(assert (=> b!1522765 m!1405855))

(declare-fun m!1405859 () Bool)

(assert (=> b!1522765 m!1405859))

(declare-fun m!1405861 () Bool)

(assert (=> b!1522764 m!1405861))

(assert (=> b!1522764 m!1405861))

(declare-fun m!1405863 () Bool)

(assert (=> b!1522764 m!1405863))

(assert (=> b!1522764 m!1405863))

(assert (=> b!1522764 m!1405861))

(declare-fun m!1405865 () Bool)

(assert (=> b!1522764 m!1405865))

(assert (=> b!1522768 m!1405861))

(assert (=> b!1522768 m!1405861))

(declare-fun m!1405867 () Bool)

(assert (=> b!1522768 m!1405867))

(assert (=> b!1522773 m!1405861))

(declare-fun m!1405869 () Bool)

(assert (=> b!1522773 m!1405869))

(assert (=> b!1522773 m!1405853))

(declare-fun m!1405871 () Bool)

(assert (=> b!1522773 m!1405871))

(assert (=> b!1522773 m!1405855))

(declare-fun m!1405873 () Bool)

(assert (=> b!1522773 m!1405873))

(assert (=> b!1522770 m!1405861))

(assert (=> b!1522770 m!1405861))

(declare-fun m!1405875 () Bool)

(assert (=> b!1522770 m!1405875))

(declare-fun m!1405877 () Bool)

(assert (=> b!1522772 m!1405877))

(assert (=> b!1522771 m!1405861))

(assert (=> b!1522771 m!1405861))

(declare-fun m!1405879 () Bool)

(assert (=> b!1522771 m!1405879))

(declare-fun m!1405881 () Bool)

(assert (=> start!129866 m!1405881))

(declare-fun m!1405883 () Bool)

(assert (=> start!129866 m!1405883))

(declare-fun m!1405885 () Bool)

(assert (=> b!1522769 m!1405885))

(assert (=> b!1522769 m!1405885))

(declare-fun m!1405887 () Bool)

(assert (=> b!1522769 m!1405887))

(check-sat (not b!1522773) (not b!1522772) (not b!1522770) (not b!1522765) (not b!1522771) (not b!1522768) (not b!1522767) (not start!129866) (not b!1522769) (not b!1522764))
(check-sat)
(get-model)

(declare-fun b!1522859 () Bool)

(declare-fun lt!659989 () SeekEntryResult!12962)

(assert (=> b!1522859 (and (bvsge (index!54245 lt!659989) #b00000000000000000000000000000000) (bvslt (index!54245 lt!659989) (size!49449 a!2804)))))

(declare-fun res!1040826 () Bool)

(assert (=> b!1522859 (= res!1040826 (= (select (arr!48898 a!2804) (index!54245 lt!659989)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849590 () Bool)

(assert (=> b!1522859 (=> res!1040826 e!849590)))

(declare-fun e!849591 () SeekEntryResult!12962)

(declare-fun b!1522860 () Bool)

(assert (=> b!1522860 (= e!849591 (Intermediate!12962 true (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522861 () Bool)

(assert (=> b!1522861 (and (bvsge (index!54245 lt!659989) #b00000000000000000000000000000000) (bvslt (index!54245 lt!659989) (size!49449 a!2804)))))

(assert (=> b!1522861 (= e!849590 (= (select (arr!48898 a!2804) (index!54245 lt!659989)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522862 () Bool)

(declare-fun e!849594 () SeekEntryResult!12962)

(assert (=> b!1522862 (= e!849591 e!849594)))

(declare-fun lt!659988 () (_ BitVec 64))

(declare-fun c!140574 () Bool)

(assert (=> b!1522862 (= c!140574 (or (= lt!659988 (select (arr!48898 a!2804) j!70)) (= (bvadd lt!659988 lt!659988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522863 () Bool)

(assert (=> b!1522863 (= e!849594 (Intermediate!12962 false (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522864 () Bool)

(declare-fun e!849592 () Bool)

(declare-fun e!849593 () Bool)

(assert (=> b!1522864 (= e!849592 e!849593)))

(declare-fun res!1040827 () Bool)

(get-info :version)

(assert (=> b!1522864 (= res!1040827 (and ((_ is Intermediate!12962) lt!659989) (not (undefined!13774 lt!659989)) (bvslt (x!136133 lt!659989) #b01111111111111111111111111111110) (bvsge (x!136133 lt!659989) #b00000000000000000000000000000000) (bvsge (x!136133 lt!659989) #b00000000000000000000000000000000)))))

(assert (=> b!1522864 (=> (not res!1040827) (not e!849593))))

(declare-fun b!1522865 () Bool)

(assert (=> b!1522865 (= e!849592 (bvsge (x!136133 lt!659989) #b01111111111111111111111111111110))))

(declare-fun b!1522866 () Bool)

(assert (=> b!1522866 (and (bvsge (index!54245 lt!659989) #b00000000000000000000000000000000) (bvslt (index!54245 lt!659989) (size!49449 a!2804)))))

(declare-fun res!1040828 () Bool)

(assert (=> b!1522866 (= res!1040828 (= (select (arr!48898 a!2804) (index!54245 lt!659989)) (select (arr!48898 a!2804) j!70)))))

(assert (=> b!1522866 (=> res!1040828 e!849590)))

(assert (=> b!1522866 (= e!849593 e!849590)))

(declare-fun d!159585 () Bool)

(assert (=> d!159585 e!849592))

(declare-fun c!140575 () Bool)

(assert (=> d!159585 (= c!140575 (and ((_ is Intermediate!12962) lt!659989) (undefined!13774 lt!659989)))))

(assert (=> d!159585 (= lt!659989 e!849591)))

(declare-fun c!140573 () Bool)

(assert (=> d!159585 (= c!140573 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159585 (= lt!659988 (select (arr!48898 a!2804) (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512)))))

(assert (=> d!159585 (validMask!0 mask!2512)))

(assert (=> d!159585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) (select (arr!48898 a!2804) j!70) a!2804 mask!2512) lt!659989)))

(declare-fun b!1522867 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522867 (= e!849594 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48898 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159585 c!140573) b!1522860))

(assert (= (and d!159585 (not c!140573)) b!1522862))

(assert (= (and b!1522862 c!140574) b!1522863))

(assert (= (and b!1522862 (not c!140574)) b!1522867))

(assert (= (and d!159585 c!140575) b!1522865))

(assert (= (and d!159585 (not c!140575)) b!1522864))

(assert (= (and b!1522864 res!1040827) b!1522866))

(assert (= (and b!1522866 (not res!1040828)) b!1522859))

(assert (= (and b!1522859 (not res!1040826)) b!1522861))

(assert (=> d!159585 m!1405863))

(declare-fun m!1405965 () Bool)

(assert (=> d!159585 m!1405965))

(assert (=> d!159585 m!1405881))

(declare-fun m!1405967 () Bool)

(assert (=> b!1522861 m!1405967))

(assert (=> b!1522866 m!1405967))

(assert (=> b!1522867 m!1405863))

(declare-fun m!1405969 () Bool)

(assert (=> b!1522867 m!1405969))

(assert (=> b!1522867 m!1405969))

(assert (=> b!1522867 m!1405861))

(declare-fun m!1405971 () Bool)

(assert (=> b!1522867 m!1405971))

(assert (=> b!1522859 m!1405967))

(assert (=> b!1522764 d!159585))

(declare-fun d!159589 () Bool)

(declare-fun lt!660007 () (_ BitVec 32))

(declare-fun lt!660006 () (_ BitVec 32))

(assert (=> d!159589 (= lt!660007 (bvmul (bvxor lt!660006 (bvlshr lt!660006 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159589 (= lt!660006 ((_ extract 31 0) (bvand (bvxor (select (arr!48898 a!2804) j!70) (bvlshr (select (arr!48898 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159589 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040833 (let ((h!36803 ((_ extract 31 0) (bvand (bvxor (select (arr!48898 a!2804) j!70) (bvlshr (select (arr!48898 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136137 (bvmul (bvxor h!36803 (bvlshr h!36803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136137 (bvlshr x!136137 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040833 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040833 #b00000000000000000000000000000000))))))

(assert (=> d!159589 (= (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) (bvand (bvxor lt!660007 (bvlshr lt!660007 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522764 d!159589))

(declare-fun d!159595 () Bool)

(assert (=> d!159595 (= (validKeyInArray!0 (select (arr!48898 a!2804) j!70)) (and (not (= (select (arr!48898 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48898 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522770 d!159595))

(declare-fun b!1522880 () Bool)

(declare-fun lt!660009 () SeekEntryResult!12962)

(assert (=> b!1522880 (and (bvsge (index!54245 lt!660009) #b00000000000000000000000000000000) (bvslt (index!54245 lt!660009) (size!49449 (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(declare-fun res!1040836 () Bool)

(assert (=> b!1522880 (= res!1040836 (= (select (arr!48898 (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54245 lt!660009)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849604 () Bool)

(assert (=> b!1522880 (=> res!1040836 e!849604)))

(declare-fun b!1522881 () Bool)

(declare-fun e!849605 () SeekEntryResult!12962)

(assert (=> b!1522881 (= e!849605 (Intermediate!12962 true (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522882 () Bool)

(assert (=> b!1522882 (and (bvsge (index!54245 lt!660009) #b00000000000000000000000000000000) (bvslt (index!54245 lt!660009) (size!49449 (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(assert (=> b!1522882 (= e!849604 (= (select (arr!48898 (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54245 lt!660009)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522883 () Bool)

(declare-fun e!849608 () SeekEntryResult!12962)

(assert (=> b!1522883 (= e!849605 e!849608)))

(declare-fun lt!660008 () (_ BitVec 64))

(declare-fun c!140580 () Bool)

(assert (=> b!1522883 (= c!140580 (or (= lt!660008 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!660008 lt!660008) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522884 () Bool)

(assert (=> b!1522884 (= e!849608 (Intermediate!12962 false (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522885 () Bool)

(declare-fun e!849606 () Bool)

(declare-fun e!849607 () Bool)

(assert (=> b!1522885 (= e!849606 e!849607)))

(declare-fun res!1040837 () Bool)

(assert (=> b!1522885 (= res!1040837 (and ((_ is Intermediate!12962) lt!660009) (not (undefined!13774 lt!660009)) (bvslt (x!136133 lt!660009) #b01111111111111111111111111111110) (bvsge (x!136133 lt!660009) #b00000000000000000000000000000000) (bvsge (x!136133 lt!660009) #b00000000000000000000000000000000)))))

(assert (=> b!1522885 (=> (not res!1040837) (not e!849607))))

(declare-fun b!1522886 () Bool)

(assert (=> b!1522886 (= e!849606 (bvsge (x!136133 lt!660009) #b01111111111111111111111111111110))))

(declare-fun b!1522887 () Bool)

(assert (=> b!1522887 (and (bvsge (index!54245 lt!660009) #b00000000000000000000000000000000) (bvslt (index!54245 lt!660009) (size!49449 (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(declare-fun res!1040838 () Bool)

(assert (=> b!1522887 (= res!1040838 (= (select (arr!48898 (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54245 lt!660009)) (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1522887 (=> res!1040838 e!849604)))

(assert (=> b!1522887 (= e!849607 e!849604)))

(declare-fun d!159599 () Bool)

(assert (=> d!159599 e!849606))

(declare-fun c!140581 () Bool)

(assert (=> d!159599 (= c!140581 (and ((_ is Intermediate!12962) lt!660009) (undefined!13774 lt!660009)))))

(assert (=> d!159599 (= lt!660009 e!849605)))

(declare-fun c!140579 () Bool)

(assert (=> d!159599 (= c!140579 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159599 (= lt!660008 (select (arr!48898 (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159599 (validMask!0 mask!2512)))

(assert (=> d!159599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)) mask!2512) lt!660009)))

(declare-fun b!1522888 () Bool)

(assert (=> b!1522888 (= e!849608 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101342 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)) mask!2512))))

(assert (= (and d!159599 c!140579) b!1522881))

(assert (= (and d!159599 (not c!140579)) b!1522883))

(assert (= (and b!1522883 c!140580) b!1522884))

(assert (= (and b!1522883 (not c!140580)) b!1522888))

(assert (= (and d!159599 c!140581) b!1522886))

(assert (= (and d!159599 (not c!140581)) b!1522885))

(assert (= (and b!1522885 res!1040837) b!1522887))

(assert (= (and b!1522887 (not res!1040838)) b!1522880))

(assert (= (and b!1522880 (not res!1040836)) b!1522882))

(assert (=> d!159599 m!1405857))

(declare-fun m!1405983 () Bool)

(assert (=> d!159599 m!1405983))

(assert (=> d!159599 m!1405881))

(declare-fun m!1405985 () Bool)

(assert (=> b!1522882 m!1405985))

(assert (=> b!1522887 m!1405985))

(assert (=> b!1522888 m!1405857))

(declare-fun m!1405987 () Bool)

(assert (=> b!1522888 m!1405987))

(assert (=> b!1522888 m!1405987))

(assert (=> b!1522888 m!1405855))

(declare-fun m!1405989 () Bool)

(assert (=> b!1522888 m!1405989))

(assert (=> b!1522880 m!1405985))

(assert (=> b!1522765 d!159599))

(declare-fun d!159601 () Bool)

(declare-fun lt!660011 () (_ BitVec 32))

(declare-fun lt!660010 () (_ BitVec 32))

(assert (=> d!159601 (= lt!660011 (bvmul (bvxor lt!660010 (bvlshr lt!660010 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159601 (= lt!660010 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159601 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040833 (let ((h!36803 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136137 (bvmul (bvxor h!36803 (bvlshr h!36803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136137 (bvlshr x!136137 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040833 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040833 #b00000000000000000000000000000000))))))

(assert (=> d!159601 (= (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!660011 (bvlshr lt!660011 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522765 d!159601))

(declare-fun b!1522943 () Bool)

(declare-fun e!849642 () SeekEntryResult!12962)

(declare-fun lt!660028 () SeekEntryResult!12962)

(assert (=> b!1522943 (= e!849642 (ite ((_ is MissingVacant!12962) lt!660028) (MissingZero!12962 (index!54246 lt!660028)) lt!660028))))

(declare-fun lt!660029 () SeekEntryResult!12962)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101341 (_ BitVec 32)) SeekEntryResult!12962)

(assert (=> b!1522943 (= lt!660028 (seekKeyOrZeroReturnVacant!0 (x!136133 lt!660029) (index!54245 lt!660029) (index!54245 lt!660029) (select (arr!48898 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522944 () Bool)

(declare-fun e!849644 () SeekEntryResult!12962)

(declare-fun e!849643 () SeekEntryResult!12962)

(assert (=> b!1522944 (= e!849644 e!849643)))

(declare-fun lt!660027 () (_ BitVec 64))

(assert (=> b!1522944 (= lt!660027 (select (arr!48898 a!2804) (index!54245 lt!660029)))))

(declare-fun c!140600 () Bool)

(assert (=> b!1522944 (= c!140600 (= lt!660027 (select (arr!48898 a!2804) j!70)))))

(declare-fun b!1522945 () Bool)

(assert (=> b!1522945 (= e!849644 Undefined!12962)))

(declare-fun d!159603 () Bool)

(declare-fun lt!660026 () SeekEntryResult!12962)

(assert (=> d!159603 (and (or ((_ is MissingVacant!12962) lt!660026) (not ((_ is Found!12962) lt!660026)) (and (bvsge (index!54244 lt!660026) #b00000000000000000000000000000000) (bvslt (index!54244 lt!660026) (size!49449 a!2804)))) (not ((_ is MissingVacant!12962) lt!660026)) (or (not ((_ is Found!12962) lt!660026)) (= (select (arr!48898 a!2804) (index!54244 lt!660026)) (select (arr!48898 a!2804) j!70))))))

(assert (=> d!159603 (= lt!660026 e!849644)))

(declare-fun c!140602 () Bool)

(assert (=> d!159603 (= c!140602 (and ((_ is Intermediate!12962) lt!660029) (undefined!13774 lt!660029)))))

(assert (=> d!159603 (= lt!660029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) (select (arr!48898 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159603 (validMask!0 mask!2512)))

(assert (=> d!159603 (= (seekEntry!0 (select (arr!48898 a!2804) j!70) a!2804 mask!2512) lt!660026)))

(declare-fun b!1522946 () Bool)

(assert (=> b!1522946 (= e!849643 (Found!12962 (index!54245 lt!660029)))))

(declare-fun b!1522947 () Bool)

(assert (=> b!1522947 (= e!849642 (MissingZero!12962 (index!54245 lt!660029)))))

(declare-fun b!1522948 () Bool)

(declare-fun c!140601 () Bool)

(assert (=> b!1522948 (= c!140601 (= lt!660027 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522948 (= e!849643 e!849642)))

(assert (= (and d!159603 c!140602) b!1522945))

(assert (= (and d!159603 (not c!140602)) b!1522944))

(assert (= (and b!1522944 c!140600) b!1522946))

(assert (= (and b!1522944 (not c!140600)) b!1522948))

(assert (= (and b!1522948 c!140601) b!1522947))

(assert (= (and b!1522948 (not c!140601)) b!1522943))

(assert (=> b!1522943 m!1405861))

(declare-fun m!1406005 () Bool)

(assert (=> b!1522943 m!1406005))

(declare-fun m!1406007 () Bool)

(assert (=> b!1522944 m!1406007))

(declare-fun m!1406009 () Bool)

(assert (=> d!159603 m!1406009))

(assert (=> d!159603 m!1405861))

(assert (=> d!159603 m!1405863))

(assert (=> d!159603 m!1405863))

(assert (=> d!159603 m!1405861))

(assert (=> d!159603 m!1405865))

(assert (=> d!159603 m!1405881))

(assert (=> b!1522768 d!159603))

(declare-fun d!159611 () Bool)

(assert (=> d!159611 (= (validKeyInArray!0 (select (arr!48898 a!2804) i!961)) (and (not (= (select (arr!48898 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48898 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522769 d!159611))

(declare-fun bm!68493 () Bool)

(declare-fun call!68496 () Bool)

(assert (=> bm!68493 (= call!68496 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1522957 () Bool)

(declare-fun e!849651 () Bool)

(assert (=> b!1522957 (= e!849651 call!68496)))

(declare-fun b!1522958 () Bool)

(declare-fun e!849652 () Bool)

(assert (=> b!1522958 (= e!849652 call!68496)))

(declare-fun b!1522959 () Bool)

(assert (=> b!1522959 (= e!849651 e!849652)))

(declare-fun lt!660036 () (_ BitVec 64))

(assert (=> b!1522959 (= lt!660036 (select (arr!48898 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660038 () Unit!50827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101341 (_ BitVec 64) (_ BitVec 32)) Unit!50827)

(assert (=> b!1522959 (= lt!660038 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660036 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1522959 (arrayContainsKey!0 a!2804 lt!660036 #b00000000000000000000000000000000)))

(declare-fun lt!660037 () Unit!50827)

(assert (=> b!1522959 (= lt!660037 lt!660038)))

(declare-fun res!1040861 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101341 (_ BitVec 32)) SeekEntryResult!12962)

(assert (=> b!1522959 (= res!1040861 (= (seekEntryOrOpen!0 (select (arr!48898 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12962 #b00000000000000000000000000000000)))))

(assert (=> b!1522959 (=> (not res!1040861) (not e!849652))))

(declare-fun d!159613 () Bool)

(declare-fun res!1040862 () Bool)

(declare-fun e!849653 () Bool)

(assert (=> d!159613 (=> res!1040862 e!849653)))

(assert (=> d!159613 (= res!1040862 (bvsge #b00000000000000000000000000000000 (size!49449 a!2804)))))

(assert (=> d!159613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849653)))

(declare-fun b!1522960 () Bool)

(assert (=> b!1522960 (= e!849653 e!849651)))

(declare-fun c!140605 () Bool)

(assert (=> b!1522960 (= c!140605 (validKeyInArray!0 (select (arr!48898 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159613 (not res!1040862)) b!1522960))

(assert (= (and b!1522960 c!140605) b!1522959))

(assert (= (and b!1522960 (not c!140605)) b!1522957))

(assert (= (and b!1522959 res!1040861) b!1522958))

(assert (= (or b!1522958 b!1522957) bm!68493))

(declare-fun m!1406011 () Bool)

(assert (=> bm!68493 m!1406011))

(declare-fun m!1406013 () Bool)

(assert (=> b!1522959 m!1406013))

(declare-fun m!1406015 () Bool)

(assert (=> b!1522959 m!1406015))

(declare-fun m!1406017 () Bool)

(assert (=> b!1522959 m!1406017))

(assert (=> b!1522959 m!1406013))

(declare-fun m!1406019 () Bool)

(assert (=> b!1522959 m!1406019))

(assert (=> b!1522960 m!1406013))

(assert (=> b!1522960 m!1406013))

(declare-fun m!1406021 () Bool)

(assert (=> b!1522960 m!1406021))

(assert (=> b!1522772 d!159613))

(declare-fun d!159623 () Bool)

(assert (=> d!159623 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129866 d!159623))

(declare-fun d!159629 () Bool)

(assert (=> d!159629 (= (array_inv!38179 a!2804) (bvsge (size!49449 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129866 d!159629))

(declare-fun b!1523017 () Bool)

(declare-fun e!849693 () Bool)

(declare-fun e!849694 () Bool)

(assert (=> b!1523017 (= e!849693 e!849694)))

(declare-fun res!1040891 () Bool)

(assert (=> b!1523017 (=> (not res!1040891) (not e!849694))))

(declare-fun e!849695 () Bool)

(assert (=> b!1523017 (= res!1040891 (not e!849695))))

(declare-fun res!1040890 () Bool)

(assert (=> b!1523017 (=> (not res!1040890) (not e!849695))))

(assert (=> b!1523017 (= res!1040890 (validKeyInArray!0 (select (arr!48898 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159631 () Bool)

(declare-fun res!1040892 () Bool)

(assert (=> d!159631 (=> res!1040892 e!849693)))

(assert (=> d!159631 (= res!1040892 (bvsge #b00000000000000000000000000000000 (size!49449 a!2804)))))

(assert (=> d!159631 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35365) e!849693)))

(declare-fun b!1523018 () Bool)

(declare-fun e!849692 () Bool)

(declare-fun call!68503 () Bool)

(assert (=> b!1523018 (= e!849692 call!68503)))

(declare-fun b!1523019 () Bool)

(declare-fun contains!10032 (List!35368 (_ BitVec 64)) Bool)

(assert (=> b!1523019 (= e!849695 (contains!10032 Nil!35365 (select (arr!48898 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523020 () Bool)

(assert (=> b!1523020 (= e!849694 e!849692)))

(declare-fun c!140621 () Bool)

(assert (=> b!1523020 (= c!140621 (validKeyInArray!0 (select (arr!48898 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523021 () Bool)

(assert (=> b!1523021 (= e!849692 call!68503)))

(declare-fun bm!68500 () Bool)

(assert (=> bm!68500 (= call!68503 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140621 (Cons!35364 (select (arr!48898 a!2804) #b00000000000000000000000000000000) Nil!35365) Nil!35365)))))

(assert (= (and d!159631 (not res!1040892)) b!1523017))

(assert (= (and b!1523017 res!1040890) b!1523019))

(assert (= (and b!1523017 res!1040891) b!1523020))

(assert (= (and b!1523020 c!140621) b!1523021))

(assert (= (and b!1523020 (not c!140621)) b!1523018))

(assert (= (or b!1523021 b!1523018) bm!68500))

(assert (=> b!1523017 m!1406013))

(assert (=> b!1523017 m!1406013))

(assert (=> b!1523017 m!1406021))

(assert (=> b!1523019 m!1406013))

(assert (=> b!1523019 m!1406013))

(declare-fun m!1406047 () Bool)

(assert (=> b!1523019 m!1406047))

(assert (=> b!1523020 m!1406013))

(assert (=> b!1523020 m!1406013))

(assert (=> b!1523020 m!1406021))

(assert (=> bm!68500 m!1406013))

(declare-fun m!1406049 () Bool)

(assert (=> bm!68500 m!1406049))

(assert (=> b!1522767 d!159631))

(declare-fun bm!68501 () Bool)

(declare-fun call!68504 () Bool)

(assert (=> bm!68501 (= call!68504 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1523022 () Bool)

(declare-fun e!849696 () Bool)

(assert (=> b!1523022 (= e!849696 call!68504)))

(declare-fun b!1523023 () Bool)

(declare-fun e!849697 () Bool)

(assert (=> b!1523023 (= e!849697 call!68504)))

(declare-fun b!1523024 () Bool)

(assert (=> b!1523024 (= e!849696 e!849697)))

(declare-fun lt!660054 () (_ BitVec 64))

(assert (=> b!1523024 (= lt!660054 (select (arr!48898 a!2804) j!70))))

(declare-fun lt!660056 () Unit!50827)

(assert (=> b!1523024 (= lt!660056 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660054 j!70))))

(assert (=> b!1523024 (arrayContainsKey!0 a!2804 lt!660054 #b00000000000000000000000000000000)))

(declare-fun lt!660055 () Unit!50827)

(assert (=> b!1523024 (= lt!660055 lt!660056)))

(declare-fun res!1040893 () Bool)

(assert (=> b!1523024 (= res!1040893 (= (seekEntryOrOpen!0 (select (arr!48898 a!2804) j!70) a!2804 mask!2512) (Found!12962 j!70)))))

(assert (=> b!1523024 (=> (not res!1040893) (not e!849697))))

(declare-fun d!159637 () Bool)

(declare-fun res!1040894 () Bool)

(declare-fun e!849698 () Bool)

(assert (=> d!159637 (=> res!1040894 e!849698)))

(assert (=> d!159637 (= res!1040894 (bvsge j!70 (size!49449 a!2804)))))

(assert (=> d!159637 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849698)))

(declare-fun b!1523025 () Bool)

(assert (=> b!1523025 (= e!849698 e!849696)))

(declare-fun c!140622 () Bool)

(assert (=> b!1523025 (= c!140622 (validKeyInArray!0 (select (arr!48898 a!2804) j!70)))))

(assert (= (and d!159637 (not res!1040894)) b!1523025))

(assert (= (and b!1523025 c!140622) b!1523024))

(assert (= (and b!1523025 (not c!140622)) b!1523022))

(assert (= (and b!1523024 res!1040893) b!1523023))

(assert (= (or b!1523023 b!1523022) bm!68501))

(declare-fun m!1406051 () Bool)

(assert (=> bm!68501 m!1406051))

(assert (=> b!1523024 m!1405861))

(declare-fun m!1406053 () Bool)

(assert (=> b!1523024 m!1406053))

(declare-fun m!1406055 () Bool)

(assert (=> b!1523024 m!1406055))

(assert (=> b!1523024 m!1405861))

(declare-fun m!1406057 () Bool)

(assert (=> b!1523024 m!1406057))

(assert (=> b!1523025 m!1405861))

(assert (=> b!1523025 m!1405861))

(assert (=> b!1523025 m!1405875))

(assert (=> b!1522773 d!159637))

(declare-fun d!159639 () Bool)

(assert (=> d!159639 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660061 () Unit!50827)

(declare-fun choose!38 (array!101341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50827)

(assert (=> d!159639 (= lt!660061 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159639 (validMask!0 mask!2512)))

(assert (=> d!159639 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660061)))

(declare-fun bs!43654 () Bool)

(assert (= bs!43654 d!159639))

(assert (=> bs!43654 m!1405873))

(declare-fun m!1406067 () Bool)

(assert (=> bs!43654 m!1406067))

(assert (=> bs!43654 m!1405881))

(assert (=> b!1522773 d!159639))

(declare-fun b!1523035 () Bool)

(declare-fun lt!660063 () SeekEntryResult!12962)

(assert (=> b!1523035 (and (bvsge (index!54245 lt!660063) #b00000000000000000000000000000000) (bvslt (index!54245 lt!660063) (size!49449 a!2804)))))

(declare-fun res!1040899 () Bool)

(assert (=> b!1523035 (= res!1040899 (= (select (arr!48898 a!2804) (index!54245 lt!660063)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849704 () Bool)

(assert (=> b!1523035 (=> res!1040899 e!849704)))

(declare-fun b!1523036 () Bool)

(declare-fun e!849705 () SeekEntryResult!12962)

(assert (=> b!1523036 (= e!849705 (Intermediate!12962 true index!487 x!534))))

(declare-fun b!1523037 () Bool)

(assert (=> b!1523037 (and (bvsge (index!54245 lt!660063) #b00000000000000000000000000000000) (bvslt (index!54245 lt!660063) (size!49449 a!2804)))))

(assert (=> b!1523037 (= e!849704 (= (select (arr!48898 a!2804) (index!54245 lt!660063)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1523038 () Bool)

(declare-fun e!849708 () SeekEntryResult!12962)

(assert (=> b!1523038 (= e!849705 e!849708)))

(declare-fun lt!660062 () (_ BitVec 64))

(declare-fun c!140627 () Bool)

(assert (=> b!1523038 (= c!140627 (or (= lt!660062 (select (arr!48898 a!2804) j!70)) (= (bvadd lt!660062 lt!660062) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1523039 () Bool)

(assert (=> b!1523039 (= e!849708 (Intermediate!12962 false index!487 x!534))))

(declare-fun b!1523040 () Bool)

(declare-fun e!849706 () Bool)

(declare-fun e!849707 () Bool)

(assert (=> b!1523040 (= e!849706 e!849707)))

(declare-fun res!1040900 () Bool)

(assert (=> b!1523040 (= res!1040900 (and ((_ is Intermediate!12962) lt!660063) (not (undefined!13774 lt!660063)) (bvslt (x!136133 lt!660063) #b01111111111111111111111111111110) (bvsge (x!136133 lt!660063) #b00000000000000000000000000000000) (bvsge (x!136133 lt!660063) x!534)))))

(assert (=> b!1523040 (=> (not res!1040900) (not e!849707))))

(declare-fun b!1523041 () Bool)

(assert (=> b!1523041 (= e!849706 (bvsge (x!136133 lt!660063) #b01111111111111111111111111111110))))

(declare-fun b!1523042 () Bool)

(assert (=> b!1523042 (and (bvsge (index!54245 lt!660063) #b00000000000000000000000000000000) (bvslt (index!54245 lt!660063) (size!49449 a!2804)))))

(declare-fun res!1040901 () Bool)

(assert (=> b!1523042 (= res!1040901 (= (select (arr!48898 a!2804) (index!54245 lt!660063)) (select (arr!48898 a!2804) j!70)))))

(assert (=> b!1523042 (=> res!1040901 e!849704)))

(assert (=> b!1523042 (= e!849707 e!849704)))

(declare-fun d!159643 () Bool)

(assert (=> d!159643 e!849706))

(declare-fun c!140628 () Bool)

(assert (=> d!159643 (= c!140628 (and ((_ is Intermediate!12962) lt!660063) (undefined!13774 lt!660063)))))

(assert (=> d!159643 (= lt!660063 e!849705)))

(declare-fun c!140626 () Bool)

(assert (=> d!159643 (= c!140626 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159643 (= lt!660062 (select (arr!48898 a!2804) index!487))))

(assert (=> d!159643 (validMask!0 mask!2512)))

(assert (=> d!159643 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48898 a!2804) j!70) a!2804 mask!2512) lt!660063)))

(declare-fun b!1523043 () Bool)

(assert (=> b!1523043 (= e!849708 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48898 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159643 c!140626) b!1523036))

(assert (= (and d!159643 (not c!140626)) b!1523038))

(assert (= (and b!1523038 c!140627) b!1523039))

(assert (= (and b!1523038 (not c!140627)) b!1523043))

(assert (= (and d!159643 c!140628) b!1523041))

(assert (= (and d!159643 (not c!140628)) b!1523040))

(assert (= (and b!1523040 res!1040900) b!1523042))

(assert (= (and b!1523042 (not res!1040901)) b!1523035))

(assert (= (and b!1523035 (not res!1040899)) b!1523037))

(assert (=> d!159643 m!1405871))

(assert (=> d!159643 m!1405881))

(declare-fun m!1406069 () Bool)

(assert (=> b!1523037 m!1406069))

(assert (=> b!1523042 m!1406069))

(declare-fun m!1406071 () Bool)

(assert (=> b!1523043 m!1406071))

(assert (=> b!1523043 m!1406071))

(assert (=> b!1523043 m!1405861))

(declare-fun m!1406073 () Bool)

(assert (=> b!1523043 m!1406073))

(assert (=> b!1523035 m!1406069))

(assert (=> b!1522771 d!159643))

(check-sat (not b!1523019) (not b!1522867) (not b!1523020) (not b!1523043) (not b!1522959) (not d!159585) (not b!1522888) (not b!1522943) (not d!159643) (not d!159603) (not b!1523017) (not d!159599) (not bm!68493) (not bm!68500) (not b!1523024) (not bm!68501) (not b!1523025) (not b!1522960) (not d!159639))
(check-sat)
