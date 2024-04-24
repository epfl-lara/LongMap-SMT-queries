; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61638 () Bool)

(assert start!61638)

(declare-fun b!689394 () Bool)

(declare-fun res!453891 () Bool)

(declare-fun e!392578 () Bool)

(assert (=> b!689394 (=> (not res!453891) (not e!392578))))

(declare-datatypes ((array!39717 0))(
  ( (array!39718 (arr!19027 (Array (_ BitVec 32) (_ BitVec 64))) (size!19407 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39717)

(declare-datatypes ((List!12975 0))(
  ( (Nil!12972) (Cons!12971 (h!14019 (_ BitVec 64)) (t!19231 List!12975)) )
))
(declare-fun arrayNoDuplicates!0 (array!39717 (_ BitVec 32) List!12975) Bool)

(assert (=> b!689394 (= res!453891 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12972))))

(declare-fun b!689395 () Bool)

(declare-datatypes ((Unit!24306 0))(
  ( (Unit!24307) )
))
(declare-fun e!392574 () Unit!24306)

(declare-fun lt!316162 () Unit!24306)

(assert (=> b!689395 (= e!392574 lt!316162)))

(declare-fun lt!316167 () Unit!24306)

(declare-fun acc!681 () List!12975)

(declare-fun lemmaListSubSeqRefl!0 (List!12975) Unit!24306)

(assert (=> b!689395 (= lt!316167 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!236 (List!12975 List!12975) Bool)

(assert (=> b!689395 (subseq!236 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39717 List!12975 List!12975 (_ BitVec 32)) Unit!24306)

(declare-fun $colon$colon!398 (List!12975 (_ BitVec 64)) List!12975)

(assert (=> b!689395 (= lt!316162 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!398 acc!681 (select (arr!19027 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689395 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689396 () Bool)

(declare-fun res!453881 () Bool)

(assert (=> b!689396 (=> (not res!453881) (not e!392578))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689396 (= res!453881 (validKeyInArray!0 k0!2843))))

(declare-fun b!689397 () Bool)

(declare-fun e!392577 () Bool)

(declare-fun contains!3627 (List!12975 (_ BitVec 64)) Bool)

(assert (=> b!689397 (= e!392577 (not (contains!3627 acc!681 k0!2843)))))

(declare-fun b!689398 () Bool)

(declare-fun e!392576 () Bool)

(declare-fun lt!316160 () List!12975)

(assert (=> b!689398 (= e!392576 (not (contains!3627 lt!316160 k0!2843)))))

(declare-fun b!689399 () Bool)

(declare-fun res!453873 () Bool)

(declare-fun e!392579 () Bool)

(assert (=> b!689399 (=> res!453873 e!392579)))

(assert (=> b!689399 (= res!453873 (contains!3627 lt!316160 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689400 () Bool)

(declare-fun res!453880 () Bool)

(assert (=> b!689400 (=> (not res!453880) (not e!392578))))

(declare-fun e!392573 () Bool)

(assert (=> b!689400 (= res!453880 e!392573)))

(declare-fun res!453889 () Bool)

(assert (=> b!689400 (=> res!453889 e!392573)))

(declare-fun e!392575 () Bool)

(assert (=> b!689400 (= res!453889 e!392575)))

(declare-fun res!453876 () Bool)

(assert (=> b!689400 (=> (not res!453876) (not e!392575))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689400 (= res!453876 (bvsgt from!3004 i!1382))))

(declare-fun b!689401 () Bool)

(declare-fun res!453888 () Bool)

(assert (=> b!689401 (=> (not res!453888) (not e!392578))))

(assert (=> b!689401 (= res!453888 (not (contains!3627 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689402 () Bool)

(declare-fun e!392571 () Bool)

(assert (=> b!689402 (= e!392571 (contains!3627 lt!316160 k0!2843))))

(declare-fun res!453882 () Bool)

(assert (=> start!61638 (=> (not res!453882) (not e!392578))))

(assert (=> start!61638 (= res!453882 (and (bvslt (size!19407 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19407 a!3626))))))

(assert (=> start!61638 e!392578))

(assert (=> start!61638 true))

(declare-fun array_inv!14886 (array!39717) Bool)

(assert (=> start!61638 (array_inv!14886 a!3626)))

(declare-fun b!689403 () Bool)

(declare-fun res!453878 () Bool)

(assert (=> b!689403 (=> (not res!453878) (not e!392578))))

(assert (=> b!689403 (= res!453878 (not (contains!3627 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689404 () Bool)

(assert (=> b!689404 (= e!392579 (bvslt (bvsub (size!19407 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19407 a!3626) from!3004)))))

(declare-fun b!689405 () Bool)

(declare-fun res!453883 () Bool)

(assert (=> b!689405 (=> res!453883 e!392579)))

(assert (=> b!689405 (= res!453883 (contains!3627 lt!316160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689406 () Bool)

(declare-fun res!453875 () Bool)

(assert (=> b!689406 (=> (not res!453875) (not e!392578))))

(assert (=> b!689406 (= res!453875 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19407 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689407 () Bool)

(assert (=> b!689407 (= e!392573 e!392577)))

(declare-fun res!453884 () Bool)

(assert (=> b!689407 (=> (not res!453884) (not e!392577))))

(assert (=> b!689407 (= res!453884 (bvsle from!3004 i!1382))))

(declare-fun b!689408 () Bool)

(declare-fun Unit!24308 () Unit!24306)

(assert (=> b!689408 (= e!392574 Unit!24308)))

(declare-fun b!689409 () Bool)

(declare-fun res!453879 () Bool)

(assert (=> b!689409 (=> res!453879 e!392579)))

(declare-fun noDuplicate!901 (List!12975) Bool)

(assert (=> b!689409 (= res!453879 (not (noDuplicate!901 lt!316160)))))

(declare-fun b!689410 () Bool)

(declare-fun res!453886 () Bool)

(assert (=> b!689410 (=> (not res!453886) (not e!392578))))

(assert (=> b!689410 (= res!453886 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19407 a!3626))))))

(declare-fun b!689411 () Bool)

(declare-fun res!453874 () Bool)

(assert (=> b!689411 (=> (not res!453874) (not e!392578))))

(declare-fun arrayContainsKey!0 (array!39717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689411 (= res!453874 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689412 () Bool)

(declare-fun res!453877 () Bool)

(assert (=> b!689412 (=> res!453877 e!392579)))

(declare-fun e!392572 () Bool)

(assert (=> b!689412 (= res!453877 e!392572)))

(declare-fun res!453872 () Bool)

(assert (=> b!689412 (=> (not res!453872) (not e!392572))))

(assert (=> b!689412 (= res!453872 e!392576)))

(declare-fun res!453871 () Bool)

(assert (=> b!689412 (=> res!453871 e!392576)))

(assert (=> b!689412 (= res!453871 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689413 () Bool)

(assert (=> b!689413 (= e!392578 (not e!392579))))

(declare-fun res!453890 () Bool)

(assert (=> b!689413 (=> res!453890 e!392579)))

(assert (=> b!689413 (= res!453890 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689413 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316160)))

(declare-fun lt!316163 () Unit!24306)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39717 (_ BitVec 64) (_ BitVec 32) List!12975 List!12975) Unit!24306)

(assert (=> b!689413 (= lt!316163 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316160))))

(declare-fun -!200 (List!12975 (_ BitVec 64)) List!12975)

(assert (=> b!689413 (= (-!200 lt!316160 k0!2843) acc!681)))

(assert (=> b!689413 (= lt!316160 ($colon$colon!398 acc!681 k0!2843))))

(declare-fun lt!316168 () Unit!24306)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12975) Unit!24306)

(assert (=> b!689413 (= lt!316168 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!689413 (subseq!236 acc!681 acc!681)))

(declare-fun lt!316161 () Unit!24306)

(assert (=> b!689413 (= lt!316161 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689413 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316164 () Unit!24306)

(assert (=> b!689413 (= lt!316164 e!392574)))

(declare-fun c!78130 () Bool)

(assert (=> b!689413 (= c!78130 (validKeyInArray!0 (select (arr!19027 a!3626) from!3004)))))

(declare-fun lt!316165 () Unit!24306)

(declare-fun e!392580 () Unit!24306)

(assert (=> b!689413 (= lt!316165 e!392580)))

(declare-fun c!78131 () Bool)

(assert (=> b!689413 (= c!78131 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689413 (arrayContainsKey!0 (array!39718 (store (arr!19027 a!3626) i!1382 k0!2843) (size!19407 a!3626)) k0!2843 from!3004)))

(declare-fun b!689414 () Bool)

(declare-fun Unit!24309 () Unit!24306)

(assert (=> b!689414 (= e!392580 Unit!24309)))

(declare-fun b!689415 () Bool)

(assert (=> b!689415 (= e!392572 e!392571)))

(declare-fun res!453887 () Bool)

(assert (=> b!689415 (=> res!453887 e!392571)))

(assert (=> b!689415 (= res!453887 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689416 () Bool)

(assert (=> b!689416 (= e!392575 (contains!3627 acc!681 k0!2843))))

(declare-fun b!689417 () Bool)

(declare-fun res!453885 () Bool)

(assert (=> b!689417 (=> (not res!453885) (not e!392578))))

(assert (=> b!689417 (= res!453885 (noDuplicate!901 acc!681))))

(declare-fun b!689418 () Bool)

(declare-fun Unit!24310 () Unit!24306)

(assert (=> b!689418 (= e!392580 Unit!24310)))

(declare-fun lt!316166 () Unit!24306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39717 (_ BitVec 64) (_ BitVec 32)) Unit!24306)

(assert (=> b!689418 (= lt!316166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689418 false))

(declare-fun b!689419 () Bool)

(declare-fun res!453892 () Bool)

(assert (=> b!689419 (=> (not res!453892) (not e!392578))))

(assert (=> b!689419 (= res!453892 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!61638 res!453882) b!689417))

(assert (= (and b!689417 res!453885) b!689401))

(assert (= (and b!689401 res!453888) b!689403))

(assert (= (and b!689403 res!453878) b!689400))

(assert (= (and b!689400 res!453876) b!689416))

(assert (= (and b!689400 (not res!453889)) b!689407))

(assert (= (and b!689407 res!453884) b!689397))

(assert (= (and b!689400 res!453880) b!689394))

(assert (= (and b!689394 res!453891) b!689419))

(assert (= (and b!689419 res!453892) b!689410))

(assert (= (and b!689410 res!453886) b!689396))

(assert (= (and b!689396 res!453881) b!689411))

(assert (= (and b!689411 res!453874) b!689406))

(assert (= (and b!689406 res!453875) b!689413))

(assert (= (and b!689413 c!78131) b!689418))

(assert (= (and b!689413 (not c!78131)) b!689414))

(assert (= (and b!689413 c!78130) b!689395))

(assert (= (and b!689413 (not c!78130)) b!689408))

(assert (= (and b!689413 (not res!453890)) b!689409))

(assert (= (and b!689409 (not res!453879)) b!689405))

(assert (= (and b!689405 (not res!453883)) b!689399))

(assert (= (and b!689399 (not res!453873)) b!689412))

(assert (= (and b!689412 (not res!453871)) b!689398))

(assert (= (and b!689412 res!453872) b!689415))

(assert (= (and b!689415 (not res!453887)) b!689402))

(assert (= (and b!689412 (not res!453877)) b!689404))

(declare-fun m!653593 () Bool)

(assert (=> b!689409 m!653593))

(declare-fun m!653595 () Bool)

(assert (=> b!689411 m!653595))

(declare-fun m!653597 () Bool)

(assert (=> b!689402 m!653597))

(declare-fun m!653599 () Bool)

(assert (=> b!689419 m!653599))

(declare-fun m!653601 () Bool)

(assert (=> b!689405 m!653601))

(declare-fun m!653603 () Bool)

(assert (=> b!689418 m!653603))

(declare-fun m!653605 () Bool)

(assert (=> b!689403 m!653605))

(declare-fun m!653607 () Bool)

(assert (=> b!689417 m!653607))

(assert (=> b!689398 m!653597))

(declare-fun m!653609 () Bool)

(assert (=> b!689399 m!653609))

(declare-fun m!653611 () Bool)

(assert (=> b!689395 m!653611))

(declare-fun m!653613 () Bool)

(assert (=> b!689395 m!653613))

(declare-fun m!653615 () Bool)

(assert (=> b!689395 m!653615))

(declare-fun m!653617 () Bool)

(assert (=> b!689395 m!653617))

(assert (=> b!689395 m!653613))

(assert (=> b!689395 m!653615))

(declare-fun m!653619 () Bool)

(assert (=> b!689395 m!653619))

(declare-fun m!653621 () Bool)

(assert (=> b!689395 m!653621))

(declare-fun m!653623 () Bool)

(assert (=> b!689394 m!653623))

(declare-fun m!653625 () Bool)

(assert (=> b!689397 m!653625))

(declare-fun m!653627 () Bool)

(assert (=> b!689401 m!653627))

(declare-fun m!653629 () Bool)

(assert (=> b!689396 m!653629))

(assert (=> b!689413 m!653611))

(assert (=> b!689413 m!653613))

(declare-fun m!653631 () Bool)

(assert (=> b!689413 m!653631))

(declare-fun m!653633 () Bool)

(assert (=> b!689413 m!653633))

(declare-fun m!653635 () Bool)

(assert (=> b!689413 m!653635))

(assert (=> b!689413 m!653619))

(declare-fun m!653637 () Bool)

(assert (=> b!689413 m!653637))

(declare-fun m!653639 () Bool)

(assert (=> b!689413 m!653639))

(assert (=> b!689413 m!653613))

(declare-fun m!653641 () Bool)

(assert (=> b!689413 m!653641))

(declare-fun m!653643 () Bool)

(assert (=> b!689413 m!653643))

(declare-fun m!653645 () Bool)

(assert (=> b!689413 m!653645))

(declare-fun m!653647 () Bool)

(assert (=> b!689413 m!653647))

(assert (=> b!689413 m!653621))

(declare-fun m!653649 () Bool)

(assert (=> start!61638 m!653649))

(assert (=> b!689416 m!653625))

(check-sat (not b!689396) (not b!689394) (not b!689403) (not b!689405) (not b!689411) (not b!689401) (not b!689399) (not b!689418) (not b!689417) (not b!689398) (not b!689409) (not start!61638) (not b!689416) (not b!689419) (not b!689413) (not b!689397) (not b!689402) (not b!689395))
(check-sat)
