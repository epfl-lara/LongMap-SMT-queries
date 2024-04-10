; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115086 () Bool)

(assert start!115086)

(declare-fun b!1363960 () Bool)

(declare-datatypes ((Unit!45024 0))(
  ( (Unit!45025) )
))
(declare-fun e!773428 () Unit!45024)

(declare-fun lt!600976 () Unit!45024)

(assert (=> b!1363960 (= e!773428 lt!600976)))

(declare-fun lt!600973 () Unit!45024)

(declare-datatypes ((List!31829 0))(
  ( (Nil!31826) (Cons!31825 (h!33034 (_ BitVec 64)) (t!46520 List!31829)) )
))
(declare-fun acc!759 () List!31829)

(declare-fun lemmaListSubSeqRefl!0 (List!31829) Unit!45024)

(assert (=> b!1363960 (= lt!600973 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!940 (List!31829 List!31829) Bool)

(assert (=> b!1363960 (subseq!940 acc!759 acc!759)))

(declare-datatypes ((array!92713 0))(
  ( (array!92714 (arr!44788 (Array (_ BitVec 32) (_ BitVec 64))) (size!45338 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92713)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92713 List!31829 List!31829 (_ BitVec 32)) Unit!45024)

(declare-fun $colon$colon!943 (List!31829 (_ BitVec 64)) List!31829)

(assert (=> b!1363960 (= lt!600976 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!943 acc!759 (select (arr!44788 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92713 (_ BitVec 32) List!31829) Bool)

(assert (=> b!1363960 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363961 () Bool)

(declare-fun res!907694 () Bool)

(declare-fun e!773427 () Bool)

(assert (=> b!1363961 (=> (not res!907694) (not e!773427))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363961 (= res!907694 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363962 () Bool)

(declare-fun res!907693 () Bool)

(assert (=> b!1363962 (=> (not res!907693) (not e!773427))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363962 (= res!907693 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45338 a!3742))))))

(declare-fun b!1363963 () Bool)

(declare-fun res!907687 () Bool)

(assert (=> b!1363963 (=> (not res!907687) (not e!773427))))

(declare-fun contains!9538 (List!31829 (_ BitVec 64)) Bool)

(assert (=> b!1363963 (= res!907687 (not (contains!9538 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363965 () Bool)

(declare-fun res!907690 () Bool)

(declare-fun e!773425 () Bool)

(assert (=> b!1363965 (=> (not res!907690) (not e!773425))))

(assert (=> b!1363965 (= res!907690 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun lt!600971 () array!92713)

(declare-fun b!1363966 () Bool)

(assert (=> b!1363966 (= e!773425 (not (arrayNoDuplicates!0 lt!600971 from!3120 acc!759)))))

(assert (=> b!1363966 (arrayNoDuplicates!0 lt!600971 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (=> b!1363966 (= lt!600971 (array!92714 (store (arr!44788 a!3742) i!1404 l!3587) (size!45338 a!3742)))))

(declare-fun lt!600972 () Unit!45024)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92713 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31829) Unit!45024)

(assert (=> b!1363966 (= lt!600972 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363967 () Bool)

(declare-fun res!907696 () Bool)

(assert (=> b!1363967 (=> (not res!907696) (not e!773427))))

(assert (=> b!1363967 (= res!907696 (not (contains!9538 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363968 () Bool)

(declare-fun res!907689 () Bool)

(assert (=> b!1363968 (=> (not res!907689) (not e!773427))))

(assert (=> b!1363968 (= res!907689 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45338 a!3742)))))

(declare-fun b!1363969 () Bool)

(declare-fun Unit!45026 () Unit!45024)

(assert (=> b!1363969 (= e!773428 Unit!45026)))

(declare-fun b!1363970 () Bool)

(declare-fun res!907695 () Bool)

(assert (=> b!1363970 (=> (not res!907695) (not e!773427))))

(declare-fun noDuplicate!2395 (List!31829) Bool)

(assert (=> b!1363970 (= res!907695 (noDuplicate!2395 acc!759))))

(declare-fun b!1363971 () Bool)

(declare-fun res!907692 () Bool)

(assert (=> b!1363971 (=> (not res!907692) (not e!773427))))

(assert (=> b!1363971 (= res!907692 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31826))))

(declare-fun b!1363972 () Bool)

(assert (=> b!1363972 (= e!773427 e!773425)))

(declare-fun res!907691 () Bool)

(assert (=> b!1363972 (=> (not res!907691) (not e!773425))))

(declare-fun lt!600974 () Bool)

(assert (=> b!1363972 (= res!907691 (and (not (= from!3120 i!1404)) (not lt!600974) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600975 () Unit!45024)

(assert (=> b!1363972 (= lt!600975 e!773428)))

(declare-fun c!127577 () Bool)

(assert (=> b!1363972 (= c!127577 lt!600974)))

(assert (=> b!1363972 (= lt!600974 (validKeyInArray!0 (select (arr!44788 a!3742) from!3120)))))

(declare-fun res!907688 () Bool)

(assert (=> start!115086 (=> (not res!907688) (not e!773427))))

(assert (=> start!115086 (= res!907688 (and (bvslt (size!45338 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45338 a!3742))))))

(assert (=> start!115086 e!773427))

(assert (=> start!115086 true))

(declare-fun array_inv!33816 (array!92713) Bool)

(assert (=> start!115086 (array_inv!33816 a!3742)))

(declare-fun b!1363964 () Bool)

(declare-fun res!907686 () Bool)

(assert (=> b!1363964 (=> (not res!907686) (not e!773427))))

(assert (=> b!1363964 (= res!907686 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!115086 res!907688) b!1363970))

(assert (= (and b!1363970 res!907695) b!1363963))

(assert (= (and b!1363963 res!907687) b!1363967))

(assert (= (and b!1363967 res!907696) b!1363971))

(assert (= (and b!1363971 res!907692) b!1363964))

(assert (= (and b!1363964 res!907686) b!1363962))

(assert (= (and b!1363962 res!907693) b!1363961))

(assert (= (and b!1363961 res!907694) b!1363968))

(assert (= (and b!1363968 res!907689) b!1363972))

(assert (= (and b!1363972 c!127577) b!1363960))

(assert (= (and b!1363972 (not c!127577)) b!1363969))

(assert (= (and b!1363972 res!907691) b!1363965))

(assert (= (and b!1363965 res!907690) b!1363966))

(declare-fun m!1248667 () Bool)

(assert (=> b!1363963 m!1248667))

(declare-fun m!1248669 () Bool)

(assert (=> b!1363960 m!1248669))

(declare-fun m!1248671 () Bool)

(assert (=> b!1363960 m!1248671))

(declare-fun m!1248673 () Bool)

(assert (=> b!1363960 m!1248673))

(declare-fun m!1248675 () Bool)

(assert (=> b!1363960 m!1248675))

(declare-fun m!1248677 () Bool)

(assert (=> b!1363960 m!1248677))

(assert (=> b!1363960 m!1248671))

(assert (=> b!1363960 m!1248673))

(declare-fun m!1248679 () Bool)

(assert (=> b!1363960 m!1248679))

(declare-fun m!1248681 () Bool)

(assert (=> b!1363971 m!1248681))

(declare-fun m!1248683 () Bool)

(assert (=> b!1363961 m!1248683))

(declare-fun m!1248685 () Bool)

(assert (=> b!1363966 m!1248685))

(declare-fun m!1248687 () Bool)

(assert (=> b!1363966 m!1248687))

(declare-fun m!1248689 () Bool)

(assert (=> b!1363966 m!1248689))

(declare-fun m!1248691 () Bool)

(assert (=> b!1363966 m!1248691))

(declare-fun m!1248693 () Bool)

(assert (=> start!115086 m!1248693))

(declare-fun m!1248695 () Bool)

(assert (=> b!1363967 m!1248695))

(assert (=> b!1363965 m!1248677))

(assert (=> b!1363972 m!1248671))

(assert (=> b!1363972 m!1248671))

(declare-fun m!1248697 () Bool)

(assert (=> b!1363972 m!1248697))

(declare-fun m!1248699 () Bool)

(assert (=> b!1363970 m!1248699))

(declare-fun m!1248701 () Bool)

(assert (=> b!1363964 m!1248701))

(push 1)

(assert (not b!1363967))

(assert (not b!1363961))

(assert (not b!1363972))

(assert (not b!1363963))

(assert (not b!1363971))

(assert (not b!1363965))

(assert (not b!1363970))

(assert (not start!115086))

(assert (not b!1363964))

(assert (not b!1363960))

(assert (not b!1363966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1364004 () Bool)

(declare-fun e!773458 () Bool)

(declare-fun call!65420 () Bool)

(assert (=> b!1364004 (= e!773458 call!65420)))

(declare-fun b!1364005 () Bool)

(assert (=> b!1364005 (= e!773458 call!65420)))

(declare-fun b!1364006 () Bool)

(declare-fun e!773455 () Bool)

(assert (=> b!1364006 (= e!773455 e!773458)))

(declare-fun c!127583 () Bool)

(assert (=> b!1364006 (= c!127583 (validKeyInArray!0 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65417 () Bool)

(assert (=> bm!65417 (= call!65420 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127583 (Cons!31825 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1364007 () Bool)

(declare-fun e!773456 () Bool)

(assert (=> b!1364007 (= e!773456 e!773455)))

(declare-fun res!907719 () Bool)

(assert (=> b!1364007 (=> (not res!907719) (not e!773455))))

(declare-fun e!773457 () Bool)

(assert (=> b!1364007 (= res!907719 (not e!773457))))

(declare-fun res!907718 () Bool)

(assert (=> b!1364007 (=> (not res!907718) (not e!773457))))

(assert (=> b!1364007 (= res!907718 (validKeyInArray!0 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364008 () Bool)

(assert (=> b!1364008 (= e!773457 (contains!9538 acc!759 (select (arr!44788 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146177 () Bool)

(declare-fun res!907720 () Bool)

(assert (=> d!146177 (=> res!907720 e!773456)))

(assert (=> d!146177 (= res!907720 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45338 a!3742)))))

(assert (=> d!146177 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773456)))

(assert (= (and d!146177 (not res!907720)) b!1364007))

(assert (= (and b!1364007 res!907718) b!1364008))

(assert (= (and b!1364007 res!907719) b!1364006))

(assert (= (and b!1364006 c!127583) b!1364005))

(assert (= (and b!1364006 (not c!127583)) b!1364004))

(assert (= (or b!1364005 b!1364004) bm!65417))

(declare-fun m!1248719 () Bool)

(assert (=> b!1364006 m!1248719))

(assert (=> b!1364006 m!1248719))

(declare-fun m!1248721 () Bool)

(assert (=> b!1364006 m!1248721))

(assert (=> bm!65417 m!1248719))

(declare-fun m!1248723 () Bool)

(assert (=> bm!65417 m!1248723))

(assert (=> b!1364007 m!1248719))

(assert (=> b!1364007 m!1248719))

(assert (=> b!1364007 m!1248721))

(assert (=> b!1364008 m!1248719))

(assert (=> b!1364008 m!1248719))

(declare-fun m!1248725 () Bool)

(assert (=> b!1364008 m!1248725))

(assert (=> b!1363965 d!146177))

(declare-fun d!146185 () Bool)

(assert (=> d!146185 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600985 () Unit!45024)

(declare-fun choose!80 (array!92713 List!31829 List!31829 (_ BitVec 32)) Unit!45024)

(assert (=> d!146185 (= lt!600985 (choose!80 a!3742 ($colon$colon!943 acc!759 (select (arr!44788 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146185 (bvslt (size!45338 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146185 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!943 acc!759 (select (arr!44788 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600985)))

(declare-fun bs!39109 () Bool)

(assert (= bs!39109 d!146185))

(assert (=> bs!39109 m!1248677))

(assert (=> bs!39109 m!1248673))

(declare-fun m!1248735 () Bool)

(assert (=> bs!39109 m!1248735))

(assert (=> b!1363960 d!146185))

(declare-fun b!1364055 () Bool)

(declare-fun e!773501 () Bool)

(assert (=> b!1364055 (= e!773501 (subseq!940 acc!759 (t!46520 acc!759)))))

(declare-fun d!146191 () Bool)

(declare-fun res!907761 () Bool)

(declare-fun e!773502 () Bool)

(assert (=> d!146191 (=> res!907761 e!773502)))

(assert (=> d!146191 (= res!907761 (is-Nil!31826 acc!759))))

(assert (=> d!146191 (= (subseq!940 acc!759 acc!759) e!773502)))

(declare-fun b!1364053 () Bool)

(declare-fun e!773499 () Bool)

(assert (=> b!1364053 (= e!773499 e!773501)))

(declare-fun res!907760 () Bool)

(assert (=> b!1364053 (=> res!907760 e!773501)))

(declare-fun e!773500 () Bool)

(assert (=> b!1364053 (= res!907760 e!773500)))

(declare-fun res!907758 () Bool)

(assert (=> b!1364053 (=> (not res!907758) (not e!773500))))

(assert (=> b!1364053 (= res!907758 (= (h!33034 acc!759) (h!33034 acc!759)))))

(declare-fun b!1364052 () Bool)

(assert (=> b!1364052 (= e!773502 e!773499)))

(declare-fun res!907759 () Bool)

(assert (=> b!1364052 (=> (not res!907759) (not e!773499))))

(assert (=> b!1364052 (= res!907759 (is-Cons!31825 acc!759))))

(declare-fun b!1364054 () Bool)

(assert (=> b!1364054 (= e!773500 (subseq!940 (t!46520 acc!759) (t!46520 acc!759)))))

(assert (= (and d!146191 (not res!907761)) b!1364052))

(assert (= (and b!1364052 res!907759) b!1364053))

(assert (= (and b!1364053 res!907758) b!1364054))

(assert (= (and b!1364053 (not res!907760)) b!1364055))

(declare-fun m!1248751 () Bool)

(assert (=> b!1364055 m!1248751))

(declare-fun m!1248753 () Bool)

(assert (=> b!1364054 m!1248753))

(assert (=> b!1363960 d!146191))

(assert (=> b!1363960 d!146177))

(declare-fun d!146205 () Bool)

(assert (=> d!146205 (= ($colon$colon!943 acc!759 (select (arr!44788 a!3742) from!3120)) (Cons!31825 (select (arr!44788 a!3742) from!3120) acc!759))))

(assert (=> b!1363960 d!146205))

(declare-fun d!146207 () Bool)

(assert (=> d!146207 (subseq!940 acc!759 acc!759)))

(declare-fun lt!600992 () Unit!45024)

(declare-fun choose!36 (List!31829) Unit!45024)

(assert (=> d!146207 (= lt!600992 (choose!36 acc!759))))

(assert (=> d!146207 (= (lemmaListSubSeqRefl!0 acc!759) lt!600992)))

(declare-fun bs!39111 () Bool)

(assert (= bs!39111 d!146207))

(assert (=> bs!39111 m!1248679))

(declare-fun m!1248767 () Bool)

(assert (=> bs!39111 m!1248767))

(assert (=> b!1363960 d!146207))

(declare-fun d!146213 () Bool)

(declare-fun res!907785 () Bool)

(declare-fun e!773529 () Bool)

(assert (=> d!146213 (=> res!907785 e!773529)))

(assert (=> d!146213 (= res!907785 (is-Nil!31826 acc!759))))

(assert (=> d!146213 (= (noDuplicate!2395 acc!759) e!773529)))

(declare-fun b!1364085 () Bool)

(declare-fun e!773530 () Bool)

(assert (=> b!1364085 (= e!773529 e!773530)))

(declare-fun res!907786 () Bool)

(assert (=> b!1364085 (=> (not res!907786) (not e!773530))))

(assert (=> b!1364085 (= res!907786 (not (contains!9538 (t!46520 acc!759) (h!33034 acc!759))))))

(declare-fun b!1364086 () Bool)

(assert (=> b!1364086 (= e!773530 (noDuplicate!2395 (t!46520 acc!759)))))

(assert (= (and d!146213 (not res!907785)) b!1364085))

(assert (= (and b!1364085 res!907786) b!1364086))

(declare-fun m!1248781 () Bool)

(assert (=> b!1364085 m!1248781))

(declare-fun m!1248783 () Bool)

(assert (=> b!1364086 m!1248783))

(assert (=> b!1363970 d!146213))

(declare-fun b!1364092 () Bool)

(declare-fun e!773538 () Bool)

(declare-fun call!65428 () Bool)

(assert (=> b!1364092 (= e!773538 call!65428)))

(declare-fun b!1364093 () Bool)

(assert (=> b!1364093 (= e!773538 call!65428)))

(declare-fun b!1364094 () Bool)

(declare-fun e!773532 () Bool)

(assert (=> b!1364094 (= e!773532 e!773538)))

(declare-fun c!127591 () Bool)

(assert (=> b!1364094 (= c!127591 (validKeyInArray!0 (select (arr!44788 a!3742) from!3120)))))

(declare-fun bm!65425 () Bool)

(assert (=> bm!65425 (= call!65428 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127591 (Cons!31825 (select (arr!44788 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1364095 () Bool)

(declare-fun e!773535 () Bool)

(assert (=> b!1364095 (= e!773535 e!773532)))

(declare-fun res!907791 () Bool)

(assert (=> b!1364095 (=> (not res!907791) (not e!773532))))

(declare-fun e!773537 () Bool)

(assert (=> b!1364095 (= res!907791 (not e!773537))))

(declare-fun res!907789 () Bool)

(assert (=> b!1364095 (=> (not res!907789) (not e!773537))))

(assert (=> b!1364095 (= res!907789 (validKeyInArray!0 (select (arr!44788 a!3742) from!3120)))))

(declare-fun b!1364096 () Bool)

(assert (=> b!1364096 (= e!773537 (contains!9538 acc!759 (select (arr!44788 a!3742) from!3120)))))

(declare-fun d!146219 () Bool)

(declare-fun res!907792 () Bool)

(assert (=> d!146219 (=> res!907792 e!773535)))

(assert (=> d!146219 (= res!907792 (bvsge from!3120 (size!45338 a!3742)))))

(assert (=> d!146219 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773535)))

(assert (= (and d!146219 (not res!907792)) b!1364095))

(assert (= (and b!1364095 res!907789) b!1364096))

(assert (= (and b!1364095 res!907791) b!1364094))

(assert (= (and b!1364094 c!127591) b!1364093))

(assert (= (and b!1364094 (not c!127591)) b!1364092))

(assert (= (or b!1364093 b!1364092) bm!65425))

(assert (=> b!1364094 m!1248671))

(assert (=> b!1364094 m!1248671))

(assert (=> b!1364094 m!1248697))

(assert (=> bm!65425 m!1248671))

(declare-fun m!1248797 () Bool)

(assert (=> bm!65425 m!1248797))

(assert (=> b!1364095 m!1248671))

(assert (=> b!1364095 m!1248671))

(assert (=> b!1364095 m!1248697))

(assert (=> b!1364096 m!1248671))

(assert (=> b!1364096 m!1248671))

(declare-fun m!1248801 () Bool)

(assert (=> b!1364096 m!1248801))

(assert (=> b!1363964 d!146219))

(declare-fun d!146223 () Bool)

(declare-fun lt!600999 () Bool)

(declare-fun content!707 (List!31829) (Set (_ BitVec 64)))

(assert (=> d!146223 (= lt!600999 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!707 acc!759)))))

(declare-fun e!773556 () Bool)

(assert (=> d!146223 (= lt!600999 e!773556)))

(declare-fun res!907807 () Bool)

(assert (=> d!146223 (=> (not res!907807) (not e!773556))))

(assert (=> d!146223 (= res!907807 (is-Cons!31825 acc!759))))

(assert (=> d!146223 (= (contains!9538 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600999)))

(declare-fun b!1364115 () Bool)

(declare-fun e!773555 () Bool)

(assert (=> b!1364115 (= e!773556 e!773555)))

(declare-fun res!907808 () Bool)

(assert (=> b!1364115 (=> res!907808 e!773555)))

(assert (=> b!1364115 (= res!907808 (= (h!33034 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364116 () Bool)

(assert (=> b!1364116 (= e!773555 (contains!9538 (t!46520 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146223 res!907807) b!1364115))

(assert (= (and b!1364115 (not res!907808)) b!1364116))

(declare-fun m!1248823 () Bool)

(assert (=> d!146223 m!1248823))

(declare-fun m!1248825 () Bool)

(assert (=> d!146223 m!1248825))

(declare-fun m!1248827 () Bool)

(assert (=> b!1364116 m!1248827))

(assert (=> b!1363963 d!146223))

(declare-fun d!146233 () Bool)

(assert (=> d!146233 (= (array_inv!33816 a!3742) (bvsge (size!45338 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115086 d!146233))

(declare-fun d!146235 () Bool)

(declare-fun lt!601002 () Bool)

(assert (=> d!146235 (= lt!601002 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!707 acc!759)))))

(declare-fun e!773560 () Bool)

(assert (=> d!146235 (= lt!601002 e!773560)))

(declare-fun res!907811 () Bool)

(assert (=> d!146235 (=> (not res!907811) (not e!773560))))

(assert (=> d!146235 (= res!907811 (is-Cons!31825 acc!759))))

(assert (=> d!146235 (= (contains!9538 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601002)))

(declare-fun b!1364119 () Bool)

(declare-fun e!773559 () Bool)

(assert (=> b!1364119 (= e!773560 e!773559)))

(declare-fun res!907812 () Bool)

(assert (=> b!1364119 (=> res!907812 e!773559)))

(assert (=> b!1364119 (= res!907812 (= (h!33034 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364120 () Bool)

(assert (=> b!1364120 (= e!773559 (contains!9538 (t!46520 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146235 res!907811) b!1364119))

(assert (= (and b!1364119 (not res!907812)) b!1364120))

(assert (=> d!146235 m!1248823))

(declare-fun m!1248829 () Bool)

(assert (=> d!146235 m!1248829))

(declare-fun m!1248831 () Bool)

(assert (=> b!1364120 m!1248831))

(assert (=> b!1363967 d!146235))

(declare-fun d!146237 () Bool)

(assert (=> d!146237 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363961 d!146237))

(declare-fun d!146241 () Bool)

(assert (=> d!146241 (= (validKeyInArray!0 (select (arr!44788 a!3742) from!3120)) (and (not (= (select (arr!44788 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44788 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363972 d!146241))

(declare-fun b!1364124 () Bool)

(declare-fun e!773567 () Bool)

(declare-fun call!65431 () Bool)

(assert (=> b!1364124 (= e!773567 call!65431)))

(declare-fun b!1364125 () Bool)

(assert (=> b!1364125 (= e!773567 call!65431)))

(declare-fun b!1364126 () Bool)

(declare-fun e!773564 () Bool)

(assert (=> b!1364126 (= e!773564 e!773567)))

(declare-fun c!127594 () Bool)

(assert (=> b!1364126 (= c!127594 (validKeyInArray!0 (select (arr!44788 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65428 () Bool)

(assert (=> bm!65428 (= call!65431 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127594 (Cons!31825 (select (arr!44788 a!3742) #b00000000000000000000000000000000) Nil!31826) Nil!31826)))))

(declare-fun b!1364127 () Bool)

(declare-fun e!773565 () Bool)

(assert (=> b!1364127 (= e!773565 e!773564)))

(declare-fun res!907817 () Bool)

(assert (=> b!1364127 (=> (not res!907817) (not e!773564))))

(declare-fun e!773566 () Bool)

(assert (=> b!1364127 (= res!907817 (not e!773566))))

(declare-fun res!907816 () Bool)

(assert (=> b!1364127 (=> (not res!907816) (not e!773566))))

(assert (=> b!1364127 (= res!907816 (validKeyInArray!0 (select (arr!44788 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364128 () Bool)

(assert (=> b!1364128 (= e!773566 (contains!9538 Nil!31826 (select (arr!44788 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146243 () Bool)

(declare-fun res!907818 () Bool)

(assert (=> d!146243 (=> res!907818 e!773565)))

(assert (=> d!146243 (= res!907818 (bvsge #b00000000000000000000000000000000 (size!45338 a!3742)))))

(assert (=> d!146243 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31826) e!773565)))

(assert (= (and d!146243 (not res!907818)) b!1364127))

(assert (= (and b!1364127 res!907816) b!1364128))

(assert (= (and b!1364127 res!907817) b!1364126))

(assert (= (and b!1364126 c!127594) b!1364125))

(assert (= (and b!1364126 (not c!127594)) b!1364124))

(assert (= (or b!1364125 b!1364124) bm!65428))

(declare-fun m!1248837 () Bool)

(assert (=> b!1364126 m!1248837))

(assert (=> b!1364126 m!1248837))

(declare-fun m!1248839 () Bool)

(assert (=> b!1364126 m!1248839))

(assert (=> bm!65428 m!1248837))

(declare-fun m!1248841 () Bool)

