; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5234 () Bool)

(assert start!5234)

(declare-datatypes ((B!794 0))(
  ( (B!795 (val!897 Int)) )
))
(declare-datatypes ((tuple2!1458 0))(
  ( (tuple2!1459 (_1!740 (_ BitVec 64)) (_2!740 B!794)) )
))
(declare-datatypes ((List!1000 0))(
  ( (Nil!997) (Cons!996 (h!1564 tuple2!1458) (t!3832 List!1000)) )
))
(declare-datatypes ((ListLongMap!1023 0))(
  ( (ListLongMap!1024 (toList!527 List!1000)) )
))
(declare-fun lm!266 () ListLongMap!1023)

(declare-fun isStrictlySorted!197 (List!1000) Bool)

(assert (=> start!5234 (not (isStrictlySorted!197 (toList!527 lm!266)))))

(declare-fun e!24138 () Bool)

(declare-fun inv!1707 (ListLongMap!1023) Bool)

(assert (=> start!5234 (and (inv!1707 lm!266) e!24138)))

(declare-fun b!37981 () Bool)

(declare-fun tp!5651 () Bool)

(assert (=> b!37981 (= e!24138 tp!5651)))

(assert (= start!5234 b!37981))

(declare-fun m!30665 () Bool)

(assert (=> start!5234 m!30665))

(declare-fun m!30667 () Bool)

(assert (=> start!5234 m!30667))

(check-sat (not start!5234) (not b!37981))
(check-sat)
(get-model)

(declare-fun d!6139 () Bool)

(declare-fun res!22952 () Bool)

(declare-fun e!24157 () Bool)

(assert (=> d!6139 (=> res!22952 e!24157)))

(get-info :version)

(assert (=> d!6139 (= res!22952 (or ((_ is Nil!997) (toList!527 lm!266)) ((_ is Nil!997) (t!3832 (toList!527 lm!266)))))))

(assert (=> d!6139 (= (isStrictlySorted!197 (toList!527 lm!266)) e!24157)))

(declare-fun b!38000 () Bool)

(declare-fun e!24158 () Bool)

(assert (=> b!38000 (= e!24157 e!24158)))

(declare-fun res!22953 () Bool)

(assert (=> b!38000 (=> (not res!22953) (not e!24158))))

(assert (=> b!38000 (= res!22953 (bvslt (_1!740 (h!1564 (toList!527 lm!266))) (_1!740 (h!1564 (t!3832 (toList!527 lm!266))))))))

(declare-fun b!38001 () Bool)

(assert (=> b!38001 (= e!24158 (isStrictlySorted!197 (t!3832 (toList!527 lm!266))))))

(assert (= (and d!6139 (not res!22952)) b!38000))

(assert (= (and b!38000 res!22953) b!38001))

(declare-fun m!30677 () Bool)

(assert (=> b!38001 m!30677))

(assert (=> start!5234 d!6139))

(declare-fun d!6145 () Bool)

(assert (=> d!6145 (= (inv!1707 lm!266) (isStrictlySorted!197 (toList!527 lm!266)))))

(declare-fun bs!1518 () Bool)

(assert (= bs!1518 d!6145))

(assert (=> bs!1518 m!30665))

(assert (=> start!5234 d!6145))

(declare-fun b!38019 () Bool)

(declare-fun e!24170 () Bool)

(declare-fun tp_is_empty!1718 () Bool)

(declare-fun tp!5665 () Bool)

(assert (=> b!38019 (= e!24170 (and tp_is_empty!1718 tp!5665))))

(assert (=> b!37981 (= tp!5651 e!24170)))

(assert (= (and b!37981 ((_ is Cons!996) (toList!527 lm!266))) b!38019))

(check-sat (not d!6145) (not b!38001) (not b!38019) tp_is_empty!1718)
(check-sat)
