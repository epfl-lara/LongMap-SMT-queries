; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62592 () Bool)

(assert start!62592)

(declare-fun res!470119 () Bool)

(declare-fun e!397769 () Bool)

(assert (=> start!62592 (=> (not res!470119) (not e!397769))))

(declare-datatypes ((array!40282 0))(
  ( (array!40283 (arr!19297 (Array (_ BitVec 32) (_ BitVec 64))) (size!19679 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40282)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62592 (= res!470119 (and (bvslt (size!19679 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19679 a!3591))))))

(assert (=> start!62592 e!397769))

(assert (=> start!62592 true))

(declare-fun array_inv!15180 (array!40282) Bool)

(assert (=> start!62592 (array_inv!15180 a!3591)))

(declare-fun b!706137 () Bool)

(declare-fun res!470111 () Bool)

(assert (=> b!706137 (=> (not res!470111) (not e!397769))))

(declare-datatypes ((List!13377 0))(
  ( (Nil!13374) (Cons!13373 (h!14418 (_ BitVec 64)) (t!19650 List!13377)) )
))
(declare-fun acc!652 () List!13377)

(declare-fun noDuplicate!1168 (List!13377) Bool)

(assert (=> b!706137 (= res!470111 (noDuplicate!1168 acc!652))))

(declare-fun b!706138 () Bool)

(declare-fun res!470118 () Bool)

(assert (=> b!706138 (=> (not res!470118) (not e!397769))))

(declare-fun newAcc!49 () List!13377)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!326 (List!13377 (_ BitVec 64)) List!13377)

(assert (=> b!706138 (= res!470118 (= (-!326 newAcc!49 k!2824) acc!652))))

(declare-fun b!706139 () Bool)

(declare-fun res!470116 () Bool)

(assert (=> b!706139 (=> (not res!470116) (not e!397769))))

(declare-fun contains!3899 (List!13377 (_ BitVec 64)) Bool)

(assert (=> b!706139 (= res!470116 (not (contains!3899 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706140 () Bool)

(declare-fun res!470108 () Bool)

(assert (=> b!706140 (=> (not res!470108) (not e!397769))))

(declare-fun arrayContainsKey!0 (array!40282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706140 (= res!470108 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706141 () Bool)

(declare-fun res!470117 () Bool)

(assert (=> b!706141 (=> (not res!470117) (not e!397769))))

(assert (=> b!706141 (= res!470117 (not (contains!3899 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706142 () Bool)

(declare-fun res!470109 () Bool)

(assert (=> b!706142 (=> (not res!470109) (not e!397769))))

(declare-fun arrayNoDuplicates!0 (array!40282 (_ BitVec 32) List!13377) Bool)

(assert (=> b!706142 (= res!470109 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706143 () Bool)

(declare-fun res!470107 () Bool)

(assert (=> b!706143 (=> (not res!470107) (not e!397769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706143 (= res!470107 (validKeyInArray!0 k!2824))))

(declare-fun b!706144 () Bool)

(declare-fun res!470113 () Bool)

(assert (=> b!706144 (=> (not res!470113) (not e!397769))))

(assert (=> b!706144 (= res!470113 (not (contains!3899 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706145 () Bool)

(assert (=> b!706145 (= e!397769 false)))

(declare-fun lt!317697 () Bool)

(assert (=> b!706145 (= lt!317697 (contains!3899 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706146 () Bool)

(declare-fun res!470112 () Bool)

(assert (=> b!706146 (=> (not res!470112) (not e!397769))))

(assert (=> b!706146 (= res!470112 (noDuplicate!1168 newAcc!49))))

(declare-fun b!706147 () Bool)

(declare-fun res!470114 () Bool)

(assert (=> b!706147 (=> (not res!470114) (not e!397769))))

(assert (=> b!706147 (= res!470114 (not (contains!3899 acc!652 k!2824)))))

(declare-fun b!706148 () Bool)

(declare-fun res!470110 () Bool)

(assert (=> b!706148 (=> (not res!470110) (not e!397769))))

(assert (=> b!706148 (= res!470110 (contains!3899 newAcc!49 k!2824))))

(declare-fun b!706149 () Bool)

(declare-fun res!470115 () Bool)

(assert (=> b!706149 (=> (not res!470115) (not e!397769))))

(declare-fun subseq!361 (List!13377 List!13377) Bool)

(assert (=> b!706149 (= res!470115 (subseq!361 acc!652 newAcc!49))))

(assert (= (and start!62592 res!470119) b!706137))

(assert (= (and b!706137 res!470111) b!706146))

(assert (= (and b!706146 res!470112) b!706141))

(assert (= (and b!706141 res!470117) b!706139))

(assert (= (and b!706139 res!470116) b!706140))

(assert (= (and b!706140 res!470108) b!706147))

(assert (= (and b!706147 res!470114) b!706143))

(assert (= (and b!706143 res!470107) b!706142))

(assert (= (and b!706142 res!470109) b!706149))

(assert (= (and b!706149 res!470115) b!706148))

(assert (= (and b!706148 res!470110) b!706138))

(assert (= (and b!706138 res!470118) b!706144))

(assert (= (and b!706144 res!470113) b!706145))

(declare-fun m!663539 () Bool)

(assert (=> b!706141 m!663539))

(declare-fun m!663541 () Bool)

(assert (=> b!706144 m!663541))

(declare-fun m!663543 () Bool)

(assert (=> b!706145 m!663543))

(declare-fun m!663545 () Bool)

(assert (=> b!706147 m!663545))

(declare-fun m!663547 () Bool)

(assert (=> b!706146 m!663547))

(declare-fun m!663549 () Bool)

(assert (=> b!706143 m!663549))

(declare-fun m!663551 () Bool)

(assert (=> b!706148 m!663551))

(declare-fun m!663553 () Bool)

(assert (=> b!706139 m!663553))

(declare-fun m!663555 () Bool)

(assert (=> b!706137 m!663555))

(declare-fun m!663557 () Bool)

(assert (=> b!706140 m!663557))

(declare-fun m!663559 () Bool)

(assert (=> start!62592 m!663559))

(declare-fun m!663561 () Bool)

(assert (=> b!706138 m!663561))

(declare-fun m!663563 () Bool)

(assert (=> b!706149 m!663563))

(declare-fun m!663565 () Bool)

(assert (=> b!706142 m!663565))

(push 1)

(assert (not b!706149))

(assert (not b!706145))

(assert (not b!706147))

(assert (not b!706141))

(assert (not b!706143))

(assert (not b!706138))

(assert (not b!706148))

(assert (not b!706137))

(assert (not b!706140))

(assert (not b!706146))

(assert (not b!706139))

(assert (not b!706144))

(assert (not start!62592))

(assert (not b!706142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

