; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137532 () Bool)

(assert start!137532)

(declare-fun b!1581912 () Bool)

(declare-fun e!882743 () Bool)

(declare-fun tp_is_empty!39271 () Bool)

(declare-fun tp!114641 () Bool)

(assert (=> b!1581912 (= e!882743 (and tp_is_empty!39271 tp!114641))))

(declare-fun b!1581913 () Bool)

(declare-fun res!1080735 () Bool)

(declare-fun e!882742 () Bool)

(assert (=> b!1581913 (=> (not res!1080735) (not e!882742))))

(declare-datatypes ((B!2726 0))(
  ( (B!2727 (val!19725 Int)) )
))
(declare-datatypes ((tuple2!25618 0))(
  ( (tuple2!25619 (_1!12820 (_ BitVec 64)) (_2!12820 B!2726)) )
))
(declare-datatypes ((List!36845 0))(
  ( (Nil!36842) (Cons!36841 (h!38384 tuple2!25618) (t!51759 List!36845)) )
))
(declare-fun l!1356 () List!36845)

(assert (=> b!1581913 (= res!1080735 (not (is-Nil!36842 l!1356)))))

(declare-fun b!1581914 () Bool)

(declare-fun res!1080732 () Bool)

(assert (=> b!1581914 (=> (not res!1080732) (not e!882742))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!946 (List!36845 (_ BitVec 64)) Bool)

(assert (=> b!1581914 (= res!1080732 (not (containsKey!946 l!1356 key!387)))))

(declare-fun b!1581915 () Bool)

(declare-fun e!882741 () Bool)

(assert (=> b!1581915 (= e!882742 e!882741)))

(declare-fun res!1080734 () Bool)

(assert (=> b!1581915 (=> res!1080734 e!882741)))

(declare-fun isStrictlySorted!1100 (List!36845) Bool)

(assert (=> b!1581915 (= res!1080734 (not (isStrictlySorted!1100 (t!51759 l!1356))))))

(declare-fun b!1581916 () Bool)

(assert (=> b!1581916 (= e!882741 (containsKey!946 (t!51759 l!1356) key!387))))

(declare-fun res!1080733 () Bool)

(assert (=> start!137532 (=> (not res!1080733) (not e!882742))))

(assert (=> start!137532 (= res!1080733 (isStrictlySorted!1100 l!1356))))

(assert (=> start!137532 e!882742))

(assert (=> start!137532 e!882743))

(assert (=> start!137532 true))

(assert (= (and start!137532 res!1080733) b!1581914))

(assert (= (and b!1581914 res!1080732) b!1581913))

(assert (= (and b!1581913 res!1080735) b!1581915))

(assert (= (and b!1581915 (not res!1080734)) b!1581916))

(assert (= (and start!137532 (is-Cons!36841 l!1356)) b!1581912))

(declare-fun m!1452659 () Bool)

(assert (=> b!1581914 m!1452659))

(declare-fun m!1452661 () Bool)

(assert (=> b!1581915 m!1452661))

(declare-fun m!1452663 () Bool)

(assert (=> b!1581916 m!1452663))

(declare-fun m!1452665 () Bool)

(assert (=> start!137532 m!1452665))

(push 1)

(assert (not b!1581914))

(assert (not start!137532))

(assert (not b!1581915))

(assert (not b!1581916))

(assert tp_is_empty!39271)

(assert (not b!1581912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166867 () Bool)

(declare-fun res!1080774 () Bool)

(declare-fun e!882776 () Bool)

(assert (=> d!166867 (=> res!1080774 e!882776)))

(assert (=> d!166867 (= res!1080774 (and (is-Cons!36841 l!1356) (= (_1!12820 (h!38384 l!1356)) key!387)))))

(assert (=> d!166867 (= (containsKey!946 l!1356 key!387) e!882776)))

(declare-fun b!1581961 () Bool)

(declare-fun e!882777 () Bool)

(assert (=> b!1581961 (= e!882776 e!882777)))

(declare-fun res!1080775 () Bool)

(assert (=> b!1581961 (=> (not res!1080775) (not e!882777))))

(assert (=> b!1581961 (= res!1080775 (and (or (not (is-Cons!36841 l!1356)) (bvsle (_1!12820 (h!38384 l!1356)) key!387)) (is-Cons!36841 l!1356) (bvslt (_1!12820 (h!38384 l!1356)) key!387)))))

(declare-fun b!1581962 () Bool)

(assert (=> b!1581962 (= e!882777 (containsKey!946 (t!51759 l!1356) key!387))))

(assert (= (and d!166867 (not res!1080774)) b!1581961))

(assert (= (and b!1581961 res!1080775) b!1581962))

(assert (=> b!1581962 m!1452663))

(assert (=> b!1581914 d!166867))

(declare-fun d!166873 () Bool)

(declare-fun res!1080794 () Bool)

(declare-fun e!882796 () Bool)

(assert (=> d!166873 (=> res!1080794 e!882796)))

(assert (=> d!166873 (= res!1080794 (or (is-Nil!36842 l!1356) (is-Nil!36842 (t!51759 l!1356))))))

(assert (=> d!166873 (= (isStrictlySorted!1100 l!1356) e!882796)))

(declare-fun b!1581979 () Bool)

(declare-fun e!882797 () Bool)

(assert (=> b!1581979 (= e!882796 e!882797)))

(declare-fun res!1080795 () Bool)

(assert (=> b!1581979 (=> (not res!1080795) (not e!882797))))

(assert (=> b!1581979 (= res!1080795 (bvslt (_1!12820 (h!38384 l!1356)) (_1!12820 (h!38384 (t!51759 l!1356)))))))

(declare-fun b!1581980 () Bool)

(assert (=> b!1581980 (= e!882797 (isStrictlySorted!1100 (t!51759 l!1356)))))

(assert (= (and d!166873 (not res!1080794)) b!1581979))

(assert (= (and b!1581979 res!1080795) b!1581980))

(assert (=> b!1581980 m!1452661))

(assert (=> start!137532 d!166873))

(declare-fun d!166881 () Bool)

(declare-fun res!1080798 () Bool)

(declare-fun e!882800 () Bool)

(assert (=> d!166881 (=> res!1080798 e!882800)))

(assert (=> d!166881 (= res!1080798 (and (is-Cons!36841 (t!51759 l!1356)) (= (_1!12820 (h!38384 (t!51759 l!1356))) key!387)))))

(assert (=> d!166881 (= (containsKey!946 (t!51759 l!1356) key!387) e!882800)))

(declare-fun b!1581985 () Bool)

(declare-fun e!882801 () Bool)

(assert (=> b!1581985 (= e!882800 e!882801)))

(declare-fun res!1080799 () Bool)

(assert (=> b!1581985 (=> (not res!1080799) (not e!882801))))

(assert (=> b!1581985 (= res!1080799 (and (or (not (is-Cons!36841 (t!51759 l!1356))) (bvsle (_1!12820 (h!38384 (t!51759 l!1356))) key!387)) (is-Cons!36841 (t!51759 l!1356)) (bvslt (_1!12820 (h!38384 (t!51759 l!1356))) key!387)))))

(declare-fun b!1581986 () Bool)

(assert (=> b!1581986 (= e!882801 (containsKey!946 (t!51759 (t!51759 l!1356)) key!387))))

(assert (= (and d!166881 (not res!1080798)) b!1581985))

(assert (= (and b!1581985 res!1080799) b!1581986))

(declare-fun m!1452687 () Bool)

(assert (=> b!1581986 m!1452687))

(assert (=> b!1581916 d!166881))

(declare-fun d!166885 () Bool)

(declare-fun res!1080802 () Bool)

(declare-fun e!882804 () Bool)

(assert (=> d!166885 (=> res!1080802 e!882804)))

(assert (=> d!166885 (= res!1080802 (or (is-Nil!36842 (t!51759 l!1356)) (is-Nil!36842 (t!51759 (t!51759 l!1356)))))))

(assert (=> d!166885 (= (isStrictlySorted!1100 (t!51759 l!1356)) e!882804)))

(declare-fun b!1581989 () Bool)

(declare-fun e!882805 () Bool)

(assert (=> b!1581989 (= e!882804 e!882805)))

(declare-fun res!1080803 () Bool)

(assert (=> b!1581989 (=> (not res!1080803) (not e!882805))))

(assert (=> b!1581989 (= res!1080803 (bvslt (_1!12820 (h!38384 (t!51759 l!1356))) (_1!12820 (h!38384 (t!51759 (t!51759 l!1356))))))))

(declare-fun b!1581990 () Bool)

(assert (=> b!1581990 (= e!882805 (isStrictlySorted!1100 (t!51759 (t!51759 l!1356))))))

(assert (= (and d!166885 (not res!1080802)) b!1581989))

(assert (= (and b!1581989 res!1080803) b!1581990))

(declare-fun m!1452691 () Bool)

(assert (=> b!1581990 m!1452691))

(assert (=> b!1581915 d!166885))

(declare-fun b!1582003 () Bool)

(declare-fun e!882814 () Bool)

(declare-fun tp!114652 () Bool)

(assert (=> b!1582003 (= e!882814 (and tp_is_empty!39271 tp!114652))))

(assert (=> b!1581912 (= tp!114641 e!882814)))

(assert (= (and b!1581912 (is-Cons!36841 (t!51759 l!1356))) b!1582003))

(push 1)

(assert (not b!1581990))

(assert (not b!1581980))

(assert (not b!1581962))

(assert (not b!1582003))

(assert tp_is_empty!39271)

(assert (not b!1581986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

