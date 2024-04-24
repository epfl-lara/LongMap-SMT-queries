; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42850 () Bool)

(assert start!42850)

(declare-fun b_free!12103 () Bool)

(declare-fun b_next!12103 () Bool)

(assert (=> start!42850 (= b_free!12103 (not b_next!12103))))

(declare-fun tp!42397 () Bool)

(declare-fun b_and!20727 () Bool)

(assert (=> start!42850 (= tp!42397 b_and!20727)))

(declare-fun res!284666 () Bool)

(declare-fun e!280114 () Bool)

(assert (=> start!42850 (=> (not res!284666) (not e!280114))))

(declare-datatypes ((B!1052 0))(
  ( (B!1053 (val!6810 Int)) )
))
(declare-datatypes ((tuple2!8916 0))(
  ( (tuple2!8917 (_1!4469 (_ BitVec 64)) (_2!4469 B!1052)) )
))
(declare-datatypes ((List!8962 0))(
  ( (Nil!8959) (Cons!8958 (h!9814 tuple2!8916) (t!15018 List!8962)) )
))
(declare-datatypes ((ListLongMap!7831 0))(
  ( (ListLongMap!7832 (toList!3931 List!8962)) )
))
(declare-fun lm!215 () ListLongMap!7831)

(declare-fun p!166 () Int)

(declare-fun forall!197 (List!8962 Int) Bool)

(assert (=> start!42850 (= res!284666 (forall!197 (toList!3931 lm!215) p!166))))

(assert (=> start!42850 e!280114))

(declare-fun e!280112 () Bool)

(declare-fun inv!15495 (ListLongMap!7831) Bool)

(assert (=> start!42850 (and (inv!15495 lm!215) e!280112)))

(assert (=> start!42850 tp!42397))

(declare-fun tp_is_empty!13525 () Bool)

(assert (=> start!42850 tp_is_empty!13525))

(assert (=> start!42850 true))

(declare-fun b!476818 () Bool)

(declare-fun res!284665 () Bool)

(declare-fun e!280113 () Bool)

(assert (=> b!476818 (=> (not res!284665) (not e!280113))))

(declare-fun isEmpty!607 (ListLongMap!7831) Bool)

(assert (=> b!476818 (= res!284665 (not (isEmpty!607 lm!215)))))

(declare-fun b!476819 () Bool)

(declare-fun e!280111 () Bool)

(assert (=> b!476819 (= e!280113 e!280111)))

(declare-fun res!284664 () Bool)

(assert (=> b!476819 (=> (not res!284664) (not e!280111))))

(declare-fun lt!217354 () ListLongMap!7831)

(assert (=> b!476819 (= res!284664 (forall!197 (toList!3931 lt!217354) p!166))))

(declare-fun tail!125 (ListLongMap!7831) ListLongMap!7831)

(assert (=> b!476819 (= lt!217354 (tail!125 lm!215))))

(declare-fun b!476820 () Bool)

(declare-fun lt!217355 () tuple2!8916)

(declare-fun +!1772 (ListLongMap!7831 tuple2!8916) ListLongMap!7831)

(assert (=> b!476820 (= e!280111 (not (forall!197 (toList!3931 (+!1772 lm!215 lt!217355)) p!166)))))

(assert (=> b!476820 (forall!197 (toList!3931 (+!1772 lt!217354 lt!217355)) p!166)))

(declare-fun b!85 () B!1052)

(declare-fun a!501 () (_ BitVec 64))

(declare-datatypes ((Unit!14006 0))(
  ( (Unit!14007) )
))
(declare-fun lt!217356 () Unit!14006)

(declare-fun addValidProp!20 (ListLongMap!7831 Int (_ BitVec 64) B!1052) Unit!14006)

(assert (=> b!476820 (= lt!217356 (addValidProp!20 lt!217354 p!166 a!501 b!85))))

(declare-fun b!476821 () Bool)

(assert (=> b!476821 (= e!280114 e!280113)))

(declare-fun res!284667 () Bool)

(assert (=> b!476821 (=> (not res!284667) (not e!280113))))

(declare-fun dynLambda!941 (Int tuple2!8916) Bool)

(assert (=> b!476821 (= res!284667 (dynLambda!941 p!166 lt!217355))))

(assert (=> b!476821 (= lt!217355 (tuple2!8917 a!501 b!85))))

(declare-fun b!476822 () Bool)

(declare-fun tp!42396 () Bool)

(assert (=> b!476822 (= e!280112 tp!42396)))

(assert (= (and start!42850 res!284666) b!476821))

(assert (= (and b!476821 res!284667) b!476818))

(assert (= (and b!476818 res!284665) b!476819))

(assert (= (and b!476819 res!284664) b!476820))

(assert (= start!42850 b!476822))

(declare-fun b_lambda!10529 () Bool)

(assert (=> (not b_lambda!10529) (not b!476821)))

(declare-fun t!15017 () Bool)

(declare-fun tb!4013 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15017) tb!4013))

(declare-fun result!7575 () Bool)

(assert (=> tb!4013 (= result!7575 true)))

(assert (=> b!476821 t!15017))

(declare-fun b_and!20729 () Bool)

(assert (= b_and!20727 (and (=> t!15017 result!7575) b_and!20729)))

(declare-fun m!459321 () Bool)

(assert (=> b!476819 m!459321))

(declare-fun m!459323 () Bool)

(assert (=> b!476819 m!459323))

(declare-fun m!459325 () Bool)

(assert (=> b!476820 m!459325))

(declare-fun m!459327 () Bool)

(assert (=> b!476820 m!459327))

(declare-fun m!459329 () Bool)

(assert (=> b!476820 m!459329))

(declare-fun m!459331 () Bool)

(assert (=> b!476820 m!459331))

(declare-fun m!459333 () Bool)

(assert (=> b!476820 m!459333))

(declare-fun m!459335 () Bool)

(assert (=> b!476821 m!459335))

(declare-fun m!459337 () Bool)

(assert (=> b!476818 m!459337))

(declare-fun m!459339 () Bool)

(assert (=> start!42850 m!459339))

(declare-fun m!459341 () Bool)

(assert (=> start!42850 m!459341))

(check-sat (not b!476818) (not b_next!12103) (not b_lambda!10529) (not start!42850) (not b!476822) (not b!476819) b_and!20729 (not b!476820) tp_is_empty!13525)
(check-sat b_and!20729 (not b_next!12103))
(get-model)

(declare-fun b_lambda!10539 () Bool)

(assert (= b_lambda!10529 (or (and start!42850 b_free!12103) b_lambda!10539)))

(check-sat (not b!476818) (not b_next!12103) (not start!42850) (not b!476822) (not b!476819) b_and!20729 (not b_lambda!10539) (not b!476820) tp_is_empty!13525)
(check-sat b_and!20729 (not b_next!12103))
(get-model)

(declare-fun d!75941 () Bool)

(declare-fun res!284702 () Bool)

(declare-fun e!280149 () Bool)

(assert (=> d!75941 (=> res!284702 e!280149)))

(get-info :version)

(assert (=> d!75941 (= res!284702 ((_ is Nil!8959) (toList!3931 lm!215)))))

(assert (=> d!75941 (= (forall!197 (toList!3931 lm!215) p!166) e!280149)))

(declare-fun b!476863 () Bool)

(declare-fun e!280150 () Bool)

(assert (=> b!476863 (= e!280149 e!280150)))

(declare-fun res!284703 () Bool)

(assert (=> b!476863 (=> (not res!284703) (not e!280150))))

(assert (=> b!476863 (= res!284703 (dynLambda!941 p!166 (h!9814 (toList!3931 lm!215))))))

(declare-fun b!476864 () Bool)

(assert (=> b!476864 (= e!280150 (forall!197 (t!15018 (toList!3931 lm!215)) p!166))))

(assert (= (and d!75941 (not res!284702)) b!476863))

(assert (= (and b!476863 res!284703) b!476864))

(declare-fun b_lambda!10543 () Bool)

(assert (=> (not b_lambda!10543) (not b!476863)))

(declare-fun t!15028 () Bool)

(declare-fun tb!4021 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15028) tb!4021))

(declare-fun result!7583 () Bool)

(assert (=> tb!4021 (= result!7583 true)))

(assert (=> b!476863 t!15028))

(declare-fun b_and!20741 () Bool)

(assert (= b_and!20729 (and (=> t!15028 result!7583) b_and!20741)))

(declare-fun m!459393 () Bool)

(assert (=> b!476863 m!459393))

(declare-fun m!459395 () Bool)

(assert (=> b!476864 m!459395))

(assert (=> start!42850 d!75941))

(declare-fun d!75947 () Bool)

(declare-fun isStrictlySorted!375 (List!8962) Bool)

(assert (=> d!75947 (= (inv!15495 lm!215) (isStrictlySorted!375 (toList!3931 lm!215)))))

(declare-fun bs!15176 () Bool)

(assert (= bs!15176 d!75947))

(declare-fun m!459401 () Bool)

(assert (=> bs!15176 m!459401))

(assert (=> start!42850 d!75947))

(declare-fun d!75951 () Bool)

(assert (=> d!75951 (forall!197 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85))) p!166)))

(declare-fun lt!217383 () Unit!14006)

(declare-fun choose!1369 (ListLongMap!7831 Int (_ BitVec 64) B!1052) Unit!14006)

(assert (=> d!75951 (= lt!217383 (choose!1369 lt!217354 p!166 a!501 b!85))))

(declare-fun e!280167 () Bool)

(assert (=> d!75951 e!280167))

(declare-fun res!284720 () Bool)

(assert (=> d!75951 (=> (not res!284720) (not e!280167))))

(assert (=> d!75951 (= res!284720 (forall!197 (toList!3931 lt!217354) p!166))))

(assert (=> d!75951 (= (addValidProp!20 lt!217354 p!166 a!501 b!85) lt!217383)))

(declare-fun b!476884 () Bool)

(assert (=> b!476884 (= e!280167 (dynLambda!941 p!166 (tuple2!8917 a!501 b!85)))))

(assert (= (and d!75951 res!284720) b!476884))

(declare-fun b_lambda!10555 () Bool)

(assert (=> (not b_lambda!10555) (not b!476884)))

(declare-fun t!15040 () Bool)

(declare-fun tb!4033 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15040) tb!4033))

(declare-fun result!7595 () Bool)

(assert (=> tb!4033 (= result!7595 true)))

(assert (=> b!476884 t!15040))

(declare-fun b_and!20753 () Bool)

(assert (= b_and!20741 (and (=> t!15040 result!7595) b_and!20753)))

(declare-fun m!459423 () Bool)

(assert (=> d!75951 m!459423))

(declare-fun m!459429 () Bool)

(assert (=> d!75951 m!459429))

(declare-fun m!459431 () Bool)

(assert (=> d!75951 m!459431))

(assert (=> d!75951 m!459321))

(declare-fun m!459433 () Bool)

(assert (=> b!476884 m!459433))

(assert (=> b!476820 d!75951))

(declare-fun d!75961 () Bool)

(declare-fun res!284723 () Bool)

(declare-fun e!280170 () Bool)

(assert (=> d!75961 (=> res!284723 e!280170)))

(assert (=> d!75961 (= res!284723 ((_ is Nil!8959) (toList!3931 (+!1772 lt!217354 lt!217355))))))

(assert (=> d!75961 (= (forall!197 (toList!3931 (+!1772 lt!217354 lt!217355)) p!166) e!280170)))

(declare-fun b!476887 () Bool)

(declare-fun e!280171 () Bool)

(assert (=> b!476887 (= e!280170 e!280171)))

(declare-fun res!284724 () Bool)

(assert (=> b!476887 (=> (not res!284724) (not e!280171))))

(assert (=> b!476887 (= res!284724 (dynLambda!941 p!166 (h!9814 (toList!3931 (+!1772 lt!217354 lt!217355)))))))

(declare-fun b!476888 () Bool)

(assert (=> b!476888 (= e!280171 (forall!197 (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355))) p!166))))

(assert (= (and d!75961 (not res!284723)) b!476887))

(assert (= (and b!476887 res!284724) b!476888))

(declare-fun b_lambda!10557 () Bool)

(assert (=> (not b_lambda!10557) (not b!476887)))

(declare-fun t!15042 () Bool)

(declare-fun tb!4035 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15042) tb!4035))

(declare-fun result!7597 () Bool)

(assert (=> tb!4035 (= result!7597 true)))

(assert (=> b!476887 t!15042))

(declare-fun b_and!20755 () Bool)

(assert (= b_and!20753 (and (=> t!15042 result!7597) b_and!20755)))

(declare-fun m!459435 () Bool)

(assert (=> b!476887 m!459435))

(declare-fun m!459437 () Bool)

(assert (=> b!476888 m!459437))

(assert (=> b!476820 d!75961))

(declare-fun d!75963 () Bool)

(declare-fun e!280185 () Bool)

(assert (=> d!75963 e!280185))

(declare-fun res!284748 () Bool)

(assert (=> d!75963 (=> (not res!284748) (not e!280185))))

(declare-fun lt!217421 () ListLongMap!7831)

(declare-fun contains!2550 (ListLongMap!7831 (_ BitVec 64)) Bool)

(assert (=> d!75963 (= res!284748 (contains!2550 lt!217421 (_1!4469 lt!217355)))))

(declare-fun lt!217422 () List!8962)

(assert (=> d!75963 (= lt!217421 (ListLongMap!7832 lt!217422))))

(declare-fun lt!217420 () Unit!14006)

(declare-fun lt!217423 () Unit!14006)

(assert (=> d!75963 (= lt!217420 lt!217423)))

(declare-datatypes ((Option!394 0))(
  ( (Some!393 (v!9094 B!1052)) (None!392) )
))
(declare-fun getValueByKey!388 (List!8962 (_ BitVec 64)) Option!394)

(assert (=> d!75963 (= (getValueByKey!388 lt!217422 (_1!4469 lt!217355)) (Some!393 (_2!4469 lt!217355)))))

(declare-fun lemmaContainsTupThenGetReturnValue!210 (List!8962 (_ BitVec 64) B!1052) Unit!14006)

