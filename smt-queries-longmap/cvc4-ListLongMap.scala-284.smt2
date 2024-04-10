; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4648 () Bool)

(assert start!4648)

(declare-fun b_free!1295 () Bool)

(declare-fun b_next!1295 () Bool)

(assert (=> start!4648 (= b_free!1295 (not b_next!1295))))

(declare-fun tp!5336 () Bool)

(declare-fun b_and!2129 () Bool)

(assert (=> start!4648 (= tp!5336 b_and!2129)))

(declare-fun b!36324 () Bool)

(declare-fun e!22933 () Bool)

(declare-datatypes ((B!702 0))(
  ( (B!703 (val!851 Int)) )
))
(declare-datatypes ((tuple2!1362 0))(
  ( (tuple2!1363 (_1!692 (_ BitVec 64)) (_2!692 B!702)) )
))
(declare-datatypes ((List!955 0))(
  ( (Nil!952) (Cons!951 (h!1519 tuple2!1362) (t!3668 List!955)) )
))
(declare-datatypes ((ListLongMap!939 0))(
  ( (ListLongMap!940 (toList!485 List!955)) )
))
(declare-fun lm!252 () ListLongMap!939)

(assert (=> b!36324 (= e!22933 (= (toList!485 lm!252) Nil!952))))

(declare-fun res!21987 () Bool)

(assert (=> start!4648 (=> (not res!21987) (not e!22933))))

(declare-fun p!304 () Int)

(declare-fun forall!151 (List!955 Int) Bool)

(assert (=> start!4648 (= res!21987 (forall!151 (toList!485 lm!252) p!304))))

(assert (=> start!4648 e!22933))

(declare-fun e!22932 () Bool)

(declare-fun inv!1576 (ListLongMap!939) Bool)

(assert (=> start!4648 (and (inv!1576 lm!252) e!22932)))

(assert (=> start!4648 tp!5336))

(assert (=> start!4648 true))

(declare-fun b!36323 () Bool)

(declare-fun res!21985 () Bool)

(assert (=> b!36323 (=> (not res!21985) (not e!22933))))

(declare-fun isEmpty!178 (ListLongMap!939) Bool)

(assert (=> b!36323 (= res!21985 (not (isEmpty!178 lm!252)))))

(declare-fun b!36325 () Bool)

(declare-fun tp!5335 () Bool)

(assert (=> b!36325 (= e!22932 tp!5335)))

(declare-fun b!36322 () Bool)

(declare-fun res!21986 () Bool)

(assert (=> b!36322 (=> (not res!21986) (not e!22933))))

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!436 (ListLongMap!939 (_ BitVec 64)) Bool)

(assert (=> b!36322 (= res!21986 (contains!436 lm!252 k!388))))

(assert (= (and start!4648 res!21987) b!36322))

(assert (= (and b!36322 res!21986) b!36323))

(assert (= (and b!36323 res!21985) b!36324))

(assert (= start!4648 b!36325))

(declare-fun m!29281 () Bool)

(assert (=> start!4648 m!29281))

(declare-fun m!29283 () Bool)

(assert (=> start!4648 m!29283))

(declare-fun m!29285 () Bool)

(assert (=> b!36323 m!29285))

(declare-fun m!29287 () Bool)

(assert (=> b!36322 m!29287))

(push 1)

(assert b_and!2129)

(assert (not start!4648))

(assert (not b_next!1295))

(assert (not b!36322))

(assert (not b!36323))

(assert (not b!36325))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2129)

(assert (not b_next!1295))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5454 () Bool)

(declare-fun res!21992 () Bool)

(declare-fun e!22938 () Bool)

(assert (=> d!5454 (=> res!21992 e!22938)))

(assert (=> d!5454 (= res!21992 (is-Nil!952 (toList!485 lm!252)))))

(assert (=> d!5454 (= (forall!151 (toList!485 lm!252) p!304) e!22938)))

(declare-fun b!36330 () Bool)

(declare-fun e!22939 () Bool)

(assert (=> b!36330 (= e!22938 e!22939)))

(declare-fun res!21993 () Bool)

(assert (=> b!36330 (=> (not res!21993) (not e!22939))))

(declare-fun dynLambda!160 (Int tuple2!1362) Bool)

