; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60376 () Bool)

(assert start!60376)

(declare-fun b!678571 () Bool)

(declare-fun res!444988 () Bool)

(declare-fun e!386660 () Bool)

(assert (=> b!678571 (=> (not res!444988) (not e!386660))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39423 0))(
  ( (array!39424 (arr!18904 (Array (_ BitVec 32) (_ BitVec 64))) (size!19268 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39423)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!678571 (= res!444988 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19268 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678572 () Bool)

(declare-fun res!444989 () Bool)

(assert (=> b!678572 (=> (not res!444989) (not e!386660))))

(declare-datatypes ((List!12945 0))(
  ( (Nil!12942) (Cons!12941 (h!13986 (_ BitVec 64)) (t!19173 List!12945)) )
))
(declare-fun acc!681 () List!12945)

(declare-fun contains!3522 (List!12945 (_ BitVec 64)) Bool)

(assert (=> b!678572 (= res!444989 (not (contains!3522 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678573 () Bool)

(declare-fun res!444984 () Bool)

(assert (=> b!678573 (=> (not res!444984) (not e!386660))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678573 (= res!444984 (validKeyInArray!0 k0!2843))))

(declare-fun b!678574 () Bool)

(declare-fun res!444980 () Bool)

(assert (=> b!678574 (=> (not res!444980) (not e!386660))))

(declare-fun arrayContainsKey!0 (array!39423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678574 (= res!444980 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678575 () Bool)

(declare-fun e!386661 () Bool)

(assert (=> b!678575 (= e!386661 (contains!3522 acc!681 k0!2843))))

(declare-fun b!678576 () Bool)

(declare-fun res!444982 () Bool)

(assert (=> b!678576 (=> (not res!444982) (not e!386660))))

(declare-fun arrayNoDuplicates!0 (array!39423 (_ BitVec 32) List!12945) Bool)

(assert (=> b!678576 (= res!444982 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12942))))

(declare-fun b!678577 () Bool)

(declare-fun e!386663 () Bool)

(assert (=> b!678577 (= e!386663 (not (contains!3522 acc!681 k0!2843)))))

(declare-fun b!678578 () Bool)

(declare-fun res!444992 () Bool)

(assert (=> b!678578 (=> (not res!444992) (not e!386660))))

(assert (=> b!678578 (= res!444992 (not (contains!3522 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678579 () Bool)

(declare-fun res!444991 () Bool)

(assert (=> b!678579 (=> (not res!444991) (not e!386660))))

(declare-fun e!386662 () Bool)

(assert (=> b!678579 (= res!444991 e!386662)))

(declare-fun res!444990 () Bool)

(assert (=> b!678579 (=> res!444990 e!386662)))

(assert (=> b!678579 (= res!444990 e!386661)))

(declare-fun res!444979 () Bool)

(assert (=> b!678579 (=> (not res!444979) (not e!386661))))

(assert (=> b!678579 (= res!444979 (bvsgt from!3004 i!1382))))

(declare-fun b!678581 () Bool)

(declare-fun res!444986 () Bool)

(assert (=> b!678581 (=> (not res!444986) (not e!386660))))

(assert (=> b!678581 (= res!444986 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678582 () Bool)

(declare-fun res!444987 () Bool)

(assert (=> b!678582 (=> (not res!444987) (not e!386660))))

(declare-fun noDuplicate!769 (List!12945) Bool)

(assert (=> b!678582 (= res!444987 (noDuplicate!769 acc!681))))

(declare-fun b!678583 () Bool)

(assert (=> b!678583 (= e!386660 (not (arrayContainsKey!0 (array!39424 (store (arr!18904 a!3626) i!1382 k0!2843) (size!19268 a!3626)) k0!2843 from!3004)))))

(declare-fun b!678584 () Bool)

(assert (=> b!678584 (= e!386662 e!386663)))

(declare-fun res!444983 () Bool)

(assert (=> b!678584 (=> (not res!444983) (not e!386663))))

(assert (=> b!678584 (= res!444983 (bvsle from!3004 i!1382))))

(declare-fun res!444981 () Bool)

(assert (=> start!60376 (=> (not res!444981) (not e!386660))))

(assert (=> start!60376 (= res!444981 (and (bvslt (size!19268 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19268 a!3626))))))

(assert (=> start!60376 e!386660))

(assert (=> start!60376 true))

(declare-fun array_inv!14700 (array!39423) Bool)

(assert (=> start!60376 (array_inv!14700 a!3626)))

(declare-fun b!678580 () Bool)

(declare-fun res!444985 () Bool)

(assert (=> b!678580 (=> (not res!444985) (not e!386660))))

(assert (=> b!678580 (= res!444985 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19268 a!3626))))))

(assert (= (and start!60376 res!444981) b!678582))

(assert (= (and b!678582 res!444987) b!678578))

(assert (= (and b!678578 res!444992) b!678572))

(assert (= (and b!678572 res!444989) b!678579))

(assert (= (and b!678579 res!444979) b!678575))

(assert (= (and b!678579 (not res!444990)) b!678584))

(assert (= (and b!678584 res!444983) b!678577))

(assert (= (and b!678579 res!444991) b!678576))

(assert (= (and b!678576 res!444982) b!678581))

(assert (= (and b!678581 res!444986) b!678580))

(assert (= (and b!678580 res!444985) b!678573))

(assert (= (and b!678573 res!444984) b!678574))

(assert (= (and b!678574 res!444980) b!678571))

(assert (= (and b!678571 res!444988) b!678583))

(declare-fun m!644283 () Bool)

(assert (=> start!60376 m!644283))

(declare-fun m!644285 () Bool)

(assert (=> b!678581 m!644285))

(declare-fun m!644287 () Bool)

(assert (=> b!678575 m!644287))

(declare-fun m!644289 () Bool)

(assert (=> b!678583 m!644289))

(declare-fun m!644291 () Bool)

(assert (=> b!678583 m!644291))

(declare-fun m!644293 () Bool)

(assert (=> b!678578 m!644293))

(declare-fun m!644295 () Bool)

(assert (=> b!678574 m!644295))

(declare-fun m!644297 () Bool)

(assert (=> b!678572 m!644297))

(declare-fun m!644299 () Bool)

(assert (=> b!678576 m!644299))

(declare-fun m!644301 () Bool)

(assert (=> b!678582 m!644301))

(declare-fun m!644303 () Bool)

(assert (=> b!678573 m!644303))

(assert (=> b!678577 m!644287))

(check-sat (not b!678582) (not b!678573) (not b!678575) (not b!678576) (not b!678583) (not b!678578) (not b!678581) (not start!60376) (not b!678572) (not b!678574) (not b!678577))
(check-sat)
(get-model)

(declare-fun b!678658 () Bool)

(declare-fun e!386709 () Bool)

(declare-fun e!386708 () Bool)

(assert (=> b!678658 (= e!386709 e!386708)))

(declare-fun res!445058 () Bool)

(assert (=> b!678658 (=> (not res!445058) (not e!386708))))

(declare-fun e!386707 () Bool)

(assert (=> b!678658 (= res!445058 (not e!386707))))

(declare-fun res!445059 () Bool)

(assert (=> b!678658 (=> (not res!445059) (not e!386707))))

(assert (=> b!678658 (= res!445059 (validKeyInArray!0 (select (arr!18904 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!678659 () Bool)

(declare-fun e!386706 () Bool)

(declare-fun call!33919 () Bool)

(assert (=> b!678659 (= e!386706 call!33919)))

(declare-fun bm!33916 () Bool)

(declare-fun c!77167 () Bool)

(assert (=> bm!33916 (= call!33919 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77167 (Cons!12941 (select (arr!18904 a!3626) #b00000000000000000000000000000000) Nil!12942) Nil!12942)))))

(declare-fun b!678660 () Bool)

(assert (=> b!678660 (= e!386706 call!33919)))

(declare-fun b!678661 () Bool)

(assert (=> b!678661 (= e!386708 e!386706)))

(assert (=> b!678661 (= c!77167 (validKeyInArray!0 (select (arr!18904 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!678657 () Bool)

(assert (=> b!678657 (= e!386707 (contains!3522 Nil!12942 (select (arr!18904 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93421 () Bool)

(declare-fun res!445057 () Bool)

(assert (=> d!93421 (=> res!445057 e!386709)))

(assert (=> d!93421 (= res!445057 (bvsge #b00000000000000000000000000000000 (size!19268 a!3626)))))

(assert (=> d!93421 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12942) e!386709)))

(assert (= (and d!93421 (not res!445057)) b!678658))

(assert (= (and b!678658 res!445059) b!678657))

(assert (= (and b!678658 res!445058) b!678661))

(assert (= (and b!678661 c!77167) b!678660))

(assert (= (and b!678661 (not c!77167)) b!678659))

(assert (= (or b!678660 b!678659) bm!33916))

(declare-fun m!644341 () Bool)

(assert (=> b!678658 m!644341))

(assert (=> b!678658 m!644341))

(declare-fun m!644345 () Bool)

(assert (=> b!678658 m!644345))

(assert (=> bm!33916 m!644341))

(declare-fun m!644349 () Bool)

(assert (=> bm!33916 m!644349))

(assert (=> b!678661 m!644341))

(assert (=> b!678661 m!644341))

(assert (=> b!678661 m!644345))

(assert (=> b!678657 m!644341))

(assert (=> b!678657 m!644341))

(declare-fun m!644355 () Bool)

(assert (=> b!678657 m!644355))

(assert (=> b!678576 d!93421))

(declare-fun b!678668 () Bool)

(declare-fun e!386717 () Bool)

(declare-fun e!386716 () Bool)

(assert (=> b!678668 (= e!386717 e!386716)))

(declare-fun res!445064 () Bool)

(assert (=> b!678668 (=> (not res!445064) (not e!386716))))

(declare-fun e!386715 () Bool)

(assert (=> b!678668 (= res!445064 (not e!386715))))

(declare-fun res!445065 () Bool)

(assert (=> b!678668 (=> (not res!445065) (not e!386715))))

(assert (=> b!678668 (= res!445065 (validKeyInArray!0 (select (arr!18904 a!3626) from!3004)))))

(declare-fun b!678669 () Bool)

(declare-fun e!386714 () Bool)

(declare-fun call!33921 () Bool)

(assert (=> b!678669 (= e!386714 call!33921)))

(declare-fun c!77169 () Bool)

(declare-fun bm!33918 () Bool)

(assert (=> bm!33918 (= call!33921 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77169 (Cons!12941 (select (arr!18904 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!678670 () Bool)

(assert (=> b!678670 (= e!386714 call!33921)))

(declare-fun b!678671 () Bool)

(assert (=> b!678671 (= e!386716 e!386714)))

(assert (=> b!678671 (= c!77169 (validKeyInArray!0 (select (arr!18904 a!3626) from!3004)))))

(declare-fun b!678667 () Bool)

(assert (=> b!678667 (= e!386715 (contains!3522 acc!681 (select (arr!18904 a!3626) from!3004)))))

(declare-fun d!93431 () Bool)

(declare-fun res!445063 () Bool)

(assert (=> d!93431 (=> res!445063 e!386717)))

(assert (=> d!93431 (= res!445063 (bvsge from!3004 (size!19268 a!3626)))))

(assert (=> d!93431 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!386717)))

(assert (= (and d!93431 (not res!445063)) b!678668))

(assert (= (and b!678668 res!445065) b!678667))

(assert (= (and b!678668 res!445064) b!678671))

(assert (= (and b!678671 c!77169) b!678670))

(assert (= (and b!678671 (not c!77169)) b!678669))

(assert (= (or b!678670 b!678669) bm!33918))

(declare-fun m!644357 () Bool)

(assert (=> b!678668 m!644357))

(assert (=> b!678668 m!644357))

(declare-fun m!644361 () Bool)

(assert (=> b!678668 m!644361))

(assert (=> bm!33918 m!644357))

(declare-fun m!644365 () Bool)

(assert (=> bm!33918 m!644365))

(assert (=> b!678671 m!644357))

(assert (=> b!678671 m!644357))

(assert (=> b!678671 m!644361))

(assert (=> b!678667 m!644357))

(assert (=> b!678667 m!644357))

(declare-fun m!644371 () Bool)

(assert (=> b!678667 m!644371))

(assert (=> b!678581 d!93431))

(declare-fun d!93435 () Bool)

(assert (=> d!93435 (= (array_inv!14700 a!3626) (bvsge (size!19268 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60376 d!93435))

(declare-fun d!93439 () Bool)

(declare-fun lt!312906 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!263 (List!12945) (InoxSet (_ BitVec 64)))

(assert (=> d!93439 (= lt!312906 (select (content!263 acc!681) k0!2843))))

(declare-fun e!386740 () Bool)

(assert (=> d!93439 (= lt!312906 e!386740)))

(declare-fun res!445085 () Bool)

(assert (=> d!93439 (=> (not res!445085) (not e!386740))))

(get-info :version)

(assert (=> d!93439 (= res!445085 ((_ is Cons!12941) acc!681))))

(assert (=> d!93439 (= (contains!3522 acc!681 k0!2843) lt!312906)))

(declare-fun b!678697 () Bool)

(declare-fun e!386741 () Bool)

(assert (=> b!678697 (= e!386740 e!386741)))

(declare-fun res!445086 () Bool)

(assert (=> b!678697 (=> res!445086 e!386741)))

(assert (=> b!678697 (= res!445086 (= (h!13986 acc!681) k0!2843))))

(declare-fun b!678698 () Bool)

(assert (=> b!678698 (= e!386741 (contains!3522 (t!19173 acc!681) k0!2843))))

(assert (= (and d!93439 res!445085) b!678697))

(assert (= (and b!678697 (not res!445086)) b!678698))

(declare-fun m!644379 () Bool)

(assert (=> d!93439 m!644379))

(declare-fun m!644381 () Bool)

(assert (=> d!93439 m!644381))

(declare-fun m!644383 () Bool)

(assert (=> b!678698 m!644383))

(assert (=> b!678575 d!93439))

(declare-fun d!93443 () Bool)

(declare-fun res!445102 () Bool)

(declare-fun e!386758 () Bool)

(assert (=> d!93443 (=> res!445102 e!386758)))

(assert (=> d!93443 (= res!445102 (= (select (arr!18904 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93443 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!386758)))

(declare-fun b!678716 () Bool)

(declare-fun e!386759 () Bool)

(assert (=> b!678716 (= e!386758 e!386759)))

(declare-fun res!445103 () Bool)

(assert (=> b!678716 (=> (not res!445103) (not e!386759))))

(assert (=> b!678716 (= res!445103 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19268 a!3626)))))

(declare-fun b!678717 () Bool)

(assert (=> b!678717 (= e!386759 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93443 (not res!445102)) b!678716))

(assert (= (and b!678716 res!445103) b!678717))

(assert (=> d!93443 m!644341))

(declare-fun m!644399 () Bool)

(assert (=> b!678717 m!644399))

(assert (=> b!678574 d!93443))

(declare-fun d!93453 () Bool)

(declare-fun lt!312908 () Bool)

(assert (=> d!93453 (= lt!312908 (select (content!263 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!386764 () Bool)

(assert (=> d!93453 (= lt!312908 e!386764)))

(declare-fun res!445108 () Bool)

(assert (=> d!93453 (=> (not res!445108) (not e!386764))))

(assert (=> d!93453 (= res!445108 ((_ is Cons!12941) acc!681))))

(assert (=> d!93453 (= (contains!3522 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312908)))

(declare-fun b!678722 () Bool)

(declare-fun e!386765 () Bool)

(assert (=> b!678722 (= e!386764 e!386765)))

(declare-fun res!445109 () Bool)

(assert (=> b!678722 (=> res!445109 e!386765)))

(assert (=> b!678722 (= res!445109 (= (h!13986 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678723 () Bool)

(assert (=> b!678723 (= e!386765 (contains!3522 (t!19173 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93453 res!445108) b!678722))

(assert (= (and b!678722 (not res!445109)) b!678723))

(assert (=> d!93453 m!644379))

(declare-fun m!644401 () Bool)

(assert (=> d!93453 m!644401))

(declare-fun m!644403 () Bool)

(assert (=> b!678723 m!644403))

(assert (=> b!678578 d!93453))

(declare-fun d!93455 () Bool)

(assert (=> d!93455 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!678573 d!93455))

(declare-fun d!93461 () Bool)

(declare-fun lt!312909 () Bool)

(assert (=> d!93461 (= lt!312909 (select (content!263 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!386770 () Bool)

(assert (=> d!93461 (= lt!312909 e!386770)))

(declare-fun res!445114 () Bool)

(assert (=> d!93461 (=> (not res!445114) (not e!386770))))

(assert (=> d!93461 (= res!445114 ((_ is Cons!12941) acc!681))))

(assert (=> d!93461 (= (contains!3522 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312909)))

(declare-fun b!678728 () Bool)

(declare-fun e!386771 () Bool)

(assert (=> b!678728 (= e!386770 e!386771)))

(declare-fun res!445115 () Bool)

(assert (=> b!678728 (=> res!445115 e!386771)))

(assert (=> b!678728 (= res!445115 (= (h!13986 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678729 () Bool)

(assert (=> b!678729 (= e!386771 (contains!3522 (t!19173 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93461 res!445114) b!678728))

(assert (= (and b!678728 (not res!445115)) b!678729))

(assert (=> d!93461 m!644379))

(declare-fun m!644413 () Bool)

(assert (=> d!93461 m!644413))

(declare-fun m!644415 () Bool)

(assert (=> b!678729 m!644415))

(assert (=> b!678572 d!93461))

(declare-fun d!93465 () Bool)

(declare-fun res!445116 () Bool)

(declare-fun e!386772 () Bool)

(assert (=> d!93465 (=> res!445116 e!386772)))

(assert (=> d!93465 (= res!445116 (= (select (arr!18904 (array!39424 (store (arr!18904 a!3626) i!1382 k0!2843) (size!19268 a!3626))) from!3004) k0!2843))))

(assert (=> d!93465 (= (arrayContainsKey!0 (array!39424 (store (arr!18904 a!3626) i!1382 k0!2843) (size!19268 a!3626)) k0!2843 from!3004) e!386772)))

(declare-fun b!678730 () Bool)

(declare-fun e!386773 () Bool)

(assert (=> b!678730 (= e!386772 e!386773)))

(declare-fun res!445117 () Bool)

(assert (=> b!678730 (=> (not res!445117) (not e!386773))))

(assert (=> b!678730 (= res!445117 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19268 (array!39424 (store (arr!18904 a!3626) i!1382 k0!2843) (size!19268 a!3626)))))))

(declare-fun b!678731 () Bool)

(assert (=> b!678731 (= e!386773 (arrayContainsKey!0 (array!39424 (store (arr!18904 a!3626) i!1382 k0!2843) (size!19268 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93465 (not res!445116)) b!678730))

(assert (= (and b!678730 res!445117) b!678731))

(declare-fun m!644417 () Bool)

(assert (=> d!93465 m!644417))

(declare-fun m!644419 () Bool)

(assert (=> b!678731 m!644419))

(assert (=> b!678583 d!93465))

(declare-fun d!93467 () Bool)

(declare-fun res!445136 () Bool)

(declare-fun e!386792 () Bool)

(assert (=> d!93467 (=> res!445136 e!386792)))

(assert (=> d!93467 (= res!445136 ((_ is Nil!12942) acc!681))))

(assert (=> d!93467 (= (noDuplicate!769 acc!681) e!386792)))

(declare-fun b!678750 () Bool)

(declare-fun e!386793 () Bool)

(assert (=> b!678750 (= e!386792 e!386793)))

(declare-fun res!445137 () Bool)

(assert (=> b!678750 (=> (not res!445137) (not e!386793))))

(assert (=> b!678750 (= res!445137 (not (contains!3522 (t!19173 acc!681) (h!13986 acc!681))))))

(declare-fun b!678751 () Bool)

(assert (=> b!678751 (= e!386793 (noDuplicate!769 (t!19173 acc!681)))))

(assert (= (and d!93467 (not res!445136)) b!678750))

(assert (= (and b!678750 res!445137) b!678751))

(declare-fun m!644433 () Bool)

(assert (=> b!678750 m!644433))

(declare-fun m!644435 () Bool)

(assert (=> b!678751 m!644435))

(assert (=> b!678582 d!93467))

(assert (=> b!678577 d!93439))

(check-sat (not b!678750) (not b!678731) (not b!678723) (not b!678729) (not b!678657) (not b!678717) (not b!678698) (not d!93461) (not d!93439) (not bm!33918) (not b!678667) (not d!93453) (not b!678668) (not b!678661) (not b!678671) (not b!678751) (not bm!33916) (not b!678658))
(check-sat)
