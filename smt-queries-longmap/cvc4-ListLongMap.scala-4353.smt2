; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60150 () Bool)

(assert start!60150)

(declare-fun b!671492 () Bool)

(declare-fun res!438203 () Bool)

(declare-fun e!383744 () Bool)

(assert (=> b!671492 (=> (not res!438203) (not e!383744))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671492 (= res!438203 (validKeyInArray!0 k!2843))))

(declare-fun b!671493 () Bool)

(declare-fun res!438198 () Bool)

(assert (=> b!671493 (=> (not res!438198) (not e!383744))))

(declare-datatypes ((array!39197 0))(
  ( (array!39198 (arr!18791 (Array (_ BitVec 32) (_ BitVec 64))) (size!19155 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39197)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!671493 (= res!438198 (validKeyInArray!0 (select (arr!18791 a!3626) from!3004)))))

(declare-fun b!671494 () Bool)

(declare-fun res!438201 () Bool)

(assert (=> b!671494 (=> (not res!438201) (not e!383744))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671494 (= res!438201 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19155 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671495 () Bool)

(declare-fun res!438200 () Bool)

(assert (=> b!671495 (=> (not res!438200) (not e!383744))))

(declare-datatypes ((List!12832 0))(
  ( (Nil!12829) (Cons!12828 (h!13873 (_ BitVec 64)) (t!19060 List!12832)) )
))
(declare-fun acc!681 () List!12832)

(declare-fun noDuplicate!656 (List!12832) Bool)

(assert (=> b!671495 (= res!438200 (noDuplicate!656 acc!681))))

(declare-fun b!671496 () Bool)

(declare-fun res!438194 () Bool)

(assert (=> b!671496 (=> (not res!438194) (not e!383744))))

(assert (=> b!671496 (= res!438194 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19155 a!3626))))))

(declare-fun b!671497 () Bool)

(declare-fun res!438197 () Bool)

(assert (=> b!671497 (=> (not res!438197) (not e!383744))))

(declare-fun arrayContainsKey!0 (array!39197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671497 (= res!438197 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671498 () Bool)

(assert (=> b!671498 (= e!383744 (not true))))

(assert (=> b!671498 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671499 () Bool)

(declare-fun res!438189 () Bool)

(assert (=> b!671499 (=> (not res!438189) (not e!383744))))

(declare-fun arrayNoDuplicates!0 (array!39197 (_ BitVec 32) List!12832) Bool)

(assert (=> b!671499 (= res!438189 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12829))))

(declare-fun b!671500 () Bool)

(declare-fun res!438191 () Bool)

(assert (=> b!671500 (=> (not res!438191) (not e!383744))))

(declare-fun e!383743 () Bool)

(assert (=> b!671500 (= res!438191 e!383743)))

(declare-fun res!438192 () Bool)

(assert (=> b!671500 (=> res!438192 e!383743)))

(declare-fun e!383742 () Bool)

(assert (=> b!671500 (= res!438192 e!383742)))

(declare-fun res!438188 () Bool)

(assert (=> b!671500 (=> (not res!438188) (not e!383742))))

(assert (=> b!671500 (= res!438188 (bvsgt from!3004 i!1382))))

(declare-fun b!671501 () Bool)

(declare-fun res!438190 () Bool)

(assert (=> b!671501 (=> (not res!438190) (not e!383744))))

(declare-fun contains!3409 (List!12832 (_ BitVec 64)) Bool)

(assert (=> b!671501 (= res!438190 (not (contains!3409 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671503 () Bool)

(declare-fun res!438196 () Bool)

(assert (=> b!671503 (=> (not res!438196) (not e!383744))))

(assert (=> b!671503 (= res!438196 (not (contains!3409 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671504 () Bool)

(declare-fun e!383745 () Bool)

(assert (=> b!671504 (= e!383745 (not (contains!3409 acc!681 k!2843)))))

(declare-fun b!671505 () Bool)

(declare-fun res!438195 () Bool)

(assert (=> b!671505 (=> (not res!438195) (not e!383744))))

(assert (=> b!671505 (= res!438195 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671506 () Bool)

(assert (=> b!671506 (= e!383742 (contains!3409 acc!681 k!2843))))

(declare-fun b!671507 () Bool)

(assert (=> b!671507 (= e!383743 e!383745)))

(declare-fun res!438193 () Bool)

(assert (=> b!671507 (=> (not res!438193) (not e!383745))))

(assert (=> b!671507 (= res!438193 (bvsle from!3004 i!1382))))

(declare-fun res!438202 () Bool)

(assert (=> start!60150 (=> (not res!438202) (not e!383744))))

(assert (=> start!60150 (= res!438202 (and (bvslt (size!19155 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19155 a!3626))))))

(assert (=> start!60150 e!383744))

(assert (=> start!60150 true))

(declare-fun array_inv!14587 (array!39197) Bool)

(assert (=> start!60150 (array_inv!14587 a!3626)))

(declare-fun b!671502 () Bool)

(declare-fun res!438199 () Bool)

(assert (=> b!671502 (=> (not res!438199) (not e!383744))))

(assert (=> b!671502 (= res!438199 (= (select (arr!18791 a!3626) from!3004) k!2843))))

(assert (= (and start!60150 res!438202) b!671495))

(assert (= (and b!671495 res!438200) b!671503))

(assert (= (and b!671503 res!438196) b!671501))

(assert (= (and b!671501 res!438190) b!671500))

(assert (= (and b!671500 res!438188) b!671506))

(assert (= (and b!671500 (not res!438192)) b!671507))

(assert (= (and b!671507 res!438193) b!671504))

(assert (= (and b!671500 res!438191) b!671499))

(assert (= (and b!671499 res!438189) b!671505))

(assert (= (and b!671505 res!438195) b!671496))

(assert (= (and b!671496 res!438194) b!671492))

(assert (= (and b!671492 res!438203) b!671497))

(assert (= (and b!671497 res!438197) b!671494))

(assert (= (and b!671494 res!438201) b!671493))

(assert (= (and b!671493 res!438198) b!671502))

(assert (= (and b!671502 res!438199) b!671498))

(declare-fun m!640949 () Bool)

(assert (=> b!671497 m!640949))

(declare-fun m!640951 () Bool)

(assert (=> b!671493 m!640951))

(assert (=> b!671493 m!640951))

(declare-fun m!640953 () Bool)

(assert (=> b!671493 m!640953))

(declare-fun m!640955 () Bool)

(assert (=> b!671498 m!640955))

(declare-fun m!640957 () Bool)

(assert (=> b!671503 m!640957))

(declare-fun m!640959 () Bool)

(assert (=> b!671492 m!640959))

(declare-fun m!640961 () Bool)

(assert (=> b!671504 m!640961))

(declare-fun m!640963 () Bool)

(assert (=> start!60150 m!640963))

(assert (=> b!671502 m!640951))

(declare-fun m!640965 () Bool)

(assert (=> b!671495 m!640965))

(assert (=> b!671506 m!640961))

(declare-fun m!640967 () Bool)

(assert (=> b!671499 m!640967))

(declare-fun m!640969 () Bool)

(assert (=> b!671501 m!640969))

(declare-fun m!640971 () Bool)

(assert (=> b!671505 m!640971))

(push 1)

(assert (not b!671499))

(assert (not b!671497))

(assert (not b!671505))

(assert (not b!671503))

(assert (not b!671504))

(assert (not b!671493))

(assert (not b!671506))

(assert (not start!60150))

(assert (not b!671498))

(assert (not b!671492))

(assert (not b!671501))

(assert (not b!671495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

