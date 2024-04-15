; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4724 () Bool)

(assert start!4724)

(declare-fun b_free!1321 () Bool)

(declare-fun b_next!1321 () Bool)

(assert (=> start!4724 (= b_free!1321 (not b_next!1321))))

(declare-fun tp!5425 () Bool)

(declare-fun b_and!2167 () Bool)

(assert (=> start!4724 (= tp!5425 b_and!2167)))

(declare-fun res!22155 () Bool)

(declare-fun e!23102 () Bool)

(assert (=> start!4724 (=> (not res!22155) (not e!23102))))

(declare-datatypes ((B!728 0))(
  ( (B!729 (val!864 Int)) )
))
(declare-datatypes ((tuple2!1392 0))(
  ( (tuple2!1393 (_1!707 (_ BitVec 64)) (_2!707 B!728)) )
))
(declare-datatypes ((List!961 0))(
  ( (Nil!958) (Cons!957 (h!1525 tuple2!1392) (t!3685 List!961)) )
))
(declare-datatypes ((ListLongMap!957 0))(
  ( (ListLongMap!958 (toList!494 List!961)) )
))
(declare-fun lm!252 () ListLongMap!957)

(declare-fun p!304 () Int)

(declare-fun forall!164 (List!961 Int) Bool)

(assert (=> start!4724 (= res!22155 (forall!164 (toList!494 lm!252) p!304))))

(assert (=> start!4724 e!23102))

(declare-fun e!23103 () Bool)

(declare-fun inv!1614 (ListLongMap!957) Bool)

(assert (=> start!4724 (and (inv!1614 lm!252) e!23103)))

(assert (=> start!4724 tp!5425))

(assert (=> start!4724 true))

(declare-fun b!36581 () Bool)

(declare-fun res!22156 () Bool)

