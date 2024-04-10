; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114896 () Bool)

(assert start!114896)

(declare-fun b!1362207 () Bool)

(declare-fun res!906243 () Bool)

(declare-fun e!772679 () Bool)

(assert (=> b!1362207 (=> (not res!906243) (not e!772679))))

(declare-datatypes ((List!31791 0))(
  ( (Nil!31788) (Cons!31787 (h!32996 (_ BitVec 64)) (t!46476 List!31791)) )
))
(declare-fun lt!600422 () List!31791)

(declare-fun contains!9500 (List!31791 (_ BitVec 64)) Bool)

(assert (=> b!1362207 (= res!906243 (not (contains!9500 lt!600422 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362208 () Bool)

(declare-fun res!906239 () Bool)

(assert (=> b!1362208 (=> (not res!906239) (not e!772679))))

(declare-fun noDuplicate!2357 (List!31791) Bool)

(assert (=> b!1362208 (= res!906239 (noDuplicate!2357 lt!600422))))

(declare-fun b!1362209 () Bool)

(declare-fun res!906246 () Bool)

(declare-fun e!772677 () Bool)

(assert (=> b!1362209 (=> (not res!906246) (not e!772677))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362209 (= res!906246 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362210 () Bool)

(declare-fun res!906250 () Bool)

(assert (=> b!1362210 (=> (not res!906250) (not e!772677))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92631 0))(
  ( (array!92632 (arr!44750 (Array (_ BitVec 32) (_ BitVec 64))) (size!45300 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92631)

(assert (=> b!1362210 (= res!906250 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45300 a!3742)))))

(declare-fun b!1362211 () Bool)

(declare-fun e!772680 () Bool)

(assert (=> b!1362211 (= e!772677 e!772680)))

(declare-fun res!906242 () Bool)

(assert (=> b!1362211 (=> (not res!906242) (not e!772680))))

(declare-fun lt!600426 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362211 (= res!906242 (and (not (= from!3120 i!1404)) lt!600426))))

(declare-datatypes ((Unit!44910 0))(
  ( (Unit!44911) )
))
(declare-fun lt!600425 () Unit!44910)

(declare-fun e!772681 () Unit!44910)

(assert (=> b!1362211 (= lt!600425 e!772681)))

(declare-fun c!127424 () Bool)

(assert (=> b!1362211 (= c!127424 lt!600426)))

(assert (=> b!1362211 (= lt!600426 (validKeyInArray!0 (select (arr!44750 a!3742) from!3120)))))

(declare-fun b!1362212 () Bool)

(declare-fun res!906248 () Bool)

(assert (=> b!1362212 (=> (not res!906248) (not e!772677))))

(assert (=> b!1362212 (= res!906248 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45300 a!3742))))))

(declare-fun b!1362213 () Bool)

(declare-fun res!906253 () Bool)

(assert (=> b!1362213 (=> (not res!906253) (not e!772679))))

(declare-fun arrayNoDuplicates!0 (array!92631 (_ BitVec 32) List!31791) Bool)

(assert (=> b!1362213 (= res!906253 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600422))))

(declare-fun b!1362214 () Bool)

(assert (=> b!1362214 (= e!772680 e!772679)))

(declare-fun res!906240 () Bool)

(assert (=> b!1362214 (=> (not res!906240) (not e!772679))))

(assert (=> b!1362214 (= res!906240 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun acc!759 () List!31791)

(declare-fun $colon$colon!905 (List!31791 (_ BitVec 64)) List!31791)

(assert (=> b!1362214 (= lt!600422 ($colon$colon!905 acc!759 (select (arr!44750 a!3742) from!3120)))))

(declare-fun b!1362215 () Bool)

(declare-fun res!906241 () Bool)

(assert (=> b!1362215 (=> (not res!906241) (not e!772677))))

(assert (=> b!1362215 (= res!906241 (noDuplicate!2357 acc!759))))

(declare-fun b!1362216 () Bool)

(declare-fun res!906252 () Bool)

(assert (=> b!1362216 (=> (not res!906252) (not e!772677))))

(assert (=> b!1362216 (= res!906252 (not (contains!9500 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362217 () Bool)

(declare-fun lt!600423 () Unit!44910)

(assert (=> b!1362217 (= e!772681 lt!600423)))

(declare-fun lt!600427 () Unit!44910)

(declare-fun lemmaListSubSeqRefl!0 (List!31791) Unit!44910)

(assert (=> b!1362217 (= lt!600427 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!902 (List!31791 List!31791) Bool)

(assert (=> b!1362217 (subseq!902 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92631 List!31791 List!31791 (_ BitVec 32)) Unit!44910)

(assert (=> b!1362217 (= lt!600423 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!905 acc!759 (select (arr!44750 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362217 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!906244 () Bool)

(assert (=> start!114896 (=> (not res!906244) (not e!772677))))

(assert (=> start!114896 (= res!906244 (and (bvslt (size!45300 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45300 a!3742))))))

(assert (=> start!114896 e!772677))

(assert (=> start!114896 true))

(declare-fun array_inv!33778 (array!92631) Bool)

(assert (=> start!114896 (array_inv!33778 a!3742)))

(declare-fun b!1362218 () Bool)

(declare-fun res!906251 () Bool)

(assert (=> b!1362218 (=> (not res!906251) (not e!772677))))

(assert (=> b!1362218 (= res!906251 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31788))))

(declare-fun b!1362219 () Bool)

(declare-fun Unit!44912 () Unit!44910)

(assert (=> b!1362219 (= e!772681 Unit!44912)))

(declare-fun lt!600421 () array!92631)

(declare-fun b!1362220 () Bool)

(assert (=> b!1362220 (= e!772679 (not (arrayNoDuplicates!0 lt!600421 from!3120 acc!759)))))

(assert (=> b!1362220 (arrayNoDuplicates!0 lt!600421 (bvadd #b00000000000000000000000000000001 from!3120) lt!600422)))

(assert (=> b!1362220 (= lt!600421 (array!92632 (store (arr!44750 a!3742) i!1404 l!3587) (size!45300 a!3742)))))

(declare-fun lt!600424 () Unit!44910)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92631 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31791) Unit!44910)

(assert (=> b!1362220 (= lt!600424 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600422))))

(declare-fun b!1362221 () Bool)

(declare-fun res!906245 () Bool)

(assert (=> b!1362221 (=> (not res!906245) (not e!772679))))

(assert (=> b!1362221 (= res!906245 (not (contains!9500 lt!600422 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362222 () Bool)

(declare-fun res!906249 () Bool)

(assert (=> b!1362222 (=> (not res!906249) (not e!772677))))

(assert (=> b!1362222 (= res!906249 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362223 () Bool)

(declare-fun res!906247 () Bool)

(assert (=> b!1362223 (=> (not res!906247) (not e!772677))))

(assert (=> b!1362223 (= res!906247 (not (contains!9500 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114896 res!906244) b!1362215))

(assert (= (and b!1362215 res!906241) b!1362216))

(assert (= (and b!1362216 res!906252) b!1362223))

(assert (= (and b!1362223 res!906247) b!1362218))

(assert (= (and b!1362218 res!906251) b!1362222))

(assert (= (and b!1362222 res!906249) b!1362212))

(assert (= (and b!1362212 res!906248) b!1362209))

(assert (= (and b!1362209 res!906246) b!1362210))

(assert (= (and b!1362210 res!906250) b!1362211))

(assert (= (and b!1362211 c!127424) b!1362217))

(assert (= (and b!1362211 (not c!127424)) b!1362219))

(assert (= (and b!1362211 res!906242) b!1362214))

(assert (= (and b!1362214 res!906240) b!1362208))

(assert (= (and b!1362208 res!906239) b!1362221))

(assert (= (and b!1362221 res!906245) b!1362207))

(assert (= (and b!1362207 res!906243) b!1362213))

(assert (= (and b!1362213 res!906253) b!1362220))

(declare-fun m!1247155 () Bool)

(assert (=> b!1362223 m!1247155))

(declare-fun m!1247157 () Bool)

(assert (=> start!114896 m!1247157))

(declare-fun m!1247159 () Bool)

(assert (=> b!1362213 m!1247159))

(declare-fun m!1247161 () Bool)

(assert (=> b!1362211 m!1247161))

(assert (=> b!1362211 m!1247161))

(declare-fun m!1247163 () Bool)

(assert (=> b!1362211 m!1247163))

(declare-fun m!1247165 () Bool)

(assert (=> b!1362222 m!1247165))

(declare-fun m!1247167 () Bool)

(assert (=> b!1362216 m!1247167))

(declare-fun m!1247169 () Bool)

(assert (=> b!1362209 m!1247169))

(declare-fun m!1247171 () Bool)

(assert (=> b!1362217 m!1247171))

(assert (=> b!1362217 m!1247161))

(declare-fun m!1247173 () Bool)

(assert (=> b!1362217 m!1247173))

(declare-fun m!1247175 () Bool)

(assert (=> b!1362217 m!1247175))

(declare-fun m!1247177 () Bool)

(assert (=> b!1362217 m!1247177))

(assert (=> b!1362217 m!1247161))

(assert (=> b!1362217 m!1247173))

(declare-fun m!1247179 () Bool)

(assert (=> b!1362217 m!1247179))

(assert (=> b!1362214 m!1247161))

(assert (=> b!1362214 m!1247161))

(assert (=> b!1362214 m!1247173))

(declare-fun m!1247181 () Bool)

(assert (=> b!1362207 m!1247181))

(declare-fun m!1247183 () Bool)

(assert (=> b!1362215 m!1247183))

(declare-fun m!1247185 () Bool)

(assert (=> b!1362218 m!1247185))

(declare-fun m!1247187 () Bool)

(assert (=> b!1362220 m!1247187))

(declare-fun m!1247189 () Bool)

(assert (=> b!1362220 m!1247189))

(declare-fun m!1247191 () Bool)

(assert (=> b!1362220 m!1247191))

(declare-fun m!1247193 () Bool)

(assert (=> b!1362220 m!1247193))

(declare-fun m!1247195 () Bool)

(assert (=> b!1362221 m!1247195))

(declare-fun m!1247197 () Bool)

(assert (=> b!1362208 m!1247197))

(push 1)

(assert (not b!1362218))

(assert (not b!1362221))

(assert (not b!1362217))

(assert (not b!1362208))

(assert (not b!1362209))

(assert (not b!1362213))

(assert (not b!1362220))

(assert (not b!1362207))

(assert (not b!1362214))

(assert (not b!1362211))

(assert (not b!1362216))

(assert (not b!1362222))

(assert (not b!1362223))

(assert (not b!1362215))

(assert (not start!114896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145961 () Bool)

(declare-fun res!906366 () Bool)

(declare-fun e!772738 () Bool)

(assert (=> d!145961 (=> res!906366 e!772738)))

(assert (=> d!145961 (= res!906366 (is-Nil!31788 lt!600422))))

(assert (=> d!145961 (= (noDuplicate!2357 lt!600422) e!772738)))

(declare-fun b!1362356 () Bool)

(declare-fun e!772739 () Bool)

(assert (=> b!1362356 (= e!772738 e!772739)))

(declare-fun res!906367 () Bool)

(assert (=> b!1362356 (=> (not res!906367) (not e!772739))))

(assert (=> b!1362356 (= res!906367 (not (contains!9500 (t!46476 lt!600422) (h!32996 lt!600422))))))

(declare-fun b!1362357 () Bool)

(assert (=> b!1362357 (= e!772739 (noDuplicate!2357 (t!46476 lt!600422)))))

(assert (= (and d!145961 (not res!906366)) b!1362356))

(assert (= (and b!1362356 res!906367) b!1362357))

(declare-fun m!1247307 () Bool)

(assert (=> b!1362356 m!1247307))

(declare-fun m!1247309 () Bool)

(assert (=> b!1362357 m!1247309))

(assert (=> b!1362208 d!145961))

(declare-fun b!1362370 () Bool)

(declare-fun e!772753 () Bool)

(declare-fun e!772751 () Bool)

(assert (=> b!1362370 (= e!772753 e!772751)))

(declare-fun c!127437 () Bool)

(assert (=> b!1362370 (= c!127437 (validKeyInArray!0 (select (arr!44750 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1362372 () Bool)

(declare-fun call!65382 () Bool)

(assert (=> b!1362372 (= e!772751 call!65382)))

(declare-fun b!1362373 () Bool)

(declare-fun e!772750 () Bool)

(assert (=> b!1362373 (= e!772750 e!772753)))

(declare-fun res!906378 () Bool)

(assert (=> b!1362373 (=> (not res!906378) (not e!772753))))

(declare-fun e!772752 () Bool)

(assert (=> b!1362373 (= res!906378 (not e!772752))))

(declare-fun res!906376 () Bool)

(assert (=> b!1362373 (=> (not res!906376) (not e!772752))))

(assert (=> b!1362373 (= res!906376 (validKeyInArray!0 (select (arr!44750 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1362374 () Bool)

(assert (=> b!1362374 (= e!772751 call!65382)))

(declare-fun bm!65379 () Bool)

(assert (=> bm!65379 (= call!65382 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127437 (Cons!31787 (select (arr!44750 a!3742) #b00000000000000000000000000000000) Nil!31788) Nil!31788)))))

(declare-fun d!145965 () Bool)

(declare-fun res!906377 () Bool)

(assert (=> d!145965 (=> res!906377 e!772750)))

(assert (=> d!145965 (= res!906377 (bvsge #b00000000000000000000000000000000 (size!45300 a!3742)))))

(assert (=> d!145965 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31788) e!772750)))

(declare-fun b!1362371 () Bool)

(assert (=> b!1362371 (= e!772752 (contains!9500 Nil!31788 (select (arr!44750 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145965 (not res!906377)) b!1362373))

(assert (= (and b!1362373 res!906376) b!1362371))

(assert (= (and b!1362373 res!906378) b!1362370))

(assert (= (and b!1362370 c!127437) b!1362372))

(assert (= (and b!1362370 (not c!127437)) b!1362374))

(assert (= (or b!1362372 b!1362374) bm!65379))

(declare-fun m!1247311 () Bool)

(assert (=> b!1362370 m!1247311))

(assert (=> b!1362370 m!1247311))

(declare-fun m!1247313 () Bool)

(assert (=> b!1362370 m!1247313))

(assert (=> b!1362373 m!1247311))

(assert (=> b!1362373 m!1247311))

(assert (=> b!1362373 m!1247313))

(assert (=> bm!65379 m!1247311))

(declare-fun m!1247315 () Bool)

(assert (=> bm!65379 m!1247315))

(assert (=> b!1362371 m!1247311))

(assert (=> b!1362371 m!1247311))

(declare-fun m!1247319 () Bool)

(assert (=> b!1362371 m!1247319))

(assert (=> b!1362218 d!145965))

(declare-fun d!145967 () Bool)

(declare-fun lt!600475 () Bool)

(declare-fun content!699 (List!31791) (Set (_ BitVec 64)))

(assert (=> d!145967 (= lt!600475 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!699 lt!600422)))))

(declare-fun e!772764 () Bool)

(assert (=> d!145967 (= lt!600475 e!772764)))

(declare-fun res!906388 () Bool)

(assert (=> d!145967 (=> (not res!906388) (not e!772764))))

(assert (=> d!145967 (= res!906388 (is-Cons!31787 lt!600422))))

(assert (=> d!145967 (= (contains!9500 lt!600422 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600475)))

(declare-fun b!1362385 () Bool)

(declare-fun e!772763 () Bool)

(assert (=> b!1362385 (= e!772764 e!772763)))

(declare-fun res!906387 () Bool)

(assert (=> b!1362385 (=> res!906387 e!772763)))

(assert (=> b!1362385 (= res!906387 (= (h!32996 lt!600422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362386 () Bool)

(assert (=> b!1362386 (= e!772763 (contains!9500 (t!46476 lt!600422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145967 res!906388) b!1362385))

(assert (= (and b!1362385 (not res!906387)) b!1362386))

(declare-fun m!1247327 () Bool)

(assert (=> d!145967 m!1247327))

(declare-fun m!1247329 () Bool)

(assert (=> d!145967 m!1247329))

(declare-fun m!1247331 () Bool)

(assert (=> b!1362386 m!1247331))

(assert (=> b!1362207 d!145967))

(declare-fun d!145975 () Bool)

(assert (=> d!145975 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600480 () Unit!44910)

(declare-fun choose!80 (array!92631 List!31791 List!31791 (_ BitVec 32)) Unit!44910)

(assert (=> d!145975 (= lt!600480 (choose!80 a!3742 ($colon$colon!905 acc!759 (select (arr!44750 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145975 (bvslt (size!45300 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145975 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!905 acc!759 (select (arr!44750 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600480)))

(declare-fun bs!39060 () Bool)

(assert (= bs!39060 d!145975))

(assert (=> bs!39060 m!1247177))

(assert (=> bs!39060 m!1247173))

(declare-fun m!1247333 () Bool)

(assert (=> bs!39060 m!1247333))

(assert (=> b!1362217 d!145975))

(declare-fun b!1362403 () Bool)

(declare-fun e!772780 () Bool)

(assert (=> b!1362403 (= e!772780 (subseq!902 (t!46476 acc!759) (t!46476 acc!759)))))

(declare-fun b!1362402 () Bool)

(declare-fun e!772781 () Bool)

(declare-fun e!772779 () Bool)

(assert (=> b!1362402 (= e!772781 e!772779)))

(declare-fun res!906405 () Bool)

(assert (=> b!1362402 (=> res!906405 e!772779)))

(assert (=> b!1362402 (= res!906405 e!772780)))

(declare-fun res!906404 () Bool)

(assert (=> b!1362402 (=> (not res!906404) (not e!772780))))

(assert (=> b!1362402 (= res!906404 (= (h!32996 acc!759) (h!32996 acc!759)))))

(declare-fun b!1362404 () Bool)

(assert (=> b!1362404 (= e!772779 (subseq!902 acc!759 (t!46476 acc!759)))))

(declare-fun d!145977 () Bool)

(declare-fun res!906406 () Bool)

(declare-fun e!772782 () Bool)

(assert (=> d!145977 (=> res!906406 e!772782)))

(assert (=> d!145977 (= res!906406 (is-Nil!31788 acc!759))))

(assert (=> d!145977 (= (subseq!902 acc!759 acc!759) e!772782)))

(declare-fun b!1362401 () Bool)

(assert (=> b!1362401 (= e!772782 e!772781)))

(declare-fun res!906403 () Bool)

(assert (=> b!1362401 (=> (not res!906403) (not e!772781))))

(assert (=> b!1362401 (= res!906403 (is-Cons!31787 acc!759))))

(assert (= (and d!145977 (not res!906406)) b!1362401))

(assert (= (and b!1362401 res!906403) b!1362402))

(assert (= (and b!1362402 res!906404) b!1362403))

(assert (= (and b!1362402 (not res!906405)) b!1362404))

(declare-fun m!1247343 () Bool)

(assert (=> b!1362403 m!1247343))

(declare-fun m!1247345 () Bool)

(assert (=> b!1362404 m!1247345))

(assert (=> b!1362217 d!145977))

(declare-fun b!1362409 () Bool)

(declare-fun e!772790 () Bool)

(declare-fun e!772788 () Bool)

(assert (=> b!1362409 (= e!772790 e!772788)))

(declare-fun c!127439 () Bool)

(assert (=> b!1362409 (= c!127439 (validKeyInArray!0 (select (arr!44750 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362411 () Bool)

(declare-fun call!65384 () Bool)

(assert (=> b!1362411 (= e!772788 call!65384)))

(declare-fun b!1362412 () Bool)

(declare-fun e!772787 () Bool)

(assert (=> b!1362412 (= e!772787 e!772790)))

(declare-fun res!906413 () Bool)

(assert (=> b!1362412 (=> (not res!906413) (not e!772790))))

(declare-fun e!772789 () Bool)

(assert (=> b!1362412 (= res!906413 (not e!772789))))

(declare-fun res!906411 () Bool)

(assert (=> b!1362412 (=> (not res!906411) (not e!772789))))

(assert (=> b!1362412 (= res!906411 (validKeyInArray!0 (select (arr!44750 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362413 () Bool)

(assert (=> b!1362413 (= e!772788 call!65384)))

(declare-fun bm!65381 () Bool)

(assert (=> bm!65381 (= call!65384 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127439 (Cons!31787 (select (arr!44750 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun d!145985 () Bool)

(declare-fun res!906412 () Bool)

(assert (=> d!145985 (=> res!906412 e!772787)))

(assert (=> d!145985 (= res!906412 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45300 a!3742)))))

(assert (=> d!145985 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772787)))

(declare-fun b!1362410 () Bool)

(assert (=> b!1362410 (= e!772789 (contains!9500 acc!759 (select (arr!44750 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145985 (not res!906412)) b!1362412))

(assert (= (and b!1362412 res!906411) b!1362410))

(assert (= (and b!1362412 res!906413) b!1362409))

(assert (= (and b!1362409 c!127439) b!1362411))

(assert (= (and b!1362409 (not c!127439)) b!1362413))

(assert (= (or b!1362411 b!1362413) bm!65381))

(declare-fun m!1247347 () Bool)

(assert (=> b!1362409 m!1247347))

(assert (=> b!1362409 m!1247347))

(declare-fun m!1247349 () Bool)

(assert (=> b!1362409 m!1247349))

(assert (=> b!1362412 m!1247347))

(assert (=> b!1362412 m!1247347))

(assert (=> b!1362412 m!1247349))

(assert (=> bm!65381 m!1247347))

(declare-fun m!1247351 () Bool)

(assert (=> bm!65381 m!1247351))

(assert (=> b!1362410 m!1247347))

(assert (=> b!1362410 m!1247347))

(declare-fun m!1247353 () Bool)

(assert (=> b!1362410 m!1247353))

(assert (=> b!1362217 d!145985))

(declare-fun d!145987 () Bool)

(assert (=> d!145987 (= ($colon$colon!905 acc!759 (select (arr!44750 a!3742) from!3120)) (Cons!31787 (select (arr!44750 a!3742) from!3120) acc!759))))

(assert (=> b!1362217 d!145987))

(declare-fun d!145991 () Bool)

(assert (=> d!145991 (subseq!902 acc!759 acc!759)))

(declare-fun lt!600490 () Unit!44910)

(declare-fun choose!36 (List!31791) Unit!44910)

(assert (=> d!145991 (= lt!600490 (choose!36 acc!759))))

(assert (=> d!145991 (= (lemmaListSubSeqRefl!0 acc!759) lt!600490)))

(declare-fun bs!39062 () Bool)

(assert (= bs!39062 d!145991))

(assert (=> bs!39062 m!1247179))

(declare-fun m!1247361 () Bool)

(assert (=> bs!39062 m!1247361))

(assert (=> b!1362217 d!145991))

(declare-fun d!145997 () Bool)

(assert (=> d!145997 (= (array_inv!33778 a!3742) (bvsge (size!45300 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114896 d!145997))

(declare-fun d!146001 () Bool)

(declare-fun lt!600492 () Bool)

(assert (=> d!146001 (= lt!600492 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!699 acc!759)))))

(declare-fun e!772804 () Bool)

(assert (=> d!146001 (= lt!600492 e!772804)))

(declare-fun res!906427 () Bool)

(assert (=> d!146001 (=> (not res!906427) (not e!772804))))

(assert (=> d!146001 (= res!906427 (is-Cons!31787 acc!759))))

(assert (=> d!146001 (= (contains!9500 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600492)))

(declare-fun b!1362426 () Bool)

(declare-fun e!772803 () Bool)

(assert (=> b!1362426 (= e!772804 e!772803)))

(declare-fun res!906426 () Bool)

(assert (=> b!1362426 (=> res!906426 e!772803)))

(assert (=> b!1362426 (= res!906426 (= (h!32996 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362427 () Bool)

(assert (=> b!1362427 (= e!772803 (contains!9500 (t!46476 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146001 res!906427) b!1362426))

(assert (= (and b!1362426 (not res!906426)) b!1362427))

(declare-fun m!1247369 () Bool)

(assert (=> d!146001 m!1247369))

(declare-fun m!1247371 () Bool)

(assert (=> d!146001 m!1247371))

(declare-fun m!1247373 () Bool)

(assert (=> b!1362427 m!1247373))

(assert (=> b!1362216 d!146001))

(declare-fun d!146003 () Bool)

(declare-fun res!906432 () Bool)

(declare-fun e!772809 () Bool)

(assert (=> d!146003 (=> res!906432 e!772809)))

(assert (=> d!146003 (= res!906432 (is-Nil!31788 acc!759))))

(assert (=> d!146003 (= (noDuplicate!2357 acc!759) e!772809)))

(declare-fun b!1362432 () Bool)

(declare-fun e!772810 () Bool)

(assert (=> b!1362432 (= e!772809 e!772810)))

(declare-fun res!906433 () Bool)

(assert (=> b!1362432 (=> (not res!906433) (not e!772810))))

(assert (=> b!1362432 (= res!906433 (not (contains!9500 (t!46476 acc!759) (h!32996 acc!759))))))

(declare-fun b!1362433 () Bool)

(assert (=> b!1362433 (= e!772810 (noDuplicate!2357 (t!46476 acc!759)))))

(assert (= (and d!146003 (not res!906432)) b!1362432))

(assert (= (and b!1362432 res!906433) b!1362433))

(declare-fun m!1247375 () Bool)

(assert (=> b!1362432 m!1247375))

(declare-fun m!1247379 () Bool)

(assert (=> b!1362433 m!1247379))

(assert (=> b!1362215 d!146003))

(assert (=> b!1362214 d!145987))

(declare-fun b!1362434 () Bool)

(declare-fun e!772814 () Bool)

(declare-fun e!772812 () Bool)

(assert (=> b!1362434 (= e!772814 e!772812)))

(declare-fun c!127440 () Bool)

(assert (=> b!1362434 (= c!127440 (validKeyInArray!0 (select (arr!44750 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362436 () Bool)

(declare-fun call!65385 () Bool)

(assert (=> b!1362436 (= e!772812 call!65385)))

(declare-fun b!1362437 () Bool)

(declare-fun e!772811 () Bool)

(assert (=> b!1362437 (= e!772811 e!772814)))

(declare-fun res!906436 () Bool)

(assert (=> b!1362437 (=> (not res!906436) (not e!772814))))

(declare-fun e!772813 () Bool)

(assert (=> b!1362437 (= res!906436 (not e!772813))))

(declare-fun res!906434 () Bool)

(assert (=> b!1362437 (=> (not res!906434) (not e!772813))))

(assert (=> b!1362437 (= res!906434 (validKeyInArray!0 (select (arr!44750 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362438 () Bool)

(assert (=> b!1362438 (= e!772812 call!65385)))

(declare-fun bm!65382 () Bool)

(assert (=> bm!65382 (= call!65385 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127440 (Cons!31787 (select (arr!44750 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600422) lt!600422)))))

(declare-fun d!146005 () Bool)

(declare-fun res!906435 () Bool)

(assert (=> d!146005 (=> res!906435 e!772811)))

(assert (=> d!146005 (= res!906435 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45300 a!3742)))))

(assert (=> d!146005 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600422) e!772811)))

(declare-fun b!1362435 () Bool)

(assert (=> b!1362435 (= e!772813 (contains!9500 lt!600422 (select (arr!44750 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146005 (not res!906435)) b!1362437))

(assert (= (and b!1362437 res!906434) b!1362435))

(assert (= (and b!1362437 res!906436) b!1362434))

(assert (= (and b!1362434 c!127440) b!1362436))

(assert (= (and b!1362434 (not c!127440)) b!1362438))

(assert (= (or b!1362436 b!1362438) bm!65382))

(assert (=> b!1362434 m!1247347))

(assert (=> b!1362434 m!1247347))

(assert (=> b!1362434 m!1247349))

(assert (=> b!1362437 m!1247347))

(assert (=> b!1362437 m!1247347))

(assert (=> b!1362437 m!1247349))

(assert (=> bm!65382 m!1247347))

(declare-fun m!1247389 () Bool)

(assert (=> bm!65382 m!1247389))

(assert (=> b!1362435 m!1247347))

(assert (=> b!1362435 m!1247347))

(declare-fun m!1247393 () Bool)

(assert (=> b!1362435 m!1247393))

(assert (=> b!1362213 d!146005))

(declare-fun d!146009 () Bool)

(declare-fun lt!600493 () Bool)

(assert (=> d!146009 (= lt!600493 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!699 acc!759)))))

(declare-fun e!772820 () Bool)

(assert (=> d!146009 (= lt!600493 e!772820)))

(declare-fun res!906441 () Bool)

(assert (=> d!146009 (=> (not res!906441) (not e!772820))))

(assert (=> d!146009 (= res!906441 (is-Cons!31787 acc!759))))

(assert (=> d!146009 (= (contains!9500 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600493)))

(declare-fun b!1362444 () Bool)

(declare-fun e!772819 () Bool)

(assert (=> b!1362444 (= e!772820 e!772819)))

(declare-fun res!906440 () Bool)

(assert (=> b!1362444 (=> res!906440 e!772819)))

(assert (=> b!1362444 (= res!906440 (= (h!32996 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362445 () Bool)

(assert (=> b!1362445 (= e!772819 (contains!9500 (t!46476 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146009 res!906441) b!1362444))

(assert (= (and b!1362444 (not res!906440)) b!1362445))

(assert (=> d!146009 m!1247369))

(declare-fun m!1247395 () Bool)

(assert (=> d!146009 m!1247395))

(declare-fun m!1247397 () Bool)

(assert (=> b!1362445 m!1247397))

(assert (=> b!1362223 d!146009))

(declare-fun b!1362446 () Bool)

(declare-fun e!772824 () Bool)

(declare-fun e!772822 () Bool)

(assert (=> b!1362446 (= e!772824 e!772822)))

(declare-fun c!127442 () Bool)

(assert (=> b!1362446 (= c!127442 (validKeyInArray!0 (select (arr!44750 a!3742) from!3120)))))

(declare-fun b!1362448 () Bool)

(declare-fun call!65387 () Bool)

(assert (=> b!1362448 (= e!772822 call!65387)))

(declare-fun b!1362449 () Bool)

(declare-fun e!772821 () Bool)

(assert (=> b!1362449 (= e!772821 e!772824)))

(declare-fun res!906444 () Bool)

(assert (=> b!1362449 (=> (not res!906444) (not e!772824))))

(declare-fun e!772823 () Bool)

(assert (=> b!1362449 (= res!906444 (not e!772823))))

(declare-fun res!906442 () Bool)

(assert (=> b!1362449 (=> (not res!906442) (not e!772823))))

(assert (=> b!1362449 (= res!906442 (validKeyInArray!0 (select (arr!44750 a!3742) from!3120)))))

(declare-fun b!1362450 () Bool)

(assert (=> b!1362450 (= e!772822 call!65387)))

(declare-fun bm!65384 () Bool)

(assert (=> bm!65384 (= call!65387 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127442 (Cons!31787 (select (arr!44750 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!146013 () Bool)

(declare-fun res!906443 () Bool)

(assert (=> d!146013 (=> res!906443 e!772821)))

(assert (=> d!146013 (= res!906443 (bvsge from!3120 (size!45300 a!3742)))))

(assert (=> d!146013 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772821)))

(declare-fun b!1362447 () Bool)

(assert (=> b!1362447 (= e!772823 (contains!9500 acc!759 (select (arr!44750 a!3742) from!3120)))))

(assert (= (and d!146013 (not res!906443)) b!1362449))

(assert (= (and b!1362449 res!906442) b!1362447))

(assert (= (and b!1362449 res!906444) b!1362446))

(assert (= (and b!1362446 c!127442) b!1362448))

(assert (= (and b!1362446 (not c!127442)) b!1362450))

(assert (= (or b!1362448 b!1362450) bm!65384))

(assert (=> b!1362446 m!1247161))

(assert (=> b!1362446 m!1247161))

(assert (=> b!1362446 m!1247163))

(assert (=> b!1362449 m!1247161))

(assert (=> b!1362449 m!1247161))

(assert (=> b!1362449 m!1247163))

(assert (=> bm!65384 m!1247161))

(declare-fun m!1247399 () Bool)

(assert (=> bm!65384 m!1247399))

(assert (=> b!1362447 m!1247161))

(assert (=> b!1362447 m!1247161))

(declare-fun m!1247401 () Bool)

(assert (=> b!1362447 m!1247401))

(assert (=> b!1362222 d!146013))

(declare-fun d!146015 () Bool)

(assert (=> d!146015 (= (validKeyInArray!0 (select (arr!44750 a!3742) from!3120)) (and (not (= (select (arr!44750 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44750 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362211 d!146015))

(declare-fun d!146019 () Bool)

(declare-fun lt!600497 () Bool)

(assert (=> d!146019 (= lt!600497 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!699 lt!600422)))))

(declare-fun e!772838 () Bool)

(assert (=> d!146019 (= lt!600497 e!772838)))

(declare-fun res!906455 () Bool)

(assert (=> d!146019 (=> (not res!906455) (not e!772838))))

(assert (=> d!146019 (= res!906455 (is-Cons!31787 lt!600422))))

(assert (=> d!146019 (= (contains!9500 lt!600422 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600497)))

(declare-fun b!1362466 () Bool)

(declare-fun e!772837 () Bool)

(assert (=> b!1362466 (= e!772838 e!772837)))

(declare-fun res!906454 () Bool)

(assert (=> b!1362466 (=> res!906454 e!772837)))

(assert (=> b!1362466 (= res!906454 (= (h!32996 lt!600422) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362467 () Bool)

(assert (=> b!1362467 (= e!772837 (contains!9500 (t!46476 lt!600422) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146019 res!906455) b!1362466))

(assert (= (and b!1362466 (not res!906454)) b!1362467))

(assert (=> d!146019 m!1247327))

(declare-fun m!1247409 () Bool)

(assert (=> d!146019 m!1247409))

(declare-fun m!1247411 () Bool)

(assert (=> b!1362467 m!1247411))

(assert (=> b!1362221 d!146019))

(declare-fun b!1362470 () Bool)

(declare-fun e!772844 () Bool)

(declare-fun e!772842 () Bool)

(assert (=> b!1362470 (= e!772844 e!772842)))

(declare-fun c!127446 () Bool)

(assert (=> b!1362470 (= c!127446 (validKeyInArray!0 (select (arr!44750 lt!600421) from!3120)))))

(declare-fun b!1362472 () Bool)

(declare-fun call!65391 () Bool)

(assert (=> b!1362472 (= e!772842 call!65391)))

(declare-fun b!1362473 () Bool)

(declare-fun e!772841 () Bool)

(assert (=> b!1362473 (= e!772841 e!772844)))

(declare-fun res!906460 () Bool)

(assert (=> b!1362473 (=> (not res!906460) (not e!772844))))

(declare-fun e!772843 () Bool)

(assert (=> b!1362473 (= res!906460 (not e!772843))))

(declare-fun res!906458 () Bool)

(assert (=> b!1362473 (=> (not res!906458) (not e!772843))))

(assert (=> b!1362473 (= res!906458 (validKeyInArray!0 (select (arr!44750 lt!600421) from!3120)))))

(declare-fun b!1362474 () Bool)

(assert (=> b!1362474 (= e!772842 call!65391)))

(declare-fun bm!65388 () Bool)

(assert (=> bm!65388 (= call!65391 (arrayNoDuplicates!0 lt!600421 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127446 (Cons!31787 (select (arr!44750 lt!600421) from!3120) acc!759) acc!759)))))

(declare-fun d!146023 () Bool)

(declare-fun res!906459 () Bool)

(assert (=> d!146023 (=> res!906459 e!772841)))

(assert (=> d!146023 (= res!906459 (bvsge from!3120 (size!45300 lt!600421)))))

(assert (=> d!146023 (= (arrayNoDuplicates!0 lt!600421 from!3120 acc!759) e!772841)))

(declare-fun b!1362471 () Bool)

(assert (=> b!1362471 (= e!772843 (contains!9500 acc!759 (select (arr!44750 lt!600421) from!3120)))))

(assert (= (and d!146023 (not res!906459)) b!1362473))

(assert (= (and b!1362473 res!906458) b!1362471))

(assert (= (and b!1362473 res!906460) b!1362470))

(assert (= (and b!1362470 c!127446) b!1362472))

(assert (= (and b!1362470 (not c!127446)) b!1362474))

(assert (= (or b!1362472 b!1362474) bm!65388))

(declare-fun m!1247417 () Bool)

(assert (=> b!1362470 m!1247417))

(assert (=> b!1362470 m!1247417))

(declare-fun m!1247419 () Bool)

(assert (=> b!1362470 m!1247419))

(assert (=> b!1362473 m!1247417))

(assert (=> b!1362473 m!1247417))

(assert (=> b!1362473 m!1247419))

(assert (=> bm!65388 m!1247417))

(declare-fun m!1247425 () Bool)

(assert (=> bm!65388 m!1247425))

(assert (=> b!1362471 m!1247417))

(assert (=> b!1362471 m!1247417))

(declare-fun m!1247429 () Bool)

(assert (=> b!1362471 m!1247429))

(assert (=> b!1362220 d!146023))

(declare-fun b!1362480 () Bool)

(declare-fun e!772852 () Bool)

(declare-fun e!772850 () Bool)

(assert (=> b!1362480 (= e!772852 e!772850)))

(declare-fun c!127448 () Bool)

(assert (=> b!1362480 (= c!127448 (validKeyInArray!0 (select (arr!44750 lt!600421) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362482 () Bool)

(declare-fun call!65393 () Bool)

(assert (=> b!1362482 (= e!772850 call!65393)))

(declare-fun b!1362483 () Bool)

(declare-fun e!772849 () Bool)

(assert (=> b!1362483 (= e!772849 e!772852)))

(declare-fun res!906466 () Bool)

(assert (=> b!1362483 (=> (not res!906466) (not e!772852))))

(declare-fun e!772851 () Bool)

(assert (=> b!1362483 (= res!906466 (not e!772851))))

(declare-fun res!906464 () Bool)

(assert (=> b!1362483 (=> (not res!906464) (not e!772851))))

(assert (=> b!1362483 (= res!906464 (validKeyInArray!0 (select (arr!44750 lt!600421) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362484 () Bool)

(assert (=> b!1362484 (= e!772850 call!65393)))

(declare-fun bm!65390 () Bool)

(assert (=> bm!65390 (= call!65393 (arrayNoDuplicates!0 lt!600421 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127448 (Cons!31787 (select (arr!44750 lt!600421) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600422) lt!600422)))))

(declare-fun d!146027 () Bool)

(declare-fun res!906465 () Bool)

(assert (=> d!146027 (=> res!906465 e!772849)))

(assert (=> d!146027 (= res!906465 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45300 lt!600421)))))

(assert (=> d!146027 (= (arrayNoDuplicates!0 lt!600421 (bvadd #b00000000000000000000000000000001 from!3120) lt!600422) e!772849)))

(declare-fun b!1362481 () Bool)

(assert (=> b!1362481 (= e!772851 (contains!9500 lt!600422 (select (arr!44750 lt!600421) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146027 (not res!906465)) b!1362483))

(assert (= (and b!1362483 res!906464) b!1362481))

(assert (= (and b!1362483 res!906466) b!1362480))

(assert (= (and b!1362480 c!127448) b!1362482))

(assert (= (and b!1362480 (not c!127448)) b!1362484))

(assert (= (or b!1362482 b!1362484) bm!65390))

(declare-fun m!1247439 () Bool)

(assert (=> b!1362480 m!1247439))

(assert (=> b!1362480 m!1247439))

(declare-fun m!1247441 () Bool)

(assert (=> b!1362480 m!1247441))

(assert (=> b!1362483 m!1247439))

(assert (=> b!1362483 m!1247439))

(assert (=> b!1362483 m!1247441))

(assert (=> bm!65390 m!1247439))

(declare-fun m!1247443 () Bool)

(assert (=> bm!65390 m!1247443))

(assert (=> b!1362481 m!1247439))

(assert (=> b!1362481 m!1247439))

(declare-fun m!1247445 () Bool)

(assert (=> b!1362481 m!1247445))

(assert (=> b!1362220 d!146027))

(declare-fun d!146033 () Bool)

(declare-fun e!772873 () Bool)

(assert (=> d!146033 e!772873))

(declare-fun res!906484 () Bool)

(assert (=> d!146033 (=> (not res!906484) (not e!772873))))

(assert (=> d!146033 (= res!906484 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45300 a!3742))))))

(declare-fun lt!600503 () Unit!44910)

(declare-fun choose!53 (array!92631 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31791) Unit!44910)

(assert (=> d!146033 (= lt!600503 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600422))))

(assert (=> d!146033 (bvslt (size!45300 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146033 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600422) lt!600503)))

(declare-fun b!1362508 () Bool)

(assert (=> b!1362508 (= e!772873 (arrayNoDuplicates!0 (array!92632 (store (arr!44750 a!3742) i!1404 l!3587) (size!45300 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600422))))

(assert (= (and d!146033 res!906484) b!1362508))

(declare-fun m!1247479 () Bool)

(assert (=> d!146033 m!1247479))

(assert (=> b!1362508 m!1247191))

(declare-fun m!1247481 () Bool)

