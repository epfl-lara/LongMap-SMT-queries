; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114068 () Bool)

(assert start!114068)

(declare-fun b!1354186 () Bool)

(declare-fun res!899282 () Bool)

(declare-fun e!769356 () Bool)

(assert (=> b!1354186 (=> (not res!899282) (not e!769356))))

(declare-datatypes ((List!31614 0))(
  ( (Nil!31611) (Cons!31610 (h!32819 (_ BitVec 64)) (t!46272 List!31614)) )
))
(declare-fun acc!759 () List!31614)

(declare-datatypes ((array!92250 0))(
  ( (array!92251 (arr!44573 (Array (_ BitVec 32) (_ BitVec 64))) (size!45123 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92250)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92250 (_ BitVec 32) List!31614) Bool)

(assert (=> b!1354186 (= res!899282 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354187 () Bool)

(declare-fun res!899293 () Bool)

(assert (=> b!1354187 (=> (not res!899293) (not e!769356))))

(assert (=> b!1354187 (= res!899293 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45123 a!3742)))))

(declare-fun b!1354189 () Bool)

(declare-fun e!769358 () Bool)

(assert (=> b!1354189 (= e!769356 e!769358)))

(declare-fun res!899286 () Bool)

(assert (=> b!1354189 (=> (not res!899286) (not e!769358))))

(declare-fun lt!598157 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354189 (= res!899286 (and (not (= from!3120 i!1404)) lt!598157))))

(declare-datatypes ((Unit!44460 0))(
  ( (Unit!44461) )
))
(declare-fun lt!598160 () Unit!44460)

(declare-fun e!769360 () Unit!44460)

(assert (=> b!1354189 (= lt!598160 e!769360)))

(declare-fun c!126893 () Bool)

(assert (=> b!1354189 (= c!126893 lt!598157)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354189 (= lt!598157 (validKeyInArray!0 (select (arr!44573 a!3742) from!3120)))))

(declare-fun b!1354190 () Bool)

(declare-fun res!899285 () Bool)

(assert (=> b!1354190 (=> (not res!899285) (not e!769356))))

(declare-fun noDuplicate!2180 (List!31614) Bool)

(assert (=> b!1354190 (= res!899285 (noDuplicate!2180 acc!759))))

(declare-fun b!1354191 () Bool)

(declare-fun res!899281 () Bool)

(declare-fun e!769359 () Bool)

(assert (=> b!1354191 (=> (not res!899281) (not e!769359))))

(declare-fun lt!598158 () List!31614)

(declare-fun contains!9323 (List!31614 (_ BitVec 64)) Bool)

(assert (=> b!1354191 (= res!899281 (not (contains!9323 lt!598158 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354192 () Bool)

(assert (=> b!1354192 (= e!769358 e!769359)))

(declare-fun res!899284 () Bool)

(assert (=> b!1354192 (=> (not res!899284) (not e!769359))))

(assert (=> b!1354192 (= res!899284 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!758 (List!31614 (_ BitVec 64)) List!31614)

(assert (=> b!1354192 (= lt!598158 ($colon$colon!758 acc!759 (select (arr!44573 a!3742) from!3120)))))

(declare-fun b!1354193 () Bool)

(declare-fun res!899280 () Bool)

(assert (=> b!1354193 (=> (not res!899280) (not e!769359))))

(assert (=> b!1354193 (= res!899280 (noDuplicate!2180 lt!598158))))

(declare-fun b!1354194 () Bool)

(declare-fun res!899287 () Bool)

(assert (=> b!1354194 (=> (not res!899287) (not e!769356))))

(assert (=> b!1354194 (= res!899287 (not (contains!9323 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354195 () Bool)

(declare-fun lt!598159 () Unit!44460)

(assert (=> b!1354195 (= e!769360 lt!598159)))

(declare-fun lt!598161 () Unit!44460)

(declare-fun lemmaListSubSeqRefl!0 (List!31614) Unit!44460)

(assert (=> b!1354195 (= lt!598161 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!743 (List!31614 List!31614) Bool)

(assert (=> b!1354195 (subseq!743 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92250 List!31614 List!31614 (_ BitVec 32)) Unit!44460)

(assert (=> b!1354195 (= lt!598159 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!758 acc!759 (select (arr!44573 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354195 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354196 () Bool)

(assert (=> b!1354196 (= e!769359 false)))

(declare-fun lt!598162 () Bool)

(assert (=> b!1354196 (= lt!598162 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598158))))

(declare-fun b!1354197 () Bool)

(declare-fun Unit!44462 () Unit!44460)

(assert (=> b!1354197 (= e!769360 Unit!44462)))

(declare-fun b!1354198 () Bool)

(declare-fun res!899283 () Bool)

(assert (=> b!1354198 (=> (not res!899283) (not e!769356))))

(assert (=> b!1354198 (= res!899283 (not (contains!9323 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354199 () Bool)

(declare-fun res!899290 () Bool)

(assert (=> b!1354199 (=> (not res!899290) (not e!769356))))

(assert (=> b!1354199 (= res!899290 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45123 a!3742))))))

(declare-fun res!899291 () Bool)

(assert (=> start!114068 (=> (not res!899291) (not e!769356))))

(assert (=> start!114068 (= res!899291 (and (bvslt (size!45123 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45123 a!3742))))))

(assert (=> start!114068 e!769356))

(assert (=> start!114068 true))

(declare-fun array_inv!33601 (array!92250) Bool)

(assert (=> start!114068 (array_inv!33601 a!3742)))

(declare-fun b!1354188 () Bool)

(declare-fun res!899292 () Bool)

(assert (=> b!1354188 (=> (not res!899292) (not e!769356))))

(assert (=> b!1354188 (= res!899292 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31611))))

(declare-fun b!1354200 () Bool)

(declare-fun res!899288 () Bool)

(assert (=> b!1354200 (=> (not res!899288) (not e!769359))))

(assert (=> b!1354200 (= res!899288 (not (contains!9323 lt!598158 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354201 () Bool)

(declare-fun res!899289 () Bool)

(assert (=> b!1354201 (=> (not res!899289) (not e!769356))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354201 (= res!899289 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114068 res!899291) b!1354190))

(assert (= (and b!1354190 res!899285) b!1354198))

(assert (= (and b!1354198 res!899283) b!1354194))

(assert (= (and b!1354194 res!899287) b!1354188))

(assert (= (and b!1354188 res!899292) b!1354186))

(assert (= (and b!1354186 res!899282) b!1354199))

(assert (= (and b!1354199 res!899290) b!1354201))

(assert (= (and b!1354201 res!899289) b!1354187))

(assert (= (and b!1354187 res!899293) b!1354189))

(assert (= (and b!1354189 c!126893) b!1354195))

(assert (= (and b!1354189 (not c!126893)) b!1354197))

(assert (= (and b!1354189 res!899286) b!1354192))

(assert (= (and b!1354192 res!899284) b!1354193))

(assert (= (and b!1354193 res!899280) b!1354200))

(assert (= (and b!1354200 res!899288) b!1354191))

(assert (= (and b!1354191 res!899281) b!1354196))

(declare-fun m!1240621 () Bool)

(assert (=> b!1354192 m!1240621))

(assert (=> b!1354192 m!1240621))

(declare-fun m!1240623 () Bool)

(assert (=> b!1354192 m!1240623))

(declare-fun m!1240625 () Bool)

(assert (=> b!1354201 m!1240625))

(declare-fun m!1240627 () Bool)

(assert (=> b!1354194 m!1240627))

(declare-fun m!1240629 () Bool)

(assert (=> b!1354200 m!1240629))

(declare-fun m!1240631 () Bool)

(assert (=> b!1354190 m!1240631))

(declare-fun m!1240633 () Bool)

(assert (=> b!1354195 m!1240633))

(assert (=> b!1354195 m!1240621))

(assert (=> b!1354195 m!1240623))

(declare-fun m!1240635 () Bool)

(assert (=> b!1354195 m!1240635))

(declare-fun m!1240637 () Bool)

(assert (=> b!1354195 m!1240637))

(assert (=> b!1354195 m!1240621))

(assert (=> b!1354195 m!1240623))

(declare-fun m!1240639 () Bool)

(assert (=> b!1354195 m!1240639))

(declare-fun m!1240641 () Bool)

(assert (=> b!1354193 m!1240641))

(declare-fun m!1240643 () Bool)

(assert (=> b!1354191 m!1240643))

(declare-fun m!1240645 () Bool)

(assert (=> b!1354188 m!1240645))

(assert (=> b!1354189 m!1240621))

(assert (=> b!1354189 m!1240621))

(declare-fun m!1240647 () Bool)

(assert (=> b!1354189 m!1240647))

(declare-fun m!1240649 () Bool)

(assert (=> b!1354186 m!1240649))

(declare-fun m!1240651 () Bool)

(assert (=> b!1354196 m!1240651))

(declare-fun m!1240653 () Bool)

(assert (=> start!114068 m!1240653))

(declare-fun m!1240655 () Bool)

(assert (=> b!1354198 m!1240655))

(push 1)

