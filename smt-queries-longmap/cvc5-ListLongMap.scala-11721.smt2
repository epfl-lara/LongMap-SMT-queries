; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137174 () Bool)

(assert start!137174)

(declare-fun b!1580512 () Bool)

(declare-fun e!881743 () Bool)

(declare-fun e!881744 () Bool)

(assert (=> b!1580512 (= e!881743 e!881744)))

(declare-fun res!1079732 () Bool)

(assert (=> b!1580512 (=> (not res!1079732) (not e!881744))))

(declare-datatypes ((B!2666 0))(
  ( (B!2667 (val!19695 Int)) )
))
(declare-datatypes ((tuple2!25516 0))(
  ( (tuple2!25517 (_1!12769 (_ BitVec 64)) (_2!12769 B!2666)) )
))
(declare-datatypes ((List!36815 0))(
  ( (Nil!36812) (Cons!36811 (h!38354 tuple2!25516) (t!51729 List!36815)) )
))
(declare-datatypes ((tuple2!25518 0))(
  ( (tuple2!25519 (_1!12770 tuple2!25516) (_2!12770 List!36815)) )
))
(declare-datatypes ((Option!902 0))(
  ( (Some!901 (v!22402 tuple2!25518)) (None!900) )
))
(declare-fun lt!676786 () Option!902)

(declare-fun isEmpty!1166 (Option!902) Bool)

(assert (=> b!1580512 (= res!1079732 (not (isEmpty!1166 lt!676786)))))

(declare-fun l!1390 () List!36815)

(declare-fun unapply!82 (List!36815) Option!902)

(assert (=> b!1580512 (= lt!676786 (unapply!82 l!1390))))

(declare-fun b!1580513 () Bool)

(declare-fun res!1079733 () Bool)

(assert (=> b!1580513 (=> (not res!1079733) (not e!881743))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!919 (List!36815 (_ BitVec 64)) Bool)

(assert (=> b!1580513 (= res!1079733 (containsKey!919 l!1390 key!405))))

(declare-fun b!1580514 () Bool)

(declare-fun res!1079729 () Bool)

(assert (=> b!1580514 (=> (not res!1079729) (not e!881744))))

(declare-fun get!26793 (Option!902) tuple2!25518)

(assert (=> b!1580514 (= res!1079729 (is-Nil!36812 (_2!12770 (get!26793 lt!676786))))))

(declare-fun b!1580515 () Bool)

(declare-fun value!194 () B!2666)

(declare-datatypes ((Option!903 0))(
  ( (Some!902 (v!22403 B!2666)) (None!901) )
))
(declare-fun getValueByKey!814 (List!36815 (_ BitVec 64)) Option!903)

(assert (=> b!1580515 (= e!881744 (not (= (getValueByKey!814 l!1390 key!405) (Some!902 value!194))))))

(declare-fun b!1580517 () Bool)

(declare-fun res!1079731 () Bool)

(assert (=> b!1580517 (=> (not res!1079731) (not e!881743))))

(declare-fun contains!10487 (List!36815 tuple2!25516) Bool)

(assert (=> b!1580517 (= res!1079731 (contains!10487 l!1390 (tuple2!25517 key!405 value!194)))))

(declare-fun b!1580516 () Bool)

(declare-fun e!881742 () Bool)

(declare-fun tp_is_empty!39211 () Bool)

(declare-fun tp!114486 () Bool)

(assert (=> b!1580516 (= e!881742 (and tp_is_empty!39211 tp!114486))))

(declare-fun res!1079730 () Bool)

(assert (=> start!137174 (=> (not res!1079730) (not e!881743))))

(declare-fun isStrictlySorted!1073 (List!36815) Bool)

(assert (=> start!137174 (= res!1079730 (isStrictlySorted!1073 l!1390))))

(assert (=> start!137174 e!881743))

(assert (=> start!137174 e!881742))

(assert (=> start!137174 true))

(assert (=> start!137174 tp_is_empty!39211))

(assert (= (and start!137174 res!1079730) b!1580513))

(assert (= (and b!1580513 res!1079733) b!1580517))

(assert (= (and b!1580517 res!1079731) b!1580512))

(assert (= (and b!1580512 res!1079732) b!1580514))

(assert (= (and b!1580514 res!1079729) b!1580515))

(assert (= (and start!137174 (is-Cons!36811 l!1390)) b!1580516))

(declare-fun m!1451893 () Bool)

(assert (=> b!1580514 m!1451893))

(declare-fun m!1451895 () Bool)

(assert (=> b!1580513 m!1451895))

(declare-fun m!1451897 () Bool)

(assert (=> b!1580512 m!1451897))

(declare-fun m!1451899 () Bool)

(assert (=> b!1580512 m!1451899))

(declare-fun m!1451901 () Bool)

(assert (=> b!1580515 m!1451901))

(declare-fun m!1451903 () Bool)

(assert (=> start!137174 m!1451903))

(declare-fun m!1451905 () Bool)

(assert (=> b!1580517 m!1451905))

(push 1)

(assert (not b!1580516))

(assert (not b!1580514))

(assert (not b!1580517))

(assert (not start!137174))

(assert (not b!1580513))

(assert (not b!1580512))

(assert (not b!1580515))

(assert tp_is_empty!39211)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1580583 () Bool)

