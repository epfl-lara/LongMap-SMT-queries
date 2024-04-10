; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121356 () Bool)

(assert start!121356)

(declare-fun b!1410332 () Bool)

(declare-fun res!947726 () Bool)

(declare-fun e!798104 () Bool)

(assert (=> b!1410332 (=> (not res!947726) (not e!798104))))

(declare-datatypes ((array!96408 0))(
  ( (array!96409 (arr!46544 (Array (_ BitVec 32) (_ BitVec 64))) (size!47094 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96408)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410332 (= res!947726 (validKeyInArray!0 (select (arr!46544 a!2901) i!1037)))))

(declare-fun b!1410333 () Bool)

(declare-fun res!947724 () Bool)

(assert (=> b!1410333 (=> (not res!947724) (not e!798104))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410333 (= res!947724 (validKeyInArray!0 (select (arr!46544 a!2901) j!112)))))

(declare-datatypes ((SeekEntryResult!10855 0))(
  ( (MissingZero!10855 (index!45797 (_ BitVec 32))) (Found!10855 (index!45798 (_ BitVec 32))) (Intermediate!10855 (undefined!11667 Bool) (index!45799 (_ BitVec 32)) (x!127396 (_ BitVec 32))) (Undefined!10855) (MissingVacant!10855 (index!45800 (_ BitVec 32))) )
))
(declare-fun lt!621120 () SeekEntryResult!10855)

(declare-fun e!798107 () Bool)

(declare-fun b!1410334 () Bool)

(declare-fun lt!621117 () (_ BitVec 32))

(declare-fun lt!621118 () SeekEntryResult!10855)

(assert (=> b!1410334 (= e!798107 (or (= lt!621118 lt!621120) (not (is-Intermediate!10855 lt!621120)) (bvslt (x!127396 lt!621118) #b00000000000000000000000000000000) (bvsgt (x!127396 lt!621118) #b01111111111111111111111111111110) (bvslt lt!621117 #b00000000000000000000000000000000) (bvsge lt!621117 (size!47094 a!2901)) (and (bvsge (index!45799 lt!621118) #b00000000000000000000000000000000) (bvslt (index!45799 lt!621118) (size!47094 a!2901)))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96408 (_ BitVec 32)) SeekEntryResult!10855)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410334 (= lt!621120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901)) mask!2840))))

(declare-fun b!1410335 () Bool)

(declare-fun res!947731 () Bool)

(assert (=> b!1410335 (=> (not res!947731) (not e!798104))))

(assert (=> b!1410335 (= res!947731 (and (= (size!47094 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47094 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47094 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410336 () Bool)

(declare-fun res!947728 () Bool)

(assert (=> b!1410336 (=> (not res!947728) (not e!798104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96408 (_ BitVec 32)) Bool)

(assert (=> b!1410336 (= res!947728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410337 () Bool)

(declare-fun res!947729 () Bool)

(assert (=> b!1410337 (=> (not res!947729) (not e!798104))))

(declare-datatypes ((List!33063 0))(
  ( (Nil!33060) (Cons!33059 (h!34328 (_ BitVec 64)) (t!47757 List!33063)) )
))
(declare-fun arrayNoDuplicates!0 (array!96408 (_ BitVec 32) List!33063) Bool)

(assert (=> b!1410337 (= res!947729 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33060))))

(declare-fun b!1410338 () Bool)

(assert (=> b!1410338 (= e!798104 (not e!798107))))

(declare-fun res!947730 () Bool)

(assert (=> b!1410338 (=> res!947730 e!798107)))

(assert (=> b!1410338 (= res!947730 (or (not (is-Intermediate!10855 lt!621118)) (undefined!11667 lt!621118)))))

(declare-fun e!798105 () Bool)

(assert (=> b!1410338 e!798105))

(declare-fun res!947727 () Bool)

(assert (=> b!1410338 (=> (not res!947727) (not e!798105))))

(assert (=> b!1410338 (= res!947727 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47684 0))(
  ( (Unit!47685) )
))
(declare-fun lt!621119 () Unit!47684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47684)

(assert (=> b!1410338 (= lt!621119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410338 (= lt!621118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621117 (select (arr!46544 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410338 (= lt!621117 (toIndex!0 (select (arr!46544 a!2901) j!112) mask!2840))))

(declare-fun res!947725 () Bool)

(assert (=> start!121356 (=> (not res!947725) (not e!798104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121356 (= res!947725 (validMask!0 mask!2840))))

(assert (=> start!121356 e!798104))

(assert (=> start!121356 true))

(declare-fun array_inv!35572 (array!96408) Bool)

(assert (=> start!121356 (array_inv!35572 a!2901)))

(declare-fun b!1410339 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96408 (_ BitVec 32)) SeekEntryResult!10855)

(assert (=> b!1410339 (= e!798105 (= (seekEntryOrOpen!0 (select (arr!46544 a!2901) j!112) a!2901 mask!2840) (Found!10855 j!112)))))

(assert (= (and start!121356 res!947725) b!1410335))

(assert (= (and b!1410335 res!947731) b!1410332))

(assert (= (and b!1410332 res!947726) b!1410333))

(assert (= (and b!1410333 res!947724) b!1410336))

(assert (= (and b!1410336 res!947728) b!1410337))

(assert (= (and b!1410337 res!947729) b!1410338))

(assert (= (and b!1410338 res!947727) b!1410339))

(assert (= (and b!1410338 (not res!947730)) b!1410334))

(declare-fun m!1300005 () Bool)

(assert (=> b!1410337 m!1300005))

(declare-fun m!1300007 () Bool)

(assert (=> start!121356 m!1300007))

(declare-fun m!1300009 () Bool)

(assert (=> start!121356 m!1300009))

(declare-fun m!1300011 () Bool)

(assert (=> b!1410338 m!1300011))

(declare-fun m!1300013 () Bool)

(assert (=> b!1410338 m!1300013))

(assert (=> b!1410338 m!1300011))

(declare-fun m!1300015 () Bool)

(assert (=> b!1410338 m!1300015))

(assert (=> b!1410338 m!1300011))

(declare-fun m!1300017 () Bool)

(assert (=> b!1410338 m!1300017))

(declare-fun m!1300019 () Bool)

(assert (=> b!1410338 m!1300019))

(declare-fun m!1300021 () Bool)

(assert (=> b!1410334 m!1300021))

(declare-fun m!1300023 () Bool)

(assert (=> b!1410334 m!1300023))

(assert (=> b!1410334 m!1300023))

(declare-fun m!1300025 () Bool)

(assert (=> b!1410334 m!1300025))

(assert (=> b!1410334 m!1300025))

(assert (=> b!1410334 m!1300023))

(declare-fun m!1300027 () Bool)

(assert (=> b!1410334 m!1300027))

(declare-fun m!1300029 () Bool)

(assert (=> b!1410332 m!1300029))

(assert (=> b!1410332 m!1300029))

(declare-fun m!1300031 () Bool)

(assert (=> b!1410332 m!1300031))

(assert (=> b!1410339 m!1300011))

(assert (=> b!1410339 m!1300011))

(declare-fun m!1300033 () Bool)

(assert (=> b!1410339 m!1300033))

(assert (=> b!1410333 m!1300011))

(assert (=> b!1410333 m!1300011))

(declare-fun m!1300035 () Bool)

(assert (=> b!1410333 m!1300035))

(declare-fun m!1300037 () Bool)

(assert (=> b!1410336 m!1300037))

(push 1)

(assert (not b!1410339))

(assert (not start!121356))

(assert (not b!1410337))

(assert (not b!1410334))

(assert (not b!1410336))

(assert (not b!1410338))

(assert (not b!1410332))

(assert (not b!1410333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1410431 () Bool)

(declare-fun e!798161 () Bool)

(declare-fun e!798162 () Bool)

(assert (=> b!1410431 (= e!798161 e!798162)))

(declare-fun c!130788 () Bool)

(assert (=> b!1410431 (= c!130788 (validKeyInArray!0 (select (arr!46544 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410432 () Bool)

(declare-fun call!67060 () Bool)

(assert (=> b!1410432 (= e!798162 call!67060)))

(declare-fun bm!67057 () Bool)

(assert (=> bm!67057 (= call!67060 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130788 (Cons!33059 (select (arr!46544 a!2901) #b00000000000000000000000000000000) Nil!33060) Nil!33060)))))

(declare-fun b!1410433 () Bool)

(declare-fun e!798164 () Bool)

(assert (=> b!1410433 (= e!798164 e!798161)))

(declare-fun res!947797 () Bool)

(assert (=> b!1410433 (=> (not res!947797) (not e!798161))))

(declare-fun e!798163 () Bool)

(assert (=> b!1410433 (= res!947797 (not e!798163))))

(declare-fun res!947795 () Bool)

(assert (=> b!1410433 (=> (not res!947795) (not e!798163))))

(assert (=> b!1410433 (= res!947795 (validKeyInArray!0 (select (arr!46544 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410434 () Bool)

(assert (=> b!1410434 (= e!798162 call!67060)))

(declare-fun d!151891 () Bool)

(declare-fun res!947796 () Bool)

(assert (=> d!151891 (=> res!947796 e!798164)))

(assert (=> d!151891 (= res!947796 (bvsge #b00000000000000000000000000000000 (size!47094 a!2901)))))

(assert (=> d!151891 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33060) e!798164)))

(declare-fun b!1410435 () Bool)

(declare-fun contains!9809 (List!33063 (_ BitVec 64)) Bool)

(assert (=> b!1410435 (= e!798163 (contains!9809 Nil!33060 (select (arr!46544 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151891 (not res!947796)) b!1410433))

(assert (= (and b!1410433 res!947795) b!1410435))

(assert (= (and b!1410433 res!947797) b!1410431))

(assert (= (and b!1410431 c!130788) b!1410434))

(assert (= (and b!1410431 (not c!130788)) b!1410432))

(assert (= (or b!1410434 b!1410432) bm!67057))

(declare-fun m!1300127 () Bool)

(assert (=> b!1410431 m!1300127))

(assert (=> b!1410431 m!1300127))

(declare-fun m!1300129 () Bool)

(assert (=> b!1410431 m!1300129))

(assert (=> bm!67057 m!1300127))

(declare-fun m!1300131 () Bool)

(assert (=> bm!67057 m!1300131))

(assert (=> b!1410433 m!1300127))

(assert (=> b!1410433 m!1300127))

(assert (=> b!1410433 m!1300129))

(assert (=> b!1410435 m!1300127))

(assert (=> b!1410435 m!1300127))

(declare-fun m!1300133 () Bool)

(assert (=> b!1410435 m!1300133))

(assert (=> b!1410337 d!151891))

(declare-fun d!151901 () Bool)

(assert (=> d!151901 (= (validKeyInArray!0 (select (arr!46544 a!2901) i!1037)) (and (not (= (select (arr!46544 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46544 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410332 d!151901))

(declare-fun d!151903 () Bool)

(declare-fun res!947808 () Bool)

(declare-fun e!798180 () Bool)

(assert (=> d!151903 (=> res!947808 e!798180)))

(assert (=> d!151903 (= res!947808 (bvsge j!112 (size!47094 a!2901)))))

(assert (=> d!151903 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798180)))

(declare-fun call!67066 () Bool)

(declare-fun bm!67063 () Bool)

(assert (=> bm!67063 (= call!67066 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1410456 () Bool)

(declare-fun e!798181 () Bool)

(assert (=> b!1410456 (= e!798180 e!798181)))

(declare-fun c!130794 () Bool)

(assert (=> b!1410456 (= c!130794 (validKeyInArray!0 (select (arr!46544 a!2901) j!112)))))

(declare-fun b!1410457 () Bool)

(declare-fun e!798182 () Bool)

(assert (=> b!1410457 (= e!798181 e!798182)))

(declare-fun lt!621170 () (_ BitVec 64))

(assert (=> b!1410457 (= lt!621170 (select (arr!46544 a!2901) j!112))))

(declare-fun lt!621171 () Unit!47684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96408 (_ BitVec 64) (_ BitVec 32)) Unit!47684)

(assert (=> b!1410457 (= lt!621171 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621170 j!112))))

(declare-fun arrayContainsKey!0 (array!96408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410457 (arrayContainsKey!0 a!2901 lt!621170 #b00000000000000000000000000000000)))

(declare-fun lt!621169 () Unit!47684)

(assert (=> b!1410457 (= lt!621169 lt!621171)))

(declare-fun res!947809 () Bool)

(assert (=> b!1410457 (= res!947809 (= (seekEntryOrOpen!0 (select (arr!46544 a!2901) j!112) a!2901 mask!2840) (Found!10855 j!112)))))

(assert (=> b!1410457 (=> (not res!947809) (not e!798182))))

(declare-fun b!1410458 () Bool)

(assert (=> b!1410458 (= e!798181 call!67066)))

(declare-fun b!1410459 () Bool)

(assert (=> b!1410459 (= e!798182 call!67066)))

(assert (= (and d!151903 (not res!947808)) b!1410456))

(assert (= (and b!1410456 c!130794) b!1410457))

(assert (= (and b!1410456 (not c!130794)) b!1410458))

(assert (= (and b!1410457 res!947809) b!1410459))

(assert (= (or b!1410459 b!1410458) bm!67063))

(declare-fun m!1300143 () Bool)

(assert (=> bm!67063 m!1300143))

(assert (=> b!1410456 m!1300011))

(assert (=> b!1410456 m!1300011))

(assert (=> b!1410456 m!1300035))

(assert (=> b!1410457 m!1300011))

(declare-fun m!1300145 () Bool)

(assert (=> b!1410457 m!1300145))

(declare-fun m!1300147 () Bool)

(assert (=> b!1410457 m!1300147))

(assert (=> b!1410457 m!1300011))

(assert (=> b!1410457 m!1300033))

(assert (=> b!1410338 d!151903))

(declare-fun d!151907 () Bool)

(assert (=> d!151907 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621178 () Unit!47684)

(declare-fun choose!38 (array!96408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47684)

(assert (=> d!151907 (= lt!621178 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151907 (validMask!0 mask!2840)))

(assert (=> d!151907 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621178)))

(declare-fun bs!41117 () Bool)

(assert (= bs!41117 d!151907))

(assert (=> bs!41117 m!1300019))

(declare-fun m!1300149 () Bool)

(assert (=> bs!41117 m!1300149))

(assert (=> bs!41117 m!1300007))

(assert (=> b!1410338 d!151907))

(declare-fun b!1410521 () Bool)

(declare-fun lt!621206 () SeekEntryResult!10855)

(assert (=> b!1410521 (and (bvsge (index!45799 lt!621206) #b00000000000000000000000000000000) (bvslt (index!45799 lt!621206) (size!47094 a!2901)))))

(declare-fun e!798222 () Bool)

(assert (=> b!1410521 (= e!798222 (= (select (arr!46544 a!2901) (index!45799 lt!621206)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798220 () SeekEntryResult!10855)

(declare-fun b!1410522 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410522 (= e!798220 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!621117 #b00000000000000000000000000000000 mask!2840) (select (arr!46544 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410523 () Bool)

(assert (=> b!1410523 (and (bvsge (index!45799 lt!621206) #b00000000000000000000000000000000) (bvslt (index!45799 lt!621206) (size!47094 a!2901)))))

(declare-fun res!947836 () Bool)

(assert (=> b!1410523 (= res!947836 (= (select (arr!46544 a!2901) (index!45799 lt!621206)) (select (arr!46544 a!2901) j!112)))))

(assert (=> b!1410523 (=> res!947836 e!798222)))

(declare-fun e!798223 () Bool)

(assert (=> b!1410523 (= e!798223 e!798222)))

(declare-fun b!1410524 () Bool)

(assert (=> b!1410524 (= e!798220 (Intermediate!10855 false lt!621117 #b00000000000000000000000000000000))))

(declare-fun d!151909 () Bool)

(declare-fun e!798221 () Bool)

(assert (=> d!151909 e!798221))

(declare-fun c!130816 () Bool)

(assert (=> d!151909 (= c!130816 (and (is-Intermediate!10855 lt!621206) (undefined!11667 lt!621206)))))

(declare-fun e!798224 () SeekEntryResult!10855)

(assert (=> d!151909 (= lt!621206 e!798224)))

(declare-fun c!130814 () Bool)

(assert (=> d!151909 (= c!130814 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621207 () (_ BitVec 64))

(assert (=> d!151909 (= lt!621207 (select (arr!46544 a!2901) lt!621117))))

(assert (=> d!151909 (validMask!0 mask!2840)))

(assert (=> d!151909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621117 (select (arr!46544 a!2901) j!112) a!2901 mask!2840) lt!621206)))

(declare-fun b!1410525 () Bool)

(assert (=> b!1410525 (= e!798221 (bvsge (x!127396 lt!621206) #b01111111111111111111111111111110))))

(declare-fun b!1410526 () Bool)

(assert (=> b!1410526 (and (bvsge (index!45799 lt!621206) #b00000000000000000000000000000000) (bvslt (index!45799 lt!621206) (size!47094 a!2901)))))

(declare-fun res!947834 () Bool)

(assert (=> b!1410526 (= res!947834 (= (select (arr!46544 a!2901) (index!45799 lt!621206)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410526 (=> res!947834 e!798222)))

(declare-fun b!1410527 () Bool)

(assert (=> b!1410527 (= e!798224 e!798220)))

(declare-fun c!130815 () Bool)

(assert (=> b!1410527 (= c!130815 (or (= lt!621207 (select (arr!46544 a!2901) j!112)) (= (bvadd lt!621207 lt!621207) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410528 () Bool)

(assert (=> b!1410528 (= e!798224 (Intermediate!10855 true lt!621117 #b00000000000000000000000000000000))))

(declare-fun b!1410529 () Bool)

(assert (=> b!1410529 (= e!798221 e!798223)))

(declare-fun res!947835 () Bool)

(assert (=> b!1410529 (= res!947835 (and (is-Intermediate!10855 lt!621206) (not (undefined!11667 lt!621206)) (bvslt (x!127396 lt!621206) #b01111111111111111111111111111110) (bvsge (x!127396 lt!621206) #b00000000000000000000000000000000) (bvsge (x!127396 lt!621206) #b00000000000000000000000000000000)))))

(assert (=> b!1410529 (=> (not res!947835) (not e!798223))))

(assert (= (and d!151909 c!130814) b!1410528))

(assert (= (and d!151909 (not c!130814)) b!1410527))

(assert (= (and b!1410527 c!130815) b!1410524))

(assert (= (and b!1410527 (not c!130815)) b!1410522))

(assert (= (and d!151909 c!130816) b!1410525))

(assert (= (and d!151909 (not c!130816)) b!1410529))

(assert (= (and b!1410529 res!947835) b!1410523))

(assert (= (and b!1410523 (not res!947836)) b!1410526))

(assert (= (and b!1410526 (not res!947834)) b!1410521))

(declare-fun m!1300179 () Bool)

(assert (=> b!1410522 m!1300179))

(assert (=> b!1410522 m!1300179))

(assert (=> b!1410522 m!1300011))

(declare-fun m!1300181 () Bool)

(assert (=> b!1410522 m!1300181))

(declare-fun m!1300183 () Bool)

(assert (=> b!1410523 m!1300183))

(declare-fun m!1300185 () Bool)

(assert (=> d!151909 m!1300185))

(assert (=> d!151909 m!1300007))

(assert (=> b!1410526 m!1300183))

(assert (=> b!1410521 m!1300183))

(assert (=> b!1410338 d!151909))

(declare-fun d!151925 () Bool)

(declare-fun lt!621217 () (_ BitVec 32))

(declare-fun lt!621216 () (_ BitVec 32))

(assert (=> d!151925 (= lt!621217 (bvmul (bvxor lt!621216 (bvlshr lt!621216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151925 (= lt!621216 ((_ extract 31 0) (bvand (bvxor (select (arr!46544 a!2901) j!112) (bvlshr (select (arr!46544 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151925 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947837 (let ((h!34332 ((_ extract 31 0) (bvand (bvxor (select (arr!46544 a!2901) j!112) (bvlshr (select (arr!46544 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127402 (bvmul (bvxor h!34332 (bvlshr h!34332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127402 (bvlshr x!127402 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947837 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947837 #b00000000000000000000000000000000))))))

(assert (=> d!151925 (= (toIndex!0 (select (arr!46544 a!2901) j!112) mask!2840) (bvand (bvxor lt!621217 (bvlshr lt!621217 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410338 d!151925))

(declare-fun d!151927 () Bool)

(assert (=> d!151927 (= (validKeyInArray!0 (select (arr!46544 a!2901) j!112)) (and (not (= (select (arr!46544 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46544 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410333 d!151927))

(declare-fun e!798271 () SeekEntryResult!10855)

(declare-fun b!1410606 () Bool)

(declare-fun lt!621246 () SeekEntryResult!10855)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96408 (_ BitVec 32)) SeekEntryResult!10855)

(assert (=> b!1410606 (= e!798271 (seekKeyOrZeroReturnVacant!0 (x!127396 lt!621246) (index!45799 lt!621246) (index!45799 lt!621246) (select (arr!46544 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!151929 () Bool)

(declare-fun lt!621248 () SeekEntryResult!10855)

(assert (=> d!151929 (and (or (is-Undefined!10855 lt!621248) (not (is-Found!10855 lt!621248)) (and (bvsge (index!45798 lt!621248) #b00000000000000000000000000000000) (bvslt (index!45798 lt!621248) (size!47094 a!2901)))) (or (is-Undefined!10855 lt!621248) (is-Found!10855 lt!621248) (not (is-MissingZero!10855 lt!621248)) (and (bvsge (index!45797 lt!621248) #b00000000000000000000000000000000) (bvslt (index!45797 lt!621248) (size!47094 a!2901)))) (or (is-Undefined!10855 lt!621248) (is-Found!10855 lt!621248) (is-MissingZero!10855 lt!621248) (not (is-MissingVacant!10855 lt!621248)) (and (bvsge (index!45800 lt!621248) #b00000000000000000000000000000000) (bvslt (index!45800 lt!621248) (size!47094 a!2901)))) (or (is-Undefined!10855 lt!621248) (ite (is-Found!10855 lt!621248) (= (select (arr!46544 a!2901) (index!45798 lt!621248)) (select (arr!46544 a!2901) j!112)) (ite (is-MissingZero!10855 lt!621248) (= (select (arr!46544 a!2901) (index!45797 lt!621248)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10855 lt!621248) (= (select (arr!46544 a!2901) (index!45800 lt!621248)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!798273 () SeekEntryResult!10855)

(assert (=> d!151929 (= lt!621248 e!798273)))

(declare-fun c!130844 () Bool)

(assert (=> d!151929 (= c!130844 (and (is-Intermediate!10855 lt!621246) (undefined!11667 lt!621246)))))

(assert (=> d!151929 (= lt!621246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46544 a!2901) j!112) mask!2840) (select (arr!46544 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151929 (validMask!0 mask!2840)))

(assert (=> d!151929 (= (seekEntryOrOpen!0 (select (arr!46544 a!2901) j!112) a!2901 mask!2840) lt!621248)))

(declare-fun b!1410607 () Bool)

(declare-fun e!798272 () SeekEntryResult!10855)

(assert (=> b!1410607 (= e!798272 (Found!10855 (index!45799 lt!621246)))))

(declare-fun b!1410608 () Bool)

(assert (=> b!1410608 (= e!798273 Undefined!10855)))

(declare-fun b!1410609 () Bool)

(declare-fun c!130843 () Bool)

(declare-fun lt!621247 () (_ BitVec 64))

(assert (=> b!1410609 (= c!130843 (= lt!621247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410609 (= e!798272 e!798271)))

(declare-fun b!1410610 () Bool)

(assert (=> b!1410610 (= e!798271 (MissingZero!10855 (index!45799 lt!621246)))))

(declare-fun b!1410611 () Bool)

(assert (=> b!1410611 (= e!798273 e!798272)))

(assert (=> b!1410611 (= lt!621247 (select (arr!46544 a!2901) (index!45799 lt!621246)))))

(declare-fun c!130842 () Bool)

(assert (=> b!1410611 (= c!130842 (= lt!621247 (select (arr!46544 a!2901) j!112)))))

(assert (= (and d!151929 c!130844) b!1410608))

(assert (= (and d!151929 (not c!130844)) b!1410611))

(assert (= (and b!1410611 c!130842) b!1410607))

(assert (= (and b!1410611 (not c!130842)) b!1410609))

(assert (= (and b!1410609 c!130843) b!1410610))

(assert (= (and b!1410609 (not c!130843)) b!1410606))

(assert (=> b!1410606 m!1300011))

(declare-fun m!1300223 () Bool)

(assert (=> b!1410606 m!1300223))

(declare-fun m!1300225 () Bool)

(assert (=> d!151929 m!1300225))

(assert (=> d!151929 m!1300011))

(assert (=> d!151929 m!1300015))

(assert (=> d!151929 m!1300007))

(declare-fun m!1300227 () Bool)

(assert (=> d!151929 m!1300227))

(declare-fun m!1300229 () Bool)

(assert (=> d!151929 m!1300229))

(assert (=> d!151929 m!1300015))

(assert (=> d!151929 m!1300011))

(declare-fun m!1300231 () Bool)

(assert (=> d!151929 m!1300231))

(declare-fun m!1300233 () Bool)

(assert (=> b!1410611 m!1300233))

(assert (=> b!1410339 d!151929))

(declare-fun b!1410612 () Bool)

(declare-fun lt!621249 () SeekEntryResult!10855)

(assert (=> b!1410612 (and (bvsge (index!45799 lt!621249) #b00000000000000000000000000000000) (bvslt (index!45799 lt!621249) (size!47094 (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901)))))))

(declare-fun e!798276 () Bool)

(assert (=> b!1410612 (= e!798276 (= (select (arr!46544 (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901))) (index!45799 lt!621249)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410613 () Bool)

(declare-fun e!798274 () SeekEntryResult!10855)

(assert (=> b!1410613 (= e!798274 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901)) mask!2840))))

(declare-fun b!1410614 () Bool)

(assert (=> b!1410614 (and (bvsge (index!45799 lt!621249) #b00000000000000000000000000000000) (bvslt (index!45799 lt!621249) (size!47094 (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901)))))))

(declare-fun res!947867 () Bool)

(assert (=> b!1410614 (= res!947867 (= (select (arr!46544 (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901))) (index!45799 lt!621249)) (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1410614 (=> res!947867 e!798276)))

(declare-fun e!798277 () Bool)

(assert (=> b!1410614 (= e!798277 e!798276)))

(declare-fun b!1410615 () Bool)

(assert (=> b!1410615 (= e!798274 (Intermediate!10855 false (toIndex!0 (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151953 () Bool)

(declare-fun e!798275 () Bool)

(assert (=> d!151953 e!798275))

(declare-fun c!130847 () Bool)

(assert (=> d!151953 (= c!130847 (and (is-Intermediate!10855 lt!621249) (undefined!11667 lt!621249)))))

(declare-fun e!798278 () SeekEntryResult!10855)

(assert (=> d!151953 (= lt!621249 e!798278)))

(declare-fun c!130845 () Bool)

(assert (=> d!151953 (= c!130845 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621250 () (_ BitVec 64))

(assert (=> d!151953 (= lt!621250 (select (arr!46544 (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901))) (toIndex!0 (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151953 (validMask!0 mask!2840)))

(assert (=> d!151953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901)) mask!2840) lt!621249)))

(declare-fun b!1410616 () Bool)

(assert (=> b!1410616 (= e!798275 (bvsge (x!127396 lt!621249) #b01111111111111111111111111111110))))

(declare-fun b!1410617 () Bool)

(assert (=> b!1410617 (and (bvsge (index!45799 lt!621249) #b00000000000000000000000000000000) (bvslt (index!45799 lt!621249) (size!47094 (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901)))))))

(declare-fun res!947865 () Bool)

(assert (=> b!1410617 (= res!947865 (= (select (arr!46544 (array!96409 (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47094 a!2901))) (index!45799 lt!621249)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410617 (=> res!947865 e!798276)))

(declare-fun b!1410618 () Bool)

(assert (=> b!1410618 (= e!798278 e!798274)))

(declare-fun c!130846 () Bool)

(assert (=> b!1410618 (= c!130846 (or (= lt!621250 (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621250 lt!621250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410619 () Bool)

(assert (=> b!1410619 (= e!798278 (Intermediate!10855 true (toIndex!0 (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410620 () Bool)

(assert (=> b!1410620 (= e!798275 e!798277)))

(declare-fun res!947866 () Bool)

(assert (=> b!1410620 (= res!947866 (and (is-Intermediate!10855 lt!621249) (not (undefined!11667 lt!621249)) (bvslt (x!127396 lt!621249) #b01111111111111111111111111111110) (bvsge (x!127396 lt!621249) #b00000000000000000000000000000000) (bvsge (x!127396 lt!621249) #b00000000000000000000000000000000)))))

(assert (=> b!1410620 (=> (not res!947866) (not e!798277))))

(assert (= (and d!151953 c!130845) b!1410619))

(assert (= (and d!151953 (not c!130845)) b!1410618))

(assert (= (and b!1410618 c!130846) b!1410615))

(assert (= (and b!1410618 (not c!130846)) b!1410613))

(assert (= (and d!151953 c!130847) b!1410616))

(assert (= (and d!151953 (not c!130847)) b!1410620))

(assert (= (and b!1410620 res!947866) b!1410614))

(assert (= (and b!1410614 (not res!947867)) b!1410617))

(assert (= (and b!1410617 (not res!947865)) b!1410612))

(assert (=> b!1410613 m!1300025))

(declare-fun m!1300235 () Bool)

(assert (=> b!1410613 m!1300235))

(assert (=> b!1410613 m!1300235))

(assert (=> b!1410613 m!1300023))

(declare-fun m!1300237 () Bool)

(assert (=> b!1410613 m!1300237))

(declare-fun m!1300239 () Bool)

(assert (=> b!1410614 m!1300239))

(assert (=> d!151953 m!1300025))

(declare-fun m!1300241 () Bool)

(assert (=> d!151953 m!1300241))

(assert (=> d!151953 m!1300007))

(assert (=> b!1410617 m!1300239))

(assert (=> b!1410612 m!1300239))

(assert (=> b!1410334 d!151953))

(declare-fun d!151955 () Bool)

(declare-fun lt!621252 () (_ BitVec 32))

(declare-fun lt!621251 () (_ BitVec 32))

(assert (=> d!151955 (= lt!621252 (bvmul (bvxor lt!621251 (bvlshr lt!621251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151955 (= lt!621251 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151955 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947837 (let ((h!34332 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127402 (bvmul (bvxor h!34332 (bvlshr h!34332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127402 (bvlshr x!127402 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947837 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947837 #b00000000000000000000000000000000))))))

(assert (=> d!151955 (= (toIndex!0 (select (store (arr!46544 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621252 (bvlshr lt!621252 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410334 d!151955))

(declare-fun d!151957 () Bool)

(declare-fun res!947868 () Bool)

(declare-fun e!798279 () Bool)

(assert (=> d!151957 (=> res!947868 e!798279)))

(assert (=> d!151957 (= res!947868 (bvsge #b00000000000000000000000000000000 (size!47094 a!2901)))))

(assert (=> d!151957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798279)))

(declare-fun bm!67072 () Bool)

(declare-fun call!67075 () Bool)

(assert (=> bm!67072 (= call!67075 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1410621 () Bool)

(declare-fun e!798280 () Bool)

(assert (=> b!1410621 (= e!798279 e!798280)))

(declare-fun c!130848 () Bool)

(assert (=> b!1410621 (= c!130848 (validKeyInArray!0 (select (arr!46544 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410622 () Bool)

(declare-fun e!798281 () Bool)

(assert (=> b!1410622 (= e!798280 e!798281)))

(declare-fun lt!621254 () (_ BitVec 64))

(assert (=> b!1410622 (= lt!621254 (select (arr!46544 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621255 () Unit!47684)

(assert (=> b!1410622 (= lt!621255 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621254 #b00000000000000000000000000000000))))

(assert (=> b!1410622 (arrayContainsKey!0 a!2901 lt!621254 #b00000000000000000000000000000000)))

(declare-fun lt!621253 () Unit!47684)

(assert (=> b!1410622 (= lt!621253 lt!621255)))

(declare-fun res!947869 () Bool)

(assert (=> b!1410622 (= res!947869 (= (seekEntryOrOpen!0 (select (arr!46544 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10855 #b00000000000000000000000000000000)))))

(assert (=> b!1410622 (=> (not res!947869) (not e!798281))))

(declare-fun b!1410623 () Bool)

(assert (=> b!1410623 (= e!798280 call!67075)))

(declare-fun b!1410624 () Bool)

(assert (=> b!1410624 (= e!798281 call!67075)))

(assert (= (and d!151957 (not res!947868)) b!1410621))

(assert (= (and b!1410621 c!130848) b!1410622))

(assert (= (and b!1410621 (not c!130848)) b!1410623))

(assert (= (and b!1410622 res!947869) b!1410624))

(assert (= (or b!1410624 b!1410623) bm!67072))

(declare-fun m!1300243 () Bool)

(assert (=> bm!67072 m!1300243))

(assert (=> b!1410621 m!1300127))

(assert (=> b!1410621 m!1300127))

(assert (=> b!1410621 m!1300129))

(assert (=> b!1410622 m!1300127))

(declare-fun m!1300245 () Bool)

(assert (=> b!1410622 m!1300245))

(declare-fun m!1300247 () Bool)

(assert (=> b!1410622 m!1300247))

(assert (=> b!1410622 m!1300127))

(declare-fun m!1300249 () Bool)

(assert (=> b!1410622 m!1300249))

(assert (=> b!1410336 d!151957))

(declare-fun d!151959 () Bool)

(assert (=> d!151959 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121356 d!151959))

(declare-fun d!151963 () Bool)

(assert (=> d!151963 (= (array_inv!35572 a!2901) (bvsge (size!47094 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121356 d!151963))

(push 1)

(assert (not b!1410456))

(assert (not bm!67063))

(assert (not d!151907))

(assert (not bm!67057))

(assert (not d!151929))

(assert (not b!1410606))

(assert (not b!1410431))

(assert (not b!1410613))

(assert (not d!151909))

(assert (not b!1410433))

(assert (not bm!67072))

(assert (not d!151953))

(assert (not b!1410435))

(assert (not b!1410522))

(assert (not b!1410621))

(assert (not b!1410622))

(assert (not b!1410457))

(check-sat)

