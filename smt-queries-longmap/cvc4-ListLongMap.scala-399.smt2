; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7454 () Bool)

(assert start!7454)

(declare-fun res!27833 () Bool)

(declare-fun e!30720 () Bool)

(assert (=> start!7454 (=> (not res!27833) (not e!30720))))

(declare-datatypes ((B!912 0))(
  ( (B!913 (val!1076 Int)) )
))
(declare-datatypes ((tuple2!1734 0))(
  ( (tuple2!1735 (_1!878 (_ BitVec 64)) (_2!878 B!912)) )
))
(declare-datatypes ((List!1273 0))(
  ( (Nil!1270) (Cons!1269 (h!1849 tuple2!1734) (t!4301 List!1273)) )
))
(declare-datatypes ((ListLongMap!1227 0))(
  ( (ListLongMap!1228 (toList!629 List!1273)) )
))
(declare-fun lm!267 () ListLongMap!1227)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!593 (ListLongMap!1227 (_ BitVec 64)) Bool)

(assert (=> start!7454 (= res!27833 (not (contains!593 lm!267 key!657)))))

(assert (=> start!7454 e!30720))

(declare-fun e!30721 () Bool)

(declare-fun inv!2214 (ListLongMap!1227) Bool)

(assert (=> start!7454 (and (inv!2214 lm!267) e!30721)))

(assert (=> start!7454 true))

(declare-fun b!47905 () Bool)

(assert (=> b!47905 (= e!30720 false)))

(declare-fun b!47906 () Bool)

(declare-fun tp!6308 () Bool)

(assert (=> b!47906 (= e!30721 tp!6308)))

(assert (= (and start!7454 res!27833) b!47905))

(assert (= start!7454 b!47906))

(declare-fun m!41933 () Bool)

(assert (=> start!7454 m!41933))

(declare-fun m!41935 () Bool)

(assert (=> start!7454 m!41935))

(push 1)

(assert (not start!7454))

(assert (not b!47906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

