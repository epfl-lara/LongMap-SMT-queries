; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59794 () Bool)

(assert start!59794)

(declare-fun b!660573 () Bool)

(declare-fun e!379578 () Bool)

(declare-fun e!379579 () Bool)

(assert (=> b!660573 (= e!379578 e!379579)))

(declare-fun res!428645 () Bool)

(assert (=> b!660573 (=> (not res!428645) (not e!379579))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660573 (= res!428645 (bvsle from!3004 i!1382))))

(declare-fun res!428641 () Bool)

(declare-fun e!379581 () Bool)

(assert (=> start!59794 (=> (not res!428641) (not e!379581))))

(declare-datatypes ((array!38841 0))(
  ( (array!38842 (arr!18613 (Array (_ BitVec 32) (_ BitVec 64))) (size!18977 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38841)

(assert (=> start!59794 (= res!428641 (and (bvslt (size!18977 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18977 a!3626))))))

(assert (=> start!59794 e!379581))

(assert (=> start!59794 true))

(declare-fun array_inv!14409 (array!38841) Bool)

(assert (=> start!59794 (array_inv!14409 a!3626)))

(declare-fun b!660574 () Bool)

(declare-fun e!379580 () Bool)

(declare-datatypes ((List!12654 0))(
  ( (Nil!12651) (Cons!12650 (h!13695 (_ BitVec 64)) (t!18882 List!12654)) )
))
(declare-fun acc!681 () List!12654)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3231 (List!12654 (_ BitVec 64)) Bool)

(assert (=> b!660574 (= e!379580 (contains!3231 acc!681 k0!2843))))

(declare-fun b!660575 () Bool)

(assert (=> b!660575 (= e!379581 false)))

(declare-fun lt!308788 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38841 (_ BitVec 32) List!12654) Bool)

(assert (=> b!660575 (= lt!308788 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660576 () Bool)

(assert (=> b!660576 (= e!379579 (not (contains!3231 acc!681 k0!2843)))))

(declare-fun b!660577 () Bool)

(declare-fun res!428639 () Bool)

(assert (=> b!660577 (=> (not res!428639) (not e!379581))))

(assert (=> b!660577 (= res!428639 e!379578)))

(declare-fun res!428643 () Bool)

(assert (=> b!660577 (=> res!428643 e!379578)))

(assert (=> b!660577 (= res!428643 e!379580)))

(declare-fun res!428637 () Bool)

(assert (=> b!660577 (=> (not res!428637) (not e!379580))))

(assert (=> b!660577 (= res!428637 (bvsgt from!3004 i!1382))))

(declare-fun b!660578 () Bool)

(declare-fun res!428644 () Bool)

(assert (=> b!660578 (=> (not res!428644) (not e!379581))))

(assert (=> b!660578 (= res!428644 (not (contains!3231 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660579 () Bool)

(declare-fun res!428640 () Bool)

(assert (=> b!660579 (=> (not res!428640) (not e!379581))))

(declare-fun noDuplicate!478 (List!12654) Bool)

(assert (=> b!660579 (= res!428640 (noDuplicate!478 acc!681))))

(declare-fun b!660580 () Bool)

(declare-fun res!428638 () Bool)

(assert (=> b!660580 (=> (not res!428638) (not e!379581))))

(assert (=> b!660580 (= res!428638 (not (contains!3231 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660581 () Bool)

(declare-fun res!428642 () Bool)

(assert (=> b!660581 (=> (not res!428642) (not e!379581))))

(assert (=> b!660581 (= res!428642 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12651))))

(assert (= (and start!59794 res!428641) b!660579))

(assert (= (and b!660579 res!428640) b!660578))

(assert (= (and b!660578 res!428644) b!660580))

(assert (= (and b!660580 res!428638) b!660577))

(assert (= (and b!660577 res!428637) b!660574))

(assert (= (and b!660577 (not res!428643)) b!660573))

(assert (= (and b!660573 res!428645) b!660576))

(assert (= (and b!660577 res!428639) b!660581))

(assert (= (and b!660581 res!428642) b!660575))

(declare-fun m!633181 () Bool)

(assert (=> b!660581 m!633181))

(declare-fun m!633183 () Bool)

(assert (=> b!660580 m!633183))

(declare-fun m!633185 () Bool)

(assert (=> b!660578 m!633185))

(declare-fun m!633187 () Bool)

(assert (=> b!660574 m!633187))

(declare-fun m!633189 () Bool)

(assert (=> b!660579 m!633189))

(declare-fun m!633191 () Bool)

(assert (=> b!660575 m!633191))

(assert (=> b!660576 m!633187))

(declare-fun m!633193 () Bool)

(assert (=> start!59794 m!633193))

(check-sat (not b!660579) (not start!59794) (not b!660578) (not b!660580) (not b!660574) (not b!660581) (not b!660576) (not b!660575))
(check-sat)
