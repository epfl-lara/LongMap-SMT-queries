; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132792 () Bool)

(assert start!132792)

(declare-fun res!1064428 () Bool)

(declare-fun e!866374 () Bool)

(assert (=> start!132792 (=> (not res!1064428) (not e!866374))))

(declare-datatypes ((B!2324 0))(
  ( (B!2325 (val!19248 Int)) )
))
(declare-datatypes ((tuple2!24944 0))(
  ( (tuple2!24945 (_1!12483 (_ BitVec 64)) (_2!12483 B!2324)) )
))
(declare-datatypes ((List!36327 0))(
  ( (Nil!36324) (Cons!36323 (h!37770 tuple2!24944) (t!51040 List!36327)) )
))
(declare-fun l!1177 () List!36327)

(declare-fun isStrictlySorted!933 (List!36327) Bool)

(assert (=> start!132792 (= res!1064428 (isStrictlySorted!933 l!1177))))

(assert (=> start!132792 e!866374))

(declare-fun e!866375 () Bool)

(assert (=> start!132792 e!866375))

(assert (=> start!132792 true))

(declare-fun tp_is_empty!38335 () Bool)

(assert (=> start!132792 tp_is_empty!38335))

(declare-fun b!1555673 () Bool)

(declare-fun res!1064427 () Bool)

(assert (=> b!1555673 (=> (not res!1064427) (not e!866374))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555673 (= res!1064427 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36323) l!1177)) (= (_1!12483 (h!37770 l!1177)) otherKey!50))))))

(declare-fun b!1555674 () Bool)

(assert (=> b!1555674 (= e!866374 false)))

(declare-fun newValue!105 () B!2324)

(declare-fun lt!670078 () Bool)

(declare-fun containsKey!804 (List!36327 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!547 (List!36327 (_ BitVec 64) B!2324) List!36327)

(assert (=> b!1555674 (= lt!670078 (containsKey!804 (insertStrictlySorted!547 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1555675 () Bool)

(declare-fun tp!112363 () Bool)

(assert (=> b!1555675 (= e!866375 (and tp_is_empty!38335 tp!112363))))

(assert (= (and start!132792 res!1064428) b!1555673))

(assert (= (and b!1555673 res!1064427) b!1555674))

(assert (= (and start!132792 ((_ is Cons!36323) l!1177)) b!1555675))

(declare-fun m!1432841 () Bool)

(assert (=> start!132792 m!1432841))

(declare-fun m!1432843 () Bool)

(assert (=> b!1555674 m!1432843))

(assert (=> b!1555674 m!1432843))

(declare-fun m!1432845 () Bool)

(assert (=> b!1555674 m!1432845))

(check-sat (not start!132792) (not b!1555674) (not b!1555675) tp_is_empty!38335)
(check-sat)
