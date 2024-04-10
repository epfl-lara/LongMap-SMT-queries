; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137226 () Bool)

(assert start!137226)

(declare-fun b!1580709 () Bool)

(declare-fun e!881878 () Bool)

(declare-fun e!881881 () Bool)

(assert (=> b!1580709 (= e!881878 e!881881)))

(declare-fun res!1079846 () Bool)

(assert (=> b!1580709 (=> res!1079846 e!881881)))

(declare-datatypes ((B!2672 0))(
  ( (B!2673 (val!19698 Int)) )
))
(declare-datatypes ((tuple2!25528 0))(
  ( (tuple2!25529 (_1!12775 (_ BitVec 64)) (_2!12775 B!2672)) )
))
(declare-datatypes ((List!36818 0))(
  ( (Nil!36815) (Cons!36814 (h!38357 tuple2!25528) (t!51732 List!36818)) )
))
(declare-fun l!1390 () List!36818)

(declare-fun isStrictlySorted!1076 (List!36818) Bool)

(assert (=> b!1580709 (= res!1079846 (not (isStrictlySorted!1076 (t!51732 l!1390))))))

(declare-fun b!1580710 () Bool)

(declare-fun res!1079847 () Bool)

(assert (=> b!1580710 (=> (not res!1079847) (not e!881878))))

(declare-fun key!405 () (_ BitVec 64))

(assert (=> b!1580710 (= res!1079847 (and (is-Cons!36814 l!1390) (= (_1!12775 (h!38357 l!1390)) key!405)))))

(declare-fun b!1580711 () Bool)

(declare-fun res!1079845 () Bool)

(declare-fun e!881880 () Bool)

(assert (=> b!1580711 (=> (not res!1079845) (not e!881880))))

(declare-fun value!194 () B!2672)

(declare-fun contains!10490 (List!36818 tuple2!25528) Bool)

(assert (=> b!1580711 (= res!1079845 (contains!10490 l!1390 (tuple2!25529 key!405 value!194)))))

(declare-fun b!1580712 () Bool)

(declare-fun containsKey!922 (List!36818 (_ BitVec 64)) Bool)

(assert (=> b!1580712 (= e!881881 (containsKey!922 (t!51732 l!1390) key!405))))

(declare-fun b!1580713 () Bool)

(declare-fun res!1079848 () Bool)

(assert (=> b!1580713 (=> (not res!1079848) (not e!881880))))

(assert (=> b!1580713 (= res!1079848 (containsKey!922 l!1390 key!405))))

(declare-fun b!1580714 () Bool)

(declare-fun e!881882 () Bool)

(declare-datatypes ((tuple2!25530 0))(
  ( (tuple2!25531 (_1!12776 tuple2!25528) (_2!12776 List!36818)) )
))
(declare-datatypes ((Option!908 0))(
  ( (Some!907 (v!22411 tuple2!25530)) (None!906) )
))
(declare-fun lt!676806 () Option!908)

(declare-fun get!26798 (Option!908) tuple2!25530)

(assert (=> b!1580714 (= e!881882 (not (is-Nil!36815 (_2!12776 (get!26798 lt!676806)))))))

(declare-fun res!1079844 () Bool)

(assert (=> start!137226 (=> (not res!1079844) (not e!881880))))

(assert (=> start!137226 (= res!1079844 (isStrictlySorted!1076 l!1390))))

(assert (=> start!137226 e!881880))

(declare-fun e!881879 () Bool)

(assert (=> start!137226 e!881879))

(assert (=> start!137226 true))

(declare-fun tp_is_empty!39217 () Bool)

(assert (=> start!137226 tp_is_empty!39217))

(declare-fun b!1580715 () Bool)

(declare-fun tp!114506 () Bool)

(assert (=> b!1580715 (= e!881879 (and tp_is_empty!39217 tp!114506))))

(declare-fun b!1580716 () Bool)

(assert (=> b!1580716 (= e!881880 e!881878)))

(declare-fun res!1079850 () Bool)

(assert (=> b!1580716 (=> (not res!1079850) (not e!881878))))

(assert (=> b!1580716 (= res!1079850 e!881882)))

(declare-fun res!1079849 () Bool)

(assert (=> b!1580716 (=> res!1079849 e!881882)))

(declare-fun isEmpty!1169 (Option!908) Bool)

(assert (=> b!1580716 (= res!1079849 (isEmpty!1169 lt!676806))))

(declare-fun unapply!85 (List!36818) Option!908)

(assert (=> b!1580716 (= lt!676806 (unapply!85 l!1390))))

(assert (= (and start!137226 res!1079844) b!1580713))

(assert (= (and b!1580713 res!1079848) b!1580711))

(assert (= (and b!1580711 res!1079845) b!1580716))

(assert (= (and b!1580716 (not res!1079849)) b!1580714))

(assert (= (and b!1580716 res!1079850) b!1580710))

(assert (= (and b!1580710 res!1079847) b!1580709))

(assert (= (and b!1580709 (not res!1079846)) b!1580712))

