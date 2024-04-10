; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137624 () Bool)

(assert start!137624)

(declare-fun b!1582343 () Bool)

(declare-fun res!1081021 () Bool)

(declare-fun e!883058 () Bool)

(assert (=> b!1582343 (=> (not res!1081021) (not e!883058))))

(declare-datatypes ((B!2752 0))(
  ( (B!2753 (val!19738 Int)) )
))
(declare-datatypes ((tuple2!25644 0))(
  ( (tuple2!25645 (_1!12833 (_ BitVec 64)) (_2!12833 B!2752)) )
))
(declare-datatypes ((List!36858 0))(
  ( (Nil!36855) (Cons!36854 (h!38397 tuple2!25644) (t!51772 List!36858)) )
))
(declare-fun l!1356 () List!36858)

(get-info :version)

(assert (=> b!1582343 (= res!1081021 (not ((_ is Nil!36855) l!1356)))))

(declare-fun b!1582342 () Bool)

(declare-fun res!1081023 () Bool)

(assert (=> b!1582342 (=> (not res!1081023) (not e!883058))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!959 (List!36858 (_ BitVec 64)) Bool)

(assert (=> b!1582342 (= res!1081023 (not (containsKey!959 l!1356 key!387)))))

(declare-fun res!1081022 () Bool)

(assert (=> start!137624 (=> (not res!1081022) (not e!883058))))

(declare-fun isStrictlySorted!1113 (List!36858) Bool)

(assert (=> start!137624 (= res!1081022 (isStrictlySorted!1113 l!1356))))

(assert (=> start!137624 e!883058))

(declare-fun e!883057 () Bool)

(assert (=> start!137624 e!883057))

(assert (=> start!137624 true))

(declare-fun tp_is_empty!39297 () Bool)

(assert (=> start!137624 tp_is_empty!39297))

(declare-fun b!1582345 () Bool)

(declare-fun tp!114716 () Bool)

(assert (=> b!1582345 (= e!883057 (and tp_is_empty!39297 tp!114716))))

(declare-fun value!184 () B!2752)

(declare-fun b!1582344 () Bool)

(declare-fun contains!10518 (List!36858 tuple2!25644) Bool)

(assert (=> b!1582344 (= e!883058 (contains!10518 l!1356 (tuple2!25645 key!387 value!184)))))

(declare-datatypes ((Unit!52260 0))(
  ( (Unit!52261) )
))
(declare-fun lt!677070 () Unit!52260)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!8 (List!36858 (_ BitVec 64) B!2752) Unit!52260)

(assert (=> b!1582344 (= lt!677070 (lemmaNotContainsKeyThenNotContainsTuple!8 (t!51772 l!1356) key!387 value!184))))

(assert (= (and start!137624 res!1081022) b!1582342))

(assert (= (and b!1582342 res!1081023) b!1582343))

(assert (= (and b!1582343 res!1081021) b!1582344))

(assert (= (and start!137624 ((_ is Cons!36854) l!1356)) b!1582345))

(declare-fun m!1452829 () Bool)

(assert (=> b!1582342 m!1452829))

(declare-fun m!1452831 () Bool)

(assert (=> start!137624 m!1452831))

(declare-fun m!1452833 () Bool)

(assert (=> b!1582344 m!1452833))

(declare-fun m!1452835 () Bool)

(assert (=> b!1582344 m!1452835))

(check-sat (not b!1582342) tp_is_empty!39297 (not start!137624) (not b!1582344) (not b!1582345))
(check-sat)
(get-model)

(declare-fun lt!677078 () Bool)

(declare-fun d!166959 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!858 (List!36858) (InoxSet tuple2!25644))

(assert (=> d!166959 (= lt!677078 (select (content!858 l!1356) (tuple2!25645 key!387 value!184)))))

(declare-fun e!883080 () Bool)

(assert (=> d!166959 (= lt!677078 e!883080)))

(declare-fun res!1081048 () Bool)

(assert (=> d!166959 (=> (not res!1081048) (not e!883080))))

(assert (=> d!166959 (= res!1081048 ((_ is Cons!36854) l!1356))))

(assert (=> d!166959 (= (contains!10518 l!1356 (tuple2!25645 key!387 value!184)) lt!677078)))

(declare-fun b!1582372 () Bool)

(declare-fun e!883079 () Bool)

(assert (=> b!1582372 (= e!883080 e!883079)))

(declare-fun res!1081047 () Bool)

(assert (=> b!1582372 (=> res!1081047 e!883079)))

(assert (=> b!1582372 (= res!1081047 (= (h!38397 l!1356) (tuple2!25645 key!387 value!184)))))

(declare-fun b!1582373 () Bool)

(assert (=> b!1582373 (= e!883079 (contains!10518 (t!51772 l!1356) (tuple2!25645 key!387 value!184)))))

(assert (= (and d!166959 res!1081048) b!1582372))

(assert (= (and b!1582372 (not res!1081047)) b!1582373))

(declare-fun m!1452847 () Bool)

(assert (=> d!166959 m!1452847))

(declare-fun m!1452849 () Bool)

