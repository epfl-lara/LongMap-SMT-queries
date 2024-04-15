; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116290 () Bool)

(assert start!116290)

(declare-fun b!1372920 () Bool)

(declare-fun res!916233 () Bool)

(declare-fun e!777717 () Bool)

(assert (=> b!1372920 (=> (not res!916233) (not e!777717))))

(declare-datatypes ((List!32090 0))(
  ( (Nil!32087) (Cons!32086 (h!33295 (_ BitVec 64)) (t!46776 List!32090)) )
))
(declare-fun newAcc!98 () List!32090)

(declare-fun contains!9683 (List!32090 (_ BitVec 64)) Bool)

(assert (=> b!1372920 (= res!916233 (not (contains!9683 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372921 () Bool)

(declare-fun res!916240 () Bool)

(assert (=> b!1372921 (=> (not res!916240) (not e!777717))))

(declare-fun acc!866 () List!32090)

(assert (=> b!1372921 (= res!916240 (not (contains!9683 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!93066 0))(
  ( (array!93067 (arr!44944 (Array (_ BitVec 32) (_ BitVec 64))) (size!45496 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93066)

(declare-fun b!1372923 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun e!777716 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93066 (_ BitVec 32) List!32090) Bool)

(assert (=> b!1372923 (= e!777716 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866)))))

(declare-fun b!1372924 () Bool)

(declare-fun res!916235 () Bool)

(assert (=> b!1372924 (=> (not res!916235) (not e!777717))))

(declare-fun noDuplicate!2598 (List!32090) Bool)

(assert (=> b!1372924 (= res!916235 (noDuplicate!2598 acc!866))))

(declare-fun b!1372925 () Bool)

(declare-fun res!916237 () Bool)

(assert (=> b!1372925 (=> (not res!916237) (not e!777716))))

(assert (=> b!1372925 (= res!916237 (bvslt from!3239 (size!45496 a!3861)))))

(declare-fun b!1372926 () Bool)

(declare-fun res!916241 () Bool)

(assert (=> b!1372926 (=> (not res!916241) (not e!777717))))

(assert (=> b!1372926 (= res!916241 (not (contains!9683 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372927 () Bool)

(declare-fun res!916232 () Bool)

(assert (=> b!1372927 (=> (not res!916232) (not e!777717))))

(declare-fun subseq!1121 (List!32090 List!32090) Bool)

(assert (=> b!1372927 (= res!916232 (subseq!1121 newAcc!98 acc!866))))

(declare-fun res!916236 () Bool)

(assert (=> start!116290 (=> (not res!916236) (not e!777717))))

(assert (=> start!116290 (= res!916236 (and (bvslt (size!45496 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45496 a!3861))))))

(assert (=> start!116290 e!777717))

(declare-fun array_inv!34177 (array!93066) Bool)

(assert (=> start!116290 (array_inv!34177 a!3861)))

(assert (=> start!116290 true))

(declare-fun b!1372922 () Bool)

(declare-fun res!916239 () Bool)

(assert (=> b!1372922 (=> (not res!916239) (not e!777716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372922 (= res!916239 (not (validKeyInArray!0 (select (arr!44944 a!3861) from!3239))))))

(declare-fun b!1372928 () Bool)

(declare-fun res!916231 () Bool)

(assert (=> b!1372928 (=> (not res!916231) (not e!777717))))

(assert (=> b!1372928 (= res!916231 (not (contains!9683 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372929 () Bool)

(assert (=> b!1372929 (= e!777717 e!777716)))

(declare-fun res!916238 () Bool)

(assert (=> b!1372929 (=> (not res!916238) (not e!777716))))

(assert (=> b!1372929 (= res!916238 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45216 0))(
  ( (Unit!45217) )
))
(declare-fun lt!602805 () Unit!45216)

(declare-fun noDuplicateSubseq!308 (List!32090 List!32090) Unit!45216)

(assert (=> b!1372929 (= lt!602805 (noDuplicateSubseq!308 newAcc!98 acc!866))))

(declare-fun b!1372930 () Bool)

(declare-fun res!916234 () Bool)

(assert (=> b!1372930 (=> (not res!916234) (not e!777716))))

(assert (=> b!1372930 (= res!916234 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (= (and start!116290 res!916236) b!1372924))

(assert (= (and b!1372924 res!916235) b!1372921))

(assert (= (and b!1372921 res!916240) b!1372926))

(assert (= (and b!1372926 res!916241) b!1372928))

(assert (= (and b!1372928 res!916231) b!1372920))

(assert (= (and b!1372920 res!916233) b!1372927))

(assert (= (and b!1372927 res!916232) b!1372929))

(assert (= (and b!1372929 res!916238) b!1372925))

(assert (= (and b!1372925 res!916237) b!1372922))

(assert (= (and b!1372922 res!916239) b!1372930))

(assert (= (and b!1372930 res!916234) b!1372923))

(declare-fun m!1255815 () Bool)

(assert (=> b!1372926 m!1255815))

(declare-fun m!1255817 () Bool)

(assert (=> b!1372924 m!1255817))

(declare-fun m!1255819 () Bool)

(assert (=> b!1372923 m!1255819))

(declare-fun m!1255821 () Bool)

(assert (=> b!1372929 m!1255821))

(declare-fun m!1255823 () Bool)

(assert (=> b!1372929 m!1255823))

(declare-fun m!1255825 () Bool)

(assert (=> b!1372922 m!1255825))

(assert (=> b!1372922 m!1255825))

(declare-fun m!1255827 () Bool)

(assert (=> b!1372922 m!1255827))

(declare-fun m!1255829 () Bool)

(assert (=> start!116290 m!1255829))

(declare-fun m!1255831 () Bool)

(assert (=> b!1372921 m!1255831))

(declare-fun m!1255833 () Bool)

(assert (=> b!1372928 m!1255833))

(declare-fun m!1255835 () Bool)

(assert (=> b!1372927 m!1255835))

(declare-fun m!1255837 () Bool)

(assert (=> b!1372920 m!1255837))

(check-sat (not start!116290) (not b!1372923) (not b!1372920) (not b!1372921) (not b!1372926) (not b!1372927) (not b!1372928) (not b!1372924) (not b!1372929) (not b!1372922))
(check-sat)
(get-model)

(declare-fun d!147757 () Bool)

(declare-fun res!916312 () Bool)

(declare-fun e!777740 () Bool)

(assert (=> d!147757 (=> res!916312 e!777740)))

(get-info :version)

(assert (=> d!147757 (= res!916312 ((_ is Nil!32087) acc!866))))

(assert (=> d!147757 (= (noDuplicate!2598 acc!866) e!777740)))

(declare-fun b!1373001 () Bool)

(declare-fun e!777741 () Bool)

(assert (=> b!1373001 (= e!777740 e!777741)))

(declare-fun res!916313 () Bool)

(assert (=> b!1373001 (=> (not res!916313) (not e!777741))))

(assert (=> b!1373001 (= res!916313 (not (contains!9683 (t!46776 acc!866) (h!33295 acc!866))))))

(declare-fun b!1373002 () Bool)

(assert (=> b!1373002 (= e!777741 (noDuplicate!2598 (t!46776 acc!866)))))

(assert (= (and d!147757 (not res!916312)) b!1373001))

(assert (= (and b!1373001 res!916313) b!1373002))

(declare-fun m!1255887 () Bool)

(assert (=> b!1373001 m!1255887))

(declare-fun m!1255889 () Bool)

(assert (=> b!1373002 m!1255889))

(assert (=> b!1372924 d!147757))

(declare-fun d!147759 () Bool)

(declare-fun res!916342 () Bool)

(declare-fun e!777772 () Bool)

(assert (=> d!147759 (=> res!916342 e!777772)))

(assert (=> d!147759 (= res!916342 (bvsge from!3239 (size!45496 a!3861)))))

(assert (=> d!147759 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777772)))

(declare-fun b!1373033 () Bool)

(declare-fun e!777771 () Bool)

(assert (=> b!1373033 (= e!777772 e!777771)))

(declare-fun res!916341 () Bool)

(assert (=> b!1373033 (=> (not res!916341) (not e!777771))))

(declare-fun e!777773 () Bool)

(assert (=> b!1373033 (= res!916341 (not e!777773))))

(declare-fun res!916340 () Bool)

(assert (=> b!1373033 (=> (not res!916340) (not e!777773))))

(assert (=> b!1373033 (= res!916340 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(declare-fun b!1373034 () Bool)

(assert (=> b!1373034 (= e!777773 (contains!9683 acc!866 (select (arr!44944 a!3861) from!3239)))))

(declare-fun b!1373035 () Bool)

(declare-fun e!777770 () Bool)

(declare-fun call!65584 () Bool)

(assert (=> b!1373035 (= e!777770 call!65584)))

(declare-fun b!1373036 () Bool)

(assert (=> b!1373036 (= e!777771 e!777770)))

(declare-fun c!127789 () Bool)

(assert (=> b!1373036 (= c!127789 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(declare-fun b!1373037 () Bool)

(assert (=> b!1373037 (= e!777770 call!65584)))

(declare-fun bm!65581 () Bool)

(assert (=> bm!65581 (= call!65584 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127789 (Cons!32086 (select (arr!44944 a!3861) from!3239) acc!866) acc!866)))))

(assert (= (and d!147759 (not res!916342)) b!1373033))

(assert (= (and b!1373033 res!916340) b!1373034))

(assert (= (and b!1373033 res!916341) b!1373036))

(assert (= (and b!1373036 c!127789) b!1373035))

(assert (= (and b!1373036 (not c!127789)) b!1373037))

(assert (= (or b!1373035 b!1373037) bm!65581))

(assert (=> b!1373033 m!1255825))

(assert (=> b!1373033 m!1255825))

(assert (=> b!1373033 m!1255827))

(assert (=> b!1373034 m!1255825))

(assert (=> b!1373034 m!1255825))

(declare-fun m!1255899 () Bool)

(assert (=> b!1373034 m!1255899))

(assert (=> b!1373036 m!1255825))

(assert (=> b!1373036 m!1255825))

(assert (=> b!1373036 m!1255827))

(assert (=> bm!65581 m!1255825))

(declare-fun m!1255901 () Bool)

(assert (=> bm!65581 m!1255901))

(assert (=> b!1372929 d!147759))

(declare-fun d!147771 () Bool)

(assert (=> d!147771 (noDuplicate!2598 newAcc!98)))

(declare-fun lt!602814 () Unit!45216)

(declare-fun choose!2032 (List!32090 List!32090) Unit!45216)

(assert (=> d!147771 (= lt!602814 (choose!2032 newAcc!98 acc!866))))

(declare-fun e!777792 () Bool)

(assert (=> d!147771 e!777792))

(declare-fun res!916358 () Bool)

(assert (=> d!147771 (=> (not res!916358) (not e!777792))))

(assert (=> d!147771 (= res!916358 (subseq!1121 newAcc!98 acc!866))))

(assert (=> d!147771 (= (noDuplicateSubseq!308 newAcc!98 acc!866) lt!602814)))

(declare-fun b!1373059 () Bool)

(assert (=> b!1373059 (= e!777792 (noDuplicate!2598 acc!866))))

(assert (= (and d!147771 res!916358) b!1373059))

(declare-fun m!1255915 () Bool)

(assert (=> d!147771 m!1255915))

(declare-fun m!1255917 () Bool)

(assert (=> d!147771 m!1255917))

(assert (=> d!147771 m!1255835))

(assert (=> b!1373059 m!1255817))

(assert (=> b!1372929 d!147771))

(declare-fun d!147777 () Bool)

(declare-fun lt!602823 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!743 (List!32090) (InoxSet (_ BitVec 64)))

(assert (=> d!147777 (= lt!602823 (select (content!743 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777809 () Bool)

(assert (=> d!147777 (= lt!602823 e!777809)))

(declare-fun res!916375 () Bool)

(assert (=> d!147777 (=> (not res!916375) (not e!777809))))

(assert (=> d!147777 (= res!916375 ((_ is Cons!32086) newAcc!98))))

(assert (=> d!147777 (= (contains!9683 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602823)))

(declare-fun b!1373076 () Bool)

(declare-fun e!777810 () Bool)

(assert (=> b!1373076 (= e!777809 e!777810)))

(declare-fun res!916376 () Bool)

(assert (=> b!1373076 (=> res!916376 e!777810)))

(assert (=> b!1373076 (= res!916376 (= (h!33295 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373077 () Bool)

(assert (=> b!1373077 (= e!777810 (contains!9683 (t!46776 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147777 res!916375) b!1373076))

(assert (= (and b!1373076 (not res!916376)) b!1373077))

(declare-fun m!1255929 () Bool)

(assert (=> d!147777 m!1255929))

(declare-fun m!1255933 () Bool)

(assert (=> d!147777 m!1255933))

(declare-fun m!1255935 () Bool)

(assert (=> b!1373077 m!1255935))

(assert (=> b!1372920 d!147777))

(declare-fun d!147783 () Bool)

(assert (=> d!147783 (= (array_inv!34177 a!3861) (bvsge (size!45496 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116290 d!147783))

(declare-fun d!147787 () Bool)

(declare-fun res!916403 () Bool)

(declare-fun e!777839 () Bool)

(assert (=> d!147787 (=> res!916403 e!777839)))

(assert (=> d!147787 (= res!916403 ((_ is Nil!32087) newAcc!98))))

(assert (=> d!147787 (= (subseq!1121 newAcc!98 acc!866) e!777839)))

(declare-fun b!1373109 () Bool)

(declare-fun e!777840 () Bool)

(declare-fun e!777841 () Bool)

(assert (=> b!1373109 (= e!777840 e!777841)))

(declare-fun res!916406 () Bool)

(assert (=> b!1373109 (=> res!916406 e!777841)))

(declare-fun e!777842 () Bool)

(assert (=> b!1373109 (= res!916406 e!777842)))

(declare-fun res!916405 () Bool)

(assert (=> b!1373109 (=> (not res!916405) (not e!777842))))

(assert (=> b!1373109 (= res!916405 (= (h!33295 newAcc!98) (h!33295 acc!866)))))

(declare-fun b!1373108 () Bool)

(assert (=> b!1373108 (= e!777839 e!777840)))

(declare-fun res!916404 () Bool)

(assert (=> b!1373108 (=> (not res!916404) (not e!777840))))

(assert (=> b!1373108 (= res!916404 ((_ is Cons!32086) acc!866))))

(declare-fun b!1373110 () Bool)

(assert (=> b!1373110 (= e!777842 (subseq!1121 (t!46776 newAcc!98) (t!46776 acc!866)))))

(declare-fun b!1373111 () Bool)

(assert (=> b!1373111 (= e!777841 (subseq!1121 newAcc!98 (t!46776 acc!866)))))

(assert (= (and d!147787 (not res!916403)) b!1373108))

(assert (= (and b!1373108 res!916404) b!1373109))

(assert (= (and b!1373109 res!916405) b!1373110))

(assert (= (and b!1373109 (not res!916406)) b!1373111))

(declare-fun m!1255947 () Bool)

(assert (=> b!1373110 m!1255947))

(declare-fun m!1255949 () Bool)

(assert (=> b!1373111 m!1255949))

(assert (=> b!1372927 d!147787))

(declare-fun d!147793 () Bool)

(declare-fun lt!602826 () Bool)

(assert (=> d!147793 (= lt!602826 (select (content!743 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777847 () Bool)

(assert (=> d!147793 (= lt!602826 e!777847)))

(declare-fun res!916410 () Bool)

(assert (=> d!147793 (=> (not res!916410) (not e!777847))))

(assert (=> d!147793 (= res!916410 ((_ is Cons!32086) acc!866))))

(assert (=> d!147793 (= (contains!9683 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602826)))

(declare-fun b!1373117 () Bool)

(declare-fun e!777848 () Bool)

(assert (=> b!1373117 (= e!777847 e!777848)))

(declare-fun res!916411 () Bool)

(assert (=> b!1373117 (=> res!916411 e!777848)))

(assert (=> b!1373117 (= res!916411 (= (h!33295 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373118 () Bool)

(assert (=> b!1373118 (= e!777848 (contains!9683 (t!46776 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147793 res!916410) b!1373117))

(assert (= (and b!1373117 (not res!916411)) b!1373118))

(declare-fun m!1255951 () Bool)

(assert (=> d!147793 m!1255951))

(declare-fun m!1255953 () Bool)

(assert (=> d!147793 m!1255953))

(declare-fun m!1255956 () Bool)

(assert (=> b!1373118 m!1255956))

(assert (=> b!1372926 d!147793))

(declare-fun d!147795 () Bool)

(declare-fun lt!602827 () Bool)

(assert (=> d!147795 (= lt!602827 (select (content!743 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777853 () Bool)

(assert (=> d!147795 (= lt!602827 e!777853)))

(declare-fun res!916416 () Bool)

(assert (=> d!147795 (=> (not res!916416) (not e!777853))))

(assert (=> d!147795 (= res!916416 ((_ is Cons!32086) acc!866))))

(assert (=> d!147795 (= (contains!9683 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602827)))

(declare-fun b!1373123 () Bool)

(declare-fun e!777854 () Bool)

(assert (=> b!1373123 (= e!777853 e!777854)))

(declare-fun res!916417 () Bool)

(assert (=> b!1373123 (=> res!916417 e!777854)))

(assert (=> b!1373123 (= res!916417 (= (h!33295 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373124 () Bool)

(assert (=> b!1373124 (= e!777854 (contains!9683 (t!46776 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147795 res!916416) b!1373123))

(assert (= (and b!1373123 (not res!916417)) b!1373124))

(assert (=> d!147795 m!1255951))

(declare-fun m!1255969 () Bool)

(assert (=> d!147795 m!1255969))

(declare-fun m!1255971 () Bool)

(assert (=> b!1373124 m!1255971))

(assert (=> b!1372921 d!147795))

(declare-fun d!147801 () Bool)

(declare-fun lt!602828 () Bool)

(assert (=> d!147801 (= lt!602828 (select (content!743 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777859 () Bool)

(assert (=> d!147801 (= lt!602828 e!777859)))

(declare-fun res!916421 () Bool)

(assert (=> d!147801 (=> (not res!916421) (not e!777859))))

(assert (=> d!147801 (= res!916421 ((_ is Cons!32086) newAcc!98))))

(assert (=> d!147801 (= (contains!9683 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602828)))

(declare-fun b!1373130 () Bool)

(declare-fun e!777860 () Bool)

(assert (=> b!1373130 (= e!777859 e!777860)))

(declare-fun res!916422 () Bool)

(assert (=> b!1373130 (=> res!916422 e!777860)))

(assert (=> b!1373130 (= res!916422 (= (h!33295 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373131 () Bool)

(assert (=> b!1373131 (= e!777860 (contains!9683 (t!46776 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147801 res!916421) b!1373130))

(assert (= (and b!1373130 (not res!916422)) b!1373131))

(assert (=> d!147801 m!1255929))

(declare-fun m!1255973 () Bool)

(assert (=> d!147801 m!1255973))

(declare-fun m!1255975 () Bool)

(assert (=> b!1373131 m!1255975))

(assert (=> b!1372928 d!147801))

(declare-fun d!147803 () Bool)

(declare-fun res!916425 () Bool)

(declare-fun e!777863 () Bool)

(assert (=> d!147803 (=> res!916425 e!777863)))

(assert (=> d!147803 (= res!916425 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45496 a!3861)))))

(assert (=> d!147803 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!777863)))

(declare-fun b!1373132 () Bool)

(declare-fun e!777862 () Bool)

(assert (=> b!1373132 (= e!777863 e!777862)))

(declare-fun res!916424 () Bool)

(assert (=> b!1373132 (=> (not res!916424) (not e!777862))))

(declare-fun e!777864 () Bool)

(assert (=> b!1373132 (= res!916424 (not e!777864))))

(declare-fun res!916423 () Bool)

(assert (=> b!1373132 (=> (not res!916423) (not e!777864))))

(assert (=> b!1373132 (= res!916423 (validKeyInArray!0 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373133 () Bool)

(assert (=> b!1373133 (= e!777864 (contains!9683 acc!866 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373134 () Bool)

(declare-fun e!777861 () Bool)

(declare-fun call!65592 () Bool)

(assert (=> b!1373134 (= e!777861 call!65592)))

(declare-fun b!1373135 () Bool)

(assert (=> b!1373135 (= e!777862 e!777861)))

(declare-fun c!127797 () Bool)

(assert (=> b!1373135 (= c!127797 (validKeyInArray!0 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373136 () Bool)

(assert (=> b!1373136 (= e!777861 call!65592)))

(declare-fun bm!65589 () Bool)

(assert (=> bm!65589 (= call!65592 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127797 (Cons!32086 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(assert (= (and d!147803 (not res!916425)) b!1373132))

(assert (= (and b!1373132 res!916423) b!1373133))

(assert (= (and b!1373132 res!916424) b!1373135))

(assert (= (and b!1373135 c!127797) b!1373134))

(assert (= (and b!1373135 (not c!127797)) b!1373136))

(assert (= (or b!1373134 b!1373136) bm!65589))

(declare-fun m!1255981 () Bool)

(assert (=> b!1373132 m!1255981))

(assert (=> b!1373132 m!1255981))

(declare-fun m!1255983 () Bool)

(assert (=> b!1373132 m!1255983))

(assert (=> b!1373133 m!1255981))

(assert (=> b!1373133 m!1255981))

(declare-fun m!1255985 () Bool)

(assert (=> b!1373133 m!1255985))

(assert (=> b!1373135 m!1255981))

(assert (=> b!1373135 m!1255981))

(assert (=> b!1373135 m!1255983))

(assert (=> bm!65589 m!1255981))

(declare-fun m!1255989 () Bool)

(assert (=> bm!65589 m!1255989))

(assert (=> b!1372923 d!147803))

(declare-fun d!147809 () Bool)

(assert (=> d!147809 (= (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)) (and (not (= (select (arr!44944 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44944 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1372922 d!147809))

(check-sat (not bm!65589) (not b!1373124) (not b!1373133) (not b!1373034) (not b!1373131) (not d!147801) (not b!1373132) (not d!147771) (not b!1373059) (not b!1373110) (not d!147795) (not b!1373001) (not b!1373036) (not b!1373135) (not d!147793) (not b!1373002) (not b!1373077) (not b!1373033) (not b!1373111) (not d!147777) (not bm!65581) (not b!1373118))
(check-sat)
