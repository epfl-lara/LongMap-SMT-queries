; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88236 () Bool)

(assert start!88236)

(declare-fun b!1016842 () Bool)

(assert (=> b!1016842 true))

(assert (=> b!1016842 true))

(declare-fun b!1016838 () Bool)

(declare-fun e!572050 () Bool)

(declare-fun tp_is_empty!23613 () Bool)

(declare-fun tp!70813 () Bool)

(assert (=> b!1016838 (= e!572050 (and tp_is_empty!23613 tp!70813))))

(declare-fun b!1016839 () Bool)

(declare-fun res!682040 () Bool)

(declare-fun e!572052 () Bool)

(assert (=> b!1016839 (=> (not res!682040) (not e!572052))))

(declare-datatypes ((B!1546 0))(
  ( (B!1547 (val!11857 Int)) )
))
(declare-datatypes ((tuple2!15260 0))(
  ( (tuple2!15261 (_1!7641 (_ BitVec 64)) (_2!7641 B!1546)) )
))
(declare-datatypes ((List!21537 0))(
  ( (Nil!21534) (Cons!21533 (h!22731 tuple2!15260) (t!30538 List!21537)) )
))
(declare-fun l!1114 () List!21537)

(declare-fun isEmpty!893 (List!21537) Bool)

(assert (=> b!1016839 (= res!682040 (not (isEmpty!893 l!1114)))))

(declare-fun b!1016840 () Bool)

(declare-fun e!572051 () Bool)

(assert (=> b!1016840 (= e!572052 (not e!572051))))

(declare-fun res!682035 () Bool)

(assert (=> b!1016840 (=> res!682035 e!572051)))

(declare-datatypes ((List!21538 0))(
  ( (Nil!21535) (Cons!21534 (h!22732 (_ BitVec 64)) (t!30539 List!21538)) )
))
(declare-fun keys!40 () List!21538)

(declare-fun lambda!1050 () Int)

(declare-fun forall!287 (List!21538 Int) Bool)

(assert (=> b!1016840 (= res!682035 (not (forall!287 (t!30539 keys!40) lambda!1050)))))

(declare-fun lt!449344 () List!21537)

(declare-datatypes ((Option!610 0))(
  ( (Some!609 (v!14460 B!1546)) (None!608) )
))
(declare-fun isDefined!408 (Option!610) Bool)

(declare-fun getValueByKey!559 (List!21537 (_ BitVec 64)) Option!610)

(assert (=> b!1016840 (isDefined!408 (getValueByKey!559 lt!449344 (h!22732 keys!40)))))

(declare-datatypes ((Unit!33259 0))(
  ( (Unit!33260) )
))
(declare-fun lt!449345 () Unit!33259)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!387 (List!21537 (_ BitVec 64)) Unit!33259)

(assert (=> b!1016840 (= lt!449345 (lemmaContainsKeyImpliesGetValueByKeyDefined!387 lt!449344 (h!22732 keys!40)))))

(declare-fun newHead!31 () tuple2!15260)

(assert (=> b!1016840 (= lt!449344 (Cons!21533 newHead!31 l!1114))))

(declare-fun containsKey!497 (List!21537 (_ BitVec 64)) Bool)

(assert (=> b!1016840 (containsKey!497 l!1114 (h!22732 keys!40))))

(declare-fun lt!449346 () Unit!33259)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!17 (List!21537 (_ BitVec 64)) Unit!33259)

(assert (=> b!1016840 (= lt!449346 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!17 l!1114 (h!22732 keys!40)))))

(declare-fun b!1016841 () Bool)

(declare-fun ListPrimitiveSize!125 (List!21538) Int)

(assert (=> b!1016841 (= e!572051 (< (ListPrimitiveSize!125 (t!30539 keys!40)) (ListPrimitiveSize!125 keys!40)))))

(declare-fun res!682036 () Bool)

(assert (=> b!1016842 (=> (not res!682036) (not e!572052))))

(assert (=> b!1016842 (= res!682036 (forall!287 keys!40 lambda!1050))))

(declare-fun res!682037 () Bool)

(assert (=> start!88236 (=> (not res!682037) (not e!572052))))

(declare-fun isStrictlySorted!625 (List!21537) Bool)

(assert (=> start!88236 (= res!682037 (isStrictlySorted!625 l!1114))))

(assert (=> start!88236 e!572052))

(assert (=> start!88236 e!572050))

(assert (=> start!88236 true))

(assert (=> start!88236 tp_is_empty!23613))

