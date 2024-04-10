; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87318 () Bool)

(assert start!87318)

(declare-fun b!1012101 () Bool)

(assert (=> b!1012101 true))

(assert (=> b!1012101 true))

(declare-fun b!1012099 () Bool)

(declare-fun res!679883 () Bool)

(declare-fun e!569344 () Bool)

(assert (=> b!1012099 (=> (not res!679883) (not e!569344))))

(declare-datatypes ((B!1328 0))(
  ( (B!1329 (val!11748 Int)) )
))
(declare-datatypes ((tuple2!15042 0))(
  ( (tuple2!15043 (_1!7532 (_ BitVec 64)) (_2!7532 B!1328)) )
))
(declare-datatypes ((List!21346 0))(
  ( (Nil!21343) (Cons!21342 (h!22540 tuple2!15042) (t!30347 List!21346)) )
))
(declare-fun l!412 () List!21346)

(declare-fun value!115 () B!1328)

(assert (=> b!1012099 (= res!679883 (and (is-Cons!21342 l!412) (= (_2!7532 (h!22540 l!412)) value!115)))))

(declare-fun b!1012100 () Bool)

(declare-datatypes ((Unit!33044 0))(
  ( (Unit!33045) )
))
(declare-fun e!569342 () Unit!33044)

(declare-fun Unit!33046 () Unit!33044)

(assert (=> b!1012100 (= e!569342 Unit!33046)))

(declare-fun lt!447306 () Unit!33044)

(assert (=> b!1012101 (= e!569342 lt!447306)))

(declare-datatypes ((List!21347 0))(
  ( (Nil!21344) (Cons!21343 (h!22541 (_ BitVec 64)) (t!30348 List!21347)) )
))
(declare-fun lt!447304 () List!21347)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!5 (List!21346 List!21347 B!1328 tuple2!15042) Unit!33044)

(assert (=> b!1012101 (= lt!447306 (lemmaForallGetValueByKeySameWithASmallerHead!5 (t!30347 l!412) lt!447304 value!115 (h!22540 l!412)))))

(declare-fun lambda!287 () Int)

(declare-fun forall!207 (List!21347 Int) Bool)

(assert (=> b!1012101 (forall!207 lt!447304 lambda!287)))

(declare-fun res!679884 () Bool)

(assert (=> start!87318 (=> (not res!679884) (not e!569344))))

(declare-fun isStrictlySorted!528 (List!21346) Bool)

(assert (=> start!87318 (= res!679884 (isStrictlySorted!528 l!412))))

(assert (=> start!87318 e!569344))

(declare-fun e!569343 () Bool)

(assert (=> start!87318 e!569343))

(declare-fun tp_is_empty!23395 () Bool)

(assert (=> start!87318 tp_is_empty!23395))

(declare-fun b!1012102 () Bool)

(assert (=> b!1012102 (= e!569344 (not (isStrictlySorted!528 (t!30347 l!412))))))

(declare-fun lt!447305 () Unit!33044)

(assert (=> b!1012102 (= lt!447305 e!569342)))

(declare-fun c!102225 () Bool)

(declare-fun isEmpty!783 (List!21347) Bool)

(assert (=> b!1012102 (= c!102225 (not (isEmpty!783 lt!447304)))))

(declare-fun getKeysOf!13 (List!21346 B!1328) List!21347)

(assert (=> b!1012102 (= lt!447304 (getKeysOf!13 (t!30347 l!412) value!115))))

(declare-fun b!1012103 () Bool)

(declare-fun tp!70256 () Bool)

(assert (=> b!1012103 (= e!569343 (and tp_is_empty!23395 tp!70256))))

(assert (= (and start!87318 res!679884) b!1012099))

(assert (= (and b!1012099 res!679883) b!1012102))

(assert (= (and b!1012102 c!102225) b!1012101))

(assert (= (and b!1012102 (not c!102225)) b!1012100))

(assert (= (and start!87318 (is-Cons!21342 l!412)) b!1012103))

