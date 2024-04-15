; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107792 () Bool)

(assert start!107792)

(assert (=> start!107792 false))

(declare-fun e!727403 () Bool)

(assert (=> start!107792 e!727403))

(assert (=> start!107792 true))

(declare-fun b!1274570 () Bool)

(declare-fun tp_is_empty!33181 () Bool)

(declare-fun tp!97986 () Bool)

(assert (=> b!1274570 (= e!727403 (and tp_is_empty!33181 tp!97986))))

(declare-datatypes ((B!2138 0))(
  ( (B!2139 (val!16665 Int)) )
))
(declare-datatypes ((tuple2!21488 0))(
  ( (tuple2!21489 (_1!10755 (_ BitVec 64)) (_2!10755 B!2138)) )
))
(declare-datatypes ((List!28664 0))(
  ( (Nil!28661) (Cons!28660 (h!29869 tuple2!21488) (t!42189 List!28664)) )
))
(declare-fun l!595 () List!28664)

(get-info :version)

(assert (= (and start!107792 ((_ is Cons!28660) l!595)) b!1274570))

(check-sat (not b!1274570) tp_is_empty!33181)
(check-sat)
