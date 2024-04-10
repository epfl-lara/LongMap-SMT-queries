; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132784 () Bool)

(assert start!132784)

(assert (=> start!132784 false))

(declare-fun e!866312 () Bool)

(assert (=> start!132784 e!866312))

(declare-fun b!1555595 () Bool)

(declare-fun tp_is_empty!38307 () Bool)

(declare-fun tp!112302 () Bool)

(assert (=> b!1555595 (= e!866312 (and tp_is_empty!38307 tp!112302))))

(declare-datatypes ((B!2296 0))(
  ( (B!2297 (val!19234 Int)) )
))
(declare-datatypes ((tuple2!24844 0))(
  ( (tuple2!24845 (_1!12433 (_ BitVec 64)) (_2!12433 B!2296)) )
))
(declare-datatypes ((List!36268 0))(
  ( (Nil!36265) (Cons!36264 (h!37710 tuple2!24844) (t!50989 List!36268)) )
))
(declare-fun l!1177 () List!36268)

(get-info :version)

(assert (= (and start!132784 ((_ is Cons!36264) l!1177)) b!1555595))

(check-sat (not b!1555595) tp_is_empty!38307)
(check-sat)
