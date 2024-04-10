; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114590 () Bool)

(assert start!114590)

(declare-fun res!904193 () Bool)

(declare-fun e!771507 () Bool)

(assert (=> start!114590 (=> (not res!904193) (not e!771507))))

(declare-datatypes ((array!92535 0))(
  ( (array!92536 (arr!44708 (Array (_ BitVec 32) (_ BitVec 64))) (size!45258 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92535)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114590 (= res!904193 (and (bvslt (size!45258 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45258 a!3742))))))

(assert (=> start!114590 e!771507))

(assert (=> start!114590 true))

(declare-fun array_inv!33736 (array!92535) Bool)

(assert (=> start!114590 (array_inv!33736 a!3742)))

(declare-fun b!1359763 () Bool)

(declare-fun res!904185 () Bool)

(declare-fun e!771505 () Bool)

(assert (=> b!1359763 (=> (not res!904185) (not e!771505))))

(declare-datatypes ((List!31749 0))(
  ( (Nil!31746) (Cons!31745 (h!32954 (_ BitVec 64)) (t!46422 List!31749)) )
))
(declare-fun acc!759 () List!31749)

(declare-fun arrayNoDuplicates!0 (array!92535 (_ BitVec 32) List!31749) Bool)

(assert (=> b!1359763 (= res!904185 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359764 () Bool)

(declare-fun res!904187 () Bool)

(assert (=> b!1359764 (=> (not res!904187) (not e!771507))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359764 (= res!904187 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45258 a!3742))))))

(declare-fun b!1359765 () Bool)

(declare-fun res!904188 () Bool)

(assert (=> b!1359765 (=> (not res!904188) (not e!771507))))

(declare-fun noDuplicate!2315 (List!31749) Bool)

(assert (=> b!1359765 (= res!904188 (noDuplicate!2315 acc!759))))

(declare-fun b!1359766 () Bool)

(declare-fun res!904195 () Bool)

(assert (=> b!1359766 (=> (not res!904195) (not e!771507))))

(assert (=> b!1359766 (= res!904195 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45258 a!3742)))))

(declare-fun b!1359767 () Bool)

(declare-fun res!904191 () Bool)

