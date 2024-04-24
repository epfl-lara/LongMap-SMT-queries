; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87658 () Bool)

(assert start!87658)

(declare-fun b!1014184 () Bool)

(assert (=> b!1014184 true))

(assert (=> b!1014184 true))

(declare-fun b!1014180 () Bool)

(declare-datatypes ((Unit!33087 0))(
  ( (Unit!33088) )
))
(declare-fun e!570602 () Unit!33087)

(declare-fun Unit!33089 () Unit!33087)

(assert (=> b!1014180 (= e!570602 Unit!33089)))

(declare-fun b!1014181 () Bool)

(declare-fun e!570601 () Bool)

(declare-datatypes ((B!1364 0))(
  ( (B!1365 (val!11766 Int)) )
))
(declare-datatypes ((tuple2!15082 0))(
  ( (tuple2!15083 (_1!7552 (_ BitVec 64)) (_2!7552 B!1364)) )
))
(declare-datatypes ((List!21368 0))(
  ( (Nil!21365) (Cons!21364 (h!22571 tuple2!15082) (t!30361 List!21368)) )
))
(declare-fun l!412 () List!21368)

(declare-fun isStrictlySorted!534 (List!21368) Bool)

(assert (=> b!1014181 (= e!570601 (not (isStrictlySorted!534 (t!30361 l!412))))))

(declare-fun lt!448225 () Unit!33087)

(assert (=> b!1014181 (= lt!448225 e!570602)))

(declare-fun c!102766 () Bool)

(declare-datatypes ((List!21369 0))(
  ( (Nil!21366) (Cons!21365 (h!22572 (_ BitVec 64)) (t!30362 List!21369)) )
))
(declare-fun lt!448224 () List!21369)

(declare-fun isEmpty!809 (List!21369) Bool)

(assert (=> b!1014181 (= c!102766 (not (isEmpty!809 lt!448224)))))

(declare-fun value!115 () B!1364)

(declare-fun getKeysOf!28 (List!21368 B!1364) List!21369)

(assert (=> b!1014181 (= lt!448224 (getKeysOf!28 (t!30361 l!412) value!115))))

(declare-fun b!1014182 () Bool)

(declare-fun e!570603 () Bool)

(declare-fun tp_is_empty!23431 () Bool)

(declare-fun tp!70347 () Bool)

(assert (=> b!1014182 (= e!570603 (and tp_is_empty!23431 tp!70347))))

(declare-fun res!680705 () Bool)

(assert (=> start!87658 (=> (not res!680705) (not e!570601))))

(assert (=> start!87658 (= res!680705 (isStrictlySorted!534 l!412))))

(assert (=> start!87658 e!570601))

(assert (=> start!87658 e!570603))

(assert (=> start!87658 tp_is_empty!23431))

(declare-fun b!1014183 () Bool)

(declare-fun res!680704 () Bool)

(assert (=> b!1014183 (=> (not res!680704) (not e!570601))))

(get-info :version)

(assert (=> b!1014183 (= res!680704 (and (not (= (_2!7552 (h!22571 l!412)) value!115)) ((_ is Cons!21364) l!412)))))

(declare-fun lt!448226 () Unit!33087)