(assert (=> d!166959 m!1452849))

(declare-fun m!1452851 () Bool)

(assert (=> b!1582373 m!1452851))

(assert (=> b!1582344 d!166959))

(declare-fun d!166965 () Bool)

(assert (=> d!166965 (not (contains!10518 (t!51772 l!1356) (tuple2!25645 key!387 value!184)))))

(declare-fun lt!677084 () Unit!52260)

(declare-fun choose!2101 (List!36858 (_ BitVec 64) B!2752) Unit!52260)

(assert (=> d!166965 (= lt!677084 (choose!2101 (t!51772 l!1356) key!387 value!184))))

(declare-fun e!883093 () Bool)

(assert (=> d!166965 e!883093))

(declare-fun res!1081061 () Bool)

(assert (=> d!166965 (=> (not res!1081061) (not e!883093))))

(assert (=> d!166965 (= res!1081061 (isStrictlySorted!1113 (t!51772 l!1356)))))

(assert (=> d!166965 (= (lemmaNotContainsKeyThenNotContainsTuple!8 (t!51772 l!1356) key!387 value!184) lt!677084)))

(declare-fun b!1582386 () Bool)

(assert (=> b!1582386 (= e!883093 (not (containsKey!959 (t!51772 l!1356) key!387)))))

(assert (= (and d!166965 res!1081061) b!1582386))

(assert (=> d!166965 m!1452851))

(declare-fun m!1452861 () Bool)

(assert (=> d!166965 m!1452861))

(declare-fun m!1452863 () Bool)

(assert (=> d!166965 m!1452863))

(declare-fun m!1452865 () Bool)

(assert (=> b!1582386 m!1452865))

(assert (=> b!1582344 d!166965))

(declare-fun d!166971 () Bool)

(declare-fun res!1081077 () Bool)

(declare-fun e!883109 () Bool)

(assert (=> d!166971 (=> res!1081077 e!883109)))

(assert (=> d!166971 (= res!1081077 (and ((_ is Cons!36854) l!1356) (= (_1!12833 (h!38397 l!1356)) key!387)))))

(assert (=> d!166971 (= (containsKey!959 l!1356 key!387) e!883109)))

(declare-fun b!1582402 () Bool)

(declare-fun e!883110 () Bool)

(assert (=> b!1582402 (= e!883109 e!883110)))

(declare-fun res!1081078 () Bool)

(assert (=> b!1582402 (=> (not res!1081078) (not e!883110))))

(assert (=> b!1582402 (= res!1081078 (and (or (not ((_ is Cons!36854) l!1356)) (bvsle (_1!12833 (h!38397 l!1356)) key!387)) ((_ is Cons!36854) l!1356) (bvslt (_1!12833 (h!38397 l!1356)) key!387)))))

(declare-fun b!1582403 () Bool)

(assert (=> b!1582403 (= e!883110 (containsKey!959 (t!51772 l!1356) key!387))))

(assert (= (and d!166971 (not res!1081077)) b!1582402))

(assert (= (and b!1582402 res!1081078) b!1582403))

(assert (=> b!1582403 m!1452865))

(assert (=> b!1582342 d!166971))

(declare-fun d!166977 () Bool)

(declare-fun res!1081092 () Bool)

(declare-fun e!883124 () Bool)

(assert (=> d!166977 (=> res!1081092 e!883124)))

(assert (=> d!166977 (= res!1081092 (or ((_ is Nil!36855) l!1356) ((_ is Nil!36855) (t!51772 l!1356))))))

(assert (=> d!166977 (= (isStrictlySorted!1113 l!1356) e!883124)))

(declare-fun b!1582417 () Bool)

(declare-fun e!883125 () Bool)

(assert (=> b!1582417 (= e!883124 e!883125)))

(declare-fun res!1081093 () Bool)

(assert (=> b!1582417 (=> (not res!1081093) (not e!883125))))

(assert (=> b!1582417 (= res!1081093 (bvslt (_1!12833 (h!38397 l!1356)) (_1!12833 (h!38397 (t!51772 l!1356)))))))

(declare-fun b!1582418 () Bool)

(assert (=> b!1582418 (= e!883125 (isStrictlySorted!1113 (t!51772 l!1356)))))

(assert (= (and d!166977 (not res!1081092)) b!1582417))

(assert (= (and b!1582417 res!1081093) b!1582418))

(assert (=> b!1582418 m!1452863))

(assert (=> start!137624 d!166977))

(declare-fun b!1582434 () Bool)

(declare-fun e!883135 () Bool)

(declare-fun tp!114727 () Bool)

(assert (=> b!1582434 (= e!883135 (and tp_is_empty!39297 tp!114727))))

(assert (=> b!1582345 (= tp!114716 e!883135)))

(assert (= (and b!1582345 ((_ is Cons!36854) (t!51772 l!1356))) b!1582434))

(check-sat tp_is_empty!39297 (not d!166965) (not b!1582403) (not b!1582434) (not b!1582386) (not d!166959) (not b!1582373) (not b!1582418))
(check-sat)
