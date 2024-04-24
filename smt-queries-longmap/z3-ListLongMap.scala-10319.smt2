; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121424 () Bool)

(assert start!121424)

(declare-fun b!1410818 () Bool)

(declare-fun res!947858 () Bool)

(declare-fun e!798454 () Bool)

(assert (=> b!1410818 (=> (not res!947858) (not e!798454))))

(declare-datatypes ((array!96500 0))(
  ( (array!96501 (arr!46591 (Array (_ BitVec 32) (_ BitVec 64))) (size!47142 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96500)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410818 (= res!947858 (validKeyInArray!0 (select (arr!46591 a!2901) j!112)))))

(declare-fun b!1410819 () Bool)

(declare-fun e!798455 () Bool)

(declare-datatypes ((SeekEntryResult!10805 0))(
  ( (MissingZero!10805 (index!45597 (_ BitVec 32))) (Found!10805 (index!45598 (_ BitVec 32))) (Intermediate!10805 (undefined!11617 Bool) (index!45599 (_ BitVec 32)) (x!127337 (_ BitVec 32))) (Undefined!10805) (MissingVacant!10805 (index!45600 (_ BitVec 32))) )
))
(declare-fun lt!621211 () SeekEntryResult!10805)

(declare-fun lt!621210 () SeekEntryResult!10805)

(get-info :version)

(assert (=> b!1410819 (= e!798455 (or (= lt!621211 lt!621210) (not ((_ is Intermediate!10805) lt!621210)) (and (bvsge (x!127337 lt!621211) #b00000000000000000000000000000000) (bvsle (x!127337 lt!621211) #b01111111111111111111111111111110))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96500 (_ BitVec 32)) SeekEntryResult!10805)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410819 (= lt!621210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901)) mask!2840))))

(declare-fun e!798453 () Bool)

(declare-fun b!1410820 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96500 (_ BitVec 32)) SeekEntryResult!10805)

(assert (=> b!1410820 (= e!798453 (= (seekEntryOrOpen!0 (select (arr!46591 a!2901) j!112) a!2901 mask!2840) (Found!10805 j!112)))))

(declare-fun b!1410822 () Bool)

(declare-fun res!947863 () Bool)

(assert (=> b!1410822 (=> (not res!947863) (not e!798454))))

(assert (=> b!1410822 (= res!947863 (validKeyInArray!0 (select (arr!46591 a!2901) i!1037)))))

(declare-fun b!1410823 () Bool)

(declare-fun res!947862 () Bool)

(assert (=> b!1410823 (=> (not res!947862) (not e!798454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96500 (_ BitVec 32)) Bool)

(assert (=> b!1410823 (= res!947862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410824 () Bool)

(declare-fun res!947857 () Bool)

(assert (=> b!1410824 (=> (not res!947857) (not e!798454))))

(assert (=> b!1410824 (= res!947857 (and (= (size!47142 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47142 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47142 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410825 () Bool)

(assert (=> b!1410825 (= e!798454 (not e!798455))))

(declare-fun res!947861 () Bool)

(assert (=> b!1410825 (=> res!947861 e!798455)))

(assert (=> b!1410825 (= res!947861 (or (not ((_ is Intermediate!10805) lt!621211)) (undefined!11617 lt!621211)))))

(assert (=> b!1410825 e!798453))

(declare-fun res!947859 () Bool)

(assert (=> b!1410825 (=> (not res!947859) (not e!798453))))

(assert (=> b!1410825 (= res!947859 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47611 0))(
  ( (Unit!47612) )
))
(declare-fun lt!621212 () Unit!47611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47611)

(assert (=> b!1410825 (= lt!621212 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410825 (= lt!621211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840) (select (arr!46591 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!947856 () Bool)

(assert (=> start!121424 (=> (not res!947856) (not e!798454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121424 (= res!947856 (validMask!0 mask!2840))))

(assert (=> start!121424 e!798454))

(assert (=> start!121424 true))

(declare-fun array_inv!35872 (array!96500) Bool)

(assert (=> start!121424 (array_inv!35872 a!2901)))

(declare-fun b!1410821 () Bool)

(declare-fun res!947860 () Bool)

(assert (=> b!1410821 (=> (not res!947860) (not e!798454))))

(declare-datatypes ((List!33097 0))(
  ( (Nil!33094) (Cons!33093 (h!34364 (_ BitVec 64)) (t!47783 List!33097)) )
))
(declare-fun arrayNoDuplicates!0 (array!96500 (_ BitVec 32) List!33097) Bool)

(assert (=> b!1410821 (= res!947860 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33094))))

(assert (= (and start!121424 res!947856) b!1410824))

(assert (= (and b!1410824 res!947857) b!1410822))

(assert (= (and b!1410822 res!947863) b!1410818))

(assert (= (and b!1410818 res!947858) b!1410823))

(assert (= (and b!1410823 res!947862) b!1410821))

(assert (= (and b!1410821 res!947860) b!1410825))

(assert (= (and b!1410825 res!947859) b!1410820))

(assert (= (and b!1410825 (not res!947861)) b!1410819))

(declare-fun m!1300867 () Bool)

(assert (=> b!1410819 m!1300867))

(declare-fun m!1300869 () Bool)

(assert (=> b!1410819 m!1300869))

(assert (=> b!1410819 m!1300869))

(declare-fun m!1300871 () Bool)

(assert (=> b!1410819 m!1300871))

(assert (=> b!1410819 m!1300871))

(assert (=> b!1410819 m!1300869))

(declare-fun m!1300873 () Bool)

(assert (=> b!1410819 m!1300873))

(declare-fun m!1300875 () Bool)

(assert (=> b!1410821 m!1300875))

(declare-fun m!1300877 () Bool)

(assert (=> b!1410823 m!1300877))

(declare-fun m!1300879 () Bool)

(assert (=> start!121424 m!1300879))

(declare-fun m!1300881 () Bool)

(assert (=> start!121424 m!1300881))

(declare-fun m!1300883 () Bool)

(assert (=> b!1410822 m!1300883))

(assert (=> b!1410822 m!1300883))

(declare-fun m!1300885 () Bool)

(assert (=> b!1410822 m!1300885))

(declare-fun m!1300887 () Bool)

(assert (=> b!1410825 m!1300887))

(declare-fun m!1300889 () Bool)

(assert (=> b!1410825 m!1300889))

(assert (=> b!1410825 m!1300887))

(declare-fun m!1300891 () Bool)

(assert (=> b!1410825 m!1300891))

(assert (=> b!1410825 m!1300889))

(assert (=> b!1410825 m!1300887))

(declare-fun m!1300893 () Bool)

(assert (=> b!1410825 m!1300893))

(declare-fun m!1300895 () Bool)

(assert (=> b!1410825 m!1300895))

(assert (=> b!1410820 m!1300887))

(assert (=> b!1410820 m!1300887))

(declare-fun m!1300897 () Bool)

(assert (=> b!1410820 m!1300897))

(assert (=> b!1410818 m!1300887))

(assert (=> b!1410818 m!1300887))

(declare-fun m!1300899 () Bool)

(assert (=> b!1410818 m!1300899))

(check-sat (not start!121424) (not b!1410820) (not b!1410822) (not b!1410823) (not b!1410819) (not b!1410821) (not b!1410818) (not b!1410825))
(check-sat)
(get-model)

(declare-fun b!1410884 () Bool)

(declare-fun e!798488 () Bool)

(declare-fun e!798489 () Bool)

(assert (=> b!1410884 (= e!798488 e!798489)))

(declare-fun res!947920 () Bool)

(assert (=> b!1410884 (=> (not res!947920) (not e!798489))))

(declare-fun e!798491 () Bool)

(assert (=> b!1410884 (= res!947920 (not e!798491))))

(declare-fun res!947919 () Bool)

(assert (=> b!1410884 (=> (not res!947919) (not e!798491))))

(assert (=> b!1410884 (= res!947919 (validKeyInArray!0 (select (arr!46591 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152071 () Bool)

(declare-fun res!947918 () Bool)

(assert (=> d!152071 (=> res!947918 e!798488)))

(assert (=> d!152071 (= res!947918 (bvsge #b00000000000000000000000000000000 (size!47142 a!2901)))))

(assert (=> d!152071 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33094) e!798488)))

(declare-fun b!1410885 () Bool)

(declare-fun e!798490 () Bool)

(declare-fun call!67074 () Bool)

(assert (=> b!1410885 (= e!798490 call!67074)))

(declare-fun b!1410886 () Bool)

(assert (=> b!1410886 (= e!798489 e!798490)))

(declare-fun c!130957 () Bool)

(assert (=> b!1410886 (= c!130957 (validKeyInArray!0 (select (arr!46591 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67071 () Bool)

(assert (=> bm!67071 (= call!67074 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130957 (Cons!33093 (select (arr!46591 a!2901) #b00000000000000000000000000000000) Nil!33094) Nil!33094)))))

(declare-fun b!1410887 () Bool)

(declare-fun contains!9844 (List!33097 (_ BitVec 64)) Bool)

(assert (=> b!1410887 (= e!798491 (contains!9844 Nil!33094 (select (arr!46591 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410888 () Bool)

(assert (=> b!1410888 (= e!798490 call!67074)))

(assert (= (and d!152071 (not res!947918)) b!1410884))

(assert (= (and b!1410884 res!947919) b!1410887))

(assert (= (and b!1410884 res!947920) b!1410886))

(assert (= (and b!1410886 c!130957) b!1410885))

(assert (= (and b!1410886 (not c!130957)) b!1410888))

(assert (= (or b!1410885 b!1410888) bm!67071))

(declare-fun m!1300969 () Bool)

(assert (=> b!1410884 m!1300969))

(assert (=> b!1410884 m!1300969))

(declare-fun m!1300971 () Bool)

(assert (=> b!1410884 m!1300971))

(assert (=> b!1410886 m!1300969))

(assert (=> b!1410886 m!1300969))

(assert (=> b!1410886 m!1300971))

(assert (=> bm!67071 m!1300969))

(declare-fun m!1300973 () Bool)

(assert (=> bm!67071 m!1300973))

(assert (=> b!1410887 m!1300969))

(assert (=> b!1410887 m!1300969))

(declare-fun m!1300975 () Bool)

(assert (=> b!1410887 m!1300975))

(assert (=> b!1410821 d!152071))

(declare-fun b!1410897 () Bool)

(declare-fun e!798498 () Bool)

(declare-fun call!67077 () Bool)

(assert (=> b!1410897 (= e!798498 call!67077)))

(declare-fun bm!67074 () Bool)

(assert (=> bm!67074 (= call!67077 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152073 () Bool)

(declare-fun res!947926 () Bool)

(declare-fun e!798500 () Bool)

(assert (=> d!152073 (=> res!947926 e!798500)))

(assert (=> d!152073 (= res!947926 (bvsge j!112 (size!47142 a!2901)))))

(assert (=> d!152073 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798500)))

(declare-fun b!1410898 () Bool)

(declare-fun e!798499 () Bool)

(assert (=> b!1410898 (= e!798499 call!67077)))

(declare-fun b!1410899 () Bool)

(assert (=> b!1410899 (= e!798500 e!798499)))

(declare-fun c!130960 () Bool)

(assert (=> b!1410899 (= c!130960 (validKeyInArray!0 (select (arr!46591 a!2901) j!112)))))

(declare-fun b!1410900 () Bool)

(assert (=> b!1410900 (= e!798499 e!798498)))

(declare-fun lt!621239 () (_ BitVec 64))

(assert (=> b!1410900 (= lt!621239 (select (arr!46591 a!2901) j!112))))

(declare-fun lt!621238 () Unit!47611)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96500 (_ BitVec 64) (_ BitVec 32)) Unit!47611)

(assert (=> b!1410900 (= lt!621238 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621239 j!112))))

(declare-fun arrayContainsKey!0 (array!96500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410900 (arrayContainsKey!0 a!2901 lt!621239 #b00000000000000000000000000000000)))

(declare-fun lt!621237 () Unit!47611)

(assert (=> b!1410900 (= lt!621237 lt!621238)))

(declare-fun res!947925 () Bool)

(assert (=> b!1410900 (= res!947925 (= (seekEntryOrOpen!0 (select (arr!46591 a!2901) j!112) a!2901 mask!2840) (Found!10805 j!112)))))

(assert (=> b!1410900 (=> (not res!947925) (not e!798498))))

(assert (= (and d!152073 (not res!947926)) b!1410899))

(assert (= (and b!1410899 c!130960) b!1410900))

(assert (= (and b!1410899 (not c!130960)) b!1410898))

(assert (= (and b!1410900 res!947925) b!1410897))

(assert (= (or b!1410897 b!1410898) bm!67074))

(declare-fun m!1300977 () Bool)

(assert (=> bm!67074 m!1300977))

(assert (=> b!1410899 m!1300887))

(assert (=> b!1410899 m!1300887))

(assert (=> b!1410899 m!1300899))

(assert (=> b!1410900 m!1300887))

(declare-fun m!1300979 () Bool)

(assert (=> b!1410900 m!1300979))

(declare-fun m!1300981 () Bool)

(assert (=> b!1410900 m!1300981))

(assert (=> b!1410900 m!1300887))

(assert (=> b!1410900 m!1300897))

(assert (=> b!1410825 d!152073))

(declare-fun d!152075 () Bool)

(assert (=> d!152075 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621242 () Unit!47611)

(declare-fun choose!38 (array!96500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47611)

(assert (=> d!152075 (= lt!621242 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152075 (validMask!0 mask!2840)))

(assert (=> d!152075 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621242)))

(declare-fun bs!41110 () Bool)

(assert (= bs!41110 d!152075))

(assert (=> bs!41110 m!1300895))

(declare-fun m!1300983 () Bool)

(assert (=> bs!41110 m!1300983))

(assert (=> bs!41110 m!1300879))

(assert (=> b!1410825 d!152075))

(declare-fun b!1410946 () Bool)

(declare-fun lt!621256 () SeekEntryResult!10805)

(assert (=> b!1410946 (and (bvsge (index!45599 lt!621256) #b00000000000000000000000000000000) (bvslt (index!45599 lt!621256) (size!47142 a!2901)))))

(declare-fun res!947950 () Bool)

(assert (=> b!1410946 (= res!947950 (= (select (arr!46591 a!2901) (index!45599 lt!621256)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798535 () Bool)

(assert (=> b!1410946 (=> res!947950 e!798535)))

(declare-fun b!1410947 () Bool)

(declare-fun e!798536 () SeekEntryResult!10805)

(assert (=> b!1410947 (= e!798536 (Intermediate!10805 false (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410948 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410948 (= e!798536 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46591 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410949 () Bool)

(declare-fun e!798532 () Bool)

(assert (=> b!1410949 (= e!798532 (bvsge (x!127337 lt!621256) #b01111111111111111111111111111110))))

(declare-fun e!798534 () SeekEntryResult!10805)

(declare-fun b!1410950 () Bool)

(assert (=> b!1410950 (= e!798534 (Intermediate!10805 true (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410951 () Bool)

(declare-fun e!798533 () Bool)

(assert (=> b!1410951 (= e!798532 e!798533)))

(declare-fun res!947949 () Bool)

(assert (=> b!1410951 (= res!947949 (and ((_ is Intermediate!10805) lt!621256) (not (undefined!11617 lt!621256)) (bvslt (x!127337 lt!621256) #b01111111111111111111111111111110) (bvsge (x!127337 lt!621256) #b00000000000000000000000000000000) (bvsge (x!127337 lt!621256) #b00000000000000000000000000000000)))))

(assert (=> b!1410951 (=> (not res!947949) (not e!798533))))

(declare-fun d!152081 () Bool)

(assert (=> d!152081 e!798532))

(declare-fun c!130975 () Bool)

(assert (=> d!152081 (= c!130975 (and ((_ is Intermediate!10805) lt!621256) (undefined!11617 lt!621256)))))

(assert (=> d!152081 (= lt!621256 e!798534)))

(declare-fun c!130974 () Bool)

(assert (=> d!152081 (= c!130974 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621257 () (_ BitVec 64))

(assert (=> d!152081 (= lt!621257 (select (arr!46591 a!2901) (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840)))))

(assert (=> d!152081 (validMask!0 mask!2840)))

(assert (=> d!152081 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840) (select (arr!46591 a!2901) j!112) a!2901 mask!2840) lt!621256)))

(declare-fun b!1410952 () Bool)

(assert (=> b!1410952 (and (bvsge (index!45599 lt!621256) #b00000000000000000000000000000000) (bvslt (index!45599 lt!621256) (size!47142 a!2901)))))

(declare-fun res!947948 () Bool)

(assert (=> b!1410952 (= res!947948 (= (select (arr!46591 a!2901) (index!45599 lt!621256)) (select (arr!46591 a!2901) j!112)))))

(assert (=> b!1410952 (=> res!947948 e!798535)))

(assert (=> b!1410952 (= e!798533 e!798535)))

(declare-fun b!1410953 () Bool)

(assert (=> b!1410953 (= e!798534 e!798536)))

(declare-fun c!130973 () Bool)

(assert (=> b!1410953 (= c!130973 (or (= lt!621257 (select (arr!46591 a!2901) j!112)) (= (bvadd lt!621257 lt!621257) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410954 () Bool)

(assert (=> b!1410954 (and (bvsge (index!45599 lt!621256) #b00000000000000000000000000000000) (bvslt (index!45599 lt!621256) (size!47142 a!2901)))))

(assert (=> b!1410954 (= e!798535 (= (select (arr!46591 a!2901) (index!45599 lt!621256)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152081 c!130974) b!1410950))

(assert (= (and d!152081 (not c!130974)) b!1410953))

(assert (= (and b!1410953 c!130973) b!1410947))

(assert (= (and b!1410953 (not c!130973)) b!1410948))

(assert (= (and d!152081 c!130975) b!1410949))

(assert (= (and d!152081 (not c!130975)) b!1410951))

(assert (= (and b!1410951 res!947949) b!1410952))

(assert (= (and b!1410952 (not res!947948)) b!1410946))

(assert (= (and b!1410946 (not res!947950)) b!1410954))

(declare-fun m!1301005 () Bool)

(assert (=> b!1410954 m!1301005))

(assert (=> b!1410946 m!1301005))

(assert (=> b!1410952 m!1301005))

(assert (=> b!1410948 m!1300889))

(declare-fun m!1301007 () Bool)

(assert (=> b!1410948 m!1301007))

(assert (=> b!1410948 m!1301007))

(assert (=> b!1410948 m!1300887))

(declare-fun m!1301009 () Bool)

(assert (=> b!1410948 m!1301009))

(assert (=> d!152081 m!1300889))

(declare-fun m!1301011 () Bool)

(assert (=> d!152081 m!1301011))

(assert (=> d!152081 m!1300879))

(assert (=> b!1410825 d!152081))

(declare-fun d!152093 () Bool)

(declare-fun lt!621267 () (_ BitVec 32))

(declare-fun lt!621266 () (_ BitVec 32))

(assert (=> d!152093 (= lt!621267 (bvmul (bvxor lt!621266 (bvlshr lt!621266 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152093 (= lt!621266 ((_ extract 31 0) (bvand (bvxor (select (arr!46591 a!2901) j!112) (bvlshr (select (arr!46591 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152093 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947951 (let ((h!34367 ((_ extract 31 0) (bvand (bvxor (select (arr!46591 a!2901) j!112) (bvlshr (select (arr!46591 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127341 (bvmul (bvxor h!34367 (bvlshr h!34367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127341 (bvlshr x!127341 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947951 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947951 #b00000000000000000000000000000000))))))

(assert (=> d!152093 (= (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840) (bvand (bvxor lt!621267 (bvlshr lt!621267 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410825 d!152093))

(declare-fun d!152095 () Bool)

(assert (=> d!152095 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121424 d!152095))

(declare-fun d!152101 () Bool)

(assert (=> d!152101 (= (array_inv!35872 a!2901) (bvsge (size!47142 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121424 d!152101))

(declare-fun b!1411052 () Bool)

(declare-fun c!131012 () Bool)

(declare-fun lt!621315 () (_ BitVec 64))

(assert (=> b!1411052 (= c!131012 (= lt!621315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798598 () SeekEntryResult!10805)

(declare-fun e!798596 () SeekEntryResult!10805)

(assert (=> b!1411052 (= e!798598 e!798596)))

(declare-fun d!152105 () Bool)

(declare-fun lt!621314 () SeekEntryResult!10805)

(assert (=> d!152105 (and (or ((_ is Undefined!10805) lt!621314) (not ((_ is Found!10805) lt!621314)) (and (bvsge (index!45598 lt!621314) #b00000000000000000000000000000000) (bvslt (index!45598 lt!621314) (size!47142 a!2901)))) (or ((_ is Undefined!10805) lt!621314) ((_ is Found!10805) lt!621314) (not ((_ is MissingZero!10805) lt!621314)) (and (bvsge (index!45597 lt!621314) #b00000000000000000000000000000000) (bvslt (index!45597 lt!621314) (size!47142 a!2901)))) (or ((_ is Undefined!10805) lt!621314) ((_ is Found!10805) lt!621314) ((_ is MissingZero!10805) lt!621314) (not ((_ is MissingVacant!10805) lt!621314)) (and (bvsge (index!45600 lt!621314) #b00000000000000000000000000000000) (bvslt (index!45600 lt!621314) (size!47142 a!2901)))) (or ((_ is Undefined!10805) lt!621314) (ite ((_ is Found!10805) lt!621314) (= (select (arr!46591 a!2901) (index!45598 lt!621314)) (select (arr!46591 a!2901) j!112)) (ite ((_ is MissingZero!10805) lt!621314) (= (select (arr!46591 a!2901) (index!45597 lt!621314)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10805) lt!621314) (= (select (arr!46591 a!2901) (index!45600 lt!621314)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!798597 () SeekEntryResult!10805)

(assert (=> d!152105 (= lt!621314 e!798597)))

(declare-fun c!131010 () Bool)

(declare-fun lt!621313 () SeekEntryResult!10805)

(assert (=> d!152105 (= c!131010 (and ((_ is Intermediate!10805) lt!621313) (undefined!11617 lt!621313)))))

(assert (=> d!152105 (= lt!621313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840) (select (arr!46591 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152105 (validMask!0 mask!2840)))

(assert (=> d!152105 (= (seekEntryOrOpen!0 (select (arr!46591 a!2901) j!112) a!2901 mask!2840) lt!621314)))

(declare-fun b!1411053 () Bool)

(assert (=> b!1411053 (= e!798597 Undefined!10805)))

(declare-fun b!1411054 () Bool)

(assert (=> b!1411054 (= e!798597 e!798598)))

(assert (=> b!1411054 (= lt!621315 (select (arr!46591 a!2901) (index!45599 lt!621313)))))

(declare-fun c!131011 () Bool)

(assert (=> b!1411054 (= c!131011 (= lt!621315 (select (arr!46591 a!2901) j!112)))))

(declare-fun b!1411055 () Bool)

(assert (=> b!1411055 (= e!798596 (MissingZero!10805 (index!45599 lt!621313)))))

(declare-fun b!1411056 () Bool)

(assert (=> b!1411056 (= e!798598 (Found!10805 (index!45599 lt!621313)))))

(declare-fun b!1411057 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96500 (_ BitVec 32)) SeekEntryResult!10805)

(assert (=> b!1411057 (= e!798596 (seekKeyOrZeroReturnVacant!0 (x!127337 lt!621313) (index!45599 lt!621313) (index!45599 lt!621313) (select (arr!46591 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152105 c!131010) b!1411053))

(assert (= (and d!152105 (not c!131010)) b!1411054))

(assert (= (and b!1411054 c!131011) b!1411056))

(assert (= (and b!1411054 (not c!131011)) b!1411052))

(assert (= (and b!1411052 c!131012) b!1411055))

(assert (= (and b!1411052 (not c!131012)) b!1411057))

(declare-fun m!1301059 () Bool)

(assert (=> d!152105 m!1301059))

(assert (=> d!152105 m!1300879))

(assert (=> d!152105 m!1300887))

(assert (=> d!152105 m!1300889))

(declare-fun m!1301061 () Bool)

(assert (=> d!152105 m!1301061))

(declare-fun m!1301063 () Bool)

(assert (=> d!152105 m!1301063))

(assert (=> d!152105 m!1300889))

(assert (=> d!152105 m!1300887))

(assert (=> d!152105 m!1300893))

(declare-fun m!1301065 () Bool)

(assert (=> b!1411054 m!1301065))

(assert (=> b!1411057 m!1300887))

(declare-fun m!1301067 () Bool)

(assert (=> b!1411057 m!1301067))

(assert (=> b!1410820 d!152105))

(declare-fun b!1411058 () Bool)

(declare-fun lt!621316 () SeekEntryResult!10805)

(assert (=> b!1411058 (and (bvsge (index!45599 lt!621316) #b00000000000000000000000000000000) (bvslt (index!45599 lt!621316) (size!47142 (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901)))))))

(declare-fun res!947984 () Bool)

(assert (=> b!1411058 (= res!947984 (= (select (arr!46591 (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901))) (index!45599 lt!621316)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798602 () Bool)

(assert (=> b!1411058 (=> res!947984 e!798602)))

(declare-fun e!798603 () SeekEntryResult!10805)

(declare-fun b!1411059 () Bool)

(assert (=> b!1411059 (= e!798603 (Intermediate!10805 false (toIndex!0 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411060 () Bool)

(assert (=> b!1411060 (= e!798603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901)) mask!2840))))

(declare-fun b!1411061 () Bool)

(declare-fun e!798599 () Bool)

(assert (=> b!1411061 (= e!798599 (bvsge (x!127337 lt!621316) #b01111111111111111111111111111110))))

(declare-fun b!1411062 () Bool)

(declare-fun e!798601 () SeekEntryResult!10805)

(assert (=> b!1411062 (= e!798601 (Intermediate!10805 true (toIndex!0 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411063 () Bool)

(declare-fun e!798600 () Bool)

(assert (=> b!1411063 (= e!798599 e!798600)))

(declare-fun res!947983 () Bool)

(assert (=> b!1411063 (= res!947983 (and ((_ is Intermediate!10805) lt!621316) (not (undefined!11617 lt!621316)) (bvslt (x!127337 lt!621316) #b01111111111111111111111111111110) (bvsge (x!127337 lt!621316) #b00000000000000000000000000000000) (bvsge (x!127337 lt!621316) #b00000000000000000000000000000000)))))

(assert (=> b!1411063 (=> (not res!947983) (not e!798600))))

(declare-fun d!152125 () Bool)

(assert (=> d!152125 e!798599))

(declare-fun c!131015 () Bool)

(assert (=> d!152125 (= c!131015 (and ((_ is Intermediate!10805) lt!621316) (undefined!11617 lt!621316)))))

(assert (=> d!152125 (= lt!621316 e!798601)))

(declare-fun c!131014 () Bool)

(assert (=> d!152125 (= c!131014 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621317 () (_ BitVec 64))

(assert (=> d!152125 (= lt!621317 (select (arr!46591 (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901))) (toIndex!0 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!152125 (validMask!0 mask!2840)))

(assert (=> d!152125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901)) mask!2840) lt!621316)))

(declare-fun b!1411064 () Bool)

(assert (=> b!1411064 (and (bvsge (index!45599 lt!621316) #b00000000000000000000000000000000) (bvslt (index!45599 lt!621316) (size!47142 (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901)))))))

(declare-fun res!947982 () Bool)

(assert (=> b!1411064 (= res!947982 (= (select (arr!46591 (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901))) (index!45599 lt!621316)) (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1411064 (=> res!947982 e!798602)))

(assert (=> b!1411064 (= e!798600 e!798602)))

(declare-fun b!1411065 () Bool)

(assert (=> b!1411065 (= e!798601 e!798603)))

(declare-fun c!131013 () Bool)

(assert (=> b!1411065 (= c!131013 (or (= lt!621317 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621317 lt!621317) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1411066 () Bool)

(assert (=> b!1411066 (and (bvsge (index!45599 lt!621316) #b00000000000000000000000000000000) (bvslt (index!45599 lt!621316) (size!47142 (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901)))))))

(assert (=> b!1411066 (= e!798602 (= (select (arr!46591 (array!96501 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901))) (index!45599 lt!621316)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152125 c!131014) b!1411062))

(assert (= (and d!152125 (not c!131014)) b!1411065))

(assert (= (and b!1411065 c!131013) b!1411059))

(assert (= (and b!1411065 (not c!131013)) b!1411060))

(assert (= (and d!152125 c!131015) b!1411061))

(assert (= (and d!152125 (not c!131015)) b!1411063))

(assert (= (and b!1411063 res!947983) b!1411064))

(assert (= (and b!1411064 (not res!947982)) b!1411058))

(assert (= (and b!1411058 (not res!947984)) b!1411066))

(declare-fun m!1301069 () Bool)

(assert (=> b!1411066 m!1301069))

(assert (=> b!1411058 m!1301069))

(assert (=> b!1411064 m!1301069))

(assert (=> b!1411060 m!1300871))

(declare-fun m!1301071 () Bool)

(assert (=> b!1411060 m!1301071))

(assert (=> b!1411060 m!1301071))

(assert (=> b!1411060 m!1300869))

(declare-fun m!1301073 () Bool)

(assert (=> b!1411060 m!1301073))

(assert (=> d!152125 m!1300871))

(declare-fun m!1301075 () Bool)

(assert (=> d!152125 m!1301075))

(assert (=> d!152125 m!1300879))

(assert (=> b!1410819 d!152125))

(declare-fun d!152127 () Bool)

(declare-fun lt!621319 () (_ BitVec 32))

(declare-fun lt!621318 () (_ BitVec 32))

(assert (=> d!152127 (= lt!621319 (bvmul (bvxor lt!621318 (bvlshr lt!621318 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152127 (= lt!621318 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152127 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947951 (let ((h!34367 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127341 (bvmul (bvxor h!34367 (bvlshr h!34367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127341 (bvlshr x!127341 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947951 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947951 #b00000000000000000000000000000000))))))

(assert (=> d!152127 (= (toIndex!0 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621319 (bvlshr lt!621319 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410819 d!152127))

(declare-fun b!1411067 () Bool)

(declare-fun e!798604 () Bool)

(declare-fun call!67091 () Bool)

(assert (=> b!1411067 (= e!798604 call!67091)))

(declare-fun bm!67088 () Bool)

(assert (=> bm!67088 (= call!67091 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152129 () Bool)

(declare-fun res!947986 () Bool)

(declare-fun e!798606 () Bool)

(assert (=> d!152129 (=> res!947986 e!798606)))

(assert (=> d!152129 (= res!947986 (bvsge #b00000000000000000000000000000000 (size!47142 a!2901)))))

(assert (=> d!152129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798606)))

(declare-fun b!1411068 () Bool)

(declare-fun e!798605 () Bool)

(assert (=> b!1411068 (= e!798605 call!67091)))

(declare-fun b!1411069 () Bool)

(assert (=> b!1411069 (= e!798606 e!798605)))

(declare-fun c!131016 () Bool)

(assert (=> b!1411069 (= c!131016 (validKeyInArray!0 (select (arr!46591 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411070 () Bool)

(assert (=> b!1411070 (= e!798605 e!798604)))

(declare-fun lt!621322 () (_ BitVec 64))

(assert (=> b!1411070 (= lt!621322 (select (arr!46591 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621321 () Unit!47611)

(assert (=> b!1411070 (= lt!621321 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621322 #b00000000000000000000000000000000))))

(assert (=> b!1411070 (arrayContainsKey!0 a!2901 lt!621322 #b00000000000000000000000000000000)))

(declare-fun lt!621320 () Unit!47611)

(assert (=> b!1411070 (= lt!621320 lt!621321)))

(declare-fun res!947985 () Bool)

(assert (=> b!1411070 (= res!947985 (= (seekEntryOrOpen!0 (select (arr!46591 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10805 #b00000000000000000000000000000000)))))

(assert (=> b!1411070 (=> (not res!947985) (not e!798604))))

(assert (= (and d!152129 (not res!947986)) b!1411069))

(assert (= (and b!1411069 c!131016) b!1411070))

(assert (= (and b!1411069 (not c!131016)) b!1411068))

(assert (= (and b!1411070 res!947985) b!1411067))

(assert (= (or b!1411067 b!1411068) bm!67088))

(declare-fun m!1301077 () Bool)

(assert (=> bm!67088 m!1301077))

(assert (=> b!1411069 m!1300969))

(assert (=> b!1411069 m!1300969))

(assert (=> b!1411069 m!1300971))

(assert (=> b!1411070 m!1300969))

(declare-fun m!1301079 () Bool)

(assert (=> b!1411070 m!1301079))

(declare-fun m!1301081 () Bool)

(assert (=> b!1411070 m!1301081))

(assert (=> b!1411070 m!1300969))

(declare-fun m!1301083 () Bool)

(assert (=> b!1411070 m!1301083))

(assert (=> b!1410823 d!152129))

(declare-fun d!152131 () Bool)

(assert (=> d!152131 (= (validKeyInArray!0 (select (arr!46591 a!2901) j!112)) (and (not (= (select (arr!46591 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46591 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410818 d!152131))

(declare-fun d!152133 () Bool)

(assert (=> d!152133 (= (validKeyInArray!0 (select (arr!46591 a!2901) i!1037)) (and (not (= (select (arr!46591 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46591 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410822 d!152133))

(check-sat (not b!1410884) (not b!1411060) (not b!1410886) (not bm!67074) (not d!152125) (not bm!67088) (not b!1411057) (not bm!67071) (not b!1411069) (not d!152105) (not d!152081) (not b!1410899) (not b!1410900) (not d!152075) (not b!1410948) (not b!1410887) (not b!1411070))
(check-sat)
