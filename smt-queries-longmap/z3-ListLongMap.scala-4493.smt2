; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62414 () Bool)

(assert start!62414)

(declare-fun b!700590 () Bool)

(declare-fun e!397155 () Bool)

(assert (=> b!700590 (= e!397155 false)))

(declare-fun lt!317282 () Bool)

(declare-datatypes ((List!13288 0))(
  ( (Nil!13285) (Cons!13284 (h!14329 (_ BitVec 64)) (t!19561 List!13288)) )
))
(declare-fun lt!317283 () List!13288)

(declare-fun contains!3810 (List!13288 (_ BitVec 64)) Bool)

(assert (=> b!700590 (= lt!317282 (contains!3810 lt!317283 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!700591 () Bool)

(declare-fun res!464562 () Bool)

(declare-fun e!397157 () Bool)

(assert (=> b!700591 (=> (not res!464562) (not e!397157))))

(declare-datatypes ((array!40104 0))(
  ( (array!40105 (arr!19208 (Array (_ BitVec 32) (_ BitVec 64))) (size!19590 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40104)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!700591 (= res!464562 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!700592 () Bool)

(declare-fun res!464581 () Bool)

(assert (=> b!700592 (=> (not res!464581) (not e!397155))))

(declare-fun lt!317281 () List!13288)

(declare-fun -!237 (List!13288 (_ BitVec 64)) List!13288)

(assert (=> b!700592 (= res!464581 (= (-!237 lt!317283 k0!2824) lt!317281))))

(declare-fun b!700593 () Bool)

(assert (=> b!700593 (= e!397157 e!397155)))

(declare-fun res!464577 () Bool)

(assert (=> b!700593 (=> (not res!464577) (not e!397155))))

(assert (=> b!700593 (= res!464577 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun newAcc!49 () List!13288)

(declare-fun $colon$colon!469 (List!13288 (_ BitVec 64)) List!13288)

(assert (=> b!700593 (= lt!317283 ($colon$colon!469 newAcc!49 (select (arr!19208 a!3591) from!2969)))))

(declare-fun acc!652 () List!13288)

(assert (=> b!700593 (= lt!317281 ($colon$colon!469 acc!652 (select (arr!19208 a!3591) from!2969)))))

(declare-fun b!700594 () Bool)

(declare-fun res!464574 () Bool)

(assert (=> b!700594 (=> (not res!464574) (not e!397155))))

(assert (=> b!700594 (= res!464574 (not (contains!3810 lt!317283 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700595 () Bool)

(declare-fun res!464585 () Bool)

(assert (=> b!700595 (=> (not res!464585) (not e!397155))))

(declare-fun arrayNoDuplicates!0 (array!40104 (_ BitVec 32) List!13288) Bool)

(assert (=> b!700595 (= res!464585 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317281))))

(declare-fun b!700596 () Bool)

(declare-fun res!464578 () Bool)

(assert (=> b!700596 (=> (not res!464578) (not e!397155))))

(declare-fun noDuplicate!1079 (List!13288) Bool)

(assert (=> b!700596 (= res!464578 (noDuplicate!1079 lt!317283))))

(declare-fun b!700597 () Bool)

(declare-fun res!464573 () Bool)

(assert (=> b!700597 (=> (not res!464573) (not e!397157))))

(assert (=> b!700597 (= res!464573 (not (contains!3810 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700598 () Bool)

(declare-fun res!464583 () Bool)

(assert (=> b!700598 (=> (not res!464583) (not e!397155))))

(assert (=> b!700598 (= res!464583 (not (contains!3810 lt!317281 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700599 () Bool)

(declare-fun res!464563 () Bool)

(assert (=> b!700599 (=> (not res!464563) (not e!397155))))

(assert (=> b!700599 (= res!464563 (noDuplicate!1079 lt!317281))))

(declare-fun b!700600 () Bool)

(declare-fun res!464579 () Bool)

(assert (=> b!700600 (=> (not res!464579) (not e!397157))))

(assert (=> b!700600 (= res!464579 (not (contains!3810 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700601 () Bool)

(declare-fun res!464586 () Bool)

(assert (=> b!700601 (=> (not res!464586) (not e!397157))))

(assert (=> b!700601 (= res!464586 (not (contains!3810 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700602 () Bool)

(declare-fun res!464564 () Bool)

(assert (=> b!700602 (=> (not res!464564) (not e!397157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!700602 (= res!464564 (validKeyInArray!0 k0!2824))))

(declare-fun b!700603 () Bool)

(declare-fun res!464566 () Bool)

(assert (=> b!700603 (=> (not res!464566) (not e!397157))))

(assert (=> b!700603 (= res!464566 (= (-!237 newAcc!49 k0!2824) acc!652))))

(declare-fun b!700604 () Bool)

(declare-fun res!464567 () Bool)

(assert (=> b!700604 (=> (not res!464567) (not e!397157))))

(assert (=> b!700604 (= res!464567 (contains!3810 newAcc!49 k0!2824))))

(declare-fun b!700605 () Bool)

(declare-fun res!464569 () Bool)

(assert (=> b!700605 (=> (not res!464569) (not e!397155))))

(assert (=> b!700605 (= res!464569 (not (contains!3810 lt!317281 k0!2824)))))

(declare-fun b!700606 () Bool)

(declare-fun res!464584 () Bool)

(assert (=> b!700606 (=> (not res!464584) (not e!397155))))

(assert (=> b!700606 (= res!464584 (contains!3810 lt!317283 k0!2824))))

(declare-fun b!700607 () Bool)

(declare-fun res!464565 () Bool)

(assert (=> b!700607 (=> (not res!464565) (not e!397157))))

(assert (=> b!700607 (= res!464565 (validKeyInArray!0 (select (arr!19208 a!3591) from!2969)))))

(declare-fun b!700608 () Bool)

(declare-fun res!464580 () Bool)

(assert (=> b!700608 (=> (not res!464580) (not e!397157))))

(assert (=> b!700608 (= res!464580 (not (contains!3810 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700609 () Bool)

(declare-fun res!464572 () Bool)

(assert (=> b!700609 (=> (not res!464572) (not e!397155))))

(declare-fun subseq!272 (List!13288 List!13288) Bool)

(assert (=> b!700609 (= res!464572 (subseq!272 lt!317281 lt!317283))))

(declare-fun b!700610 () Bool)

(declare-fun res!464571 () Bool)

(assert (=> b!700610 (=> (not res!464571) (not e!397157))))

(assert (=> b!700610 (= res!464571 (noDuplicate!1079 newAcc!49))))

(declare-fun b!700611 () Bool)

(declare-fun res!464587 () Bool)

(assert (=> b!700611 (=> (not res!464587) (not e!397157))))

(assert (=> b!700611 (= res!464587 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!700612 () Bool)

(declare-fun res!464582 () Bool)

(assert (=> b!700612 (=> (not res!464582) (not e!397155))))

(assert (=> b!700612 (= res!464582 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!700613 () Bool)

(declare-fun res!464575 () Bool)

(assert (=> b!700613 (=> (not res!464575) (not e!397157))))

(assert (=> b!700613 (= res!464575 (subseq!272 acc!652 newAcc!49))))

(declare-fun res!464561 () Bool)

(assert (=> start!62414 (=> (not res!464561) (not e!397157))))

(assert (=> start!62414 (= res!464561 (and (bvslt (size!19590 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19590 a!3591))))))

(assert (=> start!62414 e!397157))

(assert (=> start!62414 true))

(declare-fun array_inv!15091 (array!40104) Bool)

(assert (=> start!62414 (array_inv!15091 a!3591)))

(declare-fun b!700614 () Bool)

(declare-fun res!464570 () Bool)

(assert (=> b!700614 (=> (not res!464570) (not e!397157))))

(assert (=> b!700614 (= res!464570 (noDuplicate!1079 acc!652))))

(declare-fun b!700615 () Bool)

(declare-fun res!464568 () Bool)

(assert (=> b!700615 (=> (not res!464568) (not e!397157))))

(assert (=> b!700615 (= res!464568 (not (contains!3810 acc!652 k0!2824)))))

(declare-fun b!700616 () Bool)

(declare-fun res!464560 () Bool)

(assert (=> b!700616 (=> (not res!464560) (not e!397155))))

(assert (=> b!700616 (= res!464560 (not (contains!3810 lt!317281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700617 () Bool)

(declare-fun res!464576 () Bool)

(assert (=> b!700617 (=> (not res!464576) (not e!397157))))

(assert (=> b!700617 (= res!464576 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19590 a!3591)))))

(assert (= (and start!62414 res!464561) b!700614))

(assert (= (and b!700614 res!464570) b!700610))

(assert (= (and b!700610 res!464571) b!700608))

(assert (= (and b!700608 res!464580) b!700597))

(assert (= (and b!700597 res!464573) b!700591))

(assert (= (and b!700591 res!464562) b!700615))

(assert (= (and b!700615 res!464568) b!700602))

(assert (= (and b!700602 res!464564) b!700611))

(assert (= (and b!700611 res!464587) b!700613))

(assert (= (and b!700613 res!464575) b!700604))

(assert (= (and b!700604 res!464567) b!700603))

(assert (= (and b!700603 res!464566) b!700601))

(assert (= (and b!700601 res!464586) b!700600))

(assert (= (and b!700600 res!464579) b!700617))

(assert (= (and b!700617 res!464576) b!700607))

(assert (= (and b!700607 res!464565) b!700593))

(assert (= (and b!700593 res!464577) b!700599))

(assert (= (and b!700599 res!464563) b!700596))

(assert (= (and b!700596 res!464578) b!700616))

(assert (= (and b!700616 res!464560) b!700598))

(assert (= (and b!700598 res!464583) b!700612))

(assert (= (and b!700612 res!464582) b!700605))

(assert (= (and b!700605 res!464569) b!700595))

(assert (= (and b!700595 res!464585) b!700609))

(assert (= (and b!700609 res!464572) b!700606))

(assert (= (and b!700606 res!464584) b!700592))

(assert (= (and b!700592 res!464581) b!700594))

(assert (= (and b!700594 res!464574) b!700590))

(declare-fun m!659655 () Bool)

(assert (=> b!700594 m!659655))

(declare-fun m!659657 () Bool)

(assert (=> b!700610 m!659657))

(declare-fun m!659659 () Bool)

(assert (=> b!700600 m!659659))

(declare-fun m!659661 () Bool)

(assert (=> b!700603 m!659661))

(declare-fun m!659663 () Bool)

(assert (=> b!700613 m!659663))

(declare-fun m!659665 () Bool)

(assert (=> b!700604 m!659665))

(declare-fun m!659667 () Bool)

(assert (=> b!700614 m!659667))

(declare-fun m!659669 () Bool)

(assert (=> start!62414 m!659669))

(declare-fun m!659671 () Bool)

(assert (=> b!700612 m!659671))

(declare-fun m!659673 () Bool)

(assert (=> b!700609 m!659673))

(declare-fun m!659675 () Bool)

(assert (=> b!700590 m!659675))

(declare-fun m!659677 () Bool)

(assert (=> b!700602 m!659677))

(declare-fun m!659679 () Bool)

(assert (=> b!700605 m!659679))

(declare-fun m!659681 () Bool)

(assert (=> b!700611 m!659681))

(declare-fun m!659683 () Bool)

(assert (=> b!700597 m!659683))

(declare-fun m!659685 () Bool)

(assert (=> b!700616 m!659685))

(declare-fun m!659687 () Bool)

(assert (=> b!700599 m!659687))

(declare-fun m!659689 () Bool)

(assert (=> b!700592 m!659689))

(declare-fun m!659691 () Bool)

(assert (=> b!700608 m!659691))

(declare-fun m!659693 () Bool)

(assert (=> b!700596 m!659693))

(declare-fun m!659695 () Bool)

(assert (=> b!700591 m!659695))

(declare-fun m!659697 () Bool)

(assert (=> b!700593 m!659697))

(assert (=> b!700593 m!659697))

(declare-fun m!659699 () Bool)

(assert (=> b!700593 m!659699))

(assert (=> b!700593 m!659697))

(declare-fun m!659701 () Bool)

(assert (=> b!700593 m!659701))

(declare-fun m!659703 () Bool)

(assert (=> b!700601 m!659703))

(assert (=> b!700607 m!659697))

(assert (=> b!700607 m!659697))

(declare-fun m!659705 () Bool)

(assert (=> b!700607 m!659705))

(declare-fun m!659707 () Bool)

(assert (=> b!700595 m!659707))

(declare-fun m!659709 () Bool)

(assert (=> b!700615 m!659709))

(declare-fun m!659711 () Bool)

(assert (=> b!700598 m!659711))

(declare-fun m!659713 () Bool)

(assert (=> b!700606 m!659713))

(check-sat (not b!700613) (not b!700604) (not b!700594) (not b!700614) (not b!700590) (not b!700595) (not b!700616) (not b!700601) (not b!700615) (not b!700608) (not b!700596) (not b!700603) (not b!700611) (not b!700605) (not b!700592) (not start!62414) (not b!700606) (not b!700598) (not b!700602) (not b!700607) (not b!700593) (not b!700599) (not b!700609) (not b!700610) (not b!700600) (not b!700597) (not b!700612) (not b!700591))
(check-sat)
