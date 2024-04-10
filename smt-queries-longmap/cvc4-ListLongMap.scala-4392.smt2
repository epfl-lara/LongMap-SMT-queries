; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60420 () Bool)

(assert start!60420)

(declare-fun b!678871 () Bool)

(declare-fun res!445258 () Bool)

(declare-fun e!386840 () Bool)

(assert (=> b!678871 (=> (not res!445258) (not e!386840))))

(declare-datatypes ((List!12949 0))(
  ( (Nil!12946) (Cons!12945 (h!13990 (_ BitVec 64)) (t!19177 List!12949)) )
))
(declare-fun acc!681 () List!12949)

(declare-fun noDuplicate!773 (List!12949) Bool)

(assert (=> b!678871 (= res!445258 (noDuplicate!773 acc!681))))

(declare-fun b!678872 () Bool)

(declare-fun res!445261 () Bool)

(assert (=> b!678872 (=> (not res!445261) (not e!386840))))

(declare-datatypes ((array!39434 0))(
  ( (array!39435 (arr!18908 (Array (_ BitVec 32) (_ BitVec 64))) (size!19272 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39434)

(declare-fun arrayNoDuplicates!0 (array!39434 (_ BitVec 32) List!12949) Bool)

(assert (=> b!678872 (= res!445261 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12946))))

(declare-fun res!445264 () Bool)

(assert (=> start!60420 (=> (not res!445264) (not e!386840))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60420 (= res!445264 (and (bvslt (size!19272 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19272 a!3626))))))

(assert (=> start!60420 e!386840))

(assert (=> start!60420 true))

(declare-fun array_inv!14704 (array!39434) Bool)

(assert (=> start!60420 (array_inv!14704 a!3626)))

(declare-fun b!678873 () Bool)

(declare-fun res!445265 () Bool)

(assert (=> b!678873 (=> (not res!445265) (not e!386840))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678873 (= res!445265 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19272 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678874 () Bool)

(assert (=> b!678874 (= e!386840 (not true))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678874 (arrayContainsKey!0 (array!39435 (store (arr!18908 a!3626) i!1382 k!2843) (size!19272 a!3626)) k!2843 from!3004)))

(declare-fun b!678875 () Bool)

(declare-fun res!445260 () Bool)

(assert (=> b!678875 (=> (not res!445260) (not e!386840))))

(assert (=> b!678875 (= res!445260 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678876 () Bool)

(declare-fun e!386843 () Bool)

(declare-fun contains!3526 (List!12949 (_ BitVec 64)) Bool)

(assert (=> b!678876 (= e!386843 (contains!3526 acc!681 k!2843))))

(declare-fun b!678877 () Bool)

(declare-fun res!445262 () Bool)

(assert (=> b!678877 (=> (not res!445262) (not e!386840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678877 (= res!445262 (validKeyInArray!0 k!2843))))

(declare-fun b!678878 () Bool)

(declare-fun e!386842 () Bool)

(assert (=> b!678878 (= e!386842 (not (contains!3526 acc!681 k!2843)))))

(declare-fun b!678879 () Bool)

(declare-fun res!445256 () Bool)

(assert (=> b!678879 (=> (not res!445256) (not e!386840))))

(assert (=> b!678879 (= res!445256 (not (contains!3526 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678880 () Bool)

(declare-fun res!445259 () Bool)

(assert (=> b!678880 (=> (not res!445259) (not e!386840))))

(assert (=> b!678880 (= res!445259 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678881 () Bool)

(declare-fun e!386844 () Bool)

(assert (=> b!678881 (= e!386844 e!386842)))

(declare-fun res!445266 () Bool)

(assert (=> b!678881 (=> (not res!445266) (not e!386842))))

(assert (=> b!678881 (= res!445266 (bvsle from!3004 i!1382))))

(declare-fun b!678882 () Bool)

(declare-fun res!445263 () Bool)

(assert (=> b!678882 (=> (not res!445263) (not e!386840))))

(assert (=> b!678882 (= res!445263 e!386844)))

(declare-fun res!445268 () Bool)

(assert (=> b!678882 (=> res!445268 e!386844)))

(assert (=> b!678882 (= res!445268 e!386843)))

(declare-fun res!445257 () Bool)

(assert (=> b!678882 (=> (not res!445257) (not e!386843))))

(assert (=> b!678882 (= res!445257 (bvsgt from!3004 i!1382))))

(declare-fun b!678883 () Bool)

(declare-fun res!445255 () Bool)

(assert (=> b!678883 (=> (not res!445255) (not e!386840))))

(assert (=> b!678883 (= res!445255 (not (contains!3526 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678884 () Bool)

(declare-fun res!445267 () Bool)

(assert (=> b!678884 (=> (not res!445267) (not e!386840))))

(assert (=> b!678884 (= res!445267 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19272 a!3626))))))

(assert (= (and start!60420 res!445264) b!678871))

(assert (= (and b!678871 res!445258) b!678883))

(assert (= (and b!678883 res!445255) b!678879))

(assert (= (and b!678879 res!445256) b!678882))

(assert (= (and b!678882 res!445257) b!678876))

(assert (= (and b!678882 (not res!445268)) b!678881))

(assert (= (and b!678881 res!445266) b!678878))

(assert (= (and b!678882 res!445263) b!678872))

(assert (= (and b!678872 res!445261) b!678875))

(assert (= (and b!678875 res!445260) b!678884))

(assert (= (and b!678884 res!445267) b!678877))

(assert (= (and b!678877 res!445262) b!678880))

(assert (= (and b!678880 res!445259) b!678873))

(assert (= (and b!678873 res!445265) b!678874))

(declare-fun m!644491 () Bool)

(assert (=> b!678878 m!644491))

(declare-fun m!644493 () Bool)

(assert (=> b!678875 m!644493))

(declare-fun m!644495 () Bool)

(assert (=> b!678879 m!644495))

(declare-fun m!644497 () Bool)

(assert (=> b!678883 m!644497))

(declare-fun m!644499 () Bool)

(assert (=> start!60420 m!644499))

(declare-fun m!644501 () Bool)

(assert (=> b!678880 m!644501))

(declare-fun m!644503 () Bool)

(assert (=> b!678871 m!644503))

(assert (=> b!678876 m!644491))

(declare-fun m!644505 () Bool)

(assert (=> b!678877 m!644505))

(declare-fun m!644507 () Bool)

(assert (=> b!678872 m!644507))

(declare-fun m!644509 () Bool)

(assert (=> b!678874 m!644509))

(declare-fun m!644511 () Bool)

(assert (=> b!678874 m!644511))

(push 1)

(assert (not b!678874))

(assert (not b!678877))

(assert (not b!678880))

(assert (not b!678871))

(assert (not b!678872))

(assert (not b!678883))

(assert (not b!678878))

(assert (not b!678879))

(assert (not start!60420))

(assert (not b!678876))

(assert (not b!678875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

