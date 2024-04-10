; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115480 () Bool)

(assert start!115480)

(declare-fun b!1366133 () Bool)

(declare-fun res!909707 () Bool)

(declare-fun e!774364 () Bool)

(assert (=> b!1366133 (=> (not res!909707) (not e!774364))))

(declare-datatypes ((List!31897 0))(
  ( (Nil!31894) (Cons!31893 (h!33102 (_ BitVec 64)) (t!46591 List!31897)) )
))
(declare-fun acc!866 () List!31897)

(declare-fun contains!9579 (List!31897 (_ BitVec 64)) Bool)

(assert (=> b!1366133 (= res!909707 (not (contains!9579 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366135 () Bool)

(declare-fun e!774366 () Bool)

(assert (=> b!1366135 (= e!774364 e!774366)))

(declare-fun res!909722 () Bool)

(assert (=> b!1366135 (=> (not res!909722) (not e!774366))))

(declare-datatypes ((array!92801 0))(
  ( (array!92802 (arr!44829 (Array (_ BitVec 32) (_ BitVec 64))) (size!45379 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92801)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92801 (_ BitVec 32) List!31897) Bool)

(assert (=> b!1366135 (= res!909722 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45095 0))(
  ( (Unit!45096) )
))
(declare-fun lt!601482 () Unit!45095)

(declare-fun newAcc!98 () List!31897)

(declare-fun noDuplicateSubseq!168 (List!31897 List!31897) Unit!45095)

(assert (=> b!1366135 (= lt!601482 (noDuplicateSubseq!168 newAcc!98 acc!866))))

(declare-fun b!1366136 () Bool)

(declare-fun res!909718 () Bool)

(declare-fun e!774365 () Bool)

(assert (=> b!1366136 (=> (not res!909718) (not e!774365))))

(declare-fun lt!601480 () List!31897)

(declare-fun noDuplicate!2436 (List!31897) Bool)

(assert (=> b!1366136 (= res!909718 (noDuplicate!2436 lt!601480))))

(declare-fun b!1366137 () Bool)

(assert (=> b!1366137 (= e!774365 false)))

(declare-fun lt!601479 () Bool)

(assert (=> b!1366137 (= lt!601479 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601480))))

(declare-fun lt!601481 () Unit!45095)

(declare-fun lt!601483 () List!31897)

(assert (=> b!1366137 (= lt!601481 (noDuplicateSubseq!168 lt!601483 lt!601480))))

(declare-fun b!1366138 () Bool)

(declare-fun res!909717 () Bool)

(assert (=> b!1366138 (=> (not res!909717) (not e!774365))))

(assert (=> b!1366138 (= res!909717 (not (contains!9579 lt!601480 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366139 () Bool)

(declare-fun res!909716 () Bool)

(assert (=> b!1366139 (=> (not res!909716) (not e!774364))))

(assert (=> b!1366139 (= res!909716 (not (contains!9579 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366140 () Bool)

(declare-fun res!909711 () Bool)

(assert (=> b!1366140 (=> (not res!909711) (not e!774365))))

(assert (=> b!1366140 (= res!909711 (not (contains!9579 lt!601480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366141 () Bool)

(declare-fun res!909719 () Bool)

(assert (=> b!1366141 (=> (not res!909719) (not e!774366))))

(assert (=> b!1366141 (= res!909719 (bvslt from!3239 (size!45379 a!3861)))))

(declare-fun b!1366142 () Bool)

(declare-fun res!909709 () Bool)

(assert (=> b!1366142 (=> (not res!909709) (not e!774366))))

(assert (=> b!1366142 (= res!909709 (not (contains!9579 acc!866 (select (arr!44829 a!3861) from!3239))))))

(declare-fun b!1366134 () Bool)

(declare-fun res!909720 () Bool)

(assert (=> b!1366134 (=> (not res!909720) (not e!774364))))

(declare-fun subseq!981 (List!31897 List!31897) Bool)

(assert (=> b!1366134 (= res!909720 (subseq!981 newAcc!98 acc!866))))

(declare-fun res!909723 () Bool)

(assert (=> start!115480 (=> (not res!909723) (not e!774364))))

(assert (=> start!115480 (= res!909723 (and (bvslt (size!45379 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45379 a!3861))))))

(assert (=> start!115480 e!774364))

(declare-fun array_inv!33857 (array!92801) Bool)

(assert (=> start!115480 (array_inv!33857 a!3861)))

(assert (=> start!115480 true))

(declare-fun b!1366143 () Bool)

(declare-fun res!909710 () Bool)

(assert (=> b!1366143 (=> (not res!909710) (not e!774364))))

(assert (=> b!1366143 (= res!909710 (not (contains!9579 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366144 () Bool)

(declare-fun res!909712 () Bool)

(assert (=> b!1366144 (=> (not res!909712) (not e!774366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366144 (= res!909712 (validKeyInArray!0 (select (arr!44829 a!3861) from!3239)))))

(declare-fun b!1366145 () Bool)

(declare-fun res!909714 () Bool)

(assert (=> b!1366145 (=> (not res!909714) (not e!774364))))

(assert (=> b!1366145 (= res!909714 (noDuplicate!2436 acc!866))))

(declare-fun b!1366146 () Bool)

(declare-fun res!909715 () Bool)

(assert (=> b!1366146 (=> (not res!909715) (not e!774365))))

(assert (=> b!1366146 (= res!909715 (not (contains!9579 lt!601483 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366147 () Bool)

(declare-fun res!909708 () Bool)

(assert (=> b!1366147 (=> (not res!909708) (not e!774365))))

(assert (=> b!1366147 (= res!909708 (subseq!981 lt!601483 lt!601480))))

(declare-fun b!1366148 () Bool)

(declare-fun res!909713 () Bool)

(assert (=> b!1366148 (=> (not res!909713) (not e!774365))))

(assert (=> b!1366148 (= res!909713 (not (contains!9579 lt!601483 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366149 () Bool)

(assert (=> b!1366149 (= e!774366 e!774365)))

(declare-fun res!909721 () Bool)

(assert (=> b!1366149 (=> (not res!909721) (not e!774365))))

(assert (=> b!1366149 (= res!909721 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366149 (= lt!601483 (Cons!31893 (select (arr!44829 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366149 (= lt!601480 (Cons!31893 (select (arr!44829 a!3861) from!3239) acc!866))))

(declare-fun b!1366150 () Bool)

(declare-fun res!909724 () Bool)

(assert (=> b!1366150 (=> (not res!909724) (not e!774364))))

(assert (=> b!1366150 (= res!909724 (not (contains!9579 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115480 res!909723) b!1366145))

(assert (= (and b!1366145 res!909714) b!1366150))

(assert (= (and b!1366150 res!909724) b!1366133))

(assert (= (and b!1366133 res!909707) b!1366143))

(assert (= (and b!1366143 res!909710) b!1366139))

(assert (= (and b!1366139 res!909716) b!1366134))

(assert (= (and b!1366134 res!909720) b!1366135))

(assert (= (and b!1366135 res!909722) b!1366141))

(assert (= (and b!1366141 res!909719) b!1366144))

(assert (= (and b!1366144 res!909712) b!1366142))

(assert (= (and b!1366142 res!909709) b!1366149))

(assert (= (and b!1366149 res!909721) b!1366136))

(assert (= (and b!1366136 res!909718) b!1366140))

(assert (= (and b!1366140 res!909711) b!1366138))

(assert (= (and b!1366138 res!909717) b!1366146))

(assert (= (and b!1366146 res!909715) b!1366148))

(assert (= (and b!1366148 res!909713) b!1366147))

(assert (= (and b!1366147 res!909708) b!1366137))

(declare-fun m!1250501 () Bool)

(assert (=> b!1366148 m!1250501))

(declare-fun m!1250503 () Bool)

(assert (=> b!1366142 m!1250503))

(assert (=> b!1366142 m!1250503))

(declare-fun m!1250505 () Bool)

(assert (=> b!1366142 m!1250505))

(declare-fun m!1250507 () Bool)

(assert (=> b!1366143 m!1250507))

(declare-fun m!1250509 () Bool)

(assert (=> start!115480 m!1250509))

(declare-fun m!1250511 () Bool)

(assert (=> b!1366146 m!1250511))

(declare-fun m!1250513 () Bool)

(assert (=> b!1366136 m!1250513))

(declare-fun m!1250515 () Bool)

(assert (=> b!1366145 m!1250515))

(assert (=> b!1366149 m!1250503))

(declare-fun m!1250517 () Bool)

(assert (=> b!1366140 m!1250517))

(declare-fun m!1250519 () Bool)

(assert (=> b!1366134 m!1250519))

(declare-fun m!1250521 () Bool)

(assert (=> b!1366137 m!1250521))

(declare-fun m!1250523 () Bool)

(assert (=> b!1366137 m!1250523))

(declare-fun m!1250525 () Bool)

(assert (=> b!1366135 m!1250525))

(declare-fun m!1250527 () Bool)

(assert (=> b!1366135 m!1250527))

(declare-fun m!1250529 () Bool)

(assert (=> b!1366139 m!1250529))

(declare-fun m!1250531 () Bool)

(assert (=> b!1366150 m!1250531))

(declare-fun m!1250533 () Bool)

(assert (=> b!1366147 m!1250533))

(declare-fun m!1250535 () Bool)

(assert (=> b!1366138 m!1250535))

(assert (=> b!1366144 m!1250503))

(assert (=> b!1366144 m!1250503))

(declare-fun m!1250537 () Bool)

(assert (=> b!1366144 m!1250537))

(declare-fun m!1250539 () Bool)

(assert (=> b!1366133 m!1250539))

(check-sat (not start!115480) (not b!1366147) (not b!1366144) (not b!1366137) (not b!1366150) (not b!1366148) (not b!1366134) (not b!1366136) (not b!1366146) (not b!1366140) (not b!1366145) (not b!1366143) (not b!1366133) (not b!1366138) (not b!1366135) (not b!1366139) (not b!1366142))
(check-sat)
