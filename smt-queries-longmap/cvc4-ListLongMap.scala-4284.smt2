; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59700 () Bool)

(assert start!59700)

(declare-fun b!659671 () Bool)

(declare-fun e!379013 () Bool)

(declare-fun e!379014 () Bool)

(assert (=> b!659671 (= e!379013 e!379014)))

(declare-fun res!427741 () Bool)

(assert (=> b!659671 (=> (not res!427741) (not e!379014))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659671 (= res!427741 (bvsle from!3004 i!1382))))

(declare-fun b!659673 () Bool)

(declare-fun res!427738 () Bool)

(declare-fun e!379017 () Bool)

(assert (=> b!659673 (=> (not res!427738) (not e!379017))))

(declare-datatypes ((List!12625 0))(
  ( (Nil!12622) (Cons!12621 (h!13666 (_ BitVec 64)) (t!18853 List!12625)) )
))
(declare-fun acc!681 () List!12625)

(declare-fun contains!3202 (List!12625 (_ BitVec 64)) Bool)

(assert (=> b!659673 (= res!427738 (not (contains!3202 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659674 () Bool)

(declare-fun e!379015 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!659674 (= e!379015 (contains!3202 acc!681 k!2843))))

(declare-fun b!659675 () Bool)

(declare-datatypes ((array!38777 0))(
  ( (array!38778 (arr!18584 (Array (_ BitVec 32) (_ BitVec 64))) (size!18948 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38777)

(assert (=> b!659675 (= e!379017 (bvsgt #b00000000000000000000000000000000 (size!18948 a!3626)))))

(declare-fun b!659676 () Bool)

(declare-fun res!427740 () Bool)

(assert (=> b!659676 (=> (not res!427740) (not e!379017))))

(declare-fun noDuplicate!449 (List!12625) Bool)

(assert (=> b!659676 (= res!427740 (noDuplicate!449 acc!681))))

(declare-fun b!659672 () Bool)

(assert (=> b!659672 (= e!379014 (not (contains!3202 acc!681 k!2843)))))

(declare-fun res!427742 () Bool)

(assert (=> start!59700 (=> (not res!427742) (not e!379017))))

(assert (=> start!59700 (= res!427742 (and (bvslt (size!18948 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18948 a!3626))))))

(assert (=> start!59700 e!379017))

(assert (=> start!59700 true))

(declare-fun array_inv!14380 (array!38777) Bool)

(assert (=> start!59700 (array_inv!14380 a!3626)))

(declare-fun b!659677 () Bool)

(declare-fun res!427736 () Bool)

(assert (=> b!659677 (=> (not res!427736) (not e!379017))))

(assert (=> b!659677 (= res!427736 (not (contains!3202 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659678 () Bool)

(declare-fun res!427739 () Bool)

(assert (=> b!659678 (=> (not res!427739) (not e!379017))))

(assert (=> b!659678 (= res!427739 e!379013)))

(declare-fun res!427735 () Bool)

(assert (=> b!659678 (=> res!427735 e!379013)))

(assert (=> b!659678 (= res!427735 e!379015)))

(declare-fun res!427737 () Bool)

(assert (=> b!659678 (=> (not res!427737) (not e!379015))))

(assert (=> b!659678 (= res!427737 (bvsgt from!3004 i!1382))))

(assert (= (and start!59700 res!427742) b!659676))

(assert (= (and b!659676 res!427740) b!659673))

(assert (= (and b!659673 res!427738) b!659677))

(assert (= (and b!659677 res!427736) b!659678))

(assert (= (and b!659678 res!427737) b!659674))

(assert (= (and b!659678 (not res!427735)) b!659671))

(assert (= (and b!659671 res!427741) b!659672))

(assert (= (and b!659678 res!427739) b!659675))

(declare-fun m!632647 () Bool)

(assert (=> b!659673 m!632647))

(declare-fun m!632649 () Bool)

(assert (=> b!659677 m!632649))

(declare-fun m!632651 () Bool)

(assert (=> start!59700 m!632651))

(declare-fun m!632653 () Bool)

(assert (=> b!659676 m!632653))

(declare-fun m!632655 () Bool)

(assert (=> b!659672 m!632655))

(assert (=> b!659674 m!632655))

(push 1)

(assert (not b!659677))