(declare-fun b!1016843 () Bool)

(declare-fun res!682039 () Bool)

(assert (=> b!1016843 (=> (not res!682039) (not e!572052))))

(declare-fun head!974 (List!21537) tuple2!15260)

(assert (=> b!1016843 (= res!682039 (bvslt (_1!7641 newHead!31) (_1!7641 (head!974 l!1114))))))

(declare-fun b!1016844 () Bool)

(declare-fun res!682038 () Bool)

(assert (=> b!1016844 (=> (not res!682038) (not e!572052))))

(get-info :version)

(assert (=> b!1016844 (= res!682038 ((_ is Cons!21534) keys!40))))

(assert (= (and start!88236 res!682037) b!1016839))

(assert (= (and b!1016839 res!682040) b!1016842))

(assert (= (and b!1016842 res!682036) b!1016843))

(assert (= (and b!1016843 res!682039) b!1016844))

(assert (= (and b!1016844 res!682038) b!1016840))

(assert (= (and b!1016840 (not res!682035)) b!1016841))

(assert (= (and start!88236 ((_ is Cons!21533) l!1114)) b!1016838))

(declare-fun m!938371 () Bool)

(assert (=> b!1016839 m!938371))

(declare-fun m!938373 () Bool)

(assert (=> b!1016842 m!938373))

(declare-fun m!938375 () Bool)

(assert (=> b!1016841 m!938375))

(declare-fun m!938377 () Bool)

(assert (=> b!1016841 m!938377))

(declare-fun m!938379 () Bool)

(assert (=> start!88236 m!938379))

(declare-fun m!938381 () Bool)

(assert (=> b!1016840 m!938381))

(declare-fun m!938383 () Bool)

(assert (=> b!1016840 m!938383))

(declare-fun m!938385 () Bool)

(assert (=> b!1016840 m!938385))

(declare-fun m!938387 () Bool)

(assert (=> b!1016840 m!938387))

(assert (=> b!1016840 m!938385))

(declare-fun m!938389 () Bool)

(assert (=> b!1016840 m!938389))

(declare-fun m!938391 () Bool)

(assert (=> b!1016840 m!938391))

(declare-fun m!938393 () Bool)

(assert (=> b!1016843 m!938393))

(check-sat (not b!1016840) (not start!88236) (not b!1016843) (not b!1016839) (not b!1016842) (not b!1016838) tp_is_empty!23613 (not b!1016841))
(check-sat)
(get-model)

(declare-fun b!1016884 () Bool)

(declare-fun e!572067 () Option!610)

(assert (=> b!1016884 (= e!572067 (getValueByKey!559 (t!30538 lt!449344) (h!22732 keys!40)))))

(declare-fun b!1016882 () Bool)

(declare-fun e!572066 () Option!610)

(assert (=> b!1016882 (= e!572066 (Some!609 (_2!7641 (h!22731 lt!449344))))))

(declare-fun b!1016883 () Bool)

(assert (=> b!1016883 (= e!572066 e!572067)))

(declare-fun c!102964 () Bool)

(assert (=> b!1016883 (= c!102964 (and ((_ is Cons!21533) lt!449344) (not (= (_1!7641 (h!22731 lt!449344)) (h!22732 keys!40)))))))

(declare-fun d!121381 () Bool)

(declare-fun c!102963 () Bool)

(assert (=> d!121381 (= c!102963 (and ((_ is Cons!21533) lt!449344) (= (_1!7641 (h!22731 lt!449344)) (h!22732 keys!40))))))

(assert (=> d!121381 (= (getValueByKey!559 lt!449344 (h!22732 keys!40)) e!572066)))

(declare-fun b!1016885 () Bool)

(assert (=> b!1016885 (= e!572067 None!608)))

(assert (= (and d!121381 c!102963) b!1016882))

(assert (= (and d!121381 (not c!102963)) b!1016883))

(assert (= (and b!1016883 c!102964) b!1016884))

(assert (= (and b!1016883 (not c!102964)) b!1016885))

(declare-fun m!938419 () Bool)

(assert (=> b!1016884 m!938419))

(assert (=> b!1016840 d!121381))

(declare-fun d!121383 () Bool)

(declare-fun res!682063 () Bool)

(declare-fun e!572072 () Bool)

(assert (=> d!121383 (=> res!682063 e!572072)))

(assert (=> d!121383 (= res!682063 (and ((_ is Cons!21533) l!1114) (= (_1!7641 (h!22731 l!1114)) (h!22732 keys!40))))))

