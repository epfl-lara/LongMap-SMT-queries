; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115082 () Bool)

(assert start!115082)

(declare-fun res!907620 () Bool)

(declare-fun e!773401 () Bool)

(assert (=> start!115082 (=> (not res!907620) (not e!773401))))

(declare-datatypes ((array!92709 0))(
  ( (array!92710 (arr!44786 (Array (_ BitVec 32) (_ BitVec 64))) (size!45336 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92709)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!115082 (= res!907620 (and (bvslt (size!45336 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45336 a!3742))))))

(assert (=> start!115082 e!773401))

(assert (=> start!115082 true))

(declare-fun array_inv!33814 (array!92709) Bool)

(assert (=> start!115082 (array_inv!33814 a!3742)))

(declare-fun b!1363882 () Bool)

(declare-fun res!907629 () Bool)

(assert (=> b!1363882 (=> (not res!907629) (not e!773401))))

(declare-datatypes ((List!31827 0))(
  ( (Nil!31824) (Cons!31823 (h!33032 (_ BitVec 64)) (t!46518 List!31827)) )
))
(declare-fun acc!759 () List!31827)

(declare-fun noDuplicate!2393 (List!31827) Bool)

(assert (=> b!1363882 (= res!907629 (noDuplicate!2393 acc!759))))

(declare-fun b!1363883 () Bool)

(declare-fun res!907621 () Bool)

(assert (=> b!1363883 (=> (not res!907621) (not e!773401))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363883 (= res!907621 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363884 () Bool)

(declare-fun res!907625 () Bool)

(assert (=> b!1363884 (=> (not res!907625) (not e!773401))))

(declare-fun contains!9536 (List!31827 (_ BitVec 64)) Bool)

(assert (=> b!1363884 (= res!907625 (not (contains!9536 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363885 () Bool)

(declare-fun res!907624 () Bool)

(assert (=> b!1363885 (=> (not res!907624) (not e!773401))))

(declare-fun arrayNoDuplicates!0 (array!92709 (_ BitVec 32) List!31827) Bool)

(assert (=> b!1363885 (= res!907624 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363886 () Bool)

(declare-fun e!773403 () Bool)

(assert (=> b!1363886 (= e!773401 e!773403)))

(declare-fun res!907627 () Bool)

(assert (=> b!1363886 (=> (not res!907627) (not e!773403))))

(declare-fun lt!600937 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363886 (= res!907627 (and (not (= from!3120 i!1404)) (not lt!600937) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!45018 0))(
  ( (Unit!45019) )
))
(declare-fun lt!600936 () Unit!45018)

(declare-fun e!773404 () Unit!45018)

(assert (=> b!1363886 (= lt!600936 e!773404)))

(declare-fun c!127571 () Bool)

(assert (=> b!1363886 (= c!127571 lt!600937)))

(assert (=> b!1363886 (= lt!600937 (validKeyInArray!0 (select (arr!44786 a!3742) from!3120)))))

(declare-fun b!1363887 () Bool)

(declare-fun res!907630 () Bool)

(assert (=> b!1363887 (=> (not res!907630) (not e!773401))))

(assert (=> b!1363887 (= res!907630 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45336 a!3742))))))

(declare-fun b!1363888 () Bool)

(declare-fun lt!600935 () Unit!45018)

(assert (=> b!1363888 (= e!773404 lt!600935)))

(declare-fun lt!600940 () Unit!45018)

(declare-fun lemmaListSubSeqRefl!0 (List!31827) Unit!45018)

(assert (=> b!1363888 (= lt!600940 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!938 (List!31827 List!31827) Bool)

(assert (=> b!1363888 (subseq!938 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92709 List!31827 List!31827 (_ BitVec 32)) Unit!45018)

(declare-fun $colon$colon!941 (List!31827 (_ BitVec 64)) List!31827)

(assert (=> b!1363888 (= lt!600935 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!941 acc!759 (select (arr!44786 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363888 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363889 () Bool)

(declare-fun res!907623 () Bool)

(assert (=> b!1363889 (=> (not res!907623) (not e!773401))))

(assert (=> b!1363889 (= res!907623 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45336 a!3742)))))

(declare-fun b!1363890 () Bool)

(declare-fun res!907628 () Bool)

(assert (=> b!1363890 (=> (not res!907628) (not e!773401))))

(assert (=> b!1363890 (= res!907628 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31824))))

(declare-fun b!1363891 () Bool)

(declare-fun res!907622 () Bool)

(assert (=> b!1363891 (=> (not res!907622) (not e!773401))))

(assert (=> b!1363891 (= res!907622 (not (contains!9536 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363892 () Bool)

(declare-fun res!907626 () Bool)

(assert (=> b!1363892 (=> (not res!907626) (not e!773403))))

(assert (=> b!1363892 (= res!907626 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363893 () Bool)

(declare-fun Unit!45020 () Unit!45018)

(assert (=> b!1363893 (= e!773404 Unit!45020)))

(declare-fun b!1363894 () Bool)

(declare-fun lt!600939 () array!92709)

(assert (=> b!1363894 (= e!773403 (not (arrayNoDuplicates!0 lt!600939 from!3120 acc!759)))))

(assert (=> b!1363894 (arrayNoDuplicates!0 lt!600939 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (=> b!1363894 (= lt!600939 (array!92710 (store (arr!44786 a!3742) i!1404 l!3587) (size!45336 a!3742)))))

(declare-fun lt!600938 () Unit!45018)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31827) Unit!45018)

(assert (=> b!1363894 (= lt!600938 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!115082 res!907620) b!1363882))

(assert (= (and b!1363882 res!907629) b!1363891))

(assert (= (and b!1363891 res!907622) b!1363884))

(assert (= (and b!1363884 res!907625) b!1363890))

(assert (= (and b!1363890 res!907628) b!1363885))

(assert (= (and b!1363885 res!907624) b!1363887))

(assert (= (and b!1363887 res!907630) b!1363883))

(assert (= (and b!1363883 res!907621) b!1363889))

(assert (= (and b!1363889 res!907623) b!1363886))

(assert (= (and b!1363886 c!127571) b!1363888))

(assert (= (and b!1363886 (not c!127571)) b!1363893))

(assert (= (and b!1363886 res!907627) b!1363892))

(assert (= (and b!1363892 res!907626) b!1363894))

(declare-fun m!1248595 () Bool)

(assert (=> b!1363894 m!1248595))

(declare-fun m!1248597 () Bool)

(assert (=> b!1363894 m!1248597))

(declare-fun m!1248599 () Bool)

(assert (=> b!1363894 m!1248599))

(declare-fun m!1248601 () Bool)

(assert (=> b!1363894 m!1248601))

(declare-fun m!1248603 () Bool)

(assert (=> b!1363892 m!1248603))

(declare-fun m!1248605 () Bool)

(assert (=> b!1363891 m!1248605))

(declare-fun m!1248607 () Bool)

(assert (=> start!115082 m!1248607))

(declare-fun m!1248609 () Bool)

(assert (=> b!1363886 m!1248609))

(assert (=> b!1363886 m!1248609))

(declare-fun m!1248611 () Bool)

(assert (=> b!1363886 m!1248611))

(declare-fun m!1248613 () Bool)

(assert (=> b!1363888 m!1248613))

(assert (=> b!1363888 m!1248609))

(declare-fun m!1248615 () Bool)

(assert (=> b!1363888 m!1248615))

(declare-fun m!1248617 () Bool)

(assert (=> b!1363888 m!1248617))

(assert (=> b!1363888 m!1248603))

(assert (=> b!1363888 m!1248609))

(assert (=> b!1363888 m!1248615))

(declare-fun m!1248619 () Bool)

(assert (=> b!1363888 m!1248619))

(declare-fun m!1248621 () Bool)

(assert (=> b!1363890 m!1248621))

(declare-fun m!1248623 () Bool)

(assert (=> b!1363883 m!1248623))

(declare-fun m!1248625 () Bool)

(assert (=> b!1363882 m!1248625))

(declare-fun m!1248627 () Bool)

(assert (=> b!1363885 m!1248627))

(declare-fun m!1248629 () Bool)

(assert (=> b!1363884 m!1248629))

(push 1)

(assert (not b!1363883))

(assert (not start!115082))

(assert (not b!1363890))

(assert (not b!1363886))

(assert (not b!1363894))

(assert (not b!1363892))

(assert (not b!1363884))

(assert (not b!1363882))

(assert (not b!1363891))

(assert (not b!1363888))

(assert (not b!1363885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146183 () Bool)

(declare-fun res!907733 () Bool)

(declare-fun e!773471 () Bool)

(assert (=> d!146183 (=> res!907733 e!773471)))

(assert (=> d!146183 (= res!907733 (is-Nil!31824 acc!759))))

(assert (=> d!146183 (= (noDuplicate!2393 acc!759) e!773471)))

(declare-fun b!1364021 () Bool)

(declare-fun e!773472 () Bool)

(assert (=> b!1364021 (= e!773471 e!773472)))

(declare-fun res!907734 () Bool)

(assert (=> b!1364021 (=> (not res!907734) (not e!773472))))

(assert (=> b!1364021 (= res!907734 (not (contains!9536 (t!46518 acc!759) (h!33032 acc!759))))))

(declare-fun b!1364022 () Bool)

(assert (=> b!1364022 (= e!773472 (noDuplicate!2393 (t!46518 acc!759)))))

(assert (= (and d!146183 (not res!907733)) b!1364021))

(assert (= (and b!1364021 res!907734) b!1364022))

(declare-fun m!1248727 () Bool)

(assert (=> b!1364021 m!1248727))

(declare-fun m!1248729 () Bool)

(assert (=> b!1364022 m!1248729))

(assert (=> b!1363882 d!146183))

(declare-fun b!1364061 () Bool)

(declare-fun e!773509 () Bool)

(declare-fun e!773508 () Bool)

(assert (=> b!1364061 (= e!773509 e!773508)))

(declare-fun c!127588 () Bool)

(assert (=> b!1364061 (= c!127588 (validKeyInArray!0 (select (arr!44786 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364062 () Bool)

(declare-fun call!65425 () Bool)

(assert (=> b!1364062 (= e!773508 call!65425)))

(declare-fun e!773510 () Bool)

(declare-fun b!1364063 () Bool)

(assert (=> b!1364063 (= e!773510 (contains!9536 acc!759 (select (arr!44786 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364064 () Bool)

(declare-fun e!773507 () Bool)

(assert (=> b!1364064 (= e!773507 e!773509)))

(declare-fun res!907766 () Bool)

(assert (=> b!1364064 (=> (not res!907766) (not e!773509))))

(assert (=> b!1364064 (= res!907766 (not e!773510))))

(declare-fun res!907765 () Bool)

(assert (=> b!1364064 (=> (not res!907765) (not e!773510))))

(assert (=> b!1364064 (= res!907765 (validKeyInArray!0 (select (arr!44786 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364065 () Bool)

(assert (=> b!1364065 (= e!773508 call!65425)))

(declare-fun d!146187 () Bool)

(declare-fun res!907767 () Bool)

(assert (=> d!146187 (=> res!907767 e!773507)))

(assert (=> d!146187 (= res!907767 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45336 a!3742)))))

(assert (=> d!146187 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773507)))

(declare-fun bm!65422 () Bool)

(assert (=> bm!65422 (= call!65425 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127588 (Cons!31823 (select (arr!44786 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(assert (= (and d!146187 (not res!907767)) b!1364064))

(assert (= (and b!1364064 res!907765) b!1364063))

(assert (= (and b!1364064 res!907766) b!1364061))

(assert (= (and b!1364061 c!127588) b!1364065))

(assert (= (and b!1364061 (not c!127588)) b!1364062))

(assert (= (or b!1364065 b!1364062) bm!65422))

(declare-fun m!1248759 () Bool)

(assert (=> b!1364061 m!1248759))

(assert (=> b!1364061 m!1248759))

(declare-fun m!1248761 () Bool)

(assert (=> b!1364061 m!1248761))

(assert (=> b!1364063 m!1248759))

(assert (=> b!1364063 m!1248759))

(declare-fun m!1248763 () Bool)

(assert (=> b!1364063 m!1248763))

(assert (=> b!1364064 m!1248759))

(assert (=> b!1364064 m!1248759))

(assert (=> b!1364064 m!1248761))

(assert (=> bm!65422 m!1248759))

(declare-fun m!1248765 () Bool)

(assert (=> bm!65422 m!1248765))

(assert (=> b!1363892 d!146187))

(declare-fun d!146211 () Bool)

(declare-fun lt!600995 () Bool)

(declare-fun content!706 (List!31827) (Set (_ BitVec 64)))

(assert (=> d!146211 (= lt!600995 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!706 acc!759)))))

(declare-fun e!773539 () Bool)

(assert (=> d!146211 (= lt!600995 e!773539)))

(declare-fun res!907794 () Bool)

(assert (=> d!146211 (=> (not res!907794) (not e!773539))))

(assert (=> d!146211 (= res!907794 (is-Cons!31823 acc!759))))

(assert (=> d!146211 (= (contains!9536 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600995)))

(declare-fun b!1364097 () Bool)

(declare-fun e!773540 () Bool)

(assert (=> b!1364097 (= e!773539 e!773540)))

(declare-fun res!907793 () Bool)

(assert (=> b!1364097 (=> res!907793 e!773540)))

(assert (=> b!1364097 (= res!907793 (= (h!33032 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364098 () Bool)

(assert (=> b!1364098 (= e!773540 (contains!9536 (t!46518 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146211 res!907794) b!1364097))

(assert (= (and b!1364097 (not res!907793)) b!1364098))

(declare-fun m!1248787 () Bool)

(assert (=> d!146211 m!1248787))

(declare-fun m!1248789 () Bool)

(assert (=> d!146211 m!1248789))

(declare-fun m!1248793 () Bool)

(assert (=> b!1364098 m!1248793))

(assert (=> b!1363891 d!146211))

(declare-fun d!146221 () Bool)

(declare-fun lt!600996 () Bool)

(assert (=> d!146221 (= lt!600996 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!706 acc!759)))))

(declare-fun e!773541 () Bool)

(assert (=> d!146221 (= lt!600996 e!773541)))

(declare-fun res!907796 () Bool)

(assert (=> d!146221 (=> (not res!907796) (not e!773541))))

(assert (=> d!146221 (= res!907796 (is-Cons!31823 acc!759))))

(assert (=> d!146221 (= (contains!9536 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600996)))

(declare-fun b!1364099 () Bool)

(declare-fun e!773542 () Bool)

(assert (=> b!1364099 (= e!773541 e!773542)))

(declare-fun res!907795 () Bool)

(assert (=> b!1364099 (=> res!907795 e!773542)))

(assert (=> b!1364099 (= res!907795 (= (h!33032 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364100 () Bool)

(assert (=> b!1364100 (= e!773542 (contains!9536 (t!46518 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146221 res!907796) b!1364099))

(assert (= (and b!1364099 (not res!907795)) b!1364100))

(assert (=> d!146221 m!1248787))

(declare-fun m!1248803 () Bool)

(assert (=> d!146221 m!1248803))

(declare-fun m!1248805 () Bool)

(assert (=> b!1364100 m!1248805))

(assert (=> b!1363884 d!146221))

(declare-fun b!1364101 () Bool)

(declare-fun e!773545 () Bool)

(declare-fun e!773544 () Bool)

(assert (=> b!1364101 (= e!773545 e!773544)))

(declare-fun c!127592 () Bool)

(assert (=> b!1364101 (= c!127592 (validKeyInArray!0 (select (arr!44786 lt!600939) from!3120)))))

(declare-fun b!1364102 () Bool)

(declare-fun call!65429 () Bool)

(assert (=> b!1364102 (= e!773544 call!65429)))

(declare-fun e!773546 () Bool)

(declare-fun b!1364103 () Bool)

(assert (=> b!1364103 (= e!773546 (contains!9536 acc!759 (select (arr!44786 lt!600939) from!3120)))))

(declare-fun b!1364104 () Bool)

(declare-fun e!773543 () Bool)

(assert (=> b!1364104 (= e!773543 e!773545)))

(declare-fun res!907798 () Bool)

(assert (=> b!1364104 (=> (not res!907798) (not e!773545))))

(assert (=> b!1364104 (= res!907798 (not e!773546))))

(declare-fun res!907797 () Bool)

(assert (=> b!1364104 (=> (not res!907797) (not e!773546))))

(assert (=> b!1364104 (= res!907797 (validKeyInArray!0 (select (arr!44786 lt!600939) from!3120)))))

(declare-fun b!1364105 () Bool)

(assert (=> b!1364105 (= e!773544 call!65429)))

(declare-fun d!146227 () Bool)

(declare-fun res!907799 () Bool)

(assert (=> d!146227 (=> res!907799 e!773543)))

(assert (=> d!146227 (= res!907799 (bvsge from!3120 (size!45336 lt!600939)))))

(assert (=> d!146227 (= (arrayNoDuplicates!0 lt!600939 from!3120 acc!759) e!773543)))

(declare-fun bm!65426 () Bool)

(assert (=> bm!65426 (= call!65429 (arrayNoDuplicates!0 lt!600939 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127592 (Cons!31823 (select (arr!44786 lt!600939) from!3120) acc!759) acc!759)))))

(assert (= (and d!146227 (not res!907799)) b!1364104))

(assert (= (and b!1364104 res!907797) b!1364103))

(assert (= (and b!1364104 res!907798) b!1364101))

(assert (= (and b!1364101 c!127592) b!1364105))

(assert (= (and b!1364101 (not c!127592)) b!1364102))

(assert (= (or b!1364105 b!1364102) bm!65426))

(declare-fun m!1248807 () Bool)

(assert (=> b!1364101 m!1248807))

(assert (=> b!1364101 m!1248807))

(declare-fun m!1248809 () Bool)

(assert (=> b!1364101 m!1248809))

(assert (=> b!1364103 m!1248807))

(assert (=> b!1364103 m!1248807))

(declare-fun m!1248811 () Bool)

(assert (=> b!1364103 m!1248811))

(assert (=> b!1364104 m!1248807))

(assert (=> b!1364104 m!1248807))

(assert (=> b!1364104 m!1248809))

(assert (=> bm!65426 m!1248807))

(declare-fun m!1248813 () Bool)

(assert (=> bm!65426 m!1248813))

(assert (=> b!1363894 d!146227))

(declare-fun b!1364106 () Bool)

(declare-fun e!773549 () Bool)

(declare-fun e!773548 () Bool)

(assert (=> b!1364106 (= e!773549 e!773548)))

(declare-fun c!127593 () Bool)

(assert (=> b!1364106 (= c!127593 (validKeyInArray!0 (select (arr!44786 lt!600939) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364107 () Bool)

(declare-fun call!65430 () Bool)

(assert (=> b!1364107 (= e!773548 call!65430)))

(declare-fun e!773550 () Bool)

(declare-fun b!1364108 () Bool)

(assert (=> b!1364108 (= e!773550 (contains!9536 acc!759 (select (arr!44786 lt!600939) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364109 () Bool)

(declare-fun e!773547 () Bool)

(assert (=> b!1364109 (= e!773547 e!773549)))

(declare-fun res!907801 () Bool)

(assert (=> b!1364109 (=> (not res!907801) (not e!773549))))

(assert (=> b!1364109 (= res!907801 (not e!773550))))

(declare-fun res!907800 () Bool)

(assert (=> b!1364109 (=> (not res!907800) (not e!773550))))

(assert (=> b!1364109 (= res!907800 (validKeyInArray!0 (select (arr!44786 lt!600939) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364110 () Bool)

(assert (=> b!1364110 (= e!773548 call!65430)))

(declare-fun d!146229 () Bool)

(declare-fun res!907802 () Bool)

(assert (=> d!146229 (=> res!907802 e!773547)))

(assert (=> d!146229 (= res!907802 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45336 lt!600939)))))

(assert (=> d!146229 (= (arrayNoDuplicates!0 lt!600939 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773547)))

(declare-fun bm!65427 () Bool)

(assert (=> bm!65427 (= call!65430 (arrayNoDuplicates!0 lt!600939 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127593 (Cons!31823 (select (arr!44786 lt!600939) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(assert (= (and d!146229 (not res!907802)) b!1364109))

(assert (= (and b!1364109 res!907800) b!1364108))

(assert (= (and b!1364109 res!907801) b!1364106))

(assert (= (and b!1364106 c!127593) b!1364110))

(assert (= (and b!1364106 (not c!127593)) b!1364107))

(assert (= (or b!1364110 b!1364107) bm!65427))

(declare-fun m!1248815 () Bool)

(assert (=> b!1364106 m!1248815))

(assert (=> b!1364106 m!1248815))

(declare-fun m!1248817 () Bool)

(assert (=> b!1364106 m!1248817))

(assert (=> b!1364108 m!1248815))

(assert (=> b!1364108 m!1248815))

(declare-fun m!1248819 () Bool)

(assert (=> b!1364108 m!1248819))

(assert (=> b!1364109 m!1248815))

(assert (=> b!1364109 m!1248815))

(assert (=> b!1364109 m!1248817))

(assert (=> bm!65427 m!1248815))

(declare-fun m!1248821 () Bool)

(assert (=> bm!65427 m!1248821))

(assert (=> b!1363894 d!146229))

(declare-fun d!146231 () Bool)

(declare-fun e!773568 () Bool)

(assert (=> d!146231 e!773568))

(declare-fun res!907819 () Bool)

(assert (=> d!146231 (=> (not res!907819) (not e!773568))))

(assert (=> d!146231 (= res!907819 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45336 a!3742))))))

(declare-fun lt!601006 () Unit!45018)

(declare-fun choose!53 (array!92709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31827) Unit!45018)

(assert (=> d!146231 (= lt!601006 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (=> d!146231 (bvslt (size!45336 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146231 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) lt!601006)))

(declare-fun b!1364129 () Bool)

(assert (=> b!1364129 (= e!773568 (arrayNoDuplicates!0 (array!92710 (store (arr!44786 a!3742) i!1404 l!3587) (size!45336 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and d!146231 res!907819) b!1364129))

(declare-fun m!1248845 () Bool)

(assert (=> d!146231 m!1248845))

(assert (=> b!1364129 m!1248599))

(declare-fun m!1248847 () Bool)

(assert (=> b!1364129 m!1248847))

(assert (=> b!1363894 d!146231))

(declare-fun d!146247 () Bool)

(assert (=> d!146247 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363883 d!146247))

(declare-fun d!146251 () Bool)

(assert (=> d!146251 (= (validKeyInArray!0 (select (arr!44786 a!3742) from!3120)) (and (not (= (select (arr!44786 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44786 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363886 d!146251))

(declare-fun d!146253 () Bool)

(assert (=> d!146253 (= (array_inv!33814 a!3742) (bvsge (size!45336 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115082 d!146253))

(declare-fun b!1364140 () Bool)

(declare-fun e!773579 () Bool)

(declare-fun e!773578 () Bool)

(assert (=> b!1364140 (= e!773579 e!773578)))

(declare-fun c!127597 () Bool)

(assert (=> b!1364140 (= c!127597 (validKeyInArray!0 (select (arr!44786 a!3742) from!3120)))))

(declare-fun b!1364141 () Bool)

(declare-fun call!65434 () Bool)

(assert (=> b!1364141 (= e!773578 call!65434)))

(declare-fun b!1364142 () Bool)

(declare-fun e!773580 () Bool)

(assert (=> b!1364142 (= e!773580 (contains!9536 acc!759 (select (arr!44786 a!3742) from!3120)))))

(declare-fun b!1364143 () Bool)

(declare-fun e!773577 () Bool)

(assert (=> b!1364143 (= e!773577 e!773579)))

(declare-fun res!907827 () Bool)

(assert (=> b!1364143 (=> (not res!907827) (not e!773579))))

(assert (=> b!1364143 (= res!907827 (not e!773580))))

(declare-fun res!907826 () Bool)

(assert (=> b!1364143 (=> (not res!907826) (not e!773580))))

(assert (=> b!1364143 (= res!907826 (validKeyInArray!0 (select (arr!44786 a!3742) from!3120)))))

(declare-fun b!1364144 () Bool)

(assert (=> b!1364144 (= e!773578 call!65434)))

(declare-fun d!146257 () Bool)

(declare-fun res!907828 () Bool)

(assert (=> d!146257 (=> res!907828 e!773577)))

(assert (=> d!146257 (= res!907828 (bvsge from!3120 (size!45336 a!3742)))))

(assert (=> d!146257 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773577)))

(declare-fun bm!65431 () Bool)

(assert (=> bm!65431 (= call!65434 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127597 (Cons!31823 (select (arr!44786 a!3742) from!3120) acc!759) acc!759)))))

(assert (= (and d!146257 (not res!907828)) b!1364143))

(assert (= (and b!1364143 res!907826) b!1364142))

(assert (= (and b!1364143 res!907827) b!1364140))

(assert (= (and b!1364140 c!127597) b!1364144))

(assert (= (and b!1364140 (not c!127597)) b!1364141))

(assert (= (or b!1364144 b!1364141) bm!65431))

(assert (=> b!1364140 m!1248609))

(assert (=> b!1364140 m!1248609))

(assert (=> b!1364140 m!1248611))

(assert (=> b!1364142 m!1248609))

(assert (=> b!1364142 m!1248609))

(declare-fun m!1248865 () Bool)

(assert (=> b!1364142 m!1248865))

(assert (=> b!1364143 m!1248609))

(assert (=> b!1364143 m!1248609))

(assert (=> b!1364143 m!1248611))

(assert (=> bm!65431 m!1248609))

(declare-fun m!1248867 () Bool)

(assert (=> bm!65431 m!1248867))

(assert (=> b!1363885 d!146257))

(declare-fun b!1364145 () Bool)

(declare-fun e!773583 () Bool)

(declare-fun e!773582 () Bool)

(assert (=> b!1364145 (= e!773583 e!773582)))

(declare-fun c!127598 () Bool)

(assert (=> b!1364145 (= c!127598 (validKeyInArray!0 (select (arr!44786 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364146 () Bool)

(declare-fun call!65435 () Bool)

(assert (=> b!1364146 (= e!773582 call!65435)))

(declare-fun b!1364147 () Bool)

(declare-fun e!773584 () Bool)

(assert (=> b!1364147 (= e!773584 (contains!9536 Nil!31824 (select (arr!44786 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364148 () Bool)

(declare-fun e!773581 () Bool)

(assert (=> b!1364148 (= e!773581 e!773583)))

(declare-fun res!907830 () Bool)

(assert (=> b!1364148 (=> (not res!907830) (not e!773583))))

(assert (=> b!1364148 (= res!907830 (not e!773584))))

(declare-fun res!907829 () Bool)

(assert (=> b!1364148 (=> (not res!907829) (not e!773584))))

(assert (=> b!1364148 (= res!907829 (validKeyInArray!0 (select (arr!44786 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364149 () Bool)

(assert (=> b!1364149 (= e!773582 call!65435)))

(declare-fun d!146259 () Bool)

(declare-fun res!907831 () Bool)

(assert (=> d!146259 (=> res!907831 e!773581)))

(assert (=> d!146259 (= res!907831 (bvsge #b00000000000000000000000000000000 (size!45336 a!3742)))))

