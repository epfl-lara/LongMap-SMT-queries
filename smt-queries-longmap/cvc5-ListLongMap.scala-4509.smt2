; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62582 () Bool)

(assert start!62582)

(declare-fun b!704597 () Bool)

(declare-fun res!468319 () Bool)

(declare-fun e!397833 () Bool)

(assert (=> b!704597 (=> (not res!468319) (not e!397833))))

(declare-datatypes ((array!40201 0))(
  ( (array!40202 (arr!19254 (Array (_ BitVec 32) (_ BitVec 64))) (size!19637 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40201)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704597 (= res!468319 (not (validKeyInArray!0 (select (arr!19254 a!3591) from!2969))))))

(declare-fun b!704598 () Bool)

(declare-fun res!468308 () Bool)

(assert (=> b!704598 (=> (not res!468308) (not e!397833))))

(assert (=> b!704598 (= res!468308 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19637 a!3591)))))

(declare-fun res!468323 () Bool)

(assert (=> start!62582 (=> (not res!468323) (not e!397833))))

(assert (=> start!62582 (= res!468323 (and (bvslt (size!19637 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19637 a!3591))))))

(assert (=> start!62582 e!397833))

(assert (=> start!62582 true))

(declare-fun array_inv!15113 (array!40201) Bool)

(assert (=> start!62582 (array_inv!15113 a!3591)))

(declare-fun b!704599 () Bool)

(declare-fun res!468321 () Bool)

(assert (=> b!704599 (=> (not res!468321) (not e!397833))))

