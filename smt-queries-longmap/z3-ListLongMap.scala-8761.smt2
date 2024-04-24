; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106614 () Bool)

(assert start!106614)

(assert (=> start!106614 false))

(declare-fun e!721419 () Bool)

(assert (=> start!106614 e!721419))

(assert (=> start!106614 true))

(declare-fun b!1266625 () Bool)

(declare-fun tp_is_empty!32491 () Bool)

(declare-fun tp!96311 () Bool)

(assert (=> b!1266625 (= e!721419 (and tp_is_empty!32491 tp!96311))))

(declare-datatypes ((B!1958 0))(
  ( (B!1959 (val!16314 Int)) )
))
(declare-datatypes ((tuple2!21156 0))(
  ( (tuple2!21157 (_1!10589 (_ BitVec 64)) (_2!10589 B!1958)) )
))
(declare-datatypes ((List!28342 0))(
  ( (Nil!28339) (Cons!28338 (h!29556 tuple2!21156) (t!41855 List!28342)) )
))
(declare-fun l!706 () List!28342)

(get-info :version)

(assert (= (and start!106614 ((_ is Cons!28338) l!706)) b!1266625))

(check-sat (not b!1266625) tp_is_empty!32491)
(check-sat)
