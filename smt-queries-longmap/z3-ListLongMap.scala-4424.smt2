; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61270 () Bool)

(assert start!61270)

(declare-fun b!686379 () Bool)

(declare-fun res!451541 () Bool)

(declare-fun e!390886 () Bool)

(assert (=> b!686379 (=> (not res!451541) (not e!390886))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39654 0))(
  ( (array!39655 (arr!19003 (Array (_ BitVec 32) (_ BitVec 64))) (size!19377 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39654)

(assert (=> b!686379 (= res!451541 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19377 a!3626))))))

(declare-fun b!686380 () Bool)

(declare-fun res!451539 () Bool)

(assert (=> b!686380 (=> (not res!451539) (not e!390886))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686380 (= res!451539 (validKeyInArray!0 k0!2843))))

(declare-fun b!686381 () Bool)

(declare-fun e!390888 () Bool)

(declare-datatypes ((List!13044 0))(
  ( (Nil!13041) (Cons!13040 (h!14085 (_ BitVec 64)) (t!19299 List!13044)) )
))
(declare-fun acc!681 () List!13044)

(declare-fun contains!3621 (List!13044 (_ BitVec 64)) Bool)

(assert (=> b!686381 (= e!390888 (not (contains!3621 acc!681 k0!2843)))))

(declare-fun b!686382 () Bool)

(declare-datatypes ((Unit!24182 0))(
  ( (Unit!24183) )
))
(declare-fun e!390883 () Unit!24182)

(declare-fun Unit!24184 () Unit!24182)

(assert (=> b!686382 (= e!390883 Unit!24184)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!315014 () Unit!24182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39654 (_ BitVec 64) (_ BitVec 32)) Unit!24182)

