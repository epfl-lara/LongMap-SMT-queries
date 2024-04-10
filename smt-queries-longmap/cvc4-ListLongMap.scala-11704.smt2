; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136848 () Bool)

(assert start!136848)

(declare-fun b!1578884 () Bool)

(declare-fun e!880715 () Bool)

(declare-fun tp!114267 () Bool)

(assert (=> b!1578884 (= e!880715 tp!114267)))

(declare-fun b!1578885 () Bool)

(declare-fun e!880713 () Bool)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1578885 (= e!880713 (= a0!51 a!525))))

(declare-fun b!1578886 () Bool)

(declare-fun res!1078808 () Bool)

(assert (=> b!1578886 (=> res!1078808 e!880713)))

(declare-datatypes ((B!2568 0))(
  ( (B!2569 (val!19646 Int)) )
))
(declare-datatypes ((tuple2!25394 0))(
  ( (tuple2!25395 (_1!12708 (_ BitVec 64)) (_2!12708 B!2568)) )
))
(declare-datatypes ((List!36766 0))(
  ( (Nil!36763) (Cons!36762 (h!38305 tuple2!25394) (t!51680 List!36766)) )
))
(declare-datatypes ((ListLongMap!22733 0))(
  ( (ListLongMap!22734 (toList!11382 List!36766)) )
))
(declare-fun lm!251 () ListLongMap!22733)

(declare-fun containsKey!876 (List!36766 (_ BitVec 64)) Bool)

(assert (=> b!1578886 (= res!1078808 (containsKey!876 (toList!11382 lm!251) a0!51))))

(declare-fun b!1578888 () Bool)

(declare-fun e!880714 () Bool)

(assert (=> b!1578888 (= e!880714 e!880713)))

(declare-fun res!1078807 () Bool)

(assert (=> b!1578888 (=> res!1078807 e!880713)))

(declare-fun isStrictlySorted!1027 (List!36766) Bool)

(assert (=> b!1578888 (= res!1078807 (not (isStrictlySorted!1027 (toList!11382 lm!251))))))

(declare-fun b!1578887 () Bool)

(declare-fun res!1078809 () Bool)

(assert (=> b!1578887 (=> (not res!1078809) (not e!880714))))

(assert (=> b!1578887 (= res!1078809 (not (= a!525 a0!51)))))

(declare-fun res!1078806 () Bool)

(assert (=> start!136848 (=> (not res!1078806) (not e!880714))))

(declare-fun contains!10438 (ListLongMap!22733 (_ BitVec 64)) Bool)

(assert (=> start!136848 (= res!1078806 (not (contains!10438 lm!251 a0!51)))))

(assert (=> start!136848 e!880714))

(declare-fun inv!58922 (ListLongMap!22733) Bool)

(assert (=> start!136848 (and (inv!58922 lm!251) e!880715)))

(assert (=> start!136848 true))

(assert (= (and start!136848 res!1078806) b!1578887))

(assert (= (and b!1578887 res!1078809) b!1578888))

(assert (= (and b!1578888 (not res!1078807)) b!1578886))

(assert (= (and b!1578886 (not res!1078808)) b!1578885))

(assert (= start!136848 b!1578884))

(declare-fun m!1450901 () Bool)

(assert (=> b!1578886 m!1450901))

(declare-fun m!1450903 () Bool)

(assert (=> b!1578888 m!1450903))

(declare-fun m!1450905 () Bool)

(assert (=> start!136848 m!1450905))

(declare-fun m!1450907 () Bool)

(assert (=> start!136848 m!1450907))

(push 1)

(assert (not b!1578886))

(assert (not start!136848))

(assert (not b!1578888))

