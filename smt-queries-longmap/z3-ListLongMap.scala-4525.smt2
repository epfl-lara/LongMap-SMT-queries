; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62606 () Bool)

(assert start!62606)

(declare-fun b!706419 () Bool)

(declare-fun res!470390 () Bool)

(declare-fun e!397810 () Bool)

(assert (=> b!706419 (=> (not res!470390) (not e!397810))))

(declare-datatypes ((List!13384 0))(
  ( (Nil!13381) (Cons!13380 (h!14425 (_ BitVec 64)) (t!19657 List!13384)) )
))
(declare-fun newAcc!49 () List!13384)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3906 (List!13384 (_ BitVec 64)) Bool)

(assert (=> b!706419 (= res!470390 (contains!3906 newAcc!49 k0!2824))))

(declare-fun b!706420 () Bool)

(declare-fun res!470393 () Bool)

(assert (=> b!706420 (=> (not res!470393) (not e!397810))))

(declare-fun noDuplicate!1175 (List!13384) Bool)

(assert (=> b!706420 (= res!470393 (noDuplicate!1175 newAcc!49))))

(declare-fun b!706421 () Bool)

(declare-fun res!470391 () Bool)

(assert (=> b!706421 (=> (not res!470391) (not e!397810))))

(declare-fun acc!652 () List!13384)

(assert (=> b!706421 (= res!470391 (not (contains!3906 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706422 () Bool)

(declare-fun res!470396 () Bool)

(assert (=> b!706422 (=> (not res!470396) (not e!397810))))

(assert (=> b!706422 (= res!470396 (not (contains!3906 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706423 () Bool)

(declare-fun res!470400 () Bool)

(assert (=> b!706423 (=> (not res!470400) (not e!397810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706423 (= res!470400 (validKeyInArray!0 k0!2824))))

(declare-fun b!706424 () Bool)

(declare-fun res!470399 () Bool)

(assert (=> b!706424 (=> (not res!470399) (not e!397810))))

(assert (=> b!706424 (= res!470399 (not (contains!3906 acc!652 k0!2824)))))

(declare-fun b!706425 () Bool)

(declare-fun res!470397 () Bool)

(assert (=> b!706425 (=> (not res!470397) (not e!397810))))

(assert (=> b!706425 (= res!470397 (not (contains!3906 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706426 () Bool)

(declare-fun res!470398 () Bool)

(assert (=> b!706426 (=> (not res!470398) (not e!397810))))

(declare-fun -!333 (List!13384 (_ BitVec 64)) List!13384)

(assert (=> b!706426 (= res!470398 (= (-!333 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706428 () Bool)

(declare-fun res!470389 () Bool)

(assert (=> b!706428 (=> (not res!470389) (not e!397810))))

(declare-datatypes ((array!40296 0))(
  ( (array!40297 (arr!19304 (Array (_ BitVec 32) (_ BitVec 64))) (size!19686 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40296)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706428 (= res!470389 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706429 () Bool)

(declare-fun res!470401 () Bool)

(assert (=> b!706429 (=> (not res!470401) (not e!397810))))

(declare-fun subseq!368 (List!13384 List!13384) Bool)

(assert (=> b!706429 (= res!470401 (subseq!368 acc!652 newAcc!49))))

(declare-fun b!706430 () Bool)

(declare-fun res!470394 () Bool)

(assert (=> b!706430 (=> (not res!470394) (not e!397810))))

(assert (=> b!706430 (= res!470394 (noDuplicate!1175 acc!652))))

(declare-fun b!706431 () Bool)

(declare-fun res!470392 () Bool)

(assert (=> b!706431 (=> (not res!470392) (not e!397810))))

(declare-fun arrayNoDuplicates!0 (array!40296 (_ BitVec 32) List!13384) Bool)

(assert (=> b!706431 (= res!470392 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!470395 () Bool)

(assert (=> start!62606 (=> (not res!470395) (not e!397810))))

(assert (=> start!62606 (= res!470395 (and (bvslt (size!19686 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19686 a!3591))))))

(assert (=> start!62606 e!397810))

(assert (=> start!62606 true))

(declare-fun array_inv!15187 (array!40296) Bool)

(assert (=> start!62606 (array_inv!15187 a!3591)))

(declare-fun b!706427 () Bool)

(assert (=> b!706427 (= e!397810 false)))

(declare-fun lt!317709 () Bool)

(assert (=> b!706427 (= lt!317709 (contains!3906 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!62606 res!470395) b!706430))

(assert (= (and b!706430 res!470394) b!706420))

(assert (= (and b!706420 res!470393) b!706425))

(assert (= (and b!706425 res!470397) b!706421))

(assert (= (and b!706421 res!470391) b!706428))

(assert (= (and b!706428 res!470389) b!706424))

(assert (= (and b!706424 res!470399) b!706423))

(assert (= (and b!706423 res!470400) b!706431))

(assert (= (and b!706431 res!470392) b!706429))

(assert (= (and b!706429 res!470401) b!706419))

(assert (= (and b!706419 res!470390) b!706426))

(assert (= (and b!706426 res!470398) b!706422))

(assert (= (and b!706422 res!470396) b!706427))

(declare-fun m!663735 () Bool)

(assert (=> b!706421 m!663735))

(declare-fun m!663737 () Bool)

(assert (=> b!706428 m!663737))

(declare-fun m!663739 () Bool)

(assert (=> b!706431 m!663739))

(declare-fun m!663741 () Bool)

(assert (=> b!706429 m!663741))

(declare-fun m!663743 () Bool)

(assert (=> b!706423 m!663743))

(declare-fun m!663745 () Bool)

(assert (=> b!706420 m!663745))

(declare-fun m!663747 () Bool)

(assert (=> b!706426 m!663747))

(declare-fun m!663749 () Bool)

(assert (=> b!706425 m!663749))

(declare-fun m!663751 () Bool)

(assert (=> b!706430 m!663751))

(declare-fun m!663753 () Bool)

(assert (=> b!706422 m!663753))

(declare-fun m!663755 () Bool)

(assert (=> b!706419 m!663755))

(declare-fun m!663757 () Bool)

(assert (=> b!706424 m!663757))

(declare-fun m!663759 () Bool)

(assert (=> start!62606 m!663759))

(declare-fun m!663761 () Bool)

(assert (=> b!706427 m!663761))

(check-sat (not b!706422) (not b!706427) (not start!62606) (not b!706428) (not b!706425) (not b!706424) (not b!706430) (not b!706431) (not b!706421) (not b!706419) (not b!706420) (not b!706423) (not b!706429) (not b!706426))
(check-sat)
