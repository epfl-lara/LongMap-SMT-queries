; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5282 () Bool)

(assert start!5282)

(declare-datatypes ((B!806 0))(
  ( (B!807 (val!903 Int)) )
))
(declare-datatypes ((tuple2!1448 0))(
  ( (tuple2!1449 (_1!735 (_ BitVec 64)) (_2!735 B!806)) )
))
(declare-datatypes ((List!1002 0))(
  ( (Nil!999) (Cons!998 (h!1566 tuple2!1448) (t!3835 List!1002)) )
))
(declare-datatypes ((ListLongMap!1019 0))(
  ( (ListLongMap!1020 (toList!525 List!1002)) )
))
(declare-fun lm!266 () ListLongMap!1019)

(declare-fun ListLongMapPrimitiveSize!1 (ListLongMap!1019) Int)

(assert (=> start!5282 (< (ListLongMapPrimitiveSize!1 lm!266) 0)))

(declare-fun e!24237 () Bool)

(declare-fun inv!1723 (ListLongMap!1019) Bool)

(assert (=> start!5282 (and (inv!1723 lm!266) e!24237)))

(declare-fun b!38143 () Bool)

(declare-fun tp!5687 () Bool)

(assert (=> b!38143 (= e!24237 tp!5687)))

(assert (= start!5282 b!38143))

(declare-fun m!30673 () Bool)

(assert (=> start!5282 m!30673))

(declare-fun m!30675 () Bool)

(assert (=> start!5282 m!30675))

(check-sat (not start!5282) (not b!38143))
(check-sat)
(get-model)

(declare-fun d!6181 () Bool)

(declare-fun lt!14050 () Int)

(assert (=> d!6181 (>= lt!14050 0)))

(declare-fun ListPrimitiveSize!41 (List!1002) Int)

(assert (=> d!6181 (= lt!14050 (+ 1 (ListPrimitiveSize!41 (toList!525 lm!266))))))

(assert (=> d!6181 (= (ListLongMapPrimitiveSize!1 lm!266) lt!14050)))

(declare-fun bs!1551 () Bool)

(assert (= bs!1551 d!6181))

(declare-fun m!30686 () Bool)

(assert (=> bs!1551 m!30686))

(assert (=> start!5282 d!6181))

(declare-fun d!6189 () Bool)

(declare-fun isStrictlySorted!197 (List!1002) Bool)

(assert (=> d!6189 (= (inv!1723 lm!266) (isStrictlySorted!197 (toList!525 lm!266)))))

(declare-fun bs!1555 () Bool)

(assert (= bs!1555 d!6189))

(declare-fun m!30693 () Bool)

(assert (=> bs!1555 m!30693))

(assert (=> start!5282 d!6189))

(declare-fun b!38158 () Bool)

(declare-fun e!24248 () Bool)

(declare-fun tp_is_empty!1730 () Bool)

(declare-fun tp!5698 () Bool)

(assert (=> b!38158 (= e!24248 (and tp_is_empty!1730 tp!5698))))

(assert (=> b!38143 (= tp!5687 e!24248)))

(get-info :version)

(assert (= (and b!38143 ((_ is Cons!998) (toList!525 lm!266))) b!38158))

(check-sat (not d!6189) (not d!6181) (not b!38158) tp_is_empty!1730)
(check-sat)
