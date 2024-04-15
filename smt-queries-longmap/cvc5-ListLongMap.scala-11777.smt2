; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138300 () Bool)

(assert start!138300)

(declare-fun res!1083007 () Bool)

(declare-fun e!885364 () Bool)

(assert (=> start!138300 (=> (not res!1083007) (not e!885364))))

(declare-datatypes ((B!3006 0))(
  ( (B!3007 (val!19865 Int)) )
))
(declare-datatypes ((tuple2!25966 0))(
  ( (tuple2!25967 (_1!12994 (_ BitVec 64)) (_2!12994 B!3006)) )
))
(declare-datatypes ((List!37026 0))(
  ( (Nil!37023) (Cons!37022 (h!38566 tuple2!25966) (t!51945 List!37026)) )
))
(declare-fun l!556 () List!37026)

(declare-fun isStrictlySorted!1205 (List!37026) Bool)

(assert (=> start!138300 (= res!1083007 (isStrictlySorted!1205 l!556))))

(assert (=> start!138300 e!885364))

(declare-fun e!885365 () Bool)

(assert (=> start!138300 e!885365))

(assert (=> start!138300 true))

(declare-fun tp_is_empty!39539 () Bool)

(assert (=> start!138300 tp_is_empty!39539))

(declare-fun b!1585653 () Bool)

(declare-fun e!885366 () Bool)

(declare-fun lt!677194 () List!37026)

(declare-fun lt!677195 () tuple2!25966)

(declare-fun contains!10497 (List!37026 tuple2!25966) Bool)

(assert (=> b!1585653 (= e!885366 (not (contains!10497 lt!677194 lt!677195)))))

(declare-fun b!1585654 () Bool)

(assert (=> b!1585654 (= e!885364 e!885366)))

(declare-fun res!1083006 () Bool)

(assert (=> b!1585654 (=> res!1083006 e!885366)))

(assert (=> b!1585654 (= res!1083006 (not (isStrictlySorted!1205 lt!677194)))))

(declare-fun $colon$colon!1055 (List!37026 tuple2!25966) List!37026)

(assert (=> b!1585654 (= lt!677194 ($colon$colon!1055 Nil!37023 lt!677195))))

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun newValue!21 () B!3006)

(assert (=> b!1585654 (= lt!677195 (tuple2!25967 newKey!21 newValue!21))))

(declare-fun b!1585655 () Bool)

(declare-fun res!1083008 () Bool)

(assert (=> b!1585655 (=> res!1083008 e!885366)))

(declare-fun containsKey!1018 (List!37026 (_ BitVec 64)) Bool)

(assert (=> b!1585655 (= res!1083008 (not (containsKey!1018 lt!677194 newKey!21)))))

(declare-fun b!1585656 () Bool)

(declare-fun tp!115323 () Bool)

(assert (=> b!1585656 (= e!885365 (and tp_is_empty!39539 tp!115323))))

(declare-fun b!1585657 () Bool)

(declare-fun res!1083009 () Bool)

(assert (=> b!1585657 (=> (not res!1083009) (not e!885364))))

(assert (=> b!1585657 (= res!1083009 (and (or (not (is-Cons!37022 l!556)) (bvsge (_1!12994 (h!38566 l!556)) newKey!21)) (or (not (is-Cons!37022 l!556)) (not (= (_1!12994 (h!38566 l!556)) newKey!21))) (or (not (is-Cons!37022 l!556)) (bvsle (_1!12994 (h!38566 l!556)) newKey!21)) (is-Nil!37023 l!556)))))

(assert (= (and start!138300 res!1083007) b!1585657))

(assert (= (and b!1585657 res!1083009) b!1585654))

(assert (= (and b!1585654 (not res!1083006)) b!1585655))

(assert (= (and b!1585655 (not res!1083008)) b!1585653))

(assert (= (and start!138300 (is-Cons!37022 l!556)) b!1585656))

(declare-fun m!1453703 () Bool)

(assert (=> start!138300 m!1453703))

(declare-fun m!1453705 () Bool)

(assert (=> b!1585653 m!1453705))

(declare-fun m!1453707 () Bool)

(assert (=> b!1585654 m!1453707))

(declare-fun m!1453709 () Bool)

(assert (=> b!1585654 m!1453709))

(declare-fun m!1453711 () Bool)

(assert (=> b!1585655 m!1453711))

(push 1)

(assert tp_is_empty!39539)

(assert (not start!138300))

(assert (not b!1585655))

(assert (not b!1585653))

(assert (not b!1585654))

