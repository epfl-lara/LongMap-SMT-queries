; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60044 () Bool)

(assert start!60044)

(declare-fun b!668228 () Bool)

(declare-fun res!435324 () Bool)

(declare-fun e!382369 () Bool)

(assert (=> b!668228 (=> (not res!435324) (not e!382369))))

(declare-datatypes ((List!12779 0))(
  ( (Nil!12776) (Cons!12775 (h!13820 (_ BitVec 64)) (t!19007 List!12779)) )
))
(declare-fun acc!681 () List!12779)

(declare-fun contains!3356 (List!12779 (_ BitVec 64)) Bool)

(assert (=> b!668228 (= res!435324 (not (contains!3356 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668230 () Bool)

(declare-datatypes ((Unit!23415 0))(
  ( (Unit!23416) )
))
(declare-fun e!382365 () Unit!23415)

(declare-fun Unit!23417 () Unit!23415)

(assert (=> b!668230 (= e!382365 Unit!23417)))

(declare-fun b!668231 () Bool)

(declare-fun res!435316 () Bool)

(assert (=> b!668231 (=> (not res!435316) (not e!382369))))

(declare-datatypes ((array!39091 0))(
  ( (array!39092 (arr!18738 (Array (_ BitVec 32) (_ BitVec 64))) (size!19102 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39091)

(declare-fun arrayNoDuplicates!0 (array!39091 (_ BitVec 32) List!12779) Bool)

(assert (=> b!668231 (= res!435316 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12776))))

(declare-fun b!668232 () Bool)

(declare-fun e!382373 () Unit!23415)

(declare-fun Unit!23418 () Unit!23415)

(assert (=> b!668232 (= e!382373 Unit!23418)))

(declare-fun b!668233 () Bool)

(declare-fun e!382368 () Bool)

(declare-fun lt!311140 () List!12779)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!668233 (= e!382368 (not (contains!3356 lt!311140 k!2843)))))

(declare-fun b!668234 () Bool)

(declare-fun res!435330 () Bool)

(assert (=> b!668234 (=> (not res!435330) (not e!382369))))

(declare-fun arrayContainsKey!0 (array!39091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668234 (= res!435330 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668235 () Bool)

(declare-fun e!382367 () Bool)

(assert (=> b!668235 (= e!382369 (not e!382367))))

(declare-fun res!435320 () Bool)

(assert (=> b!668235 (=> res!435320 e!382367)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!668235 (= res!435320 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668235 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311140)))

(declare-fun lt!311143 () Unit!23415)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39091 (_ BitVec 64) (_ BitVec 32) List!12779 List!12779) Unit!23415)

(assert (=> b!668235 (= lt!311143 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311140))))

(declare-fun -!93 (List!12779 (_ BitVec 64)) List!12779)

(assert (=> b!668235 (= (-!93 lt!311140 k!2843) acc!681)))

(declare-fun $colon$colon!227 (List!12779 (_ BitVec 64)) List!12779)

(assert (=> b!668235 (= lt!311140 ($colon$colon!227 acc!681 k!2843))))

(declare-fun lt!311135 () Unit!23415)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12779) Unit!23415)

(assert (=> b!668235 (= lt!311135 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!95 (List!12779 List!12779) Bool)

(assert (=> b!668235 (subseq!95 acc!681 acc!681)))

(declare-fun lt!311139 () Unit!23415)

(declare-fun lemmaListSubSeqRefl!0 (List!12779) Unit!23415)

(assert (=> b!668235 (= lt!311139 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668235 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311138 () Unit!23415)

(assert (=> b!668235 (= lt!311138 e!382373)))

(declare-fun c!76825 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668235 (= c!76825 (validKeyInArray!0 (select (arr!18738 a!3626) from!3004)))))

(declare-fun lt!311136 () Unit!23415)

(assert (=> b!668235 (= lt!311136 e!382365)))

(declare-fun c!76826 () Bool)

(assert (=> b!668235 (= c!76826 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668235 (arrayContainsKey!0 (array!39092 (store (arr!18738 a!3626) i!1382 k!2843) (size!19102 a!3626)) k!2843 from!3004)))

(declare-fun b!668236 () Bool)

(declare-fun res!435317 () Bool)

(assert (=> b!668236 (=> (not res!435317) (not e!382369))))

(assert (=> b!668236 (= res!435317 (validKeyInArray!0 k!2843))))

(declare-fun b!668237 () Bool)

(declare-fun Unit!23419 () Unit!23415)

(assert (=> b!668237 (= e!382365 Unit!23419)))

(declare-fun lt!311141 () Unit!23415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39091 (_ BitVec 64) (_ BitVec 32)) Unit!23415)

(assert (=> b!668237 (= lt!311141 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668237 false))

(declare-fun b!668238 () Bool)

(declare-fun e!382370 () Bool)

(declare-fun e!382371 () Bool)

(assert (=> b!668238 (= e!382370 e!382371)))

(declare-fun res!435328 () Bool)

(assert (=> b!668238 (=> (not res!435328) (not e!382371))))

(assert (=> b!668238 (= res!435328 (bvsle from!3004 i!1382))))

(declare-fun b!668239 () Bool)

(assert (=> b!668239 (= e!382371 (not (contains!3356 acc!681 k!2843)))))

(declare-fun res!435325 () Bool)

(assert (=> start!60044 (=> (not res!435325) (not e!382369))))

(assert (=> start!60044 (= res!435325 (and (bvslt (size!19102 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19102 a!3626))))))

(assert (=> start!60044 e!382369))

(assert (=> start!60044 true))

(declare-fun array_inv!14534 (array!39091) Bool)

(assert (=> start!60044 (array_inv!14534 a!3626)))

(declare-fun b!668229 () Bool)

(assert (=> b!668229 (= e!382367 true)))

(declare-fun lt!311134 () Bool)

(declare-fun e!382372 () Bool)

(assert (=> b!668229 (= lt!311134 e!382372)))

(declare-fun res!435313 () Bool)

(assert (=> b!668229 (=> res!435313 e!382372)))

(declare-fun e!382366 () Bool)

(assert (=> b!668229 (= res!435313 e!382366)))

(declare-fun res!435329 () Bool)

(assert (=> b!668229 (=> (not res!435329) (not e!382366))))

(assert (=> b!668229 (= res!435329 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668240 () Bool)

(declare-fun res!435315 () Bool)

(assert (=> b!668240 (=> (not res!435315) (not e!382369))))

(declare-fun noDuplicate!603 (List!12779) Bool)

(assert (=> b!668240 (= res!435315 (noDuplicate!603 acc!681))))

(declare-fun b!668241 () Bool)

(assert (=> b!668241 (= e!382366 (contains!3356 lt!311140 k!2843))))

(declare-fun b!668242 () Bool)

(declare-fun res!435318 () Bool)

(assert (=> b!668242 (=> (not res!435318) (not e!382369))))

(assert (=> b!668242 (= res!435318 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668243 () Bool)

(declare-fun e!382364 () Bool)

(assert (=> b!668243 (= e!382364 (contains!3356 acc!681 k!2843))))

(declare-fun b!668244 () Bool)

(declare-fun res!435321 () Bool)

(assert (=> b!668244 (=> (not res!435321) (not e!382369))))

(assert (=> b!668244 (= res!435321 e!382370)))

(declare-fun res!435322 () Bool)

(assert (=> b!668244 (=> res!435322 e!382370)))

(assert (=> b!668244 (= res!435322 e!382364)))

(declare-fun res!435326 () Bool)

(assert (=> b!668244 (=> (not res!435326) (not e!382364))))

(assert (=> b!668244 (= res!435326 (bvsgt from!3004 i!1382))))

(declare-fun b!668245 () Bool)

(declare-fun res!435314 () Bool)

(assert (=> b!668245 (=> (not res!435314) (not e!382369))))

(assert (=> b!668245 (= res!435314 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19102 a!3626))))))

(declare-fun b!668246 () Bool)

(declare-fun res!435319 () Bool)

(assert (=> b!668246 (=> (not res!435319) (not e!382369))))

(assert (=> b!668246 (= res!435319 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19102 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668247 () Bool)

(declare-fun res!435327 () Bool)

(assert (=> b!668247 (=> res!435327 e!382367)))

(assert (=> b!668247 (= res!435327 (not (noDuplicate!603 lt!311140)))))

(declare-fun b!668248 () Bool)

(declare-fun res!435331 () Bool)

(assert (=> b!668248 (=> (not res!435331) (not e!382369))))

(assert (=> b!668248 (= res!435331 (not (contains!3356 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668249 () Bool)

(declare-fun res!435323 () Bool)

(assert (=> b!668249 (=> res!435323 e!382367)))

(assert (=> b!668249 (= res!435323 (contains!3356 lt!311140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668250 () Bool)

(declare-fun lt!311142 () Unit!23415)

(assert (=> b!668250 (= e!382373 lt!311142)))

(declare-fun lt!311137 () Unit!23415)

(assert (=> b!668250 (= lt!311137 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668250 (subseq!95 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39091 List!12779 List!12779 (_ BitVec 32)) Unit!23415)

(assert (=> b!668250 (= lt!311142 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!227 acc!681 (select (arr!18738 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668250 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668251 () Bool)

(assert (=> b!668251 (= e!382372 e!382368)))

(declare-fun res!435312 () Bool)

(assert (=> b!668251 (=> (not res!435312) (not e!382368))))

(assert (=> b!668251 (= res!435312 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668252 () Bool)

(declare-fun res!435332 () Bool)

(assert (=> b!668252 (=> res!435332 e!382367)))

(assert (=> b!668252 (= res!435332 (contains!3356 lt!311140 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!60044 res!435325) b!668240))

(assert (= (and b!668240 res!435315) b!668248))

(assert (= (and b!668248 res!435331) b!668228))

(assert (= (and b!668228 res!435324) b!668244))

(assert (= (and b!668244 res!435326) b!668243))

(assert (= (and b!668244 (not res!435322)) b!668238))

(assert (= (and b!668238 res!435328) b!668239))

(assert (= (and b!668244 res!435321) b!668231))

(assert (= (and b!668231 res!435316) b!668242))

(assert (= (and b!668242 res!435318) b!668245))

(assert (= (and b!668245 res!435314) b!668236))

(assert (= (and b!668236 res!435317) b!668234))

(assert (= (and b!668234 res!435330) b!668246))

(assert (= (and b!668246 res!435319) b!668235))

(assert (= (and b!668235 c!76826) b!668237))

(assert (= (and b!668235 (not c!76826)) b!668230))

(assert (= (and b!668235 c!76825) b!668250))

(assert (= (and b!668235 (not c!76825)) b!668232))

(assert (= (and b!668235 (not res!435320)) b!668247))

(assert (= (and b!668247 (not res!435327)) b!668249))

(assert (= (and b!668249 (not res!435323)) b!668252))

(assert (= (and b!668252 (not res!435332)) b!668229))

(assert (= (and b!668229 res!435329) b!668241))

(assert (= (and b!668229 (not res!435313)) b!668251))

(assert (= (and b!668251 res!435312) b!668233))

(declare-fun m!638597 () Bool)

(assert (=> b!668243 m!638597))

(declare-fun m!638599 () Bool)

(assert (=> b!668233 m!638599))

(declare-fun m!638601 () Bool)

(assert (=> b!668231 m!638601))

(declare-fun m!638603 () Bool)

(assert (=> b!668237 m!638603))

(declare-fun m!638605 () Bool)

(assert (=> b!668247 m!638605))

(declare-fun m!638607 () Bool)

(assert (=> b!668252 m!638607))

(assert (=> b!668241 m!638599))

(declare-fun m!638609 () Bool)

(assert (=> b!668236 m!638609))

(assert (=> b!668239 m!638597))

(declare-fun m!638611 () Bool)

(assert (=> start!60044 m!638611))

(declare-fun m!638613 () Bool)

(assert (=> b!668228 m!638613))

(declare-fun m!638615 () Bool)

(assert (=> b!668234 m!638615))

(declare-fun m!638617 () Bool)

(assert (=> b!668248 m!638617))

(declare-fun m!638619 () Bool)

(assert (=> b!668242 m!638619))

(declare-fun m!638621 () Bool)

(assert (=> b!668250 m!638621))

(declare-fun m!638623 () Bool)

(assert (=> b!668250 m!638623))

(declare-fun m!638625 () Bool)

(assert (=> b!668250 m!638625))

(declare-fun m!638627 () Bool)

(assert (=> b!668250 m!638627))

(assert (=> b!668250 m!638623))

(assert (=> b!668250 m!638625))

(declare-fun m!638629 () Bool)

(assert (=> b!668250 m!638629))

(declare-fun m!638631 () Bool)

(assert (=> b!668250 m!638631))

(declare-fun m!638633 () Bool)

(assert (=> b!668249 m!638633))

(declare-fun m!638635 () Bool)

(assert (=> b!668240 m!638635))

(assert (=> b!668235 m!638621))

(declare-fun m!638637 () Bool)

(assert (=> b!668235 m!638637))

(assert (=> b!668235 m!638623))

(declare-fun m!638639 () Bool)

(assert (=> b!668235 m!638639))

(declare-fun m!638641 () Bool)

(assert (=> b!668235 m!638641))

(declare-fun m!638643 () Bool)

(assert (=> b!668235 m!638643))

(assert (=> b!668235 m!638629))

(declare-fun m!638645 () Bool)

(assert (=> b!668235 m!638645))

(assert (=> b!668235 m!638623))

(declare-fun m!638647 () Bool)

(assert (=> b!668235 m!638647))

(declare-fun m!638649 () Bool)

(assert (=> b!668235 m!638649))

(declare-fun m!638651 () Bool)

(assert (=> b!668235 m!638651))

(declare-fun m!638653 () Bool)

(assert (=> b!668235 m!638653))

(assert (=> b!668235 m!638631))

(push 1)

(assert (not b!668252))

(assert (not b!668247))

(assert (not start!60044))

(assert (not b!668231))

(assert (not b!668243))

(assert (not b!668241))

(assert (not b!668240))

(assert (not b!668235))

(assert (not b!668228))

(assert (not b!668249))

(assert (not b!668250))

(assert (not b!668239))

(assert (not b!668233))

(assert (not b!668234))

(assert (not b!668242))

(assert (not b!668248))

(assert (not b!668236))

(assert (not b!668237))

(check-sat)

(pop 1)

