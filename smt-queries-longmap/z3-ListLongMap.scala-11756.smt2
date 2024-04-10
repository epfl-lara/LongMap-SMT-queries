; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137940 () Bool)

(assert start!137940)

(assert (=> start!137940 false))

(declare-fun e!883975 () Bool)

(assert (=> start!137940 e!883975))

(assert (=> start!137940 true))

(declare-fun b!1583602 () Bool)

(declare-fun tp_is_empty!39411 () Bool)

(declare-fun tp!115006 () Bool)

(assert (=> b!1583602 (= e!883975 (and tp_is_empty!39411 tp!115006))))

(declare-datatypes ((B!2878 0))(
  ( (B!2879 (val!19801 Int)) )
))
(declare-datatypes ((tuple2!25770 0))(
  ( (tuple2!25771 (_1!12896 (_ BitVec 64)) (_2!12896 B!2878)) )
))
(declare-datatypes ((List!36921 0))(
  ( (Nil!36918) (Cons!36917 (h!38460 tuple2!25770) (t!51835 List!36921)) )
))
(declare-fun l!1251 () List!36921)

(get-info :version)

(assert (= (and start!137940 ((_ is Cons!36917) l!1251)) b!1583602))

(check-sat (not b!1583602) tp_is_empty!39411)
(check-sat)