(assert (=> b!686382 (= lt!315014 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686382 false))

(declare-fun b!686383 () Bool)

(declare-fun res!451542 () Bool)

(assert (=> b!686383 (=> (not res!451542) (not e!390886))))

(declare-fun noDuplicate!868 (List!13044) Bool)

(assert (=> b!686383 (= res!451542 (noDuplicate!868 acc!681))))

(declare-fun b!686384 () Bool)

(declare-fun e!390885 () Bool)

(assert (=> b!686384 (= e!390885 e!390888)))

(declare-fun res!451535 () Bool)

(assert (=> b!686384 (=> (not res!451535) (not e!390888))))

(assert (=> b!686384 (= res!451535 (bvsle from!3004 i!1382))))

(declare-fun b!686385 () Bool)

(declare-fun res!451538 () Bool)

(assert (=> b!686385 (=> (not res!451538) (not e!390886))))

(declare-fun arrayContainsKey!0 (array!39654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686385 (= res!451538 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686386 () Bool)

(declare-fun res!451544 () Bool)

(assert (=> b!686386 (=> (not res!451544) (not e!390886))))

(declare-fun arrayNoDuplicates!0 (array!39654 (_ BitVec 32) List!13044) Bool)

(assert (=> b!686386 (= res!451544 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686387 () Bool)

(declare-fun Unit!24185 () Unit!24182)

(assert (=> b!686387 (= e!390883 Unit!24185)))

(declare-fun res!451534 () Bool)

(assert (=> start!61270 (=> (not res!451534) (not e!390886))))

(assert (=> start!61270 (= res!451534 (and (bvslt (size!19377 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19377 a!3626))))))

(assert (=> start!61270 e!390886))

(assert (=> start!61270 true))

(declare-fun array_inv!14799 (array!39654) Bool)

(assert (=> start!61270 (array_inv!14799 a!3626)))

(declare-fun b!686388 () Bool)

(declare-fun res!451536 () Bool)

(assert (=> b!686388 (=> (not res!451536) (not e!390886))))

(assert (=> b!686388 (= res!451536 e!390885)))

(declare-fun res!451533 () Bool)

(assert (=> b!686388 (=> res!451533 e!390885)))

(declare-fun e!390884 () Bool)

(assert (=> b!686388 (= res!451533 e!390884)))

(declare-fun res!451543 () Bool)

(assert (=> b!686388 (=> (not res!451543) (not e!390884))))

(assert (=> b!686388 (= res!451543 (bvsgt from!3004 i!1382))))

(declare-fun b!686389 () Bool)

(declare-fun res!451532 () Bool)

(assert (=> b!686389 (=> (not res!451532) (not e!390886))))

(assert (=> b!686389 (= res!451532 (not (contains!3621 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686390 () Bool)

(declare-fun res!451540 () Bool)

(assert (=> b!686390 (=> (not res!451540) (not e!390886))))

(assert (=> b!686390 (= res!451540 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13041))))

(declare-fun b!686391 () Bool)

(assert (=> b!686391 (= e!390884 (contains!3621 acc!681 k0!2843))))

(declare-fun b!686392 () Bool)

(declare-fun e!390882 () Unit!24182)

(declare-fun Unit!24186 () Unit!24182)

(assert (=> b!686392 (= e!390882 Unit!24186)))

(declare-fun b!686393 () Bool)

(declare-fun res!451531 () Bool)

(assert (=> b!686393 (=> (not res!451531) (not e!390886))))

(assert (=> b!686393 (= res!451531 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19377 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686394 () Bool)

(declare-fun res!451537 () Bool)

(assert (=> b!686394 (=> (not res!451537) (not e!390886))))

(assert (=> b!686394 (= res!451537 (not (contains!3621 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686395 () Bool)

(declare-fun lt!315011 () Unit!24182)

(assert (=> b!686395 (= e!390882 lt!315011)))

(declare-fun lt!315009 () Unit!24182)

(declare-fun lemmaListSubSeqRefl!0 (List!13044) Unit!24182)

(assert (=> b!686395 (= lt!315009 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!207 (List!13044 List!13044) Bool)

(assert (=> b!686395 (subseq!207 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39654 List!13044 List!13044 (_ BitVec 32)) Unit!24182)

(declare-fun $colon$colon!372 (List!13044 (_ BitVec 64)) List!13044)

(assert (=> b!686395 (= lt!315011 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!372 acc!681 (select (arr!19003 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686395 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686396 () Bool)

(assert (=> b!686396 (= e!390886 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!315008 () List!13044)

(assert (=> b!686396 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315008)))

(declare-fun lt!315013 () Unit!24182)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39654 (_ BitVec 64) (_ BitVec 32) List!13044 List!13044) Unit!24182)

(assert (=> b!686396 (= lt!315013 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315008))))

(declare-fun -!172 (List!13044 (_ BitVec 64)) List!13044)

(assert (=> b!686396 (= (-!172 lt!315008 k0!2843) acc!681)))

(assert (=> b!686396 (= lt!315008 ($colon$colon!372 acc!681 k0!2843))))

(declare-fun lt!315016 () Unit!24182)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13044) Unit!24182)

(assert (=> b!686396 (= lt!315016 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!686396 (subseq!207 acc!681 acc!681)))

(declare-fun lt!315015 () Unit!24182)

(assert (=> b!686396 (= lt!315015 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686396 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315010 () Unit!24182)

(assert (=> b!686396 (= lt!315010 e!390882)))

(declare-fun c!77792 () Bool)

(assert (=> b!686396 (= c!77792 (validKeyInArray!0 (select (arr!19003 a!3626) from!3004)))))

(declare-fun lt!315012 () Unit!24182)

(assert (=> b!686396 (= lt!315012 e!390883)))

(declare-fun c!77791 () Bool)

(assert (=> b!686396 (= c!77791 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686396 (arrayContainsKey!0 (array!39655 (store (arr!19003 a!3626) i!1382 k0!2843) (size!19377 a!3626)) k0!2843 from!3004)))

(assert (= (and start!61270 res!451534) b!686383))

(assert (= (and b!686383 res!451542) b!686394))

(assert (= (and b!686394 res!451537) b!686389))

(assert (= (and b!686389 res!451532) b!686388))

(assert (= (and b!686388 res!451543) b!686391))

(assert (= (and b!686388 (not res!451533)) b!686384))

(assert (= (and b!686384 res!451535) b!686381))

(assert (= (and b!686388 res!451536) b!686390))

(assert (= (and b!686390 res!451540) b!686386))

(assert (= (and b!686386 res!451544) b!686379))

(assert (= (and b!686379 res!451541) b!686380))

(assert (= (and b!686380 res!451539) b!686385))

(assert (= (and b!686385 res!451538) b!686393))

(assert (= (and b!686393 res!451531) b!686396))

(assert (= (and b!686396 c!77791) b!686382))

(assert (= (and b!686396 (not c!77791)) b!686387))

(assert (= (and b!686396 c!77792) b!686395))

(assert (= (and b!686396 (not c!77792)) b!686392))

(declare-fun m!650479 () Bool)

(assert (=> b!686394 m!650479))

(declare-fun m!650481 () Bool)

(assert (=> b!686383 m!650481))

(declare-fun m!650483 () Bool)

(assert (=> b!686389 m!650483))

(declare-fun m!650485 () Bool)

(assert (=> b!686386 m!650485))

(declare-fun m!650487 () Bool)

(assert (=> b!686396 m!650487))

(declare-fun m!650489 () Bool)

(assert (=> b!686396 m!650489))

(declare-fun m!650491 () Bool)

(assert (=> b!686396 m!650491))

(declare-fun m!650493 () Bool)

(assert (=> b!686396 m!650493))

(declare-fun m!650495 () Bool)

(assert (=> b!686396 m!650495))

(declare-fun m!650497 () Bool)

(assert (=> b!686396 m!650497))

(declare-fun m!650499 () Bool)

(assert (=> b!686396 m!650499))

(assert (=> b!686396 m!650489))

(declare-fun m!650501 () Bool)

(assert (=> b!686396 m!650501))

(declare-fun m!650503 () Bool)

(assert (=> b!686396 m!650503))

(declare-fun m!650505 () Bool)

(assert (=> b!686396 m!650505))

(declare-fun m!650507 () Bool)

(assert (=> b!686396 m!650507))

(declare-fun m!650509 () Bool)

(assert (=> b!686396 m!650509))

(declare-fun m!650511 () Bool)

(assert (=> b!686396 m!650511))

(declare-fun m!650513 () Bool)

(assert (=> start!61270 m!650513))

(declare-fun m!650515 () Bool)

(assert (=> b!686382 m!650515))

(assert (=> b!686395 m!650487))

(assert (=> b!686395 m!650489))

(declare-fun m!650517 () Bool)

(assert (=> b!686395 m!650517))

(declare-fun m!650519 () Bool)

(assert (=> b!686395 m!650519))

(assert (=> b!686395 m!650489))

(assert (=> b!686395 m!650517))

(assert (=> b!686395 m!650507))

(assert (=> b!686395 m!650511))

(declare-fun m!650521 () Bool)

(assert (=> b!686381 m!650521))

(declare-fun m!650523 () Bool)

(assert (=> b!686390 m!650523))

(declare-fun m!650525 () Bool)

(assert (=> b!686385 m!650525))

(assert (=> b!686391 m!650521))

(declare-fun m!650527 () Bool)

(assert (=> b!686380 m!650527))

(check-sat (not b!686383) (not start!61270) (not b!686389) (not b!686396) (not b!686394) (not b!686390) (not b!686386) (not b!686382) (not b!686391) (not b!686385) (not b!686395) (not b!686380) (not b!686381))
(check-sat)
