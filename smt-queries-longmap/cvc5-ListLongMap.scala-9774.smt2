; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115814 () Bool)

(assert start!115814)

(declare-fun b!1369310 () Bool)

(declare-fun res!912794 () Bool)

(declare-fun e!775679 () Bool)

(assert (=> b!1369310 (=> (not res!912794) (not e!775679))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92961 0))(
  ( (array!92962 (arr!44903 (Array (_ BitVec 32) (_ BitVec 64))) (size!45453 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92961)

(assert (=> b!1369310 (= res!912794 (bvsge from!3239 (size!45453 a!3861)))))

(declare-fun res!912792 () Bool)

(declare-fun e!775681 () Bool)

(assert (=> start!115814 (=> (not res!912792) (not e!775681))))

(assert (=> start!115814 (= res!912792 (and (bvslt (size!45453 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45453 a!3861))))))

(assert (=> start!115814 e!775681))

(declare-fun array_inv!33931 (array!92961) Bool)

(assert (=> start!115814 (array_inv!33931 a!3861)))

(assert (=> start!115814 true))

(declare-fun b!1369311 () Bool)

(declare-fun res!912789 () Bool)

(assert (=> b!1369311 (=> (not res!912789) (not e!775681))))

(declare-datatypes ((List!31971 0))(
  ( (Nil!31968) (Cons!31967 (h!33176 (_ BitVec 64)) (t!46665 List!31971)) )
))
(declare-fun acc!866 () List!31971)

(declare-fun noDuplicate!2510 (List!31971) Bool)

(assert (=> b!1369311 (= res!912789 (noDuplicate!2510 acc!866))))

(declare-fun b!1369312 () Bool)

(declare-fun res!912796 () Bool)

(assert (=> b!1369312 (=> (not res!912796) (not e!775681))))

(declare-fun contains!9653 (List!31971 (_ BitVec 64)) Bool)

(assert (=> b!1369312 (= res!912796 (not (contains!9653 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369313 () Bool)

(assert (=> b!1369313 (= e!775681 e!775679)))

(declare-fun res!912793 () Bool)

(assert (=> b!1369313 (=> (not res!912793) (not e!775679))))

(declare-fun arrayNoDuplicates!0 (array!92961 (_ BitVec 32) List!31971) Bool)

(assert (=> b!1369313 (= res!912793 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45243 0))(
  ( (Unit!45244) )
))
(declare-fun lt!602242 () Unit!45243)

(declare-fun newAcc!98 () List!31971)

(declare-fun noDuplicateSubseq!242 (List!31971 List!31971) Unit!45243)

(assert (=> b!1369313 (= lt!602242 (noDuplicateSubseq!242 newAcc!98 acc!866))))

(declare-fun b!1369314 () Bool)

(declare-fun res!912788 () Bool)

(assert (=> b!1369314 (=> (not res!912788) (not e!775681))))

(declare-fun subseq!1055 (List!31971 List!31971) Bool)

(assert (=> b!1369314 (= res!912788 (subseq!1055 newAcc!98 acc!866))))

(declare-fun b!1369315 () Bool)

(declare-fun res!912795 () Bool)

(assert (=> b!1369315 (=> (not res!912795) (not e!775681))))

(assert (=> b!1369315 (= res!912795 (not (contains!9653 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369316 () Bool)

(declare-fun res!912790 () Bool)

(assert (=> b!1369316 (=> (not res!912790) (not e!775681))))

(assert (=> b!1369316 (= res!912790 (not (contains!9653 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369317 () Bool)

(assert (=> b!1369317 (= e!775679 (not (noDuplicate!2510 newAcc!98)))))

(declare-fun b!1369318 () Bool)

(declare-fun res!912791 () Bool)

(assert (=> b!1369318 (=> (not res!912791) (not e!775681))))

(assert (=> b!1369318 (= res!912791 (not (contains!9653 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115814 res!912792) b!1369311))

(assert (= (and b!1369311 res!912789) b!1369312))

(assert (= (and b!1369312 res!912796) b!1369318))

(assert (= (and b!1369318 res!912791) b!1369315))

(assert (= (and b!1369315 res!912795) b!1369316))

(assert (= (and b!1369316 res!912790) b!1369314))

(assert (= (and b!1369314 res!912788) b!1369313))

(assert (= (and b!1369313 res!912793) b!1369310))

(assert (= (and b!1369310 res!912794) b!1369317))

(declare-fun m!1253119 () Bool)

(assert (=> b!1369318 m!1253119))

(declare-fun m!1253121 () Bool)

(assert (=> b!1369317 m!1253121))

(declare-fun m!1253123 () Bool)

(assert (=> start!115814 m!1253123))

(declare-fun m!1253125 () Bool)

(assert (=> b!1369312 m!1253125))

(declare-fun m!1253127 () Bool)

(assert (=> b!1369316 m!1253127))

(declare-fun m!1253129 () Bool)

(assert (=> b!1369313 m!1253129))

(declare-fun m!1253131 () Bool)

(assert (=> b!1369313 m!1253131))

(declare-fun m!1253133 () Bool)

(assert (=> b!1369315 m!1253133))

(declare-fun m!1253135 () Bool)

(assert (=> b!1369314 m!1253135))

(declare-fun m!1253137 () Bool)

(assert (=> b!1369311 m!1253137))

(push 1)

(assert (not b!1369313))

(assert (not b!1369316))

(assert (not b!1369318))

(assert (not b!1369315))

(assert (not b!1369314))

(assert (not b!1369311))

(assert (not start!115814))

(assert (not b!1369317))

(assert (not b!1369312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147009 () Bool)

(declare-fun res!912865 () Bool)

(declare-fun e!775716 () Bool)

(assert (=> d!147009 (=> res!912865 e!775716)))

(assert (=> d!147009 (= res!912865 (is-Nil!31968 newAcc!98))))

(assert (=> d!147009 (= (noDuplicate!2510 newAcc!98) e!775716)))

(declare-fun b!1369391 () Bool)

(declare-fun e!775717 () Bool)

(assert (=> b!1369391 (= e!775716 e!775717)))

(declare-fun res!912866 () Bool)

(assert (=> b!1369391 (=> (not res!912866) (not e!775717))))

(assert (=> b!1369391 (= res!912866 (not (contains!9653 (t!46665 newAcc!98) (h!33176 newAcc!98))))))

(declare-fun b!1369392 () Bool)

(assert (=> b!1369392 (= e!775717 (noDuplicate!2510 (t!46665 newAcc!98)))))

(assert (= (and d!147009 (not res!912865)) b!1369391))

(assert (= (and b!1369391 res!912866) b!1369392))

(declare-fun m!1253179 () Bool)

(assert (=> b!1369391 m!1253179))

(declare-fun m!1253181 () Bool)

(assert (=> b!1369392 m!1253181))

(assert (=> b!1369317 d!147009))

(declare-fun d!147013 () Bool)

(declare-fun res!912867 () Bool)

(declare-fun e!775718 () Bool)

(assert (=> d!147013 (=> res!912867 e!775718)))

(assert (=> d!147013 (= res!912867 (is-Nil!31968 acc!866))))

(assert (=> d!147013 (= (noDuplicate!2510 acc!866) e!775718)))

(declare-fun b!1369393 () Bool)

(declare-fun e!775719 () Bool)

(assert (=> b!1369393 (= e!775718 e!775719)))

(declare-fun res!912868 () Bool)

(assert (=> b!1369393 (=> (not res!912868) (not e!775719))))

(assert (=> b!1369393 (= res!912868 (not (contains!9653 (t!46665 acc!866) (h!33176 acc!866))))))

(declare-fun b!1369394 () Bool)

(assert (=> b!1369394 (= e!775719 (noDuplicate!2510 (t!46665 acc!866)))))

(assert (= (and d!147013 (not res!912867)) b!1369393))

(assert (= (and b!1369393 res!912868) b!1369394))

(declare-fun m!1253183 () Bool)

(assert (=> b!1369393 m!1253183))

(declare-fun m!1253185 () Bool)

(assert (=> b!1369394 m!1253185))

(assert (=> b!1369311 d!147013))

(declare-fun d!147015 () Bool)

(assert (=> d!147015 (= (array_inv!33931 a!3861) (bvsge (size!45453 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115814 d!147015))

(declare-fun d!147019 () Bool)

(declare-fun lt!602254 () Bool)

(declare-fun content!723 (List!31971) (Set (_ BitVec 64)))

(assert (=> d!147019 (= lt!602254 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!723 newAcc!98)))))

(declare-fun e!775737 () Bool)

(assert (=> d!147019 (= lt!602254 e!775737)))

(declare-fun res!912885 () Bool)

(assert (=> d!147019 (=> (not res!912885) (not e!775737))))

(assert (=> d!147019 (= res!912885 (is-Cons!31967 newAcc!98))))

(assert (=> d!147019 (= (contains!9653 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602254)))

(declare-fun b!1369411 () Bool)

(declare-fun e!775738 () Bool)

(assert (=> b!1369411 (= e!775737 e!775738)))

(declare-fun res!912886 () Bool)

(assert (=> b!1369411 (=> res!912886 e!775738)))

(assert (=> b!1369411 (= res!912886 (= (h!33176 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369412 () Bool)

(assert (=> b!1369412 (= e!775738 (contains!9653 (t!46665 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147019 res!912885) b!1369411))

(assert (= (and b!1369411 (not res!912886)) b!1369412))

(declare-fun m!1253201 () Bool)

(assert (=> d!147019 m!1253201))

(declare-fun m!1253203 () Bool)

(assert (=> d!147019 m!1253203))

(declare-fun m!1253205 () Bool)

(assert (=> b!1369412 m!1253205))

(assert (=> b!1369316 d!147019))

(declare-fun d!147025 () Bool)

(declare-fun res!912917 () Bool)

(declare-fun e!775774 () Bool)

(assert (=> d!147025 (=> res!912917 e!775774)))

(assert (=> d!147025 (= res!912917 (bvsge from!3239 (size!45453 a!3861)))))

(assert (=> d!147025 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775774)))

(declare-fun b!1369454 () Bool)

(declare-fun e!775773 () Bool)

(declare-fun e!775776 () Bool)

(assert (=> b!1369454 (= e!775773 e!775776)))

(declare-fun c!127709 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369454 (= c!127709 (validKeyInArray!0 (select (arr!44903 a!3861) from!3239)))))

(declare-fun e!775775 () Bool)

(declare-fun b!1369455 () Bool)

(assert (=> b!1369455 (= e!775775 (contains!9653 acc!866 (select (arr!44903 a!3861) from!3239)))))

(declare-fun b!1369456 () Bool)

(declare-fun call!65516 () Bool)

(assert (=> b!1369456 (= e!775776 call!65516)))

(declare-fun b!1369457 () Bool)

(assert (=> b!1369457 (= e!775776 call!65516)))

(declare-fun bm!65513 () Bool)

(assert (=> bm!65513 (= call!65516 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127709 (Cons!31967 (select (arr!44903 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1369458 () Bool)

(assert (=> b!1369458 (= e!775774 e!775773)))

(declare-fun res!912918 () Bool)

(assert (=> b!1369458 (=> (not res!912918) (not e!775773))))

(assert (=> b!1369458 (= res!912918 (not e!775775))))

(declare-fun res!912916 () Bool)

(assert (=> b!1369458 (=> (not res!912916) (not e!775775))))

(assert (=> b!1369458 (= res!912916 (validKeyInArray!0 (select (arr!44903 a!3861) from!3239)))))

(assert (= (and d!147025 (not res!912917)) b!1369458))

(assert (= (and b!1369458 res!912916) b!1369455))

(assert (= (and b!1369458 res!912918) b!1369454))

(assert (= (and b!1369454 c!127709) b!1369457))

(assert (= (and b!1369454 (not c!127709)) b!1369456))

(assert (= (or b!1369457 b!1369456) bm!65513))

(declare-fun m!1253221 () Bool)

(assert (=> b!1369454 m!1253221))

(assert (=> b!1369454 m!1253221))

(declare-fun m!1253223 () Bool)

(assert (=> b!1369454 m!1253223))

(assert (=> b!1369455 m!1253221))

(assert (=> b!1369455 m!1253221))

(declare-fun m!1253225 () Bool)

(assert (=> b!1369455 m!1253225))

(assert (=> bm!65513 m!1253221))

(declare-fun m!1253227 () Bool)

(assert (=> bm!65513 m!1253227))

(assert (=> b!1369458 m!1253221))

(assert (=> b!1369458 m!1253221))

(assert (=> b!1369458 m!1253223))

(assert (=> b!1369313 d!147025))

(declare-fun d!147033 () Bool)

(assert (=> d!147033 (noDuplicate!2510 newAcc!98)))

(declare-fun lt!602265 () Unit!45243)

(declare-fun choose!2003 (List!31971 List!31971) Unit!45243)

(assert (=> d!147033 (= lt!602265 (choose!2003 newAcc!98 acc!866))))

(declare-fun e!775792 () Bool)

(assert (=> d!147033 e!775792))

(declare-fun res!912934 () Bool)

(assert (=> d!147033 (=> (not res!912934) (not e!775792))))

(assert (=> d!147033 (= res!912934 (subseq!1055 newAcc!98 acc!866))))

(assert (=> d!147033 (= (noDuplicateSubseq!242 newAcc!98 acc!866) lt!602265)))

(declare-fun b!1369474 () Bool)

(assert (=> b!1369474 (= e!775792 (noDuplicate!2510 acc!866))))

(assert (= (and d!147033 res!912934) b!1369474))

(assert (=> d!147033 m!1253121))

(declare-fun m!1253239 () Bool)

(assert (=> d!147033 m!1253239))

(assert (=> d!147033 m!1253135))

(assert (=> b!1369474 m!1253137))

(assert (=> b!1369313 d!147033))

(declare-fun d!147041 () Bool)

(declare-fun lt!602267 () Bool)

(assert (=> d!147041 (= lt!602267 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!723 acc!866)))))

(declare-fun e!775795 () Bool)

(assert (=> d!147041 (= lt!602267 e!775795)))

(declare-fun res!912937 () Bool)

(assert (=> d!147041 (=> (not res!912937) (not e!775795))))

(assert (=> d!147041 (= res!912937 (is-Cons!31967 acc!866))))

(assert (=> d!147041 (= (contains!9653 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602267)))

(declare-fun b!1369477 () Bool)

(declare-fun e!775796 () Bool)

(assert (=> b!1369477 (= e!775795 e!775796)))

(declare-fun res!912938 () Bool)

(assert (=> b!1369477 (=> res!912938 e!775796)))

(assert (=> b!1369477 (= res!912938 (= (h!33176 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369478 () Bool)

(assert (=> b!1369478 (= e!775796 (contains!9653 (t!46665 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147041 res!912937) b!1369477))

(assert (= (and b!1369477 (not res!912938)) b!1369478))

(declare-fun m!1253247 () Bool)

(assert (=> d!147041 m!1253247))

(declare-fun m!1253249 () Bool)

(assert (=> d!147041 m!1253249))

(declare-fun m!1253251 () Bool)

(assert (=> b!1369478 m!1253251))

(assert (=> b!1369318 d!147041))

(declare-fun d!147045 () Bool)

(declare-fun lt!602269 () Bool)

(assert (=> d!147045 (= lt!602269 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!723 acc!866)))))

(declare-fun e!775799 () Bool)

(assert (=> d!147045 (= lt!602269 e!775799)))

(declare-fun res!912941 () Bool)

(assert (=> d!147045 (=> (not res!912941) (not e!775799))))

(assert (=> d!147045 (= res!912941 (is-Cons!31967 acc!866))))

(assert (=> d!147045 (= (contains!9653 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602269)))

(declare-fun b!1369481 () Bool)

(declare-fun e!775800 () Bool)

(assert (=> b!1369481 (= e!775799 e!775800)))

(declare-fun res!912942 () Bool)

(assert (=> b!1369481 (=> res!912942 e!775800)))

(assert (=> b!1369481 (= res!912942 (= (h!33176 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369482 () Bool)

(assert (=> b!1369482 (= e!775800 (contains!9653 (t!46665 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147045 res!912941) b!1369481))

(assert (= (and b!1369481 (not res!912942)) b!1369482))

(assert (=> d!147045 m!1253247))

(declare-fun m!1253259 () Bool)

(assert (=> d!147045 m!1253259))

(declare-fun m!1253261 () Bool)

(assert (=> b!1369482 m!1253261))

(assert (=> b!1369312 d!147045))

(declare-fun b!1369507 () Bool)

(declare-fun e!775824 () Bool)

(assert (=> b!1369507 (= e!775824 (subseq!1055 (t!46665 newAcc!98) (t!46665 acc!866)))))

(declare-fun b!1369508 () Bool)

(declare-fun e!775826 () Bool)

(assert (=> b!1369508 (= e!775826 (subseq!1055 newAcc!98 (t!46665 acc!866)))))

(declare-fun b!1369506 () Bool)

(declare-fun e!775825 () Bool)

(assert (=> b!1369506 (= e!775825 e!775826)))

(declare-fun res!912965 () Bool)

(assert (=> b!1369506 (=> res!912965 e!775826)))

(assert (=> b!1369506 (= res!912965 e!775824)))

(declare-fun res!912968 () Bool)

(assert (=> b!1369506 (=> (not res!912968) (not e!775824))))

(assert (=> b!1369506 (= res!912968 (= (h!33176 newAcc!98) (h!33176 acc!866)))))

(declare-fun d!147051 () Bool)

(declare-fun res!912967 () Bool)

(declare-fun e!775823 () Bool)

(assert (=> d!147051 (=> res!912967 e!775823)))

(assert (=> d!147051 (= res!912967 (is-Nil!31968 newAcc!98))))

(assert (=> d!147051 (= (subseq!1055 newAcc!98 acc!866) e!775823)))

(declare-fun b!1369505 () Bool)

(assert (=> b!1369505 (= e!775823 e!775825)))

(declare-fun res!912966 () Bool)

(assert (=> b!1369505 (=> (not res!912966) (not e!775825))))

(assert (=> b!1369505 (= res!912966 (is-Cons!31967 acc!866))))

(assert (= (and d!147051 (not res!912967)) b!1369505))

(assert (= (and b!1369505 res!912966) b!1369506))

(assert (= (and b!1369506 res!912968) b!1369507))

(assert (= (and b!1369506 (not res!912965)) b!1369508))

(declare-fun m!1253275 () Bool)

(assert (=> b!1369507 m!1253275))

(declare-fun m!1253277 () Bool)

(assert (=> b!1369508 m!1253277))

(assert (=> b!1369314 d!147051))

(declare-fun d!147057 () Bool)

(declare-fun lt!602272 () Bool)

(assert (=> d!147057 (= lt!602272 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!723 newAcc!98)))))

