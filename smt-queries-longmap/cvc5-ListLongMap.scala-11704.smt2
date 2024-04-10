; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136844 () Bool)

(assert start!136844)

(declare-fun b!1578854 () Bool)

(declare-fun res!1078783 () Bool)

(declare-fun e!880695 () Bool)

(assert (=> b!1578854 (=> (not res!1078783) (not e!880695))))

(declare-fun a!525 () (_ BitVec 64))

(declare-fun a0!51 () (_ BitVec 64))

(assert (=> b!1578854 (= res!1078783 (not (= a!525 a0!51)))))

(declare-fun res!1078785 () Bool)

(assert (=> start!136844 (=> (not res!1078785) (not e!880695))))

(declare-datatypes ((B!2564 0))(
  ( (B!2565 (val!19644 Int)) )
))
(declare-datatypes ((tuple2!25390 0))(
  ( (tuple2!25391 (_1!12706 (_ BitVec 64)) (_2!12706 B!2564)) )
))
(declare-datatypes ((List!36764 0))(
  ( (Nil!36761) (Cons!36760 (h!38303 tuple2!25390) (t!51678 List!36764)) )
))
(declare-datatypes ((ListLongMap!22729 0))(
  ( (ListLongMap!22730 (toList!11380 List!36764)) )
))
(declare-fun lm!251 () ListLongMap!22729)

(declare-fun contains!10436 (ListLongMap!22729 (_ BitVec 64)) Bool)

(assert (=> start!136844 (= res!1078785 (not (contains!10436 lm!251 a0!51)))))

(assert (=> start!136844 e!880695))

(declare-fun e!880697 () Bool)

(declare-fun inv!58920 (ListLongMap!22729) Bool)

(assert (=> start!136844 (and (inv!58920 lm!251) e!880697)))

(assert (=> start!136844 true))

(declare-fun b!1578855 () Bool)

(declare-fun tp!114261 () Bool)

(assert (=> b!1578855 (= e!880697 tp!114261)))

(declare-fun b!1578856 () Bool)

(declare-fun res!1078784 () Bool)

(declare-fun e!880696 () Bool)

(assert (=> b!1578856 (=> res!1078784 e!880696)))

(declare-fun containsKey!874 (List!36764 (_ BitVec 64)) Bool)

(assert (=> b!1578856 (= res!1078784 (containsKey!874 (toList!11380 lm!251) a0!51))))

(declare-fun b!1578857 () Bool)

(assert (=> b!1578857 (= e!880695 e!880696)))

(declare-fun res!1078782 () Bool)

(assert (=> b!1578857 (=> res!1078782 e!880696)))

(declare-fun isStrictlySorted!1025 (List!36764) Bool)

(assert (=> b!1578857 (= res!1078782 (not (isStrictlySorted!1025 (toList!11380 lm!251))))))

(declare-fun b!1578858 () Bool)

(assert (=> b!1578858 (= e!880696 (= a0!51 a!525))))

(assert (= (and start!136844 res!1078785) b!1578854))

(assert (= (and b!1578854 res!1078783) b!1578857))

(assert (= (and b!1578857 (not res!1078782)) b!1578856))

(assert (= (and b!1578856 (not res!1078784)) b!1578858))

(assert (= start!136844 b!1578855))

(declare-fun m!1450885 () Bool)

(assert (=> start!136844 m!1450885))

(declare-fun m!1450887 () Bool)

(assert (=> start!136844 m!1450887))

(declare-fun m!1450889 () Bool)

(assert (=> b!1578856 m!1450889))

(declare-fun m!1450891 () Bool)

(assert (=> b!1578857 m!1450891))

(push 1)

(assert (not b!1578856))

(assert (not start!136844))

(assert (not b!1578857))

