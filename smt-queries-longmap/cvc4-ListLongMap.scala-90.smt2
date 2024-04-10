; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1306 () Bool)

(assert start!1306)

(declare-fun b_free!407 () Bool)

(declare-fun b_next!407 () Bool)

(assert (=> start!1306 (= b_free!407 (not b_next!407))))

(declare-fun tp!1626 () Bool)

(declare-fun b_and!589 () Bool)

(assert (=> start!1306 (= tp!1626 b_and!589)))

(assert (=> start!1306 false))

(declare-datatypes ((B!348 0))(
  ( (B!349 (val!269 Int)) )
))
(declare-datatypes ((tuple2!338 0))(
  ( (tuple2!339 (_1!169 (_ BitVec 64)) (_2!169 B!348)) )
))
(declare-datatypes ((List!321 0))(
  ( (Nil!318) (Cons!317 (h!883 tuple2!338) (t!2492 List!321)) )
))
(declare-datatypes ((ListLongMap!319 0))(
  ( (ListLongMap!320 (toList!175 List!321)) )
))
(declare-fun lm!227 () ListLongMap!319)

(declare-fun e!6200 () Bool)

(declare-fun inv!504 (ListLongMap!319) Bool)

(assert (=> start!1306 (and (inv!504 lm!227) e!6200)))

(assert (=> start!1306 tp!1626))

(declare-fun e!6199 () Bool)

(assert (=> start!1306 e!6199))

(declare-fun b!10645 () Bool)

(declare-fun tp!1627 () Bool)

(assert (=> b!10645 (= e!6200 tp!1627)))

(declare-fun b!10646 () Bool)

(declare-fun tp_is_empty!521 () Bool)

(declare-fun tp!1628 () Bool)

(assert (=> b!10646 (= e!6199 (and tp_is_empty!521 tp!1628))))

(assert (= start!1306 b!10645))

(declare-fun kvs!4 () List!321)

(assert (= (and start!1306 (is-Cons!317 kvs!4)) b!10646))

(declare-fun m!6855 () Bool)

(assert (=> start!1306 m!6855))

(push 1)

(assert tp_is_empty!521)

(assert (not start!1306))

(assert (not b!10646))

(assert b_and!589)

(assert (not b_next!407))

(assert (not b!10645))

(check-sat)

(pop 1)

