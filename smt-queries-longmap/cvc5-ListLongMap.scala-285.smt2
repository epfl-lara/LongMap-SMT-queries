; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4710 () Bool)

(assert start!4710)

(declare-fun b_free!1297 () Bool)

(declare-fun b_next!1297 () Bool)

(assert (=> start!4710 (= b_free!1297 (not b_next!1297))))

(declare-fun tp!5354 () Bool)

(declare-fun b_and!2143 () Bool)

(assert (=> start!4710 (= tp!5354 b_and!2143)))

(declare-fun res!22068 () Bool)

(declare-fun e!23055 () Bool)

(assert (=> start!4710 (=> (not res!22068) (not e!23055))))

(declare-datatypes ((B!704 0))(
  ( (B!705 (val!852 Int)) )
))
(declare-datatypes ((tuple2!1364 0))(
  ( (tuple2!1365 (_1!693 (_ BitVec 64)) (_2!693 B!704)) )
))
(declare-datatypes ((List!956 0))(
  ( (Nil!953) (Cons!952 (h!1520 tuple2!1364) (t!3681 List!956)) )
))
(declare-datatypes ((ListLongMap!941 0))(
  ( (ListLongMap!942 (toList!486 List!956)) )
))
(declare-fun lm!252 () ListLongMap!941)

(declare-fun p!304 () Int)

(declare-fun forall!152 (List!956 Int) Bool)

(assert (=> start!4710 (= res!22068 (forall!152 (toList!486 lm!252) p!304))))

(assert (=> start!4710 e!23055))

(declare-fun e!23056 () Bool)

(declare-fun inv!1582 (ListLongMap!941) Bool)

(assert (=> start!4710 (and (inv!1582 lm!252) e!23056)))

(assert (=> start!4710 tp!5354))

(assert (=> start!4710 true))

(declare-fun b!36480 () Bool)

(assert (=> b!36480 (= e!23055 false)))

(declare-fun lt!13494 () Bool)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!437 (ListLongMap!941 (_ BitVec 64)) Bool)

(assert (=> b!36480 (= lt!13494 (contains!437 lm!252 k!388))))

(declare-fun b!36481 () Bool)

(declare-fun tp!5353 () Bool)

(assert (=> b!36481 (= e!23056 tp!5353)))

(assert (= (and start!4710 res!22068) b!36480))

(assert (= start!4710 b!36481))

(declare-fun m!29379 () Bool)

(assert (=> start!4710 m!29379))

(declare-fun m!29381 () Bool)

(assert (=> start!4710 m!29381))

(declare-fun m!29383 () Bool)

(assert (=> b!36480 m!29383))

(push 1)

(assert (not b!36480))

(assert (not start!4710))

(assert b_and!2143)

(assert (not b!36481))

(assert (not b_next!1297))

(check-sat)

(pop 1)

