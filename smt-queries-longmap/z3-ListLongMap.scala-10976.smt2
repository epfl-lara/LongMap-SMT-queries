; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128822 () Bool)

(assert start!128822)

(declare-fun b!1508819 () Bool)

(declare-fun res!1027969 () Bool)

(declare-fun e!843201 () Bool)

(assert (=> b!1508819 (=> (not res!1027969) (not e!843201))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100648 0))(
  ( (array!100649 (arr!48562 (Array (_ BitVec 32) (_ BitVec 64))) (size!49113 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100648)

(assert (=> b!1508819 (= res!1027969 (and (= (size!49113 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49113 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49113 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508820 () Bool)

(declare-fun res!1027973 () Bool)

(assert (=> b!1508820 (=> (not res!1027973) (not e!843201))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1508820 (= res!1027973 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49113 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49113 a!2804))))))

(declare-fun b!1508821 () Bool)

(declare-fun res!1027965 () Bool)

(assert (=> b!1508821 (=> (not res!1027965) (not e!843201))))

(declare-datatypes ((List!35032 0))(
  ( (Nil!35029) (Cons!35028 (h!36443 (_ BitVec 64)) (t!49718 List!35032)) )
))
(declare-fun arrayNoDuplicates!0 (array!100648 (_ BitVec 32) List!35032) Bool)

(assert (=> b!1508821 (= res!1027965 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35029))))

(declare-fun b!1508822 () Bool)

(declare-fun e!843199 () Bool)

(assert (=> b!1508822 (= e!843201 e!843199)))

(declare-fun res!1027967 () Bool)

(assert (=> b!1508822 (=> (not res!1027967) (not e!843199))))

(declare-datatypes ((SeekEntryResult!12626 0))(
  ( (MissingZero!12626 (index!52899 (_ BitVec 32))) (Found!12626 (index!52900 (_ BitVec 32))) (Intermediate!12626 (undefined!13438 Bool) (index!52901 (_ BitVec 32)) (x!134853 (_ BitVec 32))) (Undefined!12626) (MissingVacant!12626 (index!52902 (_ BitVec 32))) )
))
(declare-fun lt!654952 () SeekEntryResult!12626)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100648 (_ BitVec 32)) SeekEntryResult!12626)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508822 (= res!1027967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512) (select (arr!48562 a!2804) j!70) a!2804 mask!2512) lt!654952))))

(assert (=> b!1508822 (= lt!654952 (Intermediate!12626 false resIndex!21 resX!21))))

(declare-fun b!1508823 () Bool)

