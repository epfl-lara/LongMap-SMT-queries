; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115036 () Bool)

(assert start!115036)

(declare-fun b!1362580 () Bool)

(declare-fun res!905967 () Bool)

(declare-fun e!773131 () Bool)

(assert (=> b!1362580 (=> (not res!905967) (not e!773131))))

(declare-datatypes ((List!31816 0))(
  ( (Nil!31813) (Cons!31812 (h!33030 (_ BitVec 64)) (t!46490 List!31816)) )
))
(declare-fun lt!600609 () List!31816)

(declare-fun contains!9528 (List!31816 (_ BitVec 64)) Bool)

(assert (=> b!1362580 (= res!905967 (not (contains!9528 lt!600609 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362581 () Bool)

(declare-fun res!905961 () Bool)

(assert (=> b!1362581 (=> (not res!905961) (not e!773131))))

(declare-fun noDuplicate!2359 (List!31816) Bool)

(assert (=> b!1362581 (= res!905961 (noDuplicate!2359 lt!600609))))

(declare-fun b!1362582 () Bool)

(declare-fun res!905968 () Bool)

(declare-fun e!773129 () Bool)

(assert (=> b!1362582 (=> (not res!905968) (not e!773129))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92713 0))(
  ( (array!92714 (arr!44788 (Array (_ BitVec 32) (_ BitVec 64))) (size!45339 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92713)

(assert (=> b!1362582 (= res!905968 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45339 a!3742)))))

(declare-fun b!1362584 () Bool)

(declare-fun res!905959 () Bool)

(assert (=> b!1362584 (=> (not res!905959) (not e!773129))))

(declare-fun acc!759 () List!31816)

(declare-fun arrayNoDuplicates!0 (array!92713 (_ BitVec 32) List!31816) Bool)

(assert (=> b!1362584 (= res!905959 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362585 () Bool)

(assert (=> b!1362585 (= e!773131 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600609)))))

(declare-fun b!1362586 () Bool)

(declare-datatypes ((Unit!44804 0))(
  ( (Unit!44805) )
))
(declare-fun e!773130 () Unit!44804)

(declare-fun lt!600607 () Unit!44804)

(assert (=> b!1362586 (= e!773130 lt!600607)))

(declare-fun lt!600606 () Unit!44804)

(declare-fun lemmaListSubSeqRefl!0 (List!31816) Unit!44804)

(assert (=> b!1362586 (= lt!600606 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!887 (List!31816 List!31816) Bool)

(assert (=> b!1362586 (subseq!887 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92713 List!31816 List!31816 (_ BitVec 32)) Unit!44804)

(declare-fun $colon$colon!889 (List!31816 (_ BitVec 64)) List!31816)

(assert (=> b!1362586 (= lt!600607 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!889 acc!759 (select (arr!44788 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362586 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362587 () Bool)

(declare-fun Unit!44806 () Unit!44804)

(assert (=> b!1362587 (= e!773130 Unit!44806)))

(declare-fun b!1362588 () Bool)

(declare-fun res!905966 () Bool)

(assert (=> b!1362588 (=> (not res!905966) (not e!773129))))

(assert (=> b!1362588 (= res!905966 (not (contains!9528 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362589 () Bool)

(declare-fun e!773127 () Bool)

(assert (=> b!1362589 (= e!773129 e!773127)))

(declare-fun res!905962 () Bool)

(assert (=> b!1362589 (=> (not res!905962) (not e!773127))))

(declare-fun lt!600605 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362589 (= res!905962 (and (not (= from!3120 i!1404)) lt!600605))))

(declare-fun lt!600608 () Unit!44804)

(assert (=> b!1362589 (= lt!600608 e!773130)))

(declare-fun c!127759 () Bool)

(assert (=> b!1362589 (= c!127759 lt!600605)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362589 (= lt!600605 (validKeyInArray!0 (select (arr!44788 a!3742) from!3120)))))

(declare-fun b!1362590 () Bool)

(declare-fun res!905969 () Bool)

(assert (=> b!1362590 (=> (not res!905969) (not e!773131))))

(assert (=> b!1362590 (= res!905969 (not (contains!9528 lt!600609 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362591 () Bool)

(declare-fun res!905970 () Bool)

(assert (=> b!1362591 (=> (not res!905970) (not e!773129))))

(assert (=> b!1362591 (= res!905970 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45339 a!3742))))))

(declare-fun b!1362592 () Bool)

(declare-fun res!905964 () Bool)

(assert (=> b!1362592 (=> (not res!905964) (not e!773129))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362592 (= res!905964 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362593 () Bool)

(declare-fun res!905958 () Bool)

(assert (=> b!1362593 (=> (not res!905958) (not e!773129))))

(assert (=> b!1362593 (= res!905958 (not (contains!9528 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362594 () Bool)

(declare-fun res!905960 () Bool)

(assert (=> b!1362594 (=> (not res!905960) (not e!773129))))

(assert (=> b!1362594 (= res!905960 (noDuplicate!2359 acc!759))))

(declare-fun b!1362595 () Bool)

(assert (=> b!1362595 (= e!773127 e!773131)))

(declare-fun res!905963 () Bool)

(assert (=> b!1362595 (=> (not res!905963) (not e!773131))))

(assert (=> b!1362595 (= res!905963 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1362595 (= lt!600609 ($colon$colon!889 acc!759 (select (arr!44788 a!3742) from!3120)))))

(declare-fun res!905957 () Bool)

(assert (=> start!115036 (=> (not res!905957) (not e!773129))))

(assert (=> start!115036 (= res!905957 (and (bvslt (size!45339 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45339 a!3742))))))

(assert (=> start!115036 e!773129))

(assert (=> start!115036 true))

(declare-fun array_inv!34069 (array!92713) Bool)

(assert (=> start!115036 (array_inv!34069 a!3742)))

(declare-fun b!1362583 () Bool)

(declare-fun res!905965 () Bool)

(assert (=> b!1362583 (=> (not res!905965) (not e!773129))))

(assert (=> b!1362583 (= res!905965 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31813))))

(assert (= (and start!115036 res!905957) b!1362594))

(assert (= (and b!1362594 res!905960) b!1362588))

(assert (= (and b!1362588 res!905966) b!1362593))

(assert (= (and b!1362593 res!905958) b!1362583))

(assert (= (and b!1362583 res!905965) b!1362584))

(assert (= (and b!1362584 res!905959) b!1362591))

(assert (= (and b!1362591 res!905970) b!1362592))

(assert (= (and b!1362592 res!905964) b!1362582))

(assert (= (and b!1362582 res!905968) b!1362589))

(assert (= (and b!1362589 c!127759) b!1362586))

(assert (= (and b!1362589 (not c!127759)) b!1362587))

(assert (= (and b!1362589 res!905962) b!1362595))

(assert (= (and b!1362595 res!905963) b!1362581))

(assert (= (and b!1362581 res!905961) b!1362580))

(assert (= (and b!1362580 res!905967) b!1362590))

(assert (= (and b!1362590 res!905969) b!1362585))

(declare-fun m!1248013 () Bool)

(assert (=> b!1362586 m!1248013))

(declare-fun m!1248015 () Bool)

(assert (=> b!1362586 m!1248015))

(declare-fun m!1248017 () Bool)

(assert (=> b!1362586 m!1248017))

(declare-fun m!1248019 () Bool)

(assert (=> b!1362586 m!1248019))

(declare-fun m!1248021 () Bool)

(assert (=> b!1362586 m!1248021))

(assert (=> b!1362586 m!1248015))

(assert (=> b!1362586 m!1248017))

(declare-fun m!1248023 () Bool)

(assert (=> b!1362586 m!1248023))

(declare-fun m!1248025 () Bool)

(assert (=> b!1362590 m!1248025))

(declare-fun m!1248027 () Bool)

(assert (=> b!1362583 m!1248027))

(declare-fun m!1248029 () Bool)

(assert (=> b!1362588 m!1248029))

(declare-fun m!1248031 () Bool)

(assert (=> start!115036 m!1248031))

(declare-fun m!1248033 () Bool)

(assert (=> b!1362581 m!1248033))

(declare-fun m!1248035 () Bool)

(assert (=> b!1362592 m!1248035))

(declare-fun m!1248037 () Bool)

(assert (=> b!1362580 m!1248037))

(assert (=> b!1362595 m!1248015))

(assert (=> b!1362595 m!1248015))

(assert (=> b!1362595 m!1248017))

(declare-fun m!1248039 () Bool)

(assert (=> b!1362585 m!1248039))

(assert (=> b!1362589 m!1248015))

(assert (=> b!1362589 m!1248015))

(declare-fun m!1248041 () Bool)

(assert (=> b!1362589 m!1248041))

(declare-fun m!1248043 () Bool)

(assert (=> b!1362594 m!1248043))

(declare-fun m!1248045 () Bool)

(assert (=> b!1362593 m!1248045))

(declare-fun m!1248047 () Bool)

(assert (=> b!1362584 m!1248047))

(check-sat (not b!1362592) (not b!1362584) (not b!1362589) (not b!1362586) (not b!1362588) (not b!1362590) (not b!1362581) (not b!1362595) (not b!1362593) (not b!1362580) (not start!115036) (not b!1362594) (not b!1362585) (not b!1362583))
(check-sat)
(get-model)

(declare-fun d!146283 () Bool)

(declare-fun res!906059 () Bool)

(declare-fun e!773166 () Bool)

(assert (=> d!146283 (=> res!906059 e!773166)))

(get-info :version)

(assert (=> d!146283 (= res!906059 ((_ is Nil!31813) acc!759))))

(assert (=> d!146283 (= (noDuplicate!2359 acc!759) e!773166)))

(declare-fun b!1362696 () Bool)

(declare-fun e!773167 () Bool)

(assert (=> b!1362696 (= e!773166 e!773167)))

(declare-fun res!906060 () Bool)

(assert (=> b!1362696 (=> (not res!906060) (not e!773167))))

(assert (=> b!1362696 (= res!906060 (not (contains!9528 (t!46490 acc!759) (h!33030 acc!759))))))

(declare-fun b!1362697 () Bool)

(assert (=> b!1362697 (= e!773167 (noDuplicate!2359 (t!46490 acc!759)))))

(assert (= (and d!146283 (not res!906059)) b!1362696))

(assert (= (and b!1362696 res!906060) b!1362697))

(declare-fun m!1248121 () Bool)

(assert (=> b!1362696 m!1248121))

(declare-fun m!1248123 () Bool)

(assert (=> b!1362697 m!1248123))

(assert (=> b!1362594 d!146283))

(declare-fun d!146285 () Bool)

(assert (=> d!146285 (= ($colon$colon!889 acc!759 (select (arr!44788 a!3742) from!3120)) (Cons!31812 (select (arr!44788 a!3742) from!3120) acc!759))))

(assert (=> b!1362595 d!146285))

(declare-fun b!1362714 () Bool)

(declare-fun e!773185 () Bool)

(declare-fun call!65425 () Bool)

(assert (=> b!1362714 (= e!773185 call!65425)))

(declare-fun e!773182 () Bool)

(declare-fun b!1362715 () Bool)

(assert (=> b!1362715 (= e!773182 (contains!9528 acc!759 (select (arr!44788 a!3742) from!3120)))))

(declare-fun d!146287 () Bool)

(declare-fun res!906074 () Bool)

(declare-fun e!773183 () Bool)

(assert (=> d!146287 (=> res!906074 e!773183)))

(assert (=> d!146287 (= res!906074 (bvsge from!3120 (size!45339 a!3742)))))

(assert (=> d!146287 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773183)))

(declare-fun b!1362716 () Bool)

(declare-fun e!773184 () Bool)

(assert (=> b!1362716 (= e!773183 e!773184)))

(declare-fun res!906073 () Bool)

(assert (=> b!1362716 (=> (not res!906073) (not e!773184))))

(assert (=> b!1362716 (= res!906073 (not e!773182))))

(declare-fun res!906075 () Bool)

(assert (=> b!1362716 (=> (not res!906075) (not e!773182))))

(assert (=> b!1362716 (= res!906075 (validKeyInArray!0 (select (arr!44788 a!3742) from!3120)))))

(declare-fun b!1362717 () Bool)

(assert (=> b!1362717 (= e!773185 call!65425)))

(declare-fun c!127768 () Bool)

(declare-fun bm!65422 () Bool)

(assert (=> bm!65422 (= call!65425 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127768 (Cons!31812 (select (arr!44788 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1362718 () Bool)

(assert (=> b!1362718 (= e!773184 e!773185)))

(assert (=> b!1362718 (= c!127768 (validKeyInArray!0 (select (arr!44788 a!3742) from!3120)))))

(assert (= (and d!146287 (not res!906074)) b!1362716))

(assert (= (and b!1362716 res!906075) b!1362715))

(assert (= (and b!1362716 res!906073) b!1362718))

(assert (= (and b!1362718 c!127768) b!1362714))

(assert (= (and b!1362718 (not c!127768)) b!1362717))

(assert (= (or b!1362714 b!1362717) bm!65422))

(assert (=> b!1362715 m!1248015))

(assert (=> b!1362715 m!1248015))

(declare-fun m!1248131 () Bool)

(assert (=> b!1362715 m!1248131))

(assert (=> b!1362716 m!1248015))

(assert (=> b!1362716 m!1248015))

(assert (=> b!1362716 m!1248041))

(assert (=> bm!65422 m!1248015))

(declare-fun m!1248133 () Bool)

(assert (=> bm!65422 m!1248133))

(assert (=> b!1362718 m!1248015))

(assert (=> b!1362718 m!1248015))

(assert (=> b!1362718 m!1248041))

(assert (=> b!1362584 d!146287))

(declare-fun d!146293 () Bool)

(declare-fun lt!600645 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!695 (List!31816) (InoxSet (_ BitVec 64)))

(assert (=> d!146293 (= lt!600645 (select (content!695 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773199 () Bool)

(assert (=> d!146293 (= lt!600645 e!773199)))

(declare-fun res!906086 () Bool)

(assert (=> d!146293 (=> (not res!906086) (not e!773199))))

(assert (=> d!146293 (= res!906086 ((_ is Cons!31812) acc!759))))

(assert (=> d!146293 (= (contains!9528 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600645)))

(declare-fun b!1362733 () Bool)

(declare-fun e!773198 () Bool)

(assert (=> b!1362733 (= e!773199 e!773198)))

(declare-fun res!906087 () Bool)

(assert (=> b!1362733 (=> res!906087 e!773198)))

(assert (=> b!1362733 (= res!906087 (= (h!33030 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362734 () Bool)

(assert (=> b!1362734 (= e!773198 (contains!9528 (t!46490 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146293 res!906086) b!1362733))

(assert (= (and b!1362733 (not res!906087)) b!1362734))

(declare-fun m!1248135 () Bool)

(assert (=> d!146293 m!1248135))

(declare-fun m!1248137 () Bool)

(assert (=> d!146293 m!1248137))

(declare-fun m!1248139 () Bool)

(assert (=> b!1362734 m!1248139))

(assert (=> b!1362593 d!146293))

(declare-fun b!1362735 () Bool)

(declare-fun e!773203 () Bool)

(declare-fun call!65428 () Bool)

(assert (=> b!1362735 (= e!773203 call!65428)))

(declare-fun b!1362736 () Bool)

(declare-fun e!773200 () Bool)

(assert (=> b!1362736 (= e!773200 (contains!9528 Nil!31813 (select (arr!44788 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146299 () Bool)

(declare-fun res!906089 () Bool)

(declare-fun e!773201 () Bool)

(assert (=> d!146299 (=> res!906089 e!773201)))

(assert (=> d!146299 (= res!906089 (bvsge #b00000000000000000000000000000000 (size!45339 a!3742)))))

(assert (=> d!146299 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31813) e!773201)))

(declare-fun b!1362737 () Bool)

(declare-fun e!773202 () Bool)

(assert (=> b!1362737 (= e!773201 e!773202)))

(declare-fun res!906088 () Bool)

(assert (=> b!1362737 (=> (not res!906088) (not e!773202))))

(assert (=> b!1362737 (= res!906088 (not e!773200))))

(declare-fun res!906090 () Bool)

(assert (=> b!1362737 (=> (not res!906090) (not e!773200))))

(assert (=> b!1362737 (= res!906090 (validKeyInArray!0 (select (arr!44788 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1362738 () Bool)

(assert (=> b!1362738 (= e!773203 call!65428)))

(declare-fun bm!65425 () Bool)

(declare-fun c!127771 () Bool)

(assert (=> bm!65425 (= call!65428 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127771 (Cons!31812 (select (arr!44788 a!3742) #b00000000000000000000000000000000) Nil!31813) Nil!31813)))))

(declare-fun b!1362739 () Bool)

(assert (=> b!1362739 (= e!773202 e!773203)))

(assert (=> b!1362739 (= c!127771 (validKeyInArray!0 (select (arr!44788 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146299 (not res!906089)) b!1362737))

(assert (= (and b!1362737 res!906090) b!1362736))

(assert (= (and b!1362737 res!906088) b!1362739))

(assert (= (and b!1362739 c!127771) b!1362735))

(assert (= (and b!1362739 (not c!127771)) b!1362738))

(assert (= (or b!1362735 b!1362738) bm!65425))

(declare-fun m!1248141 () Bool)

(assert (=> b!1362736 m!1248141))

(assert (=> b!1362736 m!1248141))

(declare-fun m!1248143 () Bool)

(assert (=> b!1362736 m!1248143))

(assert (=> b!1362737 m!1248141))

(assert (=> b!1362737 m!1248141))

(declare-fun m!1248145 () Bool)

(assert (=> b!1362737 m!1248145))

(assert (=> bm!65425 m!1248141))

(declare-fun m!1248149 () Bool)

(assert (=> bm!65425 m!1248149))

(assert (=> b!1362739 m!1248141))

(assert (=> b!1362739 m!1248141))

(assert (=> b!1362739 m!1248145))

(assert (=> b!1362583 d!146299))

(declare-fun d!146301 () Bool)

(declare-fun res!906094 () Bool)

(declare-fun e!773208 () Bool)

(assert (=> d!146301 (=> res!906094 e!773208)))

(assert (=> d!146301 (= res!906094 ((_ is Nil!31813) lt!600609))))

(assert (=> d!146301 (= (noDuplicate!2359 lt!600609) e!773208)))

(declare-fun b!1362745 () Bool)

(declare-fun e!773209 () Bool)

(assert (=> b!1362745 (= e!773208 e!773209)))

(declare-fun res!906095 () Bool)

(assert (=> b!1362745 (=> (not res!906095) (not e!773209))))

(assert (=> b!1362745 (= res!906095 (not (contains!9528 (t!46490 lt!600609) (h!33030 lt!600609))))))

(declare-fun b!1362746 () Bool)

(assert (=> b!1362746 (= e!773209 (noDuplicate!2359 (t!46490 lt!600609)))))

(assert (= (and d!146301 (not res!906094)) b!1362745))

(assert (= (and b!1362745 res!906095) b!1362746))

(declare-fun m!1248157 () Bool)

(assert (=> b!1362745 m!1248157))

(declare-fun m!1248159 () Bool)

(assert (=> b!1362746 m!1248159))

(assert (=> b!1362581 d!146301))

(declare-fun d!146305 () Bool)

(assert (=> d!146305 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362592 d!146305))

(declare-fun d!146309 () Bool)

(declare-fun lt!600648 () Bool)

(assert (=> d!146309 (= lt!600648 (select (content!695 lt!600609) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773215 () Bool)

(assert (=> d!146309 (= lt!600648 e!773215)))

(declare-fun res!906099 () Bool)

(assert (=> d!146309 (=> (not res!906099) (not e!773215))))

(assert (=> d!146309 (= res!906099 ((_ is Cons!31812) lt!600609))))

(assert (=> d!146309 (= (contains!9528 lt!600609 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600648)))

(declare-fun b!1362752 () Bool)

(declare-fun e!773214 () Bool)

(assert (=> b!1362752 (= e!773215 e!773214)))

(declare-fun res!906100 () Bool)

(assert (=> b!1362752 (=> res!906100 e!773214)))

(assert (=> b!1362752 (= res!906100 (= (h!33030 lt!600609) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362753 () Bool)

(assert (=> b!1362753 (= e!773214 (contains!9528 (t!46490 lt!600609) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146309 res!906099) b!1362752))

(assert (= (and b!1362752 (not res!906100)) b!1362753))

(declare-fun m!1248169 () Bool)

(assert (=> d!146309 m!1248169))

(declare-fun m!1248171 () Bool)

(assert (=> d!146309 m!1248171))

(declare-fun m!1248173 () Bool)

(assert (=> b!1362753 m!1248173))

(assert (=> b!1362590 d!146309))

(declare-fun d!146311 () Bool)

(declare-fun lt!600650 () Bool)

(assert (=> d!146311 (= lt!600650 (select (content!695 lt!600609) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773217 () Bool)

(assert (=> d!146311 (= lt!600650 e!773217)))

(declare-fun res!906101 () Bool)

(assert (=> d!146311 (=> (not res!906101) (not e!773217))))

(assert (=> d!146311 (= res!906101 ((_ is Cons!31812) lt!600609))))

(assert (=> d!146311 (= (contains!9528 lt!600609 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600650)))

(declare-fun b!1362754 () Bool)

(declare-fun e!773216 () Bool)

(assert (=> b!1362754 (= e!773217 e!773216)))

(declare-fun res!906102 () Bool)

(assert (=> b!1362754 (=> res!906102 e!773216)))

(assert (=> b!1362754 (= res!906102 (= (h!33030 lt!600609) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362755 () Bool)

(assert (=> b!1362755 (= e!773216 (contains!9528 (t!46490 lt!600609) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146311 res!906101) b!1362754))

(assert (= (and b!1362754 (not res!906102)) b!1362755))

(assert (=> d!146311 m!1248169))

(declare-fun m!1248177 () Bool)

(assert (=> d!146311 m!1248177))

(declare-fun m!1248179 () Bool)

(assert (=> b!1362755 m!1248179))

(assert (=> b!1362580 d!146311))

(declare-fun d!146315 () Bool)

(assert (=> d!146315 (= (validKeyInArray!0 (select (arr!44788 a!3742) from!3120)) (and (not (= (select (arr!44788 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44788 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362589 d!146315))

(declare-fun d!146317 () Bool)

(assert (=> d!146317 (= (array_inv!34069 a!3742) (bvsge (size!45339 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115036 d!146317))

(declare-fun d!146319 () Bool)

(declare-fun lt!600651 () Bool)

(assert (=> d!146319 (= lt!600651 (select (content!695 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773223 () Bool)

(assert (=> d!146319 (= lt!600651 e!773223)))

(declare-fun res!906107 () Bool)

(assert (=> d!146319 (=> (not res!906107) (not e!773223))))

(assert (=> d!146319 (= res!906107 ((_ is Cons!31812) acc!759))))

(assert (=> d!146319 (= (contains!9528 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600651)))

(declare-fun b!1362760 () Bool)

(declare-fun e!773222 () Bool)

(assert (=> b!1362760 (= e!773223 e!773222)))

(declare-fun res!906108 () Bool)

(assert (=> b!1362760 (=> res!906108 e!773222)))

(assert (=> b!1362760 (= res!906108 (= (h!33030 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362761 () Bool)

(assert (=> b!1362761 (= e!773222 (contains!9528 (t!46490 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146319 res!906107) b!1362760))

(assert (= (and b!1362760 (not res!906108)) b!1362761))

(assert (=> d!146319 m!1248135))

(declare-fun m!1248181 () Bool)

(assert (=> d!146319 m!1248181))

(declare-fun m!1248183 () Bool)

(assert (=> b!1362761 m!1248183))

(assert (=> b!1362588 d!146319))

(declare-fun d!146321 () Bool)

(assert (=> d!146321 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600655 () Unit!44804)

(declare-fun choose!80 (array!92713 List!31816 List!31816 (_ BitVec 32)) Unit!44804)

(assert (=> d!146321 (= lt!600655 (choose!80 a!3742 ($colon$colon!889 acc!759 (select (arr!44788 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146321 (bvslt (size!45339 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146321 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!889 acc!759 (select (arr!44788 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600655)))

(declare-fun bs!39056 () Bool)

(assert (= bs!39056 d!146321))

(assert (=> bs!39056 m!1248021))

(assert (=> bs!39056 m!1248017))

(declare-fun m!1248199 () Bool)

(assert (=> bs!39056 m!1248199))

(assert (=> b!1362586 d!146321))

(declare-fun b!1362809 () Bool)

(declare-fun e!773269 () Bool)

(assert (=> b!1362809 (= e!773269 (subseq!887 acc!759 (t!46490 acc!759)))))

(declare-fun b!1362808 () Bool)

(declare-fun e!773268 () Bool)

(assert (=> b!1362808 (= e!773268 (subseq!887 (t!46490 acc!759) (t!46490 acc!759)))))

(declare-fun b!1362807 () Bool)

(declare-fun e!773266 () Bool)

(assert (=> b!1362807 (= e!773266 e!773269)))

(declare-fun res!906149 () Bool)

(assert (=> b!1362807 (=> res!906149 e!773269)))

(assert (=> b!1362807 (= res!906149 e!773268)))

(declare-fun res!906151 () Bool)

(assert (=> b!1362807 (=> (not res!906151) (not e!773268))))

(assert (=> b!1362807 (= res!906151 (= (h!33030 acc!759) (h!33030 acc!759)))))

(declare-fun d!146329 () Bool)

(declare-fun res!906152 () Bool)

(declare-fun e!773267 () Bool)

(assert (=> d!146329 (=> res!906152 e!773267)))

(assert (=> d!146329 (= res!906152 ((_ is Nil!31813) acc!759))))

(assert (=> d!146329 (= (subseq!887 acc!759 acc!759) e!773267)))

(declare-fun b!1362806 () Bool)

(assert (=> b!1362806 (= e!773267 e!773266)))

(declare-fun res!906150 () Bool)

(assert (=> b!1362806 (=> (not res!906150) (not e!773266))))

(assert (=> b!1362806 (= res!906150 ((_ is Cons!31812) acc!759))))

(assert (= (and d!146329 (not res!906152)) b!1362806))

(assert (= (and b!1362806 res!906150) b!1362807))

(assert (= (and b!1362807 res!906151) b!1362808))

(assert (= (and b!1362807 (not res!906149)) b!1362809))

(declare-fun m!1248207 () Bool)

(assert (=> b!1362809 m!1248207))

(declare-fun m!1248209 () Bool)

(assert (=> b!1362808 m!1248209))

(assert (=> b!1362586 d!146329))

(declare-fun b!1362810 () Bool)

(declare-fun e!773273 () Bool)

(declare-fun call!65433 () Bool)

(assert (=> b!1362810 (= e!773273 call!65433)))

(declare-fun b!1362811 () Bool)

(declare-fun e!773270 () Bool)

(assert (=> b!1362811 (= e!773270 (contains!9528 acc!759 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146335 () Bool)

(declare-fun res!906154 () Bool)

(declare-fun e!773271 () Bool)

(assert (=> d!146335 (=> res!906154 e!773271)))

(assert (=> d!146335 (= res!906154 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45339 a!3742)))))

(assert (=> d!146335 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773271)))

(declare-fun b!1362812 () Bool)

(declare-fun e!773272 () Bool)

(assert (=> b!1362812 (= e!773271 e!773272)))

(declare-fun res!906153 () Bool)

(assert (=> b!1362812 (=> (not res!906153) (not e!773272))))

(assert (=> b!1362812 (= res!906153 (not e!773270))))

(declare-fun res!906155 () Bool)

(assert (=> b!1362812 (=> (not res!906155) (not e!773270))))

(assert (=> b!1362812 (= res!906155 (validKeyInArray!0 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362813 () Bool)

(assert (=> b!1362813 (= e!773273 call!65433)))

(declare-fun c!127776 () Bool)

(declare-fun bm!65430 () Bool)

(assert (=> bm!65430 (= call!65433 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127776 (Cons!31812 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1362814 () Bool)

(assert (=> b!1362814 (= e!773272 e!773273)))

(assert (=> b!1362814 (= c!127776 (validKeyInArray!0 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146335 (not res!906154)) b!1362812))

(assert (= (and b!1362812 res!906155) b!1362811))

(assert (= (and b!1362812 res!906153) b!1362814))

(assert (= (and b!1362814 c!127776) b!1362810))

(assert (= (and b!1362814 (not c!127776)) b!1362813))

(assert (= (or b!1362810 b!1362813) bm!65430))

(declare-fun m!1248211 () Bool)

(assert (=> b!1362811 m!1248211))

(assert (=> b!1362811 m!1248211))

(declare-fun m!1248213 () Bool)

(assert (=> b!1362811 m!1248213))

(assert (=> b!1362812 m!1248211))

(assert (=> b!1362812 m!1248211))

(declare-fun m!1248215 () Bool)

(assert (=> b!1362812 m!1248215))

(assert (=> bm!65430 m!1248211))

(declare-fun m!1248217 () Bool)

(assert (=> bm!65430 m!1248217))

(assert (=> b!1362814 m!1248211))

(assert (=> b!1362814 m!1248211))

(assert (=> b!1362814 m!1248215))

(assert (=> b!1362586 d!146335))

(assert (=> b!1362586 d!146285))

(declare-fun d!146337 () Bool)

(assert (=> d!146337 (subseq!887 acc!759 acc!759)))

(declare-fun lt!600661 () Unit!44804)

(declare-fun choose!36 (List!31816) Unit!44804)

(assert (=> d!146337 (= lt!600661 (choose!36 acc!759))))

(assert (=> d!146337 (= (lemmaListSubSeqRefl!0 acc!759) lt!600661)))

(declare-fun bs!39058 () Bool)

(assert (= bs!39058 d!146337))

(assert (=> bs!39058 m!1248023))

(declare-fun m!1248227 () Bool)

(assert (=> bs!39058 m!1248227))

(assert (=> b!1362586 d!146337))

(declare-fun b!1362829 () Bool)

(declare-fun e!773289 () Bool)

(declare-fun call!65436 () Bool)

(assert (=> b!1362829 (= e!773289 call!65436)))

(declare-fun b!1362830 () Bool)

(declare-fun e!773286 () Bool)

(assert (=> b!1362830 (= e!773286 (contains!9528 lt!600609 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146341 () Bool)

(declare-fun res!906167 () Bool)

(declare-fun e!773287 () Bool)

(assert (=> d!146341 (=> res!906167 e!773287)))

(assert (=> d!146341 (= res!906167 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45339 a!3742)))))

(assert (=> d!146341 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600609) e!773287)))

(declare-fun b!1362831 () Bool)

(declare-fun e!773288 () Bool)

(assert (=> b!1362831 (= e!773287 e!773288)))

(declare-fun res!906166 () Bool)

(assert (=> b!1362831 (=> (not res!906166) (not e!773288))))

(assert (=> b!1362831 (= res!906166 (not e!773286))))

(declare-fun res!906168 () Bool)

(assert (=> b!1362831 (=> (not res!906168) (not e!773286))))

(assert (=> b!1362831 (= res!906168 (validKeyInArray!0 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362832 () Bool)

(assert (=> b!1362832 (= e!773289 call!65436)))

(declare-fun c!127779 () Bool)

(declare-fun bm!65433 () Bool)

(assert (=> bm!65433 (= call!65436 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127779 (Cons!31812 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600609) lt!600609)))))

(declare-fun b!1362833 () Bool)

(assert (=> b!1362833 (= e!773288 e!773289)))

(assert (=> b!1362833 (= c!127779 (validKeyInArray!0 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146341 (not res!906167)) b!1362831))

(assert (= (and b!1362831 res!906168) b!1362830))

(assert (= (and b!1362831 res!906166) b!1362833))

(assert (= (and b!1362833 c!127779) b!1362829))

(assert (= (and b!1362833 (not c!127779)) b!1362832))

(assert (= (or b!1362829 b!1362832) bm!65433))

(assert (=> b!1362830 m!1248211))

(assert (=> b!1362830 m!1248211))

(declare-fun m!1248237 () Bool)

(assert (=> b!1362830 m!1248237))

(assert (=> b!1362831 m!1248211))

(assert (=> b!1362831 m!1248211))

(assert (=> b!1362831 m!1248215))

(assert (=> bm!65433 m!1248211))

(declare-fun m!1248239 () Bool)

(assert (=> bm!65433 m!1248239))

(assert (=> b!1362833 m!1248211))

(assert (=> b!1362833 m!1248211))

(assert (=> b!1362833 m!1248215))

(assert (=> b!1362585 d!146341))

(check-sat (not b!1362736) (not b!1362737) (not b!1362739) (not b!1362716) (not b!1362830) (not b!1362808) (not b!1362697) (not b!1362745) (not b!1362831) (not b!1362734) (not bm!65425) (not b!1362814) (not d!146309) (not b!1362746) (not b!1362833) (not b!1362811) (not b!1362718) (not b!1362715) (not b!1362812) (not d!146319) (not b!1362809) (not d!146321) (not b!1362761) (not d!146293) (not d!146337) (not d!146311) (not bm!65422) (not b!1362696) (not bm!65433) (not b!1362755) (not bm!65430) (not b!1362753))
(check-sat)
