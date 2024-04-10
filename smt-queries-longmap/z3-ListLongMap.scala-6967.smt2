; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87956 () Bool)

(assert start!87956)

(declare-fun b!1015815 () Bool)

(assert (=> b!1015815 true))

(assert (=> b!1015815 true))

(declare-fun bs!29466 () Bool)

(declare-fun b!1015811 () Bool)

(assert (= bs!29466 (and b!1015811 b!1015815)))

(declare-datatypes ((B!1510 0))(
  ( (B!1511 (val!11839 Int)) )
))
(declare-datatypes ((tuple2!15224 0))(
  ( (tuple2!15225 (_1!7623 (_ BitVec 64)) (_2!7623 B!1510)) )
))
(declare-datatypes ((List!21501 0))(
  ( (Nil!21498) (Cons!21497 (h!22695 tuple2!15224) (t!30502 List!21501)) )
))
(declare-fun lt!449208 () List!21501)

(declare-fun lambda!963 () Int)

(declare-fun l!1114 () List!21501)

(declare-fun lambda!962 () Int)

(assert (=> bs!29466 (= (= lt!449208 l!1114) (= lambda!963 lambda!962))))

(assert (=> b!1015811 true))

(assert (=> b!1015811 true))

(declare-fun b!1015809 () Bool)

(declare-fun res!681366 () Bool)

(declare-fun e!571429 () Bool)

(assert (=> b!1015809 (=> (not res!681366) (not e!571429))))

(declare-datatypes ((List!21502 0))(
  ( (Nil!21499) (Cons!21498 (h!22696 (_ BitVec 64)) (t!30503 List!21502)) )
))
(declare-fun keys!40 () List!21502)

(get-info :version)

(assert (=> b!1015809 (= res!681366 ((_ is Cons!21498) keys!40))))

(declare-fun b!1015810 () Bool)

(declare-fun res!681368 () Bool)

(assert (=> b!1015810 (=> (not res!681368) (not e!571429))))

(declare-fun newHead!31 () tuple2!15224)

(declare-fun head!956 (List!21501) tuple2!15224)

(assert (=> b!1015810 (= res!681368 (bvslt (_1!7623 newHead!31) (_1!7623 (head!956 l!1114))))))

(declare-fun res!681367 () Bool)

(assert (=> start!87956 (=> (not res!681367) (not e!571429))))

(declare-fun isStrictlySorted!607 (List!21501) Bool)

(assert (=> start!87956 (= res!681367 (isStrictlySorted!607 l!1114))))

(assert (=> start!87956 e!571429))

(declare-fun e!571427 () Bool)

(assert (=> start!87956 e!571427))

(assert (=> start!87956 true))

(declare-fun tp_is_empty!23577 () Bool)

(assert (=> start!87956 tp_is_empty!23577))

(declare-fun e!571428 () Bool)

(assert (=> b!1015811 (= e!571428 (isStrictlySorted!607 lt!449208))))

(declare-fun forall!269 (List!21502 Int) Bool)

(assert (=> b!1015811 (forall!269 (t!30503 keys!40) lambda!963)))

(declare-fun value!178 () B!1510)

(declare-datatypes ((Unit!33241 0))(
  ( (Unit!33242) )
))
(declare-fun lt!449207 () Unit!33241)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!48 (List!21501 List!21502 B!1510 tuple2!15224) Unit!33241)

(assert (=> b!1015811 (= lt!449207 (lemmaForallGetValueByKeySameWithASmallerHead!48 l!1114 (t!30503 keys!40) value!178 newHead!31))))

(declare-fun b!1015812 () Bool)

(declare-fun res!681364 () Bool)

(assert (=> b!1015812 (=> (not res!681364) (not e!571429))))

(declare-fun isEmpty!866 (List!21501) Bool)

(assert (=> b!1015812 (= res!681364 (not (isEmpty!866 l!1114)))))

(declare-fun b!1015813 () Bool)

(declare-fun tp!70703 () Bool)

(assert (=> b!1015813 (= e!571427 (and tp_is_empty!23577 tp!70703))))