(declare-fun e!881780 () Option!903)

(assert (=> b!1580583 (= e!881780 None!901)))

(declare-fun b!1580582 () Bool)

(assert (=> b!1580582 (= e!881780 (getValueByKey!814 (t!51729 l!1390) key!405))))

(declare-fun b!1580580 () Bool)

(declare-fun e!881779 () Option!903)

(assert (=> b!1580580 (= e!881779 (Some!902 (_2!12769 (h!38354 l!1390))))))

(declare-fun b!1580581 () Bool)

(assert (=> b!1580581 (= e!881779 e!881780)))

(declare-fun c!146544 () Bool)

(assert (=> b!1580581 (= c!146544 (and (is-Cons!36811 l!1390) (not (= (_1!12769 (h!38354 l!1390)) key!405))))))

(declare-fun d!166437 () Bool)

(declare-fun c!146543 () Bool)

(assert (=> d!166437 (= c!146543 (and (is-Cons!36811 l!1390) (= (_1!12769 (h!38354 l!1390)) key!405)))))

(assert (=> d!166437 (= (getValueByKey!814 l!1390 key!405) e!881779)))

(assert (= (and d!166437 c!146543) b!1580580))

(assert (= (and d!166437 (not c!146543)) b!1580581))

(assert (= (and b!1580581 c!146544) b!1580582))

(assert (= (and b!1580581 (not c!146544)) b!1580583))

(declare-fun m!1451939 () Bool)

(assert (=> b!1580582 m!1451939))

(assert (=> b!1580515 d!166437))

(declare-fun d!166445 () Bool)

(declare-fun res!1079784 () Bool)

(declare-fun e!881795 () Bool)

(assert (=> d!166445 (=> res!1079784 e!881795)))

(assert (=> d!166445 (= res!1079784 (or (is-Nil!36812 l!1390) (is-Nil!36812 (t!51729 l!1390))))))

(assert (=> d!166445 (= (isStrictlySorted!1073 l!1390) e!881795)))

(declare-fun b!1580598 () Bool)

(declare-fun e!881796 () Bool)

(assert (=> b!1580598 (= e!881795 e!881796)))

(declare-fun res!1079785 () Bool)

(assert (=> b!1580598 (=> (not res!1079785) (not e!881796))))

(assert (=> b!1580598 (= res!1079785 (bvslt (_1!12769 (h!38354 l!1390)) (_1!12769 (h!38354 (t!51729 l!1390)))))))

(declare-fun b!1580599 () Bool)

(assert (=> b!1580599 (= e!881796 (isStrictlySorted!1073 (t!51729 l!1390)))))

(assert (= (and d!166445 (not res!1079784)) b!1580598))

(assert (= (and b!1580598 res!1079785) b!1580599))

(declare-fun m!1451943 () Bool)

(assert (=> b!1580599 m!1451943))

(assert (=> start!137174 d!166445))

(declare-fun d!166447 () Bool)

(assert (=> d!166447 (= (get!26793 lt!676786) (v!22402 lt!676786))))

(assert (=> b!1580514 d!166447))

(declare-fun d!166453 () Bool)

(declare-fun res!1079798 () Bool)

(declare-fun e!881813 () Bool)

