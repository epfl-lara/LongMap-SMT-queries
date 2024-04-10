; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137534 () Bool)

(assert start!137534)

(declare-fun b!1581927 () Bool)

(declare-fun e!882750 () Bool)

(declare-fun tp_is_empty!39273 () Bool)

(declare-fun tp!114644 () Bool)

(assert (=> b!1581927 (= e!882750 (and tp_is_empty!39273 tp!114644))))

(declare-fun b!1581928 () Bool)

(declare-fun res!1080744 () Bool)

(declare-fun e!882752 () Bool)

(assert (=> b!1581928 (=> (not res!1080744) (not e!882752))))

(declare-datatypes ((B!2728 0))(
  ( (B!2729 (val!19726 Int)) )
))
(declare-datatypes ((tuple2!25620 0))(
  ( (tuple2!25621 (_1!12821 (_ BitVec 64)) (_2!12821 B!2728)) )
))
(declare-datatypes ((List!36846 0))(
  ( (Nil!36843) (Cons!36842 (h!38385 tuple2!25620) (t!51760 List!36846)) )
))
(declare-fun l!1356 () List!36846)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!947 (List!36846 (_ BitVec 64)) Bool)

(assert (=> b!1581928 (= res!1080744 (not (containsKey!947 l!1356 key!387)))))

(declare-fun b!1581929 () Bool)

(declare-fun res!1080745 () Bool)

(assert (=> b!1581929 (=> (not res!1080745) (not e!882752))))

(get-info :version)

(assert (=> b!1581929 (= res!1080745 (not ((_ is Nil!36843) l!1356)))))

(declare-fun res!1080747 () Bool)

(assert (=> start!137534 (=> (not res!1080747) (not e!882752))))

(declare-fun isStrictlySorted!1101 (List!36846) Bool)

(assert (=> start!137534 (= res!1080747 (isStrictlySorted!1101 l!1356))))

(assert (=> start!137534 e!882752))

(assert (=> start!137534 e!882750))

(assert (=> start!137534 true))

(declare-fun b!1581930 () Bool)

(declare-fun e!882751 () Bool)

(assert (=> b!1581930 (= e!882752 e!882751)))

(declare-fun res!1080746 () Bool)

(assert (=> b!1581930 (=> res!1080746 e!882751)))

(assert (=> b!1581930 (= res!1080746 (not (isStrictlySorted!1101 (t!51760 l!1356))))))

(declare-fun b!1581931 () Bool)

(assert (=> b!1581931 (= e!882751 (containsKey!947 (t!51760 l!1356) key!387))))

(assert (= (and start!137534 res!1080747) b!1581928))

(assert (= (and b!1581928 res!1080744) b!1581929))

(assert (= (and b!1581929 res!1080745) b!1581930))

(assert (= (and b!1581930 (not res!1080746)) b!1581931))

(assert (= (and start!137534 ((_ is Cons!36842) l!1356)) b!1581927))

(declare-fun m!1452667 () Bool)

(assert (=> b!1581928 m!1452667))

(declare-fun m!1452669 () Bool)

(assert (=> start!137534 m!1452669))

(declare-fun m!1452671 () Bool)

(assert (=> b!1581930 m!1452671))

(declare-fun m!1452673 () Bool)

(assert (=> b!1581931 m!1452673))

(check-sat (not start!137534) tp_is_empty!39273 (not b!1581931) (not b!1581927) (not b!1581928) (not b!1581930))
(check-sat)
(get-model)

(declare-fun d!166865 () Bool)

(declare-fun res!1080772 () Bool)

(declare-fun e!882774 () Bool)

(assert (=> d!166865 (=> res!1080772 e!882774)))

(assert (=> d!166865 (= res!1080772 (and ((_ is Cons!36842) l!1356) (= (_1!12821 (h!38385 l!1356)) key!387)))))

(assert (=> d!166865 (= (containsKey!947 l!1356 key!387) e!882774)))

(declare-fun b!1581959 () Bool)

(declare-fun e!882775 () Bool)

(assert (=> b!1581959 (= e!882774 e!882775)))

(declare-fun res!1080773 () Bool)

(assert (=> b!1581959 (=> (not res!1080773) (not e!882775))))

(assert (=> b!1581959 (= res!1080773 (and (or (not ((_ is Cons!36842) l!1356)) (bvsle (_1!12821 (h!38385 l!1356)) key!387)) ((_ is Cons!36842) l!1356) (bvslt (_1!12821 (h!38385 l!1356)) key!387)))))

(declare-fun b!1581960 () Bool)

(assert (=> b!1581960 (= e!882775 (containsKey!947 (t!51760 l!1356) key!387))))

(assert (= (and d!166865 (not res!1080772)) b!1581959))

(assert (= (and b!1581959 res!1080773) b!1581960))

(assert (=> b!1581960 m!1452673))

(assert (=> b!1581928 d!166865))

