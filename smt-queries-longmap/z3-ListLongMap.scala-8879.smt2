; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107798 () Bool)

(assert start!107798)

(assert (=> start!107798 false))

(declare-fun e!727412 () Bool)

(assert (=> start!107798 e!727412))

(assert (=> start!107798 true))

(declare-fun b!1274579 () Bool)

(declare-fun tp_is_empty!33187 () Bool)

(declare-fun tp!97995 () Bool)

(assert (=> b!1274579 (= e!727412 (and tp_is_empty!33187 tp!97995))))

(declare-datatypes ((B!2144 0))(
  ( (B!2145 (val!16668 Int)) )
))
(declare-datatypes ((tuple2!21494 0))(
  ( (tuple2!21495 (_1!10758 (_ BitVec 64)) (_2!10758 B!2144)) )
))
(declare-datatypes ((List!28667 0))(
  ( (Nil!28664) (Cons!28663 (h!29872 tuple2!21494) (t!42192 List!28667)) )
))
(declare-fun l!595 () List!28667)

(get-info :version)

(assert (= (and start!107798 ((_ is Cons!28663) l!595)) b!1274579))

(check-sat (not b!1274579) tp_is_empty!33187)
(check-sat)