(declare-fun b!1015814 () Bool)

(assert (=> b!1015814 (= e!571429 (not e!571428))))

(declare-fun res!681369 () Bool)

(assert (=> b!1015814 (=> res!681369 e!571428)))

(assert (=> b!1015814 (= res!681369 (not (forall!269 (t!30503 keys!40) lambda!962)))))

(declare-datatypes ((Option!593 0))(
  ( (Some!592 (v!14443 B!1510)) (None!591) )
))
(declare-fun isDefined!396 (Option!593) Bool)

(declare-fun getValueByKey!542 (List!21501 (_ BitVec 64)) Option!593)

(assert (=> b!1015814 (isDefined!396 (getValueByKey!542 lt!449208 (h!22696 keys!40)))))

(declare-fun lt!449206 () Unit!33241)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!381 (List!21501 (_ BitVec 64)) Unit!33241)

(assert (=> b!1015814 (= lt!449206 (lemmaContainsKeyImpliesGetValueByKeyDefined!381 lt!449208 (h!22696 keys!40)))))

(assert (=> b!1015814 (= lt!449208 (Cons!21497 newHead!31 l!1114))))

(declare-fun containsKey!488 (List!21501 (_ BitVec 64)) Bool)

(assert (=> b!1015814 (containsKey!488 l!1114 (h!22696 keys!40))))

(declare-fun lt!449205 () Unit!33241)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!8 (List!21501 (_ BitVec 64)) Unit!33241)

(assert (=> b!1015814 (= lt!449205 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!8 l!1114 (h!22696 keys!40)))))

(declare-fun res!681365 () Bool)

(assert (=> b!1015815 (=> (not res!681365) (not e!571429))))

(assert (=> b!1015815 (= res!681365 (forall!269 keys!40 lambda!962))))

(assert (= (and start!87956 res!681367) b!1015812))

(assert (= (and b!1015812 res!681364) b!1015815))

(assert (= (and b!1015815 res!681365) b!1015810))

(assert (= (and b!1015810 res!681368) b!1015809))

(assert (= (and b!1015809 res!681366) b!1015814))

(assert (= (and b!1015814 (not res!681369)) b!1015811))

(assert (= (and start!87956 ((_ is Cons!21497) l!1114)) b!1015813))

(declare-fun m!937723 () Bool)

(assert (=> b!1015811 m!937723))

(declare-fun m!937725 () Bool)

(assert (=> b!1015811 m!937725))

(declare-fun m!937727 () Bool)

(assert (=> b!1015811 m!937727))

(declare-fun m!937729 () Bool)

(assert (=> b!1015814 m!937729))

(declare-fun m!937731 () Bool)

(assert (=> b!1015814 m!937731))

(declare-fun m!937733 () Bool)

(assert (=> b!1015814 m!937733))

(declare-fun m!937735 () Bool)

(assert (=> b!1015814 m!937735))

(assert (=> b!1015814 m!937733))

(declare-fun m!937737 () Bool)

(assert (=> b!1015814 m!937737))

(declare-fun m!937739 () Bool)

(assert (=> b!1015814 m!937739))

(declare-fun m!937741 () Bool)

(assert (=> start!87956 m!937741))

(declare-fun m!937743 () Bool)

(assert (=> b!1015812 m!937743))

(declare-fun m!937745 () Bool)

(assert (=> b!1015810 m!937745))

(declare-fun m!937747 () Bool)

(assert (=> b!1015815 m!937747))

(check-sat tp_is_empty!23577 (not b!1015810) (not b!1015812) (not b!1015811) (not b!1015814) (not b!1015815) (not b!1015813) (not start!87956))
(check-sat)
(get-model)

(declare-fun d!121013 () Bool)

(assert (=> d!121013 (= (head!956 l!1114) (h!22695 l!1114))))

(assert (=> b!1015810 d!121013))

(declare-fun d!121015 () Bool)

(declare-fun res!681392 () Bool)

(declare-fun e!571443 () Bool)

(assert (=> d!121015 (=> res!681392 e!571443)))

