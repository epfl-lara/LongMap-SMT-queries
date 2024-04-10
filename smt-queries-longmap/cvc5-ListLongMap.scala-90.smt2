; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1302 () Bool)

(assert start!1302)

(declare-fun b_free!403 () Bool)

(declare-fun b_next!403 () Bool)

(assert (=> start!1302 (= b_free!403 (not b_next!403))))

(declare-fun tp!1610 () Bool)

(declare-fun b_and!585 () Bool)

(assert (=> start!1302 (= tp!1610 b_and!585)))

(assert (=> start!1302 false))

(declare-datatypes ((B!344 0))(
  ( (B!345 (val!267 Int)) )
))
(declare-datatypes ((tuple2!334 0))(
  ( (tuple2!335 (_1!167 (_ BitVec 64)) (_2!167 B!344)) )
))
(declare-datatypes ((List!319 0))(
  ( (Nil!316) (Cons!315 (h!881 tuple2!334) (t!2490 List!319)) )
))
(declare-datatypes ((ListLongMap!315 0))(
  ( (ListLongMap!316 (toList!173 List!319)) )
))
(declare-fun lm!227 () ListLongMap!315)

(declare-fun e!6187 () Bool)

(declare-fun inv!502 (ListLongMap!315) Bool)

(assert (=> start!1302 (and (inv!502 lm!227) e!6187)))

(assert (=> start!1302 tp!1610))

(declare-fun e!6188 () Bool)

(assert (=> start!1302 e!6188))

(declare-fun b!10633 () Bool)

(declare-fun tp!1608 () Bool)

(assert (=> b!10633 (= e!6187 tp!1608)))

(declare-fun b!10634 () Bool)

(declare-fun tp_is_empty!517 () Bool)

(declare-fun tp!1609 () Bool)

(assert (=> b!10634 (= e!6188 (and tp_is_empty!517 tp!1609))))

(assert (= start!1302 b!10633))

(declare-fun kvs!4 () List!319)

(assert (= (and start!1302 (is-Cons!315 kvs!4)) b!10634))

(declare-fun m!6851 () Bool)

(assert (=> start!1302 m!6851))

(push 1)

(assert (not b_next!403))

(assert (not b!10633))

(assert tp_is_empty!517)

(assert b_and!585)

(assert (not start!1302))

(assert (not b!10634))

(check-sat)

