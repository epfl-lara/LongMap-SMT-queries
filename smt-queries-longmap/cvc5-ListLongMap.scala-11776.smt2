; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138302 () Bool)

(assert start!138302)

(declare-fun b!1585819 () Bool)

(declare-fun e!885452 () Bool)

(declare-fun e!885451 () Bool)

(assert (=> b!1585819 (= e!885452 e!885451)))

(declare-fun res!1083018 () Bool)

(assert (=> b!1585819 (=> res!1083018 e!885451)))

(declare-datatypes ((B!2996 0))(
  ( (B!2997 (val!19860 Int)) )
))
(declare-datatypes ((tuple2!25888 0))(
  ( (tuple2!25889 (_1!12955 (_ BitVec 64)) (_2!12955 B!2996)) )
))
(declare-datatypes ((List!36980 0))(
  ( (Nil!36977) (Cons!36976 (h!38519 tuple2!25888) (t!51904 List!36980)) )
))
(declare-fun lt!677438 () List!36980)

(declare-fun isStrictlySorted!1202 (List!36980) Bool)

(assert (=> b!1585819 (= res!1083018 (not (isStrictlySorted!1202 lt!677438)))))

(declare-fun l!556 () List!36980)

(declare-fun lt!677439 () tuple2!25888)

(declare-fun $colon$colon!1046 (List!36980 tuple2!25888) List!36980)

(assert (=> b!1585819 (= lt!677438 ($colon$colon!1046 l!556 lt!677439))))

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun newValue!21 () B!2996)

(assert (=> b!1585819 (= lt!677439 (tuple2!25889 newKey!21 newValue!21))))

(declare-fun b!1585821 () Bool)

(declare-fun res!1083019 () Bool)

(assert (=> b!1585821 (=> res!1083019 e!885451)))

(declare-fun containsKey!1015 (List!36980 (_ BitVec 64)) Bool)

(assert (=> b!1585821 (= res!1083019 (not (containsKey!1015 lt!677438 newKey!21)))))

(declare-fun b!1585822 () Bool)

(declare-fun e!885453 () Bool)

(declare-fun tp_is_empty!39529 () Bool)

(declare-fun tp!115299 () Bool)

(assert (=> b!1585822 (= e!885453 (and tp_is_empty!39529 tp!115299))))

(declare-fun b!1585823 () Bool)

(declare-fun res!1083020 () Bool)

(assert (=> b!1585823 (=> (not res!1083020) (not e!885452))))

(assert (=> b!1585823 (= res!1083020 (and (or (not (is-Cons!36976 l!556)) (bvsge (_1!12955 (h!38519 l!556)) newKey!21)) (not (= (_1!12955 (h!38519 l!556)) newKey!21)) (is-Cons!36976 l!556) (bvsgt (_1!12955 (h!38519 l!556)) newKey!21)))))

(declare-fun res!1083017 () Bool)

(assert (=> start!138302 (=> (not res!1083017) (not e!885452))))

(assert (=> start!138302 (= res!1083017 (isStrictlySorted!1202 l!556))))

(assert (=> start!138302 e!885452))

(assert (=> start!138302 e!885453))

(assert (=> start!138302 true))

(assert (=> start!138302 tp_is_empty!39529))

(declare-fun b!1585820 () Bool)

(declare-fun contains!10538 (List!36980 tuple2!25888) Bool)

(assert (=> b!1585820 (= e!885451 (not (contains!10538 lt!677438 lt!677439)))))

(assert (= (and start!138302 res!1083017) b!1585823))

(assert (= (and b!1585823 res!1083020) b!1585819))

(assert (= (and b!1585819 (not res!1083018)) b!1585821))

(assert (= (and b!1585821 (not res!1083019)) b!1585820))

(assert (= (and start!138302 (is-Cons!36976 l!556)) b!1585822))

(declare-fun m!1454499 () Bool)

(assert (=> b!1585819 m!1454499))

(declare-fun m!1454501 () Bool)

(assert (=> b!1585819 m!1454501))

(declare-fun m!1454503 () Bool)

(assert (=> b!1585821 m!1454503))

(declare-fun m!1454505 () Bool)

(assert (=> start!138302 m!1454505))

(declare-fun m!1454507 () Bool)

(assert (=> b!1585820 m!1454507))

(push 1)

(assert (not b!1585821))

(assert (not start!138302))

(assert (not b!1585822))

(assert (not b!1585819))

(assert (not b!1585820))

(assert tp_is_empty!39529)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167809 () Bool)

(declare-fun res!1083063 () Bool)

(declare-fun e!885490 () Bool)

(assert (=> d!167809 (=> res!1083063 e!885490)))

(assert (=> d!167809 (= res!1083063 (or (is-Nil!36977 lt!677438) (is-Nil!36977 (t!51904 lt!677438))))))

(assert (=> d!167809 (= (isStrictlySorted!1202 lt!677438) e!885490)))

(declare-fun b!1585872 () Bool)

(declare-fun e!885491 () Bool)

(assert (=> b!1585872 (= e!885490 e!885491)))

(declare-fun res!1083064 () Bool)

(assert (=> b!1585872 (=> (not res!1083064) (not e!885491))))

(assert (=> b!1585872 (= res!1083064 (bvslt (_1!12955 (h!38519 lt!677438)) (_1!12955 (h!38519 (t!51904 lt!677438)))))))

(declare-fun b!1585873 () Bool)

(assert (=> b!1585873 (= e!885491 (isStrictlySorted!1202 (t!51904 lt!677438)))))

(assert (= (and d!167809 (not res!1083063)) b!1585872))

