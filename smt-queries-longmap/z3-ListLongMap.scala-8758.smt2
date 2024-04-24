; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106566 () Bool)

(assert start!106566)

(assert (=> start!106566 false))

(declare-fun e!721224 () Bool)

(assert (=> start!106566 e!721224))

(assert (=> start!106566 true))

(declare-fun b!1266274 () Bool)

(declare-fun tp_is_empty!32473 () Bool)

(declare-fun tp!96275 () Bool)

(assert (=> b!1266274 (= e!721224 (and tp_is_empty!32473 tp!96275))))

(declare-datatypes ((B!1940 0))(
  ( (B!1941 (val!16305 Int)) )
))
(declare-datatypes ((tuple2!21138 0))(
  ( (tuple2!21139 (_1!10580 (_ BitVec 64)) (_2!10580 B!1940)) )
))
(declare-datatypes ((List!28333 0))(
  ( (Nil!28330) (Cons!28329 (h!29547 tuple2!21138) (t!41846 List!28333)) )
))
(declare-fun l!706 () List!28333)

(get-info :version)

(assert (= (and start!106566 ((_ is Cons!28329) l!706)) b!1266274))

(check-sat (not b!1266274) tp_is_empty!32473)
(check-sat)