(assert (=> d!121383 (= (containsKey!497 l!1114 (h!22732 keys!40)) e!572072)))

(declare-fun b!1016890 () Bool)

(declare-fun e!572073 () Bool)

(assert (=> b!1016890 (= e!572072 e!572073)))

(declare-fun res!682064 () Bool)

(assert (=> b!1016890 (=> (not res!682064) (not e!572073))))

(assert (=> b!1016890 (= res!682064 (and (or (not ((_ is Cons!21533) l!1114)) (bvsle (_1!7641 (h!22731 l!1114)) (h!22732 keys!40))) ((_ is Cons!21533) l!1114) (bvslt (_1!7641 (h!22731 l!1114)) (h!22732 keys!40))))))

(declare-fun b!1016891 () Bool)

(assert (=> b!1016891 (= e!572073 (containsKey!497 (t!30538 l!1114) (h!22732 keys!40)))))

(assert (= (and d!121383 (not res!682063)) b!1016890))

(assert (= (and b!1016890 res!682064) b!1016891))

(declare-fun m!938421 () Bool)

(assert (=> b!1016891 m!938421))

(assert (=> b!1016840 d!121383))

(declare-fun d!121387 () Bool)

(declare-fun res!682075 () Bool)

(declare-fun e!572084 () Bool)

(assert (=> d!121387 (=> res!682075 e!572084)))

(assert (=> d!121387 (= res!682075 ((_ is Nil!21535) (t!30539 keys!40)))))

(assert (=> d!121387 (= (forall!287 (t!30539 keys!40) lambda!1050) e!572084)))

(declare-fun b!1016902 () Bool)

(declare-fun e!572085 () Bool)

(assert (=> b!1016902 (= e!572084 e!572085)))

(declare-fun res!682076 () Bool)

(assert (=> b!1016902 (=> (not res!682076) (not e!572085))))

(declare-fun dynLambda!1921 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016902 (= res!682076 (dynLambda!1921 lambda!1050 (h!22732 (t!30539 keys!40))))))

(declare-fun b!1016903 () Bool)

(assert (=> b!1016903 (= e!572085 (forall!287 (t!30539 (t!30539 keys!40)) lambda!1050))))

(assert (= (and d!121387 (not res!682075)) b!1016902))

(assert (= (and b!1016902 res!682076) b!1016903))

(declare-fun b_lambda!15555 () Bool)

(assert (=> (not b_lambda!15555) (not b!1016902)))

(declare-fun m!938425 () Bool)

(assert (=> b!1016902 m!938425))

(declare-fun m!938427 () Bool)

(assert (=> b!1016903 m!938427))

(assert (=> b!1016840 d!121387))

(declare-fun d!121393 () Bool)

(assert (=> d!121393 (isDefined!408 (getValueByKey!559 lt!449344 (h!22732 keys!40)))))

(declare-fun lt!449360 () Unit!33259)

(declare-fun choose!1657 (List!21537 (_ BitVec 64)) Unit!33259)

(assert (=> d!121393 (= lt!449360 (choose!1657 lt!449344 (h!22732 keys!40)))))

(declare-fun e!572096 () Bool)

(assert (=> d!121393 e!572096))

(declare-fun res!682087 () Bool)

(assert (=> d!121393 (=> (not res!682087) (not e!572096))))

(assert (=> d!121393 (= res!682087 (isStrictlySorted!625 lt!449344))))

(assert (=> d!121393 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!387 lt!449344 (h!22732 keys!40)) lt!449360)))

(declare-fun b!1016914 () Bool)

(assert (=> b!1016914 (= e!572096 (containsKey!497 lt!449344 (h!22732 keys!40)))))

(assert (= (and d!121393 res!682087) b!1016914))

(assert (=> d!121393 m!938385))

(assert (=> d!121393 m!938385))

(assert (=> d!121393 m!938389))

(declare-fun m!938433 () Bool)

(assert (=> d!121393 m!938433))

(declare-fun m!938435 () Bool)

(assert (=> d!121393 m!938435))

(declare-fun m!938437 () Bool)

(assert (=> b!1016914 m!938437))

(assert (=> b!1016840 d!121393))

(declare-fun d!121399 () Bool)

(assert (=> d!121399 (containsKey!497 l!1114 (h!22732 keys!40))))

(declare-fun lt!449364 () Unit!33259)

(declare-fun choose!1659 (List!21537 (_ BitVec 64)) Unit!33259)

(assert (=> d!121399 (= lt!449364 (choose!1659 l!1114 (h!22732 keys!40)))))