(assert (= (and start!137226 (is-Cons!36814 l!1390)) b!1580715))

(declare-fun m!1451999 () Bool)

(assert (=> b!1580716 m!1451999))

(declare-fun m!1452001 () Bool)

(assert (=> b!1580716 m!1452001))

(declare-fun m!1452003 () Bool)

(assert (=> b!1580713 m!1452003))

(declare-fun m!1452005 () Bool)

(assert (=> b!1580714 m!1452005))

(declare-fun m!1452007 () Bool)

(assert (=> b!1580711 m!1452007))

(declare-fun m!1452009 () Bool)

(assert (=> b!1580712 m!1452009))

(declare-fun m!1452011 () Bool)

(assert (=> b!1580709 m!1452011))

(declare-fun m!1452013 () Bool)

(assert (=> start!137226 m!1452013))

(push 1)

(assert (not b!1580715))

(assert (not b!1580714))

(assert (not b!1580713))

(assert (not b!1580716))

(assert (not b!1580712))

(assert (not b!1580711))

(assert (not start!137226))

(assert tp_is_empty!39217)

(assert (not b!1580709))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166507 () Bool)

(declare-fun lt!676815 () Bool)

(declare-fun content!837 (List!36818) (Set tuple2!25528))

(assert (=> d!166507 (= lt!676815 (set.member (tuple2!25529 key!405 value!194) (content!837 l!1390)))))

(declare-fun e!881938 () Bool)

(assert (=> d!166507 (= lt!676815 e!881938)))

(declare-fun res!1079917 () Bool)

(assert (=> d!166507 (=> (not res!1079917) (not e!881938))))

(assert (=> d!166507 (= res!1079917 (is-Cons!36814 l!1390))))

(assert (=> d!166507 (= (contains!10490 l!1390 (tuple2!25529 key!405 value!194)) lt!676815)))

(declare-fun b!1580789 () Bool)

(declare-fun e!881937 () Bool)

(assert (=> b!1580789 (= e!881938 e!881937)))

(declare-fun res!1079918 () Bool)

(assert (=> b!1580789 (=> res!1079918 e!881937)))

(assert (=> b!1580789 (= res!1079918 (= (h!38357 l!1390) (tuple2!25529 key!405 value!194)))))

(declare-fun b!1580790 () Bool)

(assert (=> b!1580790 (= e!881937 (contains!10490 (t!51732 l!1390) (tuple2!25529 key!405 value!194)))))

(assert (= (and d!166507 res!1079917) b!1580789))

(assert (= (and b!1580789 (not res!1079918)) b!1580790))

(declare-fun m!1452053 () Bool)

(assert (=> d!166507 m!1452053))

(declare-fun m!1452055 () Bool)

(assert (=> d!166507 m!1452055))

(declare-fun m!1452057 () Bool)

(assert (=> b!1580790 m!1452057))

(assert (=> b!1580711 d!166507))

(declare-fun d!166517 () Bool)

(assert (=> d!166517 (= (isEmpty!1169 lt!676806) (not (is-Some!907 lt!676806)))))

(assert (=> b!1580716 d!166517))

(declare-fun d!166519 () Bool)

(assert (=> d!166519 (= (unapply!85 l!1390) (ite (is-Nil!36815 l!1390) None!906 (Some!907 (tuple2!25531 (h!38357 l!1390) (t!51732 l!1390)))))))

(assert (=> b!1580716 d!166519))

(declare-fun d!166525 () Bool)

(declare-fun res!1079935 () Bool)

(declare-fun e!881955 () Bool)

(assert (=> d!166525 (=> res!1079935 e!881955)))

(assert (=> d!166525 (= res!1079935 (or (is-Nil!36815 (t!51732 l!1390)) (is-Nil!36815 (t!51732 (t!51732 l!1390)))))))

(assert (=> d!166525 (= (isStrictlySorted!1076 (t!51732 l!1390)) e!881955)))

(declare-fun b!1580807 () Bool)

(declare-fun e!881956 () Bool)

(assert (=> b!1580807 (= e!881955 e!881956)))

(declare-fun res!1079936 () Bool)

(assert (=> b!1580807 (=> (not res!1079936) (not e!881956))))

(assert (=> b!1580807 (= res!1079936 (bvslt (_1!12775 (h!38357 (t!51732 l!1390))) (_1!12775 (h!38357 (t!51732 (t!51732 l!1390))))))))

(declare-fun b!1580808 () Bool)

(assert (=> b!1580808 (= e!881956 (isStrictlySorted!1076 (t!51732 (t!51732 l!1390))))))

(assert (= (and d!166525 (not res!1079935)) b!1580807))

(assert (= (and b!1580807 res!1079936) b!1580808))

(declare-fun m!1452065 () Bool)

(assert (=> b!1580808 m!1452065))

(assert (=> b!1580709 d!166525))

(declare-fun d!166535 () Bool)

(assert (=> d!166535 (= (get!26798 lt!676806) (v!22411 lt!676806))))

