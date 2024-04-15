; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92876 () Bool)

(assert start!92876)

(declare-fun b!1054673 () Bool)

(declare-fun e!599264 () Bool)

(declare-fun e!599261 () Bool)

(assert (=> b!1054673 (= e!599264 e!599261)))

(declare-fun res!703701 () Bool)

(assert (=> b!1054673 (=> (not res!703701) (not e!599261))))

(declare-fun lt!465375 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054673 (= res!703701 (not (= lt!465375 i!1381)))))

(declare-datatypes ((array!66477 0))(
  ( (array!66478 (arr!31970 (Array (_ BitVec 32) (_ BitVec 64))) (size!32508 (_ BitVec 32))) )
))
(declare-fun lt!465376 () array!66477)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66477 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054673 (= lt!465375 (arrayScanForKey!0 lt!465376 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054674 () Bool)

(declare-fun e!599260 () Bool)

(assert (=> b!1054674 (= e!599260 e!599264)))

(declare-fun res!703698 () Bool)

(assert (=> b!1054674 (=> (not res!703698) (not e!599264))))

(declare-fun arrayContainsKey!0 (array!66477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054674 (= res!703698 (arrayContainsKey!0 lt!465376 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66477)

(assert (=> b!1054674 (= lt!465376 (array!66478 (store (arr!31970 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32508 a!3488)))))

(declare-fun b!1054675 () Bool)

(declare-fun res!703700 () Bool)

(assert (=> b!1054675 (=> (not res!703700) (not e!599260))))

(declare-datatypes ((List!22341 0))(
  ( (Nil!22338) (Cons!22337 (h!23546 (_ BitVec 64)) (t!31639 List!22341)) )
))
(declare-fun arrayNoDuplicates!0 (array!66477 (_ BitVec 32) List!22341) Bool)

(assert (=> b!1054675 (= res!703700 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22338))))

(declare-fun b!1054676 () Bool)

(declare-fun res!703704 () Bool)

(assert (=> b!1054676 (=> (not res!703704) (not e!599260))))

(assert (=> b!1054676 (= res!703704 (= (select (arr!31970 a!3488) i!1381) k!2747))))

(declare-fun res!703699 () Bool)

(assert (=> start!92876 (=> (not res!703699) (not e!599260))))

(assert (=> start!92876 (= res!703699 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32508 a!3488)) (bvslt (size!32508 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92876 e!599260))

(assert (=> start!92876 true))

(declare-fun array_inv!24753 (array!66477) Bool)

(assert (=> start!92876 (array_inv!24753 a!3488)))

(declare-fun b!1054677 () Bool)

(declare-fun e!599263 () Bool)

(assert (=> b!1054677 (= e!599263 (arrayContainsKey!0 a!3488 k!2747 lt!465375))))

(declare-fun b!1054678 () Bool)

(declare-fun res!703705 () Bool)

(assert (=> b!1054678 (=> (not res!703705) (not e!599260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054678 (= res!703705 (validKeyInArray!0 k!2747))))

(declare-fun b!1054679 () Bool)

(declare-fun e!599262 () Bool)

(assert (=> b!1054679 (= e!599262 (bvslt (bvadd #b00000000000000000000000000000001 i!1381) (size!32508 a!3488)))))

(assert (=> b!1054679 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34431 0))(
  ( (Unit!34432) )
))
(declare-fun lt!465373 () Unit!34431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66477 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34431)

(assert (=> b!1054679 (= lt!465373 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465375 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054679 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22338)))

(declare-fun lt!465374 () Unit!34431)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66477 (_ BitVec 32) (_ BitVec 32)) Unit!34431)

(assert (=> b!1054679 (= lt!465374 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054680 () Bool)

(assert (=> b!1054680 (= e!599261 (not e!599262))))

(declare-fun res!703702 () Bool)

(assert (=> b!1054680 (=> res!703702 e!599262)))

(assert (=> b!1054680 (= res!703702 (bvsle lt!465375 i!1381))))

(declare-fun e!599259 () Bool)

(assert (=> b!1054680 e!599259))

(declare-fun res!703703 () Bool)

(assert (=> b!1054680 (=> (not res!703703) (not e!599259))))

(assert (=> b!1054680 (= res!703703 (= (select (store (arr!31970 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465375) k!2747))))

(declare-fun b!1054681 () Bool)

(assert (=> b!1054681 (= e!599259 e!599263)))

(declare-fun res!703697 () Bool)

(assert (=> b!1054681 (=> res!703697 e!599263)))

(assert (=> b!1054681 (= res!703697 (bvsle lt!465375 i!1381))))

(assert (= (and start!92876 res!703699) b!1054675))

(assert (= (and b!1054675 res!703700) b!1054678))

(assert (= (and b!1054678 res!703705) b!1054676))

(assert (= (and b!1054676 res!703704) b!1054674))

(assert (= (and b!1054674 res!703698) b!1054673))

(assert (= (and b!1054673 res!703701) b!1054680))

(assert (= (and b!1054680 res!703703) b!1054681))

(assert (= (and b!1054681 (not res!703697)) b!1054677))

(assert (= (and b!1054680 (not res!703702)) b!1054679))

(declare-fun m!974249 () Bool)

(assert (=> b!1054677 m!974249))

(declare-fun m!974251 () Bool)

(assert (=> b!1054674 m!974251))

(declare-fun m!974253 () Bool)

(assert (=> b!1054674 m!974253))

(declare-fun m!974255 () Bool)

(assert (=> start!92876 m!974255))

(assert (=> b!1054680 m!974253))

(declare-fun m!974257 () Bool)

(assert (=> b!1054680 m!974257))

(declare-fun m!974259 () Bool)

(assert (=> b!1054673 m!974259))

(declare-fun m!974261 () Bool)

(assert (=> b!1054675 m!974261))

(declare-fun m!974263 () Bool)

(assert (=> b!1054678 m!974263))

(declare-fun m!974265 () Bool)

(assert (=> b!1054679 m!974265))

(declare-fun m!974267 () Bool)

(assert (=> b!1054679 m!974267))

(declare-fun m!974269 () Bool)

(assert (=> b!1054679 m!974269))

(declare-fun m!974271 () Bool)

(assert (=> b!1054679 m!974271))

(declare-fun m!974273 () Bool)

(assert (=> b!1054676 m!974273))

(push 1)

(assert (not b!1054673))

(assert (not b!1054675))

(assert (not b!1054674))

(assert (not b!1054677))

(assert (not b!1054678))

(assert (not b!1054679))

(assert (not start!92876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127869 () Bool)

(declare-fun res!703719 () Bool)

(declare-fun e!599282 () Bool)

(assert (=> d!127869 (=> res!703719 e!599282)))

(assert (=> d!127869 (= res!703719 (= (select (arr!31970 a!3488) lt!465375) k!2747))))

(assert (=> d!127869 (= (arrayContainsKey!0 a!3488 k!2747 lt!465375) e!599282)))

(declare-fun b!1054701 () Bool)

(declare-fun e!599283 () Bool)

(assert (=> b!1054701 (= e!599282 e!599283)))

(declare-fun res!703720 () Bool)

(assert (=> b!1054701 (=> (not res!703720) (not e!599283))))

(assert (=> b!1054701 (= res!703720 (bvslt (bvadd lt!465375 #b00000000000000000000000000000001) (size!32508 a!3488)))))

(declare-fun b!1054702 () Bool)

(assert (=> b!1054702 (= e!599283 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465375 #b00000000000000000000000000000001)))))

(assert (= (and d!127869 (not res!703719)) b!1054701))

(assert (= (and b!1054701 res!703720) b!1054702))

(declare-fun m!974283 () Bool)

(assert (=> d!127869 m!974283))

(declare-fun m!974285 () Bool)

(assert (=> b!1054702 m!974285))

(assert (=> b!1054677 d!127869))

(declare-fun d!127873 () Bool)

(assert (=> d!127873 (= (array_inv!24753 a!3488) (bvsge (size!32508 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92876 d!127873))

(declare-fun d!127875 () Bool)

(declare-fun res!703721 () Bool)

(declare-fun e!599284 () Bool)

(assert (=> d!127875 (=> res!703721 e!599284)))

(assert (=> d!127875 (= res!703721 (= (select (arr!31970 lt!465376) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127875 (= (arrayContainsKey!0 lt!465376 k!2747 #b00000000000000000000000000000000) e!599284)))

(declare-fun b!1054703 () Bool)

(declare-fun e!599285 () Bool)

(assert (=> b!1054703 (= e!599284 e!599285)))

(declare-fun res!703722 () Bool)

(assert (=> b!1054703 (=> (not res!703722) (not e!599285))))

(assert (=> b!1054703 (= res!703722 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32508 lt!465376)))))

(declare-fun b!1054704 () Bool)

(assert (=> b!1054704 (= e!599285 (arrayContainsKey!0 lt!465376 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127875 (not res!703721)) b!1054703))

(assert (= (and b!1054703 res!703722) b!1054704))

(declare-fun m!974287 () Bool)

(assert (=> d!127875 m!974287))

(declare-fun m!974289 () Bool)

(assert (=> b!1054704 m!974289))

(assert (=> b!1054674 d!127875))

(declare-fun b!1054721 () Bool)

(declare-fun e!599300 () Bool)

(declare-fun e!599301 () Bool)

(assert (=> b!1054721 (= e!599300 e!599301)))

(declare-fun res!703736 () Bool)

(assert (=> b!1054721 (=> (not res!703736) (not e!599301))))

(declare-fun e!599302 () Bool)

(assert (=> b!1054721 (= res!703736 (not e!599302))))

(declare-fun res!703735 () Bool)

(assert (=> b!1054721 (=> (not res!703735) (not e!599302))))

(assert (=> b!1054721 (= res!703735 (validKeyInArray!0 (select (arr!31970 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44750 () Bool)

(declare-fun call!44753 () Bool)

(declare-fun c!106956 () Bool)

(assert (=> bm!44750 (= call!44753 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106956 (Cons!22337 (select (arr!31970 a!3488) #b00000000000000000000000000000000) Nil!22338) Nil!22338)))))

(declare-fun b!1054722 () Bool)

(declare-fun e!599303 () Bool)

(assert (=> b!1054722 (= e!599303 call!44753)))

(declare-fun b!1054723 () Bool)

(assert (=> b!1054723 (= e!599301 e!599303)))

(assert (=> b!1054723 (= c!106956 (validKeyInArray!0 (select (arr!31970 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054724 () Bool)

(assert (=> b!1054724 (= e!599303 call!44753)))

(declare-fun b!1054725 () Bool)

(declare-fun contains!6147 (List!22341 (_ BitVec 64)) Bool)

(assert (=> b!1054725 (= e!599302 (contains!6147 Nil!22338 (select (arr!31970 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127877 () Bool)

(declare-fun res!703737 () Bool)

(assert (=> d!127877 (=> res!703737 e!599300)))

(assert (=> d!127877 (= res!703737 (bvsge #b00000000000000000000000000000000 (size!32508 a!3488)))))

(assert (=> d!127877 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22338) e!599300)))

(assert (= (and d!127877 (not res!703737)) b!1054721))

(assert (= (and b!1054721 res!703735) b!1054725))

(assert (= (and b!1054721 res!703736) b!1054723))

(assert (= (and b!1054723 c!106956) b!1054724))

(assert (= (and b!1054723 (not c!106956)) b!1054722))

(assert (= (or b!1054724 b!1054722) bm!44750))

(declare-fun m!974295 () Bool)

(assert (=> b!1054721 m!974295))

(assert (=> b!1054721 m!974295))

(declare-fun m!974297 () Bool)

(assert (=> b!1054721 m!974297))

(assert (=> bm!44750 m!974295))

(declare-fun m!974299 () Bool)

(assert (=> bm!44750 m!974299))

(assert (=> b!1054723 m!974295))

(assert (=> b!1054723 m!974295))

(assert (=> b!1054723 m!974297))

(assert (=> b!1054725 m!974295))

(assert (=> b!1054725 m!974295))

(declare-fun m!974301 () Bool)

(assert (=> b!1054725 m!974301))

(assert (=> b!1054675 d!127877))

(declare-fun d!127885 () Bool)

(declare-fun lt!465381 () (_ BitVec 32))

(assert (=> d!127885 (and (or (bvslt lt!465381 #b00000000000000000000000000000000) (bvsge lt!465381 (size!32508 lt!465376)) (and (bvsge lt!465381 #b00000000000000000000000000000000) (bvslt lt!465381 (size!32508 lt!465376)))) (bvsge lt!465381 #b00000000000000000000000000000000) (bvslt lt!465381 (size!32508 lt!465376)) (= (select (arr!31970 lt!465376) lt!465381) k!2747))))

(declare-fun e!599308 () (_ BitVec 32))

(assert (=> d!127885 (= lt!465381 e!599308)))

(declare-fun c!106961 () Bool)

(assert (=> d!127885 (= c!106961 (= (select (arr!31970 lt!465376) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127885 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32508 lt!465376)) (bvslt (size!32508 lt!465376) #b01111111111111111111111111111111))))

(assert (=> d!127885 (= (arrayScanForKey!0 lt!465376 k!2747 #b00000000000000000000000000000000) lt!465381)))

(declare-fun b!1054734 () Bool)

(assert (=> b!1054734 (= e!599308 #b00000000000000000000000000000000)))

(declare-fun b!1054735 () Bool)

(assert (=> b!1054735 (= e!599308 (arrayScanForKey!0 lt!465376 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127885 c!106961) b!1054734))

(assert (= (and d!127885 (not c!106961)) b!1054735))

(declare-fun m!974303 () Bool)

(assert (=> d!127885 m!974303))

(assert (=> d!127885 m!974287))

(declare-fun m!974305 () Bool)

(assert (=> b!1054735 m!974305))

(assert (=> b!1054673 d!127885))

(declare-fun d!127887 () Bool)

(assert (=> d!127887 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054678 d!127887))

(declare-fun d!127891 () Bool)

(declare-fun res!703738 () Bool)

(declare-fun e!599309 () Bool)

(assert (=> d!127891 (=> res!703738 e!599309)))

(assert (=> d!127891 (= res!703738 (= (select (arr!31970 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k!2747))))

(assert (=> d!127891 (= (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599309)))

(declare-fun b!1054736 () Bool)

(declare-fun e!599310 () Bool)

(assert (=> b!1054736 (= e!599309 e!599310)))

(declare-fun res!703739 () Bool)

(assert (=> b!1054736 (=> (not res!703739) (not e!599310))))

(assert (=> b!1054736 (= res!703739 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32508 a!3488)))))

(declare-fun b!1054737 () Bool)

(assert (=> b!1054737 (= e!599310 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!127891 (not res!703738)) b!1054736))

(assert (= (and b!1054736 res!703739) b!1054737))

(declare-fun m!974307 () Bool)

(assert (=> d!127891 m!974307))

(declare-fun m!974309 () Bool)

(assert (=> b!1054737 m!974309))

(assert (=> b!1054679 d!127891))

(declare-fun d!127893 () Bool)

(assert (=> d!127893 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465385 () Unit!34431)

(declare-fun choose!114 (array!66477 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34431)

(assert (=> d!127893 (= lt!465385 (choose!114 a!3488 k!2747 lt!465375 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!127893 (bvsge lt!465375 #b00000000000000000000000000000000)))

(assert (=> d!127893 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465375 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465385)))

(declare-fun bs!30884 () Bool)

(assert (= bs!30884 d!127893))

(assert (=> bs!30884 m!974265))

(declare-fun m!974321 () Bool)

(assert (=> bs!30884 m!974321))

(assert (=> b!1054679 d!127893))

(declare-fun b!1054742 () Bool)

(declare-fun e!599314 () Bool)

(declare-fun e!599315 () Bool)

(assert (=> b!1054742 (= e!599314 e!599315)))

(declare-fun res!703743 () Bool)

(assert (=> b!1054742 (=> (not res!703743) (not e!599315))))

(declare-fun e!599316 () Bool)

(assert (=> b!1054742 (= res!703743 (not e!599316))))

(declare-fun res!703742 () Bool)

(assert (=> b!1054742 (=> (not res!703742) (not e!599316))))

(assert (=> b!1054742 (= res!703742 (validKeyInArray!0 (select (arr!31970 a!3488) i!1381)))))

(declare-fun bm!44751 () Bool)

(declare-fun c!106963 () Bool)

(declare-fun call!44754 () Bool)

(assert (=> bm!44751 (= call!44754 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!106963 (Cons!22337 (select (arr!31970 a!3488) i!1381) Nil!22338) Nil!22338)))))

(declare-fun b!1054743 () Bool)

(declare-fun e!599317 () Bool)

(assert (=> b!1054743 (= e!599317 call!44754)))

(declare-fun b!1054744 () Bool)

(assert (=> b!1054744 (= e!599315 e!599317)))

(assert (=> b!1054744 (= c!106963 (validKeyInArray!0 (select (arr!31970 a!3488) i!1381)))))

(declare-fun b!1054745 () Bool)

(assert (=> b!1054745 (= e!599317 call!44754)))

(declare-fun b!1054746 () Bool)

(assert (=> b!1054746 (= e!599316 (contains!6147 Nil!22338 (select (arr!31970 a!3488) i!1381)))))

(declare-fun d!127899 () Bool)

(declare-fun res!703744 () Bool)

(assert (=> d!127899 (=> res!703744 e!599314)))

(assert (=> d!127899 (= res!703744 (bvsge i!1381 (size!32508 a!3488)))))

(assert (=> d!127899 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22338) e!599314)))

(assert (= (and d!127899 (not res!703744)) b!1054742))

(assert (= (and b!1054742 res!703742) b!1054746))

(assert (= (and b!1054742 res!703743) b!1054744))

(assert (= (and b!1054744 c!106963) b!1054745))

(assert (= (and b!1054744 (not c!106963)) b!1054743))

(assert (= (or b!1054745 b!1054743) bm!44751))

(assert (=> b!1054742 m!974273))

(assert (=> b!1054742 m!974273))

(declare-fun m!974325 () Bool)

(assert (=> b!1054742 m!974325))

(assert (=> bm!44751 m!974273))

(declare-fun m!974327 () Bool)

(assert (=> bm!44751 m!974327))

(assert (=> b!1054744 m!974273))

(assert (=> b!1054744 m!974273))

(assert (=> b!1054744 m!974325))

(assert (=> b!1054746 m!974273))

(assert (=> b!1054746 m!974273))

(declare-fun m!974329 () Bool)

(assert (=> b!1054746 m!974329))

(assert (=> b!1054679 d!127899))

(declare-fun d!127903 () Bool)

(assert (=> d!127903 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22338)))

(declare-fun lt!465395 () Unit!34431)

(declare-fun choose!39 (array!66477 (_ BitVec 32) (_ BitVec 32)) Unit!34431)

(assert (=> d!127903 (= lt!465395 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!127903 (bvslt (size!32508 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!127903 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465395)))

(declare-fun bs!30886 () Bool)

(assert (= bs!30886 d!127903))

(assert (=> bs!30886 m!974269))

(declare-fun m!974337 () Bool)

(assert (=> bs!30886 m!974337))

(assert (=> b!1054679 d!127903))

(push 1)

(assert (not b!1054735))

(assert (not b!1054721))

(assert (not b!1054742))

(assert (not bm!44750))

(assert (not d!127903))

(assert (not b!1054702))

(assert (not b!1054737))

(assert (not bm!44751))

(assert (not b!1054725))

(assert (not d!127893))

(assert (not b!1054704))

(assert (not b!1054746))

(assert (not b!1054744))

(assert (not b!1054723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

