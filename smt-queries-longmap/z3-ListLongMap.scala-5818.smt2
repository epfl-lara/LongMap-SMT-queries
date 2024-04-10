; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75030 () Bool)

(assert start!75030)

(declare-datatypes ((B!1228 0))(
  ( (B!1229 (val!8920 Int)) )
))
(declare-datatypes ((tuple2!11834 0))(
  ( (tuple2!11835 (_1!5928 (_ BitVec 64)) (_2!5928 B!1228)) )
))
(declare-datatypes ((List!17636 0))(
  ( (Nil!17633) (Cons!17632 (h!18763 tuple2!11834) (t!24913 List!17636)) )
))
(declare-datatypes ((ListLongMap!10603 0))(
  ( (ListLongMap!10604 (toList!5317 List!17636)) )
))
(declare-fun lm!210 () ListLongMap!10603)

(declare-fun isStrictlySorted!463 (List!17636) Bool)

(assert (=> start!75030 (not (isStrictlySorted!463 (toList!5317 lm!210)))))

(declare-fun e!492510 () Bool)

(declare-fun inv!29362 (ListLongMap!10603) Bool)

(assert (=> start!75030 (and (inv!29362 lm!210) e!492510)))

(declare-fun b!884980 () Bool)

(declare-fun tp!54197 () Bool)

(assert (=> b!884980 (= e!492510 tp!54197)))

(assert (= start!75030 b!884980))

(declare-fun m!825239 () Bool)

(assert (=> start!75030 m!825239))

(declare-fun m!825241 () Bool)

(assert (=> start!75030 m!825241))

(check-sat (not start!75030) (not b!884980))
(check-sat)
(get-model)

(declare-fun d!109293 () Bool)

(declare-fun res!601169 () Bool)

(declare-fun e!492526 () Bool)

(assert (=> d!109293 (=> res!601169 e!492526)))

(get-info :version)

(assert (=> d!109293 (= res!601169 (or ((_ is Nil!17633) (toList!5317 lm!210)) ((_ is Nil!17633) (t!24913 (toList!5317 lm!210)))))))

(assert (=> d!109293 (= (isStrictlySorted!463 (toList!5317 lm!210)) e!492526)))

(declare-fun b!884996 () Bool)

(declare-fun e!492527 () Bool)

(assert (=> b!884996 (= e!492526 e!492527)))

(declare-fun res!601170 () Bool)

(assert (=> b!884996 (=> (not res!601170) (not e!492527))))

(assert (=> b!884996 (= res!601170 (bvslt (_1!5928 (h!18763 (toList!5317 lm!210))) (_1!5928 (h!18763 (t!24913 (toList!5317 lm!210))))))))

(declare-fun b!884997 () Bool)

(assert (=> b!884997 (= e!492527 (isStrictlySorted!463 (t!24913 (toList!5317 lm!210))))))

(assert (= (and d!109293 (not res!601169)) b!884996))

(assert (= (and b!884996 res!601170) b!884997))

(declare-fun m!825247 () Bool)

(assert (=> b!884997 m!825247))

(assert (=> start!75030 d!109293))

(declare-fun d!109299 () Bool)

(assert (=> d!109299 (= (inv!29362 lm!210) (isStrictlySorted!463 (toList!5317 lm!210)))))

(declare-fun bs!24801 () Bool)

(assert (= bs!24801 d!109299))

(assert (=> bs!24801 m!825239))

(assert (=> start!75030 d!109299))

(declare-fun b!885012 () Bool)

(declare-fun e!492536 () Bool)

(declare-fun tp_is_empty!17737 () Bool)

(declare-fun tp!54203 () Bool)

(assert (=> b!885012 (= e!492536 (and tp_is_empty!17737 tp!54203))))

(assert (=> b!884980 (= tp!54197 e!492536)))

(assert (= (and b!884980 ((_ is Cons!17632) (toList!5317 lm!210))) b!885012))

(check-sat (not b!884997) (not d!109299) (not b!885012) tp_is_empty!17737)
(check-sat)
