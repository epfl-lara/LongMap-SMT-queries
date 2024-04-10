; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4644 () Bool)

(assert start!4644)

(declare-fun b_free!1291 () Bool)

(declare-fun b_next!1291 () Bool)

(assert (=> start!4644 (= b_free!1291 (not b_next!1291))))

(declare-fun tp!5323 () Bool)

(declare-fun b_and!2125 () Bool)

(assert (=> start!4644 (= tp!5323 b_and!2125)))

(declare-fun b!36299 () Bool)

(declare-fun res!21968 () Bool)

(declare-fun e!22920 () Bool)

(assert (=> b!36299 (=> (not res!21968) (not e!22920))))

(declare-datatypes ((B!698 0))(
  ( (B!699 (val!849 Int)) )
))
(declare-datatypes ((tuple2!1358 0))(
  ( (tuple2!1359 (_1!690 (_ BitVec 64)) (_2!690 B!698)) )
))
(declare-datatypes ((List!953 0))(
  ( (Nil!950) (Cons!949 (h!1517 tuple2!1358) (t!3666 List!953)) )
))
(declare-datatypes ((ListLongMap!935 0))(
  ( (ListLongMap!936 (toList!483 List!953)) )
))
(declare-fun lm!252 () ListLongMap!935)

(declare-fun isEmpty!176 (ListLongMap!935) Bool)

(assert (=> b!36299 (= res!21968 (not (isEmpty!176 lm!252)))))

(declare-fun b!36301 () Bool)

(declare-fun e!22921 () Bool)

(declare-fun tp!5324 () Bool)

(assert (=> b!36301 (= e!22921 tp!5324)))

(declare-fun res!21967 () Bool)

(assert (=> start!4644 (=> (not res!21967) (not e!22920))))

(declare-fun p!304 () Int)

(declare-fun forall!149 (List!953 Int) Bool)

(assert (=> start!4644 (= res!21967 (forall!149 (toList!483 lm!252) p!304))))

(assert (=> start!4644 e!22920))

(declare-fun inv!1574 (ListLongMap!935) Bool)

(assert (=> start!4644 (and (inv!1574 lm!252) e!22921)))

(assert (=> start!4644 tp!5323))

(assert (=> start!4644 true))

(declare-fun b!36298 () Bool)

(declare-fun res!21969 () Bool)

(assert (=> b!36298 (=> (not res!21969) (not e!22920))))

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!434 (ListLongMap!935 (_ BitVec 64)) Bool)

(assert (=> b!36298 (= res!21969 (contains!434 lm!252 k!388))))

(declare-fun b!36300 () Bool)

(assert (=> b!36300 (= e!22920 (= (toList!483 lm!252) Nil!950))))

(assert (= (and start!4644 res!21967) b!36298))

(assert (= (and b!36298 res!21969) b!36299))

(assert (= (and b!36299 res!21968) b!36300))

(assert (= start!4644 b!36301))

(declare-fun m!29265 () Bool)

(assert (=> b!36299 m!29265))

(declare-fun m!29267 () Bool)

(assert (=> start!4644 m!29267))

(declare-fun m!29269 () Bool)

(assert (=> start!4644 m!29269))

(declare-fun m!29271 () Bool)

(assert (=> b!36298 m!29271))

(push 1)

(assert (not b_next!1291))

(assert b_and!2125)

(assert (not b!36299))

(assert (not b!36298))

(assert (not start!4644))

(assert (not b!36301))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2125)

(assert (not b_next!1291))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5455 () Bool)

(declare-fun e!22954 () Bool)

(assert (=> d!5455 e!22954))

(declare-fun res!22003 () Bool)

(assert (=> d!5455 (=> res!22003 e!22954)))

(declare-fun lt!13469 () Bool)

(assert (=> d!5455 (= res!22003 (not lt!13469))))

(declare-fun lt!13468 () Bool)

(assert (=> d!5455 (= lt!13469 lt!13468)))

(declare-datatypes ((Unit!803 0))(
  ( (Unit!804) )
))
(declare-fun lt!13467 () Unit!803)

(declare-fun e!22955 () Unit!803)

