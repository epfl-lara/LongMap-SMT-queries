; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88088 () Bool)

(assert start!88088)

(declare-fun b!1016307 () Bool)

(assert (=> b!1016307 true))

(assert (=> b!1016307 true))

(declare-fun b!1016302 () Bool)

(declare-fun res!681692 () Bool)

(declare-fun e!571716 () Bool)

(assert (=> b!1016302 (=> (not res!681692) (not e!571716))))

(declare-datatypes ((B!1528 0))(
  ( (B!1529 (val!11848 Int)) )
))
(declare-datatypes ((tuple2!15242 0))(
  ( (tuple2!15243 (_1!7632 (_ BitVec 64)) (_2!7632 B!1528)) )
))
(declare-fun newHead!31 () tuple2!15242)

(declare-datatypes ((List!21519 0))(
  ( (Nil!21516) (Cons!21515 (h!22713 tuple2!15242) (t!30520 List!21519)) )
))
(declare-fun l!1114 () List!21519)

(declare-fun head!965 (List!21519) tuple2!15242)

(assert (=> b!1016302 (= res!681692 (bvslt (_1!7632 newHead!31) (_1!7632 (head!965 l!1114))))))

(declare-fun b!1016303 () Bool)

(declare-fun e!571717 () Bool)

(declare-fun tp_is_empty!23595 () Bool)

(declare-fun tp!70757 () Bool)

(assert (=> b!1016303 (= e!571717 (and tp_is_empty!23595 tp!70757))))

(declare-fun res!681689 () Bool)

(assert (=> start!88088 (=> (not res!681689) (not e!571716))))

(declare-fun isStrictlySorted!616 (List!21519) Bool)

(assert (=> start!88088 (= res!681689 (isStrictlySorted!616 l!1114))))

(assert (=> start!88088 e!571716))

(assert (=> start!88088 e!571717))

(assert (=> start!88088 true))

(assert (=> start!88088 tp_is_empty!23595))

(declare-fun b!1016304 () Bool)

(declare-fun res!681691 () Bool)

(assert (=> b!1016304 (=> (not res!681691) (not e!571716))))

(declare-datatypes ((List!21520 0))(
  ( (Nil!21517) (Cons!21516 (h!22714 (_ BitVec 64)) (t!30521 List!21520)) )
))
(declare-fun keys!40 () List!21520)

(get-info :version)

(assert (=> b!1016304 (= res!681691 ((_ is Cons!21516) keys!40))))

(declare-fun b!1016305 () Bool)

(declare-fun res!681690 () Bool)

(assert (=> b!1016305 (=> (not res!681690) (not e!571716))))

(declare-fun isEmpty!878 (List!21519) Bool)

(assert (=> b!1016305 (= res!681690 (not (isEmpty!878 l!1114)))))

(declare-fun b!1016306 () Bool)

(declare-datatypes ((Option!601 0))(
  ( (Some!600 (v!14451 B!1528)) (None!599) )
))
(declare-fun isDefined!399 (Option!601) Bool)

(declare-fun getValueByKey!550 (List!21519 (_ BitVec 64)) Option!601)

(assert (=> b!1016306 (= e!571716 (not (isDefined!399 (getValueByKey!550 l!1114 (h!22714 keys!40)))))))

(declare-fun res!681693 () Bool)

(assert (=> b!1016307 (=> (not res!681693) (not e!571716))))

(declare-fun lambda!1013 () Int)

(declare-fun forall!278 (List!21520 Int) Bool)

(assert (=> b!1016307 (= res!681693 (forall!278 keys!40 lambda!1013))))

(assert (= (and start!88088 res!681689) b!1016305))

(assert (= (and b!1016305 res!681690) b!1016307))

(assert (= (and b!1016307 res!681693) b!1016302))

(assert (= (and b!1016302 res!681692) b!1016304))

(assert (= (and b!1016304 res!681691) b!1016306))

(assert (= (and start!88088 ((_ is Cons!21515) l!1114)) b!1016303))

(declare-fun m!938027 () Bool)

(assert (=> b!1016306 m!938027))

(assert (=> b!1016306 m!938027))

(declare-fun m!938029 () Bool)

(assert (=> b!1016306 m!938029))

(declare-fun m!938031 () Bool)

(assert (=> b!1016305 m!938031))

(declare-fun m!938033 () Bool)

(assert (=> b!1016307 m!938033))

(declare-fun m!938035 () Bool)

