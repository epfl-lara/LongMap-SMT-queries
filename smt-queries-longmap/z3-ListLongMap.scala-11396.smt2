; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132630 () Bool)

(assert start!132630)

(assert (=> start!132630 false))

(declare-fun e!865589 () Bool)

(assert (=> start!132630 e!865589))

(assert (=> start!132630 true))

(declare-fun b!1554469 () Bool)

(declare-fun tp_is_empty!38263 () Bool)

(declare-fun tp!112219 () Bool)

(assert (=> b!1554469 (= e!865589 (and tp_is_empty!38263 tp!112219))))

(declare-datatypes ((B!2252 0))(
  ( (B!2253 (val!19212 Int)) )
))
(declare-datatypes ((tuple2!24872 0))(
  ( (tuple2!24873 (_1!12447 (_ BitVec 64)) (_2!12447 B!2252)) )
))
(declare-datatypes ((List!36291 0))(
  ( (Nil!36288) (Cons!36287 (h!37734 tuple2!24872) (t!51004 List!36291)) )
))
(declare-fun l!1177 () List!36291)

(get-info :version)

(assert (= (and start!132630 ((_ is Cons!36287) l!1177)) b!1554469))

(check-sat (not b!1554469) tp_is_empty!38263)
(check-sat)
