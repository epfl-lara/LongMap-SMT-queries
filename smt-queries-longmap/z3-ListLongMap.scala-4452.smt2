; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61898 () Bool)

(assert start!61898)

(declare-fun b!692448 () Bool)

(declare-fun res!456815 () Bool)

(declare-fun e!393971 () Bool)

(assert (=> b!692448 (=> (not res!456815) (not e!393971))))

(declare-fun e!393970 () Bool)

(assert (=> b!692448 (= res!456815 e!393970)))

(declare-fun res!456823 () Bool)

(assert (=> b!692448 (=> res!456823 e!393970)))

(declare-fun e!393973 () Bool)

(assert (=> b!692448 (= res!456823 e!393973)))

(declare-fun res!456828 () Bool)

(assert (=> b!692448 (=> (not res!456828) (not e!393973))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692448 (= res!456828 (bvsgt from!3004 i!1382))))

(declare-fun b!692449 () Bool)

(declare-datatypes ((List!13165 0))(
  ( (Nil!13162) (Cons!13161 (h!14206 (_ BitVec 64)) (t!19429 List!13165)) )
))
(declare-fun acc!681 () List!13165)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3687 (List!13165 (_ BitVec 64)) Bool)

(assert (=> b!692449 (= e!393973 (contains!3687 acc!681 k0!2843))))

(declare-fun b!692450 () Bool)

(declare-fun res!456818 () Bool)

(assert (=> b!692450 (=> (not res!456818) (not e!393971))))