(assert (=> b!1016302 m!938035))

(declare-fun m!938037 () Bool)

(assert (=> start!88088 m!938037))

(check-sat (not b!1016306) tp_is_empty!23595 (not start!88088) (not b!1016303) (not b!1016307) (not b!1016305) (not b!1016302))
(check-sat)
(get-model)

(declare-fun d!121187 () Bool)

(assert (=> d!121187 (= (head!965 l!1114) (h!22713 l!1114))))

(assert (=> b!1016302 d!121187))

(declare-fun d!121189 () Bool)

(declare-fun res!681713 () Bool)

(declare-fun e!571728 () Bool)

(assert (=> d!121189 (=> res!681713 e!571728)))

(assert (=> d!121189 (= res!681713 ((_ is Nil!21517) keys!40))))

(assert (=> d!121189 (= (forall!278 keys!40 lambda!1013) e!571728)))

(declare-fun b!1016338 () Bool)

(declare-fun e!571729 () Bool)

(assert (=> b!1016338 (= e!571728 e!571729)))

(declare-fun res!681714 () Bool)

(assert (=> b!1016338 (=> (not res!681714) (not e!571729))))

(declare-fun dynLambda!1912 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016338 (= res!681714 (dynLambda!1912 lambda!1013 (h!22714 keys!40)))))

(declare-fun b!1016339 () Bool)

(assert (=> b!1016339 (= e!571729 (forall!278 (t!30521 keys!40) lambda!1013))))

(assert (= (and d!121189 (not res!681713)) b!1016338))

(assert (= (and b!1016338 res!681714) b!1016339))

(declare-fun b_lambda!15499 () Bool)

(assert (=> (not b_lambda!15499) (not b!1016338)))

(declare-fun m!938051 () Bool)

(assert (=> b!1016338 m!938051))

(declare-fun m!938053 () Bool)

(assert (=> b!1016339 m!938053))

(assert (=> b!1016307 d!121189))

(declare-fun d!121191 () Bool)

(declare-fun res!681719 () Bool)

(declare-fun e!571734 () Bool)

(assert (=> d!121191 (=> res!681719 e!571734)))

(assert (=> d!121191 (= res!681719 (or ((_ is Nil!21516) l!1114) ((_ is Nil!21516) (t!30520 l!1114))))))

(assert (=> d!121191 (= (isStrictlySorted!616 l!1114) e!571734)))

(declare-fun b!1016344 () Bool)

(declare-fun e!571735 () Bool)

(assert (=> b!1016344 (= e!571734 e!571735)))

(declare-fun res!681720 () Bool)

(assert (=> b!1016344 (=> (not res!681720) (not e!571735))))

(assert (=> b!1016344 (= res!681720 (bvslt (_1!7632 (h!22713 l!1114)) (_1!7632 (h!22713 (t!30520 l!1114)))))))

(declare-fun b!1016345 () Bool)

(assert (=> b!1016345 (= e!571735 (isStrictlySorted!616 (t!30520 l!1114)))))

(assert (= (and d!121191 (not res!681719)) b!1016344))

(assert (= (and b!1016344 res!681720) b!1016345))

(declare-fun m!938057 () Bool)

(assert (=> b!1016345 m!938057))

(assert (=> start!88088 d!121191))

(declare-fun d!121197 () Bool)

(declare-fun isEmpty!881 (Option!601) Bool)

(assert (=> d!121197 (= (isDefined!399 (getValueByKey!550 l!1114 (h!22714 keys!40))) (not (isEmpty!881 (getValueByKey!550 l!1114 (h!22714 keys!40)))))))

(declare-fun bs!29511 () Bool)

(assert (= bs!29511 d!121197))

(assert (=> bs!29511 m!938027))

(declare-fun m!938059 () Bool)

(assert (=> bs!29511 m!938059))

(assert (=> b!1016306 d!121197))

(declare-fun b!1016367 () Bool)

(declare-fun e!571746 () Option!601)

(declare-fun e!571747 () Option!601)

(assert (=> b!1016367 (= e!571746 e!571747)))

(declare-fun c!102930 () Bool)

(assert (=> b!1016367 (= c!102930 (and ((_ is Cons!21515) l!1114) (not (= (_1!7632 (h!22713 l!1114)) (h!22714 keys!40)))))))

(declare-fun b!1016368 () Bool)

(assert (=> b!1016368 (= e!571747 (getValueByKey!550 (t!30520 l!1114) (h!22714 keys!40)))))

