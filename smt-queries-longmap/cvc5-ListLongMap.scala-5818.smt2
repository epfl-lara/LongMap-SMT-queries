; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75028 () Bool)

(assert start!75028)

(declare-datatypes ((B!1226 0))(
  ( (B!1227 (val!8919 Int)) )
))
(declare-datatypes ((tuple2!11832 0))(
  ( (tuple2!11833 (_1!5927 (_ BitVec 64)) (_2!5927 B!1226)) )
))
(declare-datatypes ((List!17635 0))(
  ( (Nil!17632) (Cons!17631 (h!18762 tuple2!11832) (t!24912 List!17635)) )
))
(declare-datatypes ((ListLongMap!10601 0))(
  ( (ListLongMap!10602 (toList!5316 List!17635)) )
))
(declare-fun lm!210 () ListLongMap!10601)

(declare-fun isStrictlySorted!462 (List!17635) Bool)

(assert (=> start!75028 (not (isStrictlySorted!462 (toList!5316 lm!210)))))

(declare-fun e!492507 () Bool)

(declare-fun inv!29361 (ListLongMap!10601) Bool)

(assert (=> start!75028 (and (inv!29361 lm!210) e!492507)))

(declare-fun b!884977 () Bool)

(declare-fun tp!54194 () Bool)

(assert (=> b!884977 (= e!492507 tp!54194)))

(assert (= start!75028 b!884977))

(declare-fun m!825235 () Bool)

(assert (=> start!75028 m!825235))

(declare-fun m!825237 () Bool)

(assert (=> start!75028 m!825237))

(push 1)

(assert (not start!75028))

(assert (not b!884977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109297 () Bool)

(declare-fun res!601171 () Bool)

(declare-fun e!492528 () Bool)

(assert (=> d!109297 (=> res!601171 e!492528)))

(assert (=> d!109297 (= res!601171 (or (is-Nil!17632 (toList!5316 lm!210)) (is-Nil!17632 (t!24912 (toList!5316 lm!210)))))))

(assert (=> d!109297 (= (isStrictlySorted!462 (toList!5316 lm!210)) e!492528)))

(declare-fun b!884998 () Bool)

(declare-fun e!492529 () Bool)

(assert (=> b!884998 (= e!492528 e!492529)))

(declare-fun res!601172 () Bool)

(assert (=> b!884998 (=> (not res!601172) (not e!492529))))

(assert (=> b!884998 (= res!601172 (bvslt (_1!5927 (h!18762 (toList!5316 lm!210))) (_1!5927 (h!18762 (t!24912 (toList!5316 lm!210))))))))

(declare-fun b!884999 () Bool)

(assert (=> b!884999 (= e!492529 (isStrictlySorted!462 (t!24912 (toList!5316 lm!210))))))

(assert (= (and d!109297 (not res!601171)) b!884998))

(assert (= (and b!884998 res!601172) b!884999))

(declare-fun m!825249 () Bool)

(assert (=> b!884999 m!825249))

(assert (=> start!75028 d!109297))

(declare-fun d!109301 () Bool)

(assert (=> d!109301 (= (inv!29361 lm!210) (isStrictlySorted!462 (toList!5316 lm!210)))))

(declare-fun bs!24802 () Bool)

(assert (= bs!24802 d!109301))

(assert (=> bs!24802 m!825235))

(assert (=> start!75028 d!109301))

(declare-fun b!885015 () Bool)

(declare-fun e!492539 () Bool)

(declare-fun tp_is_empty!17739 () Bool)

(declare-fun tp!54208 () Bool)

(assert (=> b!885015 (= e!492539 (and tp_is_empty!17739 tp!54208))))

(assert (=> b!884977 (= tp!54194 e!492539)))

(assert (= (and b!884977 (is-Cons!17631 (toList!5316 lm!210))) b!885015))

(push 1)

(assert (not d!109301))

(assert (not b!884999))

