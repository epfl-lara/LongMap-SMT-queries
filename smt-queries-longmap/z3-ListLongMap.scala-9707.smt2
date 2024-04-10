; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114748 () Bool)

(assert start!114748)

(declare-fun b!1360883 () Bool)

(declare-fun res!905106 () Bool)

(declare-fun e!772049 () Bool)

(assert (=> b!1360883 (=> (not res!905106) (not e!772049))))

(declare-datatypes ((List!31771 0))(
  ( (Nil!31768) (Cons!31767 (h!32976 (_ BitVec 64)) (t!46450 List!31771)) )
))
(declare-fun lt!600013 () List!31771)

(declare-fun noDuplicate!2337 (List!31771) Bool)

(assert (=> b!1360883 (= res!905106 (noDuplicate!2337 lt!600013))))

(declare-fun b!1360884 () Bool)

(declare-fun res!905104 () Bool)

(declare-fun e!772051 () Bool)

(assert (=> b!1360884 (=> (not res!905104) (not e!772051))))

(declare-fun acc!759 () List!31771)

(declare-fun contains!9480 (List!31771 (_ BitVec 64)) Bool)

(assert (=> b!1360884 (= res!905104 (not (contains!9480 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360885 () Bool)

(declare-fun res!905109 () Bool)

(assert (=> b!1360885 (=> (not res!905109) (not e!772051))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92585 0))(
  ( (array!92586 (arr!44730 (Array (_ BitVec 32) (_ BitVec 64))) (size!45280 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92585)

(assert (=> b!1360885 (= res!905109 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45280 a!3742)))))

(declare-fun res!905102 () Bool)

(assert (=> start!114748 (=> (not res!905102) (not e!772051))))

(assert (=> start!114748 (= res!905102 (and (bvslt (size!45280 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45280 a!3742))))))

(assert (=> start!114748 e!772051))

(assert (=> start!114748 true))

(declare-fun array_inv!33758 (array!92585) Bool)

(assert (=> start!114748 (array_inv!33758 a!3742)))

(declare-fun b!1360886 () Bool)

(declare-datatypes ((Unit!44850 0))(
  ( (Unit!44851) )
))
(declare-fun e!772054 () Unit!44850)

(declare-fun Unit!44852 () Unit!44850)

(assert (=> b!1360886 (= e!772054 Unit!44852)))

(declare-fun b!1360887 () Bool)

(declare-fun lt!600011 () Unit!44850)

(assert (=> b!1360887 (= e!772054 lt!600011)))

(declare-fun lt!600010 () Unit!44850)

(declare-fun lemmaListSubSeqRefl!0 (List!31771) Unit!44850)

(assert (=> b!1360887 (= lt!600010 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!882 (List!31771 List!31771) Bool)

(assert (=> b!1360887 (subseq!882 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92585 List!31771 List!31771 (_ BitVec 32)) Unit!44850)

(declare-fun $colon$colon!885 (List!31771 (_ BitVec 64)) List!31771)

(assert (=> b!1360887 (= lt!600011 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!885 acc!759 (select (arr!44730 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92585 (_ BitVec 32) List!31771) Bool)

(assert (=> b!1360887 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360888 () Bool)

(declare-fun res!905113 () Bool)

(assert (=> b!1360888 (=> (not res!905113) (not e!772051))))

(assert (=> b!1360888 (= res!905113 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360889 () Bool)

(declare-fun res!905105 () Bool)

(assert (=> b!1360889 (=> (not res!905105) (not e!772051))))

(assert (=> b!1360889 (= res!905105 (noDuplicate!2337 acc!759))))

(declare-fun b!1360890 () Bool)

(declare-fun res!905111 () Bool)

(assert (=> b!1360890 (=> (not res!905111) (not e!772051))))

(assert (=> b!1360890 (= res!905111 (not (contains!9480 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360891 () Bool)

(declare-fun res!905108 () Bool)

(assert (=> b!1360891 (=> (not res!905108) (not e!772051))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360891 (= res!905108 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360892 () Bool)

(declare-fun e!772052 () Bool)

(assert (=> b!1360892 (= e!772049 e!772052)))

(declare-fun res!905110 () Bool)

(assert (=> b!1360892 (=> res!905110 e!772052)))

(assert (=> b!1360892 (= res!905110 (contains!9480 lt!600013 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360893 () Bool)

(declare-fun e!772053 () Bool)

(assert (=> b!1360893 (= e!772053 e!772049)))

(declare-fun res!905112 () Bool)

(assert (=> b!1360893 (=> (not res!905112) (not e!772049))))

(assert (=> b!1360893 (= res!905112 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1360893 (= lt!600013 ($colon$colon!885 acc!759 (select (arr!44730 a!3742) from!3120)))))

(declare-fun b!1360894 () Bool)

(declare-fun res!905107 () Bool)

(assert (=> b!1360894 (=> (not res!905107) (not e!772051))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360894 (= res!905107 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45280 a!3742))))))

(declare-fun b!1360895 () Bool)

(assert (=> b!1360895 (= e!772052 (contains!9480 lt!600013 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360896 () Bool)

(declare-fun res!905103 () Bool)

(assert (=> b!1360896 (=> (not res!905103) (not e!772051))))

(assert (=> b!1360896 (= res!905103 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31768))))

(declare-fun b!1360897 () Bool)

(assert (=> b!1360897 (= e!772051 e!772053)))

(declare-fun res!905101 () Bool)

(assert (=> b!1360897 (=> (not res!905101) (not e!772053))))

(declare-fun lt!600012 () Bool)

(assert (=> b!1360897 (= res!905101 (and (not (= from!3120 i!1404)) lt!600012))))

(declare-fun lt!600009 () Unit!44850)

(assert (=> b!1360897 (= lt!600009 e!772054)))

(declare-fun c!127331 () Bool)

(assert (=> b!1360897 (= c!127331 lt!600012)))

(assert (=> b!1360897 (= lt!600012 (validKeyInArray!0 (select (arr!44730 a!3742) from!3120)))))

(assert (= (and start!114748 res!905102) b!1360889))

(assert (= (and b!1360889 res!905105) b!1360890))

(assert (= (and b!1360890 res!905111) b!1360884))

(assert (= (and b!1360884 res!905104) b!1360896))

(assert (= (and b!1360896 res!905103) b!1360888))

(assert (= (and b!1360888 res!905113) b!1360894))

(assert (= (and b!1360894 res!905107) b!1360891))

(assert (= (and b!1360891 res!905108) b!1360885))

(assert (= (and b!1360885 res!905109) b!1360897))

(assert (= (and b!1360897 c!127331) b!1360887))

(assert (= (and b!1360897 (not c!127331)) b!1360886))

(assert (= (and b!1360897 res!905101) b!1360893))

(assert (= (and b!1360893 res!905112) b!1360883))

(assert (= (and b!1360883 res!905106) b!1360892))

(assert (= (and b!1360892 (not res!905110)) b!1360895))

(declare-fun m!1246079 () Bool)

(assert (=> b!1360888 m!1246079))

(declare-fun m!1246081 () Bool)

(assert (=> b!1360896 m!1246081))

(declare-fun m!1246083 () Bool)

(assert (=> start!114748 m!1246083))

(declare-fun m!1246085 () Bool)

(assert (=> b!1360893 m!1246085))

(assert (=> b!1360893 m!1246085))

(declare-fun m!1246087 () Bool)

(assert (=> b!1360893 m!1246087))

(declare-fun m!1246089 () Bool)

(assert (=> b!1360883 m!1246089))

(declare-fun m!1246091 () Bool)

(assert (=> b!1360889 m!1246091))

(assert (=> b!1360897 m!1246085))

(assert (=> b!1360897 m!1246085))

(declare-fun m!1246093 () Bool)

(assert (=> b!1360897 m!1246093))

(declare-fun m!1246095 () Bool)

(assert (=> b!1360884 m!1246095))

(declare-fun m!1246097 () Bool)

(assert (=> b!1360890 m!1246097))

(declare-fun m!1246099 () Bool)

(assert (=> b!1360891 m!1246099))

(declare-fun m!1246101 () Bool)

(assert (=> b!1360892 m!1246101))

(declare-fun m!1246103 () Bool)

(assert (=> b!1360887 m!1246103))

(assert (=> b!1360887 m!1246085))

(assert (=> b!1360887 m!1246087))

(declare-fun m!1246105 () Bool)

(assert (=> b!1360887 m!1246105))

(declare-fun m!1246107 () Bool)

(assert (=> b!1360887 m!1246107))

(assert (=> b!1360887 m!1246085))

(assert (=> b!1360887 m!1246087))

(declare-fun m!1246109 () Bool)

(assert (=> b!1360887 m!1246109))

(declare-fun m!1246111 () Bool)

(assert (=> b!1360895 m!1246111))

(check-sat (not b!1360889) (not b!1360891) (not start!114748) (not b!1360895) (not b!1360892) (not b!1360888) (not b!1360896) (not b!1360897) (not b!1360883) (not b!1360890) (not b!1360887) (not b!1360884) (not b!1360893))
(check-sat)
(get-model)

(declare-fun d!145739 () Bool)

(declare-fun lt!600031 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!693 (List!31771) (InoxSet (_ BitVec 64)))

(assert (=> d!145739 (= lt!600031 (select (content!693 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772078 () Bool)

(assert (=> d!145739 (= lt!600031 e!772078)))

(declare-fun res!905157 () Bool)

(assert (=> d!145739 (=> (not res!905157) (not e!772078))))

(get-info :version)

(assert (=> d!145739 (= res!905157 ((_ is Cons!31767) acc!759))))

(assert (=> d!145739 (= (contains!9480 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600031)))

(declare-fun b!1360947 () Bool)

(declare-fun e!772077 () Bool)

(assert (=> b!1360947 (= e!772078 e!772077)))

(declare-fun res!905158 () Bool)

(assert (=> b!1360947 (=> res!905158 e!772077)))

(assert (=> b!1360947 (= res!905158 (= (h!32976 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360948 () Bool)

(assert (=> b!1360948 (= e!772077 (contains!9480 (t!46450 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145739 res!905157) b!1360947))

(assert (= (and b!1360947 (not res!905158)) b!1360948))

(declare-fun m!1246147 () Bool)

(assert (=> d!145739 m!1246147))

(declare-fun m!1246149 () Bool)

(assert (=> d!145739 m!1246149))

(declare-fun m!1246151 () Bool)

(assert (=> b!1360948 m!1246151))

(assert (=> b!1360890 d!145739))

(declare-fun d!145741 () Bool)

(declare-fun res!905163 () Bool)

(declare-fun e!772083 () Bool)

(assert (=> d!145741 (=> res!905163 e!772083)))

(assert (=> d!145741 (= res!905163 ((_ is Nil!31768) acc!759))))

(assert (=> d!145741 (= (noDuplicate!2337 acc!759) e!772083)))

(declare-fun b!1360953 () Bool)

(declare-fun e!772084 () Bool)

(assert (=> b!1360953 (= e!772083 e!772084)))

(declare-fun res!905164 () Bool)

(assert (=> b!1360953 (=> (not res!905164) (not e!772084))))

(assert (=> b!1360953 (= res!905164 (not (contains!9480 (t!46450 acc!759) (h!32976 acc!759))))))

(declare-fun b!1360954 () Bool)

(assert (=> b!1360954 (= e!772084 (noDuplicate!2337 (t!46450 acc!759)))))

(assert (= (and d!145741 (not res!905163)) b!1360953))

(assert (= (and b!1360953 res!905164) b!1360954))

(declare-fun m!1246153 () Bool)

(assert (=> b!1360953 m!1246153))

(declare-fun m!1246155 () Bool)

(assert (=> b!1360954 m!1246155))

(assert (=> b!1360889 d!145741))

(declare-fun d!145743 () Bool)

(assert (=> d!145743 (= ($colon$colon!885 acc!759 (select (arr!44730 a!3742) from!3120)) (Cons!31767 (select (arr!44730 a!3742) from!3120) acc!759))))

(assert (=> b!1360893 d!145743))

(declare-fun d!145745 () Bool)

(assert (=> d!145745 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360891 d!145745))

(declare-fun d!145747 () Bool)

(declare-fun lt!600032 () Bool)

(assert (=> d!145747 (= lt!600032 (select (content!693 lt!600013) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772086 () Bool)

(assert (=> d!145747 (= lt!600032 e!772086)))

(declare-fun res!905165 () Bool)

(assert (=> d!145747 (=> (not res!905165) (not e!772086))))

(assert (=> d!145747 (= res!905165 ((_ is Cons!31767) lt!600013))))

(assert (=> d!145747 (= (contains!9480 lt!600013 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600032)))

(declare-fun b!1360955 () Bool)

(declare-fun e!772085 () Bool)

(assert (=> b!1360955 (= e!772086 e!772085)))

(declare-fun res!905166 () Bool)

(assert (=> b!1360955 (=> res!905166 e!772085)))

(assert (=> b!1360955 (= res!905166 (= (h!32976 lt!600013) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360956 () Bool)

(assert (=> b!1360956 (= e!772085 (contains!9480 (t!46450 lt!600013) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145747 res!905165) b!1360955))

(assert (= (and b!1360955 (not res!905166)) b!1360956))

(declare-fun m!1246157 () Bool)

(assert (=> d!145747 m!1246157))

(declare-fun m!1246159 () Bool)

(assert (=> d!145747 m!1246159))

(declare-fun m!1246161 () Bool)

(assert (=> b!1360956 m!1246161))

(assert (=> b!1360892 d!145747))

(declare-fun d!145749 () Bool)

(declare-fun lt!600033 () Bool)

(assert (=> d!145749 (= lt!600033 (select (content!693 lt!600013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772088 () Bool)

(assert (=> d!145749 (= lt!600033 e!772088)))

(declare-fun res!905167 () Bool)

(assert (=> d!145749 (=> (not res!905167) (not e!772088))))

(assert (=> d!145749 (= res!905167 ((_ is Cons!31767) lt!600013))))

(assert (=> d!145749 (= (contains!9480 lt!600013 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600033)))

(declare-fun b!1360957 () Bool)

(declare-fun e!772087 () Bool)

(assert (=> b!1360957 (= e!772088 e!772087)))

(declare-fun res!905168 () Bool)

(assert (=> b!1360957 (=> res!905168 e!772087)))

(assert (=> b!1360957 (= res!905168 (= (h!32976 lt!600013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360958 () Bool)

(assert (=> b!1360958 (= e!772087 (contains!9480 (t!46450 lt!600013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145749 res!905167) b!1360957))

(assert (= (and b!1360957 (not res!905168)) b!1360958))

(assert (=> d!145749 m!1246157))

(declare-fun m!1246163 () Bool)

(assert (=> d!145749 m!1246163))

(declare-fun m!1246165 () Bool)

(assert (=> b!1360958 m!1246165))

(assert (=> b!1360895 d!145749))

(declare-fun b!1360969 () Bool)

(declare-fun e!772100 () Bool)

(declare-fun call!65345 () Bool)

(assert (=> b!1360969 (= e!772100 call!65345)))

(declare-fun d!145751 () Bool)

(declare-fun res!905175 () Bool)

(declare-fun e!772099 () Bool)

(assert (=> d!145751 (=> res!905175 e!772099)))

(assert (=> d!145751 (= res!905175 (bvsge #b00000000000000000000000000000000 (size!45280 a!3742)))))

(assert (=> d!145751 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31768) e!772099)))

(declare-fun b!1360970 () Bool)

(declare-fun e!772097 () Bool)

(assert (=> b!1360970 (= e!772097 e!772100)))

(declare-fun c!127337 () Bool)

(assert (=> b!1360970 (= c!127337 (validKeyInArray!0 (select (arr!44730 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360971 () Bool)

(assert (=> b!1360971 (= e!772099 e!772097)))

(declare-fun res!905176 () Bool)

(assert (=> b!1360971 (=> (not res!905176) (not e!772097))))

(declare-fun e!772098 () Bool)

(assert (=> b!1360971 (= res!905176 (not e!772098))))

(declare-fun res!905177 () Bool)

(assert (=> b!1360971 (=> (not res!905177) (not e!772098))))

(assert (=> b!1360971 (= res!905177 (validKeyInArray!0 (select (arr!44730 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360972 () Bool)

(assert (=> b!1360972 (= e!772098 (contains!9480 Nil!31768 (select (arr!44730 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360973 () Bool)

(assert (=> b!1360973 (= e!772100 call!65345)))

(declare-fun bm!65342 () Bool)

(assert (=> bm!65342 (= call!65345 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127337 (Cons!31767 (select (arr!44730 a!3742) #b00000000000000000000000000000000) Nil!31768) Nil!31768)))))

(assert (= (and d!145751 (not res!905175)) b!1360971))

(assert (= (and b!1360971 res!905177) b!1360972))

(assert (= (and b!1360971 res!905176) b!1360970))

(assert (= (and b!1360970 c!127337) b!1360969))

(assert (= (and b!1360970 (not c!127337)) b!1360973))

(assert (= (or b!1360969 b!1360973) bm!65342))

(declare-fun m!1246167 () Bool)

(assert (=> b!1360970 m!1246167))

(assert (=> b!1360970 m!1246167))

(declare-fun m!1246169 () Bool)

(assert (=> b!1360970 m!1246169))

(assert (=> b!1360971 m!1246167))

(assert (=> b!1360971 m!1246167))

(assert (=> b!1360971 m!1246169))

(assert (=> b!1360972 m!1246167))

(assert (=> b!1360972 m!1246167))

(declare-fun m!1246171 () Bool)

(assert (=> b!1360972 m!1246171))

(assert (=> bm!65342 m!1246167))

(declare-fun m!1246173 () Bool)

(assert (=> bm!65342 m!1246173))

(assert (=> b!1360896 d!145751))

(declare-fun d!145753 () Bool)

(declare-fun res!905178 () Bool)

(declare-fun e!772101 () Bool)

(assert (=> d!145753 (=> res!905178 e!772101)))

(assert (=> d!145753 (= res!905178 ((_ is Nil!31768) lt!600013))))

(assert (=> d!145753 (= (noDuplicate!2337 lt!600013) e!772101)))

(declare-fun b!1360974 () Bool)

(declare-fun e!772102 () Bool)

(assert (=> b!1360974 (= e!772101 e!772102)))

(declare-fun res!905179 () Bool)

(assert (=> b!1360974 (=> (not res!905179) (not e!772102))))

(assert (=> b!1360974 (= res!905179 (not (contains!9480 (t!46450 lt!600013) (h!32976 lt!600013))))))

(declare-fun b!1360975 () Bool)

(assert (=> b!1360975 (= e!772102 (noDuplicate!2337 (t!46450 lt!600013)))))

(assert (= (and d!145753 (not res!905178)) b!1360974))

(assert (= (and b!1360974 res!905179) b!1360975))

(declare-fun m!1246175 () Bool)

(assert (=> b!1360974 m!1246175))

(declare-fun m!1246177 () Bool)

(assert (=> b!1360975 m!1246177))

(assert (=> b!1360883 d!145753))

(declare-fun d!145757 () Bool)

(declare-fun lt!600034 () Bool)

(assert (=> d!145757 (= lt!600034 (select (content!693 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772104 () Bool)

(assert (=> d!145757 (= lt!600034 e!772104)))

(declare-fun res!905180 () Bool)

(assert (=> d!145757 (=> (not res!905180) (not e!772104))))

(assert (=> d!145757 (= res!905180 ((_ is Cons!31767) acc!759))))

(assert (=> d!145757 (= (contains!9480 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600034)))

(declare-fun b!1360976 () Bool)

(declare-fun e!772103 () Bool)

(assert (=> b!1360976 (= e!772104 e!772103)))

(declare-fun res!905181 () Bool)

(assert (=> b!1360976 (=> res!905181 e!772103)))

(assert (=> b!1360976 (= res!905181 (= (h!32976 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360977 () Bool)

(assert (=> b!1360977 (= e!772103 (contains!9480 (t!46450 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145757 res!905180) b!1360976))

(assert (= (and b!1360976 (not res!905181)) b!1360977))

(assert (=> d!145757 m!1246147))

(declare-fun m!1246179 () Bool)

(assert (=> d!145757 m!1246179))

(declare-fun m!1246181 () Bool)

(assert (=> b!1360977 m!1246181))

(assert (=> b!1360884 d!145757))

(declare-fun d!145761 () Bool)

(assert (=> d!145761 (= (array_inv!33758 a!3742) (bvsge (size!45280 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114748 d!145761))

(declare-fun d!145763 () Bool)

(assert (=> d!145763 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600043 () Unit!44850)

(declare-fun choose!80 (array!92585 List!31771 List!31771 (_ BitVec 32)) Unit!44850)

(assert (=> d!145763 (= lt!600043 (choose!80 a!3742 ($colon$colon!885 acc!759 (select (arr!44730 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145763 (bvslt (size!45280 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145763 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!885 acc!759 (select (arr!44730 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600043)))

(declare-fun bs!39027 () Bool)

(assert (= bs!39027 d!145763))

(assert (=> bs!39027 m!1246107))

(assert (=> bs!39027 m!1246087))

(declare-fun m!1246191 () Bool)

(assert (=> bs!39027 m!1246191))

(assert (=> b!1360887 d!145763))

(declare-fun b!1361017 () Bool)

(declare-fun e!772143 () Bool)

(declare-fun e!772141 () Bool)

(assert (=> b!1361017 (= e!772143 e!772141)))

(declare-fun res!905219 () Bool)

(assert (=> b!1361017 (=> res!905219 e!772141)))

(declare-fun e!772142 () Bool)

(assert (=> b!1361017 (= res!905219 e!772142)))

(declare-fun res!905217 () Bool)

(assert (=> b!1361017 (=> (not res!905217) (not e!772142))))

(assert (=> b!1361017 (= res!905217 (= (h!32976 acc!759) (h!32976 acc!759)))))

(declare-fun b!1361019 () Bool)

(assert (=> b!1361019 (= e!772141 (subseq!882 acc!759 (t!46450 acc!759)))))

(declare-fun b!1361016 () Bool)

(declare-fun e!772144 () Bool)

(assert (=> b!1361016 (= e!772144 e!772143)))

(declare-fun res!905216 () Bool)

(assert (=> b!1361016 (=> (not res!905216) (not e!772143))))

(assert (=> b!1361016 (= res!905216 ((_ is Cons!31767) acc!759))))

(declare-fun b!1361018 () Bool)

(assert (=> b!1361018 (= e!772142 (subseq!882 (t!46450 acc!759) (t!46450 acc!759)))))

(declare-fun d!145767 () Bool)

(declare-fun res!905218 () Bool)

(assert (=> d!145767 (=> res!905218 e!772144)))

(assert (=> d!145767 (= res!905218 ((_ is Nil!31768) acc!759))))

(assert (=> d!145767 (= (subseq!882 acc!759 acc!759) e!772144)))

(assert (= (and d!145767 (not res!905218)) b!1361016))

(assert (= (and b!1361016 res!905216) b!1361017))

(assert (= (and b!1361017 res!905217) b!1361018))

(assert (= (and b!1361017 (not res!905219)) b!1361019))

(declare-fun m!1246207 () Bool)

(assert (=> b!1361019 m!1246207))

(declare-fun m!1246209 () Bool)

(assert (=> b!1361018 m!1246209))

(assert (=> b!1360887 d!145767))

(declare-fun b!1361020 () Bool)

(declare-fun e!772148 () Bool)

(declare-fun call!65348 () Bool)

(assert (=> b!1361020 (= e!772148 call!65348)))

(declare-fun d!145777 () Bool)

(declare-fun res!905220 () Bool)

(declare-fun e!772147 () Bool)

(assert (=> d!145777 (=> res!905220 e!772147)))

(assert (=> d!145777 (= res!905220 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45280 a!3742)))))

(assert (=> d!145777 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772147)))

(declare-fun b!1361021 () Bool)

(declare-fun e!772145 () Bool)

(assert (=> b!1361021 (= e!772145 e!772148)))

(declare-fun c!127340 () Bool)

(assert (=> b!1361021 (= c!127340 (validKeyInArray!0 (select (arr!44730 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361022 () Bool)

(assert (=> b!1361022 (= e!772147 e!772145)))

(declare-fun res!905221 () Bool)

(assert (=> b!1361022 (=> (not res!905221) (not e!772145))))

(declare-fun e!772146 () Bool)

(assert (=> b!1361022 (= res!905221 (not e!772146))))

(declare-fun res!905222 () Bool)

(assert (=> b!1361022 (=> (not res!905222) (not e!772146))))

(assert (=> b!1361022 (= res!905222 (validKeyInArray!0 (select (arr!44730 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361023 () Bool)

(assert (=> b!1361023 (= e!772146 (contains!9480 acc!759 (select (arr!44730 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361024 () Bool)

(assert (=> b!1361024 (= e!772148 call!65348)))

(declare-fun bm!65345 () Bool)

(assert (=> bm!65345 (= call!65348 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127340 (Cons!31767 (select (arr!44730 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(assert (= (and d!145777 (not res!905220)) b!1361022))

(assert (= (and b!1361022 res!905222) b!1361023))

(assert (= (and b!1361022 res!905221) b!1361021))

(assert (= (and b!1361021 c!127340) b!1361020))

(assert (= (and b!1361021 (not c!127340)) b!1361024))

(assert (= (or b!1361020 b!1361024) bm!65345))

(declare-fun m!1246211 () Bool)

(assert (=> b!1361021 m!1246211))

(assert (=> b!1361021 m!1246211))

(declare-fun m!1246213 () Bool)

(assert (=> b!1361021 m!1246213))

(assert (=> b!1361022 m!1246211))

(assert (=> b!1361022 m!1246211))

(assert (=> b!1361022 m!1246213))

(assert (=> b!1361023 m!1246211))

(assert (=> b!1361023 m!1246211))

(declare-fun m!1246215 () Bool)

(assert (=> b!1361023 m!1246215))

(assert (=> bm!65345 m!1246211))

(declare-fun m!1246217 () Bool)

(assert (=> bm!65345 m!1246217))

(assert (=> b!1360887 d!145777))

(assert (=> b!1360887 d!145743))

(declare-fun d!145779 () Bool)

(assert (=> d!145779 (subseq!882 acc!759 acc!759)))

(declare-fun lt!600050 () Unit!44850)

(declare-fun choose!36 (List!31771) Unit!44850)

(assert (=> d!145779 (= lt!600050 (choose!36 acc!759))))

(assert (=> d!145779 (= (lemmaListSubSeqRefl!0 acc!759) lt!600050)))

(declare-fun bs!39029 () Bool)

(assert (= bs!39029 d!145779))

(assert (=> bs!39029 m!1246109))

(declare-fun m!1246223 () Bool)

(assert (=> bs!39029 m!1246223))

(assert (=> b!1360887 d!145779))

(declare-fun b!1361030 () Bool)

(declare-fun e!772156 () Bool)

(declare-fun call!65350 () Bool)

(assert (=> b!1361030 (= e!772156 call!65350)))

(declare-fun d!145783 () Bool)

(declare-fun res!905226 () Bool)

(declare-fun e!772155 () Bool)

(assert (=> d!145783 (=> res!905226 e!772155)))

(assert (=> d!145783 (= res!905226 (bvsge from!3120 (size!45280 a!3742)))))

(assert (=> d!145783 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772155)))

(declare-fun b!1361031 () Bool)

(declare-fun e!772153 () Bool)

(assert (=> b!1361031 (= e!772153 e!772156)))

(declare-fun c!127342 () Bool)

(assert (=> b!1361031 (= c!127342 (validKeyInArray!0 (select (arr!44730 a!3742) from!3120)))))

(declare-fun b!1361032 () Bool)

(assert (=> b!1361032 (= e!772155 e!772153)))

(declare-fun res!905227 () Bool)

(assert (=> b!1361032 (=> (not res!905227) (not e!772153))))

(declare-fun e!772154 () Bool)

(assert (=> b!1361032 (= res!905227 (not e!772154))))

(declare-fun res!905228 () Bool)

(assert (=> b!1361032 (=> (not res!905228) (not e!772154))))

(assert (=> b!1361032 (= res!905228 (validKeyInArray!0 (select (arr!44730 a!3742) from!3120)))))

(declare-fun b!1361033 () Bool)

(assert (=> b!1361033 (= e!772154 (contains!9480 acc!759 (select (arr!44730 a!3742) from!3120)))))

(declare-fun b!1361034 () Bool)

(assert (=> b!1361034 (= e!772156 call!65350)))

(declare-fun bm!65347 () Bool)

(assert (=> bm!65347 (= call!65350 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127342 (Cons!31767 (select (arr!44730 a!3742) from!3120) acc!759) acc!759)))))

(assert (= (and d!145783 (not res!905226)) b!1361032))

(assert (= (and b!1361032 res!905228) b!1361033))

(assert (= (and b!1361032 res!905227) b!1361031))

(assert (= (and b!1361031 c!127342) b!1361030))

(assert (= (and b!1361031 (not c!127342)) b!1361034))

(assert (= (or b!1361030 b!1361034) bm!65347))

(assert (=> b!1361031 m!1246085))

(assert (=> b!1361031 m!1246085))

(assert (=> b!1361031 m!1246093))

(assert (=> b!1361032 m!1246085))

(assert (=> b!1361032 m!1246085))

(assert (=> b!1361032 m!1246093))

(assert (=> b!1361033 m!1246085))

(assert (=> b!1361033 m!1246085))

(declare-fun m!1246237 () Bool)

(assert (=> b!1361033 m!1246237))

(assert (=> bm!65347 m!1246085))

(declare-fun m!1246239 () Bool)

(assert (=> bm!65347 m!1246239))

(assert (=> b!1360888 d!145783))

(declare-fun d!145789 () Bool)

(assert (=> d!145789 (= (validKeyInArray!0 (select (arr!44730 a!3742) from!3120)) (and (not (= (select (arr!44730 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44730 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360897 d!145789))

(check-sat (not d!145749) (not d!145779) (not d!145763) (not b!1360971) (not b!1361033) (not d!145739) (not bm!65342) (not b!1360970) (not b!1360975) (not b!1360948) (not b!1360972) (not b!1361031) (not b!1360977) (not b!1361022) (not d!145757) (not bm!65347) (not d!145747) (not b!1360953) (not b!1360956) (not b!1360974) (not b!1361019) (not b!1361021) (not bm!65345) (not b!1360958) (not b!1361032) (not b!1360954) (not b!1361018) (not b!1361023))
(check-sat)
