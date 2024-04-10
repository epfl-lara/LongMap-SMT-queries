; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60112 () Bool)

(assert start!60112)

(declare-fun b!670734 () Bool)

(declare-fun res!437435 () Bool)

(declare-fun e!383459 () Bool)

(assert (=> b!670734 (=> (not res!437435) (not e!383459))))

(declare-fun e!383456 () Bool)

(assert (=> b!670734 (= res!437435 e!383456)))

(declare-fun res!437434 () Bool)

(assert (=> b!670734 (=> res!437434 e!383456)))

(declare-fun e!383457 () Bool)

(assert (=> b!670734 (= res!437434 e!383457)))

(declare-fun res!437432 () Bool)

(assert (=> b!670734 (=> (not res!437432) (not e!383457))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670734 (= res!437432 (bvsgt from!3004 i!1382))))

(declare-fun res!437436 () Bool)

(assert (=> start!60112 (=> (not res!437436) (not e!383459))))

(declare-datatypes ((array!39159 0))(
  ( (array!39160 (arr!18772 (Array (_ BitVec 32) (_ BitVec 64))) (size!19136 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39159)

(assert (=> start!60112 (= res!437436 (and (bvslt (size!19136 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19136 a!3626))))))

(assert (=> start!60112 e!383459))

(assert (=> start!60112 true))

(declare-fun array_inv!14568 (array!39159) Bool)

(assert (=> start!60112 (array_inv!14568 a!3626)))

(declare-fun b!670735 () Bool)

(declare-datatypes ((List!12813 0))(
  ( (Nil!12810) (Cons!12809 (h!13854 (_ BitVec 64)) (t!19041 List!12813)) )
))
(declare-fun acc!681 () List!12813)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3390 (List!12813 (_ BitVec 64)) Bool)

(assert (=> b!670735 (= e!383457 (contains!3390 acc!681 k0!2843))))

(declare-fun b!670736 () Bool)

(declare-fun res!437433 () Bool)

(assert (=> b!670736 (=> (not res!437433) (not e!383459))))

(declare-fun noDuplicate!637 (List!12813) Bool)

(assert (=> b!670736 (= res!437433 (noDuplicate!637 acc!681))))

(declare-fun b!670737 () Bool)

(declare-fun res!437438 () Bool)

(assert (=> b!670737 (=> (not res!437438) (not e!383459))))

(assert (=> b!670737 (= res!437438 (not (contains!3390 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670738 () Bool)

(assert (=> b!670738 (= e!383459 false)))

(declare-fun lt!312145 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39159 (_ BitVec 32) List!12813) Bool)

(assert (=> b!670738 (= lt!312145 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670739 () Bool)

(declare-fun res!437430 () Bool)

(assert (=> b!670739 (=> (not res!437430) (not e!383459))))

(assert (=> b!670739 (= res!437430 (not (contains!3390 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670740 () Bool)

(declare-fun res!437437 () Bool)

(assert (=> b!670740 (=> (not res!437437) (not e!383459))))

(assert (=> b!670740 (= res!437437 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12810))))

(declare-fun b!670741 () Bool)

(declare-fun e!383460 () Bool)

(assert (=> b!670741 (= e!383460 (not (contains!3390 acc!681 k0!2843)))))

(declare-fun b!670742 () Bool)

(assert (=> b!670742 (= e!383456 e!383460)))

(declare-fun res!437431 () Bool)

(assert (=> b!670742 (=> (not res!437431) (not e!383460))))

(assert (=> b!670742 (= res!437431 (bvsle from!3004 i!1382))))

(assert (= (and start!60112 res!437436) b!670736))

(assert (= (and b!670736 res!437433) b!670737))

(assert (= (and b!670737 res!437438) b!670739))

(assert (= (and b!670739 res!437430) b!670734))

(assert (= (and b!670734 res!437432) b!670735))

(assert (= (and b!670734 (not res!437434)) b!670742))

(assert (= (and b!670742 res!437431) b!670741))

(assert (= (and b!670734 res!437435) b!670740))

(assert (= (and b!670740 res!437437) b!670738))

(declare-fun m!640573 () Bool)

(assert (=> b!670739 m!640573))

(declare-fun m!640575 () Bool)

(assert (=> b!670738 m!640575))

(declare-fun m!640577 () Bool)

(assert (=> b!670735 m!640577))

(declare-fun m!640579 () Bool)

(assert (=> b!670737 m!640579))

(declare-fun m!640581 () Bool)

(assert (=> b!670736 m!640581))

(declare-fun m!640583 () Bool)

(assert (=> start!60112 m!640583))

(declare-fun m!640585 () Bool)

(assert (=> b!670740 m!640585))

(assert (=> b!670741 m!640577))

(check-sat (not b!670741) (not b!670737) (not b!670735) (not b!670738) (not b!670740) (not b!670736) (not b!670739) (not start!60112))
(check-sat)
