; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62230 () Bool)

(assert start!62230)

(declare-fun b!697491 () Bool)

(declare-fun res!461419 () Bool)

(declare-fun e!396468 () Bool)

(assert (=> b!697491 (=> (not res!461419) (not e!396468))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39987 0))(
  ( (array!39988 (arr!19153 (Array (_ BitVec 32) (_ BitVec 64))) (size!19538 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39987)

(assert (=> b!697491 (= res!461419 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19538 a!3626))))))

(declare-fun b!697492 () Bool)

(declare-fun res!461427 () Bool)

(assert (=> b!697492 (=> (not res!461427) (not e!396468))))

(declare-datatypes ((List!13194 0))(
  ( (Nil!13191) (Cons!13190 (h!14235 (_ BitVec 64)) (t!19476 List!13194)) )
))
(declare-fun acc!681 () List!13194)

(declare-fun noDuplicate!1018 (List!13194) Bool)

(assert (=> b!697492 (= res!461427 (noDuplicate!1018 acc!681))))

(declare-fun b!697493 () Bool)

(declare-fun res!461429 () Bool)

(assert (=> b!697493 (=> (not res!461429) (not e!396468))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697493 (= res!461429 (not (validKeyInArray!0 (select (arr!19153 a!3626) from!3004))))))

(declare-fun res!461414 () Bool)

(assert (=> start!62230 (=> (not res!461414) (not e!396468))))

(assert (=> start!62230 (= res!461414 (and (bvslt (size!19538 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19538 a!3626))))))

(assert (=> start!62230 e!396468))

(assert (=> start!62230 true))

(declare-fun array_inv!14949 (array!39987) Bool)

(assert (=> start!62230 (array_inv!14949 a!3626)))

(declare-fun b!697494 () Bool)

(declare-fun e!396464 () Bool)

(declare-fun e!396471 () Bool)

(assert (=> b!697494 (= e!396464 e!396471)))

(declare-fun res!461426 () Bool)

(assert (=> b!697494 (=> (not res!461426) (not e!396471))))