(assert (=> b!1580714 d!166535))

(declare-fun d!166537 () Bool)

(declare-fun res!1079953 () Bool)

(declare-fun e!881978 () Bool)

(assert (=> d!166537 (=> res!1079953 e!881978)))

(assert (=> d!166537 (= res!1079953 (and (is-Cons!36814 l!1390) (= (_1!12775 (h!38357 l!1390)) key!405)))))

(assert (=> d!166537 (= (containsKey!922 l!1390 key!405) e!881978)))

(declare-fun b!1580834 () Bool)

(declare-fun e!881979 () Bool)

(assert (=> b!1580834 (= e!881978 e!881979)))

(declare-fun res!1079954 () Bool)

(assert (=> b!1580834 (=> (not res!1079954) (not e!881979))))

(assert (=> b!1580834 (= res!1079954 (and (or (not (is-Cons!36814 l!1390)) (bvsle (_1!12775 (h!38357 l!1390)) key!405)) (is-Cons!36814 l!1390) (bvslt (_1!12775 (h!38357 l!1390)) key!405)))))

(declare-fun b!1580835 () Bool)

(assert (=> b!1580835 (= e!881979 (containsKey!922 (t!51732 l!1390) key!405))))

(assert (= (and d!166537 (not res!1079953)) b!1580834))

(assert (= (and b!1580834 res!1079954) b!1580835))

(assert (=> b!1580835 m!1452009))

(assert (=> b!1580713 d!166537))

(declare-fun d!166543 () Bool)

(declare-fun res!1079955 () Bool)

(declare-fun e!881981 () Bool)

(assert (=> d!166543 (=> res!1079955 e!881981)))

(assert (=> d!166543 (= res!1079955 (or (is-Nil!36815 l!1390) (is-Nil!36815 (t!51732 l!1390))))))

(assert (=> d!166543 (= (isStrictlySorted!1076 l!1390) e!881981)))

(declare-fun b!1580837 () Bool)

(declare-fun e!881982 () Bool)

(assert (=> b!1580837 (= e!881981 e!881982)))

(declare-fun res!1079956 () Bool)

(assert (=> b!1580837 (=> (not res!1079956) (not e!881982))))

(assert (=> b!1580837 (= res!1079956 (bvslt (_1!12775 (h!38357 l!1390)) (_1!12775 (h!38357 (t!51732 l!1390)))))))

(declare-fun b!1580838 () Bool)

(assert (=> b!1580838 (= e!881982 (isStrictlySorted!1076 (t!51732 l!1390)))))

(assert (= (and d!166543 (not res!1079955)) b!1580837))

(assert (= (and b!1580837 res!1079956) b!1580838))

(assert (=> b!1580838 m!1452011))

(assert (=> start!137226 d!166543))

(declare-fun d!166545 () Bool)

(declare-fun res!1079957 () Bool)

(declare-fun e!881983 () Bool)

(assert (=> d!166545 (=> res!1079957 e!881983)))

(assert (=> d!166545 (= res!1079957 (and (is-Cons!36814 (t!51732 l!1390)) (= (_1!12775 (h!38357 (t!51732 l!1390))) key!405)))))

(assert (=> d!166545 (= (containsKey!922 (t!51732 l!1390) key!405) e!881983)))

(declare-fun b!1580839 () Bool)

(declare-fun e!881984 () Bool)

(assert (=> b!1580839 (= e!881983 e!881984)))

(declare-fun res!1079958 () Bool)

(assert (=> b!1580839 (=> (not res!1079958) (not e!881984))))

(assert (=> b!1580839 (= res!1079958 (and (or (not (is-Cons!36814 (t!51732 l!1390))) (bvsle (_1!12775 (h!38357 (t!51732 l!1390))) key!405)) (is-Cons!36814 (t!51732 l!1390)) (bvslt (_1!12775 (h!38357 (t!51732 l!1390))) key!405)))))

(declare-fun b!1580840 () Bool)

(assert (=> b!1580840 (= e!881984 (containsKey!922 (t!51732 (t!51732 l!1390)) key!405))))

(assert (= (and d!166545 (not res!1079957)) b!1580839))

(assert (= (and b!1580839 res!1079958) b!1580840))

(declare-fun m!1452075 () Bool)

(assert (=> b!1580840 m!1452075))

(assert (=> b!1580712 d!166545))

(declare-fun b!1580845 () Bool)

(declare-fun e!881987 () Bool)

(declare-fun tp!114521 () Bool)

(assert (=> b!1580845 (= e!881987 (and tp_is_empty!39217 tp!114521))))

(assert (=> b!1580715 (= tp!114506 e!881987)))

(assert (= (and b!1580715 (is-Cons!36814 (t!51732 l!1390))) b!1580845))

(push 1)

(assert (not b!1580835))

(assert (not b!1580840))

(assert (not b!1580790))

(assert tp_is_empty!39217)

(assert (not d!166507))

(assert (not b!1580808))

(assert (not b!1580845))

(assert (not b!1580838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

