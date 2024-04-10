; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4736 () Bool)

(assert start!4736)

(declare-fun b_free!1323 () Bool)

(declare-fun b_next!1323 () Bool)

(assert (=> start!4736 (= b_free!1323 (not b_next!1323))))

(declare-fun tp!5432 () Bool)

(declare-fun b_and!2175 () Bool)

(assert (=> start!4736 (= tp!5432 b_and!2175)))

(declare-fun res!22194 () Bool)

(declare-fun e!23152 () Bool)

(assert (=> start!4736 (=> (not res!22194) (not e!23152))))

(declare-datatypes ((B!730 0))(
  ( (B!731 (val!865 Int)) )
))
(declare-datatypes ((tuple2!1390 0))(
  ( (tuple2!1391 (_1!706 (_ BitVec 64)) (_2!706 B!730)) )
))
(declare-datatypes ((List!969 0))(
  ( (Nil!966) (Cons!965 (h!1533 tuple2!1390) (t!3700 List!969)) )
))
(declare-datatypes ((ListLongMap!967 0))(
  ( (ListLongMap!968 (toList!499 List!969)) )
))
(declare-fun lm!252 () ListLongMap!967)

(declare-fun p!304 () Int)

(declare-fun forall!165 (List!969 Int) Bool)

(assert (=> start!4736 (= res!22194 (forall!165 (toList!499 lm!252) p!304))))

(assert (=> start!4736 e!23152))

(declare-fun e!23151 () Bool)

(declare-fun inv!1615 (ListLongMap!967) Bool)

(assert (=> start!4736 (and (inv!1615 lm!252) e!23151)))

(assert (=> start!4736 tp!5432))

(assert (=> start!4736 true))

(declare-fun b!36644 () Bool)

(declare-fun res!22193 () Bool)

