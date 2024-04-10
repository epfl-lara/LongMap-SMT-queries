; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59792 () Bool)

(assert start!59792)

(declare-fun b!660546 () Bool)

(declare-fun e!379566 () Bool)

(declare-datatypes ((List!12653 0))(
  ( (Nil!12650) (Cons!12649 (h!13694 (_ BitVec 64)) (t!18881 List!12653)) )
))
(declare-fun acc!681 () List!12653)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3230 (List!12653 (_ BitVec 64)) Bool)

(assert (=> b!660546 (= e!379566 (contains!3230 acc!681 k!2843))))

(declare-fun b!660547 () Bool)

(declare-fun e!379564 () Bool)

(declare-fun e!379562 () Bool)

(assert (=> b!660547 (= e!379564 e!379562)))

(declare-fun res!428616 () Bool)

(assert (=> b!660547 (=> (not res!428616) (not e!379562))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660547 (= res!428616 (bvsle from!3004 i!1382))))

(declare-fun b!660548 () Bool)

(declare-fun res!428615 () Bool)

(declare-fun e!379563 () Bool)

(assert (=> b!660548 (=> (not res!428615) (not e!379563))))

(assert (=> b!660548 (= res!428615 e!379564)))

(declare-fun res!428610 () Bool)

(assert (=> b!660548 (=> res!428610 e!379564)))

(assert (=> b!660548 (= res!428610 e!379566)))

(declare-fun res!428613 () Bool)

(assert (=> b!660548 (=> (not res!428613) (not e!379566))))

(assert (=> b!660548 (= res!428613 (bvsgt from!3004 i!1382))))

(declare-fun b!660549 () Bool)

(assert (=> b!660549 (= e!379562 (not (contains!3230 acc!681 k!2843)))))

(declare-fun b!660550 () Bool)

(assert (=> b!660550 (= e!379563 false)))

(declare-datatypes ((array!38839 0))(
  ( (array!38840 (arr!18612 (Array (_ BitVec 32) (_ BitVec 64))) (size!18976 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38839)

(declare-fun lt!308785 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38839 (_ BitVec 32) List!12653) Bool)

(assert (=> b!660550 (= lt!308785 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660551 () Bool)

(declare-fun res!428614 () Bool)

(assert (=> b!660551 (=> (not res!428614) (not e!379563))))

(assert (=> b!660551 (= res!428614 (not (contains!3230 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660552 () Bool)

(declare-fun res!428611 () Bool)

(assert (=> b!660552 (=> (not res!428611) (not e!379563))))

(assert (=> b!660552 (= res!428611 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12650))))

(declare-fun res!428617 () Bool)

(assert (=> start!59792 (=> (not res!428617) (not e!379563))))

(assert (=> start!59792 (= res!428617 (and (bvslt (size!18976 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18976 a!3626))))))

(assert (=> start!59792 e!379563))

(assert (=> start!59792 true))

(declare-fun array_inv!14408 (array!38839) Bool)

(assert (=> start!59792 (array_inv!14408 a!3626)))

(declare-fun b!660553 () Bool)

(declare-fun res!428612 () Bool)

(assert (=> b!660553 (=> (not res!428612) (not e!379563))))

(assert (=> b!660553 (= res!428612 (not (contains!3230 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660554 () Bool)

(declare-fun res!428618 () Bool)

(assert (=> b!660554 (=> (not res!428618) (not e!379563))))

(declare-fun noDuplicate!477 (List!12653) Bool)

(assert (=> b!660554 (= res!428618 (noDuplicate!477 acc!681))))

(assert (= (and start!59792 res!428617) b!660554))

(assert (= (and b!660554 res!428618) b!660553))

(assert (= (and b!660553 res!428612) b!660551))

(assert (= (and b!660551 res!428614) b!660548))

(assert (= (and b!660548 res!428613) b!660546))

(assert (= (and b!660548 (not res!428610)) b!660547))

(assert (= (and b!660547 res!428616) b!660549))

(assert (= (and b!660548 res!428615) b!660552))

(assert (= (and b!660552 res!428611) b!660550))

(declare-fun m!633167 () Bool)

(assert (=> start!59792 m!633167))

(declare-fun m!633169 () Bool)

(assert (=> b!660552 m!633169))

(declare-fun m!633171 () Bool)

(assert (=> b!660549 m!633171))

(assert (=> b!660546 m!633171))

(declare-fun m!633173 () Bool)

(assert (=> b!660550 m!633173))

(declare-fun m!633175 () Bool)

(assert (=> b!660551 m!633175))

(declare-fun m!633177 () Bool)

(assert (=> b!660554 m!633177))

(declare-fun m!633179 () Bool)

(assert (=> b!660553 m!633179))

(push 1)

(assert (not start!59792))

(assert (not b!660553))

(assert (not b!660551))

(assert (not b!660552))

(assert (not b!660549))

(assert (not b!660550))

(assert (not b!660554))

(assert (not b!660546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

