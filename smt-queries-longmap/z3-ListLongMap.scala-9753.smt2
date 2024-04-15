; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115540 () Bool)

(assert start!115540)

(declare-fun b!1366707 () Bool)

(declare-fun res!910309 () Bool)

(declare-fun e!774623 () Bool)

(assert (=> b!1366707 (=> (not res!910309) (not e!774623))))

(declare-datatypes ((array!92775 0))(
  ( (array!92776 (arr!44815 (Array (_ BitVec 32) (_ BitVec 64))) (size!45367 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92775)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366707 (= res!910309 (validKeyInArray!0 (select (arr!44815 a!3861) from!3239)))))

(declare-fun b!1366708 () Bool)

(declare-fun e!774624 () Bool)

(assert (=> b!1366708 (= e!774624 e!774623)))

(declare-fun res!910310 () Bool)

(assert (=> b!1366708 (=> (not res!910310) (not e!774623))))

(declare-datatypes ((List!31961 0))(
  ( (Nil!31958) (Cons!31957 (h!33166 (_ BitVec 64)) (t!46647 List!31961)) )
))
(declare-fun acc!866 () List!31961)

(declare-fun arrayNoDuplicates!0 (array!92775 (_ BitVec 32) List!31961) Bool)

(assert (=> b!1366708 (= res!910310 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44958 0))(
  ( (Unit!44959) )
))
(declare-fun lt!601490 () Unit!44958)

(declare-fun newAcc!98 () List!31961)

(declare-fun noDuplicateSubseq!179 (List!31961 List!31961) Unit!44958)

(assert (=> b!1366708 (= lt!601490 (noDuplicateSubseq!179 newAcc!98 acc!866))))

(declare-fun res!910303 () Bool)

(assert (=> start!115540 (=> (not res!910303) (not e!774624))))

(assert (=> start!115540 (= res!910303 (and (bvslt (size!45367 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45367 a!3861))))))

(assert (=> start!115540 e!774624))

(declare-fun array_inv!34048 (array!92775) Bool)

(assert (=> start!115540 (array_inv!34048 a!3861)))

(assert (=> start!115540 true))

(declare-fun b!1366709 () Bool)

(declare-fun res!910300 () Bool)

(assert (=> b!1366709 (=> (not res!910300) (not e!774624))))

(declare-fun contains!9554 (List!31961 (_ BitVec 64)) Bool)

(assert (=> b!1366709 (= res!910300 (not (contains!9554 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366710 () Bool)

(declare-fun res!910305 () Bool)

(assert (=> b!1366710 (=> (not res!910305) (not e!774624))))

(assert (=> b!1366710 (= res!910305 (not (contains!9554 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366711 () Bool)

(assert (=> b!1366711 (= e!774623 (not true))))

(declare-fun lt!601489 () Unit!44958)

(declare-fun lt!601491 () List!31961)

(declare-fun lt!601487 () List!31961)

(assert (=> b!1366711 (= lt!601489 (noDuplicateSubseq!179 lt!601491 lt!601487))))

(assert (=> b!1366711 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601491)))

(declare-fun lt!601488 () Unit!44958)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92775 List!31961 List!31961 (_ BitVec 32)) Unit!44958)

(assert (=> b!1366711 (= lt!601488 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601487 lt!601491 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366711 (= lt!601491 (Cons!31957 (select (arr!44815 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366711 (= lt!601487 (Cons!31957 (select (arr!44815 a!3861) from!3239) acc!866))))

(declare-fun b!1366712 () Bool)

(declare-fun res!910308 () Bool)

(assert (=> b!1366712 (=> (not res!910308) (not e!774624))))

(assert (=> b!1366712 (= res!910308 (not (contains!9554 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366713 () Bool)

(declare-fun res!910302 () Bool)

(assert (=> b!1366713 (=> (not res!910302) (not e!774624))))

(declare-fun noDuplicate!2469 (List!31961) Bool)

(assert (=> b!1366713 (= res!910302 (noDuplicate!2469 acc!866))))

(declare-fun b!1366714 () Bool)

(declare-fun res!910307 () Bool)

(assert (=> b!1366714 (=> (not res!910307) (not e!774624))))

(assert (=> b!1366714 (= res!910307 (not (contains!9554 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366715 () Bool)

(declare-fun res!910306 () Bool)

(assert (=> b!1366715 (=> (not res!910306) (not e!774623))))

(assert (=> b!1366715 (= res!910306 (not (contains!9554 acc!866 (select (arr!44815 a!3861) from!3239))))))

(declare-fun b!1366716 () Bool)

(declare-fun res!910304 () Bool)

(assert (=> b!1366716 (=> (not res!910304) (not e!774623))))

(assert (=> b!1366716 (= res!910304 (bvslt from!3239 (size!45367 a!3861)))))

(declare-fun b!1366717 () Bool)

(declare-fun res!910301 () Bool)

(assert (=> b!1366717 (=> (not res!910301) (not e!774624))))

(declare-fun subseq!992 (List!31961 List!31961) Bool)

(assert (=> b!1366717 (= res!910301 (subseq!992 newAcc!98 acc!866))))

(assert (= (and start!115540 res!910303) b!1366713))

(assert (= (and b!1366713 res!910302) b!1366712))

(assert (= (and b!1366712 res!910308) b!1366714))

(assert (= (and b!1366714 res!910307) b!1366709))

(assert (= (and b!1366709 res!910300) b!1366710))

(assert (= (and b!1366710 res!910305) b!1366717))

(assert (= (and b!1366717 res!910301) b!1366708))

(assert (= (and b!1366708 res!910310) b!1366716))

(assert (= (and b!1366716 res!910304) b!1366707))

(assert (= (and b!1366707 res!910309) b!1366715))

(assert (= (and b!1366715 res!910306) b!1366711))

(declare-fun m!1250529 () Bool)

(assert (=> b!1366710 m!1250529))

(declare-fun m!1250531 () Bool)

(assert (=> b!1366709 m!1250531))

(declare-fun m!1250533 () Bool)

(assert (=> b!1366713 m!1250533))

(declare-fun m!1250535 () Bool)

(assert (=> b!1366708 m!1250535))

(declare-fun m!1250537 () Bool)

(assert (=> b!1366708 m!1250537))

(declare-fun m!1250539 () Bool)

(assert (=> b!1366715 m!1250539))

(assert (=> b!1366715 m!1250539))

(declare-fun m!1250541 () Bool)

(assert (=> b!1366715 m!1250541))

(declare-fun m!1250543 () Bool)

(assert (=> start!115540 m!1250543))

(declare-fun m!1250545 () Bool)

(assert (=> b!1366712 m!1250545))

(declare-fun m!1250547 () Bool)

(assert (=> b!1366714 m!1250547))

(assert (=> b!1366707 m!1250539))

(assert (=> b!1366707 m!1250539))

(declare-fun m!1250549 () Bool)

(assert (=> b!1366707 m!1250549))

(declare-fun m!1250551 () Bool)

(assert (=> b!1366717 m!1250551))

(declare-fun m!1250553 () Bool)

(assert (=> b!1366711 m!1250553))

(declare-fun m!1250555 () Bool)

(assert (=> b!1366711 m!1250555))

(declare-fun m!1250557 () Bool)

(assert (=> b!1366711 m!1250557))

(assert (=> b!1366711 m!1250539))

(check-sat (not b!1366711) (not b!1366713) (not b!1366707) (not b!1366714) (not b!1366710) (not b!1366712) (not b!1366715) (not b!1366708) (not b!1366717) (not b!1366709) (not start!115540))
(check-sat)
