; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62606 () Bool)

(assert start!62606)

(declare-fun b!706464 () Bool)

(declare-fun res!470284 () Bool)

(declare-fun e!397957 () Bool)

(assert (=> b!706464 (=> (not res!470284) (not e!397957))))

(declare-datatypes ((List!13340 0))(
  ( (Nil!13337) (Cons!13336 (h!14381 (_ BitVec 64)) (t!19622 List!13340)) )
))
(declare-fun newAcc!49 () List!13340)

(declare-fun noDuplicate!1164 (List!13340) Bool)

(assert (=> b!706464 (= res!470284 (noDuplicate!1164 newAcc!49))))

(declare-fun b!706465 () Bool)

(declare-fun res!470275 () Bool)

(assert (=> b!706465 (=> (not res!470275) (not e!397957))))

(declare-fun acc!652 () List!13340)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3917 (List!13340 (_ BitVec 64)) Bool)

(assert (=> b!706465 (= res!470275 (not (contains!3917 acc!652 k!2824)))))

(declare-fun b!706466 () Bool)

(declare-fun res!470274 () Bool)

(assert (=> b!706466 (=> (not res!470274) (not e!397957))))

(declare-datatypes ((array!40285 0))(
  ( (array!40286 (arr!19299 (Array (_ BitVec 32) (_ BitVec 64))) (size!19684 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40285)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40285 (_ BitVec 32) List!13340) Bool)

(assert (=> b!706466 (= res!470274 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706467 () Bool)

(declare-fun res!470283 () Bool)

(assert (=> b!706467 (=> (not res!470283) (not e!397957))))

(declare-fun subseq!362 (List!13340 List!13340) Bool)

(assert (=> b!706467 (= res!470283 (subseq!362 acc!652 newAcc!49))))

(declare-fun b!706468 () Bool)

(declare-fun res!470278 () Bool)

(assert (=> b!706468 (=> (not res!470278) (not e!397957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706468 (= res!470278 (validKeyInArray!0 k!2824))))

(declare-fun b!706469 () Bool)

(declare-fun res!470279 () Bool)

(assert (=> b!706469 (=> (not res!470279) (not e!397957))))

(declare-fun arrayContainsKey!0 (array!40285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706469 (= res!470279 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706470 () Bool)

(declare-fun res!470280 () Bool)

(assert (=> b!706470 (=> (not res!470280) (not e!397957))))

(assert (=> b!706470 (= res!470280 (not (contains!3917 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706471 () Bool)

(declare-fun res!470281 () Bool)

(assert (=> b!706471 (=> (not res!470281) (not e!397957))))

(assert (=> b!706471 (= res!470281 (not (contains!3917 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706472 () Bool)

(declare-fun res!470286 () Bool)

(assert (=> b!706472 (=> (not res!470286) (not e!397957))))

(assert (=> b!706472 (= res!470286 (noDuplicate!1164 acc!652))))

(declare-fun res!470282 () Bool)

(assert (=> start!62606 (=> (not res!470282) (not e!397957))))

(assert (=> start!62606 (= res!470282 (and (bvslt (size!19684 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19684 a!3591))))))

(assert (=> start!62606 e!397957))

(assert (=> start!62606 true))

(declare-fun array_inv!15095 (array!40285) Bool)

(assert (=> start!62606 (array_inv!15095 a!3591)))

(declare-fun b!706473 () Bool)

(declare-fun res!470277 () Bool)

(assert (=> b!706473 (=> (not res!470277) (not e!397957))))

(declare-fun -!327 (List!13340 (_ BitVec 64)) List!13340)

(assert (=> b!706473 (= res!470277 (= (-!327 newAcc!49 k!2824) acc!652))))

(declare-fun b!706474 () Bool)

(assert (=> b!706474 (= e!397957 false)))

(declare-fun lt!317952 () Bool)

(assert (=> b!706474 (= lt!317952 (contains!3917 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706475 () Bool)

(declare-fun res!470285 () Bool)

(assert (=> b!706475 (=> (not res!470285) (not e!397957))))

(assert (=> b!706475 (= res!470285 (contains!3917 newAcc!49 k!2824))))

(declare-fun b!706476 () Bool)

(declare-fun res!470276 () Bool)

(assert (=> b!706476 (=> (not res!470276) (not e!397957))))

(assert (=> b!706476 (= res!470276 (not (contains!3917 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62606 res!470282) b!706472))

(assert (= (and b!706472 res!470286) b!706464))

(assert (= (and b!706464 res!470284) b!706476))

(assert (= (and b!706476 res!470276) b!706470))

(assert (= (and b!706470 res!470280) b!706469))

(assert (= (and b!706469 res!470279) b!706465))

(assert (= (and b!706465 res!470275) b!706468))

(assert (= (and b!706468 res!470278) b!706466))

(assert (= (and b!706466 res!470274) b!706467))

(assert (= (and b!706467 res!470283) b!706475))

(assert (= (and b!706475 res!470285) b!706473))

(assert (= (and b!706473 res!470277) b!706471))

(assert (= (and b!706471 res!470281) b!706474))

(declare-fun m!664327 () Bool)

(assert (=> b!706476 m!664327))

(declare-fun m!664329 () Bool)

(assert (=> b!706470 m!664329))

(declare-fun m!664331 () Bool)

(assert (=> b!706469 m!664331))

(declare-fun m!664333 () Bool)

(assert (=> b!706475 m!664333))

(declare-fun m!664335 () Bool)

(assert (=> b!706473 m!664335))

(declare-fun m!664337 () Bool)

(assert (=> b!706474 m!664337))

(declare-fun m!664339 () Bool)

(assert (=> b!706471 m!664339))

(declare-fun m!664341 () Bool)

(assert (=> b!706465 m!664341))

(declare-fun m!664343 () Bool)

(assert (=> b!706467 m!664343))

(declare-fun m!664345 () Bool)

(assert (=> start!62606 m!664345))

(declare-fun m!664347 () Bool)

(assert (=> b!706464 m!664347))

(declare-fun m!664349 () Bool)

(assert (=> b!706468 m!664349))

(declare-fun m!664351 () Bool)

(assert (=> b!706466 m!664351))

(declare-fun m!664353 () Bool)

(assert (=> b!706472 m!664353))

(push 1)

(assert (not b!706474))

(assert (not b!706466))

(assert (not b!706470))

(assert (not b!706468))

(assert (not b!706471))

(assert (not b!706473))

(assert (not b!706472))

(assert (not b!706469))

(assert (not start!62606))

(assert (not b!706475))

(assert (not b!706464))

(assert (not b!706467))

(assert (not b!706465))

(assert (not b!706476))

(check-sat)

(pop 1)

