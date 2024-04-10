; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138272 () Bool)

(assert start!138272)

(declare-fun b!1585699 () Bool)

(declare-fun e!885356 () Bool)

(declare-fun tp_is_empty!39523 () Bool)

(declare-fun tp!115281 () Bool)

(assert (=> b!1585699 (= e!885356 (and tp_is_empty!39523 tp!115281))))

(declare-fun b!1585700 () Bool)

(declare-fun e!885357 () Bool)

(declare-fun e!885355 () Bool)

(assert (=> b!1585700 (= e!885357 e!885355)))

(declare-fun res!1082922 () Bool)

(assert (=> b!1585700 (=> res!1082922 e!885355)))

(declare-datatypes ((B!2990 0))(
  ( (B!2991 (val!19857 Int)) )
))
(declare-datatypes ((tuple2!25882 0))(
  ( (tuple2!25883 (_1!12952 (_ BitVec 64)) (_2!12952 B!2990)) )
))
(declare-datatypes ((List!36977 0))(
  ( (Nil!36974) (Cons!36973 (h!38516 tuple2!25882) (t!51898 List!36977)) )
))
(declare-fun lt!677411 () List!36977)

(declare-fun isStrictlySorted!1199 (List!36977) Bool)

(assert (=> b!1585700 (= res!1082922 (not (isStrictlySorted!1199 lt!677411)))))

(declare-fun l!556 () List!36977)

(declare-fun lt!677412 () tuple2!25882)

(declare-fun $colon$colon!1043 (List!36977 tuple2!25882) List!36977)

(assert (=> b!1585700 (= lt!677411 ($colon$colon!1043 (t!51898 l!556) lt!677412))))

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun newValue!21 () B!2990)

(assert (=> b!1585700 (= lt!677412 (tuple2!25883 newKey!21 newValue!21))))

(declare-fun res!1082924 () Bool)

(assert (=> start!138272 (=> (not res!1082924) (not e!885357))))

(assert (=> start!138272 (= res!1082924 (isStrictlySorted!1199 l!556))))

(assert (=> start!138272 e!885357))

(assert (=> start!138272 e!885356))

(assert (=> start!138272 true))

(assert (=> start!138272 tp_is_empty!39523))

(declare-fun b!1585701 () Bool)

(declare-fun res!1082923 () Bool)

(assert (=> b!1585701 (=> res!1082923 e!885355)))

(declare-fun containsKey!1012 (List!36977 (_ BitVec 64)) Bool)

(assert (=> b!1585701 (= res!1082923 (not (containsKey!1012 lt!677411 newKey!21)))))

(declare-fun b!1585702 () Bool)

(declare-fun res!1082921 () Bool)

(assert (=> b!1585702 (=> (not res!1082921) (not e!885357))))

(assert (=> b!1585702 (= res!1082921 (and (bvsge (_1!12952 (h!38516 l!556)) newKey!21) (is-Cons!36973 l!556) (= (_1!12952 (h!38516 l!556)) newKey!21)))))

(declare-fun b!1585703 () Bool)

(declare-fun contains!10535 (List!36977 tuple2!25882) Bool)

(assert (=> b!1585703 (= e!885355 (not (contains!10535 lt!677411 lt!677412)))))

(assert (= (and start!138272 res!1082924) b!1585702))

(assert (= (and b!1585702 res!1082921) b!1585700))

(assert (= (and b!1585700 (not res!1082922)) b!1585701))

(assert (= (and b!1585701 (not res!1082923)) b!1585703))

(assert (= (and start!138272 (is-Cons!36973 l!556)) b!1585699))

(declare-fun m!1454433 () Bool)

(assert (=> b!1585700 m!1454433))

(declare-fun m!1454435 () Bool)

(assert (=> b!1585700 m!1454435))

(declare-fun m!1454437 () Bool)

(assert (=> start!138272 m!1454437))

(declare-fun m!1454439 () Bool)

(assert (=> b!1585701 m!1454439))

(declare-fun m!1454441 () Bool)

(assert (=> b!1585703 m!1454441))

(push 1)

(assert (not b!1585699))

(assert (not start!138272))

(assert (not b!1585701))

(assert tp_is_empty!39523)

(assert (not b!1585703))

