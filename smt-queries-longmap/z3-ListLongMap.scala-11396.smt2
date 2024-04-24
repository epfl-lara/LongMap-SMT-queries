; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133092 () Bool)

(assert start!133092)

(assert (=> start!133092 false))

(declare-fun e!867296 () Bool)

(assert (=> start!133092 e!867296))

(assert (=> start!133092 true))

(declare-fun b!1557218 () Bool)

(declare-fun tp_is_empty!38263 () Bool)

(declare-fun tp!112218 () Bool)

(assert (=> b!1557218 (= e!867296 (and tp_is_empty!38263 tp!112218))))

(declare-datatypes ((B!2252 0))(
  ( (B!2253 (val!19212 Int)) )
))
(declare-datatypes ((tuple2!24854 0))(
  ( (tuple2!24855 (_1!12438 (_ BitVec 64)) (_2!12438 B!2252)) )
))
(declare-datatypes ((List!36275 0))(
  ( (Nil!36272) (Cons!36271 (h!37735 tuple2!24854) (t!50988 List!36275)) )
))
(declare-fun l!1177 () List!36275)

(get-info :version)

(assert (= (and start!133092 ((_ is Cons!36271) l!1177)) b!1557218))

(check-sat (not b!1557218) tp_is_empty!38263)
(check-sat)
