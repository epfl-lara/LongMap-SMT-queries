; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132682 () Bool)

(assert start!132682)

(assert (=> start!132682 false))

(declare-fun e!865790 () Bool)

(assert (=> start!132682 e!865790))

(assert (=> start!132682 true))

(declare-fun b!1554785 () Bool)

(declare-fun tp_is_empty!38265 () Bool)

(declare-fun tp!112221 () Bool)

(assert (=> b!1554785 (= e!865790 (and tp_is_empty!38265 tp!112221))))

(declare-datatypes ((B!2254 0))(
  ( (B!2255 (val!19213 Int)) )
))
(declare-datatypes ((tuple2!24802 0))(
  ( (tuple2!24803 (_1!12412 (_ BitVec 64)) (_2!12412 B!2254)) )
))
(declare-datatypes ((List!36247 0))(
  ( (Nil!36244) (Cons!36243 (h!37689 tuple2!24802) (t!50968 List!36247)) )
))
(declare-fun l!1177 () List!36247)

(get-info :version)

(assert (= (and start!132682 ((_ is Cons!36243) l!1177)) b!1554785))

(check-sat (not b!1554785) tp_is_empty!38265)
(check-sat)
