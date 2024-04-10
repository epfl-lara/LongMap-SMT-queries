; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5298 () Bool)

(assert start!5298)

(assert (=> start!5298 true))

(assert (=> start!5298 true))

(declare-fun res!22998 () Bool)

(declare-fun e!24301 () Bool)

(assert (=> start!5298 (=> (not res!22998) (not e!24301))))

(declare-datatypes ((List!1021 0))(
  ( (Nil!1018) (Cons!1017 (h!1585 (_ BitVec 64)) (t!3854 List!1021)) )
))
(declare-fun lt!14102 () List!1021)

(declare-fun lambda!237 () Int)

(declare-fun forall!183 (List!1021 Int) Bool)

(assert (=> start!5298 (= res!22998 (forall!183 lt!14102 lambda!237))))

(declare-datatypes ((B!814 0))(
  ( (B!815 (val!907 Int)) )
))
(declare-datatypes ((tuple2!1474 0))(
  ( (tuple2!1475 (_1!748 (_ BitVec 64)) (_2!748 B!814)) )
))
(declare-datatypes ((List!1022 0))(
  ( (Nil!1019) (Cons!1018 (h!1586 tuple2!1474) (t!3855 List!1022)) )
))
(declare-datatypes ((ListLongMap!1051 0))(
  ( (ListLongMap!1052 (toList!541 List!1022)) )
))
(declare-fun lm!266 () ListLongMap!1051)

(declare-fun value!232 () B!814)

(declare-fun getKeysOf!5 (List!1022 B!814) List!1021)

(assert (=> start!5298 (= lt!14102 (getKeysOf!5 (toList!541 lm!266) value!232))))

(assert (=> start!5298 e!24301))

(declare-fun e!24300 () Bool)

(declare-fun inv!1732 (ListLongMap!1051) Bool)

(assert (=> start!5298 (and (inv!1732 lm!266) e!24300)))

(declare-fun tp_is_empty!1737 () Bool)

(assert (=> start!5298 tp_is_empty!1737))

(declare-fun b!38236 () Bool)

(assert (=> b!38236 (= e!24301 (not (forall!183 lt!14102 lambda!237)))))

(declare-fun b!38237 () Bool)

(declare-fun tp!5708 () Bool)

(assert (=> b!38237 (= e!24300 tp!5708)))

(assert (= (and start!5298 res!22998) b!38236))

(assert (= start!5298 b!38237))

(declare-fun m!30829 () Bool)

(assert (=> start!5298 m!30829))

(declare-fun m!30831 () Bool)

(assert (=> start!5298 m!30831))

(declare-fun m!30833 () Bool)

(assert (=> start!5298 m!30833))

(assert (=> b!38236 m!30829))

(check-sat (not b!38236) (not start!5298) (not b!38237) tp_is_empty!1737)
(check-sat)
