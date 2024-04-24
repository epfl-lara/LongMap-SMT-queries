; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117446 () Bool)

(assert start!117446)

(declare-fun res!922342 () Bool)

(declare-fun e!782196 () Bool)

(assert (=> start!117446 (=> (not res!922342) (not e!782196))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93947 0))(
  ( (array!93948 (arr!45369 (Array (_ BitVec 32) (_ BitVec 64))) (size!45920 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93947)

(assert (=> start!117446 (= res!922342 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45920 a!4094))))))

(assert (=> start!117446 e!782196))

(assert (=> start!117446 true))

(declare-fun array_inv!34650 (array!93947) Bool)

(assert (=> start!117446 (array_inv!34650 a!4094)))

(declare-fun e!782194 () Bool)

(declare-fun lt!607836 () (_ BitVec 32))

(declare-fun b!1380595 () Bool)

(declare-fun lt!607835 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1380595 (= e!782194 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45920 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (= lt!607835 (bvsub lt!607836 #b00000000000000000000000000000001)))))))

(declare-fun lt!607834 () (_ BitVec 32))

(declare-fun lt!607829 () (_ BitVec 32))

(assert (=> b!1380595 (= (bvadd lt!607834 lt!607829) lt!607835)))

(declare-fun lt!607831 () array!93947)

(declare-fun arrayCountValidKeys!0 (array!93947 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380595 (= lt!607835 (arrayCountValidKeys!0 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380595 (= lt!607834 (arrayCountValidKeys!0 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45798 0))(
  ( (Unit!45799) )
))
(declare-fun lt!607837 () Unit!45798)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45798)

(assert (=> b!1380595 (= lt!607837 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607832 () (_ BitVec 32))

(declare-fun lt!607833 () (_ BitVec 32))

(assert (=> b!1380595 (= (bvadd lt!607832 lt!607833) lt!607836)))

(assert (=> b!1380595 (= lt!607836 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380595 (= lt!607832 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607830 () Unit!45798)

(assert (=> b!1380595 (= lt!607830 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1380596 () Bool)

(declare-fun res!922341 () Bool)

(assert (=> b!1380596 (=> (not res!922341) (not e!782196))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380596 (= res!922341 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380597 () Bool)

(assert (=> b!1380597 (= e!782196 e!782194)))

(declare-fun res!922340 () Bool)

(assert (=> b!1380597 (=> (not res!922340) (not e!782194))))

(assert (=> b!1380597 (= res!922340 (and (= lt!607829 (bvsub lt!607833 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1380597 (= lt!607829 (arrayCountValidKeys!0 lt!607831 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380597 (= lt!607833 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380597 (= lt!607831 (array!93948 (store (arr!45369 a!4094) i!1451 k!2953) (size!45920 a!4094)))))

(declare-fun b!1380598 () Bool)

(declare-fun res!922344 () Bool)

(assert (=> b!1380598 (=> (not res!922344) (not e!782196))))

(assert (=> b!1380598 (= res!922344 (validKeyInArray!0 (select (arr!45369 a!4094) i!1451)))))

(declare-fun b!1380599 () Bool)

(declare-fun res!922343 () Bool)

(assert (=> b!1380599 (=> (not res!922343) (not e!782196))))

(assert (=> b!1380599 (= res!922343 (and (bvslt (size!45920 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45920 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117446 res!922342) b!1380598))

(assert (= (and b!1380598 res!922344) b!1380596))

(assert (= (and b!1380596 res!922341) b!1380599))

(assert (= (and b!1380599 res!922343) b!1380597))

(assert (= (and b!1380597 res!922340) b!1380595))

(declare-fun m!1265945 () Bool)

(assert (=> start!117446 m!1265945))

(declare-fun m!1265947 () Bool)

(assert (=> b!1380597 m!1265947))

(declare-fun m!1265949 () Bool)

(assert (=> b!1380597 m!1265949))

(declare-fun m!1265951 () Bool)

(assert (=> b!1380597 m!1265951))

(declare-fun m!1265953 () Bool)

(assert (=> b!1380596 m!1265953))

(declare-fun m!1265955 () Bool)

(assert (=> b!1380595 m!1265955))

(declare-fun m!1265957 () Bool)

(assert (=> b!1380595 m!1265957))

(declare-fun m!1265959 () Bool)

(assert (=> b!1380595 m!1265959))

(declare-fun m!1265961 () Bool)

(assert (=> b!1380595 m!1265961))

(declare-fun m!1265963 () Bool)

(assert (=> b!1380595 m!1265963))

(declare-fun m!1265965 () Bool)

(assert (=> b!1380595 m!1265965))

(declare-fun m!1265967 () Bool)

(assert (=> b!1380598 m!1265967))

(assert (=> b!1380598 m!1265967))

(declare-fun m!1265969 () Bool)

(assert (=> b!1380598 m!1265969))

(push 1)

(assert (not start!117446))

(assert (not b!1380598))

(assert (not b!1380596))

(assert (not b!1380597))

(assert (not b!1380595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149005 () Bool)

(assert (=> d!149005 (= (array_inv!34650 a!4094) (bvsge (size!45920 a!4094) #b00000000000000000000000000000000))))

(assert (=> start!117446 d!149005))

(declare-fun b!1380640 () Bool)

(declare-fun e!782218 () (_ BitVec 32))

(declare-fun call!66139 () (_ BitVec 32))

(assert (=> b!1380640 (= e!782218 call!66139)))

(declare-fun bm!66136 () Bool)

(assert (=> bm!66136 (= call!66139 (arrayCountValidKeys!0 lt!607831 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380641 () Bool)

(assert (=> b!1380641 (= e!782218 (bvadd #b00000000000000000000000000000001 call!66139))))

(declare-fun b!1380642 () Bool)

(declare-fun e!782217 () (_ BitVec 32))

(assert (=> b!1380642 (= e!782217 e!782218)))

(declare-fun c!128596 () Bool)

(assert (=> b!1380642 (= c!128596 (validKeyInArray!0 (select (arr!45369 lt!607831) from!3466)))))

(declare-fun b!1380643 () Bool)

(assert (=> b!1380643 (= e!782217 #b00000000000000000000000000000000)))

(declare-fun d!149007 () Bool)

(declare-fun lt!607852 () (_ BitVec 32))

(assert (=> d!149007 (and (bvsge lt!607852 #b00000000000000000000000000000000) (bvsle lt!607852 (bvsub (size!45920 lt!607831) from!3466)))))

(assert (=> d!149007 (= lt!607852 e!782217)))

(declare-fun c!128595 () Bool)

(assert (=> d!149007 (= c!128595 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!149007 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45920 lt!607831)))))

(assert (=> d!149007 (= (arrayCountValidKeys!0 lt!607831 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607852)))

(assert (= (and d!149007 c!128595) b!1380643))

(assert (= (and d!149007 (not c!128595)) b!1380642))

(assert (= (and b!1380642 c!128596) b!1380641))

(assert (= (and b!1380642 (not c!128596)) b!1380640))

(assert (= (or b!1380641 b!1380640) bm!66136))

(declare-fun m!1266003 () Bool)

(assert (=> bm!66136 m!1266003))

(declare-fun m!1266005 () Bool)

(assert (=> b!1380642 m!1266005))

(assert (=> b!1380642 m!1266005))

(declare-fun m!1266007 () Bool)

(assert (=> b!1380642 m!1266007))

(assert (=> b!1380597 d!149007))

(declare-fun b!1380644 () Bool)

(declare-fun e!782220 () (_ BitVec 32))

(declare-fun call!66140 () (_ BitVec 32))

(assert (=> b!1380644 (= e!782220 call!66140)))

(declare-fun bm!66137 () Bool)

(assert (=> bm!66137 (= call!66140 (arrayCountValidKeys!0 a!4094 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380645 () Bool)

(assert (=> b!1380645 (= e!782220 (bvadd #b00000000000000000000000000000001 call!66140))))

(declare-fun b!1380646 () Bool)

(declare-fun e!782219 () (_ BitVec 32))

(assert (=> b!1380646 (= e!782219 e!782220)))

(declare-fun c!128598 () Bool)

(assert (=> b!1380646 (= c!128598 (validKeyInArray!0 (select (arr!45369 a!4094) from!3466)))))

(declare-fun b!1380647 () Bool)

(assert (=> b!1380647 (= e!782219 #b00000000000000000000000000000000)))

(declare-fun d!149009 () Bool)

(declare-fun lt!607853 () (_ BitVec 32))

(assert (=> d!149009 (and (bvsge lt!607853 #b00000000000000000000000000000000) (bvsle lt!607853 (bvsub (size!45920 a!4094) from!3466)))))

(assert (=> d!149009 (= lt!607853 e!782219)))

(declare-fun c!128597 () Bool)

(assert (=> d!149009 (= c!128597 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!149009 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45920 a!4094)))))

(assert (=> d!149009 (= (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607853)))

(assert (= (and d!149009 c!128597) b!1380647))

(assert (= (and d!149009 (not c!128597)) b!1380646))

(assert (= (and b!1380646 c!128598) b!1380645))

(assert (= (and b!1380646 (not c!128598)) b!1380644))

(assert (= (or b!1380645 b!1380644) bm!66137))

(declare-fun m!1266009 () Bool)

(assert (=> bm!66137 m!1266009))

(declare-fun m!1266011 () Bool)

(assert (=> b!1380646 m!1266011))

(assert (=> b!1380646 m!1266011))

(declare-fun m!1266013 () Bool)

(assert (=> b!1380646 m!1266013))

(assert (=> b!1380597 d!149009))

(declare-fun d!149011 () Bool)

(assert (=> d!149011 (= (validKeyInArray!0 (select (arr!45369 a!4094) i!1451)) (and (not (= (select (arr!45369 a!4094) i!1451) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45369 a!4094) i!1451) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380598 d!149011))

(declare-fun d!149013 () Bool)

(assert (=> d!149013 (= (validKeyInArray!0 k!2953) (and (not (= k!2953 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2953 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380596 d!149013))

(declare-fun d!149015 () Bool)

(assert (=> d!149015 (= (bvadd (arrayCountValidKeys!0 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 lt!607831 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607856 () Unit!45798)

(declare-fun choose!61 (array!93947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45798)

(assert (=> d!149015 (= lt!607856 (choose!61 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!149015 (and (bvslt (size!45920 lt!607831) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45920 lt!607831)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!149015 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607856)))

(declare-fun bs!39744 () Bool)

(assert (= bs!39744 d!149015))

(assert (=> bs!39744 m!1265961))

(assert (=> bs!39744 m!1265947))

(assert (=> bs!39744 m!1265959))

(declare-fun m!1266015 () Bool)

(assert (=> bs!39744 m!1266015))

(assert (=> b!1380595 d!149015))

(declare-fun b!1380648 () Bool)

(declare-fun e!782222 () (_ BitVec 32))

(declare-fun call!66141 () (_ BitVec 32))

(assert (=> b!1380648 (= e!782222 call!66141)))

(declare-fun bm!66138 () Bool)

(assert (=> bm!66138 (= call!66141 (arrayCountValidKeys!0 lt!607831 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(declare-fun b!1380649 () Bool)

(assert (=> b!1380649 (= e!782222 (bvadd #b00000000000000000000000000000001 call!66141))))

(declare-fun b!1380650 () Bool)

(declare-fun e!782221 () (_ BitVec 32))

(assert (=> b!1380650 (= e!782221 e!782222)))

(declare-fun c!128600 () Bool)

(assert (=> b!1380650 (= c!128600 (validKeyInArray!0 (select (arr!45369 lt!607831) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1380651 () Bool)

(assert (=> b!1380651 (= e!782221 #b00000000000000000000000000000000)))

(declare-fun d!149017 () Bool)

(declare-fun lt!607857 () (_ BitVec 32))

(assert (=> d!149017 (and (bvsge lt!607857 #b00000000000000000000000000000000) (bvsle lt!607857 (bvsub (size!45920 lt!607831) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (=> d!149017 (= lt!607857 e!782221)))

(declare-fun c!128599 () Bool)

(assert (=> d!149017 (= c!128599 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!149017 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45920 lt!607831)))))

(assert (=> d!149017 (= (arrayCountValidKeys!0 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607857)))

(assert (= (and d!149017 c!128599) b!1380651))

(assert (= (and d!149017 (not c!128599)) b!1380650))

(assert (= (and b!1380650 c!128600) b!1380649))

(assert (= (and b!1380650 (not c!128600)) b!1380648))

(assert (= (or b!1380649 b!1380648) bm!66138))

(declare-fun m!1266017 () Bool)

(assert (=> bm!66138 m!1266017))

(declare-fun m!1266019 () Bool)

(assert (=> b!1380650 m!1266019))

(assert (=> b!1380650 m!1266019))

(declare-fun m!1266021 () Bool)

(assert (=> b!1380650 m!1266021))

(assert (=> b!1380595 d!149017))

(declare-fun b!1380652 () Bool)

(declare-fun e!782224 () (_ BitVec 32))

(declare-fun call!66142 () (_ BitVec 32))

(assert (=> b!1380652 (= e!782224 call!66142)))

(declare-fun bm!66139 () Bool)

(assert (=> bm!66139 (= call!66142 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380653 () Bool)

(assert (=> b!1380653 (= e!782224 (bvadd #b00000000000000000000000000000001 call!66142))))

(declare-fun b!1380654 () Bool)

(declare-fun e!782223 () (_ BitVec 32))

(assert (=> b!1380654 (= e!782223 e!782224)))

(declare-fun c!128602 () Bool)

(assert (=> b!1380654 (= c!128602 (validKeyInArray!0 (select (arr!45369 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1380655 () Bool)

(assert (=> b!1380655 (= e!782223 #b00000000000000000000000000000000)))

(declare-fun d!149019 () Bool)

(declare-fun lt!607858 () (_ BitVec 32))

(assert (=> d!149019 (and (bvsge lt!607858 #b00000000000000000000000000000000) (bvsle lt!607858 (bvsub (size!45920 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (=> d!149019 (= lt!607858 e!782223)))

(declare-fun c!128601 () Bool)

(assert (=> d!149019 (= c!128601 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!149019 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45920 a!4094)))))

(assert (=> d!149019 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607858)))

(assert (= (and d!149019 c!128601) b!1380655))

(assert (= (and d!149019 (not c!128601)) b!1380654))

(assert (= (and b!1380654 c!128602) b!1380653))

(assert (= (and b!1380654 (not c!128602)) b!1380652))

(assert (= (or b!1380653 b!1380652) bm!66139))

(declare-fun m!1266023 () Bool)

(assert (=> bm!66139 m!1266023))

(declare-fun m!1266025 () Bool)

(assert (=> b!1380654 m!1266025))

(assert (=> b!1380654 m!1266025))

(declare-fun m!1266027 () Bool)

(assert (=> b!1380654 m!1266027))

(assert (=> b!1380595 d!149019))

(declare-fun d!149021 () Bool)

(assert (=> d!149021 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607859 () Unit!45798)

(assert (=> d!149021 (= lt!607859 (choose!61 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!149021 (and (bvslt (size!45920 a!4094) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45920 a!4094)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!149021 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607859)))

(declare-fun bs!39745 () Bool)

(assert (= bs!39745 d!149021))

(assert (=> bs!39745 m!1265955))

(assert (=> bs!39745 m!1265949))

(assert (=> bs!39745 m!1265963))

(declare-fun m!1266029 () Bool)

(assert (=> bs!39745 m!1266029))

(assert (=> b!1380595 d!149021))

(declare-fun b!1380656 () Bool)

(declare-fun e!782226 () (_ BitVec 32))

(declare-fun call!66143 () (_ BitVec 32))

(assert (=> b!1380656 (= e!782226 call!66143)))

(declare-fun bm!66140 () Bool)

(assert (=> bm!66140 (= call!66143 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(declare-fun b!1380657 () Bool)

(assert (=> b!1380657 (= e!782226 (bvadd #b00000000000000000000000000000001 call!66143))))

(declare-fun b!1380658 () Bool)

(declare-fun e!782225 () (_ BitVec 32))

(assert (=> b!1380658 (= e!782225 e!782226)))

(declare-fun c!128604 () Bool)

(assert (=> b!1380658 (= c!128604 (validKeyInArray!0 (select (arr!45369 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1380659 () Bool)

(assert (=> b!1380659 (= e!782225 #b00000000000000000000000000000000)))

(declare-fun d!149023 () Bool)

(declare-fun lt!607860 () (_ BitVec 32))

(assert (=> d!149023 (and (bvsge lt!607860 #b00000000000000000000000000000000) (bvsle lt!607860 (bvsub (size!45920 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (=> d!149023 (= lt!607860 e!782225)))

(declare-fun c!128603 () Bool)

(assert (=> d!149023 (= c!128603 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!149023 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45920 a!4094)))))

(assert (=> d!149023 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607860)))

(assert (= (and d!149023 c!128603) b!1380659))

(assert (= (and d!149023 (not c!128603)) b!1380658))

(assert (= (and b!1380658 c!128604) b!1380657))

(assert (= (and b!1380658 (not c!128604)) b!1380656))

(assert (= (or b!1380657 b!1380656) bm!66140))

(declare-fun m!1266031 () Bool)

(assert (=> bm!66140 m!1266031))

(assert (=> b!1380658 m!1266025))

(assert (=> b!1380658 m!1266025))

(assert (=> b!1380658 m!1266027))

(assert (=> b!1380595 d!149023))

(declare-fun b!1380660 () Bool)

(declare-fun e!782228 () (_ BitVec 32))

(declare-fun call!66144 () (_ BitVec 32))

(assert (=> b!1380660 (= e!782228 call!66144)))

(declare-fun bm!66141 () Bool)

(assert (=> bm!66141 (= call!66144 (arrayCountValidKeys!0 lt!607831 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380661 () Bool)

(assert (=> b!1380661 (= e!782228 (bvadd #b00000000000000000000000000000001 call!66144))))

(declare-fun b!1380662 () Bool)

(declare-fun e!782227 () (_ BitVec 32))

(assert (=> b!1380662 (= e!782227 e!782228)))

(declare-fun c!128606 () Bool)

(assert (=> b!1380662 (= c!128606 (validKeyInArray!0 (select (arr!45369 lt!607831) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1380663 () Bool)

(assert (=> b!1380663 (= e!782227 #b00000000000000000000000000000000)))

(declare-fun d!149025 () Bool)

(declare-fun lt!607861 () (_ BitVec 32))

(assert (=> d!149025 (and (bvsge lt!607861 #b00000000000000000000000000000000) (bvsle lt!607861 (bvsub (size!45920 lt!607831) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (=> d!149025 (= lt!607861 e!782227)))

(declare-fun c!128605 () Bool)

(assert (=> d!149025 (= c!128605 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!149025 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45920 lt!607831)))))

(assert (=> d!149025 (= (arrayCountValidKeys!0 lt!607831 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607861)))

(assert (= (and d!149025 c!128605) b!1380663))

(assert (= (and d!149025 (not c!128605)) b!1380662))

(assert (= (and b!1380662 c!128606) b!1380661))

(assert (= (and b!1380662 (not c!128606)) b!1380660))

(assert (= (or b!1380661 b!1380660) bm!66141))

(declare-fun m!1266033 () Bool)

(assert (=> bm!66141 m!1266033))

(assert (=> b!1380662 m!1266019))

(assert (=> b!1380662 m!1266019))

(assert (=> b!1380662 m!1266021))

(assert (=> b!1380595 d!149025))

(push 1)

(assert (not bm!66139))

(assert (not bm!66140))

(assert (not b!1380646))

(assert (not b!1380642))

(assert (not b!1380662))

(assert (not b!1380650))

(assert (not bm!66138))

(assert (not d!149021))

(assert (not d!149015))

(assert (not b!1380654))

(assert (not bm!66137))

(assert (not b!1380658))

(assert (not bm!66136))

(assert (not bm!66141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