(assert (=> d!121015 (= res!681392 ((_ is Nil!21499) keys!40))))

(assert (=> d!121015 (= (forall!269 keys!40 lambda!962) e!571443)))

(declare-fun b!1015849 () Bool)

(declare-fun e!571444 () Bool)

(assert (=> b!1015849 (= e!571443 e!571444)))

(declare-fun res!681393 () Bool)

(assert (=> b!1015849 (=> (not res!681393) (not e!571444))))

(declare-fun dynLambda!1904 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015849 (= res!681393 (dynLambda!1904 lambda!962 (h!22696 keys!40)))))

(declare-fun b!1015850 () Bool)

(assert (=> b!1015850 (= e!571444 (forall!269 (t!30503 keys!40) lambda!962))))

(assert (= (and d!121015 (not res!681392)) b!1015849))

(assert (= (and b!1015849 res!681393) b!1015850))

(declare-fun b_lambda!15439 () Bool)

(assert (=> (not b_lambda!15439) (not b!1015849)))

(declare-fun m!937775 () Bool)

(assert (=> b!1015849 m!937775))

(assert (=> b!1015850 m!937729))

(assert (=> b!1015815 d!121015))

(declare-fun d!121017 () Bool)

(declare-fun res!681402 () Bool)

(declare-fun e!571453 () Bool)

(assert (=> d!121017 (=> res!681402 e!571453)))

(assert (=> d!121017 (= res!681402 (and ((_ is Cons!21497) l!1114) (= (_1!7623 (h!22695 l!1114)) (h!22696 keys!40))))))

(assert (=> d!121017 (= (containsKey!488 l!1114 (h!22696 keys!40)) e!571453)))

(declare-fun b!1015859 () Bool)

(declare-fun e!571454 () Bool)

(assert (=> b!1015859 (= e!571453 e!571454)))

(declare-fun res!681403 () Bool)

(assert (=> b!1015859 (=> (not res!681403) (not e!571454))))

(assert (=> b!1015859 (= res!681403 (and (or (not ((_ is Cons!21497) l!1114)) (bvsle (_1!7623 (h!22695 l!1114)) (h!22696 keys!40))) ((_ is Cons!21497) l!1114) (bvslt (_1!7623 (h!22695 l!1114)) (h!22696 keys!40))))))

(declare-fun b!1015860 () Bool)

(assert (=> b!1015860 (= e!571454 (containsKey!488 (t!30502 l!1114) (h!22696 keys!40)))))

(assert (= (and d!121017 (not res!681402)) b!1015859))

(assert (= (and b!1015859 res!681403) b!1015860))

(declare-fun m!937777 () Bool)

(assert (=> b!1015860 m!937777))

(assert (=> b!1015814 d!121017))

(declare-fun d!121023 () Bool)

(declare-fun isEmpty!868 (Option!593) Bool)

(assert (=> d!121023 (= (isDefined!396 (getValueByKey!542 lt!449208 (h!22696 keys!40))) (not (isEmpty!868 (getValueByKey!542 lt!449208 (h!22696 keys!40)))))))

(declare-fun bs!29468 () Bool)

(assert (= bs!29468 d!121023))

(assert (=> bs!29468 m!937733))

(declare-fun m!937779 () Bool)

(assert (=> bs!29468 m!937779))

(assert (=> b!1015814 d!121023))

(declare-fun d!121025 () Bool)

(assert (=> d!121025 (isDefined!396 (getValueByKey!542 lt!449208 (h!22696 keys!40)))))

(declare-fun lt!449223 () Unit!33241)

(declare-fun choose!1640 (List!21501 (_ BitVec 64)) Unit!33241)

(assert (=> d!121025 (= lt!449223 (choose!1640 lt!449208 (h!22696 keys!40)))))

(declare-fun e!571465 () Bool)

(assert (=> d!121025 e!571465))

(declare-fun res!681414 () Bool)

(assert (=> d!121025 (=> (not res!681414) (not e!571465))))

(assert (=> d!121025 (= res!681414 (isStrictlySorted!607 lt!449208))))

