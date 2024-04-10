; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104386 () Bool)

(assert start!104386)

(declare-datatypes ((array!80217 0))(
  ( (array!80218 (arr!38687 (Array (_ BitVec 32) (_ BitVec 64))) (size!39223 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80217)

(declare-fun b!1246163 () Bool)

(declare-datatypes ((List!27490 0))(
  ( (Nil!27487) (Cons!27486 (h!28695 (_ BitVec 64)) (t!40959 List!27490)) )
))
(declare-fun lt!563024 () List!27490)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun e!706722 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80217 (_ BitVec 32) List!27490) Bool)

(assert (=> b!1246163 (= e!706722 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563024)))))

(declare-datatypes ((Unit!41396 0))(
  ( (Unit!41397) )
))
(declare-fun lt!563025 () Unit!41396)

(declare-fun noDuplicateSubseq!107 (List!27490 List!27490) Unit!41396)

(assert (=> b!1246163 (= lt!563025 (noDuplicateSubseq!107 Nil!27487 lt!563024))))

(declare-fun b!1246164 () Bool)

(declare-fun res!831557 () Bool)

(declare-fun e!706724 () Bool)

(assert (=> b!1246164 (=> (not res!831557) (not e!706724))))

(assert (=> b!1246164 (= res!831557 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27487))))

(declare-fun b!1246165 () Bool)

(declare-fun res!831554 () Bool)

(assert (=> b!1246165 (=> (not res!831554) (not e!706722))))

(declare-fun subseq!656 (List!27490 List!27490) Bool)

(assert (=> b!1246165 (= res!831554 (subseq!656 Nil!27487 lt!563024))))

(declare-fun b!1246166 () Bool)

(assert (=> b!1246166 (= e!706724 e!706722)))

(declare-fun res!831558 () Bool)

(assert (=> b!1246166 (=> (not res!831558) (not e!706722))))