(assert (=> b!1014184 (= e!570602 lt!448226)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!17 (List!21368 List!21369 B!1364 tuple2!15082) Unit!33087)

(assert (=> b!1014184 (= lt!448226 (lemmaForallGetValueByKeySameWithASmallerHead!17 (t!30361 l!412) lt!448224 value!115 (h!22571 l!412)))))

(declare-fun lambda!419 () Int)

(declare-fun forall!222 (List!21369 Int) Bool)

(assert (=> b!1014184 (forall!222 lt!448224 lambda!419)))

(assert (= (and start!87658 res!680705) b!1014183))

(assert (= (and b!1014183 res!680704) b!1014181))

(assert (= (and b!1014181 c!102766) b!1014184))

(assert (= (and b!1014181 (not c!102766)) b!1014180))

(assert (= (and start!87658 ((_ is Cons!21364) l!412)) b!1014182))

(declare-fun m!937829 () Bool)

(assert (=> b!1014181 m!937829))

(declare-fun m!937831 () Bool)

(assert (=> b!1014181 m!937831))

(declare-fun m!937833 () Bool)

(assert (=> b!1014181 m!937833))

(declare-fun m!937835 () Bool)

(assert (=> start!87658 m!937835))

(declare-fun m!937837 () Bool)

(assert (=> b!1014184 m!937837))

(declare-fun m!937839 () Bool)

(assert (=> b!1014184 m!937839))

(check-sat (not b!1014181) (not b!1014182) (not b!1014184) (not start!87658) tp_is_empty!23431)
(check-sat)
(get-model)

(declare-fun bs!28868 () Bool)

(declare-fun b!1014246 () Bool)

(assert (= bs!28868 (and b!1014246 b!1014184)))

(declare-fun lambda!430 () Int)

(assert (=> bs!28868 (= (= (t!30361 l!412) l!412) (= lambda!430 lambda!419))))

(assert (=> b!1014246 true))

(assert (=> b!1014246 true))

(declare-fun bs!28869 () Bool)

(declare-fun d!120819 () Bool)

(assert (= bs!28869 (and d!120819 b!1014184)))

(declare-fun lambda!431 () Int)

(assert (=> bs!28869 (= (= (Cons!21364 (h!22571 l!412) (t!30361 l!412)) l!412) (= lambda!431 lambda!419))))

(declare-fun bs!28870 () Bool)

(assert (= bs!28870 (and d!120819 b!1014246)))

(assert (=> bs!28870 (= (= (Cons!21364 (h!22571 l!412) (t!30361 l!412)) (t!30361 l!412)) (= lambda!431 lambda!430))))

(assert (=> d!120819 true))

(assert (=> d!120819 true))

(assert (=> d!120819 true))

(assert (=> d!120819 (forall!222 lt!448224 lambda!431)))

(declare-fun lt!448247 () Unit!33087)

(declare-fun choose!1632 (List!21368 List!21369 B!1364 tuple2!15082) Unit!33087)

(assert (=> d!120819 (= lt!448247 (choose!1632 (t!30361 l!412) lt!448224 value!115 (h!22571 l!412)))))

(declare-fun e!570636 () Bool)

(assert (=> d!120819 e!570636))

(declare-fun res!680736 () Bool)

(assert (=> d!120819 (=> (not res!680736) (not e!570636))))

(assert (=> d!120819 (= res!680736 (isStrictlySorted!534 (t!30361 l!412)))))

(assert (=> d!120819 (= (lemmaForallGetValueByKeySameWithASmallerHead!17 (t!30361 l!412) lt!448224 value!115 (h!22571 l!412)) lt!448247)))

(declare-fun b!1014245 () Bool)

(declare-fun res!680737 () Bool)

(assert (=> b!1014245 (=> (not res!680737) (not e!570636))))

(declare-fun isEmpty!812 (List!21368) Bool)

(assert (=> b!1014245 (= res!680737 (not (isEmpty!812 (t!30361 l!412))))))

(declare-fun res!680738 () Bool)

(assert (=> b!1014246 (=> (not res!680738) (not e!570636))))

(assert (=> b!1014246 (= res!680738 (forall!222 lt!448224 lambda!430))))

(declare-fun b!1014247 () Bool)

(declare-fun head!927 (List!21368) tuple2!15082)

(assert (=> b!1014247 (= e!570636 (bvslt (_1!7552 (h!22571 l!412)) (_1!7552 (head!927 (t!30361 l!412)))))))

(assert (= (and d!120819 res!680736) b!1014245))

(assert (= (and b!1014245 res!680737) b!1014246))

(assert (= (and b!1014246 res!680738) b!1014247))

(declare-fun m!937867 () Bool)

(assert (=> d!120819 m!937867))

(declare-fun m!937869 () Bool)

(assert (=> d!120819 m!937869))

(assert (=> d!120819 m!937829))

(declare-fun m!937871 () Bool)

(assert (=> b!1014245 m!937871))

(declare-fun m!937873 () Bool)

(assert (=> b!1014246 m!937873))

(declare-fun m!937875 () Bool)

(assert (=> b!1014247 m!937875))

(assert (=> b!1014184 d!120819))

(declare-fun d!120831 () Bool)

(declare-fun res!680749 () Bool)

(declare-fun e!570643 () Bool)

(assert (=> d!120831 (=> res!680749 e!570643)))

(assert (=> d!120831 (= res!680749 ((_ is Nil!21366) lt!448224))))

(assert (=> d!120831 (= (forall!222 lt!448224 lambda!419) e!570643)))

(declare-fun b!1014260 () Bool)

(declare-fun e!570644 () Bool)

(assert (=> b!1014260 (= e!570643 e!570644)))

(declare-fun res!680750 () Bool)

(assert (=> b!1014260 (=> (not res!680750) (not e!570644))))

(declare-fun dynLambda!1906 (Int (_ BitVec 64)) Bool)

(assert (=> b!1014260 (= res!680750 (dynLambda!1906 lambda!419 (h!22572 lt!448224)))))

(declare-fun b!1014261 () Bool)

(assert (=> b!1014261 (= e!570644 (forall!222 (t!30362 lt!448224) lambda!419))))

(assert (= (and d!120831 (not res!680749)) b!1014260))

(assert (= (and b!1014260 res!680750) b!1014261))

(declare-fun b_lambda!15255 () Bool)

(assert (=> (not b_lambda!15255) (not b!1014260)))

(declare-fun m!937877 () Bool)

(assert (=> b!1014260 m!937877))

(declare-fun m!937879 () Bool)

(assert (=> b!1014261 m!937879))

(assert (=> b!1014184 d!120831))

(declare-fun d!120833 () Bool)

(declare-fun res!680755 () Bool)

(declare-fun e!570649 () Bool)

(assert (=> d!120833 (=> res!680755 e!570649)))

(assert (=> d!120833 (= res!680755 (or ((_ is Nil!21365) (t!30361 l!412)) ((_ is Nil!21365) (t!30361 (t!30361 l!412)))))))

(assert (=> d!120833 (= (isStrictlySorted!534 (t!30361 l!412)) e!570649)))

(declare-fun b!1014266 () Bool)

(declare-fun e!570650 () Bool)

(assert (=> b!1014266 (= e!570649 e!570650)))

(declare-fun res!680756 () Bool)

(assert (=> b!1014266 (=> (not res!680756) (not e!570650))))

(assert (=> b!1014266 (= res!680756 (bvslt (_1!7552 (h!22571 (t!30361 l!412))) (_1!7552 (h!22571 (t!30361 (t!30361 l!412))))))))

(declare-fun b!1014267 () Bool)

(assert (=> b!1014267 (= e!570650 (isStrictlySorted!534 (t!30361 (t!30361 l!412))))))

(assert (= (and d!120833 (not res!680755)) b!1014266))

(assert (= (and b!1014266 res!680756) b!1014267))

(declare-fun m!937881 () Bool)

(assert (=> b!1014267 m!937881))

(assert (=> b!1014181 d!120833))

(declare-fun d!120835 () Bool)

(assert (=> d!120835 (= (isEmpty!809 lt!448224) ((_ is Nil!21366) lt!448224))))

(assert (=> b!1014181 d!120835))

(declare-fun bs!28880 () Bool)

(declare-fun b!1014334 () Bool)

(assert (= bs!28880 (and b!1014334 b!1014184)))

(declare-fun lt!448318 () tuple2!15082)

(declare-fun lt!448312 () List!21368)

(declare-fun lambda!455 () Int)

(assert (=> bs!28880 (= (= (Cons!21364 lt!448318 lt!448312) l!412) (= lambda!455 lambda!419))))

(declare-fun bs!28881 () Bool)

(assert (= bs!28881 (and b!1014334 b!1014246)))

(assert (=> bs!28881 (= (= (Cons!21364 lt!448318 lt!448312) (t!30361 l!412)) (= lambda!455 lambda!430))))

(declare-fun bs!28882 () Bool)

(assert (= bs!28882 (and b!1014334 d!120819)))

(assert (=> bs!28882 (= (= (Cons!21364 lt!448318 lt!448312) (Cons!21364 (h!22571 l!412) (t!30361 l!412))) (= lambda!455 lambda!431))))

(assert (=> b!1014334 true))

(assert (=> b!1014334 true))

(assert (=> b!1014334 true))

(declare-fun bs!28883 () Bool)

(declare-fun b!1014336 () Bool)

(assert (= bs!28883 (and b!1014336 b!1014184)))

(declare-fun lt!448322 () List!21368)

(declare-fun lambda!458 () Int)

(declare-fun lt!448319 () tuple2!15082)

(assert (=> bs!28883 (= (= (Cons!21364 lt!448319 lt!448322) l!412) (= lambda!458 lambda!419))))

(declare-fun bs!28884 () Bool)

(assert (= bs!28884 (and b!1014336 b!1014246)))

(assert (=> bs!28884 (= (= (Cons!21364 lt!448319 lt!448322) (t!30361 l!412)) (= lambda!458 lambda!430))))

(declare-fun bs!28885 () Bool)

(assert (= bs!28885 (and b!1014336 d!120819)))

(assert (=> bs!28885 (= (= (Cons!21364 lt!448319 lt!448322) (Cons!21364 (h!22571 l!412) (t!30361 l!412))) (= lambda!458 lambda!431))))

(declare-fun bs!28886 () Bool)

(assert (= bs!28886 (and b!1014336 b!1014334)))

(assert (=> bs!28886 (= (= (Cons!21364 lt!448319 lt!448322) (Cons!21364 lt!448318 lt!448312)) (= lambda!458 lambda!455))))

(assert (=> b!1014336 true))

(assert (=> b!1014336 true))

(assert (=> b!1014336 true))

(declare-fun bs!28889 () Bool)

(declare-fun d!120837 () Bool)

(assert (= bs!28889 (and d!120837 b!1014334)))

(declare-fun lambda!462 () Int)

(assert (=> bs!28889 (= (= (t!30361 l!412) (Cons!21364 lt!448318 lt!448312)) (= lambda!462 lambda!455))))

(declare-fun bs!28891 () Bool)

(assert (= bs!28891 (and d!120837 d!120819)))

(assert (=> bs!28891 (= (= (t!30361 l!412) (Cons!21364 (h!22571 l!412) (t!30361 l!412))) (= lambda!462 lambda!431))))

(declare-fun bs!28893 () Bool)

(assert (= bs!28893 (and d!120837 b!1014246)))

(assert (=> bs!28893 (= lambda!462 lambda!430)))

(declare-fun bs!28894 () Bool)

(assert (= bs!28894 (and d!120837 b!1014184)))

(assert (=> bs!28894 (= (= (t!30361 l!412) l!412) (= lambda!462 lambda!419))))

(declare-fun bs!28895 () Bool)

(assert (= bs!28895 (and d!120837 b!1014336)))

(assert (=> bs!28895 (= (= (t!30361 l!412) (Cons!21364 lt!448319 lt!448322)) (= lambda!462 lambda!458))))

(assert (=> d!120837 true))

(assert (=> d!120837 true))

(declare-fun b!1014331 () Bool)

(declare-fun e!570686 () Unit!33087)

(declare-fun Unit!33097 () Unit!33087)

(assert (=> b!1014331 (= e!570686 Unit!33097)))

(declare-fun b!1014332 () Bool)

(declare-fun lt!448315 () Unit!33087)

(assert (=> b!1014332 (= lt!448315 e!570686)))

(declare-fun c!102795 () Bool)

(declare-fun call!42674 () Bool)

(assert (=> b!1014332 (= c!102795 (not call!42674))))

(declare-fun lt!448316 () List!21369)

(declare-fun call!42675 () List!21369)

(assert (=> b!1014332 (= lt!448316 call!42675)))

(declare-fun e!570685 () List!21369)

(assert (=> b!1014332 (= e!570685 call!42675)))

(declare-fun lt!448313 () List!21369)

(assert (=> d!120837 (forall!222 lt!448313 lambda!462)))

(declare-fun e!570684 () List!21369)

(assert (=> d!120837 (= lt!448313 e!570684)))

(declare-fun c!102793 () Bool)

(assert (=> d!120837 (= c!102793 (and ((_ is Cons!21364) (t!30361 l!412)) (= (_2!7552 (h!22571 (t!30361 l!412))) value!115)))))

(assert (=> d!120837 (isStrictlySorted!534 (t!30361 l!412))))

(assert (=> d!120837 (= (getKeysOf!28 (t!30361 l!412) value!115) lt!448313)))

(declare-fun b!1014333 () Bool)

(assert (=> b!1014333 (= e!570684 e!570685)))

(declare-fun c!102794 () Bool)

(assert (=> b!1014333 (= c!102794 (and ((_ is Cons!21364) (t!30361 l!412)) (not (= (_2!7552 (h!22571 (t!30361 l!412))) value!115))))))

(declare-fun bm!42670 () Bool)

(assert (=> bm!42670 (= call!42675 (getKeysOf!28 (t!30361 (t!30361 l!412)) value!115))))

(declare-fun call!42673 () Bool)

(assert (=> b!1014334 call!42673))

(declare-fun lt!448321 () Unit!33087)

(declare-fun call!42676 () Unit!33087)

(assert (=> b!1014334 (= lt!448321 call!42676)))

(assert (=> b!1014334 (= lt!448318 (h!22571 (t!30361 l!412)))))

(declare-fun lt!448311 () List!21369)

(assert (=> b!1014334 (= lt!448311 call!42675)))

(assert (=> b!1014334 (= lt!448312 (t!30361 (t!30361 l!412)))))

(declare-fun e!570687 () Unit!33087)

(assert (=> b!1014334 (= e!570687 lt!448321)))

(declare-fun bm!42671 () Bool)

(assert (=> bm!42671 (= call!42674 (isEmpty!809 call!42675))))

(declare-fun bm!42672 () Bool)

(declare-fun lt!448317 () List!21369)

(assert (=> bm!42672 (= call!42673 (forall!222 (ite c!102793 lt!448311 lt!448317) (ite c!102793 lambda!455 lambda!458)))))

(declare-fun bm!42673 () Bool)

(assert (=> bm!42673 (= call!42676 (lemmaForallGetValueByKeySameWithASmallerHead!17 (ite c!102793 lt!448312 lt!448322) (ite c!102793 lt!448311 lt!448317) value!115 (ite c!102793 lt!448318 lt!448319)))))

(declare-fun b!1014335 () Bool)

(assert (=> b!1014335 (= e!570685 Nil!21366)))

(declare-fun lt!448314 () Unit!33087)

(assert (=> b!1014336 (= e!570686 lt!448314)))

(assert (=> b!1014336 (= lt!448322 (t!30361 (t!30361 l!412)))))

(assert (=> b!1014336 (= lt!448317 call!42675)))

(assert (=> b!1014336 (= lt!448319 (h!22571 (t!30361 l!412)))))

(assert (=> b!1014336 (= lt!448314 call!42676)))

(assert (=> b!1014336 call!42673))

(declare-fun b!1014337 () Bool)

(declare-fun Unit!33099 () Unit!33087)

(assert (=> b!1014337 (= e!570687 Unit!33099)))

(declare-fun b!1014338 () Bool)

(assert (=> b!1014338 (= e!570684 (Cons!21365 (_1!7552 (h!22571 (t!30361 l!412))) call!42675))))

(declare-fun c!102796 () Bool)

(assert (=> b!1014338 (= c!102796 (not call!42674))))

(declare-fun lt!448320 () Unit!33087)

(assert (=> b!1014338 (= lt!448320 e!570687)))

(assert (= (and d!120837 c!102793) b!1014338))

(assert (= (and d!120837 (not c!102793)) b!1014333))

(assert (= (and b!1014338 c!102796) b!1014334))

(assert (= (and b!1014338 (not c!102796)) b!1014337))

(assert (= (and b!1014333 c!102794) b!1014332))

(assert (= (and b!1014333 (not c!102794)) b!1014335))

(assert (= (and b!1014332 c!102795) b!1014336))

(assert (= (and b!1014332 (not c!102795)) b!1014331))

(assert (= (or b!1014334 b!1014336) bm!42673))

(assert (= (or b!1014334 b!1014336) bm!42672))

(assert (= (or b!1014338 b!1014334 b!1014332 b!1014336) bm!42670))

(assert (= (or b!1014338 b!1014332) bm!42671))

(declare-fun m!937909 () Bool)

(assert (=> bm!42672 m!937909))

(declare-fun m!937911 () Bool)

(assert (=> bm!42673 m!937911))

(declare-fun m!937913 () Bool)

(assert (=> bm!42670 m!937913))

(declare-fun m!937915 () Bool)

(assert (=> bm!42671 m!937915))

(declare-fun m!937917 () Bool)

(assert (=> d!120837 m!937917))

(assert (=> d!120837 m!937829))

(assert (=> b!1014181 d!120837))

(declare-fun d!120851 () Bool)

(declare-fun res!680779 () Bool)

(declare-fun e!570697 () Bool)

(assert (=> d!120851 (=> res!680779 e!570697)))

(assert (=> d!120851 (= res!680779 (or ((_ is Nil!21365) l!412) ((_ is Nil!21365) (t!30361 l!412))))))

(assert (=> d!120851 (= (isStrictlySorted!534 l!412) e!570697)))

(declare-fun b!1014358 () Bool)

(declare-fun e!570698 () Bool)

(assert (=> b!1014358 (= e!570697 e!570698)))

(declare-fun res!680780 () Bool)

(assert (=> b!1014358 (=> (not res!680780) (not e!570698))))

(assert (=> b!1014358 (= res!680780 (bvslt (_1!7552 (h!22571 l!412)) (_1!7552 (h!22571 (t!30361 l!412)))))))

(declare-fun b!1014359 () Bool)

(assert (=> b!1014359 (= e!570698 (isStrictlySorted!534 (t!30361 l!412)))))

(assert (= (and d!120851 (not res!680779)) b!1014358))

(assert (= (and b!1014358 res!680780) b!1014359))

(assert (=> b!1014359 m!937829))

(assert (=> start!87658 d!120851))

(declare-fun b!1014364 () Bool)

(declare-fun e!570701 () Bool)

(declare-fun tp!70356 () Bool)

(assert (=> b!1014364 (= e!570701 (and tp_is_empty!23431 tp!70356))))

(assert (=> b!1014182 (= tp!70347 e!570701)))

(assert (= (and b!1014182 ((_ is Cons!21364) (t!30361 l!412))) b!1014364))

(declare-fun b_lambda!15259 () Bool)

(assert (= b_lambda!15255 (or b!1014184 b_lambda!15259)))

(declare-fun bs!28901 () Bool)

(declare-fun d!120855 () Bool)

(assert (= bs!28901 (and d!120855 b!1014184)))

(declare-datatypes ((Option!568 0))(
  ( (Some!567 (v!14418 B!1364)) (None!566) )
))
(declare-fun getValueByKey!517 (List!21368 (_ BitVec 64)) Option!568)

(assert (=> bs!28901 (= (dynLambda!1906 lambda!419 (h!22572 lt!448224)) (= (getValueByKey!517 l!412 (h!22572 lt!448224)) (Some!567 value!115)))))

(declare-fun m!937929 () Bool)

(assert (=> bs!28901 m!937929))

(assert (=> b!1014260 d!120855))

(check-sat (not bm!42672) (not d!120837) (not bm!42673) (not bm!42670) (not b!1014246) (not b!1014247) (not bs!28901) (not b!1014261) tp_is_empty!23431 (not b!1014364) (not d!120819) (not b_lambda!15259) (not b!1014359) (not bm!42671) (not b!1014267) (not b!1014245))
(check-sat)