(assert (=> d!5455 (= lt!13467 e!22955)))

(declare-fun c!4163 () Bool)

(assert (=> d!5455 (= c!4163 lt!13468)))

(declare-fun containsKey!40 (List!953 (_ BitVec 64)) Bool)

(assert (=> d!5455 (= lt!13468 (containsKey!40 (toList!483 lm!252) k!388))))

(assert (=> d!5455 (= (contains!434 lm!252 k!388) lt!13469)))

(declare-fun b!36351 () Bool)

(declare-fun lt!13470 () Unit!803)

(assert (=> b!36351 (= e!22955 lt!13470)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!37 (List!953 (_ BitVec 64)) Unit!803)

(assert (=> b!36351 (= lt!13470 (lemmaContainsKeyImpliesGetValueByKeyDefined!37 (toList!483 lm!252) k!388))))

(declare-datatypes ((Option!82 0))(
  ( (Some!81 (v!1950 B!698)) (None!80) )
))
(declare-fun isDefined!38 (Option!82) Bool)

(declare-fun getValueByKey!76 (List!953 (_ BitVec 64)) Option!82)

(assert (=> b!36351 (isDefined!38 (getValueByKey!76 (toList!483 lm!252) k!388))))

(declare-fun b!36352 () Bool)

(declare-fun Unit!805 () Unit!803)

(assert (=> b!36352 (= e!22955 Unit!805)))

(declare-fun b!36353 () Bool)

(assert (=> b!36353 (= e!22954 (isDefined!38 (getValueByKey!76 (toList!483 lm!252) k!388)))))

(assert (= (and d!5455 c!4163) b!36351))

(assert (= (and d!5455 (not c!4163)) b!36352))

(assert (= (and d!5455 (not res!22003)) b!36353))

(declare-fun m!29307 () Bool)

(assert (=> d!5455 m!29307))

(declare-fun m!29309 () Bool)

(assert (=> b!36351 m!29309))

(declare-fun m!29311 () Bool)

(assert (=> b!36351 m!29311))

(assert (=> b!36351 m!29311))

(declare-fun m!29317 () Bool)

(assert (=> b!36351 m!29317))

(assert (=> b!36353 m!29311))

(assert (=> b!36353 m!29311))

(assert (=> b!36353 m!29317))

(assert (=> b!36298 d!5455))

(declare-fun d!5471 () Bool)

(declare-fun res!22010 () Bool)

(declare-fun e!22967 () Bool)

(assert (=> d!5471 (=> res!22010 e!22967)))

(assert (=> d!5471 (= res!22010 (is-Nil!950 (toList!483 lm!252)))))

(assert (=> d!5471 (= (forall!149 (toList!483 lm!252) p!304) e!22967)))

(declare-fun b!36369 () Bool)

(declare-fun e!22968 () Bool)

(assert (=> b!36369 (= e!22967 e!22968)))

(declare-fun res!22011 () Bool)

(assert (=> b!36369 (=> (not res!22011) (not e!22968))))

(declare-fun dynLambda!162 (Int tuple2!1358) Bool)

(assert (=> b!36369 (= res!22011 (dynLambda!162 p!304 (h!1517 (toList!483 lm!252))))))

(declare-fun b!36370 () Bool)

(assert (=> b!36370 (= e!22968 (forall!149 (t!3666 (toList!483 lm!252)) p!304))))

(assert (= (and d!5471 (not res!22010)) b!36369))

(assert (= (and b!36369 res!22011) b!36370))

(declare-fun b_lambda!1749 () Bool)

(assert (=> (not b_lambda!1749) (not b!36369)))

(declare-fun t!3674 () Bool)

(declare-fun tb!705 () Bool)

(assert (=> (and start!4644 (= p!304 p!304) t!3674) tb!705))

(declare-fun result!1219 () Bool)

(assert (=> tb!705 (= result!1219 true)))

(assert (=> b!36369 t!3674))

(declare-fun b_and!2135 () Bool)

(assert (= b_and!2125 (and (=> t!3674 result!1219) b_and!2135)))

(declare-fun m!29321 () Bool)

(assert (=> b!36369 m!29321))

(declare-fun m!29323 () Bool)

(assert (=> b!36370 m!29323))

(assert (=> start!4644 d!5471))

(declare-fun d!5473 () Bool)

(declare-fun isStrictlySorted!175 (List!953) Bool)

(assert (=> d!5473 (= (inv!1574 lm!252) (isStrictlySorted!175 (toList!483 lm!252)))))

(declare-fun bs!1383 () Bool)

(assert (= bs!1383 d!5473))

(declare-fun m!29325 () Bool)

(assert (=> bs!1383 m!29325))

(assert (=> start!4644 d!5473))

(declare-fun d!5475 () Bool)

(declare-fun isEmpty!181 (List!953) Bool)

(assert (=> d!5475 (= (isEmpty!176 lm!252) (isEmpty!181 (toList!483 lm!252)))))

(declare-fun bs!1384 () Bool)

(assert (= bs!1384 d!5475))

(declare-fun m!29329 () Bool)

(assert (=> bs!1384 m!29329))

(assert (=> b!36299 d!5475))

(declare-fun b!36384 () Bool)

(declare-fun e!22977 () Bool)

(declare-fun tp_is_empty!1647 () Bool)

(declare-fun tp!5344 () Bool)

(assert (=> b!36384 (= e!22977 (and tp_is_empty!1647 tp!5344))))

(assert (=> b!36301 (= tp!5324 e!22977)))

(assert (= (and b!36301 (is-Cons!949 (toList!483 lm!252))) b!36384))

(declare-fun b_lambda!1751 () Bool)

(assert (= b_lambda!1749 (or (and start!4644 b_free!1291) b_lambda!1751)))

(push 1)

(assert b_and!2135)

(assert (not b!36370))

(assert (not b!36351))

(assert (not b_next!1291))

(assert (not b!36353))

(assert (not d!5475))

(assert (not b_lambda!1751))

(assert (not b!36384))

(assert tp_is_empty!1647)

(assert (not d!5455))

(assert (not d!5473))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2135)

