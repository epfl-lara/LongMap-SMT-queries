; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106482 () Bool)

(assert start!106482)

(declare-fun b!1265837 () Bool)

(declare-fun res!842825 () Bool)

(declare-fun e!720919 () Bool)

(assert (=> b!1265837 (=> (not res!842825) (not e!720919))))

(declare-datatypes ((B!1990 0))(
  ( (B!1991 (val!16330 Int)) )
))
(declare-datatypes ((tuple2!21178 0))(
  ( (tuple2!21179 (_1!10600 (_ BitVec 64)) (_2!10600 B!1990)) )
))
(declare-datatypes ((List!28322 0))(
  ( (Nil!28319) (Cons!28318 (h!29527 tuple2!21178) (t!41843 List!28322)) )
))
(declare-fun l!706 () List!28322)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!656 (List!28322 (_ BitVec 64)) Bool)

(assert (=> b!1265837 (= res!842825 (not (containsKey!656 l!706 key1!31)))))

(declare-fun b!1265838 () Bool)

(declare-fun res!842824 () Bool)

(assert (=> b!1265838 (=> (not res!842824) (not e!720919))))

(declare-fun isStrictlySorted!797 (List!28322) Bool)

(assert (=> b!1265838 (= res!842824 (isStrictlySorted!797 (t!41843 l!706)))))

(declare-fun b!1265839 () Bool)

(declare-fun res!842827 () Bool)

(assert (=> b!1265839 (=> (not res!842827) (not e!720919))))

(get-info :version)

(assert (=> b!1265839 (= res!842827 ((_ is Cons!28318) l!706))))

(declare-fun b!1265840 () Bool)

(declare-fun ListPrimitiveSize!155 (List!28322) Int)

(assert (=> b!1265840 (= e!720919 (>= (ListPrimitiveSize!155 (t!41843 l!706)) (ListPrimitiveSize!155 l!706)))))

(declare-fun res!842826 () Bool)

(assert (=> start!106482 (=> (not res!842826) (not e!720919))))

(assert (=> start!106482 (= res!842826 (isStrictlySorted!797 l!706))))

(assert (=> start!106482 e!720919))

(declare-fun e!720920 () Bool)

(assert (=> start!106482 e!720920))

(assert (=> start!106482 true))

(declare-fun b!1265841 () Bool)

(declare-fun res!842823 () Bool)

(assert (=> b!1265841 (=> (not res!842823) (not e!720919))))

(assert (=> b!1265841 (= res!842823 (not (containsKey!656 (t!41843 l!706) key1!31)))))

(declare-fun b!1265842 () Bool)

(declare-fun tp_is_empty!32523 () Bool)

(declare-fun tp!96395 () Bool)

(assert (=> b!1265842 (= e!720920 (and tp_is_empty!32523 tp!96395))))

(assert (= (and start!106482 res!842826) b!1265837))

(assert (= (and b!1265837 res!842825) b!1265839))

(assert (= (and b!1265839 res!842827) b!1265838))

(assert (= (and b!1265838 res!842824) b!1265841))

(assert (= (and b!1265841 res!842823) b!1265840))

(assert (= (and start!106482 ((_ is Cons!28318) l!706)) b!1265842))

(declare-fun m!1165761 () Bool)

(assert (=> b!1265840 m!1165761))

(declare-fun m!1165763 () Bool)

(assert (=> b!1265840 m!1165763))

(declare-fun m!1165765 () Bool)

(assert (=> b!1265841 m!1165765))

(declare-fun m!1165767 () Bool)

(assert (=> b!1265837 m!1165767))

(declare-fun m!1165769 () Bool)

(assert (=> start!106482 m!1165769))

(declare-fun m!1165771 () Bool)

(assert (=> b!1265838 m!1165771))

(check-sat tp_is_empty!32523 (not b!1265840) (not b!1265837) (not b!1265842) (not start!106482) (not b!1265838) (not b!1265841))
(check-sat)
(get-model)

(declare-fun d!138993 () Bool)

(declare-fun res!842859 () Bool)

(declare-fun e!720943 () Bool)

