; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7452 () Bool)

(assert start!7452)

(declare-fun res!27830 () Bool)

(declare-fun e!30714 () Bool)

(assert (=> start!7452 (=> (not res!27830) (not e!30714))))

(declare-datatypes ((B!910 0))(
  ( (B!911 (val!1075 Int)) )
))
(declare-datatypes ((tuple2!1732 0))(
  ( (tuple2!1733 (_1!877 (_ BitVec 64)) (_2!877 B!910)) )
))
(declare-datatypes ((List!1272 0))(
  ( (Nil!1269) (Cons!1268 (h!1848 tuple2!1732) (t!4300 List!1272)) )
))
(declare-datatypes ((ListLongMap!1225 0))(
  ( (ListLongMap!1226 (toList!628 List!1272)) )
))
(declare-fun lm!267 () ListLongMap!1225)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!592 (ListLongMap!1225 (_ BitVec 64)) Bool)

(assert (=> start!7452 (= res!27830 (not (contains!592 lm!267 key!657)))))

(assert (=> start!7452 e!30714))

(declare-fun e!30715 () Bool)

(declare-fun inv!2213 (ListLongMap!1225) Bool)

(assert (=> start!7452 (and (inv!2213 lm!267) e!30715)))

(assert (=> start!7452 true))

(declare-fun b!47899 () Bool)

(assert (=> b!47899 (= e!30714 false)))

(declare-fun b!47900 () Bool)

(declare-fun tp!6305 () Bool)

(assert (=> b!47900 (= e!30715 tp!6305)))

(assert (= (and start!7452 res!27830) b!47899))

(assert (= start!7452 b!47900))

(declare-fun m!41929 () Bool)

(assert (=> start!7452 m!41929))

(declare-fun m!41931 () Bool)

(assert (=> start!7452 m!41931))

(check-sat (not start!7452) (not b!47900))
(check-sat)
