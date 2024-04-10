; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137228 () Bool)

(assert start!137228)

(declare-fun res!1079870 () Bool)

(declare-fun e!881893 () Bool)

(assert (=> start!137228 (=> (not res!1079870) (not e!881893))))

(declare-datatypes ((B!2674 0))(
  ( (B!2675 (val!19699 Int)) )
))
(declare-datatypes ((tuple2!25532 0))(
  ( (tuple2!25533 (_1!12777 (_ BitVec 64)) (_2!12777 B!2674)) )
))
(declare-datatypes ((List!36819 0))(
  ( (Nil!36816) (Cons!36815 (h!38358 tuple2!25532) (t!51733 List!36819)) )
))
(declare-fun l!1390 () List!36819)

(declare-fun isStrictlySorted!1077 (List!36819) Bool)

(assert (=> start!137228 (= res!1079870 (isStrictlySorted!1077 l!1390))))

(assert (=> start!137228 e!881893))

(declare-fun e!881894 () Bool)

(assert (=> start!137228 e!881894))

(assert (=> start!137228 true))

(declare-fun tp_is_empty!39219 () Bool)

(assert (=> start!137228 tp_is_empty!39219))

(declare-fun b!1580733 () Bool)

(declare-fun e!881897 () Bool)

(declare-fun e!881896 () Bool)

(assert (=> b!1580733 (= e!881897 e!881896)))

(declare-fun res!1079865 () Bool)

(assert (=> b!1580733 (=> res!1079865 e!881896)))

(assert (=> b!1580733 (= res!1079865 (not (isStrictlySorted!1077 (t!51733 l!1390))))))

(declare-fun b!1580734 () Bool)

(declare-fun tp!114509 () Bool)

(assert (=> b!1580734 (= e!881894 (and tp_is_empty!39219 tp!114509))))

(declare-fun b!1580735 () Bool)

(declare-fun res!1079869 () Bool)