(assert (=> b!1246166 (= res!831558 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1246166 (= lt!563024 (Cons!27486 (select (arr!38687 a!3892) from!3270) Nil!27487))))

(declare-fun b!1246167 () Bool)

(declare-fun res!831553 () Bool)

(assert (=> b!1246167 (=> (not res!831553) (not e!706724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246167 (= res!831553 (validKeyInArray!0 (select (arr!38687 a!3892) from!3270)))))

(declare-fun res!831556 () Bool)

(assert (=> start!104386 (=> (not res!831556) (not e!706724))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104386 (= res!831556 (and (bvslt (size!39223 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39223 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39223 a!3892))))))

(assert (=> start!104386 e!706724))

(declare-fun array_inv!29535 (array!80217) Bool)

(assert (=> start!104386 (array_inv!29535 a!3892)))

(assert (=> start!104386 true))

(declare-fun b!1246168 () Bool)

(declare-fun res!831555 () Bool)

(assert (=> b!1246168 (=> (not res!831555) (not e!706722))))

(declare-fun contains!7456 (List!27490 (_ BitVec 64)) Bool)

(assert (=> b!1246168 (= res!831555 (not (contains!7456 lt!563024 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246169 () Bool)

(declare-fun res!831562 () Bool)

(assert (=> b!1246169 (=> (not res!831562) (not e!706722))))

(declare-fun noDuplicate!2035 (List!27490) Bool)

(assert (=> b!1246169 (= res!831562 (noDuplicate!2035 lt!563024))))

(declare-fun b!1246170 () Bool)

(declare-fun res!831552 () Bool)

(assert (=> b!1246170 (=> (not res!831552) (not e!706724))))

(assert (=> b!1246170 (= res!831552 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39223 a!3892)) (not (= newFrom!287 (size!39223 a!3892)))))))

(declare-fun b!1246171 () Bool)

(declare-fun res!831560 () Bool)

(assert (=> b!1246171 (=> (not res!831560) (not e!706722))))

(assert (=> b!1246171 (= res!831560 (not (contains!7456 Nil!27487 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246172 () Bool)

(declare-fun res!831559 () Bool)

(assert (=> b!1246172 (=> (not res!831559) (not e!706722))))

(assert (=> b!1246172 (= res!831559 (not (contains!7456 Nil!27487 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246173 () Bool)

(declare-fun res!831561 () Bool)

(assert (=> b!1246173 (=> (not res!831561) (not e!706722))))

(assert (=> b!1246173 (= res!831561 (not (contains!7456 lt!563024 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!104386 res!831556) b!1246164))

(assert (= (and b!1246164 res!831557) b!1246170))

(assert (= (and b!1246170 res!831552) b!1246167))

(assert (= (and b!1246167 res!831553) b!1246166))

(assert (= (and b!1246166 res!831558) b!1246169))

(assert (= (and b!1246169 res!831562) b!1246168))

(assert (= (and b!1246168 res!831555) b!1246173))

(assert (= (and b!1246173 res!831561) b!1246172))

(assert (= (and b!1246172 res!831559) b!1246171))

(assert (= (and b!1246171 res!831560) b!1246165))

(assert (= (and b!1246165 res!831554) b!1246163))

(declare-fun m!1148045 () Bool)

(assert (=> b!1246168 m!1148045))

(declare-fun m!1148047 () Bool)

(assert (=> b!1246167 m!1148047))

(assert (=> b!1246167 m!1148047))

(declare-fun m!1148049 () Bool)

(assert (=> b!1246167 m!1148049))

(declare-fun m!1148051 () Bool)

(assert (=> b!1246169 m!1148051))

(declare-fun m!1148053 () Bool)

(assert (=> b!1246165 m!1148053))

(declare-fun m!1148055 () Bool)

(assert (=> b!1246171 m!1148055))

(assert (=> b!1246166 m!1148047))

(declare-fun m!1148057 () Bool)

(assert (=> b!1246164 m!1148057))

(declare-fun m!1148059 () Bool)

(assert (=> b!1246172 m!1148059))

(declare-fun m!1148061 () Bool)

(assert (=> start!104386 m!1148061))

(declare-fun m!1148063 () Bool)

(assert (=> b!1246173 m!1148063))

(declare-fun m!1148065 () Bool)

(assert (=> b!1246163 m!1148065))

(declare-fun m!1148067 () Bool)

(assert (=> b!1246163 m!1148067))

(push 1)

(assert (not b!1246165))

(assert (not b!1246173))

(assert (not b!1246169))

(assert (not b!1246171))

(assert (not b!1246172))

(assert (not b!1246168))

(assert (not b!1246164))

(assert (not b!1246167))

(assert (not start!104386))

(assert (not b!1246163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137583 () Bool)

(declare-fun lt!563047 () Bool)

(declare-fun content!632 (List!27490) (Set (_ BitVec 64)))

(assert (=> d!137583 (= lt!563047 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!632 Nil!27487)))))

(declare-fun e!706769 () Bool)

(assert (=> d!137583 (= lt!563047 e!706769)))

(declare-fun res!831653 () Bool)

(assert (=> d!137583 (=> (not res!831653) (not e!706769))))

(assert (=> d!137583 (= res!831653 (is-Cons!27486 Nil!27487))))

(assert (=> d!137583 (= (contains!7456 Nil!27487 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563047)))

(declare-fun b!1246268 () Bool)

(declare-fun e!706770 () Bool)

(assert (=> b!1246268 (= e!706769 e!706770)))

(declare-fun res!831654 () Bool)

(assert (=> b!1246268 (=> res!831654 e!706770)))

(assert (=> b!1246268 (= res!831654 (= (h!28695 Nil!27487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246269 () Bool)

(assert (=> b!1246269 (= e!706770 (contains!7456 (t!40959 Nil!27487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137583 res!831653) b!1246268))

(assert (= (and b!1246268 (not res!831654)) b!1246269))

(declare-fun m!1148135 () Bool)

(assert (=> d!137583 m!1148135))

(declare-fun m!1148137 () Bool)

(assert (=> d!137583 m!1148137))

(declare-fun m!1148139 () Bool)

(assert (=> b!1246269 m!1148139))

(assert (=> b!1246171 d!137583))

(declare-fun b!1246292 () Bool)

(declare-fun e!706791 () Bool)

(declare-fun e!706792 () Bool)

(assert (=> b!1246292 (= e!706791 e!706792)))

(declare-fun res!831674 () Bool)

(assert (=> b!1246292 (=> res!831674 e!706792)))

(declare-fun e!706790 () Bool)

(assert (=> b!1246292 (= res!831674 e!706790)))

(declare-fun res!831672 () Bool)

(assert (=> b!1246292 (=> (not res!831672) (not e!706790))))

(assert (=> b!1246292 (= res!831672 (= (h!28695 Nil!27487) (h!28695 lt!563024)))))

(declare-fun b!1246294 () Bool)

(assert (=> b!1246294 (= e!706792 (subseq!656 Nil!27487 (t!40959 lt!563024)))))

(declare-fun b!1246291 () Bool)

(declare-fun e!706789 () Bool)

(assert (=> b!1246291 (= e!706789 e!706791)))

(declare-fun res!831673 () Bool)

(assert (=> b!1246291 (=> (not res!831673) (not e!706791))))

(assert (=> b!1246291 (= res!831673 (is-Cons!27486 lt!563024))))

(declare-fun d!137591 () Bool)

(declare-fun res!831675 () Bool)

(assert (=> d!137591 (=> res!831675 e!706789)))

(assert (=> d!137591 (= res!831675 (is-Nil!27487 Nil!27487))))

(assert (=> d!137591 (= (subseq!656 Nil!27487 lt!563024) e!706789)))

(declare-fun b!1246293 () Bool)

(assert (=> b!1246293 (= e!706790 (subseq!656 (t!40959 Nil!27487) (t!40959 lt!563024)))))

(assert (= (and d!137591 (not res!831675)) b!1246291))

(assert (= (and b!1246291 res!831673) b!1246292))

(assert (= (and b!1246292 res!831672) b!1246293))

(assert (= (and b!1246292 (not res!831674)) b!1246294))

(declare-fun m!1148145 () Bool)

(assert (=> b!1246294 m!1148145))

(declare-fun m!1148147 () Bool)

(assert (=> b!1246293 m!1148147))

(assert (=> b!1246165 d!137591))

(declare-fun d!137599 () Bool)

(assert (=> d!137599 (= (validKeyInArray!0 (select (arr!38687 a!3892) from!3270)) (and (not (= (select (arr!38687 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38687 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246167 d!137599))

(declare-fun d!137601 () Bool)

(assert (=> d!137601 (= (array_inv!29535 a!3892) (bvsge (size!39223 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104386 d!137601))

(declare-fun d!137605 () Bool)

(declare-fun lt!563048 () Bool)

(assert (=> d!137605 (= lt!563048 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!632 Nil!27487)))))

(declare-fun e!706801 () Bool)

(assert (=> d!137605 (= lt!563048 e!706801)))

(declare-fun res!831682 () Bool)

(assert (=> d!137605 (=> (not res!831682) (not e!706801))))

(assert (=> d!137605 (= res!831682 (is-Cons!27486 Nil!27487))))

(assert (=> d!137605 (= (contains!7456 Nil!27487 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563048)))

(declare-fun b!1246303 () Bool)

(declare-fun e!706802 () Bool)

(assert (=> b!1246303 (= e!706801 e!706802)))

(declare-fun res!831683 () Bool)

(assert (=> b!1246303 (=> res!831683 e!706802)))

(assert (=> b!1246303 (= res!831683 (= (h!28695 Nil!27487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246304 () Bool)

(assert (=> b!1246304 (= e!706802 (contains!7456 (t!40959 Nil!27487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137605 res!831682) b!1246303))

(assert (= (and b!1246303 (not res!831683)) b!1246304))

(assert (=> d!137605 m!1148135))

(declare-fun m!1148153 () Bool)

(assert (=> d!137605 m!1148153))

(declare-fun m!1148155 () Bool)

(assert (=> b!1246304 m!1148155))

(assert (=> b!1246172 d!137605))

(declare-fun b!1246346 () Bool)

(declare-fun e!706840 () Bool)

(declare-fun e!706841 () Bool)

(assert (=> b!1246346 (= e!706840 e!706841)))

(declare-fun res!831718 () Bool)

(assert (=> b!1246346 (=> (not res!831718) (not e!706841))))

(declare-fun e!706842 () Bool)

(assert (=> b!1246346 (= res!831718 (not e!706842))))

(declare-fun res!831717 () Bool)

(assert (=> b!1246346 (=> (not res!831717) (not e!706842))))

(assert (=> b!1246346 (= res!831717 (validKeyInArray!0 (select (arr!38687 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun d!137607 () Bool)

(declare-fun res!831719 () Bool)

(assert (=> d!137607 (=> res!831719 e!706840)))

(assert (=> d!137607 (= res!831719 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39223 a!3892)))))

(assert (=> d!137607 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563024) e!706840)))

(declare-fun b!1246347 () Bool)

(declare-fun e!706844 () Bool)

(declare-fun call!61525 () Bool)

(assert (=> b!1246347 (= e!706844 call!61525)))

(declare-fun b!1246348 () Bool)

(assert (=> b!1246348 (= e!706844 call!61525)))

(declare-fun b!1246349 () Bool)

(assert (=> b!1246349 (= e!706842 (contains!7456 lt!563024 (select (arr!38687 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246350 () Bool)

(assert (=> b!1246350 (= e!706841 e!706844)))

(declare-fun c!121999 () Bool)

(assert (=> b!1246350 (= c!121999 (validKeyInArray!0 (select (arr!38687 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun bm!61522 () Bool)

(assert (=> bm!61522 (= call!61525 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121999 (Cons!27486 (select (arr!38687 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) lt!563024) lt!563024)))))

(assert (= (and d!137607 (not res!831719)) b!1246346))

(assert (= (and b!1246346 res!831717) b!1246349))

(assert (= (and b!1246346 res!831718) b!1246350))

(assert (= (and b!1246350 c!121999) b!1246348))

(assert (= (and b!1246350 (not c!121999)) b!1246347))

(assert (= (or b!1246348 b!1246347) bm!61522))

(declare-fun m!1148195 () Bool)

(assert (=> b!1246346 m!1148195))

(assert (=> b!1246346 m!1148195))

(declare-fun m!1148197 () Bool)

(assert (=> b!1246346 m!1148197))

(assert (=> b!1246349 m!1148195))

(assert (=> b!1246349 m!1148195))

(declare-fun m!1148199 () Bool)

(assert (=> b!1246349 m!1148199))

(assert (=> b!1246350 m!1148195))

(assert (=> b!1246350 m!1148195))

(assert (=> b!1246350 m!1148197))

(assert (=> bm!61522 m!1148195))

(declare-fun m!1148201 () Bool)

(assert (=> bm!61522 m!1148201))

(assert (=> b!1246163 d!137607))

(declare-fun d!137623 () Bool)

(assert (=> d!137623 (noDuplicate!2035 Nil!27487)))

(declare-fun lt!563062 () Unit!41396)

(declare-fun choose!1844 (List!27490 List!27490) Unit!41396)

(assert (=> d!137623 (= lt!563062 (choose!1844 Nil!27487 lt!563024))))

(declare-fun e!706863 () Bool)

(assert (=> d!137623 e!706863))

(declare-fun res!831738 () Bool)

(assert (=> d!137623 (=> (not res!831738) (not e!706863))))

(assert (=> d!137623 (= res!831738 (subseq!656 Nil!27487 lt!563024))))

(assert (=> d!137623 (= (noDuplicateSubseq!107 Nil!27487 lt!563024) lt!563062)))

(declare-fun b!1246371 () Bool)

(assert (=> b!1246371 (= e!706863 (noDuplicate!2035 lt!563024))))

(assert (= (and d!137623 res!831738) b!1246371))

(declare-fun m!1148219 () Bool)

(assert (=> d!137623 m!1148219))

(declare-fun m!1148223 () Bool)

(assert (=> d!137623 m!1148223))

(assert (=> d!137623 m!1148053))

(assert (=> b!1246371 m!1148051))

(assert (=> b!1246163 d!137623))

(declare-fun d!137633 () Bool)

(declare-fun lt!563063 () Bool)

(assert (=> d!137633 (= lt!563063 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!632 lt!563024)))))

(declare-fun e!706864 () Bool)

(assert (=> d!137633 (= lt!563063 e!706864)))

(declare-fun res!831739 () Bool)

(assert (=> d!137633 (=> (not res!831739) (not e!706864))))

(assert (=> d!137633 (= res!831739 (is-Cons!27486 lt!563024))))

(assert (=> d!137633 (= (contains!7456 lt!563024 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563063)))

(declare-fun b!1246372 () Bool)

(declare-fun e!706865 () Bool)

(assert (=> b!1246372 (= e!706864 e!706865)))

(declare-fun res!831740 () Bool)

(assert (=> b!1246372 (=> res!831740 e!706865)))

(assert (=> b!1246372 (= res!831740 (= (h!28695 lt!563024) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246373 () Bool)

(assert (=> b!1246373 (= e!706865 (contains!7456 (t!40959 lt!563024) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137633 res!831739) b!1246372))

(assert (= (and b!1246372 (not res!831740)) b!1246373))

(declare-fun m!1148227 () Bool)

(assert (=> d!137633 m!1148227))

(declare-fun m!1148229 () Bool)

(assert (=> d!137633 m!1148229))

(declare-fun m!1148231 () Bool)

(assert (=> b!1246373 m!1148231))

(assert (=> b!1246173 d!137633))

(declare-fun d!137637 () Bool)

(declare-fun lt!563064 () Bool)

(assert (=> d!137637 (= lt!563064 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!632 lt!563024)))))

(declare-fun e!706866 () Bool)

(assert (=> d!137637 (= lt!563064 e!706866)))

(declare-fun res!831741 () Bool)

(assert (=> d!137637 (=> (not res!831741) (not e!706866))))

(assert (=> d!137637 (= res!831741 (is-Cons!27486 lt!563024))))

(assert (=> d!137637 (= (contains!7456 lt!563024 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563064)))

(declare-fun b!1246374 () Bool)

(declare-fun e!706867 () Bool)

(assert (=> b!1246374 (= e!706866 e!706867)))

(declare-fun res!831742 () Bool)

(assert (=> b!1246374 (=> res!831742 e!706867)))

(assert (=> b!1246374 (= res!831742 (= (h!28695 lt!563024) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246375 () Bool)

(assert (=> b!1246375 (= e!706867 (contains!7456 (t!40959 lt!563024) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137637 res!831741) b!1246374))

(assert (= (and b!1246374 (not res!831742)) b!1246375))

(assert (=> d!137637 m!1148227))

(declare-fun m!1148233 () Bool)

(assert (=> d!137637 m!1148233))

(declare-fun m!1148235 () Bool)

(assert (=> b!1246375 m!1148235))

(assert (=> b!1246168 d!137637))

(declare-fun d!137639 () Bool)

(declare-fun res!831755 () Bool)

(declare-fun e!706880 () Bool)

(assert (=> d!137639 (=> res!831755 e!706880)))

(assert (=> d!137639 (= res!831755 (is-Nil!27487 lt!563024))))

(assert (=> d!137639 (= (noDuplicate!2035 lt!563024) e!706880)))

(declare-fun b!1246388 () Bool)

(declare-fun e!706881 () Bool)

(assert (=> b!1246388 (= e!706880 e!706881)))

(declare-fun res!831756 () Bool)

(assert (=> b!1246388 (=> (not res!831756) (not e!706881))))

(assert (=> b!1246388 (= res!831756 (not (contains!7456 (t!40959 lt!563024) (h!28695 lt!563024))))))

(declare-fun b!1246389 () Bool)

(assert (=> b!1246389 (= e!706881 (noDuplicate!2035 (t!40959 lt!563024)))))

(assert (= (and d!137639 (not res!831755)) b!1246388))

(assert (= (and b!1246388 res!831756) b!1246389))

(declare-fun m!1148237 () Bool)

(assert (=> b!1246388 m!1148237))

(declare-fun m!1148239 () Bool)

(assert (=> b!1246389 m!1148239))

(assert (=> b!1246169 d!137639))

(declare-fun b!1246390 () Bool)

(declare-fun e!706883 () Bool)

(declare-fun e!706885 () Bool)

(assert (=> b!1246390 (= e!706883 e!706885)))

(declare-fun res!831758 () Bool)

(assert (=> b!1246390 (=> (not res!831758) (not e!706885))))

(declare-fun e!706887 () Bool)

(assert (=> b!1246390 (= res!831758 (not e!706887))))

(declare-fun res!831757 () Bool)

(assert (=> b!1246390 (=> (not res!831757) (not e!706887))))

(assert (=> b!1246390 (= res!831757 (validKeyInArray!0 (select (arr!38687 a!3892) from!3270)))))

(declare-fun d!137641 () Bool)

(declare-fun res!831761 () Bool)

(assert (=> d!137641 (=> res!831761 e!706883)))

(assert (=> d!137641 (= res!831761 (bvsge from!3270 (size!39223 a!3892)))))

(assert (=> d!137641 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27487) e!706883)))

(declare-fun b!1246391 () Bool)

(declare-fun e!706889 () Bool)

(declare-fun call!61527 () Bool)

(assert (=> b!1246391 (= e!706889 call!61527)))

(declare-fun b!1246392 () Bool)

(assert (=> b!1246392 (= e!706889 call!61527)))

(declare-fun b!1246393 () Bool)

(assert (=> b!1246393 (= e!706887 (contains!7456 Nil!27487 (select (arr!38687 a!3892) from!3270)))))

(declare-fun b!1246395 () Bool)

(assert (=> b!1246395 (= e!706885 e!706889)))

(declare-fun c!122001 () Bool)

(assert (=> b!1246395 (= c!122001 (validKeyInArray!0 (select (arr!38687 a!3892) from!3270)))))

(declare-fun bm!61524 () Bool)

(assert (=> bm!61524 (= call!61527 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122001 (Cons!27486 (select (arr!38687 a!3892) from!3270) Nil!27487) Nil!27487)))))

(assert (= (and d!137641 (not res!831761)) b!1246390))

(assert (= (and b!1246390 res!831757) b!1246393))

(assert (= (and b!1246390 res!831758) b!1246395))

(assert (= (and b!1246395 c!122001) b!1246392))

(assert (= (and b!1246395 (not c!122001)) b!1246391))

