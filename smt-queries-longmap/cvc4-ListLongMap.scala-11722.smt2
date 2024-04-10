; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137230 () Bool)

(assert start!137230)

(declare-fun b!1580757 () Bool)

(declare-fun e!881912 () Bool)

(declare-fun e!881911 () Bool)

(assert (=> b!1580757 (= e!881912 e!881911)))

(declare-fun res!1079888 () Bool)

(assert (=> b!1580757 (=> (not res!1079888) (not e!881911))))

(declare-fun e!881908 () Bool)

(assert (=> b!1580757 (= res!1079888 e!881908)))

(declare-fun res!1079890 () Bool)

(assert (=> b!1580757 (=> res!1079890 e!881908)))

(declare-datatypes ((B!2676 0))(
  ( (B!2677 (val!19700 Int)) )
))
(declare-datatypes ((tuple2!25536 0))(
  ( (tuple2!25537 (_1!12779 (_ BitVec 64)) (_2!12779 B!2676)) )
))
(declare-datatypes ((List!36820 0))(
  ( (Nil!36817) (Cons!36816 (h!38359 tuple2!25536) (t!51734 List!36820)) )
))
(declare-datatypes ((tuple2!25538 0))(
  ( (tuple2!25539 (_1!12780 tuple2!25536) (_2!12780 List!36820)) )
))
(declare-datatypes ((Option!910 0))(
  ( (Some!909 (v!22413 tuple2!25538)) (None!908) )
))
(declare-fun lt!676812 () Option!910)

(declare-fun isEmpty!1171 (Option!910) Bool)

(assert (=> b!1580757 (= res!1079890 (isEmpty!1171 lt!676812))))

(declare-fun l!1390 () List!36820)

(declare-fun unapply!87 (List!36820) Option!910)

(assert (=> b!1580757 (= lt!676812 (unapply!87 l!1390))))

(declare-fun b!1580758 () Bool)

(declare-fun get!26800 (Option!910) tuple2!25538)

(assert (=> b!1580758 (= e!881908 (not (is-Nil!36817 (_2!12780 (get!26800 lt!676812)))))))

(declare-fun b!1580759 () Bool)

(declare-fun res!1079886 () Bool)

