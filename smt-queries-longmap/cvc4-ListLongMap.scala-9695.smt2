; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114510 () Bool)

(assert start!114510)

(declare-fun b!1359122 () Bool)

(declare-fun res!903657 () Bool)

(declare-fun e!771212 () Bool)

(assert (=> b!1359122 (=> (not res!903657) (not e!771212))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92506 0))(
  ( (array!92507 (arr!44695 (Array (_ BitVec 32) (_ BitVec 64))) (size!45245 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92506)

(assert (=> b!1359122 (= res!903657 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45245 a!3742)))))

(declare-fun b!1359123 () Bool)

(declare-datatypes ((List!31736 0))(
  ( (Nil!31733) (Cons!31732 (h!32941 (_ BitVec 64)) (t!46406 List!31736)) )
))
(declare-fun acc!759 () List!31736)

(declare-fun e!771213 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92506 (_ BitVec 32) List!31736) Bool)

(assert (=> b!1359123 (= e!771213 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(declare-fun b!1359124 () Bool)

(declare-fun res!903654 () Bool)

(assert (=> b!1359124 (=> (not res!903654) (not e!771212))))

(declare-fun contains!9445 (List!31736 (_ BitVec 64)) Bool)

(assert (=> b!1359124 (= res!903654 (not (contains!9445 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359125 () Bool)

(declare-datatypes ((Unit!44745 0))(
  ( (Unit!44746) )
))
(declare-fun e!771211 () Unit!44745)

(declare-fun lt!599524 () Unit!44745)

(assert (=> b!1359125 (= e!771211 lt!599524)))

(declare-fun lt!599523 () Unit!44745)

(declare-fun lemmaListSubSeqRefl!0 (List!31736) Unit!44745)

(assert (=> b!1359125 (= lt!599523 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!847 (List!31736 List!31736) Bool)

(assert (=> b!1359125 (subseq!847 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92506 List!31736 List!31736 (_ BitVec 32)) Unit!44745)

(declare-fun $colon$colon!850 (List!31736 (_ BitVec 64)) List!31736)

(assert (=> b!1359125 (= lt!599524 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!850 acc!759 (select (arr!44695 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359125 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359126 () Bool)

(declare-fun res!903655 () Bool)

(assert (=> b!1359126 (=> (not res!903655) (not e!771212))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359126 (= res!903655 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!903656 () Bool)

(assert (=> start!114510 (=> (not res!903656) (not e!771212))))

(assert (=> start!114510 (= res!903656 (and (bvslt (size!45245 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45245 a!3742))))))

(assert (=> start!114510 e!771212))

(assert (=> start!114510 true))

(declare-fun array_inv!33723 (array!92506) Bool)

(assert (=> start!114510 (array_inv!33723 a!3742)))

(declare-fun b!1359127 () Bool)

(assert (=> b!1359127 (= e!771212 e!771213)))

(declare-fun res!903661 () Bool)

(assert (=> b!1359127 (=> (not res!903661) (not e!771213))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359127 (= res!903661 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599522 () Unit!44745)

(assert (=> b!1359127 (= lt!599522 e!771211)))

(declare-fun c!127175 () Bool)

(assert (=> b!1359127 (= c!127175 (validKeyInArray!0 (select (arr!44695 a!3742) from!3120)))))

(declare-fun b!1359128 () Bool)

(declare-fun res!903653 () Bool)

(assert (=> b!1359128 (=> (not res!903653) (not e!771212))))

(assert (=> b!1359128 (= res!903653 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45245 a!3742))))))

(declare-fun b!1359129 () Bool)

(declare-fun res!903652 () Bool)

(assert (=> b!1359129 (=> (not res!903652) (not e!771212))))

(assert (=> b!1359129 (= res!903652 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31733))))

(declare-fun b!1359130 () Bool)

(declare-fun res!903660 () Bool)

(assert (=> b!1359130 (=> (not res!903660) (not e!771212))))

(assert (=> b!1359130 (= res!903660 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359131 () Bool)

(declare-fun res!903658 () Bool)

(assert (=> b!1359131 (=> (not res!903658) (not e!771212))))

(assert (=> b!1359131 (= res!903658 (not (contains!9445 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359132 () Bool)

(declare-fun Unit!44747 () Unit!44745)

(assert (=> b!1359132 (= e!771211 Unit!44747)))

(declare-fun b!1359133 () Bool)

(declare-fun res!903659 () Bool)

(assert (=> b!1359133 (=> (not res!903659) (not e!771212))))

(declare-fun noDuplicate!2302 (List!31736) Bool)

(assert (=> b!1359133 (= res!903659 (noDuplicate!2302 acc!759))))

(assert (= (and start!114510 res!903656) b!1359133))

(assert (= (and b!1359133 res!903659) b!1359131))

(assert (= (and b!1359131 res!903658) b!1359124))

(assert (= (and b!1359124 res!903654) b!1359129))

(assert (= (and b!1359129 res!903652) b!1359130))

(assert (= (and b!1359130 res!903660) b!1359128))

(assert (= (and b!1359128 res!903653) b!1359126))

(assert (= (and b!1359126 res!903655) b!1359122))

(assert (= (and b!1359122 res!903657) b!1359127))

(assert (= (and b!1359127 c!127175) b!1359125))

(assert (= (and b!1359127 (not c!127175)) b!1359132))

(assert (= (and b!1359127 res!903661) b!1359123))

(declare-fun m!1244595 () Bool)

(assert (=> b!1359130 m!1244595))

(declare-fun m!1244597 () Bool)

(assert (=> b!1359127 m!1244597))

(assert (=> b!1359127 m!1244597))

(declare-fun m!1244599 () Bool)

(assert (=> b!1359127 m!1244599))

(declare-fun m!1244601 () Bool)

(assert (=> start!114510 m!1244601))

(declare-fun m!1244603 () Bool)

(assert (=> b!1359125 m!1244603))

(assert (=> b!1359125 m!1244597))

(declare-fun m!1244605 () Bool)

(assert (=> b!1359125 m!1244605))

(declare-fun m!1244607 () Bool)

(assert (=> b!1359125 m!1244607))

(declare-fun m!1244609 () Bool)

(assert (=> b!1359125 m!1244609))

(assert (=> b!1359125 m!1244597))

(assert (=> b!1359125 m!1244605))

(declare-fun m!1244611 () Bool)

(assert (=> b!1359125 m!1244611))

(declare-fun m!1244613 () Bool)

(assert (=> b!1359133 m!1244613))

(declare-fun m!1244615 () Bool)

(assert (=> b!1359124 m!1244615))

(assert (=> b!1359123 m!1244609))

(declare-fun m!1244617 () Bool)

(assert (=> b!1359129 m!1244617))

(declare-fun m!1244619 () Bool)

(assert (=> b!1359131 m!1244619))

(declare-fun m!1244621 () Bool)

(assert (=> b!1359126 m!1244621))

(push 1)

(assert (not b!1359123))

(assert (not b!1359130))

(assert (not b!1359133))

(assert (not b!1359127))

(assert (not start!114510))

(assert (not b!1359131))

(assert (not b!1359126))

(assert (not b!1359129))

(assert (not b!1359124))

(assert (not b!1359125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145471 () Bool)

(assert (=> d!145471 (= (array_inv!33723 a!3742) (bvsge (size!45245 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114510 d!145471))

(declare-fun b!1359189 () Bool)

(declare-fun e!771266 () Bool)

(declare-fun e!771264 () Bool)

(assert (=> b!1359189 (= e!771266 e!771264)))

(declare-fun c!127183 () Bool)

(assert (=> b!1359189 (= c!127183 (validKeyInArray!0 (select (arr!44695 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65296 () Bool)

(declare-fun call!65299 () Bool)

(assert (=> bm!65296 (= call!65299 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127183 (Cons!31732 (select (arr!44695 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1359190 () Bool)

(declare-fun e!771263 () Bool)

(assert (=> b!1359190 (= e!771263 e!771266)))

(declare-fun res!903705 () Bool)

(assert (=> b!1359190 (=> (not res!903705) (not e!771266))))

(declare-fun e!771265 () Bool)

(assert (=> b!1359190 (= res!903705 (not e!771265))))

(declare-fun res!903703 () Bool)

(assert (=> b!1359190 (=> (not res!903703) (not e!771265))))

(assert (=> b!1359190 (= res!903703 (validKeyInArray!0 (select (arr!44695 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359191 () Bool)

(assert (=> b!1359191 (= e!771264 call!65299)))

(declare-fun b!1359192 () Bool)

(assert (=> b!1359192 (= e!771265 (contains!9445 acc!759 (select (arr!44695 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145473 () Bool)

(declare-fun res!903704 () Bool)

(assert (=> d!145473 (=> res!903704 e!771263)))

(assert (=> d!145473 (= res!903704 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45245 a!3742)))))

(assert (=> d!145473 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771263)))

(declare-fun b!1359193 () Bool)

(assert (=> b!1359193 (= e!771264 call!65299)))

(assert (= (and d!145473 (not res!903704)) b!1359190))

(assert (= (and b!1359190 res!903703) b!1359192))

(assert (= (and b!1359190 res!903705) b!1359189))

(assert (= (and b!1359189 c!127183) b!1359193))

(assert (= (and b!1359189 (not c!127183)) b!1359191))

(assert (= (or b!1359193 b!1359191) bm!65296))

(declare-fun m!1244665 () Bool)

(assert (=> b!1359189 m!1244665))

(assert (=> b!1359189 m!1244665))

(declare-fun m!1244667 () Bool)

(assert (=> b!1359189 m!1244667))

(assert (=> bm!65296 m!1244665))

(declare-fun m!1244669 () Bool)

(assert (=> bm!65296 m!1244669))

(assert (=> b!1359190 m!1244665))

(assert (=> b!1359190 m!1244665))

(assert (=> b!1359190 m!1244667))

(assert (=> b!1359192 m!1244665))

(assert (=> b!1359192 m!1244665))

(declare-fun m!1244673 () Bool)

(assert (=> b!1359192 m!1244673))

(assert (=> b!1359123 d!145473))

(declare-fun d!145493 () Bool)

(declare-fun res!903724 () Bool)

(declare-fun e!771285 () Bool)

(assert (=> d!145493 (=> res!903724 e!771285)))

(assert (=> d!145493 (= res!903724 (is-Nil!31733 acc!759))))

(assert (=> d!145493 (= (noDuplicate!2302 acc!759) e!771285)))

(declare-fun b!1359212 () Bool)

(declare-fun e!771286 () Bool)

(assert (=> b!1359212 (= e!771285 e!771286)))

(declare-fun res!903725 () Bool)

(assert (=> b!1359212 (=> (not res!903725) (not e!771286))))

(assert (=> b!1359212 (= res!903725 (not (contains!9445 (t!46406 acc!759) (h!32941 acc!759))))))

(declare-fun b!1359213 () Bool)

(assert (=> b!1359213 (= e!771286 (noDuplicate!2302 (t!46406 acc!759)))))

(assert (= (and d!145493 (not res!903724)) b!1359212))

(assert (= (and b!1359212 res!903725) b!1359213))

(declare-fun m!1244679 () Bool)

(assert (=> b!1359212 m!1244679))

(declare-fun m!1244681 () Bool)

(assert (=> b!1359213 m!1244681))

(assert (=> b!1359133 d!145493))

(declare-fun d!145497 () Bool)

(assert (=> d!145497 (= (validKeyInArray!0 (select (arr!44695 a!3742) from!3120)) (and (not (= (select (arr!44695 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44695 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359127 d!145497))

(declare-fun d!145499 () Bool)

(declare-fun lt!599543 () Bool)

(declare-fun content!686 (List!31736) (Set (_ BitVec 64)))

(assert (=> d!145499 (= lt!599543 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!686 acc!759)))))

(declare-fun e!771309 () Bool)

(assert (=> d!145499 (= lt!599543 e!771309)))

(declare-fun res!903746 () Bool)

(assert (=> d!145499 (=> (not res!903746) (not e!771309))))

(assert (=> d!145499 (= res!903746 (is-Cons!31732 acc!759))))

(assert (=> d!145499 (= (contains!9445 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599543)))

(declare-fun b!1359238 () Bool)

(declare-fun e!771310 () Bool)

(assert (=> b!1359238 (= e!771309 e!771310)))

(declare-fun res!903747 () Bool)

(assert (=> b!1359238 (=> res!903747 e!771310)))

(assert (=> b!1359238 (= res!903747 (= (h!32941 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359239 () Bool)

(assert (=> b!1359239 (= e!771310 (contains!9445 (t!46406 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145499 res!903746) b!1359238))

(assert (= (and b!1359238 (not res!903747)) b!1359239))

(declare-fun m!1244689 () Bool)

(assert (=> d!145499 m!1244689))

(declare-fun m!1244691 () Bool)

(assert (=> d!145499 m!1244691))

(declare-fun m!1244693 () Bool)

(assert (=> b!1359239 m!1244693))

(assert (=> b!1359131 d!145499))

(declare-fun d!145505 () Bool)

(assert (=> d!145505 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359126 d!145505))

(declare-fun d!145507 () Bool)

(assert (=> d!145507 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599546 () Unit!44745)

(declare-fun choose!80 (array!92506 List!31736 List!31736 (_ BitVec 32)) Unit!44745)

(assert (=> d!145507 (= lt!599546 (choose!80 a!3742 ($colon$colon!850 acc!759 (select (arr!44695 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145507 (bvslt (size!45245 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145507 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!850 acc!759 (select (arr!44695 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599546)))

(declare-fun bs!38976 () Bool)

(assert (= bs!38976 d!145507))

(assert (=> bs!38976 m!1244609))

(assert (=> bs!38976 m!1244605))

(declare-fun m!1244695 () Bool)

(assert (=> bs!38976 m!1244695))

(assert (=> b!1359125 d!145507))

(declare-fun b!1359260 () Bool)

(declare-fun e!771328 () Bool)

(assert (=> b!1359260 (= e!771328 (subseq!847 (t!46406 acc!759) (t!46406 acc!759)))))

(declare-fun b!1359259 () Bool)

(declare-fun e!771330 () Bool)

(declare-fun e!771327 () Bool)

(assert (=> b!1359259 (= e!771330 e!771327)))

(declare-fun res!903765 () Bool)

(assert (=> b!1359259 (=> res!903765 e!771327)))

(assert (=> b!1359259 (= res!903765 e!771328)))

(declare-fun res!903762 () Bool)

(assert (=> b!1359259 (=> (not res!903762) (not e!771328))))

(assert (=> b!1359259 (= res!903762 (= (h!32941 acc!759) (h!32941 acc!759)))))

(declare-fun b!1359261 () Bool)

(assert (=> b!1359261 (= e!771327 (subseq!847 acc!759 (t!46406 acc!759)))))

(declare-fun b!1359258 () Bool)

(declare-fun e!771329 () Bool)

(assert (=> b!1359258 (= e!771329 e!771330)))

(declare-fun res!903763 () Bool)

(assert (=> b!1359258 (=> (not res!903763) (not e!771330))))

(assert (=> b!1359258 (= res!903763 (is-Cons!31732 acc!759))))

(declare-fun d!145509 () Bool)

(declare-fun res!903764 () Bool)

(assert (=> d!145509 (=> res!903764 e!771329)))

(assert (=> d!145509 (= res!903764 (is-Nil!31733 acc!759))))

(assert (=> d!145509 (= (subseq!847 acc!759 acc!759) e!771329)))

(assert (= (and d!145509 (not res!903764)) b!1359258))

(assert (= (and b!1359258 res!903763) b!1359259))

(assert (= (and b!1359259 res!903762) b!1359260))

(assert (= (and b!1359259 (not res!903765)) b!1359261))

(declare-fun m!1244713 () Bool)

(assert (=> b!1359260 m!1244713))

(declare-fun m!1244715 () Bool)

(assert (=> b!1359261 m!1244715))

(assert (=> b!1359125 d!145509))

(assert (=> b!1359125 d!145473))

(declare-fun d!145519 () Bool)

(assert (=> d!145519 (= ($colon$colon!850 acc!759 (select (arr!44695 a!3742) from!3120)) (Cons!31732 (select (arr!44695 a!3742) from!3120) acc!759))))

(assert (=> b!1359125 d!145519))

(declare-fun d!145523 () Bool)

(assert (=> d!145523 (subseq!847 acc!759 acc!759)))

(declare-fun lt!599553 () Unit!44745)

(declare-fun choose!36 (List!31736) Unit!44745)

(assert (=> d!145523 (= lt!599553 (choose!36 acc!759))))

(assert (=> d!145523 (= (lemmaListSubSeqRefl!0 acc!759) lt!599553)))

(declare-fun bs!38978 () Bool)

(assert (= bs!38978 d!145523))

(assert (=> bs!38978 m!1244611))

(declare-fun m!1244727 () Bool)

(assert (=> bs!38978 m!1244727))