(assert (=> b!36581 (=> (not res!22156) (not e!23102))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!446 (ListLongMap!957 (_ BitVec 64)) Bool)

(assert (=> b!36581 (= res!22156 (contains!446 lm!252 k0!388))))

(declare-fun b!36582 () Bool)

(declare-fun size!1285 (List!961) Int)

(assert (=> b!36582 (= e!23102 (< (size!1285 (toList!494 lm!252)) 0))))

(declare-fun b!36583 () Bool)

(declare-fun tp!5426 () Bool)

(assert (=> b!36583 (= e!23103 tp!5426)))

(assert (= (and start!4724 res!22155) b!36581))

(assert (= (and b!36581 res!22156) b!36582))

(assert (= start!4724 b!36583))

(declare-fun m!29459 () Bool)

(assert (=> start!4724 m!29459))

(declare-fun m!29461 () Bool)

(assert (=> start!4724 m!29461))

(declare-fun m!29463 () Bool)

(assert (=> b!36581 m!29463))

(declare-fun m!29465 () Bool)

(assert (=> b!36582 m!29465))

(check-sat (not b!36581) (not b!36582) b_and!2167 (not b_next!1321) (not b!36583) (not start!4724))
(check-sat b_and!2167 (not b_next!1321))
(get-model)

(declare-fun d!5495 () Bool)

(declare-fun res!22173 () Bool)

(declare-fun e!23120 () Bool)

(assert (=> d!5495 (=> res!22173 e!23120)))

(get-info :version)

(assert (=> d!5495 (= res!22173 ((_ is Nil!958) (toList!494 lm!252)))))

(assert (=> d!5495 (= (forall!164 (toList!494 lm!252) p!304) e!23120)))

(declare-fun b!36606 () Bool)

(declare-fun e!23121 () Bool)

(assert (=> b!36606 (= e!23120 e!23121)))

(declare-fun res!22174 () Bool)

(assert (=> b!36606 (=> (not res!22174) (not e!23121))))

(declare-fun dynLambda!165 (Int tuple2!1392) Bool)

(assert (=> b!36606 (= res!22174 (dynLambda!165 p!304 (h!1525 (toList!494 lm!252))))))

(declare-fun b!36607 () Bool)

(assert (=> b!36607 (= e!23121 (forall!164 (t!3685 (toList!494 lm!252)) p!304))))

(assert (= (and d!5495 (not res!22173)) b!36606))

(assert (= (and b!36606 res!22174) b!36607))

(declare-fun b_lambda!1761 () Bool)

(assert (=> (not b_lambda!1761) (not b!36606)))

(declare-fun t!3689 () Bool)

(declare-fun tb!713 () Bool)

(assert (=> (and start!4724 (= p!304 p!304) t!3689) tb!713))

(declare-fun result!1231 () Bool)

(assert (=> tb!713 (= result!1231 true)))

(assert (=> b!36606 t!3689))

(declare-fun b_and!2173 () Bool)

(assert (= b_and!2167 (and (=> t!3689 result!1231) b_and!2173)))

(declare-fun m!29483 () Bool)

(assert (=> b!36606 m!29483))

(declare-fun m!29485 () Bool)

(assert (=> b!36607 m!29485))

(assert (=> start!4724 d!5495))

(declare-fun d!5497 () Bool)

(declare-fun isStrictlySorted!170 (List!961) Bool)

(assert (=> d!5497 (= (inv!1614 lm!252) (isStrictlySorted!170 (toList!494 lm!252)))))

(declare-fun bs!1401 () Bool)

(assert (= bs!1401 d!5497))

(declare-fun m!29487 () Bool)

(assert (=> bs!1401 m!29487))

(assert (=> start!4724 d!5497))

(declare-fun d!5499 () Bool)

(declare-fun lt!13560 () Int)

(assert (=> d!5499 (>= lt!13560 0)))

(declare-fun e!23132 () Int)

(assert (=> d!5499 (= lt!13560 e!23132)))

(declare-fun c!4180 () Bool)

(assert (=> d!5499 (= c!4180 ((_ is Nil!958) (toList!494 lm!252)))))

(assert (=> d!5499 (= (size!1285 (toList!494 lm!252)) lt!13560)))

(declare-fun b!36624 () Bool)

(assert (=> b!36624 (= e!23132 0)))

(declare-fun b!36625 () Bool)

(assert (=> b!36625 (= e!23132 (+ 1 (size!1285 (t!3685 (toList!494 lm!252)))))))

(assert (= (and d!5499 c!4180) b!36624))

(assert (= (and d!5499 (not c!4180)) b!36625))

(declare-fun m!29489 () Bool)

(assert (=> b!36625 m!29489))

(assert (=> b!36582 d!5499))

(declare-fun d!5501 () Bool)

(declare-fun e!23162 () Bool)

(assert (=> d!5501 e!23162))

(declare-fun res!22195 () Bool)

(assert (=> d!5501 (=> res!22195 e!23162)))

(declare-fun lt!13586 () Bool)

(assert (=> d!5501 (= res!22195 (not lt!13586))))

(declare-fun lt!13585 () Bool)

(assert (=> d!5501 (= lt!13586 lt!13585)))

(declare-datatypes ((Unit!824 0))(
  ( (Unit!825) )
))
(declare-fun lt!13584 () Unit!824)

(declare-fun e!23161 () Unit!824)

(assert (=> d!5501 (= lt!13584 e!23161)))

(declare-fun c!4191 () Bool)

(assert (=> d!5501 (= c!4191 lt!13585)))

(declare-fun containsKey!43 (List!961 (_ BitVec 64)) Bool)

(assert (=> d!5501 (= lt!13585 (containsKey!43 (toList!494 lm!252) k0!388))))

(assert (=> d!5501 (= (contains!446 lm!252 k0!388) lt!13586)))

(declare-fun b!36666 () Bool)

(declare-fun lt!13583 () Unit!824)

(assert (=> b!36666 (= e!23161 lt!13583)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!40 (List!961 (_ BitVec 64)) Unit!824)

(assert (=> b!36666 (= lt!13583 (lemmaContainsKeyImpliesGetValueByKeyDefined!40 (toList!494 lm!252) k0!388))))

(declare-datatypes ((Option!85 0))(
  ( (Some!84 (v!1953 B!728)) (None!83) )
))
(declare-fun isDefined!41 (Option!85) Bool)

(declare-fun getValueByKey!79 (List!961 (_ BitVec 64)) Option!85)

(assert (=> b!36666 (isDefined!41 (getValueByKey!79 (toList!494 lm!252) k0!388))))

(declare-fun b!36668 () Bool)

(declare-fun Unit!826 () Unit!824)

(assert (=> b!36668 (= e!23161 Unit!826)))

(declare-fun b!36669 () Bool)

(assert (=> b!36669 (= e!23162 (isDefined!41 (getValueByKey!79 (toList!494 lm!252) k0!388)))))

(assert (= (and d!5501 c!4191) b!36666))

(assert (= (and d!5501 (not c!4191)) b!36668))

(assert (= (and d!5501 (not res!22195)) b!36669))

(declare-fun m!29523 () Bool)

(assert (=> d!5501 m!29523))

(declare-fun m!29525 () Bool)

(assert (=> b!36666 m!29525))

(declare-fun m!29527 () Bool)

(assert (=> b!36666 m!29527))

(assert (=> b!36666 m!29527))

(declare-fun m!29529 () Bool)

(assert (=> b!36666 m!29529))

(assert (=> b!36669 m!29527))

(assert (=> b!36669 m!29527))

(assert (=> b!36669 m!29529))

(assert (=> b!36581 d!5501))

(declare-fun b!36679 () Bool)

(declare-fun e!23169 () Bool)

(declare-fun tp_is_empty!1655 () Bool)

(declare-fun tp!5447 () Bool)

(assert (=> b!36679 (= e!23169 (and tp_is_empty!1655 tp!5447))))

(assert (=> b!36583 (= tp!5426 e!23169)))

(assert (= (and b!36583 ((_ is Cons!957) (toList!494 lm!252))) b!36679))

(declare-fun b_lambda!1771 () Bool)

(assert (= b_lambda!1761 (or (and start!4724 b_free!1321) b_lambda!1771)))

(check-sat (not d!5501) (not b!36669) (not b!36666) (not b_next!1321) (not b_lambda!1771) b_and!2173 (not b!36679) (not b!36625) (not b!36607) (not d!5497) tp_is_empty!1655)
(check-sat b_and!2173 (not b_next!1321))
