; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132870 () Bool)

(assert start!132870)

(declare-fun res!1064622 () Bool)

(declare-fun e!866657 () Bool)

(assert (=> start!132870 (=> (not res!1064622) (not e!866657))))

(declare-datatypes ((B!2340 0))(
  ( (B!2341 (val!19256 Int)) )
))
(declare-datatypes ((tuple2!24888 0))(
  ( (tuple2!24889 (_1!12455 (_ BitVec 64)) (_2!12455 B!2340)) )
))
(declare-datatypes ((List!36290 0))(
  ( (Nil!36287) (Cons!36286 (h!37732 tuple2!24888) (t!51011 List!36290)) )
))
(declare-fun l!1177 () List!36290)

(declare-fun isStrictlySorted!943 (List!36290) Bool)

(assert (=> start!132870 (= res!1064622 (isStrictlySorted!943 l!1177))))

(assert (=> start!132870 e!866657))

(declare-fun e!866656 () Bool)

(assert (=> start!132870 e!866656))

(assert (=> start!132870 true))

(declare-fun b!1556109 () Bool)

(declare-fun res!1064623 () Bool)

(assert (=> b!1556109 (=> (not res!1064623) (not e!866657))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1556109 (= res!1064623 (and (not (= newKey!105 otherKey!50)) (is-Cons!36286 l!1177) (not (= (_1!12455 (h!37732 l!1177)) otherKey!50))))))

(declare-fun b!1556110 () Bool)

(assert (=> b!1556110 (= e!866657 (not (isStrictlySorted!943 (t!51011 l!1177))))))

(declare-fun b!1556111 () Bool)

(declare-fun tp_is_empty!38351 () Bool)

(declare-fun tp!112395 () Bool)

(assert (=> b!1556111 (= e!866656 (and tp_is_empty!38351 tp!112395))))

(assert (= (and start!132870 res!1064622) b!1556109))

(assert (= (and b!1556109 res!1064623) b!1556110))

(assert (= (and start!132870 (is-Cons!36286 l!1177)) b!1556111))

(declare-fun m!1433783 () Bool)

(assert (=> start!132870 m!1433783))

(declare-fun m!1433785 () Bool)

(assert (=> b!1556110 m!1433785))

(push 1)

(assert (not b!1556110))

(assert (not start!132870))

(assert (not b!1556111))

(assert tp_is_empty!38351)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162065 () Bool)

(declare-fun res!1064640 () Bool)

(declare-fun e!866677 () Bool)

(assert (=> d!162065 (=> res!1064640 e!866677)))

(assert (=> d!162065 (= res!1064640 (or (is-Nil!36287 (t!51011 l!1177)) (is-Nil!36287 (t!51011 (t!51011 l!1177)))))))

(assert (=> d!162065 (= (isStrictlySorted!943 (t!51011 l!1177)) e!866677)))

(declare-fun b!1556133 () Bool)

(declare-fun e!866678 () Bool)

(assert (=> b!1556133 (= e!866677 e!866678)))

(declare-fun res!1064641 () Bool)

(assert (=> b!1556133 (=> (not res!1064641) (not e!866678))))

(assert (=> b!1556133 (= res!1064641 (bvslt (_1!12455 (h!37732 (t!51011 l!1177))) (_1!12455 (h!37732 (t!51011 (t!51011 l!1177))))))))

(declare-fun b!1556134 () Bool)

(assert (=> b!1556134 (= e!866678 (isStrictlySorted!943 (t!51011 (t!51011 l!1177))))))

(assert (= (and d!162065 (not res!1064640)) b!1556133))

(assert (= (and b!1556133 res!1064641) b!1556134))

(declare-fun m!1433789 () Bool)

(assert (=> b!1556134 m!1433789))

(assert (=> b!1556110 d!162065))

(declare-fun d!162071 () Bool)

(declare-fun res!1064642 () Bool)

(declare-fun e!866679 () Bool)

(assert (=> d!162071 (=> res!1064642 e!866679)))

(assert (=> d!162071 (= res!1064642 (or (is-Nil!36287 l!1177) (is-Nil!36287 (t!51011 l!1177))))))

(assert (=> d!162071 (= (isStrictlySorted!943 l!1177) e!866679)))

(declare-fun b!1556135 () Bool)

(declare-fun e!866680 () Bool)

(assert (=> b!1556135 (= e!866679 e!866680)))