(assert (=> b!36330 (= res!21993 (dynLambda!160 p!304 (h!1519 (toList!485 lm!252))))))

(declare-fun b!36331 () Bool)

(assert (=> b!36331 (= e!22939 (forall!151 (t!3668 (toList!485 lm!252)) p!304))))

(assert (= (and d!5454 (not res!21992)) b!36330))

(assert (= (and b!36330 res!21993) b!36331))

(declare-fun b_lambda!1743 () Bool)

(assert (=> (not b_lambda!1743) (not b!36330)))

(declare-fun t!3670 () Bool)

(declare-fun tb!701 () Bool)

(assert (=> (and start!4648 (= p!304 p!304) t!3670) tb!701))

(declare-fun result!1213 () Bool)

(assert (=> tb!701 (= result!1213 true)))

(assert (=> b!36330 t!3670))

(declare-fun b_and!2131 () Bool)

(assert (= b_and!2129 (and (=> t!3670 result!1213) b_and!2131)))

(declare-fun m!29291 () Bool)

(assert (=> b!36330 m!29291))

(declare-fun m!29293 () Bool)

(assert (=> b!36331 m!29293))

(assert (=> start!4648 d!5454))

(declare-fun d!5461 () Bool)

(declare-fun isStrictlySorted!174 (List!955) Bool)

(assert (=> d!5461 (= (inv!1576 lm!252) (isStrictlySorted!174 (toList!485 lm!252)))))

(declare-fun bs!1380 () Bool)

(assert (= bs!1380 d!5461))

(declare-fun m!29295 () Bool)

(assert (=> bs!1380 m!29295))

(assert (=> start!4648 d!5461))

(declare-fun d!5463 () Bool)

(declare-fun isEmpty!180 (List!955) Bool)

(assert (=> d!5463 (= (isEmpty!178 lm!252) (isEmpty!180 (toList!485 lm!252)))))

(declare-fun bs!1381 () Bool)

(assert (= bs!1381 d!5463))

(declare-fun m!29297 () Bool)

(assert (=> bs!1381 m!29297))

(assert (=> b!36323 d!5463))

(declare-fun d!5465 () Bool)

(declare-fun e!22972 () Bool)

(assert (=> d!5465 e!22972))

(declare-fun res!22014 () Bool)

(assert (=> d!5465 (=> res!22014 e!22972)))

(declare-fun lt!13482 () Bool)

(assert (=> d!5465 (= res!22014 (not lt!13482))))

(declare-fun lt!13481 () Bool)

(assert (=> d!5465 (= lt!13482 lt!13481)))

(declare-datatypes ((Unit!806 0))(
  ( (Unit!807) )
))
(declare-fun lt!13479 () Unit!806)

(declare-fun e!22971 () Unit!806)

(assert (=> d!5465 (= lt!13479 e!22971)))

(declare-fun c!4166 () Bool)

(assert (=> d!5465 (= c!4166 lt!13481)))

(declare-fun containsKey!41 (List!955 (_ BitVec 64)) Bool)

(assert (=> d!5465 (= lt!13481 (containsKey!41 (toList!485 lm!252) k!388))))

(assert (=> d!5465 (= (contains!436 lm!252 k!388) lt!13482)))

(declare-fun b!36373 () Bool)

(declare-fun lt!13480 () Unit!806)

