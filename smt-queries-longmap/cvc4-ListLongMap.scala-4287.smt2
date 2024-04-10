; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59736 () Bool)

(assert start!59736)

(declare-fun b!659965 () Bool)

(declare-fun e!379211 () Bool)

(declare-datatypes ((List!12634 0))(
  ( (Nil!12631) (Cons!12630 (h!13675 (_ BitVec 64)) (t!18862 List!12634)) )
))
(declare-fun acc!681 () List!12634)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3211 (List!12634 (_ BitVec 64)) Bool)

(assert (=> b!659965 (= e!379211 (contains!3211 acc!681 k!2843))))

(declare-fun b!659966 () Bool)

(declare-fun res!428033 () Bool)

(declare-fun e!379215 () Bool)

(assert (=> b!659966 (=> (not res!428033) (not e!379215))))

(declare-datatypes ((array!38798 0))(
  ( (array!38799 (arr!18593 (Array (_ BitVec 32) (_ BitVec 64))) (size!18957 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38798)

(assert (=> b!659966 (= res!428033 (bvsle #b00000000000000000000000000000000 (size!18957 a!3626)))))

(declare-fun b!659967 () Bool)

(declare-fun e!379214 () Bool)

(assert (=> b!659967 (= e!379214 (contains!3211 Nil!12631 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!428038 () Bool)

(assert (=> start!59736 (=> (not res!428038) (not e!379215))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59736 (= res!428038 (and (bvslt (size!18957 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18957 a!3626))))))

(assert (=> start!59736 e!379215))

(assert (=> start!59736 true))

(declare-fun array_inv!14389 (array!38798) Bool)

(assert (=> start!59736 (array_inv!14389 a!3626)))

(declare-fun b!659968 () Bool)

(declare-fun res!428036 () Bool)

(assert (=> b!659968 (=> (not res!428036) (not e!379215))))

(declare-fun noDuplicate!458 (List!12634) Bool)

(assert (=> b!659968 (= res!428036 (noDuplicate!458 Nil!12631))))

(declare-fun b!659969 () Bool)

(assert (=> b!659969 (= e!379215 e!379214)))

(declare-fun res!428031 () Bool)

(assert (=> b!659969 (=> res!428031 e!379214)))

(assert (=> b!659969 (= res!428031 (contains!3211 Nil!12631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659970 () Bool)

(declare-fun e!379212 () Bool)

(assert (=> b!659970 (= e!379212 (not (contains!3211 acc!681 k!2843)))))

(declare-fun b!659971 () Bool)

(declare-fun res!428035 () Bool)

(assert (=> b!659971 (=> (not res!428035) (not e!379215))))

(assert (=> b!659971 (= res!428035 (noDuplicate!458 acc!681))))

(declare-fun b!659972 () Bool)

(declare-fun res!428032 () Bool)

(assert (=> b!659972 (=> (not res!428032) (not e!379215))))

(declare-fun e!379213 () Bool)

(assert (=> b!659972 (= res!428032 e!379213)))

(declare-fun res!428039 () Bool)

(assert (=> b!659972 (=> res!428039 e!379213)))

(assert (=> b!659972 (= res!428039 e!379211)))

(declare-fun res!428030 () Bool)

(assert (=> b!659972 (=> (not res!428030) (not e!379211))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659972 (= res!428030 (bvsgt from!3004 i!1382))))

(declare-fun b!659973 () Bool)

(assert (=> b!659973 (= e!379213 e!379212)))

(declare-fun res!428034 () Bool)

(assert (=> b!659973 (=> (not res!428034) (not e!379212))))

(assert (=> b!659973 (= res!428034 (bvsle from!3004 i!1382))))

(declare-fun b!659974 () Bool)

(declare-fun res!428037 () Bool)

(assert (=> b!659974 (=> (not res!428037) (not e!379215))))

(assert (=> b!659974 (= res!428037 (not (contains!3211 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659975 () Bool)

(declare-fun res!428029 () Bool)

(assert (=> b!659975 (=> (not res!428029) (not e!379215))))

(assert (=> b!659975 (= res!428029 (not (contains!3211 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59736 res!428038) b!659971))

(assert (= (and b!659971 res!428035) b!659975))

(assert (= (and b!659975 res!428029) b!659974))

(assert (= (and b!659974 res!428037) b!659972))

(assert (= (and b!659972 res!428030) b!659965))

(assert (= (and b!659972 (not res!428039)) b!659973))

(assert (= (and b!659973 res!428034) b!659970))

(assert (= (and b!659972 res!428032) b!659966))

(assert (= (and b!659966 res!428033) b!659968))

(assert (= (and b!659968 res!428036) b!659969))

(assert (= (and b!659969 (not res!428031)) b!659967))

(declare-fun m!632821 () Bool)

(assert (=> b!659969 m!632821))

(declare-fun m!632823 () Bool)

(assert (=> b!659970 m!632823))

(assert (=> b!659965 m!632823))

(declare-fun m!632825 () Bool)

(assert (=> b!659975 m!632825))

(declare-fun m!632827 () Bool)

(assert (=> b!659968 m!632827))

(declare-fun m!632829 () Bool)

(assert (=> b!659974 m!632829))

(declare-fun m!632831 () Bool)

(assert (=> start!59736 m!632831))

(declare-fun m!632833 () Bool)

(assert (=> b!659971 m!632833))

(declare-fun m!632835 () Bool)

(assert (=> b!659967 m!632835))

(push 1)

(assert (not b!659970))

(assert (not b!659974))

(assert (not b!659965))

(assert (not start!59736))

(assert (not b!659968))

(assert (not b!659975))

(assert (not b!659969))

(assert (not b!659967))

(assert (not b!659971))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93181 () Bool)

(declare-fun res!428076 () Bool)

(declare-fun e!379252 () Bool)

(assert (=> d!93181 (=> res!428076 e!379252)))

(assert (=> d!93181 (= res!428076 (is-Nil!12631 Nil!12631))))

(assert (=> d!93181 (= (noDuplicate!458 Nil!12631) e!379252)))

(declare-fun b!660012 () Bool)

(declare-fun e!379253 () Bool)

(assert (=> b!660012 (= e!379252 e!379253)))

(declare-fun res!428077 () Bool)

(assert (=> b!660012 (=> (not res!428077) (not e!379253))))

(assert (=> b!660012 (= res!428077 (not (contains!3211 (t!18862 Nil!12631) (h!13675 Nil!12631))))))

(declare-fun b!660013 () Bool)

(assert (=> b!660013 (= e!379253 (noDuplicate!458 (t!18862 Nil!12631)))))

(assert (= (and d!93181 (not res!428076)) b!660012))

(assert (= (and b!660012 res!428077) b!660013))

(declare-fun m!632875 () Bool)

(assert (=> b!660012 m!632875))

(declare-fun m!632877 () Bool)

(assert (=> b!660013 m!632877))

(assert (=> b!659968 d!93181))

(declare-fun d!93185 () Bool)

(declare-fun lt!308742 () Bool)

(declare-fun content!260 (List!12634) (Set (_ BitVec 64)))

(assert (=> d!93185 (= lt!308742 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!260 acc!681)))))

(declare-fun e!379271 () Bool)

(assert (=> d!93185 (= lt!308742 e!379271)))

(declare-fun res!428095 () Bool)

(assert (=> d!93185 (=> (not res!428095) (not e!379271))))

(assert (=> d!93185 (= res!428095 (is-Cons!12630 acc!681))))

(assert (=> d!93185 (= (contains!3211 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308742)))

