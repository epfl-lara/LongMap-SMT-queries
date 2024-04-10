; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103008 () Bool)

(assert start!103008)

(declare-fun b!1237485 () Bool)

(declare-fun res!825356 () Bool)

(declare-fun e!701318 () Bool)

(assert (=> b!1237485 (=> (not res!825356) (not e!701318))))

(declare-datatypes ((List!27271 0))(
  ( (Nil!27268) (Cons!27267 (h!28476 (_ BitVec 64)) (t!40734 List!27271)) )
))
(declare-fun acc!846 () List!27271)

(declare-fun contains!7333 (List!27271 (_ BitVec 64)) Bool)

(assert (=> b!1237485 (= res!825356 (not (contains!7333 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237486 () Bool)

(declare-fun e!701319 () Bool)

(assert (=> b!1237486 (= e!701318 (not e!701319))))

(declare-fun res!825355 () Bool)

(assert (=> b!1237486 (=> res!825355 e!701319)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1237486 (= res!825355 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!561068 () List!27271)

(declare-fun subseq!587 (List!27271 List!27271) Bool)

(assert (=> b!1237486 (subseq!587 acc!846 lt!561068)))

(declare-datatypes ((Unit!41072 0))(
  ( (Unit!41073) )
))
(declare-fun lt!561066 () Unit!41072)

(declare-fun subseqTail!74 (List!27271 List!27271) Unit!41072)

(assert (=> b!1237486 (= lt!561066 (subseqTail!74 lt!561068 lt!561068))))

(assert (=> b!1237486 (subseq!587 lt!561068 lt!561068)))

(declare-fun lt!561067 () Unit!41072)

(declare-fun lemmaListSubSeqRefl!0 (List!27271) Unit!41072)

(assert (=> b!1237486 (= lt!561067 (lemmaListSubSeqRefl!0 lt!561068))))

(declare-datatypes ((array!79784 0))(
  ( (array!79785 (arr!38498 (Array (_ BitVec 32) (_ BitVec 64))) (size!39034 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79784)

(assert (=> b!1237486 (= lt!561068 (Cons!27267 (select (arr!38498 a!3835) from!3213) acc!846))))

(declare-fun res!825353 () Bool)

(assert (=> start!103008 (=> (not res!825353) (not e!701318))))

(assert (=> start!103008 (= res!825353 (and (bvslt (size!39034 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39034 a!3835))))))

(assert (=> start!103008 e!701318))

(declare-fun array_inv!29346 (array!79784) Bool)

(assert (=> start!103008 (array_inv!29346 a!3835)))

(assert (=> start!103008 true))

(declare-fun b!1237487 () Bool)

(declare-fun res!825354 () Bool)

(assert (=> b!1237487 (=> (not res!825354) (not e!701318))))

(assert (=> b!1237487 (= res!825354 (not (contains!7333 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237488 () Bool)

(declare-fun res!825361 () Bool)

(assert (=> b!1237488 (=> (not res!825361) (not e!701318))))

(declare-fun arrayNoDuplicates!0 (array!79784 (_ BitVec 32) List!27271) Bool)

(assert (=> b!1237488 (= res!825361 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237489 () Bool)

(declare-fun res!825359 () Bool)

(assert (=> b!1237489 (=> (not res!825359) (not e!701318))))

(assert (=> b!1237489 (= res!825359 (not (= from!3213 (bvsub (size!39034 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237490 () Bool)

(declare-fun res!825358 () Bool)

(assert (=> b!1237490 (=> (not res!825358) (not e!701318))))

(declare-fun noDuplicate!1930 (List!27271) Bool)

(assert (=> b!1237490 (= res!825358 (noDuplicate!1930 acc!846))))

(declare-fun b!1237491 () Bool)

(declare-fun res!825357 () Bool)

(assert (=> b!1237491 (=> (not res!825357) (not e!701318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237491 (= res!825357 (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)))))

(declare-fun b!1237492 () Bool)

(declare-fun res!825360 () Bool)

(assert (=> b!1237492 (=> (not res!825360) (not e!701318))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237492 (= res!825360 (contains!7333 acc!846 k!2925))))

(declare-fun b!1237493 () Bool)

(assert (=> b!1237493 (= e!701319 (noDuplicate!1930 lt!561068))))

(assert (= (and start!103008 res!825353) b!1237490))

(assert (= (and b!1237490 res!825358) b!1237487))

(assert (= (and b!1237487 res!825354) b!1237485))

(assert (= (and b!1237485 res!825356) b!1237488))

(assert (= (and b!1237488 res!825361) b!1237492))

(assert (= (and b!1237492 res!825360) b!1237489))

(assert (= (and b!1237489 res!825359) b!1237491))

(assert (= (and b!1237491 res!825357) b!1237486))

(assert (= (and b!1237486 (not res!825355)) b!1237493))

(declare-fun m!1141201 () Bool)

(assert (=> b!1237486 m!1141201))

(declare-fun m!1141203 () Bool)

(assert (=> b!1237486 m!1141203))

(declare-fun m!1141205 () Bool)

(assert (=> b!1237486 m!1141205))

(declare-fun m!1141207 () Bool)

(assert (=> b!1237486 m!1141207))

(declare-fun m!1141209 () Bool)

(assert (=> b!1237486 m!1141209))

(declare-fun m!1141211 () Bool)

(assert (=> b!1237490 m!1141211))

(declare-fun m!1141213 () Bool)

(assert (=> b!1237487 m!1141213))

(declare-fun m!1141215 () Bool)

(assert (=> start!103008 m!1141215))

(assert (=> b!1237491 m!1141209))

(assert (=> b!1237491 m!1141209))

(declare-fun m!1141217 () Bool)

(assert (=> b!1237491 m!1141217))

(declare-fun m!1141219 () Bool)

(assert (=> b!1237493 m!1141219))

(declare-fun m!1141221 () Bool)

(assert (=> b!1237485 m!1141221))

(declare-fun m!1141223 () Bool)

(assert (=> b!1237488 m!1141223))

(declare-fun m!1141225 () Bool)

(assert (=> b!1237492 m!1141225))

(push 1)

(assert (not b!1237490))

(assert (not b!1237492))

(assert (not start!103008))

(assert (not b!1237488))

(assert (not b!1237485))

(assert (not b!1237486))

(assert (not b!1237487))

(assert (not b!1237491))

(assert (not b!1237493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135699 () Bool)

(declare-fun lt!561091 () Bool)

(declare-fun content!585 (List!27271) (Set (_ BitVec 64)))

(assert (=> d!135699 (= lt!561091 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!585 acc!846)))))

(declare-fun e!701367 () Bool)

(assert (=> d!135699 (= lt!561091 e!701367)))

(declare-fun res!825444 () Bool)

(assert (=> d!135699 (=> (not res!825444) (not e!701367))))

(assert (=> d!135699 (= res!825444 (is-Cons!27267 acc!846))))

(assert (=> d!135699 (= (contains!7333 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561091)))

(declare-fun b!1237576 () Bool)

(declare-fun e!701366 () Bool)

(assert (=> b!1237576 (= e!701367 e!701366)))

(declare-fun res!825445 () Bool)

(assert (=> b!1237576 (=> res!825445 e!701366)))

(assert (=> b!1237576 (= res!825445 (= (h!28476 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237577 () Bool)

(assert (=> b!1237577 (= e!701366 (contains!7333 (t!40734 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135699 res!825444) b!1237576))

(assert (= (and b!1237576 (not res!825445)) b!1237577))

(declare-fun m!1141291 () Bool)

(assert (=> d!135699 m!1141291))

(declare-fun m!1141293 () Bool)

(assert (=> d!135699 m!1141293))

(declare-fun m!1141295 () Bool)

(assert (=> b!1237577 m!1141295))

(assert (=> b!1237487 d!135699))

(declare-fun d!135705 () Bool)

(declare-fun lt!561092 () Bool)

(assert (=> d!135705 (= lt!561092 (set.member k!2925 (content!585 acc!846)))))

(declare-fun e!701369 () Bool)

(assert (=> d!135705 (= lt!561092 e!701369)))

(declare-fun res!825446 () Bool)

(assert (=> d!135705 (=> (not res!825446) (not e!701369))))

(assert (=> d!135705 (= res!825446 (is-Cons!27267 acc!846))))

(assert (=> d!135705 (= (contains!7333 acc!846 k!2925) lt!561092)))

(declare-fun b!1237578 () Bool)

(declare-fun e!701368 () Bool)

(assert (=> b!1237578 (= e!701369 e!701368)))

(declare-fun res!825447 () Bool)

(assert (=> b!1237578 (=> res!825447 e!701368)))

(assert (=> b!1237578 (= res!825447 (= (h!28476 acc!846) k!2925))))

(declare-fun b!1237579 () Bool)

(assert (=> b!1237579 (= e!701368 (contains!7333 (t!40734 acc!846) k!2925))))

(assert (= (and d!135705 res!825446) b!1237578))

(assert (= (and b!1237578 (not res!825447)) b!1237579))

(assert (=> d!135705 m!1141291))

(declare-fun m!1141297 () Bool)

(assert (=> d!135705 m!1141297))

(declare-fun m!1141299 () Bool)

(assert (=> b!1237579 m!1141299))

(assert (=> b!1237492 d!135705))

(declare-fun d!135707 () Bool)

(declare-fun res!825456 () Bool)

(declare-fun e!701384 () Bool)

(assert (=> d!135707 (=> res!825456 e!701384)))

(assert (=> d!135707 (= res!825456 (is-Nil!27268 lt!561068))))

(assert (=> d!135707 (= (noDuplicate!1930 lt!561068) e!701384)))

(declare-fun b!1237600 () Bool)

(declare-fun e!701385 () Bool)

(assert (=> b!1237600 (= e!701384 e!701385)))

(declare-fun res!825457 () Bool)

(assert (=> b!1237600 (=> (not res!825457) (not e!701385))))

(assert (=> b!1237600 (= res!825457 (not (contains!7333 (t!40734 lt!561068) (h!28476 lt!561068))))))

(declare-fun b!1237601 () Bool)

(assert (=> b!1237601 (= e!701385 (noDuplicate!1930 (t!40734 lt!561068)))))

(assert (= (and d!135707 (not res!825456)) b!1237600))

(assert (= (and b!1237600 res!825457) b!1237601))

(declare-fun m!1141307 () Bool)

(assert (=> b!1237600 m!1141307))

(declare-fun m!1141309 () Bool)

(assert (=> b!1237601 m!1141309))

(assert (=> b!1237493 d!135707))

(declare-fun b!1237642 () Bool)

(declare-fun e!701420 () Bool)

(declare-fun e!701421 () Bool)

(assert (=> b!1237642 (= e!701420 e!701421)))

(declare-fun res!825482 () Bool)

(assert (=> b!1237642 (=> (not res!825482) (not e!701421))))

(declare-fun e!701418 () Bool)

(assert (=> b!1237642 (= res!825482 (not e!701418))))

(declare-fun res!825484 () Bool)

(assert (=> b!1237642 (=> (not res!825484) (not e!701418))))

(assert (=> b!1237642 (= res!825484 (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)))))

(declare-fun b!1237643 () Bool)

(declare-fun e!701419 () Bool)

(assert (=> b!1237643 (= e!701421 e!701419)))

(declare-fun c!120940 () Bool)

(assert (=> b!1237643 (= c!120940 (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)))))

(declare-fun b!1237644 () Bool)

(assert (=> b!1237644 (= e!701418 (contains!7333 acc!846 (select (arr!38498 a!3835) from!3213)))))

(declare-fun bm!61024 () Bool)

(declare-fun call!61027 () Bool)

(assert (=> bm!61024 (= call!61027 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120940 (Cons!27267 (select (arr!38498 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1237645 () Bool)

(assert (=> b!1237645 (= e!701419 call!61027)))

(declare-fun d!135711 () Bool)

(declare-fun res!825483 () Bool)

(assert (=> d!135711 (=> res!825483 e!701420)))

(assert (=> d!135711 (= res!825483 (bvsge from!3213 (size!39034 a!3835)))))

(assert (=> d!135711 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701420)))

(declare-fun b!1237646 () Bool)

(assert (=> b!1237646 (= e!701419 call!61027)))

(assert (= (and d!135711 (not res!825483)) b!1237642))

(assert (= (and b!1237642 res!825484) b!1237644))

(assert (= (and b!1237642 res!825482) b!1237643))

(assert (= (and b!1237643 c!120940) b!1237645))

(assert (= (and b!1237643 (not c!120940)) b!1237646))

(assert (= (or b!1237645 b!1237646) bm!61024))

(assert (=> b!1237642 m!1141209))

(assert (=> b!1237642 m!1141209))

(assert (=> b!1237642 m!1141217))

(assert (=> b!1237643 m!1141209))

(assert (=> b!1237643 m!1141209))

(assert (=> b!1237643 m!1141217))

(assert (=> b!1237644 m!1141209))

(assert (=> b!1237644 m!1141209))

(declare-fun m!1141331 () Bool)

(assert (=> b!1237644 m!1141331))

(assert (=> bm!61024 m!1141209))

(declare-fun m!1141333 () Bool)

(assert (=> bm!61024 m!1141333))

(assert (=> b!1237488 d!135711))

(declare-fun d!135721 () Bool)

(assert (=> d!135721 (= (array_inv!29346 a!3835) (bvsge (size!39034 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103008 d!135721))

(declare-fun d!135725 () Bool)

(declare-fun lt!561102 () Bool)

(assert (=> d!135725 (= lt!561102 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!585 acc!846)))))

(declare-fun e!701429 () Bool)

(assert (=> d!135725 (= lt!561102 e!701429)))

(declare-fun res!825491 () Bool)

(assert (=> d!135725 (=> (not res!825491) (not e!701429))))

(assert (=> d!135725 (= res!825491 (is-Cons!27267 acc!846))))

(assert (=> d!135725 (= (contains!7333 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561102)))

(declare-fun b!1237653 () Bool)

(declare-fun e!701428 () Bool)

(assert (=> b!1237653 (= e!701429 e!701428)))

(declare-fun res!825492 () Bool)

(assert (=> b!1237653 (=> res!825492 e!701428)))

(assert (=> b!1237653 (= res!825492 (= (h!28476 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237654 () Bool)

(assert (=> b!1237654 (= e!701428 (contains!7333 (t!40734 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135725 res!825491) b!1237653))

(assert (= (and b!1237653 (not res!825492)) b!1237654))

(assert (=> d!135725 m!1141291))

(declare-fun m!1141339 () Bool)

(assert (=> d!135725 m!1141339))

(declare-fun m!1141341 () Bool)

(assert (=> b!1237654 m!1141341))

(assert (=> b!1237485 d!135725))

(declare-fun d!135727 () Bool)

(declare-fun res!825493 () Bool)

(declare-fun e!701430 () Bool)

(assert (=> d!135727 (=> res!825493 e!701430)))

(assert (=> d!135727 (= res!825493 (is-Nil!27268 acc!846))))

(assert (=> d!135727 (= (noDuplicate!1930 acc!846) e!701430)))

(declare-fun b!1237655 () Bool)

(declare-fun e!701431 () Bool)

(assert (=> b!1237655 (= e!701430 e!701431)))

(declare-fun res!825494 () Bool)

(assert (=> b!1237655 (=> (not res!825494) (not e!701431))))

(assert (=> b!1237655 (= res!825494 (not (contains!7333 (t!40734 acc!846) (h!28476 acc!846))))))

(declare-fun b!1237656 () Bool)

(assert (=> b!1237656 (= e!701431 (noDuplicate!1930 (t!40734 acc!846)))))

(assert (= (and d!135727 (not res!825493)) b!1237655))

(assert (= (and b!1237655 res!825494) b!1237656))

(declare-fun m!1141343 () Bool)

(assert (=> b!1237655 m!1141343))

(declare-fun m!1141345 () Bool)

(assert (=> b!1237656 m!1141345))

(assert (=> b!1237490 d!135727))

(declare-fun d!135729 () Bool)

(assert (=> d!135729 (= (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)) (and (not (= (select (arr!38498 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38498 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1237491 d!135729))

(declare-fun b!1237690 () Bool)

(declare-fun e!701465 () Bool)

(declare-fun e!701463 () Bool)

(assert (=> b!1237690 (= e!701465 e!701463)))

(declare-fun res!825523 () Bool)

(assert (=> b!1237690 (=> res!825523 e!701463)))

(declare-fun e!701464 () Bool)

(assert (=> b!1237690 (= res!825523 e!701464)))

(declare-fun res!825525 () Bool)

(assert (=> b!1237690 (=> (not res!825525) (not e!701464))))

(assert (=> b!1237690 (= res!825525 (= (h!28476 acc!846) (h!28476 lt!561068)))))

(declare-fun d!135733 () Bool)

(declare-fun res!825524 () Bool)

(declare-fun e!701462 () Bool)

(assert (=> d!135733 (=> res!825524 e!701462)))

(assert (=> d!135733 (= res!825524 (is-Nil!27268 acc!846))))

(assert (=> d!135733 (= (subseq!587 acc!846 lt!561068) e!701462)))

(declare-fun b!1237692 () Bool)

(assert (=> b!1237692 (= e!701463 (subseq!587 acc!846 (t!40734 lt!561068)))))

(declare-fun b!1237689 () Bool)

(assert (=> b!1237689 (= e!701462 e!701465)))

(declare-fun res!825526 () Bool)

(assert (=> b!1237689 (=> (not res!825526) (not e!701465))))

(assert (=> b!1237689 (= res!825526 (is-Cons!27267 lt!561068))))

(declare-fun b!1237691 () Bool)

(assert (=> b!1237691 (= e!701464 (subseq!587 (t!40734 acc!846) (t!40734 lt!561068)))))

(assert (= (and d!135733 (not res!825524)) b!1237689))

(assert (= (and b!1237689 res!825526) b!1237690))

(assert (= (and b!1237690 res!825525) b!1237691))

(assert (= (and b!1237690 (not res!825523)) b!1237692))

(declare-fun m!1141357 () Bool)

(assert (=> b!1237692 m!1141357))

(declare-fun m!1141359 () Bool)

(assert (=> b!1237691 m!1141359))

(assert (=> b!1237486 d!135733))

(declare-fun b!1237741 () Bool)

(declare-fun e!701500 () Unit!41072)

