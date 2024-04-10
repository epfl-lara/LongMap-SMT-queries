; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120694 () Bool)

(assert start!120694)

(declare-fun b!1404783 () Bool)

(declare-fun e!795229 () Bool)

(declare-datatypes ((SeekEntryResult!10686 0))(
  ( (MissingZero!10686 (index!45121 (_ BitVec 32))) (Found!10686 (index!45122 (_ BitVec 32))) (Intermediate!10686 (undefined!11498 Bool) (index!45123 (_ BitVec 32)) (x!126735 (_ BitVec 32))) (Undefined!10686) (MissingVacant!10686 (index!45124 (_ BitVec 32))) )
))
(declare-fun lt!618798 () SeekEntryResult!10686)

(assert (=> b!1404783 (= e!795229 (not (or (not (is-Intermediate!10686 lt!618798)) (not (undefined!11498 lt!618798)))))))

(declare-fun e!795228 () Bool)

(assert (=> b!1404783 e!795228))

(declare-fun res!943152 () Bool)

(assert (=> b!1404783 (=> (not res!943152) (not e!795228))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96052 0))(
  ( (array!96053 (arr!46375 (Array (_ BitVec 32) (_ BitVec 64))) (size!46925 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96052)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96052 (_ BitVec 32)) Bool)

(assert (=> b!1404783 (= res!943152 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47346 0))(
  ( (Unit!47347) )
))
(declare-fun lt!618797 () Unit!47346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47346)

(assert (=> b!1404783 (= lt!618797 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96052 (_ BitVec 32)) SeekEntryResult!10686)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404783 (= lt!618798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46375 a!2901) j!112) mask!2840) (select (arr!46375 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943149 () Bool)

(assert (=> start!120694 (=> (not res!943149) (not e!795229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120694 (= res!943149 (validMask!0 mask!2840))))

(assert (=> start!120694 e!795229))

(assert (=> start!120694 true))

(declare-fun array_inv!35403 (array!96052) Bool)

(assert (=> start!120694 (array_inv!35403 a!2901)))

(declare-fun b!1404784 () Bool)

(declare-fun res!943148 () Bool)

(assert (=> b!1404784 (=> (not res!943148) (not e!795229))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404784 (= res!943148 (and (= (size!46925 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46925 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46925 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404785 () Bool)

(declare-fun res!943151 () Bool)

(assert (=> b!1404785 (=> (not res!943151) (not e!795229))))

(declare-datatypes ((List!32894 0))(
  ( (Nil!32891) (Cons!32890 (h!34141 (_ BitVec 64)) (t!47588 List!32894)) )
))
(declare-fun arrayNoDuplicates!0 (array!96052 (_ BitVec 32) List!32894) Bool)

(assert (=> b!1404785 (= res!943151 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32891))))

(declare-fun b!1404786 () Bool)

(declare-fun res!943153 () Bool)

(assert (=> b!1404786 (=> (not res!943153) (not e!795229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404786 (= res!943153 (validKeyInArray!0 (select (arr!46375 a!2901) j!112)))))

(declare-fun b!1404787 () Bool)

(declare-fun res!943147 () Bool)

(assert (=> b!1404787 (=> (not res!943147) (not e!795229))))

(assert (=> b!1404787 (= res!943147 (validKeyInArray!0 (select (arr!46375 a!2901) i!1037)))))

(declare-fun b!1404788 () Bool)

(declare-fun res!943150 () Bool)

(assert (=> b!1404788 (=> (not res!943150) (not e!795229))))

(assert (=> b!1404788 (= res!943150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404789 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96052 (_ BitVec 32)) SeekEntryResult!10686)

(assert (=> b!1404789 (= e!795228 (= (seekEntryOrOpen!0 (select (arr!46375 a!2901) j!112) a!2901 mask!2840) (Found!10686 j!112)))))

(assert (= (and start!120694 res!943149) b!1404784))

(assert (= (and b!1404784 res!943148) b!1404787))

(assert (= (and b!1404787 res!943147) b!1404786))

(assert (= (and b!1404786 res!943153) b!1404788))

(assert (= (and b!1404788 res!943150) b!1404785))

(assert (= (and b!1404785 res!943151) b!1404783))

(assert (= (and b!1404783 res!943152) b!1404789))

(declare-fun m!1293565 () Bool)

(assert (=> b!1404789 m!1293565))

(assert (=> b!1404789 m!1293565))

(declare-fun m!1293567 () Bool)

(assert (=> b!1404789 m!1293567))

(assert (=> b!1404783 m!1293565))

(declare-fun m!1293569 () Bool)

(assert (=> b!1404783 m!1293569))

(assert (=> b!1404783 m!1293565))

(declare-fun m!1293571 () Bool)

(assert (=> b!1404783 m!1293571))

(assert (=> b!1404783 m!1293569))

(assert (=> b!1404783 m!1293565))

(declare-fun m!1293573 () Bool)

(assert (=> b!1404783 m!1293573))

(declare-fun m!1293575 () Bool)

(assert (=> b!1404783 m!1293575))

(declare-fun m!1293577 () Bool)

(assert (=> start!120694 m!1293577))

(declare-fun m!1293579 () Bool)

(assert (=> start!120694 m!1293579))

(declare-fun m!1293581 () Bool)

(assert (=> b!1404788 m!1293581))

(assert (=> b!1404786 m!1293565))

(assert (=> b!1404786 m!1293565))

(declare-fun m!1293583 () Bool)

(assert (=> b!1404786 m!1293583))

(declare-fun m!1293585 () Bool)

(assert (=> b!1404785 m!1293585))

(declare-fun m!1293587 () Bool)

(assert (=> b!1404787 m!1293587))

(assert (=> b!1404787 m!1293587))

(declare-fun m!1293589 () Bool)

(assert (=> b!1404787 m!1293589))

(push 1)

(assert (not b!1404783))

(assert (not b!1404787))

(assert (not start!120694))

(assert (not b!1404785))

(assert (not b!1404789))

(assert (not b!1404786))

(assert (not b!1404788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151323 () Bool)

(assert (=> d!151323 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120694 d!151323))

(declare-fun d!151333 () Bool)

(assert (=> d!151333 (= (array_inv!35403 a!2901) (bvsge (size!46925 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120694 d!151333))

(declare-fun bm!66937 () Bool)

(declare-fun call!66940 () Bool)

(declare-fun c!130290 () Bool)

(assert (=> bm!66937 (= call!66940 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130290 (Cons!32890 (select (arr!46375 a!2901) #b00000000000000000000000000000000) Nil!32891) Nil!32891)))))

(declare-fun b!1404840 () Bool)

(declare-fun e!795271 () Bool)

(declare-fun contains!9792 (List!32894 (_ BitVec 64)) Bool)

(assert (=> b!1404840 (= e!795271 (contains!9792 Nil!32891 (select (arr!46375 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404841 () Bool)

(declare-fun e!795272 () Bool)

(declare-fun e!795269 () Bool)

(assert (=> b!1404841 (= e!795272 e!795269)))

(assert (=> b!1404841 (= c!130290 (validKeyInArray!0 (select (arr!46375 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404842 () Bool)

(assert (=> b!1404842 (= e!795269 call!66940)))

(declare-fun b!1404843 () Bool)

(declare-fun e!795270 () Bool)

(assert (=> b!1404843 (= e!795270 e!795272)))

(declare-fun res!943183 () Bool)

(assert (=> b!1404843 (=> (not res!943183) (not e!795272))))

(assert (=> b!1404843 (= res!943183 (not e!795271))))

(declare-fun res!943182 () Bool)

(assert (=> b!1404843 (=> (not res!943182) (not e!795271))))

(assert (=> b!1404843 (= res!943182 (validKeyInArray!0 (select (arr!46375 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404839 () Bool)

(assert (=> b!1404839 (= e!795269 call!66940)))

(declare-fun d!151335 () Bool)

(declare-fun res!943181 () Bool)

(assert (=> d!151335 (=> res!943181 e!795270)))

(assert (=> d!151335 (= res!943181 (bvsge #b00000000000000000000000000000000 (size!46925 a!2901)))))

(assert (=> d!151335 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32891) e!795270)))

(assert (= (and d!151335 (not res!943181)) b!1404843))

(assert (= (and b!1404843 res!943182) b!1404840))

(assert (= (and b!1404843 res!943183) b!1404841))

(assert (= (and b!1404841 c!130290) b!1404842))

(assert (= (and b!1404841 (not c!130290)) b!1404839))

(assert (= (or b!1404842 b!1404839) bm!66937))

(declare-fun m!1293615 () Bool)

(assert (=> bm!66937 m!1293615))

(declare-fun m!1293617 () Bool)

(assert (=> bm!66937 m!1293617))

(assert (=> b!1404840 m!1293615))

(assert (=> b!1404840 m!1293615))

(declare-fun m!1293619 () Bool)

(assert (=> b!1404840 m!1293619))

(assert (=> b!1404841 m!1293615))

(assert (=> b!1404841 m!1293615))

(declare-fun m!1293621 () Bool)

(assert (=> b!1404841 m!1293621))

(assert (=> b!1404843 m!1293615))

(assert (=> b!1404843 m!1293615))

(assert (=> b!1404843 m!1293621))

(assert (=> b!1404785 d!151335))

(declare-fun d!151341 () Bool)

(assert (=> d!151341 (= (validKeyInArray!0 (select (arr!46375 a!2901) i!1037)) (and (not (= (select (arr!46375 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46375 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404787 d!151341))

(declare-fun d!151343 () Bool)

(assert (=> d!151343 (= (validKeyInArray!0 (select (arr!46375 a!2901) j!112)) (and (not (= (select (arr!46375 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46375 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404786 d!151343))

(declare-fun b!1404870 () Bool)

(declare-fun e!795289 () Bool)

(declare-fun call!66943 () Bool)

(assert (=> b!1404870 (= e!795289 call!66943)))

(declare-fun bm!66940 () Bool)

(assert (=> bm!66940 (= call!66943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1404871 () Bool)

(declare-fun e!795290 () Bool)

(assert (=> b!1404871 (= e!795290 e!795289)))

(declare-fun lt!618835 () (_ BitVec 64))

(assert (=> b!1404871 (= lt!618835 (select (arr!46375 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!618833 () Unit!47346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96052 (_ BitVec 64) (_ BitVec 32)) Unit!47346)

(assert (=> b!1404871 (= lt!618833 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618835 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1404871 (arrayContainsKey!0 a!2901 lt!618835 #b00000000000000000000000000000000)))

(declare-fun lt!618834 () Unit!47346)

(assert (=> b!1404871 (= lt!618834 lt!618833)))

(declare-fun res!943194 () Bool)

(assert (=> b!1404871 (= res!943194 (= (seekEntryOrOpen!0 (select (arr!46375 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10686 #b00000000000000000000000000000000)))))

(assert (=> b!1404871 (=> (not res!943194) (not e!795289))))

(declare-fun b!1404872 () Bool)

(declare-fun e!795291 () Bool)

(assert (=> b!1404872 (= e!795291 e!795290)))

(declare-fun c!130299 () Bool)

(assert (=> b!1404872 (= c!130299 (validKeyInArray!0 (select (arr!46375 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151345 () Bool)

(declare-fun res!943195 () Bool)

(assert (=> d!151345 (=> res!943195 e!795291)))

(assert (=> d!151345 (= res!943195 (bvsge #b00000000000000000000000000000000 (size!46925 a!2901)))))

(assert (=> d!151345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795291)))

(declare-fun b!1404873 () Bool)

(assert (=> b!1404873 (= e!795290 call!66943)))

(assert (= (and d!151345 (not res!943195)) b!1404872))

(assert (= (and b!1404872 c!130299) b!1404871))

(assert (= (and b!1404872 (not c!130299)) b!1404873))

(assert (= (and b!1404871 res!943194) b!1404870))

(assert (= (or b!1404870 b!1404873) bm!66940))

(declare-fun m!1293623 () Bool)

(assert (=> bm!66940 m!1293623))

(assert (=> b!1404871 m!1293615))

(declare-fun m!1293625 () Bool)

(assert (=> b!1404871 m!1293625))

(declare-fun m!1293627 () Bool)

(assert (=> b!1404871 m!1293627))

(assert (=> b!1404871 m!1293615))

(declare-fun m!1293629 () Bool)

(assert (=> b!1404871 m!1293629))

(assert (=> b!1404872 m!1293615))

(assert (=> b!1404872 m!1293615))

(assert (=> b!1404872 m!1293621))

(assert (=> b!1404788 d!151345))

(declare-fun b!1404874 () Bool)

(declare-fun e!795292 () Bool)

(declare-fun call!66944 () Bool)

(assert (=> b!1404874 (= e!795292 call!66944)))

(declare-fun bm!66941 () Bool)

(assert (=> bm!66941 (= call!66944 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1404875 () Bool)

(declare-fun e!795293 () Bool)

(assert (=> b!1404875 (= e!795293 e!795292)))

(declare-fun lt!618838 () (_ BitVec 64))

(assert (=> b!1404875 (= lt!618838 (select (arr!46375 a!2901) j!112))))

(declare-fun lt!618836 () Unit!47346)

(assert (=> b!1404875 (= lt!618836 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618838 j!112))))

(assert (=> b!1404875 (arrayContainsKey!0 a!2901 lt!618838 #b00000000000000000000000000000000)))

(declare-fun lt!618837 () Unit!47346)

(assert (=> b!1404875 (= lt!618837 lt!618836)))

(declare-fun res!943196 () Bool)

(assert (=> b!1404875 (= res!943196 (= (seekEntryOrOpen!0 (select (arr!46375 a!2901) j!112) a!2901 mask!2840) (Found!10686 j!112)))))

(assert (=> b!1404875 (=> (not res!943196) (not e!795292))))

(declare-fun b!1404876 () Bool)

(declare-fun e!795294 () Bool)

(assert (=> b!1404876 (= e!795294 e!795293)))

(declare-fun c!130300 () Bool)

(assert (=> b!1404876 (= c!130300 (validKeyInArray!0 (select (arr!46375 a!2901) j!112)))))

(declare-fun d!151347 () Bool)

(declare-fun res!943197 () Bool)

(assert (=> d!151347 (=> res!943197 e!795294)))

(assert (=> d!151347 (= res!943197 (bvsge j!112 (size!46925 a!2901)))))

(assert (=> d!151347 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!795294)))

(declare-fun b!1404877 () Bool)

(assert (=> b!1404877 (= e!795293 call!66944)))

(assert (= (and d!151347 (not res!943197)) b!1404876))

(assert (= (and b!1404876 c!130300) b!1404875))

(assert (= (and b!1404876 (not c!130300)) b!1404877))

(assert (= (and b!1404875 res!943196) b!1404874))

(assert (= (or b!1404874 b!1404877) bm!66941))

(declare-fun m!1293631 () Bool)

(assert (=> bm!66941 m!1293631))

(assert (=> b!1404875 m!1293565))

(declare-fun m!1293633 () Bool)

(assert (=> b!1404875 m!1293633))

(declare-fun m!1293635 () Bool)

(assert (=> b!1404875 m!1293635))

(assert (=> b!1404875 m!1293565))

(assert (=> b!1404875 m!1293567))

(assert (=> b!1404876 m!1293565))

(assert (=> b!1404876 m!1293565))

(assert (=> b!1404876 m!1293583))

(assert (=> b!1404783 d!151347))

(declare-fun d!151349 () Bool)

(assert (=> d!151349 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618847 () Unit!47346)

(declare-fun choose!38 (array!96052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47346)

(assert (=> d!151349 (= lt!618847 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151349 (validMask!0 mask!2840)))

(assert (=> d!151349 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!618847)))

(declare-fun bs!40930 () Bool)

(assert (= bs!40930 d!151349))

(assert (=> bs!40930 m!1293575))

(declare-fun m!1293645 () Bool)

(assert (=> bs!40930 m!1293645))

(assert (=> bs!40930 m!1293577))

(assert (=> b!1404783 d!151349))

(declare-fun b!1404936 () Bool)

(declare-fun lt!618870 () SeekEntryResult!10686)

(assert (=> b!1404936 (and (bvsge (index!45123 lt!618870) #b00000000000000000000000000000000) (bvslt (index!45123 lt!618870) (size!46925 a!2901)))))

(declare-fun res!943222 () Bool)

(assert (=> b!1404936 (= res!943222 (= (select (arr!46375 a!2901) (index!45123 lt!618870)) (select (arr!46375 a!2901) j!112)))))

(declare-fun e!795332 () Bool)

(assert (=> b!1404936 (=> res!943222 e!795332)))

(declare-fun e!795329 () Bool)

(assert (=> b!1404936 (= e!795329 e!795332)))

(declare-fun b!1404937 () Bool)

(declare-fun e!795330 () Bool)

(assert (=> b!1404937 (= e!795330 e!795329)))

(declare-fun res!943221 () Bool)

(assert (=> b!1404937 (= res!943221 (and (is-Intermediate!10686 lt!618870) (not (undefined!11498 lt!618870)) (bvslt (x!126735 lt!618870) #b01111111111111111111111111111110) (bvsge (x!126735 lt!618870) #b00000000000000000000000000000000) (bvsge (x!126735 lt!618870) #b00000000000000000000000000000000)))))

(assert (=> b!1404937 (=> (not res!943221) (not e!795329))))

(declare-fun b!1404938 () Bool)

(assert (=> b!1404938 (and (bvsge (index!45123 lt!618870) #b00000000000000000000000000000000) (bvslt (index!45123 lt!618870) (size!46925 a!2901)))))

(assert (=> b!1404938 (= e!795332 (= (select (arr!46375 a!2901) (index!45123 lt!618870)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1404939 () Bool)

(declare-fun e!795328 () SeekEntryResult!10686)

(declare-fun e!795331 () SeekEntryResult!10686)

(assert (=> b!1404939 (= e!795328 e!795331)))

(declare-fun c!130320 () Bool)

(declare-fun lt!618869 () (_ BitVec 64))

(assert (=> b!1404939 (= c!130320 (or (= lt!618869 (select (arr!46375 a!2901) j!112)) (= (bvadd lt!618869 lt!618869) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1404940 () Bool)

(assert (=> b!1404940 (= e!795330 (bvsge (x!126735 lt!618870) #b01111111111111111111111111111110))))

(declare-fun b!1404941 () Bool)

(assert (=> b!1404941 (= e!795331 (Intermediate!10686 false (toIndex!0 (select (arr!46375 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404942 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404942 (= e!795331 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46375 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46375 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404943 () Bool)

(assert (=> b!1404943 (= e!795328 (Intermediate!10686 true (toIndex!0 (select (arr!46375 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151353 () Bool)

(assert (=> d!151353 e!795330))

(declare-fun c!130322 () Bool)

(assert (=> d!151353 (= c!130322 (and (is-Intermediate!10686 lt!618870) (undefined!11498 lt!618870)))))

(assert (=> d!151353 (= lt!618870 e!795328)))

(declare-fun c!130321 () Bool)

(assert (=> d!151353 (= c!130321 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151353 (= lt!618869 (select (arr!46375 a!2901) (toIndex!0 (select (arr!46375 a!2901) j!112) mask!2840)))))

(assert (=> d!151353 (validMask!0 mask!2840)))

(assert (=> d!151353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46375 a!2901) j!112) mask!2840) (select (arr!46375 a!2901) j!112) a!2901 mask!2840) lt!618870)))

(declare-fun b!1404944 () Bool)

(assert (=> b!1404944 (and (bvsge (index!45123 lt!618870) #b00000000000000000000000000000000) (bvslt (index!45123 lt!618870) (size!46925 a!2901)))))

(declare-fun res!943220 () Bool)

(assert (=> b!1404944 (= res!943220 (= (select (arr!46375 a!2901) (index!45123 lt!618870)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404944 (=> res!943220 e!795332)))

(assert (= (and d!151353 c!130321) b!1404943))

(assert (= (and d!151353 (not c!130321)) b!1404939))

(assert (= (and b!1404939 c!130320) b!1404941))

(assert (= (and b!1404939 (not c!130320)) b!1404942))

(assert (= (and d!151353 c!130322) b!1404940))

(assert (= (and d!151353 (not c!130322)) b!1404937))

(assert (= (and b!1404937 res!943221) b!1404936))

(assert (= (and b!1404936 (not res!943222)) b!1404944))

(assert (= (and b!1404944 (not res!943220)) b!1404938))

(declare-fun m!1293667 () Bool)

(assert (=> b!1404944 m!1293667))

(assert (=> d!151353 m!1293569))

(declare-fun m!1293669 () Bool)

(assert (=> d!151353 m!1293669))

(assert (=> d!151353 m!1293577))

(assert (=> b!1404942 m!1293569))

(declare-fun m!1293671 () Bool)

(assert (=> b!1404942 m!1293671))

(assert (=> b!1404942 m!1293671))

(assert (=> b!1404942 m!1293565))

(declare-fun m!1293673 () Bool)

(assert (=> b!1404942 m!1293673))

(assert (=> b!1404938 m!1293667))

(assert (=> b!1404936 m!1293667))

(assert (=> b!1404783 d!151353))

(declare-fun d!151367 () Bool)

(declare-fun lt!618882 () (_ BitVec 32))

(declare-fun lt!618881 () (_ BitVec 32))

(assert (=> d!151367 (= lt!618882 (bvmul (bvxor lt!618881 (bvlshr lt!618881 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151367 (= lt!618881 ((_ extract 31 0) (bvand (bvxor (select (arr!46375 a!2901) j!112) (bvlshr (select (arr!46375 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151367 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943223 (let ((h!34144 ((_ extract 31 0) (bvand (bvxor (select (arr!46375 a!2901) j!112) (bvlshr (select (arr!46375 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126741 (bvmul (bvxor h!34144 (bvlshr h!34144 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126741 (bvlshr x!126741 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943223 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943223 #b00000000000000000000000000000000))))))

(assert (=> d!151367 (= (toIndex!0 (select (arr!46375 a!2901) j!112) mask!2840) (bvand (bvxor lt!618882 (bvlshr lt!618882 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1404783 d!151367))

(declare-fun b!1405012 () Bool)

(declare-fun e!795374 () SeekEntryResult!10686)

(assert (=> b!1405012 (= e!795374 Undefined!10686)))

(declare-fun b!1405013 () Bool)

(declare-fun e!795373 () SeekEntryResult!10686)

(declare-fun lt!618906 () SeekEntryResult!10686)

(assert (=> b!1405013 (= e!795373 (Found!10686 (index!45123 lt!618906)))))

(declare-fun b!1405014 () Bool)

(declare-fun c!130353 () Bool)

(declare-fun lt!618905 () (_ BitVec 64))

(assert (=> b!1405014 (= c!130353 (= lt!618905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!795372 () SeekEntryResult!10686)

(assert (=> b!1405014 (= e!795373 e!795372)))

(declare-fun b!1405015 () Bool)

(assert (=> b!1405015 (= e!795374 e!795373)))

(assert (=> b!1405015 (= lt!618905 (select (arr!46375 a!2901) (index!45123 lt!618906)))))

(declare-fun c!130352 () Bool)

(assert (=> b!1405015 (= c!130352 (= lt!618905 (select (arr!46375 a!2901) j!112)))))