(assert (=> d!166453 (=> res!1079798 e!881813)))

(assert (=> d!166453 (= res!1079798 (and (is-Cons!36811 l!1390) (= (_1!12769 (h!38354 l!1390)) key!405)))))

(assert (=> d!166453 (= (containsKey!919 l!1390 key!405) e!881813)))

(declare-fun b!1580620 () Bool)

(declare-fun e!881814 () Bool)

(assert (=> b!1580620 (= e!881813 e!881814)))

(declare-fun res!1079799 () Bool)

(assert (=> b!1580620 (=> (not res!1079799) (not e!881814))))

(assert (=> b!1580620 (= res!1079799 (and (or (not (is-Cons!36811 l!1390)) (bvsle (_1!12769 (h!38354 l!1390)) key!405)) (is-Cons!36811 l!1390) (bvslt (_1!12769 (h!38354 l!1390)) key!405)))))

(declare-fun b!1580621 () Bool)

(assert (=> b!1580621 (= e!881814 (containsKey!919 (t!51729 l!1390) key!405))))

(assert (= (and d!166453 (not res!1079798)) b!1580620))

(assert (= (and b!1580620 res!1079799) b!1580621))

(declare-fun m!1451957 () Bool)

(assert (=> b!1580621 m!1451957))

(assert (=> b!1580513 d!166453))

(declare-fun d!166457 () Bool)

(assert (=> d!166457 (= (isEmpty!1166 lt!676786) (not (is-Some!901 lt!676786)))))

(assert (=> b!1580512 d!166457))

(declare-fun d!166463 () Bool)

(assert (=> d!166463 (= (unapply!82 l!1390) (ite (is-Nil!36812 l!1390) None!900 (Some!901 (tuple2!25519 (h!38354 l!1390) (t!51729 l!1390)))))))

(assert (=> b!1580512 d!166463))

(declare-fun d!166467 () Bool)

(declare-fun lt!676801 () Bool)

(declare-fun content!836 (List!36815) (Set tuple2!25516))

(assert (=> d!166467 (= lt!676801 (set.member (tuple2!25517 key!405 value!194) (content!836 l!1390)))))

(declare-fun e!881836 () Bool)

(assert (=> d!166467 (= lt!676801 e!881836)))

(declare-fun res!1079817 () Bool)

(assert (=> d!166467 (=> (not res!1079817) (not e!881836))))

(assert (=> d!166467 (= res!1079817 (is-Cons!36811 l!1390))))

(assert (=> d!166467 (= (contains!10487 l!1390 (tuple2!25517 key!405 value!194)) lt!676801)))

(declare-fun b!1580646 () Bool)

(declare-fun e!881835 () Bool)

(assert (=> b!1580646 (= e!881836 e!881835)))

(declare-fun res!1079816 () Bool)

(assert (=> b!1580646 (=> res!1079816 e!881835)))

(assert (=> b!1580646 (= res!1079816 (= (h!38354 l!1390) (tuple2!25517 key!405 value!194)))))

(declare-fun b!1580647 () Bool)

(assert (=> b!1580647 (= e!881835 (contains!10487 (t!51729 l!1390) (tuple2!25517 key!405 value!194)))))

(assert (= (and d!166467 res!1079817) b!1580646))

(assert (= (and b!1580646 (not res!1079816)) b!1580647))

(declare-fun m!1451965 () Bool)

(assert (=> d!166467 m!1451965))

(declare-fun m!1451967 () Bool)

(assert (=> d!166467 m!1451967))

(declare-fun m!1451969 () Bool)

(assert (=> b!1580647 m!1451969))

(assert (=> b!1580517 d!166467))

(declare-fun b!1580657 () Bool)

(declare-fun e!881842 () Bool)

(declare-fun tp!114500 () Bool)

(assert (=> b!1580657 (= e!881842 (and tp_is_empty!39211 tp!114500))))

(assert (=> b!1580516 (= tp!114486 e!881842)))

(assert (= (and b!1580516 (is-Cons!36811 (t!51729 l!1390))) b!1580657))

(push 1)

(assert (not b!1580657))

(assert (not d!166467))

(assert (not b!1580599))

(assert (not b!1580621))

(assert tp_is_empty!39211)

(assert (not b!1580647))