(assert (=> d!121025 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!381 lt!449208 (h!22696 keys!40)) lt!449223)))

(declare-fun b!1015871 () Bool)

(assert (=> b!1015871 (= e!571465 (containsKey!488 lt!449208 (h!22696 keys!40)))))

(assert (= (and d!121025 res!681414) b!1015871))

(assert (=> d!121025 m!937733))

(assert (=> d!121025 m!937733))

(assert (=> d!121025 m!937735))

(declare-fun m!937787 () Bool)

(assert (=> d!121025 m!937787))

(assert (=> d!121025 m!937723))

(declare-fun m!937789 () Bool)

(assert (=> b!1015871 m!937789))

(assert (=> b!1015814 d!121025))

(declare-fun d!121035 () Bool)

(declare-fun c!102902 () Bool)

(assert (=> d!121035 (= c!102902 (and ((_ is Cons!21497) lt!449208) (= (_1!7623 (h!22695 lt!449208)) (h!22696 keys!40))))))

(declare-fun e!571484 () Option!593)

(assert (=> d!121035 (= (getValueByKey!542 lt!449208 (h!22696 keys!40)) e!571484)))

(declare-fun b!1015898 () Bool)

(assert (=> b!1015898 (= e!571484 (Some!592 (_2!7623 (h!22695 lt!449208))))))

(declare-fun b!1015903 () Bool)

(declare-fun e!571485 () Option!593)

(assert (=> b!1015903 (= e!571485 None!591)))

(declare-fun b!1015901 () Bool)

(assert (=> b!1015901 (= e!571484 e!571485)))

(declare-fun c!102903 () Bool)

(assert (=> b!1015901 (= c!102903 (and ((_ is Cons!21497) lt!449208) (not (= (_1!7623 (h!22695 lt!449208)) (h!22696 keys!40)))))))

(declare-fun b!1015902 () Bool)

(assert (=> b!1015902 (= e!571485 (getValueByKey!542 (t!30502 lt!449208) (h!22696 keys!40)))))

(assert (= (and d!121035 c!102902) b!1015898))

(assert (= (and d!121035 (not c!102902)) b!1015901))

(assert (= (and b!1015901 c!102903) b!1015902))

(assert (= (and b!1015901 (not c!102903)) b!1015903))

(declare-fun m!937795 () Bool)

(assert (=> b!1015902 m!937795))

(assert (=> b!1015814 d!121035))

(declare-fun d!121043 () Bool)

(declare-fun res!681425 () Bool)

(declare-fun e!571488 () Bool)

(assert (=> d!121043 (=> res!681425 e!571488)))

(assert (=> d!121043 (= res!681425 ((_ is Nil!21499) (t!30503 keys!40)))))

(assert (=> d!121043 (= (forall!269 (t!30503 keys!40) lambda!962) e!571488)))

(declare-fun b!1015906 () Bool)

(declare-fun e!571489 () Bool)

(assert (=> b!1015906 (= e!571488 e!571489)))

(declare-fun res!681426 () Bool)

(assert (=> b!1015906 (=> (not res!681426) (not e!571489))))

(assert (=> b!1015906 (= res!681426 (dynLambda!1904 lambda!962 (h!22696 (t!30503 keys!40))))))

(declare-fun b!1015907 () Bool)

(assert (=> b!1015907 (= e!571489 (forall!269 (t!30503 (t!30503 keys!40)) lambda!962))))

(assert (= (and d!121043 (not res!681425)) b!1015906))

(assert (= (and b!1015906 res!681426) b!1015907))

(declare-fun b_lambda!15443 () Bool)

(assert (=> (not b_lambda!15443) (not b!1015906)))

(declare-fun m!937799 () Bool)

(assert (=> b!1015906 m!937799))

(declare-fun m!937801 () Bool)

(assert (=> b!1015907 m!937801))

(assert (=> b!1015814 d!121043))

(declare-fun d!121047 () Bool)

(assert (=> d!121047 (containsKey!488 l!1114 (h!22696 keys!40))))

(declare-fun lt!449229 () Unit!33241)