(assert (=> b!1580759 (=> (not res!1079886) (not e!881912))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2676)

(declare-fun contains!10492 (List!36820 tuple2!25536) Bool)

(assert (=> b!1580759 (= res!1079886 (contains!10492 l!1390 (tuple2!25537 key!405 value!194)))))

(declare-fun b!1580760 () Bool)

(declare-fun e!881910 () Bool)

(declare-fun tp_is_empty!39221 () Bool)

(declare-fun tp!114512 () Bool)

(assert (=> b!1580760 (= e!881910 (and tp_is_empty!39221 tp!114512))))

(declare-fun res!1079889 () Bool)

(assert (=> start!137230 (=> (not res!1079889) (not e!881912))))

(declare-fun isStrictlySorted!1078 (List!36820) Bool)

(assert (=> start!137230 (= res!1079889 (isStrictlySorted!1078 l!1390))))

(assert (=> start!137230 e!881912))

(assert (=> start!137230 e!881910))

(assert (=> start!137230 true))

(assert (=> start!137230 tp_is_empty!39221))

(declare-fun b!1580761 () Bool)

(declare-fun res!1079887 () Bool)

(assert (=> b!1580761 (=> (not res!1079887) (not e!881912))))

(declare-fun containsKey!924 (List!36820 (_ BitVec 64)) Bool)

(assert (=> b!1580761 (= res!1079887 (containsKey!924 l!1390 key!405))))

(declare-fun b!1580762 () Bool)

(declare-fun res!1079892 () Bool)

(assert (=> b!1580762 (=> (not res!1079892) (not e!881911))))

(assert (=> b!1580762 (= res!1079892 (and (is-Cons!36816 l!1390) (= (_1!12779 (h!38359 l!1390)) key!405)))))

(declare-fun b!1580763 () Bool)

(declare-fun e!881909 () Bool)

(assert (=> b!1580763 (= e!881909 (containsKey!924 (t!51734 l!1390) key!405))))

(declare-fun b!1580764 () Bool)

(assert (=> b!1580764 (= e!881911 e!881909)))

(declare-fun res!1079891 () Bool)

(assert (=> b!1580764 (=> res!1079891 e!881909)))

(assert (=> b!1580764 (= res!1079891 (not (isStrictlySorted!1078 (t!51734 l!1390))))))

(assert (= (and start!137230 res!1079889) b!1580761))

(assert (= (and b!1580761 res!1079887) b!1580759))

(assert (= (and b!1580759 res!1079886) b!1580757))

(assert (= (and b!1580757 (not res!1079890)) b!1580758))

(assert (= (and b!1580757 res!1079888) b!1580762))

(assert (= (and b!1580762 res!1079892) b!1580764))

(assert (= (and b!1580764 (not res!1079891)) b!1580763))

(assert (= (and start!137230 (is-Cons!36816 l!1390)) b!1580760))

(declare-fun m!1452031 () Bool)

(assert (=> b!1580759 m!1452031))

(declare-fun m!1452033 () Bool)

(assert (=> b!1580761 m!1452033))

(declare-fun m!1452035 () Bool)

(assert (=> start!137230 m!1452035))

(declare-fun m!1452037 () Bool)

(assert (=> b!1580757 m!1452037))

(declare-fun m!1452039 () Bool)

(assert (=> b!1580757 m!1452039))

(declare-fun m!1452041 () Bool)

(assert (=> b!1580763 m!1452041))

(declare-fun m!1452043 () Bool)

(assert (=> b!1580764 m!1452043))

(declare-fun m!1452045 () Bool)

(assert (=> b!1580758 m!1452045))

(push 1)

(assert tp_is_empty!39221)

(assert (not b!1580764))

(assert (not b!1580761))

(assert (not b!1580759))

(assert (not b!1580763))

(assert (not b!1580758))

(assert (not b!1580757))

(assert (not b!1580760))

(assert (not start!137230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166503 () Bool)

(declare-fun res!1079907 () Bool)

(declare-fun e!881927 () Bool)

(assert (=> d!166503 (=> res!1079907 e!881927)))

(assert (=> d!166503 (= res!1079907 (or (is-Nil!36817 (t!51734 l!1390)) (is-Nil!36817 (t!51734 (t!51734 l!1390)))))))

(assert (=> d!166503 (= (isStrictlySorted!1078 (t!51734 l!1390)) e!881927)))

(declare-fun b!1580779 () Bool)

(declare-fun e!881928 () Bool)

(assert (=> b!1580779 (= e!881927 e!881928)))

(declare-fun res!1079908 () Bool)

(assert (=> b!1580779 (=> (not res!1079908) (not e!881928))))

(assert (=> b!1580779 (= res!1079908 (bvslt (_1!12779 (h!38359 (t!51734 l!1390))) (_1!12779 (h!38359 (t!51734 (t!51734 l!1390))))))))

(declare-fun b!1580780 () Bool)

(assert (=> b!1580780 (= e!881928 (isStrictlySorted!1078 (t!51734 (t!51734 l!1390))))))

(assert (= (and d!166503 (not res!1079907)) b!1580779))

(assert (= (and b!1580779 res!1079908) b!1580780))

(declare-fun m!1452047 () Bool)

(assert (=> b!1580780 m!1452047))

(assert (=> b!1580764 d!166503))

(declare-fun lt!676818 () Bool)

(declare-fun d!166509 () Bool)

(declare-fun content!838 (List!36820) (Set tuple2!25536))

(assert (=> d!166509 (= lt!676818 (member (tuple2!25537 key!405 value!194) (content!838 l!1390)))))

(declare-fun e!881945 () Bool)

(assert (=> d!166509 (= lt!676818 e!881945)))

(declare-fun res!1079926 () Bool)

(assert (=> d!166509 (=> (not res!1079926) (not e!881945))))

(assert (=> d!166509 (= res!1079926 (is-Cons!36816 l!1390))))

(assert (=> d!166509 (= (contains!10492 l!1390 (tuple2!25537 key!405 value!194)) lt!676818)))

(declare-fun b!1580797 () Bool)

(declare-fun e!881946 () Bool)

(assert (=> b!1580797 (= e!881945 e!881946)))

(declare-fun res!1079925 () Bool)

(assert (=> b!1580797 (=> res!1079925 e!881946)))

(assert (=> b!1580797 (= res!1079925 (= (h!38359 l!1390) (tuple2!25537 key!405 value!194)))))

(declare-fun b!1580798 () Bool)

(assert (=> b!1580798 (= e!881946 (contains!10492 (t!51734 l!1390) (tuple2!25537 key!405 value!194)))))

(assert (= (and d!166509 res!1079926) b!1580797))

(assert (= (and b!1580797 (not res!1079925)) b!1580798))

(declare-fun m!1452059 () Bool)

(assert (=> d!166509 m!1452059))

(declare-fun m!1452061 () Bool)

(assert (=> d!166509 m!1452061))

(declare-fun m!1452063 () Bool)

(assert (=> b!1580798 m!1452063))

(assert (=> b!1580759 d!166509))

(declare-fun d!166527 () Bool)

(assert (=> d!166527 (= (isEmpty!1171 lt!676812) (not (is-Some!909 lt!676812)))))

(assert (=> b!1580757 d!166527))

(declare-fun d!166529 () Bool)

(assert (=> d!166529 (= (unapply!87 l!1390) (ite (is-Nil!36817 l!1390) None!908 (Some!909 (tuple2!25539 (h!38359 l!1390) (t!51734 l!1390)))))))

(assert (=> b!1580757 d!166529))

(declare-fun d!166531 () Bool)

(assert (=> d!166531 (= (get!26800 lt!676812) (v!22413 lt!676812))))

(assert (=> b!1580758 d!166531))

(declare-fun d!166533 () Bool)

(declare-fun res!1079947 () Bool)

(declare-fun e!881970 () Bool)

(assert (=> d!166533 (=> res!1079947 e!881970)))

(assert (=> d!166533 (= res!1079947 (and (is-Cons!36816 (t!51734 l!1390)) (= (_1!12779 (h!38359 (t!51734 l!1390))) key!405)))))

(assert (=> d!166533 (= (containsKey!924 (t!51734 l!1390) key!405) e!881970)))

(declare-fun b!1580824 () Bool)

(declare-fun e!881971 () Bool)

(assert (=> b!1580824 (= e!881970 e!881971)))

(declare-fun res!1079948 () Bool)

(assert (=> b!1580824 (=> (not res!1079948) (not e!881971))))

(assert (=> b!1580824 (= res!1079948 (and (or (not (is-Cons!36816 (t!51734 l!1390))) (bvsle (_1!12779 (h!38359 (t!51734 l!1390))) key!405)) (is-Cons!36816 (t!51734 l!1390)) (bvslt (_1!12779 (h!38359 (t!51734 l!1390))) key!405)))))

(declare-fun b!1580825 () Bool)

(assert (=> b!1580825 (= e!881971 (containsKey!924 (t!51734 (t!51734 l!1390)) key!405))))

(assert (= (and d!166533 (not res!1079947)) b!1580824))

(assert (= (and b!1580824 res!1079948) b!1580825))

(declare-fun m!1452073 () Bool)

(assert (=> b!1580825 m!1452073))

(assert (=> b!1580763 d!166533))

(declare-fun d!166539 () Bool)

(declare-fun res!1079949 () Bool)

(declare-fun e!881972 () Bool)

(assert (=> d!166539 (=> res!1079949 e!881972)))

(assert (=> d!166539 (= res!1079949 (and (is-Cons!36816 l!1390) (= (_1!12779 (h!38359 l!1390)) key!405)))))

(assert (=> d!166539 (= (containsKey!924 l!1390 key!405) e!881972)))

(declare-fun b!1580826 () Bool)

(declare-fun e!881973 () Bool)

(assert (=> b!1580826 (= e!881972 e!881973)))

(declare-fun res!1079950 () Bool)

(assert (=> b!1580826 (=> (not res!1079950) (not e!881973))))

(assert (=> b!1580826 (= res!1079950 (and (or (not (is-Cons!36816 l!1390)) (bvsle (_1!12779 (h!38359 l!1390)) key!405)) (is-Cons!36816 l!1390) (bvslt (_1!12779 (h!38359 l!1390)) key!405)))))

(declare-fun b!1580827 () Bool)

(assert (=> b!1580827 (= e!881973 (containsKey!924 (t!51734 l!1390) key!405))))

(assert (= (and d!166539 (not res!1079949)) b!1580826))

(assert (= (and b!1580826 res!1079950) b!1580827))

(assert (=> b!1580827 m!1452041))

(assert (=> b!1580761 d!166539))

(declare-fun d!166541 () Bool)

(declare-fun res!1079951 () Bool)

(declare-fun e!881974 () Bool)

(assert (=> d!166541 (=> res!1079951 e!881974)))

(assert (=> d!166541 (= res!1079951 (or (is-Nil!36817 l!1390) (is-Nil!36817 (t!51734 l!1390))))))

(assert (=> d!166541 (= (isStrictlySorted!1078 l!1390) e!881974)))

(declare-fun b!1580828 () Bool)

(declare-fun e!881975 () Bool)

(assert (=> b!1580828 (= e!881974 e!881975)))

(declare-fun res!1079952 () Bool)

(assert (=> b!1580828 (=> (not res!1079952) (not e!881975))))

(assert (=> b!1580828 (= res!1079952 (bvslt (_1!12779 (h!38359 l!1390)) (_1!12779 (h!38359 (t!51734 l!1390)))))))

(declare-fun b!1580829 () Bool)

(assert (=> b!1580829 (= e!881975 (isStrictlySorted!1078 (t!51734 l!1390)))))

(assert (= (and d!166541 (not res!1079951)) b!1580828))

(assert (= (and b!1580828 res!1079952) b!1580829))

(assert (=> b!1580829 m!1452043))

(assert (=> start!137230 d!166541))

(declare-fun b!1580836 () Bool)

(declare-fun e!881980 () Bool)

(declare-fun tp!114518 () Bool)

(assert (=> b!1580836 (= e!881980 (and tp_is_empty!39221 tp!114518))))

(assert (=> b!1580760 (= tp!114512 e!881980)))

(assert (= (and b!1580760 (is-Cons!36816 (t!51734 l!1390))) b!1580836))

(push 1)

(assert tp_is_empty!39221)

(assert (not b!1580829))

(assert (not b!1580798))

(assert (not b!1580825))

(assert (not b!1580827))

(assert (not b!1580780))

(assert (not d!166509))

(assert (not b!1580836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

