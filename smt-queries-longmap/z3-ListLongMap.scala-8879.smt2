; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108022 () Bool)

(assert start!108022)

(assert (=> start!108022 false))

(declare-fun e!728288 () Bool)

(assert (=> start!108022 e!728288))

(assert (=> start!108022 true))

(declare-fun b!1275948 () Bool)

(declare-fun tp_is_empty!33187 () Bool)

(declare-fun tp!97994 () Bool)

(assert (=> b!1275948 (= e!728288 (and tp_is_empty!33187 tp!97994))))

(declare-datatypes ((B!2144 0))(
  ( (B!2145 (val!16668 Int)) )
))
(declare-datatypes ((tuple2!21426 0))(
  ( (tuple2!21427 (_1!10724 (_ BitVec 64)) (_2!10724 B!2144)) )
))
(declare-datatypes ((List!28622 0))(
  ( (Nil!28619) (Cons!28618 (h!29836 tuple2!21426) (t!42147 List!28622)) )
))
(declare-fun l!595 () List!28622)

(get-info :version)

(assert (= (and start!108022 ((_ is Cons!28618) l!595)) b!1275948))

(check-sat (not b!1275948) tp_is_empty!33187)
(check-sat)
