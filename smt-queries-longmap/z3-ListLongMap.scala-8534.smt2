; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104326 () Bool)

(assert start!104326)

(declare-fun b!1246236 () Bool)

(declare-fun res!830987 () Bool)

(declare-fun e!706593 () Bool)

(assert (=> b!1246236 (=> (not res!830987) (not e!706593))))

(declare-datatypes ((array!80134 0))(
  ( (array!80135 (arr!38651 (Array (_ BitVec 32) (_ BitVec 64))) (size!39188 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80134)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1246236 (= res!830987 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39188 a!3892)) (= newFrom!287 (size!39188 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1246237 () Bool)

(declare-fun e!706592 () Bool)

(assert (=> b!1246237 (= e!706593 e!706592)))

(declare-fun res!830985 () Bool)

(assert (=> b!1246237 (=> res!830985 e!706592)))

(declare-datatypes ((List!27467 0))(
  ( (Nil!27464) (Cons!27463 (h!28681 (_ BitVec 64)) (t!40928 List!27467)) )
))
(declare-fun contains!7468 (List!27467 (_ BitVec 64)) Bool)

(assert (=> b!1246237 (= res!830985 (contains!7468 Nil!27464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246238 () Bool)

(assert (=> b!1246238 (= e!706592 (contains!7468 Nil!27464 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246239 () Bool)

(declare-fun res!830988 () Bool)

(assert (=> b!1246239 (=> (not res!830988) (not e!706593))))

(declare-fun arrayNoDuplicates!0 (array!80134 (_ BitVec 32) List!27467) Bool)

(assert (=> b!1246239 (= res!830988 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27464))))

(declare-fun b!1246240 () Bool)

(declare-fun res!830984 () Bool)

(assert (=> b!1246240 (=> (not res!830984) (not e!706593))))

(declare-fun noDuplicate!2032 (List!27467) Bool)

(assert (=> b!1246240 (= res!830984 (noDuplicate!2032 Nil!27464))))

(declare-fun res!830986 () Bool)

(assert (=> start!104326 (=> (not res!830986) (not e!706593))))

(assert (=> start!104326 (= res!830986 (and (bvslt (size!39188 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39188 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39188 a!3892))))))

(assert (=> start!104326 e!706593))

(declare-fun array_inv!29589 (array!80134) Bool)

(assert (=> start!104326 (array_inv!29589 a!3892)))

(assert (=> start!104326 true))

(assert (= (and start!104326 res!830986) b!1246239))

(assert (= (and b!1246239 res!830988) b!1246236))

(assert (= (and b!1246236 res!830987) b!1246240))

(assert (= (and b!1246240 res!830984) b!1246237))

(assert (= (and b!1246237 (not res!830985)) b!1246238))

(declare-fun m!1148731 () Bool)

(assert (=> start!104326 m!1148731))

(declare-fun m!1148733 () Bool)

(assert (=> b!1246240 m!1148733))

(declare-fun m!1148735 () Bool)

(assert (=> b!1246239 m!1148735))

(declare-fun m!1148737 () Bool)

(assert (=> b!1246237 m!1148737))

(declare-fun m!1148739 () Bool)

(assert (=> b!1246238 m!1148739))

(check-sat (not start!104326) (not b!1246238) (not b!1246240) (not b!1246237) (not b!1246239))
(check-sat)
(get-model)

(declare-fun d!137715 () Bool)

(declare-fun lt!563336 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!612 (List!27467) (InoxSet (_ BitVec 64)))

(assert (=> d!137715 (= lt!563336 (select (content!612 Nil!27464) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706623 () Bool)

(assert (=> d!137715 (= lt!563336 e!706623)))

(declare-fun res!831029 () Bool)

(assert (=> d!137715 (=> (not res!831029) (not e!706623))))

(get-info :version)

(assert (=> d!137715 (= res!831029 ((_ is Cons!27463) Nil!27464))))

(assert (=> d!137715 (= (contains!7468 Nil!27464 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563336)))

(declare-fun b!1246281 () Bool)

(declare-fun e!706624 () Bool)

(assert (=> b!1246281 (= e!706623 e!706624)))

(declare-fun res!831030 () Bool)

(assert (=> b!1246281 (=> res!831030 e!706624)))

(assert (=> b!1246281 (= res!831030 (= (h!28681 Nil!27464) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246282 () Bool)

(assert (=> b!1246282 (= e!706624 (contains!7468 (t!40928 Nil!27464) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137715 res!831029) b!1246281))

(assert (= (and b!1246281 (not res!831030)) b!1246282))

(declare-fun m!1148765 () Bool)

(assert (=> d!137715 m!1148765))

(declare-fun m!1148767 () Bool)

(assert (=> d!137715 m!1148767))

(declare-fun m!1148769 () Bool)

(assert (=> b!1246282 m!1148769))

(assert (=> b!1246237 d!137715))

(declare-fun d!137719 () Bool)

(declare-fun res!831050 () Bool)

(declare-fun e!706650 () Bool)

(assert (=> d!137719 (=> res!831050 e!706650)))

(assert (=> d!137719 (= res!831050 (bvsge from!3270 (size!39188 a!3892)))))

(assert (=> d!137719 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27464) e!706650)))

(declare-fun b!1246309 () Bool)

(declare-fun e!706649 () Bool)

(declare-fun call!61519 () Bool)

(assert (=> b!1246309 (= e!706649 call!61519)))

(declare-fun bm!61516 () Bool)

(declare-fun c!122322 () Bool)

(assert (=> bm!61516 (= call!61519 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122322 (Cons!27463 (select (arr!38651 a!3892) from!3270) Nil!27464) Nil!27464)))))

(declare-fun b!1246310 () Bool)

(assert (=> b!1246310 (= e!706649 call!61519)))

(declare-fun b!1246311 () Bool)

(declare-fun e!706647 () Bool)

(assert (=> b!1246311 (= e!706650 e!706647)))

(declare-fun res!831051 () Bool)

(assert (=> b!1246311 (=> (not res!831051) (not e!706647))))

(declare-fun e!706648 () Bool)

(assert (=> b!1246311 (= res!831051 (not e!706648))))

(declare-fun res!831049 () Bool)

(assert (=> b!1246311 (=> (not res!831049) (not e!706648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246311 (= res!831049 (validKeyInArray!0 (select (arr!38651 a!3892) from!3270)))))

(declare-fun b!1246312 () Bool)

(assert (=> b!1246312 (= e!706648 (contains!7468 Nil!27464 (select (arr!38651 a!3892) from!3270)))))

(declare-fun b!1246313 () Bool)

(assert (=> b!1246313 (= e!706647 e!706649)))

(assert (=> b!1246313 (= c!122322 (validKeyInArray!0 (select (arr!38651 a!3892) from!3270)))))

(assert (= (and d!137719 (not res!831050)) b!1246311))

(assert (= (and b!1246311 res!831049) b!1246312))

(assert (= (and b!1246311 res!831051) b!1246313))

(assert (= (and b!1246313 c!122322) b!1246310))

(assert (= (and b!1246313 (not c!122322)) b!1246309))

(assert (= (or b!1246310 b!1246309) bm!61516))

(declare-fun m!1148777 () Bool)

(assert (=> bm!61516 m!1148777))

(declare-fun m!1148779 () Bool)

(assert (=> bm!61516 m!1148779))

(assert (=> b!1246311 m!1148777))

(assert (=> b!1246311 m!1148777))

(declare-fun m!1148781 () Bool)

(assert (=> b!1246311 m!1148781))

(assert (=> b!1246312 m!1148777))

(assert (=> b!1246312 m!1148777))

(declare-fun m!1148783 () Bool)

(assert (=> b!1246312 m!1148783))

(assert (=> b!1246313 m!1148777))

(assert (=> b!1246313 m!1148777))

(assert (=> b!1246313 m!1148781))

(assert (=> b!1246239 d!137719))

(declare-fun d!137723 () Bool)

(assert (=> d!137723 (= (array_inv!29589 a!3892) (bvsge (size!39188 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104326 d!137723))

(declare-fun d!137725 () Bool)

(declare-fun lt!563340 () Bool)

(assert (=> d!137725 (= lt!563340 (select (content!612 Nil!27464) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706651 () Bool)

(assert (=> d!137725 (= lt!563340 e!706651)))

(declare-fun res!831052 () Bool)

(assert (=> d!137725 (=> (not res!831052) (not e!706651))))

(assert (=> d!137725 (= res!831052 ((_ is Cons!27463) Nil!27464))))

(assert (=> d!137725 (= (contains!7468 Nil!27464 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563340)))

(declare-fun b!1246314 () Bool)

(declare-fun e!706652 () Bool)

(assert (=> b!1246314 (= e!706651 e!706652)))

(declare-fun res!831053 () Bool)

(assert (=> b!1246314 (=> res!831053 e!706652)))

(assert (=> b!1246314 (= res!831053 (= (h!28681 Nil!27464) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246315 () Bool)

(assert (=> b!1246315 (= e!706652 (contains!7468 (t!40928 Nil!27464) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137725 res!831052) b!1246314))

(assert (= (and b!1246314 (not res!831053)) b!1246315))

(assert (=> d!137725 m!1148765))

(declare-fun m!1148785 () Bool)

(assert (=> d!137725 m!1148785))

(declare-fun m!1148787 () Bool)

(assert (=> b!1246315 m!1148787))

(assert (=> b!1246238 d!137725))

(declare-fun d!137727 () Bool)

(declare-fun res!831063 () Bool)

(declare-fun e!706663 () Bool)

(assert (=> d!137727 (=> res!831063 e!706663)))

(assert (=> d!137727 (= res!831063 ((_ is Nil!27464) Nil!27464))))

(assert (=> d!137727 (= (noDuplicate!2032 Nil!27464) e!706663)))

(declare-fun b!1246327 () Bool)

(declare-fun e!706664 () Bool)

(assert (=> b!1246327 (= e!706663 e!706664)))

(declare-fun res!831064 () Bool)

(assert (=> b!1246327 (=> (not res!831064) (not e!706664))))

(assert (=> b!1246327 (= res!831064 (not (contains!7468 (t!40928 Nil!27464) (h!28681 Nil!27464))))))

(declare-fun b!1246328 () Bool)

(assert (=> b!1246328 (= e!706664 (noDuplicate!2032 (t!40928 Nil!27464)))))

(assert (= (and d!137727 (not res!831063)) b!1246327))

(assert (= (and b!1246327 res!831064) b!1246328))

(declare-fun m!1148801 () Bool)

(assert (=> b!1246327 m!1148801))

(declare-fun m!1148803 () Bool)

(assert (=> b!1246328 m!1148803))

(assert (=> b!1246240 d!137727))

(check-sat (not b!1246311) (not b!1246282) (not b!1246328) (not b!1246312) (not bm!61516) (not b!1246313) (not b!1246327) (not d!137725) (not b!1246315) (not d!137715))
(check-sat)
