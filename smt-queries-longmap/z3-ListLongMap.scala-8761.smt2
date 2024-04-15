; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106386 () Bool)

(assert start!106386)

(assert (=> start!106386 false))

(declare-fun e!720527 () Bool)

(assert (=> start!106386 e!720527))

(assert (=> start!106386 true))

(declare-fun b!1265238 () Bool)

(declare-fun tp_is_empty!32491 () Bool)

(declare-fun tp!96311 () Bool)

(assert (=> b!1265238 (= e!720527 (and tp_is_empty!32491 tp!96311))))

(declare-datatypes ((B!1958 0))(
  ( (B!1959 (val!16314 Int)) )
))
(declare-datatypes ((tuple2!21228 0))(
  ( (tuple2!21229 (_1!10625 (_ BitVec 64)) (_2!10625 B!1958)) )
))
(declare-datatypes ((List!28390 0))(
  ( (Nil!28387) (Cons!28386 (h!29595 tuple2!21228) (t!41902 List!28390)) )
))
(declare-fun l!706 () List!28390)

(get-info :version)

(assert (= (and start!106386 ((_ is Cons!28386) l!706)) b!1265238))

(check-sat (not b!1265238) tp_is_empty!32491)
(check-sat)
