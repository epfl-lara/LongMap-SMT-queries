; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115678 () Bool)

(assert start!115678)

(declare-fun b!1366730 () Bool)

(declare-fun res!909525 () Bool)

(declare-fun e!775054 () Bool)

(assert (=> b!1366730 (=> (not res!909525) (not e!775054))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92890 0))(
  ( (array!92891 (arr!44869 (Array (_ BitVec 32) (_ BitVec 64))) (size!45420 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92890)

(assert (=> b!1366730 (= res!909525 (bvslt from!3239 (size!45420 a!3861)))))

(declare-fun b!1366731 () Bool)

(declare-fun res!909527 () Bool)

(declare-fun e!775051 () Bool)

(assert (=> b!1366731 (=> (not res!909527) (not e!775051))))

(declare-datatypes ((List!31924 0))(
  ( (Nil!31921) (Cons!31920 (h!33138 (_ BitVec 64)) (t!46610 List!31924)) )
))
(declare-fun lt!601762 () List!31924)

(declare-fun contains!9609 (List!31924 (_ BitVec 64)) Bool)

(assert (=> b!1366731 (= res!909527 (not (contains!9609 lt!601762 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366732 () Bool)

(declare-fun res!909540 () Bool)

(assert (=> b!1366732 (=> (not res!909540) (not e!775054))))

(declare-fun acc!866 () List!31924)

(assert (=> b!1366732 (= res!909540 (not (contains!9609 acc!866 (select (arr!44869 a!3861) from!3239))))))

(declare-fun b!1366733 () Bool)

(declare-fun res!909524 () Bool)

(assert (=> b!1366733 (=> (not res!909524) (not e!775051))))

(declare-fun lt!601764 () List!31924)

(assert (=> b!1366733 (= res!909524 (not (contains!9609 lt!601764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366734 () Bool)

(declare-fun res!909534 () Bool)

(assert (=> b!1366734 (=> (not res!909534) (not e!775054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366734 (= res!909534 (validKeyInArray!0 (select (arr!44869 a!3861) from!3239)))))

(declare-fun res!909528 () Bool)

(declare-fun e!775053 () Bool)

(assert (=> start!115678 (=> (not res!909528) (not e!775053))))

(assert (=> start!115678 (= res!909528 (and (bvslt (size!45420 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45420 a!3861))))))

(assert (=> start!115678 e!775053))

(declare-fun array_inv!34150 (array!92890) Bool)

(assert (=> start!115678 (array_inv!34150 a!3861)))

(assert (=> start!115678 true))

(declare-fun b!1366735 () Bool)

(declare-fun res!909531 () Bool)

(assert (=> b!1366735 (=> (not res!909531) (not e!775051))))

(declare-fun noDuplicate!2440 (List!31924) Bool)

(assert (=> b!1366735 (= res!909531 (noDuplicate!2440 lt!601764))))

(declare-fun b!1366736 () Bool)

(declare-fun res!909538 () Bool)

(assert (=> b!1366736 (=> (not res!909538) (not e!775053))))

(assert (=> b!1366736 (= res!909538 (not (contains!9609 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366737 () Bool)

(declare-fun res!909529 () Bool)

(assert (=> b!1366737 (=> (not res!909529) (not e!775053))))

(declare-fun newAcc!98 () List!31924)

(declare-fun subseq!968 (List!31924 List!31924) Bool)

(assert (=> b!1366737 (= res!909529 (subseq!968 newAcc!98 acc!866))))

(declare-fun b!1366738 () Bool)

(assert (=> b!1366738 (= e!775051 false)))

(declare-fun lt!601761 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92890 (_ BitVec 32) List!31924) Bool)

(assert (=> b!1366738 (= lt!601761 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601764))))

(declare-datatypes ((Unit!45008 0))(
  ( (Unit!45009) )
))
(declare-fun lt!601760 () Unit!45008)

(declare-fun noDuplicateSubseq!155 (List!31924 List!31924) Unit!45008)

(assert (=> b!1366738 (= lt!601760 (noDuplicateSubseq!155 lt!601762 lt!601764))))

(declare-fun b!1366739 () Bool)

(declare-fun res!909539 () Bool)

(assert (=> b!1366739 (=> (not res!909539) (not e!775053))))

(assert (=> b!1366739 (= res!909539 (not (contains!9609 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366740 () Bool)

(declare-fun res!909532 () Bool)

(assert (=> b!1366740 (=> (not res!909532) (not e!775051))))

(assert (=> b!1366740 (= res!909532 (not (contains!9609 lt!601764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366741 () Bool)

(declare-fun res!909535 () Bool)

(assert (=> b!1366741 (=> (not res!909535) (not e!775053))))

(assert (=> b!1366741 (= res!909535 (not (contains!9609 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366742 () Bool)

(declare-fun res!909537 () Bool)

(assert (=> b!1366742 (=> (not res!909537) (not e!775051))))

(assert (=> b!1366742 (= res!909537 (subseq!968 lt!601762 lt!601764))))

(declare-fun b!1366743 () Bool)

(declare-fun res!909536 () Bool)

(assert (=> b!1366743 (=> (not res!909536) (not e!775051))))

(assert (=> b!1366743 (= res!909536 (not (contains!9609 lt!601762 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366744 () Bool)

(declare-fun res!909523 () Bool)

(assert (=> b!1366744 (=> (not res!909523) (not e!775053))))

(assert (=> b!1366744 (= res!909523 (noDuplicate!2440 acc!866))))

(declare-fun b!1366745 () Bool)

(assert (=> b!1366745 (= e!775054 e!775051)))

(declare-fun res!909533 () Bool)

(assert (=> b!1366745 (=> (not res!909533) (not e!775051))))

(assert (=> b!1366745 (= res!909533 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366745 (= lt!601762 (Cons!31920 (select (arr!44869 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366745 (= lt!601764 (Cons!31920 (select (arr!44869 a!3861) from!3239) acc!866))))

(declare-fun b!1366746 () Bool)

(declare-fun res!909526 () Bool)

(assert (=> b!1366746 (=> (not res!909526) (not e!775053))))

(assert (=> b!1366746 (= res!909526 (not (contains!9609 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366747 () Bool)

(assert (=> b!1366747 (= e!775053 e!775054)))

(declare-fun res!909530 () Bool)

(assert (=> b!1366747 (=> (not res!909530) (not e!775054))))

(assert (=> b!1366747 (= res!909530 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601763 () Unit!45008)

(assert (=> b!1366747 (= lt!601763 (noDuplicateSubseq!155 newAcc!98 acc!866))))

(assert (= (and start!115678 res!909528) b!1366744))

(assert (= (and b!1366744 res!909523) b!1366736))

(assert (= (and b!1366736 res!909538) b!1366746))

(assert (= (and b!1366746 res!909526) b!1366741))

(assert (= (and b!1366741 res!909535) b!1366739))

(assert (= (and b!1366739 res!909539) b!1366737))

(assert (= (and b!1366737 res!909529) b!1366747))

(assert (= (and b!1366747 res!909530) b!1366730))

(assert (= (and b!1366730 res!909525) b!1366734))

(assert (= (and b!1366734 res!909534) b!1366732))

(assert (= (and b!1366732 res!909540) b!1366745))

(assert (= (and b!1366745 res!909533) b!1366735))

(assert (= (and b!1366735 res!909531) b!1366733))

(assert (= (and b!1366733 res!909524) b!1366740))

(assert (= (and b!1366740 res!909532) b!1366731))

(assert (= (and b!1366731 res!909527) b!1366743))

(assert (= (and b!1366743 res!909536) b!1366742))

(assert (= (and b!1366742 res!909537) b!1366738))

(declare-fun m!1251577 () Bool)

(assert (=> b!1366740 m!1251577))

(declare-fun m!1251579 () Bool)

(assert (=> b!1366741 m!1251579))

(declare-fun m!1251581 () Bool)

(assert (=> b!1366745 m!1251581))

(declare-fun m!1251583 () Bool)

(assert (=> b!1366739 m!1251583))

(declare-fun m!1251585 () Bool)

(assert (=> b!1366743 m!1251585))

(declare-fun m!1251587 () Bool)

(assert (=> b!1366731 m!1251587))

(declare-fun m!1251589 () Bool)

(assert (=> start!115678 m!1251589))

(declare-fun m!1251591 () Bool)

(assert (=> b!1366733 m!1251591))

(declare-fun m!1251593 () Bool)

(assert (=> b!1366746 m!1251593))

(assert (=> b!1366734 m!1251581))

(assert (=> b!1366734 m!1251581))

(declare-fun m!1251595 () Bool)

(assert (=> b!1366734 m!1251595))

(declare-fun m!1251597 () Bool)

(assert (=> b!1366735 m!1251597))

(declare-fun m!1251599 () Bool)

(assert (=> b!1366738 m!1251599))

(declare-fun m!1251601 () Bool)

(assert (=> b!1366738 m!1251601))

(declare-fun m!1251603 () Bool)

(assert (=> b!1366747 m!1251603))

(declare-fun m!1251605 () Bool)

(assert (=> b!1366747 m!1251605))

(declare-fun m!1251607 () Bool)

(assert (=> b!1366744 m!1251607))

(declare-fun m!1251609 () Bool)

(assert (=> b!1366737 m!1251609))

(declare-fun m!1251611 () Bool)

(assert (=> b!1366736 m!1251611))

(declare-fun m!1251613 () Bool)

(assert (=> b!1366742 m!1251613))

(assert (=> b!1366732 m!1251581))

(assert (=> b!1366732 m!1251581))

(declare-fun m!1251615 () Bool)

(assert (=> b!1366732 m!1251615))

(check-sat (not b!1366743) (not b!1366739) (not b!1366744) (not b!1366740) (not b!1366736) (not start!115678) (not b!1366747) (not b!1366741) (not b!1366731) (not b!1366732) (not b!1366733) (not b!1366742) (not b!1366746) (not b!1366734) (not b!1366735) (not b!1366737) (not b!1366738))
(check-sat)
