; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60078 () Bool)

(assert start!60078)

(declare-fun b!669503 () Bool)

(declare-fun e!382934 () Bool)

(declare-fun e!382926 () Bool)

(assert (=> b!669503 (= e!382934 (not e!382926))))

(declare-fun res!436400 () Bool)

(assert (=> b!669503 (=> res!436400 e!382926)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669503 (= res!436400 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39125 0))(
  ( (array!39126 (arr!18755 (Array (_ BitVec 32) (_ BitVec 64))) (size!19119 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39125)

(declare-datatypes ((List!12796 0))(
  ( (Nil!12793) (Cons!12792 (h!13837 (_ BitVec 64)) (t!19024 List!12796)) )
))
(declare-fun lt!311652 () List!12796)

(declare-fun arrayNoDuplicates!0 (array!39125 (_ BitVec 32) List!12796) Bool)

(assert (=> b!669503 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311652)))

(declare-datatypes ((Unit!23500 0))(
  ( (Unit!23501) )
))
(declare-fun lt!311650 () Unit!23500)

(declare-fun acc!681 () List!12796)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39125 (_ BitVec 64) (_ BitVec 32) List!12796 List!12796) Unit!23500)

(assert (=> b!669503 (= lt!311650 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311652))))

(declare-fun -!110 (List!12796 (_ BitVec 64)) List!12796)

(assert (=> b!669503 (= (-!110 lt!311652 k!2843) acc!681)))

(declare-fun $colon$colon!244 (List!12796 (_ BitVec 64)) List!12796)

(assert (=> b!669503 (= lt!311652 ($colon$colon!244 acc!681 k!2843))))

(declare-fun lt!311653 () Unit!23500)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12796) Unit!23500)