(assert (not b_next!1291))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5483 () Bool)

(declare-fun res!22030 () Bool)

(declare-fun e!22994 () Bool)

(assert (=> d!5483 (=> res!22030 e!22994)))

(assert (=> d!5483 (= res!22030 (and (is-Cons!949 (toList!483 lm!252)) (= (_1!690 (h!1517 (toList!483 lm!252))) k!388)))))

(assert (=> d!5483 (= (containsKey!40 (toList!483 lm!252) k!388) e!22994)))

(declare-fun b!36401 () Bool)

(declare-fun e!22995 () Bool)

(assert (=> b!36401 (= e!22994 e!22995)))

(declare-fun res!22031 () Bool)

(assert (=> b!36401 (=> (not res!22031) (not e!22995))))

(assert (=> b!36401 (= res!22031 (and (or (not (is-Cons!949 (toList!483 lm!252))) (bvsle (_1!690 (h!1517 (toList!483 lm!252))) k!388)) (is-Cons!949 (toList!483 lm!252)) (bvslt (_1!690 (h!1517 (toList!483 lm!252))) k!388)))))

(declare-fun b!36402 () Bool)

(assert (=> b!36402 (= e!22995 (containsKey!40 (t!3666 (toList!483 lm!252)) k!388))))

(assert (= (and d!5483 (not res!22030)) b!36401))

(assert (= (and b!36401 res!22031) b!36402))

(declare-fun m!29347 () Bool)

(assert (=> b!36402 m!29347))

(assert (=> d!5455 d!5483))

(declare-fun d!5489 () Bool)

(assert (=> d!5489 (= (isEmpty!181 (toList!483 lm!252)) (is-Nil!950 (toList!483 lm!252)))))

(assert (=> d!5475 d!5489))

(declare-fun d!5491 () Bool)

(declare-fun res!22038 () Bool)

(declare-fun e!23008 () Bool)

(assert (=> d!5491 (=> res!22038 e!23008)))

(assert (=> d!5491 (= res!22038 (or (is-Nil!950 (toList!483 lm!252)) (is-Nil!950 (t!3666 (toList!483 lm!252)))))))