(assert (=> b!1580735 (=> (not res!1079869) (not e!881893))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!923 (List!36819 (_ BitVec 64)) Bool)

(assert (=> b!1580735 (= res!1079869 (containsKey!923 l!1390 key!405))))

(declare-fun b!1580736 () Bool)

(declare-fun res!1079867 () Bool)

(assert (=> b!1580736 (=> (not res!1079867) (not e!881893))))

(declare-fun value!194 () B!2674)

(declare-fun contains!10491 (List!36819 tuple2!25532) Bool)

(assert (=> b!1580736 (= res!1079867 (contains!10491 l!1390 (tuple2!25533 key!405 value!194)))))

(declare-fun b!1580737 () Bool)

(assert (=> b!1580737 (= e!881893 e!881897)))

(declare-fun res!1079866 () Bool)

(assert (=> b!1580737 (=> (not res!1079866) (not e!881897))))

(declare-fun e!881895 () Bool)

(assert (=> b!1580737 (= res!1079866 e!881895)))

(declare-fun res!1079868 () Bool)

(assert (=> b!1580737 (=> res!1079868 e!881895)))

(declare-datatypes ((tuple2!25534 0))(
  ( (tuple2!25535 (_1!12778 tuple2!25532) (_2!12778 List!36819)) )
))
(declare-datatypes ((Option!909 0))(
  ( (Some!908 (v!22412 tuple2!25534)) (None!907) )
))
(declare-fun lt!676809 () Option!909)

(declare-fun isEmpty!1170 (Option!909) Bool)

(assert (=> b!1580737 (= res!1079868 (isEmpty!1170 lt!676809))))

(declare-fun unapply!86 (List!36819) Option!909)

(assert (=> b!1580737 (= lt!676809 (unapply!86 l!1390))))

(declare-fun b!1580738 () Bool)

(assert (=> b!1580738 (= e!881896 (containsKey!923 (t!51733 l!1390) key!405))))

(declare-fun b!1580739 () Bool)

(declare-fun res!1079871 () Bool)

(assert (=> b!1580739 (=> (not res!1079871) (not e!881897))))

(get-info :version)

(assert (=> b!1580739 (= res!1079871 (and ((_ is Cons!36815) l!1390) (= (_1!12777 (h!38358 l!1390)) key!405)))))

(declare-fun b!1580740 () Bool)

(declare-fun get!26799 (Option!909) tuple2!25534)

(assert (=> b!1580740 (= e!881895 (not ((_ is Nil!36816) (_2!12778 (get!26799 lt!676809)))))))

(assert (= (and start!137228 res!1079870) b!1580735))

(assert (= (and b!1580735 res!1079869) b!1580736))

(assert (= (and b!1580736 res!1079867) b!1580737))

(assert (= (and b!1580737 (not res!1079868)) b!1580740))

(assert (= (and b!1580737 res!1079866) b!1580739))

(assert (= (and b!1580739 res!1079871) b!1580733))

(assert (= (and b!1580733 (not res!1079865)) b!1580738))

(assert (= (and start!137228 ((_ is Cons!36815) l!1390)) b!1580734))

(declare-fun m!1452015 () Bool)

(assert (=> b!1580736 m!1452015))

(declare-fun m!1452017 () Bool)

(assert (=> start!137228 m!1452017))

(declare-fun m!1452019 () Bool)

(assert (=> b!1580733 m!1452019))

(declare-fun m!1452021 () Bool)

(assert (=> b!1580735 m!1452021))

(declare-fun m!1452023 () Bool)

(assert (=> b!1580737 m!1452023))

(declare-fun m!1452025 () Bool)

(assert (=> b!1580737 m!1452025))

(declare-fun m!1452027 () Bool)

(assert (=> b!1580738 m!1452027))

(declare-fun m!1452029 () Bool)

(assert (=> b!1580740 m!1452029))

(check-sat (not b!1580740) (not start!137228) (not b!1580733) (not b!1580734) (not b!1580738) tp_is_empty!39219 (not b!1580736) (not b!1580735) (not b!1580737))
(check-sat)
(get-model)

(declare-fun d!166499 () Bool)

(declare-fun res!1079897 () Bool)

(declare-fun e!881917 () Bool)

(assert (=> d!166499 (=> res!1079897 e!881917)))

(assert (=> d!166499 (= res!1079897 (and ((_ is Cons!36815) l!1390) (= (_1!12777 (h!38358 l!1390)) key!405)))))

(assert (=> d!166499 (= (containsKey!923 l!1390 key!405) e!881917)))

(declare-fun b!1580769 () Bool)

(declare-fun e!881918 () Bool)

(assert (=> b!1580769 (= e!881917 e!881918)))

(declare-fun res!1079898 () Bool)

(assert (=> b!1580769 (=> (not res!1079898) (not e!881918))))

(assert (=> b!1580769 (= res!1079898 (and (or (not ((_ is Cons!36815) l!1390)) (bvsle (_1!12777 (h!38358 l!1390)) key!405)) ((_ is Cons!36815) l!1390) (bvslt (_1!12777 (h!38358 l!1390)) key!405)))))

(declare-fun b!1580770 () Bool)

(assert (=> b!1580770 (= e!881918 (containsKey!923 (t!51733 l!1390) key!405))))

(assert (= (and d!166499 (not res!1079897)) b!1580769))

(assert (= (and b!1580769 res!1079898) b!1580770))

(assert (=> b!1580770 m!1452027))

(assert (=> b!1580735 d!166499))

(declare-fun d!166501 () Bool)

(assert (=> d!166501 (= (get!26799 lt!676809) (v!22412 lt!676809))))

(assert (=> b!1580740 d!166501))

(declare-fun d!166505 () Bool)

(declare-fun res!1079909 () Bool)

(declare-fun e!881929 () Bool)

(assert (=> d!166505 (=> res!1079909 e!881929)))

(assert (=> d!166505 (= res!1079909 (or ((_ is Nil!36816) (t!51733 l!1390)) ((_ is Nil!36816) (t!51733 (t!51733 l!1390)))))))

(assert (=> d!166505 (= (isStrictlySorted!1077 (t!51733 l!1390)) e!881929)))

(declare-fun b!1580781 () Bool)

(declare-fun e!881932 () Bool)

(assert (=> b!1580781 (= e!881929 e!881932)))

(declare-fun res!1079912 () Bool)

(assert (=> b!1580781 (=> (not res!1079912) (not e!881932))))

(assert (=> b!1580781 (= res!1079912 (bvslt (_1!12777 (h!38358 (t!51733 l!1390))) (_1!12777 (h!38358 (t!51733 (t!51733 l!1390))))))))

(declare-fun b!1580782 () Bool)

(assert (=> b!1580782 (= e!881932 (isStrictlySorted!1077 (t!51733 (t!51733 l!1390))))))

(assert (= (and d!166505 (not res!1079909)) b!1580781))

(assert (= (and b!1580781 res!1079912) b!1580782))

(declare-fun m!1452049 () Bool)

(assert (=> b!1580782 m!1452049))

(assert (=> b!1580733 d!166505))

(declare-fun d!166511 () Bool)

(declare-fun res!1079915 () Bool)

(declare-fun e!881935 () Bool)

(assert (=> d!166511 (=> res!1079915 e!881935)))

(assert (=> d!166511 (= res!1079915 (and ((_ is Cons!36815) (t!51733 l!1390)) (= (_1!12777 (h!38358 (t!51733 l!1390))) key!405)))))

(assert (=> d!166511 (= (containsKey!923 (t!51733 l!1390) key!405) e!881935)))

(declare-fun b!1580787 () Bool)

(declare-fun e!881936 () Bool)

(assert (=> b!1580787 (= e!881935 e!881936)))

(declare-fun res!1079916 () Bool)

(assert (=> b!1580787 (=> (not res!1079916) (not e!881936))))

(assert (=> b!1580787 (= res!1079916 (and (or (not ((_ is Cons!36815) (t!51733 l!1390))) (bvsle (_1!12777 (h!38358 (t!51733 l!1390))) key!405)) ((_ is Cons!36815) (t!51733 l!1390)) (bvslt (_1!12777 (h!38358 (t!51733 l!1390))) key!405)))))

(declare-fun b!1580788 () Bool)

(assert (=> b!1580788 (= e!881936 (containsKey!923 (t!51733 (t!51733 l!1390)) key!405))))

(assert (= (and d!166511 (not res!1079915)) b!1580787))

(assert (= (and b!1580787 res!1079916) b!1580788))

(declare-fun m!1452051 () Bool)

(assert (=> b!1580788 m!1452051))

(assert (=> b!1580738 d!166511))

(declare-fun d!166513 () Bool)

(assert (=> d!166513 (= (isEmpty!1170 lt!676809) (not ((_ is Some!908) lt!676809)))))

(assert (=> b!1580737 d!166513))

(declare-fun d!166515 () Bool)

(assert (=> d!166515 (= (unapply!86 l!1390) (ite ((_ is Nil!36816) l!1390) None!907 (Some!908 (tuple2!25535 (h!38358 l!1390) (t!51733 l!1390)))))))

(assert (=> b!1580737 d!166515))

(declare-fun d!166521 () Bool)

(declare-fun res!1079923 () Bool)

(declare-fun e!881943 () Bool)

(assert (=> d!166521 (=> res!1079923 e!881943)))

(assert (=> d!166521 (= res!1079923 (or ((_ is Nil!36816) l!1390) ((_ is Nil!36816) (t!51733 l!1390))))))

(assert (=> d!166521 (= (isStrictlySorted!1077 l!1390) e!881943)))

(declare-fun b!1580795 () Bool)

(declare-fun e!881944 () Bool)

(assert (=> b!1580795 (= e!881943 e!881944)))

(declare-fun res!1079924 () Bool)

(assert (=> b!1580795 (=> (not res!1079924) (not e!881944))))

(assert (=> b!1580795 (= res!1079924 (bvslt (_1!12777 (h!38358 l!1390)) (_1!12777 (h!38358 (t!51733 l!1390)))))))

(declare-fun b!1580796 () Bool)

(assert (=> b!1580796 (= e!881944 (isStrictlySorted!1077 (t!51733 l!1390)))))

(assert (= (and d!166521 (not res!1079923)) b!1580795))

(assert (= (and b!1580795 res!1079924) b!1580796))

(assert (=> b!1580796 m!1452019))

(assert (=> start!137228 d!166521))

(declare-fun lt!676821 () Bool)

(declare-fun d!166523 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!839 (List!36819) (InoxSet tuple2!25532))

(assert (=> d!166523 (= lt!676821 (select (content!839 l!1390) (tuple2!25533 key!405 value!194)))))

(declare-fun e!881958 () Bool)

(assert (=> d!166523 (= lt!676821 e!881958)))

(declare-fun res!1079938 () Bool)

(assert (=> d!166523 (=> (not res!1079938) (not e!881958))))

(assert (=> d!166523 (= res!1079938 ((_ is Cons!36815) l!1390))))

(assert (=> d!166523 (= (contains!10491 l!1390 (tuple2!25533 key!405 value!194)) lt!676821)))

(declare-fun b!1580809 () Bool)

(declare-fun e!881957 () Bool)

(assert (=> b!1580809 (= e!881958 e!881957)))

(declare-fun res!1079937 () Bool)

(assert (=> b!1580809 (=> res!1079937 e!881957)))

(assert (=> b!1580809 (= res!1079937 (= (h!38358 l!1390) (tuple2!25533 key!405 value!194)))))

(declare-fun b!1580810 () Bool)

(assert (=> b!1580810 (= e!881957 (contains!10491 (t!51733 l!1390) (tuple2!25533 key!405 value!194)))))

(assert (= (and d!166523 res!1079938) b!1580809))

(assert (= (and b!1580809 (not res!1079937)) b!1580810))

(declare-fun m!1452067 () Bool)

(assert (=> d!166523 m!1452067))

(declare-fun m!1452069 () Bool)

(assert (=> d!166523 m!1452069))

(declare-fun m!1452071 () Bool)

(assert (=> b!1580810 m!1452071))

(assert (=> b!1580736 d!166523))

(declare-fun b!1580815 () Bool)

(declare-fun e!881961 () Bool)

(declare-fun tp!114515 () Bool)

(assert (=> b!1580815 (= e!881961 (and tp_is_empty!39219 tp!114515))))

(assert (=> b!1580734 (= tp!114509 e!881961)))

(assert (= (and b!1580734 ((_ is Cons!36815) (t!51733 l!1390))) b!1580815))

(check-sat (not b!1580770) (not b!1580788) (not b!1580796) (not d!166523) (not b!1580815) tp_is_empty!39219 (not b!1580782) (not b!1580810))
(check-sat)
