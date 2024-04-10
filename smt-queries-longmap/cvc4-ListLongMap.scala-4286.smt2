; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59712 () Bool)

(assert start!59712)

(declare-fun b!659814 () Bool)

(declare-fun res!427886 () Bool)

(declare-fun e!379105 () Bool)

(assert (=> b!659814 (=> (not res!427886) (not e!379105))))

(declare-datatypes ((array!38789 0))(
  ( (array!38790 (arr!18590 (Array (_ BitVec 32) (_ BitVec 64))) (size!18954 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38789)

(assert (=> b!659814 (= res!427886 (bvsle #b00000000000000000000000000000000 (size!18954 a!3626)))))

(declare-fun b!659815 () Bool)

(declare-datatypes ((List!12631 0))(
  ( (Nil!12628) (Cons!12627 (h!13672 (_ BitVec 64)) (t!18859 List!12631)) )
))
(declare-fun noDuplicate!455 (List!12631) Bool)

(assert (=> b!659815 (= e!379105 (not (noDuplicate!455 Nil!12628)))))

(declare-fun b!659816 () Bool)

(declare-fun e!379106 () Bool)

(declare-fun acc!681 () List!12631)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3208 (List!12631 (_ BitVec 64)) Bool)

(assert (=> b!659816 (= e!379106 (contains!3208 acc!681 k!2843))))

(declare-fun b!659817 () Bool)

(declare-fun res!427884 () Bool)

(assert (=> b!659817 (=> (not res!427884) (not e!379105))))

(assert (=> b!659817 (= res!427884 (not (contains!3208 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659818 () Bool)

(declare-fun res!427885 () Bool)

(assert (=> b!659818 (=> (not res!427885) (not e!379105))))

(assert (=> b!659818 (= res!427885 (not (contains!3208 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659819 () Bool)

(declare-fun res!427881 () Bool)

(assert (=> b!659819 (=> (not res!427881) (not e!379105))))

(assert (=> b!659819 (= res!427881 (noDuplicate!455 acc!681))))

(declare-fun b!659821 () Bool)

(declare-fun e!379107 () Bool)

(declare-fun e!379104 () Bool)

(assert (=> b!659821 (= e!379107 e!379104)))

(declare-fun res!427878 () Bool)

(assert (=> b!659821 (=> (not res!427878) (not e!379104))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659821 (= res!427878 (bvsle from!3004 i!1382))))

(declare-fun b!659822 () Bool)

(declare-fun res!427883 () Bool)

(assert (=> b!659822 (=> (not res!427883) (not e!379105))))

(assert (=> b!659822 (= res!427883 e!379107)))

(declare-fun res!427879 () Bool)

(assert (=> b!659822 (=> res!427879 e!379107)))

(assert (=> b!659822 (= res!427879 e!379106)))

(declare-fun res!427882 () Bool)

(assert (=> b!659822 (=> (not res!427882) (not e!379106))))

(assert (=> b!659822 (= res!427882 (bvsgt from!3004 i!1382))))

(declare-fun res!427880 () Bool)

(assert (=> start!59712 (=> (not res!427880) (not e!379105))))

(assert (=> start!59712 (= res!427880 (and (bvslt (size!18954 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18954 a!3626))))))

(assert (=> start!59712 e!379105))

(assert (=> start!59712 true))

(declare-fun array_inv!14386 (array!38789) Bool)

(assert (=> start!59712 (array_inv!14386 a!3626)))

(declare-fun b!659820 () Bool)

(assert (=> b!659820 (= e!379104 (not (contains!3208 acc!681 k!2843)))))

(assert (= (and start!59712 res!427880) b!659819))

(assert (= (and b!659819 res!427881) b!659817))

(assert (= (and b!659817 res!427884) b!659818))

(assert (= (and b!659818 res!427885) b!659822))

(assert (= (and b!659822 res!427882) b!659816))

(assert (= (and b!659822 (not res!427879)) b!659821))

(assert (= (and b!659821 res!427878) b!659820))

(assert (= (and b!659822 res!427883) b!659814))

(assert (= (and b!659814 res!427886) b!659815))

(declare-fun m!632711 () Bool)

(assert (=> b!659819 m!632711))

(declare-fun m!632713 () Bool)

(assert (=> b!659820 m!632713))

(declare-fun m!632715 () Bool)

(assert (=> b!659817 m!632715))

(declare-fun m!632717 () Bool)

(assert (=> start!59712 m!632717))

(assert (=> b!659816 m!632713))

(declare-fun m!632719 () Bool)

(assert (=> b!659815 m!632719))

(declare-fun m!632721 () Bool)

(assert (=> b!659818 m!632721))

(push 1)

(assert (not b!659815))

(assert (not b!659818))

(assert (not start!59712))

(assert (not b!659816))

(assert (not b!659817))

(assert (not b!659820))

(assert (not b!659819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93139 () Bool)

(declare-fun res!427919 () Bool)

(declare-fun e!379140 () Bool)

(assert (=> d!93139 (=> res!427919 e!379140)))

(assert (=> d!93139 (= res!427919 (is-Nil!12628 acc!681))))

(assert (=> d!93139 (= (noDuplicate!455 acc!681) e!379140)))

(declare-fun b!659855 () Bool)

(declare-fun e!379141 () Bool)

(assert (=> b!659855 (= e!379140 e!379141)))

(declare-fun res!427920 () Bool)

(assert (=> b!659855 (=> (not res!427920) (not e!379141))))

(assert (=> b!659855 (= res!427920 (not (contains!3208 (t!18859 acc!681) (h!13672 acc!681))))))

(declare-fun b!659856 () Bool)

(assert (=> b!659856 (= e!379141 (noDuplicate!455 (t!18859 acc!681)))))

(assert (= (and d!93139 (not res!427919)) b!659855))

(assert (= (and b!659855 res!427920) b!659856))

(declare-fun m!632751 () Bool)

(assert (=> b!659855 m!632751))

(declare-fun m!632753 () Bool)

(assert (=> b!659856 m!632753))

(assert (=> b!659819 d!93139))

(declare-fun d!93143 () Bool)

(declare-fun lt!308723 () Bool)

(declare-fun content!257 (List!12631) (Set (_ BitVec 64)))

(assert (=> d!93143 (= lt!308723 (member k!2843 (content!257 acc!681)))))

(declare-fun e!379155 () Bool)

(assert (=> d!93143 (= lt!308723 e!379155)))

