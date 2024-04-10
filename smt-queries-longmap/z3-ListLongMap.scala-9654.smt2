; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114064 () Bool)

(assert start!114064)

(declare-fun b!1354090 () Bool)

(declare-fun e!769330 () Bool)

(declare-fun e!769326 () Bool)

(assert (=> b!1354090 (= e!769330 e!769326)))

(declare-fun res!899200 () Bool)

(assert (=> b!1354090 (=> (not res!899200) (not e!769326))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1354090 (= res!899200 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31612 0))(
  ( (Nil!31609) (Cons!31608 (h!32817 (_ BitVec 64)) (t!46270 List!31612)) )
))
(declare-fun lt!598125 () List!31612)

(declare-fun acc!759 () List!31612)

(declare-datatypes ((array!92246 0))(
  ( (array!92247 (arr!44571 (Array (_ BitVec 32) (_ BitVec 64))) (size!45121 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92246)

(declare-fun $colon$colon!756 (List!31612 (_ BitVec 64)) List!31612)

(assert (=> b!1354090 (= lt!598125 ($colon$colon!756 acc!759 (select (arr!44571 a!3742) from!3120)))))

(declare-fun b!1354091 () Bool)

(declare-fun res!899209 () Bool)

(declare-fun e!769327 () Bool)

(assert (=> b!1354091 (=> (not res!899209) (not e!769327))))

(declare-fun arrayNoDuplicates!0 (array!92246 (_ BitVec 32) List!31612) Bool)

(assert (=> b!1354091 (= res!899209 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354092 () Bool)

(declare-datatypes ((Unit!44454 0))(
  ( (Unit!44455) )
))
(declare-fun e!769329 () Unit!44454)

(declare-fun Unit!44456 () Unit!44454)

(assert (=> b!1354092 (= e!769329 Unit!44456)))

(declare-fun b!1354093 () Bool)

(declare-fun res!899201 () Bool)

(assert (=> b!1354093 (=> (not res!899201) (not e!769327))))

(declare-fun noDuplicate!2178 (List!31612) Bool)

(assert (=> b!1354093 (= res!899201 (noDuplicate!2178 acc!759))))

(declare-fun b!1354094 () Bool)

(declare-fun res!899199 () Bool)

(assert (=> b!1354094 (=> (not res!899199) (not e!769327))))

(declare-fun contains!9321 (List!31612 (_ BitVec 64)) Bool)

(assert (=> b!1354094 (= res!899199 (not (contains!9321 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354095 () Bool)

(declare-fun res!899202 () Bool)

(assert (=> b!1354095 (=> (not res!899202) (not e!769327))))

(assert (=> b!1354095 (= res!899202 (not (contains!9321 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354096 () Bool)

(declare-fun res!899206 () Bool)

(assert (=> b!1354096 (=> (not res!899206) (not e!769326))))

(assert (=> b!1354096 (= res!899206 (not (contains!9321 lt!598125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354097 () Bool)

(assert (=> b!1354097 (= e!769327 e!769330)))

(declare-fun res!899197 () Bool)

(assert (=> b!1354097 (=> (not res!899197) (not e!769330))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598124 () Bool)

(assert (=> b!1354097 (= res!899197 (and (not (= from!3120 i!1404)) lt!598124))))

(declare-fun lt!598121 () Unit!44454)

(assert (=> b!1354097 (= lt!598121 e!769329)))

(declare-fun c!126887 () Bool)

(assert (=> b!1354097 (= c!126887 lt!598124)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354097 (= lt!598124 (validKeyInArray!0 (select (arr!44571 a!3742) from!3120)))))

(declare-fun b!1354098 () Bool)

(declare-fun res!899196 () Bool)

(assert (=> b!1354098 (=> (not res!899196) (not e!769327))))

(assert (=> b!1354098 (= res!899196 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31609))))

(declare-fun res!899204 () Bool)

(assert (=> start!114064 (=> (not res!899204) (not e!769327))))

(assert (=> start!114064 (= res!899204 (and (bvslt (size!45121 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45121 a!3742))))))

(assert (=> start!114064 e!769327))

(assert (=> start!114064 true))

(declare-fun array_inv!33599 (array!92246) Bool)

(assert (=> start!114064 (array_inv!33599 a!3742)))

(declare-fun b!1354099 () Bool)

(assert (=> b!1354099 (= e!769326 false)))

(declare-fun lt!598123 () Bool)

(assert (=> b!1354099 (= lt!598123 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598125))))

(declare-fun b!1354100 () Bool)

(declare-fun res!899205 () Bool)

(assert (=> b!1354100 (=> (not res!899205) (not e!769326))))

(assert (=> b!1354100 (= res!899205 (noDuplicate!2178 lt!598125))))

(declare-fun b!1354101 () Bool)

(declare-fun lt!598126 () Unit!44454)

(assert (=> b!1354101 (= e!769329 lt!598126)))

(declare-fun lt!598122 () Unit!44454)

(declare-fun lemmaListSubSeqRefl!0 (List!31612) Unit!44454)

(assert (=> b!1354101 (= lt!598122 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!741 (List!31612 List!31612) Bool)

(assert (=> b!1354101 (subseq!741 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92246 List!31612 List!31612 (_ BitVec 32)) Unit!44454)

(assert (=> b!1354101 (= lt!598126 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!756 acc!759 (select (arr!44571 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354101 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354102 () Bool)

(declare-fun res!899203 () Bool)

(assert (=> b!1354102 (=> (not res!899203) (not e!769327))))

(assert (=> b!1354102 (= res!899203 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45121 a!3742)))))

(declare-fun b!1354103 () Bool)

(declare-fun res!899207 () Bool)

(assert (=> b!1354103 (=> (not res!899207) (not e!769326))))

(assert (=> b!1354103 (= res!899207 (not (contains!9321 lt!598125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354104 () Bool)

(declare-fun res!899198 () Bool)

(assert (=> b!1354104 (=> (not res!899198) (not e!769327))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354104 (= res!899198 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354105 () Bool)

(declare-fun res!899208 () Bool)

(assert (=> b!1354105 (=> (not res!899208) (not e!769327))))

(assert (=> b!1354105 (= res!899208 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45121 a!3742))))))

(assert (= (and start!114064 res!899204) b!1354093))

(assert (= (and b!1354093 res!899201) b!1354095))

(assert (= (and b!1354095 res!899202) b!1354094))

(assert (= (and b!1354094 res!899199) b!1354098))

(assert (= (and b!1354098 res!899196) b!1354091))

(assert (= (and b!1354091 res!899209) b!1354105))

(assert (= (and b!1354105 res!899208) b!1354104))

(assert (= (and b!1354104 res!899198) b!1354102))

(assert (= (and b!1354102 res!899203) b!1354097))

(assert (= (and b!1354097 c!126887) b!1354101))

(assert (= (and b!1354097 (not c!126887)) b!1354092))

(assert (= (and b!1354097 res!899197) b!1354090))

(assert (= (and b!1354090 res!899200) b!1354100))

(assert (= (and b!1354100 res!899205) b!1354103))

(assert (= (and b!1354103 res!899207) b!1354096))

(assert (= (and b!1354096 res!899206) b!1354099))

(declare-fun m!1240549 () Bool)

(assert (=> b!1354096 m!1240549))

(declare-fun m!1240551 () Bool)

(assert (=> b!1354095 m!1240551))

(declare-fun m!1240553 () Bool)

(assert (=> b!1354103 m!1240553))

(declare-fun m!1240555 () Bool)

(assert (=> b!1354104 m!1240555))

(declare-fun m!1240557 () Bool)

(assert (=> b!1354094 m!1240557))

(declare-fun m!1240559 () Bool)

(assert (=> b!1354099 m!1240559))

(declare-fun m!1240561 () Bool)

(assert (=> b!1354101 m!1240561))

(declare-fun m!1240563 () Bool)

(assert (=> b!1354101 m!1240563))

(declare-fun m!1240565 () Bool)

(assert (=> b!1354101 m!1240565))

(declare-fun m!1240567 () Bool)

(assert (=> b!1354101 m!1240567))

(declare-fun m!1240569 () Bool)

(assert (=> b!1354101 m!1240569))

(assert (=> b!1354101 m!1240563))

(assert (=> b!1354101 m!1240565))

(declare-fun m!1240571 () Bool)

(assert (=> b!1354101 m!1240571))

(assert (=> b!1354097 m!1240563))

(assert (=> b!1354097 m!1240563))

(declare-fun m!1240573 () Bool)

(assert (=> b!1354097 m!1240573))

(declare-fun m!1240575 () Bool)

(assert (=> b!1354093 m!1240575))

(declare-fun m!1240577 () Bool)

(assert (=> start!114064 m!1240577))

(declare-fun m!1240579 () Bool)

(assert (=> b!1354100 m!1240579))

(declare-fun m!1240581 () Bool)

(assert (=> b!1354091 m!1240581))

(declare-fun m!1240583 () Bool)

(assert (=> b!1354098 m!1240583))

(assert (=> b!1354090 m!1240563))

(assert (=> b!1354090 m!1240563))

(assert (=> b!1354090 m!1240565))

(check-sat (not b!1354098) (not b!1354091) (not b!1354100) (not b!1354095) (not b!1354101) (not b!1354103) (not b!1354090) (not start!114064) (not b!1354094) (not b!1354096) (not b!1354104) (not b!1354099) (not b!1354093) (not b!1354097))
(check-sat)