(assert (not b!1585700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167775 () Bool)

(declare-fun res!1082965 () Bool)

(declare-fun e!885392 () Bool)

(assert (=> d!167775 (=> res!1082965 e!885392)))

(assert (=> d!167775 (= res!1082965 (or (is-Nil!36974 l!556) (is-Nil!36974 (t!51898 l!556))))))

(assert (=> d!167775 (= (isStrictlySorted!1199 l!556) e!885392)))

(declare-fun b!1585750 () Bool)

(declare-fun e!885393 () Bool)

(assert (=> b!1585750 (= e!885392 e!885393)))

(declare-fun res!1082966 () Bool)

(assert (=> b!1585750 (=> (not res!1082966) (not e!885393))))

(assert (=> b!1585750 (= res!1082966 (bvslt (_1!12952 (h!38516 l!556)) (_1!12952 (h!38516 (t!51898 l!556)))))))

(declare-fun b!1585751 () Bool)

(assert (=> b!1585751 (= e!885393 (isStrictlySorted!1199 (t!51898 l!556)))))

(assert (= (and d!167775 (not res!1082965)) b!1585750))

(assert (= (and b!1585750 res!1082966) b!1585751))

(declare-fun m!1454467 () Bool)

(assert (=> b!1585751 m!1454467))

(assert (=> start!138272 d!167775))

(declare-fun d!167779 () Bool)

(declare-fun lt!677429 () Bool)

(declare-fun content!867 (List!36977) (Set tuple2!25882))

(assert (=> d!167779 (= lt!677429 (set.member lt!677412 (content!867 lt!677411)))))

(declare-fun e!885405 () Bool)

(assert (=> d!167779 (= lt!677429 e!885405)))

(declare-fun res!1082978 () Bool)

(assert (=> d!167779 (=> (not res!1082978) (not e!885405))))

(assert (=> d!167779 (= res!1082978 (is-Cons!36973 lt!677411))))

(assert (=> d!167779 (= (contains!10535 lt!677411 lt!677412) lt!677429)))

(declare-fun b!1585762 () Bool)

(declare-fun e!885404 () Bool)

(assert (=> b!1585762 (= e!885405 e!885404)))

(declare-fun res!1082977 () Bool)

(assert (=> b!1585762 (=> res!1082977 e!885404)))

(assert (=> b!1585762 (= res!1082977 (= (h!38516 lt!677411) lt!677412))))

(declare-fun b!1585763 () Bool)

(assert (=> b!1585763 (= e!885404 (contains!10535 (t!51898 lt!677411) lt!677412))))

(assert (= (and d!167779 res!1082978) b!1585762))

(assert (= (and b!1585762 (not res!1082977)) b!1585763))

(declare-fun m!1454471 () Bool)

(assert (=> d!167779 m!1454471))

(declare-fun m!1454473 () Bool)

(assert (=> d!167779 m!1454473))

(declare-fun m!1454475 () Bool)

(assert (=> b!1585763 m!1454475))

(assert (=> b!1585703 d!167779))

(declare-fun d!167785 () Bool)

(declare-fun res!1082983 () Bool)

(declare-fun e!885410 () Bool)

(assert (=> d!167785 (=> res!1082983 e!885410)))

(assert (=> d!167785 (= res!1082983 (or (is-Nil!36974 lt!677411) (is-Nil!36974 (t!51898 lt!677411))))))

(assert (=> d!167785 (= (isStrictlySorted!1199 lt!677411) e!885410)))

(declare-fun b!1585768 () Bool)

(declare-fun e!885411 () Bool)

(assert (=> b!1585768 (= e!885410 e!885411)))

(declare-fun res!1082984 () Bool)

(assert (=> b!1585768 (=> (not res!1082984) (not e!885411))))

(assert (=> b!1585768 (= res!1082984 (bvslt (_1!12952 (h!38516 lt!677411)) (_1!12952 (h!38516 (t!51898 lt!677411)))))))

(declare-fun b!1585769 () Bool)

(assert (=> b!1585769 (= e!885411 (isStrictlySorted!1199 (t!51898 lt!677411)))))

(assert (= (and d!167785 (not res!1082983)) b!1585768))

(assert (= (and b!1585768 res!1082984) b!1585769))

(declare-fun m!1454477 () Bool)

(assert (=> b!1585769 m!1454477))

(assert (=> b!1585700 d!167785))

(declare-fun d!167787 () Bool)

(assert (=> d!167787 (= ($colon$colon!1043 (t!51898 l!556) lt!677412) (Cons!36973 lt!677412 (t!51898 l!556)))))

(assert (=> b!1585700 d!167787))

(declare-fun d!167789 () Bool)

(declare-fun res!1082997 () Bool)

(declare-fun e!885427 () Bool)

(assert (=> d!167789 (=> res!1082997 e!885427)))

(assert (=> d!167789 (= res!1082997 (and (is-Cons!36973 lt!677411) (= (_1!12952 (h!38516 lt!677411)) newKey!21)))))

(assert (=> d!167789 (= (containsKey!1012 lt!677411 newKey!21) e!885427)))

(declare-fun b!1585787 () Bool)

(declare-fun e!885428 () Bool)

(assert (=> b!1585787 (= e!885427 e!885428)))

(declare-fun res!1082998 () Bool)

(assert (=> b!1585787 (=> (not res!1082998) (not e!885428))))

(assert (=> b!1585787 (= res!1082998 (and (or (not (is-Cons!36973 lt!677411)) (bvsle (_1!12952 (h!38516 lt!677411)) newKey!21)) (is-Cons!36973 lt!677411) (bvslt (_1!12952 (h!38516 lt!677411)) newKey!21)))))

(declare-fun b!1585788 () Bool)

(assert (=> b!1585788 (= e!885428 (containsKey!1012 (t!51898 lt!677411) newKey!21))))

(assert (= (and d!167789 (not res!1082997)) b!1585787))

(assert (= (and b!1585787 res!1082998) b!1585788))

(declare-fun m!1454493 () Bool)

(assert (=> b!1585788 m!1454493))

(assert (=> b!1585701 d!167789))

(declare-fun b!1585795 () Bool)

(declare-fun e!885433 () Bool)

(declare-fun tp!115293 () Bool)

(assert (=> b!1585795 (= e!885433 (and tp_is_empty!39523 tp!115293))))

(assert (=> b!1585699 (= tp!115281 e!885433)))

(assert (= (and b!1585699 (is-Cons!36973 (t!51898 l!556))) b!1585795))

(push 1)

(assert (not b!1585795))

(assert (not b!1585769))

(assert (not b!1585751))

(assert (not b!1585788))

(assert tp_is_empty!39523)

(assert (not b!1585763))

(assert (not d!167779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

