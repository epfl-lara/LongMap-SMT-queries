; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115084 () Bool)

(assert start!115084)

(declare-fun b!1363921 () Bool)

(declare-fun res!907661 () Bool)

(declare-fun e!773413 () Bool)

(assert (=> b!1363921 (=> (not res!907661) (not e!773413))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92711 0))(
  ( (array!92712 (arr!44787 (Array (_ BitVec 32) (_ BitVec 64))) (size!45337 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92711)

(assert (=> b!1363921 (= res!907661 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45337 a!3742))))))

(declare-fun b!1363922 () Bool)

(declare-fun res!907662 () Bool)

(assert (=> b!1363922 (=> (not res!907662) (not e!773413))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1363922 (= res!907662 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45337 a!3742)))))

(declare-fun b!1363924 () Bool)

(declare-fun res!907655 () Bool)

(declare-fun e!773416 () Bool)

(assert (=> b!1363924 (=> (not res!907655) (not e!773416))))

(declare-datatypes ((List!31828 0))(
  ( (Nil!31825) (Cons!31824 (h!33033 (_ BitVec 64)) (t!46519 List!31828)) )
))
(declare-fun acc!759 () List!31828)

(declare-fun arrayNoDuplicates!0 (array!92711 (_ BitVec 32) List!31828) Bool)