(assert (=> b!36373 (= e!22971 lt!13480)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!38 (List!955 (_ BitVec 64)) Unit!806)

(assert (=> b!36373 (= lt!13480 (lemmaContainsKeyImpliesGetValueByKeyDefined!38 (toList!485 lm!252) k!388))))

(declare-datatypes ((Option!83 0))(
  ( (Some!82 (v!1951 B!702)) (None!81) )
))
(declare-fun isDefined!39 (Option!83) Bool)

(declare-fun getValueByKey!77 (List!955 (_ BitVec 64)) Option!83)

(assert (=> b!36373 (isDefined!39 (getValueByKey!77 (toList!485 lm!252) k!388))))

(declare-fun b!36374 () Bool)

(declare-fun Unit!808 () Unit!806)

(assert (=> b!36374 (= e!22971 Unit!808)))

(declare-fun b!36375 () Bool)

(assert (=> b!36375 (= e!22972 (isDefined!39 (getValueByKey!77 (toList!485 lm!252) k!388)))))

(assert (= (and d!5465 c!4166) b!36373))

(assert (= (and d!5465 (not c!4166)) b!36374))

(assert (= (and d!5465 (not res!22014)) b!36375))

(declare-fun m!29328 () Bool)

(assert (=> d!5465 m!29328))

(declare-fun m!29331 () Bool)

(assert (=> b!36373 m!29331))

(declare-fun m!29333 () Bool)

(assert (=> b!36373 m!29333))

(assert (=> b!36373 m!29333))

(declare-fun m!29335 () Bool)

(assert (=> b!36373 m!29335))

(assert (=> b!36375 m!29333))

(assert (=> b!36375 m!29333))

(assert (=> b!36375 m!29335))

(assert (=> b!36322 d!5465))

(declare-fun b!36385 () Bool)

(declare-fun e!22978 () Bool)

(declare-fun tp_is_empty!1649 () Bool)

(declare-fun tp!5345 () Bool)

(assert (=> b!36385 (= e!22978 (and tp_is_empty!1649 tp!5345))))

(assert (=> b!36325 (= tp!5335 e!22978)))

(assert (= (and b!36325 (is-Cons!951 (toList!485 lm!252))) b!36385))

(declare-fun b_lambda!1753 () Bool)

(assert (= b_lambda!1743 (or (and start!4648 b_free!1295) b_lambda!1753)))

(push 1)

(assert (not b!36373))

(assert b_and!2131)

(assert (not d!5463))

(assert (not b!36331))

(assert (not b!36385))

(assert (not b_next!1295))

(assert (not d!5461))

(assert (not b!36375))

(assert (not b_lambda!1753))

(assert tp_is_empty!1649)

(assert (not d!5465))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2131)

(assert (not b_next!1295))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5493 () Bool)

(declare-fun res!22046 () Bool)

(declare-fun e!23016 () Bool)

(assert (=> d!5493 (=> res!22046 e!23016)))

(assert (=> d!5493 (= res!22046 (and (is-Cons!951 (toList!485 lm!252)) (= (_1!692 (h!1519 (toList!485 lm!252))) k!388)))))

(assert (=> d!5493 (= (containsKey!41 (toList!485 lm!252) k!388) e!23016)))

(declare-fun b!36429 () Bool)

(declare-fun e!23017 () Bool)

(assert (=> b!36429 (= e!23016 e!23017)))

(declare-fun res!22047 () Bool)

(assert (=> b!36429 (=> (not res!22047) (not e!23017))))

(assert (=> b!36429 (= res!22047 (and (or (not (is-Cons!951 (toList!485 lm!252))) (bvsle (_1!692 (h!1519 (toList!485 lm!252))) k!388)) (is-Cons!951 (toList!485 lm!252)) (bvslt (_1!692 (h!1519 (toList!485 lm!252))) k!388)))))

(declare-fun b!36430 () Bool)

(assert (=> b!36430 (= e!23017 (containsKey!41 (t!3668 (toList!485 lm!252)) k!388))))

(assert (= (and d!5493 (not res!22046)) b!36429))

(assert (= (and b!36429 res!22047) b!36430))

(declare-fun m!29355 () Bool)

(assert (=> b!36430 m!29355))

(assert (=> d!5465 d!5493))

(declare-fun d!5501 () Bool)

(declare-fun res!22054 () Bool)

(declare-fun e!23029 () Bool)

(assert (=> d!5501 (=> res!22054 e!23029)))

(assert (=> d!5501 (= res!22054 (or (is-Nil!952 (toList!485 lm!252)) (is-Nil!952 (t!3668 (toList!485 lm!252)))))))

(assert (=> d!5501 (= (isStrictlySorted!174 (toList!485 lm!252)) e!23029)))

(declare-fun b!36446 () Bool)

(declare-fun e!23030 () Bool)

(assert (=> b!36446 (= e!23029 e!23030)))

(declare-fun res!22055 () Bool)

(assert (=> b!36446 (=> (not res!22055) (not e!23030))))

(assert (=> b!36446 (= res!22055 (bvslt (_1!692 (h!1519 (toList!485 lm!252))) (_1!692 (h!1519 (t!3668 (toList!485 lm!252))))))))

(declare-fun b!36447 () Bool)

