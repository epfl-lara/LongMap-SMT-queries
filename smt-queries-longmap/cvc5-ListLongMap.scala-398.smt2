; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7444 () Bool)

(assert start!7444)

(declare-fun res!27818 () Bool)

(declare-fun e!30690 () Bool)

(assert (=> start!7444 (=> (not res!27818) (not e!30690))))

(declare-datatypes ((B!902 0))(
  ( (B!903 (val!1071 Int)) )
))
(declare-datatypes ((tuple2!1724 0))(
  ( (tuple2!1725 (_1!873 (_ BitVec 64)) (_2!873 B!902)) )
))
(declare-datatypes ((List!1268 0))(
  ( (Nil!1265) (Cons!1264 (h!1844 tuple2!1724) (t!4296 List!1268)) )
))
(declare-datatypes ((ListLongMap!1217 0))(
  ( (ListLongMap!1218 (toList!624 List!1268)) )
))
(declare-fun lm!267 () ListLongMap!1217)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!588 (ListLongMap!1217 (_ BitVec 64)) Bool)

(assert (=> start!7444 (= res!27818 (not (contains!588 lm!267 key!657)))))

(assert (=> start!7444 e!30690))

(declare-fun e!30691 () Bool)

(declare-fun inv!2204 (ListLongMap!1217) Bool)

(assert (=> start!7444 (and (inv!2204 lm!267) e!30691)))

(assert (=> start!7444 true))

(declare-fun b!47875 () Bool)

(assert (=> b!47875 (= e!30690 false)))

(declare-fun b!47876 () Bool)

(declare-fun tp!6293 () Bool)

(assert (=> b!47876 (= e!30691 tp!6293)))

(assert (= (and start!7444 res!27818) b!47875))

(assert (= start!7444 b!47876))

(declare-fun m!41913 () Bool)

(assert (=> start!7444 m!41913))

(declare-fun m!41915 () Bool)

(assert (=> start!7444 m!41915))

(push 1)

(assert (not start!7444))

(assert (not b!47876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

