; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114970 () Bool)

(assert start!114970)

(declare-fun b!1362137 () Bool)

(declare-fun res!905592 () Bool)

(declare-fun e!772879 () Bool)

(assert (=> b!1362137 (=> (not res!905592) (not e!772879))))

(declare-datatypes ((List!31810 0))(
  ( (Nil!31807) (Cons!31806 (h!33024 (_ BitVec 64)) (t!46481 List!31810)) )
))
(declare-fun acc!759 () List!31810)

(declare-fun contains!9522 (List!31810 (_ BitVec 64)) Bool)

(assert (=> b!1362137 (= res!905592 (not (contains!9522 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362138 () Bool)

(declare-fun res!905582 () Bool)

(declare-fun e!772877 () Bool)

(assert (=> b!1362138 (=> (not res!905582) (not e!772877))))

(declare-fun lt!600474 () List!31810)

(declare-fun noDuplicate!2353 (List!31810) Bool)

(assert (=> b!1362138 (= res!905582 (noDuplicate!2353 lt!600474))))

(declare-fun b!1362139 () Bool)

(declare-fun res!905586 () Bool)

(assert (=> b!1362139 (=> (not res!905586) (not e!772879))))

(assert (=> b!1362139 (= res!905586 (not (contains!9522 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905587 () Bool)

(assert (=> start!114970 (=> (not res!905587) (not e!772879))))

(declare-datatypes ((array!92698 0))(
  ( (array!92699 (arr!44782 (Array (_ BitVec 32) (_ BitVec 64))) (size!45333 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92698)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114970 (= res!905587 (and (bvslt (size!45333 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45333 a!3742))))))

(assert (=> start!114970 e!772879))

(assert (=> start!114970 true))

(declare-fun array_inv!34063 (array!92698) Bool)

(assert (=> start!114970 (array_inv!34063 a!3742)))

(declare-fun b!1362140 () Bool)

(declare-fun res!905580 () Bool)

(assert (=> b!1362140 (=> (not res!905580) (not e!772879))))

(assert (=> b!1362140 (= res!905580 (noDuplicate!2353 acc!759))))

(declare-fun b!1362141 () Bool)

(declare-fun e!772878 () Bool)

(assert (=> b!1362141 (= e!772877 e!772878)))

(declare-fun res!905591 () Bool)

(assert (=> b!1362141 (=> res!905591 e!772878)))

(assert (=> b!1362141 (= res!905591 (contains!9522 lt!600474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362142 () Bool)

(declare-fun e!772876 () Bool)

(assert (=> b!1362142 (= e!772876 e!772877)))

(declare-fun res!905584 () Bool)

(assert (=> b!1362142 (=> (not res!905584) (not e!772877))))

(assert (=> b!1362142 (= res!905584 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!883 (List!31810 (_ BitVec 64)) List!31810)

(assert (=> b!1362142 (= lt!600474 ($colon$colon!883 acc!759 (select (arr!44782 a!3742) from!3120)))))

(declare-fun b!1362143 () Bool)

(assert (=> b!1362143 (= e!772878 (contains!9522 lt!600474 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362144 () Bool)

(declare-datatypes ((Unit!44786 0))(
  ( (Unit!44787) )
))
(declare-fun e!772875 () Unit!44786)

(declare-fun lt!600472 () Unit!44786)

(assert (=> b!1362144 (= e!772875 lt!600472)))

(declare-fun lt!600470 () Unit!44786)

(declare-fun lemmaListSubSeqRefl!0 (List!31810) Unit!44786)

(assert (=> b!1362144 (= lt!600470 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!881 (List!31810 List!31810) Bool)

(assert (=> b!1362144 (subseq!881 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92698 List!31810 List!31810 (_ BitVec 32)) Unit!44786)

(assert (=> b!1362144 (= lt!600472 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!883 acc!759 (select (arr!44782 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92698 (_ BitVec 32) List!31810) Bool)

(assert (=> b!1362144 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362145 () Bool)

(declare-fun res!905589 () Bool)

(assert (=> b!1362145 (=> (not res!905589) (not e!772879))))

(assert (=> b!1362145 (= res!905589 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31807))))

(declare-fun b!1362146 () Bool)

(declare-fun res!905581 () Bool)

(assert (=> b!1362146 (=> (not res!905581) (not e!772879))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362146 (= res!905581 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362147 () Bool)

(declare-fun res!905590 () Bool)

(assert (=> b!1362147 (=> (not res!905590) (not e!772879))))

(assert (=> b!1362147 (= res!905590 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45333 a!3742)))))

(declare-fun b!1362148 () Bool)

(declare-fun res!905583 () Bool)

(assert (=> b!1362148 (=> (not res!905583) (not e!772879))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362148 (= res!905583 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45333 a!3742))))))

(declare-fun b!1362149 () Bool)

(declare-fun Unit!44788 () Unit!44786)

(assert (=> b!1362149 (= e!772875 Unit!44788)))

(declare-fun b!1362150 () Bool)

(declare-fun res!905585 () Bool)

(assert (=> b!1362150 (=> (not res!905585) (not e!772879))))

(assert (=> b!1362150 (= res!905585 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362151 () Bool)

(assert (=> b!1362151 (= e!772879 e!772876)))

(declare-fun res!905588 () Bool)

(assert (=> b!1362151 (=> (not res!905588) (not e!772876))))

(declare-fun lt!600473 () Bool)

(assert (=> b!1362151 (= res!905588 (and (not (= from!3120 i!1404)) lt!600473))))

(declare-fun lt!600471 () Unit!44786)

(assert (=> b!1362151 (= lt!600471 e!772875)))

(declare-fun c!127726 () Bool)

(assert (=> b!1362151 (= c!127726 lt!600473)))

(assert (=> b!1362151 (= lt!600473 (validKeyInArray!0 (select (arr!44782 a!3742) from!3120)))))

(assert (= (and start!114970 res!905587) b!1362140))

(assert (= (and b!1362140 res!905580) b!1362137))

(assert (= (and b!1362137 res!905592) b!1362139))

(assert (= (and b!1362139 res!905586) b!1362145))

(assert (= (and b!1362145 res!905589) b!1362150))

(assert (= (and b!1362150 res!905585) b!1362148))

(assert (= (and b!1362148 res!905583) b!1362146))

(assert (= (and b!1362146 res!905581) b!1362147))

(assert (= (and b!1362147 res!905590) b!1362151))

(assert (= (and b!1362151 c!127726) b!1362144))

(assert (= (and b!1362151 (not c!127726)) b!1362149))

(assert (= (and b!1362151 res!905588) b!1362142))

(assert (= (and b!1362142 res!905584) b!1362138))

(assert (= (and b!1362138 res!905582) b!1362141))

(assert (= (and b!1362141 (not res!905591)) b!1362143))

(declare-fun m!1247641 () Bool)

(assert (=> start!114970 m!1247641))

(declare-fun m!1247643 () Bool)

(assert (=> b!1362140 m!1247643))

(declare-fun m!1247645 () Bool)

(assert (=> b!1362146 m!1247645))

(declare-fun m!1247647 () Bool)

(assert (=> b!1362137 m!1247647))

(declare-fun m!1247649 () Bool)

(assert (=> b!1362141 m!1247649))

(declare-fun m!1247651 () Bool)

(assert (=> b!1362145 m!1247651))

(declare-fun m!1247653 () Bool)

(assert (=> b!1362139 m!1247653))

(declare-fun m!1247655 () Bool)

(assert (=> b!1362144 m!1247655))

(declare-fun m!1247657 () Bool)

(assert (=> b!1362144 m!1247657))

(declare-fun m!1247659 () Bool)

(assert (=> b!1362144 m!1247659))

(declare-fun m!1247661 () Bool)

(assert (=> b!1362144 m!1247661))

(declare-fun m!1247663 () Bool)

(assert (=> b!1362144 m!1247663))

(assert (=> b!1362144 m!1247657))

(assert (=> b!1362144 m!1247659))

(declare-fun m!1247665 () Bool)

(assert (=> b!1362144 m!1247665))

(assert (=> b!1362142 m!1247657))

(assert (=> b!1362142 m!1247657))

(assert (=> b!1362142 m!1247659))

(assert (=> b!1362151 m!1247657))

(assert (=> b!1362151 m!1247657))

(declare-fun m!1247667 () Bool)

(assert (=> b!1362151 m!1247667))

(declare-fun m!1247669 () Bool)

(assert (=> b!1362138 m!1247669))

(declare-fun m!1247671 () Bool)

(assert (=> b!1362143 m!1247671))

(declare-fun m!1247673 () Bool)

(assert (=> b!1362150 m!1247673))

(check-sat (not b!1362151) (not b!1362143) (not b!1362150) (not b!1362144) (not b!1362146) (not start!114970) (not b!1362145) (not b!1362138) (not b!1362141) (not b!1362140) (not b!1362139) (not b!1362137) (not b!1362142))
(check-sat)
(get-model)

(declare-fun d!146183 () Bool)

(assert (=> d!146183 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600507 () Unit!44786)

(declare-fun choose!80 (array!92698 List!31810 List!31810 (_ BitVec 32)) Unit!44786)

(assert (=> d!146183 (= lt!600507 (choose!80 a!3742 ($colon$colon!883 acc!759 (select (arr!44782 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146183 (bvslt (size!45333 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146183 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!883 acc!759 (select (arr!44782 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600507)))

(declare-fun bs!39043 () Bool)

(assert (= bs!39043 d!146183))

(assert (=> bs!39043 m!1247663))

(assert (=> bs!39043 m!1247659))

(declare-fun m!1247743 () Bool)

(assert (=> bs!39043 m!1247743))

(assert (=> b!1362144 d!146183))

(declare-fun b!1362250 () Bool)

(declare-fun e!772924 () Bool)

(declare-fun e!772925 () Bool)

(assert (=> b!1362250 (= e!772924 e!772925)))

(declare-fun res!905680 () Bool)

(assert (=> b!1362250 (=> (not res!905680) (not e!772925))))

(get-info :version)

(assert (=> b!1362250 (= res!905680 ((_ is Cons!31806) acc!759))))

(declare-fun b!1362251 () Bool)

(declare-fun e!772926 () Bool)

(assert (=> b!1362251 (= e!772925 e!772926)))

(declare-fun res!905682 () Bool)

(assert (=> b!1362251 (=> res!905682 e!772926)))

(declare-fun e!772927 () Bool)

(assert (=> b!1362251 (= res!905682 e!772927)))

(declare-fun res!905681 () Bool)

(assert (=> b!1362251 (=> (not res!905681) (not e!772927))))

(assert (=> b!1362251 (= res!905681 (= (h!33024 acc!759) (h!33024 acc!759)))))

(declare-fun b!1362252 () Bool)

(assert (=> b!1362252 (= e!772927 (subseq!881 (t!46481 acc!759) (t!46481 acc!759)))))

(declare-fun d!146185 () Bool)

(declare-fun res!905679 () Bool)

(assert (=> d!146185 (=> res!905679 e!772924)))

(assert (=> d!146185 (= res!905679 ((_ is Nil!31807) acc!759))))

(assert (=> d!146185 (= (subseq!881 acc!759 acc!759) e!772924)))

(declare-fun b!1362253 () Bool)

(assert (=> b!1362253 (= e!772926 (subseq!881 acc!759 (t!46481 acc!759)))))

(assert (= (and d!146185 (not res!905679)) b!1362250))

(assert (= (and b!1362250 res!905680) b!1362251))

(assert (= (and b!1362251 res!905681) b!1362252))

(assert (= (and b!1362251 (not res!905682)) b!1362253))

(declare-fun m!1247745 () Bool)

(assert (=> b!1362252 m!1247745))

(declare-fun m!1247747 () Bool)

(assert (=> b!1362253 m!1247747))

(assert (=> b!1362144 d!146185))

(declare-fun b!1362264 () Bool)

(declare-fun e!772936 () Bool)

(declare-fun e!772937 () Bool)

(assert (=> b!1362264 (= e!772936 e!772937)))

(declare-fun c!127735 () Bool)

(assert (=> b!1362264 (= c!127735 (validKeyInArray!0 (select (arr!44782 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun call!65410 () Bool)

(declare-fun bm!65407 () Bool)

(assert (=> bm!65407 (= call!65410 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127735 (Cons!31806 (select (arr!44782 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1362265 () Bool)

(assert (=> b!1362265 (= e!772937 call!65410)))

(declare-fun b!1362267 () Bool)

(assert (=> b!1362267 (= e!772937 call!65410)))

(declare-fun b!1362268 () Bool)

(declare-fun e!772939 () Bool)

(assert (=> b!1362268 (= e!772939 e!772936)))

(declare-fun res!905689 () Bool)

(assert (=> b!1362268 (=> (not res!905689) (not e!772936))))

(declare-fun e!772938 () Bool)

(assert (=> b!1362268 (= res!905689 (not e!772938))))

(declare-fun res!905691 () Bool)

(assert (=> b!1362268 (=> (not res!905691) (not e!772938))))

(assert (=> b!1362268 (= res!905691 (validKeyInArray!0 (select (arr!44782 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146187 () Bool)

(declare-fun res!905690 () Bool)

(assert (=> d!146187 (=> res!905690 e!772939)))

(assert (=> d!146187 (= res!905690 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45333 a!3742)))))

(assert (=> d!146187 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772939)))

(declare-fun b!1362266 () Bool)

(assert (=> b!1362266 (= e!772938 (contains!9522 acc!759 (select (arr!44782 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146187 (not res!905690)) b!1362268))

(assert (= (and b!1362268 res!905691) b!1362266))

(assert (= (and b!1362268 res!905689) b!1362264))

(assert (= (and b!1362264 c!127735) b!1362265))

(assert (= (and b!1362264 (not c!127735)) b!1362267))

(assert (= (or b!1362265 b!1362267) bm!65407))

(declare-fun m!1247749 () Bool)

(assert (=> b!1362264 m!1247749))

(assert (=> b!1362264 m!1247749))

(declare-fun m!1247751 () Bool)

(assert (=> b!1362264 m!1247751))

(assert (=> bm!65407 m!1247749))

(declare-fun m!1247753 () Bool)

(assert (=> bm!65407 m!1247753))

(assert (=> b!1362268 m!1247749))

(assert (=> b!1362268 m!1247749))

(assert (=> b!1362268 m!1247751))

(assert (=> b!1362266 m!1247749))

(assert (=> b!1362266 m!1247749))

(declare-fun m!1247755 () Bool)

(assert (=> b!1362266 m!1247755))

(assert (=> b!1362144 d!146187))

(declare-fun d!146189 () Bool)

(assert (=> d!146189 (= ($colon$colon!883 acc!759 (select (arr!44782 a!3742) from!3120)) (Cons!31806 (select (arr!44782 a!3742) from!3120) acc!759))))

(assert (=> b!1362144 d!146189))

(declare-fun d!146191 () Bool)

(assert (=> d!146191 (subseq!881 acc!759 acc!759)))

(declare-fun lt!600510 () Unit!44786)

(declare-fun choose!36 (List!31810) Unit!44786)

(assert (=> d!146191 (= lt!600510 (choose!36 acc!759))))

(assert (=> d!146191 (= (lemmaListSubSeqRefl!0 acc!759) lt!600510)))

(declare-fun bs!39044 () Bool)

(assert (= bs!39044 d!146191))

(assert (=> bs!39044 m!1247665))

(declare-fun m!1247757 () Bool)

(assert (=> bs!39044 m!1247757))

(assert (=> b!1362144 d!146191))

(declare-fun d!146193 () Bool)

(declare-fun lt!600513 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!691 (List!31810) (InoxSet (_ BitVec 64)))

(assert (=> d!146193 (= lt!600513 (select (content!691 lt!600474) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772944 () Bool)

(assert (=> d!146193 (= lt!600513 e!772944)))

(declare-fun res!905697 () Bool)

(assert (=> d!146193 (=> (not res!905697) (not e!772944))))

(assert (=> d!146193 (= res!905697 ((_ is Cons!31806) lt!600474))))

(assert (=> d!146193 (= (contains!9522 lt!600474 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600513)))

(declare-fun b!1362273 () Bool)

(declare-fun e!772945 () Bool)

(assert (=> b!1362273 (= e!772944 e!772945)))

(declare-fun res!905696 () Bool)

(assert (=> b!1362273 (=> res!905696 e!772945)))

(assert (=> b!1362273 (= res!905696 (= (h!33024 lt!600474) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362274 () Bool)

(assert (=> b!1362274 (= e!772945 (contains!9522 (t!46481 lt!600474) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146193 res!905697) b!1362273))

(assert (= (and b!1362273 (not res!905696)) b!1362274))

(declare-fun m!1247759 () Bool)

(assert (=> d!146193 m!1247759))

(declare-fun m!1247761 () Bool)

(assert (=> d!146193 m!1247761))

(declare-fun m!1247763 () Bool)

(assert (=> b!1362274 m!1247763))

(assert (=> b!1362143 d!146193))

(assert (=> b!1362142 d!146189))

(declare-fun d!146199 () Bool)

(declare-fun lt!600514 () Bool)

(assert (=> d!146199 (= lt!600514 (select (content!691 lt!600474) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772946 () Bool)

(assert (=> d!146199 (= lt!600514 e!772946)))

(declare-fun res!905699 () Bool)

(assert (=> d!146199 (=> (not res!905699) (not e!772946))))

(assert (=> d!146199 (= res!905699 ((_ is Cons!31806) lt!600474))))

(assert (=> d!146199 (= (contains!9522 lt!600474 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600514)))

(declare-fun b!1362275 () Bool)

(declare-fun e!772947 () Bool)

(assert (=> b!1362275 (= e!772946 e!772947)))

(declare-fun res!905698 () Bool)

(assert (=> b!1362275 (=> res!905698 e!772947)))

(assert (=> b!1362275 (= res!905698 (= (h!33024 lt!600474) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362276 () Bool)

(assert (=> b!1362276 (= e!772947 (contains!9522 (t!46481 lt!600474) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146199 res!905699) b!1362275))

(assert (= (and b!1362275 (not res!905698)) b!1362276))

(assert (=> d!146199 m!1247759))

(declare-fun m!1247765 () Bool)

(assert (=> d!146199 m!1247765))

(declare-fun m!1247767 () Bool)

(assert (=> b!1362276 m!1247767))

(assert (=> b!1362141 d!146199))

(declare-fun d!146201 () Bool)

(assert (=> d!146201 (= (validKeyInArray!0 (select (arr!44782 a!3742) from!3120)) (and (not (= (select (arr!44782 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44782 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362151 d!146201))

(declare-fun d!146203 () Bool)

(declare-fun res!905716 () Bool)

(declare-fun e!772966 () Bool)

(assert (=> d!146203 (=> res!905716 e!772966)))

(assert (=> d!146203 (= res!905716 ((_ is Nil!31807) acc!759))))

(assert (=> d!146203 (= (noDuplicate!2353 acc!759) e!772966)))

(declare-fun b!1362297 () Bool)

(declare-fun e!772967 () Bool)

(assert (=> b!1362297 (= e!772966 e!772967)))

(declare-fun res!905717 () Bool)

(assert (=> b!1362297 (=> (not res!905717) (not e!772967))))

(assert (=> b!1362297 (= res!905717 (not (contains!9522 (t!46481 acc!759) (h!33024 acc!759))))))

(declare-fun b!1362298 () Bool)

(assert (=> b!1362298 (= e!772967 (noDuplicate!2353 (t!46481 acc!759)))))

(assert (= (and d!146203 (not res!905716)) b!1362297))

(assert (= (and b!1362297 res!905717) b!1362298))

(declare-fun m!1247775 () Bool)

(assert (=> b!1362297 m!1247775))

(declare-fun m!1247777 () Bool)

(assert (=> b!1362298 m!1247777))

(assert (=> b!1362140 d!146203))

(declare-fun b!1362299 () Bool)

(declare-fun e!772968 () Bool)

(declare-fun e!772969 () Bool)

(assert (=> b!1362299 (= e!772968 e!772969)))

(declare-fun c!127738 () Bool)

(assert (=> b!1362299 (= c!127738 (validKeyInArray!0 (select (arr!44782 a!3742) from!3120)))))

(declare-fun call!65413 () Bool)

(declare-fun bm!65410 () Bool)

(assert (=> bm!65410 (= call!65413 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127738 (Cons!31806 (select (arr!44782 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1362300 () Bool)

(assert (=> b!1362300 (= e!772969 call!65413)))

(declare-fun b!1362302 () Bool)

(assert (=> b!1362302 (= e!772969 call!65413)))

(declare-fun b!1362303 () Bool)

(declare-fun e!772971 () Bool)

(assert (=> b!1362303 (= e!772971 e!772968)))

(declare-fun res!905718 () Bool)

(assert (=> b!1362303 (=> (not res!905718) (not e!772968))))

(declare-fun e!772970 () Bool)

(assert (=> b!1362303 (= res!905718 (not e!772970))))

(declare-fun res!905720 () Bool)

(assert (=> b!1362303 (=> (not res!905720) (not e!772970))))

(assert (=> b!1362303 (= res!905720 (validKeyInArray!0 (select (arr!44782 a!3742) from!3120)))))

(declare-fun d!146207 () Bool)

(declare-fun res!905719 () Bool)

(assert (=> d!146207 (=> res!905719 e!772971)))

(assert (=> d!146207 (= res!905719 (bvsge from!3120 (size!45333 a!3742)))))

(assert (=> d!146207 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772971)))

(declare-fun b!1362301 () Bool)

(assert (=> b!1362301 (= e!772970 (contains!9522 acc!759 (select (arr!44782 a!3742) from!3120)))))

(assert (= (and d!146207 (not res!905719)) b!1362303))

(assert (= (and b!1362303 res!905720) b!1362301))

(assert (= (and b!1362303 res!905718) b!1362299))

(assert (= (and b!1362299 c!127738) b!1362300))

(assert (= (and b!1362299 (not c!127738)) b!1362302))

(assert (= (or b!1362300 b!1362302) bm!65410))

(assert (=> b!1362299 m!1247657))

(assert (=> b!1362299 m!1247657))

(assert (=> b!1362299 m!1247667))

(assert (=> bm!65410 m!1247657))

(declare-fun m!1247779 () Bool)

(assert (=> bm!65410 m!1247779))

(assert (=> b!1362303 m!1247657))

(assert (=> b!1362303 m!1247657))

(assert (=> b!1362303 m!1247667))

(assert (=> b!1362301 m!1247657))

(assert (=> b!1362301 m!1247657))

(declare-fun m!1247781 () Bool)

(assert (=> b!1362301 m!1247781))

(assert (=> b!1362150 d!146207))

(declare-fun d!146211 () Bool)

(declare-fun lt!600518 () Bool)

(assert (=> d!146211 (= lt!600518 (select (content!691 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772972 () Bool)

(assert (=> d!146211 (= lt!600518 e!772972)))

(declare-fun res!905722 () Bool)

(assert (=> d!146211 (=> (not res!905722) (not e!772972))))

(assert (=> d!146211 (= res!905722 ((_ is Cons!31806) acc!759))))

(assert (=> d!146211 (= (contains!9522 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600518)))

(declare-fun b!1362304 () Bool)

(declare-fun e!772973 () Bool)

(assert (=> b!1362304 (= e!772972 e!772973)))

(declare-fun res!905721 () Bool)

(assert (=> b!1362304 (=> res!905721 e!772973)))

(assert (=> b!1362304 (= res!905721 (= (h!33024 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362305 () Bool)

(assert (=> b!1362305 (= e!772973 (contains!9522 (t!46481 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146211 res!905722) b!1362304))

(assert (= (and b!1362304 (not res!905721)) b!1362305))

(declare-fun m!1247783 () Bool)

(assert (=> d!146211 m!1247783))

(declare-fun m!1247785 () Bool)

(assert (=> d!146211 m!1247785))

(declare-fun m!1247787 () Bool)

(assert (=> b!1362305 m!1247787))

(assert (=> b!1362139 d!146211))

(declare-fun d!146213 () Bool)

(declare-fun res!905723 () Bool)

(declare-fun e!772974 () Bool)

(assert (=> d!146213 (=> res!905723 e!772974)))

(assert (=> d!146213 (= res!905723 ((_ is Nil!31807) lt!600474))))

(assert (=> d!146213 (= (noDuplicate!2353 lt!600474) e!772974)))

(declare-fun b!1362306 () Bool)

(declare-fun e!772975 () Bool)

(assert (=> b!1362306 (= e!772974 e!772975)))

(declare-fun res!905724 () Bool)

(assert (=> b!1362306 (=> (not res!905724) (not e!772975))))

(assert (=> b!1362306 (= res!905724 (not (contains!9522 (t!46481 lt!600474) (h!33024 lt!600474))))))

(declare-fun b!1362307 () Bool)

(assert (=> b!1362307 (= e!772975 (noDuplicate!2353 (t!46481 lt!600474)))))

(assert (= (and d!146213 (not res!905723)) b!1362306))

(assert (= (and b!1362306 res!905724) b!1362307))

(declare-fun m!1247789 () Bool)

(assert (=> b!1362306 m!1247789))

(declare-fun m!1247791 () Bool)

(assert (=> b!1362307 m!1247791))

(assert (=> b!1362138 d!146213))

(declare-fun d!146215 () Bool)

(assert (=> d!146215 (= (array_inv!34063 a!3742) (bvsge (size!45333 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114970 d!146215))

(declare-fun d!146217 () Bool)

(declare-fun lt!600519 () Bool)

(assert (=> d!146217 (= lt!600519 (select (content!691 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772976 () Bool)

(assert (=> d!146217 (= lt!600519 e!772976)))

(declare-fun res!905726 () Bool)

(assert (=> d!146217 (=> (not res!905726) (not e!772976))))

(assert (=> d!146217 (= res!905726 ((_ is Cons!31806) acc!759))))

(assert (=> d!146217 (= (contains!9522 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600519)))

(declare-fun b!1362308 () Bool)

(declare-fun e!772977 () Bool)

(assert (=> b!1362308 (= e!772976 e!772977)))

(declare-fun res!905725 () Bool)

(assert (=> b!1362308 (=> res!905725 e!772977)))

(assert (=> b!1362308 (= res!905725 (= (h!33024 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362309 () Bool)

(assert (=> b!1362309 (= e!772977 (contains!9522 (t!46481 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146217 res!905726) b!1362308))

(assert (= (and b!1362308 (not res!905725)) b!1362309))

(assert (=> d!146217 m!1247783))

(declare-fun m!1247793 () Bool)

(assert (=> d!146217 m!1247793))

(declare-fun m!1247795 () Bool)

(assert (=> b!1362309 m!1247795))

(assert (=> b!1362137 d!146217))

(declare-fun d!146219 () Bool)

(assert (=> d!146219 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362146 d!146219))

(declare-fun b!1362315 () Bool)

(declare-fun e!772982 () Bool)

(declare-fun e!772983 () Bool)

(assert (=> b!1362315 (= e!772982 e!772983)))

(declare-fun c!127740 () Bool)

(assert (=> b!1362315 (= c!127740 (validKeyInArray!0 (select (arr!44782 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65412 () Bool)

(declare-fun call!65415 () Bool)

(assert (=> bm!65412 (= call!65415 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127740 (Cons!31806 (select (arr!44782 a!3742) #b00000000000000000000000000000000) Nil!31807) Nil!31807)))))

(declare-fun b!1362316 () Bool)

(assert (=> b!1362316 (= e!772983 call!65415)))

(declare-fun b!1362318 () Bool)

(assert (=> b!1362318 (= e!772983 call!65415)))

(declare-fun b!1362319 () Bool)

(declare-fun e!772985 () Bool)

(assert (=> b!1362319 (= e!772985 e!772982)))

(declare-fun res!905730 () Bool)

(assert (=> b!1362319 (=> (not res!905730) (not e!772982))))

(declare-fun e!772984 () Bool)

(assert (=> b!1362319 (= res!905730 (not e!772984))))

(declare-fun res!905732 () Bool)

(assert (=> b!1362319 (=> (not res!905732) (not e!772984))))

(assert (=> b!1362319 (= res!905732 (validKeyInArray!0 (select (arr!44782 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146221 () Bool)

(declare-fun res!905731 () Bool)

(assert (=> d!146221 (=> res!905731 e!772985)))

(assert (=> d!146221 (= res!905731 (bvsge #b00000000000000000000000000000000 (size!45333 a!3742)))))

(assert (=> d!146221 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31807) e!772985)))

(declare-fun b!1362317 () Bool)

(assert (=> b!1362317 (= e!772984 (contains!9522 Nil!31807 (select (arr!44782 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146221 (not res!905731)) b!1362319))

(assert (= (and b!1362319 res!905732) b!1362317))

(assert (= (and b!1362319 res!905730) b!1362315))

(assert (= (and b!1362315 c!127740) b!1362316))

(assert (= (and b!1362315 (not c!127740)) b!1362318))

(assert (= (or b!1362316 b!1362318) bm!65412))

(declare-fun m!1247797 () Bool)

(assert (=> b!1362315 m!1247797))

(assert (=> b!1362315 m!1247797))

(declare-fun m!1247799 () Bool)

(assert (=> b!1362315 m!1247799))

(assert (=> bm!65412 m!1247797))

(declare-fun m!1247801 () Bool)

(assert (=> bm!65412 m!1247801))

(assert (=> b!1362319 m!1247797))

(assert (=> b!1362319 m!1247797))

(assert (=> b!1362319 m!1247799))

(assert (=> b!1362317 m!1247797))

(assert (=> b!1362317 m!1247797))

(declare-fun m!1247805 () Bool)

(assert (=> b!1362317 m!1247805))

(assert (=> b!1362145 d!146221))

(check-sat (not d!146191) (not b!1362297) (not b!1362264) (not d!146217) (not b!1362252) (not b!1362319) (not b!1362317) (not d!146183) (not b!1362309) (not b!1362303) (not b!1362306) (not d!146211) (not b!1362301) (not bm!65407) (not bm!65410) (not b!1362253) (not b!1362266) (not b!1362298) (not b!1362268) (not b!1362315) (not b!1362307) (not b!1362299) (not b!1362305) (not d!146193) (not d!146199) (not b!1362274) (not bm!65412) (not b!1362276))
(check-sat)
