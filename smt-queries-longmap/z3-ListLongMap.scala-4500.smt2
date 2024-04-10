; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62470 () Bool)

(assert start!62470)

(declare-fun b!702749 () Bool)

(declare-fun e!397535 () Bool)

(assert (=> b!702749 (= e!397535 (not true))))

(declare-datatypes ((array!40149 0))(
  ( (array!40150 (arr!19231 (Array (_ BitVec 32) (_ BitVec 64))) (size!19616 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40149)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13272 0))(
  ( (Nil!13269) (Cons!13268 (h!14313 (_ BitVec 64)) (t!19554 List!13272)) )
))
(declare-fun lt!317731 () List!13272)

(declare-fun arrayNoDuplicates!0 (array!40149 (_ BitVec 32) List!13272) Bool)

(assert (=> b!702749 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317731)))

(declare-datatypes ((Unit!24596 0))(
  ( (Unit!24597) )
))
(declare-fun lt!317732 () Unit!24596)

(declare-fun lt!317733 () List!13272)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40149 (_ BitVec 64) (_ BitVec 32) List!13272 List!13272) Unit!24596)

(assert (=> b!702749 (= lt!317732 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317733 lt!317731))))

(declare-fun b!702750 () Bool)

(declare-fun res!466568 () Bool)

(declare-fun e!397537 () Bool)

(assert (=> b!702750 (=> (not res!466568) (not e!397537))))

(declare-fun acc!652 () List!13272)

(declare-fun contains!3849 (List!13272 (_ BitVec 64)) Bool)

