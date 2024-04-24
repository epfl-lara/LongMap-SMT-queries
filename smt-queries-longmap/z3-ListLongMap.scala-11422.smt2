; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133560 () Bool)

(assert start!133560)

(assert (=> start!133560 false))

(declare-fun e!869354 () Bool)

(assert (=> start!133560 e!869354))

(assert (=> start!133560 true))

(declare-fun b!1560380 () Bool)

(declare-fun tp_is_empty!38413 () Bool)

(declare-fun tp!112575 () Bool)

(assert (=> b!1560380 (= e!869354 (and tp_is_empty!38413 tp!112575))))

(declare-datatypes ((B!2408 0))(
  ( (B!2409 (val!19290 Int)) )
))
(declare-datatypes ((tuple2!25010 0))(
  ( (tuple2!25011 (_1!12516 (_ BitVec 64)) (_2!12516 B!2408)) )
))
(declare-datatypes ((List!36353 0))(
  ( (Nil!36350) (Cons!36349 (h!37813 tuple2!25010) (t!51072 List!36353)) )
))
(declare-fun l!1292 () List!36353)

(get-info :version)

(assert (= (and start!133560 ((_ is Cons!36349) l!1292)) b!1560380))

(check-sat (not b!1560380) tp_is_empty!38413)
(check-sat)
