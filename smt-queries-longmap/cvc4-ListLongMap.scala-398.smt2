; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7448 () Bool)

(assert start!7448)

(declare-fun res!27824 () Bool)

(declare-fun e!30702 () Bool)

(assert (=> start!7448 (=> (not res!27824) (not e!30702))))

(declare-datatypes ((B!906 0))(
  ( (B!907 (val!1073 Int)) )
))
(declare-datatypes ((tuple2!1728 0))(
  ( (tuple2!1729 (_1!875 (_ BitVec 64)) (_2!875 B!906)) )
))
(declare-datatypes ((List!1270 0))(
  ( (Nil!1267) (Cons!1266 (h!1846 tuple2!1728) (t!4298 List!1270)) )
))
(declare-datatypes ((ListLongMap!1221 0))(
  ( (ListLongMap!1222 (toList!626 List!1270)) )
))
(declare-fun lm!267 () ListLongMap!1221)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!590 (ListLongMap!1221 (_ BitVec 64)) Bool)

(assert (=> start!7448 (= res!27824 (not (contains!590 lm!267 key!657)))))

(assert (=> start!7448 e!30702))

(declare-fun e!30703 () Bool)

(declare-fun inv!2206 (ListLongMap!1221) Bool)

(assert (=> start!7448 (and (inv!2206 lm!267) e!30703)))

(assert (=> start!7448 true))

(declare-fun b!47887 () Bool)

(assert (=> b!47887 (= e!30702 false)))

(declare-fun b!47888 () Bool)

(declare-fun tp!6299 () Bool)

(assert (=> b!47888 (= e!30703 tp!6299)))

(assert (= (and start!7448 res!27824) b!47887))

(assert (= start!7448 b!47888))

(declare-fun m!41921 () Bool)

(assert (=> start!7448 m!41921))

(declare-fun m!41923 () Bool)

(assert (=> start!7448 m!41923))

(push 1)

(assert (not start!7448))

(assert (not b!47888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

