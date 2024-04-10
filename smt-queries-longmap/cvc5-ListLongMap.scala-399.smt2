; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7450 () Bool)

(assert start!7450)

(declare-fun res!27827 () Bool)

(declare-fun e!30708 () Bool)

(assert (=> start!7450 (=> (not res!27827) (not e!30708))))

(declare-datatypes ((B!908 0))(
  ( (B!909 (val!1074 Int)) )
))
(declare-datatypes ((tuple2!1730 0))(
  ( (tuple2!1731 (_1!876 (_ BitVec 64)) (_2!876 B!908)) )
))
(declare-datatypes ((List!1271 0))(
  ( (Nil!1268) (Cons!1267 (h!1847 tuple2!1730) (t!4299 List!1271)) )
))
(declare-datatypes ((ListLongMap!1223 0))(
  ( (ListLongMap!1224 (toList!627 List!1271)) )
))
(declare-fun lm!267 () ListLongMap!1223)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!591 (ListLongMap!1223 (_ BitVec 64)) Bool)

(assert (=> start!7450 (= res!27827 (not (contains!591 lm!267 key!657)))))

(assert (=> start!7450 e!30708))

(declare-fun e!30709 () Bool)

(declare-fun inv!2212 (ListLongMap!1223) Bool)

(assert (=> start!7450 (and (inv!2212 lm!267) e!30709)))

(assert (=> start!7450 true))

(declare-fun b!47893 () Bool)

(assert (=> b!47893 (= e!30708 false)))

(declare-fun b!47894 () Bool)

(declare-fun tp!6302 () Bool)

(assert (=> b!47894 (= e!30709 tp!6302)))

(assert (= (and start!7450 res!27827) b!47893))

(assert (= start!7450 b!47894))

(declare-fun m!41925 () Bool)

(assert (=> start!7450 m!41925))

(declare-fun m!41927 () Bool)

(assert (=> start!7450 m!41927))

(push 1)

(assert (not start!7450))

(assert (not b!47894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