(assert (=> b!702750 (= res!466568 (not (contains!3849 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702752 () Bool)

(declare-fun res!466573 () Bool)

(assert (=> b!702752 (=> (not res!466573) (not e!397537))))

(assert (=> b!702752 (= res!466573 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702753 () Bool)

(declare-fun res!466575 () Bool)

(assert (=> b!702753 (=> (not res!466575) (not e!397537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702753 (= res!466575 (validKeyInArray!0 k0!2824))))

(declare-fun b!702754 () Bool)

(declare-fun res!466587 () Bool)

(assert (=> b!702754 (=> (not res!466587) (not e!397535))))

(assert (=> b!702754 (= res!466587 (not (contains!3849 lt!317731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702755 () Bool)

(declare-fun res!466569 () Bool)

(assert (=> b!702755 (=> (not res!466569) (not e!397537))))

(declare-fun noDuplicate!1096 (List!13272) Bool)

(assert (=> b!702755 (= res!466569 (noDuplicate!1096 acc!652))))

(declare-fun b!702756 () Bool)

(declare-fun res!466564 () Bool)

(assert (=> b!702756 (=> (not res!466564) (not e!397537))))

(declare-fun newAcc!49 () List!13272)

(assert (=> b!702756 (= res!466564 (not (contains!3849 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702757 () Bool)

(declare-fun res!466567 () Bool)

(assert (=> b!702757 (=> (not res!466567) (not e!397535))))

(assert (=> b!702757 (= res!466567 (noDuplicate!1096 lt!317731))))

(declare-fun b!702758 () Bool)

(declare-fun res!466586 () Bool)

(assert (=> b!702758 (=> (not res!466586) (not e!397537))))

(assert (=> b!702758 (= res!466586 (not (contains!3849 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702759 () Bool)

(declare-fun res!466561 () Bool)

(assert (=> b!702759 (=> (not res!466561) (not e!397537))))

(declare-fun arrayContainsKey!0 (array!40149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702759 (= res!466561 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702760 () Bool)

(declare-fun res!466574 () Bool)

(assert (=> b!702760 (=> (not res!466574) (not e!397535))))

(assert (=> b!702760 (= res!466574 (contains!3849 lt!317731 k0!2824))))

(declare-fun b!702761 () Bool)

(declare-fun res!466585 () Bool)

(assert (=> b!702761 (=> (not res!466585) (not e!397537))))

(assert (=> b!702761 (= res!466585 (contains!3849 newAcc!49 k0!2824))))

(declare-fun b!702762 () Bool)

(declare-fun res!466562 () Bool)

(assert (=> b!702762 (=> (not res!466562) (not e!397535))))

(declare-fun subseq!294 (List!13272 List!13272) Bool)

(assert (=> b!702762 (= res!466562 (subseq!294 lt!317733 lt!317731))))

(declare-fun b!702763 () Bool)

(declare-fun res!466572 () Bool)

(assert (=> b!702763 (=> (not res!466572) (not e!397535))))

(assert (=> b!702763 (= res!466572 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317733))))

(declare-fun res!466576 () Bool)

(assert (=> start!62470 (=> (not res!466576) (not e!397537))))

(assert (=> start!62470 (= res!466576 (and (bvslt (size!19616 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19616 a!3591))))))

(assert (=> start!62470 e!397537))

(assert (=> start!62470 true))

(declare-fun array_inv!15027 (array!40149) Bool)

(assert (=> start!62470 (array_inv!15027 a!3591)))

(declare-fun b!702751 () Bool)

(declare-fun res!466578 () Bool)

(assert (=> b!702751 (=> (not res!466578) (not e!397537))))

(assert (=> b!702751 (= res!466578 (noDuplicate!1096 newAcc!49))))

(declare-fun b!702764 () Bool)

(declare-fun res!466580 () Bool)

(assert (=> b!702764 (=> (not res!466580) (not e!397537))))

(assert (=> b!702764 (= res!466580 (not (contains!3849 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702765 () Bool)

(declare-fun res!466581 () Bool)

(assert (=> b!702765 (=> (not res!466581) (not e!397537))))

(assert (=> b!702765 (= res!466581 (subseq!294 acc!652 newAcc!49))))

(declare-fun b!702766 () Bool)

(declare-fun res!466560 () Bool)

(assert (=> b!702766 (=> (not res!466560) (not e!397537))))

(assert (=> b!702766 (= res!466560 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19616 a!3591)))))

(declare-fun b!702767 () Bool)

(declare-fun res!466579 () Bool)

(assert (=> b!702767 (=> (not res!466579) (not e!397537))))

(assert (=> b!702767 (= res!466579 (not (contains!3849 acc!652 k0!2824)))))

(declare-fun b!702768 () Bool)

(declare-fun res!466582 () Bool)

(assert (=> b!702768 (=> (not res!466582) (not e!397537))))

(declare-fun -!259 (List!13272 (_ BitVec 64)) List!13272)

(assert (=> b!702768 (= res!466582 (= (-!259 newAcc!49 k0!2824) acc!652))))

(declare-fun b!702769 () Bool)

(declare-fun res!466559 () Bool)

(assert (=> b!702769 (=> (not res!466559) (not e!397535))))

(assert (=> b!702769 (= res!466559 (not (contains!3849 lt!317733 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702770 () Bool)

(declare-fun res!466570 () Bool)

(assert (=> b!702770 (=> (not res!466570) (not e!397535))))

(assert (=> b!702770 (= res!466570 (noDuplicate!1096 lt!317733))))

(declare-fun b!702771 () Bool)

(declare-fun res!466584 () Bool)

(assert (=> b!702771 (=> (not res!466584) (not e!397535))))

(assert (=> b!702771 (= res!466584 (not (contains!3849 lt!317733 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702772 () Bool)

(declare-fun res!466565 () Bool)

(assert (=> b!702772 (=> (not res!466565) (not e!397535))))

(assert (=> b!702772 (= res!466565 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702773 () Bool)

(declare-fun res!466563 () Bool)

(assert (=> b!702773 (=> (not res!466563) (not e!397535))))

(assert (=> b!702773 (= res!466563 (not (contains!3849 lt!317731 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702774 () Bool)

(declare-fun res!466571 () Bool)

(assert (=> b!702774 (=> (not res!466571) (not e!397535))))

(assert (=> b!702774 (= res!466571 (= (-!259 lt!317731 k0!2824) lt!317733))))

(declare-fun b!702775 () Bool)

(assert (=> b!702775 (= e!397537 e!397535)))

(declare-fun res!466577 () Bool)

(assert (=> b!702775 (=> (not res!466577) (not e!397535))))

(assert (=> b!702775 (= res!466577 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!492 (List!13272 (_ BitVec 64)) List!13272)

(assert (=> b!702775 (= lt!317731 ($colon$colon!492 newAcc!49 (select (arr!19231 a!3591) from!2969)))))

(assert (=> b!702775 (= lt!317733 ($colon$colon!492 acc!652 (select (arr!19231 a!3591) from!2969)))))

(declare-fun b!702776 () Bool)

(declare-fun res!466583 () Bool)

(assert (=> b!702776 (=> (not res!466583) (not e!397535))))

(assert (=> b!702776 (= res!466583 (not (contains!3849 lt!317733 k0!2824)))))

(declare-fun b!702777 () Bool)

(declare-fun res!466566 () Bool)

(assert (=> b!702777 (=> (not res!466566) (not e!397537))))

(assert (=> b!702777 (= res!466566 (validKeyInArray!0 (select (arr!19231 a!3591) from!2969)))))

(assert (= (and start!62470 res!466576) b!702755))

(assert (= (and b!702755 res!466569) b!702751))

(assert (= (and b!702751 res!466578) b!702750))

(assert (= (and b!702750 res!466568) b!702758))

(assert (= (and b!702758 res!466586) b!702759))

(assert (= (and b!702759 res!466561) b!702767))

(assert (= (and b!702767 res!466579) b!702753))

(assert (= (and b!702753 res!466575) b!702752))

(assert (= (and b!702752 res!466573) b!702765))

(assert (= (and b!702765 res!466581) b!702761))

(assert (= (and b!702761 res!466585) b!702768))

(assert (= (and b!702768 res!466582) b!702764))

(assert (= (and b!702764 res!466580) b!702756))

(assert (= (and b!702756 res!466564) b!702766))

(assert (= (and b!702766 res!466560) b!702777))

(assert (= (and b!702777 res!466566) b!702775))

(assert (= (and b!702775 res!466577) b!702770))

(assert (= (and b!702770 res!466570) b!702757))

(assert (= (and b!702757 res!466567) b!702771))

(assert (= (and b!702771 res!466584) b!702769))

(assert (= (and b!702769 res!466559) b!702772))

(assert (= (and b!702772 res!466565) b!702776))

(assert (= (and b!702776 res!466583) b!702763))

(assert (= (and b!702763 res!466572) b!702762))

(assert (= (and b!702762 res!466562) b!702760))

(assert (= (and b!702760 res!466574) b!702774))

(assert (= (and b!702774 res!466571) b!702754))

(assert (= (and b!702754 res!466587) b!702773))

(assert (= (and b!702773 res!466563) b!702749))

(declare-fun m!661763 () Bool)

(assert (=> b!702762 m!661763))

(declare-fun m!661765 () Bool)

(assert (=> b!702772 m!661765))

(declare-fun m!661767 () Bool)

(assert (=> b!702754 m!661767))

(declare-fun m!661769 () Bool)

(assert (=> b!702777 m!661769))

(assert (=> b!702777 m!661769))

(declare-fun m!661771 () Bool)

(assert (=> b!702777 m!661771))

(declare-fun m!661773 () Bool)

(assert (=> b!702758 m!661773))

(declare-fun m!661775 () Bool)

(assert (=> b!702756 m!661775))

(declare-fun m!661777 () Bool)

(assert (=> b!702769 m!661777))

(declare-fun m!661779 () Bool)

(assert (=> b!702752 m!661779))

(declare-fun m!661781 () Bool)

(assert (=> start!62470 m!661781))

(declare-fun m!661783 () Bool)

(assert (=> b!702760 m!661783))

(declare-fun m!661785 () Bool)

(assert (=> b!702774 m!661785))

(declare-fun m!661787 () Bool)

(assert (=> b!702761 m!661787))

(declare-fun m!661789 () Bool)

(assert (=> b!702751 m!661789))

(declare-fun m!661791 () Bool)

(assert (=> b!702755 m!661791))

(declare-fun m!661793 () Bool)

(assert (=> b!702749 m!661793))

(declare-fun m!661795 () Bool)

(assert (=> b!702749 m!661795))

(declare-fun m!661797 () Bool)

(assert (=> b!702773 m!661797))

(declare-fun m!661799 () Bool)

(assert (=> b!702776 m!661799))

(declare-fun m!661801 () Bool)

(assert (=> b!702765 m!661801))

(assert (=> b!702775 m!661769))

(assert (=> b!702775 m!661769))

(declare-fun m!661803 () Bool)

(assert (=> b!702775 m!661803))

(assert (=> b!702775 m!661769))

(declare-fun m!661805 () Bool)

(assert (=> b!702775 m!661805))

(declare-fun m!661807 () Bool)

(assert (=> b!702763 m!661807))

(declare-fun m!661809 () Bool)

(assert (=> b!702759 m!661809))

(declare-fun m!661811 () Bool)

(assert (=> b!702757 m!661811))

(declare-fun m!661813 () Bool)

(assert (=> b!702753 m!661813))

(declare-fun m!661815 () Bool)

(assert (=> b!702767 m!661815))

(declare-fun m!661817 () Bool)

(assert (=> b!702750 m!661817))

(declare-fun m!661819 () Bool)

(assert (=> b!702764 m!661819))

(declare-fun m!661821 () Bool)

(assert (=> b!702768 m!661821))

(declare-fun m!661823 () Bool)

(assert (=> b!702771 m!661823))

(declare-fun m!661825 () Bool)

(assert (=> b!702770 m!661825))

(check-sat (not start!62470) (not b!702769) (not b!702758) (not b!702765) (not b!702768) (not b!702751) (not b!702749) (not b!702761) (not b!702754) (not b!702752) (not b!702762) (not b!702756) (not b!702755) (not b!702767) (not b!702763) (not b!702776) (not b!702760) (not b!702770) (not b!702773) (not b!702757) (not b!702764) (not b!702753) (not b!702759) (not b!702777) (not b!702772) (not b!702774) (not b!702771) (not b!702750) (not b!702775))
(check-sat)
