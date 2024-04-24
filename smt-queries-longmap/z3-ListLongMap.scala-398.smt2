; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7450 () Bool)

(assert start!7450)

(declare-fun res!27793 () Bool)

(declare-fun e!30653 () Bool)

(assert (=> start!7450 (=> (not res!27793) (not e!30653))))

(declare-datatypes ((B!902 0))(
  ( (B!903 (val!1071 Int)) )
))
(declare-datatypes ((tuple2!1706 0))(
  ( (tuple2!1707 (_1!864 (_ BitVec 64)) (_2!864 B!902)) )
))
(declare-datatypes ((List!1254 0))(
  ( (Nil!1251) (Cons!1250 (h!1830 tuple2!1706) (t!4282 List!1254)) )
))
(declare-datatypes ((ListLongMap!1193 0))(
  ( (ListLongMap!1194 (toList!612 List!1254)) )
))
(declare-fun lm!267 () ListLongMap!1193)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!579 (ListLongMap!1193 (_ BitVec 64)) Bool)

(assert (=> start!7450 (= res!27793 (not (contains!579 lm!267 key!657)))))

(assert (=> start!7450 e!30653))

(declare-fun e!30654 () Bool)

(declare-fun inv!2204 (ListLongMap!1193) Bool)

(assert (=> start!7450 (and (inv!2204 lm!267) e!30654)))

(assert (=> start!7450 true))

(declare-fun b!47818 () Bool)

(assert (=> b!47818 (= e!30653 false)))

(declare-fun b!47819 () Bool)

(declare-fun tp!6293 () Bool)

(assert (=> b!47819 (= e!30654 tp!6293)))

(assert (= (and start!7450 res!27793) b!47818))

(assert (= start!7450 b!47819))

(declare-fun m!41789 () Bool)

(assert (=> start!7450 m!41789))

(declare-fun m!41791 () Bool)

(assert (=> start!7450 m!41791))

(check-sat (not start!7450) (not b!47819))
(check-sat)
