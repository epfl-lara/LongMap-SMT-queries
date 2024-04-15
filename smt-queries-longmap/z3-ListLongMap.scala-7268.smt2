; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92788 () Bool)

(assert start!92788)

(declare-fun b!1053869 () Bool)

(declare-fun res!702942 () Bool)

(declare-fun e!598633 () Bool)

(assert (=> b!1053869 (=> (not res!702942) (not e!598633))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053869 (= res!702942 (validKeyInArray!0 k0!2747))))

(declare-fun e!598638 () Bool)

(declare-datatypes ((array!66422 0))(
  ( (array!66423 (arr!31944 (Array (_ BitVec 32) (_ BitVec 64))) (size!32482 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66422)

(declare-fun b!1053870 () Bool)

(declare-fun lt!465088 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053870 (= e!598638 (arrayContainsKey!0 a!3488 k0!2747 lt!465088))))

(declare-fun b!1053871 () Bool)

(declare-fun res!702940 () Bool)

(assert (=> b!1053871 (=> (not res!702940) (not e!598633))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053871 (= res!702940 (= (select (arr!31944 a!3488) i!1381) k0!2747))))

(declare-fun b!1053872 () Bool)

(declare-fun e!598637 () Bool)

(declare-fun e!598632 () Bool)

(assert (=> b!1053872 (= e!598637 e!598632)))

(declare-fun res!702935 () Bool)

(assert (=> b!1053872 (=> (not res!702935) (not e!598632))))

(assert (=> b!1053872 (= res!702935 (not (= lt!465088 i!1381)))))

(declare-fun lt!465086 () array!66422)

(declare-fun arrayScanForKey!0 (array!66422 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053872 (= lt!465088 (arrayScanForKey!0 lt!465086 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!702937 () Bool)

(assert (=> start!92788 (=> (not res!702937) (not e!598633))))

(assert (=> start!92788 (= res!702937 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32482 a!3488)) (bvslt (size!32482 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92788 e!598633))

(assert (=> start!92788 true))

(declare-fun array_inv!24727 (array!66422) Bool)

(assert (=> start!92788 (array_inv!24727 a!3488)))

(declare-fun b!1053873 () Bool)

(declare-fun res!702941 () Bool)

(assert (=> b!1053873 (=> (not res!702941) (not e!598633))))

(declare-datatypes ((List!22315 0))(
  ( (Nil!22312) (Cons!22311 (h!23520 (_ BitVec 64)) (t!31613 List!22315)) )
))
(declare-fun arrayNoDuplicates!0 (array!66422 (_ BitVec 32) List!22315) Bool)

(assert (=> b!1053873 (= res!702941 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22312))))

(declare-fun b!1053874 () Bool)

(declare-fun e!598635 () Bool)

(assert (=> b!1053874 (= e!598635 (or (bvslt lt!465088 #b00000000000000000000000000000000) (bvslt lt!465088 (size!32482 a!3488))))))

(assert (=> b!1053874 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22312)))

(declare-datatypes ((Unit!34379 0))(
  ( (Unit!34380) )
))
(declare-fun lt!465087 () Unit!34379)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66422 (_ BitVec 32) (_ BitVec 32)) Unit!34379)

(assert (=> b!1053874 (= lt!465087 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1053875 () Bool)

(assert (=> b!1053875 (= e!598633 e!598637)))

(declare-fun res!702939 () Bool)

(assert (=> b!1053875 (=> (not res!702939) (not e!598637))))

(assert (=> b!1053875 (= res!702939 (arrayContainsKey!0 lt!465086 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053875 (= lt!465086 (array!66423 (store (arr!31944 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32482 a!3488)))))

(declare-fun b!1053876 () Bool)

(declare-fun e!598636 () Bool)

(assert (=> b!1053876 (= e!598636 e!598638)))

(declare-fun res!702936 () Bool)

(assert (=> b!1053876 (=> res!702936 e!598638)))

(assert (=> b!1053876 (= res!702936 (bvsle lt!465088 i!1381))))

(declare-fun b!1053877 () Bool)

(assert (=> b!1053877 (= e!598632 (not e!598635))))

(declare-fun res!702938 () Bool)

(assert (=> b!1053877 (=> res!702938 e!598635)))

(assert (=> b!1053877 (= res!702938 (bvsle lt!465088 i!1381))))

(assert (=> b!1053877 e!598636))

(declare-fun res!702943 () Bool)

(assert (=> b!1053877 (=> (not res!702943) (not e!598636))))

(assert (=> b!1053877 (= res!702943 (= (select (store (arr!31944 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465088) k0!2747))))

(assert (= (and start!92788 res!702937) b!1053873))

(assert (= (and b!1053873 res!702941) b!1053869))

(assert (= (and b!1053869 res!702942) b!1053871))

(assert (= (and b!1053871 res!702940) b!1053875))

(assert (= (and b!1053875 res!702939) b!1053872))

(assert (= (and b!1053872 res!702935) b!1053877))

(assert (= (and b!1053877 res!702943) b!1053876))

(assert (= (and b!1053876 (not res!702936)) b!1053870))

(assert (= (and b!1053877 (not res!702938)) b!1053874))

(declare-fun m!973549 () Bool)

(assert (=> b!1053875 m!973549))

(declare-fun m!973551 () Bool)

(assert (=> b!1053875 m!973551))

(declare-fun m!973553 () Bool)

(assert (=> b!1053871 m!973553))

(assert (=> b!1053877 m!973551))

(declare-fun m!973555 () Bool)

(assert (=> b!1053877 m!973555))

(declare-fun m!973557 () Bool)

(assert (=> b!1053874 m!973557))

(declare-fun m!973559 () Bool)

(assert (=> b!1053874 m!973559))

(declare-fun m!973561 () Bool)

(assert (=> b!1053870 m!973561))

(declare-fun m!973563 () Bool)

(assert (=> b!1053872 m!973563))

(declare-fun m!973565 () Bool)

(assert (=> b!1053869 m!973565))

(declare-fun m!973567 () Bool)

(assert (=> start!92788 m!973567))

(declare-fun m!973569 () Bool)

(assert (=> b!1053873 m!973569))

(check-sat (not b!1053875) (not start!92788) (not b!1053869) (not b!1053870) (not b!1053872) (not b!1053873) (not b!1053874))
(check-sat)
(get-model)

(declare-fun b!1053942 () Bool)

(declare-fun e!598692 () Bool)

(declare-fun call!44738 () Bool)

(assert (=> b!1053942 (= e!598692 call!44738)))

(declare-fun b!1053943 () Bool)

(assert (=> b!1053943 (= e!598692 call!44738)))

(declare-fun b!1053944 () Bool)

(declare-fun e!598689 () Bool)

(declare-fun contains!6144 (List!22315 (_ BitVec 64)) Bool)

(assert (=> b!1053944 (= e!598689 (contains!6144 Nil!22312 (select (arr!31944 a!3488) i!1381)))))

(declare-fun d!127803 () Bool)

(declare-fun res!703004 () Bool)

(declare-fun e!598690 () Bool)

(assert (=> d!127803 (=> res!703004 e!598690)))

(assert (=> d!127803 (= res!703004 (bvsge i!1381 (size!32482 a!3488)))))

(assert (=> d!127803 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22312) e!598690)))

(declare-fun b!1053945 () Bool)

(declare-fun e!598691 () Bool)

(assert (=> b!1053945 (= e!598690 e!598691)))

(declare-fun res!703006 () Bool)

(assert (=> b!1053945 (=> (not res!703006) (not e!598691))))

(assert (=> b!1053945 (= res!703006 (not e!598689))))

(declare-fun res!703005 () Bool)

(assert (=> b!1053945 (=> (not res!703005) (not e!598689))))

(assert (=> b!1053945 (= res!703005 (validKeyInArray!0 (select (arr!31944 a!3488) i!1381)))))

(declare-fun bm!44735 () Bool)

(declare-fun c!106932 () Bool)

(assert (=> bm!44735 (= call!44738 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!106932 (Cons!22311 (select (arr!31944 a!3488) i!1381) Nil!22312) Nil!22312)))))

(declare-fun b!1053946 () Bool)

(assert (=> b!1053946 (= e!598691 e!598692)))

(assert (=> b!1053946 (= c!106932 (validKeyInArray!0 (select (arr!31944 a!3488) i!1381)))))

(assert (= (and d!127803 (not res!703004)) b!1053945))

(assert (= (and b!1053945 res!703005) b!1053944))

(assert (= (and b!1053945 res!703006) b!1053946))

(assert (= (and b!1053946 c!106932) b!1053943))

(assert (= (and b!1053946 (not c!106932)) b!1053942))

(assert (= (or b!1053943 b!1053942) bm!44735))

(assert (=> b!1053944 m!973553))

(assert (=> b!1053944 m!973553))

(declare-fun m!973615 () Bool)

(assert (=> b!1053944 m!973615))

(assert (=> b!1053945 m!973553))

(assert (=> b!1053945 m!973553))

(declare-fun m!973617 () Bool)

(assert (=> b!1053945 m!973617))

(assert (=> bm!44735 m!973553))

(declare-fun m!973619 () Bool)

(assert (=> bm!44735 m!973619))

(assert (=> b!1053946 m!973553))

(assert (=> b!1053946 m!973553))

(assert (=> b!1053946 m!973617))

(assert (=> b!1053874 d!127803))

(declare-fun d!127805 () Bool)

(assert (=> d!127805 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22312)))

(declare-fun lt!465109 () Unit!34379)

(declare-fun choose!39 (array!66422 (_ BitVec 32) (_ BitVec 32)) Unit!34379)

(assert (=> d!127805 (= lt!465109 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!127805 (bvslt (size!32482 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!127805 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465109)))

(declare-fun bs!30857 () Bool)

(assert (= bs!30857 d!127805))

(assert (=> bs!30857 m!973557))

(declare-fun m!973621 () Bool)

(assert (=> bs!30857 m!973621))

(assert (=> b!1053874 d!127805))

(declare-fun d!127807 () Bool)

(assert (=> d!127807 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053869 d!127807))

(declare-fun d!127809 () Bool)

(declare-fun res!703011 () Bool)

(declare-fun e!598697 () Bool)

(assert (=> d!127809 (=> res!703011 e!598697)))

(assert (=> d!127809 (= res!703011 (= (select (arr!31944 a!3488) lt!465088) k0!2747))))

(assert (=> d!127809 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465088) e!598697)))

(declare-fun b!1053951 () Bool)

(declare-fun e!598698 () Bool)

(assert (=> b!1053951 (= e!598697 e!598698)))

(declare-fun res!703012 () Bool)

(assert (=> b!1053951 (=> (not res!703012) (not e!598698))))

(assert (=> b!1053951 (= res!703012 (bvslt (bvadd lt!465088 #b00000000000000000000000000000001) (size!32482 a!3488)))))

(declare-fun b!1053952 () Bool)

(assert (=> b!1053952 (= e!598698 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465088 #b00000000000000000000000000000001)))))

(assert (= (and d!127809 (not res!703011)) b!1053951))

(assert (= (and b!1053951 res!703012) b!1053952))

(declare-fun m!973623 () Bool)

(assert (=> d!127809 m!973623))

(declare-fun m!973625 () Bool)

(assert (=> b!1053952 m!973625))

(assert (=> b!1053870 d!127809))

(declare-fun d!127811 () Bool)

(declare-fun res!703013 () Bool)

(declare-fun e!598699 () Bool)

(assert (=> d!127811 (=> res!703013 e!598699)))

(assert (=> d!127811 (= res!703013 (= (select (arr!31944 lt!465086) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127811 (= (arrayContainsKey!0 lt!465086 k0!2747 #b00000000000000000000000000000000) e!598699)))

(declare-fun b!1053953 () Bool)

(declare-fun e!598700 () Bool)

(assert (=> b!1053953 (= e!598699 e!598700)))

(declare-fun res!703014 () Bool)

(assert (=> b!1053953 (=> (not res!703014) (not e!598700))))

(assert (=> b!1053953 (= res!703014 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32482 lt!465086)))))

(declare-fun b!1053954 () Bool)

(assert (=> b!1053954 (= e!598700 (arrayContainsKey!0 lt!465086 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127811 (not res!703013)) b!1053953))

(assert (= (and b!1053953 res!703014) b!1053954))

(declare-fun m!973627 () Bool)

(assert (=> d!127811 m!973627))

(declare-fun m!973629 () Bool)

(assert (=> b!1053954 m!973629))

(assert (=> b!1053875 d!127811))

(declare-fun d!127813 () Bool)

(declare-fun lt!465112 () (_ BitVec 32))

(assert (=> d!127813 (and (or (bvslt lt!465112 #b00000000000000000000000000000000) (bvsge lt!465112 (size!32482 lt!465086)) (and (bvsge lt!465112 #b00000000000000000000000000000000) (bvslt lt!465112 (size!32482 lt!465086)))) (bvsge lt!465112 #b00000000000000000000000000000000) (bvslt lt!465112 (size!32482 lt!465086)) (= (select (arr!31944 lt!465086) lt!465112) k0!2747))))

(declare-fun e!598703 () (_ BitVec 32))

(assert (=> d!127813 (= lt!465112 e!598703)))

(declare-fun c!106935 () Bool)

(assert (=> d!127813 (= c!106935 (= (select (arr!31944 lt!465086) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32482 lt!465086)) (bvslt (size!32482 lt!465086) #b01111111111111111111111111111111))))

(assert (=> d!127813 (= (arrayScanForKey!0 lt!465086 k0!2747 #b00000000000000000000000000000000) lt!465112)))

(declare-fun b!1053959 () Bool)

(assert (=> b!1053959 (= e!598703 #b00000000000000000000000000000000)))

(declare-fun b!1053960 () Bool)

(assert (=> b!1053960 (= e!598703 (arrayScanForKey!0 lt!465086 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127813 c!106935) b!1053959))

(assert (= (and d!127813 (not c!106935)) b!1053960))

(declare-fun m!973631 () Bool)

(assert (=> d!127813 m!973631))

(assert (=> d!127813 m!973627))

(declare-fun m!973633 () Bool)

(assert (=> b!1053960 m!973633))

(assert (=> b!1053872 d!127813))

(declare-fun b!1053961 () Bool)

(declare-fun e!598707 () Bool)

(declare-fun call!44739 () Bool)

(assert (=> b!1053961 (= e!598707 call!44739)))

(declare-fun b!1053962 () Bool)

(assert (=> b!1053962 (= e!598707 call!44739)))

(declare-fun b!1053963 () Bool)

(declare-fun e!598704 () Bool)

(assert (=> b!1053963 (= e!598704 (contains!6144 Nil!22312 (select (arr!31944 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127815 () Bool)

(declare-fun res!703015 () Bool)

(declare-fun e!598705 () Bool)

(assert (=> d!127815 (=> res!703015 e!598705)))

(assert (=> d!127815 (= res!703015 (bvsge #b00000000000000000000000000000000 (size!32482 a!3488)))))

(assert (=> d!127815 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22312) e!598705)))

(declare-fun b!1053964 () Bool)

(declare-fun e!598706 () Bool)

(assert (=> b!1053964 (= e!598705 e!598706)))

(declare-fun res!703017 () Bool)

(assert (=> b!1053964 (=> (not res!703017) (not e!598706))))

(assert (=> b!1053964 (= res!703017 (not e!598704))))

(declare-fun res!703016 () Bool)

(assert (=> b!1053964 (=> (not res!703016) (not e!598704))))

(assert (=> b!1053964 (= res!703016 (validKeyInArray!0 (select (arr!31944 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44736 () Bool)

(declare-fun c!106936 () Bool)

(assert (=> bm!44736 (= call!44739 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106936 (Cons!22311 (select (arr!31944 a!3488) #b00000000000000000000000000000000) Nil!22312) Nil!22312)))))

(declare-fun b!1053965 () Bool)

(assert (=> b!1053965 (= e!598706 e!598707)))

(assert (=> b!1053965 (= c!106936 (validKeyInArray!0 (select (arr!31944 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!127815 (not res!703015)) b!1053964))

(assert (= (and b!1053964 res!703016) b!1053963))

(assert (= (and b!1053964 res!703017) b!1053965))

(assert (= (and b!1053965 c!106936) b!1053962))

(assert (= (and b!1053965 (not c!106936)) b!1053961))

(assert (= (or b!1053962 b!1053961) bm!44736))

(declare-fun m!973635 () Bool)

(assert (=> b!1053963 m!973635))

(assert (=> b!1053963 m!973635))

(declare-fun m!973637 () Bool)

(assert (=> b!1053963 m!973637))

(assert (=> b!1053964 m!973635))

(assert (=> b!1053964 m!973635))

(declare-fun m!973639 () Bool)

(assert (=> b!1053964 m!973639))

(assert (=> bm!44736 m!973635))

(declare-fun m!973641 () Bool)

(assert (=> bm!44736 m!973641))

(assert (=> b!1053965 m!973635))

(assert (=> b!1053965 m!973635))

(assert (=> b!1053965 m!973639))

(assert (=> b!1053873 d!127815))

(declare-fun d!127817 () Bool)

(assert (=> d!127817 (= (array_inv!24727 a!3488) (bvsge (size!32482 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92788 d!127817))

(check-sat (not bm!44735) (not b!1053952) (not b!1053965) (not bm!44736) (not b!1053945) (not b!1053954) (not b!1053963) (not b!1053964) (not b!1053960) (not d!127805) (not b!1053946) (not b!1053944))
(check-sat)
