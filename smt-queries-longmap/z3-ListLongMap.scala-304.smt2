; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5300 () Bool)

(assert start!5300)

(assert (=> start!5300 true))

(assert (=> start!5300 true))

(declare-fun res!22970 () Bool)

(declare-fun e!24258 () Bool)

(assert (=> start!5300 (=> (not res!22970) (not e!24258))))

(declare-datatypes ((List!1005 0))(
  ( (Nil!1002) (Cons!1001 (h!1569 (_ BitVec 64)) (t!3838 List!1005)) )
))
(declare-fun lt!14056 () List!1005)

(declare-fun lambda!232 () Int)

(declare-fun forall!182 (List!1005 Int) Bool)

(assert (=> start!5300 (= res!22970 (forall!182 lt!14056 lambda!232))))

(declare-datatypes ((B!812 0))(
  ( (B!813 (val!906 Int)) )
))
(declare-datatypes ((tuple2!1454 0))(
  ( (tuple2!1455 (_1!738 (_ BitVec 64)) (_2!738 B!812)) )
))
(declare-datatypes ((List!1006 0))(
  ( (Nil!1003) (Cons!1002 (h!1570 tuple2!1454) (t!3839 List!1006)) )
))
(declare-datatypes ((ListLongMap!1025 0))(
  ( (ListLongMap!1026 (toList!528 List!1006)) )
))
(declare-fun lm!266 () ListLongMap!1025)

(declare-fun value!232 () B!812)

(declare-fun getKeysOf!4 (List!1006 B!812) List!1005)

(assert (=> start!5300 (= lt!14056 (getKeysOf!4 (toList!528 lm!266) value!232))))

(assert (=> start!5300 e!24258))

(declare-fun e!24257 () Bool)

(declare-fun inv!1731 (ListLongMap!1025) Bool)

(assert (=> start!5300 (and (inv!1731 lm!266) e!24257)))

(declare-fun tp_is_empty!1735 () Bool)

(assert (=> start!5300 tp_is_empty!1735))

(declare-fun b!38169 () Bool)

(assert (=> b!38169 (= e!24258 (not (forall!182 lt!14056 lambda!232)))))

(declare-fun b!38170 () Bool)

(declare-fun tp!5705 () Bool)

(assert (=> b!38170 (= e!24257 tp!5705)))

(assert (= (and start!5300 res!22970) b!38169))

(assert (= start!5300 b!38170))

(declare-fun m!30697 () Bool)

(assert (=> start!5300 m!30697))

(declare-fun m!30699 () Bool)

(assert (=> start!5300 m!30699))

(declare-fun m!30701 () Bool)

(assert (=> start!5300 m!30701))

(assert (=> b!38169 m!30697))

(check-sat (not start!5300) (not b!38169) (not b!38170) tp_is_empty!1735)
(check-sat)
