; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5300 () Bool)

(assert start!5300)

(assert (=> start!5300 true))

(assert (=> start!5300 true))

(declare-fun res!23001 () Bool)

(declare-fun e!24307 () Bool)

(assert (=> start!5300 (=> (not res!23001) (not e!24307))))

(declare-datatypes ((List!1023 0))(
  ( (Nil!1020) (Cons!1019 (h!1587 (_ BitVec 64)) (t!3856 List!1023)) )
))
(declare-fun lt!14105 () List!1023)

(declare-fun lambda!242 () Int)

(declare-fun forall!184 (List!1023 Int) Bool)

(assert (=> start!5300 (= res!23001 (forall!184 lt!14105 lambda!242))))

(declare-datatypes ((B!816 0))(
  ( (B!817 (val!908 Int)) )
))
(declare-datatypes ((tuple2!1476 0))(
  ( (tuple2!1477 (_1!749 (_ BitVec 64)) (_2!749 B!816)) )
))
(declare-datatypes ((List!1024 0))(
  ( (Nil!1021) (Cons!1020 (h!1588 tuple2!1476) (t!3857 List!1024)) )
))
(declare-datatypes ((ListLongMap!1053 0))(
  ( (ListLongMap!1054 (toList!542 List!1024)) )
))
(declare-fun lm!266 () ListLongMap!1053)

(declare-fun value!232 () B!816)

(declare-fun getKeysOf!6 (List!1024 B!816) List!1023)

(assert (=> start!5300 (= lt!14105 (getKeysOf!6 (toList!542 lm!266) value!232))))

(assert (=> start!5300 e!24307))

(declare-fun e!24306 () Bool)

(declare-fun inv!1733 (ListLongMap!1053) Bool)

(assert (=> start!5300 (and (inv!1733 lm!266) e!24306)))

(declare-fun tp_is_empty!1739 () Bool)

(assert (=> start!5300 tp_is_empty!1739))

(declare-fun b!38246 () Bool)

(assert (=> b!38246 (= e!24307 (not (forall!184 lt!14105 lambda!242)))))

(declare-fun b!38247 () Bool)

(declare-fun tp!5711 () Bool)

(assert (=> b!38247 (= e!24306 tp!5711)))

(assert (= (and start!5300 res!23001) b!38246))

(assert (= start!5300 b!38247))

(declare-fun m!30835 () Bool)

(assert (=> start!5300 m!30835))

(declare-fun m!30837 () Bool)

(assert (=> start!5300 m!30837))

(declare-fun m!30839 () Bool)

(assert (=> start!5300 m!30839))

(assert (=> b!38246 m!30835))

(push 1)

(assert (not b!38246))

(assert (not start!5300))

(assert (not b!38247))

(assert tp_is_empty!1739)

(check-sat)

