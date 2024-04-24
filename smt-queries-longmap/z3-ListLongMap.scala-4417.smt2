; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61050 () Bool)

(assert start!61050)

(declare-fun b!684398 () Bool)

(declare-fun e!389817 () Bool)

(declare-datatypes ((List!12924 0))(
  ( (Nil!12921) (Cons!12920 (h!13968 (_ BitVec 64)) (t!19162 List!12924)) )
))
(declare-fun acc!681 () List!12924)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3576 (List!12924 (_ BitVec 64)) Bool)

(assert (=> b!684398 (= e!389817 (contains!3576 acc!681 k0!2843))))

(declare-fun b!684399 () Bool)

(declare-fun res!449901 () Bool)

(declare-fun e!389813 () Bool)

(assert (=> b!684399 (=> (not res!449901) (not e!389813))))

(declare-fun e!389816 () Bool)

(assert (=> b!684399 (= res!449901 e!389816)))

(declare-fun res!449908 () Bool)

(assert (=> b!684399 (=> res!449908 e!389816)))

(assert (=> b!684399 (= res!449908 e!389817)))

(declare-fun res!449904 () Bool)

(assert (=> b!684399 (=> (not res!449904) (not e!389817))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684399 (= res!449904 (bvsgt from!3004 i!1382))))

(declare-fun b!684400 () Bool)

(declare-fun e!389810 () Bool)

(assert (=> b!684400 (= e!389816 e!389810)))

(declare-fun res!449903 () Bool)

(assert (=> b!684400 (=> (not res!449903) (not e!389810))))

(assert (=> b!684400 (= res!449903 (bvsle from!3004 i!1382))))

(declare-fun b!684401 () Bool)

(declare-fun res!449906 () Bool)

(assert (=> b!684401 (=> (not res!449906) (not e!389813))))

