; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7452 () Bool)

(assert start!7452)

(declare-fun res!27807 () Bool)

(declare-fun e!30665 () Bool)

(assert (=> start!7452 (=> (not res!27807) (not e!30665))))

(declare-datatypes ((B!908 0))(
  ( (B!909 (val!1074 Int)) )
))
(declare-datatypes ((tuple2!1734 0))(
  ( (tuple2!1735 (_1!878 (_ BitVec 64)) (_2!878 B!908)) )
))
(declare-datatypes ((List!1267 0))(
  ( (Nil!1264) (Cons!1263 (h!1843 tuple2!1734) (t!4294 List!1267)) )
))
(declare-datatypes ((ListLongMap!1215 0))(
  ( (ListLongMap!1216 (toList!623 List!1267)) )
))
(declare-fun lm!267 () ListLongMap!1215)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!588 (ListLongMap!1215 (_ BitVec 64)) Bool)

(assert (=> start!7452 (= res!27807 (not (contains!588 lm!267 key!657)))))

(assert (=> start!7452 e!30665))

(declare-fun e!30666 () Bool)

(declare-fun inv!2212 (ListLongMap!1215) Bool)

(assert (=> start!7452 (and (inv!2212 lm!267) e!30666)))

(assert (=> start!7452 true))

(declare-fun b!47827 () Bool)

(assert (=> b!47827 (= e!30665 false)))

(declare-fun b!47828 () Bool)

(declare-fun tp!6302 () Bool)

(assert (=> b!47828 (= e!30666 tp!6302)))

(assert (= (and start!7452 res!27807) b!47827))

(assert (= start!7452 b!47828))

(declare-fun m!41843 () Bool)

(assert (=> start!7452 m!41843))

(declare-fun m!41845 () Bool)

(assert (=> start!7452 m!41845))

(check-sat (not start!7452) (not b!47828))
(check-sat)