(declare-fun choose!1642 (List!21501 (_ BitVec 64)) Unit!33241)

(assert (=> d!121047 (= lt!449229 (choose!1642 l!1114 (h!22696 keys!40)))))

(declare-fun e!571497 () Bool)

(assert (=> d!121047 e!571497))

(declare-fun res!681434 () Bool)

(assert (=> d!121047 (=> (not res!681434) (not e!571497))))

(assert (=> d!121047 (= res!681434 (isStrictlySorted!607 l!1114))))

(assert (=> d!121047 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!8 l!1114 (h!22696 keys!40)) lt!449229)))

(declare-fun b!1015915 () Bool)

(assert (=> b!1015915 (= e!571497 (isDefined!396 (getValueByKey!542 l!1114 (h!22696 keys!40))))))

(assert (= (and d!121047 res!681434) b!1015915))

(assert (=> d!121047 m!937731))

(declare-fun m!937811 () Bool)

(assert (=> d!121047 m!937811))

(assert (=> d!121047 m!937741))

(declare-fun m!937813 () Bool)

(assert (=> b!1015915 m!937813))

(assert (=> b!1015915 m!937813))

(declare-fun m!937815 () Bool)

(assert (=> b!1015915 m!937815))

(assert (=> b!1015814 d!121047))

(declare-fun d!121053 () Bool)

(declare-fun res!681449 () Bool)

(declare-fun e!571512 () Bool)

(assert (=> d!121053 (=> res!681449 e!571512)))

(assert (=> d!121053 (= res!681449 (or ((_ is Nil!21498) l!1114) ((_ is Nil!21498) (t!30502 l!1114))))))

(assert (=> d!121053 (= (isStrictlySorted!607 l!1114) e!571512)))

(declare-fun b!1015930 () Bool)

(declare-fun e!571513 () Bool)

(assert (=> b!1015930 (= e!571512 e!571513)))

(declare-fun res!681450 () Bool)

(assert (=> b!1015930 (=> (not res!681450) (not e!571513))))

(assert (=> b!1015930 (= res!681450 (bvslt (_1!7623 (h!22695 l!1114)) (_1!7623 (h!22695 (t!30502 l!1114)))))))

(declare-fun b!1015931 () Bool)

(assert (=> b!1015931 (= e!571513 (isStrictlySorted!607 (t!30502 l!1114)))))

(assert (= (and d!121053 (not res!681449)) b!1015930))

(assert (= (and b!1015930 res!681450) b!1015931))

(declare-fun m!937824 () Bool)

(assert (=> b!1015931 m!937824))

(assert (=> start!87956 d!121053))

(declare-fun d!121060 () Bool)

(assert (=> d!121060 (= (isEmpty!866 l!1114) ((_ is Nil!21498) l!1114))))

(assert (=> b!1015812 d!121060))

(declare-fun d!121065 () Bool)

(declare-fun res!681452 () Bool)

(declare-fun e!571515 () Bool)

(assert (=> d!121065 (=> res!681452 e!571515)))

(assert (=> d!121065 (= res!681452 (or ((_ is Nil!21498) lt!449208) ((_ is Nil!21498) (t!30502 lt!449208))))))

(assert (=> d!121065 (= (isStrictlySorted!607 lt!449208) e!571515)))

(declare-fun b!1015933 () Bool)

(declare-fun e!571516 () Bool)

(assert (=> b!1015933 (= e!571515 e!571516)))

(declare-fun res!681453 () Bool)

(assert (=> b!1015933 (=> (not res!681453) (not e!571516))))

(assert (=> b!1015933 (= res!681453 (bvslt (_1!7623 (h!22695 lt!449208)) (_1!7623 (h!22695 (t!30502 lt!449208)))))))

(declare-fun b!1015934 () Bool)

(assert (=> b!1015934 (= e!571516 (isStrictlySorted!607 (t!30502 lt!449208)))))

(assert (= (and d!121065 (not res!681452)) b!1015933))

(assert (= (and b!1015933 res!681453) b!1015934))

(declare-fun m!937831 () Bool)

