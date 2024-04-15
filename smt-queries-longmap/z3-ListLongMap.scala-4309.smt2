; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59870 () Bool)

(assert start!59870)

(declare-fun b!662274 () Bool)

(declare-datatypes ((Unit!23000 0))(
  ( (Unit!23001) )
))
(declare-fun e!380162 () Unit!23000)

(declare-fun Unit!23002 () Unit!23000)

(assert (=> b!662274 (= e!380162 Unit!23002)))

(declare-fun b!662275 () Bool)

(declare-fun res!430432 () Bool)

(declare-fun e!380164 () Bool)

(assert (=> b!662275 (=> (not res!430432) (not e!380164))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38928 0))(
  ( (array!38929 (arr!18656 (Array (_ BitVec 32) (_ BitVec 64))) (size!19021 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38928)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662275 (= res!430432 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19021 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662276 () Bool)

(declare-fun res!430424 () Bool)

(assert (=> b!662276 (=> (not res!430424) (not e!380164))))

(declare-datatypes ((List!12736 0))(
  ( (Nil!12733) (Cons!12732 (h!13777 (_ BitVec 64)) (t!18955 List!12736)) )
))
(declare-fun acc!681 () List!12736)

(declare-fun contains!3258 (List!12736 (_ BitVec 64)) Bool)

(assert (=> b!662276 (= res!430424 (not (contains!3258 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662277 () Bool)

(declare-fun res!430438 () Bool)

(declare-fun e!380168 () Bool)

(assert (=> b!662277 (=> res!430438 e!380168)))

(declare-fun lt!308793 () List!12736)

(declare-fun subseq!14 (List!12736 List!12736) Bool)

(assert (=> b!662277 (= res!430438 (not (subseq!14 acc!681 lt!308793)))))

(declare-fun b!662278 () Bool)

(assert (=> b!662278 (= e!380168 true)))

(declare-fun lt!308795 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38928 (_ BitVec 32) List!12736) Bool)

(assert (=> b!662278 (= lt!308795 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308793))))

(declare-fun lt!308796 () Unit!23000)

(declare-fun noDuplicateSubseq!14 (List!12736 List!12736) Unit!23000)

(assert (=> b!662278 (= lt!308796 (noDuplicateSubseq!14 acc!681 lt!308793))))

(declare-fun res!430441 () Bool)

(assert (=> start!59870 (=> (not res!430441) (not e!380164))))

(assert (=> start!59870 (= res!430441 (and (bvslt (size!19021 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19021 a!3626))))))

(assert (=> start!59870 e!380164))

(assert (=> start!59870 true))

(declare-fun array_inv!14539 (array!38928) Bool)

(assert (=> start!59870 (array_inv!14539 a!3626)))

(declare-fun b!662279 () Bool)

(declare-fun res!430425 () Bool)

(assert (=> b!662279 (=> (not res!430425) (not e!380164))))

(assert (=> b!662279 (= res!430425 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12733))))

(declare-fun b!662280 () Bool)

(declare-fun res!430428 () Bool)

(assert (=> b!662280 (=> res!430428 e!380168)))

(assert (=> b!662280 (= res!430428 (contains!3258 lt!308793 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662281 () Bool)

(declare-fun res!430430 () Bool)

(assert (=> b!662281 (=> (not res!430430) (not e!380164))))

(declare-fun e!380167 () Bool)

(assert (=> b!662281 (= res!430430 e!380167)))

(declare-fun res!430437 () Bool)

(assert (=> b!662281 (=> res!430437 e!380167)))

(declare-fun e!380166 () Bool)

(assert (=> b!662281 (= res!430437 e!380166)))

(declare-fun res!430433 () Bool)

(assert (=> b!662281 (=> (not res!430433) (not e!380166))))

(assert (=> b!662281 (= res!430433 (bvsgt from!3004 i!1382))))

(declare-fun b!662282 () Bool)

(declare-fun e!380165 () Bool)

(assert (=> b!662282 (= e!380164 (not e!380165))))

(declare-fun res!430422 () Bool)

(assert (=> b!662282 (=> res!430422 e!380165)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662282 (= res!430422 (not (validKeyInArray!0 (select (arr!18656 a!3626) from!3004))))))

(declare-fun lt!308791 () Unit!23000)

(assert (=> b!662282 (= lt!308791 e!380162)))

(declare-fun c!76293 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662282 (= c!76293 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662282 (arrayContainsKey!0 (array!38929 (store (arr!18656 a!3626) i!1382 k0!2843) (size!19021 a!3626)) k0!2843 from!3004)))

(declare-fun b!662283 () Bool)

(declare-fun res!430439 () Bool)

(assert (=> b!662283 (=> (not res!430439) (not e!380164))))

(assert (=> b!662283 (= res!430439 (not (contains!3258 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662284 () Bool)

(declare-fun e!380163 () Bool)

(assert (=> b!662284 (= e!380167 e!380163)))

(declare-fun res!430431 () Bool)

(assert (=> b!662284 (=> (not res!430431) (not e!380163))))

(assert (=> b!662284 (= res!430431 (bvsle from!3004 i!1382))))

(declare-fun b!662285 () Bool)

(declare-fun Unit!23003 () Unit!23000)

(assert (=> b!662285 (= e!380162 Unit!23003)))

(declare-fun lt!308792 () Unit!23000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38928 (_ BitVec 64) (_ BitVec 32)) Unit!23000)

(assert (=> b!662285 (= lt!308792 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662285 false))

(declare-fun b!662286 () Bool)

(assert (=> b!662286 (= e!380163 (not (contains!3258 acc!681 k0!2843)))))

(declare-fun b!662287 () Bool)

(assert (=> b!662287 (= e!380165 e!380168)))

(declare-fun res!430427 () Bool)

(assert (=> b!662287 (=> res!430427 e!380168)))

(assert (=> b!662287 (= res!430427 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!145 (List!12736 (_ BitVec 64)) List!12736)

(assert (=> b!662287 (= lt!308793 ($colon$colon!145 acc!681 (select (arr!18656 a!3626) from!3004)))))

(assert (=> b!662287 (subseq!14 acc!681 acc!681)))

(declare-fun lt!308794 () Unit!23000)

(declare-fun lemmaListSubSeqRefl!0 (List!12736) Unit!23000)

(assert (=> b!662287 (= lt!308794 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662288 () Bool)

(declare-fun res!430440 () Bool)

(assert (=> b!662288 (=> res!430440 e!380168)))

(declare-fun noDuplicate!527 (List!12736) Bool)

(assert (=> b!662288 (= res!430440 (not (noDuplicate!527 lt!308793)))))

(declare-fun b!662289 () Bool)

(declare-fun res!430423 () Bool)

(assert (=> b!662289 (=> (not res!430423) (not e!380164))))

(assert (=> b!662289 (= res!430423 (noDuplicate!527 acc!681))))

(declare-fun b!662290 () Bool)

(declare-fun res!430436 () Bool)

(assert (=> b!662290 (=> (not res!430436) (not e!380164))))

(assert (=> b!662290 (= res!430436 (validKeyInArray!0 k0!2843))))

(declare-fun b!662291 () Bool)

(assert (=> b!662291 (= e!380166 (contains!3258 acc!681 k0!2843))))

(declare-fun b!662292 () Bool)

(declare-fun res!430435 () Bool)

(assert (=> b!662292 (=> (not res!430435) (not e!380164))))

(assert (=> b!662292 (= res!430435 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662293 () Bool)

(declare-fun res!430434 () Bool)

(assert (=> b!662293 (=> (not res!430434) (not e!380164))))

(assert (=> b!662293 (= res!430434 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662294 () Bool)

(declare-fun res!430426 () Bool)

(assert (=> b!662294 (=> (not res!430426) (not e!380164))))

(assert (=> b!662294 (= res!430426 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19021 a!3626))))))

(declare-fun b!662295 () Bool)

(declare-fun res!430429 () Bool)

(assert (=> b!662295 (=> res!430429 e!380168)))

(assert (=> b!662295 (= res!430429 (contains!3258 lt!308793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!59870 res!430441) b!662289))

(assert (= (and b!662289 res!430423) b!662283))

(assert (= (and b!662283 res!430439) b!662276))

(assert (= (and b!662276 res!430424) b!662281))

(assert (= (and b!662281 res!430433) b!662291))

(assert (= (and b!662281 (not res!430437)) b!662284))

(assert (= (and b!662284 res!430431) b!662286))

(assert (= (and b!662281 res!430430) b!662279))

(assert (= (and b!662279 res!430425) b!662292))

(assert (= (and b!662292 res!430435) b!662294))

(assert (= (and b!662294 res!430426) b!662290))

(assert (= (and b!662290 res!430436) b!662293))

(assert (= (and b!662293 res!430434) b!662275))

(assert (= (and b!662275 res!430432) b!662282))

(assert (= (and b!662282 c!76293) b!662285))

(assert (= (and b!662282 (not c!76293)) b!662274))

(assert (= (and b!662282 (not res!430422)) b!662287))

(assert (= (and b!662287 (not res!430427)) b!662288))

(assert (= (and b!662288 (not res!430440)) b!662295))

(assert (= (and b!662295 (not res!430429)) b!662280))

(assert (= (and b!662280 (not res!430428)) b!662277))

(assert (= (and b!662277 (not res!430438)) b!662278))

(declare-fun m!633591 () Bool)

(assert (=> b!662291 m!633591))

(declare-fun m!633593 () Bool)

(assert (=> b!662287 m!633593))

(assert (=> b!662287 m!633593))

(declare-fun m!633595 () Bool)

(assert (=> b!662287 m!633595))

(declare-fun m!633597 () Bool)

(assert (=> b!662287 m!633597))

(declare-fun m!633599 () Bool)

(assert (=> b!662287 m!633599))

(declare-fun m!633601 () Bool)

(assert (=> b!662283 m!633601))

(declare-fun m!633603 () Bool)

(assert (=> start!59870 m!633603))

(declare-fun m!633605 () Bool)

(assert (=> b!662280 m!633605))

(declare-fun m!633607 () Bool)

(assert (=> b!662290 m!633607))

(declare-fun m!633609 () Bool)

(assert (=> b!662292 m!633609))

(declare-fun m!633611 () Bool)

(assert (=> b!662277 m!633611))

(declare-fun m!633613 () Bool)

(assert (=> b!662285 m!633613))

(declare-fun m!633615 () Bool)

(assert (=> b!662278 m!633615))

(declare-fun m!633617 () Bool)

(assert (=> b!662278 m!633617))

(declare-fun m!633619 () Bool)

(assert (=> b!662295 m!633619))

(declare-fun m!633621 () Bool)

(assert (=> b!662293 m!633621))

(declare-fun m!633623 () Bool)

(assert (=> b!662279 m!633623))

(declare-fun m!633625 () Bool)

(assert (=> b!662289 m!633625))

(assert (=> b!662286 m!633591))

(assert (=> b!662282 m!633593))

(declare-fun m!633627 () Bool)

(assert (=> b!662282 m!633627))

(declare-fun m!633629 () Bool)

(assert (=> b!662282 m!633629))

(assert (=> b!662282 m!633593))

(declare-fun m!633631 () Bool)

(assert (=> b!662282 m!633631))

(declare-fun m!633633 () Bool)

(assert (=> b!662282 m!633633))

(declare-fun m!633635 () Bool)

(assert (=> b!662276 m!633635))

(declare-fun m!633637 () Bool)

(assert (=> b!662288 m!633637))

(check-sat (not b!662289) (not b!662288) (not start!59870) (not b!662290) (not b!662292) (not b!662279) (not b!662283) (not b!662276) (not b!662278) (not b!662285) (not b!662286) (not b!662280) (not b!662282) (not b!662287) (not b!662277) (not b!662291) (not b!662295) (not b!662293))
(check-sat)
