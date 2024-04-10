; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132816 () Bool)

(assert start!132816)

(declare-fun res!1064458 () Bool)

(declare-fun e!866438 () Bool)

(assert (=> start!132816 (=> (not res!1064458) (not e!866438))))

(declare-datatypes ((B!2316 0))(
  ( (B!2317 (val!19244 Int)) )
))
(declare-datatypes ((tuple2!24864 0))(
  ( (tuple2!24865 (_1!12443 (_ BitVec 64)) (_2!12443 B!2316)) )
))
(declare-datatypes ((List!36278 0))(
  ( (Nil!36275) (Cons!36274 (h!37720 tuple2!24864) (t!50999 List!36278)) )
))
(declare-fun l!1177 () List!36278)

(declare-fun isStrictlySorted!931 (List!36278) Bool)

(assert (=> start!132816 (= res!1064458 (isStrictlySorted!931 l!1177))))

(assert (=> start!132816 e!866438))

(declare-fun e!866437 () Bool)

(assert (=> start!132816 e!866437))

(assert (=> start!132816 true))

(declare-fun tp_is_empty!38327 () Bool)

(assert (=> start!132816 tp_is_empty!38327))

(declare-fun b!1555788 () Bool)

(declare-fun res!1064457 () Bool)

(assert (=> b!1555788 (=> (not res!1064457) (not e!866438))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555788 (= res!1064457 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36274 l!1177)) (= (_1!12443 (h!37720 l!1177)) otherKey!50))))))

(declare-fun b!1555789 () Bool)

(assert (=> b!1555789 (= e!866438 false)))

(declare-fun newValue!105 () B!2316)

(declare-fun lt!670343 () Bool)

(declare-fun containsKey!802 (List!36278 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!542 (List!36278 (_ BitVec 64) B!2316) List!36278)

(assert (=> b!1555789 (= lt!670343 (containsKey!802 (insertStrictlySorted!542 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1555790 () Bool)

(declare-fun tp!112341 () Bool)

(assert (=> b!1555790 (= e!866437 (and tp_is_empty!38327 tp!112341))))

(assert (= (and start!132816 res!1064458) b!1555788))

(assert (= (and b!1555788 res!1064457) b!1555789))

(assert (= (and start!132816 (is-Cons!36274 l!1177)) b!1555790))

(declare-fun m!1433643 () Bool)

(assert (=> start!132816 m!1433643))

(declare-fun m!1433645 () Bool)

(assert (=> b!1555789 m!1433645))

(assert (=> b!1555789 m!1433645))

(declare-fun m!1433647 () Bool)

(assert (=> b!1555789 m!1433647))

(push 1)

(assert (not start!132816))

(assert (not b!1555789))

(assert (not b!1555790))

(assert tp_is_empty!38327)

(check-sat)

