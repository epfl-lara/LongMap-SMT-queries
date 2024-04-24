; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61758 () Bool)

(assert start!61758)

(declare-fun b!690550 () Bool)

(declare-fun res!454844 () Bool)

(declare-fun e!393221 () Bool)

(assert (=> b!690550 (=> (not res!454844) (not e!393221))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39750 0))(
  ( (array!39751 (arr!19042 (Array (_ BitVec 32) (_ BitVec 64))) (size!19425 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39750)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!690550 (= res!454844 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19425 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690551 () Bool)

(declare-fun res!454857 () Bool)

(assert (=> b!690551 (=> (not res!454857) (not e!393221))))

(declare-datatypes ((List!12990 0))(
  ( (Nil!12987) (Cons!12986 (h!14034 (_ BitVec 64)) (t!19249 List!12990)) )
))
(declare-fun acc!681 () List!12990)

(declare-fun contains!3642 (List!12990 (_ BitVec 64)) Bool)

(assert (=> b!690551 (= res!454857 (not (contains!3642 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690552 () Bool)

(declare-fun res!454850 () Bool)

(assert (=> b!690552 (=> (not res!454850) (not e!393221))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690552 (= res!454850 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690554 () Bool)

(declare-fun res!454846 () Bool)

(assert (=> b!690554 (=> (not res!454846) (not e!393221))))

(declare-fun e!393218 () Bool)

(assert (=> b!690554 (= res!454846 e!393218)))

(declare-fun res!454843 () Bool)

(assert (=> b!690554 (=> res!454843 e!393218)))

(declare-fun e!393220 () Bool)

(assert (=> b!690554 (= res!454843 e!393220)))

(declare-fun res!454858 () Bool)

(assert (=> b!690554 (=> (not res!454858) (not e!393220))))

(assert (=> b!690554 (= res!454858 (bvsgt from!3004 i!1382))))

(declare-fun b!690555 () Bool)

(declare-fun res!454854 () Bool)

(assert (=> b!690555 (=> (not res!454854) (not e!393221))))

(declare-fun arrayNoDuplicates!0 (array!39750 (_ BitVec 32) List!12990) Bool)

(assert (=> b!690555 (= res!454854 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12987))))

(declare-fun b!690556 () Bool)

(declare-fun res!454847 () Bool)

(assert (=> b!690556 (=> (not res!454847) (not e!393221))))

(assert (=> b!690556 (= res!454847 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19425 a!3626))))))

(declare-fun b!690557 () Bool)

(assert (=> b!690557 (= e!393221 (not (arrayContainsKey!0 a!3626 k0!2843 from!3004)))))

(declare-fun b!690558 () Bool)

(declare-fun res!454856 () Bool)

(assert (=> b!690558 (=> (not res!454856) (not e!393221))))

(declare-fun noDuplicate!916 (List!12990) Bool)

(assert (=> b!690558 (= res!454856 (noDuplicate!916 acc!681))))

(declare-fun b!690559 () Bool)

(assert (=> b!690559 (= e!393220 (contains!3642 acc!681 k0!2843))))

(declare-fun res!454848 () Bool)

(assert (=> start!61758 (=> (not res!454848) (not e!393221))))

(assert (=> start!61758 (= res!454848 (and (bvslt (size!19425 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19425 a!3626))))))

(assert (=> start!61758 e!393221))

(assert (=> start!61758 true))

(declare-fun array_inv!14901 (array!39750) Bool)

(assert (=> start!61758 (array_inv!14901 a!3626)))

(declare-fun b!690553 () Bool)

(declare-fun res!454852 () Bool)

(assert (=> b!690553 (=> (not res!454852) (not e!393221))))

(assert (=> b!690553 (= res!454852 (= (select (arr!19042 a!3626) from!3004) k0!2843))))

(declare-fun b!690560 () Bool)

(declare-fun e!393222 () Bool)

(assert (=> b!690560 (= e!393222 (not (contains!3642 acc!681 k0!2843)))))

(declare-fun b!690561 () Bool)

(declare-fun res!454853 () Bool)

(assert (=> b!690561 (=> (not res!454853) (not e!393221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690561 (= res!454853 (validKeyInArray!0 (select (arr!19042 a!3626) from!3004)))))

(declare-fun b!690562 () Bool)

(declare-fun res!454851 () Bool)

(assert (=> b!690562 (=> (not res!454851) (not e!393221))))

(assert (=> b!690562 (= res!454851 (not (contains!3642 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690563 () Bool)

(declare-fun res!454845 () Bool)

(assert (=> b!690563 (=> (not res!454845) (not e!393221))))

(assert (=> b!690563 (= res!454845 (validKeyInArray!0 k0!2843))))

(declare-fun b!690564 () Bool)

(assert (=> b!690564 (= e!393218 e!393222)))

(declare-fun res!454855 () Bool)

(assert (=> b!690564 (=> (not res!454855) (not e!393222))))

(assert (=> b!690564 (= res!454855 (bvsle from!3004 i!1382))))

(declare-fun b!690565 () Bool)

(declare-fun res!454849 () Bool)

(assert (=> b!690565 (=> (not res!454849) (not e!393221))))

(assert (=> b!690565 (= res!454849 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!61758 res!454848) b!690558))

(assert (= (and b!690558 res!454856) b!690562))

(assert (= (and b!690562 res!454851) b!690551))

(assert (= (and b!690551 res!454857) b!690554))

(assert (= (and b!690554 res!454858) b!690559))

(assert (= (and b!690554 (not res!454843)) b!690564))

(assert (= (and b!690564 res!454855) b!690560))

(assert (= (and b!690554 res!454846) b!690555))

(assert (= (and b!690555 res!454854) b!690565))

(assert (= (and b!690565 res!454849) b!690556))

(assert (= (and b!690556 res!454847) b!690563))

(assert (= (and b!690563 res!454845) b!690552))

(assert (= (and b!690552 res!454850) b!690550))

(assert (= (and b!690550 res!454844) b!690561))

(assert (= (and b!690561 res!454853) b!690553))

(assert (= (and b!690553 res!454852) b!690557))

(declare-fun m!654565 () Bool)

(assert (=> start!61758 m!654565))

(declare-fun m!654567 () Bool)

(assert (=> b!690560 m!654567))

(declare-fun m!654569 () Bool)

(assert (=> b!690557 m!654569))

(declare-fun m!654571 () Bool)

(assert (=> b!690551 m!654571))

(assert (=> b!690559 m!654567))

(declare-fun m!654573 () Bool)

(assert (=> b!690552 m!654573))

(declare-fun m!654575 () Bool)

(assert (=> b!690562 m!654575))

(declare-fun m!654577 () Bool)

(assert (=> b!690561 m!654577))

(assert (=> b!690561 m!654577))

(declare-fun m!654579 () Bool)

(assert (=> b!690561 m!654579))

(declare-fun m!654581 () Bool)

(assert (=> b!690558 m!654581))

(declare-fun m!654583 () Bool)

(assert (=> b!690565 m!654583))

(assert (=> b!690553 m!654577))

(declare-fun m!654585 () Bool)

(assert (=> b!690555 m!654585))

(declare-fun m!654587 () Bool)

(assert (=> b!690563 m!654587))

(check-sat (not b!690559) (not b!690563) (not b!690561) (not b!690555) (not b!690557) (not b!690551) (not start!61758) (not b!690560) (not b!690565) (not b!690552) (not b!690562) (not b!690558))
(check-sat)
(get-model)

(declare-fun d!95557 () Bool)

(declare-fun lt!316528 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!306 (List!12990) (InoxSet (_ BitVec 64)))

(assert (=> d!95557 (= lt!316528 (select (content!306 acc!681) k0!2843))))

(declare-fun e!393257 () Bool)

(assert (=> d!95557 (= lt!316528 e!393257)))

(declare-fun res!454960 () Bool)

(assert (=> d!95557 (=> (not res!454960) (not e!393257))))

(get-info :version)

(assert (=> d!95557 (= res!454960 ((_ is Cons!12986) acc!681))))

(assert (=> d!95557 (= (contains!3642 acc!681 k0!2843) lt!316528)))

(declare-fun b!690666 () Bool)

(declare-fun e!393258 () Bool)

(assert (=> b!690666 (= e!393257 e!393258)))

(declare-fun res!454959 () Bool)

(assert (=> b!690666 (=> res!454959 e!393258)))

(assert (=> b!690666 (= res!454959 (= (h!14034 acc!681) k0!2843))))

(declare-fun b!690667 () Bool)

(assert (=> b!690667 (= e!393258 (contains!3642 (t!19249 acc!681) k0!2843))))

(assert (= (and d!95557 res!454960) b!690666))

(assert (= (and b!690666 (not res!454959)) b!690667))

(declare-fun m!654637 () Bool)

(assert (=> d!95557 m!654637))

(declare-fun m!654639 () Bool)

(assert (=> d!95557 m!654639))

(declare-fun m!654641 () Bool)

(assert (=> b!690667 m!654641))

(assert (=> b!690560 d!95557))

(declare-fun d!95559 () Bool)

(assert (=> d!95559 (= (validKeyInArray!0 (select (arr!19042 a!3626) from!3004)) (and (not (= (select (arr!19042 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19042 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690561 d!95559))

(declare-fun d!95561 () Bool)

(assert (=> d!95561 (= (array_inv!14901 a!3626) (bvsge (size!19425 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61758 d!95561))

(declare-fun d!95563 () Bool)

(declare-fun lt!316529 () Bool)

(assert (=> d!95563 (= lt!316529 (select (content!306 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393259 () Bool)

(assert (=> d!95563 (= lt!316529 e!393259)))

(declare-fun res!454962 () Bool)

(assert (=> d!95563 (=> (not res!454962) (not e!393259))))

(assert (=> d!95563 (= res!454962 ((_ is Cons!12986) acc!681))))

(assert (=> d!95563 (= (contains!3642 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316529)))

(declare-fun b!690668 () Bool)

(declare-fun e!393260 () Bool)

(assert (=> b!690668 (= e!393259 e!393260)))

(declare-fun res!454961 () Bool)

(assert (=> b!690668 (=> res!454961 e!393260)))

(assert (=> b!690668 (= res!454961 (= (h!14034 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690669 () Bool)

(assert (=> b!690669 (= e!393260 (contains!3642 (t!19249 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95563 res!454962) b!690668))

(assert (= (and b!690668 (not res!454961)) b!690669))

(assert (=> d!95563 m!654637))

(declare-fun m!654643 () Bool)

(assert (=> d!95563 m!654643))

(declare-fun m!654645 () Bool)

(assert (=> b!690669 m!654645))

(assert (=> b!690551 d!95563))

(declare-fun d!95565 () Bool)

(declare-fun res!454967 () Bool)

(declare-fun e!393265 () Bool)

(assert (=> d!95565 (=> res!454967 e!393265)))

(assert (=> d!95565 (= res!454967 (= (select (arr!19042 a!3626) from!3004) k0!2843))))

(assert (=> d!95565 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!393265)))

(declare-fun b!690674 () Bool)

(declare-fun e!393266 () Bool)

(assert (=> b!690674 (= e!393265 e!393266)))

(declare-fun res!454968 () Bool)

(assert (=> b!690674 (=> (not res!454968) (not e!393266))))

(assert (=> b!690674 (= res!454968 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19425 a!3626)))))

(declare-fun b!690675 () Bool)

(assert (=> b!690675 (= e!393266 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95565 (not res!454967)) b!690674))

(assert (= (and b!690674 res!454968) b!690675))

(assert (=> d!95565 m!654577))

(declare-fun m!654647 () Bool)

(assert (=> b!690675 m!654647))

(assert (=> b!690557 d!95565))

(declare-fun d!95567 () Bool)

(declare-fun res!454973 () Bool)

(declare-fun e!393271 () Bool)

(assert (=> d!95567 (=> res!454973 e!393271)))

(assert (=> d!95567 (= res!454973 ((_ is Nil!12987) acc!681))))

(assert (=> d!95567 (= (noDuplicate!916 acc!681) e!393271)))

(declare-fun b!690680 () Bool)

(declare-fun e!393272 () Bool)

(assert (=> b!690680 (= e!393271 e!393272)))

(declare-fun res!454974 () Bool)

(assert (=> b!690680 (=> (not res!454974) (not e!393272))))

(assert (=> b!690680 (= res!454974 (not (contains!3642 (t!19249 acc!681) (h!14034 acc!681))))))

(declare-fun b!690681 () Bool)

(assert (=> b!690681 (= e!393272 (noDuplicate!916 (t!19249 acc!681)))))

(assert (= (and d!95567 (not res!454973)) b!690680))

(assert (= (and b!690680 res!454974) b!690681))

(declare-fun m!654649 () Bool)

(assert (=> b!690680 m!654649))

(declare-fun m!654651 () Bool)

(assert (=> b!690681 m!654651))

(assert (=> b!690558 d!95567))

(assert (=> b!690559 d!95557))

(declare-fun c!78226 () Bool)

(declare-fun call!34226 () Bool)

(declare-fun bm!34223 () Bool)

(assert (=> bm!34223 (= call!34226 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78226 (Cons!12986 (select (arr!19042 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun e!393306 () Bool)

(declare-fun b!690716 () Bool)

(assert (=> b!690716 (= e!393306 (contains!3642 acc!681 (select (arr!19042 a!3626) from!3004)))))

(declare-fun d!95571 () Bool)

(declare-fun res!455001 () Bool)

(declare-fun e!393303 () Bool)

(assert (=> d!95571 (=> res!455001 e!393303)))

(assert (=> d!95571 (= res!455001 (bvsge from!3004 (size!19425 a!3626)))))

(assert (=> d!95571 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!393303)))

(declare-fun b!690717 () Bool)

(declare-fun e!393304 () Bool)

(assert (=> b!690717 (= e!393304 call!34226)))

(declare-fun b!690718 () Bool)

(assert (=> b!690718 (= e!393304 call!34226)))

(declare-fun b!690719 () Bool)

(declare-fun e!393305 () Bool)

(assert (=> b!690719 (= e!393305 e!393304)))

(assert (=> b!690719 (= c!78226 (validKeyInArray!0 (select (arr!19042 a!3626) from!3004)))))

(declare-fun b!690720 () Bool)

(assert (=> b!690720 (= e!393303 e!393305)))

(declare-fun res!455002 () Bool)

(assert (=> b!690720 (=> (not res!455002) (not e!393305))))

(assert (=> b!690720 (= res!455002 (not e!393306))))

(declare-fun res!455003 () Bool)

(assert (=> b!690720 (=> (not res!455003) (not e!393306))))

(assert (=> b!690720 (= res!455003 (validKeyInArray!0 (select (arr!19042 a!3626) from!3004)))))

(assert (= (and d!95571 (not res!455001)) b!690720))

(assert (= (and b!690720 res!455003) b!690716))

(assert (= (and b!690720 res!455002) b!690719))

(assert (= (and b!690719 c!78226) b!690717))

(assert (= (and b!690719 (not c!78226)) b!690718))

(assert (= (or b!690717 b!690718) bm!34223))

(assert (=> bm!34223 m!654577))

(declare-fun m!654669 () Bool)

(assert (=> bm!34223 m!654669))

(assert (=> b!690716 m!654577))

(assert (=> b!690716 m!654577))

(declare-fun m!654671 () Bool)

(assert (=> b!690716 m!654671))

(assert (=> b!690719 m!654577))

(assert (=> b!690719 m!654577))

(assert (=> b!690719 m!654579))

(assert (=> b!690720 m!654577))

(assert (=> b!690720 m!654577))

(assert (=> b!690720 m!654579))

(assert (=> b!690565 d!95571))

(declare-fun bm!34224 () Bool)

(declare-fun call!34227 () Bool)

(declare-fun c!78227 () Bool)

(assert (=> bm!34224 (= call!34227 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78227 (Cons!12986 (select (arr!19042 a!3626) #b00000000000000000000000000000000) Nil!12987) Nil!12987)))))

(declare-fun b!690725 () Bool)

(declare-fun e!393314 () Bool)

(assert (=> b!690725 (= e!393314 (contains!3642 Nil!12987 (select (arr!19042 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95587 () Bool)

(declare-fun res!455008 () Bool)

(declare-fun e!393311 () Bool)

(assert (=> d!95587 (=> res!455008 e!393311)))

(assert (=> d!95587 (= res!455008 (bvsge #b00000000000000000000000000000000 (size!19425 a!3626)))))

(assert (=> d!95587 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12987) e!393311)))

(declare-fun b!690726 () Bool)

(declare-fun e!393312 () Bool)

(assert (=> b!690726 (= e!393312 call!34227)))

(declare-fun b!690727 () Bool)

(assert (=> b!690727 (= e!393312 call!34227)))

(declare-fun b!690728 () Bool)

(declare-fun e!393313 () Bool)

(assert (=> b!690728 (= e!393313 e!393312)))

(assert (=> b!690728 (= c!78227 (validKeyInArray!0 (select (arr!19042 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690729 () Bool)

(assert (=> b!690729 (= e!393311 e!393313)))

(declare-fun res!455009 () Bool)

(assert (=> b!690729 (=> (not res!455009) (not e!393313))))

(assert (=> b!690729 (= res!455009 (not e!393314))))

(declare-fun res!455010 () Bool)

(assert (=> b!690729 (=> (not res!455010) (not e!393314))))

(assert (=> b!690729 (= res!455010 (validKeyInArray!0 (select (arr!19042 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95587 (not res!455008)) b!690729))

(assert (= (and b!690729 res!455010) b!690725))

(assert (= (and b!690729 res!455009) b!690728))

(assert (= (and b!690728 c!78227) b!690726))

(assert (= (and b!690728 (not c!78227)) b!690727))

(assert (= (or b!690726 b!690727) bm!34224))

(declare-fun m!654673 () Bool)

(assert (=> bm!34224 m!654673))

(declare-fun m!654675 () Bool)

(assert (=> bm!34224 m!654675))

(assert (=> b!690725 m!654673))

(assert (=> b!690725 m!654673))

(declare-fun m!654677 () Bool)

(assert (=> b!690725 m!654677))

(assert (=> b!690728 m!654673))

(assert (=> b!690728 m!654673))

(declare-fun m!654679 () Bool)

(assert (=> b!690728 m!654679))

(assert (=> b!690729 m!654673))

(assert (=> b!690729 m!654673))

(assert (=> b!690729 m!654679))

(assert (=> b!690555 d!95587))

(declare-fun d!95589 () Bool)

(declare-fun lt!316537 () Bool)

(assert (=> d!95589 (= lt!316537 (select (content!306 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393321 () Bool)

(assert (=> d!95589 (= lt!316537 e!393321)))

(declare-fun res!455017 () Bool)

(assert (=> d!95589 (=> (not res!455017) (not e!393321))))

(assert (=> d!95589 (= res!455017 ((_ is Cons!12986) acc!681))))

(assert (=> d!95589 (= (contains!3642 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316537)))

(declare-fun b!690737 () Bool)

(declare-fun e!393322 () Bool)

(assert (=> b!690737 (= e!393321 e!393322)))

(declare-fun res!455016 () Bool)

(assert (=> b!690737 (=> res!455016 e!393322)))

(assert (=> b!690737 (= res!455016 (= (h!14034 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690738 () Bool)

(assert (=> b!690738 (= e!393322 (contains!3642 (t!19249 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95589 res!455017) b!690737))

(assert (= (and b!690737 (not res!455016)) b!690738))

(assert (=> d!95589 m!654637))

(declare-fun m!654685 () Bool)

(assert (=> d!95589 m!654685))

(declare-fun m!654687 () Bool)

(assert (=> b!690738 m!654687))

(assert (=> b!690562 d!95589))

(declare-fun d!95593 () Bool)

(assert (=> d!95593 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690563 d!95593))

(declare-fun d!95595 () Bool)

(declare-fun res!455018 () Bool)

(declare-fun e!393323 () Bool)

(assert (=> d!95595 (=> res!455018 e!393323)))

(assert (=> d!95595 (= res!455018 (= (select (arr!19042 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95595 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!393323)))

(declare-fun b!690739 () Bool)

(declare-fun e!393324 () Bool)

(assert (=> b!690739 (= e!393323 e!393324)))

(declare-fun res!455019 () Bool)

(assert (=> b!690739 (=> (not res!455019) (not e!393324))))

(assert (=> b!690739 (= res!455019 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19425 a!3626)))))

(declare-fun b!690740 () Bool)

(assert (=> b!690740 (= e!393324 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95595 (not res!455018)) b!690739))

(assert (= (and b!690739 res!455019) b!690740))

(assert (=> d!95595 m!654673))

(declare-fun m!654693 () Bool)

(assert (=> b!690740 m!654693))

(assert (=> b!690552 d!95595))

(check-sat (not b!690675) (not bm!34223) (not b!690738) (not bm!34224) (not b!690669) (not d!95589) (not b!690716) (not b!690680) (not b!690720) (not b!690725) (not b!690740) (not b!690667) (not b!690681) (not d!95557) (not b!690719) (not d!95563) (not b!690728) (not b!690729))
(check-sat)