(assert (not b!1578884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166155 () Bool)

(declare-fun res!1078814 () Bool)

(declare-fun e!880720 () Bool)

(assert (=> d!166155 (=> res!1078814 e!880720)))

(assert (=> d!166155 (= res!1078814 (and (is-Cons!36762 (toList!11382 lm!251)) (= (_1!12708 (h!38305 (toList!11382 lm!251))) a0!51)))))

(assert (=> d!166155 (= (containsKey!876 (toList!11382 lm!251) a0!51) e!880720)))

(declare-fun b!1578893 () Bool)

(declare-fun e!880721 () Bool)

(assert (=> b!1578893 (= e!880720 e!880721)))

(declare-fun res!1078815 () Bool)

(assert (=> b!1578893 (=> (not res!1078815) (not e!880721))))

(assert (=> b!1578893 (= res!1078815 (and (or (not (is-Cons!36762 (toList!11382 lm!251))) (bvsle (_1!12708 (h!38305 (toList!11382 lm!251))) a0!51)) (is-Cons!36762 (toList!11382 lm!251)) (bvslt (_1!12708 (h!38305 (toList!11382 lm!251))) a0!51)))))

(declare-fun b!1578894 () Bool)

(assert (=> b!1578894 (= e!880721 (containsKey!876 (t!51680 (toList!11382 lm!251)) a0!51))))

(assert (= (and d!166155 (not res!1078814)) b!1578893))

(assert (= (and b!1578893 res!1078815) b!1578894))

(declare-fun m!1450909 () Bool)

(assert (=> b!1578894 m!1450909))

(assert (=> b!1578886 d!166155))

(declare-fun d!166161 () Bool)

(declare-fun e!880742 () Bool)

(assert (=> d!166161 e!880742))

(declare-fun res!1078829 () Bool)

(assert (=> d!166161 (=> res!1078829 e!880742)))

(declare-fun lt!676362 () Bool)

(assert (=> d!166161 (= res!1078829 (not lt!676362))))

(declare-fun lt!676361 () Bool)

(assert (=> d!166161 (= lt!676362 lt!676361)))

(declare-datatypes ((Unit!52201 0))(
  ( (Unit!52202) )
))
(declare-fun lt!676360 () Unit!52201)

(declare-fun e!880743 () Unit!52201)

(assert (=> d!166161 (= lt!676360 e!880743)))

(declare-fun c!146321 () Bool)

(assert (=> d!166161 (= c!146321 lt!676361)))

(assert (=> d!166161 (= lt!676361 (containsKey!876 (toList!11382 lm!251) a0!51))))

(assert (=> d!166161 (= (contains!10438 lm!251 a0!51) lt!676362)))

(declare-fun b!1578922 () Bool)

(declare-fun lt!676359 () Unit!52201)

(assert (=> b!1578922 (= e!880743 lt!676359)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!541 (List!36766 (_ BitVec 64)) Unit!52201)

(assert (=> b!1578922 (= lt!676359 (lemmaContainsKeyImpliesGetValueByKeyDefined!541 (toList!11382 lm!251) a0!51))))

(declare-datatypes ((Option!877 0))(
  ( (Some!876 (v!22365 B!2568)) (None!875) )
))
(declare-fun isDefined!590 (Option!877) Bool)

(declare-fun getValueByKey!800 (List!36766 (_ BitVec 64)) Option!877)

(assert (=> b!1578922 (isDefined!590 (getValueByKey!800 (toList!11382 lm!251) a0!51))))

(declare-fun b!1578923 () Bool)

(declare-fun Unit!52205 () Unit!52201)

(assert (=> b!1578923 (= e!880743 Unit!52205)))

(declare-fun b!1578924 () Bool)

(assert (=> b!1578924 (= e!880742 (isDefined!590 (getValueByKey!800 (toList!11382 lm!251) a0!51)))))

(assert (= (and d!166161 c!146321) b!1578922))

(assert (= (and d!166161 (not c!146321)) b!1578923))

(assert (= (and d!166161 (not res!1078829)) b!1578924))

(assert (=> d!166161 m!1450901))

(declare-fun m!1450919 () Bool)

(assert (=> b!1578922 m!1450919))

(declare-fun m!1450921 () Bool)

(assert (=> b!1578922 m!1450921))

(assert (=> b!1578922 m!1450921))

(declare-fun m!1450923 () Bool)

(assert (=> b!1578922 m!1450923))

(assert (=> b!1578924 m!1450921))

(assert (=> b!1578924 m!1450921))

(assert (=> b!1578924 m!1450923))

(assert (=> start!136848 d!166161))

(declare-fun d!166169 () Bool)

(assert (=> d!166169 (= (inv!58922 lm!251) (isStrictlySorted!1027 (toList!11382 lm!251)))))

(declare-fun bs!45721 () Bool)

(assert (= bs!45721 d!166169))

(assert (=> bs!45721 m!1450903))

(assert (=> start!136848 d!166169))

(declare-fun d!166171 () Bool)

(declare-fun res!1078843 () Bool)

(declare-fun e!880758 () Bool)

(assert (=> d!166171 (=> res!1078843 e!880758)))

(assert (=> d!166171 (= res!1078843 (or (is-Nil!36763 (toList!11382 lm!251)) (is-Nil!36763 (t!51680 (toList!11382 lm!251)))))))

(assert (=> d!166171 (= (isStrictlySorted!1027 (toList!11382 lm!251)) e!880758)))

(declare-fun b!1578940 () Bool)

(declare-fun e!880761 () Bool)

(assert (=> b!1578940 (= e!880758 e!880761)))

(declare-fun res!1078845 () Bool)

(assert (=> b!1578940 (=> (not res!1078845) (not e!880761))))

(assert (=> b!1578940 (= res!1078845 (bvslt (_1!12708 (h!38305 (toList!11382 lm!251))) (_1!12708 (h!38305 (t!51680 (toList!11382 lm!251))))))))

(declare-fun b!1578941 () Bool)

(assert (=> b!1578941 (= e!880761 (isStrictlySorted!1027 (t!51680 (toList!11382 lm!251))))))

(assert (= (and d!166171 (not res!1078843)) b!1578940))

(assert (= (and b!1578940 res!1078845) b!1578941))

(declare-fun m!1450933 () Bool)

(assert (=> b!1578941 m!1450933))

(assert (=> b!1578888 d!166171))

(declare-fun b!1578952 () Bool)

(declare-fun e!880768 () Bool)

(declare-fun tp_is_empty!39109 () Bool)

(declare-fun tp!114270 () Bool)

(assert (=> b!1578952 (= e!880768 (and tp_is_empty!39109 tp!114270))))

(assert (=> b!1578884 (= tp!114267 e!880768)))

(assert (= (and b!1578884 (is-Cons!36762 (toList!11382 lm!251))) b!1578952))

(push 1)