(declare-datatypes ((array!39597 0))(
  ( (array!39598 (arr!18976 (Array (_ BitVec 32) (_ BitVec 64))) (size!19343 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39597)

(assert (=> b!684401 (= res!449906 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19343 a!3626))))))

(declare-fun b!684402 () Bool)

(declare-fun res!449902 () Bool)

(assert (=> b!684402 (=> (not res!449902) (not e!389813))))

(assert (=> b!684402 (= res!449902 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19343 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684403 () Bool)

(declare-fun res!449910 () Bool)

(declare-fun e!389815 () Bool)

(assert (=> b!684403 (=> res!449910 e!389815)))

(declare-fun lt!314305 () List!12924)

(declare-fun noDuplicate!850 (List!12924) Bool)

(assert (=> b!684403 (= res!449910 (not (noDuplicate!850 lt!314305)))))

(declare-fun b!684404 () Bool)

(declare-fun res!449905 () Bool)

(assert (=> b!684404 (=> (not res!449905) (not e!389813))))

(assert (=> b!684404 (= res!449905 (noDuplicate!850 acc!681))))

(declare-fun b!684405 () Bool)

(assert (=> b!684405 (= e!389810 (not (contains!3576 acc!681 k0!2843)))))

(declare-fun b!684406 () Bool)

(assert (=> b!684406 (= e!389815 true)))

(declare-fun lt!314299 () Bool)

(assert (=> b!684406 (= lt!314299 (contains!3576 acc!681 k0!2843))))

(declare-fun b!684407 () Bool)

(declare-fun res!449917 () Bool)

(assert (=> b!684407 (=> (not res!449917) (not e!389813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684407 (= res!449917 (validKeyInArray!0 k0!2843))))

(declare-fun b!684408 () Bool)

(assert (=> b!684408 (= e!389813 (not e!389815))))

(declare-fun res!449915 () Bool)

(assert (=> b!684408 (=> res!449915 e!389815)))

(assert (=> b!684408 (= res!449915 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!149 (List!12924 (_ BitVec 64)) List!12924)

(assert (=> b!684408 (= (-!149 lt!314305 k0!2843) acc!681)))

(declare-fun $colon$colon!347 (List!12924 (_ BitVec 64)) List!12924)

(assert (=> b!684408 (= lt!314305 ($colon$colon!347 acc!681 k0!2843))))

(declare-datatypes ((Unit!24051 0))(
  ( (Unit!24052) )
))
(declare-fun lt!314307 () Unit!24051)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12924) Unit!24051)

(assert (=> b!684408 (= lt!314307 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!185 (List!12924 List!12924) Bool)

(assert (=> b!684408 (subseq!185 acc!681 acc!681)))

(declare-fun lt!314301 () Unit!24051)

(declare-fun lemmaListSubSeqRefl!0 (List!12924) Unit!24051)

(assert (=> b!684408 (= lt!314301 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39597 (_ BitVec 32) List!12924) Bool)

(assert (=> b!684408 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314300 () Unit!24051)

(declare-fun e!389814 () Unit!24051)

(assert (=> b!684408 (= lt!314300 e!389814)))

(declare-fun c!77618 () Bool)

(assert (=> b!684408 (= c!77618 (validKeyInArray!0 (select (arr!18976 a!3626) from!3004)))))

(declare-fun lt!314303 () Unit!24051)

(declare-fun e!389812 () Unit!24051)

(assert (=> b!684408 (= lt!314303 e!389812)))

(declare-fun c!77617 () Bool)

(declare-fun lt!314302 () Bool)

(assert (=> b!684408 (= c!77617 lt!314302)))

(declare-fun arrayContainsKey!0 (array!39597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684408 (= lt!314302 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684408 (arrayContainsKey!0 (array!39598 (store (arr!18976 a!3626) i!1382 k0!2843) (size!19343 a!3626)) k0!2843 from!3004)))

(declare-fun b!684409 () Bool)

(declare-fun Unit!24053 () Unit!24051)

(assert (=> b!684409 (= e!389814 Unit!24053)))

(declare-fun res!449912 () Bool)

(assert (=> start!61050 (=> (not res!449912) (not e!389813))))

(assert (=> start!61050 (= res!449912 (and (bvslt (size!19343 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19343 a!3626))))))

(assert (=> start!61050 e!389813))

(assert (=> start!61050 true))

(declare-fun array_inv!14835 (array!39597) Bool)

(assert (=> start!61050 (array_inv!14835 a!3626)))

(declare-fun b!684410 () Bool)

(declare-fun lt!314306 () Unit!24051)

(assert (=> b!684410 (= e!389814 lt!314306)))

(declare-fun lt!314308 () Unit!24051)

(assert (=> b!684410 (= lt!314308 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684410 (subseq!185 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39597 List!12924 List!12924 (_ BitVec 32)) Unit!24051)

(assert (=> b!684410 (= lt!314306 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!347 acc!681 (select (arr!18976 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684410 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684411 () Bool)

(declare-fun res!449913 () Bool)

(assert (=> b!684411 (=> (not res!449913) (not e!389813))))

(assert (=> b!684411 (= res!449913 (not (contains!3576 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684412 () Bool)

(declare-fun res!449916 () Bool)

(assert (=> b!684412 (=> res!449916 e!389815)))

(assert (=> b!684412 (= res!449916 lt!314302)))

(declare-fun b!684413 () Bool)

(declare-fun Unit!24054 () Unit!24051)

(assert (=> b!684413 (= e!389812 Unit!24054)))

(declare-fun b!684414 () Bool)

(declare-fun res!449907 () Bool)

(assert (=> b!684414 (=> (not res!449907) (not e!389813))))

(assert (=> b!684414 (= res!449907 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12921))))

(declare-fun b!684415 () Bool)

(declare-fun res!449914 () Bool)

(assert (=> b!684415 (=> (not res!449914) (not e!389813))))

(assert (=> b!684415 (= res!449914 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684416 () Bool)

(declare-fun res!449909 () Bool)

(assert (=> b!684416 (=> (not res!449909) (not e!389813))))

(assert (=> b!684416 (= res!449909 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684417 () Bool)

(declare-fun Unit!24055 () Unit!24051)

(assert (=> b!684417 (= e!389812 Unit!24055)))

(declare-fun lt!314304 () Unit!24051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39597 (_ BitVec 64) (_ BitVec 32)) Unit!24051)

(assert (=> b!684417 (= lt!314304 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684417 false))

(declare-fun b!684418 () Bool)

(declare-fun res!449911 () Bool)

(assert (=> b!684418 (=> (not res!449911) (not e!389813))))

(assert (=> b!684418 (= res!449911 (not (contains!3576 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61050 res!449912) b!684404))

(assert (= (and b!684404 res!449905) b!684411))

(assert (= (and b!684411 res!449913) b!684418))

(assert (= (and b!684418 res!449911) b!684399))

(assert (= (and b!684399 res!449904) b!684398))

(assert (= (and b!684399 (not res!449908)) b!684400))

(assert (= (and b!684400 res!449903) b!684405))

(assert (= (and b!684399 res!449901) b!684414))

(assert (= (and b!684414 res!449907) b!684416))

(assert (= (and b!684416 res!449909) b!684401))

(assert (= (and b!684401 res!449906) b!684407))

(assert (= (and b!684407 res!449917) b!684415))

(assert (= (and b!684415 res!449914) b!684402))

(assert (= (and b!684402 res!449902) b!684408))

(assert (= (and b!684408 c!77617) b!684417))

(assert (= (and b!684408 (not c!77617)) b!684413))

(assert (= (and b!684408 c!77618) b!684410))

(assert (= (and b!684408 (not c!77618)) b!684409))

(assert (= (and b!684408 (not res!449915)) b!684403))

(assert (= (and b!684403 (not res!449910)) b!684412))

(assert (= (and b!684412 (not res!449916)) b!684406))

(declare-fun m!649291 () Bool)

(assert (=> b!684407 m!649291))

(declare-fun m!649293 () Bool)

(assert (=> b!684417 m!649293))

(declare-fun m!649295 () Bool)

(assert (=> b!684411 m!649295))

(declare-fun m!649297 () Bool)

(assert (=> b!684415 m!649297))

(declare-fun m!649299 () Bool)

(assert (=> b!684404 m!649299))

(declare-fun m!649301 () Bool)

(assert (=> b!684403 m!649301))

(declare-fun m!649303 () Bool)

(assert (=> b!684414 m!649303))

(declare-fun m!649305 () Bool)

(assert (=> b!684418 m!649305))

(declare-fun m!649307 () Bool)

(assert (=> b!684406 m!649307))

(declare-fun m!649309 () Bool)

(assert (=> b!684416 m!649309))

(declare-fun m!649311 () Bool)

(assert (=> b!684410 m!649311))

(declare-fun m!649313 () Bool)

(assert (=> b!684410 m!649313))

(declare-fun m!649315 () Bool)

(assert (=> b!684410 m!649315))

(declare-fun m!649317 () Bool)

(assert (=> b!684410 m!649317))

(assert (=> b!684410 m!649313))

(assert (=> b!684410 m!649315))

(declare-fun m!649319 () Bool)

(assert (=> b!684410 m!649319))

(declare-fun m!649321 () Bool)

(assert (=> b!684410 m!649321))

(assert (=> b!684408 m!649311))

(assert (=> b!684408 m!649313))

(declare-fun m!649323 () Bool)

(assert (=> b!684408 m!649323))

(declare-fun m!649325 () Bool)

(assert (=> b!684408 m!649325))

(declare-fun m!649327 () Bool)

(assert (=> b!684408 m!649327))

(assert (=> b!684408 m!649319))

(declare-fun m!649329 () Bool)

(assert (=> b!684408 m!649329))

(declare-fun m!649331 () Bool)

(assert (=> b!684408 m!649331))

(assert (=> b!684408 m!649313))

(declare-fun m!649333 () Bool)

(assert (=> b!684408 m!649333))

(declare-fun m!649335 () Bool)

(assert (=> b!684408 m!649335))

(assert (=> b!684408 m!649321))

(declare-fun m!649337 () Bool)

(assert (=> start!61050 m!649337))

(assert (=> b!684398 m!649307))

(assert (=> b!684405 m!649307))

(check-sat (not b!684404) (not b!684405) (not b!684408) (not b!684407) (not b!684416) (not b!684417) (not b!684410) (not b!684418) (not b!684398) (not b!684415) (not b!684406) (not b!684411) (not b!684403) (not b!684414) (not start!61050))
(check-sat)