(declare-fun d!166871 () Bool)

(declare-fun res!1080792 () Bool)

(declare-fun e!882794 () Bool)

(assert (=> d!166871 (=> res!1080792 e!882794)))

(assert (=> d!166871 (= res!1080792 (or ((_ is Nil!36843) l!1356) ((_ is Nil!36843) (t!51760 l!1356))))))

(assert (=> d!166871 (= (isStrictlySorted!1101 l!1356) e!882794)))

(declare-fun b!1581977 () Bool)

(declare-fun e!882795 () Bool)

(assert (=> b!1581977 (= e!882794 e!882795)))

(declare-fun res!1080793 () Bool)

(assert (=> b!1581977 (=> (not res!1080793) (not e!882795))))

(assert (=> b!1581977 (= res!1080793 (bvslt (_1!12821 (h!38385 l!1356)) (_1!12821 (h!38385 (t!51760 l!1356)))))))

(declare-fun b!1581978 () Bool)

(assert (=> b!1581978 (= e!882795 (isStrictlySorted!1101 (t!51760 l!1356)))))

(assert (= (and d!166871 (not res!1080792)) b!1581977))

(assert (= (and b!1581977 res!1080793) b!1581978))

(assert (=> b!1581978 m!1452671))

(assert (=> start!137534 d!166871))

(declare-fun d!166879 () Bool)

(declare-fun res!1080796 () Bool)

(declare-fun e!882798 () Bool)

(assert (=> d!166879 (=> res!1080796 e!882798)))

(assert (=> d!166879 (= res!1080796 (and ((_ is Cons!36842) (t!51760 l!1356)) (= (_1!12821 (h!38385 (t!51760 l!1356))) key!387)))))

(assert (=> d!166879 (= (containsKey!947 (t!51760 l!1356) key!387) e!882798)))

(declare-fun b!1581983 () Bool)

(declare-fun e!882799 () Bool)

(assert (=> b!1581983 (= e!882798 e!882799)))

(declare-fun res!1080797 () Bool)

(assert (=> b!1581983 (=> (not res!1080797) (not e!882799))))

(assert (=> b!1581983 (= res!1080797 (and (or (not ((_ is Cons!36842) (t!51760 l!1356))) (bvsle (_1!12821 (h!38385 (t!51760 l!1356))) key!387)) ((_ is Cons!36842) (t!51760 l!1356)) (bvslt (_1!12821 (h!38385 (t!51760 l!1356))) key!387)))))

(declare-fun b!1581984 () Bool)

(assert (=> b!1581984 (= e!882799 (containsKey!947 (t!51760 (t!51760 l!1356)) key!387))))

(assert (= (and d!166879 (not res!1080796)) b!1581983))

(assert (= (and b!1581983 res!1080797) b!1581984))

(declare-fun m!1452685 () Bool)

(assert (=> b!1581984 m!1452685))

(assert (=> b!1581931 d!166879))

(declare-fun d!166883 () Bool)

(declare-fun res!1080800 () Bool)

(declare-fun e!882802 () Bool)

(assert (=> d!166883 (=> res!1080800 e!882802)))

(assert (=> d!166883 (= res!1080800 (or ((_ is Nil!36843) (t!51760 l!1356)) ((_ is Nil!36843) (t!51760 (t!51760 l!1356)))))))

(assert (=> d!166883 (= (isStrictlySorted!1101 (t!51760 l!1356)) e!882802)))

(declare-fun b!1581987 () Bool)

(declare-fun e!882803 () Bool)

(assert (=> b!1581987 (= e!882802 e!882803)))

(declare-fun res!1080801 () Bool)

(assert (=> b!1581987 (=> (not res!1080801) (not e!882803))))

(assert (=> b!1581987 (= res!1080801 (bvslt (_1!12821 (h!38385 (t!51760 l!1356))) (_1!12821 (h!38385 (t!51760 (t!51760 l!1356))))))))

(declare-fun b!1581988 () Bool)

(assert (=> b!1581988 (= e!882803 (isStrictlySorted!1101 (t!51760 (t!51760 l!1356))))))

(assert (= (and d!166883 (not res!1080800)) b!1581987))

(assert (= (and b!1581987 res!1080801) b!1581988))

(declare-fun m!1452689 () Bool)

(assert (=> b!1581988 m!1452689))

(assert (=> b!1581930 d!166883))

(declare-fun b!1582004 () Bool)

(declare-fun e!882815 () Bool)

(declare-fun tp!114653 () Bool)

(assert (=> b!1582004 (= e!882815 (and tp_is_empty!39273 tp!114653))))

(assert (=> b!1581927 (= tp!114644 e!882815)))

(assert (= (and b!1581927 ((_ is Cons!36842) (t!51760 l!1356))) b!1582004))

(check-sat (not b!1581978) tp_is_empty!39273 (not b!1581960) (not b!1581988) (not b!1582004) (not b!1581984))
(check-sat)