(assert (=> b!36644 (=> (not res!22193) (not e!23152))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!450 (ListLongMap!967 (_ BitVec 64)) Bool)

(assert (=> b!36644 (= res!22193 (contains!450 lm!252 k0!388))))

(declare-fun b!36645 () Bool)

(declare-fun size!1299 (List!969) Int)

(assert (=> b!36645 (= e!23152 (< (size!1299 (toList!499 lm!252)) 0))))

(declare-fun b!36646 () Bool)

(declare-fun tp!5431 () Bool)

(assert (=> b!36646 (= e!23151 tp!5431)))

(assert (= (and start!4736 res!22194) b!36644))

(assert (= (and b!36644 res!22193) b!36645))

(assert (= start!4736 b!36646))

(declare-fun m!29537 () Bool)

(assert (=> start!4736 m!29537))

(declare-fun m!29539 () Bool)

(assert (=> start!4736 m!29539))

(declare-fun m!29541 () Bool)

(assert (=> b!36644 m!29541))

(declare-fun m!29543 () Bool)

(assert (=> b!36645 m!29543))

(check-sat (not b!36646) (not start!4736) (not b_next!1323) (not b!36644) b_and!2175 (not b!36645))
(check-sat b_and!2175 (not b_next!1323))
(get-model)

(declare-fun d!5531 () Bool)

(declare-fun lt!13548 () Int)

(assert (=> d!5531 (>= lt!13548 0)))

(declare-fun e!23165 () Int)

(assert (=> d!5531 (= lt!13548 e!23165)))

(declare-fun c!4187 () Bool)

(get-info :version)

(assert (=> d!5531 (= c!4187 ((_ is Nil!966) (toList!499 lm!252)))))

(assert (=> d!5531 (= (size!1299 (toList!499 lm!252)) lt!13548)))

(declare-fun b!36664 () Bool)

(assert (=> b!36664 (= e!23165 0)))

(declare-fun b!36665 () Bool)

(assert (=> b!36665 (= e!23165 (+ 1 (size!1299 (t!3700 (toList!499 lm!252)))))))

(assert (= (and d!5531 c!4187) b!36664))

(assert (= (and d!5531 (not c!4187)) b!36665))

(declare-fun m!29553 () Bool)

(assert (=> b!36665 m!29553))

(assert (=> b!36645 d!5531))

(declare-fun d!5535 () Bool)

(declare-fun e!23187 () Bool)

(assert (=> d!5535 e!23187))

(declare-fun res!22218 () Bool)

(assert (=> d!5535 (=> res!22218 e!23187)))

(declare-fun lt!13572 () Bool)

(assert (=> d!5535 (= res!22218 (not lt!13572))))

(declare-fun lt!13574 () Bool)

(assert (=> d!5535 (= lt!13572 lt!13574)))

(declare-datatypes ((Unit!817 0))(
  ( (Unit!818) )
))
(declare-fun lt!13573 () Unit!817)

(declare-fun e!23188 () Unit!817)

(assert (=> d!5535 (= lt!13573 e!23188)))

(declare-fun c!4196 () Bool)

(assert (=> d!5535 (= c!4196 lt!13574)))

(declare-fun containsKey!43 (List!969 (_ BitVec 64)) Bool)

(assert (=> d!5535 (= lt!13574 (containsKey!43 (toList!499 lm!252) k0!388))))

(assert (=> d!5535 (= (contains!450 lm!252 k0!388) lt!13572)))

(declare-fun b!36695 () Bool)

(declare-fun lt!13575 () Unit!817)

(assert (=> b!36695 (= e!23188 lt!13575)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!40 (List!969 (_ BitVec 64)) Unit!817)

(assert (=> b!36695 (= lt!13575 (lemmaContainsKeyImpliesGetValueByKeyDefined!40 (toList!499 lm!252) k0!388))))

(declare-datatypes ((Option!85 0))(
  ( (Some!84 (v!1953 B!730)) (None!83) )
))
(declare-fun isDefined!41 (Option!85) Bool)

(declare-fun getValueByKey!79 (List!969 (_ BitVec 64)) Option!85)

(assert (=> b!36695 (isDefined!41 (getValueByKey!79 (toList!499 lm!252) k0!388))))

(declare-fun b!36696 () Bool)

(declare-fun Unit!820 () Unit!817)

(assert (=> b!36696 (= e!23188 Unit!820)))

(declare-fun b!36697 () Bool)

(assert (=> b!36697 (= e!23187 (isDefined!41 (getValueByKey!79 (toList!499 lm!252) k0!388)))))

(assert (= (and d!5535 c!4196) b!36695))

(assert (= (and d!5535 (not c!4196)) b!36696))

(assert (= (and d!5535 (not res!22218)) b!36697))

(declare-fun m!29575 () Bool)

(assert (=> d!5535 m!29575))

(declare-fun m!29577 () Bool)

(assert (=> b!36695 m!29577))

(declare-fun m!29579 () Bool)

(assert (=> b!36695 m!29579))

(assert (=> b!36695 m!29579))

(declare-fun m!29581 () Bool)

(assert (=> b!36695 m!29581))

(assert (=> b!36697 m!29579))

(assert (=> b!36697 m!29579))

(assert (=> b!36697 m!29581))

(assert (=> b!36644 d!5535))

(declare-fun d!5547 () Bool)

(declare-fun res!22223 () Bool)

(declare-fun e!23197 () Bool)

(assert (=> d!5547 (=> res!22223 e!23197)))

(assert (=> d!5547 (= res!22223 ((_ is Nil!966) (toList!499 lm!252)))))

(assert (=> d!5547 (= (forall!165 (toList!499 lm!252) p!304) e!23197)))

(declare-fun b!36710 () Bool)

(declare-fun e!23198 () Bool)

(assert (=> b!36710 (= e!23197 e!23198)))

(declare-fun res!22224 () Bool)

(assert (=> b!36710 (=> (not res!22224) (not e!23198))))

(declare-fun dynLambda!167 (Int tuple2!1390) Bool)

(assert (=> b!36710 (= res!22224 (dynLambda!167 p!304 (h!1533 (toList!499 lm!252))))))

(declare-fun b!36711 () Bool)

(assert (=> b!36711 (= e!23198 (forall!165 (t!3700 (toList!499 lm!252)) p!304))))

(assert (= (and d!5547 (not res!22223)) b!36710))

(assert (= (and b!36710 res!22224) b!36711))

(declare-fun b_lambda!1777 () Bool)

(assert (=> (not b_lambda!1777) (not b!36710)))

(declare-fun t!3707 () Bool)

(declare-fun tb!723 () Bool)

(assert (=> (and start!4736 (= p!304 p!304) t!3707) tb!723))

(declare-fun result!1241 () Bool)

(assert (=> tb!723 (= result!1241 true)))

(assert (=> b!36710 t!3707))

(declare-fun b_and!2183 () Bool)

(assert (= b_and!2175 (and (=> t!3707 result!1241) b_and!2183)))

(declare-fun m!29587 () Bool)

(assert (=> b!36710 m!29587))

(declare-fun m!29589 () Bool)

(assert (=> b!36711 m!29589))

(assert (=> start!4736 d!5547))

(declare-fun d!5551 () Bool)

(declare-fun isStrictlySorted!177 (List!969) Bool)

(assert (=> d!5551 (= (inv!1615 lm!252) (isStrictlySorted!177 (toList!499 lm!252)))))

(declare-fun bs!1405 () Bool)

(assert (= bs!1405 d!5551))

(declare-fun m!29591 () Bool)

(assert (=> bs!1405 m!29591))

(assert (=> start!4736 d!5551))

(declare-fun b!36728 () Bool)

(declare-fun e!23209 () Bool)

(declare-fun tp_is_empty!1653 () Bool)

(declare-fun tp!5444 () Bool)

(assert (=> b!36728 (= e!23209 (and tp_is_empty!1653 tp!5444))))

(assert (=> b!36646 (= tp!5431 e!23209)))

(assert (= (and b!36646 ((_ is Cons!965) (toList!499 lm!252))) b!36728))

(declare-fun b_lambda!1781 () Bool)

(assert (= b_lambda!1777 (or (and start!4736 b_free!1323) b_lambda!1781)))

(check-sat (not d!5551) tp_is_empty!1653 (not b!36728) (not b!36711) (not d!5535) (not b!36665) b_and!2183 (not b!36695) (not b!36697) (not b_next!1323) (not b_lambda!1781))
(check-sat b_and!2183 (not b_next!1323))
