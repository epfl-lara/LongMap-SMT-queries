; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106554 () Bool)

(assert start!106554)

(assert (=> start!106554 false))

(declare-fun e!721206 () Bool)

(assert (=> start!106554 e!721206))

(declare-fun b!1266256 () Bool)

(declare-fun tp_is_empty!32461 () Bool)

(declare-fun tp!96257 () Bool)

(assert (=> b!1266256 (= e!721206 (and tp_is_empty!32461 tp!96257))))

(declare-datatypes ((B!1928 0))(
  ( (B!1929 (val!16299 Int)) )
))
(declare-datatypes ((tuple2!21126 0))(
  ( (tuple2!21127 (_1!10574 (_ BitVec 64)) (_2!10574 B!1928)) )
))
(declare-datatypes ((List!28327 0))(
  ( (Nil!28324) (Cons!28323 (h!29541 tuple2!21126) (t!41840 List!28327)) )
))
(declare-fun l!706 () List!28327)

(get-info :version)

(assert (= (and start!106554 ((_ is Cons!28323) l!706)) b!1266256))

(check-sat (not b!1266256) tp_is_empty!32461)
(check-sat)
