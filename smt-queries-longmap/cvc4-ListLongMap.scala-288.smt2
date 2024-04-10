; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4732 () Bool)

(assert start!4732)

(declare-fun b_free!1319 () Bool)

(declare-fun b_next!1319 () Bool)

(assert (=> start!4732 (= b_free!1319 (not b_next!1319))))

(declare-fun tp!5419 () Bool)

(declare-fun b_and!2171 () Bool)

(assert (=> start!4732 (= tp!5419 b_and!2171)))

(declare-fun res!22182 () Bool)

(declare-fun e!23139 () Bool)

(assert (=> start!4732 (=> (not res!22182) (not e!23139))))

(declare-datatypes ((B!726 0))(
  ( (B!727 (val!863 Int)) )
))
(declare-datatypes ((tuple2!1386 0))(
  ( (tuple2!1387 (_1!704 (_ BitVec 64)) (_2!704 B!726)) )
))
(declare-datatypes ((List!967 0))(
  ( (Nil!964) (Cons!963 (h!1531 tuple2!1386) (t!3698 List!967)) )
))
(declare-datatypes ((ListLongMap!963 0))(
  ( (ListLongMap!964 (toList!497 List!967)) )
))
(declare-fun lm!252 () ListLongMap!963)

(declare-fun p!304 () Int)

(declare-fun forall!163 (List!967 Int) Bool)

(assert (=> start!4732 (= res!22182 (forall!163 (toList!497 lm!252) p!304))))

(assert (=> start!4732 e!23139))

(declare-fun e!23140 () Bool)

(declare-fun inv!1608 (ListLongMap!963) Bool)

(assert (=> start!4732 (and (inv!1608 lm!252) e!23140)))

(assert (=> start!4732 tp!5419))

(assert (=> start!4732 true))

(declare-fun b!36627 () Bool)

(assert (=> b!36627 (= e!23139 false)))

(declare-fun lt!13545 () Bool)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!448 (ListLongMap!963 (_ BitVec 64)) Bool)

(assert (=> b!36627 (= lt!13545 (contains!448 lm!252 k!388))))

(declare-fun b!36628 () Bool)

(declare-fun tp!5420 () Bool)

(assert (=> b!36628 (= e!23140 tp!5420)))

(assert (= (and start!4732 res!22182) b!36627))

(assert (= start!4732 b!36628))

(declare-fun m!29523 () Bool)

(assert (=> start!4732 m!29523))

(declare-fun m!29525 () Bool)

(assert (=> start!4732 m!29525))

(declare-fun m!29527 () Bool)

(assert (=> b!36627 m!29527))

(push 1)

(assert (not start!4732))

(assert (not b_next!1319))

(assert (not b!36627))

(assert (not b!36628))

(assert b_and!2171)

(check-sat)

(pop 1)