(assert (=> d!138993 (=> res!842859 e!720943)))

(assert (=> d!138993 (= res!842859 (and ((_ is Cons!28318) l!706) (= (_1!10600 (h!29527 l!706)) key1!31)))))

(assert (=> d!138993 (= (containsKey!656 l!706 key1!31) e!720943)))

(declare-fun b!1265877 () Bool)

(declare-fun e!720944 () Bool)

(assert (=> b!1265877 (= e!720943 e!720944)))

(declare-fun res!842860 () Bool)

(assert (=> b!1265877 (=> (not res!842860) (not e!720944))))

(assert (=> b!1265877 (= res!842860 (and (or (not ((_ is Cons!28318) l!706)) (bvsle (_1!10600 (h!29527 l!706)) key1!31)) ((_ is Cons!28318) l!706) (bvslt (_1!10600 (h!29527 l!706)) key1!31)))))

(declare-fun b!1265878 () Bool)

(assert (=> b!1265878 (= e!720944 (containsKey!656 (t!41843 l!706) key1!31))))

(assert (= (and d!138993 (not res!842859)) b!1265877))

(assert (= (and b!1265877 res!842860) b!1265878))

(assert (=> b!1265878 m!1165765))

(assert (=> b!1265837 d!138993))

(declare-fun d!139003 () Bool)

(declare-fun res!842877 () Bool)

(declare-fun e!720965 () Bool)

(assert (=> d!139003 (=> res!842877 e!720965)))

(assert (=> d!139003 (= res!842877 (or ((_ is Nil!28319) (t!41843 l!706)) ((_ is Nil!28319) (t!41843 (t!41843 l!706)))))))

(assert (=> d!139003 (= (isStrictlySorted!797 (t!41843 l!706)) e!720965)))

(declare-fun b!1265903 () Bool)

(declare-fun e!720966 () Bool)

(assert (=> b!1265903 (= e!720965 e!720966)))

(declare-fun res!842878 () Bool)

(assert (=> b!1265903 (=> (not res!842878) (not e!720966))))

(assert (=> b!1265903 (= res!842878 (bvslt (_1!10600 (h!29527 (t!41843 l!706))) (_1!10600 (h!29527 (t!41843 (t!41843 l!706))))))))

(declare-fun b!1265904 () Bool)

(assert (=> b!1265904 (= e!720966 (isStrictlySorted!797 (t!41843 (t!41843 l!706))))))

(assert (= (and d!139003 (not res!842877)) b!1265903))

(assert (= (and b!1265903 res!842878) b!1265904))

(declare-fun m!1165793 () Bool)

(assert (=> b!1265904 m!1165793))

(assert (=> b!1265838 d!139003))

(declare-fun d!139013 () Bool)

(declare-fun lt!574068 () Int)

(assert (=> d!139013 (>= lt!574068 0)))

(declare-fun e!720982 () Int)

(assert (=> d!139013 (= lt!574068 e!720982)))

(declare-fun c!123337 () Bool)

(assert (=> d!139013 (= c!123337 ((_ is Nil!28319) (t!41843 l!706)))))

(assert (=> d!139013 (= (ListPrimitiveSize!155 (t!41843 l!706)) lt!574068)))

(declare-fun b!1265926 () Bool)

(assert (=> b!1265926 (= e!720982 0)))

(declare-fun b!1265927 () Bool)

(assert (=> b!1265927 (= e!720982 (+ 1 (ListPrimitiveSize!155 (t!41843 (t!41843 l!706)))))))

(assert (= (and d!139013 c!123337) b!1265926))

(assert (= (and d!139013 (not c!123337)) b!1265927))

(declare-fun m!1165797 () Bool)

(assert (=> b!1265927 m!1165797))

(assert (=> b!1265840 d!139013))

(declare-fun d!139021 () Bool)

(declare-fun lt!574069 () Int)

(assert (=> d!139021 (>= lt!574069 0)))

(declare-fun e!720983 () Int)

(assert (=> d!139021 (= lt!574069 e!720983)))

(declare-fun c!123338 () Bool)