(assert (=> b!669503 (= lt!311653 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!112 (List!12796 List!12796) Bool)

(assert (=> b!669503 (subseq!112 acc!681 acc!681)))

(declare-fun lt!311648 () Unit!23500)

(declare-fun lemmaListSubSeqRefl!0 (List!12796) Unit!23500)

(assert (=> b!669503 (= lt!311648 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669503 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311645 () Unit!23500)

(declare-fun e!382927 () Unit!23500)

(assert (=> b!669503 (= lt!311645 e!382927)))

(declare-fun c!76927 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669503 (= c!76927 (validKeyInArray!0 (select (arr!18755 a!3626) from!3004)))))

(declare-fun lt!311644 () Unit!23500)

(declare-fun e!382935 () Unit!23500)

(assert (=> b!669503 (= lt!311644 e!382935)))

(declare-fun c!76928 () Bool)

(declare-fun arrayContainsKey!0 (array!39125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669503 (= c!76928 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669503 (arrayContainsKey!0 (array!39126 (store (arr!18755 a!3626) i!1382 k!2843) (size!19119 a!3626)) k!2843 from!3004)))

(declare-fun b!669504 () Bool)

(declare-fun res!436398 () Bool)

(assert (=> b!669504 (=> (not res!436398) (not e!382934))))

(assert (=> b!669504 (= res!436398 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19119 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669505 () Bool)

(declare-fun res!436395 () Bool)

(assert (=> b!669505 (=> (not res!436395) (not e!382934))))

(declare-fun contains!3373 (List!12796 (_ BitVec 64)) Bool)

(assert (=> b!669505 (= res!436395 (not (contains!3373 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669506 () Bool)

(declare-fun res!436388 () Bool)

(assert (=> b!669506 (=> (not res!436388) (not e!382934))))

(declare-fun e!382933 () Bool)

(assert (=> b!669506 (= res!436388 e!382933)))

(declare-fun res!436386 () Bool)

(assert (=> b!669506 (=> res!436386 e!382933)))

(declare-fun e!382931 () Bool)

(assert (=> b!669506 (= res!436386 e!382931)))

(declare-fun res!436385 () Bool)

(assert (=> b!669506 (=> (not res!436385) (not e!382931))))

(assert (=> b!669506 (= res!436385 (bvsgt from!3004 i!1382))))

(declare-fun b!669507 () Bool)

(declare-fun e!382928 () Bool)

(assert (=> b!669507 (= e!382928 (not (contains!3373 acc!681 k!2843)))))

(declare-fun b!669508 () Bool)

(assert (=> b!669508 (= e!382931 (contains!3373 acc!681 k!2843))))

(declare-fun b!669509 () Bool)

(declare-fun res!436399 () Bool)

(assert (=> b!669509 (=> (not res!436399) (not e!382934))))

(declare-fun noDuplicate!620 (List!12796) Bool)

(assert (=> b!669509 (= res!436399 (noDuplicate!620 acc!681))))

(declare-fun b!669510 () Bool)

(declare-fun res!436391 () Bool)

(assert (=> b!669510 (=> (not res!436391) (not e!382934))))

(assert (=> b!669510 (= res!436391 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669511 () Bool)

(declare-fun e!382930 () Bool)

(declare-fun e!382925 () Bool)

(assert (=> b!669511 (= e!382930 e!382925)))

(declare-fun res!436397 () Bool)

(assert (=> b!669511 (=> (not res!436397) (not e!382925))))

(assert (=> b!669511 (= res!436397 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669512 () Bool)

(declare-fun res!436389 () Bool)

(assert (=> b!669512 (=> (not res!436389) (not e!382934))))

(assert (=> b!669512 (= res!436389 (validKeyInArray!0 k!2843))))

(declare-fun b!669513 () Bool)

(declare-fun res!436390 () Bool)

(assert (=> b!669513 (=> res!436390 e!382926)))

(assert (=> b!669513 (= res!436390 (contains!3373 lt!311652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669515 () Bool)

(declare-fun res!436387 () Bool)

(assert (=> b!669515 (=> (not res!436387) (not e!382934))))

(assert (=> b!669515 (= res!436387 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12793))))

(declare-fun b!669516 () Bool)

(declare-fun lt!311646 () Unit!23500)

(assert (=> b!669516 (= e!382927 lt!311646)))

(declare-fun lt!311647 () Unit!23500)

(assert (=> b!669516 (= lt!311647 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669516 (subseq!112 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39125 List!12796 List!12796 (_ BitVec 32)) Unit!23500)

(assert (=> b!669516 (= lt!311646 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!244 acc!681 (select (arr!18755 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669516 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669517 () Bool)

(declare-fun res!436401 () Bool)

(assert (=> b!669517 (=> res!436401 e!382926)))

(assert (=> b!669517 (= res!436401 (contains!3373 lt!311652 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669518 () Bool)

(declare-fun e!382929 () Bool)

(assert (=> b!669518 (= e!382929 (contains!3373 lt!311652 k!2843))))

(declare-fun b!669519 () Bool)

(assert (=> b!669519 (= e!382925 (not (contains!3373 lt!311652 k!2843)))))

(declare-fun b!669520 () Bool)

(assert (=> b!669520 (= e!382933 e!382928)))

(declare-fun res!436403 () Bool)

(assert (=> b!669520 (=> (not res!436403) (not e!382928))))

(assert (=> b!669520 (= res!436403 (bvsle from!3004 i!1382))))

(declare-fun b!669521 () Bool)

(declare-fun res!436393 () Bool)

(assert (=> b!669521 (=> (not res!436393) (not e!382934))))

(assert (=> b!669521 (= res!436393 (not (contains!3373 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669522 () Bool)

(declare-fun res!436392 () Bool)

(assert (=> b!669522 (=> res!436392 e!382926)))

(assert (=> b!669522 (= res!436392 (not (noDuplicate!620 lt!311652)))))

(declare-fun b!669523 () Bool)

(declare-fun Unit!23502 () Unit!23500)

(assert (=> b!669523 (= e!382935 Unit!23502)))

(declare-fun b!669524 () Bool)

(assert (=> b!669524 (= e!382926 true)))

(declare-fun lt!311649 () Bool)

(assert (=> b!669524 (= lt!311649 e!382930)))

(declare-fun res!436383 () Bool)

(assert (=> b!669524 (=> res!436383 e!382930)))

(assert (=> b!669524 (= res!436383 e!382929)))

(declare-fun res!436384 () Bool)

(assert (=> b!669524 (=> (not res!436384) (not e!382929))))

(assert (=> b!669524 (= res!436384 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669514 () Bool)

(declare-fun res!436394 () Bool)

(assert (=> b!669514 (=> (not res!436394) (not e!382934))))

(assert (=> b!669514 (= res!436394 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!436396 () Bool)

(assert (=> start!60078 (=> (not res!436396) (not e!382934))))

(assert (=> start!60078 (= res!436396 (and (bvslt (size!19119 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19119 a!3626))))))

(assert (=> start!60078 e!382934))

(assert (=> start!60078 true))

(declare-fun array_inv!14551 (array!39125) Bool)

(assert (=> start!60078 (array_inv!14551 a!3626)))

(declare-fun b!669525 () Bool)

(declare-fun Unit!23503 () Unit!23500)

(assert (=> b!669525 (= e!382927 Unit!23503)))

(declare-fun b!669526 () Bool)

(declare-fun res!436402 () Bool)

(assert (=> b!669526 (=> (not res!436402) (not e!382934))))

(assert (=> b!669526 (= res!436402 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19119 a!3626))))))

(declare-fun b!669527 () Bool)

(declare-fun Unit!23504 () Unit!23500)

(assert (=> b!669527 (= e!382935 Unit!23504)))

(declare-fun lt!311651 () Unit!23500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39125 (_ BitVec 64) (_ BitVec 32)) Unit!23500)

(assert (=> b!669527 (= lt!311651 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669527 false))

(assert (= (and start!60078 res!436396) b!669509))

(assert (= (and b!669509 res!436399) b!669505))

(assert (= (and b!669505 res!436395) b!669521))

(assert (= (and b!669521 res!436393) b!669506))

(assert (= (and b!669506 res!436385) b!669508))

(assert (= (and b!669506 (not res!436386)) b!669520))

(assert (= (and b!669520 res!436403) b!669507))

(assert (= (and b!669506 res!436388) b!669515))

(assert (= (and b!669515 res!436387) b!669510))

(assert (= (and b!669510 res!436391) b!669526))

(assert (= (and b!669526 res!436402) b!669512))

(assert (= (and b!669512 res!436389) b!669514))

(assert (= (and b!669514 res!436394) b!669504))

(assert (= (and b!669504 res!436398) b!669503))

(assert (= (and b!669503 c!76928) b!669527))

(assert (= (and b!669503 (not c!76928)) b!669523))

(assert (= (and b!669503 c!76927) b!669516))

(assert (= (and b!669503 (not c!76927)) b!669525))

(assert (= (and b!669503 (not res!436400)) b!669522))

(assert (= (and b!669522 (not res!436392)) b!669517))

(assert (= (and b!669517 (not res!436401)) b!669513))

(assert (= (and b!669513 (not res!436390)) b!669524))

(assert (= (and b!669524 res!436384) b!669518))

(assert (= (and b!669524 (not res!436383)) b!669511))

(assert (= (and b!669511 res!436397) b!669519))

(declare-fun m!639583 () Bool)

(assert (=> b!669510 m!639583))

(declare-fun m!639585 () Bool)

(assert (=> b!669514 m!639585))

(declare-fun m!639587 () Bool)

(assert (=> b!669522 m!639587))

(declare-fun m!639589 () Bool)

(assert (=> b!669517 m!639589))

(declare-fun m!639591 () Bool)

(assert (=> b!669516 m!639591))

(declare-fun m!639593 () Bool)

(assert (=> b!669516 m!639593))

(declare-fun m!639595 () Bool)

(assert (=> b!669516 m!639595))

(declare-fun m!639597 () Bool)

(assert (=> b!669516 m!639597))

(assert (=> b!669516 m!639593))

(assert (=> b!669516 m!639595))

(declare-fun m!639599 () Bool)

(assert (=> b!669516 m!639599))

(declare-fun m!639601 () Bool)

(assert (=> b!669516 m!639601))

(declare-fun m!639603 () Bool)

(assert (=> b!669512 m!639603))

(declare-fun m!639605 () Bool)

(assert (=> b!669507 m!639605))

(declare-fun m!639607 () Bool)

(assert (=> b!669505 m!639607))

(assert (=> b!669508 m!639605))

(declare-fun m!639609 () Bool)

(assert (=> b!669527 m!639609))

(declare-fun m!639611 () Bool)

(assert (=> b!669521 m!639611))

(declare-fun m!639613 () Bool)

(assert (=> b!669503 m!639613))

(assert (=> b!669503 m!639591))

(assert (=> b!669503 m!639593))

(declare-fun m!639615 () Bool)

(assert (=> b!669503 m!639615))

(declare-fun m!639617 () Bool)

(assert (=> b!669503 m!639617))

(assert (=> b!669503 m!639599))

(declare-fun m!639619 () Bool)

(assert (=> b!669503 m!639619))

(declare-fun m!639621 () Bool)

(assert (=> b!669503 m!639621))

(declare-fun m!639623 () Bool)

(assert (=> b!669503 m!639623))

(assert (=> b!669503 m!639593))

(declare-fun m!639625 () Bool)

(assert (=> b!669503 m!639625))

(declare-fun m!639627 () Bool)

(assert (=> b!669503 m!639627))

(declare-fun m!639629 () Bool)

(assert (=> b!669503 m!639629))

(assert (=> b!669503 m!639601))

(declare-fun m!639631 () Bool)

(assert (=> b!669513 m!639631))

(declare-fun m!639633 () Bool)

(assert (=> b!669509 m!639633))

(declare-fun m!639635 () Bool)

(assert (=> b!669515 m!639635))

(declare-fun m!639637 () Bool)

(assert (=> b!669519 m!639637))

(declare-fun m!639639 () Bool)

(assert (=> start!60078 m!639639))

(assert (=> b!669518 m!639637))

(push 1)

(assert (not b!669510))

(assert (not b!669527))

(assert (not b!669503))

(assert (not b!669515))

(assert (not start!60078))

(assert (not b!669518))

(assert (not b!669522))

(assert (not b!669512))

(assert (not b!669513))

(assert (not b!669509))

(assert (not b!669514))

(assert (not b!669517))

(assert (not b!669516))

(assert (not b!669519))

(assert (not b!669508))

(assert (not b!669505))

(assert (not b!669521))

(assert (not b!669507))

(check-sat)

(pop 1)

(push 1)

