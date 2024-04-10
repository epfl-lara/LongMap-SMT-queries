; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138336 () Bool)

(assert start!138336)

(declare-fun b!1585969 () Bool)

(declare-fun e!885566 () Bool)

(declare-fun tp_is_empty!39539 () Bool)

(declare-fun tp!115323 () Bool)

(assert (=> b!1585969 (= e!885566 (and tp_is_empty!39539 tp!115323))))

(declare-fun b!1585970 () Bool)

(declare-fun e!885567 () Bool)

(declare-fun e!885565 () Bool)

(assert (=> b!1585970 (= e!885567 e!885565)))

(declare-fun res!1083139 () Bool)

(assert (=> b!1585970 (=> res!1083139 e!885565)))

(declare-datatypes ((B!3006 0))(
  ( (B!3007 (val!19865 Int)) )
))
(declare-datatypes ((tuple2!25898 0))(
  ( (tuple2!25899 (_1!12960 (_ BitVec 64)) (_2!12960 B!3006)) )
))
(declare-datatypes ((List!36985 0))(
  ( (Nil!36982) (Cons!36981 (h!38524 tuple2!25898) (t!51912 List!36985)) )
))
(declare-fun lt!677477 () List!36985)

(declare-fun isStrictlySorted!1207 (List!36985) Bool)

(assert (=> b!1585970 (= res!1083139 (not (isStrictlySorted!1207 lt!677477)))))

(declare-fun lt!677478 () tuple2!25898)

(declare-fun $colon$colon!1051 (List!36985 tuple2!25898) List!36985)

(assert (=> b!1585970 (= lt!677477 ($colon$colon!1051 Nil!36982 lt!677478))))

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun newValue!21 () B!3006)

(assert (=> b!1585970 (= lt!677478 (tuple2!25899 newKey!21 newValue!21))))

(declare-fun b!1585971 () Bool)

(declare-fun res!1083137 () Bool)

(assert (=> b!1585971 (=> (not res!1083137) (not e!885567))))

(declare-fun l!556 () List!36985)

(assert (=> b!1585971 (= res!1083137 (and (or (not (is-Cons!36981 l!556)) (bvsge (_1!12960 (h!38524 l!556)) newKey!21)) (or (not (is-Cons!36981 l!556)) (not (= (_1!12960 (h!38524 l!556)) newKey!21))) (or (not (is-Cons!36981 l!556)) (bvsle (_1!12960 (h!38524 l!556)) newKey!21)) (is-Nil!36982 l!556)))))

(declare-fun b!1585972 () Bool)

(declare-fun res!1083138 () Bool)

(assert (=> b!1585972 (=> res!1083138 e!885565)))

(declare-fun containsKey!1020 (List!36985 (_ BitVec 64)) Bool)

(assert (=> b!1585972 (= res!1083138 (not (containsKey!1020 lt!677477 newKey!21)))))

(declare-fun b!1585973 () Bool)

(declare-fun contains!10543 (List!36985 tuple2!25898) Bool)

(assert (=> b!1585973 (= e!885565 (not (contains!10543 lt!677477 lt!677478)))))

(declare-fun res!1083140 () Bool)

(assert (=> start!138336 (=> (not res!1083140) (not e!885567))))

(assert (=> start!138336 (= res!1083140 (isStrictlySorted!1207 l!556))))

(assert (=> start!138336 e!885567))

(assert (=> start!138336 e!885566))

(assert (=> start!138336 true))

(assert (=> start!138336 tp_is_empty!39539))

(assert (= (and start!138336 res!1083140) b!1585971))

(assert (= (and b!1585971 res!1083137) b!1585970))

(assert (= (and b!1585970 (not res!1083139)) b!1585972))

(assert (= (and b!1585972 (not res!1083138)) b!1585973))

(assert (= (and start!138336 (is-Cons!36981 l!556)) b!1585969))

(declare-fun m!1454585 () Bool)

(assert (=> b!1585970 m!1454585))

(declare-fun m!1454587 () Bool)

(assert (=> b!1585970 m!1454587))

(declare-fun m!1454589 () Bool)

(assert (=> b!1585972 m!1454589))

(declare-fun m!1454591 () Bool)

(assert (=> b!1585973 m!1454591))

(declare-fun m!1454593 () Bool)

(assert (=> start!138336 m!1454593))

(push 1)

(assert (not b!1585970))

(assert (not b!1585972))

(assert (not b!1585973))

(assert tp_is_empty!39539)

(assert (not b!1585969))