(assert (=> d!139021 (= c!123338 ((_ is Nil!28319) l!706))))

(assert (=> d!139021 (= (ListPrimitiveSize!155 l!706) lt!574069)))

(declare-fun b!1265928 () Bool)

(assert (=> b!1265928 (= e!720983 0)))

(declare-fun b!1265929 () Bool)

(assert (=> b!1265929 (= e!720983 (+ 1 (ListPrimitiveSize!155 (t!41843 l!706))))))

(assert (= (and d!139021 c!123338) b!1265928))

(assert (= (and d!139021 (not c!123338)) b!1265929))

(assert (=> b!1265929 m!1165761))

(assert (=> b!1265840 d!139021))

(declare-fun d!139023 () Bool)

(declare-fun res!842887 () Bool)

(declare-fun e!720984 () Bool)

(assert (=> d!139023 (=> res!842887 e!720984)))

(assert (=> d!139023 (= res!842887 (and ((_ is Cons!28318) (t!41843 l!706)) (= (_1!10600 (h!29527 (t!41843 l!706))) key1!31)))))

(assert (=> d!139023 (= (containsKey!656 (t!41843 l!706) key1!31) e!720984)))

(declare-fun b!1265930 () Bool)

(declare-fun e!720985 () Bool)

(assert (=> b!1265930 (= e!720984 e!720985)))

(declare-fun res!842888 () Bool)

(assert (=> b!1265930 (=> (not res!842888) (not e!720985))))

(assert (=> b!1265930 (= res!842888 (and (or (not ((_ is Cons!28318) (t!41843 l!706))) (bvsle (_1!10600 (h!29527 (t!41843 l!706))) key1!31)) ((_ is Cons!28318) (t!41843 l!706)) (bvslt (_1!10600 (h!29527 (t!41843 l!706))) key1!31)))))

(declare-fun b!1265931 () Bool)

(assert (=> b!1265931 (= e!720985 (containsKey!656 (t!41843 (t!41843 l!706)) key1!31))))

(assert (= (and d!139023 (not res!842887)) b!1265930))

(assert (= (and b!1265930 res!842888) b!1265931))

(declare-fun m!1165799 () Bool)

(assert (=> b!1265931 m!1165799))

(assert (=> b!1265841 d!139023))

(declare-fun d!139025 () Bool)

(declare-fun res!842889 () Bool)

(declare-fun e!720987 () Bool)

(assert (=> d!139025 (=> res!842889 e!720987)))

(assert (=> d!139025 (= res!842889 (or ((_ is Nil!28319) l!706) ((_ is Nil!28319) (t!41843 l!706))))))

(assert (=> d!139025 (= (isStrictlySorted!797 l!706) e!720987)))

(declare-fun b!1265934 () Bool)

(declare-fun e!720988 () Bool)

(assert (=> b!1265934 (= e!720987 e!720988)))

(declare-fun res!842890 () Bool)

(assert (=> b!1265934 (=> (not res!842890) (not e!720988))))

(assert (=> b!1265934 (= res!842890 (bvslt (_1!10600 (h!29527 l!706)) (_1!10600 (h!29527 (t!41843 l!706)))))))

(declare-fun b!1265935 () Bool)

(assert (=> b!1265935 (= e!720988 (isStrictlySorted!797 (t!41843 l!706)))))

(assert (= (and d!139025 (not res!842889)) b!1265934))

(assert (= (and b!1265934 res!842890) b!1265935))

(assert (=> b!1265935 m!1165771))

(assert (=> start!106482 d!139025))

(declare-fun b!1265946 () Bool)

(declare-fun e!720994 () Bool)

(declare-fun tp!96406 () Bool)

(assert (=> b!1265946 (= e!720994 (and tp_is_empty!32523 tp!96406))))

(assert (=> b!1265842 (= tp!96395 e!720994)))

(assert (= (and b!1265842 ((_ is Cons!28318) (t!41843 l!706))) b!1265946))

(check-sat (not b!1265927) tp_is_empty!32523 (not b!1265935) (not b!1265931) (not b!1265878) (not b!1265904) (not b!1265946) (not b!1265929))
