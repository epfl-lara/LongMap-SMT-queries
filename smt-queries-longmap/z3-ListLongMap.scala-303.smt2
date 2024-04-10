; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5280 () Bool)

(assert start!5280)

(declare-datatypes ((B!808 0))(
  ( (B!809 (val!904 Int)) )
))
(declare-datatypes ((tuple2!1468 0))(
  ( (tuple2!1469 (_1!745 (_ BitVec 64)) (_2!745 B!808)) )
))
(declare-datatypes ((List!1017 0))(
  ( (Nil!1014) (Cons!1013 (h!1581 tuple2!1468) (t!3850 List!1017)) )
))
(declare-datatypes ((ListLongMap!1045 0))(
  ( (ListLongMap!1046 (toList!538 List!1017)) )
))
(declare-fun lm!266 () ListLongMap!1045)

(declare-fun ListLongMapPrimitiveSize!2 (ListLongMap!1045) Int)

(assert (=> start!5280 (< (ListLongMapPrimitiveSize!2 lm!266) 0)))

(declare-fun e!24277 () Bool)

(declare-fun inv!1724 (ListLongMap!1045) Bool)

(assert (=> start!5280 (and (inv!1724 lm!266) e!24277)))

(declare-fun b!38203 () Bool)

(declare-fun tp!5690 () Bool)

(assert (=> b!38203 (= e!24277 tp!5690)))

(assert (= start!5280 b!38203))

(declare-fun m!30803 () Bool)

(assert (=> start!5280 m!30803))

(declare-fun m!30805 () Bool)

(assert (=> start!5280 m!30805))

(check-sat (not start!5280) (not b!38203))
(check-sat)
(get-model)

(declare-fun d!6195 () Bool)

(declare-fun lt!14094 () Int)

(assert (=> d!6195 (>= lt!14094 0)))

(declare-fun ListPrimitiveSize!41 (List!1017) Int)

(assert (=> d!6195 (= lt!14094 (+ 1 (ListPrimitiveSize!41 (toList!538 lm!266))))))

(assert (=> d!6195 (= (ListLongMapPrimitiveSize!2 lm!266) lt!14094)))

(declare-fun bs!1552 () Bool)

(assert (= bs!1552 d!6195))

(declare-fun m!30811 () Bool)

(assert (=> bs!1552 m!30811))

(assert (=> start!5280 d!6195))

(declare-fun d!6201 () Bool)

(declare-fun isStrictlySorted!209 (List!1017) Bool)

(assert (=> d!6201 (= (inv!1724 lm!266) (isStrictlySorted!209 (toList!538 lm!266)))))

(declare-fun bs!1555 () Bool)

(assert (= bs!1555 d!6201))

(declare-fun m!30817 () Bool)

(assert (=> bs!1555 m!30817))

(assert (=> start!5280 d!6201))

(declare-fun b!38219 () Bool)

(declare-fun e!24287 () Bool)

(declare-fun tp_is_empty!1729 () Bool)

(declare-fun tp!5700 () Bool)

(assert (=> b!38219 (= e!24287 (and tp_is_empty!1729 tp!5700))))

(assert (=> b!38203 (= tp!5690 e!24287)))

(get-info :version)

(assert (= (and b!38203 ((_ is Cons!1013) (toList!538 lm!266))) b!38219))

(check-sat (not d!6195) (not d!6201) (not b!38219) tp_is_empty!1729)
(check-sat)