(assert (=> b!704599 (= res!468321 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704600 () Bool)

(declare-fun res!468324 () Bool)

(assert (=> b!704600 (=> (not res!468324) (not e!397833))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704600 (= res!468324 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704601 () Bool)

(assert (=> b!704601 (= e!397833 false)))

(declare-datatypes ((List!13202 0))(
  ( (Nil!13199) (Cons!13198 (h!14246 (_ BitVec 64)) (t!19476 List!13202)) )
))
(declare-fun acc!652 () List!13202)

(declare-fun lt!317940 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40201 (_ BitVec 32) List!13202) Bool)

(assert (=> b!704601 (= lt!317940 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704602 () Bool)

(declare-fun res!468317 () Bool)

(assert (=> b!704602 (=> (not res!468317) (not e!397833))))

(declare-fun noDuplicate!1128 (List!13202) Bool)

(assert (=> b!704602 (= res!468317 (noDuplicate!1128 acc!652))))

(declare-fun b!704603 () Bool)

(declare-fun res!468311 () Bool)

(assert (=> b!704603 (=> (not res!468311) (not e!397833))))

(declare-fun newAcc!49 () List!13202)

(declare-fun subseq!322 (List!13202 List!13202) Bool)

(assert (=> b!704603 (= res!468311 (subseq!322 acc!652 newAcc!49))))

(declare-fun b!704604 () Bool)

(declare-fun res!468318 () Bool)

(assert (=> b!704604 (=> (not res!468318) (not e!397833))))

(declare-fun contains!3854 (List!13202 (_ BitVec 64)) Bool)

(assert (=> b!704604 (= res!468318 (not (contains!3854 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704605 () Bool)

(declare-fun res!468316 () Bool)

(assert (=> b!704605 (=> (not res!468316) (not e!397833))))

(assert (=> b!704605 (= res!468316 (not (contains!3854 acc!652 k!2824)))))

(declare-fun b!704606 () Bool)

(declare-fun res!468309 () Bool)

(assert (=> b!704606 (=> (not res!468309) (not e!397833))))

(assert (=> b!704606 (= res!468309 (not (contains!3854 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704607 () Bool)

(declare-fun res!468315 () Bool)

(assert (=> b!704607 (=> (not res!468315) (not e!397833))))

(assert (=> b!704607 (= res!468315 (not (contains!3854 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704608 () Bool)

(declare-fun res!468320 () Bool)

(assert (=> b!704608 (=> (not res!468320) (not e!397833))))

(declare-fun -!286 (List!13202 (_ BitVec 64)) List!13202)

(assert (=> b!704608 (= res!468320 (= (-!286 newAcc!49 k!2824) acc!652))))

(declare-fun b!704609 () Bool)

(declare-fun res!468310 () Bool)

(assert (=> b!704609 (=> (not res!468310) (not e!397833))))

(assert (=> b!704609 (= res!468310 (not (contains!3854 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704610 () Bool)

(declare-fun res!468322 () Bool)

(assert (=> b!704610 (=> (not res!468322) (not e!397833))))

(assert (=> b!704610 (= res!468322 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704611 () Bool)

(declare-fun res!468314 () Bool)

(assert (=> b!704611 (=> (not res!468314) (not e!397833))))

(assert (=> b!704611 (= res!468314 (contains!3854 newAcc!49 k!2824))))

(declare-fun b!704612 () Bool)

(declare-fun res!468325 () Bool)

(assert (=> b!704612 (=> (not res!468325) (not e!397833))))

(assert (=> b!704612 (= res!468325 (validKeyInArray!0 k!2824))))

(declare-fun b!704613 () Bool)

(declare-fun res!468313 () Bool)

(assert (=> b!704613 (=> (not res!468313) (not e!397833))))

(assert (=> b!704613 (= res!468313 (noDuplicate!1128 newAcc!49))))

(declare-fun b!704614 () Bool)

(declare-fun res!468312 () Bool)

(assert (=> b!704614 (=> (not res!468312) (not e!397833))))

(assert (=> b!704614 (= res!468312 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62582 res!468323) b!704602))

(assert (= (and b!704602 res!468317) b!704613))

(assert (= (and b!704613 res!468313) b!704607))

(assert (= (and b!704607 res!468315) b!704604))

(assert (= (and b!704604 res!468318) b!704600))

(assert (= (and b!704600 res!468324) b!704605))

(assert (= (and b!704605 res!468316) b!704612))

(assert (= (and b!704612 res!468325) b!704614))

(assert (= (and b!704614 res!468312) b!704603))

(assert (= (and b!704603 res!468311) b!704611))

(assert (= (and b!704611 res!468314) b!704608))

(assert (= (and b!704608 res!468320) b!704606))

(assert (= (and b!704606 res!468309) b!704609))

(assert (= (and b!704609 res!468310) b!704598))

(assert (= (and b!704598 res!468308) b!704597))

(assert (= (and b!704597 res!468319) b!704599))

(assert (= (and b!704599 res!468321) b!704610))

(assert (= (and b!704610 res!468322) b!704601))

(declare-fun m!663567 () Bool)

(assert (=> b!704600 m!663567))

(declare-fun m!663569 () Bool)

(assert (=> b!704597 m!663569))

(assert (=> b!704597 m!663569))

(declare-fun m!663571 () Bool)

(assert (=> b!704597 m!663571))

(declare-fun m!663573 () Bool)

(assert (=> b!704612 m!663573))

(declare-fun m!663575 () Bool)

(assert (=> b!704609 m!663575))

(declare-fun m!663577 () Bool)

(assert (=> b!704610 m!663577))

(declare-fun m!663579 () Bool)

(assert (=> b!704605 m!663579))

(declare-fun m!663581 () Bool)

(assert (=> b!704602 m!663581))

(declare-fun m!663583 () Bool)

(assert (=> b!704611 m!663583))

(declare-fun m!663585 () Bool)

(assert (=> b!704607 m!663585))

(declare-fun m!663587 () Bool)

(assert (=> start!62582 m!663587))

(declare-fun m!663589 () Bool)

(assert (=> b!704614 m!663589))

(declare-fun m!663591 () Bool)

(assert (=> b!704606 m!663591))

(declare-fun m!663593 () Bool)

(assert (=> b!704603 m!663593))

(declare-fun m!663595 () Bool)

(assert (=> b!704608 m!663595))

(declare-fun m!663597 () Bool)

(assert (=> b!704604 m!663597))

(declare-fun m!663599 () Bool)

(assert (=> b!704601 m!663599))

(declare-fun m!663601 () Bool)

(assert (=> b!704613 m!663601))

(push 1)

(assert (not b!704601))

(assert (not b!704609))

(assert (not b!704613))

(assert (not b!704603))

(assert (not b!704614))

(assert (not b!704597))

(assert (not b!704604))

(assert (not b!704606))

(assert (not b!704607))

(assert (not b!704600))

(assert (not b!704611))

(assert (not b!704602))

(assert (not b!704612))

(assert (not b!704605))

(assert (not b!704610))

(assert (not b!704608))

(assert (not start!62582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

