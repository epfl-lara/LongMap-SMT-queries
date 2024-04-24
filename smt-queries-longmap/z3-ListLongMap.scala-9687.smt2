; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114580 () Bool)

(assert start!114580)

(declare-fun b!1359138 () Bool)

(declare-fun e!771479 () Bool)

(declare-datatypes ((List!31750 0))(
  ( (Nil!31747) (Cons!31746 (h!32964 (_ BitVec 64)) (t!46406 List!31750)) )
))
(declare-fun acc!759 () List!31750)

(declare-fun lt!599708 () List!31750)

(declare-fun subseq!821 (List!31750 List!31750) Bool)

(assert (=> b!1359138 (= e!771479 (subseq!821 acc!759 lt!599708))))

(declare-fun b!1359139 () Bool)

(declare-fun res!903066 () Bool)

(assert (=> b!1359139 (=> res!903066 e!771479)))

(declare-fun contains!9462 (List!31750 (_ BitVec 64)) Bool)

(assert (=> b!1359139 (= res!903066 (contains!9462 lt!599708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359140 () Bool)

(declare-fun res!903075 () Bool)

(declare-fun e!771481 () Bool)

(assert (=> b!1359140 (=> (not res!903075) (not e!771481))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359140 (= res!903075 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359141 () Bool)

(declare-fun res!903070 () Bool)

(assert (=> b!1359141 (=> (not res!903070) (not e!771481))))

(assert (=> b!1359141 (= res!903070 (not (contains!9462 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359142 () Bool)

(declare-fun res!903067 () Bool)

(assert (=> b!1359142 (=> (not res!903067) (not e!771481))))

(declare-datatypes ((array!92563 0))(
  ( (array!92564 (arr!44722 (Array (_ BitVec 32) (_ BitVec 64))) (size!45273 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92563)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92563 (_ BitVec 32) List!31750) Bool)

(assert (=> b!1359142 (= res!903067 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359143 () Bool)

(declare-fun res!903076 () Bool)

(assert (=> b!1359143 (=> (not res!903076) (not e!771481))))

(assert (=> b!1359143 (= res!903076 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45273 a!3742)))))

(declare-fun b!1359144 () Bool)

(declare-fun res!903065 () Bool)

(assert (=> b!1359144 (=> (not res!903065) (not e!771481))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359144 (= res!903065 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45273 a!3742))))))

(declare-fun res!903078 () Bool)

(assert (=> start!114580 (=> (not res!903078) (not e!771481))))

(assert (=> start!114580 (= res!903078 (and (bvslt (size!45273 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45273 a!3742))))))

(assert (=> start!114580 e!771481))

(assert (=> start!114580 true))

(declare-fun array_inv!34003 (array!92563) Bool)

(assert (=> start!114580 (array_inv!34003 a!3742)))

(declare-fun b!1359145 () Bool)

(declare-fun res!903068 () Bool)

(assert (=> b!1359145 (=> (not res!903068) (not e!771481))))

(declare-fun noDuplicate!2293 (List!31750) Bool)

(assert (=> b!1359145 (= res!903068 (noDuplicate!2293 acc!759))))

(declare-fun b!1359146 () Bool)

(declare-fun res!903071 () Bool)

(assert (=> b!1359146 (=> res!903071 e!771479)))

(assert (=> b!1359146 (= res!903071 (contains!9462 lt!599708 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359147 () Bool)

(assert (=> b!1359147 (= e!771481 (not e!771479))))

(declare-fun res!903074 () Bool)

(assert (=> b!1359147 (=> res!903074 e!771479)))

(assert (=> b!1359147 (= res!903074 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!823 (List!31750 (_ BitVec 64)) List!31750)

(assert (=> b!1359147 (= lt!599708 ($colon$colon!823 acc!759 (select (arr!44722 a!3742) from!3120)))))

(assert (=> b!1359147 (subseq!821 acc!759 acc!759)))

(declare-datatypes ((Unit!44612 0))(
  ( (Unit!44613) )
))
(declare-fun lt!599709 () Unit!44612)

(declare-fun lemmaListSubSeqRefl!0 (List!31750) Unit!44612)

(assert (=> b!1359147 (= lt!599709 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1359148 () Bool)

(declare-fun res!903072 () Bool)

(assert (=> b!1359148 (=> (not res!903072) (not e!771481))))

(assert (=> b!1359148 (= res!903072 (validKeyInArray!0 (select (arr!44722 a!3742) from!3120)))))

(declare-fun b!1359149 () Bool)

(declare-fun res!903077 () Bool)

(assert (=> b!1359149 (=> (not res!903077) (not e!771481))))

(assert (=> b!1359149 (= res!903077 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31747))))

(declare-fun b!1359150 () Bool)

(declare-fun res!903073 () Bool)

(assert (=> b!1359150 (=> res!903073 e!771479)))

(assert (=> b!1359150 (= res!903073 (not (noDuplicate!2293 lt!599708)))))

(declare-fun b!1359151 () Bool)

(declare-fun res!903069 () Bool)

(assert (=> b!1359151 (=> (not res!903069) (not e!771481))))

(assert (=> b!1359151 (= res!903069 (not (contains!9462 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114580 res!903078) b!1359145))

(assert (= (and b!1359145 res!903068) b!1359151))

(assert (= (and b!1359151 res!903069) b!1359141))

(assert (= (and b!1359141 res!903070) b!1359149))

(assert (= (and b!1359149 res!903077) b!1359142))

(assert (= (and b!1359142 res!903067) b!1359144))

(assert (= (and b!1359144 res!903065) b!1359140))

(assert (= (and b!1359140 res!903075) b!1359143))

(assert (= (and b!1359143 res!903076) b!1359148))

(assert (= (and b!1359148 res!903072) b!1359147))

(assert (= (and b!1359147 (not res!903074)) b!1359150))

(assert (= (and b!1359150 (not res!903073)) b!1359139))

(assert (= (and b!1359139 (not res!903066)) b!1359146))

(assert (= (and b!1359146 (not res!903071)) b!1359138))

(declare-fun m!1245097 () Bool)

(assert (=> b!1359150 m!1245097))

(declare-fun m!1245099 () Bool)

(assert (=> b!1359141 m!1245099))

(declare-fun m!1245101 () Bool)

(assert (=> b!1359145 m!1245101))

(declare-fun m!1245103 () Bool)

(assert (=> b!1359146 m!1245103))

(declare-fun m!1245105 () Bool)

(assert (=> b!1359138 m!1245105))

(declare-fun m!1245107 () Bool)

(assert (=> b!1359148 m!1245107))

(assert (=> b!1359148 m!1245107))

(declare-fun m!1245109 () Bool)

(assert (=> b!1359148 m!1245109))

(declare-fun m!1245111 () Bool)

(assert (=> b!1359140 m!1245111))

(declare-fun m!1245113 () Bool)

(assert (=> b!1359149 m!1245113))

(assert (=> b!1359147 m!1245107))

(assert (=> b!1359147 m!1245107))

(declare-fun m!1245115 () Bool)

(assert (=> b!1359147 m!1245115))

(declare-fun m!1245117 () Bool)

(assert (=> b!1359147 m!1245117))

(declare-fun m!1245119 () Bool)

(assert (=> b!1359147 m!1245119))

(declare-fun m!1245121 () Bool)

(assert (=> b!1359142 m!1245121))

(declare-fun m!1245123 () Bool)

(assert (=> start!114580 m!1245123))

(declare-fun m!1245125 () Bool)

(assert (=> b!1359151 m!1245125))

(declare-fun m!1245127 () Bool)

(assert (=> b!1359139 m!1245127))

(check-sat (not b!1359142) (not b!1359148) (not b!1359138) (not b!1359141) (not b!1359150) (not b!1359146) (not b!1359139) (not b!1359140) (not b!1359147) (not b!1359151) (not b!1359145) (not start!114580) (not b!1359149))
(check-sat)
(get-model)

(declare-fun d!145693 () Bool)

(assert (=> d!145693 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359140 d!145693))

(declare-fun d!145695 () Bool)

(declare-fun lt!599724 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!679 (List!31750) (InoxSet (_ BitVec 64)))

(assert (=> d!145695 (= lt!599724 (select (content!679 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771504 () Bool)

(assert (=> d!145695 (= lt!599724 e!771504)))

(declare-fun res!903168 () Bool)

(assert (=> d!145695 (=> (not res!903168) (not e!771504))))

(get-info :version)

(assert (=> d!145695 (= res!903168 ((_ is Cons!31746) acc!759))))

(assert (=> d!145695 (= (contains!9462 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599724)))

(declare-fun b!1359240 () Bool)

(declare-fun e!771505 () Bool)

(assert (=> b!1359240 (= e!771504 e!771505)))

(declare-fun res!903167 () Bool)

(assert (=> b!1359240 (=> res!903167 e!771505)))

(assert (=> b!1359240 (= res!903167 (= (h!32964 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359241 () Bool)

(assert (=> b!1359241 (= e!771505 (contains!9462 (t!46406 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145695 res!903168) b!1359240))

(assert (= (and b!1359240 (not res!903167)) b!1359241))

(declare-fun m!1245193 () Bool)

(assert (=> d!145695 m!1245193))

(declare-fun m!1245195 () Bool)

(assert (=> d!145695 m!1245195))

(declare-fun m!1245197 () Bool)

(assert (=> b!1359241 m!1245197))

(assert (=> b!1359151 d!145695))

(declare-fun d!145697 () Bool)

(declare-fun res!903175 () Bool)

(declare-fun e!771516 () Bool)

(assert (=> d!145697 (=> res!903175 e!771516)))

(assert (=> d!145697 (= res!903175 (bvsge #b00000000000000000000000000000000 (size!45273 a!3742)))))

(assert (=> d!145697 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31747) e!771516)))

(declare-fun b!1359252 () Bool)

(declare-fun e!771515 () Bool)

(assert (=> b!1359252 (= e!771515 (contains!9462 Nil!31747 (select (arr!44722 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359253 () Bool)

(declare-fun e!771517 () Bool)

(assert (=> b!1359253 (= e!771516 e!771517)))

(declare-fun res!903177 () Bool)

(assert (=> b!1359253 (=> (not res!903177) (not e!771517))))

(assert (=> b!1359253 (= res!903177 (not e!771515))))

(declare-fun res!903176 () Bool)

(assert (=> b!1359253 (=> (not res!903176) (not e!771515))))

(assert (=> b!1359253 (= res!903176 (validKeyInArray!0 (select (arr!44722 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65329 () Bool)

(declare-fun call!65332 () Bool)

(declare-fun c!127486 () Bool)

(assert (=> bm!65329 (= call!65332 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127486 (Cons!31746 (select (arr!44722 a!3742) #b00000000000000000000000000000000) Nil!31747) Nil!31747)))))

(declare-fun b!1359254 () Bool)

(declare-fun e!771514 () Bool)

(assert (=> b!1359254 (= e!771517 e!771514)))

(assert (=> b!1359254 (= c!127486 (validKeyInArray!0 (select (arr!44722 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359255 () Bool)

(assert (=> b!1359255 (= e!771514 call!65332)))

(declare-fun b!1359256 () Bool)

(assert (=> b!1359256 (= e!771514 call!65332)))

(assert (= (and d!145697 (not res!903175)) b!1359253))

(assert (= (and b!1359253 res!903176) b!1359252))

(assert (= (and b!1359253 res!903177) b!1359254))

(assert (= (and b!1359254 c!127486) b!1359256))

(assert (= (and b!1359254 (not c!127486)) b!1359255))

(assert (= (or b!1359256 b!1359255) bm!65329))

(declare-fun m!1245199 () Bool)

(assert (=> b!1359252 m!1245199))

(assert (=> b!1359252 m!1245199))

(declare-fun m!1245201 () Bool)

(assert (=> b!1359252 m!1245201))

(assert (=> b!1359253 m!1245199))

(assert (=> b!1359253 m!1245199))

(declare-fun m!1245203 () Bool)

(assert (=> b!1359253 m!1245203))

(assert (=> bm!65329 m!1245199))

(declare-fun m!1245205 () Bool)

(assert (=> bm!65329 m!1245205))

(assert (=> b!1359254 m!1245199))

(assert (=> b!1359254 m!1245199))

(assert (=> b!1359254 m!1245203))

(assert (=> b!1359149 d!145697))

(declare-fun d!145699 () Bool)

(declare-fun res!903182 () Bool)

(declare-fun e!771522 () Bool)

(assert (=> d!145699 (=> res!903182 e!771522)))

(assert (=> d!145699 (= res!903182 ((_ is Nil!31747) lt!599708))))

(assert (=> d!145699 (= (noDuplicate!2293 lt!599708) e!771522)))

(declare-fun b!1359261 () Bool)

(declare-fun e!771523 () Bool)

(assert (=> b!1359261 (= e!771522 e!771523)))

(declare-fun res!903183 () Bool)

(assert (=> b!1359261 (=> (not res!903183) (not e!771523))))

(assert (=> b!1359261 (= res!903183 (not (contains!9462 (t!46406 lt!599708) (h!32964 lt!599708))))))

(declare-fun b!1359262 () Bool)

(assert (=> b!1359262 (= e!771523 (noDuplicate!2293 (t!46406 lt!599708)))))

(assert (= (and d!145699 (not res!903182)) b!1359261))

(assert (= (and b!1359261 res!903183) b!1359262))

(declare-fun m!1245207 () Bool)

(assert (=> b!1359261 m!1245207))

(declare-fun m!1245209 () Bool)

(assert (=> b!1359262 m!1245209))

(assert (=> b!1359150 d!145699))

(declare-fun d!145705 () Bool)

(declare-fun lt!599725 () Bool)

(assert (=> d!145705 (= lt!599725 (select (content!679 lt!599708) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771524 () Bool)

(assert (=> d!145705 (= lt!599725 e!771524)))

(declare-fun res!903185 () Bool)

(assert (=> d!145705 (=> (not res!903185) (not e!771524))))

(assert (=> d!145705 (= res!903185 ((_ is Cons!31746) lt!599708))))

(assert (=> d!145705 (= (contains!9462 lt!599708 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599725)))

(declare-fun b!1359263 () Bool)

(declare-fun e!771525 () Bool)

(assert (=> b!1359263 (= e!771524 e!771525)))

(declare-fun res!903184 () Bool)

(assert (=> b!1359263 (=> res!903184 e!771525)))

(assert (=> b!1359263 (= res!903184 (= (h!32964 lt!599708) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359264 () Bool)

(assert (=> b!1359264 (= e!771525 (contains!9462 (t!46406 lt!599708) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145705 res!903185) b!1359263))

(assert (= (and b!1359263 (not res!903184)) b!1359264))

(declare-fun m!1245211 () Bool)

(assert (=> d!145705 m!1245211))

(declare-fun m!1245213 () Bool)

(assert (=> d!145705 m!1245213))

(declare-fun m!1245215 () Bool)

(assert (=> b!1359264 m!1245215))

(assert (=> b!1359139 d!145705))

(declare-fun d!145707 () Bool)

(assert (=> d!145707 (= (array_inv!34003 a!3742) (bvsge (size!45273 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114580 d!145707))

(declare-fun d!145709 () Bool)

(assert (=> d!145709 (= (validKeyInArray!0 (select (arr!44722 a!3742) from!3120)) (and (not (= (select (arr!44722 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44722 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359148 d!145709))

(declare-fun d!145711 () Bool)

(declare-fun res!903208 () Bool)

(declare-fun e!771549 () Bool)

(assert (=> d!145711 (=> res!903208 e!771549)))

(assert (=> d!145711 (= res!903208 ((_ is Nil!31747) acc!759))))

(assert (=> d!145711 (= (subseq!821 acc!759 lt!599708) e!771549)))

(declare-fun b!1359288 () Bool)

(declare-fun e!771547 () Bool)

(assert (=> b!1359288 (= e!771547 (subseq!821 acc!759 (t!46406 lt!599708)))))

(declare-fun b!1359285 () Bool)

(declare-fun e!771546 () Bool)

(assert (=> b!1359285 (= e!771549 e!771546)))

(declare-fun res!903207 () Bool)

(assert (=> b!1359285 (=> (not res!903207) (not e!771546))))

(assert (=> b!1359285 (= res!903207 ((_ is Cons!31746) lt!599708))))

(declare-fun b!1359286 () Bool)

(assert (=> b!1359286 (= e!771546 e!771547)))

(declare-fun res!903209 () Bool)

(assert (=> b!1359286 (=> res!903209 e!771547)))

(declare-fun e!771548 () Bool)

(assert (=> b!1359286 (= res!903209 e!771548)))

(declare-fun res!903206 () Bool)

(assert (=> b!1359286 (=> (not res!903206) (not e!771548))))

(assert (=> b!1359286 (= res!903206 (= (h!32964 acc!759) (h!32964 lt!599708)))))

(declare-fun b!1359287 () Bool)

(assert (=> b!1359287 (= e!771548 (subseq!821 (t!46406 acc!759) (t!46406 lt!599708)))))

(assert (= (and d!145711 (not res!903208)) b!1359285))

(assert (= (and b!1359285 res!903207) b!1359286))

(assert (= (and b!1359286 res!903206) b!1359287))

(assert (= (and b!1359286 (not res!903209)) b!1359288))

(declare-fun m!1245229 () Bool)

(assert (=> b!1359288 m!1245229))

(declare-fun m!1245231 () Bool)

(assert (=> b!1359287 m!1245231))

(assert (=> b!1359138 d!145711))

(declare-fun d!145717 () Bool)

(assert (=> d!145717 (= ($colon$colon!823 acc!759 (select (arr!44722 a!3742) from!3120)) (Cons!31746 (select (arr!44722 a!3742) from!3120) acc!759))))

(assert (=> b!1359147 d!145717))

(declare-fun d!145719 () Bool)

(declare-fun res!903216 () Bool)

(declare-fun e!771557 () Bool)

(assert (=> d!145719 (=> res!903216 e!771557)))

(assert (=> d!145719 (= res!903216 ((_ is Nil!31747) acc!759))))

(assert (=> d!145719 (= (subseq!821 acc!759 acc!759) e!771557)))

(declare-fun b!1359296 () Bool)

(declare-fun e!771555 () Bool)

(assert (=> b!1359296 (= e!771555 (subseq!821 acc!759 (t!46406 acc!759)))))

(declare-fun b!1359293 () Bool)

(declare-fun e!771554 () Bool)

(assert (=> b!1359293 (= e!771557 e!771554)))

(declare-fun res!903215 () Bool)

(assert (=> b!1359293 (=> (not res!903215) (not e!771554))))

(assert (=> b!1359293 (= res!903215 ((_ is Cons!31746) acc!759))))

(declare-fun b!1359294 () Bool)

(assert (=> b!1359294 (= e!771554 e!771555)))

(declare-fun res!903217 () Bool)

(assert (=> b!1359294 (=> res!903217 e!771555)))

(declare-fun e!771556 () Bool)

(assert (=> b!1359294 (= res!903217 e!771556)))

(declare-fun res!903214 () Bool)

(assert (=> b!1359294 (=> (not res!903214) (not e!771556))))

(assert (=> b!1359294 (= res!903214 (= (h!32964 acc!759) (h!32964 acc!759)))))

(declare-fun b!1359295 () Bool)

(assert (=> b!1359295 (= e!771556 (subseq!821 (t!46406 acc!759) (t!46406 acc!759)))))

(assert (= (and d!145719 (not res!903216)) b!1359293))

(assert (= (and b!1359293 res!903215) b!1359294))

(assert (= (and b!1359294 res!903214) b!1359295))

(assert (= (and b!1359294 (not res!903217)) b!1359296))

(declare-fun m!1245233 () Bool)

(assert (=> b!1359296 m!1245233))

(declare-fun m!1245235 () Bool)

(assert (=> b!1359295 m!1245235))

(assert (=> b!1359147 d!145719))

(declare-fun d!145721 () Bool)

(assert (=> d!145721 (subseq!821 acc!759 acc!759)))

(declare-fun lt!599734 () Unit!44612)

(declare-fun choose!36 (List!31750) Unit!44612)

(assert (=> d!145721 (= lt!599734 (choose!36 acc!759))))

(assert (=> d!145721 (= (lemmaListSubSeqRefl!0 acc!759) lt!599734)))

(declare-fun bs!38959 () Bool)

(assert (= bs!38959 d!145721))

(assert (=> bs!38959 m!1245117))

(declare-fun m!1245241 () Bool)

(assert (=> bs!38959 m!1245241))

(assert (=> b!1359147 d!145721))

(declare-fun d!145725 () Bool)

(declare-fun res!903220 () Bool)

(declare-fun e!771560 () Bool)

(assert (=> d!145725 (=> res!903220 e!771560)))

(assert (=> d!145725 (= res!903220 ((_ is Nil!31747) acc!759))))

(assert (=> d!145725 (= (noDuplicate!2293 acc!759) e!771560)))

(declare-fun b!1359299 () Bool)

(declare-fun e!771561 () Bool)

(assert (=> b!1359299 (= e!771560 e!771561)))

(declare-fun res!903221 () Bool)

(assert (=> b!1359299 (=> (not res!903221) (not e!771561))))

(assert (=> b!1359299 (= res!903221 (not (contains!9462 (t!46406 acc!759) (h!32964 acc!759))))))

(declare-fun b!1359300 () Bool)

(assert (=> b!1359300 (= e!771561 (noDuplicate!2293 (t!46406 acc!759)))))

(assert (= (and d!145725 (not res!903220)) b!1359299))

(assert (= (and b!1359299 res!903221) b!1359300))

(declare-fun m!1245243 () Bool)

(assert (=> b!1359299 m!1245243))

(declare-fun m!1245245 () Bool)

(assert (=> b!1359300 m!1245245))

(assert (=> b!1359145 d!145725))

(declare-fun d!145727 () Bool)

(declare-fun lt!599735 () Bool)

(assert (=> d!145727 (= lt!599735 (select (content!679 lt!599708) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771562 () Bool)

(assert (=> d!145727 (= lt!599735 e!771562)))

(declare-fun res!903223 () Bool)

(assert (=> d!145727 (=> (not res!903223) (not e!771562))))

(assert (=> d!145727 (= res!903223 ((_ is Cons!31746) lt!599708))))

(assert (=> d!145727 (= (contains!9462 lt!599708 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599735)))

(declare-fun b!1359301 () Bool)

(declare-fun e!771563 () Bool)

(assert (=> b!1359301 (= e!771562 e!771563)))

(declare-fun res!903222 () Bool)

(assert (=> b!1359301 (=> res!903222 e!771563)))

(assert (=> b!1359301 (= res!903222 (= (h!32964 lt!599708) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359302 () Bool)

(assert (=> b!1359302 (= e!771563 (contains!9462 (t!46406 lt!599708) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145727 res!903223) b!1359301))

(assert (= (and b!1359301 (not res!903222)) b!1359302))

(assert (=> d!145727 m!1245211))

(declare-fun m!1245247 () Bool)

(assert (=> d!145727 m!1245247))

(declare-fun m!1245249 () Bool)

(assert (=> b!1359302 m!1245249))

(assert (=> b!1359146 d!145727))

(declare-fun d!145729 () Bool)

(declare-fun lt!599736 () Bool)

(assert (=> d!145729 (= lt!599736 (select (content!679 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771564 () Bool)

(assert (=> d!145729 (= lt!599736 e!771564)))

(declare-fun res!903225 () Bool)

(assert (=> d!145729 (=> (not res!903225) (not e!771564))))

(assert (=> d!145729 (= res!903225 ((_ is Cons!31746) acc!759))))

(assert (=> d!145729 (= (contains!9462 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599736)))

(declare-fun b!1359303 () Bool)

(declare-fun e!771565 () Bool)

(assert (=> b!1359303 (= e!771564 e!771565)))

(declare-fun res!903224 () Bool)

(assert (=> b!1359303 (=> res!903224 e!771565)))

(assert (=> b!1359303 (= res!903224 (= (h!32964 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359304 () Bool)

(assert (=> b!1359304 (= e!771565 (contains!9462 (t!46406 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145729 res!903225) b!1359303))

(assert (= (and b!1359303 (not res!903224)) b!1359304))

(assert (=> d!145729 m!1245193))

(declare-fun m!1245251 () Bool)

(assert (=> d!145729 m!1245251))

(declare-fun m!1245253 () Bool)

(assert (=> b!1359304 m!1245253))

(assert (=> b!1359141 d!145729))

(declare-fun d!145731 () Bool)

(declare-fun res!903226 () Bool)

(declare-fun e!771568 () Bool)

(assert (=> d!145731 (=> res!903226 e!771568)))

(assert (=> d!145731 (= res!903226 (bvsge from!3120 (size!45273 a!3742)))))

(assert (=> d!145731 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771568)))

(declare-fun e!771567 () Bool)

(declare-fun b!1359305 () Bool)

(assert (=> b!1359305 (= e!771567 (contains!9462 acc!759 (select (arr!44722 a!3742) from!3120)))))

(declare-fun b!1359306 () Bool)

(declare-fun e!771569 () Bool)

(assert (=> b!1359306 (= e!771568 e!771569)))

(declare-fun res!903228 () Bool)

(assert (=> b!1359306 (=> (not res!903228) (not e!771569))))

(assert (=> b!1359306 (= res!903228 (not e!771567))))

(declare-fun res!903227 () Bool)

(assert (=> b!1359306 (=> (not res!903227) (not e!771567))))

(assert (=> b!1359306 (= res!903227 (validKeyInArray!0 (select (arr!44722 a!3742) from!3120)))))

(declare-fun bm!65330 () Bool)

(declare-fun call!65333 () Bool)

(declare-fun c!127487 () Bool)

(assert (=> bm!65330 (= call!65333 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127487 (Cons!31746 (select (arr!44722 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1359307 () Bool)

(declare-fun e!771566 () Bool)

(assert (=> b!1359307 (= e!771569 e!771566)))

(assert (=> b!1359307 (= c!127487 (validKeyInArray!0 (select (arr!44722 a!3742) from!3120)))))

(declare-fun b!1359308 () Bool)

(assert (=> b!1359308 (= e!771566 call!65333)))

(declare-fun b!1359309 () Bool)

(assert (=> b!1359309 (= e!771566 call!65333)))

(assert (= (and d!145731 (not res!903226)) b!1359306))

(assert (= (and b!1359306 res!903227) b!1359305))

(assert (= (and b!1359306 res!903228) b!1359307))

(assert (= (and b!1359307 c!127487) b!1359309))

(assert (= (and b!1359307 (not c!127487)) b!1359308))

(assert (= (or b!1359309 b!1359308) bm!65330))

(assert (=> b!1359305 m!1245107))

(assert (=> b!1359305 m!1245107))

(declare-fun m!1245255 () Bool)

(assert (=> b!1359305 m!1245255))

(assert (=> b!1359306 m!1245107))

(assert (=> b!1359306 m!1245107))

(assert (=> b!1359306 m!1245109))

(assert (=> bm!65330 m!1245107))

(declare-fun m!1245257 () Bool)

(assert (=> bm!65330 m!1245257))

(assert (=> b!1359307 m!1245107))

(assert (=> b!1359307 m!1245107))

(assert (=> b!1359307 m!1245109))

(assert (=> b!1359142 d!145731))

(check-sat (not b!1359302) (not b!1359254) (not b!1359304) (not b!1359300) (not bm!65330) (not b!1359287) (not b!1359264) (not b!1359241) (not b!1359252) (not b!1359296) (not d!145695) (not d!145721) (not d!145727) (not b!1359307) (not d!145705) (not b!1359262) (not b!1359295) (not b!1359288) (not b!1359306) (not d!145729) (not bm!65329) (not b!1359299) (not b!1359253) (not b!1359261) (not b!1359305))
(check-sat)
