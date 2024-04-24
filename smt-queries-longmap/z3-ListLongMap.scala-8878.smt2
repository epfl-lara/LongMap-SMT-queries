; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108016 () Bool)

(assert start!108016)

(assert (=> start!108016 false))

(declare-fun e!728279 () Bool)

(assert (=> start!108016 e!728279))

(assert (=> start!108016 true))

(declare-fun b!1275939 () Bool)

(declare-fun tp_is_empty!33181 () Bool)

(declare-fun tp!97985 () Bool)

(assert (=> b!1275939 (= e!728279 (and tp_is_empty!33181 tp!97985))))

(declare-datatypes ((B!2138 0))(
  ( (B!2139 (val!16665 Int)) )
))
(declare-datatypes ((tuple2!21420 0))(
  ( (tuple2!21421 (_1!10721 (_ BitVec 64)) (_2!10721 B!2138)) )
))
(declare-datatypes ((List!28619 0))(
  ( (Nil!28616) (Cons!28615 (h!29833 tuple2!21420) (t!42144 List!28619)) )
))
(declare-fun l!595 () List!28619)

(get-info :version)

(assert (= (and start!108016 ((_ is Cons!28615) l!595)) b!1275939))

(check-sat (not b!1275939) tp_is_empty!33181)
(check-sat)
