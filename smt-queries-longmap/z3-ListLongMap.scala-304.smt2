; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5294 () Bool)

(assert start!5294)

(assert (=> start!5294 true))

(assert (=> start!5294 true))

(declare-fun res!22978 () Bool)

(declare-fun e!24266 () Bool)

(assert (=> start!5294 (=> (not res!22978) (not e!24266))))

(declare-datatypes ((List!1012 0))(
  ( (Nil!1009) (Cons!1008 (h!1576 (_ BitVec 64)) (t!3844 List!1012)) )
))
(declare-fun lt!14096 () List!1012)

(declare-fun lambda!232 () Int)

(declare-fun forall!182 (List!1012 Int) Bool)

(assert (=> start!5294 (= res!22978 (forall!182 lt!14096 lambda!232))))

(declare-datatypes ((B!812 0))(
  ( (B!813 (val!906 Int)) )
))
(declare-datatypes ((tuple2!1476 0))(
  ( (tuple2!1477 (_1!749 (_ BitVec 64)) (_2!749 B!812)) )
))
(declare-datatypes ((List!1013 0))(
  ( (Nil!1010) (Cons!1009 (h!1577 tuple2!1476) (t!3845 List!1013)) )
))
(declare-datatypes ((ListLongMap!1041 0))(
  ( (ListLongMap!1042 (toList!536 List!1013)) )
))
(declare-fun lm!266 () ListLongMap!1041)

(declare-fun value!232 () B!812)

(declare-fun getKeysOf!4 (List!1013 B!812) List!1012)

(assert (=> start!5294 (= lt!14096 (getKeysOf!4 (toList!536 lm!266) value!232))))

(assert (=> start!5294 e!24266))

(declare-fun e!24267 () Bool)

(declare-fun inv!1731 (ListLongMap!1041) Bool)

(assert (=> start!5294 (and (inv!1731 lm!266) e!24267)))

(declare-fun tp_is_empty!1735 () Bool)

(assert (=> start!5294 tp_is_empty!1735))

(declare-fun b!38187 () Bool)

(assert (=> b!38187 (= e!24266 (not (forall!182 lt!14096 lambda!232)))))

(declare-fun b!38188 () Bool)

(declare-fun tp!5705 () Bool)

(assert (=> b!38188 (= e!24267 tp!5705)))

(assert (= (and start!5294 res!22978) b!38187))

(assert (= start!5294 b!38188))

(declare-fun m!30779 () Bool)

(assert (=> start!5294 m!30779))

(declare-fun m!30781 () Bool)

(assert (=> start!5294 m!30781))

(declare-fun m!30783 () Bool)

(assert (=> start!5294 m!30783))

(assert (=> b!38187 m!30779))

(check-sat (not b!38187) (not start!5294) (not b!38188) tp_is_empty!1735)
(check-sat)
