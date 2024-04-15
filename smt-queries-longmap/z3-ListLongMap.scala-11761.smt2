; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137976 () Bool)

(assert start!137976)

(declare-fun res!1081888 () Bool)

(declare-fun e!884082 () Bool)

(assert (=> start!137976 (=> (not res!1081888) (not e!884082))))

(declare-datatypes ((B!2906 0))(
  ( (B!2907 (val!19815 Int)) )
))
(declare-datatypes ((tuple2!25866 0))(
  ( (tuple2!25867 (_1!12944 (_ BitVec 64)) (_2!12944 B!2906)) )
))
(declare-datatypes ((List!36976 0))(
  ( (Nil!36973) (Cons!36972 (h!38516 tuple2!25866) (t!51882 List!36976)) )
))
(declare-fun l!1251 () List!36976)

(declare-fun isStrictlySorted!1158 (List!36976) Bool)

(assert (=> start!137976 (= res!1081888 (isStrictlySorted!1158 l!1251))))

(assert (=> start!137976 e!884082))

(declare-fun e!884083 () Bool)

(assert (=> start!137976 e!884083))

(assert (=> start!137976 true))

(declare-fun b!1583816 () Bool)

(declare-fun ListPrimitiveSize!217 (List!36976) Int)

(assert (=> b!1583816 (= e!884082 (< (ListPrimitiveSize!217 l!1251) 0))))

(declare-fun b!1583815 () Bool)

(declare-fun res!1081887 () Bool)

(assert (=> b!1583815 (=> (not res!1081887) (not e!884082))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1583815 (= res!1081887 (not (= otherKey!56 newKey!123)))))

(declare-fun b!1583817 () Bool)

(declare-fun tp_is_empty!39439 () Bool)

(declare-fun tp!115067 () Bool)

(assert (=> b!1583817 (= e!884083 (and tp_is_empty!39439 tp!115067))))

(declare-fun b!1583814 () Bool)

(declare-fun res!1081889 () Bool)

(assert (=> b!1583814 (=> (not res!1081889) (not e!884082))))

(declare-fun containsKey!992 (List!36976 (_ BitVec 64)) Bool)

(assert (=> b!1583814 (= res!1081889 (not (containsKey!992 l!1251 otherKey!56)))))

(assert (= (and start!137976 res!1081888) b!1583814))

(assert (= (and b!1583814 res!1081889) b!1583815))

(assert (= (and b!1583815 res!1081887) b!1583816))

(get-info :version)

(assert (= (and start!137976 ((_ is Cons!36972) l!1251)) b!1583817))

(declare-fun m!1452733 () Bool)

(assert (=> start!137976 m!1452733))

(declare-fun m!1452735 () Bool)

(assert (=> b!1583816 m!1452735))

(declare-fun m!1452737 () Bool)

(assert (=> b!1583814 m!1452737))

(check-sat (not b!1583817) (not b!1583814) (not b!1583816) tp_is_empty!39439 (not start!137976))
(check-sat)
(get-model)

(declare-fun d!167117 () Bool)

(declare-fun res!1081916 () Bool)

(declare-fun e!884104 () Bool)

(assert (=> d!167117 (=> res!1081916 e!884104)))

(assert (=> d!167117 (= res!1081916 (and ((_ is Cons!36972) l!1251) (= (_1!12944 (h!38516 l!1251)) otherKey!56)))))

(assert (=> d!167117 (= (containsKey!992 l!1251 otherKey!56) e!884104)))

(declare-fun b!1583850 () Bool)

(declare-fun e!884105 () Bool)

(assert (=> b!1583850 (= e!884104 e!884105)))

(declare-fun res!1081917 () Bool)

(assert (=> b!1583850 (=> (not res!1081917) (not e!884105))))

(assert (=> b!1583850 (= res!1081917 (and (or (not ((_ is Cons!36972) l!1251)) (bvsle (_1!12944 (h!38516 l!1251)) otherKey!56)) ((_ is Cons!36972) l!1251) (bvslt (_1!12944 (h!38516 l!1251)) otherKey!56)))))

(declare-fun b!1583851 () Bool)

(assert (=> b!1583851 (= e!884105 (containsKey!992 (t!51882 l!1251) otherKey!56))))

(assert (= (and d!167117 (not res!1081916)) b!1583850))

(assert (= (and b!1583850 res!1081917) b!1583851))

(declare-fun m!1452751 () Bool)

(assert (=> b!1583851 m!1452751))

(assert (=> b!1583814 d!167117))

(declare-fun d!167123 () Bool)

(declare-fun res!1081930 () Bool)

(declare-fun e!884120 () Bool)

(assert (=> d!167123 (=> res!1081930 e!884120)))

(assert (=> d!167123 (= res!1081930 (or ((_ is Nil!36973) l!1251) ((_ is Nil!36973) (t!51882 l!1251))))))

(assert (=> d!167123 (= (isStrictlySorted!1158 l!1251) e!884120)))

(declare-fun b!1583868 () Bool)

(declare-fun e!884121 () Bool)

(assert (=> b!1583868 (= e!884120 e!884121)))

(declare-fun res!1081931 () Bool)

(assert (=> b!1583868 (=> (not res!1081931) (not e!884121))))

(assert (=> b!1583868 (= res!1081931 (bvslt (_1!12944 (h!38516 l!1251)) (_1!12944 (h!38516 (t!51882 l!1251)))))))

(declare-fun b!1583869 () Bool)

(assert (=> b!1583869 (= e!884121 (isStrictlySorted!1158 (t!51882 l!1251)))))

(assert (= (and d!167123 (not res!1081930)) b!1583868))

(assert (= (and b!1583868 res!1081931) b!1583869))

(declare-fun m!1452757 () Bool)

(assert (=> b!1583869 m!1452757))

(assert (=> start!137976 d!167123))

(declare-fun d!167129 () Bool)

(declare-fun lt!676961 () Int)

(assert (=> d!167129 (>= lt!676961 0)))

(declare-fun e!884132 () Int)

(assert (=> d!167129 (= lt!676961 e!884132)))

(declare-fun c!146754 () Bool)

(assert (=> d!167129 (= c!146754 ((_ is Nil!36973) l!1251))))

(assert (=> d!167129 (= (ListPrimitiveSize!217 l!1251) lt!676961)))

(declare-fun b!1583884 () Bool)

(assert (=> b!1583884 (= e!884132 0)))

(declare-fun b!1583885 () Bool)

(assert (=> b!1583885 (= e!884132 (+ 1 (ListPrimitiveSize!217 (t!51882 l!1251))))))

(assert (= (and d!167129 c!146754) b!1583884))

(assert (= (and d!167129 (not c!146754)) b!1583885))

(declare-fun m!1452763 () Bool)

(assert (=> b!1583885 m!1452763))

(assert (=> b!1583816 d!167129))

(declare-fun b!1583892 () Bool)

(declare-fun e!884135 () Bool)

(declare-fun tp!115076 () Bool)

(assert (=> b!1583892 (= e!884135 (and tp_is_empty!39439 tp!115076))))

(assert (=> b!1583817 (= tp!115067 e!884135)))

(assert (= (and b!1583817 ((_ is Cons!36972) (t!51882 l!1251))) b!1583892))

(check-sat tp_is_empty!39439 (not b!1583885) (not b!1583869) (not b!1583892) (not b!1583851))
(check-sat)
