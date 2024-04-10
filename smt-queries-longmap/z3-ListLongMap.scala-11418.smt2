; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133102 () Bool)

(assert start!133102)

(assert (=> start!133102 false))

(declare-fun e!867656 () Bool)

(assert (=> start!133102 e!867656))

(declare-fun b!1557608 () Bool)

(declare-fun tp_is_empty!38391 () Bool)

(declare-fun tp!112533 () Bool)

(assert (=> b!1557608 (= e!867656 (and tp_is_empty!38391 tp!112533))))

(declare-datatypes ((B!2386 0))(
  ( (B!2387 (val!19279 Int)) )
))
(declare-datatypes ((tuple2!24934 0))(
  ( (tuple2!24935 (_1!12478 (_ BitVec 64)) (_2!12478 B!2386)) )
))
(declare-datatypes ((List!36313 0))(
  ( (Nil!36310) (Cons!36309 (h!37755 tuple2!24934) (t!51040 List!36313)) )
))
(declare-fun l!1292 () List!36313)

(get-info :version)

(assert (= (and start!133102 ((_ is Cons!36309) l!1292)) b!1557608))

(check-sat (not b!1557608) tp_is_empty!38391)
(check-sat)
