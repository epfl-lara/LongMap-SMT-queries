; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5168 () Bool)

(assert start!5168)

(declare-fun res!22821 () Bool)

(declare-fun e!23983 () Bool)

(assert (=> start!5168 (=> (not res!22821) (not e!23983))))

(declare-datatypes ((B!774 0))(
  ( (B!775 (val!887 Int)) )
))
(declare-fun b!99 () B!774)

(declare-datatypes ((tuple2!1434 0))(
  ( (tuple2!1435 (_1!728 (_ BitVec 64)) (_2!728 B!774)) )
))
(declare-datatypes ((List!997 0))(
  ( (Nil!994) (Cons!993 (h!1561 tuple2!1434) (t!3830 List!997)) )
))
(declare-datatypes ((ListLongMap!1011 0))(
  ( (ListLongMap!1012 (toList!521 List!997)) )
))
(declare-fun lm!264 () ListLongMap!1011)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!472 (List!997 tuple2!1434) Bool)

(assert (=> start!5168 (= res!22821 (contains!472 (toList!521 lm!264) (tuple2!1435 a!526 b!99)))))

(assert (=> start!5168 e!23983))

(declare-fun e!23982 () Bool)

(declare-fun inv!1677 (ListLongMap!1011) Bool)

(assert (=> start!5168 (and (inv!1677 lm!264) e!23982)))

(assert (=> start!5168 true))

(declare-fun tp_is_empty!1697 () Bool)

(assert (=> start!5168 tp_is_empty!1697))

(declare-fun b!37824 () Bool)

(assert (=> b!37824 (= e!23983 (not true))))

(declare-fun containsKey!59 (List!997 (_ BitVec 64)) Bool)

(assert (=> b!37824 (containsKey!59 (toList!521 lm!264) a!526)))

(declare-datatypes ((Unit!873 0))(
  ( (Unit!874) )
))
(declare-fun lt!13925 () Unit!873)

(declare-fun lemmaContainsTupleThenContainsKey!3 (List!997 (_ BitVec 64) B!774) Unit!873)

(assert (=> b!37824 (= lt!13925 (lemmaContainsTupleThenContainsKey!3 (toList!521 lm!264) a!526 b!99))))

(declare-fun b!37825 () Bool)

(declare-fun tp!5603 () Bool)

(assert (=> b!37825 (= e!23982 tp!5603)))

(assert (= (and start!5168 res!22821) b!37824))

(assert (= start!5168 b!37825))

(declare-fun m!30551 () Bool)

(assert (=> start!5168 m!30551))

(declare-fun m!30553 () Bool)

(assert (=> start!5168 m!30553))

(declare-fun m!30555 () Bool)

(assert (=> b!37824 m!30555))

(declare-fun m!30557 () Bool)

(assert (=> b!37824 m!30557))

(push 1)

(assert (not b!37824))

(assert (not start!5168))

(assert (not b!37825))

(assert tp_is_empty!1697)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

