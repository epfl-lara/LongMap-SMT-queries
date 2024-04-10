; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121508 () Bool)

(assert start!121508)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96509 0))(
  ( (array!96510 (arr!46593 (Array (_ BitVec 32) (_ BitVec 64))) (size!47143 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96509)

(declare-fun lt!622030 () (_ BitVec 64))

(declare-fun b!1411903 () Bool)

(declare-datatypes ((SeekEntryResult!10904 0))(
  ( (MissingZero!10904 (index!45993 (_ BitVec 32))) (Found!10904 (index!45994 (_ BitVec 32))) (Intermediate!10904 (undefined!11716 Bool) (index!45995 (_ BitVec 32)) (x!127579 (_ BitVec 32))) (Undefined!10904) (MissingVacant!10904 (index!45996 (_ BitVec 32))) )
))
(declare-fun lt!622032 () SeekEntryResult!10904)

(declare-fun lt!622035 () array!96509)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!798982 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96509 (_ BitVec 32)) SeekEntryResult!10904)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96509 (_ BitVec 32)) SeekEntryResult!10904)

(assert (=> b!1411903 (= e!798982 (= (seekEntryOrOpen!0 lt!622030 lt!622035 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127579 lt!622032) (index!45995 lt!622032) (index!45995 lt!622032) (select (arr!46593 a!2901) j!112) lt!622035 mask!2840)))))

(declare-fun lt!622034 () SeekEntryResult!10904)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1411903 (and (not (undefined!11716 lt!622032)) (= (index!45995 lt!622032) i!1037) (bvslt (x!127579 lt!622032) (x!127579 lt!622034)) (= (select (store (arr!46593 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45995 lt!622032)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47782 0))(
  ( (Unit!47783) )
))
(declare-fun lt!622029 () Unit!47782)

(declare-fun lt!622031 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47782)

(assert (=> b!1411903 (= lt!622029 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622031 (x!127579 lt!622034) (index!45995 lt!622034) (x!127579 lt!622032) (index!45995 lt!622032) (undefined!11716 lt!622032) mask!2840))))

(declare-fun b!1411905 () Bool)

(declare-fun res!949137 () Bool)

(declare-fun e!798986 () Bool)