(assert (=> b!1359767 (=> (not res!904191) (not e!771507))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359767 (= res!904191 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359768 () Bool)

(declare-fun res!904189 () Bool)

(assert (=> b!1359768 (=> (not res!904189) (not e!771507))))

(assert (=> b!1359768 (= res!904189 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31746))))

(declare-fun b!1359769 () Bool)

(assert (=> b!1359769 (= e!771507 e!771505)))

(declare-fun res!904186 () Bool)

(assert (=> b!1359769 (=> (not res!904186) (not e!771505))))

(assert (=> b!1359769 (= res!904186 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44784 0))(
  ( (Unit!44785) )
))
(declare-fun lt!599704 () Unit!44784)

(declare-fun e!771508 () Unit!44784)

(assert (=> b!1359769 (= lt!599704 e!771508)))

(declare-fun c!127229 () Bool)

(assert (=> b!1359769 (= c!127229 (validKeyInArray!0 (select (arr!44708 a!3742) from!3120)))))

(declare-fun b!1359770 () Bool)

(declare-fun lt!599703 () Unit!44784)

(assert (=> b!1359770 (= e!771508 lt!599703)))

(declare-fun lt!599700 () Unit!44784)

(declare-fun lemmaListSubSeqRefl!0 (List!31749) Unit!44784)

(assert (=> b!1359770 (= lt!599700 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!860 (List!31749 List!31749) Bool)

(assert (=> b!1359770 (subseq!860 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92535 List!31749 List!31749 (_ BitVec 32)) Unit!44784)

(declare-fun $colon$colon!863 (List!31749 (_ BitVec 64)) List!31749)

(assert (=> b!1359770 (= lt!599703 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!863 acc!759 (select (arr!44708 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359770 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359771 () Bool)

(declare-fun res!904192 () Bool)

(assert (=> b!1359771 (=> (not res!904192) (not e!771507))))

(assert (=> b!1359771 (= res!904192 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359772 () Bool)

(declare-fun res!904190 () Bool)

(assert (=> b!1359772 (=> (not res!904190) (not e!771507))))

(declare-fun contains!9458 (List!31749 (_ BitVec 64)) Bool)

(assert (=> b!1359772 (= res!904190 (not (contains!9458 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359773 () Bool)

(declare-fun Unit!44786 () Unit!44784)

(assert (=> b!1359773 (= e!771508 Unit!44786)))

(declare-fun b!1359774 () Bool)

(declare-fun lt!599701 () array!92535)

(assert (=> b!1359774 (= e!771505 (not (arrayNoDuplicates!0 lt!599701 from!3120 acc!759)))))

(assert (=> b!1359774 (arrayNoDuplicates!0 lt!599701 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (=> b!1359774 (= lt!599701 (array!92536 (store (arr!44708 a!3742) i!1404 l!3587) (size!45258 a!3742)))))

(declare-fun lt!599702 () Unit!44784)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31749) Unit!44784)

(assert (=> b!1359774 (= lt!599702 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359775 () Bool)

(declare-fun res!904194 () Bool)

(assert (=> b!1359775 (=> (not res!904194) (not e!771507))))

(assert (=> b!1359775 (= res!904194 (not (contains!9458 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114590 res!904193) b!1359765))

(assert (= (and b!1359765 res!904188) b!1359775))

(assert (= (and b!1359775 res!904194) b!1359772))

(assert (= (and b!1359772 res!904190) b!1359768))

(assert (= (and b!1359768 res!904189) b!1359771))

(assert (= (and b!1359771 res!904192) b!1359764))

(assert (= (and b!1359764 res!904187) b!1359767))

(assert (= (and b!1359767 res!904191) b!1359766))

(assert (= (and b!1359766 res!904195) b!1359769))

(assert (= (and b!1359769 c!127229) b!1359770))

(assert (= (and b!1359769 (not c!127229)) b!1359773))

(assert (= (and b!1359769 res!904186) b!1359763))

(assert (= (and b!1359763 res!904185) b!1359774))

(declare-fun m!1245103 () Bool)

(assert (=> b!1359767 m!1245103))

(declare-fun m!1245105 () Bool)

(assert (=> b!1359768 m!1245105))

(declare-fun m!1245107 () Bool)

(assert (=> b!1359763 m!1245107))

(declare-fun m!1245109 () Bool)

(assert (=> b!1359774 m!1245109))

(declare-fun m!1245111 () Bool)

(assert (=> b!1359774 m!1245111))

(declare-fun m!1245113 () Bool)

(assert (=> b!1359774 m!1245113))

(declare-fun m!1245115 () Bool)

(assert (=> b!1359774 m!1245115))

(declare-fun m!1245117 () Bool)

(assert (=> b!1359771 m!1245117))

(declare-fun m!1245119 () Bool)

(assert (=> b!1359765 m!1245119))

(declare-fun m!1245121 () Bool)

(assert (=> b!1359769 m!1245121))

(assert (=> b!1359769 m!1245121))

(declare-fun m!1245123 () Bool)

(assert (=> b!1359769 m!1245123))

(declare-fun m!1245125 () Bool)

(assert (=> b!1359772 m!1245125))

(declare-fun m!1245127 () Bool)

(assert (=> b!1359770 m!1245127))

(assert (=> b!1359770 m!1245121))

(declare-fun m!1245129 () Bool)

(assert (=> b!1359770 m!1245129))

(declare-fun m!1245131 () Bool)

(assert (=> b!1359770 m!1245131))

(assert (=> b!1359770 m!1245107))

(assert (=> b!1359770 m!1245121))

(assert (=> b!1359770 m!1245129))

(declare-fun m!1245133 () Bool)

(assert (=> b!1359770 m!1245133))

(declare-fun m!1245135 () Bool)

(assert (=> start!114590 m!1245135))

(declare-fun m!1245137 () Bool)

(assert (=> b!1359775 m!1245137))

(push 1)

(assert (not b!1359775))

(assert (not b!1359765))

(assert (not b!1359763))

(assert (not b!1359767))

(assert (not start!114590))

(assert (not b!1359774))

(assert (not b!1359769))

(assert (not b!1359771))

(assert (not b!1359772))

(assert (not b!1359770))

(assert (not b!1359768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145569 () Bool)

(declare-fun res!904310 () Bool)

(declare-fun e!771592 () Bool)

(assert (=> d!145569 (=> res!904310 e!771592)))

(assert (=> d!145569 (= res!904310 (is-Nil!31746 acc!759))))

(assert (=> d!145569 (= (noDuplicate!2315 acc!759) e!771592)))

(declare-fun b!1359924 () Bool)

(declare-fun e!771593 () Bool)

(assert (=> b!1359924 (= e!771592 e!771593)))

(declare-fun res!904311 () Bool)

(assert (=> b!1359924 (=> (not res!904311) (not e!771593))))

(assert (=> b!1359924 (= res!904311 (not (contains!9458 (t!46422 acc!759) (h!32954 acc!759))))))

(declare-fun b!1359925 () Bool)

(assert (=> b!1359925 (= e!771593 (noDuplicate!2315 (t!46422 acc!759)))))

(assert (= (and d!145569 (not res!904310)) b!1359924))

(assert (= (and b!1359924 res!904311) b!1359925))

(declare-fun m!1245279 () Bool)

(assert (=> b!1359924 m!1245279))

(declare-fun m!1245281 () Bool)

(assert (=> b!1359925 m!1245281))

(assert (=> b!1359765 d!145569))

(declare-fun d!145577 () Bool)

(declare-fun lt!599750 () Bool)

(declare-fun content!688 (List!31749) (Set (_ BitVec 64)))

(assert (=> d!145577 (= lt!599750 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!688 acc!759)))))

(declare-fun e!771611 () Bool)

(assert (=> d!145577 (= lt!599750 e!771611)))

(declare-fun res!904329 () Bool)

(assert (=> d!145577 (=> (not res!904329) (not e!771611))))

(assert (=> d!145577 (= res!904329 (is-Cons!31745 acc!759))))

(assert (=> d!145577 (= (contains!9458 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599750)))

(declare-fun b!1359942 () Bool)

(declare-fun e!771610 () Bool)

(assert (=> b!1359942 (= e!771611 e!771610)))

(declare-fun res!904328 () Bool)

(assert (=> b!1359942 (=> res!904328 e!771610)))

(assert (=> b!1359942 (= res!904328 (= (h!32954 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359943 () Bool)

(assert (=> b!1359943 (= e!771610 (contains!9458 (t!46422 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145577 res!904329) b!1359942))

(assert (= (and b!1359942 (not res!904328)) b!1359943))

(declare-fun m!1245289 () Bool)

(assert (=> d!145577 m!1245289))

(declare-fun m!1245291 () Bool)

(assert (=> d!145577 m!1245291))

(declare-fun m!1245293 () Bool)

(assert (=> b!1359943 m!1245293))

(assert (=> b!1359775 d!145577))

(declare-fun d!145583 () Bool)

(declare-fun lt!599751 () Bool)

(assert (=> d!145583 (= lt!599751 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!688 acc!759)))))

(declare-fun e!771613 () Bool)

(assert (=> d!145583 (= lt!599751 e!771613)))

(declare-fun res!904331 () Bool)

(assert (=> d!145583 (=> (not res!904331) (not e!771613))))

(assert (=> d!145583 (= res!904331 (is-Cons!31745 acc!759))))

(assert (=> d!145583 (= (contains!9458 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599751)))

(declare-fun b!1359944 () Bool)

(declare-fun e!771612 () Bool)

(assert (=> b!1359944 (= e!771613 e!771612)))

(declare-fun res!904330 () Bool)

(assert (=> b!1359944 (=> res!904330 e!771612)))

(assert (=> b!1359944 (= res!904330 (= (h!32954 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359945 () Bool)

(assert (=> b!1359945 (= e!771612 (contains!9458 (t!46422 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145583 res!904331) b!1359944))

(assert (= (and b!1359944 (not res!904330)) b!1359945))

(assert (=> d!145583 m!1245289))

(declare-fun m!1245295 () Bool)

(assert (=> d!145583 m!1245295))

(declare-fun m!1245297 () Bool)

(assert (=> b!1359945 m!1245297))

(assert (=> b!1359772 d!145583))

(declare-fun b!1359974 () Bool)

(declare-fun e!771642 () Bool)

(declare-fun e!771643 () Bool)

(assert (=> b!1359974 (= e!771642 e!771643)))

(declare-fun res!904357 () Bool)

(assert (=> b!1359974 (=> (not res!904357) (not e!771643))))

(declare-fun e!771640 () Bool)

(assert (=> b!1359974 (= res!904357 (not e!771640))))

(declare-fun res!904356 () Bool)

(assert (=> b!1359974 (=> (not res!904356) (not e!771640))))

(assert (=> b!1359974 (= res!904356 (validKeyInArray!0 (select (arr!44708 lt!599701) from!3120)))))

(declare-fun b!1359975 () Bool)

(declare-fun e!771641 () Bool)

(declare-fun call!65320 () Bool)

(assert (=> b!1359975 (= e!771641 call!65320)))

(declare-fun b!1359976 () Bool)

(assert (=> b!1359976 (= e!771643 e!771641)))

(declare-fun c!127249 () Bool)

(assert (=> b!1359976 (= c!127249 (validKeyInArray!0 (select (arr!44708 lt!599701) from!3120)))))

(declare-fun b!1359977 () Bool)

(assert (=> b!1359977 (= e!771640 (contains!9458 acc!759 (select (arr!44708 lt!599701) from!3120)))))

(declare-fun bm!65317 () Bool)

(assert (=> bm!65317 (= call!65320 (arrayNoDuplicates!0 lt!599701 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127249 (Cons!31745 (select (arr!44708 lt!599701) from!3120) acc!759) acc!759)))))

(declare-fun b!1359978 () Bool)

(assert (=> b!1359978 (= e!771641 call!65320)))

(declare-fun d!145587 () Bool)

(declare-fun res!904358 () Bool)

(assert (=> d!145587 (=> res!904358 e!771642)))

(assert (=> d!145587 (= res!904358 (bvsge from!3120 (size!45258 lt!599701)))))

(assert (=> d!145587 (= (arrayNoDuplicates!0 lt!599701 from!3120 acc!759) e!771642)))

(assert (= (and d!145587 (not res!904358)) b!1359974))

(assert (= (and b!1359974 res!904356) b!1359977))

(assert (= (and b!1359974 res!904357) b!1359976))

(assert (= (and b!1359976 c!127249) b!1359978))

(assert (= (and b!1359976 (not c!127249)) b!1359975))

(assert (= (or b!1359978 b!1359975) bm!65317))

(declare-fun m!1245311 () Bool)

(assert (=> b!1359974 m!1245311))

(assert (=> b!1359974 m!1245311))

(declare-fun m!1245313 () Bool)

(assert (=> b!1359974 m!1245313))

(assert (=> b!1359976 m!1245311))

(assert (=> b!1359976 m!1245311))

(assert (=> b!1359976 m!1245313))

(assert (=> b!1359977 m!1245311))

(assert (=> b!1359977 m!1245311))

(declare-fun m!1245315 () Bool)

(assert (=> b!1359977 m!1245315))

(assert (=> bm!65317 m!1245311))

(declare-fun m!1245317 () Bool)

(assert (=> bm!65317 m!1245317))

(assert (=> b!1359774 d!145587))

(declare-fun b!1359984 () Bool)

(declare-fun e!771650 () Bool)

(declare-fun e!771651 () Bool)

(assert (=> b!1359984 (= e!771650 e!771651)))

(declare-fun res!904363 () Bool)

(assert (=> b!1359984 (=> (not res!904363) (not e!771651))))

(declare-fun e!771648 () Bool)

(assert (=> b!1359984 (= res!904363 (not e!771648))))

(declare-fun res!904362 () Bool)

(assert (=> b!1359984 (=> (not res!904362) (not e!771648))))

(assert (=> b!1359984 (= res!904362 (validKeyInArray!0 (select (arr!44708 lt!599701) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359985 () Bool)

(declare-fun e!771649 () Bool)

(declare-fun call!65322 () Bool)

(assert (=> b!1359985 (= e!771649 call!65322)))

(declare-fun b!1359986 () Bool)

(assert (=> b!1359986 (= e!771651 e!771649)))

(declare-fun c!127251 () Bool)

(assert (=> b!1359986 (= c!127251 (validKeyInArray!0 (select (arr!44708 lt!599701) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359987 () Bool)

(assert (=> b!1359987 (= e!771648 (contains!9458 acc!759 (select (arr!44708 lt!599701) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65319 () Bool)

(assert (=> bm!65319 (= call!65322 (arrayNoDuplicates!0 lt!599701 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127251 (Cons!31745 (select (arr!44708 lt!599701) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1359988 () Bool)

(assert (=> b!1359988 (= e!771649 call!65322)))

(declare-fun d!145603 () Bool)

(declare-fun res!904364 () Bool)

(assert (=> d!145603 (=> res!904364 e!771650)))

(assert (=> d!145603 (= res!904364 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45258 lt!599701)))))

(assert (=> d!145603 (= (arrayNoDuplicates!0 lt!599701 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771650)))

(assert (= (and d!145603 (not res!904364)) b!1359984))

(assert (= (and b!1359984 res!904362) b!1359987))

(assert (= (and b!1359984 res!904363) b!1359986))

(assert (= (and b!1359986 c!127251) b!1359988))

(assert (= (and b!1359986 (not c!127251)) b!1359985))

(assert (= (or b!1359988 b!1359985) bm!65319))

(declare-fun m!1245323 () Bool)

(assert (=> b!1359984 m!1245323))

(assert (=> b!1359984 m!1245323))

(declare-fun m!1245325 () Bool)

(assert (=> b!1359984 m!1245325))

(assert (=> b!1359986 m!1245323))

(assert (=> b!1359986 m!1245323))

(assert (=> b!1359986 m!1245325))

(assert (=> b!1359987 m!1245323))

(assert (=> b!1359987 m!1245323))

(declare-fun m!1245327 () Bool)

(assert (=> b!1359987 m!1245327))

(assert (=> bm!65319 m!1245323))

(declare-fun m!1245329 () Bool)

(assert (=> bm!65319 m!1245329))

(assert (=> b!1359774 d!145603))

(declare-fun d!145607 () Bool)

(declare-fun e!771670 () Bool)

(assert (=> d!145607 e!771670))

(declare-fun res!904381 () Bool)

(assert (=> d!145607 (=> (not res!904381) (not e!771670))))

(assert (=> d!145607 (= res!904381 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45258 a!3742))))))

(declare-fun lt!599764 () Unit!44784)

(declare-fun choose!53 (array!92535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31749) Unit!44784)

(assert (=> d!145607 (= lt!599764 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (=> d!145607 (bvslt (size!45258 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145607 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) lt!599764)))

(declare-fun b!1360009 () Bool)

(assert (=> b!1360009 (= e!771670 (arrayNoDuplicates!0 (array!92536 (store (arr!44708 a!3742) i!1404 l!3587) (size!45258 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and d!145607 res!904381) b!1360009))

(declare-fun m!1245353 () Bool)

(assert (=> d!145607 m!1245353))

(assert (=> b!1360009 m!1245113))

(declare-fun m!1245355 () Bool)

(assert (=> b!1360009 m!1245355))

(assert (=> b!1359774 d!145607))

(declare-fun b!1360010 () Bool)

(declare-fun e!771673 () Bool)

(declare-fun e!771674 () Bool)

(assert (=> b!1360010 (= e!771673 e!771674)))

(declare-fun res!904383 () Bool)

(assert (=> b!1360010 (=> (not res!904383) (not e!771674))))

(declare-fun e!771671 () Bool)

(assert (=> b!1360010 (= res!904383 (not e!771671))))

(declare-fun res!904382 () Bool)

(assert (=> b!1360010 (=> (not res!904382) (not e!771671))))

(assert (=> b!1360010 (= res!904382 (validKeyInArray!0 (select (arr!44708 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360011 () Bool)

(declare-fun e!771672 () Bool)

(declare-fun call!65325 () Bool)

(assert (=> b!1360011 (= e!771672 call!65325)))

(declare-fun b!1360012 () Bool)

(assert (=> b!1360012 (= e!771674 e!771672)))

(declare-fun c!127254 () Bool)

(assert (=> b!1360012 (= c!127254 (validKeyInArray!0 (select (arr!44708 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360013 () Bool)

(assert (=> b!1360013 (= e!771671 (contains!9458 acc!759 (select (arr!44708 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65322 () Bool)

(assert (=> bm!65322 (= call!65325 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127254 (Cons!31745 (select (arr!44708 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1360014 () Bool)

(assert (=> b!1360014 (= e!771672 call!65325)))

(declare-fun d!145617 () Bool)

(declare-fun res!904384 () Bool)

(assert (=> d!145617 (=> res!904384 e!771673)))

(assert (=> d!145617 (= res!904384 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45258 a!3742)))))

(assert (=> d!145617 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771673)))

(assert (= (and d!145617 (not res!904384)) b!1360010))

(assert (= (and b!1360010 res!904382) b!1360013))

(assert (= (and b!1360010 res!904383) b!1360012))

(assert (= (and b!1360012 c!127254) b!1360014))

(assert (= (and b!1360012 (not c!127254)) b!1360011))

(assert (= (or b!1360014 b!1360011) bm!65322))

(declare-fun m!1245361 () Bool)

(assert (=> b!1360010 m!1245361))

(assert (=> b!1360010 m!1245361))

(declare-fun m!1245363 () Bool)

(assert (=> b!1360010 m!1245363))

(assert (=> b!1360012 m!1245361))

(assert (=> b!1360012 m!1245361))

(assert (=> b!1360012 m!1245363))

(assert (=> b!1360013 m!1245361))

(assert (=> b!1360013 m!1245361))

(declare-fun m!1245365 () Bool)

(assert (=> b!1360013 m!1245365))

(assert (=> bm!65322 m!1245361))

(declare-fun m!1245367 () Bool)

(assert (=> bm!65322 m!1245367))

(assert (=> b!1359763 d!145617))

(declare-fun d!145621 () Bool)

(assert (=> d!145621 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599767 () Unit!44784)

(declare-fun choose!80 (array!92535 List!31749 List!31749 (_ BitVec 32)) Unit!44784)

(assert (=> d!145621 (= lt!599767 (choose!80 a!3742 ($colon$colon!863 acc!759 (select (arr!44708 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145621 (bvslt (size!45258 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145621 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!863 acc!759 (select (arr!44708 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599767)))

(declare-fun bs!38998 () Bool)

(assert (= bs!38998 d!145621))

(assert (=> bs!38998 m!1245107))

(assert (=> bs!38998 m!1245129))

(declare-fun m!1245369 () Bool)

(assert (=> bs!38998 m!1245369))

(assert (=> b!1359770 d!145621))

(declare-fun b!1360035 () Bool)

(declare-fun e!771695 () Bool)

(assert (=> b!1360035 (= e!771695 (subseq!860 acc!759 (t!46422 acc!759)))))

(declare-fun d!145623 () Bool)

(declare-fun res!904405 () Bool)

(declare-fun e!771694 () Bool)

(assert (=> d!145623 (=> res!904405 e!771694)))

(assert (=> d!145623 (= res!904405 (is-Nil!31746 acc!759))))

(assert (=> d!145623 (= (subseq!860 acc!759 acc!759) e!771694)))

(declare-fun b!1360034 () Bool)

(declare-fun e!771693 () Bool)

(assert (=> b!1360034 (= e!771693 (subseq!860 (t!46422 acc!759) (t!46422 acc!759)))))

(declare-fun b!1360033 () Bool)

(declare-fun e!771692 () Bool)

(assert (=> b!1360033 (= e!771692 e!771695)))

(declare-fun res!904404 () Bool)

(assert (=> b!1360033 (=> res!904404 e!771695)))

(assert (=> b!1360033 (= res!904404 e!771693)))

(declare-fun res!904402 () Bool)

(assert (=> b!1360033 (=> (not res!904402) (not e!771693))))

(assert (=> b!1360033 (= res!904402 (= (h!32954 acc!759) (h!32954 acc!759)))))

(declare-fun b!1360032 () Bool)

(assert (=> b!1360032 (= e!771694 e!771692)))

(declare-fun res!904403 () Bool)

(assert (=> b!1360032 (=> (not res!904403) (not e!771692))))

(assert (=> b!1360032 (= res!904403 (is-Cons!31745 acc!759))))

(assert (= (and d!145623 (not res!904405)) b!1360032))

(assert (= (and b!1360032 res!904403) b!1360033))

(assert (= (and b!1360033 res!904402) b!1360034))

(assert (= (and b!1360033 (not res!904404)) b!1360035))

(declare-fun m!1245379 () Bool)

(assert (=> b!1360035 m!1245379))

(declare-fun m!1245381 () Bool)

(assert (=> b!1360034 m!1245381))

(assert (=> b!1359770 d!145623))

(assert (=> b!1359770 d!145617))

(declare-fun d!145627 () Bool)

(assert (=> d!145627 (= ($colon$colon!863 acc!759 (select (arr!44708 a!3742) from!3120)) (Cons!31745 (select (arr!44708 a!3742) from!3120) acc!759))))

(assert (=> b!1359770 d!145627))

(declare-fun d!145629 () Bool)

(assert (=> d!145629 (subseq!860 acc!759 acc!759)))

(declare-fun lt!599773 () Unit!44784)

(declare-fun choose!36 (List!31749) Unit!44784)

(assert (=> d!145629 (= lt!599773 (choose!36 acc!759))))

(assert (=> d!145629 (= (lemmaListSubSeqRefl!0 acc!759) lt!599773)))

(declare-fun bs!38999 () Bool)

(assert (= bs!38999 d!145629))

(assert (=> bs!38999 m!1245133))

(declare-fun m!1245383 () Bool)

(assert (=> bs!38999 m!1245383))

(assert (=> b!1359770 d!145629))

(declare-fun b!1360036 () Bool)

(declare-fun e!771698 () Bool)

(declare-fun e!771699 () Bool)

(assert (=> b!1360036 (= e!771698 e!771699)))

(declare-fun res!904407 () Bool)

(assert (=> b!1360036 (=> (not res!904407) (not e!771699))))

(declare-fun e!771696 () Bool)

(assert (=> b!1360036 (= res!904407 (not e!771696))))

(declare-fun res!904406 () Bool)

(assert (=> b!1360036 (=> (not res!904406) (not e!771696))))

(assert (=> b!1360036 (= res!904406 (validKeyInArray!0 (select (arr!44708 a!3742) from!3120)))))

(declare-fun b!1360037 () Bool)

(declare-fun e!771697 () Bool)

(declare-fun call!65326 () Bool)

(assert (=> b!1360037 (= e!771697 call!65326)))

(declare-fun b!1360038 () Bool)

(assert (=> b!1360038 (= e!771699 e!771697)))

(declare-fun c!127255 () Bool)

(assert (=> b!1360038 (= c!127255 (validKeyInArray!0 (select (arr!44708 a!3742) from!3120)))))

(declare-fun b!1360039 () Bool)

(assert (=> b!1360039 (= e!771696 (contains!9458 acc!759 (select (arr!44708 a!3742) from!3120)))))

(declare-fun bm!65323 () Bool)

(assert (=> bm!65323 (= call!65326 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127255 (Cons!31745 (select (arr!44708 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1360040 () Bool)

(assert (=> b!1360040 (= e!771697 call!65326)))

(declare-fun d!145631 () Bool)

(declare-fun res!904408 () Bool)

(assert (=> d!145631 (=> res!904408 e!771698)))

(assert (=> d!145631 (= res!904408 (bvsge from!3120 (size!45258 a!3742)))))

(assert (=> d!145631 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771698)))

(assert (= (and d!145631 (not res!904408)) b!1360036))

(assert (= (and b!1360036 res!904406) b!1360039))

(assert (= (and b!1360036 res!904407) b!1360038))

(assert (= (and b!1360038 c!127255) b!1360040))

(assert (= (and b!1360038 (not c!127255)) b!1360037))

(assert (= (or b!1360040 b!1360037) bm!65323))

(assert (=> b!1360036 m!1245121))

(assert (=> b!1360036 m!1245121))

(assert (=> b!1360036 m!1245123))

(assert (=> b!1360038 m!1245121))

(assert (=> b!1360038 m!1245121))

(assert (=> b!1360038 m!1245123))

(assert (=> b!1360039 m!1245121))

(assert (=> b!1360039 m!1245121))

(declare-fun m!1245385 () Bool)

(assert (=> b!1360039 m!1245385))

(assert (=> bm!65323 m!1245121))

(declare-fun m!1245387 () Bool)

(assert (=> bm!65323 m!1245387))

(assert (=> b!1359771 d!145631))

(declare-fun d!145633 () Bool)

(assert (=> d!145633 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359767 d!145633))

(declare-fun d!145635 () Bool)

