; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106782 () Bool)

(assert start!106782)

(declare-fun b!1267720 () Bool)

(declare-fun e!722150 () Bool)

(declare-fun tp_is_empty!32533 () Bool)

(declare-fun tp!96431 () Bool)

(assert (=> b!1267720 (= e!722150 (and tp_is_empty!32533 tp!96431))))

(declare-fun res!843656 () Bool)

(declare-fun e!722151 () Bool)

(assert (=> start!106782 (=> (not res!843656) (not e!722151))))

(declare-datatypes ((B!2000 0))(
  ( (B!2001 (val!16335 Int)) )
))
(declare-datatypes ((tuple2!21198 0))(
  ( (tuple2!21199 (_1!10610 (_ BitVec 64)) (_2!10610 B!2000)) )
))
(declare-datatypes ((List!28363 0))(
  ( (Nil!28360) (Cons!28359 (h!29577 tuple2!21198) (t!41879 List!28363)) )
))
(declare-fun l!706 () List!28363)

(declare-fun isStrictlySorted!790 (List!28363) Bool)

(assert (=> start!106782 (= res!843656 (isStrictlySorted!790 l!706))))

(assert (=> start!106782 e!722151))

(assert (=> start!106782 e!722150))

(assert (=> start!106782 true))

(assert (=> start!106782 tp_is_empty!32533))

(declare-fun b!1267717 () Bool)

(declare-fun res!843655 () Bool)

