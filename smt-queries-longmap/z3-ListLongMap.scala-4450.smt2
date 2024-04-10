; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61804 () Bool)

(assert start!61804)

(declare-fun b!692145 () Bool)

(declare-fun res!456437 () Bool)

(declare-fun e!393764 () Bool)

(assert (=> b!692145 (=> (not res!456437) (not e!393764))))

(declare-datatypes ((array!39825 0))(
  ( (array!39826 (arr!19081 (Array (_ BitVec 32) (_ BitVec 64))) (size!19466 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39825)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692145 (= res!456437 (validKeyInArray!0 (select (arr!19081 a!3626) from!3004)))))

(declare-fun b!692146 () Bool)

(declare-fun e!393766 () Bool)

(assert (=> b!692146 (= e!393764 e!393766)))

(declare-fun res!456438 () Bool)

(assert (=> b!692146 (=> (not res!456438) (not e!393766))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!692146 (= res!456438 (and (not (= (select (arr!19081 a!3626) from!3004) k0!2843)) (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!24442 0))(
  ( (Unit!24443) )
))
(declare-fun lt!316548 () Unit!24442)

(declare-fun e!393765 () Unit!24442)

(assert (=> b!692146 (= lt!316548 e!393765)))

(declare-fun c!78227 () Bool)

(assert (=> b!692146 (= c!78227 (= (select (arr!19081 a!3626) from!3004) k0!2843))))

(declare-fun b!692147 () Bool)

(declare-fun res!456430 () Bool)

(assert (=> b!692147 (=> (not res!456430) (not e!393764))))

(declare-datatypes ((List!13122 0))(
  ( (Nil!13119) (Cons!13118 (h!14163 (_ BitVec 64)) (t!19389 List!13122)) )
))
(declare-fun acc!681 () List!13122)

(declare-fun noDuplicate!946 (List!13122) Bool)

(assert (=> b!692147 (= res!456430 (noDuplicate!946 acc!681))))

(declare-fun b!692148 () Bool)

(declare-fun res!456429 () Bool)

(assert (=> b!692148 (=> (not res!456429) (not e!393764))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692148 (= res!456429 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19466 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692149 () Bool)

(declare-fun $colon$colon!411 (List!13122 (_ BitVec 64)) List!13122)

(assert (=> b!692149 (= e!393766 (not (noDuplicate!946 ($colon$colon!411 acc!681 (select (arr!19081 a!3626) from!3004)))))))

(declare-fun res!456426 () Bool)

(assert (=> start!61804 (=> (not res!456426) (not e!393764))))

(assert (=> start!61804 (= res!456426 (and (bvslt (size!19466 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19466 a!3626))))))

(assert (=> start!61804 e!393764))

(assert (=> start!61804 true))

(declare-fun array_inv!14877 (array!39825) Bool)

(assert (=> start!61804 (array_inv!14877 a!3626)))

(declare-fun b!692150 () Bool)

(declare-fun res!456440 () Bool)

(assert (=> b!692150 (=> (not res!456440) (not e!393764))))

(assert (=> b!692150 (= res!456440 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19466 a!3626))))))

(declare-fun b!692151 () Bool)

(declare-fun Unit!24444 () Unit!24442)

(assert (=> b!692151 (= e!393765 Unit!24444)))

(declare-fun arrayContainsKey!0 (array!39825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692151 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316549 () Unit!24442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39825 (_ BitVec 64) (_ BitVec 32)) Unit!24442)

(assert (=> b!692151 (= lt!316549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!692151 false))

(declare-fun b!692152 () Bool)

(declare-fun res!456435 () Bool)

(assert (=> b!692152 (=> (not res!456435) (not e!393764))))

(declare-fun e!393767 () Bool)

(assert (=> b!692152 (= res!456435 e!393767)))

(declare-fun res!456427 () Bool)

(assert (=> b!692152 (=> res!456427 e!393767)))

(declare-fun e!393763 () Bool)

(assert (=> b!692152 (= res!456427 e!393763)))

(declare-fun res!456428 () Bool)

(assert (=> b!692152 (=> (not res!456428) (not e!393763))))

(assert (=> b!692152 (= res!456428 (bvsgt from!3004 i!1382))))

(declare-fun b!692153 () Bool)

(declare-fun contains!3699 (List!13122 (_ BitVec 64)) Bool)

(assert (=> b!692153 (= e!393763 (contains!3699 acc!681 k0!2843))))

(declare-fun b!692154 () Bool)

(declare-fun Unit!24445 () Unit!24442)

(assert (=> b!692154 (= e!393765 Unit!24445)))

(declare-fun b!692155 () Bool)

(declare-fun res!456431 () Bool)

(assert (=> b!692155 (=> (not res!456431) (not e!393764))))

(assert (=> b!692155 (= res!456431 (not (contains!3699 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692156 () Bool)

(declare-fun e!393768 () Bool)

(assert (=> b!692156 (= e!393768 (not (contains!3699 acc!681 k0!2843)))))

(declare-fun b!692157 () Bool)

(declare-fun res!456434 () Bool)

(assert (=> b!692157 (=> (not res!456434) (not e!393764))))

(declare-fun arrayNoDuplicates!0 (array!39825 (_ BitVec 32) List!13122) Bool)

(assert (=> b!692157 (= res!456434 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692158 () Bool)

(declare-fun res!456432 () Bool)

(assert (=> b!692158 (=> (not res!456432) (not e!393764))))

(assert (=> b!692158 (= res!456432 (validKeyInArray!0 k0!2843))))

(declare-fun b!692159 () Bool)

(declare-fun res!456436 () Bool)

(assert (=> b!692159 (=> (not res!456436) (not e!393764))))

(assert (=> b!692159 (= res!456436 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692160 () Bool)

(declare-fun res!456433 () Bool)

(assert (=> b!692160 (=> (not res!456433) (not e!393764))))

(assert (=> b!692160 (= res!456433 (not (contains!3699 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692161 () Bool)

(assert (=> b!692161 (= e!393767 e!393768)))

(declare-fun res!456439 () Bool)

(assert (=> b!692161 (=> (not res!456439) (not e!393768))))

(assert (=> b!692161 (= res!456439 (bvsle from!3004 i!1382))))

(declare-fun b!692162 () Bool)

(declare-fun res!456425 () Bool)

(assert (=> b!692162 (=> (not res!456425) (not e!393764))))

(assert (=> b!692162 (= res!456425 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13119))))

(assert (= (and start!61804 res!456426) b!692147))

(assert (= (and b!692147 res!456430) b!692155))

(assert (= (and b!692155 res!456431) b!692160))

(assert (= (and b!692160 res!456433) b!692152))

(assert (= (and b!692152 res!456428) b!692153))

(assert (= (and b!692152 (not res!456427)) b!692161))

(assert (= (and b!692161 res!456439) b!692156))

(assert (= (and b!692152 res!456435) b!692162))

(assert (= (and b!692162 res!456425) b!692157))

(assert (= (and b!692157 res!456434) b!692150))

(assert (= (and b!692150 res!456440) b!692158))

(assert (= (and b!692158 res!456432) b!692159))

(assert (= (and b!692159 res!456436) b!692148))

(assert (= (and b!692148 res!456429) b!692145))

(assert (= (and b!692145 res!456437) b!692146))

(assert (= (and b!692146 c!78227) b!692151))

(assert (= (and b!692146 (not c!78227)) b!692154))

(assert (= (and b!692146 res!456438) b!692149))

(declare-fun m!654827 () Bool)

(assert (=> b!692159 m!654827))

(declare-fun m!654829 () Bool)

(assert (=> b!692156 m!654829))

(declare-fun m!654831 () Bool)

(assert (=> b!692146 m!654831))

(declare-fun m!654833 () Bool)

(assert (=> b!692157 m!654833))

(assert (=> b!692145 m!654831))

(assert (=> b!692145 m!654831))

(declare-fun m!654835 () Bool)

(assert (=> b!692145 m!654835))

(assert (=> b!692153 m!654829))

(declare-fun m!654837 () Bool)

(assert (=> b!692151 m!654837))

(declare-fun m!654839 () Bool)

(assert (=> b!692151 m!654839))

(declare-fun m!654841 () Bool)

(assert (=> b!692155 m!654841))

(declare-fun m!654843 () Bool)

(assert (=> b!692162 m!654843))

(declare-fun m!654845 () Bool)

(assert (=> b!692158 m!654845))

(assert (=> b!692149 m!654831))

(assert (=> b!692149 m!654831))

(declare-fun m!654847 () Bool)

(assert (=> b!692149 m!654847))

(assert (=> b!692149 m!654847))

(declare-fun m!654849 () Bool)

(assert (=> b!692149 m!654849))

(declare-fun m!654851 () Bool)

(assert (=> start!61804 m!654851))

(declare-fun m!654853 () Bool)

(assert (=> b!692147 m!654853))

(declare-fun m!654855 () Bool)

(assert (=> b!692160 m!654855))

(check-sat (not b!692156) (not b!692157) (not b!692159) (not b!692158) (not b!692151) (not start!61804) (not b!692147) (not b!692162) (not b!692145) (not b!692153) (not b!692155) (not b!692160) (not b!692149))
(check-sat)
(get-model)

(declare-fun d!95523 () Bool)

(declare-fun res!456493 () Bool)

(declare-fun e!393794 () Bool)

(assert (=> d!95523 (=> res!456493 e!393794)))

(get-info :version)

(assert (=> d!95523 (= res!456493 ((_ is Nil!13119) ($colon$colon!411 acc!681 (select (arr!19081 a!3626) from!3004))))))

(assert (=> d!95523 (= (noDuplicate!946 ($colon$colon!411 acc!681 (select (arr!19081 a!3626) from!3004))) e!393794)))

(declare-fun b!692221 () Bool)

(declare-fun e!393795 () Bool)

(assert (=> b!692221 (= e!393794 e!393795)))

(declare-fun res!456494 () Bool)

(assert (=> b!692221 (=> (not res!456494) (not e!393795))))

(assert (=> b!692221 (= res!456494 (not (contains!3699 (t!19389 ($colon$colon!411 acc!681 (select (arr!19081 a!3626) from!3004))) (h!14163 ($colon$colon!411 acc!681 (select (arr!19081 a!3626) from!3004))))))))

(declare-fun b!692222 () Bool)

(assert (=> b!692222 (= e!393795 (noDuplicate!946 (t!19389 ($colon$colon!411 acc!681 (select (arr!19081 a!3626) from!3004)))))))

(assert (= (and d!95523 (not res!456493)) b!692221))

(assert (= (and b!692221 res!456494) b!692222))

(declare-fun m!654887 () Bool)

(assert (=> b!692221 m!654887))

(declare-fun m!654889 () Bool)

(assert (=> b!692222 m!654889))

(assert (=> b!692149 d!95523))

(declare-fun d!95525 () Bool)

(assert (=> d!95525 (= ($colon$colon!411 acc!681 (select (arr!19081 a!3626) from!3004)) (Cons!13118 (select (arr!19081 a!3626) from!3004) acc!681))))

(assert (=> b!692149 d!95525))

(declare-fun d!95527 () Bool)

(declare-fun lt!316558 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!309 (List!13122) (InoxSet (_ BitVec 64)))

(assert (=> d!95527 (= lt!316558 (select (content!309 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393800 () Bool)

(assert (=> d!95527 (= lt!316558 e!393800)))

(declare-fun res!456500 () Bool)

(assert (=> d!95527 (=> (not res!456500) (not e!393800))))

(assert (=> d!95527 (= res!456500 ((_ is Cons!13118) acc!681))))

(assert (=> d!95527 (= (contains!3699 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316558)))

(declare-fun b!692227 () Bool)

(declare-fun e!393801 () Bool)

(assert (=> b!692227 (= e!393800 e!393801)))

(declare-fun res!456499 () Bool)

(assert (=> b!692227 (=> res!456499 e!393801)))

(assert (=> b!692227 (= res!456499 (= (h!14163 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692228 () Bool)

(assert (=> b!692228 (= e!393801 (contains!3699 (t!19389 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95527 res!456500) b!692227))

(assert (= (and b!692227 (not res!456499)) b!692228))

(declare-fun m!654891 () Bool)

(assert (=> d!95527 m!654891))

(declare-fun m!654893 () Bool)

(assert (=> d!95527 m!654893))

(declare-fun m!654895 () Bool)

(assert (=> b!692228 m!654895))

(assert (=> b!692160 d!95527))

(declare-fun d!95529 () Bool)

(declare-fun res!456505 () Bool)

(declare-fun e!393806 () Bool)

(assert (=> d!95529 (=> res!456505 e!393806)))

(assert (=> d!95529 (= res!456505 (= (select (arr!19081 a!3626) from!3004) k0!2843))))

(assert (=> d!95529 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!393806)))

(declare-fun b!692233 () Bool)

(declare-fun e!393807 () Bool)

(assert (=> b!692233 (= e!393806 e!393807)))

(declare-fun res!456506 () Bool)

(assert (=> b!692233 (=> (not res!456506) (not e!393807))))

(assert (=> b!692233 (= res!456506 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19466 a!3626)))))

(declare-fun b!692234 () Bool)

(assert (=> b!692234 (= e!393807 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95529 (not res!456505)) b!692233))

(assert (= (and b!692233 res!456506) b!692234))

(assert (=> d!95529 m!654831))

(declare-fun m!654897 () Bool)

(assert (=> b!692234 m!654897))

(assert (=> b!692151 d!95529))

(declare-fun d!95531 () Bool)

(assert (=> d!95531 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316561 () Unit!24442)

(declare-fun choose!13 (array!39825 (_ BitVec 64) (_ BitVec 32)) Unit!24442)

(assert (=> d!95531 (= lt!316561 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95531 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95531 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316561)))

(declare-fun bs!20263 () Bool)

(assert (= bs!20263 d!95531))

(assert (=> bs!20263 m!654827))

(declare-fun m!654899 () Bool)

(assert (=> bs!20263 m!654899))

(assert (=> b!692151 d!95531))

(declare-fun b!692265 () Bool)

(declare-fun e!393832 () Bool)

(declare-fun call!34233 () Bool)

(assert (=> b!692265 (= e!393832 call!34233)))

(declare-fun d!95537 () Bool)

(declare-fun res!456527 () Bool)

(declare-fun e!393833 () Bool)

(assert (=> d!95537 (=> res!456527 e!393833)))

(assert (=> d!95537 (= res!456527 (bvsge #b00000000000000000000000000000000 (size!19466 a!3626)))))

(assert (=> d!95537 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13119) e!393833)))

(declare-fun b!692266 () Bool)

(declare-fun e!393835 () Bool)

(assert (=> b!692266 (= e!393833 e!393835)))

(declare-fun res!456526 () Bool)

(assert (=> b!692266 (=> (not res!456526) (not e!393835))))

(declare-fun e!393834 () Bool)

(assert (=> b!692266 (= res!456526 (not e!393834))))

(declare-fun res!456525 () Bool)

(assert (=> b!692266 (=> (not res!456525) (not e!393834))))

(assert (=> b!692266 (= res!456525 (validKeyInArray!0 (select (arr!19081 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692267 () Bool)

(assert (=> b!692267 (= e!393834 (contains!3699 Nil!13119 (select (arr!19081 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34230 () Bool)

(declare-fun c!78237 () Bool)

(assert (=> bm!34230 (= call!34233 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78237 (Cons!13118 (select (arr!19081 a!3626) #b00000000000000000000000000000000) Nil!13119) Nil!13119)))))

(declare-fun b!692268 () Bool)

(assert (=> b!692268 (= e!393835 e!393832)))

(assert (=> b!692268 (= c!78237 (validKeyInArray!0 (select (arr!19081 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692269 () Bool)

(assert (=> b!692269 (= e!393832 call!34233)))

(assert (= (and d!95537 (not res!456527)) b!692266))

(assert (= (and b!692266 res!456525) b!692267))

(assert (= (and b!692266 res!456526) b!692268))

(assert (= (and b!692268 c!78237) b!692265))

(assert (= (and b!692268 (not c!78237)) b!692269))

(assert (= (or b!692265 b!692269) bm!34230))

(declare-fun m!654901 () Bool)

(assert (=> b!692266 m!654901))

(assert (=> b!692266 m!654901))

(declare-fun m!654903 () Bool)

(assert (=> b!692266 m!654903))

(assert (=> b!692267 m!654901))

(assert (=> b!692267 m!654901))

(declare-fun m!654905 () Bool)

(assert (=> b!692267 m!654905))

(assert (=> bm!34230 m!654901))

(declare-fun m!654907 () Bool)

(assert (=> bm!34230 m!654907))

(assert (=> b!692268 m!654901))

(assert (=> b!692268 m!654901))

(assert (=> b!692268 m!654903))

(assert (=> b!692162 d!95537))

(declare-fun d!95539 () Bool)

(declare-fun lt!316562 () Bool)

(assert (=> d!95539 (= lt!316562 (select (content!309 acc!681) k0!2843))))

(declare-fun e!393844 () Bool)

(assert (=> d!95539 (= lt!316562 e!393844)))

(declare-fun res!456535 () Bool)

(assert (=> d!95539 (=> (not res!456535) (not e!393844))))

(assert (=> d!95539 (= res!456535 ((_ is Cons!13118) acc!681))))

(assert (=> d!95539 (= (contains!3699 acc!681 k0!2843) lt!316562)))

(declare-fun b!692280 () Bool)

(declare-fun e!393845 () Bool)

(assert (=> b!692280 (= e!393844 e!393845)))

(declare-fun res!456534 () Bool)

(assert (=> b!692280 (=> res!456534 e!393845)))

(assert (=> b!692280 (= res!456534 (= (h!14163 acc!681) k0!2843))))

(declare-fun b!692281 () Bool)

(assert (=> b!692281 (= e!393845 (contains!3699 (t!19389 acc!681) k0!2843))))

(assert (= (and d!95539 res!456535) b!692280))

(assert (= (and b!692280 (not res!456534)) b!692281))

(assert (=> d!95539 m!654891))

(declare-fun m!654917 () Bool)

(assert (=> d!95539 m!654917))

(declare-fun m!654919 () Bool)

(assert (=> b!692281 m!654919))

(assert (=> b!692153 d!95539))

(declare-fun d!95545 () Bool)

(declare-fun lt!316563 () Bool)

(assert (=> d!95545 (= lt!316563 (select (content!309 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393846 () Bool)

(assert (=> d!95545 (= lt!316563 e!393846)))

(declare-fun res!456537 () Bool)

(assert (=> d!95545 (=> (not res!456537) (not e!393846))))

(assert (=> d!95545 (= res!456537 ((_ is Cons!13118) acc!681))))

(assert (=> d!95545 (= (contains!3699 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316563)))

(declare-fun b!692282 () Bool)

(declare-fun e!393847 () Bool)

(assert (=> b!692282 (= e!393846 e!393847)))

(declare-fun res!456536 () Bool)

(assert (=> b!692282 (=> res!456536 e!393847)))

(assert (=> b!692282 (= res!456536 (= (h!14163 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692283 () Bool)

(assert (=> b!692283 (= e!393847 (contains!3699 (t!19389 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95545 res!456537) b!692282))

(assert (= (and b!692282 (not res!456536)) b!692283))

(assert (=> d!95545 m!654891))

(declare-fun m!654921 () Bool)

(assert (=> d!95545 m!654921))

(declare-fun m!654923 () Bool)

(assert (=> b!692283 m!654923))

(assert (=> b!692155 d!95545))

(declare-fun d!95547 () Bool)

(assert (=> d!95547 (= (validKeyInArray!0 (select (arr!19081 a!3626) from!3004)) (and (not (= (select (arr!19081 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19081 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692145 d!95547))

(assert (=> b!692156 d!95539))

(declare-fun d!95553 () Bool)

(declare-fun res!456538 () Bool)

(declare-fun e!393848 () Bool)

(assert (=> d!95553 (=> res!456538 e!393848)))

(assert (=> d!95553 (= res!456538 ((_ is Nil!13119) acc!681))))

(assert (=> d!95553 (= (noDuplicate!946 acc!681) e!393848)))

(declare-fun b!692284 () Bool)

(declare-fun e!393849 () Bool)

(assert (=> b!692284 (= e!393848 e!393849)))

(declare-fun res!456539 () Bool)

(assert (=> b!692284 (=> (not res!456539) (not e!393849))))

(assert (=> b!692284 (= res!456539 (not (contains!3699 (t!19389 acc!681) (h!14163 acc!681))))))

(declare-fun b!692285 () Bool)

(assert (=> b!692285 (= e!393849 (noDuplicate!946 (t!19389 acc!681)))))

(assert (= (and d!95553 (not res!456538)) b!692284))

(assert (= (and b!692284 res!456539) b!692285))

(declare-fun m!654925 () Bool)

(assert (=> b!692284 m!654925))

(declare-fun m!654927 () Bool)

(assert (=> b!692285 m!654927))

(assert (=> b!692147 d!95553))

(declare-fun d!95555 () Bool)

(assert (=> d!95555 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692158 d!95555))

(declare-fun d!95557 () Bool)

(assert (=> d!95557 (= (array_inv!14877 a!3626) (bvsge (size!19466 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61804 d!95557))

(declare-fun b!692290 () Bool)

(declare-fun e!393854 () Bool)

(declare-fun call!34236 () Bool)

(assert (=> b!692290 (= e!393854 call!34236)))

(declare-fun d!95559 () Bool)

(declare-fun res!456546 () Bool)

(declare-fun e!393855 () Bool)

(assert (=> d!95559 (=> res!456546 e!393855)))

(assert (=> d!95559 (= res!456546 (bvsge from!3004 (size!19466 a!3626)))))

(assert (=> d!95559 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!393855)))

(declare-fun b!692291 () Bool)

(declare-fun e!393857 () Bool)

(assert (=> b!692291 (= e!393855 e!393857)))

(declare-fun res!456545 () Bool)

(assert (=> b!692291 (=> (not res!456545) (not e!393857))))

(declare-fun e!393856 () Bool)

(assert (=> b!692291 (= res!456545 (not e!393856))))

(declare-fun res!456544 () Bool)

(assert (=> b!692291 (=> (not res!456544) (not e!393856))))

(assert (=> b!692291 (= res!456544 (validKeyInArray!0 (select (arr!19081 a!3626) from!3004)))))

(declare-fun b!692292 () Bool)

(assert (=> b!692292 (= e!393856 (contains!3699 acc!681 (select (arr!19081 a!3626) from!3004)))))

(declare-fun bm!34233 () Bool)

(declare-fun c!78240 () Bool)

(assert (=> bm!34233 (= call!34236 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78240 (Cons!13118 (select (arr!19081 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!692293 () Bool)

(assert (=> b!692293 (= e!393857 e!393854)))

(assert (=> b!692293 (= c!78240 (validKeyInArray!0 (select (arr!19081 a!3626) from!3004)))))

(declare-fun b!692294 () Bool)

(assert (=> b!692294 (= e!393854 call!34236)))

(assert (= (and d!95559 (not res!456546)) b!692291))

(assert (= (and b!692291 res!456544) b!692292))

(assert (= (and b!692291 res!456545) b!692293))

(assert (= (and b!692293 c!78240) b!692290))

(assert (= (and b!692293 (not c!78240)) b!692294))

(assert (= (or b!692290 b!692294) bm!34233))

(assert (=> b!692291 m!654831))

(assert (=> b!692291 m!654831))

(assert (=> b!692291 m!654835))

(assert (=> b!692292 m!654831))

(assert (=> b!692292 m!654831))

(declare-fun m!654929 () Bool)

(assert (=> b!692292 m!654929))

(assert (=> bm!34233 m!654831))

(declare-fun m!654931 () Bool)

(assert (=> bm!34233 m!654931))

(assert (=> b!692293 m!654831))

(assert (=> b!692293 m!654831))

(assert (=> b!692293 m!654835))

(assert (=> b!692157 d!95559))

(declare-fun d!95561 () Bool)

(declare-fun res!456553 () Bool)

(declare-fun e!393864 () Bool)

(assert (=> d!95561 (=> res!456553 e!393864)))

(assert (=> d!95561 (= res!456553 (= (select (arr!19081 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95561 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!393864)))

(declare-fun b!692301 () Bool)

(declare-fun e!393865 () Bool)

(assert (=> b!692301 (= e!393864 e!393865)))

(declare-fun res!456554 () Bool)

(assert (=> b!692301 (=> (not res!456554) (not e!393865))))

(assert (=> b!692301 (= res!456554 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19466 a!3626)))))

(declare-fun b!692302 () Bool)

(assert (=> b!692302 (= e!393865 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95561 (not res!456553)) b!692301))

(assert (= (and b!692301 res!456554) b!692302))

(assert (=> d!95561 m!654901))

(declare-fun m!654937 () Bool)

(assert (=> b!692302 m!654937))

(assert (=> b!692159 d!95561))

(check-sat (not b!692285) (not b!692266) (not b!692283) (not bm!34233) (not d!95545) (not b!692234) (not b!692267) (not bm!34230) (not d!95531) (not b!692268) (not b!692292) (not b!692302) (not b!692228) (not d!95539) (not b!692221) (not b!692222) (not b!692293) (not b!692284) (not b!692291) (not b!692281) (not d!95527))
(check-sat)
