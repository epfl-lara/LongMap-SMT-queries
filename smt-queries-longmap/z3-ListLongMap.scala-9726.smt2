; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115082 () Bool)

(assert start!115082)

(declare-fun b!1363812 () Bool)

(declare-fun e!773369 () Bool)

(declare-fun e!773370 () Bool)

(assert (=> b!1363812 (= e!773369 e!773370)))

(declare-fun res!907596 () Bool)

(assert (=> b!1363812 (=> (not res!907596) (not e!773370))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!600751 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363812 (= res!907596 (and (not (= from!3120 i!1404)) (not lt!600751) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44859 0))(
  ( (Unit!44860) )
))
(declare-fun lt!600750 () Unit!44859)

(declare-fun e!773371 () Unit!44859)

(assert (=> b!1363812 (= lt!600750 e!773371)))

(declare-fun c!127553 () Bool)

(assert (=> b!1363812 (= c!127553 lt!600751)))

(declare-datatypes ((array!92658 0))(
  ( (array!92659 (arr!44761 (Array (_ BitVec 32) (_ BitVec 64))) (size!45313 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92658)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363812 (= lt!600751 (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)))))

(declare-fun b!1363813 () Bool)

(declare-fun res!907601 () Bool)

(assert (=> b!1363813 (=> (not res!907601) (not e!773369))))

(declare-datatypes ((List!31880 0))(
  ( (Nil!31877) (Cons!31876 (h!33085 (_ BitVec 64)) (t!46563 List!31880)) )
))
(declare-fun acc!759 () List!31880)

(declare-fun arrayNoDuplicates!0 (array!92658 (_ BitVec 32) List!31880) Bool)

(assert (=> b!1363813 (= res!907601 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363814 () Bool)

(declare-fun res!907597 () Bool)

(assert (=> b!1363814 (=> (not res!907597) (not e!773369))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363814 (= res!907597 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363815 () Bool)

(declare-fun res!907593 () Bool)

(assert (=> b!1363815 (=> (not res!907593) (not e!773369))))

(assert (=> b!1363815 (= res!907593 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45313 a!3742)))))

(declare-fun b!1363816 () Bool)

(declare-fun lt!600753 () Unit!44859)

(assert (=> b!1363816 (= e!773371 lt!600753)))

(declare-fun lt!600752 () Unit!44859)

(declare-fun lemmaListSubSeqRefl!0 (List!31880) Unit!44859)

(assert (=> b!1363816 (= lt!600752 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!938 (List!31880 List!31880) Bool)

(assert (=> b!1363816 (subseq!938 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92658 List!31880 List!31880 (_ BitVec 32)) Unit!44859)

(declare-fun $colon$colon!943 (List!31880 (_ BitVec 64)) List!31880)

(assert (=> b!1363816 (= lt!600753 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!943 acc!759 (select (arr!44761 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363816 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363817 () Bool)

(declare-fun res!907595 () Bool)

(assert (=> b!1363817 (=> (not res!907595) (not e!773370))))

(assert (=> b!1363817 (= res!907595 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363818 () Bool)

(declare-fun res!907598 () Bool)

(assert (=> b!1363818 (=> (not res!907598) (not e!773369))))

(declare-fun contains!9500 (List!31880 (_ BitVec 64)) Bool)

(assert (=> b!1363818 (= res!907598 (not (contains!9500 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363819 () Bool)

(declare-fun res!907599 () Bool)

(assert (=> b!1363819 (=> (not res!907599) (not e!773369))))

(assert (=> b!1363819 (= res!907599 (not (contains!9500 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!600749 () array!92658)

(declare-fun b!1363820 () Bool)

(assert (=> b!1363820 (= e!773370 (not (arrayNoDuplicates!0 lt!600749 from!3120 acc!759)))))

(assert (=> b!1363820 (arrayNoDuplicates!0 lt!600749 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (=> b!1363820 (= lt!600749 (array!92659 (store (arr!44761 a!3742) i!1404 l!3587) (size!45313 a!3742)))))

(declare-fun lt!600754 () Unit!44859)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31880) Unit!44859)

(assert (=> b!1363820 (= lt!600754 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!907591 () Bool)

(assert (=> start!115082 (=> (not res!907591) (not e!773369))))

(assert (=> start!115082 (= res!907591 (and (bvslt (size!45313 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45313 a!3742))))))

(assert (=> start!115082 e!773369))

(assert (=> start!115082 true))

(declare-fun array_inv!33994 (array!92658) Bool)

(assert (=> start!115082 (array_inv!33994 a!3742)))

(declare-fun b!1363821 () Bool)

(declare-fun res!907594 () Bool)

(assert (=> b!1363821 (=> (not res!907594) (not e!773369))))

(assert (=> b!1363821 (= res!907594 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45313 a!3742))))))

(declare-fun b!1363822 () Bool)

(declare-fun res!907592 () Bool)

(assert (=> b!1363822 (=> (not res!907592) (not e!773369))))

(declare-fun noDuplicate!2415 (List!31880) Bool)

(assert (=> b!1363822 (= res!907592 (noDuplicate!2415 acc!759))))

(declare-fun b!1363823 () Bool)

(declare-fun Unit!44861 () Unit!44859)

(assert (=> b!1363823 (= e!773371 Unit!44861)))

(declare-fun b!1363824 () Bool)

(declare-fun res!907600 () Bool)

(assert (=> b!1363824 (=> (not res!907600) (not e!773369))))

(assert (=> b!1363824 (= res!907600 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31877))))

(assert (= (and start!115082 res!907591) b!1363822))

(assert (= (and b!1363822 res!907592) b!1363819))

(assert (= (and b!1363819 res!907599) b!1363818))

(assert (= (and b!1363818 res!907598) b!1363824))

(assert (= (and b!1363824 res!907600) b!1363813))

(assert (= (and b!1363813 res!907601) b!1363821))

(assert (= (and b!1363821 res!907594) b!1363814))

(assert (= (and b!1363814 res!907597) b!1363815))

(assert (= (and b!1363815 res!907593) b!1363812))

(assert (= (and b!1363812 c!127553) b!1363816))

(assert (= (and b!1363812 (not c!127553)) b!1363823))

(assert (= (and b!1363812 res!907596) b!1363817))

(assert (= (and b!1363817 res!907595) b!1363820))

(declare-fun m!1248079 () Bool)

(assert (=> b!1363813 m!1248079))

(declare-fun m!1248081 () Bool)

(assert (=> b!1363812 m!1248081))

(assert (=> b!1363812 m!1248081))

(declare-fun m!1248083 () Bool)

(assert (=> b!1363812 m!1248083))

(declare-fun m!1248085 () Bool)

(assert (=> b!1363819 m!1248085))

(declare-fun m!1248087 () Bool)

(assert (=> b!1363820 m!1248087))

(declare-fun m!1248089 () Bool)

(assert (=> b!1363820 m!1248089))

(declare-fun m!1248091 () Bool)

(assert (=> b!1363820 m!1248091))

(declare-fun m!1248093 () Bool)

(assert (=> b!1363820 m!1248093))

(declare-fun m!1248095 () Bool)

(assert (=> b!1363824 m!1248095))

(declare-fun m!1248097 () Bool)

(assert (=> b!1363822 m!1248097))

(declare-fun m!1248099 () Bool)

(assert (=> b!1363817 m!1248099))

(declare-fun m!1248101 () Bool)

(assert (=> start!115082 m!1248101))

(declare-fun m!1248103 () Bool)

(assert (=> b!1363814 m!1248103))

(declare-fun m!1248105 () Bool)

(assert (=> b!1363816 m!1248105))

(assert (=> b!1363816 m!1248081))

(declare-fun m!1248107 () Bool)

(assert (=> b!1363816 m!1248107))

(declare-fun m!1248109 () Bool)

(assert (=> b!1363816 m!1248109))

(assert (=> b!1363816 m!1248099))

(assert (=> b!1363816 m!1248081))

(assert (=> b!1363816 m!1248107))

(declare-fun m!1248111 () Bool)

(assert (=> b!1363816 m!1248111))

(declare-fun m!1248113 () Bool)

(assert (=> b!1363818 m!1248113))

(check-sat (not b!1363818) (not b!1363822) (not b!1363812) (not b!1363816) (not b!1363820) (not b!1363819) (not start!115082) (not b!1363813) (not b!1363824) (not b!1363817) (not b!1363814))
(check-sat)
(get-model)

(declare-fun d!146057 () Bool)

(assert (=> d!146057 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600793 () Unit!44859)

(declare-fun choose!80 (array!92658 List!31880 List!31880 (_ BitVec 32)) Unit!44859)

(assert (=> d!146057 (= lt!600793 (choose!80 a!3742 ($colon$colon!943 acc!759 (select (arr!44761 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146057 (bvslt (size!45313 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146057 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!943 acc!759 (select (arr!44761 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600793)))

(declare-fun bs!39081 () Bool)

(assert (= bs!39081 d!146057))

(assert (=> bs!39081 m!1248099))

(assert (=> bs!39081 m!1248107))

(declare-fun m!1248187 () Bool)

(assert (=> bs!39081 m!1248187))

(assert (=> b!1363816 d!146057))

(declare-fun b!1363912 () Bool)

(declare-fun e!773407 () Bool)

(declare-fun e!773406 () Bool)

(assert (=> b!1363912 (= e!773407 e!773406)))

(declare-fun res!907677 () Bool)

(assert (=> b!1363912 (=> res!907677 e!773406)))

(declare-fun e!773405 () Bool)

(assert (=> b!1363912 (= res!907677 e!773405)))

(declare-fun res!907678 () Bool)

(assert (=> b!1363912 (=> (not res!907678) (not e!773405))))

(assert (=> b!1363912 (= res!907678 (= (h!33085 acc!759) (h!33085 acc!759)))))

(declare-fun b!1363913 () Bool)

(assert (=> b!1363913 (= e!773405 (subseq!938 (t!46563 acc!759) (t!46563 acc!759)))))

(declare-fun d!146059 () Bool)

(declare-fun res!907676 () Bool)

(declare-fun e!773404 () Bool)

(assert (=> d!146059 (=> res!907676 e!773404)))

(get-info :version)

(assert (=> d!146059 (= res!907676 ((_ is Nil!31877) acc!759))))

(assert (=> d!146059 (= (subseq!938 acc!759 acc!759) e!773404)))

(declare-fun b!1363914 () Bool)

(assert (=> b!1363914 (= e!773406 (subseq!938 acc!759 (t!46563 acc!759)))))

(declare-fun b!1363911 () Bool)

(assert (=> b!1363911 (= e!773404 e!773407)))

(declare-fun res!907679 () Bool)

(assert (=> b!1363911 (=> (not res!907679) (not e!773407))))

(assert (=> b!1363911 (= res!907679 ((_ is Cons!31876) acc!759))))

(assert (= (and d!146059 (not res!907676)) b!1363911))

(assert (= (and b!1363911 res!907679) b!1363912))

(assert (= (and b!1363912 res!907678) b!1363913))

(assert (= (and b!1363912 (not res!907677)) b!1363914))

(declare-fun m!1248189 () Bool)

(assert (=> b!1363913 m!1248189))

(declare-fun m!1248191 () Bool)

(assert (=> b!1363914 m!1248191))

(assert (=> b!1363816 d!146059))

(declare-fun b!1363925 () Bool)

(declare-fun e!773419 () Bool)

(declare-fun e!773417 () Bool)

(assert (=> b!1363925 (= e!773419 e!773417)))

(declare-fun res!907686 () Bool)

(assert (=> b!1363925 (=> (not res!907686) (not e!773417))))

(declare-fun e!773416 () Bool)

(assert (=> b!1363925 (= res!907686 (not e!773416))))

(declare-fun res!907687 () Bool)

(assert (=> b!1363925 (=> (not res!907687) (not e!773416))))

(assert (=> b!1363925 (= res!907687 (validKeyInArray!0 (select (arr!44761 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1363926 () Bool)

(declare-fun e!773418 () Bool)

(declare-fun call!65398 () Bool)

(assert (=> b!1363926 (= e!773418 call!65398)))

(declare-fun b!1363927 () Bool)

(assert (=> b!1363927 (= e!773418 call!65398)))

(declare-fun d!146061 () Bool)

(declare-fun res!907688 () Bool)

(assert (=> d!146061 (=> res!907688 e!773419)))

(assert (=> d!146061 (= res!907688 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45313 a!3742)))))

(assert (=> d!146061 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773419)))

(declare-fun c!127562 () Bool)

(declare-fun bm!65395 () Bool)

(assert (=> bm!65395 (= call!65398 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127562 (Cons!31876 (select (arr!44761 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1363928 () Bool)

(assert (=> b!1363928 (= e!773417 e!773418)))

(assert (=> b!1363928 (= c!127562 (validKeyInArray!0 (select (arr!44761 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1363929 () Bool)

(assert (=> b!1363929 (= e!773416 (contains!9500 acc!759 (select (arr!44761 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146061 (not res!907688)) b!1363925))

(assert (= (and b!1363925 res!907687) b!1363929))

(assert (= (and b!1363925 res!907686) b!1363928))

(assert (= (and b!1363928 c!127562) b!1363927))

(assert (= (and b!1363928 (not c!127562)) b!1363926))

(assert (= (or b!1363927 b!1363926) bm!65395))

(declare-fun m!1248193 () Bool)

(assert (=> b!1363925 m!1248193))

(assert (=> b!1363925 m!1248193))

(declare-fun m!1248195 () Bool)

(assert (=> b!1363925 m!1248195))

(assert (=> bm!65395 m!1248193))

(declare-fun m!1248197 () Bool)

(assert (=> bm!65395 m!1248197))

(assert (=> b!1363928 m!1248193))

(assert (=> b!1363928 m!1248193))

(assert (=> b!1363928 m!1248195))

(assert (=> b!1363929 m!1248193))

(assert (=> b!1363929 m!1248193))

(declare-fun m!1248199 () Bool)

(assert (=> b!1363929 m!1248199))

(assert (=> b!1363816 d!146061))

(declare-fun d!146071 () Bool)

(assert (=> d!146071 (= ($colon$colon!943 acc!759 (select (arr!44761 a!3742) from!3120)) (Cons!31876 (select (arr!44761 a!3742) from!3120) acc!759))))

(assert (=> b!1363816 d!146071))

(declare-fun d!146073 () Bool)

(assert (=> d!146073 (subseq!938 acc!759 acc!759)))

(declare-fun lt!600796 () Unit!44859)

(declare-fun choose!36 (List!31880) Unit!44859)

(assert (=> d!146073 (= lt!600796 (choose!36 acc!759))))

(assert (=> d!146073 (= (lemmaListSubSeqRefl!0 acc!759) lt!600796)))

(declare-fun bs!39082 () Bool)

(assert (= bs!39082 d!146073))

(assert (=> bs!39082 m!1248111))

(declare-fun m!1248201 () Bool)

(assert (=> bs!39082 m!1248201))

(assert (=> b!1363816 d!146073))

(declare-fun d!146075 () Bool)

(declare-fun res!907711 () Bool)

(declare-fun e!773446 () Bool)

(assert (=> d!146075 (=> res!907711 e!773446)))

(assert (=> d!146075 (= res!907711 ((_ is Nil!31877) acc!759))))

(assert (=> d!146075 (= (noDuplicate!2415 acc!759) e!773446)))

(declare-fun b!1363960 () Bool)

(declare-fun e!773447 () Bool)

(assert (=> b!1363960 (= e!773446 e!773447)))

(declare-fun res!907712 () Bool)

(assert (=> b!1363960 (=> (not res!907712) (not e!773447))))

(assert (=> b!1363960 (= res!907712 (not (contains!9500 (t!46563 acc!759) (h!33085 acc!759))))))

(declare-fun b!1363961 () Bool)

(assert (=> b!1363961 (= e!773447 (noDuplicate!2415 (t!46563 acc!759)))))

(assert (= (and d!146075 (not res!907711)) b!1363960))

(assert (= (and b!1363960 res!907712) b!1363961))

(declare-fun m!1248225 () Bool)

(assert (=> b!1363960 m!1248225))

(declare-fun m!1248227 () Bool)

(assert (=> b!1363961 m!1248227))

(assert (=> b!1363822 d!146075))

(assert (=> b!1363817 d!146061))

(declare-fun d!146083 () Bool)

(assert (=> d!146083 (= (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)) (and (not (= (select (arr!44761 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44761 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363812 d!146083))

(declare-fun d!146087 () Bool)

(declare-fun lt!600802 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!701 (List!31880) (InoxSet (_ BitVec 64)))

(assert (=> d!146087 (= lt!600802 (select (content!701 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773458 () Bool)

(assert (=> d!146087 (= lt!600802 e!773458)))

(declare-fun res!907724 () Bool)

(assert (=> d!146087 (=> (not res!907724) (not e!773458))))

(assert (=> d!146087 (= res!907724 ((_ is Cons!31876) acc!759))))

(assert (=> d!146087 (= (contains!9500 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600802)))

(declare-fun b!1363972 () Bool)

(declare-fun e!773459 () Bool)

(assert (=> b!1363972 (= e!773458 e!773459)))

(declare-fun res!907723 () Bool)

(assert (=> b!1363972 (=> res!907723 e!773459)))

(assert (=> b!1363972 (= res!907723 (= (h!33085 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363973 () Bool)

(assert (=> b!1363973 (= e!773459 (contains!9500 (t!46563 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146087 res!907724) b!1363972))

(assert (= (and b!1363972 (not res!907723)) b!1363973))

(declare-fun m!1248233 () Bool)

(assert (=> d!146087 m!1248233))

(declare-fun m!1248235 () Bool)

(assert (=> d!146087 m!1248235))

(declare-fun m!1248237 () Bool)

(assert (=> b!1363973 m!1248237))

(assert (=> b!1363818 d!146087))

(declare-fun b!1363974 () Bool)

(declare-fun e!773463 () Bool)

(declare-fun e!773461 () Bool)

(assert (=> b!1363974 (= e!773463 e!773461)))

(declare-fun res!907725 () Bool)

(assert (=> b!1363974 (=> (not res!907725) (not e!773461))))

(declare-fun e!773460 () Bool)

(assert (=> b!1363974 (= res!907725 (not e!773460))))

(declare-fun res!907726 () Bool)

(assert (=> b!1363974 (=> (not res!907726) (not e!773460))))

(assert (=> b!1363974 (= res!907726 (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)))))

(declare-fun b!1363975 () Bool)

(declare-fun e!773462 () Bool)

(declare-fun call!65403 () Bool)

(assert (=> b!1363975 (= e!773462 call!65403)))

(declare-fun b!1363976 () Bool)

(assert (=> b!1363976 (= e!773462 call!65403)))

(declare-fun d!146093 () Bool)

(declare-fun res!907727 () Bool)

(assert (=> d!146093 (=> res!907727 e!773463)))

(assert (=> d!146093 (= res!907727 (bvsge from!3120 (size!45313 a!3742)))))

(assert (=> d!146093 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773463)))

(declare-fun c!127567 () Bool)

(declare-fun bm!65400 () Bool)

(assert (=> bm!65400 (= call!65403 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127567 (Cons!31876 (select (arr!44761 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1363977 () Bool)

(assert (=> b!1363977 (= e!773461 e!773462)))

(assert (=> b!1363977 (= c!127567 (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)))))

(declare-fun b!1363978 () Bool)

(assert (=> b!1363978 (= e!773460 (contains!9500 acc!759 (select (arr!44761 a!3742) from!3120)))))

(assert (= (and d!146093 (not res!907727)) b!1363974))

(assert (= (and b!1363974 res!907726) b!1363978))

(assert (= (and b!1363974 res!907725) b!1363977))

(assert (= (and b!1363977 c!127567) b!1363976))

(assert (= (and b!1363977 (not c!127567)) b!1363975))

(assert (= (or b!1363976 b!1363975) bm!65400))

(assert (=> b!1363974 m!1248081))

(assert (=> b!1363974 m!1248081))

(assert (=> b!1363974 m!1248083))

(assert (=> bm!65400 m!1248081))

(declare-fun m!1248241 () Bool)

(assert (=> bm!65400 m!1248241))

(assert (=> b!1363977 m!1248081))

(assert (=> b!1363977 m!1248081))

(assert (=> b!1363977 m!1248083))

(assert (=> b!1363978 m!1248081))

(assert (=> b!1363978 m!1248081))

(declare-fun m!1248243 () Bool)

(assert (=> b!1363978 m!1248243))

(assert (=> b!1363813 d!146093))

(declare-fun b!1363985 () Bool)

(declare-fun e!773473 () Bool)

(declare-fun e!773471 () Bool)

(assert (=> b!1363985 (= e!773473 e!773471)))

(declare-fun res!907734 () Bool)

(assert (=> b!1363985 (=> (not res!907734) (not e!773471))))

(declare-fun e!773470 () Bool)

(assert (=> b!1363985 (= res!907734 (not e!773470))))

(declare-fun res!907735 () Bool)

(assert (=> b!1363985 (=> (not res!907735) (not e!773470))))

(assert (=> b!1363985 (= res!907735 (validKeyInArray!0 (select (arr!44761 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363986 () Bool)

(declare-fun e!773472 () Bool)

(declare-fun call!65404 () Bool)

(assert (=> b!1363986 (= e!773472 call!65404)))

(declare-fun b!1363987 () Bool)

(assert (=> b!1363987 (= e!773472 call!65404)))

(declare-fun d!146097 () Bool)

(declare-fun res!907736 () Bool)

(assert (=> d!146097 (=> res!907736 e!773473)))

(assert (=> d!146097 (= res!907736 (bvsge #b00000000000000000000000000000000 (size!45313 a!3742)))))

(assert (=> d!146097 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31877) e!773473)))

(declare-fun bm!65401 () Bool)

(declare-fun c!127568 () Bool)

(assert (=> bm!65401 (= call!65404 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127568 (Cons!31876 (select (arr!44761 a!3742) #b00000000000000000000000000000000) Nil!31877) Nil!31877)))))

(declare-fun b!1363988 () Bool)

(assert (=> b!1363988 (= e!773471 e!773472)))

(assert (=> b!1363988 (= c!127568 (validKeyInArray!0 (select (arr!44761 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363989 () Bool)

(assert (=> b!1363989 (= e!773470 (contains!9500 Nil!31877 (select (arr!44761 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146097 (not res!907736)) b!1363985))

(assert (= (and b!1363985 res!907735) b!1363989))

(assert (= (and b!1363985 res!907734) b!1363988))

(assert (= (and b!1363988 c!127568) b!1363987))

(assert (= (and b!1363988 (not c!127568)) b!1363986))

(assert (= (or b!1363987 b!1363986) bm!65401))

(declare-fun m!1248245 () Bool)

(assert (=> b!1363985 m!1248245))

(assert (=> b!1363985 m!1248245))

(declare-fun m!1248247 () Bool)

(assert (=> b!1363985 m!1248247))

(assert (=> bm!65401 m!1248245))

(declare-fun m!1248249 () Bool)

(assert (=> bm!65401 m!1248249))

(assert (=> b!1363988 m!1248245))

(assert (=> b!1363988 m!1248245))

(assert (=> b!1363988 m!1248247))

(assert (=> b!1363989 m!1248245))

(assert (=> b!1363989 m!1248245))

(declare-fun m!1248251 () Bool)

(assert (=> b!1363989 m!1248251))

(assert (=> b!1363824 d!146097))

(declare-fun d!146099 () Bool)

(declare-fun lt!600806 () Bool)

(assert (=> d!146099 (= lt!600806 (select (content!701 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773476 () Bool)

(assert (=> d!146099 (= lt!600806 e!773476)))

(declare-fun res!907738 () Bool)

(assert (=> d!146099 (=> (not res!907738) (not e!773476))))

(assert (=> d!146099 (= res!907738 ((_ is Cons!31876) acc!759))))

(assert (=> d!146099 (= (contains!9500 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600806)))

(declare-fun b!1363994 () Bool)

(declare-fun e!773477 () Bool)

(assert (=> b!1363994 (= e!773476 e!773477)))

(declare-fun res!907737 () Bool)

(assert (=> b!1363994 (=> res!907737 e!773477)))

(assert (=> b!1363994 (= res!907737 (= (h!33085 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363995 () Bool)

(assert (=> b!1363995 (= e!773477 (contains!9500 (t!46563 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146099 res!907738) b!1363994))

(assert (= (and b!1363994 (not res!907737)) b!1363995))

(assert (=> d!146099 m!1248233))

(declare-fun m!1248253 () Bool)

(assert (=> d!146099 m!1248253))

(declare-fun m!1248255 () Bool)

(assert (=> b!1363995 m!1248255))

(assert (=> b!1363819 d!146099))

(declare-fun d!146101 () Bool)

(assert (=> d!146101 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363814 d!146101))

(declare-fun b!1363996 () Bool)

(declare-fun e!773481 () Bool)

(declare-fun e!773479 () Bool)

(assert (=> b!1363996 (= e!773481 e!773479)))

(declare-fun res!907739 () Bool)

(assert (=> b!1363996 (=> (not res!907739) (not e!773479))))

(declare-fun e!773478 () Bool)

(assert (=> b!1363996 (= res!907739 (not e!773478))))

(declare-fun res!907740 () Bool)

(assert (=> b!1363996 (=> (not res!907740) (not e!773478))))

(assert (=> b!1363996 (= res!907740 (validKeyInArray!0 (select (arr!44761 lt!600749) from!3120)))))

(declare-fun b!1363997 () Bool)

(declare-fun e!773480 () Bool)

(declare-fun call!65407 () Bool)

(assert (=> b!1363997 (= e!773480 call!65407)))

(declare-fun b!1363998 () Bool)

(assert (=> b!1363998 (= e!773480 call!65407)))

(declare-fun d!146103 () Bool)

(declare-fun res!907741 () Bool)

(assert (=> d!146103 (=> res!907741 e!773481)))

(assert (=> d!146103 (= res!907741 (bvsge from!3120 (size!45313 lt!600749)))))

(assert (=> d!146103 (= (arrayNoDuplicates!0 lt!600749 from!3120 acc!759) e!773481)))

(declare-fun bm!65404 () Bool)

(declare-fun c!127571 () Bool)

(assert (=> bm!65404 (= call!65407 (arrayNoDuplicates!0 lt!600749 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127571 (Cons!31876 (select (arr!44761 lt!600749) from!3120) acc!759) acc!759)))))

(declare-fun b!1363999 () Bool)

(assert (=> b!1363999 (= e!773479 e!773480)))

(assert (=> b!1363999 (= c!127571 (validKeyInArray!0 (select (arr!44761 lt!600749) from!3120)))))

(declare-fun b!1364000 () Bool)

(assert (=> b!1364000 (= e!773478 (contains!9500 acc!759 (select (arr!44761 lt!600749) from!3120)))))

(assert (= (and d!146103 (not res!907741)) b!1363996))

(assert (= (and b!1363996 res!907740) b!1364000))

(assert (= (and b!1363996 res!907739) b!1363999))

(assert (= (and b!1363999 c!127571) b!1363998))

(assert (= (and b!1363999 (not c!127571)) b!1363997))

(assert (= (or b!1363998 b!1363997) bm!65404))

(declare-fun m!1248257 () Bool)

(assert (=> b!1363996 m!1248257))

(assert (=> b!1363996 m!1248257))

(declare-fun m!1248259 () Bool)

(assert (=> b!1363996 m!1248259))

(assert (=> bm!65404 m!1248257))

(declare-fun m!1248261 () Bool)

(assert (=> bm!65404 m!1248261))

(assert (=> b!1363999 m!1248257))

(assert (=> b!1363999 m!1248257))

(assert (=> b!1363999 m!1248259))

(assert (=> b!1364000 m!1248257))

(assert (=> b!1364000 m!1248257))

(declare-fun m!1248263 () Bool)

(assert (=> b!1364000 m!1248263))

(assert (=> b!1363820 d!146103))

(declare-fun b!1364009 () Bool)

(declare-fun e!773493 () Bool)

(declare-fun e!773491 () Bool)

(assert (=> b!1364009 (= e!773493 e!773491)))

(declare-fun res!907750 () Bool)

(assert (=> b!1364009 (=> (not res!907750) (not e!773491))))

(declare-fun e!773490 () Bool)

(assert (=> b!1364009 (= res!907750 (not e!773490))))

(declare-fun res!907751 () Bool)

(assert (=> b!1364009 (=> (not res!907751) (not e!773490))))

(assert (=> b!1364009 (= res!907751 (validKeyInArray!0 (select (arr!44761 lt!600749) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364010 () Bool)

(declare-fun e!773492 () Bool)

(declare-fun call!65408 () Bool)

(assert (=> b!1364010 (= e!773492 call!65408)))

(declare-fun b!1364011 () Bool)

(assert (=> b!1364011 (= e!773492 call!65408)))

(declare-fun d!146105 () Bool)

(declare-fun res!907752 () Bool)

(assert (=> d!146105 (=> res!907752 e!773493)))

(assert (=> d!146105 (= res!907752 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45313 lt!600749)))))

(assert (=> d!146105 (= (arrayNoDuplicates!0 lt!600749 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773493)))

(declare-fun bm!65405 () Bool)

(declare-fun c!127572 () Bool)

(assert (=> bm!65405 (= call!65408 (arrayNoDuplicates!0 lt!600749 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127572 (Cons!31876 (select (arr!44761 lt!600749) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1364012 () Bool)

(assert (=> b!1364012 (= e!773491 e!773492)))

(assert (=> b!1364012 (= c!127572 (validKeyInArray!0 (select (arr!44761 lt!600749) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364013 () Bool)

(assert (=> b!1364013 (= e!773490 (contains!9500 acc!759 (select (arr!44761 lt!600749) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146105 (not res!907752)) b!1364009))

(assert (= (and b!1364009 res!907751) b!1364013))

(assert (= (and b!1364009 res!907750) b!1364012))

(assert (= (and b!1364012 c!127572) b!1364011))

(assert (= (and b!1364012 (not c!127572)) b!1364010))

(assert (= (or b!1364011 b!1364010) bm!65405))

(declare-fun m!1248265 () Bool)

(assert (=> b!1364009 m!1248265))

(assert (=> b!1364009 m!1248265))

(declare-fun m!1248267 () Bool)

(assert (=> b!1364009 m!1248267))

(assert (=> bm!65405 m!1248265))

(declare-fun m!1248269 () Bool)

(assert (=> bm!65405 m!1248269))

(assert (=> b!1364012 m!1248265))

(assert (=> b!1364012 m!1248265))

(assert (=> b!1364012 m!1248267))

(assert (=> b!1364013 m!1248265))

(assert (=> b!1364013 m!1248265))

(declare-fun m!1248271 () Bool)

(assert (=> b!1364013 m!1248271))

(assert (=> b!1363820 d!146105))

(declare-fun d!146107 () Bool)

(declare-fun e!773520 () Bool)

(assert (=> d!146107 e!773520))

(declare-fun res!907774 () Bool)

(assert (=> d!146107 (=> (not res!907774) (not e!773520))))

(assert (=> d!146107 (= res!907774 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45313 a!3742))))))

(declare-fun lt!600812 () Unit!44859)

(declare-fun choose!53 (array!92658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31880) Unit!44859)

(assert (=> d!146107 (= lt!600812 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (=> d!146107 (bvslt (size!45313 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146107 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) lt!600812)))

(declare-fun b!1364045 () Bool)

(assert (=> b!1364045 (= e!773520 (arrayNoDuplicates!0 (array!92659 (store (arr!44761 a!3742) i!1404 l!3587) (size!45313 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and d!146107 res!907774) b!1364045))

(declare-fun m!1248315 () Bool)

(assert (=> d!146107 m!1248315))

(assert (=> b!1364045 m!1248091))

(declare-fun m!1248319 () Bool)

(assert (=> b!1364045 m!1248319))

(assert (=> b!1363820 d!146107))

(declare-fun d!146123 () Bool)

(assert (=> d!146123 (= (array_inv!33994 a!3742) (bvsge (size!45313 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115082 d!146123))

(check-sat (not b!1363996) (not bm!65401) (not d!146057) (not b!1363989) (not b!1364013) (not b!1364000) (not b!1363925) (not d!146073) (not b!1363978) (not b!1364009) (not bm!65404) (not d!146107) (not b!1363961) (not d!146087) (not b!1363973) (not b!1363914) (not b!1363928) (not b!1363988) (not b!1363999) (not b!1364012) (not b!1363974) (not b!1363977) (not b!1363960) (not b!1363995) (not bm!65395) (not d!146099) (not bm!65400) (not b!1363913) (not bm!65405) (not b!1363985) (not b!1364045) (not b!1363929))
(check-sat)
