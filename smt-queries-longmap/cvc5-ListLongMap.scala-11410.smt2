; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132866 () Bool)

(assert start!132866)

(declare-fun res!1064611 () Bool)

(declare-fun e!866644 () Bool)

(assert (=> start!132866 (=> (not res!1064611) (not e!866644))))

(declare-datatypes ((B!2336 0))(
  ( (B!2337 (val!19254 Int)) )
))
(declare-datatypes ((tuple2!24884 0))(
  ( (tuple2!24885 (_1!12453 (_ BitVec 64)) (_2!12453 B!2336)) )
))
(declare-datatypes ((List!36288 0))(
  ( (Nil!36285) (Cons!36284 (h!37730 tuple2!24884) (t!51009 List!36288)) )
))
(declare-fun l!1177 () List!36288)

(declare-fun isStrictlySorted!941 (List!36288) Bool)

(assert (=> start!132866 (= res!1064611 (isStrictlySorted!941 l!1177))))

(assert (=> start!132866 e!866644))

(declare-fun e!866645 () Bool)

(assert (=> start!132866 e!866645))

(assert (=> start!132866 true))

(declare-fun b!1556091 () Bool)

(declare-fun res!1064610 () Bool)

(assert (=> b!1556091 (=> (not res!1064610) (not e!866644))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun newKey!105 () (_ BitVec 64))

(assert (=> b!1556091 (= res!1064610 (and (not (= newKey!105 otherKey!50)) (is-Cons!36284 l!1177) (not (= (_1!12453 (h!37730 l!1177)) otherKey!50))))))

(declare-fun b!1556092 () Bool)

(assert (=> b!1556092 (= e!866644 (not (isStrictlySorted!941 (t!51009 l!1177))))))

(declare-fun b!1556093 () Bool)

(declare-fun tp_is_empty!38347 () Bool)

(declare-fun tp!112389 () Bool)

(assert (=> b!1556093 (= e!866645 (and tp_is_empty!38347 tp!112389))))

(assert (= (and start!132866 res!1064611) b!1556091))

(assert (= (and b!1556091 res!1064610) b!1556092))

(assert (= (and start!132866 (is-Cons!36284 l!1177)) b!1556093))

(declare-fun m!1433775 () Bool)

(assert (=> start!132866 m!1433775))

(declare-fun m!1433777 () Bool)

(assert (=> b!1556092 m!1433777))

(push 1)

(assert (not b!1556092))

(assert (not start!132866))

(assert (not b!1556093))

(assert tp_is_empty!38347)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162067 () Bool)

(declare-fun res!1064644 () Bool)

(declare-fun e!866681 () Bool)

(assert (=> d!162067 (=> res!1064644 e!866681)))

(assert (=> d!162067 (= res!1064644 (or (is-Nil!36285 (t!51009 l!1177)) (is-Nil!36285 (t!51009 (t!51009 l!1177)))))))

(assert (=> d!162067 (= (isStrictlySorted!941 (t!51009 l!1177)) e!866681)))

(declare-fun b!1556137 () Bool)

(declare-fun e!866682 () Bool)

(assert (=> b!1556137 (= e!866681 e!866682)))

(declare-fun res!1064645 () Bool)

(assert (=> b!1556137 (=> (not res!1064645) (not e!866682))))

(assert (=> b!1556137 (= res!1064645 (bvslt (_1!12453 (h!37730 (t!51009 l!1177))) (_1!12453 (h!37730 (t!51009 (t!51009 l!1177))))))))

(declare-fun b!1556138 () Bool)

(assert (=> b!1556138 (= e!866682 (isStrictlySorted!941 (t!51009 (t!51009 l!1177))))))

(assert (= (and d!162067 (not res!1064644)) b!1556137))

(assert (= (and b!1556137 res!1064645) b!1556138))

(declare-fun m!1433791 () Bool)

(assert (=> b!1556138 m!1433791))

(assert (=> b!1556092 d!162067))

(declare-fun d!162073 () Bool)

(declare-fun res!1064646 () Bool)

(declare-fun e!866685 () Bool)

(assert (=> d!162073 (=> res!1064646 e!866685)))

(assert (=> d!162073 (= res!1064646 (or (is-Nil!36285 l!1177) (is-Nil!36285 (t!51009 l!1177))))))

(assert (=> d!162073 (= (isStrictlySorted!941 l!1177) e!866685)))

(declare-fun b!1556143 () Bool)

(declare-fun e!866686 () Bool)

(assert (=> b!1556143 (= e!866685 e!866686)))

(declare-fun res!1064647 () Bool)

(assert (=> b!1556143 (=> (not res!1064647) (not e!866686))))

(assert (=> b!1556143 (= res!1064647 (bvslt (_1!12453 (h!37730 l!1177)) (_1!12453 (h!37730 (t!51009 l!1177)))))))

(declare-fun b!1556144 () Bool)

(assert (=> b!1556144 (= e!866686 (isStrictlySorted!941 (t!51009 l!1177)))))

(assert (= (and d!162073 (not res!1064646)) b!1556143))

(assert (= (and b!1556143 res!1064647) b!1556144))

(assert (=> b!1556144 m!1433777))

(assert (=> start!132866 d!162073))

(declare-fun b!1556150 () Bool)

(declare-fun e!866690 () Bool)

(declare-fun tp!112404 () Bool)

(assert (=> b!1556150 (= e!866690 (and tp_is_empty!38347 tp!112404))))

(assert (=> b!1556093 (= tp!112389 e!866690)))

(assert (= (and b!1556093 (is-Cons!36284 (t!51009 l!1177))) b!1556150))

(push 1)

