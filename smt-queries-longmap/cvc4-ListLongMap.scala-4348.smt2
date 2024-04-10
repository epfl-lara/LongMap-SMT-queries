; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60120 () Bool)

(assert start!60120)

(declare-fun b!670842 () Bool)

(declare-fun res!437541 () Bool)

(declare-fun e!383519 () Bool)

(assert (=> b!670842 (=> (not res!437541) (not e!383519))))

(declare-datatypes ((List!12817 0))(
  ( (Nil!12814) (Cons!12813 (h!13858 (_ BitVec 64)) (t!19045 List!12817)) )
))
(declare-fun acc!681 () List!12817)

(declare-fun noDuplicate!641 (List!12817) Bool)

(assert (=> b!670842 (= res!437541 (noDuplicate!641 acc!681))))

(declare-fun b!670843 () Bool)

(declare-fun res!437543 () Bool)

(assert (=> b!670843 (=> (not res!437543) (not e!383519))))

(declare-fun e!383518 () Bool)

(assert (=> b!670843 (= res!437543 e!383518)))

(declare-fun res!437546 () Bool)

(assert (=> b!670843 (=> res!437546 e!383518)))

(declare-fun e!383516 () Bool)

(assert (=> b!670843 (= res!437546 e!383516)))

(declare-fun res!437544 () Bool)

(assert (=> b!670843 (=> (not res!437544) (not e!383516))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670843 (= res!437544 (bvsgt from!3004 i!1382))))

(declare-fun b!670844 () Bool)

(assert (=> b!670844 (= e!383519 false)))

(declare-datatypes ((array!39167 0))(
  ( (array!39168 (arr!18776 (Array (_ BitVec 32) (_ BitVec 64))) (size!19140 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39167)

(declare-fun lt!312157 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39167 (_ BitVec 32) List!12817) Bool)

(assert (=> b!670844 (= lt!312157 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670845 () Bool)

(declare-fun res!437539 () Bool)

(assert (=> b!670845 (=> (not res!437539) (not e!383519))))

(declare-fun contains!3394 (List!12817 (_ BitVec 64)) Bool)

(assert (=> b!670845 (= res!437539 (not (contains!3394 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670846 () Bool)

(declare-fun e!383520 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!670846 (= e!383520 (not (contains!3394 acc!681 k!2843)))))

(declare-fun b!670847 () Bool)

(declare-fun res!437540 () Bool)

(assert (=> b!670847 (=> (not res!437540) (not e!383519))))

(assert (=> b!670847 (= res!437540 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12814))))

(declare-fun b!670848 () Bool)

(assert (=> b!670848 (= e!383516 (contains!3394 acc!681 k!2843))))

(declare-fun res!437542 () Bool)

(assert (=> start!60120 (=> (not res!437542) (not e!383519))))

(assert (=> start!60120 (= res!437542 (and (bvslt (size!19140 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19140 a!3626))))))

(assert (=> start!60120 e!383519))

(assert (=> start!60120 true))

(declare-fun array_inv!14572 (array!39167) Bool)

(assert (=> start!60120 (array_inv!14572 a!3626)))

(declare-fun b!670849 () Bool)

(assert (=> b!670849 (= e!383518 e!383520)))

(declare-fun res!437545 () Bool)

(assert (=> b!670849 (=> (not res!437545) (not e!383520))))

(assert (=> b!670849 (= res!437545 (bvsle from!3004 i!1382))))

(declare-fun b!670850 () Bool)

(declare-fun res!437538 () Bool)

(assert (=> b!670850 (=> (not res!437538) (not e!383519))))

(assert (=> b!670850 (= res!437538 (not (contains!3394 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60120 res!437542) b!670842))

(assert (= (and b!670842 res!437541) b!670850))

(assert (= (and b!670850 res!437538) b!670845))

(assert (= (and b!670845 res!437539) b!670843))

(assert (= (and b!670843 res!437544) b!670848))

(assert (= (and b!670843 (not res!437546)) b!670849))

(assert (= (and b!670849 res!437545) b!670846))

(assert (= (and b!670843 res!437543) b!670847))

(assert (= (and b!670847 res!437540) b!670844))

(declare-fun m!640629 () Bool)

(assert (=> b!670846 m!640629))

(declare-fun m!640631 () Bool)

(assert (=> b!670844 m!640631))

(declare-fun m!640633 () Bool)

(assert (=> b!670850 m!640633))

(declare-fun m!640635 () Bool)

(assert (=> b!670842 m!640635))

(declare-fun m!640637 () Bool)

(assert (=> b!670845 m!640637))

(assert (=> b!670848 m!640629))

(declare-fun m!640639 () Bool)

(assert (=> start!60120 m!640639))

(declare-fun m!640641 () Bool)

(assert (=> b!670847 m!640641))

(push 1)

(assert (not b!670848))

(assert (not b!670844))

(assert (not b!670845))

(assert (not b!670842))

(assert (not start!60120))

(assert (not b!670850))

(assert (not b!670847))

(assert (not b!670846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

