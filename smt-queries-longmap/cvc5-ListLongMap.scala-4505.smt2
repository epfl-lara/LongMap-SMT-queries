; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62498 () Bool)

(assert start!62498)

(declare-fun b!703648 () Bool)

(declare-fun res!467465 () Bool)

(declare-fun e!397632 () Bool)

(assert (=> b!703648 (=> (not res!467465) (not e!397632))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40177 0))(
  ( (array!40178 (arr!19245 (Array (_ BitVec 32) (_ BitVec 64))) (size!19630 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40177)

(declare-fun arrayContainsKey!0 (array!40177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703648 (= res!467465 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703649 () Bool)

(declare-fun res!467473 () Bool)

(assert (=> b!703649 (=> (not res!467473) (not e!397632))))

(declare-datatypes ((List!13286 0))(
  ( (Nil!13283) (Cons!13282 (h!14327 (_ BitVec 64)) (t!19568 List!13286)) )
))
(declare-fun acc!652 () List!13286)

(declare-fun contains!3863 (List!13286 (_ BitVec 64)) Bool)

(assert (=> b!703649 (= res!467473 (not (contains!3863 acc!652 k!2824)))))

(declare-fun res!467464 () Bool)

(assert (=> start!62498 (=> (not res!467464) (not e!397632))))

(assert (=> start!62498 (= res!467464 (and (bvslt (size!19630 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19630 a!3591))))))

(assert (=> start!62498 e!397632))

(assert (=> start!62498 true))

(declare-fun array_inv!15041 (array!40177) Bool)

(assert (=> start!62498 (array_inv!15041 a!3591)))

(declare-fun b!703650 () Bool)

(declare-fun res!467471 () Bool)

(assert (=> b!703650 (=> (not res!467471) (not e!397632))))

(assert (=> b!703650 (= res!467471 (not (contains!3863 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703651 () Bool)

(declare-fun res!467460 () Bool)

(assert (=> b!703651 (=> (not res!467460) (not e!397632))))

(declare-fun newAcc!49 () List!13286)

(declare-fun -!273 (List!13286 (_ BitVec 64)) List!13286)

(assert (=> b!703651 (= res!467460 (= (-!273 newAcc!49 k!2824) acc!652))))

(declare-fun b!703652 () Bool)

(declare-fun res!467467 () Bool)

(assert (=> b!703652 (=> (not res!467467) (not e!397632))))

(declare-fun noDuplicate!1110 (List!13286) Bool)

(assert (=> b!703652 (= res!467467 (noDuplicate!1110 newAcc!49))))

(declare-fun b!703653 () Bool)

(declare-fun res!467475 () Bool)

(assert (=> b!703653 (=> (not res!467475) (not e!397632))))

(assert (=> b!703653 (= res!467475 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703654 () Bool)

(declare-fun res!467466 () Bool)

(assert (=> b!703654 (=> (not res!467466) (not e!397632))))

(assert (=> b!703654 (= res!467466 (not (contains!3863 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703655 () Bool)

(declare-fun res!467468 () Bool)

(assert (=> b!703655 (=> (not res!467468) (not e!397632))))

(assert (=> b!703655 (= res!467468 (not (contains!3863 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703656 () Bool)

(declare-fun res!467462 () Bool)

(assert (=> b!703656 (=> (not res!467462) (not e!397632))))

(assert (=> b!703656 (= res!467462 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19630 a!3591)))))

(declare-fun b!703657 () Bool)

(declare-fun res!467458 () Bool)

(assert (=> b!703657 (=> (not res!467458) (not e!397632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703657 (= res!467458 (not (validKeyInArray!0 (select (arr!19245 a!3591) from!2969))))))

(declare-fun b!703658 () Bool)

(declare-fun res!467469 () Bool)

(assert (=> b!703658 (=> (not res!467469) (not e!397632))))

(assert (=> b!703658 (= res!467469 (noDuplicate!1110 acc!652))))

(declare-fun b!703659 () Bool)

(declare-fun res!467470 () Bool)

(assert (=> b!703659 (=> (not res!467470) (not e!397632))))

(declare-fun arrayNoDuplicates!0 (array!40177 (_ BitVec 32) List!13286) Bool)

(assert (=> b!703659 (= res!467470 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703660 () Bool)

(declare-fun res!467472 () Bool)

(assert (=> b!703660 (=> (not res!467472) (not e!397632))))

(assert (=> b!703660 (= res!467472 (contains!3863 newAcc!49 k!2824))))

(declare-fun b!703661 () Bool)

(declare-fun res!467474 () Bool)

(assert (=> b!703661 (=> (not res!467474) (not e!397632))))

(assert (=> b!703661 (= res!467474 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703662 () Bool)

(assert (=> b!703662 (= e!397632 false)))

(declare-fun lt!317799 () Bool)

(assert (=> b!703662 (= lt!317799 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703663 () Bool)

(declare-fun res!467459 () Bool)

(assert (=> b!703663 (=> (not res!467459) (not e!397632))))

(declare-fun subseq!308 (List!13286 List!13286) Bool)

(assert (=> b!703663 (= res!467459 (subseq!308 acc!652 newAcc!49))))

(declare-fun b!703664 () Bool)

(declare-fun res!467461 () Bool)

(assert (=> b!703664 (=> (not res!467461) (not e!397632))))

(assert (=> b!703664 (= res!467461 (validKeyInArray!0 k!2824))))

(declare-fun b!703665 () Bool)

(declare-fun res!467463 () Bool)

(assert (=> b!703665 (=> (not res!467463) (not e!397632))))

(assert (=> b!703665 (= res!467463 (not (contains!3863 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62498 res!467464) b!703658))

(assert (= (and b!703658 res!467469) b!703652))

(assert (= (and b!703652 res!467467) b!703650))

(assert (= (and b!703650 res!467471) b!703655))

(assert (= (and b!703655 res!467468) b!703648))

(assert (= (and b!703648 res!467465) b!703649))

(assert (= (and b!703649 res!467473) b!703664))

(assert (= (and b!703664 res!467461) b!703659))

(assert (= (and b!703659 res!467470) b!703663))

(assert (= (and b!703663 res!467459) b!703660))

(assert (= (and b!703660 res!467472) b!703651))

(assert (= (and b!703651 res!467460) b!703654))

(assert (= (and b!703654 res!467466) b!703665))

(assert (= (and b!703665 res!467463) b!703656))

(assert (= (and b!703656 res!467462) b!703657))

(assert (= (and b!703657 res!467458) b!703653))

(assert (= (and b!703653 res!467475) b!703661))

(assert (= (and b!703661 res!467474) b!703662))

(declare-fun m!662407 () Bool)

(assert (=> b!703660 m!662407))

(declare-fun m!662409 () Bool)

(assert (=> b!703648 m!662409))

(declare-fun m!662411 () Bool)

(assert (=> b!703665 m!662411))

(declare-fun m!662413 () Bool)

(assert (=> b!703651 m!662413))

(declare-fun m!662415 () Bool)

(assert (=> b!703658 m!662415))

(declare-fun m!662417 () Bool)

(assert (=> start!62498 m!662417))

(declare-fun m!662419 () Bool)

(assert (=> b!703655 m!662419))

(declare-fun m!662421 () Bool)

(assert (=> b!703659 m!662421))

(declare-fun m!662423 () Bool)

(assert (=> b!703652 m!662423))

(declare-fun m!662425 () Bool)

(assert (=> b!703654 m!662425))

(declare-fun m!662427 () Bool)

(assert (=> b!703661 m!662427))

(declare-fun m!662429 () Bool)

(assert (=> b!703664 m!662429))

(declare-fun m!662431 () Bool)

(assert (=> b!703662 m!662431))

(declare-fun m!662433 () Bool)

(assert (=> b!703649 m!662433))

(declare-fun m!662435 () Bool)

(assert (=> b!703657 m!662435))

(assert (=> b!703657 m!662435))

(declare-fun m!662437 () Bool)

(assert (=> b!703657 m!662437))

(declare-fun m!662439 () Bool)

(assert (=> b!703650 m!662439))

(declare-fun m!662441 () Bool)

(assert (=> b!703663 m!662441))

(push 1)

(assert (not b!703649))

(assert (not b!703654))

(assert (not b!703664))

(assert (not b!703648))

(assert (not b!703661))

(assert (not b!703658))

(assert (not b!703652))

(assert (not b!703662))

(assert (not b!703657))

(assert (not start!62498))

(assert (not b!703665))

(assert (not b!703659))

(assert (not b!703651))

(assert (not b!703655))

(assert (not b!703650))

(assert (not b!703663))

(assert (not b!703660))

(check-sat)

(pop 1)