(assert (not b!1585656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167591 () Bool)

(declare-fun res!1083020 () Bool)

(declare-fun e!885377 () Bool)

(assert (=> d!167591 (=> res!1083020 e!885377)))

(assert (=> d!167591 (= res!1083020 (and (is-Cons!37022 lt!677194) (= (_1!12994 (h!38566 lt!677194)) newKey!21)))))

(assert (=> d!167591 (= (containsKey!1018 lt!677194 newKey!21) e!885377)))

(declare-fun b!1585668 () Bool)

(declare-fun e!885378 () Bool)

(assert (=> b!1585668 (= e!885377 e!885378)))

(declare-fun res!1083021 () Bool)

(assert (=> b!1585668 (=> (not res!1083021) (not e!885378))))

(assert (=> b!1585668 (= res!1083021 (and (or (not (is-Cons!37022 lt!677194)) (bvsle (_1!12994 (h!38566 lt!677194)) newKey!21)) (is-Cons!37022 lt!677194) (bvslt (_1!12994 (h!38566 lt!677194)) newKey!21)))))

(declare-fun b!1585669 () Bool)

(assert (=> b!1585669 (= e!885378 (containsKey!1018 (t!51945 lt!677194) newKey!21))))

(assert (= (and d!167591 (not res!1083020)) b!1585668))

(assert (= (and b!1585668 res!1083021) b!1585669))

(declare-fun m!1453715 () Bool)

(assert (=> b!1585669 m!1453715))

(assert (=> b!1585655 d!167591))

(declare-fun d!167597 () Bool)

(declare-fun lt!677200 () Bool)

(declare-fun content!864 (List!37026) (Set tuple2!25966))

(assert (=> d!167597 (= lt!677200 (set.member lt!677195 (content!864 lt!677194)))))

(declare-fun e!885387 () Bool)

(assert (=> d!167597 (= lt!677200 e!885387)))

(declare-fun res!1083030 () Bool)

(assert (=> d!167597 (=> (not res!1083030) (not e!885387))))

(assert (=> d!167597 (= res!1083030 (is-Cons!37022 lt!677194))))

(assert (=> d!167597 (= (contains!10497 lt!677194 lt!677195) lt!677200)))

(declare-fun b!1585678 () Bool)

(declare-fun e!885388 () Bool)

(assert (=> b!1585678 (= e!885387 e!885388)))

(declare-fun res!1083031 () Bool)

(assert (=> b!1585678 (=> res!1083031 e!885388)))

(assert (=> b!1585678 (= res!1083031 (= (h!38566 lt!677194) lt!677195))))

(declare-fun b!1585679 () Bool)

(assert (=> b!1585679 (= e!885388 (contains!10497 (t!51945 lt!677194) lt!677195))))

(assert (= (and d!167597 res!1083030) b!1585678))

(assert (= (and b!1585678 (not res!1083031)) b!1585679))

(declare-fun m!1453717 () Bool)

(assert (=> d!167597 m!1453717))

(declare-fun m!1453719 () Bool)

(assert (=> d!167597 m!1453719))

(declare-fun m!1453721 () Bool)

(assert (=> b!1585679 m!1453721))

(assert (=> b!1585653 d!167597))

(declare-fun d!167603 () Bool)

(declare-fun res!1083050 () Bool)

(declare-fun e!885407 () Bool)

(assert (=> d!167603 (=> res!1083050 e!885407)))

(assert (=> d!167603 (= res!1083050 (or (is-Nil!37023 l!556) (is-Nil!37023 (t!51945 l!556))))))

(assert (=> d!167603 (= (isStrictlySorted!1205 l!556) e!885407)))

(declare-fun b!1585696 () Bool)

(declare-fun e!885408 () Bool)

(assert (=> b!1585696 (= e!885407 e!885408)))

(declare-fun res!1083051 () Bool)

(assert (=> b!1585696 (=> (not res!1083051) (not e!885408))))

(assert (=> b!1585696 (= res!1083051 (bvslt (_1!12994 (h!38566 l!556)) (_1!12994 (h!38566 (t!51945 l!556)))))))

(declare-fun b!1585697 () Bool)

(assert (=> b!1585697 (= e!885408 (isStrictlySorted!1205 (t!51945 l!556)))))

(assert (= (and d!167603 (not res!1083050)) b!1585696))

(assert (= (and b!1585696 res!1083051) b!1585697))

(declare-fun m!1453737 () Bool)

(assert (=> b!1585697 m!1453737))

(assert (=> start!138300 d!167603))

(declare-fun d!167611 () Bool)

(declare-fun res!1083052 () Bool)

(declare-fun e!885409 () Bool)

(assert (=> d!167611 (=> res!1083052 e!885409)))

(assert (=> d!167611 (= res!1083052 (or (is-Nil!37023 lt!677194) (is-Nil!37023 (t!51945 lt!677194))))))

(assert (=> d!167611 (= (isStrictlySorted!1205 lt!677194) e!885409)))

(declare-fun b!1585700 () Bool)

(declare-fun e!885410 () Bool)

(assert (=> b!1585700 (= e!885409 e!885410)))

(declare-fun res!1083053 () Bool)

(assert (=> b!1585700 (=> (not res!1083053) (not e!885410))))

(assert (=> b!1585700 (= res!1083053 (bvslt (_1!12994 (h!38566 lt!677194)) (_1!12994 (h!38566 (t!51945 lt!677194)))))))

(declare-fun b!1585701 () Bool)

(assert (=> b!1585701 (= e!885410 (isStrictlySorted!1205 (t!51945 lt!677194)))))

(assert (= (and d!167611 (not res!1083052)) b!1585700))

(assert (= (and b!1585700 res!1083053) b!1585701))

(declare-fun m!1453739 () Bool)

(assert (=> b!1585701 m!1453739))

(assert (=> b!1585654 d!167611))

(declare-fun d!167613 () Bool)

(assert (=> d!167613 (= ($colon$colon!1055 Nil!37023 lt!677195) (Cons!37022 lt!677195 Nil!37023))))

(assert (=> b!1585654 d!167613))

(declare-fun b!1585714 () Bool)

(declare-fun e!885421 () Bool)

(declare-fun tp!115328 () Bool)

(assert (=> b!1585714 (= e!885421 (and tp_is_empty!39539 tp!115328))))

(assert (=> b!1585656 (= tp!115323 e!885421)))

(assert (= (and b!1585656 (is-Cons!37022 (t!51945 l!556))) b!1585714))

(push 1)

(assert (not b!1585714))

(assert tp_is_empty!39539)

(assert (not b!1585697))

(assert (not b!1585669))

(assert (not b!1585701))

(assert (not d!167597))

(assert (not b!1585679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