(assert (=> b!697494 (= res!461426 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697495 () Bool)

(declare-fun res!461425 () Bool)

(assert (=> b!697495 (=> (not res!461425) (not e!396468))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697495 (= res!461425 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697496 () Bool)

(declare-fun lt!317158 () array!39987)

(declare-fun arrayNoDuplicates!0 (array!39987 (_ BitVec 32) List!13194) Bool)

(assert (=> b!697496 (= e!396468 (not (arrayNoDuplicates!0 lt!317158 from!3004 acc!681)))))

(assert (=> b!697496 (arrayNoDuplicates!0 lt!317158 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (=> b!697496 (= lt!317158 (array!39988 (store (arr!19153 a!3626) i!1382 k0!2843) (size!19538 a!3626)))))

(declare-datatypes ((Unit!24578 0))(
  ( (Unit!24579) )
))
(declare-fun lt!317157 () Unit!24578)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39987 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13194) Unit!24578)

(assert (=> b!697496 (= lt!317157 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697497 () Bool)

(declare-fun res!461410 () Bool)

(assert (=> b!697497 (=> (not res!461410) (not e!396468))))

(declare-fun e!396469 () Bool)

(assert (=> b!697497 (= res!461410 e!396469)))

(declare-fun res!461412 () Bool)

(assert (=> b!697497 (=> res!461412 e!396469)))

(declare-fun e!396467 () Bool)

(assert (=> b!697497 (= res!461412 e!396467)))

(declare-fun res!461421 () Bool)

(assert (=> b!697497 (=> (not res!461421) (not e!396467))))

(assert (=> b!697497 (= res!461421 (bvsgt from!3004 i!1382))))

(declare-fun b!697498 () Bool)

(declare-fun res!461428 () Bool)

(assert (=> b!697498 (=> (not res!461428) (not e!396468))))

(assert (=> b!697498 (= res!461428 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697499 () Bool)

(declare-fun res!461409 () Bool)

(assert (=> b!697499 (=> (not res!461409) (not e!396468))))

(declare-fun contains!3771 (List!13194 (_ BitVec 64)) Bool)

(assert (=> b!697499 (= res!461409 (not (contains!3771 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697500 () Bool)

(declare-fun res!461415 () Bool)

(assert (=> b!697500 (=> (not res!461415) (not e!396468))))

(assert (=> b!697500 (= res!461415 (validKeyInArray!0 k0!2843))))

(declare-fun b!697501 () Bool)

(declare-fun e!396470 () Bool)

(assert (=> b!697501 (= e!396470 (not (contains!3771 acc!681 k0!2843)))))

(declare-fun b!697502 () Bool)

(assert (=> b!697502 (= e!396469 e!396470)))

(declare-fun res!461420 () Bool)

(assert (=> b!697502 (=> (not res!461420) (not e!396470))))

(assert (=> b!697502 (= res!461420 (bvsle from!3004 i!1382))))

(declare-fun b!697503 () Bool)

(declare-fun res!461416 () Bool)

(assert (=> b!697503 (=> (not res!461416) (not e!396468))))

(assert (=> b!697503 (= res!461416 e!396464)))

(declare-fun res!461422 () Bool)

(assert (=> b!697503 (=> res!461422 e!396464)))

(declare-fun e!396466 () Bool)

(assert (=> b!697503 (= res!461422 e!396466)))

(declare-fun res!461423 () Bool)

(assert (=> b!697503 (=> (not res!461423) (not e!396466))))

(assert (=> b!697503 (= res!461423 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697504 () Bool)

(assert (=> b!697504 (= e!396471 (not (contains!3771 acc!681 k0!2843)))))

(declare-fun b!697505 () Bool)

(declare-fun res!461417 () Bool)

(assert (=> b!697505 (=> (not res!461417) (not e!396468))))

(assert (=> b!697505 (= res!461417 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697506 () Bool)

(declare-fun res!461413 () Bool)

(assert (=> b!697506 (=> (not res!461413) (not e!396468))))

(assert (=> b!697506 (= res!461413 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19538 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697507 () Bool)

(assert (=> b!697507 (= e!396467 (contains!3771 acc!681 k0!2843))))

(declare-fun b!697508 () Bool)

(declare-fun res!461424 () Bool)

(assert (=> b!697508 (=> (not res!461424) (not e!396468))))

(assert (=> b!697508 (= res!461424 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13191))))

(declare-fun b!697509 () Bool)

(assert (=> b!697509 (= e!396466 (contains!3771 acc!681 k0!2843))))

(declare-fun b!697510 () Bool)

(declare-fun res!461411 () Bool)

(assert (=> b!697510 (=> (not res!461411) (not e!396468))))

(assert (=> b!697510 (= res!461411 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697511 () Bool)

(declare-fun res!461418 () Bool)

(assert (=> b!697511 (=> (not res!461418) (not e!396468))))

(assert (=> b!697511 (= res!461418 (not (contains!3771 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62230 res!461414) b!697492))

(assert (= (and b!697492 res!461427) b!697499))

(assert (= (and b!697499 res!461409) b!697511))

(assert (= (and b!697511 res!461418) b!697497))

(assert (= (and b!697497 res!461421) b!697507))

(assert (= (and b!697497 (not res!461412)) b!697502))

(assert (= (and b!697502 res!461420) b!697501))

(assert (= (and b!697497 res!461410) b!697508))

(assert (= (and b!697508 res!461424) b!697498))

(assert (= (and b!697498 res!461428) b!697491))

(assert (= (and b!697491 res!461419) b!697500))

(assert (= (and b!697500 res!461415) b!697495))

(assert (= (and b!697495 res!461425) b!697506))

(assert (= (and b!697506 res!461413) b!697493))

(assert (= (and b!697493 res!461429) b!697510))

(assert (= (and b!697510 res!461411) b!697503))

(assert (= (and b!697503 res!461423) b!697509))

(assert (= (and b!697503 (not res!461422)) b!697494))

(assert (= (and b!697494 res!461426) b!697504))

(assert (= (and b!697503 res!461416) b!697505))

(assert (= (and b!697505 res!461417) b!697496))

(declare-fun m!657877 () Bool)

(assert (=> b!697499 m!657877))

(declare-fun m!657879 () Bool)

(assert (=> start!62230 m!657879))

(declare-fun m!657881 () Bool)

(assert (=> b!697492 m!657881))

(declare-fun m!657883 () Bool)

(assert (=> b!697496 m!657883))

(declare-fun m!657885 () Bool)

(assert (=> b!697496 m!657885))

(declare-fun m!657887 () Bool)

(assert (=> b!697496 m!657887))

(declare-fun m!657889 () Bool)

(assert (=> b!697496 m!657889))

(declare-fun m!657891 () Bool)

(assert (=> b!697493 m!657891))

(assert (=> b!697493 m!657891))

(declare-fun m!657893 () Bool)

(assert (=> b!697493 m!657893))

(declare-fun m!657895 () Bool)

(assert (=> b!697505 m!657895))

(declare-fun m!657897 () Bool)

(assert (=> b!697495 m!657897))

(declare-fun m!657899 () Bool)

(assert (=> b!697508 m!657899))

(declare-fun m!657901 () Bool)

(assert (=> b!697500 m!657901))

(declare-fun m!657903 () Bool)

(assert (=> b!697498 m!657903))

(declare-fun m!657905 () Bool)

(assert (=> b!697501 m!657905))

(declare-fun m!657907 () Bool)

(assert (=> b!697511 m!657907))

(assert (=> b!697509 m!657905))

(assert (=> b!697507 m!657905))

(assert (=> b!697504 m!657905))

(check-sat (not b!697511) (not b!697504) (not b!697498) (not b!697508) (not b!697493) (not b!697509) (not b!697507) (not b!697505) (not b!697501) (not start!62230) (not b!697496) (not b!697500) (not b!697495) (not b!697499) (not b!697492))
(check-sat)
(get-model)

(declare-fun d!96153 () Bool)

(declare-fun lt!317167 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!327 (List!13194) (InoxSet (_ BitVec 64)))

(assert (=> d!96153 (= lt!317167 (select (content!327 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!396501 () Bool)

(assert (=> d!96153 (= lt!317167 e!396501)))

(declare-fun res!461497 () Bool)

(assert (=> d!96153 (=> (not res!461497) (not e!396501))))

(get-info :version)

(assert (=> d!96153 (= res!461497 ((_ is Cons!13190) acc!681))))

(assert (=> d!96153 (= (contains!3771 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317167)))

(declare-fun b!697579 () Bool)

(declare-fun e!396500 () Bool)

(assert (=> b!697579 (= e!396501 e!396500)))

(declare-fun res!461498 () Bool)

(assert (=> b!697579 (=> res!461498 e!396500)))

(assert (=> b!697579 (= res!461498 (= (h!14235 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!697580 () Bool)

(assert (=> b!697580 (= e!396500 (contains!3771 (t!19476 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96153 res!461497) b!697579))

(assert (= (and b!697579 (not res!461498)) b!697580))

(declare-fun m!657941 () Bool)

(assert (=> d!96153 m!657941))

(declare-fun m!657943 () Bool)

(assert (=> d!96153 m!657943))

(declare-fun m!657945 () Bool)

(assert (=> b!697580 m!657945))

(assert (=> b!697511 d!96153))

(declare-fun d!96155 () Bool)

(declare-fun lt!317168 () Bool)

(assert (=> d!96155 (= lt!317168 (select (content!327 acc!681) k0!2843))))

(declare-fun e!396503 () Bool)

(assert (=> d!96155 (= lt!317168 e!396503)))

(declare-fun res!461499 () Bool)

(assert (=> d!96155 (=> (not res!461499) (not e!396503))))

(assert (=> d!96155 (= res!461499 ((_ is Cons!13190) acc!681))))

(assert (=> d!96155 (= (contains!3771 acc!681 k0!2843) lt!317168)))

(declare-fun b!697581 () Bool)

(declare-fun e!396502 () Bool)

(assert (=> b!697581 (= e!396503 e!396502)))

(declare-fun res!461500 () Bool)

(assert (=> b!697581 (=> res!461500 e!396502)))

(assert (=> b!697581 (= res!461500 (= (h!14235 acc!681) k0!2843))))

(declare-fun b!697582 () Bool)

(assert (=> b!697582 (= e!396502 (contains!3771 (t!19476 acc!681) k0!2843))))

(assert (= (and d!96155 res!461499) b!697581))

(assert (= (and b!697581 (not res!461500)) b!697582))

(assert (=> d!96155 m!657941))

(declare-fun m!657947 () Bool)

(assert (=> d!96155 m!657947))

(declare-fun m!657949 () Bool)

(assert (=> b!697582 m!657949))

(assert (=> b!697501 d!96155))

(declare-fun d!96157 () Bool)

(declare-fun lt!317169 () Bool)

(assert (=> d!96157 (= lt!317169 (select (content!327 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!396505 () Bool)

(assert (=> d!96157 (= lt!317169 e!396505)))

(declare-fun res!461501 () Bool)

(assert (=> d!96157 (=> (not res!461501) (not e!396505))))

(assert (=> d!96157 (= res!461501 ((_ is Cons!13190) acc!681))))

(assert (=> d!96157 (= (contains!3771 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317169)))

(declare-fun b!697583 () Bool)

(declare-fun e!396504 () Bool)

(assert (=> b!697583 (= e!396505 e!396504)))

(declare-fun res!461502 () Bool)

(assert (=> b!697583 (=> res!461502 e!396504)))

(assert (=> b!697583 (= res!461502 (= (h!14235 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!697584 () Bool)

(assert (=> b!697584 (= e!396504 (contains!3771 (t!19476 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96157 res!461501) b!697583))

(assert (= (and b!697583 (not res!461502)) b!697584))

(assert (=> d!96157 m!657941))

(declare-fun m!657951 () Bool)

(assert (=> d!96157 m!657951))

(declare-fun m!657953 () Bool)

(assert (=> b!697584 m!657953))

(assert (=> b!697499 d!96157))

(declare-fun d!96159 () Bool)

(assert (=> d!96159 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697500 d!96159))

(declare-fun b!697595 () Bool)

(declare-fun e!396514 () Bool)

(declare-fun e!396517 () Bool)

(assert (=> b!697595 (= e!396514 e!396517)))

(declare-fun res!461511 () Bool)

(assert (=> b!697595 (=> (not res!461511) (not e!396517))))

(declare-fun e!396515 () Bool)

(assert (=> b!697595 (= res!461511 (not e!396515))))

(declare-fun res!461510 () Bool)

(assert (=> b!697595 (=> (not res!461510) (not e!396515))))

(assert (=> b!697595 (= res!461510 (validKeyInArray!0 (select (arr!19153 a!3626) from!3004)))))

(declare-fun b!697596 () Bool)

(assert (=> b!697596 (= e!396515 (contains!3771 acc!681 (select (arr!19153 a!3626) from!3004)))))

(declare-fun b!697597 () Bool)

(declare-fun e!396516 () Bool)

(assert (=> b!697597 (= e!396517 e!396516)))

(declare-fun c!78410 () Bool)

(assert (=> b!697597 (= c!78410 (validKeyInArray!0 (select (arr!19153 a!3626) from!3004)))))

(declare-fun d!96161 () Bool)

(declare-fun res!461509 () Bool)

(assert (=> d!96161 (=> res!461509 e!396514)))

(assert (=> d!96161 (= res!461509 (bvsge from!3004 (size!19538 a!3626)))))

(assert (=> d!96161 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!396514)))

(declare-fun call!34316 () Bool)

(declare-fun bm!34313 () Bool)

(assert (=> bm!34313 (= call!34316 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78410 (Cons!13190 (select (arr!19153 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!697598 () Bool)

(assert (=> b!697598 (= e!396516 call!34316)))

(declare-fun b!697599 () Bool)

(assert (=> b!697599 (= e!396516 call!34316)))

(assert (= (and d!96161 (not res!461509)) b!697595))

(assert (= (and b!697595 res!461510) b!697596))

(assert (= (and b!697595 res!461511) b!697597))

(assert (= (and b!697597 c!78410) b!697599))

(assert (= (and b!697597 (not c!78410)) b!697598))

(assert (= (or b!697599 b!697598) bm!34313))

(assert (=> b!697595 m!657891))

(assert (=> b!697595 m!657891))

(assert (=> b!697595 m!657893))

(assert (=> b!697596 m!657891))

(assert (=> b!697596 m!657891))

(declare-fun m!657955 () Bool)

(assert (=> b!697596 m!657955))

(assert (=> b!697597 m!657891))

(assert (=> b!697597 m!657891))

(assert (=> b!697597 m!657893))

(assert (=> bm!34313 m!657891))

(declare-fun m!657957 () Bool)

(assert (=> bm!34313 m!657957))

(assert (=> b!697498 d!96161))

(assert (=> b!697509 d!96155))

(assert (=> b!697507 d!96155))

(declare-fun b!697600 () Bool)

(declare-fun e!396518 () Bool)

(declare-fun e!396521 () Bool)

(assert (=> b!697600 (= e!396518 e!396521)))

(declare-fun res!461514 () Bool)

(assert (=> b!697600 (=> (not res!461514) (not e!396521))))

(declare-fun e!396519 () Bool)

(assert (=> b!697600 (= res!461514 (not e!396519))))

(declare-fun res!461513 () Bool)

(assert (=> b!697600 (=> (not res!461513) (not e!396519))))

(assert (=> b!697600 (= res!461513 (validKeyInArray!0 (select (arr!19153 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!697601 () Bool)

(assert (=> b!697601 (= e!396519 (contains!3771 Nil!13191 (select (arr!19153 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!697602 () Bool)

(declare-fun e!396520 () Bool)

(assert (=> b!697602 (= e!396521 e!396520)))

(declare-fun c!78411 () Bool)

(assert (=> b!697602 (= c!78411 (validKeyInArray!0 (select (arr!19153 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!96163 () Bool)

(declare-fun res!461512 () Bool)

(assert (=> d!96163 (=> res!461512 e!396518)))

(assert (=> d!96163 (= res!461512 (bvsge #b00000000000000000000000000000000 (size!19538 a!3626)))))

(assert (=> d!96163 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13191) e!396518)))

(declare-fun bm!34314 () Bool)

(declare-fun call!34317 () Bool)

(assert (=> bm!34314 (= call!34317 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78411 (Cons!13190 (select (arr!19153 a!3626) #b00000000000000000000000000000000) Nil!13191) Nil!13191)))))

(declare-fun b!697603 () Bool)

(assert (=> b!697603 (= e!396520 call!34317)))

(declare-fun b!697604 () Bool)

(assert (=> b!697604 (= e!396520 call!34317)))

(assert (= (and d!96163 (not res!461512)) b!697600))

(assert (= (and b!697600 res!461513) b!697601))

(assert (= (and b!697600 res!461514) b!697602))

(assert (= (and b!697602 c!78411) b!697604))

(assert (= (and b!697602 (not c!78411)) b!697603))

(assert (= (or b!697604 b!697603) bm!34314))

(declare-fun m!657959 () Bool)

(assert (=> b!697600 m!657959))

(assert (=> b!697600 m!657959))

(declare-fun m!657961 () Bool)

(assert (=> b!697600 m!657961))

(assert (=> b!697601 m!657959))

(assert (=> b!697601 m!657959))

(declare-fun m!657963 () Bool)

(assert (=> b!697601 m!657963))

(assert (=> b!697602 m!657959))

(assert (=> b!697602 m!657959))

(assert (=> b!697602 m!657961))

(assert (=> bm!34314 m!657959))

(declare-fun m!657965 () Bool)

(assert (=> bm!34314 m!657965))

(assert (=> b!697508 d!96163))

(declare-fun d!96165 () Bool)

(declare-fun res!461519 () Bool)

(declare-fun e!396526 () Bool)

(assert (=> d!96165 (=> res!461519 e!396526)))

(assert (=> d!96165 (= res!461519 (= (select (arr!19153 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!96165 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!396526)))

(declare-fun b!697609 () Bool)

(declare-fun e!396527 () Bool)

(assert (=> b!697609 (= e!396526 e!396527)))

(declare-fun res!461520 () Bool)

(assert (=> b!697609 (=> (not res!461520) (not e!396527))))

(assert (=> b!697609 (= res!461520 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19538 a!3626)))))

(declare-fun b!697610 () Bool)

(assert (=> b!697610 (= e!396527 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!96165 (not res!461519)) b!697609))

(assert (= (and b!697609 res!461520) b!697610))

(assert (=> d!96165 m!657959))

(declare-fun m!657967 () Bool)

(assert (=> b!697610 m!657967))

(assert (=> b!697495 d!96165))

(declare-fun b!697611 () Bool)

(declare-fun e!396528 () Bool)

(declare-fun e!396531 () Bool)

(assert (=> b!697611 (= e!396528 e!396531)))

(declare-fun res!461523 () Bool)

(assert (=> b!697611 (=> (not res!461523) (not e!396531))))

(declare-fun e!396529 () Bool)

(assert (=> b!697611 (= res!461523 (not e!396529))))

(declare-fun res!461522 () Bool)

(assert (=> b!697611 (=> (not res!461522) (not e!396529))))

(assert (=> b!697611 (= res!461522 (validKeyInArray!0 (select (arr!19153 lt!317158) from!3004)))))

(declare-fun b!697612 () Bool)

(assert (=> b!697612 (= e!396529 (contains!3771 acc!681 (select (arr!19153 lt!317158) from!3004)))))

(declare-fun b!697613 () Bool)

(declare-fun e!396530 () Bool)

(assert (=> b!697613 (= e!396531 e!396530)))

(declare-fun c!78412 () Bool)

(assert (=> b!697613 (= c!78412 (validKeyInArray!0 (select (arr!19153 lt!317158) from!3004)))))

(declare-fun d!96167 () Bool)

(declare-fun res!461521 () Bool)

(assert (=> d!96167 (=> res!461521 e!396528)))

(assert (=> d!96167 (= res!461521 (bvsge from!3004 (size!19538 lt!317158)))))

(assert (=> d!96167 (= (arrayNoDuplicates!0 lt!317158 from!3004 acc!681) e!396528)))

(declare-fun bm!34315 () Bool)

(declare-fun call!34318 () Bool)

(assert (=> bm!34315 (= call!34318 (arrayNoDuplicates!0 lt!317158 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78412 (Cons!13190 (select (arr!19153 lt!317158) from!3004) acc!681) acc!681)))))

(declare-fun b!697614 () Bool)

(assert (=> b!697614 (= e!396530 call!34318)))

(declare-fun b!697615 () Bool)

(assert (=> b!697615 (= e!396530 call!34318)))

(assert (= (and d!96167 (not res!461521)) b!697611))

(assert (= (and b!697611 res!461522) b!697612))

(assert (= (and b!697611 res!461523) b!697613))

(assert (= (and b!697613 c!78412) b!697615))

(assert (= (and b!697613 (not c!78412)) b!697614))

(assert (= (or b!697615 b!697614) bm!34315))

(declare-fun m!657969 () Bool)

(assert (=> b!697611 m!657969))

(assert (=> b!697611 m!657969))

(declare-fun m!657971 () Bool)

(assert (=> b!697611 m!657971))

(assert (=> b!697612 m!657969))

(assert (=> b!697612 m!657969))

(declare-fun m!657973 () Bool)

(assert (=> b!697612 m!657973))

(assert (=> b!697613 m!657969))

(assert (=> b!697613 m!657969))

(assert (=> b!697613 m!657971))

(assert (=> bm!34315 m!657969))

(declare-fun m!657975 () Bool)

(assert (=> bm!34315 m!657975))

(assert (=> b!697496 d!96167))

(declare-fun b!697616 () Bool)

(declare-fun e!396532 () Bool)

(declare-fun e!396535 () Bool)

(assert (=> b!697616 (= e!396532 e!396535)))

(declare-fun res!461526 () Bool)

(assert (=> b!697616 (=> (not res!461526) (not e!396535))))

(declare-fun e!396533 () Bool)

(assert (=> b!697616 (= res!461526 (not e!396533))))

(declare-fun res!461525 () Bool)

(assert (=> b!697616 (=> (not res!461525) (not e!396533))))

(assert (=> b!697616 (= res!461525 (validKeyInArray!0 (select (arr!19153 lt!317158) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697617 () Bool)

(assert (=> b!697617 (= e!396533 (contains!3771 acc!681 (select (arr!19153 lt!317158) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697618 () Bool)

(declare-fun e!396534 () Bool)

(assert (=> b!697618 (= e!396535 e!396534)))

(declare-fun c!78413 () Bool)

(assert (=> b!697618 (= c!78413 (validKeyInArray!0 (select (arr!19153 lt!317158) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!96169 () Bool)

(declare-fun res!461524 () Bool)

(assert (=> d!96169 (=> res!461524 e!396532)))

(assert (=> d!96169 (= res!461524 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19538 lt!317158)))))

(assert (=> d!96169 (= (arrayNoDuplicates!0 lt!317158 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396532)))

(declare-fun bm!34316 () Bool)

(declare-fun call!34319 () Bool)

(assert (=> bm!34316 (= call!34319 (arrayNoDuplicates!0 lt!317158 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78413 (Cons!13190 (select (arr!19153 lt!317158) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!697619 () Bool)

(assert (=> b!697619 (= e!396534 call!34319)))

(declare-fun b!697620 () Bool)

(assert (=> b!697620 (= e!396534 call!34319)))

(assert (= (and d!96169 (not res!461524)) b!697616))

(assert (= (and b!697616 res!461525) b!697617))

(assert (= (and b!697616 res!461526) b!697618))

(assert (= (and b!697618 c!78413) b!697620))

(assert (= (and b!697618 (not c!78413)) b!697619))

(assert (= (or b!697620 b!697619) bm!34316))

(declare-fun m!657977 () Bool)

(assert (=> b!697616 m!657977))

(assert (=> b!697616 m!657977))

(declare-fun m!657979 () Bool)

(assert (=> b!697616 m!657979))

(assert (=> b!697617 m!657977))

(assert (=> b!697617 m!657977))

(declare-fun m!657981 () Bool)

(assert (=> b!697617 m!657981))

(assert (=> b!697618 m!657977))

(assert (=> b!697618 m!657977))

(assert (=> b!697618 m!657979))

(assert (=> bm!34316 m!657977))

(declare-fun m!657983 () Bool)

(assert (=> bm!34316 m!657983))

(assert (=> b!697496 d!96169))

(declare-fun d!96171 () Bool)

(declare-fun e!396538 () Bool)

(assert (=> d!96171 e!396538))

(declare-fun res!461529 () Bool)

(assert (=> d!96171 (=> (not res!461529) (not e!396538))))

(assert (=> d!96171 (= res!461529 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19538 a!3626))))))

(declare-fun lt!317172 () Unit!24578)

(declare-fun choose!41 (array!39987 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13194) Unit!24578)

(assert (=> d!96171 (= lt!317172 (choose!41 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (=> d!96171 (bvslt (size!19538 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!96171 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) lt!317172)))

(declare-fun b!697623 () Bool)

(assert (=> b!697623 (= e!396538 (arrayNoDuplicates!0 (array!39988 (store (arr!19153 a!3626) i!1382 k0!2843) (size!19538 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and d!96171 res!461529) b!697623))

(declare-fun m!657985 () Bool)

(assert (=> d!96171 m!657985))

(assert (=> b!697623 m!657887))

(declare-fun m!657987 () Bool)

(assert (=> b!697623 m!657987))

(assert (=> b!697496 d!96171))

(declare-fun d!96175 () Bool)

(assert (=> d!96175 (= (array_inv!14949 a!3626) (bvsge (size!19538 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62230 d!96175))

(declare-fun b!697628 () Bool)

(declare-fun e!396543 () Bool)

(declare-fun e!396546 () Bool)

(assert (=> b!697628 (= e!396543 e!396546)))

(declare-fun res!461536 () Bool)

(assert (=> b!697628 (=> (not res!461536) (not e!396546))))

(declare-fun e!396544 () Bool)

(assert (=> b!697628 (= res!461536 (not e!396544))))

(declare-fun res!461535 () Bool)

(assert (=> b!697628 (=> (not res!461535) (not e!396544))))

(assert (=> b!697628 (= res!461535 (validKeyInArray!0 (select (arr!19153 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697629 () Bool)

(assert (=> b!697629 (= e!396544 (contains!3771 acc!681 (select (arr!19153 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697630 () Bool)

(declare-fun e!396545 () Bool)

(assert (=> b!697630 (= e!396546 e!396545)))

(declare-fun c!78414 () Bool)

(assert (=> b!697630 (= c!78414 (validKeyInArray!0 (select (arr!19153 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!96177 () Bool)

(declare-fun res!461534 () Bool)

(assert (=> d!96177 (=> res!461534 e!396543)))

(assert (=> d!96177 (= res!461534 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19538 a!3626)))))

(assert (=> d!96177 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396543)))

(declare-fun call!34320 () Bool)

(declare-fun bm!34317 () Bool)

(assert (=> bm!34317 (= call!34320 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78414 (Cons!13190 (select (arr!19153 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!697631 () Bool)

(assert (=> b!697631 (= e!396545 call!34320)))

(declare-fun b!697632 () Bool)

(assert (=> b!697632 (= e!396545 call!34320)))

(assert (= (and d!96177 (not res!461534)) b!697628))

(assert (= (and b!697628 res!461535) b!697629))

(assert (= (and b!697628 res!461536) b!697630))

(assert (= (and b!697630 c!78414) b!697632))

(assert (= (and b!697630 (not c!78414)) b!697631))

(assert (= (or b!697632 b!697631) bm!34317))

(declare-fun m!657989 () Bool)

(assert (=> b!697628 m!657989))

(assert (=> b!697628 m!657989))

(declare-fun m!657991 () Bool)

(assert (=> b!697628 m!657991))

(assert (=> b!697629 m!657989))

(assert (=> b!697629 m!657989))

(declare-fun m!657993 () Bool)

(assert (=> b!697629 m!657993))

(assert (=> b!697630 m!657989))

(assert (=> b!697630 m!657989))

(assert (=> b!697630 m!657991))

(assert (=> bm!34317 m!657989))

(declare-fun m!657995 () Bool)

(assert (=> bm!34317 m!657995))

(assert (=> b!697505 d!96177))

(assert (=> b!697504 d!96155))

(declare-fun d!96179 () Bool)

(assert (=> d!96179 (= (validKeyInArray!0 (select (arr!19153 a!3626) from!3004)) (and (not (= (select (arr!19153 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19153 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697493 d!96179))

(declare-fun d!96181 () Bool)

(declare-fun res!461543 () Bool)

(declare-fun e!396553 () Bool)

(assert (=> d!96181 (=> res!461543 e!396553)))

(assert (=> d!96181 (= res!461543 ((_ is Nil!13191) acc!681))))

(assert (=> d!96181 (= (noDuplicate!1018 acc!681) e!396553)))

(declare-fun b!697639 () Bool)

(declare-fun e!396554 () Bool)

(assert (=> b!697639 (= e!396553 e!396554)))

(declare-fun res!461544 () Bool)

(assert (=> b!697639 (=> (not res!461544) (not e!396554))))

(assert (=> b!697639 (= res!461544 (not (contains!3771 (t!19476 acc!681) (h!14235 acc!681))))))

(declare-fun b!697640 () Bool)

(assert (=> b!697640 (= e!396554 (noDuplicate!1018 (t!19476 acc!681)))))

(assert (= (and d!96181 (not res!461543)) b!697639))

(assert (= (and b!697639 res!461544) b!697640))

(declare-fun m!658003 () Bool)

(assert (=> b!697639 m!658003))

(declare-fun m!658005 () Bool)

(assert (=> b!697640 m!658005))

(assert (=> b!697492 d!96181))

(check-sat (not b!697612) (not b!697584) (not b!697602) (not bm!34314) (not b!697630) (not b!697618) (not b!697613) (not b!697600) (not d!96155) (not b!697617) (not b!697597) (not b!697601) (not b!697628) (not bm!34313) (not d!96153) (not bm!34315) (not b!697616) (not bm!34316) (not b!697610) (not b!697582) (not b!697639) (not b!697623) (not b!697580) (not b!697596) (not bm!34317) (not b!697640) (not b!697595) (not d!96157) (not d!96171) (not b!697611) (not b!697629))
(check-sat)