(assert (not b!1578855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166159 () Bool)

(declare-fun res!1078820 () Bool)

(declare-fun e!880726 () Bool)

(assert (=> d!166159 (=> res!1078820 e!880726)))

(assert (=> d!166159 (= res!1078820 (and (is-Cons!36760 (toList!11380 lm!251)) (= (_1!12706 (h!38303 (toList!11380 lm!251))) a0!51)))))

(assert (=> d!166159 (= (containsKey!874 (toList!11380 lm!251) a0!51) e!880726)))

(declare-fun b!1578899 () Bool)

(declare-fun e!880727 () Bool)

(assert (=> b!1578899 (= e!880726 e!880727)))

(declare-fun res!1078821 () Bool)

(assert (=> b!1578899 (=> (not res!1078821) (not e!880727))))

(assert (=> b!1578899 (= res!1078821 (and (or (not (is-Cons!36760 (toList!11380 lm!251))) (bvsle (_1!12706 (h!38303 (toList!11380 lm!251))) a0!51)) (is-Cons!36760 (toList!11380 lm!251)) (bvslt (_1!12706 (h!38303 (toList!11380 lm!251))) a0!51)))))

(declare-fun b!1578900 () Bool)

(assert (=> b!1578900 (= e!880727 (containsKey!874 (t!51678 (toList!11380 lm!251)) a0!51))))

(assert (= (and d!166159 (not res!1078820)) b!1578899))

(assert (= (and b!1578899 res!1078821) b!1578900))

(declare-fun m!1450911 () Bool)

(assert (=> b!1578900 m!1450911))

(assert (=> b!1578856 d!166159))

(declare-fun d!166163 () Bool)

(declare-fun e!880749 () Bool)

(assert (=> d!166163 e!880749))

(declare-fun res!1078834 () Bool)

(assert (=> d!166163 (=> res!1078834 e!880749)))

(declare-fun lt!676363 () Bool)

(assert (=> d!166163 (= res!1078834 (not lt!676363))))

(declare-fun lt!676366 () Bool)

(assert (=> d!166163 (= lt!676363 lt!676366)))

(declare-datatypes ((Unit!52203 0))(
  ( (Unit!52204) )
))
(declare-fun lt!676365 () Unit!52203)

(declare-fun e!880748 () Unit!52203)

(assert (=> d!166163 (= lt!676365 e!880748)))

(declare-fun c!146322 () Bool)

(assert (=> d!166163 (= c!146322 lt!676366)))

(assert (=> d!166163 (= lt!676366 (containsKey!874 (toList!11380 lm!251) a0!51))))

(assert (=> d!166163 (= (contains!10436 lm!251 a0!51) lt!676363)))

(declare-fun b!1578929 () Bool)

(declare-fun lt!676364 () Unit!52203)

(assert (=> b!1578929 (= e!880748 lt!676364)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!542 (List!36764 (_ BitVec 64)) Unit!52203)

(assert (=> b!1578929 (= lt!676364 (lemmaContainsKeyImpliesGetValueByKeyDefined!542 (toList!11380 lm!251) a0!51))))

(declare-datatypes ((Option!876 0))(
  ( (Some!875 (v!22364 B!2564)) (None!874) )
))
(declare-fun isDefined!589 (Option!876) Bool)

(declare-fun getValueByKey!801 (List!36764 (_ BitVec 64)) Option!876)

(assert (=> b!1578929 (isDefined!589 (getValueByKey!801 (toList!11380 lm!251) a0!51))))

(declare-fun b!1578930 () Bool)

(declare-fun Unit!52206 () Unit!52203)

(assert (=> b!1578930 (= e!880748 Unit!52206)))

(declare-fun b!1578931 () Bool)

(assert (=> b!1578931 (= e!880749 (isDefined!589 (getValueByKey!801 (toList!11380 lm!251) a0!51)))))

(assert (= (and d!166163 c!146322) b!1578929))

(assert (= (and d!166163 (not c!146322)) b!1578930))

(assert (= (and d!166163 (not res!1078834)) b!1578931))

(assert (=> d!166163 m!1450889))

(declare-fun m!1450925 () Bool)

(assert (=> b!1578929 m!1450925))

(declare-fun m!1450927 () Bool)

(assert (=> b!1578929 m!1450927))

(assert (=> b!1578929 m!1450927))

(declare-fun m!1450929 () Bool)

(assert (=> b!1578929 m!1450929))

(assert (=> b!1578931 m!1450927))

(assert (=> b!1578931 m!1450927))

(assert (=> b!1578931 m!1450929))

(assert (=> start!136844 d!166163))

(declare-fun d!166173 () Bool)

(assert (=> d!166173 (= (inv!58920 lm!251) (isStrictlySorted!1025 (toList!11380 lm!251)))))

(declare-fun bs!45722 () Bool)

(assert (= bs!45722 d!166173))

(assert (=> bs!45722 m!1450891))

(assert (=> start!136844 d!166173))

(declare-fun d!166177 () Bool)

(declare-fun res!1078853 () Bool)

(declare-fun e!880771 () Bool)

(assert (=> d!166177 (=> res!1078853 e!880771)))

(assert (=> d!166177 (= res!1078853 (or (is-Nil!36761 (toList!11380 lm!251)) (is-Nil!36761 (t!51678 (toList!11380 lm!251)))))))

(assert (=> d!166177 (= (isStrictlySorted!1025 (toList!11380 lm!251)) e!880771)))

(declare-fun b!1578955 () Bool)

(declare-fun e!880772 () Bool)

(assert (=> b!1578955 (= e!880771 e!880772)))

(declare-fun res!1078854 () Bool)

(assert (=> b!1578955 (=> (not res!1078854) (not e!880772))))

(assert (=> b!1578955 (= res!1078854 (bvslt (_1!12706 (h!38303 (toList!11380 lm!251))) (_1!12706 (h!38303 (t!51678 (toList!11380 lm!251))))))))

(declare-fun b!1578956 () Bool)

(assert (=> b!1578956 (= e!880772 (isStrictlySorted!1025 (t!51678 (toList!11380 lm!251))))))

(assert (= (and d!166177 (not res!1078853)) b!1578955))

(assert (= (and b!1578955 res!1078854) b!1578956))

(declare-fun m!1450937 () Bool)

(assert (=> b!1578956 m!1450937))

(assert (=> b!1578857 d!166177))

(declare-fun b!1578966 () Bool)

(declare-fun e!880778 () Bool)

(declare-fun tp_is_empty!39113 () Bool)

(declare-fun tp!114276 () Bool)

(assert (=> b!1578966 (= e!880778 (and tp_is_empty!39113 tp!114276))))

(assert (=> b!1578855 (= tp!114261 e!880778)))

(assert (= (and b!1578855 (is-Cons!36760 (toList!11380 lm!251))) b!1578966))

(push 1)

(assert (not b!1578929))

(assert (not b!1578966))

(assert (not b!1578900))

(assert (not d!166173))

(assert (not b!1578956))

(assert tp_is_empty!39113)