(assert (=> b!1363924 (= res!907655 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363925 () Bool)

(declare-datatypes ((Unit!45021 0))(
  ( (Unit!45022) )
))
(declare-fun e!773415 () Unit!45021)

(declare-fun lt!600955 () Unit!45021)

(assert (=> b!1363925 (= e!773415 lt!600955)))

(declare-fun lt!600956 () Unit!45021)

(declare-fun lemmaListSubSeqRefl!0 (List!31828) Unit!45021)

(assert (=> b!1363925 (= lt!600956 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!939 (List!31828 List!31828) Bool)

(assert (=> b!1363925 (subseq!939 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92711 List!31828 List!31828 (_ BitVec 32)) Unit!45021)

(declare-fun $colon$colon!942 (List!31828 (_ BitVec 64)) List!31828)

(assert (=> b!1363925 (= lt!600955 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!942 acc!759 (select (arr!44787 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363925 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363926 () Bool)

(declare-fun res!907654 () Bool)

(assert (=> b!1363926 (=> (not res!907654) (not e!773413))))

(assert (=> b!1363926 (= res!907654 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31825))))

(declare-fun lt!600957 () array!92711)

(declare-fun b!1363927 () Bool)

(assert (=> b!1363927 (= e!773416 (not (arrayNoDuplicates!0 lt!600957 from!3120 acc!759)))))

(assert (=> b!1363927 (arrayNoDuplicates!0 lt!600957 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363927 (= lt!600957 (array!92712 (store (arr!44787 a!3742) i!1404 l!3587) (size!45337 a!3742)))))

(declare-fun lt!600954 () Unit!45021)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92711 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31828) Unit!45021)

(assert (=> b!1363927 (= lt!600954 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363928 () Bool)

(declare-fun res!907663 () Bool)

(assert (=> b!1363928 (=> (not res!907663) (not e!773413))))

(declare-fun noDuplicate!2394 (List!31828) Bool)

(assert (=> b!1363928 (= res!907663 (noDuplicate!2394 acc!759))))

(declare-fun b!1363929 () Bool)

(assert (=> b!1363929 (= e!773413 e!773416)))

(declare-fun res!907659 () Bool)

(assert (=> b!1363929 (=> (not res!907659) (not e!773416))))

(declare-fun lt!600958 () Bool)

(assert (=> b!1363929 (= res!907659 (and (not (= from!3120 i!1404)) (not lt!600958) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600953 () Unit!45021)

(assert (=> b!1363929 (= lt!600953 e!773415)))

(declare-fun c!127574 () Bool)

(assert (=> b!1363929 (= c!127574 lt!600958)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363929 (= lt!600958 (validKeyInArray!0 (select (arr!44787 a!3742) from!3120)))))

(declare-fun b!1363923 () Bool)

(declare-fun res!907653 () Bool)

(assert (=> b!1363923 (=> (not res!907653) (not e!773413))))

(assert (=> b!1363923 (= res!907653 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!907658 () Bool)

(assert (=> start!115084 (=> (not res!907658) (not e!773413))))

(assert (=> start!115084 (= res!907658 (and (bvslt (size!45337 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45337 a!3742))))))

(assert (=> start!115084 e!773413))

(assert (=> start!115084 true))

(declare-fun array_inv!33815 (array!92711) Bool)

(assert (=> start!115084 (array_inv!33815 a!3742)))

(declare-fun b!1363930 () Bool)

(declare-fun res!907656 () Bool)

(assert (=> b!1363930 (=> (not res!907656) (not e!773413))))

(declare-fun contains!9537 (List!31828 (_ BitVec 64)) Bool)

(assert (=> b!1363930 (= res!907656 (not (contains!9537 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363931 () Bool)

(declare-fun res!907660 () Bool)

(assert (=> b!1363931 (=> (not res!907660) (not e!773413))))

(assert (=> b!1363931 (= res!907660 (not (contains!9537 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363932 () Bool)

(declare-fun res!907657 () Bool)

(assert (=> b!1363932 (=> (not res!907657) (not e!773413))))

(assert (=> b!1363932 (= res!907657 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363933 () Bool)

(declare-fun Unit!45023 () Unit!45021)

(assert (=> b!1363933 (= e!773415 Unit!45023)))

(assert (= (and start!115084 res!907658) b!1363928))

(assert (= (and b!1363928 res!907663) b!1363930))

(assert (= (and b!1363930 res!907656) b!1363931))

(assert (= (and b!1363931 res!907660) b!1363926))

(assert (= (and b!1363926 res!907654) b!1363923))

(assert (= (and b!1363923 res!907653) b!1363921))

(assert (= (and b!1363921 res!907661) b!1363932))

(assert (= (and b!1363932 res!907657) b!1363922))

(assert (= (and b!1363922 res!907662) b!1363929))

(assert (= (and b!1363929 c!127574) b!1363925))

(assert (= (and b!1363929 (not c!127574)) b!1363933))

(assert (= (and b!1363929 res!907659) b!1363924))

(assert (= (and b!1363924 res!907655) b!1363927))

(declare-fun m!1248631 () Bool)

(assert (=> b!1363930 m!1248631))

(declare-fun m!1248633 () Bool)

(assert (=> b!1363924 m!1248633))

(declare-fun m!1248635 () Bool)

(assert (=> b!1363923 m!1248635))

(declare-fun m!1248637 () Bool)

(assert (=> b!1363931 m!1248637))

(declare-fun m!1248639 () Bool)

(assert (=> b!1363927 m!1248639))

(declare-fun m!1248641 () Bool)

(assert (=> b!1363927 m!1248641))

(declare-fun m!1248643 () Bool)

(assert (=> b!1363927 m!1248643))

(declare-fun m!1248645 () Bool)

(assert (=> b!1363927 m!1248645))

(declare-fun m!1248647 () Bool)

(assert (=> b!1363925 m!1248647))

(declare-fun m!1248649 () Bool)

(assert (=> b!1363925 m!1248649))

(declare-fun m!1248651 () Bool)

(assert (=> b!1363925 m!1248651))

(declare-fun m!1248653 () Bool)

(assert (=> b!1363925 m!1248653))

(assert (=> b!1363925 m!1248633))

(assert (=> b!1363925 m!1248649))

(assert (=> b!1363925 m!1248651))

(declare-fun m!1248655 () Bool)

(assert (=> b!1363925 m!1248655))

(assert (=> b!1363929 m!1248649))

(assert (=> b!1363929 m!1248649))

(declare-fun m!1248657 () Bool)

(assert (=> b!1363929 m!1248657))

(declare-fun m!1248659 () Bool)

(assert (=> b!1363932 m!1248659))

(declare-fun m!1248661 () Bool)

(assert (=> b!1363926 m!1248661))

(declare-fun m!1248663 () Bool)

(assert (=> b!1363928 m!1248663))

(declare-fun m!1248665 () Bool)

(assert (=> start!115084 m!1248665))

(check-sat (not b!1363927) (not b!1363931) (not b!1363926) (not b!1363930) (not b!1363923) (not b!1363929) (not b!1363925) (not start!115084) (not b!1363932) (not b!1363928) (not b!1363924))
(check-sat)
(get-model)

(declare-fun b!1363983 () Bool)

(declare-fun e!773440 () Bool)

(declare-fun call!65417 () Bool)

(assert (=> b!1363983 (= e!773440 call!65417)))

(declare-fun b!1363984 () Bool)

(declare-fun e!773437 () Bool)

(assert (=> b!1363984 (= e!773437 e!773440)))

(declare-fun c!127580 () Bool)

(assert (=> b!1363984 (= c!127580 (validKeyInArray!0 (select (arr!44787 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363985 () Bool)

(assert (=> b!1363985 (= e!773440 call!65417)))

(declare-fun b!1363987 () Bool)

(declare-fun e!773439 () Bool)

(assert (=> b!1363987 (= e!773439 (contains!9537 Nil!31825 (select (arr!44787 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65414 () Bool)

(assert (=> bm!65414 (= call!65417 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127580 (Cons!31824 (select (arr!44787 a!3742) #b00000000000000000000000000000000) Nil!31825) Nil!31825)))))

(declare-fun d!146173 () Bool)

(declare-fun res!907704 () Bool)

(declare-fun e!773438 () Bool)

(assert (=> d!146173 (=> res!907704 e!773438)))

(assert (=> d!146173 (= res!907704 (bvsge #b00000000000000000000000000000000 (size!45337 a!3742)))))

(assert (=> d!146173 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31825) e!773438)))

(declare-fun b!1363986 () Bool)

(assert (=> b!1363986 (= e!773438 e!773437)))

(declare-fun res!907705 () Bool)

(assert (=> b!1363986 (=> (not res!907705) (not e!773437))))

(assert (=> b!1363986 (= res!907705 (not e!773439))))

(declare-fun res!907703 () Bool)

(assert (=> b!1363986 (=> (not res!907703) (not e!773439))))

(assert (=> b!1363986 (= res!907703 (validKeyInArray!0 (select (arr!44787 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146173 (not res!907704)) b!1363986))

(assert (= (and b!1363986 res!907703) b!1363987))

(assert (= (and b!1363986 res!907705) b!1363984))

(assert (= (and b!1363984 c!127580) b!1363983))

(assert (= (and b!1363984 (not c!127580)) b!1363985))

(assert (= (or b!1363983 b!1363985) bm!65414))

(declare-fun m!1248703 () Bool)

(assert (=> b!1363984 m!1248703))

(assert (=> b!1363984 m!1248703))

(declare-fun m!1248705 () Bool)

(assert (=> b!1363984 m!1248705))

(assert (=> b!1363987 m!1248703))

(assert (=> b!1363987 m!1248703))

(declare-fun m!1248707 () Bool)

(assert (=> b!1363987 m!1248707))

(assert (=> bm!65414 m!1248703))

(declare-fun m!1248709 () Bool)

(assert (=> bm!65414 m!1248709))

(assert (=> b!1363986 m!1248703))

(assert (=> b!1363986 m!1248703))

(assert (=> b!1363986 m!1248705))

(assert (=> b!1363926 d!146173))

(declare-fun d!146175 () Bool)

(declare-fun lt!600979 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!705 (List!31828) (InoxSet (_ BitVec 64)))

(assert (=> d!146175 (= lt!600979 (select (content!705 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773445 () Bool)

(assert (=> d!146175 (= lt!600979 e!773445)))

(declare-fun res!907710 () Bool)

(assert (=> d!146175 (=> (not res!907710) (not e!773445))))

(get-info :version)

(assert (=> d!146175 (= res!907710 ((_ is Cons!31824) acc!759))))

(assert (=> d!146175 (= (contains!9537 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600979)))

(declare-fun b!1363992 () Bool)

(declare-fun e!773446 () Bool)

(assert (=> b!1363992 (= e!773445 e!773446)))

(declare-fun res!907711 () Bool)

(assert (=> b!1363992 (=> res!907711 e!773446)))

(assert (=> b!1363992 (= res!907711 (= (h!33033 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363993 () Bool)

(assert (=> b!1363993 (= e!773446 (contains!9537 (t!46519 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146175 res!907710) b!1363992))

(assert (= (and b!1363992 (not res!907711)) b!1363993))

(declare-fun m!1248711 () Bool)

(assert (=> d!146175 m!1248711))

(declare-fun m!1248713 () Bool)

(assert (=> d!146175 m!1248713))

(declare-fun m!1248715 () Bool)

(assert (=> b!1363993 m!1248715))

(assert (=> b!1363931 d!146175))

(declare-fun d!146179 () Bool)

(assert (=> d!146179 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600982 () Unit!45021)

(declare-fun choose!80 (array!92711 List!31828 List!31828 (_ BitVec 32)) Unit!45021)

(assert (=> d!146179 (= lt!600982 (choose!80 a!3742 ($colon$colon!942 acc!759 (select (arr!44787 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146179 (bvslt (size!45337 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146179 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!942 acc!759 (select (arr!44787 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600982)))

(declare-fun bs!39108 () Bool)

(assert (= bs!39108 d!146179))

(assert (=> bs!39108 m!1248633))

(assert (=> bs!39108 m!1248651))

(declare-fun m!1248717 () Bool)

(assert (=> bs!39108 m!1248717))

(assert (=> b!1363925 d!146179))

(declare-fun b!1364024 () Bool)

(declare-fun e!773476 () Bool)

(declare-fun e!773475 () Bool)

(assert (=> b!1364024 (= e!773476 e!773475)))

(declare-fun res!907736 () Bool)

(assert (=> b!1364024 (=> res!907736 e!773475)))

(declare-fun e!773474 () Bool)

(assert (=> b!1364024 (= res!907736 e!773474)))

(declare-fun res!907735 () Bool)

(assert (=> b!1364024 (=> (not res!907735) (not e!773474))))

(assert (=> b!1364024 (= res!907735 (= (h!33033 acc!759) (h!33033 acc!759)))))

(declare-fun b!1364026 () Bool)

(assert (=> b!1364026 (= e!773475 (subseq!939 acc!759 (t!46519 acc!759)))))

(declare-fun d!146181 () Bool)

(declare-fun res!907738 () Bool)

(declare-fun e!773473 () Bool)

(assert (=> d!146181 (=> res!907738 e!773473)))

(assert (=> d!146181 (= res!907738 ((_ is Nil!31825) acc!759))))

(assert (=> d!146181 (= (subseq!939 acc!759 acc!759) e!773473)))

(declare-fun b!1364025 () Bool)

(assert (=> b!1364025 (= e!773474 (subseq!939 (t!46519 acc!759) (t!46519 acc!759)))))

(declare-fun b!1364023 () Bool)

(assert (=> b!1364023 (= e!773473 e!773476)))

(declare-fun res!907737 () Bool)

(assert (=> b!1364023 (=> (not res!907737) (not e!773476))))

(assert (=> b!1364023 (= res!907737 ((_ is Cons!31824) acc!759))))

(assert (= (and d!146181 (not res!907738)) b!1364023))

(assert (= (and b!1364023 res!907737) b!1364024))

(assert (= (and b!1364024 res!907735) b!1364025))

(assert (= (and b!1364024 (not res!907736)) b!1364026))

(declare-fun m!1248731 () Bool)

(assert (=> b!1364026 m!1248731))

(declare-fun m!1248733 () Bool)

(assert (=> b!1364025 m!1248733))

(assert (=> b!1363925 d!146181))

(declare-fun b!1364027 () Bool)

(declare-fun e!773480 () Bool)

(declare-fun call!65421 () Bool)

(assert (=> b!1364027 (= e!773480 call!65421)))

(declare-fun b!1364028 () Bool)

(declare-fun e!773477 () Bool)

(assert (=> b!1364028 (= e!773477 e!773480)))

(declare-fun c!127584 () Bool)

(assert (=> b!1364028 (= c!127584 (validKeyInArray!0 (select (arr!44787 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364029 () Bool)

(assert (=> b!1364029 (= e!773480 call!65421)))

(declare-fun e!773479 () Bool)

(declare-fun b!1364031 () Bool)

(assert (=> b!1364031 (= e!773479 (contains!9537 acc!759 (select (arr!44787 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65418 () Bool)

(assert (=> bm!65418 (= call!65421 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127584 (Cons!31824 (select (arr!44787 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun d!146189 () Bool)

(declare-fun res!907740 () Bool)

(declare-fun e!773478 () Bool)

(assert (=> d!146189 (=> res!907740 e!773478)))

(assert (=> d!146189 (= res!907740 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45337 a!3742)))))

(assert (=> d!146189 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773478)))

(declare-fun b!1364030 () Bool)

(assert (=> b!1364030 (= e!773478 e!773477)))

(declare-fun res!907741 () Bool)

(assert (=> b!1364030 (=> (not res!907741) (not e!773477))))

(assert (=> b!1364030 (= res!907741 (not e!773479))))

(declare-fun res!907739 () Bool)

(assert (=> b!1364030 (=> (not res!907739) (not e!773479))))

(assert (=> b!1364030 (= res!907739 (validKeyInArray!0 (select (arr!44787 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146189 (not res!907740)) b!1364030))

(assert (= (and b!1364030 res!907739) b!1364031))

(assert (= (and b!1364030 res!907741) b!1364028))

(assert (= (and b!1364028 c!127584) b!1364027))

(assert (= (and b!1364028 (not c!127584)) b!1364029))

(assert (= (or b!1364027 b!1364029) bm!65418))

(declare-fun m!1248737 () Bool)

(assert (=> b!1364028 m!1248737))

(assert (=> b!1364028 m!1248737))

(declare-fun m!1248739 () Bool)

(assert (=> b!1364028 m!1248739))

(assert (=> b!1364031 m!1248737))

(assert (=> b!1364031 m!1248737))

(declare-fun m!1248741 () Bool)

(assert (=> b!1364031 m!1248741))

(assert (=> bm!65418 m!1248737))

(declare-fun m!1248743 () Bool)

(assert (=> bm!65418 m!1248743))

(assert (=> b!1364030 m!1248737))

(assert (=> b!1364030 m!1248737))

(assert (=> b!1364030 m!1248739))

(assert (=> b!1363925 d!146189))

(declare-fun d!146193 () Bool)

(assert (=> d!146193 (= ($colon$colon!942 acc!759 (select (arr!44787 a!3742) from!3120)) (Cons!31824 (select (arr!44787 a!3742) from!3120) acc!759))))

(assert (=> b!1363925 d!146193))

(declare-fun d!146195 () Bool)

(assert (=> d!146195 (subseq!939 acc!759 acc!759)))

(declare-fun lt!600988 () Unit!45021)

(declare-fun choose!36 (List!31828) Unit!45021)

(assert (=> d!146195 (= lt!600988 (choose!36 acc!759))))

(assert (=> d!146195 (= (lemmaListSubSeqRefl!0 acc!759) lt!600988)))

(declare-fun bs!39110 () Bool)

(assert (= bs!39110 d!146195))

(assert (=> bs!39110 m!1248655))

(declare-fun m!1248745 () Bool)

(assert (=> bs!39110 m!1248745))

(assert (=> b!1363925 d!146195))

(declare-fun d!146197 () Bool)

(declare-fun lt!600989 () Bool)

(assert (=> d!146197 (= lt!600989 (select (content!705 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773495 () Bool)

(assert (=> d!146197 (= lt!600989 e!773495)))

(declare-fun res!907754 () Bool)

(assert (=> d!146197 (=> (not res!907754) (not e!773495))))

(assert (=> d!146197 (= res!907754 ((_ is Cons!31824) acc!759))))

(assert (=> d!146197 (= (contains!9537 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600989)))

(declare-fun b!1364046 () Bool)

(declare-fun e!773496 () Bool)

(assert (=> b!1364046 (= e!773495 e!773496)))

(declare-fun res!907755 () Bool)

(assert (=> b!1364046 (=> res!907755 e!773496)))

(assert (=> b!1364046 (= res!907755 (= (h!33033 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364047 () Bool)

(assert (=> b!1364047 (= e!773496 (contains!9537 (t!46519 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146197 res!907754) b!1364046))

(assert (= (and b!1364046 (not res!907755)) b!1364047))

(assert (=> d!146197 m!1248711))

(declare-fun m!1248747 () Bool)

(assert (=> d!146197 m!1248747))

(declare-fun m!1248749 () Bool)

(assert (=> b!1364047 m!1248749))

(assert (=> b!1363930 d!146197))

(declare-fun d!146199 () Bool)

(assert (=> d!146199 (= (array_inv!33815 a!3742) (bvsge (size!45337 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115084 d!146199))

(assert (=> b!1363924 d!146189))

(declare-fun d!146201 () Bool)

(assert (=> d!146201 (= (validKeyInArray!0 (select (arr!44787 a!3742) from!3120)) (and (not (= (select (arr!44787 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44787 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363929 d!146201))

(declare-fun b!1364056 () Bool)

(declare-fun e!773506 () Bool)

(declare-fun call!65424 () Bool)

(assert (=> b!1364056 (= e!773506 call!65424)))

(declare-fun b!1364057 () Bool)

(declare-fun e!773503 () Bool)

(assert (=> b!1364057 (= e!773503 e!773506)))

(declare-fun c!127587 () Bool)

(assert (=> b!1364057 (= c!127587 (validKeyInArray!0 (select (arr!44787 a!3742) from!3120)))))

(declare-fun b!1364058 () Bool)

(assert (=> b!1364058 (= e!773506 call!65424)))

(declare-fun e!773505 () Bool)

(declare-fun b!1364060 () Bool)

(assert (=> b!1364060 (= e!773505 (contains!9537 acc!759 (select (arr!44787 a!3742) from!3120)))))

(declare-fun bm!65421 () Bool)

(assert (=> bm!65421 (= call!65424 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127587 (Cons!31824 (select (arr!44787 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!146203 () Bool)

(declare-fun res!907763 () Bool)

(declare-fun e!773504 () Bool)

(assert (=> d!146203 (=> res!907763 e!773504)))

(assert (=> d!146203 (= res!907763 (bvsge from!3120 (size!45337 a!3742)))))

(assert (=> d!146203 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773504)))

(declare-fun b!1364059 () Bool)

(assert (=> b!1364059 (= e!773504 e!773503)))

(declare-fun res!907764 () Bool)

(assert (=> b!1364059 (=> (not res!907764) (not e!773503))))

(assert (=> b!1364059 (= res!907764 (not e!773505))))

(declare-fun res!907762 () Bool)

(assert (=> b!1364059 (=> (not res!907762) (not e!773505))))

(assert (=> b!1364059 (= res!907762 (validKeyInArray!0 (select (arr!44787 a!3742) from!3120)))))

(assert (= (and d!146203 (not res!907763)) b!1364059))

(assert (= (and b!1364059 res!907762) b!1364060))

(assert (= (and b!1364059 res!907764) b!1364057))

(assert (= (and b!1364057 c!127587) b!1364056))

(assert (= (and b!1364057 (not c!127587)) b!1364058))

(assert (= (or b!1364056 b!1364058) bm!65421))

(assert (=> b!1364057 m!1248649))

(assert (=> b!1364057 m!1248649))

(assert (=> b!1364057 m!1248657))

(assert (=> b!1364060 m!1248649))

(assert (=> b!1364060 m!1248649))

(declare-fun m!1248755 () Bool)

(assert (=> b!1364060 m!1248755))

(assert (=> bm!65421 m!1248649))

(declare-fun m!1248757 () Bool)

(assert (=> bm!65421 m!1248757))

(assert (=> b!1364059 m!1248649))

(assert (=> b!1364059 m!1248649))

(assert (=> b!1364059 m!1248657))

(assert (=> b!1363923 d!146203))

(declare-fun d!146209 () Bool)

(declare-fun res!907776 () Bool)

(declare-fun e!773519 () Bool)

(assert (=> d!146209 (=> res!907776 e!773519)))

(assert (=> d!146209 (= res!907776 ((_ is Nil!31825) acc!759))))

(assert (=> d!146209 (= (noDuplicate!2394 acc!759) e!773519)))

(declare-fun b!1364072 () Bool)

(declare-fun e!773520 () Bool)

(assert (=> b!1364072 (= e!773519 e!773520)))

(declare-fun res!907777 () Bool)

(assert (=> b!1364072 (=> (not res!907777) (not e!773520))))

(assert (=> b!1364072 (= res!907777 (not (contains!9537 (t!46519 acc!759) (h!33033 acc!759))))))

(declare-fun b!1364073 () Bool)

(assert (=> b!1364073 (= e!773520 (noDuplicate!2394 (t!46519 acc!759)))))

(assert (= (and d!146209 (not res!907776)) b!1364072))

(assert (= (and b!1364072 res!907777) b!1364073))

(declare-fun m!1248769 () Bool)

(assert (=> b!1364072 m!1248769))

(declare-fun m!1248771 () Bool)

(assert (=> b!1364073 m!1248771))

(assert (=> b!1363928 d!146209))

(declare-fun b!1364076 () Bool)

(declare-fun e!773524 () Bool)

(declare-fun call!65426 () Bool)

(assert (=> b!1364076 (= e!773524 call!65426)))

(declare-fun b!1364077 () Bool)

(declare-fun e!773521 () Bool)

(assert (=> b!1364077 (= e!773521 e!773524)))

(declare-fun c!127589 () Bool)

(assert (=> b!1364077 (= c!127589 (validKeyInArray!0 (select (arr!44787 lt!600957) from!3120)))))

(declare-fun b!1364078 () Bool)

(assert (=> b!1364078 (= e!773524 call!65426)))

(declare-fun b!1364080 () Bool)

(declare-fun e!773523 () Bool)

(assert (=> b!1364080 (= e!773523 (contains!9537 acc!759 (select (arr!44787 lt!600957) from!3120)))))

(declare-fun bm!65423 () Bool)

(assert (=> bm!65423 (= call!65426 (arrayNoDuplicates!0 lt!600957 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127589 (Cons!31824 (select (arr!44787 lt!600957) from!3120) acc!759) acc!759)))))

(declare-fun d!146215 () Bool)

(declare-fun res!907779 () Bool)

(declare-fun e!773522 () Bool)

(assert (=> d!146215 (=> res!907779 e!773522)))

(assert (=> d!146215 (= res!907779 (bvsge from!3120 (size!45337 lt!600957)))))

(assert (=> d!146215 (= (arrayNoDuplicates!0 lt!600957 from!3120 acc!759) e!773522)))

(declare-fun b!1364079 () Bool)

(assert (=> b!1364079 (= e!773522 e!773521)))

(declare-fun res!907780 () Bool)

(assert (=> b!1364079 (=> (not res!907780) (not e!773521))))

(assert (=> b!1364079 (= res!907780 (not e!773523))))

(declare-fun res!907778 () Bool)

(assert (=> b!1364079 (=> (not res!907778) (not e!773523))))

(assert (=> b!1364079 (= res!907778 (validKeyInArray!0 (select (arr!44787 lt!600957) from!3120)))))

(assert (= (and d!146215 (not res!907779)) b!1364079))

(assert (= (and b!1364079 res!907778) b!1364080))

(assert (= (and b!1364079 res!907780) b!1364077))

(assert (= (and b!1364077 c!127589) b!1364076))

(assert (= (and b!1364077 (not c!127589)) b!1364078))

(assert (= (or b!1364076 b!1364078) bm!65423))

(declare-fun m!1248773 () Bool)

(assert (=> b!1364077 m!1248773))

(assert (=> b!1364077 m!1248773))

(declare-fun m!1248775 () Bool)

(assert (=> b!1364077 m!1248775))

(assert (=> b!1364080 m!1248773))

(assert (=> b!1364080 m!1248773))

(declare-fun m!1248777 () Bool)

(assert (=> b!1364080 m!1248777))

(assert (=> bm!65423 m!1248773))

(declare-fun m!1248779 () Bool)

(assert (=> bm!65423 m!1248779))

(assert (=> b!1364079 m!1248773))

(assert (=> b!1364079 m!1248773))

(assert (=> b!1364079 m!1248775))

(assert (=> b!1363927 d!146215))

(declare-fun b!1364087 () Bool)

(declare-fun e!773536 () Bool)

(declare-fun call!65427 () Bool)

(assert (=> b!1364087 (= e!773536 call!65427)))

(declare-fun b!1364088 () Bool)

(declare-fun e!773531 () Bool)

(assert (=> b!1364088 (= e!773531 e!773536)))

(declare-fun c!127590 () Bool)

(assert (=> b!1364088 (= c!127590 (validKeyInArray!0 (select (arr!44787 lt!600957) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364089 () Bool)

(assert (=> b!1364089 (= e!773536 call!65427)))

(declare-fun e!773534 () Bool)

(declare-fun b!1364091 () Bool)

(assert (=> b!1364091 (= e!773534 (contains!9537 acc!759 (select (arr!44787 lt!600957) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65424 () Bool)

(assert (=> bm!65424 (= call!65427 (arrayNoDuplicates!0 lt!600957 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127590 (Cons!31824 (select (arr!44787 lt!600957) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun d!146217 () Bool)

(declare-fun res!907788 () Bool)

(declare-fun e!773533 () Bool)

(assert (=> d!146217 (=> res!907788 e!773533)))

(assert (=> d!146217 (= res!907788 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45337 lt!600957)))))

(assert (=> d!146217 (= (arrayNoDuplicates!0 lt!600957 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773533)))

(declare-fun b!1364090 () Bool)

(assert (=> b!1364090 (= e!773533 e!773531)))

(declare-fun res!907790 () Bool)

(assert (=> b!1364090 (=> (not res!907790) (not e!773531))))

(assert (=> b!1364090 (= res!907790 (not e!773534))))

(declare-fun res!907787 () Bool)

(assert (=> b!1364090 (=> (not res!907787) (not e!773534))))

(assert (=> b!1364090 (= res!907787 (validKeyInArray!0 (select (arr!44787 lt!600957) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146217 (not res!907788)) b!1364090))

(assert (= (and b!1364090 res!907787) b!1364091))

(assert (= (and b!1364090 res!907790) b!1364088))

(assert (= (and b!1364088 c!127590) b!1364087))

(assert (= (and b!1364088 (not c!127590)) b!1364089))

(assert (= (or b!1364087 b!1364089) bm!65424))

(declare-fun m!1248786 () Bool)

(assert (=> b!1364088 m!1248786))

(assert (=> b!1364088 m!1248786))

(declare-fun m!1248791 () Bool)

(assert (=> b!1364088 m!1248791))

(assert (=> b!1364091 m!1248786))

(assert (=> b!1364091 m!1248786))

(declare-fun m!1248795 () Bool)

(assert (=> b!1364091 m!1248795))

(assert (=> bm!65424 m!1248786))

(declare-fun m!1248799 () Bool)

(assert (=> bm!65424 m!1248799))

(assert (=> b!1364090 m!1248786))

(assert (=> b!1364090 m!1248786))

(assert (=> b!1364090 m!1248791))

(assert (=> b!1363927 d!146217))

(declare-fun d!146225 () Bool)

(declare-fun e!773561 () Bool)

(assert (=> d!146225 e!773561))

(declare-fun res!907813 () Bool)

(assert (=> d!146225 (=> (not res!907813) (not e!773561))))

(assert (=> d!146225 (= res!907813 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45337 a!3742))))))

(declare-fun lt!601003 () Unit!45021)

(declare-fun choose!53 (array!92711 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31828) Unit!45021)

(assert (=> d!146225 (= lt!601003 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (=> d!146225 (bvslt (size!45337 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146225 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) lt!601003)))

(declare-fun b!1364121 () Bool)

(assert (=> b!1364121 (= e!773561 (arrayNoDuplicates!0 (array!92712 (store (arr!44787 a!3742) i!1404 l!3587) (size!45337 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and d!146225 res!907813) b!1364121))

(declare-fun m!1248833 () Bool)

(assert (=> d!146225 m!1248833))

(assert (=> b!1364121 m!1248643))

(declare-fun m!1248835 () Bool)

(assert (=> b!1364121 m!1248835))

(assert (=> b!1363927 d!146225))

(declare-fun d!146239 () Bool)

(assert (=> d!146239 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363932 d!146239))

(check-sat (not bm!65418) (not b!1363987) (not bm!65421) (not bm!65424) (not b!1364088) (not b!1363993) (not d!146195) (not b!1364030) (not b!1363984) (not b!1364080) (not b!1364079) (not d!146175) (not b!1364121) (not b!1364060) (not b!1364077) (not b!1364091) (not bm!65423) (not b!1363986) (not b!1364059) (not b!1364057) (not b!1364031) (not d!146225) (not b!1364090) (not b!1364025) (not b!1364047) (not d!146179) (not b!1364073) (not b!1364026) (not b!1364072) (not d!146197) (not b!1364028) (not bm!65414))
(check-sat)
