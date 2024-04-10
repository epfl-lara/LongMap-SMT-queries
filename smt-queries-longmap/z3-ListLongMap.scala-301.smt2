; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5238 () Bool)

(assert start!5238)

(declare-datatypes ((B!796 0))(
  ( (B!797 (val!898 Int)) )
))
(declare-datatypes ((tuple2!1456 0))(
  ( (tuple2!1457 (_1!739 (_ BitVec 64)) (_2!739 B!796)) )
))
(declare-datatypes ((List!1008 0))(
  ( (Nil!1005) (Cons!1004 (h!1572 tuple2!1456) (t!3841 List!1008)) )
))
(declare-datatypes ((ListLongMap!1033 0))(
  ( (ListLongMap!1034 (toList!532 List!1008)) )
))
(declare-fun lm!266 () ListLongMap!1033)

(declare-fun isStrictlySorted!204 (List!1008) Bool)

(assert (=> start!5238 (not (isStrictlySorted!204 (toList!532 lm!266)))))

(declare-fun e!24169 () Bool)

(declare-fun inv!1708 (ListLongMap!1033) Bool)

(assert (=> start!5238 (and (inv!1708 lm!266) e!24169)))

(declare-fun b!38023 () Bool)

(declare-fun tp!5654 () Bool)

(assert (=> b!38023 (= e!24169 tp!5654)))

(assert (= start!5238 b!38023))

(declare-fun m!30713 () Bool)

(assert (=> start!5238 m!30713))

(declare-fun m!30715 () Bool)

(assert (=> start!5238 m!30715))

(check-sat (not start!5238) (not b!38023))
(check-sat)
(get-model)

(declare-fun d!6155 () Bool)

(declare-fun res!22971 () Bool)

(declare-fun e!24187 () Bool)

(assert (=> d!6155 (=> res!22971 e!24187)))

(get-info :version)

(assert (=> d!6155 (= res!22971 (or ((_ is Nil!1005) (toList!532 lm!266)) ((_ is Nil!1005) (t!3841 (toList!532 lm!266)))))))

(assert (=> d!6155 (= (isStrictlySorted!204 (toList!532 lm!266)) e!24187)))

(declare-fun b!38041 () Bool)

(declare-fun e!24188 () Bool)

(assert (=> b!38041 (= e!24187 e!24188)))

(declare-fun res!22972 () Bool)

(assert (=> b!38041 (=> (not res!22972) (not e!24188))))

(assert (=> b!38041 (= res!22972 (bvslt (_1!739 (h!1572 (toList!532 lm!266))) (_1!739 (h!1572 (t!3841 (toList!532 lm!266))))))))

(declare-fun b!38042 () Bool)

(assert (=> b!38042 (= e!24188 (isStrictlySorted!204 (t!3841 (toList!532 lm!266))))))

(assert (= (and d!6155 (not res!22971)) b!38041))

(assert (= (and b!38041 res!22972) b!38042))

(declare-fun m!30723 () Bool)

(assert (=> b!38042 m!30723))

(assert (=> start!5238 d!6155))

(declare-fun d!6163 () Bool)

(assert (=> d!6163 (= (inv!1708 lm!266) (isStrictlySorted!204 (toList!532 lm!266)))))

(declare-fun bs!1520 () Bool)

(assert (= bs!1520 d!6163))

(assert (=> bs!1520 m!30713))

(assert (=> start!5238 d!6163))

(declare-fun b!38058 () Bool)

(declare-fun e!24198 () Bool)

(declare-fun tp_is_empty!1719 () Bool)

(declare-fun tp!5665 () Bool)

(assert (=> b!38058 (= e!24198 (and tp_is_empty!1719 tp!5665))))

(assert (=> b!38023 (= tp!5654 e!24198)))

(assert (= (and b!38023 ((_ is Cons!1004) (toList!532 lm!266))) b!38058))

(check-sat (not d!6163) (not b!38042) (not b!38058) tp_is_empty!1719)
(check-sat)
