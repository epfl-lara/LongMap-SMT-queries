; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115450 () Bool)

(assert start!115450)

(declare-fun b!1365521 () Bool)

(declare-fun res!909142 () Bool)

(declare-fun e!774213 () Bool)

(assert (=> b!1365521 (=> (not res!909142) (not e!774213))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92730 0))(
  ( (array!92731 (arr!44794 (Array (_ BitVec 32) (_ BitVec 64))) (size!45346 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92730)

(assert (=> b!1365521 (= res!909142 (bvslt from!3239 (size!45346 a!3861)))))

(declare-fun b!1365522 () Bool)

(declare-fun res!909146 () Bool)

(declare-fun e!774212 () Bool)

(assert (=> b!1365522 (=> (not res!909146) (not e!774212))))

(declare-datatypes ((List!31940 0))(
  ( (Nil!31937) (Cons!31936 (h!33145 (_ BitVec 64)) (t!46626 List!31940)) )
))
(declare-fun lt!601145 () List!31940)

(declare-fun contains!9533 (List!31940 (_ BitVec 64)) Bool)

(assert (=> b!1365522 (= res!909146 (not (contains!9533 lt!601145 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365523 () Bool)

(declare-fun res!909155 () Bool)

(declare-fun e!774211 () Bool)

(assert (=> b!1365523 (=> (not res!909155) (not e!774211))))

(declare-fun acc!866 () List!31940)

(declare-fun noDuplicate!2448 (List!31940) Bool)

(assert (=> b!1365523 (= res!909155 (noDuplicate!2448 acc!866))))

(declare-fun b!1365524 () Bool)

(declare-fun res!909143 () Bool)

(assert (=> b!1365524 (=> (not res!909143) (not e!774212))))

(assert (=> b!1365524 (= res!909143 (not (contains!9533 lt!601145 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365525 () Bool)

(declare-fun res!909154 () Bool)

(assert (=> b!1365525 (=> (not res!909154) (not e!774211))))

(declare-fun newAcc!98 () List!31940)

(assert (=> b!1365525 (= res!909154 (not (contains!9533 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365526 () Bool)

(declare-fun res!909141 () Bool)

(assert (=> b!1365526 (=> (not res!909141) (not e!774211))))

(assert (=> b!1365526 (= res!909141 (not (contains!9533 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365527 () Bool)

(assert (=> b!1365527 (= e!774212 false)))

(declare-fun lt!601144 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92730 (_ BitVec 32) List!31940) Bool)

(assert (=> b!1365527 (= lt!601144 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601145))))

(declare-datatypes ((Unit!44916 0))(
  ( (Unit!44917) )
))
(declare-fun lt!601146 () Unit!44916)

(declare-fun lt!601143 () List!31940)

(declare-fun noDuplicateSubseq!158 (List!31940 List!31940) Unit!44916)

(assert (=> b!1365527 (= lt!601146 (noDuplicateSubseq!158 lt!601143 lt!601145))))

(declare-fun b!1365528 () Bool)

(assert (=> b!1365528 (= e!774213 e!774212)))

(declare-fun res!909149 () Bool)

(assert (=> b!1365528 (=> (not res!909149) (not e!774212))))

(assert (=> b!1365528 (= res!909149 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365528 (= lt!601143 (Cons!31936 (select (arr!44794 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365528 (= lt!601145 (Cons!31936 (select (arr!44794 a!3861) from!3239) acc!866))))

(declare-fun b!1365529 () Bool)

(declare-fun res!909152 () Bool)

(assert (=> b!1365529 (=> (not res!909152) (not e!774211))))

(assert (=> b!1365529 (= res!909152 (not (contains!9533 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365530 () Bool)

(declare-fun res!909140 () Bool)

(assert (=> b!1365530 (=> (not res!909140) (not e!774212))))

(assert (=> b!1365530 (= res!909140 (noDuplicate!2448 lt!601145))))

(declare-fun res!909139 () Bool)

(assert (=> start!115450 (=> (not res!909139) (not e!774211))))

(assert (=> start!115450 (= res!909139 (and (bvslt (size!45346 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45346 a!3861))))))

(assert (=> start!115450 e!774211))

(declare-fun array_inv!34027 (array!92730) Bool)

(assert (=> start!115450 (array_inv!34027 a!3861)))

(assert (=> start!115450 true))

(declare-fun b!1365531 () Bool)

(declare-fun res!909147 () Bool)

(assert (=> b!1365531 (=> (not res!909147) (not e!774211))))

(assert (=> b!1365531 (= res!909147 (not (contains!9533 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365532 () Bool)

(declare-fun res!909148 () Bool)

(assert (=> b!1365532 (=> (not res!909148) (not e!774212))))

(declare-fun subseq!971 (List!31940 List!31940) Bool)

(assert (=> b!1365532 (= res!909148 (subseq!971 lt!601143 lt!601145))))

(declare-fun b!1365533 () Bool)

(declare-fun res!909138 () Bool)

(assert (=> b!1365533 (=> (not res!909138) (not e!774212))))

(assert (=> b!1365533 (= res!909138 (not (contains!9533 lt!601143 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365534 () Bool)

(declare-fun res!909150 () Bool)

(assert (=> b!1365534 (=> (not res!909150) (not e!774212))))

(assert (=> b!1365534 (= res!909150 (not (contains!9533 lt!601143 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365535 () Bool)

(declare-fun res!909153 () Bool)

(assert (=> b!1365535 (=> (not res!909153) (not e!774213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365535 (= res!909153 (validKeyInArray!0 (select (arr!44794 a!3861) from!3239)))))

(declare-fun b!1365536 () Bool)

(declare-fun res!909144 () Bool)

(assert (=> b!1365536 (=> (not res!909144) (not e!774213))))

(assert (=> b!1365536 (= res!909144 (not (contains!9533 acc!866 (select (arr!44794 a!3861) from!3239))))))

(declare-fun b!1365537 () Bool)

(assert (=> b!1365537 (= e!774211 e!774213)))

(declare-fun res!909151 () Bool)

(assert (=> b!1365537 (=> (not res!909151) (not e!774213))))

(assert (=> b!1365537 (= res!909151 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601142 () Unit!44916)

(assert (=> b!1365537 (= lt!601142 (noDuplicateSubseq!158 newAcc!98 acc!866))))

(declare-fun b!1365538 () Bool)

(declare-fun res!909145 () Bool)

(assert (=> b!1365538 (=> (not res!909145) (not e!774211))))

(assert (=> b!1365538 (= res!909145 (subseq!971 newAcc!98 acc!866))))

(assert (= (and start!115450 res!909139) b!1365523))

(assert (= (and b!1365523 res!909155) b!1365531))

(assert (= (and b!1365531 res!909147) b!1365529))

(assert (= (and b!1365529 res!909152) b!1365526))

(assert (= (and b!1365526 res!909141) b!1365525))

(assert (= (and b!1365525 res!909154) b!1365538))

(assert (= (and b!1365538 res!909145) b!1365537))

(assert (= (and b!1365537 res!909151) b!1365521))

(assert (= (and b!1365521 res!909142) b!1365535))

(assert (= (and b!1365535 res!909153) b!1365536))

(assert (= (and b!1365536 res!909144) b!1365528))

(assert (= (and b!1365528 res!909149) b!1365530))

(assert (= (and b!1365530 res!909140) b!1365522))

(assert (= (and b!1365522 res!909146) b!1365524))

(assert (= (and b!1365524 res!909143) b!1365533))

(assert (= (and b!1365533 res!909138) b!1365534))

(assert (= (and b!1365534 res!909150) b!1365532))

(assert (= (and b!1365532 res!909148) b!1365527))

(declare-fun m!1249575 () Bool)

(assert (=> b!1365526 m!1249575))

(declare-fun m!1249577 () Bool)

(assert (=> b!1365534 m!1249577))

(declare-fun m!1249579 () Bool)

(assert (=> b!1365528 m!1249579))

(declare-fun m!1249581 () Bool)

(assert (=> b!1365531 m!1249581))

(declare-fun m!1249583 () Bool)

(assert (=> b!1365532 m!1249583))

(declare-fun m!1249585 () Bool)

(assert (=> b!1365527 m!1249585))

(declare-fun m!1249587 () Bool)

(assert (=> b!1365527 m!1249587))

(declare-fun m!1249589 () Bool)

(assert (=> b!1365538 m!1249589))

(declare-fun m!1249591 () Bool)

(assert (=> b!1365525 m!1249591))

(declare-fun m!1249593 () Bool)

(assert (=> b!1365524 m!1249593))

(declare-fun m!1249595 () Bool)

(assert (=> start!115450 m!1249595))

(declare-fun m!1249597 () Bool)

(assert (=> b!1365533 m!1249597))

(declare-fun m!1249599 () Bool)

(assert (=> b!1365529 m!1249599))

(declare-fun m!1249601 () Bool)

(assert (=> b!1365530 m!1249601))

(declare-fun m!1249603 () Bool)

(assert (=> b!1365537 m!1249603))

(declare-fun m!1249605 () Bool)

(assert (=> b!1365537 m!1249605))

(declare-fun m!1249607 () Bool)

(assert (=> b!1365522 m!1249607))

(assert (=> b!1365535 m!1249579))

(assert (=> b!1365535 m!1249579))

(declare-fun m!1249609 () Bool)

(assert (=> b!1365535 m!1249609))

(assert (=> b!1365536 m!1249579))

(assert (=> b!1365536 m!1249579))

(declare-fun m!1249611 () Bool)

(assert (=> b!1365536 m!1249611))

(declare-fun m!1249613 () Bool)

(assert (=> b!1365523 m!1249613))

(check-sat (not b!1365536) (not b!1365527) (not b!1365531) (not b!1365524) (not b!1365523) (not b!1365526) (not b!1365535) (not b!1365529) (not b!1365530) (not b!1365532) (not b!1365525) (not b!1365533) (not b!1365522) (not b!1365537) (not b!1365538) (not b!1365534) (not start!115450))
(check-sat)
