; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59756 () Bool)

(assert start!59756)

(declare-fun b!660060 () Bool)

(declare-fun res!428132 () Bool)

(declare-fun e!379293 () Bool)

(assert (=> b!660060 (=> (not res!428132) (not e!379293))))

(declare-datatypes ((List!12635 0))(
  ( (Nil!12632) (Cons!12631 (h!13676 (_ BitVec 64)) (t!18863 List!12635)) )
))
(declare-fun acc!681 () List!12635)

(declare-fun contains!3212 (List!12635 (_ BitVec 64)) Bool)

(assert (=> b!660060 (= res!428132 (not (contains!3212 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660061 () Bool)

(declare-fun res!428125 () Bool)

(assert (=> b!660061 (=> (not res!428125) (not e!379293))))

(declare-fun noDuplicate!459 (List!12635) Bool)

(assert (=> b!660061 (= res!428125 (noDuplicate!459 acc!681))))

(declare-fun b!660062 () Bool)

(declare-fun res!428131 () Bool)

(assert (=> b!660062 (=> (not res!428131) (not e!379293))))

(declare-datatypes ((array!38803 0))(
  ( (array!38804 (arr!18594 (Array (_ BitVec 32) (_ BitVec 64))) (size!18958 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38803)

(declare-fun arrayNoDuplicates!0 (array!38803 (_ BitVec 32) List!12635) Bool)

(assert (=> b!660062 (= res!428131 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12632))))

(declare-fun b!660063 () Bool)

(declare-fun e!379294 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660063 (= e!379294 (not (contains!3212 acc!681 k!2843)))))

(declare-fun b!660064 () Bool)

(declare-fun res!428130 () Bool)

(assert (=> b!660064 (=> (not res!428130) (not e!379293))))

(declare-fun e!379295 () Bool)

(assert (=> b!660064 (= res!428130 e!379295)))

(declare-fun res!428124 () Bool)

(assert (=> b!660064 (=> res!428124 e!379295)))

(declare-fun e!379296 () Bool)

(assert (=> b!660064 (= res!428124 e!379296)))

(declare-fun res!428128 () Bool)

(assert (=> b!660064 (=> (not res!428128) (not e!379296))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660064 (= res!428128 (bvsgt from!3004 i!1382))))

(declare-fun res!428126 () Bool)

(assert (=> start!59756 (=> (not res!428126) (not e!379293))))

(assert (=> start!59756 (= res!428126 (and (bvslt (size!18958 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18958 a!3626))))))

(assert (=> start!59756 e!379293))

(assert (=> start!59756 true))

(declare-fun array_inv!14390 (array!38803) Bool)

(assert (=> start!59756 (array_inv!14390 a!3626)))

(declare-fun b!660065 () Bool)

(declare-fun res!428127 () Bool)

(assert (=> b!660065 (=> (not res!428127) (not e!379293))))

(assert (=> b!660065 (= res!428127 (not (contains!3212 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660066 () Bool)

(assert (=> b!660066 (= e!379295 e!379294)))

(declare-fun res!428129 () Bool)

(assert (=> b!660066 (=> (not res!428129) (not e!379294))))

(assert (=> b!660066 (= res!428129 (bvsle from!3004 i!1382))))

(declare-fun b!660067 () Bool)

(assert (=> b!660067 (= e!379293 (bvsgt from!3004 (size!18958 a!3626)))))

(declare-fun b!660068 () Bool)

(assert (=> b!660068 (= e!379296 (contains!3212 acc!681 k!2843))))

(assert (= (and start!59756 res!428126) b!660061))

(assert (= (and b!660061 res!428125) b!660065))

(assert (= (and b!660065 res!428127) b!660060))

(assert (= (and b!660060 res!428132) b!660064))

(assert (= (and b!660064 res!428128) b!660068))

(assert (= (and b!660064 (not res!428124)) b!660066))

(assert (= (and b!660066 res!428129) b!660063))

(assert (= (and b!660064 res!428130) b!660062))

(assert (= (and b!660062 res!428131) b!660067))

(declare-fun m!632933 () Bool)

(assert (=> b!660063 m!632933))

(declare-fun m!632935 () Bool)

(assert (=> b!660065 m!632935))

(declare-fun m!632937 () Bool)

(assert (=> start!59756 m!632937))

(declare-fun m!632939 () Bool)

(assert (=> b!660061 m!632939))

(declare-fun m!632941 () Bool)

(assert (=> b!660062 m!632941))

(assert (=> b!660068 m!632933))

(declare-fun m!632943 () Bool)

(assert (=> b!660060 m!632943))

(push 1)

(assert (not b!660065))

(assert (not b!660063))

(assert (not b!660061))

(assert (not start!59756))

(assert (not b!660062))

(assert (not b!660068))

(assert (not b!660060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

