; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121502 () Bool)

(assert start!121502)

(declare-fun res!949081 () Bool)

(declare-fun e!798932 () Bool)

(assert (=> start!121502 (=> (not res!949081) (not e!798932))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121502 (= res!949081 (validMask!0 mask!2840))))

(assert (=> start!121502 e!798932))

(assert (=> start!121502 true))

(declare-datatypes ((array!96456 0))(
  ( (array!96457 (arr!46567 (Array (_ BitVec 32) (_ BitVec 64))) (size!47119 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96456)

(declare-fun array_inv!35800 (array!96456) Bool)

(assert (=> start!121502 (array_inv!35800 a!2901)))

(declare-fun b!1411795 () Bool)

(declare-fun res!949076 () Bool)

(assert (=> b!1411795 (=> (not res!949076) (not e!798932))))

(declare-datatypes ((List!33164 0))(
  ( (Nil!33161) (Cons!33160 (h!34432 (_ BitVec 64)) (t!47850 List!33164)) )
))
(declare-fun arrayNoDuplicates!0 (array!96456 (_ BitVec 32) List!33164) Bool)

(assert (=> b!1411795 (= res!949076 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33161))))

(declare-fun b!1411796 () Bool)

(declare-fun res!949078 () Bool)

(assert (=> b!1411796 (=> (not res!949078) (not e!798932))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411796 (= res!949078 (validKeyInArray!0 (select (arr!46567 a!2901) i!1037)))))

(declare-fun b!1411797 () Bool)

(declare-fun e!798931 () Bool)

(assert (=> b!1411797 (= e!798932 (not e!798931))))

(declare-fun res!949077 () Bool)

(assert (=> b!1411797 (=> res!949077 e!798931)))

(declare-datatypes ((SeekEntryResult!10904 0))(
  ( (MissingZero!10904 (index!45993 (_ BitVec 32))) (Found!10904 (index!45994 (_ BitVec 32))) (Intermediate!10904 (undefined!11716 Bool) (index!45995 (_ BitVec 32)) (x!127576 (_ BitVec 32))) (Undefined!10904) (MissingVacant!10904 (index!45996 (_ BitVec 32))) )
))
(declare-fun lt!621822 () SeekEntryResult!10904)

(get-info :version)

(assert (=> b!1411797 (= res!949077 (or (not ((_ is Intermediate!10904) lt!621822)) (undefined!11716 lt!621822)))))

(declare-fun e!798930 () Bool)

(assert (=> b!1411797 e!798930))

(declare-fun res!949080 () Bool)

(assert (=> b!1411797 (=> (not res!949080) (not e!798930))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96456 (_ BitVec 32)) Bool)

(assert (=> b!1411797 (= res!949080 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47625 0))(
  ( (Unit!47626) )
))
(declare-fun lt!621818 () Unit!47625)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47625)

(assert (=> b!1411797 (= lt!621818 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621824 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96456 (_ BitVec 32)) SeekEntryResult!10904)

(assert (=> b!1411797 (= lt!621822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621824 (select (arr!46567 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411797 (= lt!621824 (toIndex!0 (select (arr!46567 a!2901) j!112) mask!2840))))

(declare-fun b!1411798 () Bool)

(declare-fun e!798928 () Bool)

(assert (=> b!1411798 (= e!798931 e!798928)))

(declare-fun res!949079 () Bool)

(assert (=> b!1411798 (=> res!949079 e!798928)))

(declare-fun lt!621823 () SeekEntryResult!10904)

(assert (=> b!1411798 (= res!949079 (or (= lt!621822 lt!621823) (not ((_ is Intermediate!10904) lt!621823))))))

(declare-fun lt!621819 () array!96456)

(declare-fun lt!621820 () (_ BitVec 64))

(assert (=> b!1411798 (= lt!621823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621820 mask!2840) lt!621820 lt!621819 mask!2840))))

(assert (=> b!1411798 (= lt!621820 (select (store (arr!46567 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1411798 (= lt!621819 (array!96457 (store (arr!46567 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47119 a!2901)))))

(declare-fun b!1411799 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96456 (_ BitVec 32)) SeekEntryResult!10904)

(assert (=> b!1411799 (= e!798930 (= (seekEntryOrOpen!0 (select (arr!46567 a!2901) j!112) a!2901 mask!2840) (Found!10904 j!112)))))

(declare-fun b!1411800 () Bool)

(declare-fun res!949073 () Bool)

(assert (=> b!1411800 (=> (not res!949073) (not e!798932))))

(assert (=> b!1411800 (= res!949073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411801 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96456 (_ BitVec 32)) SeekEntryResult!10904)

(assert (=> b!1411801 (= e!798928 (= (seekEntryOrOpen!0 lt!621820 lt!621819 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127576 lt!621823) (index!45995 lt!621823) (index!45995 lt!621823) (select (arr!46567 a!2901) j!112) lt!621819 mask!2840)))))

(assert (=> b!1411801 (and (not (undefined!11716 lt!621823)) (= (index!45995 lt!621823) i!1037) (bvslt (x!127576 lt!621823) (x!127576 lt!621822)) (= (select (store (arr!46567 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45995 lt!621823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621821 () Unit!47625)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47625)

(assert (=> b!1411801 (= lt!621821 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621824 (x!127576 lt!621822) (index!45995 lt!621822) (x!127576 lt!621823) (index!45995 lt!621823) (undefined!11716 lt!621823) mask!2840))))

(declare-fun b!1411802 () Bool)

(declare-fun res!949074 () Bool)

(assert (=> b!1411802 (=> (not res!949074) (not e!798932))))

(assert (=> b!1411802 (= res!949074 (validKeyInArray!0 (select (arr!46567 a!2901) j!112)))))

(declare-fun b!1411803 () Bool)

(declare-fun res!949075 () Bool)

(assert (=> b!1411803 (=> (not res!949075) (not e!798932))))

(assert (=> b!1411803 (= res!949075 (and (= (size!47119 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47119 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47119 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121502 res!949081) b!1411803))

(assert (= (and b!1411803 res!949075) b!1411796))

(assert (= (and b!1411796 res!949078) b!1411802))

(assert (= (and b!1411802 res!949074) b!1411800))

(assert (= (and b!1411800 res!949073) b!1411795))

(assert (= (and b!1411795 res!949076) b!1411797))

(assert (= (and b!1411797 res!949080) b!1411799))

(assert (= (and b!1411797 (not res!949077)) b!1411798))

(assert (= (and b!1411798 (not res!949079)) b!1411801))

(declare-fun m!1301365 () Bool)

(assert (=> b!1411795 m!1301365))

(declare-fun m!1301367 () Bool)

(assert (=> b!1411798 m!1301367))

(assert (=> b!1411798 m!1301367))

(declare-fun m!1301369 () Bool)

(assert (=> b!1411798 m!1301369))

(declare-fun m!1301371 () Bool)

(assert (=> b!1411798 m!1301371))

(declare-fun m!1301373 () Bool)

(assert (=> b!1411798 m!1301373))

(declare-fun m!1301375 () Bool)

(assert (=> b!1411797 m!1301375))

(declare-fun m!1301377 () Bool)

(assert (=> b!1411797 m!1301377))

(assert (=> b!1411797 m!1301375))

(declare-fun m!1301379 () Bool)

(assert (=> b!1411797 m!1301379))

(declare-fun m!1301381 () Bool)

(assert (=> b!1411797 m!1301381))

(assert (=> b!1411797 m!1301375))

(declare-fun m!1301383 () Bool)

(assert (=> b!1411797 m!1301383))

(assert (=> b!1411799 m!1301375))

(assert (=> b!1411799 m!1301375))

(declare-fun m!1301385 () Bool)

(assert (=> b!1411799 m!1301385))

(assert (=> b!1411802 m!1301375))

(assert (=> b!1411802 m!1301375))

(declare-fun m!1301387 () Bool)

(assert (=> b!1411802 m!1301387))

(declare-fun m!1301389 () Bool)

(assert (=> b!1411800 m!1301389))

(declare-fun m!1301391 () Bool)

(assert (=> start!121502 m!1301391))

(declare-fun m!1301393 () Bool)

(assert (=> start!121502 m!1301393))

(assert (=> b!1411801 m!1301375))

(declare-fun m!1301395 () Bool)

(assert (=> b!1411801 m!1301395))

(assert (=> b!1411801 m!1301375))

(declare-fun m!1301397 () Bool)

(assert (=> b!1411801 m!1301397))

(declare-fun m!1301399 () Bool)

(assert (=> b!1411801 m!1301399))

(assert (=> b!1411801 m!1301371))

(declare-fun m!1301401 () Bool)

(assert (=> b!1411801 m!1301401))

(declare-fun m!1301403 () Bool)

(assert (=> b!1411796 m!1301403))

(assert (=> b!1411796 m!1301403))

(declare-fun m!1301405 () Bool)

(assert (=> b!1411796 m!1301405))

(check-sat (not b!1411800) (not b!1411802) (not b!1411801) (not b!1411797) (not b!1411796) (not b!1411795) (not b!1411799) (not b!1411798) (not start!121502))
(check-sat)
(get-model)

(declare-fun bm!67055 () Bool)

(declare-fun call!67058 () Bool)

(assert (=> bm!67055 (= call!67058 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1411866 () Bool)

(declare-fun e!798970 () Bool)

(declare-fun e!798971 () Bool)

(assert (=> b!1411866 (= e!798970 e!798971)))

(declare-fun c!130837 () Bool)

(assert (=> b!1411866 (= c!130837 (validKeyInArray!0 (select (arr!46567 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411867 () Bool)

(declare-fun e!798969 () Bool)

(assert (=> b!1411867 (= e!798971 e!798969)))

(declare-fun lt!621873 () (_ BitVec 64))

(assert (=> b!1411867 (= lt!621873 (select (arr!46567 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621875 () Unit!47625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96456 (_ BitVec 64) (_ BitVec 32)) Unit!47625)

(assert (=> b!1411867 (= lt!621875 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621873 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1411867 (arrayContainsKey!0 a!2901 lt!621873 #b00000000000000000000000000000000)))

(declare-fun lt!621874 () Unit!47625)

(assert (=> b!1411867 (= lt!621874 lt!621875)))

(declare-fun res!949141 () Bool)

(assert (=> b!1411867 (= res!949141 (= (seekEntryOrOpen!0 (select (arr!46567 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10904 #b00000000000000000000000000000000)))))

(assert (=> b!1411867 (=> (not res!949141) (not e!798969))))

(declare-fun b!1411868 () Bool)

(assert (=> b!1411868 (= e!798969 call!67058)))

(declare-fun d!151871 () Bool)

(declare-fun res!949140 () Bool)

(assert (=> d!151871 (=> res!949140 e!798970)))

(assert (=> d!151871 (= res!949140 (bvsge #b00000000000000000000000000000000 (size!47119 a!2901)))))

(assert (=> d!151871 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798970)))

(declare-fun b!1411869 () Bool)

(assert (=> b!1411869 (= e!798971 call!67058)))

(assert (= (and d!151871 (not res!949140)) b!1411866))

(assert (= (and b!1411866 c!130837) b!1411867))

(assert (= (and b!1411866 (not c!130837)) b!1411869))

(assert (= (and b!1411867 res!949141) b!1411868))

(assert (= (or b!1411868 b!1411869) bm!67055))

(declare-fun m!1301491 () Bool)

(assert (=> bm!67055 m!1301491))

(declare-fun m!1301493 () Bool)

(assert (=> b!1411866 m!1301493))

(assert (=> b!1411866 m!1301493))

(declare-fun m!1301495 () Bool)

(assert (=> b!1411866 m!1301495))

(assert (=> b!1411867 m!1301493))

(declare-fun m!1301497 () Bool)

(assert (=> b!1411867 m!1301497))

(declare-fun m!1301499 () Bool)

(assert (=> b!1411867 m!1301499))

(assert (=> b!1411867 m!1301493))

(declare-fun m!1301501 () Bool)

(assert (=> b!1411867 m!1301501))

(assert (=> b!1411800 d!151871))

(declare-fun b!1411886 () Bool)

(declare-fun e!798980 () SeekEntryResult!10904)

(assert (=> b!1411886 (= e!798980 Undefined!10904)))

(declare-fun b!1411887 () Bool)

(declare-fun e!798981 () SeekEntryResult!10904)

(assert (=> b!1411887 (= e!798980 e!798981)))

(declare-fun lt!621882 () (_ BitVec 64))

(declare-fun lt!621883 () SeekEntryResult!10904)

(assert (=> b!1411887 (= lt!621882 (select (arr!46567 a!2901) (index!45995 lt!621883)))))

(declare-fun c!130846 () Bool)

(assert (=> b!1411887 (= c!130846 (= lt!621882 (select (arr!46567 a!2901) j!112)))))

(declare-fun d!151873 () Bool)

(declare-fun lt!621884 () SeekEntryResult!10904)

(assert (=> d!151873 (and (or ((_ is Undefined!10904) lt!621884) (not ((_ is Found!10904) lt!621884)) (and (bvsge (index!45994 lt!621884) #b00000000000000000000000000000000) (bvslt (index!45994 lt!621884) (size!47119 a!2901)))) (or ((_ is Undefined!10904) lt!621884) ((_ is Found!10904) lt!621884) (not ((_ is MissingZero!10904) lt!621884)) (and (bvsge (index!45993 lt!621884) #b00000000000000000000000000000000) (bvslt (index!45993 lt!621884) (size!47119 a!2901)))) (or ((_ is Undefined!10904) lt!621884) ((_ is Found!10904) lt!621884) ((_ is MissingZero!10904) lt!621884) (not ((_ is MissingVacant!10904) lt!621884)) (and (bvsge (index!45996 lt!621884) #b00000000000000000000000000000000) (bvslt (index!45996 lt!621884) (size!47119 a!2901)))) (or ((_ is Undefined!10904) lt!621884) (ite ((_ is Found!10904) lt!621884) (= (select (arr!46567 a!2901) (index!45994 lt!621884)) (select (arr!46567 a!2901) j!112)) (ite ((_ is MissingZero!10904) lt!621884) (= (select (arr!46567 a!2901) (index!45993 lt!621884)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10904) lt!621884) (= (select (arr!46567 a!2901) (index!45996 lt!621884)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151873 (= lt!621884 e!798980)))

(declare-fun c!130845 () Bool)

(assert (=> d!151873 (= c!130845 (and ((_ is Intermediate!10904) lt!621883) (undefined!11716 lt!621883)))))

(assert (=> d!151873 (= lt!621883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46567 a!2901) j!112) mask!2840) (select (arr!46567 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151873 (validMask!0 mask!2840)))

(assert (=> d!151873 (= (seekEntryOrOpen!0 (select (arr!46567 a!2901) j!112) a!2901 mask!2840) lt!621884)))

(declare-fun b!1411888 () Bool)

(declare-fun c!130844 () Bool)

(assert (=> b!1411888 (= c!130844 (= lt!621882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798982 () SeekEntryResult!10904)

(assert (=> b!1411888 (= e!798981 e!798982)))

(declare-fun b!1411889 () Bool)

(assert (=> b!1411889 (= e!798982 (seekKeyOrZeroReturnVacant!0 (x!127576 lt!621883) (index!45995 lt!621883) (index!45995 lt!621883) (select (arr!46567 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1411890 () Bool)

(assert (=> b!1411890 (= e!798981 (Found!10904 (index!45995 lt!621883)))))

(declare-fun b!1411891 () Bool)

(assert (=> b!1411891 (= e!798982 (MissingZero!10904 (index!45995 lt!621883)))))

(assert (= (and d!151873 c!130845) b!1411886))

(assert (= (and d!151873 (not c!130845)) b!1411887))

(assert (= (and b!1411887 c!130846) b!1411890))

(assert (= (and b!1411887 (not c!130846)) b!1411888))

(assert (= (and b!1411888 c!130844) b!1411891))

(assert (= (and b!1411888 (not c!130844)) b!1411889))

(declare-fun m!1301503 () Bool)

(assert (=> b!1411887 m!1301503))

(declare-fun m!1301505 () Bool)

(assert (=> d!151873 m!1301505))

(assert (=> d!151873 m!1301391))

(declare-fun m!1301507 () Bool)

(assert (=> d!151873 m!1301507))

(declare-fun m!1301509 () Bool)

(assert (=> d!151873 m!1301509))

(assert (=> d!151873 m!1301377))

(assert (=> d!151873 m!1301375))

(declare-fun m!1301511 () Bool)

(assert (=> d!151873 m!1301511))

(assert (=> d!151873 m!1301375))

(assert (=> d!151873 m!1301377))

(assert (=> b!1411889 m!1301375))

(declare-fun m!1301513 () Bool)

(assert (=> b!1411889 m!1301513))

(assert (=> b!1411799 d!151873))

(declare-fun d!151883 () Bool)

(assert (=> d!151883 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121502 d!151883))

(declare-fun d!151891 () Bool)

(assert (=> d!151891 (= (array_inv!35800 a!2901) (bvsge (size!47119 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121502 d!151891))

(declare-fun b!1411975 () Bool)

(declare-fun e!799035 () SeekEntryResult!10904)

(declare-fun e!799033 () SeekEntryResult!10904)

(assert (=> b!1411975 (= e!799035 e!799033)))

(declare-fun c!130877 () Bool)

(declare-fun lt!621928 () (_ BitVec 64))

(assert (=> b!1411975 (= c!130877 (or (= lt!621928 lt!621820) (= (bvadd lt!621928 lt!621928) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!151893 () Bool)

(declare-fun e!799037 () Bool)

(assert (=> d!151893 e!799037))

(declare-fun c!130878 () Bool)

(declare-fun lt!621929 () SeekEntryResult!10904)

(assert (=> d!151893 (= c!130878 (and ((_ is Intermediate!10904) lt!621929) (undefined!11716 lt!621929)))))

(assert (=> d!151893 (= lt!621929 e!799035)))

(declare-fun c!130879 () Bool)

(assert (=> d!151893 (= c!130879 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151893 (= lt!621928 (select (arr!46567 lt!621819) (toIndex!0 lt!621820 mask!2840)))))

(assert (=> d!151893 (validMask!0 mask!2840)))

(assert (=> d!151893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621820 mask!2840) lt!621820 lt!621819 mask!2840) lt!621929)))

(declare-fun b!1411976 () Bool)

(assert (=> b!1411976 (= e!799033 (Intermediate!10904 false (toIndex!0 lt!621820 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411977 () Bool)

(assert (=> b!1411977 (= e!799037 (bvsge (x!127576 lt!621929) #b01111111111111111111111111111110))))

(declare-fun b!1411978 () Bool)

(assert (=> b!1411978 (= e!799035 (Intermediate!10904 true (toIndex!0 lt!621820 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411979 () Bool)

(declare-fun e!799036 () Bool)

(assert (=> b!1411979 (= e!799037 e!799036)))

(declare-fun res!949170 () Bool)

(assert (=> b!1411979 (= res!949170 (and ((_ is Intermediate!10904) lt!621929) (not (undefined!11716 lt!621929)) (bvslt (x!127576 lt!621929) #b01111111111111111111111111111110) (bvsge (x!127576 lt!621929) #b00000000000000000000000000000000) (bvsge (x!127576 lt!621929) #b00000000000000000000000000000000)))))

(assert (=> b!1411979 (=> (not res!949170) (not e!799036))))

(declare-fun b!1411980 () Bool)

(assert (=> b!1411980 (and (bvsge (index!45995 lt!621929) #b00000000000000000000000000000000) (bvslt (index!45995 lt!621929) (size!47119 lt!621819)))))

(declare-fun e!799034 () Bool)

(assert (=> b!1411980 (= e!799034 (= (select (arr!46567 lt!621819) (index!45995 lt!621929)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1411981 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411981 (= e!799033 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!621820 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!621820 lt!621819 mask!2840))))

(declare-fun b!1411982 () Bool)

(assert (=> b!1411982 (and (bvsge (index!45995 lt!621929) #b00000000000000000000000000000000) (bvslt (index!45995 lt!621929) (size!47119 lt!621819)))))

(declare-fun res!949172 () Bool)

(assert (=> b!1411982 (= res!949172 (= (select (arr!46567 lt!621819) (index!45995 lt!621929)) lt!621820))))

(assert (=> b!1411982 (=> res!949172 e!799034)))

(assert (=> b!1411982 (= e!799036 e!799034)))

(declare-fun b!1411983 () Bool)

(assert (=> b!1411983 (and (bvsge (index!45995 lt!621929) #b00000000000000000000000000000000) (bvslt (index!45995 lt!621929) (size!47119 lt!621819)))))

(declare-fun res!949171 () Bool)

(assert (=> b!1411983 (= res!949171 (= (select (arr!46567 lt!621819) (index!45995 lt!621929)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1411983 (=> res!949171 e!799034)))

(assert (= (and d!151893 c!130879) b!1411978))

(assert (= (and d!151893 (not c!130879)) b!1411975))

(assert (= (and b!1411975 c!130877) b!1411976))

(assert (= (and b!1411975 (not c!130877)) b!1411981))

(assert (= (and d!151893 c!130878) b!1411977))

(assert (= (and d!151893 (not c!130878)) b!1411979))

(assert (= (and b!1411979 res!949170) b!1411982))

(assert (= (and b!1411982 (not res!949172)) b!1411983))

(assert (= (and b!1411983 (not res!949171)) b!1411980))

(declare-fun m!1301551 () Bool)

(assert (=> b!1411982 m!1301551))

(assert (=> b!1411980 m!1301551))

(assert (=> b!1411981 m!1301367))

(declare-fun m!1301553 () Bool)

(assert (=> b!1411981 m!1301553))

(assert (=> b!1411981 m!1301553))

(declare-fun m!1301555 () Bool)

(assert (=> b!1411981 m!1301555))

(assert (=> d!151893 m!1301367))

(declare-fun m!1301557 () Bool)

(assert (=> d!151893 m!1301557))

(assert (=> d!151893 m!1301391))

(assert (=> b!1411983 m!1301551))

(assert (=> b!1411798 d!151893))

(declare-fun d!151901 () Bool)

(declare-fun lt!621945 () (_ BitVec 32))

(declare-fun lt!621944 () (_ BitVec 32))

(assert (=> d!151901 (= lt!621945 (bvmul (bvxor lt!621944 (bvlshr lt!621944 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151901 (= lt!621944 ((_ extract 31 0) (bvand (bvxor lt!621820 (bvlshr lt!621820 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151901 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949173 (let ((h!34436 ((_ extract 31 0) (bvand (bvxor lt!621820 (bvlshr lt!621820 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127582 (bvmul (bvxor h!34436 (bvlshr h!34436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127582 (bvlshr x!127582 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949173 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949173 #b00000000000000000000000000000000))))))

(assert (=> d!151901 (= (toIndex!0 lt!621820 mask!2840) (bvand (bvxor lt!621945 (bvlshr lt!621945 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411798 d!151901))

(declare-fun call!67065 () Bool)

(declare-fun bm!67062 () Bool)

(assert (=> bm!67062 (= call!67065 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1412000 () Bool)

(declare-fun e!799049 () Bool)

(declare-fun e!799050 () Bool)

(assert (=> b!1412000 (= e!799049 e!799050)))

(declare-fun c!130886 () Bool)

(assert (=> b!1412000 (= c!130886 (validKeyInArray!0 (select (arr!46567 a!2901) j!112)))))

(declare-fun b!1412001 () Bool)

(declare-fun e!799048 () Bool)

(assert (=> b!1412001 (= e!799050 e!799048)))

(declare-fun lt!621946 () (_ BitVec 64))

(assert (=> b!1412001 (= lt!621946 (select (arr!46567 a!2901) j!112))))

(declare-fun lt!621948 () Unit!47625)

(assert (=> b!1412001 (= lt!621948 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621946 j!112))))

(assert (=> b!1412001 (arrayContainsKey!0 a!2901 lt!621946 #b00000000000000000000000000000000)))

(declare-fun lt!621947 () Unit!47625)

(assert (=> b!1412001 (= lt!621947 lt!621948)))

(declare-fun res!949181 () Bool)

(assert (=> b!1412001 (= res!949181 (= (seekEntryOrOpen!0 (select (arr!46567 a!2901) j!112) a!2901 mask!2840) (Found!10904 j!112)))))

(assert (=> b!1412001 (=> (not res!949181) (not e!799048))))

(declare-fun b!1412002 () Bool)

(assert (=> b!1412002 (= e!799048 call!67065)))

(declare-fun d!151905 () Bool)

(declare-fun res!949180 () Bool)

(assert (=> d!151905 (=> res!949180 e!799049)))

(assert (=> d!151905 (= res!949180 (bvsge j!112 (size!47119 a!2901)))))

(assert (=> d!151905 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!799049)))

(declare-fun b!1412003 () Bool)

(assert (=> b!1412003 (= e!799050 call!67065)))

(assert (= (and d!151905 (not res!949180)) b!1412000))

(assert (= (and b!1412000 c!130886) b!1412001))

(assert (= (and b!1412000 (not c!130886)) b!1412003))

(assert (= (and b!1412001 res!949181) b!1412002))

(assert (= (or b!1412002 b!1412003) bm!67062))

(declare-fun m!1301559 () Bool)

(assert (=> bm!67062 m!1301559))

(assert (=> b!1412000 m!1301375))

(assert (=> b!1412000 m!1301375))

(assert (=> b!1412000 m!1301387))

(assert (=> b!1412001 m!1301375))

(declare-fun m!1301561 () Bool)

(assert (=> b!1412001 m!1301561))

(declare-fun m!1301563 () Bool)

(assert (=> b!1412001 m!1301563))

(assert (=> b!1412001 m!1301375))

(assert (=> b!1412001 m!1301385))

(assert (=> b!1411797 d!151905))

(declare-fun d!151907 () Bool)

(assert (=> d!151907 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621953 () Unit!47625)

(declare-fun choose!38 (array!96456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47625)

(assert (=> d!151907 (= lt!621953 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151907 (validMask!0 mask!2840)))

(assert (=> d!151907 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621953)))

(declare-fun bs!41142 () Bool)

(assert (= bs!41142 d!151907))

(assert (=> bs!41142 m!1301381))

(declare-fun m!1301573 () Bool)

(assert (=> bs!41142 m!1301573))

(assert (=> bs!41142 m!1301391))

(assert (=> b!1411797 d!151907))

(declare-fun b!1412015 () Bool)

(declare-fun e!799058 () SeekEntryResult!10904)

(declare-fun e!799056 () SeekEntryResult!10904)

(assert (=> b!1412015 (= e!799058 e!799056)))

(declare-fun lt!621954 () (_ BitVec 64))

(declare-fun c!130890 () Bool)

(assert (=> b!1412015 (= c!130890 (or (= lt!621954 (select (arr!46567 a!2901) j!112)) (= (bvadd lt!621954 lt!621954) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!151911 () Bool)

(declare-fun e!799060 () Bool)

(assert (=> d!151911 e!799060))

(declare-fun c!130891 () Bool)

(declare-fun lt!621955 () SeekEntryResult!10904)

(assert (=> d!151911 (= c!130891 (and ((_ is Intermediate!10904) lt!621955) (undefined!11716 lt!621955)))))

(assert (=> d!151911 (= lt!621955 e!799058)))

(declare-fun c!130892 () Bool)

(assert (=> d!151911 (= c!130892 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151911 (= lt!621954 (select (arr!46567 a!2901) lt!621824))))

(assert (=> d!151911 (validMask!0 mask!2840)))

(assert (=> d!151911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621824 (select (arr!46567 a!2901) j!112) a!2901 mask!2840) lt!621955)))

(declare-fun b!1412016 () Bool)

(assert (=> b!1412016 (= e!799056 (Intermediate!10904 false lt!621824 #b00000000000000000000000000000000))))

(declare-fun b!1412017 () Bool)

(assert (=> b!1412017 (= e!799060 (bvsge (x!127576 lt!621955) #b01111111111111111111111111111110))))

(declare-fun b!1412018 () Bool)

(assert (=> b!1412018 (= e!799058 (Intermediate!10904 true lt!621824 #b00000000000000000000000000000000))))

(declare-fun b!1412019 () Bool)

(declare-fun e!799059 () Bool)

(assert (=> b!1412019 (= e!799060 e!799059)))

(declare-fun res!949186 () Bool)

(assert (=> b!1412019 (= res!949186 (and ((_ is Intermediate!10904) lt!621955) (not (undefined!11716 lt!621955)) (bvslt (x!127576 lt!621955) #b01111111111111111111111111111110) (bvsge (x!127576 lt!621955) #b00000000000000000000000000000000) (bvsge (x!127576 lt!621955) #b00000000000000000000000000000000)))))

(assert (=> b!1412019 (=> (not res!949186) (not e!799059))))

(declare-fun b!1412020 () Bool)

(assert (=> b!1412020 (and (bvsge (index!45995 lt!621955) #b00000000000000000000000000000000) (bvslt (index!45995 lt!621955) (size!47119 a!2901)))))

(declare-fun e!799057 () Bool)

(assert (=> b!1412020 (= e!799057 (= (select (arr!46567 a!2901) (index!45995 lt!621955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1412021 () Bool)

(assert (=> b!1412021 (= e!799056 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!621824 #b00000000000000000000000000000000 mask!2840) (select (arr!46567 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1412022 () Bool)

(assert (=> b!1412022 (and (bvsge (index!45995 lt!621955) #b00000000000000000000000000000000) (bvslt (index!45995 lt!621955) (size!47119 a!2901)))))

(declare-fun res!949188 () Bool)

(assert (=> b!1412022 (= res!949188 (= (select (arr!46567 a!2901) (index!45995 lt!621955)) (select (arr!46567 a!2901) j!112)))))

(assert (=> b!1412022 (=> res!949188 e!799057)))

(assert (=> b!1412022 (= e!799059 e!799057)))

(declare-fun b!1412023 () Bool)

(assert (=> b!1412023 (and (bvsge (index!45995 lt!621955) #b00000000000000000000000000000000) (bvslt (index!45995 lt!621955) (size!47119 a!2901)))))

(declare-fun res!949187 () Bool)

(assert (=> b!1412023 (= res!949187 (= (select (arr!46567 a!2901) (index!45995 lt!621955)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1412023 (=> res!949187 e!799057)))

(assert (= (and d!151911 c!130892) b!1412018))

(assert (= (and d!151911 (not c!130892)) b!1412015))

(assert (= (and b!1412015 c!130890) b!1412016))

(assert (= (and b!1412015 (not c!130890)) b!1412021))

(assert (= (and d!151911 c!130891) b!1412017))

(assert (= (and d!151911 (not c!130891)) b!1412019))

(assert (= (and b!1412019 res!949186) b!1412022))

(assert (= (and b!1412022 (not res!949188)) b!1412023))

(assert (= (and b!1412023 (not res!949187)) b!1412020))

(declare-fun m!1301575 () Bool)

(assert (=> b!1412022 m!1301575))

(assert (=> b!1412020 m!1301575))

(declare-fun m!1301577 () Bool)

(assert (=> b!1412021 m!1301577))

(assert (=> b!1412021 m!1301577))

(assert (=> b!1412021 m!1301375))

(declare-fun m!1301579 () Bool)

(assert (=> b!1412021 m!1301579))

(declare-fun m!1301581 () Bool)

(assert (=> d!151911 m!1301581))

(assert (=> d!151911 m!1301391))

(assert (=> b!1412023 m!1301575))

(assert (=> b!1411797 d!151911))

(declare-fun d!151913 () Bool)

(declare-fun lt!621957 () (_ BitVec 32))

(declare-fun lt!621956 () (_ BitVec 32))

(assert (=> d!151913 (= lt!621957 (bvmul (bvxor lt!621956 (bvlshr lt!621956 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151913 (= lt!621956 ((_ extract 31 0) (bvand (bvxor (select (arr!46567 a!2901) j!112) (bvlshr (select (arr!46567 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151913 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949173 (let ((h!34436 ((_ extract 31 0) (bvand (bvxor (select (arr!46567 a!2901) j!112) (bvlshr (select (arr!46567 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127582 (bvmul (bvxor h!34436 (bvlshr h!34436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127582 (bvlshr x!127582 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949173 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949173 #b00000000000000000000000000000000))))))

(assert (=> d!151913 (= (toIndex!0 (select (arr!46567 a!2901) j!112) mask!2840) (bvand (bvxor lt!621957 (bvlshr lt!621957 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411797 d!151913))

(declare-fun d!151915 () Bool)

(assert (=> d!151915 (= (validKeyInArray!0 (select (arr!46567 a!2901) j!112)) (and (not (= (select (arr!46567 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46567 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411802 d!151915))

(declare-fun d!151917 () Bool)

(assert (=> d!151917 (= (validKeyInArray!0 (select (arr!46567 a!2901) i!1037)) (and (not (= (select (arr!46567 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46567 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411796 d!151917))

(declare-fun b!1412024 () Bool)

(declare-fun e!799061 () SeekEntryResult!10904)

(assert (=> b!1412024 (= e!799061 Undefined!10904)))

(declare-fun b!1412025 () Bool)

(declare-fun e!799062 () SeekEntryResult!10904)

(assert (=> b!1412025 (= e!799061 e!799062)))

(declare-fun lt!621958 () (_ BitVec 64))

(declare-fun lt!621959 () SeekEntryResult!10904)

(assert (=> b!1412025 (= lt!621958 (select (arr!46567 lt!621819) (index!45995 lt!621959)))))

(declare-fun c!130895 () Bool)

(assert (=> b!1412025 (= c!130895 (= lt!621958 lt!621820))))

(declare-fun d!151919 () Bool)

(declare-fun lt!621960 () SeekEntryResult!10904)

(assert (=> d!151919 (and (or ((_ is Undefined!10904) lt!621960) (not ((_ is Found!10904) lt!621960)) (and (bvsge (index!45994 lt!621960) #b00000000000000000000000000000000) (bvslt (index!45994 lt!621960) (size!47119 lt!621819)))) (or ((_ is Undefined!10904) lt!621960) ((_ is Found!10904) lt!621960) (not ((_ is MissingZero!10904) lt!621960)) (and (bvsge (index!45993 lt!621960) #b00000000000000000000000000000000) (bvslt (index!45993 lt!621960) (size!47119 lt!621819)))) (or ((_ is Undefined!10904) lt!621960) ((_ is Found!10904) lt!621960) ((_ is MissingZero!10904) lt!621960) (not ((_ is MissingVacant!10904) lt!621960)) (and (bvsge (index!45996 lt!621960) #b00000000000000000000000000000000) (bvslt (index!45996 lt!621960) (size!47119 lt!621819)))) (or ((_ is Undefined!10904) lt!621960) (ite ((_ is Found!10904) lt!621960) (= (select (arr!46567 lt!621819) (index!45994 lt!621960)) lt!621820) (ite ((_ is MissingZero!10904) lt!621960) (= (select (arr!46567 lt!621819) (index!45993 lt!621960)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10904) lt!621960) (= (select (arr!46567 lt!621819) (index!45996 lt!621960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151919 (= lt!621960 e!799061)))

(declare-fun c!130894 () Bool)

(assert (=> d!151919 (= c!130894 (and ((_ is Intermediate!10904) lt!621959) (undefined!11716 lt!621959)))))

(assert (=> d!151919 (= lt!621959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621820 mask!2840) lt!621820 lt!621819 mask!2840))))

(assert (=> d!151919 (validMask!0 mask!2840)))

(assert (=> d!151919 (= (seekEntryOrOpen!0 lt!621820 lt!621819 mask!2840) lt!621960)))

(declare-fun b!1412026 () Bool)

(declare-fun c!130893 () Bool)

(assert (=> b!1412026 (= c!130893 (= lt!621958 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799063 () SeekEntryResult!10904)

(assert (=> b!1412026 (= e!799062 e!799063)))

(declare-fun b!1412027 () Bool)

(assert (=> b!1412027 (= e!799063 (seekKeyOrZeroReturnVacant!0 (x!127576 lt!621959) (index!45995 lt!621959) (index!45995 lt!621959) lt!621820 lt!621819 mask!2840))))

(declare-fun b!1412028 () Bool)

(assert (=> b!1412028 (= e!799062 (Found!10904 (index!45995 lt!621959)))))

(declare-fun b!1412029 () Bool)

(assert (=> b!1412029 (= e!799063 (MissingZero!10904 (index!45995 lt!621959)))))

(assert (= (and d!151919 c!130894) b!1412024))

(assert (= (and d!151919 (not c!130894)) b!1412025))

(assert (= (and b!1412025 c!130895) b!1412028))

(assert (= (and b!1412025 (not c!130895)) b!1412026))

(assert (= (and b!1412026 c!130893) b!1412029))

(assert (= (and b!1412026 (not c!130893)) b!1412027))

(declare-fun m!1301583 () Bool)

(assert (=> b!1412025 m!1301583))

(declare-fun m!1301585 () Bool)

(assert (=> d!151919 m!1301585))

(assert (=> d!151919 m!1301391))

(declare-fun m!1301587 () Bool)

(assert (=> d!151919 m!1301587))

(declare-fun m!1301589 () Bool)

(assert (=> d!151919 m!1301589))

(assert (=> d!151919 m!1301367))

(assert (=> d!151919 m!1301369))

(assert (=> d!151919 m!1301367))

(declare-fun m!1301591 () Bool)

(assert (=> b!1412027 m!1301591))

(assert (=> b!1411801 d!151919))

(declare-fun b!1412079 () Bool)

(declare-fun e!799096 () SeekEntryResult!10904)

(assert (=> b!1412079 (= e!799096 (Found!10904 (index!45995 lt!621823)))))

(declare-fun b!1412080 () Bool)

(declare-fun e!799095 () SeekEntryResult!10904)

(assert (=> b!1412080 (= e!799095 e!799096)))

(declare-fun c!130915 () Bool)

(declare-fun lt!621983 () (_ BitVec 64))

(assert (=> b!1412080 (= c!130915 (= lt!621983 (select (arr!46567 a!2901) j!112)))))

(declare-fun e!799094 () SeekEntryResult!10904)

(declare-fun b!1412081 () Bool)

(assert (=> b!1412081 (= e!799094 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127576 lt!621823) #b00000000000000000000000000000001) (nextIndex!0 (index!45995 lt!621823) (x!127576 lt!621823) mask!2840) (index!45995 lt!621823) (select (arr!46567 a!2901) j!112) lt!621819 mask!2840))))

(declare-fun d!151921 () Bool)

(declare-fun lt!621984 () SeekEntryResult!10904)

(assert (=> d!151921 (and (or ((_ is Undefined!10904) lt!621984) (not ((_ is Found!10904) lt!621984)) (and (bvsge (index!45994 lt!621984) #b00000000000000000000000000000000) (bvslt (index!45994 lt!621984) (size!47119 lt!621819)))) (or ((_ is Undefined!10904) lt!621984) ((_ is Found!10904) lt!621984) (not ((_ is MissingVacant!10904) lt!621984)) (not (= (index!45996 lt!621984) (index!45995 lt!621823))) (and (bvsge (index!45996 lt!621984) #b00000000000000000000000000000000) (bvslt (index!45996 lt!621984) (size!47119 lt!621819)))) (or ((_ is Undefined!10904) lt!621984) (ite ((_ is Found!10904) lt!621984) (= (select (arr!46567 lt!621819) (index!45994 lt!621984)) (select (arr!46567 a!2901) j!112)) (and ((_ is MissingVacant!10904) lt!621984) (= (index!45996 lt!621984) (index!45995 lt!621823)) (= (select (arr!46567 lt!621819) (index!45996 lt!621984)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!151921 (= lt!621984 e!799095)))

(declare-fun c!130916 () Bool)

(assert (=> d!151921 (= c!130916 (bvsge (x!127576 lt!621823) #b01111111111111111111111111111110))))

(assert (=> d!151921 (= lt!621983 (select (arr!46567 lt!621819) (index!45995 lt!621823)))))

(assert (=> d!151921 (validMask!0 mask!2840)))

(assert (=> d!151921 (= (seekKeyOrZeroReturnVacant!0 (x!127576 lt!621823) (index!45995 lt!621823) (index!45995 lt!621823) (select (arr!46567 a!2901) j!112) lt!621819 mask!2840) lt!621984)))

(declare-fun b!1412082 () Bool)

(declare-fun c!130917 () Bool)

(assert (=> b!1412082 (= c!130917 (= lt!621983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1412082 (= e!799096 e!799094)))

(declare-fun b!1412083 () Bool)

(assert (=> b!1412083 (= e!799095 Undefined!10904)))

(declare-fun b!1412084 () Bool)

(assert (=> b!1412084 (= e!799094 (MissingVacant!10904 (index!45995 lt!621823)))))

(assert (= (and d!151921 c!130916) b!1412083))

(assert (= (and d!151921 (not c!130916)) b!1412080))

(assert (= (and b!1412080 c!130915) b!1412079))

(assert (= (and b!1412080 (not c!130915)) b!1412082))

(assert (= (and b!1412082 c!130917) b!1412084))

(assert (= (and b!1412082 (not c!130917)) b!1412081))

(declare-fun m!1301619 () Bool)

(assert (=> b!1412081 m!1301619))

(assert (=> b!1412081 m!1301619))

(assert (=> b!1412081 m!1301375))

(declare-fun m!1301621 () Bool)

(assert (=> b!1412081 m!1301621))

(declare-fun m!1301623 () Bool)

(assert (=> d!151921 m!1301623))

(declare-fun m!1301625 () Bool)

(assert (=> d!151921 m!1301625))

(declare-fun m!1301627 () Bool)

(assert (=> d!151921 m!1301627))

(assert (=> d!151921 m!1301391))

(assert (=> b!1411801 d!151921))

(declare-fun d!151935 () Bool)

(assert (=> d!151935 (and (not (undefined!11716 lt!621823)) (= (index!45995 lt!621823) i!1037) (bvslt (x!127576 lt!621823) (x!127576 lt!621822)))))

(declare-fun lt!621987 () Unit!47625)

(declare-fun choose!62 (array!96456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47625)

(assert (=> d!151935 (= lt!621987 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621824 (x!127576 lt!621822) (index!45995 lt!621822) (x!127576 lt!621823) (index!45995 lt!621823) (undefined!11716 lt!621823) mask!2840))))

(assert (=> d!151935 (validMask!0 mask!2840)))

(assert (=> d!151935 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621824 (x!127576 lt!621822) (index!45995 lt!621822) (x!127576 lt!621823) (index!45995 lt!621823) (undefined!11716 lt!621823) mask!2840) lt!621987)))

(declare-fun bs!41143 () Bool)

(assert (= bs!41143 d!151935))

(declare-fun m!1301629 () Bool)

(assert (=> bs!41143 m!1301629))

(assert (=> bs!41143 m!1301391))

(assert (=> b!1411801 d!151935))

(declare-fun b!1412119 () Bool)

(declare-fun e!799119 () Bool)

(declare-fun call!67072 () Bool)

(assert (=> b!1412119 (= e!799119 call!67072)))

(declare-fun bm!67069 () Bool)

(declare-fun c!130932 () Bool)

(assert (=> bm!67069 (= call!67072 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130932 (Cons!33160 (select (arr!46567 a!2901) #b00000000000000000000000000000000) Nil!33161) Nil!33161)))))

(declare-fun b!1412120 () Bool)

(declare-fun e!799117 () Bool)

(assert (=> b!1412120 (= e!799117 e!799119)))

(assert (=> b!1412120 (= c!130932 (validKeyInArray!0 (select (arr!46567 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412121 () Bool)

(declare-fun e!799120 () Bool)

(assert (=> b!1412121 (= e!799120 e!799117)))

(declare-fun res!949207 () Bool)

(assert (=> b!1412121 (=> (not res!949207) (not e!799117))))

(declare-fun e!799118 () Bool)

(assert (=> b!1412121 (= res!949207 (not e!799118))))

(declare-fun res!949206 () Bool)

(assert (=> b!1412121 (=> (not res!949206) (not e!799118))))

(assert (=> b!1412121 (= res!949206 (validKeyInArray!0 (select (arr!46567 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151937 () Bool)

(declare-fun res!949208 () Bool)

(assert (=> d!151937 (=> res!949208 e!799120)))

(assert (=> d!151937 (= res!949208 (bvsge #b00000000000000000000000000000000 (size!47119 a!2901)))))

(assert (=> d!151937 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33161) e!799120)))

(declare-fun b!1412122 () Bool)

(declare-fun contains!9775 (List!33164 (_ BitVec 64)) Bool)

(assert (=> b!1412122 (= e!799118 (contains!9775 Nil!33161 (select (arr!46567 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412123 () Bool)

(assert (=> b!1412123 (= e!799119 call!67072)))

(assert (= (and d!151937 (not res!949208)) b!1412121))

(assert (= (and b!1412121 res!949206) b!1412122))

(assert (= (and b!1412121 res!949207) b!1412120))

(assert (= (and b!1412120 c!130932) b!1412123))

(assert (= (and b!1412120 (not c!130932)) b!1412119))

(assert (= (or b!1412123 b!1412119) bm!67069))

(assert (=> bm!67069 m!1301493))

(declare-fun m!1301651 () Bool)

(assert (=> bm!67069 m!1301651))

(assert (=> b!1412120 m!1301493))

(assert (=> b!1412120 m!1301493))

(assert (=> b!1412120 m!1301495))

(assert (=> b!1412121 m!1301493))

(assert (=> b!1412121 m!1301493))

(assert (=> b!1412121 m!1301495))

(assert (=> b!1412122 m!1301493))

(assert (=> b!1412122 m!1301493))

(declare-fun m!1301653 () Bool)

(assert (=> b!1412122 m!1301653))

(assert (=> b!1411795 d!151937))

(check-sat (not b!1412027) (not d!151919) (not d!151921) (not b!1411889) (not bm!67069) (not b!1411981) (not b!1411867) (not b!1411866) (not b!1412081) (not bm!67062) (not b!1412000) (not b!1412122) (not b!1412001) (not d!151935) (not d!151893) (not b!1412120) (not bm!67055) (not b!1412021) (not d!151911) (not d!151907) (not b!1412121) (not d!151873))
(check-sat)
