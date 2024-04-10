; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63364 () Bool)

(assert start!63364)

(declare-fun b!713776 () Bool)

(declare-fun res!476872 () Bool)

(declare-fun e!401302 () Bool)

(assert (=> b!713776 (=> (not res!476872) (not e!401302))))

(declare-datatypes ((List!13415 0))(
  ( (Nil!13412) (Cons!13411 (h!14456 (_ BitVec 64)) (t!19730 List!13415)) )
))
(declare-fun acc!652 () List!13415)

(declare-fun contains!3992 (List!13415 (_ BitVec 64)) Bool)

(assert (=> b!713776 (= res!476872 (not (contains!3992 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!476861 () Bool)

(assert (=> start!63364 (=> (not res!476861) (not e!401302))))

(declare-datatypes ((array!40468 0))(
  ( (array!40469 (arr!19374 (Array (_ BitVec 32) (_ BitVec 64))) (size!19785 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40468)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63364 (= res!476861 (and (bvslt (size!19785 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19785 a!3591))))))

(assert (=> start!63364 e!401302))

(assert (=> start!63364 true))

(declare-fun array_inv!15170 (array!40468) Bool)

(assert (=> start!63364 (array_inv!15170 a!3591)))

(declare-fun b!713777 () Bool)

(declare-fun res!476866 () Bool)

(assert (=> b!713777 (=> (not res!476866) (not e!401302))))

(assert (=> b!713777 (= res!476866 (not (contains!3992 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713778 () Bool)

(declare-fun res!476869 () Bool)

(assert (=> b!713778 (=> (not res!476869) (not e!401302))))

(declare-fun newAcc!49 () List!13415)

(declare-fun subseq!437 (List!13415 List!13415) Bool)

(assert (=> b!713778 (= res!476869 (subseq!437 acc!652 newAcc!49))))

(declare-fun b!713779 () Bool)

(declare-fun res!476868 () Bool)

(assert (=> b!713779 (=> (not res!476868) (not e!401302))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!713779 (= res!476868 (not (contains!3992 acc!652 k!2824)))))

(declare-fun b!713780 () Bool)

(declare-fun res!476867 () Bool)

(assert (=> b!713780 (=> (not res!476867) (not e!401302))))

(assert (=> b!713780 (= res!476867 (contains!3992 newAcc!49 k!2824))))

(declare-fun b!713781 () Bool)

(declare-fun res!476862 () Bool)

(assert (=> b!713781 (=> (not res!476862) (not e!401302))))

(declare-fun arrayNoDuplicates!0 (array!40468 (_ BitVec 32) List!13415) Bool)

(assert (=> b!713781 (= res!476862 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713782 () Bool)

(declare-fun res!476865 () Bool)

(assert (=> b!713782 (=> (not res!476865) (not e!401302))))

(declare-fun arrayContainsKey!0 (array!40468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713782 (= res!476865 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713783 () Bool)

(declare-fun res!476863 () Bool)

(assert (=> b!713783 (=> (not res!476863) (not e!401302))))

(declare-fun noDuplicate!1239 (List!13415) Bool)

(assert (=> b!713783 (= res!476863 (noDuplicate!1239 newAcc!49))))

(declare-fun b!713784 () Bool)

(declare-fun res!476870 () Bool)

(assert (=> b!713784 (=> (not res!476870) (not e!401302))))

(declare-fun -!402 (List!13415 (_ BitVec 64)) List!13415)

(assert (=> b!713784 (= res!476870 (= (-!402 newAcc!49 k!2824) acc!652))))

(declare-fun b!713785 () Bool)

(assert (=> b!713785 (= e!401302 false)))

(declare-fun lt!318716 () Bool)

(assert (=> b!713785 (= lt!318716 (contains!3992 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713786 () Bool)

(declare-fun res!476860 () Bool)

(assert (=> b!713786 (=> (not res!476860) (not e!401302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713786 (= res!476860 (validKeyInArray!0 k!2824))))

(declare-fun b!713787 () Bool)

(declare-fun res!476864 () Bool)

(assert (=> b!713787 (=> (not res!476864) (not e!401302))))

(assert (=> b!713787 (= res!476864 (not (contains!3992 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713788 () Bool)

(declare-fun res!476871 () Bool)

(assert (=> b!713788 (=> (not res!476871) (not e!401302))))

(assert (=> b!713788 (= res!476871 (noDuplicate!1239 acc!652))))

(assert (= (and start!63364 res!476861) b!713788))

(assert (= (and b!713788 res!476871) b!713783))

(assert (= (and b!713783 res!476863) b!713777))

(assert (= (and b!713777 res!476866) b!713776))

(assert (= (and b!713776 res!476872) b!713782))

(assert (= (and b!713782 res!476865) b!713779))

(assert (= (and b!713779 res!476868) b!713786))

(assert (= (and b!713786 res!476860) b!713781))

(assert (= (and b!713781 res!476862) b!713778))

(assert (= (and b!713778 res!476869) b!713780))

(assert (= (and b!713780 res!476867) b!713784))

(assert (= (and b!713784 res!476870) b!713787))

(assert (= (and b!713787 res!476864) b!713785))

(declare-fun m!670483 () Bool)

(assert (=> b!713787 m!670483))

(declare-fun m!670485 () Bool)

(assert (=> start!63364 m!670485))

(declare-fun m!670487 () Bool)

(assert (=> b!713777 m!670487))

(declare-fun m!670489 () Bool)

(assert (=> b!713786 m!670489))

(declare-fun m!670491 () Bool)

(assert (=> b!713784 m!670491))

(declare-fun m!670493 () Bool)

(assert (=> b!713776 m!670493))

(declare-fun m!670495 () Bool)

(assert (=> b!713783 m!670495))

(declare-fun m!670497 () Bool)

(assert (=> b!713788 m!670497))

(declare-fun m!670499 () Bool)

(assert (=> b!713779 m!670499))

(declare-fun m!670501 () Bool)

(assert (=> b!713778 m!670501))

(declare-fun m!670503 () Bool)

(assert (=> b!713781 m!670503))

(declare-fun m!670505 () Bool)

(assert (=> b!713785 m!670505))

(declare-fun m!670507 () Bool)

(assert (=> b!713782 m!670507))

(declare-fun m!670509 () Bool)

(assert (=> b!713780 m!670509))

(push 1)

(assert (not b!713788))

(assert (not b!713781))

(assert (not b!713786))

(assert (not b!713777))

(assert (not b!713785))

(assert (not b!713787))

(assert (not b!713783))

(assert (not b!713784))

(assert (not start!63364))

(assert (not b!713779))

(assert (not b!713782))

(assert (not b!713780))

(assert (not b!713776))

(assert (not b!713778))

(check-sat)

