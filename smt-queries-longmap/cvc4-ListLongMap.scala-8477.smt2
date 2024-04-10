; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103222 () Bool)

(assert start!103222)

(declare-fun b!1239116 () Bool)

(declare-fun res!826662 () Bool)

(declare-fun e!702190 () Bool)

(assert (=> b!1239116 (=> (not res!826662) (not e!702190))))

(declare-datatypes ((List!27303 0))(
  ( (Nil!27300) (Cons!27299 (h!28508 (_ BitVec 64)) (t!40766 List!27303)) )
))
(declare-fun acc!846 () List!27303)

(declare-fun contains!7365 (List!27303 (_ BitVec 64)) Bool)

(assert (=> b!1239116 (= res!826662 (not (contains!7365 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!702191 () Bool)

(declare-datatypes ((array!79857 0))(
  ( (array!79858 (arr!38530 (Array (_ BitVec 32) (_ BitVec 64))) (size!39066 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79857)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun b!1239117 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79857 (_ BitVec 32) List!27303) Bool)

(assert (=> b!1239117 (= e!702191 (not (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))))

(declare-fun b!1239118 () Bool)

(declare-datatypes ((Unit!41167 0))(
  ( (Unit!41168) )
))
(declare-fun e!702189 () Unit!41167)

(declare-fun lt!561607 () Unit!41167)

(assert (=> b!1239118 (= e!702189 lt!561607)))

(declare-fun lt!561608 () List!27303)

(assert (=> b!1239118 (= lt!561608 (Cons!27299 (select (arr!38530 a!3835) from!3213) acc!846))))

(declare-fun lt!561611 () Unit!41167)

(declare-fun lemmaListSubSeqRefl!0 (List!27303) Unit!41167)

(assert (=> b!1239118 (= lt!561611 (lemmaListSubSeqRefl!0 lt!561608))))

(declare-fun subseq!619 (List!27303 List!27303) Bool)

(assert (=> b!1239118 (subseq!619 lt!561608 lt!561608)))

(declare-fun lt!561609 () Unit!41167)

(declare-fun subseqTail!106 (List!27303 List!27303) Unit!41167)

(assert (=> b!1239118 (= lt!561609 (subseqTail!106 lt!561608 lt!561608))))

(assert (=> b!1239118 (subseq!619 acc!846 lt!561608)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79857 List!27303 List!27303 (_ BitVec 32)) Unit!41167)

(assert (=> b!1239118 (= lt!561607 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561608 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239118 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239119 () Bool)

(declare-fun Unit!41169 () Unit!41167)

(assert (=> b!1239119 (= e!702189 Unit!41169)))

(declare-fun b!1239120 () Bool)

(declare-fun res!826658 () Bool)

(assert (=> b!1239120 (=> (not res!826658) (not e!702190))))

(assert (=> b!1239120 (= res!826658 (not (= from!3213 (bvsub (size!39066 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239121 () Bool)

(assert (=> b!1239121 (= e!702190 e!702191)))

(declare-fun res!826661 () Bool)

(assert (=> b!1239121 (=> (not res!826661) (not e!702191))))

(assert (=> b!1239121 (= res!826661 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39066 a!3835))))))

(declare-fun lt!561610 () Unit!41167)

(assert (=> b!1239121 (= lt!561610 e!702189)))

(declare-fun c!121090 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239121 (= c!121090 (validKeyInArray!0 (select (arr!38530 a!3835) from!3213)))))

(declare-fun b!1239122 () Bool)

(declare-fun res!826659 () Bool)

(assert (=> b!1239122 (=> (not res!826659) (not e!702190))))

(assert (=> b!1239122 (= res!826659 (not (contains!7365 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239123 () Bool)

(declare-fun res!826660 () Bool)

(assert (=> b!1239123 (=> (not res!826660) (not e!702190))))

(declare-fun noDuplicate!1962 (List!27303) Bool)

(assert (=> b!1239123 (= res!826660 (noDuplicate!1962 acc!846))))

(declare-fun res!826656 () Bool)

(assert (=> start!103222 (=> (not res!826656) (not e!702190))))

(assert (=> start!103222 (= res!826656 (and (bvslt (size!39066 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39066 a!3835))))))

(assert (=> start!103222 e!702190))

(declare-fun array_inv!29378 (array!79857) Bool)

(assert (=> start!103222 (array_inv!29378 a!3835)))

(assert (=> start!103222 true))

(declare-fun b!1239124 () Bool)

(declare-fun res!826657 () Bool)

(assert (=> b!1239124 (=> (not res!826657) (not e!702190))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1239124 (= res!826657 (contains!7365 acc!846 k!2925))))

(declare-fun b!1239125 () Bool)

(declare-fun res!826663 () Bool)

(assert (=> b!1239125 (=> (not res!826663) (not e!702190))))

(assert (=> b!1239125 (= res!826663 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103222 res!826656) b!1239123))

(assert (= (and b!1239123 res!826660) b!1239122))

(assert (= (and b!1239122 res!826659) b!1239116))

(assert (= (and b!1239116 res!826662) b!1239125))

(assert (= (and b!1239125 res!826663) b!1239124))

(assert (= (and b!1239124 res!826657) b!1239120))

(assert (= (and b!1239120 res!826658) b!1239121))

(assert (= (and b!1239121 c!121090) b!1239118))

(assert (= (and b!1239121 (not c!121090)) b!1239119))

(assert (= (and b!1239121 res!826661) b!1239117))

(declare-fun m!1142631 () Bool)

(assert (=> start!103222 m!1142631))

(declare-fun m!1142633 () Bool)

(assert (=> b!1239123 m!1142633))

(declare-fun m!1142635 () Bool)

(assert (=> b!1239124 m!1142635))

(declare-fun m!1142637 () Bool)

(assert (=> b!1239121 m!1142637))

(assert (=> b!1239121 m!1142637))

(declare-fun m!1142639 () Bool)

(assert (=> b!1239121 m!1142639))

(declare-fun m!1142641 () Bool)

(assert (=> b!1239116 m!1142641))

(declare-fun m!1142643 () Bool)

(assert (=> b!1239122 m!1142643))

(declare-fun m!1142645 () Bool)

(assert (=> b!1239125 m!1142645))

(declare-fun m!1142647 () Bool)

(assert (=> b!1239118 m!1142647))

(declare-fun m!1142649 () Bool)

(assert (=> b!1239118 m!1142649))

(declare-fun m!1142651 () Bool)

(assert (=> b!1239118 m!1142651))

(assert (=> b!1239118 m!1142637))

(declare-fun m!1142653 () Bool)

(assert (=> b!1239118 m!1142653))

(declare-fun m!1142655 () Bool)

(assert (=> b!1239118 m!1142655))

(declare-fun m!1142657 () Bool)

(assert (=> b!1239118 m!1142657))

(assert (=> b!1239117 m!1142655))

(push 1)

(assert (not b!1239122))

(assert (not b!1239121))

(assert (not b!1239125))

(assert (not b!1239124))

(assert (not b!1239123))

(assert (not b!1239116))

(assert (not b!1239118))

(assert (not start!103222))

(assert (not b!1239117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1239188 () Bool)

(declare-fun e!702248 () Bool)

(assert (=> b!1239188 (= e!702248 (contains!7365 acc!846 (select (arr!38530 a!3835) from!3213)))))

(declare-fun b!1239189 () Bool)

(declare-fun e!702246 () Bool)

(declare-fun e!702245 () Bool)

(assert (=> b!1239189 (= e!702246 e!702245)))

(declare-fun res!826710 () Bool)

(assert (=> b!1239189 (=> (not res!826710) (not e!702245))))

(assert (=> b!1239189 (= res!826710 (not e!702248))))

(declare-fun res!826708 () Bool)

(assert (=> b!1239189 (=> (not res!826708) (not e!702248))))

(assert (=> b!1239189 (= res!826708 (validKeyInArray!0 (select (arr!38530 a!3835) from!3213)))))

(declare-fun b!1239190 () Bool)

(declare-fun e!702247 () Bool)

(declare-fun call!61080 () Bool)

(assert (=> b!1239190 (= e!702247 call!61080)))

(declare-fun b!1239191 () Bool)

(assert (=> b!1239191 (= e!702245 e!702247)))

(declare-fun c!121099 () Bool)

(assert (=> b!1239191 (= c!121099 (validKeyInArray!0 (select (arr!38530 a!3835) from!3213)))))

(declare-fun b!1239192 () Bool)

(assert (=> b!1239192 (= e!702247 call!61080)))

(declare-fun bm!61077 () Bool)

(assert (=> bm!61077 (= call!61080 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121099 (Cons!27299 (select (arr!38530 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun d!135973 () Bool)

(declare-fun res!826709 () Bool)

(assert (=> d!135973 (=> res!826709 e!702246)))

(assert (=> d!135973 (= res!826709 (bvsge from!3213 (size!39066 a!3835)))))

(assert (=> d!135973 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702246)))

(assert (= (and d!135973 (not res!826709)) b!1239189))

(assert (= (and b!1239189 res!826708) b!1239188))

(assert (= (and b!1239189 res!826710) b!1239191))

(assert (= (and b!1239191 c!121099) b!1239190))

(assert (= (and b!1239191 (not c!121099)) b!1239192))

(assert (= (or b!1239190 b!1239192) bm!61077))

(assert (=> b!1239188 m!1142637))

(assert (=> b!1239188 m!1142637))

(declare-fun m!1142687 () Bool)

(assert (=> b!1239188 m!1142687))

(assert (=> b!1239189 m!1142637))

(assert (=> b!1239189 m!1142637))

(assert (=> b!1239189 m!1142639))

(assert (=> b!1239191 m!1142637))

(assert (=> b!1239191 m!1142637))

(assert (=> b!1239191 m!1142639))

(assert (=> bm!61077 m!1142637))

(declare-fun m!1142689 () Bool)

(assert (=> bm!61077 m!1142689))

(assert (=> b!1239125 d!135973))

(declare-fun d!135979 () Bool)

(declare-fun lt!561626 () Bool)

(declare-fun content!595 (List!27303) (Set (_ BitVec 64)))

(assert (=> d!135979 (= lt!561626 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!595 acc!846)))))

(declare-fun e!702264 () Bool)

(assert (=> d!135979 (= lt!561626 e!702264)))

(declare-fun res!826720 () Bool)

(assert (=> d!135979 (=> (not res!826720) (not e!702264))))

(assert (=> d!135979 (= res!826720 (is-Cons!27299 acc!846))))

(assert (=> d!135979 (= (contains!7365 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561626)))

(declare-fun b!1239211 () Bool)

(declare-fun e!702263 () Bool)

(assert (=> b!1239211 (= e!702264 e!702263)))

(declare-fun res!826719 () Bool)

(assert (=> b!1239211 (=> res!826719 e!702263)))

(assert (=> b!1239211 (= res!826719 (= (h!28508 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239212 () Bool)

(assert (=> b!1239212 (= e!702263 (contains!7365 (t!40766 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135979 res!826720) b!1239211))

(assert (= (and b!1239211 (not res!826719)) b!1239212))

(declare-fun m!1142707 () Bool)

(assert (=> d!135979 m!1142707))

(declare-fun m!1142709 () Bool)

(assert (=> d!135979 m!1142709))

(declare-fun m!1142711 () Bool)

(assert (=> b!1239212 m!1142711))

(assert (=> b!1239116 d!135979))

(declare-fun d!135987 () Bool)

(assert (=> d!135987 (= (array_inv!29378 a!3835) (bvsge (size!39066 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103222 d!135987))

(declare-fun d!135991 () Bool)

(assert (=> d!135991 (= (validKeyInArray!0 (select (arr!38530 a!3835) from!3213)) (and (not (= (select (arr!38530 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38530 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239121 d!135991))

(declare-fun d!135997 () Bool)

(declare-fun lt!561630 () Bool)

(assert (=> d!135997 (= lt!561630 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!595 acc!846)))))

(declare-fun e!702274 () Bool)

(assert (=> d!135997 (= lt!561630 e!702274)))

(declare-fun res!826729 () Bool)

(assert (=> d!135997 (=> (not res!826729) (not e!702274))))

(assert (=> d!135997 (= res!826729 (is-Cons!27299 acc!846))))

(assert (=> d!135997 (= (contains!7365 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561630)))

(declare-fun b!1239222 () Bool)

(declare-fun e!702273 () Bool)

(assert (=> b!1239222 (= e!702274 e!702273)))

(declare-fun res!826728 () Bool)

(assert (=> b!1239222 (=> res!826728 e!702273)))

(assert (=> b!1239222 (= res!826728 (= (h!28508 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239223 () Bool)

(assert (=> b!1239223 (= e!702273 (contains!7365 (t!40766 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135997 res!826729) b!1239222))

(assert (= (and b!1239222 (not res!826728)) b!1239223))

(assert (=> d!135997 m!1142707))

(declare-fun m!1142725 () Bool)

(assert (=> d!135997 m!1142725))

(declare-fun m!1142727 () Bool)

(assert (=> b!1239223 m!1142727))

(assert (=> b!1239122 d!135997))

(declare-fun e!702278 () Bool)

(declare-fun b!1239224 () Bool)

(assert (=> b!1239224 (= e!702278 (contains!7365 acc!846 (select (arr!38530 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239225 () Bool)

(declare-fun e!702276 () Bool)

(declare-fun e!702275 () Bool)

(assert (=> b!1239225 (= e!702276 e!702275)))

(declare-fun res!826732 () Bool)

(assert (=> b!1239225 (=> (not res!826732) (not e!702275))))

(assert (=> b!1239225 (= res!826732 (not e!702278))))

(declare-fun res!826730 () Bool)

(assert (=> b!1239225 (=> (not res!826730) (not e!702278))))

(assert (=> b!1239225 (= res!826730 (validKeyInArray!0 (select (arr!38530 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239226 () Bool)

(declare-fun e!702277 () Bool)

(declare-fun call!61086 () Bool)

(assert (=> b!1239226 (= e!702277 call!61086)))

(declare-fun b!1239227 () Bool)

(assert (=> b!1239227 (= e!702275 e!702277)))

(declare-fun c!121107 () Bool)

(assert (=> b!1239227 (= c!121107 (validKeyInArray!0 (select (arr!38530 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239228 () Bool)

(assert (=> b!1239228 (= e!702277 call!61086)))

(declare-fun bm!61083 () Bool)

(assert (=> bm!61083 (= call!61086 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121107 (Cons!27299 (select (arr!38530 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(declare-fun d!135999 () Bool)

(declare-fun res!826731 () Bool)

(assert (=> d!135999 (=> res!826731 e!702276)))

(assert (=> d!135999 (= res!826731 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39066 a!3835)))))

(assert (=> d!135999 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!702276)))

(assert (= (and d!135999 (not res!826731)) b!1239225))

(assert (= (and b!1239225 res!826730) b!1239224))

(assert (= (and b!1239225 res!826732) b!1239227))

(assert (= (and b!1239227 c!121107) b!1239226))

(assert (= (and b!1239227 (not c!121107)) b!1239228))

(assert (= (or b!1239226 b!1239228) bm!61083))

(declare-fun m!1142731 () Bool)

(assert (=> b!1239224 m!1142731))

(assert (=> b!1239224 m!1142731))

(declare-fun m!1142733 () Bool)

(assert (=> b!1239224 m!1142733))

(assert (=> b!1239225 m!1142731))

(assert (=> b!1239225 m!1142731))

(declare-fun m!1142735 () Bool)

(assert (=> b!1239225 m!1142735))

(assert (=> b!1239227 m!1142731))

(assert (=> b!1239227 m!1142731))

(assert (=> b!1239227 m!1142735))

(assert (=> bm!61083 m!1142731))

(declare-fun m!1142737 () Bool)

(assert (=> bm!61083 m!1142737))

(assert (=> b!1239117 d!135999))

(assert (=> b!1239118 d!135999))

(declare-fun d!136003 () Bool)

(assert (=> d!136003 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!561638 () Unit!41167)

(declare-fun choose!80 (array!79857 List!27303 List!27303 (_ BitVec 32)) Unit!41167)

(assert (=> d!136003 (= lt!561638 (choose!80 a!3835 lt!561608 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!136003 (bvslt (size!39066 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136003 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561608 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!561638)))

(declare-fun bs!34843 () Bool)

(assert (= bs!34843 d!136003))

(assert (=> bs!34843 m!1142655))

(declare-fun m!1142739 () Bool)

(assert (=> bs!34843 m!1142739))

(assert (=> b!1239118 d!136003))

(declare-fun d!136005 () Bool)

(assert (=> d!136005 (subseq!619 lt!561608 lt!561608)))

(declare-fun lt!561641 () Unit!41167)

(declare-fun choose!36 (List!27303) Unit!41167)

(assert (=> d!136005 (= lt!561641 (choose!36 lt!561608))))

(assert (=> d!136005 (= (lemmaListSubSeqRefl!0 lt!561608) lt!561641)))

(declare-fun bs!34844 () Bool)

(assert (= bs!34844 d!136005))

(assert (=> bs!34844 m!1142651))

(declare-fun m!1142741 () Bool)

(assert (=> bs!34844 m!1142741))

(assert (=> b!1239118 d!136005))

(declare-fun b!1239279 () Bool)

(declare-fun e!702317 () Bool)

(assert (=> b!1239279 (= e!702317 (subseq!619 (t!40766 acc!846) (t!40766 lt!561608)))))

(declare-fun d!136007 () Bool)

(declare-fun res!826758 () Bool)

(declare-fun e!702316 () Bool)

(assert (=> d!136007 (=> res!826758 e!702316)))

(assert (=> d!136007 (= res!826758 (is-Nil!27300 acc!846))))

(assert (=> d!136007 (= (subseq!619 acc!846 lt!561608) e!702316)))

(declare-fun b!1239280 () Bool)

(declare-fun e!702318 () Bool)

(assert (=> b!1239280 (= e!702318 (subseq!619 acc!846 (t!40766 lt!561608)))))

(declare-fun b!1239277 () Bool)

(declare-fun e!702315 () Bool)

(assert (=> b!1239277 (= e!702316 e!702315)))

(declare-fun res!826760 () Bool)

(assert (=> b!1239277 (=> (not res!826760) (not e!702315))))

