; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59706 () Bool)

(assert start!59706)

(declare-fun b!659735 () Bool)

(declare-fun res!427799 () Bool)

(declare-fun e!379059 () Bool)

(assert (=> b!659735 (=> (not res!427799) (not e!379059))))

(declare-datatypes ((List!12628 0))(
  ( (Nil!12625) (Cons!12624 (h!13669 (_ BitVec 64)) (t!18856 List!12628)) )
))
(declare-fun acc!681 () List!12628)

(declare-fun noDuplicate!452 (List!12628) Bool)

(assert (=> b!659735 (= res!427799 (noDuplicate!452 acc!681))))

(declare-fun b!659736 () Bool)

(declare-fun res!427802 () Bool)

(assert (=> b!659736 (=> (not res!427802) (not e!379059))))

(declare-fun contains!3205 (List!12628 (_ BitVec 64)) Bool)

(assert (=> b!659736 (= res!427802 (not (contains!3205 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659737 () Bool)

(declare-fun e!379058 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!659737 (= e!379058 (not (contains!3205 acc!681 k!2843)))))

(declare-fun res!427804 () Bool)

(assert (=> start!59706 (=> (not res!427804) (not e!379059))))

(declare-datatypes ((array!38783 0))(
  ( (array!38784 (arr!18587 (Array (_ BitVec 32) (_ BitVec 64))) (size!18951 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38783)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59706 (= res!427804 (and (bvslt (size!18951 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18951 a!3626))))))

(assert (=> start!59706 e!379059))

(assert (=> start!59706 true))

(declare-fun array_inv!14383 (array!38783) Bool)

(assert (=> start!59706 (array_inv!14383 a!3626)))

(declare-fun b!659738 () Bool)

(declare-fun res!427800 () Bool)

(assert (=> b!659738 (=> (not res!427800) (not e!379059))))

(assert (=> b!659738 (= res!427800 (not (contains!3205 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659739 () Bool)

(declare-fun e!379062 () Bool)

(assert (=> b!659739 (= e!379062 e!379058)))

(declare-fun res!427801 () Bool)

(assert (=> b!659739 (=> (not res!427801) (not e!379058))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659739 (= res!427801 (bvsle from!3004 i!1382))))

(declare-fun b!659740 () Bool)

(assert (=> b!659740 (= e!379059 false)))

(declare-fun lt!308710 () Bool)

(assert (=> b!659740 (= lt!308710 e!379062)))

(declare-fun res!427805 () Bool)

(assert (=> b!659740 (=> res!427805 e!379062)))

(declare-fun e!379060 () Bool)

(assert (=> b!659740 (= res!427805 e!379060)))

(declare-fun res!427803 () Bool)

(assert (=> b!659740 (=> (not res!427803) (not e!379060))))

(assert (=> b!659740 (= res!427803 (bvsgt from!3004 i!1382))))

(declare-fun b!659741 () Bool)

(assert (=> b!659741 (= e!379060 (contains!3205 acc!681 k!2843))))

(assert (= (and start!59706 res!427804) b!659735))

(assert (= (and b!659735 res!427799) b!659738))

(assert (= (and b!659738 res!427800) b!659736))

(assert (= (and b!659736 res!427802) b!659740))

(assert (= (and b!659740 res!427803) b!659741))

(assert (= (and b!659740 (not res!427805)) b!659739))

(assert (= (and b!659739 res!427801) b!659737))

(declare-fun m!632677 () Bool)

(assert (=> b!659735 m!632677))

(declare-fun m!632679 () Bool)

(assert (=> b!659741 m!632679))

(declare-fun m!632681 () Bool)

(assert (=> b!659736 m!632681))

(declare-fun m!632683 () Bool)

(assert (=> start!59706 m!632683))

(declare-fun m!632685 () Bool)

(assert (=> b!659738 m!632685))

(assert (=> b!659737 m!632679))

(push 1)

(assert (not start!59706))

(assert (not b!659741))

(assert (not b!659735))

(assert (not b!659737))

(assert (not b!659736))

(assert (not b!659738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