(assert (not start!138336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167835 () Bool)

(declare-fun res!1083155 () Bool)

(declare-fun e!885582 () Bool)

(assert (=> d!167835 (=> res!1083155 e!885582)))

(assert (=> d!167835 (= res!1083155 (or (is-Nil!36982 lt!677477) (is-Nil!36982 (t!51912 lt!677477))))))

(assert (=> d!167835 (= (isStrictlySorted!1207 lt!677477) e!885582)))

(declare-fun b!1585986 () Bool)

(declare-fun e!885583 () Bool)

(assert (=> b!1585986 (= e!885582 e!885583)))

(declare-fun res!1083156 () Bool)

(assert (=> b!1585986 (=> (not res!1083156) (not e!885583))))

(assert (=> b!1585986 (= res!1083156 (bvslt (_1!12960 (h!38524 lt!677477)) (_1!12960 (h!38524 (t!51912 lt!677477)))))))

(declare-fun b!1585987 () Bool)

(assert (=> b!1585987 (= e!885583 (isStrictlySorted!1207 (t!51912 lt!677477)))))

(assert (= (and d!167835 (not res!1083155)) b!1585986))

(assert (= (and b!1585986 res!1083156) b!1585987))

(declare-fun m!1454601 () Bool)

(assert (=> b!1585987 m!1454601))

(assert (=> b!1585970 d!167835))

(declare-fun d!167841 () Bool)

(assert (=> d!167841 (= ($colon$colon!1051 Nil!36982 lt!677478) (Cons!36981 lt!677478 Nil!36982))))

(assert (=> b!1585970 d!167841))

(declare-fun d!167843 () Bool)

(declare-fun res!1083173 () Bool)

(declare-fun e!885600 () Bool)

(assert (=> d!167843 (=> res!1083173 e!885600)))

(assert (=> d!167843 (= res!1083173 (and (is-Cons!36981 lt!677477) (= (_1!12960 (h!38524 lt!677477)) newKey!21)))))

(assert (=> d!167843 (= (containsKey!1020 lt!677477 newKey!21) e!885600)))

(declare-fun b!1586006 () Bool)

(declare-fun e!885601 () Bool)

(assert (=> b!1586006 (= e!885600 e!885601)))

(declare-fun res!1083174 () Bool)

(assert (=> b!1586006 (=> (not res!1083174) (not e!885601))))

(assert (=> b!1586006 (= res!1083174 (and (or (not (is-Cons!36981 lt!677477)) (bvsle (_1!12960 (h!38524 lt!677477)) newKey!21)) (is-Cons!36981 lt!677477) (bvslt (_1!12960 (h!38524 lt!677477)) newKey!21)))))

(declare-fun b!1586007 () Bool)

(assert (=> b!1586007 (= e!885601 (containsKey!1020 (t!51912 lt!677477) newKey!21))))

(assert (= (and d!167843 (not res!1083173)) b!1586006))

(assert (= (and b!1586006 res!1083174) b!1586007))

(declare-fun m!1454611 () Bool)

(assert (=> b!1586007 m!1454611))

(assert (=> b!1585972 d!167843))

(declare-fun d!167851 () Bool)

(declare-fun lt!677487 () Bool)

(declare-fun content!875 (List!36985) (Set tuple2!25898))

(assert (=> d!167851 (= lt!677487 (member lt!677478 (content!875 lt!677477)))))

(declare-fun e!885626 () Bool)

(assert (=> d!167851 (= lt!677487 e!885626)))

(declare-fun res!1083195 () Bool)

(assert (=> d!167851 (=> (not res!1083195) (not e!885626))))

(assert (=> d!167851 (= res!1083195 (is-Cons!36981 lt!677477))))

(assert (=> d!167851 (= (contains!10543 lt!677477 lt!677478) lt!677487)))

(declare-fun b!1586033 () Bool)

(declare-fun e!885625 () Bool)

(assert (=> b!1586033 (= e!885626 e!885625)))

(declare-fun res!1083196 () Bool)

(assert (=> b!1586033 (=> res!1083196 e!885625)))

(assert (=> b!1586033 (= res!1083196 (= (h!38524 lt!677477) lt!677478))))

(declare-fun b!1586034 () Bool)

(assert (=> b!1586034 (= e!885625 (contains!10543 (t!51912 lt!677477) lt!677478))))

(assert (= (and d!167851 res!1083195) b!1586033))

(assert (= (and b!1586033 (not res!1083196)) b!1586034))

(declare-fun m!1454621 () Bool)

(assert (=> d!167851 m!1454621))

(declare-fun m!1454623 () Bool)

(assert (=> d!167851 m!1454623))

(declare-fun m!1454625 () Bool)

(assert (=> b!1586034 m!1454625))

(assert (=> b!1585973 d!167851))

(declare-fun d!167859 () Bool)

(declare-fun res!1083199 () Bool)

(declare-fun e!885629 () Bool)

(assert (=> d!167859 (=> res!1083199 e!885629)))

(assert (=> d!167859 (= res!1083199 (or (is-Nil!36982 l!556) (is-Nil!36982 (t!51912 l!556))))))

(assert (=> d!167859 (= (isStrictlySorted!1207 l!556) e!885629)))

(declare-fun b!1586037 () Bool)

(declare-fun e!885630 () Bool)

(assert (=> b!1586037 (= e!885629 e!885630)))

(declare-fun res!1083200 () Bool)

(assert (=> b!1586037 (=> (not res!1083200) (not e!885630))))

(assert (=> b!1586037 (= res!1083200 (bvslt (_1!12960 (h!38524 l!556)) (_1!12960 (h!38524 (t!51912 l!556)))))))

(declare-fun b!1586038 () Bool)

(assert (=> b!1586038 (= e!885630 (isStrictlySorted!1207 (t!51912 l!556)))))

(assert (= (and d!167859 (not res!1083199)) b!1586037))

(assert (= (and b!1586037 res!1083200) b!1586038))

(declare-fun m!1454629 () Bool)

(assert (=> b!1586038 m!1454629))

(assert (=> start!138336 d!167859))

