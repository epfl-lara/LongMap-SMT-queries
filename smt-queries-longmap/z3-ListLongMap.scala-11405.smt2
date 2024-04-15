; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132756 () Bool)

(assert start!132756)

(assert (=> start!132756 false))

(declare-fun e!866216 () Bool)

(assert (=> start!132756 e!866216))

(declare-fun b!1555444 () Bool)

(declare-fun tp_is_empty!38317 () Bool)

(declare-fun tp!112327 () Bool)

(assert (=> b!1555444 (= e!866216 (and tp_is_empty!38317 tp!112327))))

(declare-datatypes ((B!2306 0))(
  ( (B!2307 (val!19239 Int)) )
))
(declare-datatypes ((tuple2!24926 0))(
  ( (tuple2!24927 (_1!12474 (_ BitVec 64)) (_2!12474 B!2306)) )
))
(declare-datatypes ((List!36318 0))(
  ( (Nil!36315) (Cons!36314 (h!37761 tuple2!24926) (t!51031 List!36318)) )
))
(declare-fun l!1177 () List!36318)

(get-info :version)

(assert (= (and start!132756 ((_ is Cons!36314) l!1177)) b!1555444))

(check-sat (not b!1555444) tp_is_empty!38317)
(check-sat)
