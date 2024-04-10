; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62610 () Bool)

(assert start!62610)

(declare-fun b!706542 () Bool)

(declare-fun res!470362 () Bool)

(declare-fun e!397968 () Bool)

(assert (=> b!706542 (=> (not res!470362) (not e!397968))))

(declare-datatypes ((List!13342 0))(
  ( (Nil!13339) (Cons!13338 (h!14383 (_ BitVec 64)) (t!19624 List!13342)) )
))
(declare-fun newAcc!49 () List!13342)

(declare-fun noDuplicate!1166 (List!13342) Bool)

(assert (=> b!706542 (= res!470362 (noDuplicate!1166 newAcc!49))))

(declare-fun b!706543 () Bool)

(declare-fun res!470361 () Bool)

(assert (=> b!706543 (=> (not res!470361) (not e!397968))))

(declare-fun acc!652 () List!13342)

(declare-fun contains!3919 (List!13342 (_ BitVec 64)) Bool)

(assert (=> b!706543 (= res!470361 (not (contains!3919 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706544 () Bool)

(declare-fun res!470358 () Bool)

(assert (=> b!706544 (=> (not res!470358) (not e!397968))))

(assert (=> b!706544 (= res!470358 (not (contains!3919 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706545 () Bool)

(declare-fun res!470364 () Bool)

(assert (=> b!706545 (=> (not res!470364) (not e!397968))))

(declare-datatypes ((array!40289 0))(
  ( (array!40290 (arr!19301 (Array (_ BitVec 32) (_ BitVec 64))) (size!19686 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40289)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40289 (_ BitVec 32) List!13342) Bool)

(assert (=> b!706545 (= res!470364 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706546 () Bool)

(declare-fun res!470359 () Bool)

(assert (=> b!706546 (=> (not res!470359) (not e!397968))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706546 (= res!470359 (validKeyInArray!0 k!2824))))

(declare-fun b!706547 () Bool)

(declare-fun res!470360 () Bool)

(assert (=> b!706547 (=> (not res!470360) (not e!397968))))

(declare-fun arrayContainsKey!0 (array!40289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706547 (= res!470360 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706549 () Bool)

(declare-fun res!470355 () Bool)

(assert (=> b!706549 (=> (not res!470355) (not e!397968))))

(assert (=> b!706549 (= res!470355 (not (contains!3919 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706550 () Bool)

(declare-fun res!470353 () Bool)

(assert (=> b!706550 (=> (not res!470353) (not e!397968))))

(assert (=> b!706550 (= res!470353 (contains!3919 newAcc!49 k!2824))))

(declare-fun b!706551 () Bool)

(declare-fun res!470357 () Bool)

(assert (=> b!706551 (=> (not res!470357) (not e!397968))))

(assert (=> b!706551 (= res!470357 (noDuplicate!1166 acc!652))))

(declare-fun b!706552 () Bool)

(declare-fun res!470354 () Bool)

(assert (=> b!706552 (=> (not res!470354) (not e!397968))))

(declare-fun subseq!364 (List!13342 List!13342) Bool)

(assert (=> b!706552 (= res!470354 (subseq!364 acc!652 newAcc!49))))

(declare-fun b!706553 () Bool)

(declare-fun res!470356 () Bool)

(assert (=> b!706553 (=> (not res!470356) (not e!397968))))

(assert (=> b!706553 (= res!470356 (not (contains!3919 acc!652 k!2824)))))

(declare-fun b!706554 () Bool)

(declare-fun res!470352 () Bool)

(assert (=> b!706554 (=> (not res!470352) (not e!397968))))

(declare-fun -!329 (List!13342 (_ BitVec 64)) List!13342)

(assert (=> b!706554 (= res!470352 (= (-!329 newAcc!49 k!2824) acc!652))))

(declare-fun b!706548 () Bool)

(assert (=> b!706548 (= e!397968 false)))

(declare-fun lt!317958 () Bool)

(assert (=> b!706548 (= lt!317958 (contains!3919 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!470363 () Bool)

(assert (=> start!62610 (=> (not res!470363) (not e!397968))))

(assert (=> start!62610 (= res!470363 (and (bvslt (size!19686 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19686 a!3591))))))

(assert (=> start!62610 e!397968))

(assert (=> start!62610 true))

(declare-fun array_inv!15097 (array!40289) Bool)

(assert (=> start!62610 (array_inv!15097 a!3591)))

(assert (= (and start!62610 res!470363) b!706551))

(assert (= (and b!706551 res!470357) b!706542))

(assert (= (and b!706542 res!470362) b!706544))

(assert (= (and b!706544 res!470358) b!706543))

(assert (= (and b!706543 res!470361) b!706547))

(assert (= (and b!706547 res!470360) b!706553))

(assert (= (and b!706553 res!470356) b!706546))

(assert (= (and b!706546 res!470359) b!706545))

(assert (= (and b!706545 res!470364) b!706552))

(assert (= (and b!706552 res!470354) b!706550))

(assert (= (and b!706550 res!470353) b!706554))

(assert (= (and b!706554 res!470352) b!706549))

(assert (= (and b!706549 res!470355) b!706548))

(declare-fun m!664383 () Bool)

(assert (=> b!706553 m!664383))

(declare-fun m!664385 () Bool)

(assert (=> b!706543 m!664385))

(declare-fun m!664387 () Bool)

(assert (=> b!706551 m!664387))

(declare-fun m!664389 () Bool)

(assert (=> b!706548 m!664389))

(declare-fun m!664391 () Bool)

(assert (=> b!706549 m!664391))

(declare-fun m!664393 () Bool)

(assert (=> b!706546 m!664393))

(declare-fun m!664395 () Bool)

(assert (=> b!706544 m!664395))

(declare-fun m!664397 () Bool)

(assert (=> b!706547 m!664397))

(declare-fun m!664399 () Bool)

(assert (=> b!706545 m!664399))

(declare-fun m!664401 () Bool)

(assert (=> b!706552 m!664401))

(declare-fun m!664403 () Bool)

(assert (=> b!706554 m!664403))

(declare-fun m!664405 () Bool)

(assert (=> b!706550 m!664405))

(declare-fun m!664407 () Bool)

(assert (=> start!62610 m!664407))

(declare-fun m!664409 () Bool)

(assert (=> b!706542 m!664409))

(push 1)

(assert (not b!706546))

(assert (not b!706543))

(assert (not b!706548))

(assert (not b!706549))

(assert (not start!62610))

(assert (not b!706542))

(assert (not b!706552))

(assert (not b!706547))

(assert (not b!706545))

(assert (not b!706553))

(assert (not b!706550))

(assert (not b!706554))

(assert (not b!706544))

(assert (not b!706551))

(check-sat)

