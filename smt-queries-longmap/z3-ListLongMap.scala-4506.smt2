; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62492 () Bool)

(assert start!62492)

(declare-fun b!703522 () Bool)

(declare-fun res!467499 () Bool)

(declare-fun e!397469 () Bool)

(assert (=> b!703522 (=> (not res!467499) (not e!397469))))

(declare-datatypes ((array!40182 0))(
  ( (array!40183 (arr!19247 (Array (_ BitVec 32) (_ BitVec 64))) (size!19629 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40182)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13327 0))(
  ( (Nil!13324) (Cons!13323 (h!14368 (_ BitVec 64)) (t!19600 List!13327)) )
))
(declare-fun acc!652 () List!13327)

(declare-fun arrayNoDuplicates!0 (array!40182 (_ BitVec 32) List!13327) Bool)

(assert (=> b!703522 (= res!467499 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703523 () Bool)

(declare-fun res!467501 () Bool)

(assert (=> b!703523 (=> (not res!467501) (not e!397469))))

(declare-fun contains!3849 (List!13327 (_ BitVec 64)) Bool)

(assert (=> b!703523 (= res!467501 (not (contains!3849 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703524 () Bool)

(declare-fun res!467493 () Bool)

(assert (=> b!703524 (=> (not res!467493) (not e!397469))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703524 (= res!467493 (validKeyInArray!0 k0!2824))))

(declare-fun res!467494 () Bool)

(assert (=> start!62492 (=> (not res!467494) (not e!397469))))

(assert (=> start!62492 (= res!467494 (and (bvslt (size!19629 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19629 a!3591))))))

(assert (=> start!62492 e!397469))

(assert (=> start!62492 true))

(declare-fun array_inv!15130 (array!40182) Bool)

(assert (=> start!62492 (array_inv!15130 a!3591)))

(declare-fun b!703525 () Bool)

(declare-fun res!467502 () Bool)

(assert (=> b!703525 (=> (not res!467502) (not e!397469))))

(assert (=> b!703525 (= res!467502 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19629 a!3591)))))

(declare-fun b!703526 () Bool)

(declare-fun res!467497 () Bool)

(assert (=> b!703526 (=> (not res!467497) (not e!397469))))

(declare-fun arrayContainsKey!0 (array!40182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703526 (= res!467497 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703527 () Bool)

(declare-fun res!467506 () Bool)

(assert (=> b!703527 (=> (not res!467506) (not e!397469))))

(declare-fun newAcc!49 () List!13327)

(assert (=> b!703527 (= res!467506 (not (contains!3849 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703528 () Bool)

(assert (=> b!703528 (= e!397469 false)))

(declare-fun lt!317556 () Bool)

(assert (=> b!703528 (= lt!317556 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703529 () Bool)

(declare-fun res!467498 () Bool)

(assert (=> b!703529 (=> (not res!467498) (not e!397469))))

(assert (=> b!703529 (= res!467498 (not (validKeyInArray!0 (select (arr!19247 a!3591) from!2969))))))

(declare-fun b!703530 () Bool)

(declare-fun res!467495 () Bool)

(assert (=> b!703530 (=> (not res!467495) (not e!397469))))

(assert (=> b!703530 (= res!467495 (contains!3849 newAcc!49 k0!2824))))

(declare-fun b!703531 () Bool)

(declare-fun res!467492 () Bool)

(assert (=> b!703531 (=> (not res!467492) (not e!397469))))

(declare-fun noDuplicate!1118 (List!13327) Bool)

(assert (=> b!703531 (= res!467492 (noDuplicate!1118 newAcc!49))))

(declare-fun b!703532 () Bool)

(declare-fun res!467500 () Bool)

(assert (=> b!703532 (=> (not res!467500) (not e!397469))))

(assert (=> b!703532 (= res!467500 (not (contains!3849 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703533 () Bool)

(declare-fun res!467503 () Bool)

(assert (=> b!703533 (=> (not res!467503) (not e!397469))))

(assert (=> b!703533 (= res!467503 (noDuplicate!1118 acc!652))))

(declare-fun b!703534 () Bool)

(declare-fun res!467507 () Bool)

(assert (=> b!703534 (=> (not res!467507) (not e!397469))))

(assert (=> b!703534 (= res!467507 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703535 () Bool)

(declare-fun res!467504 () Bool)

(assert (=> b!703535 (=> (not res!467504) (not e!397469))))

(declare-fun subseq!311 (List!13327 List!13327) Bool)

(assert (=> b!703535 (= res!467504 (subseq!311 acc!652 newAcc!49))))

(declare-fun b!703536 () Bool)

(declare-fun res!467505 () Bool)

(assert (=> b!703536 (=> (not res!467505) (not e!397469))))

(assert (=> b!703536 (= res!467505 (not (contains!3849 acc!652 k0!2824)))))

(declare-fun b!703537 () Bool)

(declare-fun res!467509 () Bool)

(assert (=> b!703537 (=> (not res!467509) (not e!397469))))

(declare-fun -!276 (List!13327 (_ BitVec 64)) List!13327)

(assert (=> b!703537 (= res!467509 (= (-!276 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703538 () Bool)

(declare-fun res!467508 () Bool)

(assert (=> b!703538 (=> (not res!467508) (not e!397469))))

(assert (=> b!703538 (= res!467508 (not (contains!3849 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703539 () Bool)

(declare-fun res!467496 () Bool)

(assert (=> b!703539 (=> (not res!467496) (not e!397469))))

(assert (=> b!703539 (= res!467496 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62492 res!467494) b!703533))

(assert (= (and b!703533 res!467503) b!703531))

(assert (= (and b!703531 res!467492) b!703532))

(assert (= (and b!703532 res!467500) b!703523))

(assert (= (and b!703523 res!467501) b!703539))

(assert (= (and b!703539 res!467496) b!703536))

(assert (= (and b!703536 res!467505) b!703524))

(assert (= (and b!703524 res!467493) b!703522))

(assert (= (and b!703522 res!467499) b!703535))

(assert (= (and b!703535 res!467504) b!703530))

(assert (= (and b!703530 res!467495) b!703537))

(assert (= (and b!703537 res!467509) b!703538))

(assert (= (and b!703538 res!467508) b!703527))

(assert (= (and b!703527 res!467506) b!703525))

(assert (= (and b!703525 res!467502) b!703529))

(assert (= (and b!703529 res!467498) b!703534))

(assert (= (and b!703534 res!467507) b!703526))

(assert (= (and b!703526 res!467497) b!703528))

(declare-fun m!661755 () Bool)

(assert (=> b!703528 m!661755))

(declare-fun m!661757 () Bool)

(assert (=> b!703530 m!661757))

(declare-fun m!661759 () Bool)

(assert (=> b!703529 m!661759))

(assert (=> b!703529 m!661759))

(declare-fun m!661761 () Bool)

(assert (=> b!703529 m!661761))

(declare-fun m!661763 () Bool)

(assert (=> b!703524 m!661763))

(declare-fun m!661765 () Bool)

(assert (=> b!703523 m!661765))

(declare-fun m!661767 () Bool)

(assert (=> b!703527 m!661767))

(declare-fun m!661769 () Bool)

(assert (=> b!703537 m!661769))

(declare-fun m!661771 () Bool)

(assert (=> b!703535 m!661771))

(declare-fun m!661773 () Bool)

(assert (=> b!703526 m!661773))

(declare-fun m!661775 () Bool)

(assert (=> b!703532 m!661775))

(declare-fun m!661777 () Bool)

(assert (=> b!703539 m!661777))

(declare-fun m!661779 () Bool)

(assert (=> b!703522 m!661779))

(declare-fun m!661781 () Bool)

(assert (=> b!703531 m!661781))

(declare-fun m!661783 () Bool)

(assert (=> start!62492 m!661783))

(declare-fun m!661785 () Bool)

(assert (=> b!703533 m!661785))

(declare-fun m!661787 () Bool)

(assert (=> b!703536 m!661787))

(declare-fun m!661789 () Bool)

(assert (=> b!703538 m!661789))

(check-sat (not b!703538) (not b!703522) (not b!703532) (not b!703535) (not b!703539) (not b!703527) (not b!703530) (not b!703524) (not b!703526) (not b!703529) (not b!703533) (not start!62492) (not b!703523) (not b!703528) (not b!703531) (not b!703536) (not b!703537))
(check-sat)