(declare-fun d!121199 () Bool)

(declare-fun c!102929 () Bool)

(assert (=> d!121199 (= c!102929 (and ((_ is Cons!21515) l!1114) (= (_1!7632 (h!22713 l!1114)) (h!22714 keys!40))))))

(assert (=> d!121199 (= (getValueByKey!550 l!1114 (h!22714 keys!40)) e!571746)))

(declare-fun b!1016369 () Bool)

(assert (=> b!1016369 (= e!571747 None!599)))

(declare-fun b!1016366 () Bool)

(assert (=> b!1016366 (= e!571746 (Some!600 (_2!7632 (h!22713 l!1114))))))

(assert (= (and d!121199 c!102929) b!1016366))

(assert (= (and d!121199 (not c!102929)) b!1016367))

(assert (= (and b!1016367 c!102930) b!1016368))

(assert (= (and b!1016367 (not c!102930)) b!1016369))

(declare-fun m!938063 () Bool)

(assert (=> b!1016368 m!938063))

(assert (=> b!1016306 d!121199))

(declare-fun d!121205 () Bool)

(assert (=> d!121205 (= (isEmpty!878 l!1114) ((_ is Nil!21516) l!1114))))

(assert (=> b!1016305 d!121205))

(declare-fun b!1016384 () Bool)

(declare-fun e!571760 () Bool)

(declare-fun tp!70763 () Bool)

(assert (=> b!1016384 (= e!571760 (and tp_is_empty!23595 tp!70763))))

(assert (=> b!1016303 (= tp!70757 e!571760)))

(assert (= (and b!1016303 ((_ is Cons!21515) (t!30520 l!1114))) b!1016384))

(declare-fun b_lambda!15501 () Bool)

(assert (= b_lambda!15499 (or b!1016307 b_lambda!15501)))

(declare-fun bs!29512 () Bool)

(declare-fun d!121209 () Bool)

(assert (= bs!29512 (and d!121209 b!1016307)))

(declare-fun value!178 () B!1528)

(assert (=> bs!29512 (= (dynLambda!1912 lambda!1013 (h!22714 keys!40)) (= (getValueByKey!550 l!1114 (h!22714 keys!40)) (Some!600 value!178)))))

(assert (=> bs!29512 m!938027))

(assert (=> b!1016338 d!121209))

(check-sat (not b!1016368) (not bs!29512) tp_is_empty!23595 (not b!1016384) (not d!121197) (not b!1016345) (not b_lambda!15501) (not b!1016339))
(check-sat)
(get-model)

(declare-fun b!1016422 () Bool)

(declare-fun e!571787 () Option!601)

(declare-fun e!571788 () Option!601)

(assert (=> b!1016422 (= e!571787 e!571788)))

(declare-fun c!102938 () Bool)

(assert (=> b!1016422 (= c!102938 (and ((_ is Cons!21515) (t!30520 l!1114)) (not (= (_1!7632 (h!22713 (t!30520 l!1114))) (h!22714 keys!40)))))))

(declare-fun b!1016423 () Bool)

(assert (=> b!1016423 (= e!571788 (getValueByKey!550 (t!30520 (t!30520 l!1114)) (h!22714 keys!40)))))

(declare-fun d!121229 () Bool)

(declare-fun c!102937 () Bool)

(assert (=> d!121229 (= c!102937 (and ((_ is Cons!21515) (t!30520 l!1114)) (= (_1!7632 (h!22713 (t!30520 l!1114))) (h!22714 keys!40))))))

(assert (=> d!121229 (= (getValueByKey!550 (t!30520 l!1114) (h!22714 keys!40)) e!571787)))

(declare-fun b!1016424 () Bool)

(assert (=> b!1016424 (= e!571788 None!599)))

(declare-fun b!1016421 () Bool)

(assert (=> b!1016421 (= e!571787 (Some!600 (_2!7632 (h!22713 (t!30520 l!1114)))))))

(assert (= (and d!121229 c!102937) b!1016421))

(assert (= (and d!121229 (not c!102937)) b!1016422))

(assert (= (and b!1016422 c!102938) b!1016423))

(assert (= (and b!1016422 (not c!102938)) b!1016424))

(declare-fun m!938081 () Bool)

(assert (=> b!1016423 m!938081))

(assert (=> b!1016368 d!121229))

(declare-fun d!121231 () Bool)

