; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106728 () Bool)

(assert start!106728)

(assert (=> start!106728 false))

(declare-fun e!721832 () Bool)

(assert (=> start!106728 e!721832))

(assert (=> start!106728 true))

(declare-fun b!1267135 () Bool)

(declare-fun tp_is_empty!32571 () Bool)

(declare-fun tp!96545 () Bool)

(assert (=> b!1267135 (= e!721832 (and tp_is_empty!32571 tp!96545))))

(declare-datatypes ((B!2050 0))(
  ( (B!2051 (val!16360 Int)) )
))
(declare-datatypes ((tuple2!21238 0))(
  ( (tuple2!21239 (_1!10630 (_ BitVec 64)) (_2!10630 B!2050)) )
))
(declare-datatypes ((List!28352 0))(
  ( (Nil!28349) (Cons!28348 (h!29557 tuple2!21238) (t!41879 List!28352)) )
))
(declare-fun l!874 () List!28352)

(get-info :version)

(assert (= (and start!106728 ((_ is Cons!28348) l!874)) b!1267135))

(check-sat (not b!1267135) tp_is_empty!32571)
(check-sat)
