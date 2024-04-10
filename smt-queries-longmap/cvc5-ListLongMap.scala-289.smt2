; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4734 () Bool)

(assert start!4734)

(declare-fun b_free!1321 () Bool)

(declare-fun b_next!1321 () Bool)

(assert (=> start!4734 (= b_free!1321 (not b_next!1321))))

(declare-fun tp!5425 () Bool)

(declare-fun b_and!2173 () Bool)

(assert (=> start!4734 (= tp!5425 b_and!2173)))

(declare-fun res!22187 () Bool)

(declare-fun e!23145 () Bool)

(assert (=> start!4734 (=> (not res!22187) (not e!23145))))

(declare-datatypes ((B!728 0))(
  ( (B!729 (val!864 Int)) )
))
(declare-datatypes ((tuple2!1388 0))(
  ( (tuple2!1389 (_1!705 (_ BitVec 64)) (_2!705 B!728)) )
))
(declare-datatypes ((List!968 0))(
  ( (Nil!965) (Cons!964 (h!1532 tuple2!1388) (t!3699 List!968)) )
))
(declare-datatypes ((ListLongMap!965 0))(
  ( (ListLongMap!966 (toList!498 List!968)) )
))
(declare-fun lm!252 () ListLongMap!965)

(declare-fun p!304 () Int)

(declare-fun forall!164 (List!968 Int) Bool)

(assert (=> start!4734 (= res!22187 (forall!164 (toList!498 lm!252) p!304))))

(assert (=> start!4734 e!23145))

(declare-fun e!23146 () Bool)

(declare-fun inv!1614 (ListLongMap!965) Bool)

(assert (=> start!4734 (and (inv!1614 lm!252) e!23146)))

(assert (=> start!4734 tp!5425))

(assert (=> start!4734 true))

(declare-fun b!36635 () Bool)

(declare-fun res!22188 () Bool)

(assert (=> b!36635 (=> (not res!22188) (not e!23145))))

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!449 (ListLongMap!965 (_ BitVec 64)) Bool)

(assert (=> b!36635 (= res!22188 (contains!449 lm!252 k!388))))

(declare-fun b!36636 () Bool)

(declare-fun size!1298 (List!968) Int)

(assert (=> b!36636 (= e!23145 (< (size!1298 (toList!498 lm!252)) 0))))

(declare-fun b!36637 () Bool)

(declare-fun tp!5426 () Bool)

(assert (=> b!36637 (= e!23146 tp!5426)))

(assert (= (and start!4734 res!22187) b!36635))

(assert (= (and b!36635 res!22188) b!36636))

(assert (= start!4734 b!36637))

(declare-fun m!29529 () Bool)

(assert (=> start!4734 m!29529))

(declare-fun m!29531 () Bool)

(assert (=> start!4734 m!29531))

(declare-fun m!29533 () Bool)

(assert (=> b!36635 m!29533))

(declare-fun m!29535 () Bool)

(assert (=> b!36636 m!29535))

(push 1)

(assert (not b!36637))

(assert (not start!4734))

(assert (not b_next!1321))

(assert b_and!2173)

(assert (not b!36636))

(assert (not b!36635))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2173)

(assert (not b_next!1321))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5533 () Bool)

(declare-fun res!22205 () Bool)

(declare-fun e!23166 () Bool)

(assert (=> d!5533 (=> res!22205 e!23166)))

(assert (=> d!5533 (= res!22205 (is-Nil!965 (toList!498 lm!252)))))

(assert (=> d!5533 (= (forall!164 (toList!498 lm!252) p!304) e!23166)))

(declare-fun b!36666 () Bool)

(declare-fun e!23167 () Bool)

(assert (=> b!36666 (= e!23166 e!23167)))

(declare-fun res!22206 () Bool)

(assert (=> b!36666 (=> (not res!22206) (not e!23167))))

(declare-fun dynLambda!166 (Int tuple2!1388) Bool)

(assert (=> b!36666 (= res!22206 (dynLambda!166 p!304 (h!1532 (toList!498 lm!252))))))

(declare-fun b!36667 () Bool)

(assert (=> b!36667 (= e!23167 (forall!164 (t!3699 (toList!498 lm!252)) p!304))))

(assert (= (and d!5533 (not res!22205)) b!36666))

(assert (= (and b!36666 res!22206) b!36667))

