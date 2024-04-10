; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61970 () Bool)

(assert start!61970)

(declare-fun b!693352 () Bool)

(declare-fun res!457517 () Bool)

(declare-fun e!394494 () Bool)

(assert (=> b!693352 (=> (not res!457517) (not e!394494))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39856 0))(
  ( (array!39857 (arr!19092 (Array (_ BitVec 32) (_ BitVec 64))) (size!19477 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39856)

(assert (=> b!693352 (= res!457517 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19477 a!3626))))))

(declare-fun b!693353 () Bool)

(declare-fun e!394499 () Bool)

(declare-fun e!394496 () Bool)

(assert (=> b!693353 (= e!394499 e!394496)))

(declare-fun res!457509 () Bool)

(assert (=> b!693353 (=> (not res!457509) (not e!394496))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!693353 (= res!457509 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693354 () Bool)

(declare-fun e!394495 () Bool)

(declare-fun e!394491 () Bool)

(assert (=> b!693354 (= e!394495 e!394491)))

(declare-fun res!457500 () Bool)

(assert (=> b!693354 (=> (not res!457500) (not e!394491))))

(assert (=> b!693354 (= res!457500 (bvsle from!3004 i!1382))))

(declare-fun b!693355 () Bool)

(declare-fun res!457516 () Bool)

(assert (=> b!693355 (=> (not res!457516) (not e!394494))))

(declare-datatypes ((List!13133 0))(
  ( (Nil!13130) (Cons!13129 (h!14174 (_ BitVec 64)) (t!19409 List!13133)) )
))
(declare-fun arrayNoDuplicates!0 (array!39856 (_ BitVec 32) List!13133) Bool)

(assert (=> b!693355 (= res!457516 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13130))))

(declare-fun b!693356 () Bool)

(declare-fun e!394497 () Bool)

(assert (=> b!693356 (= e!394494 e!394497)))

(declare-fun res!457504 () Bool)

(assert (=> b!693356 (=> (not res!457504) (not e!394497))))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!693356 (= res!457504 (not (= (select (arr!19092 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!24486 0))(
  ( (Unit!24487) )
))
(declare-fun lt!316740 () Unit!24486)

(declare-fun e!394498 () Unit!24486)

(assert (=> b!693356 (= lt!316740 e!394498)))

(declare-fun c!78296 () Bool)

(assert (=> b!693356 (= c!78296 (= (select (arr!19092 a!3626) from!3004) k!2843))))

(declare-fun b!693357 () Bool)

(declare-fun res!457496 () Bool)

(declare-fun e!394490 () Bool)

(assert (=> b!693357 (=> (not res!457496) (not e!394490))))

(declare-fun lt!316741 () List!13133)

(declare-fun noDuplicate!957 (List!13133) Bool)

(assert (=> b!693357 (= res!457496 (noDuplicate!957 lt!316741))))

(declare-fun b!693358 () Bool)

(declare-fun res!457512 () Bool)

(assert (=> b!693358 (=> (not res!457512) (not e!394494))))

(assert (=> b!693358 (= res!457512 e!394495)))

(declare-fun res!457508 () Bool)

(assert (=> b!693358 (=> res!457508 e!394495)))

(declare-fun e!394493 () Bool)

(assert (=> b!693358 (= res!457508 e!394493)))

(declare-fun res!457497 () Bool)

(assert (=> b!693358 (=> (not res!457497) (not e!394493))))

(assert (=> b!693358 (= res!457497 (bvsgt from!3004 i!1382))))

(declare-fun b!693359 () Bool)

(declare-fun res!457494 () Bool)

(assert (=> b!693359 (=> (not res!457494) (not e!394494))))

(declare-fun acc!681 () List!13133)

(declare-fun contains!3710 (List!13133 (_ BitVec 64)) Bool)

(assert (=> b!693359 (= res!457494 (not (contains!3710 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693360 () Bool)

(declare-fun res!457498 () Bool)

(assert (=> b!693360 (=> (not res!457498) (not e!394490))))

(assert (=> b!693360 (= res!457498 e!394499)))

(declare-fun res!457515 () Bool)

(assert (=> b!693360 (=> res!457515 e!394499)))

(declare-fun e!394500 () Bool)

(assert (=> b!693360 (= res!457515 e!394500)))

(declare-fun res!457510 () Bool)

(assert (=> b!693360 (=> (not res!457510) (not e!394500))))

(assert (=> b!693360 (= res!457510 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693361 () Bool)

(assert (=> b!693361 (= e!394490 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316741)))))

(declare-fun b!693362 () Bool)

(declare-fun res!457495 () Bool)

(assert (=> b!693362 (=> (not res!457495) (not e!394494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693362 (= res!457495 (validKeyInArray!0 (select (arr!19092 a!3626) from!3004)))))

(declare-fun b!693363 () Bool)

(declare-fun res!457499 () Bool)

(assert (=> b!693363 (=> (not res!457499) (not e!394494))))

(assert (=> b!693363 (= res!457499 (not (contains!3710 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693364 () Bool)

(declare-fun res!457514 () Bool)

(assert (=> b!693364 (=> (not res!457514) (not e!394490))))

(assert (=> b!693364 (= res!457514 (not (contains!3710 lt!316741 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!457502 () Bool)

(assert (=> start!61970 (=> (not res!457502) (not e!394494))))

(assert (=> start!61970 (= res!457502 (and (bvslt (size!19477 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19477 a!3626))))))

(assert (=> start!61970 e!394494))

(assert (=> start!61970 true))

(declare-fun array_inv!14888 (array!39856) Bool)

(assert (=> start!61970 (array_inv!14888 a!3626)))

(declare-fun b!693365 () Bool)

(declare-fun res!457503 () Bool)

(assert (=> b!693365 (=> (not res!457503) (not e!394494))))

(assert (=> b!693365 (= res!457503 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19477 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693366 () Bool)

(declare-fun Unit!24488 () Unit!24486)

(assert (=> b!693366 (= e!394498 Unit!24488)))

(declare-fun b!693367 () Bool)

(declare-fun res!457511 () Bool)

(assert (=> b!693367 (=> (not res!457511) (not e!394494))))

(declare-fun arrayContainsKey!0 (array!39856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693367 (= res!457511 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693368 () Bool)

(declare-fun Unit!24489 () Unit!24486)

(assert (=> b!693368 (= e!394498 Unit!24489)))

(assert (=> b!693368 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316739 () Unit!24486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39856 (_ BitVec 64) (_ BitVec 32)) Unit!24486)

(assert (=> b!693368 (= lt!316739 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!693368 false))

(declare-fun b!693369 () Bool)

(declare-fun res!457513 () Bool)

(assert (=> b!693369 (=> (not res!457513) (not e!394494))))

(assert (=> b!693369 (= res!457513 (noDuplicate!957 acc!681))))

(declare-fun b!693370 () Bool)

(assert (=> b!693370 (= e!394496 (not (contains!3710 lt!316741 k!2843)))))

(declare-fun b!693371 () Bool)

(assert (=> b!693371 (= e!394493 (contains!3710 acc!681 k!2843))))

(declare-fun b!693372 () Bool)

(assert (=> b!693372 (= e!394500 (contains!3710 lt!316741 k!2843))))

(declare-fun b!693373 () Bool)

(declare-fun res!457505 () Bool)

(assert (=> b!693373 (=> (not res!457505) (not e!394494))))

(assert (=> b!693373 (= res!457505 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693374 () Bool)

(declare-fun res!457501 () Bool)

(assert (=> b!693374 (=> (not res!457501) (not e!394494))))

(assert (=> b!693374 (= res!457501 (validKeyInArray!0 k!2843))))

(declare-fun b!693375 () Bool)

(assert (=> b!693375 (= e!394497 e!394490)))

(declare-fun res!457507 () Bool)

(assert (=> b!693375 (=> (not res!457507) (not e!394490))))

(assert (=> b!693375 (= res!457507 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!422 (List!13133 (_ BitVec 64)) List!13133)

(assert (=> b!693375 (= lt!316741 ($colon$colon!422 acc!681 (select (arr!19092 a!3626) from!3004)))))

(declare-fun b!693376 () Bool)

(declare-fun res!457506 () Bool)

(assert (=> b!693376 (=> (not res!457506) (not e!394490))))

(assert (=> b!693376 (= res!457506 (not (contains!3710 lt!316741 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693377 () Bool)

(assert (=> b!693377 (= e!394491 (not (contains!3710 acc!681 k!2843)))))

(assert (= (and start!61970 res!457502) b!693369))

(assert (= (and b!693369 res!457513) b!693363))

(assert (= (and b!693363 res!457499) b!693359))

(assert (= (and b!693359 res!457494) b!693358))

(assert (= (and b!693358 res!457497) b!693371))

(assert (= (and b!693358 (not res!457508)) b!693354))

(assert (= (and b!693354 res!457500) b!693377))

(assert (= (and b!693358 res!457512) b!693355))

(assert (= (and b!693355 res!457516) b!693373))

(assert (= (and b!693373 res!457505) b!693352))

(assert (= (and b!693352 res!457517) b!693374))

(assert (= (and b!693374 res!457501) b!693367))

(assert (= (and b!693367 res!457511) b!693365))

(assert (= (and b!693365 res!457503) b!693362))

(assert (= (and b!693362 res!457495) b!693356))

(assert (= (and b!693356 c!78296) b!693368))

(assert (= (and b!693356 (not c!78296)) b!693366))

(assert (= (and b!693356 res!457504) b!693375))

(assert (= (and b!693375 res!457507) b!693357))

(assert (= (and b!693357 res!457496) b!693376))

(assert (= (and b!693376 res!457506) b!693364))

(assert (= (and b!693364 res!457514) b!693360))

(assert (= (and b!693360 res!457510) b!693372))

(assert (= (and b!693360 (not res!457515)) b!693353))

(assert (= (and b!693353 res!457509) b!693370))

(assert (= (and b!693360 res!457498) b!693361))

(declare-fun m!655637 () Bool)

(assert (=> b!693373 m!655637))

(declare-fun m!655639 () Bool)

(assert (=> b!693369 m!655639))

(declare-fun m!655641 () Bool)

(assert (=> b!693362 m!655641))

(assert (=> b!693362 m!655641))

(declare-fun m!655643 () Bool)

(assert (=> b!693362 m!655643))

(declare-fun m!655645 () Bool)

(assert (=> start!61970 m!655645))

(declare-fun m!655647 () Bool)

(assert (=> b!693364 m!655647))

(declare-fun m!655649 () Bool)

(assert (=> b!693357 m!655649))

(declare-fun m!655651 () Bool)

(assert (=> b!693355 m!655651))

(assert (=> b!693356 m!655641))

(declare-fun m!655653 () Bool)

(assert (=> b!693361 m!655653))

(declare-fun m!655655 () Bool)

(assert (=> b!693376 m!655655))

(assert (=> b!693375 m!655641))

(assert (=> b!693375 m!655641))

(declare-fun m!655657 () Bool)

(assert (=> b!693375 m!655657))

(declare-fun m!655659 () Bool)

(assert (=> b!693363 m!655659))

(declare-fun m!655661 () Bool)

(assert (=> b!693371 m!655661))

(declare-fun m!655663 () Bool)

(assert (=> b!693370 m!655663))

(assert (=> b!693372 m!655663))

(declare-fun m!655665 () Bool)

(assert (=> b!693367 m!655665))

(declare-fun m!655667 () Bool)

(assert (=> b!693359 m!655667))

(declare-fun m!655669 () Bool)

(assert (=> b!693374 m!655669))

(assert (=> b!693377 m!655661))

(declare-fun m!655671 () Bool)

(assert (=> b!693368 m!655671))

(declare-fun m!655673 () Bool)

(assert (=> b!693368 m!655673))

(push 1)

(assert (not b!693375))

(assert (not b!693359))

(assert (not b!693361))

(assert (not b!693370))

(assert (not start!61970))

(assert (not b!693373))

(assert (not b!693369))

(assert (not b!693364))

(assert (not b!693363))

(assert (not b!693362))

(assert (not b!693371))

(assert (not b!693367))

(assert (not b!693357))

(assert (not b!693355))

(assert (not b!693376))

(assert (not b!693374))

(assert (not b!693372))

(assert (not b!693368))

(assert (not b!693377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95837 () Bool)

(declare-fun lt!316777 () Bool)

(declare-fun content!319 (List!13133) (Set (_ BitVec 64)))

(assert (=> d!95837 (= lt!316777 (set.member k!2843 (content!319 lt!316741)))))

(declare-fun e!394610 () Bool)

(assert (=> d!95837 (= lt!316777 e!394610)))

(declare-fun res!457705 () Bool)

(assert (=> d!95837 (=> (not res!457705) (not e!394610))))

(assert (=> d!95837 (= res!457705 (is-Cons!13129 lt!316741))))

(assert (=> d!95837 (= (contains!3710 lt!316741 k!2843) lt!316777)))

(declare-fun b!693576 () Bool)

(declare-fun e!394609 () Bool)

(assert (=> b!693576 (= e!394610 e!394609)))

(declare-fun res!457704 () Bool)

(assert (=> b!693576 (=> res!457704 e!394609)))

(assert (=> b!693576 (= res!457704 (= (h!14174 lt!316741) k!2843))))

(declare-fun b!693577 () Bool)

(assert (=> b!693577 (= e!394609 (contains!3710 (t!19409 lt!316741) k!2843))))

(assert (= (and d!95837 res!457705) b!693576))

(assert (= (and b!693576 (not res!457704)) b!693577))

(declare-fun m!655795 () Bool)

(assert (=> d!95837 m!655795))

(declare-fun m!655797 () Bool)

(assert (=> d!95837 m!655797))

(declare-fun m!655801 () Bool)

(assert (=> b!693577 m!655801))

(assert (=> b!693370 d!95837))

(declare-fun d!95847 () Bool)

(declare-fun lt!316779 () Bool)

(assert (=> d!95847 (= lt!316779 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!319 acc!681)))))

(declare-fun e!394620 () Bool)

(assert (=> d!95847 (= lt!316779 e!394620)))

(declare-fun res!457715 () Bool)

(assert (=> d!95847 (=> (not res!457715) (not e!394620))))

(assert (=> d!95847 (= res!457715 (is-Cons!13129 acc!681))))

(assert (=> d!95847 (= (contains!3710 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316779)))

(declare-fun b!693582 () Bool)

(declare-fun e!394619 () Bool)

(assert (=> b!693582 (= e!394620 e!394619)))

(declare-fun res!457712 () Bool)

(assert (=> b!693582 (=> res!457712 e!394619)))

(assert (=> b!693582 (= res!457712 (= (h!14174 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693583 () Bool)

(assert (=> b!693583 (= e!394619 (contains!3710 (t!19409 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95847 res!457715) b!693582))

(assert (= (and b!693582 (not res!457712)) b!693583))

(declare-fun m!655805 () Bool)

(assert (=> d!95847 m!655805))

(declare-fun m!655807 () Bool)

(assert (=> d!95847 m!655807))

(declare-fun m!655809 () Bool)

(assert (=> b!693583 m!655809))

(assert (=> b!693359 d!95847))

(declare-fun d!95853 () Bool)

(declare-fun res!457726 () Bool)

(declare-fun e!394633 () Bool)

(assert (=> d!95853 (=> res!457726 e!394633)))

(assert (=> d!95853 (= res!457726 (is-Nil!13130 acc!681))))

(assert (=> d!95853 (= (noDuplicate!957 acc!681) e!394633)))

(declare-fun b!693602 () Bool)

(declare-fun e!394634 () Bool)

(assert (=> b!693602 (= e!394633 e!394634)))

(declare-fun res!457727 () Bool)

(assert (=> b!693602 (=> (not res!457727) (not e!394634))))

(assert (=> b!693602 (= res!457727 (not (contains!3710 (t!19409 acc!681) (h!14174 acc!681))))))

(declare-fun b!693603 () Bool)

(assert (=> b!693603 (= e!394634 (noDuplicate!957 (t!19409 acc!681)))))

(assert (= (and d!95853 (not res!457726)) b!693602))

(assert (= (and b!693602 res!457727) b!693603))

(declare-fun m!655815 () Bool)

(assert (=> b!693602 m!655815))

(declare-fun m!655817 () Bool)

(assert (=> b!693603 m!655817))

(assert (=> b!693369 d!95853))

(declare-fun d!95857 () Bool)

(declare-fun res!457740 () Bool)

(declare-fun e!394649 () Bool)

(assert (=> d!95857 (=> res!457740 e!394649)))

(assert (=> d!95857 (= res!457740 (= (select (arr!19092 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95857 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!394649)))

(declare-fun b!693620 () Bool)

(declare-fun e!394650 () Bool)

(assert (=> b!693620 (= e!394649 e!394650)))

(declare-fun res!457741 () Bool)

(assert (=> b!693620 (=> (not res!457741) (not e!394650))))

(assert (=> b!693620 (= res!457741 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19477 a!3626)))))

(declare-fun b!693621 () Bool)

(assert (=> b!693621 (= e!394650 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95857 (not res!457740)) b!693620))

(assert (= (and b!693620 res!457741) b!693621))

(declare-fun m!655835 () Bool)

(assert (=> d!95857 m!655835))

(declare-fun m!655837 () Bool)

(assert (=> b!693621 m!655837))

(assert (=> b!693367 d!95857))

(declare-fun d!95867 () Bool)

(declare-fun res!457742 () Bool)

(declare-fun e!394651 () Bool)

(assert (=> d!95867 (=> res!457742 e!394651)))

(assert (=> d!95867 (= res!457742 (= (select (arr!19092 a!3626) from!3004) k!2843))))

(assert (=> d!95867 (= (arrayContainsKey!0 a!3626 k!2843 from!3004) e!394651)))

(declare-fun b!693622 () Bool)

(declare-fun e!394652 () Bool)

(assert (=> b!693622 (= e!394651 e!394652)))

(declare-fun res!457743 () Bool)

(assert (=> b!693622 (=> (not res!457743) (not e!394652))))

(assert (=> b!693622 (= res!457743 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19477 a!3626)))))

(declare-fun b!693623 () Bool)

(assert (=> b!693623 (= e!394652 (arrayContainsKey!0 a!3626 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95867 (not res!457742)) b!693622))

(assert (= (and b!693622 res!457743) b!693623))

(assert (=> d!95867 m!655641))

(declare-fun m!655839 () Bool)

(assert (=> b!693623 m!655839))

(assert (=> b!693368 d!95867))

(declare-fun d!95869 () Bool)

(assert (=> d!95869 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316784 () Unit!24486)

(declare-fun choose!13 (array!39856 (_ BitVec 64) (_ BitVec 32)) Unit!24486)

(assert (=> d!95869 (= lt!316784 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!95869 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95869 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!316784)))

(declare-fun bs!20286 () Bool)

(assert (= bs!20286 d!95869))

(assert (=> bs!20286 m!655665))

(declare-fun m!655853 () Bool)

(assert (=> bs!20286 m!655853))

(assert (=> b!693368 d!95869))

(declare-fun d!95877 () Bool)

(declare-fun res!457757 () Bool)

(declare-fun e!394669 () Bool)

(assert (=> d!95877 (=> res!457757 e!394669)))

(assert (=> d!95877 (= res!457757 (is-Nil!13130 lt!316741))))

(assert (=> d!95877 (= (noDuplicate!957 lt!316741) e!394669)))

(declare-fun b!693643 () Bool)

(declare-fun e!394670 () Bool)

(assert (=> b!693643 (= e!394669 e!394670)))

(declare-fun res!457758 () Bool)

(assert (=> b!693643 (=> (not res!457758) (not e!394670))))

(assert (=> b!693643 (= res!457758 (not (contains!3710 (t!19409 lt!316741) (h!14174 lt!316741))))))

(declare-fun b!693644 () Bool)

(assert (=> b!693644 (= e!394670 (noDuplicate!957 (t!19409 lt!316741)))))

(assert (= (and d!95877 (not res!457757)) b!693643))

(assert (= (and b!693643 res!457758) b!693644))

(declare-fun m!655857 () Bool)

(assert (=> b!693643 m!655857))

(declare-fun m!655859 () Bool)

(assert (=> b!693644 m!655859))

(assert (=> b!693357 d!95877))

(declare-fun d!95881 () Bool)

(declare-fun res!457787 () Bool)

(declare-fun e!394706 () Bool)

(assert (=> d!95881 (=> res!457787 e!394706)))

(assert (=> d!95881 (= res!457787 (bvsge #b00000000000000000000000000000000 (size!19477 a!3626)))))

(assert (=> d!95881 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13130) e!394706)))

(declare-fun b!693682 () Bool)

(declare-fun e!394704 () Bool)

(assert (=> b!693682 (= e!394704 (contains!3710 Nil!13130 (select (arr!19092 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!693683 () Bool)

(declare-fun e!394703 () Bool)

(declare-fun call!34275 () Bool)

(assert (=> b!693683 (= e!394703 call!34275)))

(declare-fun b!693684 () Bool)

(declare-fun e!394705 () Bool)

(assert (=> b!693684 (= e!394706 e!394705)))

(declare-fun res!457788 () Bool)

(assert (=> b!693684 (=> (not res!457788) (not e!394705))))

(assert (=> b!693684 (= res!457788 (not e!394704))))

(declare-fun res!457786 () Bool)

(assert (=> b!693684 (=> (not res!457786) (not e!394704))))

(assert (=> b!693684 (= res!457786 (validKeyInArray!0 (select (arr!19092 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34272 () Bool)

(declare-fun c!78315 () Bool)

(assert (=> bm!34272 (= call!34275 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78315 (Cons!13129 (select (arr!19092 a!3626) #b00000000000000000000000000000000) Nil!13130) Nil!13130)))))

(declare-fun b!693685 () Bool)

(assert (=> b!693685 (= e!394705 e!394703)))

(assert (=> b!693685 (= c!78315 (validKeyInArray!0 (select (arr!19092 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!693686 () Bool)

(assert (=> b!693686 (= e!394703 call!34275)))

(assert (= (and d!95881 (not res!457787)) b!693684))

(assert (= (and b!693684 res!457786) b!693682))

(assert (= (and b!693684 res!457788) b!693685))

(assert (= (and b!693685 c!78315) b!693686))

(assert (= (and b!693685 (not c!78315)) b!693683))

(assert (= (or b!693686 b!693683) bm!34272))

(assert (=> b!693682 m!655835))

(assert (=> b!693682 m!655835))

(declare-fun m!655903 () Bool)

(assert (=> b!693682 m!655903))

(assert (=> b!693684 m!655835))

(assert (=> b!693684 m!655835))

(declare-fun m!655905 () Bool)

(assert (=> b!693684 m!655905))

(assert (=> bm!34272 m!655835))

(declare-fun m!655907 () Bool)

(assert (=> bm!34272 m!655907))

(assert (=> b!693685 m!655835))

(assert (=> b!693685 m!655835))

(assert (=> b!693685 m!655905))

(assert (=> b!693355 d!95881))

(declare-fun d!95901 () Bool)

(declare-fun lt!316789 () Bool)

(assert (=> d!95901 (= lt!316789 (set.member k!2843 (content!319 acc!681)))))

(declare-fun e!394708 () Bool)

(assert (=> d!95901 (= lt!316789 e!394708)))

(declare-fun res!457790 () Bool)

(assert (=> d!95901 (=> (not res!457790) (not e!394708))))

(assert (=> d!95901 (= res!457790 (is-Cons!13129 acc!681))))

(assert (=> d!95901 (= (contains!3710 acc!681 k!2843) lt!316789)))

(declare-fun b!693687 () Bool)

(declare-fun e!394707 () Bool)

(assert (=> b!693687 (= e!394708 e!394707)))

(declare-fun res!457789 () Bool)

(assert (=> b!693687 (=> res!457789 e!394707)))

(assert (=> b!693687 (= res!457789 (= (h!14174 acc!681) k!2843))))

(declare-fun b!693688 () Bool)

(assert (=> b!693688 (= e!394707 (contains!3710 (t!19409 acc!681) k!2843))))

(assert (= (and d!95901 res!457790) b!693687))

(assert (= (and b!693687 (not res!457789)) b!693688))

(assert (=> d!95901 m!655805))

(declare-fun m!655909 () Bool)

(assert (=> d!95901 m!655909))

(declare-fun m!655911 () Bool)

(assert (=> b!693688 m!655911))

(assert (=> b!693377 d!95901))

(declare-fun d!95903 () Bool)

(assert (=> d!95903 (= ($colon$colon!422 acc!681 (select (arr!19092 a!3626) from!3004)) (Cons!13129 (select (arr!19092 a!3626) from!3004) acc!681))))

(assert (=> b!693375 d!95903))

(declare-fun d!95905 () Bool)

(declare-fun lt!316790 () Bool)

(assert (=> d!95905 (= lt!316790 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!319 lt!316741)))))

(declare-fun e!394710 () Bool)

(assert (=> d!95905 (= lt!316790 e!394710)))

(declare-fun res!457792 () Bool)

(assert (=> d!95905 (=> (not res!457792) (not e!394710))))

(assert (=> d!95905 (= res!457792 (is-Cons!13129 lt!316741))))

(assert (=> d!95905 (= (contains!3710 lt!316741 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316790)))

(declare-fun b!693689 () Bool)

(declare-fun e!394709 () Bool)

(assert (=> b!693689 (= e!394710 e!394709)))

(declare-fun res!457791 () Bool)

(assert (=> b!693689 (=> res!457791 e!394709)))

(assert (=> b!693689 (= res!457791 (= (h!14174 lt!316741) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693690 () Bool)

(assert (=> b!693690 (= e!394709 (contains!3710 (t!19409 lt!316741) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95905 res!457792) b!693689))

(assert (= (and b!693689 (not res!457791)) b!693690))

(assert (=> d!95905 m!655795))

(declare-fun m!655913 () Bool)

(assert (=> d!95905 m!655913))

(declare-fun m!655915 () Bool)

(assert (=> b!693690 m!655915))

(assert (=> b!693376 d!95905))

(declare-fun d!95907 () Bool)

(assert (=> d!95907 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!693374 d!95907))

(declare-fun d!95909 () Bool)

(assert (=> d!95909 (= (array_inv!14888 a!3626) (bvsge (size!19477 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61970 d!95909))

(declare-fun d!95911 () Bool)

(declare-fun lt!316791 () Bool)

(assert (=> d!95911 (= lt!316791 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!319 acc!681)))))

(declare-fun e!394712 () Bool)

(assert (=> d!95911 (= lt!316791 e!394712)))

(declare-fun res!457794 () Bool)

(assert (=> d!95911 (=> (not res!457794) (not e!394712))))

(assert (=> d!95911 (= res!457794 (is-Cons!13129 acc!681))))

(assert (=> d!95911 (= (contains!3710 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316791)))

(declare-fun b!693691 () Bool)

(declare-fun e!394711 () Bool)

(assert (=> b!693691 (= e!394712 e!394711)))

(declare-fun res!457793 () Bool)

(assert (=> b!693691 (=> res!457793 e!394711)))

(assert (=> b!693691 (= res!457793 (= (h!14174 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693692 () Bool)

(assert (=> b!693692 (= e!394711 (contains!3710 (t!19409 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95911 res!457794) b!693691))

(assert (= (and b!693691 (not res!457793)) b!693692))

(assert (=> d!95911 m!655805))

(declare-fun m!655917 () Bool)

(assert (=> d!95911 m!655917))

(declare-fun m!655919 () Bool)

(assert (=> b!693692 m!655919))

(assert (=> b!693363 d!95911))

(declare-fun d!95913 () Bool)

(declare-fun lt!316792 () Bool)

(assert (=> d!95913 (= lt!316792 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!319 lt!316741)))))

(declare-fun e!394714 () Bool)

(assert (=> d!95913 (= lt!316792 e!394714)))

(declare-fun res!457796 () Bool)

(assert (=> d!95913 (=> (not res!457796) (not e!394714))))

(assert (=> d!95913 (= res!457796 (is-Cons!13129 lt!316741))))

(assert (=> d!95913 (= (contains!3710 lt!316741 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316792)))

(declare-fun b!693693 () Bool)

(declare-fun e!394713 () Bool)

(assert (=> b!693693 (= e!394714 e!394713)))

(declare-fun res!457795 () Bool)

(assert (=> b!693693 (=> res!457795 e!394713)))

(assert (=> b!693693 (= res!457795 (= (h!14174 lt!316741) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693694 () Bool)

(assert (=> b!693694 (= e!394713 (contains!3710 (t!19409 lt!316741) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95913 res!457796) b!693693))

(assert (= (and b!693693 (not res!457795)) b!693694))

(assert (=> d!95913 m!655795))

(declare-fun m!655921 () Bool)

(assert (=> d!95913 m!655921))

(declare-fun m!655923 () Bool)

(assert (=> b!693694 m!655923))

(assert (=> b!693364 d!95913))

(declare-fun d!95915 () Bool)

(assert (=> d!95915 (= (validKeyInArray!0 (select (arr!19092 a!3626) from!3004)) (and (not (= (select (arr!19092 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19092 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!693362 d!95915))

(declare-fun d!95917 () Bool)

(declare-fun res!457798 () Bool)

(declare-fun e!394718 () Bool)

(assert (=> d!95917 (=> res!457798 e!394718)))

(assert (=> d!95917 (= res!457798 (bvsge from!3004 (size!19477 a!3626)))))

(assert (=> d!95917 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394718)))

(declare-fun e!394716 () Bool)

(declare-fun b!693695 () Bool)

(assert (=> b!693695 (= e!394716 (contains!3710 acc!681 (select (arr!19092 a!3626) from!3004)))))

(declare-fun b!693696 () Bool)

(declare-fun e!394715 () Bool)

(declare-fun call!34276 () Bool)

(assert (=> b!693696 (= e!394715 call!34276)))

(declare-fun b!693697 () Bool)

(declare-fun e!394717 () Bool)

(assert (=> b!693697 (= e!394718 e!394717)))

(declare-fun res!457799 () Bool)

(assert (=> b!693697 (=> (not res!457799) (not e!394717))))

(assert (=> b!693697 (= res!457799 (not e!394716))))

(declare-fun res!457797 () Bool)

(assert (=> b!693697 (=> (not res!457797) (not e!394716))))

(assert (=> b!693697 (= res!457797 (validKeyInArray!0 (select (arr!19092 a!3626) from!3004)))))

(declare-fun c!78316 () Bool)

(declare-fun bm!34273 () Bool)

(assert (=> bm!34273 (= call!34276 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78316 (Cons!13129 (select (arr!19092 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!693698 () Bool)

(assert (=> b!693698 (= e!394717 e!394715)))

(assert (=> b!693698 (= c!78316 (validKeyInArray!0 (select (arr!19092 a!3626) from!3004)))))

(declare-fun b!693699 () Bool)

(assert (=> b!693699 (= e!394715 call!34276)))

(assert (= (and d!95917 (not res!457798)) b!693697))

(assert (= (and b!693697 res!457797) b!693695))

(assert (= (and b!693697 res!457799) b!693698))

(assert (= (and b!693698 c!78316) b!693699))

(assert (= (and b!693698 (not c!78316)) b!693696))

(assert (= (or b!693699 b!693696) bm!34273))

(assert (=> b!693695 m!655641))

(assert (=> b!693695 m!655641))

(declare-fun m!655925 () Bool)

(assert (=> b!693695 m!655925))

(assert (=> b!693697 m!655641))

(assert (=> b!693697 m!655641))

(assert (=> b!693697 m!655643))

(assert (=> bm!34273 m!655641))

(declare-fun m!655927 () Bool)

(assert (=> bm!34273 m!655927))

(assert (=> b!693698 m!655641))

(assert (=> b!693698 m!655641))

(assert (=> b!693698 m!655643))

(assert (=> b!693373 d!95917))

(assert (=> b!693371 d!95901))

(assert (=> b!693372 d!95837))

(declare-fun d!95919 () Bool)

(declare-fun res!457801 () Bool)

(declare-fun e!394722 () Bool)

(assert (=> d!95919 (=> res!457801 e!394722)))

(assert (=> d!95919 (= res!457801 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19477 a!3626)))))

