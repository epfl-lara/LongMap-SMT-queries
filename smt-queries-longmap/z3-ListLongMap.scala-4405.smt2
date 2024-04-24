; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60708 () Bool)

(assert start!60708)

(declare-fun b!681467 () Bool)

(declare-fun res!447531 () Bool)

(declare-fun e!388218 () Bool)

(assert (=> b!681467 (=> (not res!447531) (not e!388218))))

(declare-datatypes ((List!12888 0))(
  ( (Nil!12885) (Cons!12884 (h!13932 (_ BitVec 64)) (t!19114 List!12888)) )
))
(declare-fun acc!681 () List!12888)

(declare-fun contains!3540 (List!12888 (_ BitVec 64)) Bool)

(assert (=> b!681467 (= res!447531 (not (contains!3540 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681468 () Bool)

(declare-fun res!447534 () Bool)

(assert (=> b!681468 (=> (not res!447534) (not e!388218))))

(declare-fun e!388211 () Bool)

(assert (=> b!681468 (= res!447534 e!388211)))

(declare-fun res!447538 () Bool)

(assert (=> b!681468 (=> res!447538 e!388211)))

(declare-fun e!388217 () Bool)

(assert (=> b!681468 (= res!447538 e!388217)))

(declare-fun res!447521 () Bool)

(assert (=> b!681468 (=> (not res!447521) (not e!388217))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681468 (= res!447521 (bvsgt from!3004 i!1382))))

(declare-fun b!681469 () Bool)

(declare-fun res!447536 () Bool)

(declare-fun e!388212 () Bool)

(assert (=> b!681469 (=> res!447536 e!388212)))

(declare-fun lt!313354 () List!12888)

(assert (=> b!681469 (= res!447536 (contains!3540 lt!313354 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!447520 () Bool)

(assert (=> start!60708 (=> (not res!447520) (not e!388218))))

(declare-datatypes ((array!39513 0))(
  ( (array!39514 (arr!18940 (Array (_ BitVec 32) (_ BitVec 64))) (size!19304 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39513)

(assert (=> start!60708 (= res!447520 (and (bvslt (size!19304 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19304 a!3626))))))

(assert (=> start!60708 e!388218))

(assert (=> start!60708 true))

(declare-fun array_inv!14799 (array!39513) Bool)

(assert (=> start!60708 (array_inv!14799 a!3626)))

(declare-fun b!681470 () Bool)

(declare-fun e!388213 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!681470 (= e!388213 (not (contains!3540 acc!681 k0!2843)))))

(declare-fun b!681471 () Bool)

(assert (=> b!681471 (= e!388211 e!388213)))

(declare-fun res!447532 () Bool)

(assert (=> b!681471 (=> (not res!447532) (not e!388213))))

(assert (=> b!681471 (= res!447532 (bvsle from!3004 i!1382))))

(declare-fun b!681472 () Bool)

(declare-fun res!447528 () Bool)

(assert (=> b!681472 (=> res!447528 e!388212)))

(declare-fun noDuplicate!814 (List!12888) Bool)

(assert (=> b!681472 (= res!447528 (not (noDuplicate!814 lt!313354)))))

(declare-fun b!681473 () Bool)

(declare-fun res!447537 () Bool)

(assert (=> b!681473 (=> (not res!447537) (not e!388218))))

(assert (=> b!681473 (= res!447537 (noDuplicate!814 acc!681))))

(declare-fun b!681474 () Bool)

(declare-fun e!388216 () Bool)

(assert (=> b!681474 (= e!388218 (not e!388216))))

(declare-fun res!447523 () Bool)

(assert (=> b!681474 (=> res!447523 e!388216)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681474 (= res!447523 (not (validKeyInArray!0 (select (arr!18940 a!3626) from!3004))))))

(declare-datatypes ((Unit!23877 0))(
  ( (Unit!23878) )
))
(declare-fun lt!313352 () Unit!23877)

(declare-fun e!388215 () Unit!23877)

(assert (=> b!681474 (= lt!313352 e!388215)))

(declare-fun c!77342 () Bool)

(declare-fun arrayContainsKey!0 (array!39513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681474 (= c!77342 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681474 (arrayContainsKey!0 (array!39514 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626)) k0!2843 from!3004)))

(declare-fun b!681475 () Bool)

(declare-fun res!447526 () Bool)

(assert (=> b!681475 (=> (not res!447526) (not e!388218))))

(assert (=> b!681475 (= res!447526 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19304 a!3626))))))

(declare-fun b!681476 () Bool)

(declare-fun res!447535 () Bool)

(assert (=> b!681476 (=> res!447535 e!388212)))

(assert (=> b!681476 (= res!447535 (contains!3540 lt!313354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681477 () Bool)

(declare-fun Unit!23879 () Unit!23877)

(assert (=> b!681477 (= e!388215 Unit!23879)))

(declare-fun lt!313353 () Unit!23877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39513 (_ BitVec 64) (_ BitVec 32)) Unit!23877)

(assert (=> b!681477 (= lt!313353 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!681477 false))

(declare-fun b!681478 () Bool)

(declare-fun res!447522 () Bool)

(assert (=> b!681478 (=> (not res!447522) (not e!388218))))

(assert (=> b!681478 (= res!447522 (not (contains!3540 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681479 () Bool)

(declare-fun res!447529 () Bool)

(assert (=> b!681479 (=> (not res!447529) (not e!388218))))

(declare-fun arrayNoDuplicates!0 (array!39513 (_ BitVec 32) List!12888) Bool)

(assert (=> b!681479 (= res!447529 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12885))))

(declare-fun b!681480 () Bool)

(declare-fun res!447525 () Bool)

(assert (=> b!681480 (=> (not res!447525) (not e!388218))))

(assert (=> b!681480 (= res!447525 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681481 () Bool)

(assert (=> b!681481 (= e!388217 (contains!3540 acc!681 k0!2843))))

(declare-fun b!681482 () Bool)

(declare-fun res!447524 () Bool)

(assert (=> b!681482 (=> (not res!447524) (not e!388218))))

(assert (=> b!681482 (= res!447524 (validKeyInArray!0 k0!2843))))

(declare-fun b!681483 () Bool)

(declare-fun Unit!23880 () Unit!23877)

(assert (=> b!681483 (= e!388215 Unit!23880)))

(declare-fun b!681484 () Bool)

(declare-fun res!447533 () Bool)

(assert (=> b!681484 (=> (not res!447533) (not e!388218))))

(assert (=> b!681484 (= res!447533 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19304 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681485 () Bool)

(declare-fun res!447530 () Bool)

(assert (=> b!681485 (=> (not res!447530) (not e!388218))))

(assert (=> b!681485 (= res!447530 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681486 () Bool)

(assert (=> b!681486 (= e!388216 e!388212)))

(declare-fun res!447527 () Bool)

(assert (=> b!681486 (=> res!447527 e!388212)))

(assert (=> b!681486 (= res!447527 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!311 (List!12888 (_ BitVec 64)) List!12888)

(assert (=> b!681486 (= lt!313354 ($colon$colon!311 acc!681 (select (arr!18940 a!3626) from!3004)))))

(declare-fun subseq!149 (List!12888 List!12888) Bool)

(assert (=> b!681486 (subseq!149 acc!681 acc!681)))

(declare-fun lt!313351 () Unit!23877)

(declare-fun lemmaListSubSeqRefl!0 (List!12888) Unit!23877)

(assert (=> b!681486 (= lt!313351 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681487 () Bool)

(assert (=> b!681487 (= e!388212 (subseq!149 acc!681 lt!313354))))

(assert (= (and start!60708 res!447520) b!681473))

(assert (= (and b!681473 res!447537) b!681467))

(assert (= (and b!681467 res!447531) b!681478))

(assert (= (and b!681478 res!447522) b!681468))

(assert (= (and b!681468 res!447521) b!681481))

(assert (= (and b!681468 (not res!447538)) b!681471))

(assert (= (and b!681471 res!447532) b!681470))

(assert (= (and b!681468 res!447534) b!681479))

(assert (= (and b!681479 res!447529) b!681480))

(assert (= (and b!681480 res!447525) b!681475))

(assert (= (and b!681475 res!447526) b!681482))

(assert (= (and b!681482 res!447524) b!681485))

(assert (= (and b!681485 res!447530) b!681484))

(assert (= (and b!681484 res!447533) b!681474))

(assert (= (and b!681474 c!77342) b!681477))

(assert (= (and b!681474 (not c!77342)) b!681483))

(assert (= (and b!681474 (not res!447523)) b!681486))

(assert (= (and b!681486 (not res!447527)) b!681472))

(assert (= (and b!681472 (not res!447528)) b!681476))

(assert (= (and b!681476 (not res!447535)) b!681469))

(assert (= (and b!681469 (not res!447536)) b!681487))

(declare-fun m!646831 () Bool)

(assert (=> b!681482 m!646831))

(declare-fun m!646833 () Bool)

(assert (=> b!681477 m!646833))

(declare-fun m!646835 () Bool)

(assert (=> b!681469 m!646835))

(declare-fun m!646837 () Bool)

(assert (=> b!681478 m!646837))

(declare-fun m!646839 () Bool)

(assert (=> b!681487 m!646839))

(declare-fun m!646841 () Bool)

(assert (=> b!681485 m!646841))

(declare-fun m!646843 () Bool)

(assert (=> b!681479 m!646843))

(declare-fun m!646845 () Bool)

(assert (=> b!681486 m!646845))

(assert (=> b!681486 m!646845))

(declare-fun m!646847 () Bool)

(assert (=> b!681486 m!646847))

(declare-fun m!646849 () Bool)

(assert (=> b!681486 m!646849))

(declare-fun m!646851 () Bool)

(assert (=> b!681486 m!646851))

(declare-fun m!646853 () Bool)

(assert (=> b!681467 m!646853))

(declare-fun m!646855 () Bool)

(assert (=> b!681470 m!646855))

(declare-fun m!646857 () Bool)

(assert (=> b!681476 m!646857))

(assert (=> b!681474 m!646845))

(declare-fun m!646859 () Bool)

(assert (=> b!681474 m!646859))

(declare-fun m!646861 () Bool)

(assert (=> b!681474 m!646861))

(assert (=> b!681474 m!646845))

(declare-fun m!646863 () Bool)

(assert (=> b!681474 m!646863))

(declare-fun m!646865 () Bool)

(assert (=> b!681474 m!646865))

(declare-fun m!646867 () Bool)

(assert (=> b!681480 m!646867))

(declare-fun m!646869 () Bool)

(assert (=> b!681472 m!646869))

(assert (=> b!681481 m!646855))

(declare-fun m!646871 () Bool)

(assert (=> b!681473 m!646871))

(declare-fun m!646873 () Bool)

(assert (=> start!60708 m!646873))

(check-sat (not b!681486) (not b!681470) (not b!681480) (not b!681476) (not b!681481) (not b!681474) (not start!60708) (not b!681485) (not b!681477) (not b!681482) (not b!681479) (not b!681472) (not b!681467) (not b!681487) (not b!681478) (not b!681469) (not b!681473))
(check-sat)
(get-model)

(declare-fun b!681624 () Bool)

(declare-fun e!388277 () Bool)

(declare-fun call!33972 () Bool)

(assert (=> b!681624 (= e!388277 call!33972)))

(declare-fun b!681625 () Bool)

(assert (=> b!681625 (= e!388277 call!33972)))

(declare-fun b!681626 () Bool)

(declare-fun e!388275 () Bool)

(assert (=> b!681626 (= e!388275 (contains!3540 Nil!12885 (select (arr!18940 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681627 () Bool)

(declare-fun e!388276 () Bool)

(declare-fun e!388278 () Bool)

(assert (=> b!681627 (= e!388276 e!388278)))

(declare-fun res!447659 () Bool)

(assert (=> b!681627 (=> (not res!447659) (not e!388278))))

(assert (=> b!681627 (= res!447659 (not e!388275))))

(declare-fun res!447660 () Bool)

(assert (=> b!681627 (=> (not res!447660) (not e!388275))))

(assert (=> b!681627 (= res!447660 (validKeyInArray!0 (select (arr!18940 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93917 () Bool)

(declare-fun res!447661 () Bool)

(assert (=> d!93917 (=> res!447661 e!388276)))

(assert (=> d!93917 (= res!447661 (bvsge #b00000000000000000000000000000000 (size!19304 a!3626)))))

(assert (=> d!93917 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12885) e!388276)))

(declare-fun bm!33969 () Bool)

(declare-fun c!77351 () Bool)

(assert (=> bm!33969 (= call!33972 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77351 (Cons!12884 (select (arr!18940 a!3626) #b00000000000000000000000000000000) Nil!12885) Nil!12885)))))

(declare-fun b!681628 () Bool)

(assert (=> b!681628 (= e!388278 e!388277)))

(assert (=> b!681628 (= c!77351 (validKeyInArray!0 (select (arr!18940 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93917 (not res!447661)) b!681627))

(assert (= (and b!681627 res!447660) b!681626))

(assert (= (and b!681627 res!447659) b!681628))

(assert (= (and b!681628 c!77351) b!681624))

(assert (= (and b!681628 (not c!77351)) b!681625))

(assert (= (or b!681624 b!681625) bm!33969))

(declare-fun m!646963 () Bool)

(assert (=> b!681626 m!646963))

(assert (=> b!681626 m!646963))

(declare-fun m!646965 () Bool)

(assert (=> b!681626 m!646965))

(assert (=> b!681627 m!646963))

(assert (=> b!681627 m!646963))

(declare-fun m!646967 () Bool)

(assert (=> b!681627 m!646967))

(assert (=> bm!33969 m!646963))

(declare-fun m!646969 () Bool)

(assert (=> bm!33969 m!646969))

(assert (=> b!681628 m!646963))

(assert (=> b!681628 m!646963))

(assert (=> b!681628 m!646967))

(assert (=> b!681479 d!93917))

(declare-fun d!93921 () Bool)

(declare-fun lt!313383 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!273 (List!12888) (InoxSet (_ BitVec 64)))

(assert (=> d!93921 (= lt!313383 (select (content!273 acc!681) k0!2843))))

(declare-fun e!388296 () Bool)

(assert (=> d!93921 (= lt!313383 e!388296)))

(declare-fun res!447679 () Bool)

(assert (=> d!93921 (=> (not res!447679) (not e!388296))))

(get-info :version)

(assert (=> d!93921 (= res!447679 ((_ is Cons!12884) acc!681))))

(assert (=> d!93921 (= (contains!3540 acc!681 k0!2843) lt!313383)))

(declare-fun b!681645 () Bool)

(declare-fun e!388295 () Bool)

(assert (=> b!681645 (= e!388296 e!388295)))

(declare-fun res!447678 () Bool)

(assert (=> b!681645 (=> res!447678 e!388295)))

(assert (=> b!681645 (= res!447678 (= (h!13932 acc!681) k0!2843))))

(declare-fun b!681646 () Bool)

(assert (=> b!681646 (= e!388295 (contains!3540 (t!19114 acc!681) k0!2843))))

(assert (= (and d!93921 res!447679) b!681645))

(assert (= (and b!681645 (not res!447678)) b!681646))

(declare-fun m!646971 () Bool)

(assert (=> d!93921 m!646971))

(declare-fun m!646973 () Bool)

(assert (=> d!93921 m!646973))

(declare-fun m!646975 () Bool)

(assert (=> b!681646 m!646975))

(assert (=> b!681470 d!93921))

(declare-fun d!93927 () Bool)

(declare-fun lt!313385 () Bool)

(assert (=> d!93927 (= lt!313385 (select (content!273 lt!313354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388300 () Bool)

(assert (=> d!93927 (= lt!313385 e!388300)))

(declare-fun res!447683 () Bool)

(assert (=> d!93927 (=> (not res!447683) (not e!388300))))

(assert (=> d!93927 (= res!447683 ((_ is Cons!12884) lt!313354))))

(assert (=> d!93927 (= (contains!3540 lt!313354 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313385)))

(declare-fun b!681649 () Bool)

(declare-fun e!388299 () Bool)

(assert (=> b!681649 (= e!388300 e!388299)))

(declare-fun res!447682 () Bool)

(assert (=> b!681649 (=> res!447682 e!388299)))

(assert (=> b!681649 (= res!447682 (= (h!13932 lt!313354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681650 () Bool)

(assert (=> b!681650 (= e!388299 (contains!3540 (t!19114 lt!313354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93927 res!447683) b!681649))

(assert (= (and b!681649 (not res!447682)) b!681650))

(declare-fun m!646983 () Bool)

(assert (=> d!93927 m!646983))

(declare-fun m!646985 () Bool)

(assert (=> d!93927 m!646985))

(declare-fun m!646987 () Bool)

(assert (=> b!681650 m!646987))

(assert (=> b!681469 d!93927))

(declare-fun b!681651 () Bool)

(declare-fun e!388303 () Bool)

(declare-fun call!33973 () Bool)

(assert (=> b!681651 (= e!388303 call!33973)))

(declare-fun b!681652 () Bool)

(assert (=> b!681652 (= e!388303 call!33973)))

(declare-fun b!681653 () Bool)

(declare-fun e!388301 () Bool)

(assert (=> b!681653 (= e!388301 (contains!3540 acc!681 (select (arr!18940 a!3626) from!3004)))))

(declare-fun b!681654 () Bool)

(declare-fun e!388302 () Bool)

(declare-fun e!388304 () Bool)

(assert (=> b!681654 (= e!388302 e!388304)))

(declare-fun res!447684 () Bool)

(assert (=> b!681654 (=> (not res!447684) (not e!388304))))

(assert (=> b!681654 (= res!447684 (not e!388301))))

(declare-fun res!447685 () Bool)

(assert (=> b!681654 (=> (not res!447685) (not e!388301))))

(assert (=> b!681654 (= res!447685 (validKeyInArray!0 (select (arr!18940 a!3626) from!3004)))))

(declare-fun d!93931 () Bool)

(declare-fun res!447686 () Bool)

(assert (=> d!93931 (=> res!447686 e!388302)))

(assert (=> d!93931 (= res!447686 (bvsge from!3004 (size!19304 a!3626)))))

(assert (=> d!93931 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388302)))

(declare-fun c!77352 () Bool)

(declare-fun bm!33970 () Bool)

(assert (=> bm!33970 (= call!33973 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77352 (Cons!12884 (select (arr!18940 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681655 () Bool)

(assert (=> b!681655 (= e!388304 e!388303)))

(assert (=> b!681655 (= c!77352 (validKeyInArray!0 (select (arr!18940 a!3626) from!3004)))))

(assert (= (and d!93931 (not res!447686)) b!681654))

(assert (= (and b!681654 res!447685) b!681653))

(assert (= (and b!681654 res!447684) b!681655))

(assert (= (and b!681655 c!77352) b!681651))

(assert (= (and b!681655 (not c!77352)) b!681652))

(assert (= (or b!681651 b!681652) bm!33970))

(assert (=> b!681653 m!646845))

(assert (=> b!681653 m!646845))

(declare-fun m!646989 () Bool)

(assert (=> b!681653 m!646989))

(assert (=> b!681654 m!646845))

(assert (=> b!681654 m!646845))

(assert (=> b!681654 m!646863))

(assert (=> bm!33970 m!646845))

(declare-fun m!646991 () Bool)

(assert (=> bm!33970 m!646991))

(assert (=> b!681655 m!646845))

(assert (=> b!681655 m!646845))

(assert (=> b!681655 m!646863))

(assert (=> b!681480 d!93931))

(declare-fun d!93933 () Bool)

(assert (=> d!93933 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681482 d!93933))

(assert (=> b!681481 d!93921))

(declare-fun d!93937 () Bool)

(declare-fun res!447705 () Bool)

(declare-fun e!388323 () Bool)

(assert (=> d!93937 (=> res!447705 e!388323)))

(assert (=> d!93937 (= res!447705 ((_ is Nil!12885) lt!313354))))

(assert (=> d!93937 (= (noDuplicate!814 lt!313354) e!388323)))

(declare-fun b!681674 () Bool)

(declare-fun e!388324 () Bool)

(assert (=> b!681674 (= e!388323 e!388324)))

(declare-fun res!447706 () Bool)

(assert (=> b!681674 (=> (not res!447706) (not e!388324))))

(assert (=> b!681674 (= res!447706 (not (contains!3540 (t!19114 lt!313354) (h!13932 lt!313354))))))

(declare-fun b!681675 () Bool)

(assert (=> b!681675 (= e!388324 (noDuplicate!814 (t!19114 lt!313354)))))

(assert (= (and d!93937 (not res!447705)) b!681674))

(assert (= (and b!681674 res!447706) b!681675))

(declare-fun m!647013 () Bool)

(assert (=> b!681674 m!647013))

(declare-fun m!647015 () Bool)

(assert (=> b!681675 m!647015))

(assert (=> b!681472 d!93937))

(declare-fun d!93947 () Bool)

(assert (=> d!93947 (= (validKeyInArray!0 (select (arr!18940 a!3626) from!3004)) (and (not (= (select (arr!18940 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18940 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681474 d!93947))

(declare-fun d!93949 () Bool)

(declare-fun res!447723 () Bool)

(declare-fun e!388343 () Bool)

(assert (=> d!93949 (=> res!447723 e!388343)))

(assert (=> d!93949 (= res!447723 (= (select (arr!18940 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93949 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388343)))

(declare-fun b!681696 () Bool)

(declare-fun e!388344 () Bool)

(assert (=> b!681696 (= e!388343 e!388344)))

(declare-fun res!447724 () Bool)

(assert (=> b!681696 (=> (not res!447724) (not e!388344))))

(assert (=> b!681696 (= res!447724 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19304 a!3626)))))

(declare-fun b!681697 () Bool)

(assert (=> b!681697 (= e!388344 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93949 (not res!447723)) b!681696))

(assert (= (and b!681696 res!447724) b!681697))

(declare-fun m!647023 () Bool)

(assert (=> d!93949 m!647023))

(declare-fun m!647025 () Bool)

(assert (=> b!681697 m!647025))

(assert (=> b!681474 d!93949))

(declare-fun d!93953 () Bool)

(declare-fun res!447725 () Bool)

(declare-fun e!388345 () Bool)

(assert (=> d!93953 (=> res!447725 e!388345)))

(assert (=> d!93953 (= res!447725 (= (select (arr!18940 (array!39514 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626))) from!3004) k0!2843))))

(assert (=> d!93953 (= (arrayContainsKey!0 (array!39514 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626)) k0!2843 from!3004) e!388345)))

(declare-fun b!681698 () Bool)

(declare-fun e!388346 () Bool)

(assert (=> b!681698 (= e!388345 e!388346)))

(declare-fun res!447726 () Bool)

(assert (=> b!681698 (=> (not res!447726) (not e!388346))))

(assert (=> b!681698 (= res!447726 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19304 (array!39514 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626)))))))

(declare-fun b!681699 () Bool)

(assert (=> b!681699 (= e!388346 (arrayContainsKey!0 (array!39514 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93953 (not res!447725)) b!681698))

(assert (= (and b!681698 res!447726) b!681699))

(declare-fun m!647027 () Bool)

(assert (=> d!93953 m!647027))

(declare-fun m!647029 () Bool)

(assert (=> b!681699 m!647029))

(assert (=> b!681474 d!93953))

(declare-fun d!93955 () Bool)

(declare-fun res!447727 () Bool)

(declare-fun e!388347 () Bool)

(assert (=> d!93955 (=> res!447727 e!388347)))

(assert (=> d!93955 (= res!447727 ((_ is Nil!12885) acc!681))))

(assert (=> d!93955 (= (noDuplicate!814 acc!681) e!388347)))

(declare-fun b!681700 () Bool)

(declare-fun e!388348 () Bool)

(assert (=> b!681700 (= e!388347 e!388348)))

(declare-fun res!447728 () Bool)

(assert (=> b!681700 (=> (not res!447728) (not e!388348))))

(assert (=> b!681700 (= res!447728 (not (contains!3540 (t!19114 acc!681) (h!13932 acc!681))))))

(declare-fun b!681701 () Bool)

(assert (=> b!681701 (= e!388348 (noDuplicate!814 (t!19114 acc!681)))))

(assert (= (and d!93955 (not res!447727)) b!681700))

(assert (= (and b!681700 res!447728) b!681701))

(declare-fun m!647031 () Bool)

(assert (=> b!681700 m!647031))

(declare-fun m!647033 () Bool)

(assert (=> b!681701 m!647033))

(assert (=> b!681473 d!93955))

(declare-fun d!93957 () Bool)

(assert (=> d!93957 (= ($colon$colon!311 acc!681 (select (arr!18940 a!3626) from!3004)) (Cons!12884 (select (arr!18940 a!3626) from!3004) acc!681))))

(assert (=> b!681486 d!93957))

(declare-fun b!681735 () Bool)

(declare-fun e!388375 () Bool)

(assert (=> b!681735 (= e!388375 (subseq!149 acc!681 (t!19114 acc!681)))))

(declare-fun b!681734 () Bool)

(declare-fun e!388376 () Bool)

(assert (=> b!681734 (= e!388376 (subseq!149 (t!19114 acc!681) (t!19114 acc!681)))))

(declare-fun d!93959 () Bool)

(declare-fun res!447751 () Bool)

(declare-fun e!388378 () Bool)

(assert (=> d!93959 (=> res!447751 e!388378)))

(assert (=> d!93959 (= res!447751 ((_ is Nil!12885) acc!681))))

(assert (=> d!93959 (= (subseq!149 acc!681 acc!681) e!388378)))

(declare-fun b!681733 () Bool)

(declare-fun e!388377 () Bool)

(assert (=> b!681733 (= e!388377 e!388375)))

(declare-fun res!447752 () Bool)

(assert (=> b!681733 (=> res!447752 e!388375)))

(assert (=> b!681733 (= res!447752 e!388376)))

(declare-fun res!447754 () Bool)

(assert (=> b!681733 (=> (not res!447754) (not e!388376))))

(assert (=> b!681733 (= res!447754 (= (h!13932 acc!681) (h!13932 acc!681)))))

(declare-fun b!681732 () Bool)

(assert (=> b!681732 (= e!388378 e!388377)))

(declare-fun res!447753 () Bool)

(assert (=> b!681732 (=> (not res!447753) (not e!388377))))

(assert (=> b!681732 (= res!447753 ((_ is Cons!12884) acc!681))))

(assert (= (and d!93959 (not res!447751)) b!681732))

(assert (= (and b!681732 res!447753) b!681733))

(assert (= (and b!681733 res!447754) b!681734))

(assert (= (and b!681733 (not res!447752)) b!681735))

(declare-fun m!647047 () Bool)

(assert (=> b!681735 m!647047))

(declare-fun m!647049 () Bool)

(assert (=> b!681734 m!647049))

(assert (=> b!681486 d!93959))

(declare-fun d!93967 () Bool)

(assert (=> d!93967 (subseq!149 acc!681 acc!681)))

(declare-fun lt!313398 () Unit!23877)

(declare-fun choose!36 (List!12888) Unit!23877)

(assert (=> d!93967 (= lt!313398 (choose!36 acc!681))))

(assert (=> d!93967 (= (lemmaListSubSeqRefl!0 acc!681) lt!313398)))

(declare-fun bs!20019 () Bool)

(assert (= bs!20019 d!93967))

(assert (=> bs!20019 m!646849))

(declare-fun m!647057 () Bool)

(assert (=> bs!20019 m!647057))

(assert (=> b!681486 d!93967))

(declare-fun d!93973 () Bool)

(declare-fun res!447763 () Bool)

(declare-fun e!388387 () Bool)

(assert (=> d!93973 (=> res!447763 e!388387)))

(assert (=> d!93973 (= res!447763 (= (select (arr!18940 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93973 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388387)))

(declare-fun b!681744 () Bool)

(declare-fun e!388388 () Bool)

(assert (=> b!681744 (= e!388387 e!388388)))

(declare-fun res!447764 () Bool)

(assert (=> b!681744 (=> (not res!447764) (not e!388388))))

(assert (=> b!681744 (= res!447764 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19304 a!3626)))))

(declare-fun b!681745 () Bool)

(assert (=> b!681745 (= e!388388 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93973 (not res!447763)) b!681744))

(assert (= (and b!681744 res!447764) b!681745))

(assert (=> d!93973 m!646963))

(declare-fun m!647067 () Bool)

(assert (=> b!681745 m!647067))

(assert (=> b!681485 d!93973))

(declare-fun b!681755 () Bool)

(declare-fun e!388395 () Bool)

(assert (=> b!681755 (= e!388395 (subseq!149 acc!681 (t!19114 lt!313354)))))

(declare-fun b!681754 () Bool)

(declare-fun e!388396 () Bool)

(assert (=> b!681754 (= e!388396 (subseq!149 (t!19114 acc!681) (t!19114 lt!313354)))))

(declare-fun d!93979 () Bool)

(declare-fun res!447771 () Bool)

(declare-fun e!388398 () Bool)

(assert (=> d!93979 (=> res!447771 e!388398)))

(assert (=> d!93979 (= res!447771 ((_ is Nil!12885) acc!681))))

(assert (=> d!93979 (= (subseq!149 acc!681 lt!313354) e!388398)))

(declare-fun b!681753 () Bool)

(declare-fun e!388397 () Bool)

(assert (=> b!681753 (= e!388397 e!388395)))

(declare-fun res!447772 () Bool)

(assert (=> b!681753 (=> res!447772 e!388395)))

(assert (=> b!681753 (= res!447772 e!388396)))

(declare-fun res!447774 () Bool)

(assert (=> b!681753 (=> (not res!447774) (not e!388396))))

(assert (=> b!681753 (= res!447774 (= (h!13932 acc!681) (h!13932 lt!313354)))))

(declare-fun b!681752 () Bool)

(assert (=> b!681752 (= e!388398 e!388397)))

(declare-fun res!447773 () Bool)

(assert (=> b!681752 (=> (not res!447773) (not e!388397))))

(assert (=> b!681752 (= res!447773 ((_ is Cons!12884) lt!313354))))

(assert (= (and d!93979 (not res!447771)) b!681752))

(assert (= (and b!681752 res!447773) b!681753))

(assert (= (and b!681753 res!447774) b!681754))

(assert (= (and b!681753 (not res!447772)) b!681755))

(declare-fun m!647069 () Bool)

(assert (=> b!681755 m!647069))

(declare-fun m!647073 () Bool)

(assert (=> b!681754 m!647073))

(assert (=> b!681487 d!93979))

(declare-fun d!93983 () Bool)

(declare-fun lt!313399 () Bool)

(assert (=> d!93983 (= lt!313399 (select (content!273 lt!313354) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388402 () Bool)

(assert (=> d!93983 (= lt!313399 e!388402)))

(declare-fun res!447778 () Bool)

(assert (=> d!93983 (=> (not res!447778) (not e!388402))))

(assert (=> d!93983 (= res!447778 ((_ is Cons!12884) lt!313354))))

(assert (=> d!93983 (= (contains!3540 lt!313354 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313399)))

(declare-fun b!681758 () Bool)

(declare-fun e!388401 () Bool)

(assert (=> b!681758 (= e!388402 e!388401)))

(declare-fun res!447777 () Bool)

(assert (=> b!681758 (=> res!447777 e!388401)))

(assert (=> b!681758 (= res!447777 (= (h!13932 lt!313354) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681759 () Bool)

(assert (=> b!681759 (= e!388401 (contains!3540 (t!19114 lt!313354) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93983 res!447778) b!681758))

(assert (= (and b!681758 (not res!447777)) b!681759))

(assert (=> d!93983 m!646983))

(declare-fun m!647077 () Bool)

(assert (=> d!93983 m!647077))

(declare-fun m!647079 () Bool)

(assert (=> b!681759 m!647079))

(assert (=> b!681476 d!93983))

(declare-fun d!93987 () Bool)

(declare-fun lt!313400 () Bool)

(assert (=> d!93987 (= lt!313400 (select (content!273 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388408 () Bool)

(assert (=> d!93987 (= lt!313400 e!388408)))

(declare-fun res!447784 () Bool)

(assert (=> d!93987 (=> (not res!447784) (not e!388408))))

(assert (=> d!93987 (= res!447784 ((_ is Cons!12884) acc!681))))

(assert (=> d!93987 (= (contains!3540 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313400)))

(declare-fun b!681764 () Bool)

(declare-fun e!388407 () Bool)

(assert (=> b!681764 (= e!388408 e!388407)))

(declare-fun res!447783 () Bool)

(assert (=> b!681764 (=> res!447783 e!388407)))

(assert (=> b!681764 (= res!447783 (= (h!13932 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681765 () Bool)

(assert (=> b!681765 (= e!388407 (contains!3540 (t!19114 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93987 res!447784) b!681764))

(assert (= (and b!681764 (not res!447783)) b!681765))

(assert (=> d!93987 m!646971))

(declare-fun m!647089 () Bool)

(assert (=> d!93987 m!647089))

(declare-fun m!647091 () Bool)

(assert (=> b!681765 m!647091))

(assert (=> b!681467 d!93987))

(declare-fun d!93993 () Bool)

(declare-fun lt!313402 () Bool)

(assert (=> d!93993 (= lt!313402 (select (content!273 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388412 () Bool)

(assert (=> d!93993 (= lt!313402 e!388412)))

(declare-fun res!447788 () Bool)

(assert (=> d!93993 (=> (not res!447788) (not e!388412))))

(assert (=> d!93993 (= res!447788 ((_ is Cons!12884) acc!681))))

(assert (=> d!93993 (= (contains!3540 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313402)))

(declare-fun b!681768 () Bool)

(declare-fun e!388411 () Bool)

(assert (=> b!681768 (= e!388412 e!388411)))

(declare-fun res!447787 () Bool)

(assert (=> b!681768 (=> res!447787 e!388411)))

(assert (=> b!681768 (= res!447787 (= (h!13932 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681769 () Bool)

(assert (=> b!681769 (= e!388411 (contains!3540 (t!19114 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93993 res!447788) b!681768))

(assert (= (and b!681768 (not res!447787)) b!681769))

(assert (=> d!93993 m!646971))

(declare-fun m!647099 () Bool)

(assert (=> d!93993 m!647099))

(declare-fun m!647101 () Bool)

(assert (=> b!681769 m!647101))

(assert (=> b!681478 d!93993))

(declare-fun d!93997 () Bool)

(assert (=> d!93997 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313405 () Unit!23877)

(declare-fun choose!13 (array!39513 (_ BitVec 64) (_ BitVec 32)) Unit!23877)

(assert (=> d!93997 (= lt!313405 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93997 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93997 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313405)))

(declare-fun bs!20020 () Bool)

(assert (= bs!20020 d!93997))

(assert (=> bs!20020 m!646841))

(declare-fun m!647111 () Bool)

(assert (=> bs!20020 m!647111))

(assert (=> b!681477 d!93997))

(declare-fun d!94003 () Bool)

(assert (=> d!94003 (= (array_inv!14799 a!3626) (bvsge (size!19304 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60708 d!94003))

(check-sat (not b!681755) (not b!681674) (not b!681654) (not d!93967) (not b!681759) (not b!681765) (not b!681627) (not b!681650) (not d!93993) (not b!681700) (not b!681626) (not d!93983) (not b!681734) (not b!681646) (not b!681735) (not b!681675) (not b!681701) (not d!93921) (not b!681655) (not bm!33970) (not d!93927) (not d!93997) (not b!681653) (not b!681745) (not d!93987) (not b!681754) (not b!681699) (not b!681769) (not b!681697) (not bm!33969) (not b!681628))
(check-sat)