(declare-fun b_lambda!1773 () Bool)

(assert (=> (not b_lambda!1773) (not b!36666)))

(declare-fun t!3703 () Bool)

(declare-fun tb!719 () Bool)

(assert (=> (and start!4734 (= p!304 p!304) t!3703) tb!719))

(declare-fun result!1237 () Bool)

(assert (=> tb!719 (= result!1237 true)))

(assert (=> b!36666 t!3703))

(declare-fun b_and!2179 () Bool)

(assert (= b_and!2173 (and (=> t!3703 result!1237) b_and!2179)))

(declare-fun m!29555 () Bool)

(assert (=> b!36666 m!29555))

(declare-fun m!29557 () Bool)

(assert (=> b!36667 m!29557))

(assert (=> start!4734 d!5533))

(declare-fun d!5537 () Bool)

(declare-fun isStrictlySorted!176 (List!968) Bool)

(assert (=> d!5537 (= (inv!1614 lm!252) (isStrictlySorted!176 (toList!498 lm!252)))))

(declare-fun bs!1403 () Bool)

(assert (= bs!1403 d!5537))

(declare-fun m!29559 () Bool)

(assert (=> bs!1403 m!29559))

(assert (=> start!4734 d!5537))

(declare-fun d!5539 () Bool)

(declare-fun lt!13563 () Int)

(assert (=> d!5539 (>= lt!13563 0)))

(declare-fun e!23176 () Int)

(assert (=> d!5539 (= lt!13563 e!23176)))

(declare-fun c!4193 () Bool)

(assert (=> d!5539 (= c!4193 (is-Nil!965 (toList!498 lm!252)))))

(assert (=> d!5539 (= (size!1298 (toList!498 lm!252)) lt!13563)))

(declare-fun b!36681 () Bool)

(assert (=> b!36681 (= e!23176 0)))

(declare-fun b!36682 () Bool)

(assert (=> b!36682 (= e!23176 (+ 1 (size!1298 (t!3699 (toList!498 lm!252)))))))

(assert (= (and d!5539 c!4193) b!36681))

(assert (= (and d!5539 (not c!4193)) b!36682))

(declare-fun m!29569 () Bool)

(assert (=> b!36682 m!29569))

(assert (=> b!36636 d!5539))

(declare-fun d!5543 () Bool)

(declare-fun e!23208 () Bool)

(assert (=> d!5543 e!23208))

(declare-fun res!22227 () Bool)

(assert (=> d!5543 (=> res!22227 e!23208)))

(declare-fun lt!13588 () Bool)

(assert (=> d!5543 (= res!22227 (not lt!13588))))

(declare-fun lt!13589 () Bool)

(assert (=> d!5543 (= lt!13588 lt!13589)))

(declare-datatypes ((Unit!821 0))(
  ( (Unit!822) )
))
(declare-fun lt!13590 () Unit!821)

(declare-fun e!23207 () Unit!821)

(assert (=> d!5543 (= lt!13590 e!23207)))

(declare-fun c!4202 () Bool)

(assert (=> d!5543 (= c!4202 lt!13589)))

(declare-fun containsKey!44 (List!968 (_ BitVec 64)) Bool)

(assert (=> d!5543 (= lt!13589 (containsKey!44 (toList!498 lm!252) k!388))))

(assert (=> d!5543 (= (contains!449 lm!252 k!388) lt!13588)))

(declare-fun b!36725 () Bool)

(declare-fun lt!13587 () Unit!821)

(assert (=> b!36725 (= e!23207 lt!13587)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!41 (List!968 (_ BitVec 64)) Unit!821)

(assert (=> b!36725 (= lt!13587 (lemmaContainsKeyImpliesGetValueByKeyDefined!41 (toList!498 lm!252) k!388))))

(declare-datatypes ((Option!86 0))(
  ( (Some!85 (v!1954 B!728)) (None!84) )
))
(declare-fun isDefined!42 (Option!86) Bool)

(declare-fun getValueByKey!80 (List!968 (_ BitVec 64)) Option!86)

(assert (=> b!36725 (isDefined!42 (getValueByKey!80 (toList!498 lm!252) k!388))))

(declare-fun b!36726 () Bool)

(declare-fun Unit!823 () Unit!821)

(assert (=> b!36726 (= e!23207 Unit!823)))

