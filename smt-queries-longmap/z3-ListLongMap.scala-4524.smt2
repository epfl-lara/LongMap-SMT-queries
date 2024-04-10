; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62614 () Bool)

(assert start!62614)

(declare-fun res!470437 () Bool)

(declare-fun e!397981 () Bool)

(assert (=> start!62614 (=> (not res!470437) (not e!397981))))

(declare-datatypes ((array!40293 0))(
  ( (array!40294 (arr!19303 (Array (_ BitVec 32) (_ BitVec 64))) (size!19688 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40293)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62614 (= res!470437 (and (bvslt (size!19688 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19688 a!3591))))))

(assert (=> start!62614 e!397981))

(assert (=> start!62614 true))

(declare-fun array_inv!15099 (array!40293) Bool)

(assert (=> start!62614 (array_inv!15099 a!3591)))

(declare-fun b!706625 () Bool)

(declare-fun res!470436 () Bool)

(assert (=> b!706625 (=> (not res!470436) (not e!397981))))

(declare-datatypes ((List!13344 0))(
  ( (Nil!13341) (Cons!13340 (h!14385 (_ BitVec 64)) (t!19626 List!13344)) )
))
(declare-fun newAcc!49 () List!13344)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3921 (List!13344 (_ BitVec 64)) Bool)

(assert (=> b!706625 (= res!470436 (contains!3921 newAcc!49 k0!2824))))

(declare-fun b!706626 () Bool)

(declare-fun res!470444 () Bool)

(assert (=> b!706626 (=> (not res!470444) (not e!397981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706626 (= res!470444 (validKeyInArray!0 k0!2824))))

(declare-fun b!706627 () Bool)

(declare-fun res!470439 () Bool)

(assert (=> b!706627 (=> (not res!470439) (not e!397981))))

(declare-fun acc!652 () List!13344)

(declare-fun arrayNoDuplicates!0 (array!40293 (_ BitVec 32) List!13344) Bool)

(assert (=> b!706627 (= res!470439 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706628 () Bool)

(declare-fun res!470446 () Bool)

(assert (=> b!706628 (=> (not res!470446) (not e!397981))))

(declare-fun -!331 (List!13344 (_ BitVec 64)) List!13344)

(assert (=> b!706628 (= res!470446 (= (-!331 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706629 () Bool)

(declare-fun res!470447 () Bool)

(assert (=> b!706629 (=> (not res!470447) (not e!397981))))

(declare-fun noDuplicate!1168 (List!13344) Bool)

(assert (=> b!706629 (= res!470447 (noDuplicate!1168 newAcc!49))))

(declare-fun b!706630 () Bool)

(declare-fun res!470442 () Bool)

(assert (=> b!706630 (=> (not res!470442) (not e!397981))))

(assert (=> b!706630 (= res!470442 (noDuplicate!1168 acc!652))))

(declare-fun b!706631 () Bool)

(declare-fun res!470435 () Bool)

(assert (=> b!706631 (=> (not res!470435) (not e!397981))))

(assert (=> b!706631 (= res!470435 (not (contains!3921 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706632 () Bool)

(declare-fun res!470443 () Bool)

(assert (=> b!706632 (=> (not res!470443) (not e!397981))))

(declare-fun subseq!366 (List!13344 List!13344) Bool)

(assert (=> b!706632 (= res!470443 (subseq!366 acc!652 newAcc!49))))

(declare-fun b!706633 () Bool)

(declare-fun res!470448 () Bool)

(assert (=> b!706633 (=> (not res!470448) (not e!397981))))

(assert (=> b!706633 (= res!470448 (not (contains!3921 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706634 () Bool)

(declare-fun res!470441 () Bool)

(assert (=> b!706634 (=> (not res!470441) (not e!397981))))

(assert (=> b!706634 (= res!470441 (not (contains!3921 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706635 () Bool)

(declare-fun res!470440 () Bool)

(assert (=> b!706635 (=> (not res!470440) (not e!397981))))

(declare-fun arrayContainsKey!0 (array!40293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706635 (= res!470440 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706636 () Bool)

(declare-fun res!470445 () Bool)

(assert (=> b!706636 (=> (not res!470445) (not e!397981))))

(assert (=> b!706636 (= res!470445 (not (contains!3921 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706637 () Bool)

(declare-fun res!470438 () Bool)

(assert (=> b!706637 (=> (not res!470438) (not e!397981))))

(assert (=> b!706637 (= res!470438 (not (contains!3921 acc!652 k0!2824)))))

(declare-fun b!706638 () Bool)

(assert (=> b!706638 (= e!397981 (bvslt (bvsub (size!19688 a!3591) from!2969) #b00000000000000000000000000000000))))

(assert (= (and start!62614 res!470437) b!706630))

(assert (= (and b!706630 res!470442) b!706629))

(assert (= (and b!706629 res!470447) b!706633))

(assert (= (and b!706633 res!470448) b!706631))

(assert (= (and b!706631 res!470435) b!706635))

(assert (= (and b!706635 res!470440) b!706637))

(assert (= (and b!706637 res!470438) b!706626))

(assert (= (and b!706626 res!470444) b!706627))

(assert (= (and b!706627 res!470439) b!706632))

(assert (= (and b!706632 res!470443) b!706625))

(assert (= (and b!706625 res!470436) b!706628))

(assert (= (and b!706628 res!470446) b!706636))

(assert (= (and b!706636 res!470445) b!706634))

(assert (= (and b!706634 res!470441) b!706638))

(declare-fun m!664439 () Bool)

(assert (=> b!706626 m!664439))

(declare-fun m!664441 () Bool)

(assert (=> b!706635 m!664441))

(declare-fun m!664443 () Bool)

(assert (=> b!706629 m!664443))

(declare-fun m!664445 () Bool)

(assert (=> b!706636 m!664445))

(declare-fun m!664447 () Bool)

(assert (=> b!706637 m!664447))

(declare-fun m!664449 () Bool)

(assert (=> b!706627 m!664449))

(declare-fun m!664451 () Bool)

(assert (=> start!62614 m!664451))

(declare-fun m!664453 () Bool)

(assert (=> b!706632 m!664453))

(declare-fun m!664455 () Bool)

(assert (=> b!706633 m!664455))

(declare-fun m!664457 () Bool)

(assert (=> b!706625 m!664457))

(declare-fun m!664459 () Bool)

(assert (=> b!706630 m!664459))

(declare-fun m!664461 () Bool)

(assert (=> b!706628 m!664461))

(declare-fun m!664463 () Bool)

(assert (=> b!706634 m!664463))

(declare-fun m!664465 () Bool)

(assert (=> b!706631 m!664465))

(check-sat (not b!706625) (not b!706629) (not b!706636) (not b!706631) (not b!706626) (not b!706627) (not b!706634) (not b!706630) (not b!706632) (not b!706637) (not b!706635) (not b!706633) (not b!706628) (not start!62614))
(check-sat)
