; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!164 () Bool)

(assert start!164)

(declare-fun b_free!29 () Bool)

(declare-fun b_next!29 () Bool)

(assert (=> start!164 (= b_free!29 (not b_next!29))))

(declare-fun tp!91 () Bool)

(declare-fun b_and!53 () Bool)

(assert (=> start!164 (= tp!91 b_and!53)))

(declare-fun res!4400 () Bool)

(declare-fun e!350 () Bool)

(assert (=> start!164 (=> (not res!4400) (not e!350))))

(declare-datatypes ((B!264 0))(
  ( (B!265 (val!14 Int)) )
))
(declare-datatypes ((tuple2!28 0))(
  ( (tuple2!29 (_1!14 (_ BitVec 64)) (_2!14 B!264)) )
))
(declare-datatypes ((List!23 0))(
  ( (Nil!20) (Cons!19 (h!585 tuple2!28) (t!2042 List!23)) )
))
(declare-datatypes ((ListLongMap!33 0))(
  ( (ListLongMap!34 (toList!32 List!23)) )
))
(declare-fun lm!258 () ListLongMap!33)

(declare-fun p!318 () Int)

(declare-fun forall!16 (List!23 Int) Bool)

(assert (=> start!164 (= res!4400 (forall!16 (toList!32 lm!258) p!318))))

(assert (=> start!164 e!350))

(declare-fun e!351 () Bool)

(declare-fun inv!49 (ListLongMap!33) Bool)

(assert (=> start!164 (and (inv!49 lm!258) e!351)))

(assert (=> start!164 tp!91))

(declare-fun b!1823 () Bool)

(declare-fun size!65 (List!23) Int)

(assert (=> b!1823 (= e!350 (< (size!65 (toList!32 lm!258)) 0))))

(declare-fun b!1824 () Bool)

(declare-fun tp!92 () Bool)

(assert (=> b!1824 (= e!351 tp!92)))

(assert (= (and start!164 res!4400) b!1823))

(assert (= start!164 b!1824))

(declare-fun m!501 () Bool)

(assert (=> start!164 m!501))

(declare-fun m!503 () Bool)

(assert (=> start!164 m!503))

(declare-fun m!505 () Bool)

(assert (=> b!1823 m!505))

(push 1)

(assert (not b!1824))

(assert (not b_next!29))

(assert (not b!1823))

(assert (not start!164))

(assert b_and!53)

(check-sat)

(pop 1)

(push 1)

(assert b_and!53)

(assert (not b_next!29))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167 () Bool)

(declare-fun res!4416 () Bool)

(declare-fun e!367 () Bool)

(assert (=> d!167 (=> res!4416 e!367)))

(assert (=> d!167 (= res!4416 (is-Nil!20 (toList!32 lm!258)))))

(assert (=> d!167 (= (forall!16 (toList!32 lm!258) p!318) e!367)))

(declare-fun b!1840 () Bool)

(declare-fun e!369 () Bool)

(assert (=> b!1840 (= e!367 e!369)))

(declare-fun res!4418 () Bool)

(assert (=> b!1840 (=> (not res!4418) (not e!369))))

(declare-fun dynLambda!8 (Int tuple2!28) Bool)

(assert (=> b!1840 (= res!4418 (dynLambda!8 p!318 (h!585 (toList!32 lm!258))))))

(declare-fun b!1842 () Bool)

(assert (=> b!1842 (= e!369 (forall!16 (t!2042 (toList!32 lm!258)) p!318))))

(assert (= (and d!167 (not res!4416)) b!1840))

(assert (= (and b!1840 res!4418) b!1842))

(declare-fun b_lambda!53 () Bool)

(assert (=> (not b_lambda!53) (not b!1840)))

(declare-fun t!2048 () Bool)

(declare-fun tb!23 () Bool)

(assert (=> (and start!164 (= p!318 p!318) t!2048) tb!23))

(declare-fun result!35 () Bool)

(assert (=> tb!23 (= result!35 true)))

(assert (=> b!1840 t!2048))

(declare-fun b_and!59 () Bool)

(assert (= b_and!53 (and (=> t!2048 result!35) b_and!59)))

(declare-fun m!511 () Bool)

(assert (=> b!1840 m!511))

(declare-fun m!517 () Bool)

(assert (=> b!1842 m!517))

(assert (=> start!164 d!167))

(declare-fun d!173 () Bool)

(declare-fun isStrictlySorted!6 (List!23) Bool)

(assert (=> d!173 (= (inv!49 lm!258) (isStrictlySorted!6 (toList!32 lm!258)))))

(declare-fun bs!47 () Bool)

(assert (= bs!47 d!173))

(declare-fun m!523 () Bool)

(assert (=> bs!47 m!523))

(assert (=> start!164 d!173))

(declare-fun d!179 () Bool)

(declare-fun lt!314 () Int)

(assert (=> d!179 (>= lt!314 0)))

(declare-fun e!378 () Int)

(assert (=> d!179 (= lt!314 e!378)))

(declare-fun c!95 () Bool)

(assert (=> d!179 (= c!95 (is-Nil!20 (toList!32 lm!258)))))

(assert (=> d!179 (= (size!65 (toList!32 lm!258)) lt!314)))

(declare-fun b!1859 () Bool)

(assert (=> b!1859 (= e!378 0)))

(declare-fun b!1860 () Bool)

(assert (=> b!1860 (= e!378 (+ 1 (size!65 (t!2042 (toList!32 lm!258)))))))

(assert (= (and d!179 c!95) b!1859))

(assert (= (and d!179 (not c!95)) b!1860))

(declare-fun m!529 () Bool)

(assert (=> b!1860 m!529))

(assert (=> b!1823 d!179))

(declare-fun b!1875 () Bool)

(declare-fun e!387 () Bool)

(declare-fun tp_is_empty!17 () Bool)

(declare-fun tp!101 () Bool)

(assert (=> b!1875 (= e!387 (and tp_is_empty!17 tp!101))))

(assert (=> b!1824 (= tp!92 e!387)))

(assert (= (and b!1824 (is-Cons!19 (toList!32 lm!258))) b!1875))

(declare-fun b_lambda!59 () Bool)

(assert (= b_lambda!53 (or (and start!164 b_free!29) b_lambda!59)))

(push 1)