(assert (=> b!1508823 (= e!843199 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1508824 () Bool)

(declare-fun res!1027970 () Bool)

(assert (=> b!1508824 (=> (not res!1027970) (not e!843201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100648 (_ BitVec 32)) Bool)

(assert (=> b!1508824 (= res!1027970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508825 () Bool)

(declare-fun res!1027972 () Bool)

(assert (=> b!1508825 (=> (not res!1027972) (not e!843201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508825 (= res!1027972 (validKeyInArray!0 (select (arr!48562 a!2804) i!961)))))

(declare-fun res!1027968 () Bool)

(assert (=> start!128822 (=> (not res!1027968) (not e!843201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128822 (= res!1027968 (validMask!0 mask!2512))))

(assert (=> start!128822 e!843201))

(assert (=> start!128822 true))

(declare-fun array_inv!37843 (array!100648) Bool)

(assert (=> start!128822 (array_inv!37843 a!2804)))

(declare-fun b!1508826 () Bool)

(declare-fun res!1027966 () Bool)

(assert (=> b!1508826 (=> (not res!1027966) (not e!843199))))

(assert (=> b!1508826 (= res!1027966 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48562 a!2804) j!70) a!2804 mask!2512) lt!654952))))

(declare-fun b!1508827 () Bool)

(declare-fun res!1027971 () Bool)

(assert (=> b!1508827 (=> (not res!1027971) (not e!843201))))

(assert (=> b!1508827 (= res!1027971 (validKeyInArray!0 (select (arr!48562 a!2804) j!70)))))

(assert (= (and start!128822 res!1027968) b!1508819))

(assert (= (and b!1508819 res!1027969) b!1508825))

(assert (= (and b!1508825 res!1027972) b!1508827))

(assert (= (and b!1508827 res!1027971) b!1508824))

(assert (= (and b!1508824 res!1027970) b!1508821))

(assert (= (and b!1508821 res!1027965) b!1508820))

(assert (= (and b!1508820 res!1027973) b!1508822))

(assert (= (and b!1508822 res!1027967) b!1508826))

(assert (= (and b!1508826 res!1027966) b!1508823))

(declare-fun m!1391661 () Bool)

(assert (=> b!1508825 m!1391661))

(assert (=> b!1508825 m!1391661))

(declare-fun m!1391663 () Bool)

(assert (=> b!1508825 m!1391663))

(declare-fun m!1391665 () Bool)

(assert (=> b!1508824 m!1391665))

(declare-fun m!1391667 () Bool)

(assert (=> b!1508826 m!1391667))

(assert (=> b!1508826 m!1391667))

(declare-fun m!1391669 () Bool)

(assert (=> b!1508826 m!1391669))

(assert (=> b!1508827 m!1391667))

(assert (=> b!1508827 m!1391667))

(declare-fun m!1391671 () Bool)

(assert (=> b!1508827 m!1391671))

(declare-fun m!1391673 () Bool)

(assert (=> start!128822 m!1391673))

(declare-fun m!1391675 () Bool)

(assert (=> start!128822 m!1391675))

(assert (=> b!1508822 m!1391667))

(assert (=> b!1508822 m!1391667))

(declare-fun m!1391677 () Bool)

(assert (=> b!1508822 m!1391677))

(assert (=> b!1508822 m!1391677))

(assert (=> b!1508822 m!1391667))

(declare-fun m!1391679 () Bool)

(assert (=> b!1508822 m!1391679))

(declare-fun m!1391681 () Bool)

(assert (=> b!1508821 m!1391681))

(check-sat (not b!1508825) (not b!1508821) (not b!1508826) (not b!1508824) (not b!1508827) (not b!1508822) (not start!128822))
(check-sat)
(get-model)

(declare-fun d!158773 () Bool)

(assert (=> d!158773 (= (validKeyInArray!0 (select (arr!48562 a!2804) j!70)) (and (not (= (select (arr!48562 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48562 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508827 d!158773))

(declare-fun b!1508908 () Bool)

(declare-fun lt!654969 () SeekEntryResult!12626)

(assert (=> b!1508908 (and (bvsge (index!52901 lt!654969) #b00000000000000000000000000000000) (bvslt (index!52901 lt!654969) (size!49113 a!2804)))))

(declare-fun res!1028040 () Bool)

(assert (=> b!1508908 (= res!1028040 (= (select (arr!48562 a!2804) (index!52901 lt!654969)) (select (arr!48562 a!2804) j!70)))))

(declare-fun e!843239 () Bool)

(assert (=> b!1508908 (=> res!1028040 e!843239)))

(declare-fun e!843236 () Bool)

(assert (=> b!1508908 (= e!843236 e!843239)))

(declare-fun b!1508909 () Bool)

(declare-fun e!843240 () SeekEntryResult!12626)

(assert (=> b!1508909 (= e!843240 (Intermediate!12626 true (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508911 () Bool)

(declare-fun e!843237 () Bool)

(assert (=> b!1508911 (= e!843237 (bvsge (x!134853 lt!654969) #b01111111111111111111111111111110))))

(declare-fun e!843238 () SeekEntryResult!12626)

(declare-fun b!1508912 () Bool)

(assert (=> b!1508912 (= e!843238 (Intermediate!12626 false (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508913 () Bool)

(assert (=> b!1508913 (and (bvsge (index!52901 lt!654969) #b00000000000000000000000000000000) (bvslt (index!52901 lt!654969) (size!49113 a!2804)))))

(assert (=> b!1508913 (= e!843239 (= (select (arr!48562 a!2804) (index!52901 lt!654969)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508914 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508914 (= e!843238 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48562 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508915 () Bool)

(assert (=> b!1508915 (and (bvsge (index!52901 lt!654969) #b00000000000000000000000000000000) (bvslt (index!52901 lt!654969) (size!49113 a!2804)))))

(declare-fun res!1028039 () Bool)

(assert (=> b!1508915 (= res!1028039 (= (select (arr!48562 a!2804) (index!52901 lt!654969)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1508915 (=> res!1028039 e!843239)))

(declare-fun b!1508916 () Bool)

(assert (=> b!1508916 (= e!843240 e!843238)))

(declare-fun lt!654970 () (_ BitVec 64))

(declare-fun c!139982 () Bool)

(assert (=> b!1508916 (= c!139982 (or (= lt!654970 (select (arr!48562 a!2804) j!70)) (= (bvadd lt!654970 lt!654970) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508910 () Bool)

(assert (=> b!1508910 (= e!843237 e!843236)))

(declare-fun res!1028038 () Bool)

(get-info :version)

(assert (=> b!1508910 (= res!1028038 (and ((_ is Intermediate!12626) lt!654969) (not (undefined!13438 lt!654969)) (bvslt (x!134853 lt!654969) #b01111111111111111111111111111110) (bvsge (x!134853 lt!654969) #b00000000000000000000000000000000) (bvsge (x!134853 lt!654969) #b00000000000000000000000000000000)))))

(assert (=> b!1508910 (=> (not res!1028038) (not e!843236))))

(declare-fun d!158775 () Bool)

(assert (=> d!158775 e!843237))

(declare-fun c!139983 () Bool)

(assert (=> d!158775 (= c!139983 (and ((_ is Intermediate!12626) lt!654969) (undefined!13438 lt!654969)))))

(assert (=> d!158775 (= lt!654969 e!843240)))

(declare-fun c!139981 () Bool)

(assert (=> d!158775 (= c!139981 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158775 (= lt!654970 (select (arr!48562 a!2804) (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512)))))

(assert (=> d!158775 (validMask!0 mask!2512)))

(assert (=> d!158775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512) (select (arr!48562 a!2804) j!70) a!2804 mask!2512) lt!654969)))

(assert (= (and d!158775 c!139981) b!1508909))

(assert (= (and d!158775 (not c!139981)) b!1508916))

(assert (= (and b!1508916 c!139982) b!1508912))

(assert (= (and b!1508916 (not c!139982)) b!1508914))

(assert (= (and d!158775 c!139983) b!1508911))

(assert (= (and d!158775 (not c!139983)) b!1508910))

(assert (= (and b!1508910 res!1028038) b!1508908))

(assert (= (and b!1508908 (not res!1028040)) b!1508915))

(assert (= (and b!1508915 (not res!1028039)) b!1508913))

(assert (=> b!1508914 m!1391677))

(declare-fun m!1391727 () Bool)

(assert (=> b!1508914 m!1391727))

(assert (=> b!1508914 m!1391727))

(assert (=> b!1508914 m!1391667))

(declare-fun m!1391729 () Bool)

(assert (=> b!1508914 m!1391729))

(declare-fun m!1391731 () Bool)

(assert (=> b!1508915 m!1391731))

(assert (=> d!158775 m!1391677))

(declare-fun m!1391733 () Bool)

(assert (=> d!158775 m!1391733))

(assert (=> d!158775 m!1391673))

(assert (=> b!1508913 m!1391731))

(assert (=> b!1508908 m!1391731))

(assert (=> b!1508822 d!158775))

(declare-fun d!158781 () Bool)

(declare-fun lt!654983 () (_ BitVec 32))

(declare-fun lt!654982 () (_ BitVec 32))

(assert (=> d!158781 (= lt!654983 (bvmul (bvxor lt!654982 (bvlshr lt!654982 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158781 (= lt!654982 ((_ extract 31 0) (bvand (bvxor (select (arr!48562 a!2804) j!70) (bvlshr (select (arr!48562 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158781 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028043 (let ((h!36446 ((_ extract 31 0) (bvand (bvxor (select (arr!48562 a!2804) j!70) (bvlshr (select (arr!48562 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134857 (bvmul (bvxor h!36446 (bvlshr h!36446 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134857 (bvlshr x!134857 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028043 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028043 #b00000000000000000000000000000000))))))

(assert (=> d!158781 (= (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512) (bvand (bvxor lt!654983 (bvlshr lt!654983 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508822 d!158781))

(declare-fun b!1508973 () Bool)

(declare-fun e!843279 () Bool)

(declare-fun contains!10009 (List!35032 (_ BitVec 64)) Bool)

(assert (=> b!1508973 (= e!843279 (contains!10009 Nil!35029 (select (arr!48562 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508974 () Bool)

(declare-fun e!843281 () Bool)

(declare-fun call!68352 () Bool)

(assert (=> b!1508974 (= e!843281 call!68352)))

(declare-fun d!158785 () Bool)

(declare-fun res!1028068 () Bool)

(declare-fun e!843280 () Bool)

(assert (=> d!158785 (=> res!1028068 e!843280)))

(assert (=> d!158785 (= res!1028068 (bvsge #b00000000000000000000000000000000 (size!49113 a!2804)))))

(assert (=> d!158785 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35029) e!843280)))

(declare-fun b!1508975 () Bool)

(assert (=> b!1508975 (= e!843281 call!68352)))

(declare-fun b!1508976 () Bool)

(declare-fun e!843282 () Bool)

(assert (=> b!1508976 (= e!843280 e!843282)))

(declare-fun res!1028070 () Bool)

(assert (=> b!1508976 (=> (not res!1028070) (not e!843282))))

(assert (=> b!1508976 (= res!1028070 (not e!843279))))

(declare-fun res!1028069 () Bool)

(assert (=> b!1508976 (=> (not res!1028069) (not e!843279))))

(assert (=> b!1508976 (= res!1028069 (validKeyInArray!0 (select (arr!48562 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68349 () Bool)

(declare-fun c!139999 () Bool)

(assert (=> bm!68349 (= call!68352 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139999 (Cons!35028 (select (arr!48562 a!2804) #b00000000000000000000000000000000) Nil!35029) Nil!35029)))))

(declare-fun b!1508977 () Bool)

(assert (=> b!1508977 (= e!843282 e!843281)))

(assert (=> b!1508977 (= c!139999 (validKeyInArray!0 (select (arr!48562 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158785 (not res!1028068)) b!1508976))

(assert (= (and b!1508976 res!1028069) b!1508973))

(assert (= (and b!1508976 res!1028070) b!1508977))

(assert (= (and b!1508977 c!139999) b!1508975))

(assert (= (and b!1508977 (not c!139999)) b!1508974))

(assert (= (or b!1508975 b!1508974) bm!68349))

(declare-fun m!1391759 () Bool)

(assert (=> b!1508973 m!1391759))

(assert (=> b!1508973 m!1391759))

(declare-fun m!1391761 () Bool)

(assert (=> b!1508973 m!1391761))

(assert (=> b!1508976 m!1391759))

(assert (=> b!1508976 m!1391759))

(declare-fun m!1391763 () Bool)

(assert (=> b!1508976 m!1391763))

(assert (=> bm!68349 m!1391759))

(declare-fun m!1391765 () Bool)

(assert (=> bm!68349 m!1391765))

(assert (=> b!1508977 m!1391759))

(assert (=> b!1508977 m!1391759))

(assert (=> b!1508977 m!1391763))

(assert (=> b!1508821 d!158785))

(declare-fun b!1508978 () Bool)

(declare-fun lt!654986 () SeekEntryResult!12626)

(assert (=> b!1508978 (and (bvsge (index!52901 lt!654986) #b00000000000000000000000000000000) (bvslt (index!52901 lt!654986) (size!49113 a!2804)))))

(declare-fun res!1028074 () Bool)

(assert (=> b!1508978 (= res!1028074 (= (select (arr!48562 a!2804) (index!52901 lt!654986)) (select (arr!48562 a!2804) j!70)))))

(declare-fun e!843286 () Bool)

(assert (=> b!1508978 (=> res!1028074 e!843286)))

(declare-fun e!843283 () Bool)

(assert (=> b!1508978 (= e!843283 e!843286)))

(declare-fun b!1508979 () Bool)

(declare-fun e!843287 () SeekEntryResult!12626)

(assert (=> b!1508979 (= e!843287 (Intermediate!12626 true index!487 x!534))))

(declare-fun b!1508981 () Bool)

(declare-fun e!843284 () Bool)

(assert (=> b!1508981 (= e!843284 (bvsge (x!134853 lt!654986) #b01111111111111111111111111111110))))

(declare-fun b!1508982 () Bool)

(declare-fun e!843285 () SeekEntryResult!12626)

(assert (=> b!1508982 (= e!843285 (Intermediate!12626 false index!487 x!534))))

(declare-fun b!1508983 () Bool)

(assert (=> b!1508983 (and (bvsge (index!52901 lt!654986) #b00000000000000000000000000000000) (bvslt (index!52901 lt!654986) (size!49113 a!2804)))))

(assert (=> b!1508983 (= e!843286 (= (select (arr!48562 a!2804) (index!52901 lt!654986)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508984 () Bool)

(assert (=> b!1508984 (= e!843285 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48562 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508985 () Bool)

(assert (=> b!1508985 (and (bvsge (index!52901 lt!654986) #b00000000000000000000000000000000) (bvslt (index!52901 lt!654986) (size!49113 a!2804)))))

(declare-fun res!1028073 () Bool)

(assert (=> b!1508985 (= res!1028073 (= (select (arr!48562 a!2804) (index!52901 lt!654986)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1508985 (=> res!1028073 e!843286)))

(declare-fun b!1508986 () Bool)

(assert (=> b!1508986 (= e!843287 e!843285)))

(declare-fun lt!654987 () (_ BitVec 64))

(declare-fun c!140001 () Bool)

(assert (=> b!1508986 (= c!140001 (or (= lt!654987 (select (arr!48562 a!2804) j!70)) (= (bvadd lt!654987 lt!654987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508980 () Bool)

(assert (=> b!1508980 (= e!843284 e!843283)))

(declare-fun res!1028072 () Bool)

(assert (=> b!1508980 (= res!1028072 (and ((_ is Intermediate!12626) lt!654986) (not (undefined!13438 lt!654986)) (bvslt (x!134853 lt!654986) #b01111111111111111111111111111110) (bvsge (x!134853 lt!654986) #b00000000000000000000000000000000) (bvsge (x!134853 lt!654986) x!534)))))

(assert (=> b!1508980 (=> (not res!1028072) (not e!843283))))

(declare-fun d!158793 () Bool)

(assert (=> d!158793 e!843284))

(declare-fun c!140002 () Bool)

(assert (=> d!158793 (= c!140002 (and ((_ is Intermediate!12626) lt!654986) (undefined!13438 lt!654986)))))

(assert (=> d!158793 (= lt!654986 e!843287)))

(declare-fun c!140000 () Bool)

(assert (=> d!158793 (= c!140000 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158793 (= lt!654987 (select (arr!48562 a!2804) index!487))))

(assert (=> d!158793 (validMask!0 mask!2512)))

(assert (=> d!158793 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48562 a!2804) j!70) a!2804 mask!2512) lt!654986)))

(assert (= (and d!158793 c!140000) b!1508979))

(assert (= (and d!158793 (not c!140000)) b!1508986))

(assert (= (and b!1508986 c!140001) b!1508982))

(assert (= (and b!1508986 (not c!140001)) b!1508984))

(assert (= (and d!158793 c!140002) b!1508981))

(assert (= (and d!158793 (not c!140002)) b!1508980))

(assert (= (and b!1508980 res!1028072) b!1508978))

(assert (= (and b!1508978 (not res!1028074)) b!1508985))

(assert (= (and b!1508985 (not res!1028073)) b!1508983))

(declare-fun m!1391767 () Bool)

(assert (=> b!1508984 m!1391767))

(assert (=> b!1508984 m!1391767))

(assert (=> b!1508984 m!1391667))

(declare-fun m!1391769 () Bool)

(assert (=> b!1508984 m!1391769))

(declare-fun m!1391771 () Bool)

(assert (=> b!1508985 m!1391771))

(declare-fun m!1391773 () Bool)

(assert (=> d!158793 m!1391773))

(assert (=> d!158793 m!1391673))

(assert (=> b!1508983 m!1391771))

(assert (=> b!1508978 m!1391771))

(assert (=> b!1508826 d!158793))

(declare-fun d!158795 () Bool)

(assert (=> d!158795 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128822 d!158795))

(declare-fun d!158801 () Bool)

(assert (=> d!158801 (= (array_inv!37843 a!2804) (bvsge (size!49113 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128822 d!158801))

(declare-fun d!158803 () Bool)

(assert (=> d!158803 (= (validKeyInArray!0 (select (arr!48562 a!2804) i!961)) (and (not (= (select (arr!48562 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48562 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508825 d!158803))

(declare-fun b!1509046 () Bool)

(declare-fun e!843327 () Bool)

(declare-fun call!68358 () Bool)

(assert (=> b!1509046 (= e!843327 call!68358)))

(declare-fun bm!68355 () Bool)

(assert (=> bm!68355 (= call!68358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158807 () Bool)

(declare-fun res!1028101 () Bool)

(declare-fun e!843328 () Bool)

(assert (=> d!158807 (=> res!1028101 e!843328)))

(assert (=> d!158807 (= res!1028101 (bvsge #b00000000000000000000000000000000 (size!49113 a!2804)))))

(assert (=> d!158807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!843328)))

(declare-fun b!1509047 () Bool)

(declare-fun e!843326 () Bool)

(assert (=> b!1509047 (= e!843328 e!843326)))

(declare-fun c!140020 () Bool)

(assert (=> b!1509047 (= c!140020 (validKeyInArray!0 (select (arr!48562 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1509048 () Bool)

(assert (=> b!1509048 (= e!843326 call!68358)))

(declare-fun b!1509049 () Bool)

(assert (=> b!1509049 (= e!843326 e!843327)))

(declare-fun lt!655008 () (_ BitVec 64))

(assert (=> b!1509049 (= lt!655008 (select (arr!48562 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50255 0))(
  ( (Unit!50256) )
))
(declare-fun lt!655010 () Unit!50255)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100648 (_ BitVec 64) (_ BitVec 32)) Unit!50255)

(assert (=> b!1509049 (= lt!655010 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!655008 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1509049 (arrayContainsKey!0 a!2804 lt!655008 #b00000000000000000000000000000000)))

(declare-fun lt!655009 () Unit!50255)

(assert (=> b!1509049 (= lt!655009 lt!655010)))

(declare-fun res!1028102 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100648 (_ BitVec 32)) SeekEntryResult!12626)

(assert (=> b!1509049 (= res!1028102 (= (seekEntryOrOpen!0 (select (arr!48562 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12626 #b00000000000000000000000000000000)))))

(assert (=> b!1509049 (=> (not res!1028102) (not e!843327))))

(assert (= (and d!158807 (not res!1028101)) b!1509047))

(assert (= (and b!1509047 c!140020) b!1509049))

(assert (= (and b!1509047 (not c!140020)) b!1509048))

(assert (= (and b!1509049 res!1028102) b!1509046))

(assert (= (or b!1509046 b!1509048) bm!68355))

(declare-fun m!1391799 () Bool)

(assert (=> bm!68355 m!1391799))

(assert (=> b!1509047 m!1391759))

(assert (=> b!1509047 m!1391759))

(assert (=> b!1509047 m!1391763))

(assert (=> b!1509049 m!1391759))

(declare-fun m!1391801 () Bool)

(assert (=> b!1509049 m!1391801))

(declare-fun m!1391803 () Bool)

(assert (=> b!1509049 m!1391803))

(assert (=> b!1509049 m!1391759))

(declare-fun m!1391805 () Bool)

(assert (=> b!1509049 m!1391805))

(assert (=> b!1508824 d!158807))

(check-sat (not bm!68355) (not b!1508976) (not d!158775) (not b!1508984) (not b!1508914) (not b!1509047) (not bm!68349) (not b!1509049) (not b!1508977) (not b!1508973) (not d!158793))
(check-sat)
