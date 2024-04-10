; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59708 () Bool)

(assert start!59708)

(declare-fun b!659760 () Bool)

(declare-fun res!427832 () Bool)

(declare-fun e!379075 () Bool)

(assert (=> b!659760 (=> (not res!427832) (not e!379075))))

(declare-datatypes ((List!12629 0))(
  ( (Nil!12626) (Cons!12625 (h!13670 (_ BitVec 64)) (t!18857 List!12629)) )
))
(declare-fun acc!681 () List!12629)

(declare-fun contains!3206 (List!12629 (_ BitVec 64)) Bool)

(assert (=> b!659760 (= res!427832 (not (contains!3206 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659761 () Bool)

(declare-fun res!427826 () Bool)

(assert (=> b!659761 (=> (not res!427826) (not e!379075))))

(assert (=> b!659761 (= res!427826 (not (contains!3206 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659762 () Bool)

(declare-fun e!379076 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!659762 (= e!379076 (not (contains!3206 acc!681 k!2843)))))

(declare-fun b!659764 () Bool)

(declare-fun e!379073 () Bool)

(assert (=> b!659764 (= e!379073 e!379076)))

(declare-fun res!427831 () Bool)

(assert (=> b!659764 (=> (not res!427831) (not e!379076))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659764 (= res!427831 (bvsle from!3004 i!1382))))

(declare-fun b!659765 () Bool)

(declare-fun res!427830 () Bool)

(assert (=> b!659765 (=> (not res!427830) (not e!379075))))

(declare-datatypes ((array!38785 0))(
  ( (array!38786 (arr!18588 (Array (_ BitVec 32) (_ BitVec 64))) (size!18952 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38785)

(assert (=> b!659765 (= res!427830 (bvsle #b00000000000000000000000000000000 (size!18952 a!3626)))))

(declare-fun b!659766 () Bool)

(declare-fun res!427828 () Bool)

(assert (=> b!659766 (=> (not res!427828) (not e!379075))))

(assert (=> b!659766 (= res!427828 e!379073)))

(declare-fun res!427827 () Bool)

(assert (=> b!659766 (=> res!427827 e!379073)))

(declare-fun e!379077 () Bool)

(assert (=> b!659766 (= res!427827 e!379077)))

(declare-fun res!427829 () Bool)

(assert (=> b!659766 (=> (not res!427829) (not e!379077))))

(assert (=> b!659766 (= res!427829 (bvsgt from!3004 i!1382))))

(declare-fun res!427825 () Bool)

(assert (=> start!59708 (=> (not res!427825) (not e!379075))))

(assert (=> start!59708 (= res!427825 (and (bvslt (size!18952 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18952 a!3626))))))

(assert (=> start!59708 e!379075))

(assert (=> start!59708 true))

(declare-fun array_inv!14384 (array!38785) Bool)

(assert (=> start!59708 (array_inv!14384 a!3626)))

(declare-fun b!659763 () Bool)

(declare-fun noDuplicate!453 (List!12629) Bool)

(assert (=> b!659763 (= e!379075 (not (noDuplicate!453 Nil!12626)))))

(declare-fun b!659767 () Bool)

(declare-fun res!427824 () Bool)

(assert (=> b!659767 (=> (not res!427824) (not e!379075))))

(assert (=> b!659767 (= res!427824 (noDuplicate!453 acc!681))))

(declare-fun b!659768 () Bool)

(assert (=> b!659768 (= e!379077 (contains!3206 acc!681 k!2843))))

(assert (= (and start!59708 res!427825) b!659767))

(assert (= (and b!659767 res!427824) b!659760))

(assert (= (and b!659760 res!427832) b!659761))

(assert (= (and b!659761 res!427826) b!659766))

(assert (= (and b!659766 res!427829) b!659768))

(assert (= (and b!659766 (not res!427827)) b!659764))

(assert (= (and b!659764 res!427831) b!659762))

(assert (= (and b!659766 res!427828) b!659765))

(assert (= (and b!659765 res!427830) b!659763))

(declare-fun m!632687 () Bool)

(assert (=> b!659761 m!632687))

(declare-fun m!632689 () Bool)

(assert (=> b!659768 m!632689))

(declare-fun m!632691 () Bool)

(assert (=> b!659763 m!632691))

(declare-fun m!632693 () Bool)

(assert (=> b!659760 m!632693))

(declare-fun m!632695 () Bool)

(assert (=> start!59708 m!632695))

(assert (=> b!659762 m!632689))

(declare-fun m!632697 () Bool)

(assert (=> b!659767 m!632697))

(push 1)

(assert (not start!59708))

(assert (not b!659760))

(assert (not b!659768))

(assert (not b!659763))

(assert (not b!659761))

(assert (not b!659767))

(assert (not b!659762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93137 () Bool)

(declare-fun lt!308718 () Bool)

(declare-fun content!256 (List!12629) (Set (_ BitVec 64)))

(assert (=> d!93137 (= lt!308718 (set.member k!2843 (content!256 acc!681)))))

(declare-fun e!379130 () Bool)

(assert (=> d!93137 (= lt!308718 e!379130)))

(declare-fun res!427909 () Bool)

(assert (=> d!93137 (=> (not res!427909) (not e!379130))))

(assert (=> d!93137 (= res!427909 (is-Cons!12625 acc!681))))

(assert (=> d!93137 (= (contains!3206 acc!681 k!2843) lt!308718)))

(declare-fun b!659845 () Bool)

(declare-fun e!379131 () Bool)

(assert (=> b!659845 (= e!379130 e!379131)))

(declare-fun res!427910 () Bool)

(assert (=> b!659845 (=> res!427910 e!379131)))

(assert (=> b!659845 (= res!427910 (= (h!13670 acc!681) k!2843))))

(declare-fun b!659846 () Bool)

(assert (=> b!659846 (= e!379131 (contains!3206 (t!18857 acc!681) k!2843))))

(assert (= (and d!93137 res!427909) b!659845))

(assert (= (and b!659845 (not res!427910)) b!659846))

(declare-fun m!632745 () Bool)

(assert (=> d!93137 m!632745))

(declare-fun m!632747 () Bool)

(assert (=> d!93137 m!632747))

(declare-fun m!632749 () Bool)

(assert (=> b!659846 m!632749))

(assert (=> b!659768 d!93137))

(declare-fun d!93141 () Bool)

(declare-fun res!427921 () Bool)

(declare-fun e!379142 () Bool)

(assert (=> d!93141 (=> res!427921 e!379142)))

(assert (=> d!93141 (= res!427921 (is-Nil!12626 Nil!12626))))

(assert (=> d!93141 (= (noDuplicate!453 Nil!12626) e!379142)))

(declare-fun b!659857 () Bool)

(declare-fun e!379143 () Bool)

(assert (=> b!659857 (= e!379142 e!379143)))

(declare-fun res!427922 () Bool)

(assert (=> b!659857 (=> (not res!427922) (not e!379143))))

(assert (=> b!659857 (= res!427922 (not (contains!3206 (t!18857 Nil!12626) (h!13670 Nil!12626))))))

(declare-fun b!659858 () Bool)

(assert (=> b!659858 (= e!379143 (noDuplicate!453 (t!18857 Nil!12626)))))

(assert (= (and d!93141 (not res!427921)) b!659857))

(assert (= (and b!659857 res!427922) b!659858))

(declare-fun m!632755 () Bool)

(assert (=> b!659857 m!632755))

(declare-fun m!632757 () Bool)

(assert (=> b!659858 m!632757))

(assert (=> b!659763 d!93141))

(declare-fun d!93145 () Bool)

(assert (=> d!93145 (= (array_inv!14384 a!3626) (bvsge (size!18952 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!59708 d!93145))

(declare-fun d!93147 () Bool)

(declare-fun lt!308719 () Bool)

(assert (=> d!93147 (= lt!308719 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!256 acc!681)))))

(declare-fun e!379144 () Bool)

(assert (=> d!93147 (= lt!308719 e!379144)))

(declare-fun res!427923 () Bool)

(assert (=> d!93147 (=> (not res!427923) (not e!379144))))

(assert (=> d!93147 (= res!427923 (is-Cons!12625 acc!681))))

(assert (=> d!93147 (= (contains!3206 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308719)))

(declare-fun b!659859 () Bool)

(declare-fun e!379145 () Bool)

(assert (=> b!659859 (= e!379144 e!379145)))

(declare-fun res!427924 () Bool)

