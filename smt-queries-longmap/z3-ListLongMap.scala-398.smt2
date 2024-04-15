; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7446 () Bool)

(assert start!7446)

(declare-fun res!27798 () Bool)

(declare-fun e!30647 () Bool)

(assert (=> start!7446 (=> (not res!27798) (not e!30647))))

(declare-datatypes ((B!902 0))(
  ( (B!903 (val!1071 Int)) )
))
(declare-datatypes ((tuple2!1728 0))(
  ( (tuple2!1729 (_1!875 (_ BitVec 64)) (_2!875 B!902)) )
))
(declare-datatypes ((List!1264 0))(
  ( (Nil!1261) (Cons!1260 (h!1840 tuple2!1728) (t!4291 List!1264)) )
))
(declare-datatypes ((ListLongMap!1209 0))(
  ( (ListLongMap!1210 (toList!620 List!1264)) )
))
(declare-fun lm!267 () ListLongMap!1209)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!585 (ListLongMap!1209 (_ BitVec 64)) Bool)

(assert (=> start!7446 (= res!27798 (not (contains!585 lm!267 key!657)))))

(assert (=> start!7446 e!30647))

(declare-fun e!30648 () Bool)

(declare-fun inv!2204 (ListLongMap!1209) Bool)

(assert (=> start!7446 (and (inv!2204 lm!267) e!30648)))

(assert (=> start!7446 true))

(declare-fun b!47809 () Bool)

(assert (=> b!47809 (= e!30647 false)))

(declare-fun b!47810 () Bool)

(declare-fun tp!6293 () Bool)

(assert (=> b!47810 (= e!30648 tp!6293)))

(assert (= (and start!7446 res!27798) b!47809))

(assert (= start!7446 b!47810))

(declare-fun m!41831 () Bool)

(assert (=> start!7446 m!41831))

(declare-fun m!41833 () Bool)

(assert (=> start!7446 m!41833))

(check-sat (not start!7446) (not b!47810))
(check-sat)