(assert (= (and b!1585872 res!1083064) b!1585873))

(declare-fun m!1454539 () Bool)

(assert (=> b!1585873 m!1454539))

(assert (=> b!1585819 d!167809))

(declare-fun d!167815 () Bool)

(assert (=> d!167815 (= ($colon$colon!1046 l!556 lt!677439) (Cons!36976 lt!677439 l!556))))

(assert (=> b!1585819 d!167815))

(declare-fun d!167817 () Bool)

(declare-fun res!1083073 () Bool)

(declare-fun e!885500 () Bool)

(assert (=> d!167817 (=> res!1083073 e!885500)))

(assert (=> d!167817 (= res!1083073 (or (is-Nil!36977 l!556) (is-Nil!36977 (t!51904 l!556))))))

(assert (=> d!167817 (= (isStrictlySorted!1202 l!556) e!885500)))

(declare-fun b!1585882 () Bool)

(declare-fun e!885501 () Bool)

(assert (=> b!1585882 (= e!885500 e!885501)))

(declare-fun res!1083074 () Bool)

(assert (=> b!1585882 (=> (not res!1083074) (not e!885501))))

(assert (=> b!1585882 (= res!1083074 (bvslt (_1!12955 (h!38519 l!556)) (_1!12955 (h!38519 (t!51904 l!556)))))))

(declare-fun b!1585883 () Bool)

(assert (=> b!1585883 (= e!885501 (isStrictlySorted!1202 (t!51904 l!556)))))

(assert (= (and d!167817 (not res!1083073)) b!1585882))

(assert (= (and b!1585882 res!1083074) b!1585883))

(declare-fun m!1454541 () Bool)

(assert (=> b!1585883 m!1454541))

(assert (=> start!138302 d!167817))

(declare-fun d!167819 () Bool)

(declare-fun lt!677457 () Bool)

(declare-fun content!871 (List!36980) (Set tuple2!25888))

(assert (=> d!167819 (= lt!677457 (set.member lt!677439 (content!871 lt!677438)))))

(declare-fun e!885516 () Bool)

(assert (=> d!167819 (= lt!677457 e!885516)))

(declare-fun res!1083085 () Bool)

(assert (=> d!167819 (=> (not res!1083085) (not e!885516))))

(assert (=> d!167819 (= res!1083085 (is-Cons!36976 lt!677438))))

(assert (=> d!167819 (= (contains!10538 lt!677438 lt!677439) lt!677457)))

(declare-fun b!1585899 () Bool)

(declare-fun e!885515 () Bool)

(assert (=> b!1585899 (= e!885516 e!885515)))

(declare-fun res!1083086 () Bool)

(assert (=> b!1585899 (=> res!1083086 e!885515)))

(assert (=> b!1585899 (= res!1083086 (= (h!38519 lt!677438) lt!677439))))

(declare-fun b!1585900 () Bool)

(assert (=> b!1585900 (= e!885515 (contains!10538 (t!51904 lt!677438) lt!677439))))

(assert (= (and d!167819 res!1083085) b!1585899))

(assert (= (and b!1585899 (not res!1083086)) b!1585900))

(declare-fun m!1454549 () Bool)

(assert (=> d!167819 m!1454549))

(declare-fun m!1454551 () Bool)

(assert (=> d!167819 m!1454551))

(declare-fun m!1454553 () Bool)

(assert (=> b!1585900 m!1454553))

(assert (=> b!1585820 d!167819))

(declare-fun d!167827 () Bool)

(declare-fun res!1083097 () Bool)

(declare-fun e!885527 () Bool)

(assert (=> d!167827 (=> res!1083097 e!885527)))

(assert (=> d!167827 (= res!1083097 (and (is-Cons!36976 lt!677438) (= (_1!12955 (h!38519 lt!677438)) newKey!21)))))

(assert (=> d!167827 (= (containsKey!1015 lt!677438 newKey!21) e!885527)))

(declare-fun b!1585911 () Bool)

(declare-fun e!885528 () Bool)

(assert (=> b!1585911 (= e!885527 e!885528)))

(declare-fun res!1083098 () Bool)

(assert (=> b!1585911 (=> (not res!1083098) (not e!885528))))

(assert (=> b!1585911 (= res!1083098 (and (or (not (is-Cons!36976 lt!677438)) (bvsle (_1!12955 (h!38519 lt!677438)) newKey!21)) (is-Cons!36976 lt!677438) (bvslt (_1!12955 (h!38519 lt!677438)) newKey!21)))))

(declare-fun b!1585912 () Bool)

(assert (=> b!1585912 (= e!885528 (containsKey!1015 (t!51904 lt!677438) newKey!21))))

(assert (= (and d!167827 (not res!1083097)) b!1585911))

(assert (= (and b!1585911 res!1083098) b!1585912))

(declare-fun m!1454557 () Bool)

(assert (=> b!1585912 m!1454557))

(assert (=> b!1585821 d!167827))

(declare-fun b!1585921 () Bool)

(declare-fun e!885535 () Bool)

(declare-fun tp!115311 () Bool)

(assert (=> b!1585921 (= e!885535 (and tp_is_empty!39529 tp!115311))))

(assert (=> b!1585822 (= tp!115299 e!885535)))

(assert (= (and b!1585822 (is-Cons!36976 (t!51904 l!556))) b!1585921))

(push 1)

(assert (not b!1585873))

(assert (not b!1585883))

(assert (not b!1585912))

(assert (not b!1585921))

(assert (not b!1585900))

(assert (not d!167819))

(assert tp_is_empty!39529)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

