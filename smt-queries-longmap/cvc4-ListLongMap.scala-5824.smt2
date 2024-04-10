; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75128 () Bool)

(assert start!75128)

(assert (=> start!75128 false))

(declare-fun e!492876 () Bool)

(assert (=> start!75128 e!492876))

(declare-fun b!885598 () Bool)

(declare-fun tp_is_empty!17777 () Bool)

(declare-fun tp!54281 () Bool)

(assert (=> b!885598 (= e!492876 (and tp_is_empty!17777 tp!54281))))

(declare-datatypes ((B!1266 0))(
  ( (B!1267 (val!8939 Int)) )
))
(declare-datatypes ((tuple2!11872 0))(
  ( (tuple2!11873 (_1!5947 (_ BitVec 64)) (_2!5947 B!1266)) )
))
(declare-datatypes ((List!17655 0))(
  ( (Nil!17652) (Cons!17651 (h!18782 tuple2!11872) (t!24932 List!17655)) )
))
(declare-fun l!906 () List!17655)

(assert (= (and start!75128 (is-Cons!17651 l!906)) b!885598))

(push 1)

(assert (not b!885598))

(assert tp_is_empty!17777)

(check-sat)