(declare-fun e!572110 () Bool)

(assert (=> d!121399 e!572110))

(declare-fun res!682097 () Bool)

(assert (=> d!121399 (=> (not res!682097) (not e!572110))))

(assert (=> d!121399 (= res!682097 (isStrictlySorted!625 l!1114))))

(assert (=> d!121399 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!17 l!1114 (h!22732 keys!40)) lt!449364)))

(declare-fun b!1016932 () Bool)

(assert (=> b!1016932 (= e!572110 (isDefined!408 (getValueByKey!559 l!1114 (h!22732 keys!40))))))

(assert (= (and d!121399 res!682097) b!1016932))

(assert (=> d!121399 m!938381))

(declare-fun m!938447 () Bool)

(assert (=> d!121399 m!938447))

(assert (=> d!121399 m!938379))

(declare-fun m!938449 () Bool)

(assert (=> b!1016932 m!938449))

(assert (=> b!1016932 m!938449))

(declare-fun m!938451 () Bool)

(assert (=> b!1016932 m!938451))

(assert (=> b!1016840 d!121399))

(declare-fun d!121405 () Bool)

(declare-fun isEmpty!896 (Option!610) Bool)

(assert (=> d!121405 (= (isDefined!408 (getValueByKey!559 lt!449344 (h!22732 keys!40))) (not (isEmpty!896 (getValueByKey!559 lt!449344 (h!22732 keys!40)))))))

(declare-fun bs!29541 () Bool)

(assert (= bs!29541 d!121405))

(assert (=> bs!29541 m!938385))

(declare-fun m!938455 () Bool)

(assert (=> bs!29541 m!938455))

(assert (=> b!1016840 d!121405))

(declare-fun d!121409 () Bool)

(declare-fun res!682114 () Bool)

(declare-fun e!572129 () Bool)

(assert (=> d!121409 (=> res!682114 e!572129)))

(assert (=> d!121409 (= res!682114 (or ((_ is Nil!21534) l!1114) ((_ is Nil!21534) (t!30538 l!1114))))))

(assert (=> d!121409 (= (isStrictlySorted!625 l!1114) e!572129)))

(declare-fun b!1016953 () Bool)

(declare-fun e!572130 () Bool)

(assert (=> b!1016953 (= e!572129 e!572130)))

(declare-fun res!682115 () Bool)

(assert (=> b!1016953 (=> (not res!682115) (not e!572130))))

(assert (=> b!1016953 (= res!682115 (bvslt (_1!7641 (h!22731 l!1114)) (_1!7641 (h!22731 (t!30538 l!1114)))))))

(declare-fun b!1016954 () Bool)

(assert (=> b!1016954 (= e!572130 (isStrictlySorted!625 (t!30538 l!1114)))))

(assert (= (and d!121409 (not res!682114)) b!1016953))

(assert (= (and b!1016953 res!682115) b!1016954))

(declare-fun m!938464 () Bool)

(assert (=> b!1016954 m!938464))

(assert (=> start!88236 d!121409))

(declare-fun d!121415 () Bool)

(assert (=> d!121415 (= (isEmpty!893 l!1114) ((_ is Nil!21534) l!1114))))

(assert (=> b!1016839 d!121415))

(declare-fun d!121419 () Bool)

(assert (=> d!121419 (= (head!974 l!1114) (h!22731 l!1114))))

(assert (=> b!1016843 d!121419))

(declare-fun d!121421 () Bool)

(declare-fun res!682118 () Bool)

(declare-fun e!572133 () Bool)

(assert (=> d!121421 (=> res!682118 e!572133)))

(assert (=> d!121421 (= res!682118 ((_ is Nil!21535) keys!40))))

(assert (=> d!121421 (= (forall!287 keys!40 lambda!1050) e!572133)))

(declare-fun b!1016957 () Bool)

(declare-fun e!572134 () Bool)

(assert (=> b!1016957 (= e!572133 e!572134)))

(declare-fun res!682119 () Bool)

(assert (=> b!1016957 (=> (not res!682119) (not e!572134))))

(assert (=> b!1016957 (= res!682119 (dynLambda!1921 lambda!1050 (h!22732 keys!40)))))

(declare-fun b!1016958 () Bool)

(assert (=> b!1016958 (= e!572134 (forall!287 (t!30539 keys!40) lambda!1050))))

(assert (= (and d!121421 (not res!682118)) b!1016957))

(assert (= (and b!1016957 res!682119) b!1016958))

