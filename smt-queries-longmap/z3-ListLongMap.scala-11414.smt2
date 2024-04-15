; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132942 () Bool)

(assert start!132942)

(declare-fun res!1064953 () Bool)

(declare-fun e!867133 () Bool)

(assert (=> start!132942 (=> (not res!1064953) (not e!867133))))

(declare-datatypes ((B!2360 0))(
  ( (B!2361 (val!19266 Int)) )
))
(declare-datatypes ((tuple2!24980 0))(
  ( (tuple2!24981 (_1!12501 (_ BitVec 64)) (_2!12501 B!2360)) )
))
(declare-datatypes ((List!36345 0))(
  ( (Nil!36342) (Cons!36341 (h!37788 tuple2!24980) (t!51064 List!36345)) )
))
(declare-datatypes ((ListLongMap!22481 0))(
  ( (ListLongMap!22482 (toList!11256 List!36345)) )
))
(declare-fun lm!250 () ListLongMap!22481)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10146 (ListLongMap!22481 (_ BitVec 64)) Bool)

(assert (=> start!132942 (= res!1064953 (contains!10146 lm!250 a0!50))))

(assert (=> start!132942 e!867133))

(declare-fun e!867134 () Bool)

(declare-fun inv!57449 (ListLongMap!22481) Bool)

(assert (=> start!132942 (and (inv!57449 lm!250) e!867134)))

(assert (=> start!132942 true))

(declare-fun b!1556784 () Bool)

(assert (=> b!1556784 (= e!867133 false)))

(declare-fun b!1556785 () Bool)

(declare-fun tp!112468 () Bool)

(assert (=> b!1556785 (= e!867134 tp!112468)))

(assert (= (and start!132942 res!1064953) b!1556784))

(assert (= start!132942 b!1556785))

(declare-fun m!1433459 () Bool)

(assert (=> start!132942 m!1433459))

(declare-fun m!1433461 () Bool)

(assert (=> start!132942 m!1433461))

(check-sat (not start!132942) (not b!1556785))
(check-sat)