(assert (=> b!692450 (= res!456818 (not (contains!3687 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692451 () Bool)

(declare-fun res!456822 () Bool)

(assert (=> b!692451 (=> (not res!456822) (not e!393971))))

(assert (=> b!692451 (= res!456822 (not (contains!3687 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692452 () Bool)

(declare-fun e!393972 () Bool)

(assert (=> b!692452 (= e!393972 (not (contains!3687 acc!681 k0!2843)))))

(declare-fun b!692453 () Bool)

(declare-fun e!393965 () Bool)

(declare-fun lt!316388 () List!13165)

(assert (=> b!692453 (= e!393965 (contains!3687 lt!316388 k0!2843))))

(declare-fun b!692454 () Bool)

(declare-fun res!456814 () Bool)

(assert (=> b!692454 (=> (not res!456814) (not e!393971))))

(declare-datatypes ((array!39840 0))(
  ( (array!39841 (arr!19085 (Array (_ BitVec 32) (_ BitVec 64))) (size!19467 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39840)

(assert (=> b!692454 (= res!456814 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19467 a!3626))))))

(declare-fun b!692455 () Bool)

(assert (=> b!692455 (= e!393970 e!393972)))

(declare-fun res!456831 () Bool)

(assert (=> b!692455 (=> (not res!456831) (not e!393972))))

(assert (=> b!692455 (= res!456831 (bvsle from!3004 i!1382))))

(declare-fun b!692456 () Bool)

(declare-fun res!456812 () Bool)

(assert (=> b!692456 (=> (not res!456812) (not e!393971))))

(declare-fun arrayContainsKey!0 (array!39840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692456 (= res!456812 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!456810 () Bool)

(assert (=> start!61898 (=> (not res!456810) (not e!393971))))

(assert (=> start!61898 (= res!456810 (and (bvslt (size!19467 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19467 a!3626))))))

(assert (=> start!61898 e!393971))

(assert (=> start!61898 true))

(declare-fun array_inv!14968 (array!39840) Bool)

(assert (=> start!61898 (array_inv!14968 a!3626)))

(declare-fun b!692457 () Bool)

(declare-fun res!456829 () Bool)

(declare-fun e!393966 () Bool)

(assert (=> b!692457 (=> (not res!456829) (not e!393966))))

(declare-fun noDuplicate!956 (List!13165) Bool)

(assert (=> b!692457 (= res!456829 (noDuplicate!956 lt!316388))))

(declare-fun b!692458 () Bool)

(declare-fun res!456832 () Bool)

(assert (=> b!692458 (=> (not res!456832) (not e!393966))))

(declare-fun e!393974 () Bool)

(assert (=> b!692458 (= res!456832 e!393974)))

(declare-fun res!456824 () Bool)

(assert (=> b!692458 (=> res!456824 e!393974)))

(assert (=> b!692458 (= res!456824 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692459 () Bool)

(assert (=> b!692459 (= e!393974 (not (contains!3687 lt!316388 k0!2843)))))

(declare-fun b!692460 () Bool)

(declare-fun res!456819 () Bool)

(assert (=> b!692460 (=> (not res!456819) (not e!393971))))

(assert (=> b!692460 (= res!456819 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19467 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692461 () Bool)

(declare-fun res!456816 () Bool)

(assert (=> b!692461 (=> (not res!456816) (not e!393971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692461 (= res!456816 (validKeyInArray!0 k0!2843))))

(declare-fun b!692462 () Bool)

(assert (=> b!692462 (= e!393966 e!393965)))

(declare-fun res!456826 () Bool)

(assert (=> b!692462 (=> res!456826 e!393965)))

(assert (=> b!692462 (= res!456826 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692463 () Bool)

(declare-fun res!456821 () Bool)

(assert (=> b!692463 (=> (not res!456821) (not e!393971))))

(declare-fun arrayNoDuplicates!0 (array!39840 (_ BitVec 32) List!13165) Bool)

(assert (=> b!692463 (= res!456821 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692464 () Bool)

(declare-datatypes ((Unit!24440 0))(
  ( (Unit!24441) )
))
(declare-fun e!393968 () Unit!24440)

(declare-fun Unit!24442 () Unit!24440)

(assert (=> b!692464 (= e!393968 Unit!24442)))

(assert (=> b!692464 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316387 () Unit!24440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39840 (_ BitVec 64) (_ BitVec 32)) Unit!24440)

(assert (=> b!692464 (= lt!316387 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!692464 false))

(declare-fun b!692465 () Bool)

(declare-fun res!456825 () Bool)

(assert (=> b!692465 (=> (not res!456825) (not e!393971))))

(assert (=> b!692465 (= res!456825 (noDuplicate!956 acc!681))))

(declare-fun b!692466 () Bool)

(declare-fun e!393969 () Bool)

(assert (=> b!692466 (= e!393971 e!393969)))

(declare-fun res!456811 () Bool)

(assert (=> b!692466 (=> (not res!456811) (not e!393969))))

(assert (=> b!692466 (= res!456811 (not (= (select (arr!19085 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316389 () Unit!24440)

(assert (=> b!692466 (= lt!316389 e!393968)))

(declare-fun c!78186 () Bool)

(assert (=> b!692466 (= c!78186 (= (select (arr!19085 a!3626) from!3004) k0!2843))))

(declare-fun b!692467 () Bool)

(declare-fun res!456817 () Bool)

(assert (=> b!692467 (=> (not res!456817) (not e!393966))))

(assert (=> b!692467 (= res!456817 (not (contains!3687 lt!316388 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692468 () Bool)

(declare-fun res!456830 () Bool)

(assert (=> b!692468 (=> (not res!456830) (not e!393966))))

(assert (=> b!692468 (= res!456830 (not (contains!3687 lt!316388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692469 () Bool)

(assert (=> b!692469 (= e!393969 e!393966)))

(declare-fun res!456827 () Bool)

(assert (=> b!692469 (=> (not res!456827) (not e!393966))))

(assert (=> b!692469 (= res!456827 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!415 (List!13165 (_ BitVec 64)) List!13165)

(assert (=> b!692469 (= lt!316388 ($colon$colon!415 acc!681 (select (arr!19085 a!3626) from!3004)))))

(declare-fun b!692470 () Bool)

(declare-fun Unit!24443 () Unit!24440)

(assert (=> b!692470 (= e!393968 Unit!24443)))

(declare-fun b!692471 () Bool)

(declare-fun res!456813 () Bool)

(assert (=> b!692471 (=> (not res!456813) (not e!393971))))

(assert (=> b!692471 (= res!456813 (validKeyInArray!0 (select (arr!19085 a!3626) from!3004)))))

(declare-fun b!692472 () Bool)

(declare-fun res!456820 () Bool)

(assert (=> b!692472 (=> (not res!456820) (not e!393971))))

(assert (=> b!692472 (= res!456820 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13162))))

(assert (= (and start!61898 res!456810) b!692465))

(assert (= (and b!692465 res!456825) b!692451))

(assert (= (and b!692451 res!456822) b!692450))

(assert (= (and b!692450 res!456818) b!692448))

(assert (= (and b!692448 res!456828) b!692449))

(assert (= (and b!692448 (not res!456823)) b!692455))

(assert (= (and b!692455 res!456831) b!692452))

(assert (= (and b!692448 res!456815) b!692472))

(assert (= (and b!692472 res!456820) b!692463))

(assert (= (and b!692463 res!456821) b!692454))

(assert (= (and b!692454 res!456814) b!692461))

(assert (= (and b!692461 res!456816) b!692456))

(assert (= (and b!692456 res!456812) b!692460))

(assert (= (and b!692460 res!456819) b!692471))

(assert (= (and b!692471 res!456813) b!692466))

(assert (= (and b!692466 c!78186) b!692464))

(assert (= (and b!692466 (not c!78186)) b!692470))

(assert (= (and b!692466 res!456811) b!692469))

(assert (= (and b!692469 res!456827) b!692457))

(assert (= (and b!692457 res!456829) b!692468))

(assert (= (and b!692468 res!456830) b!692467))

(assert (= (and b!692467 res!456817) b!692458))

(assert (= (and b!692458 (not res!456824)) b!692459))

(assert (= (and b!692458 res!456832) b!692462))

(assert (= (and b!692462 (not res!456826)) b!692453))

(declare-fun m!654477 () Bool)

(assert (=> b!692463 m!654477))

(declare-fun m!654479 () Bool)

(assert (=> b!692472 m!654479))

(declare-fun m!654481 () Bool)

(assert (=> b!692449 m!654481))

(declare-fun m!654483 () Bool)

(assert (=> b!692453 m!654483))

(declare-fun m!654485 () Bool)

(assert (=> b!692466 m!654485))

(declare-fun m!654487 () Bool)

(assert (=> b!692451 m!654487))

(declare-fun m!654489 () Bool)

(assert (=> b!692457 m!654489))

(declare-fun m!654491 () Bool)

(assert (=> start!61898 m!654491))

(assert (=> b!692459 m!654483))

(declare-fun m!654493 () Bool)

(assert (=> b!692467 m!654493))

(declare-fun m!654495 () Bool)

(assert (=> b!692461 m!654495))

(assert (=> b!692469 m!654485))

(assert (=> b!692469 m!654485))

(declare-fun m!654497 () Bool)

(assert (=> b!692469 m!654497))

(declare-fun m!654499 () Bool)

(assert (=> b!692468 m!654499))

(declare-fun m!654501 () Bool)

(assert (=> b!692450 m!654501))

(declare-fun m!654503 () Bool)

(assert (=> b!692465 m!654503))

(assert (=> b!692452 m!654481))

(assert (=> b!692471 m!654485))

(assert (=> b!692471 m!654485))

(declare-fun m!654505 () Bool)

(assert (=> b!692471 m!654505))

(declare-fun m!654507 () Bool)

(assert (=> b!692464 m!654507))

(declare-fun m!654509 () Bool)

(assert (=> b!692464 m!654509))

(declare-fun m!654511 () Bool)

(assert (=> b!692456 m!654511))

(check-sat (not b!692467) (not b!692449) (not b!692459) (not b!692451) (not b!692465) (not b!692452) (not b!692469) (not b!692472) (not b!692450) (not b!692468) (not b!692463) (not b!692461) (not b!692471) (not b!692456) (not b!692464) (not b!692453) (not start!61898) (not b!692457))
(check-sat)
(get-model)

(declare-fun b!692633 () Bool)

(declare-fun e!394046 () Bool)

(declare-fun e!394043 () Bool)

(assert (=> b!692633 (= e!394046 e!394043)))

(declare-fun c!78195 () Bool)

(assert (=> b!692633 (= c!78195 (validKeyInArray!0 (select (arr!19085 a!3626) from!3004)))))

(declare-fun d!95491 () Bool)

(declare-fun res!456978 () Bool)

(declare-fun e!394044 () Bool)

(assert (=> d!95491 (=> res!456978 e!394044)))

(assert (=> d!95491 (= res!456978 (bvsge from!3004 (size!19467 a!3626)))))

(assert (=> d!95491 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394044)))

(declare-fun b!692634 () Bool)

(declare-fun call!34225 () Bool)

(assert (=> b!692634 (= e!394043 call!34225)))

(declare-fun b!692635 () Bool)

(assert (=> b!692635 (= e!394044 e!394046)))

(declare-fun res!456977 () Bool)

(assert (=> b!692635 (=> (not res!456977) (not e!394046))))

(declare-fun e!394045 () Bool)

(assert (=> b!692635 (= res!456977 (not e!394045))))

(declare-fun res!456979 () Bool)

(assert (=> b!692635 (=> (not res!456979) (not e!394045))))

(assert (=> b!692635 (= res!456979 (validKeyInArray!0 (select (arr!19085 a!3626) from!3004)))))

(declare-fun b!692636 () Bool)

(assert (=> b!692636 (= e!394045 (contains!3687 acc!681 (select (arr!19085 a!3626) from!3004)))))

(declare-fun b!692637 () Bool)

(assert (=> b!692637 (= e!394043 call!34225)))

(declare-fun bm!34222 () Bool)

(assert (=> bm!34222 (= call!34225 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78195 (Cons!13161 (select (arr!19085 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!95491 (not res!456978)) b!692635))

(assert (= (and b!692635 res!456979) b!692636))

(assert (= (and b!692635 res!456977) b!692633))

(assert (= (and b!692633 c!78195) b!692634))

(assert (= (and b!692633 (not c!78195)) b!692637))

(assert (= (or b!692634 b!692637) bm!34222))

(assert (=> b!692633 m!654485))

(assert (=> b!692633 m!654485))

(assert (=> b!692633 m!654505))

(assert (=> b!692635 m!654485))

(assert (=> b!692635 m!654485))

(assert (=> b!692635 m!654505))

(assert (=> b!692636 m!654485))

(assert (=> b!692636 m!654485))

(declare-fun m!654585 () Bool)

(assert (=> b!692636 m!654585))

(assert (=> bm!34222 m!654485))

(declare-fun m!654587 () Bool)

(assert (=> bm!34222 m!654587))

(assert (=> b!692463 d!95491))

(declare-fun d!95493 () Bool)

(declare-fun lt!316410 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!313 (List!13165) (InoxSet (_ BitVec 64)))

(assert (=> d!95493 (= lt!316410 (select (content!313 acc!681) k0!2843))))

(declare-fun e!394052 () Bool)

(assert (=> d!95493 (= lt!316410 e!394052)))

(declare-fun res!456985 () Bool)

(assert (=> d!95493 (=> (not res!456985) (not e!394052))))

(get-info :version)

(assert (=> d!95493 (= res!456985 ((_ is Cons!13161) acc!681))))

(assert (=> d!95493 (= (contains!3687 acc!681 k0!2843) lt!316410)))

(declare-fun b!692642 () Bool)

(declare-fun e!394051 () Bool)

(assert (=> b!692642 (= e!394052 e!394051)))

(declare-fun res!456984 () Bool)

(assert (=> b!692642 (=> res!456984 e!394051)))

(assert (=> b!692642 (= res!456984 (= (h!14206 acc!681) k0!2843))))

(declare-fun b!692643 () Bool)

(assert (=> b!692643 (= e!394051 (contains!3687 (t!19429 acc!681) k0!2843))))

(assert (= (and d!95493 res!456985) b!692642))

(assert (= (and b!692642 (not res!456984)) b!692643))

(declare-fun m!654589 () Bool)

(assert (=> d!95493 m!654589))

(declare-fun m!654591 () Bool)

(assert (=> d!95493 m!654591))

(declare-fun m!654593 () Bool)

(assert (=> b!692643 m!654593))

(assert (=> b!692452 d!95493))

(declare-fun d!95495 () Bool)

(declare-fun lt!316411 () Bool)

(assert (=> d!95495 (= lt!316411 (select (content!313 lt!316388) k0!2843))))

(declare-fun e!394054 () Bool)

(assert (=> d!95495 (= lt!316411 e!394054)))

(declare-fun res!456987 () Bool)

(assert (=> d!95495 (=> (not res!456987) (not e!394054))))

(assert (=> d!95495 (= res!456987 ((_ is Cons!13161) lt!316388))))

(assert (=> d!95495 (= (contains!3687 lt!316388 k0!2843) lt!316411)))

(declare-fun b!692644 () Bool)

(declare-fun e!394053 () Bool)

(assert (=> b!692644 (= e!394054 e!394053)))

(declare-fun res!456986 () Bool)

(assert (=> b!692644 (=> res!456986 e!394053)))

(assert (=> b!692644 (= res!456986 (= (h!14206 lt!316388) k0!2843))))

(declare-fun b!692645 () Bool)

(assert (=> b!692645 (= e!394053 (contains!3687 (t!19429 lt!316388) k0!2843))))

(assert (= (and d!95495 res!456987) b!692644))

(assert (= (and b!692644 (not res!456986)) b!692645))

(declare-fun m!654595 () Bool)

(assert (=> d!95495 m!654595))

(declare-fun m!654597 () Bool)

(assert (=> d!95495 m!654597))

(declare-fun m!654599 () Bool)

(assert (=> b!692645 m!654599))

(assert (=> b!692453 d!95495))

(declare-fun d!95497 () Bool)

(declare-fun res!456992 () Bool)

(declare-fun e!394059 () Bool)

(assert (=> d!95497 (=> res!456992 e!394059)))

(assert (=> d!95497 (= res!456992 (= (select (arr!19085 a!3626) from!3004) k0!2843))))

(assert (=> d!95497 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!394059)))

(declare-fun b!692650 () Bool)

(declare-fun e!394060 () Bool)

(assert (=> b!692650 (= e!394059 e!394060)))

(declare-fun res!456993 () Bool)

(assert (=> b!692650 (=> (not res!456993) (not e!394060))))

(assert (=> b!692650 (= res!456993 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19467 a!3626)))))

(declare-fun b!692651 () Bool)

(assert (=> b!692651 (= e!394060 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95497 (not res!456992)) b!692650))

(assert (= (and b!692650 res!456993) b!692651))

(assert (=> d!95497 m!654485))

(declare-fun m!654601 () Bool)

(assert (=> b!692651 m!654601))

(assert (=> b!692464 d!95497))

(declare-fun d!95499 () Bool)

(assert (=> d!95499 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316414 () Unit!24440)

(declare-fun choose!13 (array!39840 (_ BitVec 64) (_ BitVec 32)) Unit!24440)

(assert (=> d!95499 (= lt!316414 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95499 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95499 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316414)))

(declare-fun bs!20244 () Bool)

(assert (= bs!20244 d!95499))

(assert (=> bs!20244 m!654511))

(declare-fun m!654603 () Bool)

(assert (=> bs!20244 m!654603))

(assert (=> b!692464 d!95499))

(declare-fun d!95501 () Bool)

(declare-fun res!456998 () Bool)

(declare-fun e!394065 () Bool)

(assert (=> d!95501 (=> res!456998 e!394065)))

(assert (=> d!95501 (= res!456998 ((_ is Nil!13162) acc!681))))

(assert (=> d!95501 (= (noDuplicate!956 acc!681) e!394065)))

(declare-fun b!692656 () Bool)

(declare-fun e!394066 () Bool)

(assert (=> b!692656 (= e!394065 e!394066)))

(declare-fun res!456999 () Bool)

(assert (=> b!692656 (=> (not res!456999) (not e!394066))))

(assert (=> b!692656 (= res!456999 (not (contains!3687 (t!19429 acc!681) (h!14206 acc!681))))))

(declare-fun b!692657 () Bool)

(assert (=> b!692657 (= e!394066 (noDuplicate!956 (t!19429 acc!681)))))

(assert (= (and d!95501 (not res!456998)) b!692656))

(assert (= (and b!692656 res!456999) b!692657))

(declare-fun m!654605 () Bool)

(assert (=> b!692656 m!654605))

(declare-fun m!654607 () Bool)

(assert (=> b!692657 m!654607))

(assert (=> b!692465 d!95501))

(declare-fun d!95503 () Bool)

(declare-fun lt!316415 () Bool)

(assert (=> d!95503 (= lt!316415 (select (content!313 lt!316388) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394068 () Bool)

(assert (=> d!95503 (= lt!316415 e!394068)))

(declare-fun res!457001 () Bool)

(assert (=> d!95503 (=> (not res!457001) (not e!394068))))

(assert (=> d!95503 (= res!457001 ((_ is Cons!13161) lt!316388))))

(assert (=> d!95503 (= (contains!3687 lt!316388 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316415)))

(declare-fun b!692658 () Bool)

(declare-fun e!394067 () Bool)

(assert (=> b!692658 (= e!394068 e!394067)))

(declare-fun res!457000 () Bool)

(assert (=> b!692658 (=> res!457000 e!394067)))

(assert (=> b!692658 (= res!457000 (= (h!14206 lt!316388) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692659 () Bool)

(assert (=> b!692659 (= e!394067 (contains!3687 (t!19429 lt!316388) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95503 res!457001) b!692658))

(assert (= (and b!692658 (not res!457000)) b!692659))

(assert (=> d!95503 m!654595))

(declare-fun m!654609 () Bool)

(assert (=> d!95503 m!654609))

(declare-fun m!654611 () Bool)

(assert (=> b!692659 m!654611))

(assert (=> b!692467 d!95503))

(declare-fun d!95505 () Bool)

(declare-fun res!457002 () Bool)

(declare-fun e!394069 () Bool)

(assert (=> d!95505 (=> res!457002 e!394069)))

(assert (=> d!95505 (= res!457002 (= (select (arr!19085 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95505 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!394069)))

(declare-fun b!692660 () Bool)

(declare-fun e!394070 () Bool)

(assert (=> b!692660 (= e!394069 e!394070)))

(declare-fun res!457003 () Bool)

(assert (=> b!692660 (=> (not res!457003) (not e!394070))))

(assert (=> b!692660 (= res!457003 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19467 a!3626)))))

(declare-fun b!692661 () Bool)

(assert (=> b!692661 (= e!394070 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95505 (not res!457002)) b!692660))

(assert (= (and b!692660 res!457003) b!692661))

(declare-fun m!654613 () Bool)

(assert (=> d!95505 m!654613))

(declare-fun m!654615 () Bool)

(assert (=> b!692661 m!654615))

(assert (=> b!692456 d!95505))

(declare-fun d!95507 () Bool)

(declare-fun res!457004 () Bool)

(declare-fun e!394071 () Bool)

(assert (=> d!95507 (=> res!457004 e!394071)))

(assert (=> d!95507 (= res!457004 ((_ is Nil!13162) lt!316388))))

(assert (=> d!95507 (= (noDuplicate!956 lt!316388) e!394071)))

(declare-fun b!692662 () Bool)

(declare-fun e!394072 () Bool)

(assert (=> b!692662 (= e!394071 e!394072)))

(declare-fun res!457005 () Bool)

(assert (=> b!692662 (=> (not res!457005) (not e!394072))))

(assert (=> b!692662 (= res!457005 (not (contains!3687 (t!19429 lt!316388) (h!14206 lt!316388))))))

(declare-fun b!692663 () Bool)

(assert (=> b!692663 (= e!394072 (noDuplicate!956 (t!19429 lt!316388)))))

(assert (= (and d!95507 (not res!457004)) b!692662))

(assert (= (and b!692662 res!457005) b!692663))

(declare-fun m!654617 () Bool)

(assert (=> b!692662 m!654617))

(declare-fun m!654619 () Bool)

(assert (=> b!692663 m!654619))

(assert (=> b!692457 d!95507))

(declare-fun d!95509 () Bool)

(assert (=> d!95509 (= (array_inv!14968 a!3626) (bvsge (size!19467 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61898 d!95509))

(declare-fun d!95511 () Bool)

(declare-fun lt!316416 () Bool)

(assert (=> d!95511 (= lt!316416 (select (content!313 lt!316388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394074 () Bool)

(assert (=> d!95511 (= lt!316416 e!394074)))

(declare-fun res!457007 () Bool)

(assert (=> d!95511 (=> (not res!457007) (not e!394074))))

(assert (=> d!95511 (= res!457007 ((_ is Cons!13161) lt!316388))))

(assert (=> d!95511 (= (contains!3687 lt!316388 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316416)))

(declare-fun b!692664 () Bool)

(declare-fun e!394073 () Bool)

(assert (=> b!692664 (= e!394074 e!394073)))

(declare-fun res!457006 () Bool)

(assert (=> b!692664 (=> res!457006 e!394073)))

(assert (=> b!692664 (= res!457006 (= (h!14206 lt!316388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692665 () Bool)

(assert (=> b!692665 (= e!394073 (contains!3687 (t!19429 lt!316388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95511 res!457007) b!692664))

(assert (= (and b!692664 (not res!457006)) b!692665))

(assert (=> d!95511 m!654595))

(declare-fun m!654621 () Bool)

(assert (=> d!95511 m!654621))

(declare-fun m!654623 () Bool)

(assert (=> b!692665 m!654623))

(assert (=> b!692468 d!95511))

(declare-fun d!95513 () Bool)

(assert (=> d!95513 (= ($colon$colon!415 acc!681 (select (arr!19085 a!3626) from!3004)) (Cons!13161 (select (arr!19085 a!3626) from!3004) acc!681))))

(assert (=> b!692469 d!95513))

(assert (=> b!692459 d!95495))

(assert (=> b!692449 d!95493))

(declare-fun d!95517 () Bool)

(assert (=> d!95517 (= (validKeyInArray!0 (select (arr!19085 a!3626) from!3004)) (and (not (= (select (arr!19085 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19085 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692471 d!95517))

(declare-fun d!95519 () Bool)

(assert (=> d!95519 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692461 d!95519))

(declare-fun d!95521 () Bool)

(declare-fun lt!316417 () Bool)

(assert (=> d!95521 (= lt!316417 (select (content!313 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394076 () Bool)

(assert (=> d!95521 (= lt!316417 e!394076)))

(declare-fun res!457009 () Bool)

(assert (=> d!95521 (=> (not res!457009) (not e!394076))))

(assert (=> d!95521 (= res!457009 ((_ is Cons!13161) acc!681))))

(assert (=> d!95521 (= (contains!3687 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316417)))

(declare-fun b!692666 () Bool)

(declare-fun e!394075 () Bool)

(assert (=> b!692666 (= e!394076 e!394075)))

(declare-fun res!457008 () Bool)

(assert (=> b!692666 (=> res!457008 e!394075)))

(assert (=> b!692666 (= res!457008 (= (h!14206 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692667 () Bool)

(assert (=> b!692667 (= e!394075 (contains!3687 (t!19429 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95521 res!457009) b!692666))

(assert (= (and b!692666 (not res!457008)) b!692667))

(assert (=> d!95521 m!654589))

(declare-fun m!654625 () Bool)

(assert (=> d!95521 m!654625))

(declare-fun m!654627 () Bool)

(assert (=> b!692667 m!654627))

(assert (=> b!692450 d!95521))

(declare-fun d!95523 () Bool)

(declare-fun lt!316418 () Bool)

(assert (=> d!95523 (= lt!316418 (select (content!313 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394078 () Bool)

(assert (=> d!95523 (= lt!316418 e!394078)))

(declare-fun res!457011 () Bool)

(assert (=> d!95523 (=> (not res!457011) (not e!394078))))

(assert (=> d!95523 (= res!457011 ((_ is Cons!13161) acc!681))))

(assert (=> d!95523 (= (contains!3687 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316418)))

(declare-fun b!692668 () Bool)

(declare-fun e!394077 () Bool)

(assert (=> b!692668 (= e!394078 e!394077)))

(declare-fun res!457010 () Bool)

(assert (=> b!692668 (=> res!457010 e!394077)))

(assert (=> b!692668 (= res!457010 (= (h!14206 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692669 () Bool)

(assert (=> b!692669 (= e!394077 (contains!3687 (t!19429 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95523 res!457011) b!692668))

(assert (= (and b!692668 (not res!457010)) b!692669))

(assert (=> d!95523 m!654589))

(declare-fun m!654629 () Bool)

(assert (=> d!95523 m!654629))

(declare-fun m!654631 () Bool)

(assert (=> b!692669 m!654631))

(assert (=> b!692451 d!95523))

(declare-fun b!692674 () Bool)

(declare-fun e!394086 () Bool)

(declare-fun e!394083 () Bool)

(assert (=> b!692674 (= e!394086 e!394083)))

(declare-fun c!78196 () Bool)

(assert (=> b!692674 (= c!78196 (validKeyInArray!0 (select (arr!19085 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95525 () Bool)

(declare-fun res!457017 () Bool)

(declare-fun e!394084 () Bool)

(assert (=> d!95525 (=> res!457017 e!394084)))

(assert (=> d!95525 (= res!457017 (bvsge #b00000000000000000000000000000000 (size!19467 a!3626)))))

(assert (=> d!95525 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13162) e!394084)))

(declare-fun b!692675 () Bool)

(declare-fun call!34226 () Bool)

(assert (=> b!692675 (= e!394083 call!34226)))

(declare-fun b!692676 () Bool)

(assert (=> b!692676 (= e!394084 e!394086)))

(declare-fun res!457016 () Bool)

(assert (=> b!692676 (=> (not res!457016) (not e!394086))))

(declare-fun e!394085 () Bool)

(assert (=> b!692676 (= res!457016 (not e!394085))))

(declare-fun res!457018 () Bool)

(assert (=> b!692676 (=> (not res!457018) (not e!394085))))

(assert (=> b!692676 (= res!457018 (validKeyInArray!0 (select (arr!19085 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692677 () Bool)

(assert (=> b!692677 (= e!394085 (contains!3687 Nil!13162 (select (arr!19085 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692678 () Bool)

(assert (=> b!692678 (= e!394083 call!34226)))

(declare-fun bm!34223 () Bool)

(assert (=> bm!34223 (= call!34226 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78196 (Cons!13161 (select (arr!19085 a!3626) #b00000000000000000000000000000000) Nil!13162) Nil!13162)))))

(assert (= (and d!95525 (not res!457017)) b!692676))

(assert (= (and b!692676 res!457018) b!692677))

(assert (= (and b!692676 res!457016) b!692674))

(assert (= (and b!692674 c!78196) b!692675))

(assert (= (and b!692674 (not c!78196)) b!692678))

(assert (= (or b!692675 b!692678) bm!34223))

(assert (=> b!692674 m!654613))

(assert (=> b!692674 m!654613))

(declare-fun m!654633 () Bool)

(assert (=> b!692674 m!654633))

(assert (=> b!692676 m!654613))

(assert (=> b!692676 m!654613))

(assert (=> b!692676 m!654633))

(assert (=> b!692677 m!654613))

(assert (=> b!692677 m!654613))

(declare-fun m!654635 () Bool)

(assert (=> b!692677 m!654635))

(assert (=> bm!34223 m!654613))

(declare-fun m!654637 () Bool)

(assert (=> bm!34223 m!654637))

(assert (=> b!692472 d!95525))

(check-sat (not b!692645) (not b!692636) (not b!692674) (not d!95523) (not d!95503) (not b!692633) (not b!692651) (not b!692669) (not d!95511) (not b!692662) (not b!692657) (not bm!34223) (not d!95495) (not d!95499) (not b!692665) (not d!95521) (not b!692643) (not d!95493) (not b!692677) (not b!692661) (not b!692635) (not b!692659) (not b!692667) (not bm!34222) (not b!692663) (not b!692656) (not b!692676))
(check-sat)