(assert (=> b!1015934 m!937831))

(assert (=> b!1015811 d!121065))

(declare-fun d!121069 () Bool)

(declare-fun res!681456 () Bool)

(declare-fun e!571519 () Bool)

(assert (=> d!121069 (=> res!681456 e!571519)))

(assert (=> d!121069 (= res!681456 ((_ is Nil!21499) (t!30503 keys!40)))))

(assert (=> d!121069 (= (forall!269 (t!30503 keys!40) lambda!963) e!571519)))

(declare-fun b!1015937 () Bool)

(declare-fun e!571520 () Bool)

(assert (=> b!1015937 (= e!571519 e!571520)))

(declare-fun res!681457 () Bool)

(assert (=> b!1015937 (=> (not res!681457) (not e!571520))))

(assert (=> b!1015937 (= res!681457 (dynLambda!1904 lambda!963 (h!22696 (t!30503 keys!40))))))

(declare-fun b!1015938 () Bool)

(assert (=> b!1015938 (= e!571520 (forall!269 (t!30503 (t!30503 keys!40)) lambda!963))))

(assert (= (and d!121069 (not res!681456)) b!1015937))

(assert (= (and b!1015937 res!681457) b!1015938))

(declare-fun b_lambda!15451 () Bool)

(assert (=> (not b_lambda!15451) (not b!1015937)))

(declare-fun m!937835 () Bool)

(assert (=> b!1015937 m!937835))

(declare-fun m!937837 () Bool)

(assert (=> b!1015938 m!937837))

(assert (=> b!1015811 d!121069))

(declare-fun bs!29471 () Bool)

(declare-fun b!1015978 () Bool)

(assert (= bs!29471 (and b!1015978 b!1015815)))

(declare-fun lambda!978 () Int)

(assert (=> bs!29471 (= lambda!978 lambda!962)))

(declare-fun bs!29472 () Bool)

(assert (= bs!29472 (and b!1015978 b!1015811)))

(assert (=> bs!29472 (= (= l!1114 lt!449208) (= lambda!978 lambda!963))))

(assert (=> b!1015978 true))

(assert (=> b!1015978 true))

(declare-fun bs!29473 () Bool)

(declare-fun d!121073 () Bool)

(assert (= bs!29473 (and d!121073 b!1015815)))

(declare-fun lambda!981 () Int)

(assert (=> bs!29473 (= (= (Cons!21497 newHead!31 l!1114) l!1114) (= lambda!981 lambda!962))))

(declare-fun bs!29474 () Bool)

(assert (= bs!29474 (and d!121073 b!1015811)))

(assert (=> bs!29474 (= (= (Cons!21497 newHead!31 l!1114) lt!449208) (= lambda!981 lambda!963))))

(declare-fun bs!29475 () Bool)

(assert (= bs!29475 (and d!121073 b!1015978)))

(assert (=> bs!29475 (= (= (Cons!21497 newHead!31 l!1114) l!1114) (= lambda!981 lambda!978))))

(assert (=> d!121073 true))

(assert (=> d!121073 true))

(assert (=> d!121073 true))

(assert (=> d!121073 (forall!269 (t!30503 keys!40) lambda!981)))

(declare-fun lt!449241 () Unit!33241)

(declare-fun choose!1645 (List!21501 List!21502 B!1510 tuple2!15224) Unit!33241)

(assert (=> d!121073 (= lt!449241 (choose!1645 l!1114 (t!30503 keys!40) value!178 newHead!31))))

(declare-fun e!571547 () Bool)

(assert (=> d!121073 e!571547))

(declare-fun res!681488 () Bool)

(assert (=> d!121073 (=> (not res!681488) (not e!571547))))

(assert (=> d!121073 (= res!681488 (isStrictlySorted!607 l!1114))))

(assert (=> d!121073 (= (lemmaForallGetValueByKeySameWithASmallerHead!48 l!1114 (t!30503 keys!40) value!178 newHead!31) lt!449241)))

(declare-fun b!1015977 () Bool)

(declare-fun res!681487 () Bool)

