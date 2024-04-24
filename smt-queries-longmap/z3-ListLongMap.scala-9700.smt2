; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114814 () Bool)

(assert start!114814)

(declare-fun b!1361062 () Bool)

(declare-datatypes ((Unit!44723 0))(
  ( (Unit!44724) )
))
(declare-fun e!772349 () Unit!44723)

(declare-fun Unit!44725 () Unit!44723)

(assert (=> b!1361062 (= e!772349 Unit!44725)))

(declare-fun b!1361063 () Bool)

(declare-fun lt!600176 () Unit!44723)

(assert (=> b!1361063 (= e!772349 lt!600176)))

(declare-fun lt!600177 () Unit!44723)

(declare-datatypes ((List!31789 0))(
  ( (Nil!31786) (Cons!31785 (h!33003 (_ BitVec 64)) (t!46454 List!31789)) )
))
(declare-fun acc!759 () List!31789)

(declare-fun lemmaListSubSeqRefl!0 (List!31789) Unit!44723)

(assert (=> b!1361063 (= lt!600177 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!860 (List!31789 List!31789) Bool)

(assert (=> b!1361063 (subseq!860 acc!759 acc!759)))

(declare-datatypes ((array!92650 0))(
  ( (array!92651 (arr!44761 (Array (_ BitVec 32) (_ BitVec 64))) (size!45312 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92650)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92650 List!31789 List!31789 (_ BitVec 32)) Unit!44723)

(declare-fun $colon$colon!862 (List!31789 (_ BitVec 64)) List!31789)

(assert (=> b!1361063 (= lt!600176 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!862 acc!759 (select (arr!44761 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92650 (_ BitVec 32) List!31789) Bool)

(assert (=> b!1361063 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361064 () Bool)

(declare-fun res!904711 () Bool)

(declare-fun e!772351 () Bool)

(assert (=> b!1361064 (=> (not res!904711) (not e!772351))))

(declare-fun contains!9501 (List!31789 (_ BitVec 64)) Bool)

(assert (=> b!1361064 (= res!904711 (not (contains!9501 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361065 () Bool)

(declare-fun res!904703 () Bool)

(assert (=> b!1361065 (=> (not res!904703) (not e!772351))))

(declare-fun noDuplicate!2332 (List!31789) Bool)

(assert (=> b!1361065 (= res!904703 (noDuplicate!2332 acc!759))))

(declare-fun b!1361066 () Bool)

(declare-fun res!904709 () Bool)

(assert (=> b!1361066 (=> (not res!904709) (not e!772351))))

(assert (=> b!1361066 (= res!904709 (not (contains!9501 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361067 () Bool)

(declare-fun res!904704 () Bool)

(assert (=> b!1361067 (=> (not res!904704) (not e!772351))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361067 (= res!904704 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45312 a!3742))))))

(declare-fun b!1361068 () Bool)

(declare-fun res!904712 () Bool)

(assert (=> b!1361068 (=> (not res!904712) (not e!772351))))

(assert (=> b!1361068 (= res!904712 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361069 () Bool)

(declare-fun res!904707 () Bool)

(assert (=> b!1361069 (=> (not res!904707) (not e!772351))))

(assert (=> b!1361069 (= res!904707 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45312 a!3742)))))

(declare-fun b!1361070 () Bool)

(declare-fun res!904713 () Bool)

(assert (=> b!1361070 (=> (not res!904713) (not e!772351))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361070 (= res!904713 (not (validKeyInArray!0 l!3587)))))

(declare-fun lt!600179 () array!92650)

(declare-fun b!1361071 () Bool)

(declare-fun e!772350 () Bool)

(assert (=> b!1361071 (= e!772350 (not (arrayNoDuplicates!0 lt!600179 from!3120 acc!759)))))

(assert (=> b!1361071 (arrayNoDuplicates!0 lt!600179 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (=> b!1361071 (= lt!600179 (array!92651 (store (arr!44761 a!3742) i!1404 l!3587) (size!45312 a!3742)))))

(declare-fun lt!600178 () Unit!44723)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31789) Unit!44723)

(assert (=> b!1361071 (= lt!600178 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!904708 () Bool)

(assert (=> start!114814 (=> (not res!904708) (not e!772351))))

(assert (=> start!114814 (= res!904708 (and (bvslt (size!45312 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45312 a!3742))))))

(assert (=> start!114814 e!772351))

(assert (=> start!114814 true))

(declare-fun array_inv!34042 (array!92650) Bool)

(assert (=> start!114814 (array_inv!34042 a!3742)))

(declare-fun b!1361072 () Bool)

(declare-fun res!904706 () Bool)

(assert (=> b!1361072 (=> (not res!904706) (not e!772350))))

(assert (=> b!1361072 (= res!904706 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1361073 () Bool)

(declare-fun res!904710 () Bool)

(assert (=> b!1361073 (=> (not res!904710) (not e!772351))))

(assert (=> b!1361073 (= res!904710 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31786))))

(declare-fun b!1361074 () Bool)

(assert (=> b!1361074 (= e!772351 e!772350)))

(declare-fun res!904705 () Bool)

(assert (=> b!1361074 (=> (not res!904705) (not e!772350))))

(assert (=> b!1361074 (= res!904705 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600180 () Unit!44723)

(assert (=> b!1361074 (= lt!600180 e!772349)))

(declare-fun c!127627 () Bool)

(assert (=> b!1361074 (= c!127627 (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)))))

(assert (= (and start!114814 res!904708) b!1361065))

(assert (= (and b!1361065 res!904703) b!1361064))

(assert (= (and b!1361064 res!904711) b!1361066))

(assert (= (and b!1361066 res!904709) b!1361073))

(assert (= (and b!1361073 res!904710) b!1361068))

(assert (= (and b!1361068 res!904712) b!1361067))

(assert (= (and b!1361067 res!904704) b!1361070))

(assert (= (and b!1361070 res!904713) b!1361069))

(assert (= (and b!1361069 res!904707) b!1361074))

(assert (= (and b!1361074 c!127627) b!1361063))

(assert (= (and b!1361074 (not c!127627)) b!1361062))

(assert (= (and b!1361074 res!904705) b!1361072))

(assert (= (and b!1361072 res!904706) b!1361071))

(declare-fun m!1246699 () Bool)

(assert (=> b!1361073 m!1246699))

(declare-fun m!1246701 () Bool)

(assert (=> b!1361066 m!1246701))

(declare-fun m!1246703 () Bool)

(assert (=> b!1361064 m!1246703))

(declare-fun m!1246705 () Bool)

(assert (=> b!1361072 m!1246705))

(declare-fun m!1246707 () Bool)

(assert (=> b!1361063 m!1246707))

(declare-fun m!1246709 () Bool)

(assert (=> b!1361063 m!1246709))

(declare-fun m!1246711 () Bool)

(assert (=> b!1361063 m!1246711))

(declare-fun m!1246713 () Bool)

(assert (=> b!1361063 m!1246713))

(assert (=> b!1361063 m!1246705))

(assert (=> b!1361063 m!1246709))

(assert (=> b!1361063 m!1246711))

(declare-fun m!1246715 () Bool)

(assert (=> b!1361063 m!1246715))

(assert (=> b!1361074 m!1246709))

(assert (=> b!1361074 m!1246709))

(declare-fun m!1246717 () Bool)

(assert (=> b!1361074 m!1246717))

(declare-fun m!1246719 () Bool)

(assert (=> start!114814 m!1246719))

(declare-fun m!1246721 () Bool)

(assert (=> b!1361070 m!1246721))

(declare-fun m!1246723 () Bool)

(assert (=> b!1361065 m!1246723))

(declare-fun m!1246725 () Bool)

(assert (=> b!1361068 m!1246725))

(declare-fun m!1246727 () Bool)

(assert (=> b!1361071 m!1246727))

(declare-fun m!1246729 () Bool)

(assert (=> b!1361071 m!1246729))

(declare-fun m!1246731 () Bool)

(assert (=> b!1361071 m!1246731))

(declare-fun m!1246733 () Bool)

(assert (=> b!1361071 m!1246733))

(check-sat (not b!1361072) (not b!1361070) (not b!1361074) (not b!1361071) (not b!1361063) (not b!1361065) (not b!1361073) (not b!1361066) (not b!1361068) (not b!1361064) (not start!114814))
(check-sat)
(get-model)

(declare-fun b!1361163 () Bool)

(declare-fun e!772384 () Bool)

(declare-fun call!65374 () Bool)

(assert (=> b!1361163 (= e!772384 call!65374)))

(declare-fun b!1361164 () Bool)

(declare-fun e!772387 () Bool)

(assert (=> b!1361164 (= e!772387 e!772384)))

(declare-fun c!127636 () Bool)

(assert (=> b!1361164 (= c!127636 (validKeyInArray!0 (select (arr!44761 lt!600179) from!3120)))))

(declare-fun b!1361165 () Bool)

(assert (=> b!1361165 (= e!772384 call!65374)))

(declare-fun b!1361166 () Bool)

(declare-fun e!772386 () Bool)

(assert (=> b!1361166 (= e!772386 e!772387)))

(declare-fun res!904787 () Bool)

(assert (=> b!1361166 (=> (not res!904787) (not e!772387))))

(declare-fun e!772385 () Bool)

(assert (=> b!1361166 (= res!904787 (not e!772385))))

(declare-fun res!904788 () Bool)

(assert (=> b!1361166 (=> (not res!904788) (not e!772385))))

(assert (=> b!1361166 (= res!904788 (validKeyInArray!0 (select (arr!44761 lt!600179) from!3120)))))

(declare-fun b!1361167 () Bool)

(assert (=> b!1361167 (= e!772385 (contains!9501 acc!759 (select (arr!44761 lt!600179) from!3120)))))

(declare-fun d!145989 () Bool)

(declare-fun res!904786 () Bool)

(assert (=> d!145989 (=> res!904786 e!772386)))

(assert (=> d!145989 (= res!904786 (bvsge from!3120 (size!45312 lt!600179)))))

(assert (=> d!145989 (= (arrayNoDuplicates!0 lt!600179 from!3120 acc!759) e!772386)))

(declare-fun bm!65371 () Bool)

(assert (=> bm!65371 (= call!65374 (arrayNoDuplicates!0 lt!600179 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127636 (Cons!31785 (select (arr!44761 lt!600179) from!3120) acc!759) acc!759)))))

(assert (= (and d!145989 (not res!904786)) b!1361166))

(assert (= (and b!1361166 res!904788) b!1361167))

(assert (= (and b!1361166 res!904787) b!1361164))

(assert (= (and b!1361164 c!127636) b!1361165))

(assert (= (and b!1361164 (not c!127636)) b!1361163))

(assert (= (or b!1361165 b!1361163) bm!65371))

(declare-fun m!1246807 () Bool)

(assert (=> b!1361164 m!1246807))

(assert (=> b!1361164 m!1246807))

(declare-fun m!1246809 () Bool)

(assert (=> b!1361164 m!1246809))

(assert (=> b!1361166 m!1246807))

(assert (=> b!1361166 m!1246807))

(assert (=> b!1361166 m!1246809))

(assert (=> b!1361167 m!1246807))

(assert (=> b!1361167 m!1246807))

(declare-fun m!1246811 () Bool)

(assert (=> b!1361167 m!1246811))

(assert (=> bm!65371 m!1246807))

(declare-fun m!1246813 () Bool)

(assert (=> bm!65371 m!1246813))

(assert (=> b!1361071 d!145989))

(declare-fun b!1361168 () Bool)

(declare-fun e!772388 () Bool)

(declare-fun call!65375 () Bool)

(assert (=> b!1361168 (= e!772388 call!65375)))

(declare-fun b!1361169 () Bool)

(declare-fun e!772391 () Bool)

(assert (=> b!1361169 (= e!772391 e!772388)))

(declare-fun c!127637 () Bool)

(assert (=> b!1361169 (= c!127637 (validKeyInArray!0 (select (arr!44761 lt!600179) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361170 () Bool)

(assert (=> b!1361170 (= e!772388 call!65375)))

(declare-fun b!1361171 () Bool)

(declare-fun e!772390 () Bool)

(assert (=> b!1361171 (= e!772390 e!772391)))

(declare-fun res!904790 () Bool)

(assert (=> b!1361171 (=> (not res!904790) (not e!772391))))

(declare-fun e!772389 () Bool)

(assert (=> b!1361171 (= res!904790 (not e!772389))))

(declare-fun res!904791 () Bool)

(assert (=> b!1361171 (=> (not res!904791) (not e!772389))))

(assert (=> b!1361171 (= res!904791 (validKeyInArray!0 (select (arr!44761 lt!600179) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361172 () Bool)

(assert (=> b!1361172 (= e!772389 (contains!9501 acc!759 (select (arr!44761 lt!600179) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145991 () Bool)

(declare-fun res!904789 () Bool)

(assert (=> d!145991 (=> res!904789 e!772390)))

(assert (=> d!145991 (= res!904789 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45312 lt!600179)))))

(assert (=> d!145991 (= (arrayNoDuplicates!0 lt!600179 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772390)))

(declare-fun bm!65372 () Bool)

(assert (=> bm!65372 (= call!65375 (arrayNoDuplicates!0 lt!600179 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127637 (Cons!31785 (select (arr!44761 lt!600179) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(assert (= (and d!145991 (not res!904789)) b!1361171))

(assert (= (and b!1361171 res!904791) b!1361172))

(assert (= (and b!1361171 res!904790) b!1361169))

(assert (= (and b!1361169 c!127637) b!1361170))

(assert (= (and b!1361169 (not c!127637)) b!1361168))

(assert (= (or b!1361170 b!1361168) bm!65372))

(declare-fun m!1246815 () Bool)

(assert (=> b!1361169 m!1246815))

(assert (=> b!1361169 m!1246815))

(declare-fun m!1246817 () Bool)

(assert (=> b!1361169 m!1246817))

(assert (=> b!1361171 m!1246815))

(assert (=> b!1361171 m!1246815))

(assert (=> b!1361171 m!1246817))

(assert (=> b!1361172 m!1246815))

(assert (=> b!1361172 m!1246815))

(declare-fun m!1246819 () Bool)

(assert (=> b!1361172 m!1246819))

(assert (=> bm!65372 m!1246815))

(declare-fun m!1246821 () Bool)

(assert (=> bm!65372 m!1246821))

(assert (=> b!1361071 d!145991))

(declare-fun d!145993 () Bool)

(declare-fun e!772394 () Bool)

(assert (=> d!145993 e!772394))

(declare-fun res!904794 () Bool)

(assert (=> d!145993 (=> (not res!904794) (not e!772394))))

(assert (=> d!145993 (= res!904794 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45312 a!3742))))))

(declare-fun lt!600213 () Unit!44723)

(declare-fun choose!53 (array!92650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31789) Unit!44723)

(assert (=> d!145993 (= lt!600213 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (=> d!145993 (bvslt (size!45312 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145993 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) lt!600213)))

(declare-fun b!1361175 () Bool)

(assert (=> b!1361175 (= e!772394 (arrayNoDuplicates!0 (array!92651 (store (arr!44761 a!3742) i!1404 l!3587) (size!45312 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and d!145993 res!904794) b!1361175))

(declare-fun m!1246823 () Bool)

(assert (=> d!145993 m!1246823))

(assert (=> b!1361175 m!1246731))

(declare-fun m!1246825 () Bool)

(assert (=> b!1361175 m!1246825))

(assert (=> b!1361071 d!145993))

(declare-fun d!145995 () Bool)

(assert (=> d!145995 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361070 d!145995))

(declare-fun d!145997 () Bool)

(assert (=> d!145997 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600216 () Unit!44723)

(declare-fun choose!80 (array!92650 List!31789 List!31789 (_ BitVec 32)) Unit!44723)

(assert (=> d!145997 (= lt!600216 (choose!80 a!3742 ($colon$colon!862 acc!759 (select (arr!44761 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145997 (bvslt (size!45312 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145997 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!862 acc!759 (select (arr!44761 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600216)))

(declare-fun bs!39010 () Bool)

(assert (= bs!39010 d!145997))

(assert (=> bs!39010 m!1246705))

(assert (=> bs!39010 m!1246711))

(declare-fun m!1246827 () Bool)

(assert (=> bs!39010 m!1246827))

(assert (=> b!1361063 d!145997))

(declare-fun b!1361187 () Bool)

(declare-fun e!772406 () Bool)

(assert (=> b!1361187 (= e!772406 (subseq!860 acc!759 (t!46454 acc!759)))))

(declare-fun d!145999 () Bool)

(declare-fun res!904803 () Bool)

(declare-fun e!772405 () Bool)

(assert (=> d!145999 (=> res!904803 e!772405)))

(get-info :version)

(assert (=> d!145999 (= res!904803 ((_ is Nil!31786) acc!759))))

(assert (=> d!145999 (= (subseq!860 acc!759 acc!759) e!772405)))

(declare-fun b!1361184 () Bool)

(declare-fun e!772404 () Bool)

(assert (=> b!1361184 (= e!772405 e!772404)))

(declare-fun res!904805 () Bool)

(assert (=> b!1361184 (=> (not res!904805) (not e!772404))))

(assert (=> b!1361184 (= res!904805 ((_ is Cons!31785) acc!759))))

(declare-fun b!1361186 () Bool)

(declare-fun e!772403 () Bool)

(assert (=> b!1361186 (= e!772403 (subseq!860 (t!46454 acc!759) (t!46454 acc!759)))))

(declare-fun b!1361185 () Bool)

(assert (=> b!1361185 (= e!772404 e!772406)))

(declare-fun res!904806 () Bool)

(assert (=> b!1361185 (=> res!904806 e!772406)))

(assert (=> b!1361185 (= res!904806 e!772403)))

(declare-fun res!904804 () Bool)

(assert (=> b!1361185 (=> (not res!904804) (not e!772403))))

(assert (=> b!1361185 (= res!904804 (= (h!33003 acc!759) (h!33003 acc!759)))))

(assert (= (and d!145999 (not res!904803)) b!1361184))

(assert (= (and b!1361184 res!904805) b!1361185))

(assert (= (and b!1361185 res!904804) b!1361186))

(assert (= (and b!1361185 (not res!904806)) b!1361187))

(declare-fun m!1246829 () Bool)

(assert (=> b!1361187 m!1246829))

(declare-fun m!1246831 () Bool)

(assert (=> b!1361186 m!1246831))

(assert (=> b!1361063 d!145999))

(declare-fun b!1361192 () Bool)

(declare-fun e!772411 () Bool)

(declare-fun call!65376 () Bool)

(assert (=> b!1361192 (= e!772411 call!65376)))

(declare-fun b!1361193 () Bool)

(declare-fun e!772414 () Bool)

(assert (=> b!1361193 (= e!772414 e!772411)))

(declare-fun c!127638 () Bool)

(assert (=> b!1361193 (= c!127638 (validKeyInArray!0 (select (arr!44761 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361194 () Bool)

(assert (=> b!1361194 (= e!772411 call!65376)))

(declare-fun b!1361195 () Bool)

(declare-fun e!772413 () Bool)

(assert (=> b!1361195 (= e!772413 e!772414)))

(declare-fun res!904812 () Bool)

(assert (=> b!1361195 (=> (not res!904812) (not e!772414))))

(declare-fun e!772412 () Bool)

(assert (=> b!1361195 (= res!904812 (not e!772412))))

(declare-fun res!904813 () Bool)

(assert (=> b!1361195 (=> (not res!904813) (not e!772412))))

(assert (=> b!1361195 (= res!904813 (validKeyInArray!0 (select (arr!44761 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361196 () Bool)

(assert (=> b!1361196 (= e!772412 (contains!9501 acc!759 (select (arr!44761 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146005 () Bool)

(declare-fun res!904811 () Bool)

(assert (=> d!146005 (=> res!904811 e!772413)))

(assert (=> d!146005 (= res!904811 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45312 a!3742)))))

(assert (=> d!146005 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772413)))

(declare-fun bm!65373 () Bool)

(assert (=> bm!65373 (= call!65376 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127638 (Cons!31785 (select (arr!44761 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(assert (= (and d!146005 (not res!904811)) b!1361195))

(assert (= (and b!1361195 res!904813) b!1361196))

(assert (= (and b!1361195 res!904812) b!1361193))

(assert (= (and b!1361193 c!127638) b!1361194))

(assert (= (and b!1361193 (not c!127638)) b!1361192))

(assert (= (or b!1361194 b!1361192) bm!65373))

(declare-fun m!1246833 () Bool)

(assert (=> b!1361193 m!1246833))

(assert (=> b!1361193 m!1246833))

(declare-fun m!1246835 () Bool)

(assert (=> b!1361193 m!1246835))

(assert (=> b!1361195 m!1246833))

(assert (=> b!1361195 m!1246833))

(assert (=> b!1361195 m!1246835))

(assert (=> b!1361196 m!1246833))

(assert (=> b!1361196 m!1246833))

(declare-fun m!1246837 () Bool)

(assert (=> b!1361196 m!1246837))

(assert (=> bm!65373 m!1246833))

(declare-fun m!1246839 () Bool)

(assert (=> bm!65373 m!1246839))

(assert (=> b!1361063 d!146005))

(declare-fun d!146009 () Bool)

(assert (=> d!146009 (= ($colon$colon!862 acc!759 (select (arr!44761 a!3742) from!3120)) (Cons!31785 (select (arr!44761 a!3742) from!3120) acc!759))))

(assert (=> b!1361063 d!146009))

(declare-fun d!146013 () Bool)

(assert (=> d!146013 (subseq!860 acc!759 acc!759)))

(declare-fun lt!600222 () Unit!44723)

(declare-fun choose!36 (List!31789) Unit!44723)

(assert (=> d!146013 (= lt!600222 (choose!36 acc!759))))

(assert (=> d!146013 (= (lemmaListSubSeqRefl!0 acc!759) lt!600222)))

(declare-fun bs!39011 () Bool)

(assert (= bs!39011 d!146013))

(assert (=> bs!39011 m!1246715))

(declare-fun m!1246847 () Bool)

(assert (=> bs!39011 m!1246847))

(assert (=> b!1361063 d!146013))

(declare-fun d!146015 () Bool)

(assert (=> d!146015 (= (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)) (and (not (= (select (arr!44761 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44761 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361074 d!146015))

(assert (=> b!1361072 d!146005))

(declare-fun b!1361209 () Bool)

(declare-fun e!772425 () Bool)

(declare-fun call!65379 () Bool)

(assert (=> b!1361209 (= e!772425 call!65379)))

(declare-fun b!1361210 () Bool)

(declare-fun e!772428 () Bool)

(assert (=> b!1361210 (= e!772428 e!772425)))

(declare-fun c!127641 () Bool)

(assert (=> b!1361210 (= c!127641 (validKeyInArray!0 (select (arr!44761 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361211 () Bool)

(assert (=> b!1361211 (= e!772425 call!65379)))

(declare-fun b!1361212 () Bool)

(declare-fun e!772427 () Bool)

(assert (=> b!1361212 (= e!772427 e!772428)))

(declare-fun res!904823 () Bool)

(assert (=> b!1361212 (=> (not res!904823) (not e!772428))))

(declare-fun e!772426 () Bool)

(assert (=> b!1361212 (= res!904823 (not e!772426))))

(declare-fun res!904824 () Bool)

(assert (=> b!1361212 (=> (not res!904824) (not e!772426))))

(assert (=> b!1361212 (= res!904824 (validKeyInArray!0 (select (arr!44761 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361213 () Bool)

(assert (=> b!1361213 (= e!772426 (contains!9501 Nil!31786 (select (arr!44761 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146017 () Bool)

(declare-fun res!904822 () Bool)

(assert (=> d!146017 (=> res!904822 e!772427)))

(assert (=> d!146017 (= res!904822 (bvsge #b00000000000000000000000000000000 (size!45312 a!3742)))))

(assert (=> d!146017 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31786) e!772427)))

(declare-fun bm!65376 () Bool)

(assert (=> bm!65376 (= call!65379 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127641 (Cons!31785 (select (arr!44761 a!3742) #b00000000000000000000000000000000) Nil!31786) Nil!31786)))))

(assert (= (and d!146017 (not res!904822)) b!1361212))

(assert (= (and b!1361212 res!904824) b!1361213))

(assert (= (and b!1361212 res!904823) b!1361210))

(assert (= (and b!1361210 c!127641) b!1361211))

(assert (= (and b!1361210 (not c!127641)) b!1361209))

(assert (= (or b!1361211 b!1361209) bm!65376))

(declare-fun m!1246849 () Bool)

(assert (=> b!1361210 m!1246849))

(assert (=> b!1361210 m!1246849))

(declare-fun m!1246851 () Bool)

(assert (=> b!1361210 m!1246851))

(assert (=> b!1361212 m!1246849))

(assert (=> b!1361212 m!1246849))

(assert (=> b!1361212 m!1246851))

(assert (=> b!1361213 m!1246849))

(assert (=> b!1361213 m!1246849))

(declare-fun m!1246853 () Bool)

(assert (=> b!1361213 m!1246853))

(assert (=> bm!65376 m!1246849))

(declare-fun m!1246855 () Bool)

(assert (=> bm!65376 m!1246855))

(assert (=> b!1361073 d!146017))

(declare-fun d!146019 () Bool)

(declare-fun lt!600225 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!689 (List!31789) (InoxSet (_ BitVec 64)))

(assert (=> d!146019 (= lt!600225 (select (content!689 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772454 () Bool)

(assert (=> d!146019 (= lt!600225 e!772454)))

(declare-fun res!904845 () Bool)

(assert (=> d!146019 (=> (not res!904845) (not e!772454))))

(assert (=> d!146019 (= res!904845 ((_ is Cons!31785) acc!759))))

(assert (=> d!146019 (= (contains!9501 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600225)))

(declare-fun b!1361243 () Bool)

(declare-fun e!772453 () Bool)

(assert (=> b!1361243 (= e!772454 e!772453)))

(declare-fun res!904844 () Bool)

(assert (=> b!1361243 (=> res!904844 e!772453)))

(assert (=> b!1361243 (= res!904844 (= (h!33003 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361244 () Bool)

(assert (=> b!1361244 (= e!772453 (contains!9501 (t!46454 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146019 res!904845) b!1361243))

(assert (= (and b!1361243 (not res!904844)) b!1361244))

(declare-fun m!1246877 () Bool)

(assert (=> d!146019 m!1246877))

(declare-fun m!1246879 () Bool)

(assert (=> d!146019 m!1246879))

(declare-fun m!1246881 () Bool)

(assert (=> b!1361244 m!1246881))

(assert (=> b!1361066 d!146019))

(declare-fun d!146029 () Bool)

(declare-fun lt!600228 () Bool)

(assert (=> d!146029 (= lt!600228 (select (content!689 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772460 () Bool)

(assert (=> d!146029 (= lt!600228 e!772460)))

(declare-fun res!904851 () Bool)

(assert (=> d!146029 (=> (not res!904851) (not e!772460))))

(assert (=> d!146029 (= res!904851 ((_ is Cons!31785) acc!759))))

(assert (=> d!146029 (= (contains!9501 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600228)))

(declare-fun b!1361249 () Bool)

(declare-fun e!772459 () Bool)

(assert (=> b!1361249 (= e!772460 e!772459)))

(declare-fun res!904850 () Bool)

(assert (=> b!1361249 (=> res!904850 e!772459)))

(assert (=> b!1361249 (= res!904850 (= (h!33003 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361250 () Bool)

(assert (=> b!1361250 (= e!772459 (contains!9501 (t!46454 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146029 res!904851) b!1361249))

(assert (= (and b!1361249 (not res!904850)) b!1361250))

(assert (=> d!146029 m!1246877))

(declare-fun m!1246883 () Bool)

(assert (=> d!146029 m!1246883))

(declare-fun m!1246885 () Bool)

(assert (=> b!1361250 m!1246885))

(assert (=> b!1361064 d!146029))

(declare-fun d!146031 () Bool)

(declare-fun res!904864 () Bool)

(declare-fun e!772475 () Bool)

(assert (=> d!146031 (=> res!904864 e!772475)))

(assert (=> d!146031 (= res!904864 ((_ is Nil!31786) acc!759))))

(assert (=> d!146031 (= (noDuplicate!2332 acc!759) e!772475)))

(declare-fun b!1361267 () Bool)

(declare-fun e!772476 () Bool)

(assert (=> b!1361267 (= e!772475 e!772476)))

(declare-fun res!904865 () Bool)

(assert (=> b!1361267 (=> (not res!904865) (not e!772476))))

(assert (=> b!1361267 (= res!904865 (not (contains!9501 (t!46454 acc!759) (h!33003 acc!759))))))

(declare-fun b!1361268 () Bool)

(assert (=> b!1361268 (= e!772476 (noDuplicate!2332 (t!46454 acc!759)))))

(assert (= (and d!146031 (not res!904864)) b!1361267))

(assert (= (and b!1361267 res!904865) b!1361268))

(declare-fun m!1246911 () Bool)

(assert (=> b!1361267 m!1246911))

(declare-fun m!1246913 () Bool)

(assert (=> b!1361268 m!1246913))

(assert (=> b!1361065 d!146031))

(declare-fun d!146041 () Bool)

(assert (=> d!146041 (= (array_inv!34042 a!3742) (bvsge (size!45312 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114814 d!146041))

(declare-fun b!1361269 () Bool)

(declare-fun e!772477 () Bool)

(declare-fun call!65387 () Bool)

(assert (=> b!1361269 (= e!772477 call!65387)))

(declare-fun b!1361270 () Bool)

(declare-fun e!772480 () Bool)

(assert (=> b!1361270 (= e!772480 e!772477)))

(declare-fun c!127649 () Bool)

(assert (=> b!1361270 (= c!127649 (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)))))

(declare-fun b!1361271 () Bool)

(assert (=> b!1361271 (= e!772477 call!65387)))

(declare-fun b!1361272 () Bool)

(declare-fun e!772479 () Bool)

(assert (=> b!1361272 (= e!772479 e!772480)))

(declare-fun res!904867 () Bool)

(assert (=> b!1361272 (=> (not res!904867) (not e!772480))))

(declare-fun e!772478 () Bool)

(assert (=> b!1361272 (= res!904867 (not e!772478))))

(declare-fun res!904868 () Bool)

(assert (=> b!1361272 (=> (not res!904868) (not e!772478))))

(assert (=> b!1361272 (= res!904868 (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)))))

(declare-fun b!1361273 () Bool)

(assert (=> b!1361273 (= e!772478 (contains!9501 acc!759 (select (arr!44761 a!3742) from!3120)))))

(declare-fun d!146043 () Bool)

(declare-fun res!904866 () Bool)

(assert (=> d!146043 (=> res!904866 e!772479)))

(assert (=> d!146043 (= res!904866 (bvsge from!3120 (size!45312 a!3742)))))

(assert (=> d!146043 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772479)))

(declare-fun bm!65384 () Bool)

(assert (=> bm!65384 (= call!65387 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127649 (Cons!31785 (select (arr!44761 a!3742) from!3120) acc!759) acc!759)))))

(assert (= (and d!146043 (not res!904866)) b!1361272))

(assert (= (and b!1361272 res!904868) b!1361273))

(assert (= (and b!1361272 res!904867) b!1361270))

(assert (= (and b!1361270 c!127649) b!1361271))

(assert (= (and b!1361270 (not c!127649)) b!1361269))

(assert (= (or b!1361271 b!1361269) bm!65384))

(assert (=> b!1361270 m!1246709))

(assert (=> b!1361270 m!1246709))

(assert (=> b!1361270 m!1246717))

(assert (=> b!1361272 m!1246709))

(assert (=> b!1361272 m!1246709))

(assert (=> b!1361272 m!1246717))

(assert (=> b!1361273 m!1246709))

(assert (=> b!1361273 m!1246709))

(declare-fun m!1246915 () Bool)

(assert (=> b!1361273 m!1246915))

(assert (=> bm!65384 m!1246709))

(declare-fun m!1246917 () Bool)

(assert (=> bm!65384 m!1246917))

(assert (=> b!1361068 d!146043))

(check-sat (not b!1361187) (not d!145997) (not b!1361175) (not b!1361244) (not b!1361273) (not b!1361167) (not bm!65376) (not b!1361172) (not bm!65384) (not b!1361213) (not b!1361164) (not b!1361270) (not b!1361169) (not d!146019) (not bm!65372) (not bm!65371) (not b!1361196) (not d!145993) (not b!1361268) (not b!1361166) (not d!146013) (not b!1361250) (not b!1361272) (not b!1361210) (not b!1361212) (not b!1361171) (not d!146029) (not b!1361195) (not b!1361267) (not bm!65373) (not b!1361193) (not b!1361186))
(check-sat)
