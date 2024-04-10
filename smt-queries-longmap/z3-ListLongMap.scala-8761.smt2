; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106392 () Bool)

(assert start!106392)

(assert (=> start!106392 false))

(declare-fun e!720575 () Bool)

(assert (=> start!106392 e!720575))

(assert (=> start!106392 true))

(declare-fun b!1265323 () Bool)

(declare-fun tp_is_empty!32493 () Bool)

(declare-fun tp!96314 () Bool)

(assert (=> b!1265323 (= e!720575 (and tp_is_empty!32493 tp!96314))))

(declare-datatypes ((B!1960 0))(
  ( (B!1961 (val!16315 Int)) )
))
(declare-datatypes ((tuple2!21148 0))(
  ( (tuple2!21149 (_1!10585 (_ BitVec 64)) (_2!10585 B!1960)) )
))
(declare-datatypes ((List!28307 0))(
  ( (Nil!28304) (Cons!28303 (h!29512 tuple2!21148) (t!41828 List!28307)) )
))
(declare-fun l!706 () List!28307)

(get-info :version)

(assert (= (and start!106392 ((_ is Cons!28303) l!706)) b!1265323))

(check-sat (not b!1265323) tp_is_empty!32493)
(check-sat)
