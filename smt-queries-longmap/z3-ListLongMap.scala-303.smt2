; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5276 () Bool)

(assert start!5276)

(declare-datatypes ((B!806 0))(
  ( (B!807 (val!903 Int)) )
))
(declare-datatypes ((tuple2!1470 0))(
  ( (tuple2!1471 (_1!746 (_ BitVec 64)) (_2!746 B!806)) )
))
(declare-datatypes ((List!1009 0))(
  ( (Nil!1006) (Cons!1005 (h!1573 tuple2!1470) (t!3841 List!1009)) )
))
(declare-datatypes ((ListLongMap!1035 0))(
  ( (ListLongMap!1036 (toList!533 List!1009)) )
))
(declare-fun lm!266 () ListLongMap!1035)

(declare-fun ListLongMapPrimitiveSize!1 (ListLongMap!1035) Int)

(assert (=> start!5276 (< (ListLongMapPrimitiveSize!1 lm!266) 0)))

(declare-fun e!24246 () Bool)

(declare-fun inv!1723 (ListLongMap!1035) Bool)

(assert (=> start!5276 (and (inv!1723 lm!266) e!24246)))

(declare-fun b!38161 () Bool)

(declare-fun tp!5687 () Bool)

(assert (=> b!38161 (= e!24246 tp!5687)))

(assert (= start!5276 b!38161))

(declare-fun m!30755 () Bool)

(assert (=> start!5276 m!30755))

(declare-fun m!30757 () Bool)

(assert (=> start!5276 m!30757))

(check-sat (not start!5276) (not b!38161))
(check-sat)
(get-model)

(declare-fun d!6180 () Bool)

(declare-fun lt!14091 () Int)

(assert (=> d!6180 (>= lt!14091 0)))

(declare-fun ListPrimitiveSize!41 (List!1009) Int)

(assert (=> d!6180 (= lt!14091 (+ 1 (ListPrimitiveSize!41 (toList!533 lm!266))))))

(assert (=> d!6180 (= (ListLongMapPrimitiveSize!1 lm!266) lt!14091)))

(declare-fun bs!1552 () Bool)

(assert (= bs!1552 d!6180))

(declare-fun m!30768 () Bool)

(assert (=> bs!1552 m!30768))

(assert (=> start!5276 d!6180))

(declare-fun d!6187 () Bool)

(declare-fun isStrictlySorted!204 (List!1009) Bool)

(assert (=> d!6187 (= (inv!1723 lm!266) (isStrictlySorted!204 (toList!533 lm!266)))))

(declare-fun bs!1554 () Bool)

(assert (= bs!1554 d!6187))

(declare-fun m!30773 () Bool)

(assert (=> bs!1554 m!30773))

(assert (=> start!5276 d!6187))

(declare-fun b!38180 () Bool)

(declare-fun e!24259 () Bool)

(declare-fun tp_is_empty!1731 () Bool)

(declare-fun tp!5700 () Bool)

(assert (=> b!38180 (= e!24259 (and tp_is_empty!1731 tp!5700))))

(assert (=> b!38161 (= tp!5687 e!24259)))

(get-info :version)

(assert (= (and b!38161 ((_ is Cons!1005) (toList!533 lm!266))) b!38180))

(check-sat (not d!6187) (not d!6180) (not b!38180) tp_is_empty!1731)
(check-sat)