(assert (=> b!1015977 (=> (not res!681487) (not e!571547))))

(assert (=> b!1015977 (= res!681487 (not (isEmpty!866 l!1114)))))

(declare-fun res!681486 () Bool)

(assert (=> b!1015978 (=> (not res!681486) (not e!571547))))

(assert (=> b!1015978 (= res!681486 (forall!269 (t!30503 keys!40) lambda!978))))

(declare-fun b!1015979 () Bool)

(assert (=> b!1015979 (= e!571547 (bvslt (_1!7623 newHead!31) (_1!7623 (head!956 l!1114))))))

(assert (= (and d!121073 res!681488) b!1015977))

(assert (= (and b!1015977 res!681487) b!1015978))

(assert (= (and b!1015978 res!681486) b!1015979))

(declare-fun m!937865 () Bool)

(assert (=> d!121073 m!937865))

(declare-fun m!937867 () Bool)

(assert (=> d!121073 m!937867))

(assert (=> d!121073 m!937741))

(assert (=> b!1015977 m!937743))

(declare-fun m!937869 () Bool)

(assert (=> b!1015978 m!937869))

(assert (=> b!1015979 m!937745))

(assert (=> b!1015811 d!121073))

(declare-fun b!1015995 () Bool)

(declare-fun e!571555 () Bool)

(declare-fun tp!70709 () Bool)

(assert (=> b!1015995 (= e!571555 (and tp_is_empty!23577 tp!70709))))

(assert (=> b!1015813 (= tp!70703 e!571555)))

(assert (= (and b!1015813 ((_ is Cons!21497) (t!30502 l!1114))) b!1015995))

(declare-fun b_lambda!15457 () Bool)

(assert (= b_lambda!15451 (or b!1015811 b_lambda!15457)))

(declare-fun bs!29478 () Bool)

(declare-fun d!121091 () Bool)

(assert (= bs!29478 (and d!121091 b!1015811)))

(assert (=> bs!29478 (= (dynLambda!1904 lambda!963 (h!22696 (t!30503 keys!40))) (= (getValueByKey!542 lt!449208 (h!22696 (t!30503 keys!40))) (Some!592 value!178)))))

(declare-fun m!937871 () Bool)

(assert (=> bs!29478 m!937871))

(assert (=> b!1015937 d!121091))

(declare-fun b_lambda!15459 () Bool)

(assert (= b_lambda!15443 (or b!1015815 b_lambda!15459)))

(declare-fun bs!29479 () Bool)

(declare-fun d!121093 () Bool)

(assert (= bs!29479 (and d!121093 b!1015815)))

(assert (=> bs!29479 (= (dynLambda!1904 lambda!962 (h!22696 (t!30503 keys!40))) (= (getValueByKey!542 l!1114 (h!22696 (t!30503 keys!40))) (Some!592 value!178)))))

(declare-fun m!937873 () Bool)

(assert (=> bs!29479 m!937873))

(assert (=> b!1015906 d!121093))

(declare-fun b_lambda!15461 () Bool)

(assert (= b_lambda!15439 (or b!1015815 b_lambda!15461)))

(declare-fun bs!29480 () Bool)

(declare-fun d!121095 () Bool)

(assert (= bs!29480 (and d!121095 b!1015815)))

(assert (=> bs!29480 (= (dynLambda!1904 lambda!962 (h!22696 keys!40)) (= (getValueByKey!542 l!1114 (h!22696 keys!40)) (Some!592 value!178)))))

(assert (=> bs!29480 m!937813))

(assert (=> b!1015849 d!121095))

(check-sat (not d!121023) (not b!1015850) (not b_lambda!15461) (not bs!29480) (not b!1015977) (not bs!29479) (not b!1015978) tp_is_empty!23577 (not b_lambda!15459) (not d!121025) (not b!1015979) (not b!1015915) (not d!121073) (not d!121047) (not b_lambda!15457) (not b!1015934) (not bs!29478) (not b!1015907) (not b!1015938) (not b!1015902) (not b!1015871) (not b!1015995) (not b!1015931) (not b!1015860))
(check-sat)