(declare-fun m!935839 () Bool)

(assert (=> b!1012101 m!935839))

(declare-fun m!935841 () Bool)

(assert (=> b!1012101 m!935841))

(declare-fun m!935843 () Bool)

(assert (=> start!87318 m!935843))

(declare-fun m!935845 () Bool)

(assert (=> b!1012102 m!935845))

(declare-fun m!935847 () Bool)

(assert (=> b!1012102 m!935847))

(declare-fun m!935849 () Bool)

(assert (=> b!1012102 m!935849))

(push 1)

(assert (not b!1012102))

(assert tp_is_empty!23395)

(assert (not b!1012101))

(assert (not b!1012103))

(assert (not start!87318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120237 () Bool)

(declare-fun res!679911 () Bool)

(declare-fun e!569377 () Bool)

(assert (=> d!120237 (=> res!679911 e!569377)))

(assert (=> d!120237 (= res!679911 (or (is-Nil!21343 (t!30347 l!412)) (is-Nil!21343 (t!30347 (t!30347 l!412)))))))

(assert (=> d!120237 (= (isStrictlySorted!528 (t!30347 l!412)) e!569377)))

(declare-fun b!1012160 () Bool)

(declare-fun e!569378 () Bool)

(assert (=> b!1012160 (= e!569377 e!569378)))

(declare-fun res!679912 () Bool)

(assert (=> b!1012160 (=> (not res!679912) (not e!569378))))

(assert (=> b!1012160 (= res!679912 (bvslt (_1!7532 (h!22540 (t!30347 l!412))) (_1!7532 (h!22540 (t!30347 (t!30347 l!412))))))))

(declare-fun b!1012161 () Bool)

(assert (=> b!1012161 (= e!569378 (isStrictlySorted!528 (t!30347 (t!30347 l!412))))))

(assert (= (and d!120237 (not res!679911)) b!1012160))

(assert (= (and b!1012160 res!679912) b!1012161))

(declare-fun m!935877 () Bool)

(assert (=> b!1012161 m!935877))

(assert (=> b!1012102 d!120237))

(declare-fun d!120245 () Bool)

(assert (=> d!120245 (= (isEmpty!783 lt!447304) (is-Nil!21344 lt!447304))))

(assert (=> b!1012102 d!120245))

(declare-fun bs!28770 () Bool)

(declare-fun b!1012225 () Bool)

(assert (= bs!28770 (and b!1012225 b!1012101)))

(declare-fun lt!447389 () List!21346)

(declare-fun lt!447394 () tuple2!15042)

(declare-fun lambda!313 () Int)

(assert (=> bs!28770 (= (= (Cons!21342 lt!447394 lt!447389) l!412) (= lambda!313 lambda!287))))

(assert (=> b!1012225 true))

(assert (=> b!1012225 true))

(assert (=> b!1012225 true))

(declare-fun bs!28773 () Bool)

(declare-fun b!1012229 () Bool)

(assert (= bs!28773 (and b!1012229 b!1012101)))

(declare-fun lambda!316 () Int)

(declare-fun lt!447388 () tuple2!15042)

(declare-fun lt!447399 () List!21346)

(assert (=> bs!28773 (= (= (Cons!21342 lt!447388 lt!447399) l!412) (= lambda!316 lambda!287))))

(declare-fun bs!28775 () Bool)

(assert (= bs!28775 (and b!1012229 b!1012225)))

(assert (=> bs!28775 (= (= (Cons!21342 lt!447388 lt!447399) (Cons!21342 lt!447394 lt!447389)) (= lambda!316 lambda!313))))

(assert (=> b!1012229 true))

(assert (=> b!1012229 true))

(assert (=> b!1012229 true))

(declare-fun bs!28776 () Bool)

(declare-fun d!120249 () Bool)

(assert (= bs!28776 (and d!120249 b!1012101)))

(declare-fun lambda!317 () Int)

(assert (=> bs!28776 (= (= (t!30347 l!412) l!412) (= lambda!317 lambda!287))))

(declare-fun bs!28777 () Bool)

(assert (= bs!28777 (and d!120249 b!1012225)))

(assert (=> bs!28777 (= (= (t!30347 l!412) (Cons!21342 lt!447394 lt!447389)) (= lambda!317 lambda!313))))

(declare-fun bs!28778 () Bool)

(assert (= bs!28778 (and d!120249 b!1012229)))

(assert (=> bs!28778 (= (= (t!30347 l!412) (Cons!21342 lt!447388 lt!447399)) (= lambda!317 lambda!316))))

(assert (=> d!120249 true))

(assert (=> d!120249 true))

(declare-fun call!42501 () Bool)

(assert (=> b!1012225 call!42501))

(declare-fun lt!447392 () Unit!33044)

(declare-fun call!42499 () Unit!33044)

(assert (=> b!1012225 (= lt!447392 call!42499)))

(assert (=> b!1012225 (= lt!447394 (h!22540 (t!30347 l!412)))))

(declare-fun lt!447393 () List!21347)

(declare-fun call!42498 () List!21347)

(assert (=> b!1012225 (= lt!447393 call!42498)))

(assert (=> b!1012225 (= lt!447389 (t!30347 (t!30347 l!412)))))

(declare-fun e!569414 () Unit!33044)

(assert (=> b!1012225 (= e!569414 lt!447392)))

(declare-fun b!1012226 () Bool)

(declare-fun lt!447397 () Unit!33044)

(declare-fun e!569413 () Unit!33044)

(assert (=> b!1012226 (= lt!447397 e!569413)))

(declare-fun c!102252 () Bool)

(declare-fun call!42500 () Bool)

(assert (=> b!1012226 (= c!102252 (not call!42500))))

(declare-fun lt!447396 () List!21347)

(assert (=> b!1012226 (= lt!447396 call!42498)))

(declare-fun e!569415 () List!21347)

(assert (=> b!1012226 (= e!569415 call!42498)))

(declare-fun lt!447398 () List!21347)

(declare-fun c!102255 () Bool)

(declare-fun bm!42495 () Bool)

(assert (=> bm!42495 (= call!42499 (lemmaForallGetValueByKeySameWithASmallerHead!5 (ite c!102255 lt!447389 lt!447399) (ite c!102255 lt!447393 lt!447398) value!115 (ite c!102255 lt!447394 lt!447388)))))

(declare-fun b!1012227 () Bool)

(declare-fun e!569412 () List!21347)

(assert (=> b!1012227 (= e!569412 (Cons!21343 (_1!7532 (h!22540 (t!30347 l!412))) call!42498))))

(declare-fun c!102254 () Bool)

(assert (=> b!1012227 (= c!102254 (not call!42500))))

(declare-fun lt!447395 () Unit!33044)

(assert (=> b!1012227 (= lt!447395 e!569414)))

(declare-fun bm!42496 () Bool)

(assert (=> bm!42496 (= call!42498 (getKeysOf!13 (t!30347 (t!30347 l!412)) value!115))))

(declare-fun lt!447391 () List!21347)

(assert (=> d!120249 (forall!207 lt!447391 lambda!317)))

(assert (=> d!120249 (= lt!447391 e!569412)))

(assert (=> d!120249 (= c!102255 (and (is-Cons!21342 (t!30347 l!412)) (= (_2!7532 (h!22540 (t!30347 l!412))) value!115)))))

(assert (=> d!120249 (isStrictlySorted!528 (t!30347 l!412))))

(assert (=> d!120249 (= (getKeysOf!13 (t!30347 l!412) value!115) lt!447391)))

(declare-fun b!1012228 () Bool)

(assert (=> b!1012228 (= e!569412 e!569415)))

(declare-fun c!102253 () Bool)

(assert (=> b!1012228 (= c!102253 (and (is-Cons!21342 (t!30347 l!412)) (not (= (_2!7532 (h!22540 (t!30347 l!412))) value!115))))))

(declare-fun lt!447390 () Unit!33044)

(assert (=> b!1012229 (= e!569413 lt!447390)))

(assert (=> b!1012229 (= lt!447399 (t!30347 (t!30347 l!412)))))

(assert (=> b!1012229 (= lt!447398 call!42498)))

(assert (=> b!1012229 (= lt!447388 (h!22540 (t!30347 l!412)))))

(assert (=> b!1012229 (= lt!447390 call!42499)))

(assert (=> b!1012229 call!42501))

(declare-fun b!1012230 () Bool)

(declare-fun Unit!33055 () Unit!33044)

(assert (=> b!1012230 (= e!569414 Unit!33055)))

(declare-fun b!1012231 () Bool)

(declare-fun Unit!33056 () Unit!33044)

(assert (=> b!1012231 (= e!569413 Unit!33056)))

(declare-fun bm!42497 () Bool)

(assert (=> bm!42497 (= call!42500 (isEmpty!783 call!42498))))

(declare-fun b!1012232 () Bool)

(assert (=> b!1012232 (= e!569415 Nil!21344)))

(declare-fun bm!42498 () Bool)

(assert (=> bm!42498 (= call!42501 (forall!207 (ite c!102255 lt!447393 lt!447398) (ite c!102255 lambda!313 lambda!316)))))

(assert (= (and d!120249 c!102255) b!1012227))

(assert (= (and d!120249 (not c!102255)) b!1012228))

(assert (= (and b!1012227 c!102254) b!1012225))

(assert (= (and b!1012227 (not c!102254)) b!1012230))

(assert (= (and b!1012228 c!102253) b!1012226))

(assert (= (and b!1012228 (not c!102253)) b!1012232))

(assert (= (and b!1012226 c!102252) b!1012229))

(assert (= (and b!1012226 (not c!102252)) b!1012231))

(assert (= (or b!1012225 b!1012229) bm!42495))

(assert (= (or b!1012225 b!1012229) bm!42498))

(assert (= (or b!1012227 b!1012225 b!1012226 b!1012229) bm!42496))

(assert (= (or b!1012227 b!1012226) bm!42497))

(declare-fun m!935905 () Bool)

(assert (=> bm!42498 m!935905))

(declare-fun m!935907 () Bool)

(assert (=> d!120249 m!935907))

(assert (=> d!120249 m!935845))

(declare-fun m!935909 () Bool)

(assert (=> bm!42496 m!935909))

(declare-fun m!935911 () Bool)

(assert (=> bm!42497 m!935911))

(declare-fun m!935913 () Bool)

(assert (=> bm!42495 m!935913))

(assert (=> b!1012102 d!120249))

(declare-fun bs!28783 () Bool)

(declare-fun b!1012269 () Bool)

(assert (= bs!28783 (and b!1012269 b!1012101)))

(declare-fun lambda!333 () Int)

(assert (=> bs!28783 (= (= (t!30347 l!412) l!412) (= lambda!333 lambda!287))))

(declare-fun bs!28784 () Bool)

(assert (= bs!28784 (and b!1012269 b!1012225)))

(assert (=> bs!28784 (= (= (t!30347 l!412) (Cons!21342 lt!447394 lt!447389)) (= lambda!333 lambda!313))))

(declare-fun bs!28785 () Bool)

(assert (= bs!28785 (and b!1012269 b!1012229)))

(assert (=> bs!28785 (= (= (t!30347 l!412) (Cons!21342 lt!447388 lt!447399)) (= lambda!333 lambda!316))))

(declare-fun bs!28787 () Bool)

(assert (= bs!28787 (and b!1012269 d!120249)))

(assert (=> bs!28787 (= lambda!333 lambda!317)))

(assert (=> b!1012269 true))

(assert (=> b!1012269 true))

(declare-fun bs!28792 () Bool)

(declare-fun d!120263 () Bool)

(assert (= bs!28792 (and d!120263 d!120249)))

(declare-fun lambda!335 () Int)

(assert (=> bs!28792 (= (= (Cons!21342 (h!22540 l!412) (t!30347 l!412)) (t!30347 l!412)) (= lambda!335 lambda!317))))

(declare-fun bs!28793 () Bool)

(assert (= bs!28793 (and d!120263 b!1012225)))

(assert (=> bs!28793 (= (= (Cons!21342 (h!22540 l!412) (t!30347 l!412)) (Cons!21342 lt!447394 lt!447389)) (= lambda!335 lambda!313))))

(declare-fun bs!28794 () Bool)

(assert (= bs!28794 (and d!120263 b!1012101)))

(assert (=> bs!28794 (= (= (Cons!21342 (h!22540 l!412) (t!30347 l!412)) l!412) (= lambda!335 lambda!287))))

(declare-fun bs!28795 () Bool)

(assert (= bs!28795 (and d!120263 b!1012229)))

(assert (=> bs!28795 (= (= (Cons!21342 (h!22540 l!412) (t!30347 l!412)) (Cons!21342 lt!447388 lt!447399)) (= lambda!335 lambda!316))))

(declare-fun bs!28796 () Bool)

(assert (= bs!28796 (and d!120263 b!1012269)))

(assert (=> bs!28796 (= (= (Cons!21342 (h!22540 l!412) (t!30347 l!412)) (t!30347 l!412)) (= lambda!335 lambda!333))))

(assert (=> d!120263 true))

(assert (=> d!120263 true))

(assert (=> d!120263 true))

(assert (=> d!120263 (forall!207 lt!447304 lambda!335)))

(declare-fun lt!447429 () Unit!33044)

(declare-fun choose!1624 (List!21346 List!21347 B!1328 tuple2!15042) Unit!33044)

(assert (=> d!120263 (= lt!447429 (choose!1624 (t!30347 l!412) lt!447304 value!115 (h!22540 l!412)))))

(declare-fun e!569431 () Bool)

(assert (=> d!120263 e!569431))

(declare-fun res!679950 () Bool)

(assert (=> d!120263 (=> (not res!679950) (not e!569431))))

(assert (=> d!120263 (= res!679950 (isStrictlySorted!528 (t!30347 l!412)))))

(assert (=> d!120263 (= (lemmaForallGetValueByKeySameWithASmallerHead!5 (t!30347 l!412) lt!447304 value!115 (h!22540 l!412)) lt!447429)))

(declare-fun b!1012268 () Bool)

(declare-fun res!679951 () Bool)

(assert (=> b!1012268 (=> (not res!679951) (not e!569431))))

(declare-fun isEmpty!787 (List!21346) Bool)

(assert (=> b!1012268 (= res!679951 (not (isEmpty!787 (t!30347 l!412))))))

(declare-fun res!679949 () Bool)

(assert (=> b!1012269 (=> (not res!679949) (not e!569431))))

(assert (=> b!1012269 (= res!679949 (forall!207 lt!447304 lambda!333))))

(declare-fun b!1012270 () Bool)

(declare-fun head!924 (List!21346) tuple2!15042)

(assert (=> b!1012270 (= e!569431 (bvslt (_1!7532 (h!22540 l!412)) (_1!7532 (head!924 (t!30347 l!412)))))))

(assert (= (and d!120263 res!679950) b!1012268))

(assert (= (and b!1012268 res!679951) b!1012269))

(assert (= (and b!1012269 res!679949) b!1012270))

(declare-fun m!935925 () Bool)

(assert (=> d!120263 m!935925))

(declare-fun m!935927 () Bool)

(assert (=> d!120263 m!935927))

(assert (=> d!120263 m!935845))

(declare-fun m!935929 () Bool)

(assert (=> b!1012268 m!935929))

(declare-fun m!935931 () Bool)

(assert (=> b!1012269 m!935931))

(declare-fun m!935933 () Bool)

(assert (=> b!1012270 m!935933))

(assert (=> b!1012101 d!120263))

(declare-fun d!120267 () Bool)

(declare-fun res!679962 () Bool)

(declare-fun e!569448 () Bool)

(assert (=> d!120267 (=> res!679962 e!569448)))

(assert (=> d!120267 (= res!679962 (is-Nil!21344 lt!447304))))

(assert (=> d!120267 (= (forall!207 lt!447304 lambda!287) e!569448)))

(declare-fun b!1012293 () Bool)

(declare-fun e!569449 () Bool)

(assert (=> b!1012293 (= e!569448 e!569449)))

(declare-fun res!679963 () Bool)

(assert (=> b!1012293 (=> (not res!679963) (not e!569449))))

(declare-fun dynLambda!1879 (Int (_ BitVec 64)) Bool)

(assert (=> b!1012293 (= res!679963 (dynLambda!1879 lambda!287 (h!22541 lt!447304)))))

(declare-fun b!1012294 () Bool)

(assert (=> b!1012294 (= e!569449 (forall!207 (t!30348 lt!447304) lambda!287))))

(assert (= (and d!120267 (not res!679962)) b!1012293))

(assert (= (and b!1012293 res!679963) b!1012294))

(declare-fun b_lambda!15233 () Bool)

(assert (=> (not b_lambda!15233) (not b!1012293)))

(declare-fun m!935939 () Bool)

(assert (=> b!1012293 m!935939))

(declare-fun m!935941 () Bool)

(assert (=> b!1012294 m!935941))

(assert (=> b!1012101 d!120267))

(declare-fun d!120269 () Bool)

(declare-fun res!679964 () Bool)

(declare-fun e!569451 () Bool)

(assert (=> d!120269 (=> res!679964 e!569451)))

(assert (=> d!120269 (= res!679964 (or (is-Nil!21343 l!412) (is-Nil!21343 (t!30347 l!412))))))

(assert (=> d!120269 (= (isStrictlySorted!528 l!412) e!569451)))

(declare-fun b!1012296 () Bool)

(declare-fun e!569452 () Bool)

(assert (=> b!1012296 (= e!569451 e!569452)))

(declare-fun res!679965 () Bool)

(assert (=> b!1012296 (=> (not res!679965) (not e!569452))))

(assert (=> b!1012296 (= res!679965 (bvslt (_1!7532 (h!22540 l!412)) (_1!7532 (h!22540 (t!30347 l!412)))))))

(declare-fun b!1012297 () Bool)

(assert (=> b!1012297 (= e!569452 (isStrictlySorted!528 (t!30347 l!412)))))

(assert (= (and d!120269 (not res!679964)) b!1012296))

(assert (= (and b!1012296 res!679965) b!1012297))

(assert (=> b!1012297 m!935845))

(assert (=> start!87318 d!120269))

(declare-fun b!1012302 () Bool)

(declare-fun e!569455 () Bool)

(declare-fun tp!70268 () Bool)

(assert (=> b!1012302 (= e!569455 (and tp_is_empty!23395 tp!70268))))

(assert (=> b!1012103 (= tp!70256 e!569455)))

(assert (= (and b!1012103 (is-Cons!21342 (t!30347 l!412))) b!1012302))

(declare-fun b_lambda!15237 () Bool)

(assert (= b_lambda!15233 (or b!1012101 b_lambda!15237)))

(declare-fun bs!28809 () Bool)

(declare-fun d!120273 () Bool)

(assert (= bs!28809 (and d!120273 b!1012101)))

(declare-datatypes ((Option!567 0))(
  ( (Some!566 (v!14417 B!1328)) (None!565) )
))
(declare-fun getValueByKey!516 (List!21346 (_ BitVec 64)) Option!567)

(assert (=> bs!28809 (= (dynLambda!1879 lambda!287 (h!22541 lt!447304)) (= (getValueByKey!516 l!412 (h!22541 lt!447304)) (Some!566 value!115)))))

(declare-fun m!935945 () Bool)

(assert (=> bs!28809 m!935945))

(assert (=> b!1012293 d!120273))

(push 1)

