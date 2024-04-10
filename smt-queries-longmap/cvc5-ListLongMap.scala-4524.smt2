; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62612 () Bool)

(assert start!62612)

(declare-fun b!706584 () Bool)

(declare-fun res!470395 () Bool)

(declare-fun e!397974 () Bool)

(assert (=> b!706584 (=> (not res!470395) (not e!397974))))

(declare-datatypes ((array!40291 0))(
  ( (array!40292 (arr!19302 (Array (_ BitVec 32) (_ BitVec 64))) (size!19687 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40291)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706584 (= res!470395 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706585 () Bool)

(declare-fun res!470403 () Bool)

(assert (=> b!706585 (=> (not res!470403) (not e!397974))))

(declare-datatypes ((List!13343 0))(
  ( (Nil!13340) (Cons!13339 (h!14384 (_ BitVec 64)) (t!19625 List!13343)) )
))
(declare-fun newAcc!49 () List!13343)

(declare-fun contains!3920 (List!13343 (_ BitVec 64)) Bool)

(assert (=> b!706585 (= res!470403 (not (contains!3920 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706586 () Bool)

(declare-fun res!470404 () Bool)

(assert (=> b!706586 (=> (not res!470404) (not e!397974))))

(assert (=> b!706586 (= res!470404 (not (contains!3920 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706587 () Bool)

(declare-fun res!470398 () Bool)

(assert (=> b!706587 (=> (not res!470398) (not e!397974))))

(declare-fun acc!652 () List!13343)

(declare-fun subseq!365 (List!13343 List!13343) Bool)

(assert (=> b!706587 (= res!470398 (subseq!365 acc!652 newAcc!49))))

(declare-fun b!706588 () Bool)

(declare-fun res!470406 () Bool)

(assert (=> b!706588 (=> (not res!470406) (not e!397974))))

(assert (=> b!706588 (= res!470406 (not (contains!3920 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706589 () Bool)

(declare-fun res!470396 () Bool)

(assert (=> b!706589 (=> (not res!470396) (not e!397974))))

(assert (=> b!706589 (= res!470396 (not (contains!3920 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706590 () Bool)

(assert (=> b!706590 (= e!397974 (bvslt (bvsub (size!19687 a!3591) from!2969) #b00000000000000000000000000000000))))

(declare-fun b!706591 () Bool)

(declare-fun res!470405 () Bool)

(assert (=> b!706591 (=> (not res!470405) (not e!397974))))

(assert (=> b!706591 (= res!470405 (contains!3920 newAcc!49 k!2824))))

(declare-fun b!706592 () Bool)

(declare-fun res!470394 () Bool)

(assert (=> b!706592 (=> (not res!470394) (not e!397974))))

(declare-fun arrayNoDuplicates!0 (array!40291 (_ BitVec 32) List!13343) Bool)

(assert (=> b!706592 (= res!470394 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706583 () Bool)

(declare-fun res!470399 () Bool)

(assert (=> b!706583 (=> (not res!470399) (not e!397974))))

(assert (=> b!706583 (= res!470399 (not (contains!3920 acc!652 k!2824)))))

(declare-fun res!470393 () Bool)

(assert (=> start!62612 (=> (not res!470393) (not e!397974))))

(assert (=> start!62612 (= res!470393 (and (bvslt (size!19687 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19687 a!3591))))))

(assert (=> start!62612 e!397974))

(assert (=> start!62612 true))

(declare-fun array_inv!15098 (array!40291) Bool)

(assert (=> start!62612 (array_inv!15098 a!3591)))

(declare-fun b!706593 () Bool)

(declare-fun res!470401 () Bool)

(assert (=> b!706593 (=> (not res!470401) (not e!397974))))

(declare-fun noDuplicate!1167 (List!13343) Bool)

(assert (=> b!706593 (= res!470401 (noDuplicate!1167 newAcc!49))))

(declare-fun b!706594 () Bool)

(declare-fun res!470397 () Bool)

(assert (=> b!706594 (=> (not res!470397) (not e!397974))))

(assert (=> b!706594 (= res!470397 (noDuplicate!1167 acc!652))))

(declare-fun b!706595 () Bool)

(declare-fun res!470400 () Bool)

(assert (=> b!706595 (=> (not res!470400) (not e!397974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706595 (= res!470400 (validKeyInArray!0 k!2824))))

(declare-fun b!706596 () Bool)

(declare-fun res!470402 () Bool)

(assert (=> b!706596 (=> (not res!470402) (not e!397974))))

(declare-fun -!330 (List!13343 (_ BitVec 64)) List!13343)

(assert (=> b!706596 (= res!470402 (= (-!330 newAcc!49 k!2824) acc!652))))

(assert (= (and start!62612 res!470393) b!706594))

(assert (= (and b!706594 res!470397) b!706593))

(assert (= (and b!706593 res!470401) b!706589))

(assert (= (and b!706589 res!470396) b!706588))

(assert (= (and b!706588 res!470406) b!706584))

(assert (= (and b!706584 res!470395) b!706583))

(assert (= (and b!706583 res!470399) b!706595))

(assert (= (and b!706595 res!470400) b!706592))

(assert (= (and b!706592 res!470394) b!706587))

(assert (= (and b!706587 res!470398) b!706591))

(assert (= (and b!706591 res!470405) b!706596))

(assert (= (and b!706596 res!470402) b!706585))

(assert (= (and b!706585 res!470403) b!706586))

(assert (= (and b!706586 res!470404) b!706590))

(declare-fun m!664411 () Bool)

(assert (=> b!706594 m!664411))

(declare-fun m!664413 () Bool)

(assert (=> b!706589 m!664413))

(declare-fun m!664415 () Bool)

(assert (=> b!706584 m!664415))

(declare-fun m!664417 () Bool)

(assert (=> start!62612 m!664417))

(declare-fun m!664419 () Bool)

(assert (=> b!706591 m!664419))

(declare-fun m!664421 () Bool)

(assert (=> b!706587 m!664421))

(declare-fun m!664423 () Bool)

(assert (=> b!706593 m!664423))

(declare-fun m!664425 () Bool)

(assert (=> b!706592 m!664425))

(declare-fun m!664427 () Bool)

(assert (=> b!706585 m!664427))

(declare-fun m!664429 () Bool)

(assert (=> b!706595 m!664429))

(declare-fun m!664431 () Bool)

(assert (=> b!706586 m!664431))

(declare-fun m!664433 () Bool)

(assert (=> b!706588 m!664433))

(declare-fun m!664435 () Bool)

(assert (=> b!706583 m!664435))

(declare-fun m!664437 () Bool)

(assert (=> b!706596 m!664437))

(push 1)

(assert (not b!706596))

(assert (not b!706586))

(assert (not b!706589))

(assert (not b!706591))

(assert (not b!706588))

(assert (not b!706587))

(assert (not b!706592))

(assert (not b!706594))

(assert (not b!706593))

(assert (not b!706595))

(assert (not b!706583))

(assert (not start!62612))

(assert (not b!706585))

(assert (not b!706584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

