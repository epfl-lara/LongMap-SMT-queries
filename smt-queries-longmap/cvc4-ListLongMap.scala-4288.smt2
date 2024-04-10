; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59760 () Bool)

(assert start!59760)

(declare-fun b!660114 () Bool)

(declare-fun e!379325 () Bool)

(declare-fun e!379326 () Bool)

(assert (=> b!660114 (= e!379325 e!379326)))

(declare-fun res!428184 () Bool)

(assert (=> b!660114 (=> (not res!428184) (not e!379326))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660114 (= res!428184 (bvsle from!3004 i!1382))))

(declare-fun b!660116 () Bool)

(declare-fun e!379323 () Bool)

(declare-datatypes ((List!12637 0))(
  ( (Nil!12634) (Cons!12633 (h!13678 (_ BitVec 64)) (t!18865 List!12637)) )
))
(declare-fun acc!681 () List!12637)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3214 (List!12637 (_ BitVec 64)) Bool)

(assert (=> b!660116 (= e!379323 (contains!3214 acc!681 k!2843))))

(declare-fun b!660117 () Bool)

(declare-fun e!379324 () Bool)

(declare-datatypes ((array!38807 0))(
  ( (array!38808 (arr!18596 (Array (_ BitVec 32) (_ BitVec 64))) (size!18960 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38807)

(assert (=> b!660117 (= e!379324 (bvsgt from!3004 (size!18960 a!3626)))))

(declare-fun b!660118 () Bool)

(declare-fun res!428183 () Bool)

(assert (=> b!660118 (=> (not res!428183) (not e!379324))))

(declare-fun noDuplicate!461 (List!12637) Bool)

(assert (=> b!660118 (= res!428183 (noDuplicate!461 acc!681))))

(declare-fun b!660119 () Bool)

(declare-fun res!428186 () Bool)

(assert (=> b!660119 (=> (not res!428186) (not e!379324))))

(declare-fun arrayNoDuplicates!0 (array!38807 (_ BitVec 32) List!12637) Bool)

(assert (=> b!660119 (= res!428186 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12634))))

(declare-fun b!660120 () Bool)

(declare-fun res!428185 () Bool)

(assert (=> b!660120 (=> (not res!428185) (not e!379324))))

(assert (=> b!660120 (= res!428185 e!379325)))

(declare-fun res!428182 () Bool)

(assert (=> b!660120 (=> res!428182 e!379325)))

(assert (=> b!660120 (= res!428182 e!379323)))

(declare-fun res!428178 () Bool)

(assert (=> b!660120 (=> (not res!428178) (not e!379323))))

(assert (=> b!660120 (= res!428178 (bvsgt from!3004 i!1382))))

(declare-fun b!660121 () Bool)

(declare-fun res!428180 () Bool)

(assert (=> b!660121 (=> (not res!428180) (not e!379324))))

(assert (=> b!660121 (= res!428180 (not (contains!3214 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660122 () Bool)

(declare-fun res!428181 () Bool)

(assert (=> b!660122 (=> (not res!428181) (not e!379324))))

(assert (=> b!660122 (= res!428181 (not (contains!3214 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660115 () Bool)

(assert (=> b!660115 (= e!379326 (not (contains!3214 acc!681 k!2843)))))

(declare-fun res!428179 () Bool)

(assert (=> start!59760 (=> (not res!428179) (not e!379324))))

(assert (=> start!59760 (= res!428179 (and (bvslt (size!18960 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18960 a!3626))))))

(assert (=> start!59760 e!379324))

(assert (=> start!59760 true))

(declare-fun array_inv!14392 (array!38807) Bool)

(assert (=> start!59760 (array_inv!14392 a!3626)))

(assert (= (and start!59760 res!428179) b!660118))

(assert (= (and b!660118 res!428183) b!660122))

(assert (= (and b!660122 res!428181) b!660121))

(assert (= (and b!660121 res!428180) b!660120))

(assert (= (and b!660120 res!428178) b!660116))

(assert (= (and b!660120 (not res!428182)) b!660114))

(assert (= (and b!660114 res!428184) b!660115))

(assert (= (and b!660120 res!428185) b!660119))

(assert (= (and b!660119 res!428186) b!660117))

(declare-fun m!632957 () Bool)

(assert (=> b!660115 m!632957))

(assert (=> b!660116 m!632957))

(declare-fun m!632959 () Bool)

(assert (=> b!660122 m!632959))

(declare-fun m!632961 () Bool)

(assert (=> b!660121 m!632961))

(declare-fun m!632963 () Bool)

(assert (=> b!660119 m!632963))

(declare-fun m!632965 () Bool)

(assert (=> start!59760 m!632965))

(declare-fun m!632967 () Bool)

(assert (=> b!660118 m!632967))

(push 1)

(assert (not b!660116))

(assert (not start!59760))

(assert (not b!660121))

(assert (not b!660115))

(assert (not b!660119))

(assert (not b!660118))

(assert (not b!660122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

