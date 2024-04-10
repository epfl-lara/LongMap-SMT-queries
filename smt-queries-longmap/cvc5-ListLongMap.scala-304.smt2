; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5296 () Bool)

(assert start!5296)

(assert (=> start!5296 true))

(assert (=> start!5296 true))

(declare-fun res!22995 () Bool)

(declare-fun e!24294 () Bool)

(assert (=> start!5296 (=> (not res!22995) (not e!24294))))

(declare-datatypes ((List!1019 0))(
  ( (Nil!1016) (Cons!1015 (h!1583 (_ BitVec 64)) (t!3852 List!1019)) )
))
(declare-fun lt!14099 () List!1019)

(declare-fun lambda!232 () Int)

(declare-fun forall!182 (List!1019 Int) Bool)

(assert (=> start!5296 (= res!22995 (forall!182 lt!14099 lambda!232))))

(declare-datatypes ((B!812 0))(
  ( (B!813 (val!906 Int)) )
))
(declare-datatypes ((tuple2!1472 0))(
  ( (tuple2!1473 (_1!747 (_ BitVec 64)) (_2!747 B!812)) )
))
(declare-datatypes ((List!1020 0))(
  ( (Nil!1017) (Cons!1016 (h!1584 tuple2!1472) (t!3853 List!1020)) )
))
(declare-datatypes ((ListLongMap!1049 0))(
  ( (ListLongMap!1050 (toList!540 List!1020)) )
))
(declare-fun lm!266 () ListLongMap!1049)

(declare-fun value!232 () B!812)

(declare-fun getKeysOf!4 (List!1020 B!812) List!1019)

(assert (=> start!5296 (= lt!14099 (getKeysOf!4 (toList!540 lm!266) value!232))))

(assert (=> start!5296 e!24294))

(declare-fun e!24295 () Bool)

(declare-fun inv!1731 (ListLongMap!1049) Bool)

(assert (=> start!5296 (and (inv!1731 lm!266) e!24295)))

(declare-fun tp_is_empty!1735 () Bool)

(assert (=> start!5296 tp_is_empty!1735))

(declare-fun b!38226 () Bool)

(assert (=> b!38226 (= e!24294 (not (forall!182 lt!14099 lambda!232)))))

(declare-fun b!38227 () Bool)

(declare-fun tp!5705 () Bool)

(assert (=> b!38227 (= e!24295 tp!5705)))

(assert (= (and start!5296 res!22995) b!38226))

(assert (= start!5296 b!38227))

(declare-fun m!30823 () Bool)

(assert (=> start!5296 m!30823))

(declare-fun m!30825 () Bool)

(assert (=> start!5296 m!30825))

(declare-fun m!30827 () Bool)

(assert (=> start!5296 m!30827))

(assert (=> b!38226 m!30823))

(push 1)

(assert (not b!38226))

(assert (not start!5296))

(assert (not b!38227))

(assert tp_is_empty!1735)

(check-sat)

