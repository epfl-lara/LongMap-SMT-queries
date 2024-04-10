; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136846 () Bool)

(assert start!136846)

(declare-fun b!1578869 () Bool)

(declare-fun e!880704 () Bool)

(declare-fun e!880705 () Bool)

(assert (=> b!1578869 (= e!880704 e!880705)))

(declare-fun res!1078797 () Bool)

(assert (=> b!1578869 (=> res!1078797 e!880705)))

(declare-datatypes ((B!2566 0))(
  ( (B!2567 (val!19645 Int)) )
))
(declare-datatypes ((tuple2!25392 0))(
  ( (tuple2!25393 (_1!12707 (_ BitVec 64)) (_2!12707 B!2566)) )
))
(declare-datatypes ((List!36765 0))(
  ( (Nil!36762) (Cons!36761 (h!38304 tuple2!25392) (t!51679 List!36765)) )
))
(declare-datatypes ((ListLongMap!22731 0))(
  ( (ListLongMap!22732 (toList!11381 List!36765)) )
))
(declare-fun lm!251 () ListLongMap!22731)

(declare-fun isStrictlySorted!1026 (List!36765) Bool)

(assert (=> b!1578869 (= res!1078797 (not (isStrictlySorted!1026 (toList!11381 lm!251))))))

(declare-fun b!1578870 () Bool)

(declare-fun e!880706 () Bool)

(declare-fun tp!114264 () Bool)

(assert (=> b!1578870 (= e!880706 tp!114264)))

(declare-fun b!1578871 () Bool)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1578871 (= e!880705 (= a0!51 a!525))))

(declare-fun b!1578872 () Bool)

(declare-fun res!1078794 () Bool)

(assert (=> b!1578872 (=> res!1078794 e!880705)))

(declare-fun containsKey!875 (List!36765 (_ BitVec 64)) Bool)

(assert (=> b!1578872 (= res!1078794 (containsKey!875 (toList!11381 lm!251) a0!51))))

(declare-fun b!1578873 () Bool)

(declare-fun res!1078795 () Bool)

(assert (=> b!1578873 (=> (not res!1078795) (not e!880704))))

(assert (=> b!1578873 (= res!1078795 (not (= a!525 a0!51)))))

(declare-fun res!1078796 () Bool)

(assert (=> start!136846 (=> (not res!1078796) (not e!880704))))

(declare-fun contains!10437 (ListLongMap!22731 (_ BitVec 64)) Bool)

(assert (=> start!136846 (= res!1078796 (not (contains!10437 lm!251 a0!51)))))

(assert (=> start!136846 e!880704))

(declare-fun inv!58921 (ListLongMap!22731) Bool)

(assert (=> start!136846 (and (inv!58921 lm!251) e!880706)))

(assert (=> start!136846 true))

(assert (= (and start!136846 res!1078796) b!1578873))

(assert (= (and b!1578873 res!1078795) b!1578869))

(assert (= (and b!1578869 (not res!1078797)) b!1578872))

(assert (= (and b!1578872 (not res!1078794)) b!1578871))

(assert (= start!136846 b!1578870))

(declare-fun m!1450893 () Bool)

(assert (=> b!1578869 m!1450893))

(declare-fun m!1450895 () Bool)

(assert (=> b!1578872 m!1450895))

(declare-fun m!1450897 () Bool)

(assert (=> start!136846 m!1450897))

(declare-fun m!1450899 () Bool)

(assert (=> start!136846 m!1450899))

(check-sat (not start!136846) (not b!1578872) (not b!1578869) (not b!1578870))
(check-sat)
(get-model)

(declare-fun d!166157 () Bool)

(declare-fun e!880732 () Bool)

(assert (=> d!166157 e!880732))

(declare-fun res!1078824 () Bool)

(assert (=> d!166157 (=> res!1078824 e!880732)))

(declare-fun lt!676342 () Bool)

(assert (=> d!166157 (= res!1078824 (not lt!676342))))

(declare-fun lt!676340 () Bool)

(assert (=> d!166157 (= lt!676342 lt!676340)))

(declare-datatypes ((Unit!52198 0))(
  ( (Unit!52199) )
))
(declare-fun lt!676341 () Unit!52198)

(declare-fun e!880733 () Unit!52198)

(assert (=> d!166157 (= lt!676341 e!880733)))

(declare-fun c!146316 () Bool)

(assert (=> d!166157 (= c!146316 lt!676340)))

(assert (=> d!166157 (= lt!676340 (containsKey!875 (toList!11381 lm!251) a0!51))))

(assert (=> d!166157 (= (contains!10437 lm!251 a0!51) lt!676342)))

(declare-fun b!1578907 () Bool)

(declare-fun lt!676339 () Unit!52198)

