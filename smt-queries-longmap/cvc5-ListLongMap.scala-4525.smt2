; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62618 () Bool)

(assert start!62618)

(declare-fun b!706707 () Bool)

(declare-fun res!470525 () Bool)

(declare-fun e!397993 () Bool)

(assert (=> b!706707 (=> (not res!470525) (not e!397993))))

(declare-datatypes ((List!13346 0))(
  ( (Nil!13343) (Cons!13342 (h!14387 (_ BitVec 64)) (t!19628 List!13346)) )
))
(declare-fun acc!652 () List!13346)

(declare-fun contains!3923 (List!13346 (_ BitVec 64)) Bool)

(assert (=> b!706707 (= res!470525 (not (contains!3923 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706708 () Bool)

(declare-fun res!470520 () Bool)

(assert (=> b!706708 (=> (not res!470520) (not e!397993))))

(declare-fun newAcc!49 () List!13346)

(declare-fun subseq!368 (List!13346 List!13346) Bool)

(assert (=> b!706708 (= res!470520 (subseq!368 acc!652 newAcc!49))))

(declare-fun b!706709 () Bool)

(declare-fun res!470517 () Bool)

(assert (=> b!706709 (=> (not res!470517) (not e!397993))))

(declare-datatypes ((array!40297 0))(
  ( (array!40298 (arr!19305 (Array (_ BitVec 32) (_ BitVec 64))) (size!19690 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40297)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40297 (_ BitVec 32) List!13346) Bool)

(assert (=> b!706709 (= res!470517 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706710 () Bool)

(declare-fun res!470524 () Bool)

(assert (=> b!706710 (=> (not res!470524) (not e!397993))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!706710 (= res!470524 (contains!3923 newAcc!49 k!2824))))

(declare-fun b!706711 () Bool)

(declare-fun res!470522 () Bool)

(assert (=> b!706711 (=> (not res!470522) (not e!397993))))

(assert (=> b!706711 (= res!470522 (not (contains!3923 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706712 () Bool)

(declare-fun res!470529 () Bool)

(assert (=> b!706712 (=> (not res!470529) (not e!397993))))

(declare-fun noDuplicate!1170 (List!13346) Bool)

(assert (=> b!706712 (= res!470529 (noDuplicate!1170 acc!652))))

(declare-fun b!706713 () Bool)

(declare-fun res!470528 () Bool)

(assert (=> b!706713 (=> (not res!470528) (not e!397993))))

(assert (=> b!706713 (= res!470528 (noDuplicate!1170 newAcc!49))))

(declare-fun res!470518 () Bool)

(assert (=> start!62618 (=> (not res!470518) (not e!397993))))

(assert (=> start!62618 (= res!470518 (and (bvslt (size!19690 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19690 a!3591))))))

(assert (=> start!62618 e!397993))

(assert (=> start!62618 true))

(declare-fun array_inv!15101 (array!40297) Bool)

(assert (=> start!62618 (array_inv!15101 a!3591)))

(declare-fun b!706714 () Bool)

(declare-fun res!470526 () Bool)

(assert (=> b!706714 (=> (not res!470526) (not e!397993))))

(declare-fun -!333 (List!13346 (_ BitVec 64)) List!13346)

(assert (=> b!706714 (= res!470526 (= (-!333 newAcc!49 k!2824) acc!652))))

(declare-fun b!706715 () Bool)

(declare-fun res!470527 () Bool)

(assert (=> b!706715 (=> (not res!470527) (not e!397993))))

(assert (=> b!706715 (= res!470527 (not (contains!3923 acc!652 k!2824)))))

(declare-fun b!706716 () Bool)

(declare-fun res!470523 () Bool)

(assert (=> b!706716 (=> (not res!470523) (not e!397993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706716 (= res!470523 (validKeyInArray!0 k!2824))))

(declare-fun b!706717 () Bool)

(declare-fun res!470521 () Bool)

(assert (=> b!706717 (=> (not res!470521) (not e!397993))))

(assert (=> b!706717 (= res!470521 (not (contains!3923 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706718 () Bool)

(declare-fun res!470519 () Bool)

(assert (=> b!706718 (=> (not res!470519) (not e!397993))))

(declare-fun arrayContainsKey!0 (array!40297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706718 (= res!470519 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706719 () Bool)

(assert (=> b!706719 (= e!397993 false)))

(declare-fun lt!317961 () Bool)

(assert (=> b!706719 (= lt!317961 (contains!3923 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!62618 res!470518) b!706712))

(assert (= (and b!706712 res!470529) b!706713))

(assert (= (and b!706713 res!470528) b!706707))

(assert (= (and b!706707 res!470525) b!706711))

(assert (= (and b!706711 res!470522) b!706718))

(assert (= (and b!706718 res!470519) b!706715))

(assert (= (and b!706715 res!470527) b!706716))

(assert (= (and b!706716 res!470523) b!706709))

(assert (= (and b!706709 res!470517) b!706708))

(assert (= (and b!706708 res!470520) b!706710))

(assert (= (and b!706710 res!470524) b!706714))

(assert (= (and b!706714 res!470526) b!706717))

(assert (= (and b!706717 res!470521) b!706719))

(declare-fun m!664495 () Bool)

(assert (=> b!706713 m!664495))

(declare-fun m!664497 () Bool)

(assert (=> b!706708 m!664497))

(declare-fun m!664499 () Bool)

(assert (=> b!706709 m!664499))

(declare-fun m!664501 () Bool)

(assert (=> b!706710 m!664501))

(declare-fun m!664503 () Bool)

(assert (=> b!706707 m!664503))

(declare-fun m!664505 () Bool)

(assert (=> b!706716 m!664505))

(declare-fun m!664507 () Bool)

(assert (=> b!706711 m!664507))

(declare-fun m!664509 () Bool)

(assert (=> b!706719 m!664509))

(declare-fun m!664511 () Bool)

(assert (=> b!706712 m!664511))

(declare-fun m!664513 () Bool)

(assert (=> b!706714 m!664513))

(declare-fun m!664515 () Bool)

(assert (=> b!706717 m!664515))

(declare-fun m!664517 () Bool)

(assert (=> b!706718 m!664517))

(declare-fun m!664519 () Bool)

(assert (=> b!706715 m!664519))

(declare-fun m!664521 () Bool)

(assert (=> start!62618 m!664521))

(push 1)

(assert (not b!706707))

(assert (not b!706718))

(assert (not b!706714))

(assert (not start!62618))

(assert (not b!706709))

(assert (not b!706719))

(assert (not b!706715))

(assert (not b!706708))

(assert (not b!706713))

(assert (not b!706717))

(assert (not b!706712))

(assert (not b!706711))

(assert (not b!706716))

(assert (not b!706710))

(check-sat)

