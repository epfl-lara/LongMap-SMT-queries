; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138062 () Bool)

(assert start!138062)

(declare-datatypes ((B!2750 0))(
  ( (B!2751 (val!19737 Int)) )
))
(declare-datatypes ((tuple2!25702 0))(
  ( (tuple2!25703 (_1!12862 (_ BitVec 64)) (_2!12862 B!2750)) )
))
(declare-datatypes ((List!36889 0))(
  ( (Nil!36886) (Cons!36885 (h!38446 tuple2!25702) (t!51795 List!36889)) )
))
(declare-fun l!1356 () List!36889)

(declare-fun e!884608 () Bool)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun value!184 () B!2750)

(declare-fun b!1584839 () Bool)

(declare-fun contains!10562 (List!36889 tuple2!25702) Bool)

(assert (=> b!1584839 (= e!884608 (contains!10562 l!1356 (tuple2!25703 key!387 value!184)))))

(declare-datatypes ((Unit!52165 0))(
  ( (Unit!52166) )
))
(declare-fun lt!677976 () Unit!52165)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!7 (List!36889 (_ BitVec 64) B!2750) Unit!52165)

(assert (=> b!1584839 (= lt!677976 (lemmaNotContainsKeyThenNotContainsTuple!7 (t!51795 l!1356) key!387 value!184))))

(declare-fun b!1584840 () Bool)

(declare-fun e!884609 () Bool)

(declare-fun tp_is_empty!39295 () Bool)

(declare-fun tp!114714 () Bool)

(assert (=> b!1584840 (= e!884609 (and tp_is_empty!39295 tp!114714))))

(declare-fun b!1584838 () Bool)

(declare-fun res!1081933 () Bool)

(assert (=> b!1584838 (=> (not res!1081933) (not e!884608))))

(get-info :version)

(assert (=> b!1584838 (= res!1081933 (not ((_ is Nil!36886) l!1356)))))

(declare-fun b!1584837 () Bool)

(declare-fun res!1081932 () Bool)

(assert (=> b!1584837 (=> (not res!1081932) (not e!884608))))

(declare-fun containsKey!959 (List!36889 (_ BitVec 64)) Bool)

(assert (=> b!1584837 (= res!1081932 (not (containsKey!959 l!1356 key!387)))))

(declare-fun res!1081934 () Bool)

(assert (=> start!138062 (=> (not res!1081934) (not e!884608))))

(declare-fun isStrictlySorted!1100 (List!36889) Bool)

(assert (=> start!138062 (= res!1081934 (isStrictlySorted!1100 l!1356))))

(assert (=> start!138062 e!884608))

(assert (=> start!138062 e!884609))

(assert (=> start!138062 true))

(assert (=> start!138062 tp_is_empty!39295))

(assert (= (and start!138062 res!1081934) b!1584837))

(assert (= (and b!1584837 res!1081932) b!1584838))

(assert (= (and b!1584838 res!1081933) b!1584839))

(assert (= (and start!138062 ((_ is Cons!36885) l!1356)) b!1584840))

(declare-fun m!1455147 () Bool)

(assert (=> b!1584839 m!1455147))

(declare-fun m!1455149 () Bool)

(assert (=> b!1584839 m!1455149))

(declare-fun m!1455151 () Bool)

(assert (=> b!1584837 m!1455151))

(declare-fun m!1455153 () Bool)

(assert (=> start!138062 m!1455153))

(check-sat tp_is_empty!39295 (not start!138062) (not b!1584840) (not b!1584837) (not b!1584839))
(check-sat)
(get-model)

(declare-fun d!167689 () Bool)

(declare-fun res!1081962 () Bool)

(declare-fun e!884631 () Bool)

(assert (=> d!167689 (=> res!1081962 e!884631)))

(assert (=> d!167689 (= res!1081962 (or ((_ is Nil!36886) l!1356) ((_ is Nil!36886) (t!51795 l!1356))))))

(assert (=> d!167689 (= (isStrictlySorted!1100 l!1356) e!884631)))

(declare-fun b!1584874 () Bool)

(declare-fun e!884633 () Bool)

(assert (=> b!1584874 (= e!884631 e!884633)))

(declare-fun res!1081964 () Bool)

(assert (=> b!1584874 (=> (not res!1081964) (not e!884633))))

(assert (=> b!1584874 (= res!1081964 (bvslt (_1!12862 (h!38446 l!1356)) (_1!12862 (h!38446 (t!51795 l!1356)))))))

(declare-fun b!1584876 () Bool)

(assert (=> b!1584876 (= e!884633 (isStrictlySorted!1100 (t!51795 l!1356)))))

(assert (= (and d!167689 (not res!1081962)) b!1584874))

(assert (= (and b!1584874 res!1081964) b!1584876))

(declare-fun m!1455172 () Bool)

(assert (=> b!1584876 m!1455172))

(assert (=> start!138062 d!167689))

(declare-fun d!167693 () Bool)

(declare-fun res!1081981 () Bool)

(declare-fun e!884650 () Bool)

(assert (=> d!167693 (=> res!1081981 e!884650)))

