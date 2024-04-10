; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63516 () Bool)

(assert start!63516)

(declare-fun b!715568 () Bool)

(declare-fun res!478549 () Bool)

(declare-fun e!401878 () Bool)

(assert (=> b!715568 (=> (not res!478549) (not e!401878))))

(declare-datatypes ((array!40530 0))(
  ( (array!40531 (arr!19402 (Array (_ BitVec 32) (_ BitVec 64))) (size!19818 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40530)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715568 (= res!478549 (not (validKeyInArray!0 (select (arr!19402 a!3591) from!2969))))))

(declare-fun b!715569 () Bool)

(declare-fun res!478547 () Bool)

(assert (=> b!715569 (=> (not res!478547) (not e!401878))))

(declare-datatypes ((List!13443 0))(
  ( (Nil!13440) (Cons!13439 (h!14484 (_ BitVec 64)) (t!19758 List!13443)) )
))
(declare-fun acc!652 () List!13443)

(declare-fun contains!4020 (List!13443 (_ BitVec 64)) Bool)

(assert (=> b!715569 (= res!478547 (not (contains!4020 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715570 () Bool)

(declare-fun res!478544 () Bool)

(assert (=> b!715570 (=> (not res!478544) (not e!401878))))

(declare-fun newAcc!49 () List!13443)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!715570 (= res!478544 (contains!4020 newAcc!49 k0!2824))))

(declare-fun b!715571 () Bool)

(declare-fun res!478540 () Bool)

(assert (=> b!715571 (=> (not res!478540) (not e!401878))))

(assert (=> b!715571 (= res!478540 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19818 a!3591)))))

(declare-fun b!715572 () Bool)

(declare-fun res!478543 () Bool)

(assert (=> b!715572 (=> (not res!478543) (not e!401878))))

(assert (=> b!715572 (= res!478543 (validKeyInArray!0 k0!2824))))

(declare-fun b!715573 () Bool)

(declare-fun res!478552 () Bool)

(assert (=> b!715573 (=> (not res!478552) (not e!401878))))

(declare-fun -!430 (List!13443 (_ BitVec 64)) List!13443)

(assert (=> b!715573 (= res!478552 (= (-!430 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715574 () Bool)

(declare-fun res!478555 () Bool)

(assert (=> b!715574 (=> (not res!478555) (not e!401878))))

(assert (=> b!715574 (= res!478555 (not (contains!4020 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715576 () Bool)

(declare-fun res!478554 () Bool)

(assert (=> b!715576 (=> (not res!478554) (not e!401878))))

(declare-fun noDuplicate!1267 (List!13443) Bool)

(assert (=> b!715576 (= res!478554 (noDuplicate!1267 newAcc!49))))

(declare-fun b!715577 () Bool)

(declare-fun res!478551 () Bool)

(assert (=> b!715577 (=> (not res!478551) (not e!401878))))

(declare-fun arrayNoDuplicates!0 (array!40530 (_ BitVec 32) List!13443) Bool)

(assert (=> b!715577 (= res!478551 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715578 () Bool)

(declare-fun res!478545 () Bool)

(assert (=> b!715578 (=> (not res!478545) (not e!401878))))

(assert (=> b!715578 (= res!478545 (noDuplicate!1267 acc!652))))

(declare-fun b!715579 () Bool)

(declare-fun res!478550 () Bool)

(assert (=> b!715579 (=> (not res!478550) (not e!401878))))

(declare-fun subseq!465 (List!13443 List!13443) Bool)

(assert (=> b!715579 (= res!478550 (subseq!465 acc!652 newAcc!49))))

(declare-fun b!715580 () Bool)

(declare-fun res!478542 () Bool)

(assert (=> b!715580 (=> (not res!478542) (not e!401878))))

(assert (=> b!715580 (= res!478542 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715581 () Bool)

(declare-fun res!478538 () Bool)

(assert (=> b!715581 (=> (not res!478538) (not e!401878))))

(assert (=> b!715581 (= res!478538 (not (contains!4020 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715582 () Bool)

(assert (=> b!715582 (= e!401878 false)))

(declare-fun lt!318848 () Bool)

(assert (=> b!715582 (= lt!318848 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun res!478541 () Bool)

(assert (=> start!63516 (=> (not res!478541) (not e!401878))))

(assert (=> start!63516 (= res!478541 (and (bvslt (size!19818 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19818 a!3591))))))

(assert (=> start!63516 e!401878))

(assert (=> start!63516 true))

(declare-fun array_inv!15198 (array!40530) Bool)

(assert (=> start!63516 (array_inv!15198 a!3591)))

(declare-fun b!715575 () Bool)

(declare-fun res!478539 () Bool)

(assert (=> b!715575 (=> (not res!478539) (not e!401878))))

(assert (=> b!715575 (= res!478539 (not (contains!4020 acc!652 k0!2824)))))

(declare-fun b!715583 () Bool)

(declare-fun res!478553 () Bool)

(assert (=> b!715583 (=> (not res!478553) (not e!401878))))

(assert (=> b!715583 (= res!478553 (not (contains!4020 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715584 () Bool)

(declare-fun res!478546 () Bool)

(assert (=> b!715584 (=> (not res!478546) (not e!401878))))

(declare-fun arrayContainsKey!0 (array!40530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715584 (= res!478546 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715585 () Bool)

(declare-fun res!478548 () Bool)

(assert (=> b!715585 (=> (not res!478548) (not e!401878))))

(assert (=> b!715585 (= res!478548 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!63516 res!478541) b!715578))

(assert (= (and b!715578 res!478545) b!715576))

(assert (= (and b!715576 res!478554) b!715574))

(assert (= (and b!715574 res!478555) b!715569))

(assert (= (and b!715569 res!478547) b!715585))

(assert (= (and b!715585 res!478548) b!715575))

(assert (= (and b!715575 res!478539) b!715572))

(assert (= (and b!715572 res!478543) b!715577))

(assert (= (and b!715577 res!478551) b!715579))

(assert (= (and b!715579 res!478550) b!715570))

(assert (= (and b!715570 res!478544) b!715573))

(assert (= (and b!715573 res!478552) b!715581))

(assert (= (and b!715581 res!478538) b!715583))

(assert (= (and b!715583 res!478553) b!715571))

(assert (= (and b!715571 res!478540) b!715568))

(assert (= (and b!715568 res!478549) b!715580))

(assert (= (and b!715580 res!478542) b!715584))

(assert (= (and b!715584 res!478546) b!715582))

(declare-fun m!671767 () Bool)

(assert (=> start!63516 m!671767))

(declare-fun m!671769 () Bool)

(assert (=> b!715583 m!671769))

(declare-fun m!671771 () Bool)

(assert (=> b!715585 m!671771))

(declare-fun m!671773 () Bool)

(assert (=> b!715568 m!671773))

(assert (=> b!715568 m!671773))

(declare-fun m!671775 () Bool)

(assert (=> b!715568 m!671775))

(declare-fun m!671777 () Bool)

(assert (=> b!715576 m!671777))

(declare-fun m!671779 () Bool)

(assert (=> b!715578 m!671779))

(declare-fun m!671781 () Bool)

(assert (=> b!715584 m!671781))

(declare-fun m!671783 () Bool)

(assert (=> b!715570 m!671783))

(declare-fun m!671785 () Bool)

(assert (=> b!715581 m!671785))

(declare-fun m!671787 () Bool)

(assert (=> b!715577 m!671787))

(declare-fun m!671789 () Bool)

(assert (=> b!715579 m!671789))

(declare-fun m!671791 () Bool)

(assert (=> b!715569 m!671791))

(declare-fun m!671793 () Bool)

(assert (=> b!715572 m!671793))

(declare-fun m!671795 () Bool)

(assert (=> b!715582 m!671795))

(declare-fun m!671797 () Bool)

(assert (=> b!715575 m!671797))

(declare-fun m!671799 () Bool)

(assert (=> b!715573 m!671799))

(declare-fun m!671801 () Bool)

(assert (=> b!715574 m!671801))

(check-sat (not b!715572) (not b!715583) (not b!715584) (not b!715582) (not b!715570) (not b!715577) (not b!715568) (not b!715581) (not b!715574) (not b!715585) (not b!715579) (not b!715575) (not b!715569) (not b!715573) (not b!715578) (not b!715576) (not start!63516))
(check-sat)