(assert (=> b!1578907 (= e!880733 lt!676339)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!540 (List!36765 (_ BitVec 64)) Unit!52198)

(assert (=> b!1578907 (= lt!676339 (lemmaContainsKeyImpliesGetValueByKeyDefined!540 (toList!11381 lm!251) a0!51))))

(declare-datatypes ((Option!875 0))(
  ( (Some!874 (v!22363 B!2566)) (None!873) )
))
(declare-fun isDefined!588 (Option!875) Bool)

(declare-fun getValueByKey!799 (List!36765 (_ BitVec 64)) Option!875)

(assert (=> b!1578907 (isDefined!588 (getValueByKey!799 (toList!11381 lm!251) a0!51))))

(declare-fun b!1578908 () Bool)

(declare-fun Unit!52200 () Unit!52198)

(assert (=> b!1578908 (= e!880733 Unit!52200)))

(declare-fun b!1578909 () Bool)

(assert (=> b!1578909 (= e!880732 (isDefined!588 (getValueByKey!799 (toList!11381 lm!251) a0!51)))))

(assert (= (and d!166157 c!146316) b!1578907))

(assert (= (and d!166157 (not c!146316)) b!1578908))

(assert (= (and d!166157 (not res!1078824)) b!1578909))

(assert (=> d!166157 m!1450895))

(declare-fun m!1450913 () Bool)

(assert (=> b!1578907 m!1450913))

(declare-fun m!1450915 () Bool)

(assert (=> b!1578907 m!1450915))

(assert (=> b!1578907 m!1450915))

(declare-fun m!1450917 () Bool)

(assert (=> b!1578907 m!1450917))

(assert (=> b!1578909 m!1450915))

(assert (=> b!1578909 m!1450915))

(assert (=> b!1578909 m!1450917))

(assert (=> start!136846 d!166157))

(declare-fun d!166165 () Bool)

(assert (=> d!166165 (= (inv!58921 lm!251) (isStrictlySorted!1026 (toList!11381 lm!251)))))

(declare-fun bs!45720 () Bool)

(assert (= bs!45720 d!166165))

(assert (=> bs!45720 m!1450893))

(assert (=> start!136846 d!166165))

(declare-fun d!166167 () Bool)

(declare-fun res!1078835 () Bool)

(declare-fun e!880750 () Bool)

(assert (=> d!166167 (=> res!1078835 e!880750)))

(get-info :version)

(assert (=> d!166167 (= res!1078835 (and ((_ is Cons!36761) (toList!11381 lm!251)) (= (_1!12707 (h!38304 (toList!11381 lm!251))) a0!51)))))

(assert (=> d!166167 (= (containsKey!875 (toList!11381 lm!251) a0!51) e!880750)))

(declare-fun b!1578932 () Bool)

(declare-fun e!880751 () Bool)

(assert (=> b!1578932 (= e!880750 e!880751)))

(declare-fun res!1078836 () Bool)

(assert (=> b!1578932 (=> (not res!1078836) (not e!880751))))

(assert (=> b!1578932 (= res!1078836 (and (or (not ((_ is Cons!36761) (toList!11381 lm!251))) (bvsle (_1!12707 (h!38304 (toList!11381 lm!251))) a0!51)) ((_ is Cons!36761) (toList!11381 lm!251)) (bvslt (_1!12707 (h!38304 (toList!11381 lm!251))) a0!51)))))

(declare-fun b!1578933 () Bool)

(assert (=> b!1578933 (= e!880751 (containsKey!875 (t!51679 (toList!11381 lm!251)) a0!51))))

(assert (= (and d!166167 (not res!1078835)) b!1578932))

(assert (= (and b!1578932 res!1078836) b!1578933))

(declare-fun m!1450931 () Bool)

(assert (=> b!1578933 m!1450931))

(assert (=> b!1578872 d!166167))

(declare-fun d!166175 () Bool)

(declare-fun res!1078851 () Bool)

(declare-fun e!880769 () Bool)

(assert (=> d!166175 (=> res!1078851 e!880769)))

(assert (=> d!166175 (= res!1078851 (or ((_ is Nil!36762) (toList!11381 lm!251)) ((_ is Nil!36762) (t!51679 (toList!11381 lm!251)))))))

(assert (=> d!166175 (= (isStrictlySorted!1026 (toList!11381 lm!251)) e!880769)))

(declare-fun b!1578953 () Bool)

(declare-fun e!880770 () Bool)

(assert (=> b!1578953 (= e!880769 e!880770)))

(declare-fun res!1078852 () Bool)

(assert (=> b!1578953 (=> (not res!1078852) (not e!880770))))

(assert (=> b!1578953 (= res!1078852 (bvslt (_1!12707 (h!38304 (toList!11381 lm!251))) (_1!12707 (h!38304 (t!51679 (toList!11381 lm!251))))))))

(declare-fun b!1578954 () Bool)

(assert (=> b!1578954 (= e!880770 (isStrictlySorted!1026 (t!51679 (toList!11381 lm!251))))))

(assert (= (and d!166175 (not res!1078851)) b!1578953))

(assert (= (and b!1578953 res!1078852) b!1578954))

(declare-fun m!1450935 () Bool)

(assert (=> b!1578954 m!1450935))

(assert (=> b!1578869 d!166175))

(declare-fun b!1578965 () Bool)

(declare-fun e!880777 () Bool)

(declare-fun tp_is_empty!39111 () Bool)

(declare-fun tp!114275 () Bool)

(assert (=> b!1578965 (= e!880777 (and tp_is_empty!39111 tp!114275))))

(assert (=> b!1578870 (= tp!114264 e!880777)))

(assert (= (and b!1578870 ((_ is Cons!36761) (toList!11381 lm!251))) b!1578965))

(check-sat tp_is_empty!39111 (not d!166157) (not d!166165) (not b!1578907) (not b!1578954) (not b!1578965) (not b!1578909) (not b!1578933))
(check-sat)