(assert (not b!1580582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166487 () Bool)

(declare-fun c!146558 () Bool)

(assert (=> d!166487 (= c!146558 (is-Nil!36812 l!1390))))

(declare-fun e!881858 () (Set tuple2!25516))

(assert (=> d!166487 (= (content!836 l!1390) e!881858)))

(declare-fun b!1580680 () Bool)

(assert (=> b!1580680 (= e!881858 (as set.empty (Set tuple2!25516)))))

(declare-fun b!1580681 () Bool)

(assert (=> b!1580681 (= e!881858 (set.union (set.insert (h!38354 l!1390) (as set.empty (Set tuple2!25516))) (content!836 (t!51729 l!1390))))))

(assert (= (and d!166487 c!146558) b!1580680))

(assert (= (and d!166487 (not c!146558)) b!1580681))

(declare-fun m!1451985 () Bool)

(assert (=> b!1580681 m!1451985))

(declare-fun m!1451987 () Bool)

(assert (=> b!1580681 m!1451987))

(assert (=> d!166467 d!166487))

(declare-fun d!166489 () Bool)

(declare-fun res!1079824 () Bool)

(declare-fun e!881859 () Bool)

(assert (=> d!166489 (=> res!1079824 e!881859)))

(assert (=> d!166489 (= res!1079824 (and (is-Cons!36811 (t!51729 l!1390)) (= (_1!12769 (h!38354 (t!51729 l!1390))) key!405)))))

(assert (=> d!166489 (= (containsKey!919 (t!51729 l!1390) key!405) e!881859)))

(declare-fun b!1580682 () Bool)

(declare-fun e!881860 () Bool)

(assert (=> b!1580682 (= e!881859 e!881860)))

(declare-fun res!1079825 () Bool)

(assert (=> b!1580682 (=> (not res!1079825) (not e!881860))))

(assert (=> b!1580682 (= res!1079825 (and (or (not (is-Cons!36811 (t!51729 l!1390))) (bvsle (_1!12769 (h!38354 (t!51729 l!1390))) key!405)) (is-Cons!36811 (t!51729 l!1390)) (bvslt (_1!12769 (h!38354 (t!51729 l!1390))) key!405)))))

(declare-fun b!1580683 () Bool)

(assert (=> b!1580683 (= e!881860 (containsKey!919 (t!51729 (t!51729 l!1390)) key!405))))

(assert (= (and d!166489 (not res!1079824)) b!1580682))

(assert (= (and b!1580682 res!1079825) b!1580683))

(declare-fun m!1451989 () Bool)

(assert (=> b!1580683 m!1451989))

(assert (=> b!1580621 d!166489))

(declare-fun b!1580687 () Bool)

(declare-fun e!881862 () Option!903)

(assert (=> b!1580687 (= e!881862 None!901)))

(declare-fun b!1580686 () Bool)

(assert (=> b!1580686 (= e!881862 (getValueByKey!814 (t!51729 (t!51729 l!1390)) key!405))))

(declare-fun b!1580684 () Bool)

(declare-fun e!881861 () Option!903)

(assert (=> b!1580684 (= e!881861 (Some!902 (_2!12769 (h!38354 (t!51729 l!1390)))))))

(declare-fun b!1580685 () Bool)

(assert (=> b!1580685 (= e!881861 e!881862)))

(declare-fun c!146560 () Bool)

(assert (=> b!1580685 (= c!146560 (and (is-Cons!36811 (t!51729 l!1390)) (not (= (_1!12769 (h!38354 (t!51729 l!1390))) key!405))))))

(declare-fun d!166491 () Bool)

(declare-fun c!146559 () Bool)

(assert (=> d!166491 (= c!146559 (and (is-Cons!36811 (t!51729 l!1390)) (= (_1!12769 (h!38354 (t!51729 l!1390))) key!405)))))

(assert (=> d!166491 (= (getValueByKey!814 (t!51729 l!1390) key!405) e!881861)))

(assert (= (and d!166491 c!146559) b!1580684))

(assert (= (and d!166491 (not c!146559)) b!1580685))

(assert (= (and b!1580685 c!146560) b!1580686))

(assert (= (and b!1580685 (not c!146560)) b!1580687))

(declare-fun m!1451991 () Bool)