(declare-fun b_lambda!15561 () Bool)

(assert (=> (not b_lambda!15561) (not b!1016957)))

(declare-fun m!938469 () Bool)

(assert (=> b!1016957 m!938469))

(assert (=> b!1016958 m!938387))

(assert (=> b!1016842 d!121421))

(declare-fun d!121423 () Bool)

(declare-fun lt!449373 () Int)

(assert (=> d!121423 (>= lt!449373 0)))

(declare-fun e!572141 () Int)

(assert (=> d!121423 (= lt!449373 e!572141)))

(declare-fun c!102973 () Bool)

(assert (=> d!121423 (= c!102973 ((_ is Nil!21535) (t!30539 keys!40)))))

(assert (=> d!121423 (= (ListPrimitiveSize!125 (t!30539 keys!40)) lt!449373)))

(declare-fun b!1016967 () Bool)

(assert (=> b!1016967 (= e!572141 0)))

(declare-fun b!1016968 () Bool)

(assert (=> b!1016968 (= e!572141 (+ 1 (ListPrimitiveSize!125 (t!30539 (t!30539 keys!40)))))))

(assert (= (and d!121423 c!102973) b!1016967))

(assert (= (and d!121423 (not c!102973)) b!1016968))

(declare-fun m!938483 () Bool)

(assert (=> b!1016968 m!938483))

(assert (=> b!1016841 d!121423))

(declare-fun d!121429 () Bool)

(declare-fun lt!449374 () Int)

(assert (=> d!121429 (>= lt!449374 0)))

(declare-fun e!572142 () Int)

(assert (=> d!121429 (= lt!449374 e!572142)))

(declare-fun c!102974 () Bool)

(assert (=> d!121429 (= c!102974 ((_ is Nil!21535) keys!40))))

(assert (=> d!121429 (= (ListPrimitiveSize!125 keys!40) lt!449374)))

(declare-fun b!1016969 () Bool)

(assert (=> b!1016969 (= e!572142 0)))

(declare-fun b!1016970 () Bool)

(assert (=> b!1016970 (= e!572142 (+ 1 (ListPrimitiveSize!125 (t!30539 keys!40))))))

(assert (= (and d!121429 c!102974) b!1016969))

(assert (= (and d!121429 (not c!102974)) b!1016970))

(assert (=> b!1016970 m!938375))

(assert (=> b!1016841 d!121429))

(declare-fun b!1016981 () Bool)

(declare-fun e!572151 () Bool)

(declare-fun tp!70819 () Bool)

(assert (=> b!1016981 (= e!572151 (and tp_is_empty!23613 tp!70819))))

(assert (=> b!1016838 (= tp!70813 e!572151)))

(assert (= (and b!1016838 ((_ is Cons!21533) (t!30538 l!1114))) b!1016981))

(declare-fun b_lambda!15563 () Bool)

(assert (= b_lambda!15555 (or b!1016842 b_lambda!15563)))

(declare-fun bs!29542 () Bool)

(declare-fun d!121431 () Bool)

(assert (= bs!29542 (and d!121431 b!1016842)))

(declare-fun value!178 () B!1546)

(assert (=> bs!29542 (= (dynLambda!1921 lambda!1050 (h!22732 (t!30539 keys!40))) (= (getValueByKey!559 l!1114 (h!22732 (t!30539 keys!40))) (Some!609 value!178)))))

(declare-fun m!938485 () Bool)

(assert (=> bs!29542 m!938485))

(assert (=> b!1016902 d!121431))

(declare-fun b_lambda!15565 () Bool)

(assert (= b_lambda!15561 (or b!1016842 b_lambda!15565)))

(declare-fun bs!29543 () Bool)

(declare-fun d!121433 () Bool)

(assert (= bs!29543 (and d!121433 b!1016842)))

(assert (=> bs!29543 (= (dynLambda!1921 lambda!1050 (h!22732 keys!40)) (= (getValueByKey!559 l!1114 (h!22732 keys!40)) (Some!609 value!178)))))

(assert (=> bs!29543 m!938449))

(assert (=> b!1016957 d!121433))

(check-sat (not b!1016932) (not bs!29543) (not b!1016958) (not d!121405) (not b_lambda!15563) (not b!1016903) (not b!1016891) (not b!1016954) (not b_lambda!15565) (not b!1016884) tp_is_empty!23613 (not b!1016970) (not b!1016968) (not bs!29542) (not d!121399) (not d!121393) (not b!1016914) (not b!1016981))
(check-sat)
