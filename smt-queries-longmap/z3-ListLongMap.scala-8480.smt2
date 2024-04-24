; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103528 () Bool)

(assert start!103528)

(declare-fun res!827514 () Bool)

(declare-fun e!703318 () Bool)

(assert (=> start!103528 (=> (not res!827514) (not e!703318))))

(declare-datatypes ((array!79910 0))(
  ( (array!79911 (arr!38549 (Array (_ BitVec 32) (_ BitVec 64))) (size!39086 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79910)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103528 (= res!827514 (and (bvslt (size!39086 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39086 a!3835))))))

(assert (=> start!103528 e!703318))

(declare-fun array_inv!29487 (array!79910) Bool)

(assert (=> start!103528 (array_inv!29487 a!3835)))

(assert (=> start!103528 true))

(declare-fun b!1240880 () Bool)

(declare-fun res!827512 () Bool)

(declare-fun e!703317 () Bool)

(assert (=> b!1240880 (=> (not res!827512) (not e!703317))))

(declare-datatypes ((List!27335 0))(
  ( (Nil!27332) (Cons!27331 (h!28549 (_ BitVec 64)) (t!40790 List!27335)) )
))
(declare-fun acc!846 () List!27335)

(declare-fun arrayNoDuplicates!0 (array!79910 (_ BitVec 32) List!27335) Bool)

(assert (=> b!1240880 (= res!827512 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1240881 () Bool)

(declare-datatypes ((Unit!41165 0))(
  ( (Unit!41166) )
))
(declare-fun e!703316 () Unit!41165)

(declare-fun lt!562254 () Unit!41165)

(assert (=> b!1240881 (= e!703316 lt!562254)))

(declare-fun lt!562255 () List!27335)

(assert (=> b!1240881 (= lt!562255 (Cons!27331 (select (arr!38549 a!3835) from!3213) acc!846))))

(declare-fun lt!562252 () Unit!41165)

(declare-fun lemmaListSubSeqRefl!0 (List!27335) Unit!41165)

(assert (=> b!1240881 (= lt!562252 (lemmaListSubSeqRefl!0 lt!562255))))

(declare-fun subseq!626 (List!27335 List!27335) Bool)

(assert (=> b!1240881 (subseq!626 lt!562255 lt!562255)))

(declare-fun lt!562256 () Unit!41165)

(declare-fun subseqTail!113 (List!27335 List!27335) Unit!41165)

(assert (=> b!1240881 (= lt!562256 (subseqTail!113 lt!562255 lt!562255))))

(assert (=> b!1240881 (subseq!626 acc!846 lt!562255)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79910 List!27335 List!27335 (_ BitVec 32)) Unit!41165)

(assert (=> b!1240881 (= lt!562254 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!562255 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1240881 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1240882 () Bool)

(declare-fun res!827511 () Bool)

(assert (=> b!1240882 (=> (not res!827511) (not e!703318))))

(declare-fun contains!7406 (List!27335 (_ BitVec 64)) Bool)

(assert (=> b!1240882 (= res!827511 (not (contains!7406 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240883 () Bool)

(declare-fun res!827517 () Bool)

(assert (=> b!1240883 (=> (not res!827517) (not e!703318))))

(assert (=> b!1240883 (= res!827517 (not (contains!7406 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240884 () Bool)

(declare-fun res!827515 () Bool)

(assert (=> b!1240884 (=> (not res!827515) (not e!703318))))

(assert (=> b!1240884 (= res!827515 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1240885 () Bool)

(declare-fun res!827510 () Bool)

(assert (=> b!1240885 (=> (not res!827510) (not e!703318))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1240885 (= res!827510 (contains!7406 acc!846 k0!2925))))

(declare-fun b!1240886 () Bool)

(assert (=> b!1240886 (= e!703318 e!703317)))

(declare-fun res!827516 () Bool)

(assert (=> b!1240886 (=> (not res!827516) (not e!703317))))

(assert (=> b!1240886 (= res!827516 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39086 a!3835))))))

(declare-fun lt!562251 () Unit!41165)

(assert (=> b!1240886 (= lt!562251 e!703316)))

(declare-fun c!121553 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240886 (= c!121553 (validKeyInArray!0 (select (arr!38549 a!3835) from!3213)))))

(declare-fun b!1240887 () Bool)

(declare-fun arrayContainsKey!0 (array!79910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240887 (= e!703317 (not (not (arrayContainsKey!0 a!3835 k0!2925 from!3213))))))

(assert (=> b!1240887 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!562253 () Unit!41165)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79910 (_ BitVec 32) (_ BitVec 64) List!27335) Unit!41165)

(assert (=> b!1240887 (= lt!562253 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1240888 () Bool)

(declare-fun res!827513 () Bool)

(assert (=> b!1240888 (=> (not res!827513) (not e!703318))))

(assert (=> b!1240888 (= res!827513 (not (= from!3213 (bvsub (size!39086 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1240889 () Bool)

(declare-fun Unit!41167 () Unit!41165)

(assert (=> b!1240889 (= e!703316 Unit!41167)))

(declare-fun b!1240890 () Bool)

(declare-fun res!827509 () Bool)

(assert (=> b!1240890 (=> (not res!827509) (not e!703318))))

(declare-fun noDuplicate!1987 (List!27335) Bool)

(assert (=> b!1240890 (= res!827509 (noDuplicate!1987 acc!846))))

(assert (= (and start!103528 res!827514) b!1240890))

(assert (= (and b!1240890 res!827509) b!1240882))

(assert (= (and b!1240882 res!827511) b!1240883))

(assert (= (and b!1240883 res!827517) b!1240884))

(assert (= (and b!1240884 res!827515) b!1240885))

(assert (= (and b!1240885 res!827510) b!1240888))

(assert (= (and b!1240888 res!827513) b!1240886))

(assert (= (and b!1240886 c!121553) b!1240881))

(assert (= (and b!1240886 (not c!121553)) b!1240889))

(assert (= (and b!1240886 res!827516) b!1240880))

(assert (= (and b!1240880 res!827512) b!1240887))

(declare-fun m!1144631 () Bool)

(assert (=> b!1240880 m!1144631))

(declare-fun m!1144633 () Bool)

(assert (=> b!1240881 m!1144633))

(declare-fun m!1144635 () Bool)

(assert (=> b!1240881 m!1144635))

(declare-fun m!1144637 () Bool)

(assert (=> b!1240881 m!1144637))

(declare-fun m!1144639 () Bool)

(assert (=> b!1240881 m!1144639))

(declare-fun m!1144641 () Bool)

(assert (=> b!1240881 m!1144641))

(declare-fun m!1144643 () Bool)

(assert (=> b!1240881 m!1144643))

(assert (=> b!1240881 m!1144631))

(declare-fun m!1144645 () Bool)

(assert (=> b!1240882 m!1144645))

(assert (=> b!1240886 m!1144641))

(assert (=> b!1240886 m!1144641))

(declare-fun m!1144647 () Bool)

(assert (=> b!1240886 m!1144647))

(declare-fun m!1144649 () Bool)

(assert (=> start!103528 m!1144649))

(declare-fun m!1144651 () Bool)

(assert (=> b!1240884 m!1144651))

(declare-fun m!1144653 () Bool)

(assert (=> b!1240890 m!1144653))

(declare-fun m!1144655 () Bool)

(assert (=> b!1240887 m!1144655))

(declare-fun m!1144657 () Bool)

(assert (=> b!1240887 m!1144657))

(declare-fun m!1144659 () Bool)

(assert (=> b!1240887 m!1144659))

(declare-fun m!1144661 () Bool)

(assert (=> b!1240883 m!1144661))

(declare-fun m!1144663 () Bool)

(assert (=> b!1240885 m!1144663))

(check-sat (not b!1240887) (not b!1240880) (not b!1240881) (not b!1240885) (not start!103528) (not b!1240883) (not b!1240884) (not b!1240890) (not b!1240882) (not b!1240886))
(check-sat)
(get-model)

(declare-fun b!1240967 () Bool)

(declare-fun e!703352 () Bool)

(assert (=> b!1240967 (= e!703352 (contains!7406 acc!846 (select (arr!38549 a!3835) from!3213)))))

(declare-fun bm!61164 () Bool)

(declare-fun call!61167 () Bool)

(declare-fun c!121562 () Bool)

(assert (=> bm!61164 (= call!61167 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121562 (Cons!27331 (select (arr!38549 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1240968 () Bool)

(declare-fun e!703353 () Bool)

(assert (=> b!1240968 (= e!703353 call!61167)))

(declare-fun b!1240969 () Bool)

(declare-fun e!703354 () Bool)

(assert (=> b!1240969 (= e!703354 e!703353)))

(assert (=> b!1240969 (= c!121562 (validKeyInArray!0 (select (arr!38549 a!3835) from!3213)))))

(declare-fun d!136509 () Bool)

(declare-fun res!827579 () Bool)

(declare-fun e!703355 () Bool)

(assert (=> d!136509 (=> res!827579 e!703355)))

(assert (=> d!136509 (= res!827579 (bvsge from!3213 (size!39086 a!3835)))))

(assert (=> d!136509 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!703355)))

(declare-fun b!1240970 () Bool)

(assert (=> b!1240970 (= e!703353 call!61167)))

(declare-fun b!1240971 () Bool)

(assert (=> b!1240971 (= e!703355 e!703354)))

(declare-fun res!827580 () Bool)

(assert (=> b!1240971 (=> (not res!827580) (not e!703354))))

(assert (=> b!1240971 (= res!827580 (not e!703352))))

(declare-fun res!827578 () Bool)

(assert (=> b!1240971 (=> (not res!827578) (not e!703352))))

(assert (=> b!1240971 (= res!827578 (validKeyInArray!0 (select (arr!38549 a!3835) from!3213)))))

(assert (= (and d!136509 (not res!827579)) b!1240971))

(assert (= (and b!1240971 res!827578) b!1240967))

(assert (= (and b!1240971 res!827580) b!1240969))

(assert (= (and b!1240969 c!121562) b!1240970))

(assert (= (and b!1240969 (not c!121562)) b!1240968))

(assert (= (or b!1240970 b!1240968) bm!61164))

(assert (=> b!1240967 m!1144641))

(assert (=> b!1240967 m!1144641))

(declare-fun m!1144733 () Bool)

(assert (=> b!1240967 m!1144733))

(assert (=> bm!61164 m!1144641))

(declare-fun m!1144735 () Bool)

(assert (=> bm!61164 m!1144735))

(assert (=> b!1240969 m!1144641))

(assert (=> b!1240969 m!1144641))

(assert (=> b!1240969 m!1144647))

(assert (=> b!1240971 m!1144641))

(assert (=> b!1240971 m!1144641))

(assert (=> b!1240971 m!1144647))

(assert (=> b!1240884 d!136509))

(declare-fun d!136511 () Bool)

(declare-fun lt!562295 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!595 (List!27335) (InoxSet (_ BitVec 64)))

(assert (=> d!136511 (= lt!562295 (select (content!595 acc!846) k0!2925))))

(declare-fun e!703360 () Bool)

(assert (=> d!136511 (= lt!562295 e!703360)))

(declare-fun res!827586 () Bool)

(assert (=> d!136511 (=> (not res!827586) (not e!703360))))

(get-info :version)

(assert (=> d!136511 (= res!827586 ((_ is Cons!27331) acc!846))))

(assert (=> d!136511 (= (contains!7406 acc!846 k0!2925) lt!562295)))

(declare-fun b!1240976 () Bool)

(declare-fun e!703361 () Bool)

(assert (=> b!1240976 (= e!703360 e!703361)))

(declare-fun res!827585 () Bool)

(assert (=> b!1240976 (=> res!827585 e!703361)))

(assert (=> b!1240976 (= res!827585 (= (h!28549 acc!846) k0!2925))))

(declare-fun b!1240977 () Bool)

(assert (=> b!1240977 (= e!703361 (contains!7406 (t!40790 acc!846) k0!2925))))

(assert (= (and d!136511 res!827586) b!1240976))

(assert (= (and b!1240976 (not res!827585)) b!1240977))

(declare-fun m!1144737 () Bool)

(assert (=> d!136511 m!1144737))

(declare-fun m!1144739 () Bool)

(assert (=> d!136511 m!1144739))

(declare-fun m!1144741 () Bool)

(assert (=> b!1240977 m!1144741))

(assert (=> b!1240885 d!136511))

(declare-fun d!136513 () Bool)

(declare-fun res!827591 () Bool)

(declare-fun e!703366 () Bool)

(assert (=> d!136513 (=> res!827591 e!703366)))

(assert (=> d!136513 (= res!827591 ((_ is Nil!27332) acc!846))))

(assert (=> d!136513 (= (noDuplicate!1987 acc!846) e!703366)))

(declare-fun b!1240982 () Bool)

(declare-fun e!703367 () Bool)

(assert (=> b!1240982 (= e!703366 e!703367)))

(declare-fun res!827592 () Bool)

(assert (=> b!1240982 (=> (not res!827592) (not e!703367))))

(assert (=> b!1240982 (= res!827592 (not (contains!7406 (t!40790 acc!846) (h!28549 acc!846))))))

(declare-fun b!1240983 () Bool)

(assert (=> b!1240983 (= e!703367 (noDuplicate!1987 (t!40790 acc!846)))))

(assert (= (and d!136513 (not res!827591)) b!1240982))

(assert (= (and b!1240982 res!827592) b!1240983))

(declare-fun m!1144743 () Bool)

(assert (=> b!1240982 m!1144743))

(declare-fun m!1144745 () Bool)

(assert (=> b!1240983 m!1144745))

(assert (=> b!1240890 d!136513))

(declare-fun b!1240984 () Bool)

(declare-fun e!703368 () Bool)

(assert (=> b!1240984 (= e!703368 (contains!7406 acc!846 (select (arr!38549 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun c!121563 () Bool)

(declare-fun bm!61165 () Bool)

(declare-fun call!61168 () Bool)

(assert (=> bm!61165 (= call!61168 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121563 (Cons!27331 (select (arr!38549 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(declare-fun b!1240985 () Bool)

(declare-fun e!703369 () Bool)

(assert (=> b!1240985 (= e!703369 call!61168)))

(declare-fun b!1240986 () Bool)

(declare-fun e!703370 () Bool)

(assert (=> b!1240986 (= e!703370 e!703369)))

(assert (=> b!1240986 (= c!121563 (validKeyInArray!0 (select (arr!38549 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun d!136517 () Bool)

(declare-fun res!827594 () Bool)

(declare-fun e!703371 () Bool)

(assert (=> d!136517 (=> res!827594 e!703371)))

(assert (=> d!136517 (= res!827594 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39086 a!3835)))))

(assert (=> d!136517 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!703371)))

(declare-fun b!1240987 () Bool)

(assert (=> b!1240987 (= e!703369 call!61168)))

(declare-fun b!1240988 () Bool)

(assert (=> b!1240988 (= e!703371 e!703370)))

(declare-fun res!827595 () Bool)

(assert (=> b!1240988 (=> (not res!827595) (not e!703370))))

(assert (=> b!1240988 (= res!827595 (not e!703368))))

(declare-fun res!827593 () Bool)

(assert (=> b!1240988 (=> (not res!827593) (not e!703368))))

(assert (=> b!1240988 (= res!827593 (validKeyInArray!0 (select (arr!38549 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(assert (= (and d!136517 (not res!827594)) b!1240988))

(assert (= (and b!1240988 res!827593) b!1240984))

(assert (= (and b!1240988 res!827595) b!1240986))

(assert (= (and b!1240986 c!121563) b!1240987))

(assert (= (and b!1240986 (not c!121563)) b!1240985))

(assert (= (or b!1240987 b!1240985) bm!61165))

(declare-fun m!1144747 () Bool)

(assert (=> b!1240984 m!1144747))

(assert (=> b!1240984 m!1144747))

(declare-fun m!1144749 () Bool)

(assert (=> b!1240984 m!1144749))

(assert (=> bm!61165 m!1144747))

(declare-fun m!1144751 () Bool)

(assert (=> bm!61165 m!1144751))

(assert (=> b!1240986 m!1144747))

(assert (=> b!1240986 m!1144747))

(declare-fun m!1144753 () Bool)

(assert (=> b!1240986 m!1144753))

(assert (=> b!1240988 m!1144747))

(assert (=> b!1240988 m!1144747))

(assert (=> b!1240988 m!1144753))

(assert (=> b!1240880 d!136517))

(assert (=> b!1240881 d!136517))

(declare-fun b!1241006 () Bool)

(declare-fun e!703389 () Bool)

(assert (=> b!1241006 (= e!703389 (subseq!626 acc!846 (t!40790 lt!562255)))))

(declare-fun b!1241004 () Bool)

(declare-fun e!703387 () Bool)

(assert (=> b!1241004 (= e!703387 e!703389)))

(declare-fun res!827610 () Bool)

(assert (=> b!1241004 (=> res!827610 e!703389)))

(declare-fun e!703386 () Bool)

(assert (=> b!1241004 (= res!827610 e!703386)))

(declare-fun res!827612 () Bool)

(assert (=> b!1241004 (=> (not res!827612) (not e!703386))))

(assert (=> b!1241004 (= res!827612 (= (h!28549 acc!846) (h!28549 lt!562255)))))

(declare-fun b!1241005 () Bool)

(assert (=> b!1241005 (= e!703386 (subseq!626 (t!40790 acc!846) (t!40790 lt!562255)))))

(declare-fun d!136519 () Bool)

(declare-fun res!827611 () Bool)

(declare-fun e!703388 () Bool)

(assert (=> d!136519 (=> res!827611 e!703388)))

(assert (=> d!136519 (= res!827611 ((_ is Nil!27332) acc!846))))

(assert (=> d!136519 (= (subseq!626 acc!846 lt!562255) e!703388)))

(declare-fun b!1241003 () Bool)

(assert (=> b!1241003 (= e!703388 e!703387)))

(declare-fun res!827613 () Bool)

(assert (=> b!1241003 (=> (not res!827613) (not e!703387))))

(assert (=> b!1241003 (= res!827613 ((_ is Cons!27331) lt!562255))))

(assert (= (and d!136519 (not res!827611)) b!1241003))

(assert (= (and b!1241003 res!827613) b!1241004))

(assert (= (and b!1241004 res!827612) b!1241005))

(assert (= (and b!1241004 (not res!827610)) b!1241006))

(declare-fun m!1144761 () Bool)

(assert (=> b!1241006 m!1144761))

(declare-fun m!1144763 () Bool)

(assert (=> b!1241005 m!1144763))

(assert (=> b!1240881 d!136519))

(declare-fun b!1241016 () Bool)

(declare-fun e!703399 () Bool)

(assert (=> b!1241016 (= e!703399 (subseq!626 lt!562255 (t!40790 lt!562255)))))

(declare-fun b!1241014 () Bool)

(declare-fun e!703397 () Bool)

(assert (=> b!1241014 (= e!703397 e!703399)))

(declare-fun res!827620 () Bool)

(assert (=> b!1241014 (=> res!827620 e!703399)))

(declare-fun e!703396 () Bool)

(assert (=> b!1241014 (= res!827620 e!703396)))

(declare-fun res!827622 () Bool)

(assert (=> b!1241014 (=> (not res!827622) (not e!703396))))

(assert (=> b!1241014 (= res!827622 (= (h!28549 lt!562255) (h!28549 lt!562255)))))

(declare-fun b!1241015 () Bool)

(assert (=> b!1241015 (= e!703396 (subseq!626 (t!40790 lt!562255) (t!40790 lt!562255)))))

(declare-fun d!136523 () Bool)

(declare-fun res!827621 () Bool)

(declare-fun e!703398 () Bool)

(assert (=> d!136523 (=> res!827621 e!703398)))

(assert (=> d!136523 (= res!827621 ((_ is Nil!27332) lt!562255))))

(assert (=> d!136523 (= (subseq!626 lt!562255 lt!562255) e!703398)))

(declare-fun b!1241013 () Bool)

(assert (=> b!1241013 (= e!703398 e!703397)))

(declare-fun res!827623 () Bool)

(assert (=> b!1241013 (=> (not res!827623) (not e!703397))))

(assert (=> b!1241013 (= res!827623 ((_ is Cons!27331) lt!562255))))

(assert (= (and d!136523 (not res!827621)) b!1241013))

(assert (= (and b!1241013 res!827623) b!1241014))

(assert (= (and b!1241014 res!827622) b!1241015))

(assert (= (and b!1241014 (not res!827620)) b!1241016))

(declare-fun m!1144765 () Bool)

(assert (=> b!1241016 m!1144765))

(declare-fun m!1144767 () Bool)

(assert (=> b!1241015 m!1144767))

(assert (=> b!1240881 d!136523))

(declare-fun b!1241064 () Bool)

(declare-fun e!703441 () Unit!41165)

(declare-fun Unit!41174 () Unit!41165)

(assert (=> b!1241064 (= e!703441 Unit!41174)))

(declare-fun b!1241065 () Bool)

(declare-fun e!703438 () Unit!41165)

(declare-fun Unit!41175 () Unit!41165)

(assert (=> b!1241065 (= e!703438 Unit!41175)))

(declare-fun b!1241066 () Bool)

(declare-fun e!703439 () Bool)

(assert (=> b!1241066 (= e!703439 (subseq!626 lt!562255 lt!562255))))

(declare-fun b!1241067 () Bool)

(declare-fun call!61174 () Unit!41165)

(assert (=> b!1241067 (= e!703438 call!61174)))

(declare-fun bm!61171 () Bool)

(declare-fun c!121575 () Bool)

(assert (=> bm!61171 (= call!61174 (subseqTail!113 (ite c!121575 lt!562255 (t!40790 lt!562255)) (t!40790 lt!562255)))))

(declare-fun b!1241068 () Bool)

(declare-fun e!703440 () Unit!41165)

(assert (=> b!1241068 (= e!703440 call!61174)))

(declare-fun d!136525 () Bool)

(declare-fun tail!171 (List!27335) List!27335)

(assert (=> d!136525 (subseq!626 (tail!171 lt!562255) lt!562255)))

(declare-fun lt!562303 () Unit!41165)

(assert (=> d!136525 (= lt!562303 e!703441)))

(declare-fun c!121573 () Bool)

(assert (=> d!136525 (= c!121573 (and ((_ is Cons!27331) lt!562255) ((_ is Cons!27331) lt!562255)))))

(assert (=> d!136525 e!703439))

(declare-fun res!827653 () Bool)

(assert (=> d!136525 (=> (not res!827653) (not e!703439))))

(declare-fun isEmpty!1023 (List!27335) Bool)

(assert (=> d!136525 (= res!827653 (not (isEmpty!1023 lt!562255)))))

(assert (=> d!136525 (= (subseqTail!113 lt!562255 lt!562255) lt!562303)))

(declare-fun b!1241069 () Bool)

(assert (=> b!1241069 (= e!703441 e!703440)))

(assert (=> b!1241069 (= c!121575 (subseq!626 lt!562255 (t!40790 lt!562255)))))

(declare-fun b!1241070 () Bool)

(declare-fun c!121574 () Bool)

(assert (=> b!1241070 (= c!121574 (not (isEmpty!1023 (t!40790 lt!562255))))))

(assert (=> b!1241070 (= e!703440 e!703438)))

(assert (= (and d!136525 res!827653) b!1241066))

(assert (= (and d!136525 c!121573) b!1241069))

(assert (= (and d!136525 (not c!121573)) b!1241064))

(assert (= (and b!1241069 c!121575) b!1241068))

(assert (= (and b!1241069 (not c!121575)) b!1241070))

(assert (= (and b!1241070 c!121574) b!1241067))

(assert (= (and b!1241070 (not c!121574)) b!1241065))

(assert (= (or b!1241068 b!1241067) bm!61171))

(assert (=> b!1241069 m!1144765))

(assert (=> b!1241066 m!1144639))

(declare-fun m!1144791 () Bool)

(assert (=> bm!61171 m!1144791))

(declare-fun m!1144793 () Bool)

(assert (=> b!1241070 m!1144793))

(declare-fun m!1144795 () Bool)

(assert (=> d!136525 m!1144795))

(assert (=> d!136525 m!1144795))

(declare-fun m!1144797 () Bool)

(assert (=> d!136525 m!1144797))

(declare-fun m!1144799 () Bool)

(assert (=> d!136525 m!1144799))

(assert (=> b!1240881 d!136525))

(declare-fun d!136541 () Bool)

(assert (=> d!136541 (subseq!626 lt!562255 lt!562255)))

(declare-fun lt!562310 () Unit!41165)

(declare-fun choose!36 (List!27335) Unit!41165)

(assert (=> d!136541 (= lt!562310 (choose!36 lt!562255))))

(assert (=> d!136541 (= (lemmaListSubSeqRefl!0 lt!562255) lt!562310)))

(declare-fun bs!34876 () Bool)

(assert (= bs!34876 d!136541))

(assert (=> bs!34876 m!1144639))

(declare-fun m!1144805 () Bool)

(assert (=> bs!34876 m!1144805))

(assert (=> b!1240881 d!136541))

(declare-fun d!136547 () Bool)

(assert (=> d!136547 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!562316 () Unit!41165)

(declare-fun choose!80 (array!79910 List!27335 List!27335 (_ BitVec 32)) Unit!41165)

(assert (=> d!136547 (= lt!562316 (choose!80 a!3835 lt!562255 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!136547 (bvslt (size!39086 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136547 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!562255 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!562316)))

(declare-fun bs!34878 () Bool)

(assert (= bs!34878 d!136547))

(assert (=> bs!34878 m!1144631))

(declare-fun m!1144809 () Bool)

(assert (=> bs!34878 m!1144809))

(assert (=> b!1240881 d!136547))

(declare-fun d!136551 () Bool)

(assert (=> d!136551 (= (validKeyInArray!0 (select (arr!38549 a!3835) from!3213)) (and (not (= (select (arr!38549 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38549 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1240886 d!136551))

(declare-fun d!136553 () Bool)

(declare-fun res!827667 () Bool)

(declare-fun e!703458 () Bool)

(assert (=> d!136553 (=> res!827667 e!703458)))

(assert (=> d!136553 (= res!827667 (= (select (arr!38549 a!3835) from!3213) k0!2925))))

(assert (=> d!136553 (= (arrayContainsKey!0 a!3835 k0!2925 from!3213) e!703458)))

(declare-fun b!1241090 () Bool)

(declare-fun e!703459 () Bool)

(assert (=> b!1241090 (= e!703458 e!703459)))

(declare-fun res!827668 () Bool)

(assert (=> b!1241090 (=> (not res!827668) (not e!703459))))

(assert (=> b!1241090 (= res!827668 (bvslt (bvadd from!3213 #b00000000000000000000000000000001) (size!39086 a!3835)))))

(declare-fun b!1241091 () Bool)

(assert (=> b!1241091 (= e!703459 (arrayContainsKey!0 a!3835 k0!2925 (bvadd from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136553 (not res!827667)) b!1241090))

(assert (= (and b!1241090 res!827668) b!1241091))

(assert (=> d!136553 m!1144641))

(declare-fun m!1144817 () Bool)

(assert (=> b!1241091 m!1144817))

(assert (=> b!1240887 d!136553))

(declare-fun d!136555 () Bool)

(declare-fun res!827669 () Bool)

(declare-fun e!703460 () Bool)

(assert (=> d!136555 (=> res!827669 e!703460)))

(assert (=> d!136555 (= res!827669 (= (select (arr!38549 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) k0!2925))))

(assert (=> d!136555 (= (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)) e!703460)))

(declare-fun b!1241092 () Bool)

(declare-fun e!703461 () Bool)

(assert (=> b!1241092 (= e!703460 e!703461)))

(declare-fun res!827670 () Bool)

(assert (=> b!1241092 (=> (not res!827670) (not e!703461))))

(assert (=> b!1241092 (= res!827670 (bvslt (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (size!39086 a!3835)))))

(declare-fun b!1241093 () Bool)

(assert (=> b!1241093 (= e!703461 (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136555 (not res!827669)) b!1241092))

(assert (= (and b!1241092 res!827670) b!1241093))

(assert (=> d!136555 m!1144747))

(declare-fun m!1144819 () Bool)

(assert (=> b!1241093 m!1144819))

(assert (=> b!1240887 d!136555))

(declare-fun d!136559 () Bool)

(assert (=> d!136559 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!562323 () Unit!41165)

(declare-fun choose!68 (array!79910 (_ BitVec 32) (_ BitVec 64) List!27335) Unit!41165)

(assert (=> d!136559 (= lt!562323 (choose!68 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(assert (=> d!136559 (bvslt (size!39086 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136559 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846) lt!562323)))

(declare-fun bs!34879 () Bool)

(assert (= bs!34879 d!136559))

(assert (=> bs!34879 m!1144657))

(declare-fun m!1144821 () Bool)

(assert (=> bs!34879 m!1144821))

(assert (=> b!1240887 d!136559))

(declare-fun d!136561 () Bool)

(assert (=> d!136561 (= (array_inv!29487 a!3835) (bvsge (size!39086 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103528 d!136561))

(declare-fun d!136565 () Bool)

(declare-fun lt!562325 () Bool)

(assert (=> d!136565 (= lt!562325 (select (content!595 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!703476 () Bool)

(assert (=> d!136565 (= lt!562325 e!703476)))

(declare-fun res!827680 () Bool)

(assert (=> d!136565 (=> (not res!827680) (not e!703476))))

(assert (=> d!136565 (= res!827680 ((_ is Cons!27331) acc!846))))

(assert (=> d!136565 (= (contains!7406 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562325)))

(declare-fun b!1241114 () Bool)

(declare-fun e!703477 () Bool)

(assert (=> b!1241114 (= e!703476 e!703477)))

(declare-fun res!827679 () Bool)

(assert (=> b!1241114 (=> res!827679 e!703477)))

(assert (=> b!1241114 (= res!827679 (= (h!28549 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1241115 () Bool)

(assert (=> b!1241115 (= e!703477 (contains!7406 (t!40790 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136565 res!827680) b!1241114))

(assert (= (and b!1241114 (not res!827679)) b!1241115))

(assert (=> d!136565 m!1144737))

(declare-fun m!1144829 () Bool)

(assert (=> d!136565 m!1144829))

(declare-fun m!1144831 () Bool)

(assert (=> b!1241115 m!1144831))

(assert (=> b!1240882 d!136565))

(declare-fun d!136567 () Bool)

(declare-fun lt!562326 () Bool)

(assert (=> d!136567 (= lt!562326 (select (content!595 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!703478 () Bool)

(assert (=> d!136567 (= lt!562326 e!703478)))

(declare-fun res!827682 () Bool)

(assert (=> d!136567 (=> (not res!827682) (not e!703478))))

(assert (=> d!136567 (= res!827682 ((_ is Cons!27331) acc!846))))

(assert (=> d!136567 (= (contains!7406 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562326)))

(declare-fun b!1241116 () Bool)

(declare-fun e!703479 () Bool)

(assert (=> b!1241116 (= e!703478 e!703479)))

(declare-fun res!827681 () Bool)

(assert (=> b!1241116 (=> res!827681 e!703479)))

(assert (=> b!1241116 (= res!827681 (= (h!28549 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1241117 () Bool)

(assert (=> b!1241117 (= e!703479 (contains!7406 (t!40790 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136567 res!827682) b!1241116))

(assert (= (and b!1241116 (not res!827681)) b!1241117))

(assert (=> d!136567 m!1144737))

(declare-fun m!1144833 () Bool)

(assert (=> d!136567 m!1144833))

(declare-fun m!1144835 () Bool)

(assert (=> b!1241117 m!1144835))

(assert (=> b!1240883 d!136567))

(check-sat (not b!1241066) (not d!136559) (not b!1241006) (not b!1241016) (not b!1240971) (not bm!61164) (not bm!61171) (not b!1241015) (not b!1241005) (not b!1240977) (not d!136541) (not b!1240983) (not b!1240967) (not d!136567) (not b!1241091) (not b!1240986) (not b!1240969) (not b!1240984) (not b!1241069) (not b!1241093) (not bm!61165) (not d!136525) (not b!1241117) (not b!1241070) (not d!136511) (not d!136565) (not d!136547) (not b!1240988) (not b!1241115) (not b!1240982))
(check-sat)
