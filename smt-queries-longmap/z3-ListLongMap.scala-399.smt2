; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7456 () Bool)

(assert start!7456)

(declare-fun res!27802 () Bool)

(declare-fun e!30671 () Bool)

(assert (=> start!7456 (=> (not res!27802) (not e!30671))))

(declare-datatypes ((B!908 0))(
  ( (B!909 (val!1074 Int)) )
))
(declare-datatypes ((tuple2!1712 0))(
  ( (tuple2!1713 (_1!867 (_ BitVec 64)) (_2!867 B!908)) )
))
(declare-datatypes ((List!1257 0))(
  ( (Nil!1254) (Cons!1253 (h!1833 tuple2!1712) (t!4285 List!1257)) )
))
(declare-datatypes ((ListLongMap!1199 0))(
  ( (ListLongMap!1200 (toList!615 List!1257)) )
))
(declare-fun lm!267 () ListLongMap!1199)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!582 (ListLongMap!1199 (_ BitVec 64)) Bool)

(assert (=> start!7456 (= res!27802 (not (contains!582 lm!267 key!657)))))

(assert (=> start!7456 e!30671))

(declare-fun e!30672 () Bool)

(declare-fun inv!2212 (ListLongMap!1199) Bool)

(assert (=> start!7456 (and (inv!2212 lm!267) e!30672)))

(assert (=> start!7456 true))

(declare-fun b!47836 () Bool)

(assert (=> b!47836 (= e!30671 false)))

(declare-fun b!47837 () Bool)

(declare-fun tp!6302 () Bool)

(assert (=> b!47837 (= e!30672 tp!6302)))

(assert (= (and start!7456 res!27802) b!47836))

(assert (= start!7456 b!47837))

(declare-fun m!41801 () Bool)

(assert (=> start!7456 m!41801))

(declare-fun m!41803 () Bool)

(assert (=> start!7456 m!41803))

(check-sat (not start!7456) (not b!47837))
(check-sat)
