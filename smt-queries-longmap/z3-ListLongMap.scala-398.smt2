; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7446 () Bool)

(assert start!7446)

(declare-fun res!27821 () Bool)

(declare-fun e!30696 () Bool)

(assert (=> start!7446 (=> (not res!27821) (not e!30696))))

(declare-datatypes ((B!904 0))(
  ( (B!905 (val!1072 Int)) )
))
(declare-datatypes ((tuple2!1726 0))(
  ( (tuple2!1727 (_1!874 (_ BitVec 64)) (_2!874 B!904)) )
))
(declare-datatypes ((List!1269 0))(
  ( (Nil!1266) (Cons!1265 (h!1845 tuple2!1726) (t!4297 List!1269)) )
))
(declare-datatypes ((ListLongMap!1219 0))(
  ( (ListLongMap!1220 (toList!625 List!1269)) )
))
(declare-fun lm!267 () ListLongMap!1219)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!589 (ListLongMap!1219 (_ BitVec 64)) Bool)

(assert (=> start!7446 (= res!27821 (not (contains!589 lm!267 key!657)))))

(assert (=> start!7446 e!30696))

(declare-fun e!30697 () Bool)

(declare-fun inv!2205 (ListLongMap!1219) Bool)

(assert (=> start!7446 (and (inv!2205 lm!267) e!30697)))

(assert (=> start!7446 true))

(declare-fun b!47881 () Bool)

(assert (=> b!47881 (= e!30696 false)))

(declare-fun b!47882 () Bool)

(declare-fun tp!6296 () Bool)

(assert (=> b!47882 (= e!30697 tp!6296)))

(assert (= (and start!7446 res!27821) b!47881))

(assert (= start!7446 b!47882))

(declare-fun m!41917 () Bool)

(assert (=> start!7446 m!41917))

(declare-fun m!41919 () Bool)

(assert (=> start!7446 m!41919))

(check-sat (not start!7446) (not b!47882))