(assert (=> d!5491 (= (isStrictlySorted!175 (toList!483 lm!252)) e!23008)))

(declare-fun b!36419 () Bool)

(declare-fun e!23009 () Bool)

(assert (=> b!36419 (= e!23008 e!23009)))

(declare-fun res!22039 () Bool)

(assert (=> b!36419 (=> (not res!22039) (not e!23009))))

(assert (=> b!36419 (= res!22039 (bvslt (_1!690 (h!1517 (toList!483 lm!252))) (_1!690 (h!1517 (t!3666 (toList!483 lm!252))))))))

(declare-fun b!36420 () Bool)

(assert (=> b!36420 (= e!23009 (isStrictlySorted!175 (t!3666 (toList!483 lm!252))))))

(assert (= (and d!5491 (not res!22038)) b!36419))

(assert (= (and b!36419 res!22039) b!36420))

(declare-fun m!29351 () Bool)

(assert (=> b!36420 m!29351))

(assert (=> d!5473 d!5491))

(declare-fun d!5497 () Bool)

(declare-fun isEmpty!183 (Option!82) Bool)

(assert (=> d!5497 (= (isDefined!38 (getValueByKey!76 (toList!483 lm!252) k!388)) (not (isEmpty!183 (getValueByKey!76 (toList!483 lm!252) k!388))))))

(declare-fun bs!1386 () Bool)

(assert (= bs!1386 d!5497))

(assert (=> bs!1386 m!29311))

(declare-fun m!29353 () Bool)

(assert (=> bs!1386 m!29353))

(assert (=> b!36353 d!5497))

(declare-fun b!36450 () Bool)

(declare-fun e!23032 () Option!82)

(assert (=> b!36450 (= e!23032 (getValueByKey!76 (t!3666 (toList!483 lm!252)) k!388))))

(declare-fun b!36451 () Bool)

(assert (=> b!36451 (= e!23032 None!80)))

(declare-fun b!36448 () Bool)

(declare-fun e!23031 () Option!82)

(assert (=> b!36448 (= e!23031 (Some!81 (_2!690 (h!1517 (toList!483 lm!252)))))))

(declare-fun d!5499 () Bool)

(declare-fun c!4177 () Bool)

(assert (=> d!5499 (= c!4177 (and (is-Cons!949 (toList!483 lm!252)) (= (_1!690 (h!1517 (toList!483 lm!252))) k!388)))))

(assert (=> d!5499 (= (getValueByKey!76 (toList!483 lm!252) k!388) e!23031)))

(declare-fun b!36449 () Bool)

(assert (=> b!36449 (= e!23031 e!23032)))

(declare-fun c!4178 () Bool)

(assert (=> b!36449 (= c!4178 (and (is-Cons!949 (toList!483 lm!252)) (not (= (_1!690 (h!1517 (toList!483 lm!252))) k!388))))))

(assert (= (and d!5499 c!4177) b!36448))

(assert (= (and d!5499 (not c!4177)) b!36449))

(assert (= (and b!36449 c!4178) b!36450))

(assert (= (and b!36449 (not c!4178)) b!36451))

(declare-fun m!29361 () Bool)

(assert (=> b!36450 m!29361))

(assert (=> b!36353 d!5499))

(declare-fun d!5507 () Bool)

(assert (=> d!5507 (isDefined!38 (getValueByKey!76 (toList!483 lm!252) k!388))))

(declare-fun lt!13488 () Unit!803)

(declare-fun choose!225 (List!953 (_ BitVec 64)) Unit!803)

(assert (=> d!5507 (= lt!13488 (choose!225 (toList!483 lm!252) k!388))))

(declare-fun e!23041 () Bool)

(assert (=> d!5507 e!23041))

(declare-fun res!22060 () Bool)

(assert (=> d!5507 (=> (not res!22060) (not e!23041))))

(assert (=> d!5507 (= res!22060 (isStrictlySorted!175 (toList!483 lm!252)))))

(assert (=> d!5507 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!37 (toList!483 lm!252) k!388) lt!13488)))