(assert (=> d!121231 (= (isEmpty!881 (getValueByKey!550 l!1114 (h!22714 keys!40))) (not ((_ is Some!600) (getValueByKey!550 l!1114 (h!22714 keys!40)))))))

(assert (=> d!121197 d!121231))

(declare-fun d!121233 () Bool)

(declare-fun res!681745 () Bool)

(declare-fun e!571789 () Bool)

(assert (=> d!121233 (=> res!681745 e!571789)))

(assert (=> d!121233 (= res!681745 (or ((_ is Nil!21516) (t!30520 l!1114)) ((_ is Nil!21516) (t!30520 (t!30520 l!1114)))))))

(assert (=> d!121233 (= (isStrictlySorted!616 (t!30520 l!1114)) e!571789)))

(declare-fun b!1016425 () Bool)

(declare-fun e!571790 () Bool)

(assert (=> b!1016425 (= e!571789 e!571790)))

(declare-fun res!681746 () Bool)

(assert (=> b!1016425 (=> (not res!681746) (not e!571790))))

(assert (=> b!1016425 (= res!681746 (bvslt (_1!7632 (h!22713 (t!30520 l!1114))) (_1!7632 (h!22713 (t!30520 (t!30520 l!1114))))))))

(declare-fun b!1016426 () Bool)

(assert (=> b!1016426 (= e!571790 (isStrictlySorted!616 (t!30520 (t!30520 l!1114))))))

(assert (= (and d!121233 (not res!681745)) b!1016425))

(assert (= (and b!1016425 res!681746) b!1016426))

(declare-fun m!938083 () Bool)

(assert (=> b!1016426 m!938083))

(assert (=> b!1016345 d!121233))

(declare-fun d!121235 () Bool)

(declare-fun res!681747 () Bool)

(declare-fun e!571791 () Bool)

(assert (=> d!121235 (=> res!681747 e!571791)))

(assert (=> d!121235 (= res!681747 ((_ is Nil!21517) (t!30521 keys!40)))))

(assert (=> d!121235 (= (forall!278 (t!30521 keys!40) lambda!1013) e!571791)))

(declare-fun b!1016427 () Bool)

(declare-fun e!571792 () Bool)

(assert (=> b!1016427 (= e!571791 e!571792)))

(declare-fun res!681748 () Bool)

(assert (=> b!1016427 (=> (not res!681748) (not e!571792))))

(assert (=> b!1016427 (= res!681748 (dynLambda!1912 lambda!1013 (h!22714 (t!30521 keys!40))))))

(declare-fun b!1016428 () Bool)

(assert (=> b!1016428 (= e!571792 (forall!278 (t!30521 (t!30521 keys!40)) lambda!1013))))

(assert (= (and d!121235 (not res!681747)) b!1016427))

(assert (= (and b!1016427 res!681748) b!1016428))

(declare-fun b_lambda!15511 () Bool)

(assert (=> (not b_lambda!15511) (not b!1016427)))

(declare-fun m!938085 () Bool)

(assert (=> b!1016427 m!938085))

(declare-fun m!938087 () Bool)

(assert (=> b!1016428 m!938087))

(assert (=> b!1016339 d!121235))

(assert (=> bs!29512 d!121199))

(declare-fun b!1016429 () Bool)

(declare-fun e!571793 () Bool)

(declare-fun tp!70770 () Bool)

(assert (=> b!1016429 (= e!571793 (and tp_is_empty!23595 tp!70770))))

(assert (=> b!1016384 (= tp!70763 e!571793)))

(assert (= (and b!1016384 ((_ is Cons!21515) (t!30520 (t!30520 l!1114)))) b!1016429))

(declare-fun b_lambda!15513 () Bool)

(assert (= b_lambda!15511 (or b!1016307 b_lambda!15513)))

(declare-fun bs!29516 () Bool)

(declare-fun d!121237 () Bool)

(assert (= bs!29516 (and d!121237 b!1016307)))

(assert (=> bs!29516 (= (dynLambda!1912 lambda!1013 (h!22714 (t!30521 keys!40))) (= (getValueByKey!550 l!1114 (h!22714 (t!30521 keys!40))) (Some!600 value!178)))))

(declare-fun m!938089 () Bool)

(assert (=> bs!29516 m!938089))

(assert (=> b!1016427 d!121237))

(check-sat tp_is_empty!23595 (not b!1016428) (not b_lambda!15501) (not b!1016429) (not b_lambda!15513) (not b!1016423) (not bs!29516) (not b!1016426))
(check-sat)