(assert (=> d!167693 (= res!1081981 (and ((_ is Cons!36885) l!1356) (= (_1!12862 (h!38446 l!1356)) key!387)))))

(assert (=> d!167693 (= (containsKey!959 l!1356 key!387) e!884650)))

(declare-fun b!1584893 () Bool)

(declare-fun e!884651 () Bool)

(assert (=> b!1584893 (= e!884650 e!884651)))

(declare-fun res!1081982 () Bool)

(assert (=> b!1584893 (=> (not res!1081982) (not e!884651))))

(assert (=> b!1584893 (= res!1081982 (and (or (not ((_ is Cons!36885) l!1356)) (bvsle (_1!12862 (h!38446 l!1356)) key!387)) ((_ is Cons!36885) l!1356) (bvslt (_1!12862 (h!38446 l!1356)) key!387)))))

(declare-fun b!1584894 () Bool)

(assert (=> b!1584894 (= e!884651 (containsKey!959 (t!51795 l!1356) key!387))))

(assert (= (and d!167693 (not res!1081981)) b!1584893))

(assert (= (and b!1584893 res!1081982) b!1584894))

(declare-fun m!1455183 () Bool)

(assert (=> b!1584894 m!1455183))

(assert (=> b!1584837 d!167693))

(declare-fun d!167701 () Bool)

(declare-fun lt!677994 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!845 (List!36889) (InoxSet tuple2!25702))

(assert (=> d!167701 (= lt!677994 (select (content!845 l!1356) (tuple2!25703 key!387 value!184)))))

(declare-fun e!884665 () Bool)

(assert (=> d!167701 (= lt!677994 e!884665)))

(declare-fun res!1081997 () Bool)

(assert (=> d!167701 (=> (not res!1081997) (not e!884665))))

(assert (=> d!167701 (= res!1081997 ((_ is Cons!36885) l!1356))))

(assert (=> d!167701 (= (contains!10562 l!1356 (tuple2!25703 key!387 value!184)) lt!677994)))

(declare-fun b!1584908 () Bool)

(declare-fun e!884666 () Bool)

(assert (=> b!1584908 (= e!884665 e!884666)))

(declare-fun res!1081996 () Bool)

(assert (=> b!1584908 (=> res!1081996 e!884666)))

(assert (=> b!1584908 (= res!1081996 (= (h!38446 l!1356) (tuple2!25703 key!387 value!184)))))

(declare-fun b!1584909 () Bool)

(assert (=> b!1584909 (= e!884666 (contains!10562 (t!51795 l!1356) (tuple2!25703 key!387 value!184)))))

(assert (= (and d!167701 res!1081997) b!1584908))

(assert (= (and b!1584908 (not res!1081996)) b!1584909))

(declare-fun m!1455195 () Bool)

(assert (=> d!167701 m!1455195))

(declare-fun m!1455199 () Bool)

(assert (=> d!167701 m!1455199))

(declare-fun m!1455201 () Bool)

(assert (=> b!1584909 m!1455201))

(assert (=> b!1584839 d!167701))

(declare-fun d!167707 () Bool)

(assert (=> d!167707 (not (contains!10562 (t!51795 l!1356) (tuple2!25703 key!387 value!184)))))

(declare-fun lt!678000 () Unit!52165)

(declare-fun choose!2095 (List!36889 (_ BitVec 64) B!2750) Unit!52165)

(assert (=> d!167707 (= lt!678000 (choose!2095 (t!51795 l!1356) key!387 value!184))))

(declare-fun e!884682 () Bool)

(assert (=> d!167707 e!884682))

(declare-fun res!1082013 () Bool)

(assert (=> d!167707 (=> (not res!1082013) (not e!884682))))

(assert (=> d!167707 (= res!1082013 (isStrictlySorted!1100 (t!51795 l!1356)))))

(assert (=> d!167707 (= (lemmaNotContainsKeyThenNotContainsTuple!7 (t!51795 l!1356) key!387 value!184) lt!678000)))

(declare-fun b!1584925 () Bool)

(assert (=> b!1584925 (= e!884682 (not (containsKey!959 (t!51795 l!1356) key!387)))))

(assert (= (and d!167707 res!1082013) b!1584925))

(assert (=> d!167707 m!1455201))

(declare-fun m!1455205 () Bool)

(assert (=> d!167707 m!1455205))

(assert (=> d!167707 m!1455172))

(assert (=> b!1584925 m!1455183))

(assert (=> b!1584839 d!167707))

(declare-fun b!1584937 () Bool)

(declare-fun e!884690 () Bool)

(declare-fun tp!114726 () Bool)

(assert (=> b!1584937 (= e!884690 (and tp_is_empty!39295 tp!114726))))

(assert (=> b!1584840 (= tp!114714 e!884690)))

(assert (= (and b!1584840 ((_ is Cons!36885) (t!51795 l!1356))) b!1584937))

(check-sat (not d!167701) (not b!1584894) (not b!1584876) (not d!167707) tp_is_empty!39295 (not b!1584909) (not b!1584925) (not b!1584937))
(check-sat)