(assert (=> b!1411905 (=> (not res!949137) (not e!798986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96509 (_ BitVec 32)) Bool)

(assert (=> b!1411905 (= res!949137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411906 () Bool)

(declare-fun res!949131 () Bool)

(assert (=> b!1411906 (=> (not res!949131) (not e!798986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411906 (= res!949131 (validKeyInArray!0 (select (arr!46593 a!2901) i!1037)))))

(declare-fun b!1411907 () Bool)

(declare-fun res!949136 () Bool)

(assert (=> b!1411907 (=> (not res!949136) (not e!798986))))

(assert (=> b!1411907 (= res!949136 (validKeyInArray!0 (select (arr!46593 a!2901) j!112)))))

(declare-fun b!1411908 () Bool)

(declare-fun e!798985 () Bool)

(assert (=> b!1411908 (= e!798985 e!798982)))

(declare-fun res!949134 () Bool)

(assert (=> b!1411908 (=> res!949134 e!798982)))

(get-info :version)

(assert (=> b!1411908 (= res!949134 (or (= lt!622034 lt!622032) (not ((_ is Intermediate!10904) lt!622032))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96509 (_ BitVec 32)) SeekEntryResult!10904)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411908 (= lt!622032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622030 mask!2840) lt!622030 lt!622035 mask!2840))))

(assert (=> b!1411908 (= lt!622030 (select (store (arr!46593 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1411908 (= lt!622035 (array!96510 (store (arr!46593 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47143 a!2901)))))

(declare-fun b!1411909 () Bool)

(declare-fun res!949135 () Bool)

(assert (=> b!1411909 (=> (not res!949135) (not e!798986))))

(declare-datatypes ((List!33112 0))(
  ( (Nil!33109) (Cons!33108 (h!34380 (_ BitVec 64)) (t!47806 List!33112)) )
))
(declare-fun arrayNoDuplicates!0 (array!96509 (_ BitVec 32) List!33112) Bool)

(assert (=> b!1411909 (= res!949135 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33109))))

(declare-fun e!798983 () Bool)

(declare-fun b!1411904 () Bool)

(assert (=> b!1411904 (= e!798983 (= (seekEntryOrOpen!0 (select (arr!46593 a!2901) j!112) a!2901 mask!2840) (Found!10904 j!112)))))

(declare-fun res!949130 () Bool)

(assert (=> start!121508 (=> (not res!949130) (not e!798986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121508 (= res!949130 (validMask!0 mask!2840))))

(assert (=> start!121508 e!798986))

(assert (=> start!121508 true))

(declare-fun array_inv!35621 (array!96509) Bool)

(assert (=> start!121508 (array_inv!35621 a!2901)))

(declare-fun b!1411910 () Bool)

(declare-fun res!949132 () Bool)

(assert (=> b!1411910 (=> (not res!949132) (not e!798986))))

(assert (=> b!1411910 (= res!949132 (and (= (size!47143 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47143 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47143 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411911 () Bool)

(assert (=> b!1411911 (= e!798986 (not e!798985))))

(declare-fun res!949138 () Bool)

(assert (=> b!1411911 (=> res!949138 e!798985)))

(assert (=> b!1411911 (= res!949138 (or (not ((_ is Intermediate!10904) lt!622034)) (undefined!11716 lt!622034)))))

(assert (=> b!1411911 e!798983))

(declare-fun res!949133 () Bool)

(assert (=> b!1411911 (=> (not res!949133) (not e!798983))))

(assert (=> b!1411911 (= res!949133 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622033 () Unit!47782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47782)

(assert (=> b!1411911 (= lt!622033 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411911 (= lt!622034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622031 (select (arr!46593 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411911 (= lt!622031 (toIndex!0 (select (arr!46593 a!2901) j!112) mask!2840))))

(assert (= (and start!121508 res!949130) b!1411910))

(assert (= (and b!1411910 res!949132) b!1411906))

(assert (= (and b!1411906 res!949131) b!1411907))

(assert (= (and b!1411907 res!949136) b!1411905))

(assert (= (and b!1411905 res!949137) b!1411909))

(assert (= (and b!1411909 res!949135) b!1411911))

(assert (= (and b!1411911 res!949133) b!1411904))

(assert (= (and b!1411911 (not res!949138)) b!1411908))

(assert (= (and b!1411908 (not res!949134)) b!1411903))

(declare-fun m!1301943 () Bool)

(assert (=> b!1411911 m!1301943))

(declare-fun m!1301945 () Bool)

(assert (=> b!1411911 m!1301945))

(assert (=> b!1411911 m!1301943))

(declare-fun m!1301947 () Bool)

(assert (=> b!1411911 m!1301947))

(assert (=> b!1411911 m!1301943))

(declare-fun m!1301949 () Bool)

(assert (=> b!1411911 m!1301949))

(declare-fun m!1301951 () Bool)

(assert (=> b!1411911 m!1301951))

(assert (=> b!1411903 m!1301943))

(declare-fun m!1301953 () Bool)

(assert (=> b!1411903 m!1301953))

(declare-fun m!1301955 () Bool)

(assert (=> b!1411903 m!1301955))

(assert (=> b!1411903 m!1301943))

(declare-fun m!1301957 () Bool)

(assert (=> b!1411903 m!1301957))

(declare-fun m!1301959 () Bool)

(assert (=> b!1411903 m!1301959))

(declare-fun m!1301961 () Bool)

(assert (=> b!1411903 m!1301961))

(assert (=> b!1411904 m!1301943))

(assert (=> b!1411904 m!1301943))

(declare-fun m!1301963 () Bool)

(assert (=> b!1411904 m!1301963))

(declare-fun m!1301965 () Bool)

(assert (=> b!1411905 m!1301965))

(declare-fun m!1301967 () Bool)

(assert (=> b!1411909 m!1301967))

(declare-fun m!1301969 () Bool)

(assert (=> start!121508 m!1301969))

(declare-fun m!1301971 () Bool)

(assert (=> start!121508 m!1301971))

(declare-fun m!1301973 () Bool)

(assert (=> b!1411908 m!1301973))

(assert (=> b!1411908 m!1301973))

(declare-fun m!1301975 () Bool)

(assert (=> b!1411908 m!1301975))

(assert (=> b!1411908 m!1301961))

(declare-fun m!1301977 () Bool)

(assert (=> b!1411908 m!1301977))

(declare-fun m!1301979 () Bool)

(assert (=> b!1411906 m!1301979))

(assert (=> b!1411906 m!1301979))

(declare-fun m!1301981 () Bool)

(assert (=> b!1411906 m!1301981))

(assert (=> b!1411907 m!1301943))

(assert (=> b!1411907 m!1301943))

(declare-fun m!1301983 () Bool)

(assert (=> b!1411907 m!1301983))

(check-sat (not b!1411905) (not b!1411903) (not b!1411904) (not b!1411908) (not b!1411909) (not b!1411911) (not b!1411907) (not start!121508) (not b!1411906))
(check-sat)
(get-model)

(declare-fun b!1411957 () Bool)

(declare-fun e!799015 () SeekEntryResult!10904)

(assert (=> b!1411957 (= e!799015 (Intermediate!10904 false (toIndex!0 lt!622030 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411958 () Bool)

(declare-fun lt!622061 () SeekEntryResult!10904)

(assert (=> b!1411958 (and (bvsge (index!45995 lt!622061) #b00000000000000000000000000000000) (bvslt (index!45995 lt!622061) (size!47143 lt!622035)))))

(declare-fun res!949172 () Bool)

(assert (=> b!1411958 (= res!949172 (= (select (arr!46593 lt!622035) (index!45995 lt!622061)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799012 () Bool)

(assert (=> b!1411958 (=> res!949172 e!799012)))

(declare-fun b!1411959 () Bool)

(declare-fun e!799014 () SeekEntryResult!10904)

(assert (=> b!1411959 (= e!799014 e!799015)))

(declare-fun c!130864 () Bool)

(declare-fun lt!622062 () (_ BitVec 64))

(assert (=> b!1411959 (= c!130864 (or (= lt!622062 lt!622030) (= (bvadd lt!622062 lt!622062) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1411960 () Bool)

(declare-fun e!799016 () Bool)

(assert (=> b!1411960 (= e!799016 (bvsge (x!127579 lt!622061) #b01111111111111111111111111111110))))

(declare-fun b!1411961 () Bool)

(assert (=> b!1411961 (and (bvsge (index!45995 lt!622061) #b00000000000000000000000000000000) (bvslt (index!45995 lt!622061) (size!47143 lt!622035)))))

(declare-fun res!949173 () Bool)

(assert (=> b!1411961 (= res!949173 (= (select (arr!46593 lt!622035) (index!45995 lt!622061)) lt!622030))))

(assert (=> b!1411961 (=> res!949173 e!799012)))

(declare-fun e!799013 () Bool)

(assert (=> b!1411961 (= e!799013 e!799012)))

(declare-fun b!1411962 () Bool)

(assert (=> b!1411962 (and (bvsge (index!45995 lt!622061) #b00000000000000000000000000000000) (bvslt (index!45995 lt!622061) (size!47143 lt!622035)))))

(assert (=> b!1411962 (= e!799012 (= (select (arr!46593 lt!622035) (index!45995 lt!622061)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151997 () Bool)

(assert (=> d!151997 e!799016))

(declare-fun c!130865 () Bool)

(assert (=> d!151997 (= c!130865 (and ((_ is Intermediate!10904) lt!622061) (undefined!11716 lt!622061)))))

(assert (=> d!151997 (= lt!622061 e!799014)))

(declare-fun c!130866 () Bool)

(assert (=> d!151997 (= c!130866 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151997 (= lt!622062 (select (arr!46593 lt!622035) (toIndex!0 lt!622030 mask!2840)))))

(assert (=> d!151997 (validMask!0 mask!2840)))

(assert (=> d!151997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622030 mask!2840) lt!622030 lt!622035 mask!2840) lt!622061)))

(declare-fun b!1411963 () Bool)

(assert (=> b!1411963 (= e!799016 e!799013)))

(declare-fun res!949174 () Bool)

(assert (=> b!1411963 (= res!949174 (and ((_ is Intermediate!10904) lt!622061) (not (undefined!11716 lt!622061)) (bvslt (x!127579 lt!622061) #b01111111111111111111111111111110) (bvsge (x!127579 lt!622061) #b00000000000000000000000000000000) (bvsge (x!127579 lt!622061) #b00000000000000000000000000000000)))))

(assert (=> b!1411963 (=> (not res!949174) (not e!799013))))

(declare-fun b!1411964 () Bool)

(assert (=> b!1411964 (= e!799014 (Intermediate!10904 true (toIndex!0 lt!622030 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411965 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411965 (= e!799015 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!622030 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!622030 lt!622035 mask!2840))))

(assert (= (and d!151997 c!130866) b!1411964))

(assert (= (and d!151997 (not c!130866)) b!1411959))

(assert (= (and b!1411959 c!130864) b!1411957))

(assert (= (and b!1411959 (not c!130864)) b!1411965))

(assert (= (and d!151997 c!130865) b!1411960))

(assert (= (and d!151997 (not c!130865)) b!1411963))

(assert (= (and b!1411963 res!949174) b!1411961))

(assert (= (and b!1411961 (not res!949173)) b!1411958))

(assert (= (and b!1411958 (not res!949172)) b!1411962))

(assert (=> d!151997 m!1301973))

(declare-fun m!1302027 () Bool)

(assert (=> d!151997 m!1302027))

(assert (=> d!151997 m!1301969))

(assert (=> b!1411965 m!1301973))

(declare-fun m!1302029 () Bool)

(assert (=> b!1411965 m!1302029))

(assert (=> b!1411965 m!1302029))

(declare-fun m!1302031 () Bool)

(assert (=> b!1411965 m!1302031))

(declare-fun m!1302033 () Bool)

(assert (=> b!1411958 m!1302033))

(assert (=> b!1411961 m!1302033))

(assert (=> b!1411962 m!1302033))

(assert (=> b!1411908 d!151997))

(declare-fun d!152005 () Bool)

(declare-fun lt!622068 () (_ BitVec 32))

(declare-fun lt!622067 () (_ BitVec 32))

(assert (=> d!152005 (= lt!622068 (bvmul (bvxor lt!622067 (bvlshr lt!622067 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152005 (= lt!622067 ((_ extract 31 0) (bvand (bvxor lt!622030 (bvlshr lt!622030 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152005 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949175 (let ((h!34382 ((_ extract 31 0) (bvand (bvxor lt!622030 (bvlshr lt!622030 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127582 (bvmul (bvxor h!34382 (bvlshr h!34382 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127582 (bvlshr x!127582 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949175 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949175 #b00000000000000000000000000000000))))))

(assert (=> d!152005 (= (toIndex!0 lt!622030 mask!2840) (bvand (bvxor lt!622068 (bvlshr lt!622068 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411908 d!152005))

(declare-fun d!152009 () Bool)

(assert (=> d!152009 (= (validKeyInArray!0 (select (arr!46593 a!2901) j!112)) (and (not (= (select (arr!46593 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46593 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411907 d!152009))

(declare-fun d!152013 () Bool)

(assert (=> d!152013 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121508 d!152013))

(declare-fun d!152019 () Bool)

(assert (=> d!152019 (= (array_inv!35621 a!2901) (bvsge (size!47143 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121508 d!152019))

(declare-fun b!1412019 () Bool)

(declare-fun e!799053 () Bool)

(declare-fun call!67084 () Bool)

(assert (=> b!1412019 (= e!799053 call!67084)))

(declare-fun b!1412020 () Bool)

(declare-fun e!799054 () Bool)

(assert (=> b!1412020 (= e!799053 e!799054)))

(declare-fun lt!622093 () (_ BitVec 64))

(assert (=> b!1412020 (= lt!622093 (select (arr!46593 a!2901) j!112))))

(declare-fun lt!622094 () Unit!47782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96509 (_ BitVec 64) (_ BitVec 32)) Unit!47782)

(assert (=> b!1412020 (= lt!622094 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622093 j!112))))

(declare-fun arrayContainsKey!0 (array!96509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1412020 (arrayContainsKey!0 a!2901 lt!622093 #b00000000000000000000000000000000)))

(declare-fun lt!622095 () Unit!47782)

(assert (=> b!1412020 (= lt!622095 lt!622094)))

(declare-fun res!949196 () Bool)

(assert (=> b!1412020 (= res!949196 (= (seekEntryOrOpen!0 (select (arr!46593 a!2901) j!112) a!2901 mask!2840) (Found!10904 j!112)))))

(assert (=> b!1412020 (=> (not res!949196) (not e!799054))))

(declare-fun bm!67081 () Bool)

(assert (=> bm!67081 (= call!67084 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152021 () Bool)

(declare-fun res!949195 () Bool)

(declare-fun e!799055 () Bool)

(assert (=> d!152021 (=> res!949195 e!799055)))

(assert (=> d!152021 (= res!949195 (bvsge j!112 (size!47143 a!2901)))))

(assert (=> d!152021 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!799055)))

(declare-fun b!1412021 () Bool)

(assert (=> b!1412021 (= e!799055 e!799053)))

(declare-fun c!130884 () Bool)

(assert (=> b!1412021 (= c!130884 (validKeyInArray!0 (select (arr!46593 a!2901) j!112)))))

(declare-fun b!1412022 () Bool)

(assert (=> b!1412022 (= e!799054 call!67084)))

(assert (= (and d!152021 (not res!949195)) b!1412021))

(assert (= (and b!1412021 c!130884) b!1412020))

(assert (= (and b!1412021 (not c!130884)) b!1412019))

(assert (= (and b!1412020 res!949196) b!1412022))

(assert (= (or b!1412022 b!1412019) bm!67081))

(assert (=> b!1412020 m!1301943))

(declare-fun m!1302067 () Bool)

(assert (=> b!1412020 m!1302067))

(declare-fun m!1302069 () Bool)

(assert (=> b!1412020 m!1302069))

(assert (=> b!1412020 m!1301943))

(assert (=> b!1412020 m!1301963))

(declare-fun m!1302071 () Bool)

(assert (=> bm!67081 m!1302071))

(assert (=> b!1412021 m!1301943))

(assert (=> b!1412021 m!1301943))

(assert (=> b!1412021 m!1301983))

(assert (=> b!1411911 d!152021))

(declare-fun d!152025 () Bool)

(assert (=> d!152025 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!622102 () Unit!47782)

(declare-fun choose!38 (array!96509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47782)

(assert (=> d!152025 (= lt!622102 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152025 (validMask!0 mask!2840)))

(assert (=> d!152025 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!622102)))

(declare-fun bs!41168 () Bool)

(assert (= bs!41168 d!152025))

(assert (=> bs!41168 m!1301951))

(declare-fun m!1302073 () Bool)

(assert (=> bs!41168 m!1302073))

(assert (=> bs!41168 m!1301969))

(assert (=> b!1411911 d!152025))

(declare-fun b!1412041 () Bool)

(declare-fun e!799069 () SeekEntryResult!10904)

(assert (=> b!1412041 (= e!799069 (Intermediate!10904 false lt!622031 #b00000000000000000000000000000000))))

(declare-fun b!1412042 () Bool)

(declare-fun lt!622103 () SeekEntryResult!10904)

(assert (=> b!1412042 (and (bvsge (index!45995 lt!622103) #b00000000000000000000000000000000) (bvslt (index!45995 lt!622103) (size!47143 a!2901)))))

(declare-fun res!949203 () Bool)

(assert (=> b!1412042 (= res!949203 (= (select (arr!46593 a!2901) (index!45995 lt!622103)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799066 () Bool)

(assert (=> b!1412042 (=> res!949203 e!799066)))

(declare-fun b!1412043 () Bool)

(declare-fun e!799068 () SeekEntryResult!10904)

(assert (=> b!1412043 (= e!799068 e!799069)))

(declare-fun lt!622104 () (_ BitVec 64))

(declare-fun c!130891 () Bool)

(assert (=> b!1412043 (= c!130891 (or (= lt!622104 (select (arr!46593 a!2901) j!112)) (= (bvadd lt!622104 lt!622104) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1412044 () Bool)

(declare-fun e!799070 () Bool)

(assert (=> b!1412044 (= e!799070 (bvsge (x!127579 lt!622103) #b01111111111111111111111111111110))))

(declare-fun b!1412045 () Bool)

(assert (=> b!1412045 (and (bvsge (index!45995 lt!622103) #b00000000000000000000000000000000) (bvslt (index!45995 lt!622103) (size!47143 a!2901)))))

(declare-fun res!949204 () Bool)

(assert (=> b!1412045 (= res!949204 (= (select (arr!46593 a!2901) (index!45995 lt!622103)) (select (arr!46593 a!2901) j!112)))))

(assert (=> b!1412045 (=> res!949204 e!799066)))

(declare-fun e!799067 () Bool)

(assert (=> b!1412045 (= e!799067 e!799066)))

(declare-fun b!1412046 () Bool)

(assert (=> b!1412046 (and (bvsge (index!45995 lt!622103) #b00000000000000000000000000000000) (bvslt (index!45995 lt!622103) (size!47143 a!2901)))))

(assert (=> b!1412046 (= e!799066 (= (select (arr!46593 a!2901) (index!45995 lt!622103)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152027 () Bool)

(assert (=> d!152027 e!799070))

(declare-fun c!130892 () Bool)

(assert (=> d!152027 (= c!130892 (and ((_ is Intermediate!10904) lt!622103) (undefined!11716 lt!622103)))))

(assert (=> d!152027 (= lt!622103 e!799068)))

(declare-fun c!130893 () Bool)

(assert (=> d!152027 (= c!130893 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152027 (= lt!622104 (select (arr!46593 a!2901) lt!622031))))

(assert (=> d!152027 (validMask!0 mask!2840)))

(assert (=> d!152027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622031 (select (arr!46593 a!2901) j!112) a!2901 mask!2840) lt!622103)))

(declare-fun b!1412047 () Bool)

(assert (=> b!1412047 (= e!799070 e!799067)))

(declare-fun res!949205 () Bool)

(assert (=> b!1412047 (= res!949205 (and ((_ is Intermediate!10904) lt!622103) (not (undefined!11716 lt!622103)) (bvslt (x!127579 lt!622103) #b01111111111111111111111111111110) (bvsge (x!127579 lt!622103) #b00000000000000000000000000000000) (bvsge (x!127579 lt!622103) #b00000000000000000000000000000000)))))

(assert (=> b!1412047 (=> (not res!949205) (not e!799067))))

(declare-fun b!1412048 () Bool)

(assert (=> b!1412048 (= e!799068 (Intermediate!10904 true lt!622031 #b00000000000000000000000000000000))))

(declare-fun b!1412049 () Bool)

(assert (=> b!1412049 (= e!799069 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!622031 #b00000000000000000000000000000000 mask!2840) (select (arr!46593 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152027 c!130893) b!1412048))

(assert (= (and d!152027 (not c!130893)) b!1412043))

(assert (= (and b!1412043 c!130891) b!1412041))

(assert (= (and b!1412043 (not c!130891)) b!1412049))

(assert (= (and d!152027 c!130892) b!1412044))

(assert (= (and d!152027 (not c!130892)) b!1412047))

(assert (= (and b!1412047 res!949205) b!1412045))

(assert (= (and b!1412045 (not res!949204)) b!1412042))

(assert (= (and b!1412042 (not res!949203)) b!1412046))

(declare-fun m!1302075 () Bool)

(assert (=> d!152027 m!1302075))

(assert (=> d!152027 m!1301969))

(declare-fun m!1302077 () Bool)

(assert (=> b!1412049 m!1302077))

(assert (=> b!1412049 m!1302077))

(assert (=> b!1412049 m!1301943))

(declare-fun m!1302079 () Bool)

(assert (=> b!1412049 m!1302079))

(declare-fun m!1302081 () Bool)

(assert (=> b!1412042 m!1302081))

(assert (=> b!1412045 m!1302081))

(assert (=> b!1412046 m!1302081))

(assert (=> b!1411911 d!152027))

(declare-fun d!152029 () Bool)

(declare-fun lt!622106 () (_ BitVec 32))

(declare-fun lt!622105 () (_ BitVec 32))

(assert (=> d!152029 (= lt!622106 (bvmul (bvxor lt!622105 (bvlshr lt!622105 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152029 (= lt!622105 ((_ extract 31 0) (bvand (bvxor (select (arr!46593 a!2901) j!112) (bvlshr (select (arr!46593 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152029 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949175 (let ((h!34382 ((_ extract 31 0) (bvand (bvxor (select (arr!46593 a!2901) j!112) (bvlshr (select (arr!46593 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127582 (bvmul (bvxor h!34382 (bvlshr h!34382 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127582 (bvlshr x!127582 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949175 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949175 #b00000000000000000000000000000000))))))

(assert (=> d!152029 (= (toIndex!0 (select (arr!46593 a!2901) j!112) mask!2840) (bvand (bvxor lt!622106 (bvlshr lt!622106 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411911 d!152029))

(declare-fun d!152031 () Bool)

(assert (=> d!152031 (= (validKeyInArray!0 (select (arr!46593 a!2901) i!1037)) (and (not (= (select (arr!46593 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46593 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411906 d!152031))

(declare-fun b!1412050 () Bool)

(declare-fun e!799071 () Bool)

(declare-fun call!67085 () Bool)

(assert (=> b!1412050 (= e!799071 call!67085)))

(declare-fun b!1412051 () Bool)

(declare-fun e!799072 () Bool)

(assert (=> b!1412051 (= e!799071 e!799072)))

(declare-fun lt!622107 () (_ BitVec 64))

(assert (=> b!1412051 (= lt!622107 (select (arr!46593 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!622108 () Unit!47782)

(assert (=> b!1412051 (= lt!622108 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622107 #b00000000000000000000000000000000))))

(assert (=> b!1412051 (arrayContainsKey!0 a!2901 lt!622107 #b00000000000000000000000000000000)))

(declare-fun lt!622109 () Unit!47782)

(assert (=> b!1412051 (= lt!622109 lt!622108)))

(declare-fun res!949207 () Bool)

(assert (=> b!1412051 (= res!949207 (= (seekEntryOrOpen!0 (select (arr!46593 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10904 #b00000000000000000000000000000000)))))

(assert (=> b!1412051 (=> (not res!949207) (not e!799072))))

(declare-fun bm!67082 () Bool)

(assert (=> bm!67082 (= call!67085 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152033 () Bool)

(declare-fun res!949206 () Bool)

(declare-fun e!799073 () Bool)

(assert (=> d!152033 (=> res!949206 e!799073)))

(assert (=> d!152033 (= res!949206 (bvsge #b00000000000000000000000000000000 (size!47143 a!2901)))))

(assert (=> d!152033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!799073)))

(declare-fun b!1412052 () Bool)

(assert (=> b!1412052 (= e!799073 e!799071)))

(declare-fun c!130894 () Bool)

(assert (=> b!1412052 (= c!130894 (validKeyInArray!0 (select (arr!46593 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412053 () Bool)

(assert (=> b!1412053 (= e!799072 call!67085)))

(assert (= (and d!152033 (not res!949206)) b!1412052))

(assert (= (and b!1412052 c!130894) b!1412051))

(assert (= (and b!1412052 (not c!130894)) b!1412050))

(assert (= (and b!1412051 res!949207) b!1412053))

(assert (= (or b!1412053 b!1412050) bm!67082))

(declare-fun m!1302083 () Bool)

(assert (=> b!1412051 m!1302083))

(declare-fun m!1302085 () Bool)

(assert (=> b!1412051 m!1302085))

(declare-fun m!1302087 () Bool)

(assert (=> b!1412051 m!1302087))

(assert (=> b!1412051 m!1302083))

(declare-fun m!1302089 () Bool)

(assert (=> b!1412051 m!1302089))

(declare-fun m!1302091 () Bool)

(assert (=> bm!67082 m!1302091))

(assert (=> b!1412052 m!1302083))

(assert (=> b!1412052 m!1302083))

(declare-fun m!1302093 () Bool)

(assert (=> b!1412052 m!1302093))

(assert (=> b!1411905 d!152033))

(declare-fun d!152035 () Bool)

(declare-fun res!949220 () Bool)

(declare-fun e!799091 () Bool)

(assert (=> d!152035 (=> res!949220 e!799091)))

(assert (=> d!152035 (= res!949220 (bvsge #b00000000000000000000000000000000 (size!47143 a!2901)))))

(assert (=> d!152035 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33109) e!799091)))

(declare-fun b!1412081 () Bool)

(declare-fun e!799093 () Bool)

(declare-fun call!67088 () Bool)

(assert (=> b!1412081 (= e!799093 call!67088)))

(declare-fun b!1412082 () Bool)

(declare-fun e!799092 () Bool)

(declare-fun contains!9812 (List!33112 (_ BitVec 64)) Bool)

(assert (=> b!1412082 (= e!799092 (contains!9812 Nil!33109 (select (arr!46593 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412083 () Bool)

(assert (=> b!1412083 (= e!799093 call!67088)))

(declare-fun bm!67085 () Bool)

(declare-fun c!130904 () Bool)

(assert (=> bm!67085 (= call!67088 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130904 (Cons!33108 (select (arr!46593 a!2901) #b00000000000000000000000000000000) Nil!33109) Nil!33109)))))

(declare-fun b!1412084 () Bool)

(declare-fun e!799094 () Bool)

(assert (=> b!1412084 (= e!799094 e!799093)))

(assert (=> b!1412084 (= c!130904 (validKeyInArray!0 (select (arr!46593 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412085 () Bool)

(assert (=> b!1412085 (= e!799091 e!799094)))

(declare-fun res!949218 () Bool)

(assert (=> b!1412085 (=> (not res!949218) (not e!799094))))

(assert (=> b!1412085 (= res!949218 (not e!799092))))

(declare-fun res!949219 () Bool)

(assert (=> b!1412085 (=> (not res!949219) (not e!799092))))

(assert (=> b!1412085 (= res!949219 (validKeyInArray!0 (select (arr!46593 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152035 (not res!949220)) b!1412085))

(assert (= (and b!1412085 res!949219) b!1412082))

(assert (= (and b!1412085 res!949218) b!1412084))

(assert (= (and b!1412084 c!130904) b!1412081))

(assert (= (and b!1412084 (not c!130904)) b!1412083))

(assert (= (or b!1412081 b!1412083) bm!67085))

(assert (=> b!1412082 m!1302083))

(assert (=> b!1412082 m!1302083))

(declare-fun m!1302103 () Bool)

(assert (=> b!1412082 m!1302103))

(assert (=> bm!67085 m!1302083))

(declare-fun m!1302105 () Bool)

(assert (=> bm!67085 m!1302105))

(assert (=> b!1412084 m!1302083))

(assert (=> b!1412084 m!1302083))

(assert (=> b!1412084 m!1302093))

(assert (=> b!1412085 m!1302083))

(assert (=> b!1412085 m!1302083))

(assert (=> b!1412085 m!1302093))

(assert (=> b!1411909 d!152035))

(declare-fun d!152043 () Bool)

(declare-fun lt!622160 () SeekEntryResult!10904)

(assert (=> d!152043 (and (or ((_ is Undefined!10904) lt!622160) (not ((_ is Found!10904) lt!622160)) (and (bvsge (index!45994 lt!622160) #b00000000000000000000000000000000) (bvslt (index!45994 lt!622160) (size!47143 a!2901)))) (or ((_ is Undefined!10904) lt!622160) ((_ is Found!10904) lt!622160) (not ((_ is MissingZero!10904) lt!622160)) (and (bvsge (index!45993 lt!622160) #b00000000000000000000000000000000) (bvslt (index!45993 lt!622160) (size!47143 a!2901)))) (or ((_ is Undefined!10904) lt!622160) ((_ is Found!10904) lt!622160) ((_ is MissingZero!10904) lt!622160) (not ((_ is MissingVacant!10904) lt!622160)) (and (bvsge (index!45996 lt!622160) #b00000000000000000000000000000000) (bvslt (index!45996 lt!622160) (size!47143 a!2901)))) (or ((_ is Undefined!10904) lt!622160) (ite ((_ is Found!10904) lt!622160) (= (select (arr!46593 a!2901) (index!45994 lt!622160)) (select (arr!46593 a!2901) j!112)) (ite ((_ is MissingZero!10904) lt!622160) (= (select (arr!46593 a!2901) (index!45993 lt!622160)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10904) lt!622160) (= (select (arr!46593 a!2901) (index!45996 lt!622160)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!799133 () SeekEntryResult!10904)

(assert (=> d!152043 (= lt!622160 e!799133)))

(declare-fun c!130932 () Bool)

(declare-fun lt!622158 () SeekEntryResult!10904)

(assert (=> d!152043 (= c!130932 (and ((_ is Intermediate!10904) lt!622158) (undefined!11716 lt!622158)))))

(assert (=> d!152043 (= lt!622158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46593 a!2901) j!112) mask!2840) (select (arr!46593 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152043 (validMask!0 mask!2840)))

(assert (=> d!152043 (= (seekEntryOrOpen!0 (select (arr!46593 a!2901) j!112) a!2901 mask!2840) lt!622160)))

(declare-fun b!1412154 () Bool)

(declare-fun e!799132 () SeekEntryResult!10904)

(assert (=> b!1412154 (= e!799132 (seekKeyOrZeroReturnVacant!0 (x!127579 lt!622158) (index!45995 lt!622158) (index!45995 lt!622158) (select (arr!46593 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1412155 () Bool)

(assert (=> b!1412155 (= e!799132 (MissingZero!10904 (index!45995 lt!622158)))))

(declare-fun b!1412156 () Bool)

(assert (=> b!1412156 (= e!799133 Undefined!10904)))

(declare-fun b!1412157 () Bool)

(declare-fun e!799134 () SeekEntryResult!10904)

(assert (=> b!1412157 (= e!799133 e!799134)))

(declare-fun lt!622159 () (_ BitVec 64))

(assert (=> b!1412157 (= lt!622159 (select (arr!46593 a!2901) (index!45995 lt!622158)))))

(declare-fun c!130933 () Bool)

(assert (=> b!1412157 (= c!130933 (= lt!622159 (select (arr!46593 a!2901) j!112)))))

(declare-fun b!1412158 () Bool)

(assert (=> b!1412158 (= e!799134 (Found!10904 (index!45995 lt!622158)))))

(declare-fun b!1412159 () Bool)

(declare-fun c!130934 () Bool)

(assert (=> b!1412159 (= c!130934 (= lt!622159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1412159 (= e!799134 e!799132)))

(assert (= (and d!152043 c!130932) b!1412156))

(assert (= (and d!152043 (not c!130932)) b!1412157))

(assert (= (and b!1412157 c!130933) b!1412158))

(assert (= (and b!1412157 (not c!130933)) b!1412159))

(assert (= (and b!1412159 c!130934) b!1412155))

(assert (= (and b!1412159 (not c!130934)) b!1412154))

(declare-fun m!1302151 () Bool)

(assert (=> d!152043 m!1302151))

(declare-fun m!1302153 () Bool)

(assert (=> d!152043 m!1302153))

(assert (=> d!152043 m!1301943))

(assert (=> d!152043 m!1301945))

(assert (=> d!152043 m!1301945))

(assert (=> d!152043 m!1301943))

(declare-fun m!1302155 () Bool)

(assert (=> d!152043 m!1302155))

(assert (=> d!152043 m!1301969))

(declare-fun m!1302157 () Bool)

(assert (=> d!152043 m!1302157))

(assert (=> b!1412154 m!1301943))

(declare-fun m!1302159 () Bool)

(assert (=> b!1412154 m!1302159))

(declare-fun m!1302161 () Bool)

(assert (=> b!1412157 m!1302161))

(assert (=> b!1411904 d!152043))

(declare-fun d!152061 () Bool)

(declare-fun lt!622163 () SeekEntryResult!10904)

(assert (=> d!152061 (and (or ((_ is Undefined!10904) lt!622163) (not ((_ is Found!10904) lt!622163)) (and (bvsge (index!45994 lt!622163) #b00000000000000000000000000000000) (bvslt (index!45994 lt!622163) (size!47143 lt!622035)))) (or ((_ is Undefined!10904) lt!622163) ((_ is Found!10904) lt!622163) (not ((_ is MissingZero!10904) lt!622163)) (and (bvsge (index!45993 lt!622163) #b00000000000000000000000000000000) (bvslt (index!45993 lt!622163) (size!47143 lt!622035)))) (or ((_ is Undefined!10904) lt!622163) ((_ is Found!10904) lt!622163) ((_ is MissingZero!10904) lt!622163) (not ((_ is MissingVacant!10904) lt!622163)) (and (bvsge (index!45996 lt!622163) #b00000000000000000000000000000000) (bvslt (index!45996 lt!622163) (size!47143 lt!622035)))) (or ((_ is Undefined!10904) lt!622163) (ite ((_ is Found!10904) lt!622163) (= (select (arr!46593 lt!622035) (index!45994 lt!622163)) lt!622030) (ite ((_ is MissingZero!10904) lt!622163) (= (select (arr!46593 lt!622035) (index!45993 lt!622163)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10904) lt!622163) (= (select (arr!46593 lt!622035) (index!45996 lt!622163)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!799136 () SeekEntryResult!10904)

(assert (=> d!152061 (= lt!622163 e!799136)))

(declare-fun c!130935 () Bool)

(declare-fun lt!622161 () SeekEntryResult!10904)

(assert (=> d!152061 (= c!130935 (and ((_ is Intermediate!10904) lt!622161) (undefined!11716 lt!622161)))))

(assert (=> d!152061 (= lt!622161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622030 mask!2840) lt!622030 lt!622035 mask!2840))))

(assert (=> d!152061 (validMask!0 mask!2840)))

(assert (=> d!152061 (= (seekEntryOrOpen!0 lt!622030 lt!622035 mask!2840) lt!622163)))

(declare-fun e!799135 () SeekEntryResult!10904)

(declare-fun b!1412160 () Bool)

(assert (=> b!1412160 (= e!799135 (seekKeyOrZeroReturnVacant!0 (x!127579 lt!622161) (index!45995 lt!622161) (index!45995 lt!622161) lt!622030 lt!622035 mask!2840))))

(declare-fun b!1412161 () Bool)

(assert (=> b!1412161 (= e!799135 (MissingZero!10904 (index!45995 lt!622161)))))

(declare-fun b!1412162 () Bool)

(assert (=> b!1412162 (= e!799136 Undefined!10904)))

(declare-fun b!1412163 () Bool)

(declare-fun e!799137 () SeekEntryResult!10904)

(assert (=> b!1412163 (= e!799136 e!799137)))

(declare-fun lt!622162 () (_ BitVec 64))

(assert (=> b!1412163 (= lt!622162 (select (arr!46593 lt!622035) (index!45995 lt!622161)))))

(declare-fun c!130936 () Bool)

(assert (=> b!1412163 (= c!130936 (= lt!622162 lt!622030))))

(declare-fun b!1412164 () Bool)

(assert (=> b!1412164 (= e!799137 (Found!10904 (index!45995 lt!622161)))))

(declare-fun b!1412165 () Bool)

(declare-fun c!130937 () Bool)

(assert (=> b!1412165 (= c!130937 (= lt!622162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1412165 (= e!799137 e!799135)))

(assert (= (and d!152061 c!130935) b!1412162))

(assert (= (and d!152061 (not c!130935)) b!1412163))

(assert (= (and b!1412163 c!130936) b!1412164))

(assert (= (and b!1412163 (not c!130936)) b!1412165))

(assert (= (and b!1412165 c!130937) b!1412161))

(assert (= (and b!1412165 (not c!130937)) b!1412160))

(declare-fun m!1302163 () Bool)

(assert (=> d!152061 m!1302163))

(declare-fun m!1302165 () Bool)

(assert (=> d!152061 m!1302165))

(assert (=> d!152061 m!1301973))

(assert (=> d!152061 m!1301973))

(assert (=> d!152061 m!1301975))

(assert (=> d!152061 m!1301969))

(declare-fun m!1302167 () Bool)

(assert (=> d!152061 m!1302167))

(declare-fun m!1302169 () Bool)

(assert (=> b!1412160 m!1302169))

(declare-fun m!1302171 () Bool)

(assert (=> b!1412163 m!1302171))

(assert (=> b!1411903 d!152061))

(declare-fun b!1412214 () Bool)

(declare-fun e!799163 () SeekEntryResult!10904)

(assert (=> b!1412214 (= e!799163 (MissingVacant!10904 (index!45995 lt!622032)))))

(declare-fun d!152063 () Bool)

(declare-fun lt!622184 () SeekEntryResult!10904)

(assert (=> d!152063 (and (or ((_ is Undefined!10904) lt!622184) (not ((_ is Found!10904) lt!622184)) (and (bvsge (index!45994 lt!622184) #b00000000000000000000000000000000) (bvslt (index!45994 lt!622184) (size!47143 lt!622035)))) (or ((_ is Undefined!10904) lt!622184) ((_ is Found!10904) lt!622184) (not ((_ is MissingVacant!10904) lt!622184)) (not (= (index!45996 lt!622184) (index!45995 lt!622032))) (and (bvsge (index!45996 lt!622184) #b00000000000000000000000000000000) (bvslt (index!45996 lt!622184) (size!47143 lt!622035)))) (or ((_ is Undefined!10904) lt!622184) (ite ((_ is Found!10904) lt!622184) (= (select (arr!46593 lt!622035) (index!45994 lt!622184)) (select (arr!46593 a!2901) j!112)) (and ((_ is MissingVacant!10904) lt!622184) (= (index!45996 lt!622184) (index!45995 lt!622032)) (= (select (arr!46593 lt!622035) (index!45996 lt!622184)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!799164 () SeekEntryResult!10904)

(assert (=> d!152063 (= lt!622184 e!799164)))

(declare-fun c!130962 () Bool)

(assert (=> d!152063 (= c!130962 (bvsge (x!127579 lt!622032) #b01111111111111111111111111111110))))

(declare-fun lt!622183 () (_ BitVec 64))

(assert (=> d!152063 (= lt!622183 (select (arr!46593 lt!622035) (index!45995 lt!622032)))))

(assert (=> d!152063 (validMask!0 mask!2840)))

(assert (=> d!152063 (= (seekKeyOrZeroReturnVacant!0 (x!127579 lt!622032) (index!45995 lt!622032) (index!45995 lt!622032) (select (arr!46593 a!2901) j!112) lt!622035 mask!2840) lt!622184)))

(declare-fun b!1412215 () Bool)

(declare-fun c!130964 () Bool)

(assert (=> b!1412215 (= c!130964 (= lt!622183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799162 () SeekEntryResult!10904)

(assert (=> b!1412215 (= e!799162 e!799163)))

(declare-fun b!1412216 () Bool)

(assert (=> b!1412216 (= e!799164 Undefined!10904)))

(declare-fun b!1412217 () Bool)

(assert (=> b!1412217 (= e!799163 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127579 lt!622032) #b00000000000000000000000000000001) (nextIndex!0 (index!45995 lt!622032) (x!127579 lt!622032) mask!2840) (index!45995 lt!622032) (select (arr!46593 a!2901) j!112) lt!622035 mask!2840))))

(declare-fun b!1412218 () Bool)

(assert (=> b!1412218 (= e!799162 (Found!10904 (index!45995 lt!622032)))))

(declare-fun b!1412219 () Bool)

(assert (=> b!1412219 (= e!799164 e!799162)))

(declare-fun c!130963 () Bool)

(assert (=> b!1412219 (= c!130963 (= lt!622183 (select (arr!46593 a!2901) j!112)))))

(assert (= (and d!152063 c!130962) b!1412216))

(assert (= (and d!152063 (not c!130962)) b!1412219))

(assert (= (and b!1412219 c!130963) b!1412218))

(assert (= (and b!1412219 (not c!130963)) b!1412215))

(assert (= (and b!1412215 c!130964) b!1412214))

(assert (= (and b!1412215 (not c!130964)) b!1412217))

(declare-fun m!1302195 () Bool)

(assert (=> d!152063 m!1302195))

(declare-fun m!1302197 () Bool)

(assert (=> d!152063 m!1302197))

(declare-fun m!1302199 () Bool)

(assert (=> d!152063 m!1302199))

(assert (=> d!152063 m!1301969))

(declare-fun m!1302201 () Bool)

(assert (=> b!1412217 m!1302201))

(assert (=> b!1412217 m!1302201))

(assert (=> b!1412217 m!1301943))

(declare-fun m!1302203 () Bool)

(assert (=> b!1412217 m!1302203))

(assert (=> b!1411903 d!152063))

(declare-fun d!152071 () Bool)

(assert (=> d!152071 (and (not (undefined!11716 lt!622032)) (= (index!45995 lt!622032) i!1037) (bvslt (x!127579 lt!622032) (x!127579 lt!622034)))))

(declare-fun lt!622190 () Unit!47782)

(declare-fun choose!62 (array!96509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47782)

(assert (=> d!152071 (= lt!622190 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622031 (x!127579 lt!622034) (index!45995 lt!622034) (x!127579 lt!622032) (index!45995 lt!622032) (undefined!11716 lt!622032) mask!2840))))

(assert (=> d!152071 (validMask!0 mask!2840)))

(assert (=> d!152071 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622031 (x!127579 lt!622034) (index!45995 lt!622034) (x!127579 lt!622032) (index!45995 lt!622032) (undefined!11716 lt!622032) mask!2840) lt!622190)))

(declare-fun bs!41172 () Bool)

(assert (= bs!41172 d!152071))

(declare-fun m!1302207 () Bool)

(assert (=> bs!41172 m!1302207))

(assert (=> bs!41172 m!1301969))

(assert (=> b!1411903 d!152071))

(check-sat (not bm!67081) (not b!1412020) (not b!1412084) (not bm!67085) (not b!1412217) (not b!1412051) (not d!152025) (not d!152043) (not d!152027) (not b!1412049) (not b!1412085) (not d!152061) (not d!151997) (not bm!67082) (not b!1412154) (not b!1412052) (not b!1412082) (not d!152063) (not b!1411965) (not d!152071) (not b!1412021) (not b!1412160))
(check-sat)
