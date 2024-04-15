; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60704 () Bool)

(assert start!60704)

(declare-fun b!681342 () Bool)

(declare-fun e!388151 () Bool)

(declare-fun e!388149 () Bool)

(assert (=> b!681342 (= e!388151 e!388149)))

(declare-fun res!447639 () Bool)

(assert (=> b!681342 (=> (not res!447639) (not e!388149))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681342 (= res!447639 (bvsle from!3004 i!1382))))

(declare-fun b!681343 () Bool)

(declare-fun res!447625 () Bool)

(declare-fun e!388145 () Bool)

(assert (=> b!681343 (=> (not res!447625) (not e!388145))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681343 (= res!447625 (validKeyInArray!0 k0!2843))))

(declare-fun b!681344 () Bool)

(declare-fun res!447637 () Bool)

(assert (=> b!681344 (=> (not res!447637) (not e!388145))))

(declare-datatypes ((List!13027 0))(
  ( (Nil!13024) (Cons!13023 (h!14068 (_ BitVec 64)) (t!19255 List!13027)) )
))
(declare-fun acc!681 () List!13027)

(declare-fun contains!3549 (List!13027 (_ BitVec 64)) Bool)

(assert (=> b!681344 (= res!447637 (not (contains!3549 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681345 () Bool)

(declare-fun e!388147 () Bool)

(assert (=> b!681345 (= e!388145 (not e!388147))))

(declare-fun res!447638 () Bool)

(assert (=> b!681345 (=> res!447638 e!388147)))

(declare-datatypes ((array!39525 0))(
  ( (array!39526 (arr!18947 (Array (_ BitVec 32) (_ BitVec 64))) (size!19312 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39525)

(assert (=> b!681345 (= res!447638 (not (validKeyInArray!0 (select (arr!18947 a!3626) from!3004))))))

(declare-datatypes ((Unit!23888 0))(
  ( (Unit!23889) )
))
(declare-fun lt!313070 () Unit!23888)

(declare-fun e!388146 () Unit!23888)

(assert (=> b!681345 (= lt!313070 e!388146)))

(declare-fun c!77226 () Bool)

(declare-fun arrayContainsKey!0 (array!39525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681345 (= c!77226 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681345 (arrayContainsKey!0 (array!39526 (store (arr!18947 a!3626) i!1382 k0!2843) (size!19312 a!3626)) k0!2843 from!3004)))

(declare-fun b!681346 () Bool)

(declare-fun res!447630 () Bool)

(assert (=> b!681346 (=> (not res!447630) (not e!388145))))

(assert (=> b!681346 (= res!447630 e!388151)))

(declare-fun res!447641 () Bool)

(assert (=> b!681346 (=> res!447641 e!388151)))

(declare-fun e!388144 () Bool)

(assert (=> b!681346 (= res!447641 e!388144)))

(declare-fun res!447629 () Bool)

(assert (=> b!681346 (=> (not res!447629) (not e!388144))))

(assert (=> b!681346 (= res!447629 (bvsgt from!3004 i!1382))))

(declare-fun b!681347 () Bool)

(declare-fun res!447628 () Bool)

(declare-fun e!388148 () Bool)

(assert (=> b!681347 (=> res!447628 e!388148)))

(declare-fun lt!313071 () List!13027)

(declare-fun noDuplicate!818 (List!13027) Bool)

(assert (=> b!681347 (= res!447628 (not (noDuplicate!818 lt!313071)))))

(declare-fun b!681348 () Bool)

(declare-fun res!447642 () Bool)

(assert (=> b!681348 (=> (not res!447642) (not e!388145))))

(assert (=> b!681348 (= res!447642 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681349 () Bool)

(declare-fun res!447633 () Bool)

(assert (=> b!681349 (=> (not res!447633) (not e!388145))))

(declare-fun arrayNoDuplicates!0 (array!39525 (_ BitVec 32) List!13027) Bool)

(assert (=> b!681349 (= res!447633 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13024))))

(declare-fun b!681350 () Bool)

(declare-fun res!447643 () Bool)

(assert (=> b!681350 (=> (not res!447643) (not e!388145))))

(assert (=> b!681350 (= res!447643 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19312 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681351 () Bool)

(declare-fun res!447634 () Bool)

(assert (=> b!681351 (=> (not res!447634) (not e!388145))))

(assert (=> b!681351 (= res!447634 (noDuplicate!818 acc!681))))

(declare-fun res!447626 () Bool)

(assert (=> start!60704 (=> (not res!447626) (not e!388145))))

(assert (=> start!60704 (= res!447626 (and (bvslt (size!19312 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19312 a!3626))))))

(assert (=> start!60704 e!388145))

(assert (=> start!60704 true))

(declare-fun array_inv!14830 (array!39525) Bool)

(assert (=> start!60704 (array_inv!14830 a!3626)))

(declare-fun b!681352 () Bool)

(assert (=> b!681352 (= e!388144 (contains!3549 acc!681 k0!2843))))

(declare-fun b!681353 () Bool)

(assert (=> b!681353 (= e!388148 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313071))))

(declare-fun lt!313072 () Unit!23888)

(declare-fun noDuplicateSubseq!26 (List!13027 List!13027) Unit!23888)

(assert (=> b!681353 (= lt!313072 (noDuplicateSubseq!26 acc!681 lt!313071))))

(declare-fun b!681354 () Bool)

(assert (=> b!681354 (= e!388149 (not (contains!3549 acc!681 k0!2843)))))

(declare-fun b!681355 () Bool)

(declare-fun res!447635 () Bool)

(assert (=> b!681355 (=> (not res!447635) (not e!388145))))

(assert (=> b!681355 (= res!447635 (not (contains!3549 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681356 () Bool)

(declare-fun res!447631 () Bool)

(assert (=> b!681356 (=> (not res!447631) (not e!388145))))

(assert (=> b!681356 (= res!447631 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19312 a!3626))))))

(declare-fun b!681357 () Bool)

(declare-fun res!447632 () Bool)

(assert (=> b!681357 (=> (not res!447632) (not e!388145))))

(assert (=> b!681357 (= res!447632 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681358 () Bool)

(declare-fun res!447636 () Bool)

(assert (=> b!681358 (=> res!447636 e!388148)))

(declare-fun subseq!152 (List!13027 List!13027) Bool)

(assert (=> b!681358 (= res!447636 (not (subseq!152 acc!681 lt!313071)))))

(declare-fun b!681359 () Bool)

(declare-fun Unit!23890 () Unit!23888)

(assert (=> b!681359 (= e!388146 Unit!23890)))

(declare-fun b!681360 () Bool)

(declare-fun res!447627 () Bool)

(assert (=> b!681360 (=> res!447627 e!388148)))

(assert (=> b!681360 (= res!447627 (contains!3549 lt!313071 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681361 () Bool)

(assert (=> b!681361 (= e!388147 e!388148)))

(declare-fun res!447640 () Bool)

(assert (=> b!681361 (=> res!447640 e!388148)))

(assert (=> b!681361 (= res!447640 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!316 (List!13027 (_ BitVec 64)) List!13027)

(assert (=> b!681361 (= lt!313071 ($colon$colon!316 acc!681 (select (arr!18947 a!3626) from!3004)))))

(assert (=> b!681361 (subseq!152 acc!681 acc!681)))

(declare-fun lt!313073 () Unit!23888)

(declare-fun lemmaListSubSeqRefl!0 (List!13027) Unit!23888)

(assert (=> b!681361 (= lt!313073 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681362 () Bool)

(declare-fun res!447624 () Bool)

(assert (=> b!681362 (=> res!447624 e!388148)))

(assert (=> b!681362 (= res!447624 (contains!3549 lt!313071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681363 () Bool)

(declare-fun Unit!23891 () Unit!23888)

(assert (=> b!681363 (= e!388146 Unit!23891)))

(declare-fun lt!313074 () Unit!23888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39525 (_ BitVec 64) (_ BitVec 32)) Unit!23888)

(assert (=> b!681363 (= lt!313074 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!681363 false))

(assert (= (and start!60704 res!447626) b!681351))

(assert (= (and b!681351 res!447634) b!681344))

(assert (= (and b!681344 res!447637) b!681355))

(assert (= (and b!681355 res!447635) b!681346))

(assert (= (and b!681346 res!447629) b!681352))

(assert (= (and b!681346 (not res!447641)) b!681342))

(assert (= (and b!681342 res!447639) b!681354))

(assert (= (and b!681346 res!447630) b!681349))

(assert (= (and b!681349 res!447633) b!681357))

(assert (= (and b!681357 res!447632) b!681356))

(assert (= (and b!681356 res!447631) b!681343))

(assert (= (and b!681343 res!447625) b!681348))

(assert (= (and b!681348 res!447642) b!681350))

(assert (= (and b!681350 res!447643) b!681345))

(assert (= (and b!681345 c!77226) b!681363))

(assert (= (and b!681345 (not c!77226)) b!681359))

(assert (= (and b!681345 (not res!447638)) b!681361))

(assert (= (and b!681361 (not res!447640)) b!681347))

(assert (= (and b!681347 (not res!447628)) b!681362))

(assert (= (and b!681362 (not res!447624)) b!681360))

(assert (= (and b!681360 (not res!447627)) b!681358))

(assert (= (and b!681358 (not res!447636)) b!681353))

(declare-fun m!645681 () Bool)

(assert (=> b!681361 m!645681))

(assert (=> b!681361 m!645681))

(declare-fun m!645683 () Bool)

(assert (=> b!681361 m!645683))

(declare-fun m!645685 () Bool)

(assert (=> b!681361 m!645685))

(declare-fun m!645687 () Bool)

(assert (=> b!681361 m!645687))

(declare-fun m!645689 () Bool)

(assert (=> b!681348 m!645689))

(declare-fun m!645691 () Bool)

(assert (=> b!681353 m!645691))

(declare-fun m!645693 () Bool)

(assert (=> b!681353 m!645693))

(declare-fun m!645695 () Bool)

(assert (=> start!60704 m!645695))

(declare-fun m!645697 () Bool)

(assert (=> b!681360 m!645697))

(declare-fun m!645699 () Bool)

(assert (=> b!681343 m!645699))

(declare-fun m!645701 () Bool)

(assert (=> b!681349 m!645701))

(declare-fun m!645703 () Bool)

(assert (=> b!681354 m!645703))

(declare-fun m!645705 () Bool)

(assert (=> b!681347 m!645705))

(declare-fun m!645707 () Bool)

(assert (=> b!681362 m!645707))

(declare-fun m!645709 () Bool)

(assert (=> b!681355 m!645709))

(assert (=> b!681352 m!645703))

(declare-fun m!645711 () Bool)

(assert (=> b!681358 m!645711))

(declare-fun m!645713 () Bool)

(assert (=> b!681344 m!645713))

(declare-fun m!645715 () Bool)

(assert (=> b!681363 m!645715))

(declare-fun m!645717 () Bool)

(assert (=> b!681351 m!645717))

(assert (=> b!681345 m!645681))

(declare-fun m!645719 () Bool)

(assert (=> b!681345 m!645719))

(declare-fun m!645721 () Bool)

(assert (=> b!681345 m!645721))

(assert (=> b!681345 m!645681))

(declare-fun m!645723 () Bool)

(assert (=> b!681345 m!645723))

(declare-fun m!645725 () Bool)

(assert (=> b!681345 m!645725))

(declare-fun m!645727 () Bool)

(assert (=> b!681357 m!645727))

(check-sat (not b!681363) (not b!681347) (not b!681349) (not b!681343) (not b!681357) (not b!681344) (not b!681354) (not b!681352) (not b!681353) (not b!681362) (not start!60704) (not b!681345) (not b!681358) (not b!681360) (not b!681348) (not b!681355) (not b!681361) (not b!681351))
(check-sat)
(get-model)

(declare-fun d!93701 () Bool)

(assert (=> d!93701 (= (validKeyInArray!0 (select (arr!18947 a!3626) from!3004)) (and (not (= (select (arr!18947 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18947 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681345 d!93701))

(declare-fun d!93703 () Bool)

(declare-fun res!447768 () Bool)

(declare-fun e!388204 () Bool)

(assert (=> d!93703 (=> res!447768 e!388204)))

(assert (=> d!93703 (= res!447768 (= (select (arr!18947 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93703 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388204)))

(declare-fun b!681500 () Bool)

(declare-fun e!388205 () Bool)

(assert (=> b!681500 (= e!388204 e!388205)))

(declare-fun res!447769 () Bool)

(assert (=> b!681500 (=> (not res!447769) (not e!388205))))

(assert (=> b!681500 (= res!447769 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19312 a!3626)))))

(declare-fun b!681501 () Bool)

(assert (=> b!681501 (= e!388205 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93703 (not res!447768)) b!681500))

(assert (= (and b!681500 res!447769) b!681501))

(declare-fun m!645825 () Bool)

(assert (=> d!93703 m!645825))

(declare-fun m!645827 () Bool)

(assert (=> b!681501 m!645827))

(assert (=> b!681345 d!93703))

(declare-fun d!93705 () Bool)

(declare-fun res!447770 () Bool)

(declare-fun e!388206 () Bool)

(assert (=> d!93705 (=> res!447770 e!388206)))

(assert (=> d!93705 (= res!447770 (= (select (arr!18947 (array!39526 (store (arr!18947 a!3626) i!1382 k0!2843) (size!19312 a!3626))) from!3004) k0!2843))))

(assert (=> d!93705 (= (arrayContainsKey!0 (array!39526 (store (arr!18947 a!3626) i!1382 k0!2843) (size!19312 a!3626)) k0!2843 from!3004) e!388206)))

(declare-fun b!681502 () Bool)

(declare-fun e!388207 () Bool)

(assert (=> b!681502 (= e!388206 e!388207)))

(declare-fun res!447771 () Bool)

(assert (=> b!681502 (=> (not res!447771) (not e!388207))))

(assert (=> b!681502 (= res!447771 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19312 (array!39526 (store (arr!18947 a!3626) i!1382 k0!2843) (size!19312 a!3626)))))))

(declare-fun b!681503 () Bool)

(assert (=> b!681503 (= e!388207 (arrayContainsKey!0 (array!39526 (store (arr!18947 a!3626) i!1382 k0!2843) (size!19312 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93705 (not res!447770)) b!681502))

(assert (= (and b!681502 res!447771) b!681503))

(declare-fun m!645829 () Bool)

(assert (=> d!93705 m!645829))

(declare-fun m!645831 () Bool)

(assert (=> b!681503 m!645831))

(assert (=> b!681345 d!93705))

(declare-fun d!93707 () Bool)

(declare-fun res!447776 () Bool)

(declare-fun e!388212 () Bool)

(assert (=> d!93707 (=> res!447776 e!388212)))

(get-info :version)

(assert (=> d!93707 (= res!447776 ((_ is Nil!13024) lt!313071))))

(assert (=> d!93707 (= (noDuplicate!818 lt!313071) e!388212)))

(declare-fun b!681508 () Bool)

(declare-fun e!388213 () Bool)

(assert (=> b!681508 (= e!388212 e!388213)))

(declare-fun res!447777 () Bool)

(assert (=> b!681508 (=> (not res!447777) (not e!388213))))

(assert (=> b!681508 (= res!447777 (not (contains!3549 (t!19255 lt!313071) (h!14068 lt!313071))))))

(declare-fun b!681509 () Bool)

(assert (=> b!681509 (= e!388213 (noDuplicate!818 (t!19255 lt!313071)))))

(assert (= (and d!93707 (not res!447776)) b!681508))

(assert (= (and b!681508 res!447777) b!681509))

(declare-fun m!645833 () Bool)

(assert (=> b!681508 m!645833))

(declare-fun m!645835 () Bool)

(assert (=> b!681509 m!645835))

(assert (=> b!681347 d!93707))

(declare-fun b!681524 () Bool)

(declare-fun e!388230 () Bool)

(declare-fun e!388229 () Bool)

(assert (=> b!681524 (= e!388230 e!388229)))

(declare-fun res!447795 () Bool)

(assert (=> b!681524 (=> (not res!447795) (not e!388229))))

(assert (=> b!681524 (= res!447795 ((_ is Cons!13023) lt!313071))))

(declare-fun b!681527 () Bool)

(declare-fun e!388231 () Bool)

(assert (=> b!681527 (= e!388231 (subseq!152 acc!681 (t!19255 lt!313071)))))

(declare-fun b!681525 () Bool)

(assert (=> b!681525 (= e!388229 e!388231)))

(declare-fun res!447794 () Bool)

(assert (=> b!681525 (=> res!447794 e!388231)))

(declare-fun e!388228 () Bool)

(assert (=> b!681525 (= res!447794 e!388228)))

(declare-fun res!447792 () Bool)

(assert (=> b!681525 (=> (not res!447792) (not e!388228))))

(assert (=> b!681525 (= res!447792 (= (h!14068 acc!681) (h!14068 lt!313071)))))

(declare-fun b!681526 () Bool)

(assert (=> b!681526 (= e!388228 (subseq!152 (t!19255 acc!681) (t!19255 lt!313071)))))

(declare-fun d!93709 () Bool)

(declare-fun res!447793 () Bool)

(assert (=> d!93709 (=> res!447793 e!388230)))

(assert (=> d!93709 (= res!447793 ((_ is Nil!13024) acc!681))))

(assert (=> d!93709 (= (subseq!152 acc!681 lt!313071) e!388230)))

(assert (= (and d!93709 (not res!447793)) b!681524))

(assert (= (and b!681524 res!447795) b!681525))

(assert (= (and b!681525 res!447792) b!681526))

(assert (= (and b!681525 (not res!447794)) b!681527))

(declare-fun m!645841 () Bool)

(assert (=> b!681527 m!645841))

(declare-fun m!645843 () Bool)

(assert (=> b!681526 m!645843))

(assert (=> b!681358 d!93709))

(declare-fun b!681561 () Bool)

(declare-fun e!388263 () Bool)

(declare-fun call!33952 () Bool)

(assert (=> b!681561 (= e!388263 call!33952)))

(declare-fun b!681562 () Bool)

(declare-fun e!388260 () Bool)

(assert (=> b!681562 (= e!388260 (contains!3549 acc!681 (select (arr!18947 a!3626) from!3004)))))

(declare-fun bm!33949 () Bool)

(declare-fun c!77238 () Bool)

(assert (=> bm!33949 (= call!33952 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77238 (Cons!13023 (select (arr!18947 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681563 () Bool)

(assert (=> b!681563 (= e!388263 call!33952)))

(declare-fun d!93715 () Bool)

(declare-fun res!447821 () Bool)

(declare-fun e!388261 () Bool)

(assert (=> d!93715 (=> res!447821 e!388261)))

(assert (=> d!93715 (= res!447821 (bvsge from!3004 (size!19312 a!3626)))))

(assert (=> d!93715 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388261)))

(declare-fun b!681564 () Bool)

(declare-fun e!388262 () Bool)

(assert (=> b!681564 (= e!388261 e!388262)))

(declare-fun res!447820 () Bool)

(assert (=> b!681564 (=> (not res!447820) (not e!388262))))

(assert (=> b!681564 (= res!447820 (not e!388260))))

(declare-fun res!447819 () Bool)

(assert (=> b!681564 (=> (not res!447819) (not e!388260))))

(assert (=> b!681564 (= res!447819 (validKeyInArray!0 (select (arr!18947 a!3626) from!3004)))))

(declare-fun b!681565 () Bool)

(assert (=> b!681565 (= e!388262 e!388263)))

(assert (=> b!681565 (= c!77238 (validKeyInArray!0 (select (arr!18947 a!3626) from!3004)))))

(assert (= (and d!93715 (not res!447821)) b!681564))

(assert (= (and b!681564 res!447819) b!681562))

(assert (= (and b!681564 res!447820) b!681565))

(assert (= (and b!681565 c!77238) b!681563))

(assert (= (and b!681565 (not c!77238)) b!681561))

(assert (= (or b!681563 b!681561) bm!33949))

(assert (=> b!681562 m!645681))

(assert (=> b!681562 m!645681))

(declare-fun m!645855 () Bool)

(assert (=> b!681562 m!645855))

(assert (=> bm!33949 m!645681))

(declare-fun m!645859 () Bool)

(assert (=> bm!33949 m!645859))

(assert (=> b!681564 m!645681))

(assert (=> b!681564 m!645681))

(assert (=> b!681564 m!645723))

(assert (=> b!681565 m!645681))

(assert (=> b!681565 m!645681))

(assert (=> b!681565 m!645723))

(assert (=> b!681357 d!93715))

(declare-fun d!93727 () Bool)

(declare-fun res!447826 () Bool)

(declare-fun e!388268 () Bool)

(assert (=> d!93727 (=> res!447826 e!388268)))

(assert (=> d!93727 (= res!447826 (= (select (arr!18947 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93727 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388268)))

(declare-fun b!681570 () Bool)

(declare-fun e!388269 () Bool)

(assert (=> b!681570 (= e!388268 e!388269)))

(declare-fun res!447827 () Bool)

(assert (=> b!681570 (=> (not res!447827) (not e!388269))))

(assert (=> b!681570 (= res!447827 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19312 a!3626)))))

(declare-fun b!681571 () Bool)

(assert (=> b!681571 (= e!388269 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93727 (not res!447826)) b!681570))

(assert (= (and b!681570 res!447827) b!681571))

(declare-fun m!645861 () Bool)

(assert (=> d!93727 m!645861))

(declare-fun m!645863 () Bool)

(assert (=> b!681571 m!645863))

(assert (=> b!681348 d!93727))

(declare-fun b!681572 () Bool)

(declare-fun e!388273 () Bool)

(declare-fun call!33953 () Bool)

(assert (=> b!681572 (= e!388273 call!33953)))

(declare-fun b!681573 () Bool)

(declare-fun e!388270 () Bool)

(assert (=> b!681573 (= e!388270 (contains!3549 Nil!13024 (select (arr!18947 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33950 () Bool)

(declare-fun c!77239 () Bool)

(assert (=> bm!33950 (= call!33953 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77239 (Cons!13023 (select (arr!18947 a!3626) #b00000000000000000000000000000000) Nil!13024) Nil!13024)))))

(declare-fun b!681574 () Bool)

(assert (=> b!681574 (= e!388273 call!33953)))

(declare-fun d!93729 () Bool)

(declare-fun res!447830 () Bool)

(declare-fun e!388271 () Bool)

(assert (=> d!93729 (=> res!447830 e!388271)))

(assert (=> d!93729 (= res!447830 (bvsge #b00000000000000000000000000000000 (size!19312 a!3626)))))

(assert (=> d!93729 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13024) e!388271)))

(declare-fun b!681575 () Bool)

(declare-fun e!388272 () Bool)

(assert (=> b!681575 (= e!388271 e!388272)))

(declare-fun res!447829 () Bool)

(assert (=> b!681575 (=> (not res!447829) (not e!388272))))

(assert (=> b!681575 (= res!447829 (not e!388270))))

(declare-fun res!447828 () Bool)

(assert (=> b!681575 (=> (not res!447828) (not e!388270))))

(assert (=> b!681575 (= res!447828 (validKeyInArray!0 (select (arr!18947 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681576 () Bool)

(assert (=> b!681576 (= e!388272 e!388273)))

(assert (=> b!681576 (= c!77239 (validKeyInArray!0 (select (arr!18947 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93729 (not res!447830)) b!681575))

(assert (= (and b!681575 res!447828) b!681573))

(assert (= (and b!681575 res!447829) b!681576))

(assert (= (and b!681576 c!77239) b!681574))

(assert (= (and b!681576 (not c!77239)) b!681572))

(assert (= (or b!681574 b!681572) bm!33950))

(assert (=> b!681573 m!645861))

(assert (=> b!681573 m!645861))

(declare-fun m!645869 () Bool)

(assert (=> b!681573 m!645869))

(assert (=> bm!33950 m!645861))

(declare-fun m!645871 () Bool)

(assert (=> bm!33950 m!645871))

(assert (=> b!681575 m!645861))

(assert (=> b!681575 m!645861))

(declare-fun m!645873 () Bool)

(assert (=> b!681575 m!645873))

(assert (=> b!681576 m!645861))

(assert (=> b!681576 m!645861))

(assert (=> b!681576 m!645873))

(assert (=> b!681349 d!93729))

(declare-fun d!93733 () Bool)

(declare-fun lt!313112 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!278 (List!13027) (InoxSet (_ BitVec 64)))

(assert (=> d!93733 (= lt!313112 (select (content!278 lt!313071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388294 () Bool)

(assert (=> d!93733 (= lt!313112 e!388294)))

(declare-fun res!447852 () Bool)

(assert (=> d!93733 (=> (not res!447852) (not e!388294))))

(assert (=> d!93733 (= res!447852 ((_ is Cons!13023) lt!313071))))

(assert (=> d!93733 (= (contains!3549 lt!313071 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313112)))

(declare-fun b!681597 () Bool)

(declare-fun e!388295 () Bool)

(assert (=> b!681597 (= e!388294 e!388295)))

(declare-fun res!447851 () Bool)

(assert (=> b!681597 (=> res!447851 e!388295)))

(assert (=> b!681597 (= res!447851 (= (h!14068 lt!313071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681598 () Bool)

(assert (=> b!681598 (= e!388295 (contains!3549 (t!19255 lt!313071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93733 res!447852) b!681597))

(assert (= (and b!681597 (not res!447851)) b!681598))

(declare-fun m!645885 () Bool)

(assert (=> d!93733 m!645885))

(declare-fun m!645887 () Bool)

(assert (=> d!93733 m!645887))

(declare-fun m!645889 () Bool)

(assert (=> b!681598 m!645889))

(assert (=> b!681360 d!93733))

(declare-fun d!93741 () Bool)

(declare-fun res!447855 () Bool)

(declare-fun e!388298 () Bool)

(assert (=> d!93741 (=> res!447855 e!388298)))

(assert (=> d!93741 (= res!447855 ((_ is Nil!13024) acc!681))))

(assert (=> d!93741 (= (noDuplicate!818 acc!681) e!388298)))

(declare-fun b!681601 () Bool)

(declare-fun e!388299 () Bool)

(assert (=> b!681601 (= e!388298 e!388299)))

(declare-fun res!447856 () Bool)

(assert (=> b!681601 (=> (not res!447856) (not e!388299))))

(assert (=> b!681601 (= res!447856 (not (contains!3549 (t!19255 acc!681) (h!14068 acc!681))))))

(declare-fun b!681602 () Bool)

(assert (=> b!681602 (= e!388299 (noDuplicate!818 (t!19255 acc!681)))))

(assert (= (and d!93741 (not res!447855)) b!681601))

(assert (= (and b!681601 res!447856) b!681602))

(declare-fun m!645891 () Bool)

(assert (=> b!681601 m!645891))

(declare-fun m!645893 () Bool)

(assert (=> b!681602 m!645893))

(assert (=> b!681351 d!93741))

(declare-fun d!93743 () Bool)

(declare-fun lt!313113 () Bool)

(assert (=> d!93743 (= lt!313113 (select (content!278 lt!313071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388300 () Bool)

(assert (=> d!93743 (= lt!313113 e!388300)))

(declare-fun res!447858 () Bool)

(assert (=> d!93743 (=> (not res!447858) (not e!388300))))

(assert (=> d!93743 (= res!447858 ((_ is Cons!13023) lt!313071))))

(assert (=> d!93743 (= (contains!3549 lt!313071 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313113)))

(declare-fun b!681603 () Bool)

(declare-fun e!388301 () Bool)

(assert (=> b!681603 (= e!388300 e!388301)))

(declare-fun res!447857 () Bool)

(assert (=> b!681603 (=> res!447857 e!388301)))

(assert (=> b!681603 (= res!447857 (= (h!14068 lt!313071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681604 () Bool)

(assert (=> b!681604 (= e!388301 (contains!3549 (t!19255 lt!313071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93743 res!447858) b!681603))

(assert (= (and b!681603 (not res!447857)) b!681604))

(assert (=> d!93743 m!645885))

(declare-fun m!645895 () Bool)

(assert (=> d!93743 m!645895))

(declare-fun m!645897 () Bool)

(assert (=> b!681604 m!645897))

(assert (=> b!681362 d!93743))

(declare-fun d!93745 () Bool)

(assert (=> d!93745 (= ($colon$colon!316 acc!681 (select (arr!18947 a!3626) from!3004)) (Cons!13023 (select (arr!18947 a!3626) from!3004) acc!681))))

(assert (=> b!681361 d!93745))

(declare-fun b!681609 () Bool)

(declare-fun e!388308 () Bool)

(declare-fun e!388307 () Bool)

(assert (=> b!681609 (= e!388308 e!388307)))

(declare-fun res!447866 () Bool)

(assert (=> b!681609 (=> (not res!447866) (not e!388307))))

(assert (=> b!681609 (= res!447866 ((_ is Cons!13023) acc!681))))

(declare-fun b!681612 () Bool)

(declare-fun e!388309 () Bool)

(assert (=> b!681612 (= e!388309 (subseq!152 acc!681 (t!19255 acc!681)))))

(declare-fun b!681610 () Bool)

(assert (=> b!681610 (= e!388307 e!388309)))

(declare-fun res!447865 () Bool)

(assert (=> b!681610 (=> res!447865 e!388309)))

(declare-fun e!388306 () Bool)

(assert (=> b!681610 (= res!447865 e!388306)))

(declare-fun res!447863 () Bool)

(assert (=> b!681610 (=> (not res!447863) (not e!388306))))

(assert (=> b!681610 (= res!447863 (= (h!14068 acc!681) (h!14068 acc!681)))))

(declare-fun b!681611 () Bool)

(assert (=> b!681611 (= e!388306 (subseq!152 (t!19255 acc!681) (t!19255 acc!681)))))

(declare-fun d!93749 () Bool)

(declare-fun res!447864 () Bool)

(assert (=> d!93749 (=> res!447864 e!388308)))

(assert (=> d!93749 (= res!447864 ((_ is Nil!13024) acc!681))))

(assert (=> d!93749 (= (subseq!152 acc!681 acc!681) e!388308)))

(assert (= (and d!93749 (not res!447864)) b!681609))

(assert (= (and b!681609 res!447866) b!681610))

(assert (= (and b!681610 res!447863) b!681611))

(assert (= (and b!681610 (not res!447865)) b!681612))

(declare-fun m!645911 () Bool)

(assert (=> b!681612 m!645911))

(declare-fun m!645913 () Bool)

(assert (=> b!681611 m!645913))

(assert (=> b!681361 d!93749))

(declare-fun d!93753 () Bool)

(assert (=> d!93753 (subseq!152 acc!681 acc!681)))

(declare-fun lt!313118 () Unit!23888)

(declare-fun choose!36 (List!13027) Unit!23888)

(assert (=> d!93753 (= lt!313118 (choose!36 acc!681))))

(assert (=> d!93753 (= (lemmaListSubSeqRefl!0 acc!681) lt!313118)))

(declare-fun bs!19977 () Bool)

(assert (= bs!19977 d!93753))

(assert (=> bs!19977 m!645685))

(declare-fun m!645923 () Bool)

(assert (=> bs!19977 m!645923))

(assert (=> b!681361 d!93753))

(declare-fun d!93757 () Bool)

(assert (=> d!93757 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313123 () Unit!23888)

(declare-fun choose!13 (array!39525 (_ BitVec 64) (_ BitVec 32)) Unit!23888)

(assert (=> d!93757 (= lt!313123 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93757 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93757 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313123)))

(declare-fun bs!19978 () Bool)

(assert (= bs!19978 d!93757))

(assert (=> bs!19978 m!645689))

(declare-fun m!645925 () Bool)

(assert (=> bs!19978 m!645925))

(assert (=> b!681363 d!93757))

(declare-fun d!93759 () Bool)

(declare-fun lt!313124 () Bool)

(assert (=> d!93759 (= lt!313124 (select (content!278 acc!681) k0!2843))))

(declare-fun e!388328 () Bool)

(assert (=> d!93759 (= lt!313124 e!388328)))

(declare-fun res!447882 () Bool)

(assert (=> d!93759 (=> (not res!447882) (not e!388328))))

(assert (=> d!93759 (= res!447882 ((_ is Cons!13023) acc!681))))

(assert (=> d!93759 (= (contains!3549 acc!681 k0!2843) lt!313124)))

(declare-fun b!681635 () Bool)

(declare-fun e!388329 () Bool)

(assert (=> b!681635 (= e!388328 e!388329)))

(declare-fun res!447881 () Bool)

(assert (=> b!681635 (=> res!447881 e!388329)))

(assert (=> b!681635 (= res!447881 (= (h!14068 acc!681) k0!2843))))

(declare-fun b!681636 () Bool)

(assert (=> b!681636 (= e!388329 (contains!3549 (t!19255 acc!681) k0!2843))))

(assert (= (and d!93759 res!447882) b!681635))

(assert (= (and b!681635 (not res!447881)) b!681636))

(declare-fun m!645927 () Bool)

(assert (=> d!93759 m!645927))

(declare-fun m!645929 () Bool)

(assert (=> d!93759 m!645929))

(declare-fun m!645931 () Bool)

(assert (=> b!681636 m!645931))

(assert (=> b!681352 d!93759))

(declare-fun d!93761 () Bool)

(assert (=> d!93761 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681343 d!93761))

(assert (=> b!681354 d!93759))

(declare-fun b!681638 () Bool)

(declare-fun e!388334 () Bool)

(declare-fun call!33958 () Bool)

(assert (=> b!681638 (= e!388334 call!33958)))

(declare-fun b!681639 () Bool)

(declare-fun e!388331 () Bool)

(assert (=> b!681639 (= e!388331 (contains!3549 lt!313071 (select (arr!18947 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun c!77244 () Bool)

(declare-fun bm!33955 () Bool)

(assert (=> bm!33955 (= call!33958 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77244 (Cons!13023 (select (arr!18947 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!313071) lt!313071)))))

(declare-fun b!681640 () Bool)

(assert (=> b!681640 (= e!388334 call!33958)))

(declare-fun d!93763 () Bool)

(declare-fun res!447886 () Bool)

(declare-fun e!388332 () Bool)

(assert (=> d!93763 (=> res!447886 e!388332)))

(assert (=> d!93763 (= res!447886 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19312 a!3626)))))

(assert (=> d!93763 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313071) e!388332)))

(declare-fun b!681641 () Bool)

(declare-fun e!388333 () Bool)

(assert (=> b!681641 (= e!388332 e!388333)))

(declare-fun res!447885 () Bool)

(assert (=> b!681641 (=> (not res!447885) (not e!388333))))

(assert (=> b!681641 (= res!447885 (not e!388331))))

(declare-fun res!447884 () Bool)

(assert (=> b!681641 (=> (not res!447884) (not e!388331))))

(assert (=> b!681641 (= res!447884 (validKeyInArray!0 (select (arr!18947 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!681642 () Bool)

(assert (=> b!681642 (= e!388333 e!388334)))

(assert (=> b!681642 (= c!77244 (validKeyInArray!0 (select (arr!18947 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!93763 (not res!447886)) b!681641))

(assert (= (and b!681641 res!447884) b!681639))

(assert (= (and b!681641 res!447885) b!681642))

(assert (= (and b!681642 c!77244) b!681640))

(assert (= (and b!681642 (not c!77244)) b!681638))

(assert (= (or b!681640 b!681638) bm!33955))

(assert (=> b!681639 m!645825))

(assert (=> b!681639 m!645825))

(declare-fun m!645941 () Bool)

(assert (=> b!681639 m!645941))

(assert (=> bm!33955 m!645825))

(declare-fun m!645943 () Bool)

(assert (=> bm!33955 m!645943))

(assert (=> b!681641 m!645825))

(assert (=> b!681641 m!645825))

(declare-fun m!645945 () Bool)

(assert (=> b!681641 m!645945))

(assert (=> b!681642 m!645825))

(assert (=> b!681642 m!645825))

(assert (=> b!681642 m!645945))

(assert (=> b!681353 d!93763))

(declare-fun d!93769 () Bool)

(assert (=> d!93769 (noDuplicate!818 acc!681)))

(declare-fun lt!313133 () Unit!23888)

(declare-fun choose!1395 (List!13027 List!13027) Unit!23888)

(assert (=> d!93769 (= lt!313133 (choose!1395 acc!681 lt!313071))))

(declare-fun e!388358 () Bool)

(assert (=> d!93769 e!388358))

(declare-fun res!447909 () Bool)

(assert (=> d!93769 (=> (not res!447909) (not e!388358))))

(assert (=> d!93769 (= res!447909 (subseq!152 acc!681 lt!313071))))

(assert (=> d!93769 (= (noDuplicateSubseq!26 acc!681 lt!313071) lt!313133)))

(declare-fun b!681667 () Bool)

(assert (=> b!681667 (= e!388358 (noDuplicate!818 lt!313071))))

(assert (= (and d!93769 res!447909) b!681667))

(assert (=> d!93769 m!645717))

(declare-fun m!645963 () Bool)

(assert (=> d!93769 m!645963))

(assert (=> d!93769 m!645711))

(assert (=> b!681667 m!645705))

(assert (=> b!681353 d!93769))

(declare-fun d!93781 () Bool)

(declare-fun lt!313134 () Bool)

(assert (=> d!93781 (= lt!313134 (select (content!278 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388363 () Bool)

(assert (=> d!93781 (= lt!313134 e!388363)))

(declare-fun res!447915 () Bool)

(assert (=> d!93781 (=> (not res!447915) (not e!388363))))

(assert (=> d!93781 (= res!447915 ((_ is Cons!13023) acc!681))))

(assert (=> d!93781 (= (contains!3549 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313134)))

(declare-fun b!681672 () Bool)

(declare-fun e!388364 () Bool)

(assert (=> b!681672 (= e!388363 e!388364)))

(declare-fun res!447914 () Bool)

(assert (=> b!681672 (=> res!447914 e!388364)))

(assert (=> b!681672 (= res!447914 (= (h!14068 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681673 () Bool)

(assert (=> b!681673 (= e!388364 (contains!3549 (t!19255 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93781 res!447915) b!681672))

(assert (= (and b!681672 (not res!447914)) b!681673))

(assert (=> d!93781 m!645927))

(declare-fun m!645969 () Bool)

(assert (=> d!93781 m!645969))

(declare-fun m!645971 () Bool)

(assert (=> b!681673 m!645971))

(assert (=> b!681355 d!93781))

(declare-fun d!93785 () Bool)

(assert (=> d!93785 (= (array_inv!14830 a!3626) (bvsge (size!19312 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60704 d!93785))

(declare-fun d!93789 () Bool)

(declare-fun lt!313135 () Bool)

(assert (=> d!93789 (= lt!313135 (select (content!278 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388365 () Bool)

(assert (=> d!93789 (= lt!313135 e!388365)))

(declare-fun res!447917 () Bool)

(assert (=> d!93789 (=> (not res!447917) (not e!388365))))

(assert (=> d!93789 (= res!447917 ((_ is Cons!13023) acc!681))))

(assert (=> d!93789 (= (contains!3549 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313135)))

(declare-fun b!681674 () Bool)

(declare-fun e!388366 () Bool)

(assert (=> b!681674 (= e!388365 e!388366)))

(declare-fun res!447916 () Bool)

(assert (=> b!681674 (=> res!447916 e!388366)))

(assert (=> b!681674 (= res!447916 (= (h!14068 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681675 () Bool)

(assert (=> b!681675 (= e!388366 (contains!3549 (t!19255 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93789 res!447917) b!681674))

(assert (= (and b!681674 (not res!447916)) b!681675))

(assert (=> d!93789 m!645927))

(declare-fun m!645977 () Bool)

(assert (=> d!93789 m!645977))

(declare-fun m!645979 () Bool)

(assert (=> b!681675 m!645979))

(assert (=> b!681344 d!93789))

(check-sat (not b!681641) (not b!681564) (not b!681612) (not d!93759) (not bm!33949) (not b!681604) (not b!681673) (not b!681565) (not b!681576) (not b!681601) (not b!681636) (not b!681575) (not b!681611) (not bm!33955) (not d!93733) (not d!93781) (not b!681527) (not b!681639) (not d!93757) (not b!681573) (not b!681675) (not d!93789) (not b!681562) (not b!681509) (not bm!33950) (not b!681598) (not b!681503) (not b!681602) (not d!93769) (not b!681571) (not d!93743) (not b!681667) (not b!681526) (not b!681501) (not d!93753) (not b!681508) (not b!681642))
(check-sat)