(assert (=> d!75963 (= lt!217423 (lemmaContainsTupThenGetReturnValue!210 lt!217422 (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(declare-fun insertStrictlySorted!213 (List!8962 (_ BitVec 64) B!1052) List!8962)

(assert (=> d!75963 (= lt!217422 (insertStrictlySorted!213 (toList!3931 lt!217354) (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(assert (=> d!75963 (= (+!1772 lt!217354 lt!217355) lt!217421)))

(declare-fun b!476911 () Bool)

(declare-fun res!284747 () Bool)

(assert (=> b!476911 (=> (not res!284747) (not e!280185))))

(assert (=> b!476911 (= res!284747 (= (getValueByKey!388 (toList!3931 lt!217421) (_1!4469 lt!217355)) (Some!393 (_2!4469 lt!217355))))))

(declare-fun b!476912 () Bool)

(declare-fun contains!2552 (List!8962 tuple2!8916) Bool)

(assert (=> b!476912 (= e!280185 (contains!2552 (toList!3931 lt!217421) lt!217355))))

(assert (= (and d!75963 res!284748) b!476911))

(assert (= (and b!476911 res!284747) b!476912))

(declare-fun m!459487 () Bool)

(assert (=> d!75963 m!459487))

(declare-fun m!459489 () Bool)

(assert (=> d!75963 m!459489))

(declare-fun m!459491 () Bool)

(assert (=> d!75963 m!459491))

(declare-fun m!459495 () Bool)

(assert (=> d!75963 m!459495))

(declare-fun m!459499 () Bool)

(assert (=> b!476911 m!459499))

(declare-fun m!459503 () Bool)

(assert (=> b!476912 m!459503))

(assert (=> b!476820 d!75963))

(declare-fun d!75979 () Bool)

(declare-fun e!280189 () Bool)

(assert (=> d!75979 e!280189))

(declare-fun res!284754 () Bool)

(assert (=> d!75979 (=> (not res!284754) (not e!280189))))

(declare-fun lt!217429 () ListLongMap!7831)

(assert (=> d!75979 (= res!284754 (contains!2550 lt!217429 (_1!4469 lt!217355)))))

(declare-fun lt!217430 () List!8962)

(assert (=> d!75979 (= lt!217429 (ListLongMap!7832 lt!217430))))

(declare-fun lt!217428 () Unit!14006)

(declare-fun lt!217431 () Unit!14006)

(assert (=> d!75979 (= lt!217428 lt!217431)))

(assert (=> d!75979 (= (getValueByKey!388 lt!217430 (_1!4469 lt!217355)) (Some!393 (_2!4469 lt!217355)))))

(assert (=> d!75979 (= lt!217431 (lemmaContainsTupThenGetReturnValue!210 lt!217430 (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(assert (=> d!75979 (= lt!217430 (insertStrictlySorted!213 (toList!3931 lm!215) (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(assert (=> d!75979 (= (+!1772 lm!215 lt!217355) lt!217429)))

(declare-fun b!476917 () Bool)

(declare-fun res!284753 () Bool)

(assert (=> b!476917 (=> (not res!284753) (not e!280189))))

(assert (=> b!476917 (= res!284753 (= (getValueByKey!388 (toList!3931 lt!217429) (_1!4469 lt!217355)) (Some!393 (_2!4469 lt!217355))))))

(declare-fun b!476918 () Bool)

(assert (=> b!476918 (= e!280189 (contains!2552 (toList!3931 lt!217429) lt!217355))))

(assert (= (and d!75979 res!284754) b!476917))

(assert (= (and b!476917 res!284753) b!476918))

(declare-fun m!459515 () Bool)

(assert (=> d!75979 m!459515))

(declare-fun m!459517 () Bool)

(assert (=> d!75979 m!459517))

(declare-fun m!459519 () Bool)

(assert (=> d!75979 m!459519))

(declare-fun m!459521 () Bool)

(assert (=> d!75979 m!459521))

(declare-fun m!459523 () Bool)

(assert (=> b!476917 m!459523))

(declare-fun m!459525 () Bool)

(assert (=> b!476918 m!459525))

(assert (=> b!476820 d!75979))

(declare-fun d!75985 () Bool)

(declare-fun res!284755 () Bool)

(declare-fun e!280190 () Bool)

(assert (=> d!75985 (=> res!284755 e!280190)))

(assert (=> d!75985 (= res!284755 ((_ is Nil!8959) (toList!3931 (+!1772 lm!215 lt!217355))))))

(assert (=> d!75985 (= (forall!197 (toList!3931 (+!1772 lm!215 lt!217355)) p!166) e!280190)))

(declare-fun b!476919 () Bool)

(declare-fun e!280191 () Bool)

(assert (=> b!476919 (= e!280190 e!280191)))

(declare-fun res!284756 () Bool)

(assert (=> b!476919 (=> (not res!284756) (not e!280191))))

(assert (=> b!476919 (= res!284756 (dynLambda!941 p!166 (h!9814 (toList!3931 (+!1772 lm!215 lt!217355)))))))

(declare-fun b!476920 () Bool)

(assert (=> b!476920 (= e!280191 (forall!197 (t!15018 (toList!3931 (+!1772 lm!215 lt!217355))) p!166))))

(assert (= (and d!75985 (not res!284755)) b!476919))

(assert (= (and b!476919 res!284756) b!476920))

(declare-fun b_lambda!10565 () Bool)

(assert (=> (not b_lambda!10565) (not b!476919)))

(declare-fun t!15050 () Bool)

(declare-fun tb!4043 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15050) tb!4043))

(declare-fun result!7605 () Bool)

(assert (=> tb!4043 (= result!7605 true)))

(assert (=> b!476919 t!15050))

(declare-fun b_and!20763 () Bool)

(assert (= b_and!20755 (and (=> t!15050 result!7605) b_and!20763)))

(declare-fun m!459531 () Bool)

(assert (=> b!476919 m!459531))

(declare-fun m!459533 () Bool)

(assert (=> b!476920 m!459533))

(assert (=> b!476820 d!75985))

(declare-fun d!75989 () Bool)

(declare-fun isEmpty!610 (List!8962) Bool)

(assert (=> d!75989 (= (isEmpty!607 lm!215) (isEmpty!610 (toList!3931 lm!215)))))

(declare-fun bs!15181 () Bool)

(assert (= bs!15181 d!75989))

(declare-fun m!459539 () Bool)

(assert (=> bs!15181 m!459539))

(assert (=> b!476818 d!75989))

(declare-fun d!75993 () Bool)

(declare-fun res!284759 () Bool)

(declare-fun e!280197 () Bool)

(assert (=> d!75993 (=> res!284759 e!280197)))

(assert (=> d!75993 (= res!284759 ((_ is Nil!8959) (toList!3931 lt!217354)))))

(assert (=> d!75993 (= (forall!197 (toList!3931 lt!217354) p!166) e!280197)))

(declare-fun b!476928 () Bool)

(declare-fun e!280198 () Bool)

(assert (=> b!476928 (= e!280197 e!280198)))

(declare-fun res!284760 () Bool)

(assert (=> b!476928 (=> (not res!284760) (not e!280198))))

(assert (=> b!476928 (= res!284760 (dynLambda!941 p!166 (h!9814 (toList!3931 lt!217354))))))

(declare-fun b!476929 () Bool)

(assert (=> b!476929 (= e!280198 (forall!197 (t!15018 (toList!3931 lt!217354)) p!166))))

(assert (= (and d!75993 (not res!284759)) b!476928))

(assert (= (and b!476928 res!284760) b!476929))

(declare-fun b_lambda!10579 () Bool)

(assert (=> (not b_lambda!10579) (not b!476928)))

(declare-fun t!15054 () Bool)

(declare-fun tb!4047 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15054) tb!4047))

(declare-fun result!7611 () Bool)

(assert (=> tb!4047 (= result!7611 true)))

(assert (=> b!476928 t!15054))

(declare-fun b_and!20767 () Bool)

(assert (= b_and!20763 (and (=> t!15054 result!7611) b_and!20767)))

(declare-fun m!459543 () Bool)

(assert (=> b!476928 m!459543))

(declare-fun m!459545 () Bool)

(assert (=> b!476929 m!459545))

(assert (=> b!476819 d!75993))

(declare-fun d!75995 () Bool)

(declare-fun tail!128 (List!8962) List!8962)

(assert (=> d!75995 (= (tail!125 lm!215) (ListLongMap!7832 (tail!128 (toList!3931 lm!215))))))

(declare-fun bs!15183 () Bool)

(assert (= bs!15183 d!75995))

(declare-fun m!459547 () Bool)

(assert (=> bs!15183 m!459547))

(assert (=> b!476819 d!75995))

(declare-fun b!476939 () Bool)

(declare-fun e!280204 () Bool)

(declare-fun tp!42418 () Bool)

(assert (=> b!476939 (= e!280204 (and tp_is_empty!13525 tp!42418))))

(assert (=> b!476822 (= tp!42396 e!280204)))

(assert (= (and b!476822 ((_ is Cons!8958) (toList!3931 lm!215))) b!476939))

(declare-fun b_lambda!10591 () Bool)

(assert (= b_lambda!10565 (or (and start!42850 b_free!12103) b_lambda!10591)))

(declare-fun b_lambda!10593 () Bool)

(assert (= b_lambda!10557 (or (and start!42850 b_free!12103) b_lambda!10593)))

(declare-fun b_lambda!10595 () Bool)

(assert (= b_lambda!10555 (or (and start!42850 b_free!12103) b_lambda!10595)))

(declare-fun b_lambda!10597 () Bool)

(assert (= b_lambda!10579 (or (and start!42850 b_free!12103) b_lambda!10597)))

(declare-fun b_lambda!10599 () Bool)

(assert (= b_lambda!10543 (or (and start!42850 b_free!12103) b_lambda!10599)))

(check-sat (not b!476911) (not b!476864) (not d!75947) (not b!476912) (not b_lambda!10597) (not b!476888) (not b!476917) (not b!476939) b_and!20767 (not b!476929) (not b_lambda!10599) (not b_lambda!10595) (not d!75979) (not b_next!12103) (not b!476920) (not d!75989) (not b!476918) (not d!75951) (not d!75963) (not b_lambda!10539) tp_is_empty!13525 (not d!75995) (not b_lambda!10591) (not b_lambda!10593))
(check-sat b_and!20767 (not b_next!12103))
(get-model)

(declare-fun b!476948 () Bool)

(declare-fun e!280209 () Option!394)

(assert (=> b!476948 (= e!280209 (Some!393 (_2!4469 (h!9814 (toList!3931 lt!217421)))))))

(declare-fun b!476949 () Bool)

(declare-fun e!280210 () Option!394)

(assert (=> b!476949 (= e!280209 e!280210)))

(declare-fun c!57352 () Bool)

(assert (=> b!476949 (= c!57352 (and ((_ is Cons!8958) (toList!3931 lt!217421)) (not (= (_1!4469 (h!9814 (toList!3931 lt!217421))) (_1!4469 lt!217355)))))))

(declare-fun b!476951 () Bool)

(assert (=> b!476951 (= e!280210 None!392)))

(declare-fun b!476950 () Bool)

(assert (=> b!476950 (= e!280210 (getValueByKey!388 (t!15018 (toList!3931 lt!217421)) (_1!4469 lt!217355)))))

(declare-fun d!75997 () Bool)

(declare-fun c!57351 () Bool)

(assert (=> d!75997 (= c!57351 (and ((_ is Cons!8958) (toList!3931 lt!217421)) (= (_1!4469 (h!9814 (toList!3931 lt!217421))) (_1!4469 lt!217355))))))

(assert (=> d!75997 (= (getValueByKey!388 (toList!3931 lt!217421) (_1!4469 lt!217355)) e!280209)))

(assert (= (and d!75997 c!57351) b!476948))

(assert (= (and d!75997 (not c!57351)) b!476949))

(assert (= (and b!476949 c!57352) b!476950))

(assert (= (and b!476949 (not c!57352)) b!476951))

(declare-fun m!459549 () Bool)

(assert (=> b!476950 m!459549))

(assert (=> b!476911 d!75997))

(declare-fun d!75999 () Bool)

(declare-fun e!280215 () Bool)

(assert (=> d!75999 e!280215))

(declare-fun res!284763 () Bool)

(assert (=> d!75999 (=> res!284763 e!280215)))

(declare-fun lt!217440 () Bool)

(assert (=> d!75999 (= res!284763 (not lt!217440))))

(declare-fun lt!217441 () Bool)

(assert (=> d!75999 (= lt!217440 lt!217441)))

(declare-fun lt!217442 () Unit!14006)

(declare-fun e!280216 () Unit!14006)

(assert (=> d!75999 (= lt!217442 e!280216)))

(declare-fun c!57355 () Bool)

(assert (=> d!75999 (= c!57355 lt!217441)))

(declare-fun containsKey!348 (List!8962 (_ BitVec 64)) Bool)

(assert (=> d!75999 (= lt!217441 (containsKey!348 (toList!3931 lt!217421) (_1!4469 lt!217355)))))

(assert (=> d!75999 (= (contains!2550 lt!217421 (_1!4469 lt!217355)) lt!217440)))

(declare-fun b!476958 () Bool)

(declare-fun lt!217443 () Unit!14006)

(assert (=> b!476958 (= e!280216 lt!217443)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!296 (List!8962 (_ BitVec 64)) Unit!14006)

(assert (=> b!476958 (= lt!217443 (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3931 lt!217421) (_1!4469 lt!217355)))))

(declare-fun isDefined!297 (Option!394) Bool)

(assert (=> b!476958 (isDefined!297 (getValueByKey!388 (toList!3931 lt!217421) (_1!4469 lt!217355)))))

(declare-fun b!476959 () Bool)

(declare-fun Unit!14012 () Unit!14006)

(assert (=> b!476959 (= e!280216 Unit!14012)))

(declare-fun b!476960 () Bool)

(assert (=> b!476960 (= e!280215 (isDefined!297 (getValueByKey!388 (toList!3931 lt!217421) (_1!4469 lt!217355))))))

(assert (= (and d!75999 c!57355) b!476958))

(assert (= (and d!75999 (not c!57355)) b!476959))

(assert (= (and d!75999 (not res!284763)) b!476960))

(declare-fun m!459551 () Bool)

(assert (=> d!75999 m!459551))

(declare-fun m!459553 () Bool)

(assert (=> b!476958 m!459553))

(assert (=> b!476958 m!459499))

(assert (=> b!476958 m!459499))

(declare-fun m!459555 () Bool)

(assert (=> b!476958 m!459555))

(assert (=> b!476960 m!459499))

(assert (=> b!476960 m!459499))

(assert (=> b!476960 m!459555))

(assert (=> d!75963 d!75999))

(declare-fun b!476961 () Bool)

(declare-fun e!280217 () Option!394)

(assert (=> b!476961 (= e!280217 (Some!393 (_2!4469 (h!9814 lt!217422))))))

(declare-fun b!476962 () Bool)

(declare-fun e!280218 () Option!394)

(assert (=> b!476962 (= e!280217 e!280218)))

(declare-fun c!57357 () Bool)

(assert (=> b!476962 (= c!57357 (and ((_ is Cons!8958) lt!217422) (not (= (_1!4469 (h!9814 lt!217422)) (_1!4469 lt!217355)))))))

(declare-fun b!476964 () Bool)

(assert (=> b!476964 (= e!280218 None!392)))

(declare-fun b!476963 () Bool)

(assert (=> b!476963 (= e!280218 (getValueByKey!388 (t!15018 lt!217422) (_1!4469 lt!217355)))))

(declare-fun d!76001 () Bool)

(declare-fun c!57356 () Bool)

(assert (=> d!76001 (= c!57356 (and ((_ is Cons!8958) lt!217422) (= (_1!4469 (h!9814 lt!217422)) (_1!4469 lt!217355))))))

(assert (=> d!76001 (= (getValueByKey!388 lt!217422 (_1!4469 lt!217355)) e!280217)))

(assert (= (and d!76001 c!57356) b!476961))

(assert (= (and d!76001 (not c!57356)) b!476962))

(assert (= (and b!476962 c!57357) b!476963))

(assert (= (and b!476962 (not c!57357)) b!476964))

(declare-fun m!459557 () Bool)

(assert (=> b!476963 m!459557))

(assert (=> d!75963 d!76001))

(declare-fun d!76003 () Bool)

(assert (=> d!76003 (= (getValueByKey!388 lt!217422 (_1!4469 lt!217355)) (Some!393 (_2!4469 lt!217355)))))

(declare-fun lt!217446 () Unit!14006)

(declare-fun choose!1371 (List!8962 (_ BitVec 64) B!1052) Unit!14006)

(assert (=> d!76003 (= lt!217446 (choose!1371 lt!217422 (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(declare-fun e!280221 () Bool)

(assert (=> d!76003 e!280221))

(declare-fun res!284768 () Bool)

(assert (=> d!76003 (=> (not res!284768) (not e!280221))))

(assert (=> d!76003 (= res!284768 (isStrictlySorted!375 lt!217422))))

(assert (=> d!76003 (= (lemmaContainsTupThenGetReturnValue!210 lt!217422 (_1!4469 lt!217355) (_2!4469 lt!217355)) lt!217446)))

(declare-fun b!476969 () Bool)

(declare-fun res!284769 () Bool)

(assert (=> b!476969 (=> (not res!284769) (not e!280221))))

(assert (=> b!476969 (= res!284769 (containsKey!348 lt!217422 (_1!4469 lt!217355)))))

(declare-fun b!476970 () Bool)

(assert (=> b!476970 (= e!280221 (contains!2552 lt!217422 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(assert (= (and d!76003 res!284768) b!476969))

(assert (= (and b!476969 res!284769) b!476970))

(assert (=> d!76003 m!459489))

(declare-fun m!459559 () Bool)

(assert (=> d!76003 m!459559))

(declare-fun m!459561 () Bool)

(assert (=> d!76003 m!459561))

(declare-fun m!459563 () Bool)

(assert (=> b!476969 m!459563))

(declare-fun m!459565 () Bool)

(assert (=> b!476970 m!459565))

(assert (=> d!75963 d!76003))

(declare-fun b!477022 () Bool)

(declare-fun e!280253 () List!8962)

(declare-fun call!30725 () List!8962)

(assert (=> b!477022 (= e!280253 call!30725)))

(declare-fun e!280256 () List!8962)

(declare-fun c!57377 () Bool)

(declare-fun c!57374 () Bool)

(declare-fun b!477023 () Bool)

(assert (=> b!477023 (= e!280256 (ite c!57374 (t!15018 (toList!3931 lt!217354)) (ite c!57377 (Cons!8958 (h!9814 (toList!3931 lt!217354)) (t!15018 (toList!3931 lt!217354))) Nil!8959)))))

(declare-fun b!477024 () Bool)

(declare-fun e!280254 () List!8962)

(declare-fun e!280257 () List!8962)

(assert (=> b!477024 (= e!280254 e!280257)))

(assert (=> b!477024 (= c!57374 (and ((_ is Cons!8958) (toList!3931 lt!217354)) (= (_1!4469 (h!9814 (toList!3931 lt!217354))) (_1!4469 lt!217355))))))

(declare-fun b!477025 () Bool)

(declare-fun res!284788 () Bool)

(declare-fun e!280255 () Bool)

(assert (=> b!477025 (=> (not res!284788) (not e!280255))))

(declare-fun lt!217456 () List!8962)

(assert (=> b!477025 (= res!284788 (containsKey!348 lt!217456 (_1!4469 lt!217355)))))

(declare-fun b!477026 () Bool)

(declare-fun call!30723 () List!8962)

(assert (=> b!477026 (= e!280257 call!30723)))

(declare-fun bm!30720 () Bool)

(assert (=> bm!30720 (= call!30725 call!30723)))

(declare-fun bm!30721 () Bool)

(declare-fun call!30724 () List!8962)

(assert (=> bm!30721 (= call!30723 call!30724)))

(declare-fun bm!30722 () Bool)

(declare-fun c!57375 () Bool)

(declare-fun $colon$colon!109 (List!8962 tuple2!8916) List!8962)

(assert (=> bm!30722 (= call!30724 ($colon$colon!109 e!280256 (ite c!57375 (h!9814 (toList!3931 lt!217354)) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355)))))))

(declare-fun c!57376 () Bool)

(assert (=> bm!30722 (= c!57376 c!57375)))

(declare-fun d!76005 () Bool)

(assert (=> d!76005 e!280255))

(declare-fun res!284789 () Bool)

(assert (=> d!76005 (=> (not res!284789) (not e!280255))))

(assert (=> d!76005 (= res!284789 (isStrictlySorted!375 lt!217456))))

(assert (=> d!76005 (= lt!217456 e!280254)))

(assert (=> d!76005 (= c!57375 (and ((_ is Cons!8958) (toList!3931 lt!217354)) (bvslt (_1!4469 (h!9814 (toList!3931 lt!217354))) (_1!4469 lt!217355))))))

(assert (=> d!76005 (isStrictlySorted!375 (toList!3931 lt!217354))))

(assert (=> d!76005 (= (insertStrictlySorted!213 (toList!3931 lt!217354) (_1!4469 lt!217355) (_2!4469 lt!217355)) lt!217456)))

(declare-fun b!477021 () Bool)

(assert (=> b!477021 (= e!280254 call!30724)))

(declare-fun b!477027 () Bool)

(assert (=> b!477027 (= e!280256 (insertStrictlySorted!213 (t!15018 (toList!3931 lt!217354)) (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(declare-fun b!477028 () Bool)

(assert (=> b!477028 (= e!280253 call!30725)))

(declare-fun b!477029 () Bool)

(assert (=> b!477029 (= e!280255 (contains!2552 lt!217456 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun b!477030 () Bool)

(assert (=> b!477030 (= c!57377 (and ((_ is Cons!8958) (toList!3931 lt!217354)) (bvsgt (_1!4469 (h!9814 (toList!3931 lt!217354))) (_1!4469 lt!217355))))))

(assert (=> b!477030 (= e!280257 e!280253)))

(assert (= (and d!76005 c!57375) b!477021))

(assert (= (and d!76005 (not c!57375)) b!477024))

(assert (= (and b!477024 c!57374) b!477026))

(assert (= (and b!477024 (not c!57374)) b!477030))

(assert (= (and b!477030 c!57377) b!477022))

(assert (= (and b!477030 (not c!57377)) b!477028))

(assert (= (or b!477022 b!477028) bm!30720))

(assert (= (or b!477026 bm!30720) bm!30721))

(assert (= (or b!477021 bm!30721) bm!30722))

(assert (= (and bm!30722 c!57376) b!477027))

(assert (= (and bm!30722 (not c!57376)) b!477023))

(assert (= (and d!76005 res!284789) b!477025))

(assert (= (and b!477025 res!284788) b!477029))

(declare-fun m!459601 () Bool)

(assert (=> b!477025 m!459601))

(declare-fun m!459603 () Bool)

(assert (=> d!76005 m!459603))

(declare-fun m!459605 () Bool)

(assert (=> d!76005 m!459605))

(declare-fun m!459607 () Bool)

(assert (=> bm!30722 m!459607))

(declare-fun m!459609 () Bool)

(assert (=> b!477027 m!459609))

(declare-fun m!459611 () Bool)

(assert (=> b!477029 m!459611))

(assert (=> d!75963 d!76005))

(declare-fun d!76023 () Bool)

(declare-fun res!284790 () Bool)

(declare-fun e!280258 () Bool)

(assert (=> d!76023 (=> res!284790 e!280258)))

(assert (=> d!76023 (= res!284790 ((_ is Nil!8959) (t!15018 (toList!3931 lm!215))))))

(assert (=> d!76023 (= (forall!197 (t!15018 (toList!3931 lm!215)) p!166) e!280258)))

(declare-fun b!477031 () Bool)

(declare-fun e!280259 () Bool)

(assert (=> b!477031 (= e!280258 e!280259)))

(declare-fun res!284791 () Bool)

(assert (=> b!477031 (=> (not res!284791) (not e!280259))))

(assert (=> b!477031 (= res!284791 (dynLambda!941 p!166 (h!9814 (t!15018 (toList!3931 lm!215)))))))

(declare-fun b!477032 () Bool)

(assert (=> b!477032 (= e!280259 (forall!197 (t!15018 (t!15018 (toList!3931 lm!215))) p!166))))

(assert (= (and d!76023 (not res!284790)) b!477031))

(assert (= (and b!477031 res!284791) b!477032))

(declare-fun b_lambda!10607 () Bool)

(assert (=> (not b_lambda!10607) (not b!477031)))

(declare-fun t!15062 () Bool)

(declare-fun tb!4055 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15062) tb!4055))

(declare-fun result!7623 () Bool)

(assert (=> tb!4055 (= result!7623 true)))

(assert (=> b!477031 t!15062))

(declare-fun b_and!20775 () Bool)

(assert (= b_and!20767 (and (=> t!15062 result!7623) b_and!20775)))

(declare-fun m!459613 () Bool)

(assert (=> b!477031 m!459613))

(declare-fun m!459615 () Bool)

(assert (=> b!477032 m!459615))

(assert (=> b!476864 d!76023))

(declare-fun b!477036 () Bool)

(declare-fun e!280262 () Option!394)

(assert (=> b!477036 (= e!280262 (Some!393 (_2!4469 (h!9814 (toList!3931 lt!217429)))))))

(declare-fun b!477037 () Bool)

(declare-fun e!280263 () Option!394)

(assert (=> b!477037 (= e!280262 e!280263)))

(declare-fun c!57379 () Bool)

(assert (=> b!477037 (= c!57379 (and ((_ is Cons!8958) (toList!3931 lt!217429)) (not (= (_1!4469 (h!9814 (toList!3931 lt!217429))) (_1!4469 lt!217355)))))))

(declare-fun b!477039 () Bool)

(assert (=> b!477039 (= e!280263 None!392)))

(declare-fun b!477038 () Bool)

(assert (=> b!477038 (= e!280263 (getValueByKey!388 (t!15018 (toList!3931 lt!217429)) (_1!4469 lt!217355)))))

(declare-fun d!76029 () Bool)

(declare-fun c!57378 () Bool)

(assert (=> d!76029 (= c!57378 (and ((_ is Cons!8958) (toList!3931 lt!217429)) (= (_1!4469 (h!9814 (toList!3931 lt!217429))) (_1!4469 lt!217355))))))

(assert (=> d!76029 (= (getValueByKey!388 (toList!3931 lt!217429) (_1!4469 lt!217355)) e!280262)))

(assert (= (and d!76029 c!57378) b!477036))

(assert (= (and d!76029 (not c!57378)) b!477037))

(assert (= (and b!477037 c!57379) b!477038))

(assert (= (and b!477037 (not c!57379)) b!477039))

(declare-fun m!459617 () Bool)

(assert (=> b!477038 m!459617))

(assert (=> b!476917 d!76029))

(declare-fun d!76031 () Bool)

(declare-fun res!284794 () Bool)

(declare-fun e!280264 () Bool)

(assert (=> d!76031 (=> res!284794 e!280264)))

(assert (=> d!76031 (= res!284794 ((_ is Nil!8959) (t!15018 (toList!3931 lt!217354))))))

(assert (=> d!76031 (= (forall!197 (t!15018 (toList!3931 lt!217354)) p!166) e!280264)))

(declare-fun b!477040 () Bool)

(declare-fun e!280265 () Bool)

(assert (=> b!477040 (= e!280264 e!280265)))

(declare-fun res!284795 () Bool)

(assert (=> b!477040 (=> (not res!284795) (not e!280265))))

(assert (=> b!477040 (= res!284795 (dynLambda!941 p!166 (h!9814 (t!15018 (toList!3931 lt!217354)))))))

(declare-fun b!477041 () Bool)

(assert (=> b!477041 (= e!280265 (forall!197 (t!15018 (t!15018 (toList!3931 lt!217354))) p!166))))

(assert (= (and d!76031 (not res!284794)) b!477040))

(assert (= (and b!477040 res!284795) b!477041))

(declare-fun b_lambda!10611 () Bool)

(assert (=> (not b_lambda!10611) (not b!477040)))

(declare-fun t!15066 () Bool)

(declare-fun tb!4059 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15066) tb!4059))

(declare-fun result!7627 () Bool)

(assert (=> tb!4059 (= result!7627 true)))

(assert (=> b!477040 t!15066))

(declare-fun b_and!20779 () Bool)

(assert (= b_and!20775 (and (=> t!15066 result!7627) b_and!20779)))

(declare-fun m!459623 () Bool)

(assert (=> b!477040 m!459623))

(declare-fun m!459625 () Bool)

(assert (=> b!477041 m!459625))

(assert (=> b!476929 d!76031))

(declare-fun d!76037 () Bool)

(assert (=> d!76037 (= (tail!128 (toList!3931 lm!215)) (t!15018 (toList!3931 lm!215)))))

(assert (=> d!75995 d!76037))

(declare-fun d!76041 () Bool)

(declare-fun lt!217459 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!209 (List!8962) (InoxSet tuple2!8916))

(assert (=> d!76041 (= lt!217459 (select (content!209 (toList!3931 lt!217429)) lt!217355))))

(declare-fun e!280281 () Bool)

(assert (=> d!76041 (= lt!217459 e!280281)))

(declare-fun res!284810 () Bool)

(assert (=> d!76041 (=> (not res!284810) (not e!280281))))

(assert (=> d!76041 (= res!284810 ((_ is Cons!8958) (toList!3931 lt!217429)))))

(assert (=> d!76041 (= (contains!2552 (toList!3931 lt!217429) lt!217355) lt!217459)))

(declare-fun b!477056 () Bool)

(declare-fun e!280280 () Bool)

(assert (=> b!477056 (= e!280281 e!280280)))

(declare-fun res!284811 () Bool)

(assert (=> b!477056 (=> res!284811 e!280280)))

(assert (=> b!477056 (= res!284811 (= (h!9814 (toList!3931 lt!217429)) lt!217355))))

(declare-fun b!477057 () Bool)

(assert (=> b!477057 (= e!280280 (contains!2552 (t!15018 (toList!3931 lt!217429)) lt!217355))))

(assert (= (and d!76041 res!284810) b!477056))

(assert (= (and b!477056 (not res!284811)) b!477057))

(declare-fun m!459637 () Bool)

(assert (=> d!76041 m!459637))

(declare-fun m!459639 () Bool)

(assert (=> d!76041 m!459639))

(declare-fun m!459641 () Bool)

(assert (=> b!477057 m!459641))

(assert (=> b!476918 d!76041))

(declare-fun d!76047 () Bool)

(declare-fun lt!217464 () Bool)

(assert (=> d!76047 (= lt!217464 (select (content!209 (toList!3931 lt!217421)) lt!217355))))

(declare-fun e!280284 () Bool)

(assert (=> d!76047 (= lt!217464 e!280284)))

(declare-fun res!284814 () Bool)

(assert (=> d!76047 (=> (not res!284814) (not e!280284))))

(assert (=> d!76047 (= res!284814 ((_ is Cons!8958) (toList!3931 lt!217421)))))

(assert (=> d!76047 (= (contains!2552 (toList!3931 lt!217421) lt!217355) lt!217464)))

(declare-fun b!477060 () Bool)

(declare-fun e!280283 () Bool)

(assert (=> b!477060 (= e!280284 e!280283)))

(declare-fun res!284815 () Bool)

(assert (=> b!477060 (=> res!284815 e!280283)))

(assert (=> b!477060 (= res!284815 (= (h!9814 (toList!3931 lt!217421)) lt!217355))))

(declare-fun b!477061 () Bool)

(assert (=> b!477061 (= e!280283 (contains!2552 (t!15018 (toList!3931 lt!217421)) lt!217355))))

(assert (= (and d!76047 res!284814) b!477060))

(assert (= (and b!477060 (not res!284815)) b!477061))

(declare-fun m!459651 () Bool)

(assert (=> d!76047 m!459651))

(declare-fun m!459655 () Bool)

(assert (=> d!76047 m!459655))

(declare-fun m!459659 () Bool)

(assert (=> b!477061 m!459659))

(assert (=> b!476912 d!76047))

(declare-fun d!76051 () Bool)

(declare-fun res!284816 () Bool)

(declare-fun e!280287 () Bool)

(assert (=> d!76051 (=> res!284816 e!280287)))

(assert (=> d!76051 (= res!284816 ((_ is Nil!8959) (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85)))))))

(assert (=> d!76051 (= (forall!197 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85))) p!166) e!280287)))

(declare-fun b!477066 () Bool)

(declare-fun e!280288 () Bool)

(assert (=> b!477066 (= e!280287 e!280288)))

(declare-fun res!284817 () Bool)

(assert (=> b!477066 (=> (not res!284817) (not e!280288))))

(assert (=> b!477066 (= res!284817 (dynLambda!941 p!166 (h!9814 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85))))))))

(declare-fun b!477067 () Bool)

(assert (=> b!477067 (= e!280288 (forall!197 (t!15018 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85)))) p!166))))

(assert (= (and d!76051 (not res!284816)) b!477066))

(assert (= (and b!477066 res!284817) b!477067))

(declare-fun b_lambda!10617 () Bool)

(assert (=> (not b_lambda!10617) (not b!477066)))

(declare-fun t!15072 () Bool)

(declare-fun tb!4065 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15072) tb!4065))

(declare-fun result!7633 () Bool)

(assert (=> tb!4065 (= result!7633 true)))

(assert (=> b!477066 t!15072))

(declare-fun b_and!20785 () Bool)

(assert (= b_and!20779 (and (=> t!15072 result!7633) b_and!20785)))

(declare-fun m!459661 () Bool)

(assert (=> b!477066 m!459661))

(declare-fun m!459663 () Bool)

(assert (=> b!477067 m!459663))

(assert (=> d!75951 d!76051))

(declare-fun d!76053 () Bool)

(declare-fun e!280291 () Bool)

(assert (=> d!76053 e!280291))

(declare-fun res!284821 () Bool)

(assert (=> d!76053 (=> (not res!284821) (not e!280291))))

(declare-fun lt!217474 () ListLongMap!7831)

(assert (=> d!76053 (= res!284821 (contains!2550 lt!217474 (_1!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun lt!217475 () List!8962)

(assert (=> d!76053 (= lt!217474 (ListLongMap!7832 lt!217475))))

(declare-fun lt!217473 () Unit!14006)

(declare-fun lt!217476 () Unit!14006)

(assert (=> d!76053 (= lt!217473 lt!217476)))

(assert (=> d!76053 (= (getValueByKey!388 lt!217475 (_1!4469 (tuple2!8917 a!501 b!85))) (Some!393 (_2!4469 (tuple2!8917 a!501 b!85))))))

(assert (=> d!76053 (= lt!217476 (lemmaContainsTupThenGetReturnValue!210 lt!217475 (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85))))))

(assert (=> d!76053 (= lt!217475 (insertStrictlySorted!213 (toList!3931 lt!217354) (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85))))))

(assert (=> d!76053 (= (+!1772 lt!217354 (tuple2!8917 a!501 b!85)) lt!217474)))

(declare-fun b!477070 () Bool)

(declare-fun res!284820 () Bool)

(assert (=> b!477070 (=> (not res!284820) (not e!280291))))

(assert (=> b!477070 (= res!284820 (= (getValueByKey!388 (toList!3931 lt!217474) (_1!4469 (tuple2!8917 a!501 b!85))) (Some!393 (_2!4469 (tuple2!8917 a!501 b!85)))))))

(declare-fun b!477071 () Bool)

(assert (=> b!477071 (= e!280291 (contains!2552 (toList!3931 lt!217474) (tuple2!8917 a!501 b!85)))))

(assert (= (and d!76053 res!284821) b!477070))

(assert (= (and b!477070 res!284820) b!477071))

(declare-fun m!459665 () Bool)

(assert (=> d!76053 m!459665))

(declare-fun m!459667 () Bool)

(assert (=> d!76053 m!459667))

(declare-fun m!459669 () Bool)

(assert (=> d!76053 m!459669))

(declare-fun m!459671 () Bool)

(assert (=> d!76053 m!459671))

(declare-fun m!459673 () Bool)

(assert (=> b!477070 m!459673))

(declare-fun m!459675 () Bool)

(assert (=> b!477071 m!459675))

(assert (=> d!75951 d!76053))

(declare-fun d!76055 () Bool)

(assert (=> d!76055 (forall!197 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85))) p!166)))

(assert (=> d!76055 true))

(declare-fun _$30!93 () Unit!14006)

(assert (=> d!76055 (= (choose!1369 lt!217354 p!166 a!501 b!85) _$30!93)))

(declare-fun bs!15186 () Bool)

(assert (= bs!15186 d!76055))

(assert (=> bs!15186 m!459423))

(assert (=> bs!15186 m!459429))

(assert (=> d!75951 d!76055))

(assert (=> d!75951 d!75993))

(declare-fun d!76063 () Bool)

(declare-fun res!284823 () Bool)

(declare-fun e!280296 () Bool)

(assert (=> d!76063 (=> res!284823 e!280296)))

(assert (=> d!76063 (= res!284823 ((_ is Nil!8959) (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355)))))))

(assert (=> d!76063 (= (forall!197 (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355))) p!166) e!280296)))

(declare-fun b!477081 () Bool)

(declare-fun e!280297 () Bool)

(assert (=> b!477081 (= e!280296 e!280297)))

(declare-fun res!284824 () Bool)

(assert (=> b!477081 (=> (not res!284824) (not e!280297))))

(assert (=> b!477081 (= res!284824 (dynLambda!941 p!166 (h!9814 (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355))))))))

(declare-fun b!477082 () Bool)

(assert (=> b!477082 (= e!280297 (forall!197 (t!15018 (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355)))) p!166))))

(assert (= (and d!76063 (not res!284823)) b!477081))

(assert (= (and b!477081 res!284824) b!477082))

(declare-fun b_lambda!10619 () Bool)

(assert (=> (not b_lambda!10619) (not b!477081)))

(declare-fun t!15074 () Bool)

(declare-fun tb!4067 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15074) tb!4067))

(declare-fun result!7635 () Bool)

(assert (=> tb!4067 (= result!7635 true)))

(assert (=> b!477081 t!15074))

(declare-fun b_and!20787 () Bool)

(assert (= b_and!20785 (and (=> t!15074 result!7635) b_and!20787)))

(declare-fun m!459685 () Bool)

(assert (=> b!477081 m!459685))

(declare-fun m!459687 () Bool)

(assert (=> b!477082 m!459687))

(assert (=> b!476888 d!76063))

(declare-fun d!76065 () Bool)

(assert (=> d!76065 (= (isEmpty!610 (toList!3931 lm!215)) ((_ is Nil!8959) (toList!3931 lm!215)))))

(assert (=> d!75989 d!76065))

(declare-fun d!76067 () Bool)

(declare-fun res!284841 () Bool)

(declare-fun e!280311 () Bool)

(assert (=> d!76067 (=> res!284841 e!280311)))

(assert (=> d!76067 (= res!284841 (or ((_ is Nil!8959) (toList!3931 lm!215)) ((_ is Nil!8959) (t!15018 (toList!3931 lm!215)))))))

(assert (=> d!76067 (= (isStrictlySorted!375 (toList!3931 lm!215)) e!280311)))

(declare-fun b!477101 () Bool)

(declare-fun e!280312 () Bool)

(assert (=> b!477101 (= e!280311 e!280312)))

(declare-fun res!284842 () Bool)

(assert (=> b!477101 (=> (not res!284842) (not e!280312))))

(assert (=> b!477101 (= res!284842 (bvslt (_1!4469 (h!9814 (toList!3931 lm!215))) (_1!4469 (h!9814 (t!15018 (toList!3931 lm!215))))))))

(declare-fun b!477102 () Bool)

(assert (=> b!477102 (= e!280312 (isStrictlySorted!375 (t!15018 (toList!3931 lm!215))))))

(assert (= (and d!76067 (not res!284841)) b!477101))

(assert (= (and b!477101 res!284842) b!477102))

(declare-fun m!459703 () Bool)

(assert (=> b!477102 m!459703))

(assert (=> d!75947 d!76067))

(declare-fun d!76073 () Bool)

(declare-fun e!280317 () Bool)

(assert (=> d!76073 e!280317))

(declare-fun res!284843 () Bool)

(assert (=> d!76073 (=> res!284843 e!280317)))

(declare-fun lt!217487 () Bool)

(assert (=> d!76073 (= res!284843 (not lt!217487))))

(declare-fun lt!217488 () Bool)

(assert (=> d!76073 (= lt!217487 lt!217488)))

(declare-fun lt!217489 () Unit!14006)

(declare-fun e!280318 () Unit!14006)

(assert (=> d!76073 (= lt!217489 e!280318)))

(declare-fun c!57389 () Bool)

(assert (=> d!76073 (= c!57389 lt!217488)))

(assert (=> d!76073 (= lt!217488 (containsKey!348 (toList!3931 lt!217429) (_1!4469 lt!217355)))))

(assert (=> d!76073 (= (contains!2550 lt!217429 (_1!4469 lt!217355)) lt!217487)))

(declare-fun b!477109 () Bool)

(declare-fun lt!217490 () Unit!14006)

(assert (=> b!477109 (= e!280318 lt!217490)))

(assert (=> b!477109 (= lt!217490 (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3931 lt!217429) (_1!4469 lt!217355)))))

(assert (=> b!477109 (isDefined!297 (getValueByKey!388 (toList!3931 lt!217429) (_1!4469 lt!217355)))))

(declare-fun b!477110 () Bool)

(declare-fun Unit!14014 () Unit!14006)

(assert (=> b!477110 (= e!280318 Unit!14014)))

(declare-fun b!477111 () Bool)

(assert (=> b!477111 (= e!280317 (isDefined!297 (getValueByKey!388 (toList!3931 lt!217429) (_1!4469 lt!217355))))))

(assert (= (and d!76073 c!57389) b!477109))

(assert (= (and d!76073 (not c!57389)) b!477110))

(assert (= (and d!76073 (not res!284843)) b!477111))

(declare-fun m!459705 () Bool)

(assert (=> d!76073 m!459705))

(declare-fun m!459707 () Bool)

(assert (=> b!477109 m!459707))

(assert (=> b!477109 m!459523))

(assert (=> b!477109 m!459523))

(declare-fun m!459709 () Bool)

(assert (=> b!477109 m!459709))

(assert (=> b!477111 m!459523))

(assert (=> b!477111 m!459523))

(assert (=> b!477111 m!459709))

(assert (=> d!75979 d!76073))

(declare-fun b!477112 () Bool)

(declare-fun e!280319 () Option!394)

(assert (=> b!477112 (= e!280319 (Some!393 (_2!4469 (h!9814 lt!217430))))))

(declare-fun b!477113 () Bool)

(declare-fun e!280320 () Option!394)

(assert (=> b!477113 (= e!280319 e!280320)))

(declare-fun c!57391 () Bool)

(assert (=> b!477113 (= c!57391 (and ((_ is Cons!8958) lt!217430) (not (= (_1!4469 (h!9814 lt!217430)) (_1!4469 lt!217355)))))))

(declare-fun b!477115 () Bool)

(assert (=> b!477115 (= e!280320 None!392)))

(declare-fun b!477114 () Bool)

(assert (=> b!477114 (= e!280320 (getValueByKey!388 (t!15018 lt!217430) (_1!4469 lt!217355)))))

(declare-fun d!76075 () Bool)

(declare-fun c!57390 () Bool)

(assert (=> d!76075 (= c!57390 (and ((_ is Cons!8958) lt!217430) (= (_1!4469 (h!9814 lt!217430)) (_1!4469 lt!217355))))))

(assert (=> d!76075 (= (getValueByKey!388 lt!217430 (_1!4469 lt!217355)) e!280319)))

(assert (= (and d!76075 c!57390) b!477112))

(assert (= (and d!76075 (not c!57390)) b!477113))

(assert (= (and b!477113 c!57391) b!477114))

(assert (= (and b!477113 (not c!57391)) b!477115))

(declare-fun m!459711 () Bool)

(assert (=> b!477114 m!459711))

(assert (=> d!75979 d!76075))

(declare-fun d!76077 () Bool)

(assert (=> d!76077 (= (getValueByKey!388 lt!217430 (_1!4469 lt!217355)) (Some!393 (_2!4469 lt!217355)))))

(declare-fun lt!217491 () Unit!14006)

(assert (=> d!76077 (= lt!217491 (choose!1371 lt!217430 (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(declare-fun e!280321 () Bool)

(assert (=> d!76077 e!280321))

(declare-fun res!284844 () Bool)

(assert (=> d!76077 (=> (not res!284844) (not e!280321))))

(assert (=> d!76077 (= res!284844 (isStrictlySorted!375 lt!217430))))

(assert (=> d!76077 (= (lemmaContainsTupThenGetReturnValue!210 lt!217430 (_1!4469 lt!217355) (_2!4469 lt!217355)) lt!217491)))

(declare-fun b!477116 () Bool)

(declare-fun res!284845 () Bool)

(assert (=> b!477116 (=> (not res!284845) (not e!280321))))

(assert (=> b!477116 (= res!284845 (containsKey!348 lt!217430 (_1!4469 lt!217355)))))

(declare-fun b!477117 () Bool)

(assert (=> b!477117 (= e!280321 (contains!2552 lt!217430 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(assert (= (and d!76077 res!284844) b!477116))

(assert (= (and b!477116 res!284845) b!477117))

(assert (=> d!76077 m!459517))

(declare-fun m!459713 () Bool)

(assert (=> d!76077 m!459713))

(declare-fun m!459715 () Bool)

(assert (=> d!76077 m!459715))

(declare-fun m!459717 () Bool)

(assert (=> b!477116 m!459717))

(declare-fun m!459719 () Bool)

(assert (=> b!477117 m!459719))

(assert (=> d!75979 d!76077))

(declare-fun b!477123 () Bool)

(declare-fun e!280324 () List!8962)

(declare-fun call!30728 () List!8962)

(assert (=> b!477123 (= e!280324 call!30728)))

(declare-fun c!57394 () Bool)

(declare-fun e!280327 () List!8962)

(declare-fun c!57397 () Bool)

(declare-fun b!477124 () Bool)

(assert (=> b!477124 (= e!280327 (ite c!57394 (t!15018 (toList!3931 lm!215)) (ite c!57397 (Cons!8958 (h!9814 (toList!3931 lm!215)) (t!15018 (toList!3931 lm!215))) Nil!8959)))))

(declare-fun b!477125 () Bool)

(declare-fun e!280325 () List!8962)

(declare-fun e!280328 () List!8962)

(assert (=> b!477125 (= e!280325 e!280328)))

(assert (=> b!477125 (= c!57394 (and ((_ is Cons!8958) (toList!3931 lm!215)) (= (_1!4469 (h!9814 (toList!3931 lm!215))) (_1!4469 lt!217355))))))

(declare-fun b!477126 () Bool)

(declare-fun res!284846 () Bool)

(declare-fun e!280326 () Bool)

(assert (=> b!477126 (=> (not res!284846) (not e!280326))))

(declare-fun lt!217492 () List!8962)

(assert (=> b!477126 (= res!284846 (containsKey!348 lt!217492 (_1!4469 lt!217355)))))

(declare-fun b!477127 () Bool)

(declare-fun call!30726 () List!8962)

(assert (=> b!477127 (= e!280328 call!30726)))

(declare-fun bm!30723 () Bool)

(assert (=> bm!30723 (= call!30728 call!30726)))

(declare-fun bm!30724 () Bool)

(declare-fun call!30727 () List!8962)

(assert (=> bm!30724 (= call!30726 call!30727)))

(declare-fun c!57395 () Bool)

(declare-fun bm!30725 () Bool)

(assert (=> bm!30725 (= call!30727 ($colon$colon!109 e!280327 (ite c!57395 (h!9814 (toList!3931 lm!215)) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355)))))))

(declare-fun c!57396 () Bool)

(assert (=> bm!30725 (= c!57396 c!57395)))

(declare-fun d!76079 () Bool)

(assert (=> d!76079 e!280326))

(declare-fun res!284847 () Bool)

(assert (=> d!76079 (=> (not res!284847) (not e!280326))))

(assert (=> d!76079 (= res!284847 (isStrictlySorted!375 lt!217492))))

(assert (=> d!76079 (= lt!217492 e!280325)))

(assert (=> d!76079 (= c!57395 (and ((_ is Cons!8958) (toList!3931 lm!215)) (bvslt (_1!4469 (h!9814 (toList!3931 lm!215))) (_1!4469 lt!217355))))))

(assert (=> d!76079 (isStrictlySorted!375 (toList!3931 lm!215))))

(assert (=> d!76079 (= (insertStrictlySorted!213 (toList!3931 lm!215) (_1!4469 lt!217355) (_2!4469 lt!217355)) lt!217492)))

(declare-fun b!477122 () Bool)

(assert (=> b!477122 (= e!280325 call!30727)))

(declare-fun b!477128 () Bool)

(assert (=> b!477128 (= e!280327 (insertStrictlySorted!213 (t!15018 (toList!3931 lm!215)) (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(declare-fun b!477129 () Bool)

(assert (=> b!477129 (= e!280324 call!30728)))

(declare-fun b!477130 () Bool)

(assert (=> b!477130 (= e!280326 (contains!2552 lt!217492 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun b!477131 () Bool)

(assert (=> b!477131 (= c!57397 (and ((_ is Cons!8958) (toList!3931 lm!215)) (bvsgt (_1!4469 (h!9814 (toList!3931 lm!215))) (_1!4469 lt!217355))))))

(assert (=> b!477131 (= e!280328 e!280324)))

(assert (= (and d!76079 c!57395) b!477122))

(assert (= (and d!76079 (not c!57395)) b!477125))

(assert (= (and b!477125 c!57394) b!477127))

(assert (= (and b!477125 (not c!57394)) b!477131))

(assert (= (and b!477131 c!57397) b!477123))

(assert (= (and b!477131 (not c!57397)) b!477129))

(assert (= (or b!477123 b!477129) bm!30723))

(assert (= (or b!477127 bm!30723) bm!30724))

(assert (= (or b!477122 bm!30724) bm!30725))

(assert (= (and bm!30725 c!57396) b!477128))

(assert (= (and bm!30725 (not c!57396)) b!477124))

(assert (= (and d!76079 res!284847) b!477126))

(assert (= (and b!477126 res!284846) b!477130))

(declare-fun m!459723 () Bool)

(assert (=> b!477126 m!459723))

(declare-fun m!459725 () Bool)

(assert (=> d!76079 m!459725))

(assert (=> d!76079 m!459401))

(declare-fun m!459729 () Bool)

(assert (=> bm!30725 m!459729))

(declare-fun m!459731 () Bool)

(assert (=> b!477128 m!459731))

(declare-fun m!459735 () Bool)

(assert (=> b!477130 m!459735))

(assert (=> d!75979 d!76079))

(declare-fun d!76085 () Bool)

(declare-fun res!284852 () Bool)

(declare-fun e!280333 () Bool)

(assert (=> d!76085 (=> res!284852 e!280333)))

(assert (=> d!76085 (= res!284852 ((_ is Nil!8959) (t!15018 (toList!3931 (+!1772 lm!215 lt!217355)))))))

(assert (=> d!76085 (= (forall!197 (t!15018 (toList!3931 (+!1772 lm!215 lt!217355))) p!166) e!280333)))

(declare-fun b!477136 () Bool)

(declare-fun e!280334 () Bool)

(assert (=> b!477136 (= e!280333 e!280334)))

(declare-fun res!284853 () Bool)

(assert (=> b!477136 (=> (not res!284853) (not e!280334))))

(assert (=> b!477136 (= res!284853 (dynLambda!941 p!166 (h!9814 (t!15018 (toList!3931 (+!1772 lm!215 lt!217355))))))))

(declare-fun b!477137 () Bool)

(assert (=> b!477137 (= e!280334 (forall!197 (t!15018 (t!15018 (toList!3931 (+!1772 lm!215 lt!217355)))) p!166))))

(assert (= (and d!76085 (not res!284852)) b!477136))

(assert (= (and b!477136 res!284853) b!477137))

(declare-fun b_lambda!10623 () Bool)

(assert (=> (not b_lambda!10623) (not b!477136)))

(declare-fun t!15078 () Bool)

(declare-fun tb!4071 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15078) tb!4071))

(declare-fun result!7639 () Bool)

(assert (=> tb!4071 (= result!7639 true)))

(assert (=> b!477136 t!15078))

(declare-fun b_and!20791 () Bool)

(assert (= b_and!20787 (and (=> t!15078 result!7639) b_and!20791)))

(declare-fun m!459743 () Bool)

(assert (=> b!477136 m!459743))

(declare-fun m!459745 () Bool)

(assert (=> b!477137 m!459745))

(assert (=> b!476920 d!76085))

(declare-fun b!477138 () Bool)

(declare-fun e!280335 () Bool)

(declare-fun tp!42419 () Bool)

(assert (=> b!477138 (= e!280335 (and tp_is_empty!13525 tp!42419))))

(assert (=> b!476939 (= tp!42418 e!280335)))

(assert (= (and b!476939 ((_ is Cons!8958) (t!15018 (toList!3931 lm!215)))) b!477138))

(declare-fun b_lambda!10625 () Bool)

(assert (= b_lambda!10617 (or (and start!42850 b_free!12103) b_lambda!10625)))

(declare-fun b_lambda!10627 () Bool)

(assert (= b_lambda!10611 (or (and start!42850 b_free!12103) b_lambda!10627)))

(declare-fun b_lambda!10629 () Bool)

(assert (= b_lambda!10607 (or (and start!42850 b_free!12103) b_lambda!10629)))

(declare-fun b_lambda!10631 () Bool)

(assert (= b_lambda!10619 (or (and start!42850 b_free!12103) b_lambda!10631)))

(declare-fun b_lambda!10633 () Bool)

(assert (= b_lambda!10623 (or (and start!42850 b_free!12103) b_lambda!10633)))

(check-sat (not d!76055) (not b!477070) (not b!477041) (not b!477027) (not b_next!12103) (not b!476958) (not b_lambda!10627) (not d!75999) (not b_lambda!10633) (not bm!30722) (not d!76079) (not b!477061) (not b_lambda!10625) (not b!477111) (not b!477130) (not bm!30725) (not b!477109) (not b!477128) (not b!477038) (not b!476950) (not b!476970) (not b_lambda!10597) (not d!76003) (not b!477114) (not b!477071) (not d!76005) (not b!477137) (not b!477025) (not b_lambda!10629) (not d!76077) (not b!477138) (not b_lambda!10539) tp_is_empty!13525 (not b!477057) (not b!476960) (not d!76047) (not d!76053) (not d!76073) (not b_lambda!10631) (not b!477116) (not b!476969) (not b!477032) (not b_lambda!10599) (not b!477082) (not b!477126) (not d!76041) (not b!476963) (not b!477102) (not b!477029) (not b_lambda!10591) (not b_lambda!10593) b_and!20791 (not b!477067) (not b_lambda!10595) (not b!477117))
(check-sat b_and!20791 (not b_next!12103))
(get-model)

(declare-fun d!76129 () Bool)

(declare-fun lt!217528 () Bool)

(assert (=> d!76129 (= lt!217528 (select (content!209 (t!15018 (toList!3931 lt!217429))) lt!217355))))

(declare-fun e!280416 () Bool)

(assert (=> d!76129 (= lt!217528 e!280416)))

(declare-fun res!284899 () Bool)

(assert (=> d!76129 (=> (not res!284899) (not e!280416))))

(assert (=> d!76129 (= res!284899 ((_ is Cons!8958) (t!15018 (toList!3931 lt!217429))))))

(assert (=> d!76129 (= (contains!2552 (t!15018 (toList!3931 lt!217429)) lt!217355) lt!217528)))

(declare-fun b!477276 () Bool)

(declare-fun e!280415 () Bool)

(assert (=> b!477276 (= e!280416 e!280415)))

(declare-fun res!284900 () Bool)

(assert (=> b!477276 (=> res!284900 e!280415)))

(assert (=> b!477276 (= res!284900 (= (h!9814 (t!15018 (toList!3931 lt!217429))) lt!217355))))

(declare-fun b!477277 () Bool)

(assert (=> b!477277 (= e!280415 (contains!2552 (t!15018 (t!15018 (toList!3931 lt!217429))) lt!217355))))

(assert (= (and d!76129 res!284899) b!477276))

(assert (= (and b!477276 (not res!284900)) b!477277))

(declare-fun m!459861 () Bool)

(assert (=> d!76129 m!459861))

(declare-fun m!459863 () Bool)

(assert (=> d!76129 m!459863))

(declare-fun m!459865 () Bool)

(assert (=> b!477277 m!459865))

(assert (=> b!477057 d!76129))

(declare-fun d!76131 () Bool)

(assert (=> d!76131 (= ($colon$colon!109 e!280256 (ite c!57375 (h!9814 (toList!3931 lt!217354)) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355)))) (Cons!8958 (ite c!57375 (h!9814 (toList!3931 lt!217354)) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))) e!280256))))

(assert (=> bm!30722 d!76131))

(declare-fun d!76133 () Bool)

(declare-fun res!284901 () Bool)

(declare-fun e!280417 () Bool)

(assert (=> d!76133 (=> res!284901 e!280417)))

(assert (=> d!76133 (= res!284901 (or ((_ is Nil!8959) lt!217456) ((_ is Nil!8959) (t!15018 lt!217456))))))

(assert (=> d!76133 (= (isStrictlySorted!375 lt!217456) e!280417)))

(declare-fun b!477278 () Bool)

(declare-fun e!280418 () Bool)

(assert (=> b!477278 (= e!280417 e!280418)))

(declare-fun res!284902 () Bool)

(assert (=> b!477278 (=> (not res!284902) (not e!280418))))

(assert (=> b!477278 (= res!284902 (bvslt (_1!4469 (h!9814 lt!217456)) (_1!4469 (h!9814 (t!15018 lt!217456)))))))

(declare-fun b!477279 () Bool)

(assert (=> b!477279 (= e!280418 (isStrictlySorted!375 (t!15018 lt!217456)))))

(assert (= (and d!76133 (not res!284901)) b!477278))

(assert (= (and b!477278 res!284902) b!477279))

(declare-fun m!459867 () Bool)

(assert (=> b!477279 m!459867))

(assert (=> d!76005 d!76133))

(declare-fun d!76135 () Bool)

(declare-fun res!284903 () Bool)

(declare-fun e!280419 () Bool)

(assert (=> d!76135 (=> res!284903 e!280419)))

(assert (=> d!76135 (= res!284903 (or ((_ is Nil!8959) (toList!3931 lt!217354)) ((_ is Nil!8959) (t!15018 (toList!3931 lt!217354)))))))

(assert (=> d!76135 (= (isStrictlySorted!375 (toList!3931 lt!217354)) e!280419)))

(declare-fun b!477280 () Bool)

(declare-fun e!280420 () Bool)

(assert (=> b!477280 (= e!280419 e!280420)))

(declare-fun res!284904 () Bool)

(assert (=> b!477280 (=> (not res!284904) (not e!280420))))

(assert (=> b!477280 (= res!284904 (bvslt (_1!4469 (h!9814 (toList!3931 lt!217354))) (_1!4469 (h!9814 (t!15018 (toList!3931 lt!217354))))))))

(declare-fun b!477281 () Bool)

(assert (=> b!477281 (= e!280420 (isStrictlySorted!375 (t!15018 (toList!3931 lt!217354))))))

(assert (= (and d!76135 (not res!284903)) b!477280))

(assert (= (and b!477280 res!284904) b!477281))

(declare-fun m!459869 () Bool)

(assert (=> b!477281 m!459869))

(assert (=> d!76005 d!76135))

(assert (=> d!76077 d!76075))

(declare-fun d!76137 () Bool)

(assert (=> d!76137 (= (getValueByKey!388 lt!217430 (_1!4469 lt!217355)) (Some!393 (_2!4469 lt!217355)))))

(assert (=> d!76137 true))

(declare-fun _$22!547 () Unit!14006)

(assert (=> d!76137 (= (choose!1371 lt!217430 (_1!4469 lt!217355) (_2!4469 lt!217355)) _$22!547)))

(declare-fun bs!15187 () Bool)

(assert (= bs!15187 d!76137))

(assert (=> bs!15187 m!459517))

(assert (=> d!76077 d!76137))

(declare-fun d!76139 () Bool)

(declare-fun res!284905 () Bool)

(declare-fun e!280421 () Bool)

(assert (=> d!76139 (=> res!284905 e!280421)))

(assert (=> d!76139 (= res!284905 (or ((_ is Nil!8959) lt!217430) ((_ is Nil!8959) (t!15018 lt!217430))))))

(assert (=> d!76139 (= (isStrictlySorted!375 lt!217430) e!280421)))

(declare-fun b!477282 () Bool)

(declare-fun e!280422 () Bool)

(assert (=> b!477282 (= e!280421 e!280422)))

(declare-fun res!284906 () Bool)

(assert (=> b!477282 (=> (not res!284906) (not e!280422))))

(assert (=> b!477282 (= res!284906 (bvslt (_1!4469 (h!9814 lt!217430)) (_1!4469 (h!9814 (t!15018 lt!217430)))))))

(declare-fun b!477283 () Bool)

(assert (=> b!477283 (= e!280422 (isStrictlySorted!375 (t!15018 lt!217430)))))

(assert (= (and d!76139 (not res!284905)) b!477282))

(assert (= (and b!477282 res!284906) b!477283))

(declare-fun m!459871 () Bool)

(assert (=> b!477283 m!459871))

(assert (=> d!76077 d!76139))

(declare-fun d!76141 () Bool)

(assert (=> d!76141 (isDefined!297 (getValueByKey!388 (toList!3931 lt!217429) (_1!4469 lt!217355)))))

(declare-fun lt!217531 () Unit!14006)

(declare-fun choose!1374 (List!8962 (_ BitVec 64)) Unit!14006)

(assert (=> d!76141 (= lt!217531 (choose!1374 (toList!3931 lt!217429) (_1!4469 lt!217355)))))

(declare-fun e!280425 () Bool)

(assert (=> d!76141 e!280425))

(declare-fun res!284909 () Bool)

(assert (=> d!76141 (=> (not res!284909) (not e!280425))))

(assert (=> d!76141 (= res!284909 (isStrictlySorted!375 (toList!3931 lt!217429)))))

(assert (=> d!76141 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3931 lt!217429) (_1!4469 lt!217355)) lt!217531)))

(declare-fun b!477286 () Bool)

(assert (=> b!477286 (= e!280425 (containsKey!348 (toList!3931 lt!217429) (_1!4469 lt!217355)))))

(assert (= (and d!76141 res!284909) b!477286))

(assert (=> d!76141 m!459523))

(assert (=> d!76141 m!459523))

(assert (=> d!76141 m!459709))

(declare-fun m!459873 () Bool)

(assert (=> d!76141 m!459873))

(declare-fun m!459875 () Bool)

(assert (=> d!76141 m!459875))

(assert (=> b!477286 m!459705))

(assert (=> b!477109 d!76141))

(declare-fun d!76143 () Bool)

(declare-fun isEmpty!613 (Option!394) Bool)

(assert (=> d!76143 (= (isDefined!297 (getValueByKey!388 (toList!3931 lt!217429) (_1!4469 lt!217355))) (not (isEmpty!613 (getValueByKey!388 (toList!3931 lt!217429) (_1!4469 lt!217355)))))))

(declare-fun bs!15188 () Bool)

(assert (= bs!15188 d!76143))

(assert (=> bs!15188 m!459523))

(declare-fun m!459877 () Bool)

(assert (=> bs!15188 m!459877))

(assert (=> b!477109 d!76143))

(assert (=> b!477109 d!76029))

(declare-fun d!76145 () Bool)

(assert (=> d!76145 (isDefined!297 (getValueByKey!388 (toList!3931 lt!217421) (_1!4469 lt!217355)))))

(declare-fun lt!217532 () Unit!14006)

(assert (=> d!76145 (= lt!217532 (choose!1374 (toList!3931 lt!217421) (_1!4469 lt!217355)))))

(declare-fun e!280426 () Bool)

(assert (=> d!76145 e!280426))

(declare-fun res!284910 () Bool)

(assert (=> d!76145 (=> (not res!284910) (not e!280426))))

(assert (=> d!76145 (= res!284910 (isStrictlySorted!375 (toList!3931 lt!217421)))))

(assert (=> d!76145 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3931 lt!217421) (_1!4469 lt!217355)) lt!217532)))

(declare-fun b!477287 () Bool)

(assert (=> b!477287 (= e!280426 (containsKey!348 (toList!3931 lt!217421) (_1!4469 lt!217355)))))

(assert (= (and d!76145 res!284910) b!477287))

(assert (=> d!76145 m!459499))

(assert (=> d!76145 m!459499))

(assert (=> d!76145 m!459555))

(declare-fun m!459879 () Bool)

(assert (=> d!76145 m!459879))

(declare-fun m!459881 () Bool)

(assert (=> d!76145 m!459881))

(assert (=> b!477287 m!459551))

(assert (=> b!476958 d!76145))

(declare-fun d!76147 () Bool)

(assert (=> d!76147 (= (isDefined!297 (getValueByKey!388 (toList!3931 lt!217421) (_1!4469 lt!217355))) (not (isEmpty!613 (getValueByKey!388 (toList!3931 lt!217421) (_1!4469 lt!217355)))))))

(declare-fun bs!15189 () Bool)

(assert (= bs!15189 d!76147))

(assert (=> bs!15189 m!459499))

(declare-fun m!459883 () Bool)

(assert (=> bs!15189 m!459883))

(assert (=> b!476958 d!76147))

(assert (=> b!476958 d!75997))

(declare-fun d!76149 () Bool)

(declare-fun res!284915 () Bool)

(declare-fun e!280431 () Bool)

(assert (=> d!76149 (=> res!284915 e!280431)))

(assert (=> d!76149 (= res!284915 (and ((_ is Cons!8958) lt!217492) (= (_1!4469 (h!9814 lt!217492)) (_1!4469 lt!217355))))))

(assert (=> d!76149 (= (containsKey!348 lt!217492 (_1!4469 lt!217355)) e!280431)))

(declare-fun b!477292 () Bool)

(declare-fun e!280432 () Bool)

(assert (=> b!477292 (= e!280431 e!280432)))

(declare-fun res!284916 () Bool)

(assert (=> b!477292 (=> (not res!284916) (not e!280432))))

(assert (=> b!477292 (= res!284916 (and (or (not ((_ is Cons!8958) lt!217492)) (bvsle (_1!4469 (h!9814 lt!217492)) (_1!4469 lt!217355))) ((_ is Cons!8958) lt!217492) (bvslt (_1!4469 (h!9814 lt!217492)) (_1!4469 lt!217355))))))

(declare-fun b!477293 () Bool)

(assert (=> b!477293 (= e!280432 (containsKey!348 (t!15018 lt!217492) (_1!4469 lt!217355)))))

(assert (= (and d!76149 (not res!284915)) b!477292))

(assert (= (and b!477292 res!284916) b!477293))

(declare-fun m!459885 () Bool)

(assert (=> b!477293 m!459885))

(assert (=> b!477126 d!76149))

(assert (=> b!477111 d!76143))

(assert (=> b!477111 d!76029))

(assert (=> d!76003 d!76001))

(declare-fun d!76151 () Bool)

(assert (=> d!76151 (= (getValueByKey!388 lt!217422 (_1!4469 lt!217355)) (Some!393 (_2!4469 lt!217355)))))

(assert (=> d!76151 true))

(declare-fun _$22!548 () Unit!14006)

(assert (=> d!76151 (= (choose!1371 lt!217422 (_1!4469 lt!217355) (_2!4469 lt!217355)) _$22!548)))

(declare-fun bs!15190 () Bool)

(assert (= bs!15190 d!76151))

(assert (=> bs!15190 m!459489))

(assert (=> d!76003 d!76151))

(declare-fun d!76153 () Bool)

(declare-fun res!284917 () Bool)

(declare-fun e!280433 () Bool)

(assert (=> d!76153 (=> res!284917 e!280433)))

(assert (=> d!76153 (= res!284917 (or ((_ is Nil!8959) lt!217422) ((_ is Nil!8959) (t!15018 lt!217422))))))

(assert (=> d!76153 (= (isStrictlySorted!375 lt!217422) e!280433)))

(declare-fun b!477294 () Bool)

(declare-fun e!280434 () Bool)

(assert (=> b!477294 (= e!280433 e!280434)))

(declare-fun res!284918 () Bool)

(assert (=> b!477294 (=> (not res!284918) (not e!280434))))

(assert (=> b!477294 (= res!284918 (bvslt (_1!4469 (h!9814 lt!217422)) (_1!4469 (h!9814 (t!15018 lt!217422)))))))

(declare-fun b!477295 () Bool)

(assert (=> b!477295 (= e!280434 (isStrictlySorted!375 (t!15018 lt!217422)))))

(assert (= (and d!76153 (not res!284917)) b!477294))

(assert (= (and b!477294 res!284918) b!477295))

(declare-fun m!459887 () Bool)

(assert (=> b!477295 m!459887))

(assert (=> d!76003 d!76153))

(declare-fun d!76155 () Bool)

(declare-fun lt!217533 () Bool)

(assert (=> d!76155 (= lt!217533 (select (content!209 lt!217456) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun e!280436 () Bool)

(assert (=> d!76155 (= lt!217533 e!280436)))

(declare-fun res!284919 () Bool)

(assert (=> d!76155 (=> (not res!284919) (not e!280436))))

(assert (=> d!76155 (= res!284919 ((_ is Cons!8958) lt!217456))))

(assert (=> d!76155 (= (contains!2552 lt!217456 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))) lt!217533)))

(declare-fun b!477296 () Bool)

(declare-fun e!280435 () Bool)

(assert (=> b!477296 (= e!280436 e!280435)))

(declare-fun res!284920 () Bool)

(assert (=> b!477296 (=> res!284920 e!280435)))

(assert (=> b!477296 (= res!284920 (= (h!9814 lt!217456) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun b!477297 () Bool)

(assert (=> b!477297 (= e!280435 (contains!2552 (t!15018 lt!217456) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(assert (= (and d!76155 res!284919) b!477296))

(assert (= (and b!477296 (not res!284920)) b!477297))

(declare-fun m!459889 () Bool)

(assert (=> d!76155 m!459889))

(declare-fun m!459891 () Bool)

(assert (=> d!76155 m!459891))

(declare-fun m!459893 () Bool)

(assert (=> b!477297 m!459893))

(assert (=> b!477029 d!76155))

(declare-fun d!76157 () Bool)

(declare-fun res!284921 () Bool)

(declare-fun e!280437 () Bool)

(assert (=> d!76157 (=> res!284921 e!280437)))

(assert (=> d!76157 (= res!284921 (or ((_ is Nil!8959) lt!217492) ((_ is Nil!8959) (t!15018 lt!217492))))))

(assert (=> d!76157 (= (isStrictlySorted!375 lt!217492) e!280437)))

(declare-fun b!477298 () Bool)

(declare-fun e!280438 () Bool)

(assert (=> b!477298 (= e!280437 e!280438)))

(declare-fun res!284922 () Bool)

(assert (=> b!477298 (=> (not res!284922) (not e!280438))))

(assert (=> b!477298 (= res!284922 (bvslt (_1!4469 (h!9814 lt!217492)) (_1!4469 (h!9814 (t!15018 lt!217492)))))))

(declare-fun b!477299 () Bool)

(assert (=> b!477299 (= e!280438 (isStrictlySorted!375 (t!15018 lt!217492)))))

(assert (= (and d!76157 (not res!284921)) b!477298))

(assert (= (and b!477298 res!284922) b!477299))

(declare-fun m!459895 () Bool)

(assert (=> b!477299 m!459895))

(assert (=> d!76079 d!76157))

(assert (=> d!76079 d!76067))

(declare-fun b!477301 () Bool)

(declare-fun e!280439 () List!8962)

(declare-fun call!30755 () List!8962)

(assert (=> b!477301 (= e!280439 call!30755)))

(declare-fun b!477302 () Bool)

(declare-fun c!57446 () Bool)

(declare-fun e!280442 () List!8962)

(declare-fun c!57443 () Bool)

(assert (=> b!477302 (= e!280442 (ite c!57443 (t!15018 (t!15018 (toList!3931 lt!217354))) (ite c!57446 (Cons!8958 (h!9814 (t!15018 (toList!3931 lt!217354))) (t!15018 (t!15018 (toList!3931 lt!217354)))) Nil!8959)))))

(declare-fun b!477303 () Bool)

(declare-fun e!280440 () List!8962)

(declare-fun e!280443 () List!8962)

(assert (=> b!477303 (= e!280440 e!280443)))

(assert (=> b!477303 (= c!57443 (and ((_ is Cons!8958) (t!15018 (toList!3931 lt!217354))) (= (_1!4469 (h!9814 (t!15018 (toList!3931 lt!217354)))) (_1!4469 lt!217355))))))

(declare-fun b!477304 () Bool)

(declare-fun res!284923 () Bool)

(declare-fun e!280441 () Bool)

(assert (=> b!477304 (=> (not res!284923) (not e!280441))))

(declare-fun lt!217534 () List!8962)

(assert (=> b!477304 (= res!284923 (containsKey!348 lt!217534 (_1!4469 lt!217355)))))

(declare-fun b!477305 () Bool)

(declare-fun call!30753 () List!8962)

(assert (=> b!477305 (= e!280443 call!30753)))

(declare-fun bm!30750 () Bool)

(assert (=> bm!30750 (= call!30755 call!30753)))

(declare-fun bm!30751 () Bool)

(declare-fun call!30754 () List!8962)

(assert (=> bm!30751 (= call!30753 call!30754)))

(declare-fun bm!30752 () Bool)

(declare-fun c!57444 () Bool)

(assert (=> bm!30752 (= call!30754 ($colon$colon!109 e!280442 (ite c!57444 (h!9814 (t!15018 (toList!3931 lt!217354))) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355)))))))

(declare-fun c!57445 () Bool)

(assert (=> bm!30752 (= c!57445 c!57444)))

(declare-fun d!76159 () Bool)

(assert (=> d!76159 e!280441))

(declare-fun res!284924 () Bool)

(assert (=> d!76159 (=> (not res!284924) (not e!280441))))

(assert (=> d!76159 (= res!284924 (isStrictlySorted!375 lt!217534))))

(assert (=> d!76159 (= lt!217534 e!280440)))

(assert (=> d!76159 (= c!57444 (and ((_ is Cons!8958) (t!15018 (toList!3931 lt!217354))) (bvslt (_1!4469 (h!9814 (t!15018 (toList!3931 lt!217354)))) (_1!4469 lt!217355))))))

(assert (=> d!76159 (isStrictlySorted!375 (t!15018 (toList!3931 lt!217354)))))

(assert (=> d!76159 (= (insertStrictlySorted!213 (t!15018 (toList!3931 lt!217354)) (_1!4469 lt!217355) (_2!4469 lt!217355)) lt!217534)))

(declare-fun b!477300 () Bool)

(assert (=> b!477300 (= e!280440 call!30754)))

(declare-fun b!477306 () Bool)

(assert (=> b!477306 (= e!280442 (insertStrictlySorted!213 (t!15018 (t!15018 (toList!3931 lt!217354))) (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(declare-fun b!477307 () Bool)

(assert (=> b!477307 (= e!280439 call!30755)))

(declare-fun b!477308 () Bool)

(assert (=> b!477308 (= e!280441 (contains!2552 lt!217534 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun b!477309 () Bool)

(assert (=> b!477309 (= c!57446 (and ((_ is Cons!8958) (t!15018 (toList!3931 lt!217354))) (bvsgt (_1!4469 (h!9814 (t!15018 (toList!3931 lt!217354)))) (_1!4469 lt!217355))))))

(assert (=> b!477309 (= e!280443 e!280439)))

(assert (= (and d!76159 c!57444) b!477300))

(assert (= (and d!76159 (not c!57444)) b!477303))

(assert (= (and b!477303 c!57443) b!477305))

(assert (= (and b!477303 (not c!57443)) b!477309))

(assert (= (and b!477309 c!57446) b!477301))

(assert (= (and b!477309 (not c!57446)) b!477307))

(assert (= (or b!477301 b!477307) bm!30750))

(assert (= (or b!477305 bm!30750) bm!30751))

(assert (= (or b!477300 bm!30751) bm!30752))

(assert (= (and bm!30752 c!57445) b!477306))

(assert (= (and bm!30752 (not c!57445)) b!477302))

(assert (= (and d!76159 res!284924) b!477304))

(assert (= (and b!477304 res!284923) b!477308))

(declare-fun m!459897 () Bool)

(assert (=> b!477304 m!459897))

(declare-fun m!459899 () Bool)

(assert (=> d!76159 m!459899))

(assert (=> d!76159 m!459869))

(declare-fun m!459901 () Bool)

(assert (=> bm!30752 m!459901))

(declare-fun m!459903 () Bool)

(assert (=> b!477306 m!459903))

(declare-fun m!459905 () Bool)

(assert (=> b!477308 m!459905))

(assert (=> b!477027 d!76159))

(declare-fun d!76161 () Bool)

(declare-fun res!284925 () Bool)

(declare-fun e!280444 () Bool)

(assert (=> d!76161 (=> res!284925 e!280444)))

(assert (=> d!76161 (= res!284925 ((_ is Nil!8959) (t!15018 (t!15018 (toList!3931 lt!217354)))))))

(assert (=> d!76161 (= (forall!197 (t!15018 (t!15018 (toList!3931 lt!217354))) p!166) e!280444)))

(declare-fun b!477310 () Bool)

(declare-fun e!280445 () Bool)

(assert (=> b!477310 (= e!280444 e!280445)))

(declare-fun res!284926 () Bool)

(assert (=> b!477310 (=> (not res!284926) (not e!280445))))

(assert (=> b!477310 (= res!284926 (dynLambda!941 p!166 (h!9814 (t!15018 (t!15018 (toList!3931 lt!217354))))))))

(declare-fun b!477311 () Bool)

(assert (=> b!477311 (= e!280445 (forall!197 (t!15018 (t!15018 (t!15018 (toList!3931 lt!217354)))) p!166))))

(assert (= (and d!76161 (not res!284925)) b!477310))

(assert (= (and b!477310 res!284926) b!477311))

(declare-fun b_lambda!10661 () Bool)

(assert (=> (not b_lambda!10661) (not b!477310)))

(declare-fun t!15087 () Bool)

(declare-fun tb!4079 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15087) tb!4079))

(declare-fun result!7647 () Bool)

(assert (=> tb!4079 (= result!7647 true)))

(assert (=> b!477310 t!15087))

(declare-fun b_and!20799 () Bool)

(assert (= b_and!20791 (and (=> t!15087 result!7647) b_and!20799)))

(declare-fun m!459907 () Bool)

(assert (=> b!477310 m!459907))

(declare-fun m!459909 () Bool)

(assert (=> b!477311 m!459909))

(assert (=> b!477041 d!76161))

(declare-fun d!76163 () Bool)

(declare-fun res!284927 () Bool)

(declare-fun e!280446 () Bool)

(assert (=> d!76163 (=> res!284927 e!280446)))

(assert (=> d!76163 (= res!284927 ((_ is Nil!8959) (t!15018 (t!15018 (toList!3931 lm!215)))))))

(assert (=> d!76163 (= (forall!197 (t!15018 (t!15018 (toList!3931 lm!215))) p!166) e!280446)))

(declare-fun b!477312 () Bool)

(declare-fun e!280447 () Bool)

(assert (=> b!477312 (= e!280446 e!280447)))

(declare-fun res!284928 () Bool)

(assert (=> b!477312 (=> (not res!284928) (not e!280447))))

(assert (=> b!477312 (= res!284928 (dynLambda!941 p!166 (h!9814 (t!15018 (t!15018 (toList!3931 lm!215))))))))

(declare-fun b!477313 () Bool)

(assert (=> b!477313 (= e!280447 (forall!197 (t!15018 (t!15018 (t!15018 (toList!3931 lm!215)))) p!166))))

(assert (= (and d!76163 (not res!284927)) b!477312))

(assert (= (and b!477312 res!284928) b!477313))

(declare-fun b_lambda!10663 () Bool)

(assert (=> (not b_lambda!10663) (not b!477312)))

(declare-fun t!15089 () Bool)

(declare-fun tb!4081 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15089) tb!4081))

(declare-fun result!7649 () Bool)

(assert (=> tb!4081 (= result!7649 true)))

(assert (=> b!477312 t!15089))

(declare-fun b_and!20801 () Bool)

(assert (= b_and!20799 (and (=> t!15089 result!7649) b_and!20801)))

(declare-fun m!459911 () Bool)

(assert (=> b!477312 m!459911))

(declare-fun m!459913 () Bool)

(assert (=> b!477313 m!459913))

(assert (=> b!477032 d!76163))

(declare-fun b!477314 () Bool)

(declare-fun e!280448 () Option!394)

(assert (=> b!477314 (= e!280448 (Some!393 (_2!4469 (h!9814 (t!15018 (toList!3931 lt!217421))))))))

(declare-fun b!477315 () Bool)

(declare-fun e!280449 () Option!394)

(assert (=> b!477315 (= e!280448 e!280449)))

(declare-fun c!57448 () Bool)

(assert (=> b!477315 (= c!57448 (and ((_ is Cons!8958) (t!15018 (toList!3931 lt!217421))) (not (= (_1!4469 (h!9814 (t!15018 (toList!3931 lt!217421)))) (_1!4469 lt!217355)))))))

(declare-fun b!477317 () Bool)

(assert (=> b!477317 (= e!280449 None!392)))

(declare-fun b!477316 () Bool)

(assert (=> b!477316 (= e!280449 (getValueByKey!388 (t!15018 (t!15018 (toList!3931 lt!217421))) (_1!4469 lt!217355)))))

(declare-fun d!76165 () Bool)

(declare-fun c!57447 () Bool)

(assert (=> d!76165 (= c!57447 (and ((_ is Cons!8958) (t!15018 (toList!3931 lt!217421))) (= (_1!4469 (h!9814 (t!15018 (toList!3931 lt!217421)))) (_1!4469 lt!217355))))))

(assert (=> d!76165 (= (getValueByKey!388 (t!15018 (toList!3931 lt!217421)) (_1!4469 lt!217355)) e!280448)))

(assert (= (and d!76165 c!57447) b!477314))

(assert (= (and d!76165 (not c!57447)) b!477315))

(assert (= (and b!477315 c!57448) b!477316))

(assert (= (and b!477315 (not c!57448)) b!477317))

(declare-fun m!459915 () Bool)

(assert (=> b!477316 m!459915))

(assert (=> b!476950 d!76165))

(declare-fun d!76167 () Bool)

(declare-fun lt!217535 () Bool)

(assert (=> d!76167 (= lt!217535 (select (content!209 (t!15018 (toList!3931 lt!217421))) lt!217355))))

(declare-fun e!280451 () Bool)

(assert (=> d!76167 (= lt!217535 e!280451)))

(declare-fun res!284929 () Bool)

(assert (=> d!76167 (=> (not res!284929) (not e!280451))))

(assert (=> d!76167 (= res!284929 ((_ is Cons!8958) (t!15018 (toList!3931 lt!217421))))))

(assert (=> d!76167 (= (contains!2552 (t!15018 (toList!3931 lt!217421)) lt!217355) lt!217535)))

(declare-fun b!477318 () Bool)

(declare-fun e!280450 () Bool)

(assert (=> b!477318 (= e!280451 e!280450)))

(declare-fun res!284930 () Bool)

(assert (=> b!477318 (=> res!284930 e!280450)))

(assert (=> b!477318 (= res!284930 (= (h!9814 (t!15018 (toList!3931 lt!217421))) lt!217355))))

(declare-fun b!477319 () Bool)

(assert (=> b!477319 (= e!280450 (contains!2552 (t!15018 (t!15018 (toList!3931 lt!217421))) lt!217355))))

(assert (= (and d!76167 res!284929) b!477318))

(assert (= (and b!477318 (not res!284930)) b!477319))

(declare-fun m!459917 () Bool)

(assert (=> d!76167 m!459917))

(declare-fun m!459919 () Bool)

(assert (=> d!76167 m!459919))

(declare-fun m!459921 () Bool)

(assert (=> b!477319 m!459921))

(assert (=> b!477061 d!76167))

(declare-fun d!76169 () Bool)

(assert (=> d!76169 (= ($colon$colon!109 e!280327 (ite c!57395 (h!9814 (toList!3931 lm!215)) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355)))) (Cons!8958 (ite c!57395 (h!9814 (toList!3931 lm!215)) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))) e!280327))))

(assert (=> bm!30725 d!76169))

(declare-fun d!76171 () Bool)

(declare-fun res!284931 () Bool)

(declare-fun e!280452 () Bool)

(assert (=> d!76171 (=> res!284931 e!280452)))

(assert (=> d!76171 (= res!284931 (and ((_ is Cons!8958) lt!217430) (= (_1!4469 (h!9814 lt!217430)) (_1!4469 lt!217355))))))

(assert (=> d!76171 (= (containsKey!348 lt!217430 (_1!4469 lt!217355)) e!280452)))

(declare-fun b!477320 () Bool)

(declare-fun e!280453 () Bool)

(assert (=> b!477320 (= e!280452 e!280453)))

(declare-fun res!284932 () Bool)

(assert (=> b!477320 (=> (not res!284932) (not e!280453))))

(assert (=> b!477320 (= res!284932 (and (or (not ((_ is Cons!8958) lt!217430)) (bvsle (_1!4469 (h!9814 lt!217430)) (_1!4469 lt!217355))) ((_ is Cons!8958) lt!217430) (bvslt (_1!4469 (h!9814 lt!217430)) (_1!4469 lt!217355))))))

(declare-fun b!477321 () Bool)

(assert (=> b!477321 (= e!280453 (containsKey!348 (t!15018 lt!217430) (_1!4469 lt!217355)))))

(assert (= (and d!76171 (not res!284931)) b!477320))

(assert (= (and b!477320 res!284932) b!477321))

(declare-fun m!459923 () Bool)

(assert (=> b!477321 m!459923))

(assert (=> b!477116 d!76171))

(declare-fun b!477322 () Bool)

(declare-fun e!280454 () Option!394)

(assert (=> b!477322 (= e!280454 (Some!393 (_2!4469 (h!9814 (t!15018 (toList!3931 lt!217429))))))))

(declare-fun b!477323 () Bool)

(declare-fun e!280455 () Option!394)

(assert (=> b!477323 (= e!280454 e!280455)))

(declare-fun c!57450 () Bool)

(assert (=> b!477323 (= c!57450 (and ((_ is Cons!8958) (t!15018 (toList!3931 lt!217429))) (not (= (_1!4469 (h!9814 (t!15018 (toList!3931 lt!217429)))) (_1!4469 lt!217355)))))))

(declare-fun b!477325 () Bool)

(assert (=> b!477325 (= e!280455 None!392)))

(declare-fun b!477324 () Bool)

(assert (=> b!477324 (= e!280455 (getValueByKey!388 (t!15018 (t!15018 (toList!3931 lt!217429))) (_1!4469 lt!217355)))))

(declare-fun d!76173 () Bool)

(declare-fun c!57449 () Bool)

(assert (=> d!76173 (= c!57449 (and ((_ is Cons!8958) (t!15018 (toList!3931 lt!217429))) (= (_1!4469 (h!9814 (t!15018 (toList!3931 lt!217429)))) (_1!4469 lt!217355))))))

(assert (=> d!76173 (= (getValueByKey!388 (t!15018 (toList!3931 lt!217429)) (_1!4469 lt!217355)) e!280454)))

(assert (= (and d!76173 c!57449) b!477322))

(assert (= (and d!76173 (not c!57449)) b!477323))

(assert (= (and b!477323 c!57450) b!477324))

(assert (= (and b!477323 (not c!57450)) b!477325))

(declare-fun m!459925 () Bool)

(assert (=> b!477324 m!459925))

(assert (=> b!477038 d!76173))

(assert (=> b!476960 d!76147))

(assert (=> b!476960 d!75997))

(declare-fun b!477327 () Bool)

(declare-fun e!280456 () List!8962)

(declare-fun call!30758 () List!8962)

(assert (=> b!477327 (= e!280456 call!30758)))

(declare-fun e!280459 () List!8962)

(declare-fun c!57454 () Bool)

(declare-fun c!57451 () Bool)

(declare-fun b!477328 () Bool)

(assert (=> b!477328 (= e!280459 (ite c!57451 (t!15018 (t!15018 (toList!3931 lm!215))) (ite c!57454 (Cons!8958 (h!9814 (t!15018 (toList!3931 lm!215))) (t!15018 (t!15018 (toList!3931 lm!215)))) Nil!8959)))))

(declare-fun b!477329 () Bool)

(declare-fun e!280457 () List!8962)

(declare-fun e!280460 () List!8962)

(assert (=> b!477329 (= e!280457 e!280460)))

(assert (=> b!477329 (= c!57451 (and ((_ is Cons!8958) (t!15018 (toList!3931 lm!215))) (= (_1!4469 (h!9814 (t!15018 (toList!3931 lm!215)))) (_1!4469 lt!217355))))))

(declare-fun b!477330 () Bool)

(declare-fun res!284933 () Bool)

(declare-fun e!280458 () Bool)

(assert (=> b!477330 (=> (not res!284933) (not e!280458))))

(declare-fun lt!217536 () List!8962)

(assert (=> b!477330 (= res!284933 (containsKey!348 lt!217536 (_1!4469 lt!217355)))))

(declare-fun b!477331 () Bool)

(declare-fun call!30756 () List!8962)

(assert (=> b!477331 (= e!280460 call!30756)))

(declare-fun bm!30753 () Bool)

(assert (=> bm!30753 (= call!30758 call!30756)))

(declare-fun bm!30754 () Bool)

(declare-fun call!30757 () List!8962)

(assert (=> bm!30754 (= call!30756 call!30757)))

(declare-fun bm!30755 () Bool)

(declare-fun c!57452 () Bool)

(assert (=> bm!30755 (= call!30757 ($colon$colon!109 e!280459 (ite c!57452 (h!9814 (t!15018 (toList!3931 lm!215))) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355)))))))

(declare-fun c!57453 () Bool)

(assert (=> bm!30755 (= c!57453 c!57452)))

(declare-fun d!76175 () Bool)

(assert (=> d!76175 e!280458))

(declare-fun res!284934 () Bool)

(assert (=> d!76175 (=> (not res!284934) (not e!280458))))

(assert (=> d!76175 (= res!284934 (isStrictlySorted!375 lt!217536))))

(assert (=> d!76175 (= lt!217536 e!280457)))

(assert (=> d!76175 (= c!57452 (and ((_ is Cons!8958) (t!15018 (toList!3931 lm!215))) (bvslt (_1!4469 (h!9814 (t!15018 (toList!3931 lm!215)))) (_1!4469 lt!217355))))))

(assert (=> d!76175 (isStrictlySorted!375 (t!15018 (toList!3931 lm!215)))))

(assert (=> d!76175 (= (insertStrictlySorted!213 (t!15018 (toList!3931 lm!215)) (_1!4469 lt!217355) (_2!4469 lt!217355)) lt!217536)))

(declare-fun b!477326 () Bool)

(assert (=> b!477326 (= e!280457 call!30757)))

(declare-fun b!477332 () Bool)

(assert (=> b!477332 (= e!280459 (insertStrictlySorted!213 (t!15018 (t!15018 (toList!3931 lm!215))) (_1!4469 lt!217355) (_2!4469 lt!217355)))))

(declare-fun b!477333 () Bool)

(assert (=> b!477333 (= e!280456 call!30758)))

(declare-fun b!477334 () Bool)

(assert (=> b!477334 (= e!280458 (contains!2552 lt!217536 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun b!477335 () Bool)

(assert (=> b!477335 (= c!57454 (and ((_ is Cons!8958) (t!15018 (toList!3931 lm!215))) (bvsgt (_1!4469 (h!9814 (t!15018 (toList!3931 lm!215)))) (_1!4469 lt!217355))))))

(assert (=> b!477335 (= e!280460 e!280456)))

(assert (= (and d!76175 c!57452) b!477326))

(assert (= (and d!76175 (not c!57452)) b!477329))

(assert (= (and b!477329 c!57451) b!477331))

(assert (= (and b!477329 (not c!57451)) b!477335))

(assert (= (and b!477335 c!57454) b!477327))

(assert (= (and b!477335 (not c!57454)) b!477333))

(assert (= (or b!477327 b!477333) bm!30753))

(assert (= (or b!477331 bm!30753) bm!30754))

(assert (= (or b!477326 bm!30754) bm!30755))

(assert (= (and bm!30755 c!57453) b!477332))

(assert (= (and bm!30755 (not c!57453)) b!477328))

(assert (= (and d!76175 res!284934) b!477330))

(assert (= (and b!477330 res!284933) b!477334))

(declare-fun m!459927 () Bool)

(assert (=> b!477330 m!459927))

(declare-fun m!459929 () Bool)

(assert (=> d!76175 m!459929))

(assert (=> d!76175 m!459703))

(declare-fun m!459931 () Bool)

(assert (=> bm!30755 m!459931))

(declare-fun m!459933 () Bool)

(assert (=> b!477332 m!459933))

(declare-fun m!459935 () Bool)

(assert (=> b!477334 m!459935))

(assert (=> b!477128 d!76175))

(declare-fun d!76177 () Bool)

(declare-fun lt!217537 () Bool)

(assert (=> d!76177 (= lt!217537 (select (content!209 lt!217430) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun e!280462 () Bool)

(assert (=> d!76177 (= lt!217537 e!280462)))

(declare-fun res!284935 () Bool)

(assert (=> d!76177 (=> (not res!284935) (not e!280462))))

(assert (=> d!76177 (= res!284935 ((_ is Cons!8958) lt!217430))))

(assert (=> d!76177 (= (contains!2552 lt!217430 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))) lt!217537)))

(declare-fun b!477336 () Bool)

(declare-fun e!280461 () Bool)

(assert (=> b!477336 (= e!280462 e!280461)))

(declare-fun res!284936 () Bool)

(assert (=> b!477336 (=> res!284936 e!280461)))

(assert (=> b!477336 (= res!284936 (= (h!9814 lt!217430) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun b!477337 () Bool)

(assert (=> b!477337 (= e!280461 (contains!2552 (t!15018 lt!217430) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(assert (= (and d!76177 res!284935) b!477336))

(assert (= (and b!477336 (not res!284936)) b!477337))

(declare-fun m!459937 () Bool)

(assert (=> d!76177 m!459937))

(declare-fun m!459939 () Bool)

(assert (=> d!76177 m!459939))

(declare-fun m!459941 () Bool)

(assert (=> b!477337 m!459941))

(assert (=> b!477117 d!76177))

(declare-fun d!76179 () Bool)

(declare-fun res!284937 () Bool)

(declare-fun e!280463 () Bool)

(assert (=> d!76179 (=> res!284937 e!280463)))

(assert (=> d!76179 (= res!284937 (and ((_ is Cons!8958) lt!217422) (= (_1!4469 (h!9814 lt!217422)) (_1!4469 lt!217355))))))

(assert (=> d!76179 (= (containsKey!348 lt!217422 (_1!4469 lt!217355)) e!280463)))

(declare-fun b!477338 () Bool)

(declare-fun e!280464 () Bool)

(assert (=> b!477338 (= e!280463 e!280464)))

(declare-fun res!284938 () Bool)

(assert (=> b!477338 (=> (not res!284938) (not e!280464))))

(assert (=> b!477338 (= res!284938 (and (or (not ((_ is Cons!8958) lt!217422)) (bvsle (_1!4469 (h!9814 lt!217422)) (_1!4469 lt!217355))) ((_ is Cons!8958) lt!217422) (bvslt (_1!4469 (h!9814 lt!217422)) (_1!4469 lt!217355))))))

(declare-fun b!477339 () Bool)

(assert (=> b!477339 (= e!280464 (containsKey!348 (t!15018 lt!217422) (_1!4469 lt!217355)))))

(assert (= (and d!76179 (not res!284937)) b!477338))

(assert (= (and b!477338 res!284938) b!477339))

(declare-fun m!459943 () Bool)

(assert (=> b!477339 m!459943))

(assert (=> b!476969 d!76179))

(declare-fun d!76181 () Bool)

(declare-fun res!284939 () Bool)

(declare-fun e!280465 () Bool)

(assert (=> d!76181 (=> res!284939 e!280465)))

(assert (=> d!76181 (= res!284939 ((_ is Nil!8959) (t!15018 (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355))))))))

(assert (=> d!76181 (= (forall!197 (t!15018 (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355)))) p!166) e!280465)))

(declare-fun b!477340 () Bool)

(declare-fun e!280466 () Bool)

(assert (=> b!477340 (= e!280465 e!280466)))

(declare-fun res!284940 () Bool)

(assert (=> b!477340 (=> (not res!284940) (not e!280466))))

(assert (=> b!477340 (= res!284940 (dynLambda!941 p!166 (h!9814 (t!15018 (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355)))))))))

(declare-fun b!477341 () Bool)

(assert (=> b!477341 (= e!280466 (forall!197 (t!15018 (t!15018 (t!15018 (toList!3931 (+!1772 lt!217354 lt!217355))))) p!166))))

(assert (= (and d!76181 (not res!284939)) b!477340))

(assert (= (and b!477340 res!284940) b!477341))

(declare-fun b_lambda!10665 () Bool)

(assert (=> (not b_lambda!10665) (not b!477340)))

(declare-fun t!15091 () Bool)

(declare-fun tb!4083 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15091) tb!4083))

(declare-fun result!7651 () Bool)

(assert (=> tb!4083 (= result!7651 true)))

(assert (=> b!477340 t!15091))

(declare-fun b_and!20803 () Bool)

(assert (= b_and!20801 (and (=> t!15091 result!7651) b_and!20803)))

(declare-fun m!459945 () Bool)

(assert (=> b!477340 m!459945))

(declare-fun m!459947 () Bool)

(assert (=> b!477341 m!459947))

(assert (=> b!477082 d!76181))

(declare-fun d!76183 () Bool)

(declare-fun e!280467 () Bool)

(assert (=> d!76183 e!280467))

(declare-fun res!284941 () Bool)

(assert (=> d!76183 (=> res!284941 e!280467)))

(declare-fun lt!217538 () Bool)

(assert (=> d!76183 (= res!284941 (not lt!217538))))

(declare-fun lt!217539 () Bool)

(assert (=> d!76183 (= lt!217538 lt!217539)))

(declare-fun lt!217540 () Unit!14006)

(declare-fun e!280468 () Unit!14006)

(assert (=> d!76183 (= lt!217540 e!280468)))

(declare-fun c!57455 () Bool)

(assert (=> d!76183 (= c!57455 lt!217539)))

(assert (=> d!76183 (= lt!217539 (containsKey!348 (toList!3931 lt!217474) (_1!4469 (tuple2!8917 a!501 b!85))))))

(assert (=> d!76183 (= (contains!2550 lt!217474 (_1!4469 (tuple2!8917 a!501 b!85))) lt!217538)))

(declare-fun b!477342 () Bool)

(declare-fun lt!217541 () Unit!14006)

(assert (=> b!477342 (= e!280468 lt!217541)))

(assert (=> b!477342 (= lt!217541 (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3931 lt!217474) (_1!4469 (tuple2!8917 a!501 b!85))))))

(assert (=> b!477342 (isDefined!297 (getValueByKey!388 (toList!3931 lt!217474) (_1!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun b!477343 () Bool)

(declare-fun Unit!14018 () Unit!14006)

(assert (=> b!477343 (= e!280468 Unit!14018)))

(declare-fun b!477344 () Bool)

(assert (=> b!477344 (= e!280467 (isDefined!297 (getValueByKey!388 (toList!3931 lt!217474) (_1!4469 (tuple2!8917 a!501 b!85)))))))

(assert (= (and d!76183 c!57455) b!477342))

(assert (= (and d!76183 (not c!57455)) b!477343))

(assert (= (and d!76183 (not res!284941)) b!477344))

(declare-fun m!459949 () Bool)

(assert (=> d!76183 m!459949))

(declare-fun m!459951 () Bool)

(assert (=> b!477342 m!459951))

(assert (=> b!477342 m!459673))

(assert (=> b!477342 m!459673))

(declare-fun m!459953 () Bool)

(assert (=> b!477342 m!459953))

(assert (=> b!477344 m!459673))

(assert (=> b!477344 m!459673))

(assert (=> b!477344 m!459953))

(assert (=> d!76053 d!76183))

(declare-fun b!477345 () Bool)

(declare-fun e!280469 () Option!394)

(assert (=> b!477345 (= e!280469 (Some!393 (_2!4469 (h!9814 lt!217475))))))

(declare-fun b!477346 () Bool)

(declare-fun e!280470 () Option!394)

(assert (=> b!477346 (= e!280469 e!280470)))

(declare-fun c!57457 () Bool)

(assert (=> b!477346 (= c!57457 (and ((_ is Cons!8958) lt!217475) (not (= (_1!4469 (h!9814 lt!217475)) (_1!4469 (tuple2!8917 a!501 b!85))))))))

(declare-fun b!477348 () Bool)

(assert (=> b!477348 (= e!280470 None!392)))

(declare-fun b!477347 () Bool)

(assert (=> b!477347 (= e!280470 (getValueByKey!388 (t!15018 lt!217475) (_1!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun c!57456 () Bool)

(declare-fun d!76185 () Bool)

(assert (=> d!76185 (= c!57456 (and ((_ is Cons!8958) lt!217475) (= (_1!4469 (h!9814 lt!217475)) (_1!4469 (tuple2!8917 a!501 b!85)))))))

(assert (=> d!76185 (= (getValueByKey!388 lt!217475 (_1!4469 (tuple2!8917 a!501 b!85))) e!280469)))

(assert (= (and d!76185 c!57456) b!477345))

(assert (= (and d!76185 (not c!57456)) b!477346))

(assert (= (and b!477346 c!57457) b!477347))

(assert (= (and b!477346 (not c!57457)) b!477348))

(declare-fun m!459955 () Bool)

(assert (=> b!477347 m!459955))

(assert (=> d!76053 d!76185))

(declare-fun d!76187 () Bool)

(assert (=> d!76187 (= (getValueByKey!388 lt!217475 (_1!4469 (tuple2!8917 a!501 b!85))) (Some!393 (_2!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun lt!217542 () Unit!14006)

(assert (=> d!76187 (= lt!217542 (choose!1371 lt!217475 (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun e!280471 () Bool)

(assert (=> d!76187 e!280471))

(declare-fun res!284942 () Bool)

(assert (=> d!76187 (=> (not res!284942) (not e!280471))))

(assert (=> d!76187 (= res!284942 (isStrictlySorted!375 lt!217475))))

(assert (=> d!76187 (= (lemmaContainsTupThenGetReturnValue!210 lt!217475 (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85))) lt!217542)))

(declare-fun b!477349 () Bool)

(declare-fun res!284943 () Bool)

(assert (=> b!477349 (=> (not res!284943) (not e!280471))))

(assert (=> b!477349 (= res!284943 (containsKey!348 lt!217475 (_1!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun b!477350 () Bool)

(assert (=> b!477350 (= e!280471 (contains!2552 lt!217475 (tuple2!8917 (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85)))))))

(assert (= (and d!76187 res!284942) b!477349))

(assert (= (and b!477349 res!284943) b!477350))

(assert (=> d!76187 m!459667))

(declare-fun m!459957 () Bool)

(assert (=> d!76187 m!459957))

(declare-fun m!459959 () Bool)

(assert (=> d!76187 m!459959))

(declare-fun m!459961 () Bool)

(assert (=> b!477349 m!459961))

(declare-fun m!459963 () Bool)

(assert (=> b!477350 m!459963))

(assert (=> d!76053 d!76187))

(declare-fun b!477352 () Bool)

(declare-fun e!280472 () List!8962)

(declare-fun call!30761 () List!8962)

(assert (=> b!477352 (= e!280472 call!30761)))

(declare-fun c!57458 () Bool)

(declare-fun b!477353 () Bool)

(declare-fun c!57461 () Bool)

(declare-fun e!280475 () List!8962)

(assert (=> b!477353 (= e!280475 (ite c!57458 (t!15018 (toList!3931 lt!217354)) (ite c!57461 (Cons!8958 (h!9814 (toList!3931 lt!217354)) (t!15018 (toList!3931 lt!217354))) Nil!8959)))))

(declare-fun b!477354 () Bool)

(declare-fun e!280473 () List!8962)

(declare-fun e!280476 () List!8962)

(assert (=> b!477354 (= e!280473 e!280476)))

(assert (=> b!477354 (= c!57458 (and ((_ is Cons!8958) (toList!3931 lt!217354)) (= (_1!4469 (h!9814 (toList!3931 lt!217354))) (_1!4469 (tuple2!8917 a!501 b!85)))))))

(declare-fun b!477355 () Bool)

(declare-fun res!284944 () Bool)

(declare-fun e!280474 () Bool)

(assert (=> b!477355 (=> (not res!284944) (not e!280474))))

(declare-fun lt!217543 () List!8962)

(assert (=> b!477355 (= res!284944 (containsKey!348 lt!217543 (_1!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun b!477356 () Bool)

(declare-fun call!30759 () List!8962)

(assert (=> b!477356 (= e!280476 call!30759)))

(declare-fun bm!30756 () Bool)

(assert (=> bm!30756 (= call!30761 call!30759)))

(declare-fun bm!30757 () Bool)

(declare-fun call!30760 () List!8962)

(assert (=> bm!30757 (= call!30759 call!30760)))

(declare-fun c!57459 () Bool)

(declare-fun bm!30758 () Bool)

(assert (=> bm!30758 (= call!30760 ($colon$colon!109 e!280475 (ite c!57459 (h!9814 (toList!3931 lt!217354)) (tuple2!8917 (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85))))))))

(declare-fun c!57460 () Bool)

(assert (=> bm!30758 (= c!57460 c!57459)))

(declare-fun d!76189 () Bool)

(assert (=> d!76189 e!280474))

(declare-fun res!284945 () Bool)

(assert (=> d!76189 (=> (not res!284945) (not e!280474))))

(assert (=> d!76189 (= res!284945 (isStrictlySorted!375 lt!217543))))

(assert (=> d!76189 (= lt!217543 e!280473)))

(assert (=> d!76189 (= c!57459 (and ((_ is Cons!8958) (toList!3931 lt!217354)) (bvslt (_1!4469 (h!9814 (toList!3931 lt!217354))) (_1!4469 (tuple2!8917 a!501 b!85)))))))

(assert (=> d!76189 (isStrictlySorted!375 (toList!3931 lt!217354))))

(assert (=> d!76189 (= (insertStrictlySorted!213 (toList!3931 lt!217354) (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85))) lt!217543)))

(declare-fun b!477351 () Bool)

(assert (=> b!477351 (= e!280473 call!30760)))

(declare-fun b!477357 () Bool)

(assert (=> b!477357 (= e!280475 (insertStrictlySorted!213 (t!15018 (toList!3931 lt!217354)) (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun b!477358 () Bool)

(assert (=> b!477358 (= e!280472 call!30761)))

(declare-fun b!477359 () Bool)

(assert (=> b!477359 (= e!280474 (contains!2552 lt!217543 (tuple2!8917 (_1!4469 (tuple2!8917 a!501 b!85)) (_2!4469 (tuple2!8917 a!501 b!85)))))))

(declare-fun b!477360 () Bool)

(assert (=> b!477360 (= c!57461 (and ((_ is Cons!8958) (toList!3931 lt!217354)) (bvsgt (_1!4469 (h!9814 (toList!3931 lt!217354))) (_1!4469 (tuple2!8917 a!501 b!85)))))))

(assert (=> b!477360 (= e!280476 e!280472)))

(assert (= (and d!76189 c!57459) b!477351))

(assert (= (and d!76189 (not c!57459)) b!477354))

(assert (= (and b!477354 c!57458) b!477356))

(assert (= (and b!477354 (not c!57458)) b!477360))

(assert (= (and b!477360 c!57461) b!477352))

(assert (= (and b!477360 (not c!57461)) b!477358))

(assert (= (or b!477352 b!477358) bm!30756))

(assert (= (or b!477356 bm!30756) bm!30757))

(assert (= (or b!477351 bm!30757) bm!30758))

(assert (= (and bm!30758 c!57460) b!477357))

(assert (= (and bm!30758 (not c!57460)) b!477353))

(assert (= (and d!76189 res!284945) b!477355))

(assert (= (and b!477355 res!284944) b!477359))

(declare-fun m!459965 () Bool)

(assert (=> b!477355 m!459965))

(declare-fun m!459967 () Bool)

(assert (=> d!76189 m!459967))

(assert (=> d!76189 m!459605))

(declare-fun m!459969 () Bool)

(assert (=> bm!30758 m!459969))

(declare-fun m!459971 () Bool)

(assert (=> b!477357 m!459971))

(declare-fun m!459973 () Bool)

(assert (=> b!477359 m!459973))

(assert (=> d!76053 d!76189))

(declare-fun d!76191 () Bool)

(declare-fun lt!217544 () Bool)

(assert (=> d!76191 (= lt!217544 (select (content!209 lt!217492) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun e!280478 () Bool)

(assert (=> d!76191 (= lt!217544 e!280478)))

(declare-fun res!284946 () Bool)

(assert (=> d!76191 (=> (not res!284946) (not e!280478))))

(assert (=> d!76191 (= res!284946 ((_ is Cons!8958) lt!217492))))

(assert (=> d!76191 (= (contains!2552 lt!217492 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))) lt!217544)))

(declare-fun b!477361 () Bool)

(declare-fun e!280477 () Bool)

(assert (=> b!477361 (= e!280478 e!280477)))

(declare-fun res!284947 () Bool)

(assert (=> b!477361 (=> res!284947 e!280477)))

(assert (=> b!477361 (= res!284947 (= (h!9814 lt!217492) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun b!477362 () Bool)

(assert (=> b!477362 (= e!280477 (contains!2552 (t!15018 lt!217492) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(assert (= (and d!76191 res!284946) b!477361))

(assert (= (and b!477361 (not res!284947)) b!477362))

(declare-fun m!459975 () Bool)

(assert (=> d!76191 m!459975))

(declare-fun m!459977 () Bool)

(assert (=> d!76191 m!459977))

(declare-fun m!459979 () Bool)

(assert (=> b!477362 m!459979))

(assert (=> b!477130 d!76191))

(declare-fun d!76193 () Bool)

(declare-fun res!284948 () Bool)

(declare-fun e!280479 () Bool)

(assert (=> d!76193 (=> res!284948 e!280479)))

(assert (=> d!76193 (= res!284948 ((_ is Nil!8959) (t!15018 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85))))))))

(assert (=> d!76193 (= (forall!197 (t!15018 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85)))) p!166) e!280479)))

(declare-fun b!477363 () Bool)

(declare-fun e!280480 () Bool)

(assert (=> b!477363 (= e!280479 e!280480)))

(declare-fun res!284949 () Bool)

(assert (=> b!477363 (=> (not res!284949) (not e!280480))))

(assert (=> b!477363 (= res!284949 (dynLambda!941 p!166 (h!9814 (t!15018 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85)))))))))

(declare-fun b!477364 () Bool)

(assert (=> b!477364 (= e!280480 (forall!197 (t!15018 (t!15018 (toList!3931 (+!1772 lt!217354 (tuple2!8917 a!501 b!85))))) p!166))))

(assert (= (and d!76193 (not res!284948)) b!477363))

(assert (= (and b!477363 res!284949) b!477364))

(declare-fun b_lambda!10667 () Bool)

(assert (=> (not b_lambda!10667) (not b!477363)))

(declare-fun t!15093 () Bool)

(declare-fun tb!4085 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15093) tb!4085))

(declare-fun result!7653 () Bool)

(assert (=> tb!4085 (= result!7653 true)))

(assert (=> b!477363 t!15093))

(declare-fun b_and!20805 () Bool)

(assert (= b_and!20803 (and (=> t!15093 result!7653) b_and!20805)))

(declare-fun m!459981 () Bool)

(assert (=> b!477363 m!459981))

(declare-fun m!459983 () Bool)

(assert (=> b!477364 m!459983))

(assert (=> b!477067 d!76193))

(assert (=> d!76055 d!76051))

(assert (=> d!76055 d!76053))

(declare-fun d!76195 () Bool)

(declare-fun lt!217545 () Bool)

(assert (=> d!76195 (= lt!217545 (select (content!209 lt!217422) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun e!280482 () Bool)

(assert (=> d!76195 (= lt!217545 e!280482)))

(declare-fun res!284950 () Bool)

(assert (=> d!76195 (=> (not res!284950) (not e!280482))))

(assert (=> d!76195 (= res!284950 ((_ is Cons!8958) lt!217422))))

(assert (=> d!76195 (= (contains!2552 lt!217422 (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))) lt!217545)))

(declare-fun b!477365 () Bool)

(declare-fun e!280481 () Bool)

(assert (=> b!477365 (= e!280482 e!280481)))

(declare-fun res!284951 () Bool)

(assert (=> b!477365 (=> res!284951 e!280481)))

(assert (=> b!477365 (= res!284951 (= (h!9814 lt!217422) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(declare-fun b!477366 () Bool)

(assert (=> b!477366 (= e!280481 (contains!2552 (t!15018 lt!217422) (tuple2!8917 (_1!4469 lt!217355) (_2!4469 lt!217355))))))

(assert (= (and d!76195 res!284950) b!477365))

(assert (= (and b!477365 (not res!284951)) b!477366))

(declare-fun m!459985 () Bool)

(assert (=> d!76195 m!459985))

(declare-fun m!459987 () Bool)

(assert (=> d!76195 m!459987))

(declare-fun m!459989 () Bool)

(assert (=> b!477366 m!459989))

(assert (=> b!476970 d!76195))

(declare-fun d!76197 () Bool)

(declare-fun res!284952 () Bool)

(declare-fun e!280483 () Bool)

(assert (=> d!76197 (=> res!284952 e!280483)))

(assert (=> d!76197 (= res!284952 (and ((_ is Cons!8958) (toList!3931 lt!217421)) (= (_1!4469 (h!9814 (toList!3931 lt!217421))) (_1!4469 lt!217355))))))

(assert (=> d!76197 (= (containsKey!348 (toList!3931 lt!217421) (_1!4469 lt!217355)) e!280483)))

(declare-fun b!477367 () Bool)

(declare-fun e!280484 () Bool)

(assert (=> b!477367 (= e!280483 e!280484)))

(declare-fun res!284953 () Bool)

(assert (=> b!477367 (=> (not res!284953) (not e!280484))))

(assert (=> b!477367 (= res!284953 (and (or (not ((_ is Cons!8958) (toList!3931 lt!217421))) (bvsle (_1!4469 (h!9814 (toList!3931 lt!217421))) (_1!4469 lt!217355))) ((_ is Cons!8958) (toList!3931 lt!217421)) (bvslt (_1!4469 (h!9814 (toList!3931 lt!217421))) (_1!4469 lt!217355))))))

(declare-fun b!477368 () Bool)

(assert (=> b!477368 (= e!280484 (containsKey!348 (t!15018 (toList!3931 lt!217421)) (_1!4469 lt!217355)))))

(assert (= (and d!76197 (not res!284952)) b!477367))

(assert (= (and b!477367 res!284953) b!477368))

(declare-fun m!459991 () Bool)

(assert (=> b!477368 m!459991))

(assert (=> d!75999 d!76197))

(declare-fun d!76199 () Bool)

(declare-fun res!284954 () Bool)

(declare-fun e!280485 () Bool)

(assert (=> d!76199 (=> res!284954 e!280485)))

(assert (=> d!76199 (= res!284954 (and ((_ is Cons!8958) (toList!3931 lt!217429)) (= (_1!4469 (h!9814 (toList!3931 lt!217429))) (_1!4469 lt!217355))))))

(assert (=> d!76199 (= (containsKey!348 (toList!3931 lt!217429) (_1!4469 lt!217355)) e!280485)))

(declare-fun b!477369 () Bool)

(declare-fun e!280486 () Bool)

(assert (=> b!477369 (= e!280485 e!280486)))

(declare-fun res!284955 () Bool)

(assert (=> b!477369 (=> (not res!284955) (not e!280486))))

(assert (=> b!477369 (= res!284955 (and (or (not ((_ is Cons!8958) (toList!3931 lt!217429))) (bvsle (_1!4469 (h!9814 (toList!3931 lt!217429))) (_1!4469 lt!217355))) ((_ is Cons!8958) (toList!3931 lt!217429)) (bvslt (_1!4469 (h!9814 (toList!3931 lt!217429))) (_1!4469 lt!217355))))))

(declare-fun b!477370 () Bool)

(assert (=> b!477370 (= e!280486 (containsKey!348 (t!15018 (toList!3931 lt!217429)) (_1!4469 lt!217355)))))

(assert (= (and d!76199 (not res!284954)) b!477369))

(assert (= (and b!477369 res!284955) b!477370))

(declare-fun m!459993 () Bool)

(assert (=> b!477370 m!459993))

(assert (=> d!76073 d!76199))

(declare-fun d!76201 () Bool)

(declare-fun c!57464 () Bool)

(assert (=> d!76201 (= c!57464 ((_ is Nil!8959) (toList!3931 lt!217429)))))

(declare-fun e!280489 () (InoxSet tuple2!8916))

(assert (=> d!76201 (= (content!209 (toList!3931 lt!217429)) e!280489)))

(declare-fun b!477375 () Bool)

(assert (=> b!477375 (= e!280489 ((as const (Array tuple2!8916 Bool)) false))))

(declare-fun b!477376 () Bool)

(assert (=> b!477376 (= e!280489 ((_ map or) (store ((as const (Array tuple2!8916 Bool)) false) (h!9814 (toList!3931 lt!217429)) true) (content!209 (t!15018 (toList!3931 lt!217429)))))))

(assert (= (and d!76201 c!57464) b!477375))

(assert (= (and d!76201 (not c!57464)) b!477376))

(declare-fun m!459995 () Bool)

(assert (=> b!477376 m!459995))

(assert (=> b!477376 m!459861))

(assert (=> d!76041 d!76201))

(declare-fun d!76203 () Bool)

(declare-fun res!284956 () Bool)

(declare-fun e!280490 () Bool)

(assert (=> d!76203 (=> res!284956 e!280490)))

(assert (=> d!76203 (= res!284956 (or ((_ is Nil!8959) (t!15018 (toList!3931 lm!215))) ((_ is Nil!8959) (t!15018 (t!15018 (toList!3931 lm!215))))))))

(assert (=> d!76203 (= (isStrictlySorted!375 (t!15018 (toList!3931 lm!215))) e!280490)))

(declare-fun b!477377 () Bool)

(declare-fun e!280491 () Bool)

(assert (=> b!477377 (= e!280490 e!280491)))

(declare-fun res!284957 () Bool)

(assert (=> b!477377 (=> (not res!284957) (not e!280491))))

(assert (=> b!477377 (= res!284957 (bvslt (_1!4469 (h!9814 (t!15018 (toList!3931 lm!215)))) (_1!4469 (h!9814 (t!15018 (t!15018 (toList!3931 lm!215)))))))))

(declare-fun b!477378 () Bool)

(assert (=> b!477378 (= e!280491 (isStrictlySorted!375 (t!15018 (t!15018 (toList!3931 lm!215)))))))

(assert (= (and d!76203 (not res!284956)) b!477377))

(assert (= (and b!477377 res!284957) b!477378))

(declare-fun m!459997 () Bool)

(assert (=> b!477378 m!459997))

(assert (=> b!477102 d!76203))

(declare-fun d!76205 () Bool)

(declare-fun c!57465 () Bool)

(assert (=> d!76205 (= c!57465 ((_ is Nil!8959) (toList!3931 lt!217421)))))

(declare-fun e!280492 () (InoxSet tuple2!8916))

(assert (=> d!76205 (= (content!209 (toList!3931 lt!217421)) e!280492)))

(declare-fun b!477379 () Bool)

(assert (=> b!477379 (= e!280492 ((as const (Array tuple2!8916 Bool)) false))))

(declare-fun b!477380 () Bool)

(assert (=> b!477380 (= e!280492 ((_ map or) (store ((as const (Array tuple2!8916 Bool)) false) (h!9814 (toList!3931 lt!217421)) true) (content!209 (t!15018 (toList!3931 lt!217421)))))))

(assert (= (and d!76205 c!57465) b!477379))

(assert (= (and d!76205 (not c!57465)) b!477380))

(declare-fun m!459999 () Bool)

(assert (=> b!477380 m!459999))

(assert (=> b!477380 m!459917))

(assert (=> d!76047 d!76205))

(declare-fun b!477381 () Bool)

(declare-fun e!280493 () Option!394)

(assert (=> b!477381 (= e!280493 (Some!393 (_2!4469 (h!9814 (toList!3931 lt!217474)))))))

(declare-fun b!477382 () Bool)

(declare-fun e!280494 () Option!394)

(assert (=> b!477382 (= e!280493 e!280494)))

(declare-fun c!57467 () Bool)

(assert (=> b!477382 (= c!57467 (and ((_ is Cons!8958) (toList!3931 lt!217474)) (not (= (_1!4469 (h!9814 (toList!3931 lt!217474))) (_1!4469 (tuple2!8917 a!501 b!85))))))))

(declare-fun b!477384 () Bool)

(assert (=> b!477384 (= e!280494 None!392)))

(declare-fun b!477383 () Bool)

(assert (=> b!477383 (= e!280494 (getValueByKey!388 (t!15018 (toList!3931 lt!217474)) (_1!4469 (tuple2!8917 a!501 b!85))))))

(declare-fun c!57466 () Bool)

(declare-fun d!76207 () Bool)

(assert (=> d!76207 (= c!57466 (and ((_ is Cons!8958) (toList!3931 lt!217474)) (= (_1!4469 (h!9814 (toList!3931 lt!217474))) (_1!4469 (tuple2!8917 a!501 b!85)))))))

(assert (=> d!76207 (= (getValueByKey!388 (toList!3931 lt!217474) (_1!4469 (tuple2!8917 a!501 b!85))) e!280493)))

(assert (= (and d!76207 c!57466) b!477381))

(assert (= (and d!76207 (not c!57466)) b!477382))

(assert (= (and b!477382 c!57467) b!477383))

(assert (= (and b!477382 (not c!57467)) b!477384))

(declare-fun m!460001 () Bool)

(assert (=> b!477383 m!460001))

(assert (=> b!477070 d!76207))

(declare-fun b!477385 () Bool)

(declare-fun e!280495 () Option!394)

(assert (=> b!477385 (= e!280495 (Some!393 (_2!4469 (h!9814 (t!15018 lt!217422)))))))

(declare-fun b!477386 () Bool)

(declare-fun e!280496 () Option!394)

(assert (=> b!477386 (= e!280495 e!280496)))

(declare-fun c!57469 () Bool)

(assert (=> b!477386 (= c!57469 (and ((_ is Cons!8958) (t!15018 lt!217422)) (not (= (_1!4469 (h!9814 (t!15018 lt!217422))) (_1!4469 lt!217355)))))))

(declare-fun b!477388 () Bool)

(assert (=> b!477388 (= e!280496 None!392)))

(declare-fun b!477387 () Bool)

(assert (=> b!477387 (= e!280496 (getValueByKey!388 (t!15018 (t!15018 lt!217422)) (_1!4469 lt!217355)))))

(declare-fun d!76209 () Bool)

(declare-fun c!57468 () Bool)

(assert (=> d!76209 (= c!57468 (and ((_ is Cons!8958) (t!15018 lt!217422)) (= (_1!4469 (h!9814 (t!15018 lt!217422))) (_1!4469 lt!217355))))))

(assert (=> d!76209 (= (getValueByKey!388 (t!15018 lt!217422) (_1!4469 lt!217355)) e!280495)))

(assert (= (and d!76209 c!57468) b!477385))

(assert (= (and d!76209 (not c!57468)) b!477386))

(assert (= (and b!477386 c!57469) b!477387))

(assert (= (and b!477386 (not c!57469)) b!477388))

(declare-fun m!460003 () Bool)

(assert (=> b!477387 m!460003))

(assert (=> b!476963 d!76209))

(declare-fun b!477389 () Bool)

(declare-fun e!280497 () Option!394)

(assert (=> b!477389 (= e!280497 (Some!393 (_2!4469 (h!9814 (t!15018 lt!217430)))))))

(declare-fun b!477390 () Bool)

(declare-fun e!280498 () Option!394)

(assert (=> b!477390 (= e!280497 e!280498)))

(declare-fun c!57471 () Bool)

(assert (=> b!477390 (= c!57471 (and ((_ is Cons!8958) (t!15018 lt!217430)) (not (= (_1!4469 (h!9814 (t!15018 lt!217430))) (_1!4469 lt!217355)))))))

(declare-fun b!477392 () Bool)

(assert (=> b!477392 (= e!280498 None!392)))

(declare-fun b!477391 () Bool)

(assert (=> b!477391 (= e!280498 (getValueByKey!388 (t!15018 (t!15018 lt!217430)) (_1!4469 lt!217355)))))

(declare-fun d!76211 () Bool)

(declare-fun c!57470 () Bool)

(assert (=> d!76211 (= c!57470 (and ((_ is Cons!8958) (t!15018 lt!217430)) (= (_1!4469 (h!9814 (t!15018 lt!217430))) (_1!4469 lt!217355))))))

(assert (=> d!76211 (= (getValueByKey!388 (t!15018 lt!217430) (_1!4469 lt!217355)) e!280497)))

(assert (= (and d!76211 c!57470) b!477389))

(assert (= (and d!76211 (not c!57470)) b!477390))

(assert (= (and b!477390 c!57471) b!477391))

(assert (= (and b!477390 (not c!57471)) b!477392))

(declare-fun m!460005 () Bool)

(assert (=> b!477391 m!460005))

(assert (=> b!477114 d!76211))

(declare-fun d!76213 () Bool)

(declare-fun res!284958 () Bool)

(declare-fun e!280499 () Bool)

(assert (=> d!76213 (=> res!284958 e!280499)))

(assert (=> d!76213 (= res!284958 (and ((_ is Cons!8958) lt!217456) (= (_1!4469 (h!9814 lt!217456)) (_1!4469 lt!217355))))))

(assert (=> d!76213 (= (containsKey!348 lt!217456 (_1!4469 lt!217355)) e!280499)))

(declare-fun b!477393 () Bool)

(declare-fun e!280500 () Bool)

(assert (=> b!477393 (= e!280499 e!280500)))

(declare-fun res!284959 () Bool)

(assert (=> b!477393 (=> (not res!284959) (not e!280500))))

(assert (=> b!477393 (= res!284959 (and (or (not ((_ is Cons!8958) lt!217456)) (bvsle (_1!4469 (h!9814 lt!217456)) (_1!4469 lt!217355))) ((_ is Cons!8958) lt!217456) (bvslt (_1!4469 (h!9814 lt!217456)) (_1!4469 lt!217355))))))

(declare-fun b!477394 () Bool)

(assert (=> b!477394 (= e!280500 (containsKey!348 (t!15018 lt!217456) (_1!4469 lt!217355)))))

(assert (= (and d!76213 (not res!284958)) b!477393))

(assert (= (and b!477393 res!284959) b!477394))

(declare-fun m!460007 () Bool)

(assert (=> b!477394 m!460007))

(assert (=> b!477025 d!76213))

(declare-fun d!76215 () Bool)

(declare-fun lt!217546 () Bool)

(assert (=> d!76215 (= lt!217546 (select (content!209 (toList!3931 lt!217474)) (tuple2!8917 a!501 b!85)))))

(declare-fun e!280502 () Bool)

(assert (=> d!76215 (= lt!217546 e!280502)))

(declare-fun res!284960 () Bool)

(assert (=> d!76215 (=> (not res!284960) (not e!280502))))

(assert (=> d!76215 (= res!284960 ((_ is Cons!8958) (toList!3931 lt!217474)))))

(assert (=> d!76215 (= (contains!2552 (toList!3931 lt!217474) (tuple2!8917 a!501 b!85)) lt!217546)))

(declare-fun b!477395 () Bool)

(declare-fun e!280501 () Bool)

(assert (=> b!477395 (= e!280502 e!280501)))

(declare-fun res!284961 () Bool)

(assert (=> b!477395 (=> res!284961 e!280501)))

(assert (=> b!477395 (= res!284961 (= (h!9814 (toList!3931 lt!217474)) (tuple2!8917 a!501 b!85)))))

(declare-fun b!477396 () Bool)

(assert (=> b!477396 (= e!280501 (contains!2552 (t!15018 (toList!3931 lt!217474)) (tuple2!8917 a!501 b!85)))))

(assert (= (and d!76215 res!284960) b!477395))

(assert (= (and b!477395 (not res!284961)) b!477396))

(declare-fun m!460009 () Bool)

(assert (=> d!76215 m!460009))

(declare-fun m!460011 () Bool)

(assert (=> d!76215 m!460011))

(declare-fun m!460013 () Bool)

(assert (=> b!477396 m!460013))

(assert (=> b!477071 d!76215))

(declare-fun d!76217 () Bool)

(declare-fun res!284962 () Bool)

(declare-fun e!280503 () Bool)

(assert (=> d!76217 (=> res!284962 e!280503)))

(assert (=> d!76217 (= res!284962 ((_ is Nil!8959) (t!15018 (t!15018 (toList!3931 (+!1772 lm!215 lt!217355))))))))

(assert (=> d!76217 (= (forall!197 (t!15018 (t!15018 (toList!3931 (+!1772 lm!215 lt!217355)))) p!166) e!280503)))

(declare-fun b!477397 () Bool)

(declare-fun e!280504 () Bool)

(assert (=> b!477397 (= e!280503 e!280504)))

(declare-fun res!284963 () Bool)

(assert (=> b!477397 (=> (not res!284963) (not e!280504))))

(assert (=> b!477397 (= res!284963 (dynLambda!941 p!166 (h!9814 (t!15018 (t!15018 (toList!3931 (+!1772 lm!215 lt!217355)))))))))

(declare-fun b!477398 () Bool)

(assert (=> b!477398 (= e!280504 (forall!197 (t!15018 (t!15018 (t!15018 (toList!3931 (+!1772 lm!215 lt!217355))))) p!166))))

(assert (= (and d!76217 (not res!284962)) b!477397))

(assert (= (and b!477397 res!284963) b!477398))

(declare-fun b_lambda!10669 () Bool)

(assert (=> (not b_lambda!10669) (not b!477397)))

(declare-fun t!15095 () Bool)

(declare-fun tb!4087 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15095) tb!4087))

(declare-fun result!7655 () Bool)

(assert (=> tb!4087 (= result!7655 true)))

(assert (=> b!477397 t!15095))

(declare-fun b_and!20807 () Bool)

(assert (= b_and!20805 (and (=> t!15095 result!7655) b_and!20807)))

(declare-fun m!460015 () Bool)

(assert (=> b!477397 m!460015))

(declare-fun m!460017 () Bool)

(assert (=> b!477398 m!460017))

(assert (=> b!477137 d!76217))

(declare-fun b!477399 () Bool)

(declare-fun e!280505 () Bool)

(declare-fun tp!42422 () Bool)

(assert (=> b!477399 (= e!280505 (and tp_is_empty!13525 tp!42422))))

(assert (=> b!477138 (= tp!42419 e!280505)))

(assert (= (and b!477138 ((_ is Cons!8958) (t!15018 (t!15018 (toList!3931 lm!215))))) b!477399))

(declare-fun b_lambda!10671 () Bool)

(assert (= b_lambda!10665 (or (and start!42850 b_free!12103) b_lambda!10671)))

(declare-fun b_lambda!10673 () Bool)

(assert (= b_lambda!10667 (or (and start!42850 b_free!12103) b_lambda!10673)))

(declare-fun b_lambda!10675 () Bool)

(assert (= b_lambda!10661 (or (and start!42850 b_free!12103) b_lambda!10675)))

(declare-fun b_lambda!10677 () Bool)

(assert (= b_lambda!10663 (or (and start!42850 b_free!12103) b_lambda!10677)))

(declare-fun b_lambda!10679 () Bool)

(assert (= b_lambda!10669 (or (and start!42850 b_free!12103) b_lambda!10679)))

(check-sat (not b!477362) (not b!477341) (not d!76215) (not b_lambda!10595) (not b!477308) (not d!76195) (not b!477396) (not d!76189) (not b!477380) (not d!76137) (not b!477398) (not b!477355) (not b!477357) (not b!477330) (not d!76159) (not b!477370) (not b!477342) (not d!76141) (not b!477316) (not b_next!12103) (not b!477378) (not b_lambda!10671) (not d!76167) (not b_lambda!10625) (not b!477387) (not b!477277) (not b!477313) (not b!477399) (not b!477332) (not d!76177) (not b!477299) (not b_lambda!10673) (not b!477283) (not b!477324) (not b!477364) (not b_lambda!10597) (not d!76145) (not b!477347) (not bm!30758) (not d!76151) (not d!76187) (not b!477391) (not d!76147) (not b!477376) (not b_lambda!10629) (not d!76183) (not d!76191) (not d!76155) (not d!76175) (not b_lambda!10627) (not b!477297) (not b_lambda!10679) (not b!477281) (not b_lambda!10539) tp_is_empty!13525 (not b!477279) (not b!477359) (not b!477319) (not b_lambda!10675) (not b!477337) (not b!477383) (not bm!30752) (not b!477350) (not b!477394) (not b_lambda!10633) b_and!20807 (not d!76129) (not b!477286) (not b_lambda!10631) (not b!477321) (not d!76143) (not b_lambda!10677) (not b!477287) (not b!477368) (not b!477334) (not b_lambda!10599) (not b!477306) (not b!477295) (not b!477293) (not b!477366) (not b!477311) (not b!477349) (not b!477344) (not bm!30755) (not b!477339) (not b_lambda!10591) (not b_lambda!10593) (not b!477304))
(check-sat b_and!20807 (not b_next!12103))
