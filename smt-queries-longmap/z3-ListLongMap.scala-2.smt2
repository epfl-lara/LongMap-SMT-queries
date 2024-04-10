; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114 () Bool)

(assert start!114)

(declare-fun b_free!9 () Bool)

(declare-fun b_next!9 () Bool)

(assert (=> start!114 (= b_free!9 (not b_next!9))))

(declare-fun tp!19 () Bool)

(declare-fun b_and!21 () Bool)

(assert (=> start!114 (= tp!19 b_and!21)))

(declare-fun res!4315 () Bool)

(declare-fun e!246 () Bool)

(assert (=> start!114 (=> (not res!4315) (not e!246))))

(declare-datatypes ((B!244 0))(
  ( (B!245 (val!4 Int)) )
))
(declare-datatypes ((tuple2!8 0))(
  ( (tuple2!9 (_1!4 (_ BitVec 64)) (_2!4 B!244)) )
))
(declare-datatypes ((List!13 0))(
  ( (Nil!10) (Cons!9 (h!575 tuple2!8) (t!2020 List!13)) )
))
(declare-datatypes ((ListLongMap!13 0))(
  ( (ListLongMap!14 (toList!22 List!13)) )
))
(declare-fun lm!258 () ListLongMap!13)

(declare-fun p!318 () Int)

(declare-fun forall!9 (List!13 Int) Bool)

(assert (=> start!114 (= res!4315 (forall!9 (toList!22 lm!258) p!318))))

(assert (=> start!114 e!246))

(declare-fun e!245 () Bool)

(declare-fun inv!24 (ListLongMap!13) Bool)

(assert (=> start!114 (and (inv!24 lm!258) e!245)))

(assert (=> start!114 tp!19))

(declare-fun b!1690 () Bool)

(declare-fun res!4316 () Bool)

(assert (=> b!1690 (=> (not res!4316) (not e!246))))

(declare-fun isEmpty!11 (ListLongMap!13) Bool)

(assert (=> b!1690 (= res!4316 (not (isEmpty!11 lm!258)))))

(declare-fun b!1691 () Bool)

(assert (=> b!1691 (= e!246 (= (toList!22 lm!258) Nil!10))))

(declare-fun b!1692 () Bool)

(declare-fun tp!20 () Bool)

(assert (=> b!1692 (= e!245 tp!20)))

(assert (= (and start!114 res!4315) b!1690))

(assert (= (and b!1690 res!4316) b!1691))

(assert (= start!114 b!1692))

(declare-fun m!393 () Bool)

(assert (=> start!114 m!393))

(declare-fun m!395 () Bool)

(assert (=> start!114 m!395))

(declare-fun m!397 () Bool)

(assert (=> b!1690 m!397))

(check-sat (not b!1692) (not b_next!9) b_and!21 (not b!1690) (not start!114))
(check-sat b_and!21 (not b_next!9))
(get-model)

(declare-fun d!125 () Bool)

(declare-fun isEmpty!14 (List!13) Bool)

(assert (=> d!125 (= (isEmpty!11 lm!258) (isEmpty!14 (toList!22 lm!258)))))

(declare-fun bs!31 () Bool)

(assert (= bs!31 d!125))

(declare-fun m!411 () Bool)

(assert (=> bs!31 m!411))

(assert (=> b!1690 d!125))

(declare-fun d!131 () Bool)

(declare-fun res!4339 () Bool)

(declare-fun e!269 () Bool)

(assert (=> d!131 (=> res!4339 e!269)))

(get-info :version)

(assert (=> d!131 (= res!4339 ((_ is Nil!10) (toList!22 lm!258)))))

(assert (=> d!131 (= (forall!9 (toList!22 lm!258) p!318) e!269)))

(declare-fun b!1718 () Bool)

(declare-fun e!270 () Bool)

(assert (=> b!1718 (= e!269 e!270)))

(declare-fun res!4340 () Bool)

(assert (=> b!1718 (=> (not res!4340) (not e!270))))

(declare-fun dynLambda!5 (Int tuple2!8) Bool)

(assert (=> b!1718 (= res!4340 (dynLambda!5 p!318 (h!575 (toList!22 lm!258))))))

(declare-fun b!1719 () Bool)

(assert (=> b!1719 (= e!270 (forall!9 (t!2020 (toList!22 lm!258)) p!318))))

(assert (= (and d!131 (not res!4339)) b!1718))

(assert (= (and b!1718 res!4340) b!1719))

(declare-fun b_lambda!29 () Bool)

(assert (=> (not b_lambda!29) (not b!1718)))

(declare-fun t!2027 () Bool)

(declare-fun tb!11 () Bool)

(assert (=> (and start!114 (= p!318 p!318) t!2027) tb!11))

(declare-fun result!17 () Bool)

(assert (=> tb!11 (= result!17 true)))

(assert (=> b!1718 t!2027))

(declare-fun b_and!29 () Bool)

(assert (= b_and!21 (and (=> t!2027 result!17) b_and!29)))

(declare-fun m!421 () Bool)

(assert (=> b!1718 m!421))

(declare-fun m!423 () Bool)

(assert (=> b!1719 m!423))

(assert (=> start!114 d!131))

(declare-fun d!137 () Bool)

(declare-fun isStrictlySorted!3 (List!13) Bool)

(assert (=> d!137 (= (inv!24 lm!258) (isStrictlySorted!3 (toList!22 lm!258)))))

(declare-fun bs!35 () Bool)

(assert (= bs!35 d!137))

(declare-fun m!427 () Bool)

(assert (=> bs!35 m!427))

(assert (=> start!114 d!137))

(declare-fun b!1734 () Bool)

(declare-fun e!279 () Bool)

(declare-fun tp_is_empty!11 () Bool)

(declare-fun tp!35 () Bool)

(assert (=> b!1734 (= e!279 (and tp_is_empty!11 tp!35))))

(assert (=> b!1692 (= tp!20 e!279)))

(assert (= (and b!1692 ((_ is Cons!9) (toList!22 lm!258))) b!1734))

(declare-fun b_lambda!35 () Bool)

(assert (= b_lambda!29 (or (and start!114 b_free!9) b_lambda!35)))

(check-sat tp_is_empty!11 (not d!125) (not b!1734) (not b_next!9) (not b!1719) b_and!29 (not b_lambda!35) (not d!137))
(check-sat b_and!29 (not b_next!9))
(get-model)

(declare-fun d!147 () Bool)

(assert (=> d!147 (= (isEmpty!14 (toList!22 lm!258)) ((_ is Nil!10) (toList!22 lm!258)))))

(assert (=> d!125 d!147))

(declare-fun d!151 () Bool)

(declare-fun res!4357 () Bool)

(declare-fun e!297 () Bool)

(assert (=> d!151 (=> res!4357 e!297)))

(assert (=> d!151 (= res!4357 ((_ is Nil!10) (t!2020 (toList!22 lm!258))))))