(assert (=> b!1267717 (=> (not res!843655) (not e!722151))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!661 (List!28363 (_ BitVec 64)) Bool)

(assert (=> b!1267717 (= res!843655 (not (containsKey!661 l!706 key1!31)))))

(declare-fun v1!26 () B!2000)

(declare-fun b!1267719 () Bool)

(declare-fun removeStrictlySorted!157 (List!28363 (_ BitVec 64)) List!28363)

(declare-fun insertStrictlySorted!469 (List!28363 (_ BitVec 64) B!2000) List!28363)

(assert (=> b!1267719 (= e!722151 (not (= (removeStrictlySorted!157 (insertStrictlySorted!469 l!706 key1!31 v1!26) key1!31) l!706)))))

(declare-fun b!1267718 () Bool)

(declare-fun res!843654 () Bool)

(assert (=> b!1267718 (=> (not res!843654) (not e!722151))))

(get-info :version)

(assert (=> b!1267718 (= res!843654 (not ((_ is Cons!28359) l!706)))))

(assert (= (and start!106782 res!843656) b!1267717))

(assert (= (and b!1267717 res!843655) b!1267718))

(assert (= (and b!1267718 res!843654) b!1267719))

(assert (= (and start!106782 ((_ is Cons!28359) l!706)) b!1267720))

(declare-fun m!1167787 () Bool)

(assert (=> start!106782 m!1167787))

(declare-fun m!1167789 () Bool)

(assert (=> b!1267717 m!1167789))

(declare-fun m!1167791 () Bool)

(assert (=> b!1267719 m!1167791))

(assert (=> b!1267719 m!1167791))

(declare-fun m!1167793 () Bool)

(assert (=> b!1267719 m!1167793))

(check-sat tp_is_empty!32533 (not b!1267717) (not start!106782) (not b!1267719) (not b!1267720))
(check-sat)
(get-model)

(declare-fun e!722183 () List!28363)

(declare-fun b!1267775 () Bool)

(declare-fun $colon$colon!643 (List!28363 tuple2!21198) List!28363)

(assert (=> b!1267775 (= e!722183 ($colon$colon!643 (removeStrictlySorted!157 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) (h!29577 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(declare-fun d!139667 () Bool)

(declare-fun e!722182 () Bool)

(assert (=> d!139667 e!722182))

(declare-fun res!843681 () Bool)

(assert (=> d!139667 (=> (not res!843681) (not e!722182))))

(declare-fun lt!574625 () List!28363)

(assert (=> d!139667 (= res!843681 (isStrictlySorted!790 lt!574625))))

(declare-fun e!722184 () List!28363)

(assert (=> d!139667 (= lt!574625 e!722184)))

(declare-fun c!123850 () Bool)

(assert (=> d!139667 (= c!123850 (and ((_ is Cons!28359) (insertStrictlySorted!469 l!706 key1!31 v1!26)) (= (_1!10610 (h!29577 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139667 (isStrictlySorted!790 (insertStrictlySorted!469 l!706 key1!31 v1!26))))

(assert (=> d!139667 (= (removeStrictlySorted!157 (insertStrictlySorted!469 l!706 key1!31 v1!26) key1!31) lt!574625)))

(declare-fun b!1267776 () Bool)

(assert (=> b!1267776 (= e!722183 Nil!28360)))

(declare-fun b!1267777 () Bool)

(assert (=> b!1267777 (= e!722184 e!722183)))

(declare-fun c!123849 () Bool)

(assert (=> b!1267777 (= c!123849 (and ((_ is Cons!28359) (insertStrictlySorted!469 l!706 key1!31 v1!26)) (not (= (_1!10610 (h!29577 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31))))))

(declare-fun b!1267778 () Bool)

(assert (=> b!1267778 (= e!722182 (not (containsKey!661 lt!574625 key1!31)))))

(declare-fun b!1267779 () Bool)

(assert (=> b!1267779 (= e!722184 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))

(assert (= (and d!139667 c!123850) b!1267779))

(assert (= (and d!139667 (not c!123850)) b!1267777))

(assert (= (and b!1267777 c!123849) b!1267775))

(assert (= (and b!1267777 (not c!123849)) b!1267776))

(assert (= (and d!139667 res!843681) b!1267778))

(declare-fun m!1167811 () Bool)

(assert (=> b!1267775 m!1167811))

(assert (=> b!1267775 m!1167811))

(declare-fun m!1167813 () Bool)

(assert (=> b!1267775 m!1167813))

(declare-fun m!1167815 () Bool)

(assert (=> d!139667 m!1167815))

(assert (=> d!139667 m!1167791))

(declare-fun m!1167817 () Bool)

(assert (=> d!139667 m!1167817))

(declare-fun m!1167819 () Bool)

(assert (=> b!1267778 m!1167819))

(assert (=> b!1267719 d!139667))

(declare-fun b!1267850 () Bool)

(declare-fun res!843697 () Bool)

(declare-fun e!722222 () Bool)

(assert (=> b!1267850 (=> (not res!843697) (not e!722222))))

(declare-fun lt!574634 () List!28363)

(assert (=> b!1267850 (= res!843697 (containsKey!661 lt!574634 key1!31))))

(declare-fun b!1267851 () Bool)

(declare-fun e!722223 () List!28363)

(declare-fun call!62552 () List!28363)

(assert (=> b!1267851 (= e!722223 call!62552)))

(declare-fun c!123879 () Bool)

(declare-fun c!123881 () Bool)

(declare-fun e!722221 () List!28363)

(declare-fun b!1267852 () Bool)

(assert (=> b!1267852 (= e!722221 (ite c!123879 (t!41879 l!706) (ite c!123881 (Cons!28359 (h!29577 l!706) (t!41879 l!706)) Nil!28360)))))

(declare-fun b!1267853 () Bool)

(declare-fun e!722225 () List!28363)

(declare-fun call!62551 () List!28363)

(assert (=> b!1267853 (= e!722225 call!62551)))

(declare-fun b!1267854 () Bool)

(declare-fun e!722224 () List!28363)

(declare-fun call!62553 () List!28363)

(assert (=> b!1267854 (= e!722224 call!62553)))

(declare-fun b!1267855 () Bool)

(assert (=> b!1267855 (= c!123881 (and ((_ is Cons!28359) l!706) (bvsgt (_1!10610 (h!29577 l!706)) key1!31)))))

(assert (=> b!1267855 (= e!722223 e!722224)))

(declare-fun bm!62548 () Bool)

(assert (=> bm!62548 (= call!62553 call!62552)))

(declare-fun b!1267857 () Bool)

(assert (=> b!1267857 (= e!722225 e!722223)))

(assert (=> b!1267857 (= c!123879 (and ((_ is Cons!28359) l!706) (= (_1!10610 (h!29577 l!706)) key1!31)))))

(declare-fun bm!62549 () Bool)

(assert (=> bm!62549 (= call!62552 call!62551)))

(declare-fun b!1267858 () Bool)

(assert (=> b!1267858 (= e!722221 (insertStrictlySorted!469 (t!41879 l!706) key1!31 v1!26))))

(declare-fun c!123882 () Bool)

(declare-fun bm!62550 () Bool)

(assert (=> bm!62550 (= call!62551 ($colon$colon!643 e!722221 (ite c!123882 (h!29577 l!706) (tuple2!21199 key1!31 v1!26))))))

(declare-fun c!123880 () Bool)

(assert (=> bm!62550 (= c!123880 c!123882)))

(declare-fun b!1267859 () Bool)

(assert (=> b!1267859 (= e!722224 call!62553)))

(declare-fun b!1267856 () Bool)

(declare-fun contains!7668 (List!28363 tuple2!21198) Bool)

(assert (=> b!1267856 (= e!722222 (contains!7668 lt!574634 (tuple2!21199 key1!31 v1!26)))))

(declare-fun d!139673 () Bool)

(assert (=> d!139673 e!722222))

(declare-fun res!843696 () Bool)

(assert (=> d!139673 (=> (not res!843696) (not e!722222))))

(assert (=> d!139673 (= res!843696 (isStrictlySorted!790 lt!574634))))

(assert (=> d!139673 (= lt!574634 e!722225)))

(assert (=> d!139673 (= c!123882 (and ((_ is Cons!28359) l!706) (bvslt (_1!10610 (h!29577 l!706)) key1!31)))))

(assert (=> d!139673 (isStrictlySorted!790 l!706)))

(assert (=> d!139673 (= (insertStrictlySorted!469 l!706 key1!31 v1!26) lt!574634)))

(assert (= (and d!139673 c!123882) b!1267853))

(assert (= (and d!139673 (not c!123882)) b!1267857))

(assert (= (and b!1267857 c!123879) b!1267851))

(assert (= (and b!1267857 (not c!123879)) b!1267855))

(assert (= (and b!1267855 c!123881) b!1267859))

(assert (= (and b!1267855 (not c!123881)) b!1267854))

(assert (= (or b!1267859 b!1267854) bm!62548))

(assert (= (or b!1267851 bm!62548) bm!62549))

(assert (= (or b!1267853 bm!62549) bm!62550))

(assert (= (and bm!62550 c!123880) b!1267858))

(assert (= (and bm!62550 (not c!123880)) b!1267852))

(assert (= (and d!139673 res!843696) b!1267850))

(assert (= (and b!1267850 res!843697) b!1267856))

(declare-fun m!1167841 () Bool)

(assert (=> b!1267856 m!1167841))

(declare-fun m!1167843 () Bool)

(assert (=> b!1267850 m!1167843))

(declare-fun m!1167845 () Bool)

(assert (=> bm!62550 m!1167845))

(declare-fun m!1167847 () Bool)

(assert (=> b!1267858 m!1167847))

(declare-fun m!1167849 () Bool)

(assert (=> d!139673 m!1167849))

(assert (=> d!139673 m!1167787))

(assert (=> b!1267719 d!139673))

(declare-fun d!139679 () Bool)

(declare-fun res!843714 () Bool)

(declare-fun e!722248 () Bool)

(assert (=> d!139679 (=> res!843714 e!722248)))

(assert (=> d!139679 (= res!843714 (or ((_ is Nil!28360) l!706) ((_ is Nil!28360) (t!41879 l!706))))))

(assert (=> d!139679 (= (isStrictlySorted!790 l!706) e!722248)))

(declare-fun b!1267892 () Bool)

(declare-fun e!722249 () Bool)

(assert (=> b!1267892 (= e!722248 e!722249)))

(declare-fun res!843715 () Bool)

(assert (=> b!1267892 (=> (not res!843715) (not e!722249))))

(assert (=> b!1267892 (= res!843715 (bvslt (_1!10610 (h!29577 l!706)) (_1!10610 (h!29577 (t!41879 l!706)))))))

(declare-fun b!1267893 () Bool)

(assert (=> b!1267893 (= e!722249 (isStrictlySorted!790 (t!41879 l!706)))))

(assert (= (and d!139679 (not res!843714)) b!1267892))

(assert (= (and b!1267892 res!843715) b!1267893))

(declare-fun m!1167871 () Bool)

(assert (=> b!1267893 m!1167871))

(assert (=> start!106782 d!139679))

(declare-fun d!139685 () Bool)

(declare-fun res!843732 () Bool)

(declare-fun e!722266 () Bool)

(assert (=> d!139685 (=> res!843732 e!722266)))

(assert (=> d!139685 (= res!843732 (and ((_ is Cons!28359) l!706) (= (_1!10610 (h!29577 l!706)) key1!31)))))

(assert (=> d!139685 (= (containsKey!661 l!706 key1!31) e!722266)))

(declare-fun b!1267910 () Bool)

(declare-fun e!722267 () Bool)

(assert (=> b!1267910 (= e!722266 e!722267)))

(declare-fun res!843733 () Bool)

(assert (=> b!1267910 (=> (not res!843733) (not e!722267))))

(assert (=> b!1267910 (= res!843733 (and (or (not ((_ is Cons!28359) l!706)) (bvsle (_1!10610 (h!29577 l!706)) key1!31)) ((_ is Cons!28359) l!706) (bvslt (_1!10610 (h!29577 l!706)) key1!31)))))

(declare-fun b!1267911 () Bool)

(assert (=> b!1267911 (= e!722267 (containsKey!661 (t!41879 l!706) key1!31))))

(assert (= (and d!139685 (not res!843732)) b!1267910))

(assert (= (and b!1267910 res!843733) b!1267911))

(declare-fun m!1167877 () Bool)

(assert (=> b!1267911 m!1167877))

(assert (=> b!1267717 d!139685))

(declare-fun b!1267928 () Bool)

(declare-fun e!722278 () Bool)

(declare-fun tp!96442 () Bool)

(assert (=> b!1267928 (= e!722278 (and tp_is_empty!32533 tp!96442))))

(assert (=> b!1267720 (= tp!96431 e!722278)))

(assert (= (and b!1267720 ((_ is Cons!28359) (t!41879 l!706))) b!1267928))

(check-sat (not b!1267893) (not bm!62550) (not d!139667) (not b!1267911) (not b!1267850) (not b!1267928) (not b!1267858) (not b!1267856) (not b!1267778) tp_is_empty!32533 (not b!1267775) (not d!139673))
(check-sat)
(get-model)

(declare-fun d!139691 () Bool)

(declare-fun res!843738 () Bool)

(declare-fun e!722281 () Bool)

(assert (=> d!139691 (=> res!843738 e!722281)))

(assert (=> d!139691 (= res!843738 (or ((_ is Nil!28360) lt!574625) ((_ is Nil!28360) (t!41879 lt!574625))))))

(assert (=> d!139691 (= (isStrictlySorted!790 lt!574625) e!722281)))

(declare-fun b!1267931 () Bool)

(declare-fun e!722282 () Bool)

(assert (=> b!1267931 (= e!722281 e!722282)))

(declare-fun res!843739 () Bool)

(assert (=> b!1267931 (=> (not res!843739) (not e!722282))))

(assert (=> b!1267931 (= res!843739 (bvslt (_1!10610 (h!29577 lt!574625)) (_1!10610 (h!29577 (t!41879 lt!574625)))))))

(declare-fun b!1267932 () Bool)

(assert (=> b!1267932 (= e!722282 (isStrictlySorted!790 (t!41879 lt!574625)))))

(assert (= (and d!139691 (not res!843738)) b!1267931))

(assert (= (and b!1267931 res!843739) b!1267932))

(declare-fun m!1167883 () Bool)

(assert (=> b!1267932 m!1167883))

(assert (=> d!139667 d!139691))

(declare-fun d!139693 () Bool)

(declare-fun res!843740 () Bool)

(declare-fun e!722283 () Bool)

(assert (=> d!139693 (=> res!843740 e!722283)))

(assert (=> d!139693 (= res!843740 (or ((_ is Nil!28360) (insertStrictlySorted!469 l!706 key1!31 v1!26)) ((_ is Nil!28360) (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))))

(assert (=> d!139693 (= (isStrictlySorted!790 (insertStrictlySorted!469 l!706 key1!31 v1!26)) e!722283)))

(declare-fun b!1267933 () Bool)

(declare-fun e!722284 () Bool)

(assert (=> b!1267933 (= e!722283 e!722284)))

(declare-fun res!843741 () Bool)

(assert (=> b!1267933 (=> (not res!843741) (not e!722284))))

(assert (=> b!1267933 (= res!843741 (bvslt (_1!10610 (h!29577 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (_1!10610 (h!29577 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))))

(declare-fun b!1267934 () Bool)

(assert (=> b!1267934 (= e!722284 (isStrictlySorted!790 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(assert (= (and d!139693 (not res!843740)) b!1267933))

(assert (= (and b!1267933 res!843741) b!1267934))

(declare-fun m!1167885 () Bool)

(assert (=> b!1267934 m!1167885))

(assert (=> d!139667 d!139693))

(declare-fun d!139695 () Bool)

(assert (=> d!139695 (= ($colon$colon!643 (removeStrictlySorted!157 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) (h!29577 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (Cons!28359 (h!29577 (insertStrictlySorted!469 l!706 key1!31 v1!26)) (removeStrictlySorted!157 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31)))))

(assert (=> b!1267775 d!139695))

(declare-fun e!722286 () List!28363)

(declare-fun b!1267935 () Bool)

(assert (=> b!1267935 (= e!722286 ($colon$colon!643 (removeStrictlySorted!157 (t!41879 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31) (h!29577 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))))

(declare-fun d!139697 () Bool)

(declare-fun e!722285 () Bool)

(assert (=> d!139697 e!722285))

(declare-fun res!843742 () Bool)

(assert (=> d!139697 (=> (not res!843742) (not e!722285))))

(declare-fun lt!574637 () List!28363)

(assert (=> d!139697 (= res!843742 (isStrictlySorted!790 lt!574637))))

(declare-fun e!722287 () List!28363)

(assert (=> d!139697 (= lt!574637 e!722287)))

(declare-fun c!123892 () Bool)

(assert (=> d!139697 (= c!123892 (and ((_ is Cons!28359) (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (= (_1!10610 (h!29577 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)))) key1!31)))))

(assert (=> d!139697 (isStrictlySorted!790 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))

(assert (=> d!139697 (= (removeStrictlySorted!157 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) lt!574637)))

(declare-fun b!1267936 () Bool)

(assert (=> b!1267936 (= e!722286 Nil!28360)))

(declare-fun b!1267937 () Bool)

(assert (=> b!1267937 (= e!722287 e!722286)))

(declare-fun c!123891 () Bool)

(assert (=> b!1267937 (= c!123891 (and ((_ is Cons!28359) (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (not (= (_1!10610 (h!29577 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26)))) key1!31))))))

(declare-fun b!1267938 () Bool)

(assert (=> b!1267938 (= e!722285 (not (containsKey!661 lt!574637 key1!31)))))

(declare-fun b!1267939 () Bool)

(assert (=> b!1267939 (= e!722287 (t!41879 (t!41879 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(assert (= (and d!139697 c!123892) b!1267939))

(assert (= (and d!139697 (not c!123892)) b!1267937))

(assert (= (and b!1267937 c!123891) b!1267935))

(assert (= (and b!1267937 (not c!123891)) b!1267936))

(assert (= (and d!139697 res!843742) b!1267938))

(declare-fun m!1167887 () Bool)

(assert (=> b!1267935 m!1167887))

(assert (=> b!1267935 m!1167887))

(declare-fun m!1167889 () Bool)

(assert (=> b!1267935 m!1167889))

(declare-fun m!1167891 () Bool)

(assert (=> d!139697 m!1167891))

(assert (=> d!139697 m!1167885))

(declare-fun m!1167893 () Bool)

(assert (=> b!1267938 m!1167893))

(assert (=> b!1267775 d!139697))

(declare-fun b!1267940 () Bool)

(declare-fun res!843744 () Bool)

(declare-fun e!722289 () Bool)

(assert (=> b!1267940 (=> (not res!843744) (not e!722289))))

(declare-fun lt!574638 () List!28363)

(assert (=> b!1267940 (= res!843744 (containsKey!661 lt!574638 key1!31))))

(declare-fun b!1267941 () Bool)

(declare-fun e!722290 () List!28363)

(declare-fun call!62561 () List!28363)

(assert (=> b!1267941 (= e!722290 call!62561)))

(declare-fun e!722288 () List!28363)

(declare-fun b!1267942 () Bool)

(declare-fun c!123895 () Bool)

(declare-fun c!123893 () Bool)

(assert (=> b!1267942 (= e!722288 (ite c!123893 (t!41879 (t!41879 l!706)) (ite c!123895 (Cons!28359 (h!29577 (t!41879 l!706)) (t!41879 (t!41879 l!706))) Nil!28360)))))

(declare-fun b!1267943 () Bool)

(declare-fun e!722292 () List!28363)

(declare-fun call!62560 () List!28363)

(assert (=> b!1267943 (= e!722292 call!62560)))

(declare-fun b!1267944 () Bool)

(declare-fun e!722291 () List!28363)

(declare-fun call!62562 () List!28363)

(assert (=> b!1267944 (= e!722291 call!62562)))

(declare-fun b!1267945 () Bool)

(assert (=> b!1267945 (= c!123895 (and ((_ is Cons!28359) (t!41879 l!706)) (bvsgt (_1!10610 (h!29577 (t!41879 l!706))) key1!31)))))

(assert (=> b!1267945 (= e!722290 e!722291)))

(declare-fun bm!62557 () Bool)

(assert (=> bm!62557 (= call!62562 call!62561)))

(declare-fun b!1267947 () Bool)

(assert (=> b!1267947 (= e!722292 e!722290)))

(assert (=> b!1267947 (= c!123893 (and ((_ is Cons!28359) (t!41879 l!706)) (= (_1!10610 (h!29577 (t!41879 l!706))) key1!31)))))

(declare-fun bm!62558 () Bool)

(assert (=> bm!62558 (= call!62561 call!62560)))

(declare-fun b!1267948 () Bool)

(assert (=> b!1267948 (= e!722288 (insertStrictlySorted!469 (t!41879 (t!41879 l!706)) key1!31 v1!26))))

(declare-fun bm!62559 () Bool)

(declare-fun c!123896 () Bool)

(assert (=> bm!62559 (= call!62560 ($colon$colon!643 e!722288 (ite c!123896 (h!29577 (t!41879 l!706)) (tuple2!21199 key1!31 v1!26))))))

(declare-fun c!123894 () Bool)

(assert (=> bm!62559 (= c!123894 c!123896)))

(declare-fun b!1267949 () Bool)

(assert (=> b!1267949 (= e!722291 call!62562)))

(declare-fun b!1267946 () Bool)

(assert (=> b!1267946 (= e!722289 (contains!7668 lt!574638 (tuple2!21199 key1!31 v1!26)))))

(declare-fun d!139699 () Bool)

(assert (=> d!139699 e!722289))

(declare-fun res!843743 () Bool)

(assert (=> d!139699 (=> (not res!843743) (not e!722289))))

(assert (=> d!139699 (= res!843743 (isStrictlySorted!790 lt!574638))))

(assert (=> d!139699 (= lt!574638 e!722292)))

(assert (=> d!139699 (= c!123896 (and ((_ is Cons!28359) (t!41879 l!706)) (bvslt (_1!10610 (h!29577 (t!41879 l!706))) key1!31)))))

(assert (=> d!139699 (isStrictlySorted!790 (t!41879 l!706))))

(assert (=> d!139699 (= (insertStrictlySorted!469 (t!41879 l!706) key1!31 v1!26) lt!574638)))

(assert (= (and d!139699 c!123896) b!1267943))

(assert (= (and d!139699 (not c!123896)) b!1267947))

(assert (= (and b!1267947 c!123893) b!1267941))

(assert (= (and b!1267947 (not c!123893)) b!1267945))

(assert (= (and b!1267945 c!123895) b!1267949))

(assert (= (and b!1267945 (not c!123895)) b!1267944))

(assert (= (or b!1267949 b!1267944) bm!62557))

(assert (= (or b!1267941 bm!62557) bm!62558))

(assert (= (or b!1267943 bm!62558) bm!62559))

(assert (= (and bm!62559 c!123894) b!1267948))

(assert (= (and bm!62559 (not c!123894)) b!1267942))

(assert (= (and d!139699 res!843743) b!1267940))

(assert (= (and b!1267940 res!843744) b!1267946))

(declare-fun m!1167895 () Bool)

(assert (=> b!1267946 m!1167895))

(declare-fun m!1167897 () Bool)

(assert (=> b!1267940 m!1167897))

(declare-fun m!1167899 () Bool)

(assert (=> bm!62559 m!1167899))

(declare-fun m!1167901 () Bool)

(assert (=> b!1267948 m!1167901))

(declare-fun m!1167903 () Bool)

(assert (=> d!139699 m!1167903))

(assert (=> d!139699 m!1167871))

(assert (=> b!1267858 d!139699))

(declare-fun d!139701 () Bool)

(declare-fun res!843745 () Bool)

(declare-fun e!722293 () Bool)

(assert (=> d!139701 (=> res!843745 e!722293)))

(assert (=> d!139701 (= res!843745 (and ((_ is Cons!28359) lt!574634) (= (_1!10610 (h!29577 lt!574634)) key1!31)))))

(assert (=> d!139701 (= (containsKey!661 lt!574634 key1!31) e!722293)))

(declare-fun b!1267950 () Bool)

(declare-fun e!722294 () Bool)

(assert (=> b!1267950 (= e!722293 e!722294)))

(declare-fun res!843746 () Bool)

(assert (=> b!1267950 (=> (not res!843746) (not e!722294))))

(assert (=> b!1267950 (= res!843746 (and (or (not ((_ is Cons!28359) lt!574634)) (bvsle (_1!10610 (h!29577 lt!574634)) key1!31)) ((_ is Cons!28359) lt!574634) (bvslt (_1!10610 (h!29577 lt!574634)) key1!31)))))

(declare-fun b!1267951 () Bool)

(assert (=> b!1267951 (= e!722294 (containsKey!661 (t!41879 lt!574634) key1!31))))

(assert (= (and d!139701 (not res!843745)) b!1267950))

(assert (= (and b!1267950 res!843746) b!1267951))

(declare-fun m!1167905 () Bool)

(assert (=> b!1267951 m!1167905))

(assert (=> b!1267850 d!139701))

(declare-fun d!139703 () Bool)

(assert (=> d!139703 (= ($colon$colon!643 e!722221 (ite c!123882 (h!29577 l!706) (tuple2!21199 key1!31 v1!26))) (Cons!28359 (ite c!123882 (h!29577 l!706) (tuple2!21199 key1!31 v1!26)) e!722221))))

(assert (=> bm!62550 d!139703))

(declare-fun d!139705 () Bool)

(declare-fun res!843747 () Bool)

(declare-fun e!722295 () Bool)

(assert (=> d!139705 (=> res!843747 e!722295)))

(assert (=> d!139705 (= res!843747 (or ((_ is Nil!28360) (t!41879 l!706)) ((_ is Nil!28360) (t!41879 (t!41879 l!706)))))))

(assert (=> d!139705 (= (isStrictlySorted!790 (t!41879 l!706)) e!722295)))

(declare-fun b!1267952 () Bool)

(declare-fun e!722296 () Bool)

(assert (=> b!1267952 (= e!722295 e!722296)))

(declare-fun res!843748 () Bool)

(assert (=> b!1267952 (=> (not res!843748) (not e!722296))))

(assert (=> b!1267952 (= res!843748 (bvslt (_1!10610 (h!29577 (t!41879 l!706))) (_1!10610 (h!29577 (t!41879 (t!41879 l!706))))))))

(declare-fun b!1267953 () Bool)

(assert (=> b!1267953 (= e!722296 (isStrictlySorted!790 (t!41879 (t!41879 l!706))))))

(assert (= (and d!139705 (not res!843747)) b!1267952))

(assert (= (and b!1267952 res!843748) b!1267953))

(declare-fun m!1167907 () Bool)

(assert (=> b!1267953 m!1167907))

(assert (=> b!1267893 d!139705))

(declare-fun d!139707 () Bool)

(declare-fun res!843749 () Bool)

(declare-fun e!722297 () Bool)

(assert (=> d!139707 (=> res!843749 e!722297)))

(assert (=> d!139707 (= res!843749 (or ((_ is Nil!28360) lt!574634) ((_ is Nil!28360) (t!41879 lt!574634))))))

(assert (=> d!139707 (= (isStrictlySorted!790 lt!574634) e!722297)))

(declare-fun b!1267954 () Bool)

(declare-fun e!722298 () Bool)

(assert (=> b!1267954 (= e!722297 e!722298)))

(declare-fun res!843750 () Bool)

(assert (=> b!1267954 (=> (not res!843750) (not e!722298))))

(assert (=> b!1267954 (= res!843750 (bvslt (_1!10610 (h!29577 lt!574634)) (_1!10610 (h!29577 (t!41879 lt!574634)))))))

(declare-fun b!1267955 () Bool)

(assert (=> b!1267955 (= e!722298 (isStrictlySorted!790 (t!41879 lt!574634)))))

(assert (= (and d!139707 (not res!843749)) b!1267954))

(assert (= (and b!1267954 res!843750) b!1267955))

(declare-fun m!1167909 () Bool)

(assert (=> b!1267955 m!1167909))

(assert (=> d!139673 d!139707))

(assert (=> d!139673 d!139679))

(declare-fun d!139709 () Bool)

(declare-fun res!843751 () Bool)

(declare-fun e!722299 () Bool)

(assert (=> d!139709 (=> res!843751 e!722299)))

(assert (=> d!139709 (= res!843751 (and ((_ is Cons!28359) lt!574625) (= (_1!10610 (h!29577 lt!574625)) key1!31)))))

(assert (=> d!139709 (= (containsKey!661 lt!574625 key1!31) e!722299)))

(declare-fun b!1267956 () Bool)

(declare-fun e!722300 () Bool)

(assert (=> b!1267956 (= e!722299 e!722300)))

(declare-fun res!843752 () Bool)

(assert (=> b!1267956 (=> (not res!843752) (not e!722300))))

(assert (=> b!1267956 (= res!843752 (and (or (not ((_ is Cons!28359) lt!574625)) (bvsle (_1!10610 (h!29577 lt!574625)) key1!31)) ((_ is Cons!28359) lt!574625) (bvslt (_1!10610 (h!29577 lt!574625)) key1!31)))))

(declare-fun b!1267957 () Bool)

(assert (=> b!1267957 (= e!722300 (containsKey!661 (t!41879 lt!574625) key1!31))))

(assert (= (and d!139709 (not res!843751)) b!1267956))

(assert (= (and b!1267956 res!843752) b!1267957))

(declare-fun m!1167911 () Bool)

(assert (=> b!1267957 m!1167911))

(assert (=> b!1267778 d!139709))

(declare-fun lt!574641 () Bool)

(declare-fun d!139711 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!636 (List!28363) (InoxSet tuple2!21198))

(assert (=> d!139711 (= lt!574641 (select (content!636 lt!574634) (tuple2!21199 key1!31 v1!26)))))

(declare-fun e!722305 () Bool)

(assert (=> d!139711 (= lt!574641 e!722305)))

(declare-fun res!843758 () Bool)

(assert (=> d!139711 (=> (not res!843758) (not e!722305))))

(assert (=> d!139711 (= res!843758 ((_ is Cons!28359) lt!574634))))

(assert (=> d!139711 (= (contains!7668 lt!574634 (tuple2!21199 key1!31 v1!26)) lt!574641)))

(declare-fun b!1267962 () Bool)

(declare-fun e!722306 () Bool)

(assert (=> b!1267962 (= e!722305 e!722306)))

(declare-fun res!843757 () Bool)

(assert (=> b!1267962 (=> res!843757 e!722306)))

(assert (=> b!1267962 (= res!843757 (= (h!29577 lt!574634) (tuple2!21199 key1!31 v1!26)))))

(declare-fun b!1267963 () Bool)

(assert (=> b!1267963 (= e!722306 (contains!7668 (t!41879 lt!574634) (tuple2!21199 key1!31 v1!26)))))

(assert (= (and d!139711 res!843758) b!1267962))

(assert (= (and b!1267962 (not res!843757)) b!1267963))

(declare-fun m!1167913 () Bool)

(assert (=> d!139711 m!1167913))

(declare-fun m!1167915 () Bool)

(assert (=> d!139711 m!1167915))

(declare-fun m!1167917 () Bool)

(assert (=> b!1267963 m!1167917))

(assert (=> b!1267856 d!139711))

(declare-fun d!139713 () Bool)

(declare-fun res!843759 () Bool)

(declare-fun e!722307 () Bool)

(assert (=> d!139713 (=> res!843759 e!722307)))

(assert (=> d!139713 (= res!843759 (and ((_ is Cons!28359) (t!41879 l!706)) (= (_1!10610 (h!29577 (t!41879 l!706))) key1!31)))))

(assert (=> d!139713 (= (containsKey!661 (t!41879 l!706) key1!31) e!722307)))

(declare-fun b!1267964 () Bool)

(declare-fun e!722308 () Bool)

(assert (=> b!1267964 (= e!722307 e!722308)))

(declare-fun res!843760 () Bool)

(assert (=> b!1267964 (=> (not res!843760) (not e!722308))))

(assert (=> b!1267964 (= res!843760 (and (or (not ((_ is Cons!28359) (t!41879 l!706))) (bvsle (_1!10610 (h!29577 (t!41879 l!706))) key1!31)) ((_ is Cons!28359) (t!41879 l!706)) (bvslt (_1!10610 (h!29577 (t!41879 l!706))) key1!31)))))

(declare-fun b!1267965 () Bool)

(assert (=> b!1267965 (= e!722308 (containsKey!661 (t!41879 (t!41879 l!706)) key1!31))))

(assert (= (and d!139713 (not res!843759)) b!1267964))

(assert (= (and b!1267964 res!843760) b!1267965))

(declare-fun m!1167919 () Bool)

(assert (=> b!1267965 m!1167919))

(assert (=> b!1267911 d!139713))

(declare-fun b!1267966 () Bool)

(declare-fun e!722309 () Bool)

(declare-fun tp!96447 () Bool)

(assert (=> b!1267966 (= e!722309 (and tp_is_empty!32533 tp!96447))))

(assert (=> b!1267928 (= tp!96442 e!722309)))

(assert (= (and b!1267928 ((_ is Cons!28359) (t!41879 (t!41879 l!706)))) b!1267966))

(check-sat (not bm!62559) (not b!1267963) (not b!1267938) (not b!1267940) tp_is_empty!32533 (not b!1267953) (not d!139711) (not d!139699) (not b!1267948) (not b!1267951) (not b!1267932) (not d!139697) (not b!1267955) (not b!1267957) (not b!1267966) (not b!1267946) (not b!1267935) (not b!1267934) (not b!1267965))
(check-sat)
