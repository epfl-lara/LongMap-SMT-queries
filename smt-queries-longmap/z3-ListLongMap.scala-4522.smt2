; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62656 () Bool)

(assert start!62656)

(declare-fun b!706540 () Bool)

(declare-fun res!470254 () Bool)

(declare-fun e!398055 () Bool)

(assert (=> b!706540 (=> (not res!470254) (not e!398055))))

(declare-datatypes ((List!13239 0))(
  ( (Nil!13236) (Cons!13235 (h!14283 (_ BitVec 64)) (t!19513 List!13239)) )
))
(declare-fun newAcc!49 () List!13239)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3891 (List!13239 (_ BitVec 64)) Bool)

(assert (=> b!706540 (= res!470254 (contains!3891 newAcc!49 k0!2824))))

(declare-fun b!706541 () Bool)

(declare-fun res!470261 () Bool)

(assert (=> b!706541 (=> (not res!470261) (not e!398055))))

(declare-datatypes ((array!40275 0))(
  ( (array!40276 (arr!19291 (Array (_ BitVec 32) (_ BitVec 64))) (size!19674 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40275)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706541 (= res!470261 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706542 () Bool)

(declare-fun res!470259 () Bool)

(assert (=> b!706542 (=> (not res!470259) (not e!398055))))

(declare-fun acc!652 () List!13239)

(declare-fun subseq!359 (List!13239 List!13239) Bool)

(assert (=> b!706542 (= res!470259 (subseq!359 acc!652 newAcc!49))))

(declare-fun res!470263 () Bool)

(assert (=> start!62656 (=> (not res!470263) (not e!398055))))

(assert (=> start!62656 (= res!470263 (and (bvslt (size!19674 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19674 a!3591))))))

(assert (=> start!62656 e!398055))

(assert (=> start!62656 true))

(declare-fun array_inv!15150 (array!40275) Bool)

(assert (=> start!62656 (array_inv!15150 a!3591)))

(declare-fun b!706543 () Bool)

(declare-fun res!470252 () Bool)

(assert (=> b!706543 (=> (not res!470252) (not e!398055))))

(declare-fun noDuplicate!1165 (List!13239) Bool)

(assert (=> b!706543 (= res!470252 (noDuplicate!1165 newAcc!49))))

(declare-fun b!706544 () Bool)

(assert (=> b!706544 (= e!398055 false)))

(declare-fun lt!318042 () Bool)

(assert (=> b!706544 (= lt!318042 (contains!3891 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706545 () Bool)

(declare-fun res!470256 () Bool)

(assert (=> b!706545 (=> (not res!470256) (not e!398055))))

(declare-fun arrayNoDuplicates!0 (array!40275 (_ BitVec 32) List!13239) Bool)

(assert (=> b!706545 (= res!470256 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706546 () Bool)

(declare-fun res!470257 () Bool)

(assert (=> b!706546 (=> (not res!470257) (not e!398055))))

(assert (=> b!706546 (= res!470257 (not (contains!3891 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706547 () Bool)

(declare-fun res!470251 () Bool)

(assert (=> b!706547 (=> (not res!470251) (not e!398055))))

(assert (=> b!706547 (= res!470251 (not (contains!3891 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706548 () Bool)

(declare-fun res!470260 () Bool)

(assert (=> b!706548 (=> (not res!470260) (not e!398055))))

(assert (=> b!706548 (= res!470260 (not (contains!3891 acc!652 k0!2824)))))

(declare-fun b!706549 () Bool)

(declare-fun res!470258 () Bool)

(assert (=> b!706549 (=> (not res!470258) (not e!398055))))

(assert (=> b!706549 (= res!470258 (noDuplicate!1165 acc!652))))

(declare-fun b!706550 () Bool)

(declare-fun res!470253 () Bool)

(assert (=> b!706550 (=> (not res!470253) (not e!398055))))

(declare-fun -!323 (List!13239 (_ BitVec 64)) List!13239)

(assert (=> b!706550 (= res!470253 (= (-!323 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706551 () Bool)

(declare-fun res!470262 () Bool)

(assert (=> b!706551 (=> (not res!470262) (not e!398055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706551 (= res!470262 (validKeyInArray!0 k0!2824))))

(declare-fun b!706552 () Bool)

(declare-fun res!470255 () Bool)

(assert (=> b!706552 (=> (not res!470255) (not e!398055))))

(assert (=> b!706552 (= res!470255 (not (contains!3891 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62656 res!470263) b!706549))

(assert (= (and b!706549 res!470258) b!706543))

(assert (= (and b!706543 res!470252) b!706546))

(assert (= (and b!706546 res!470257) b!706552))

(assert (= (and b!706552 res!470255) b!706541))

(assert (= (and b!706541 res!470261) b!706548))

(assert (= (and b!706548 res!470260) b!706551))

(assert (= (and b!706551 res!470262) b!706545))

(assert (= (and b!706545 res!470256) b!706542))

(assert (= (and b!706542 res!470259) b!706540))

(assert (= (and b!706540 res!470254) b!706550))

(assert (= (and b!706550 res!470253) b!706547))

(assert (= (and b!706547 res!470251) b!706544))

(declare-fun m!664899 () Bool)

(assert (=> b!706552 m!664899))

(declare-fun m!664901 () Bool)

(assert (=> b!706549 m!664901))

(declare-fun m!664903 () Bool)

(assert (=> b!706551 m!664903))

(declare-fun m!664905 () Bool)

(assert (=> b!706542 m!664905))

(declare-fun m!664907 () Bool)

(assert (=> start!62656 m!664907))

(declare-fun m!664909 () Bool)

(assert (=> b!706540 m!664909))

(declare-fun m!664911 () Bool)

(assert (=> b!706548 m!664911))

(declare-fun m!664913 () Bool)

(assert (=> b!706546 m!664913))

(declare-fun m!664915 () Bool)

(assert (=> b!706545 m!664915))

(declare-fun m!664917 () Bool)

(assert (=> b!706541 m!664917))

(declare-fun m!664919 () Bool)

(assert (=> b!706544 m!664919))

(declare-fun m!664921 () Bool)

(assert (=> b!706550 m!664921))

(declare-fun m!664923 () Bool)

(assert (=> b!706547 m!664923))

(declare-fun m!664925 () Bool)

(assert (=> b!706543 m!664925))

(check-sat (not b!706549) (not b!706552) (not b!706544) (not b!706546) (not b!706542) (not start!62656) (not b!706550) (not b!706541) (not b!706540) (not b!706545) (not b!706543) (not b!706548) (not b!706547) (not b!706551))
(check-sat)
