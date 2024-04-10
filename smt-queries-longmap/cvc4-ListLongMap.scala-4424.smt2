; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61272 () Bool)

(assert start!61272)

(declare-fun b!686433 () Bool)

(declare-fun res!451582 () Bool)

(declare-fun e!390908 () Bool)

(assert (=> b!686433 (=> (not res!451582) (not e!390908))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39656 0))(
  ( (array!39657 (arr!19004 (Array (_ BitVec 32) (_ BitVec 64))) (size!19378 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39656)

(assert (=> b!686433 (= res!451582 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19378 a!3626))))))

(declare-fun b!686434 () Bool)

(declare-datatypes ((Unit!24187 0))(
  ( (Unit!24188) )
))
(declare-fun e!390907 () Unit!24187)

(declare-fun Unit!24189 () Unit!24187)

(assert (=> b!686434 (= e!390907 Unit!24189)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!315037 () Unit!24187)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39656 (_ BitVec 64) (_ BitVec 32)) Unit!24187)

(assert (=> b!686434 (= lt!315037 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686434 false))

(declare-fun b!686435 () Bool)

(declare-fun res!451581 () Bool)

(assert (=> b!686435 (=> (not res!451581) (not e!390908))))

(declare-datatypes ((List!13045 0))(
  ( (Nil!13042) (Cons!13041 (h!14086 (_ BitVec 64)) (t!19300 List!13045)) )
))
(declare-fun acc!681 () List!13045)

(declare-fun noDuplicate!869 (List!13045) Bool)

(assert (=> b!686435 (= res!451581 (noDuplicate!869 acc!681))))

(declare-fun b!686436 () Bool)

(declare-fun res!451574 () Bool)

(assert (=> b!686436 (=> (not res!451574) (not e!390908))))

(declare-fun arrayNoDuplicates!0 (array!39656 (_ BitVec 32) List!13045) Bool)

(assert (=> b!686436 (= res!451574 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13042))))

(declare-fun b!686437 () Bool)

(declare-fun res!451584 () Bool)

(assert (=> b!686437 (=> (not res!451584) (not e!390908))))

(assert (=> b!686437 (= res!451584 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19378 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686438 () Bool)

(declare-fun e!390903 () Bool)

(declare-fun contains!3622 (List!13045 (_ BitVec 64)) Bool)

(assert (=> b!686438 (= e!390903 (contains!3622 acc!681 k!2843))))

(declare-fun b!686439 () Bool)

(declare-fun res!451583 () Bool)

(assert (=> b!686439 (=> (not res!451583) (not e!390908))))

(declare-fun e!390906 () Bool)

(assert (=> b!686439 (= res!451583 e!390906)))

(declare-fun res!451575 () Bool)

(assert (=> b!686439 (=> res!451575 e!390906)))

(assert (=> b!686439 (= res!451575 e!390903)))

(declare-fun res!451576 () Bool)

(assert (=> b!686439 (=> (not res!451576) (not e!390903))))

(assert (=> b!686439 (= res!451576 (bvsgt from!3004 i!1382))))

(declare-fun b!686441 () Bool)

(declare-fun res!451579 () Bool)

(assert (=> b!686441 (=> (not res!451579) (not e!390908))))

(assert (=> b!686441 (= res!451579 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686442 () Bool)

(declare-fun res!451577 () Bool)

(assert (=> b!686442 (=> (not res!451577) (not e!390908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686442 (= res!451577 (validKeyInArray!0 k!2843))))

(declare-fun b!686443 () Bool)

(declare-fun res!451586 () Bool)

(assert (=> b!686443 (=> (not res!451586) (not e!390908))))

(assert (=> b!686443 (= res!451586 (not (contains!3622 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686444 () Bool)

(declare-fun e!390909 () Unit!24187)

(declare-fun Unit!24190 () Unit!24187)

(assert (=> b!686444 (= e!390909 Unit!24190)))

(declare-fun b!686440 () Bool)

(declare-fun Unit!24191 () Unit!24187)

(assert (=> b!686440 (= e!390907 Unit!24191)))

(declare-fun res!451573 () Bool)

(assert (=> start!61272 (=> (not res!451573) (not e!390908))))

(assert (=> start!61272 (= res!451573 (and (bvslt (size!19378 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19378 a!3626))))))

(assert (=> start!61272 e!390908))

(assert (=> start!61272 true))

(declare-fun array_inv!14800 (array!39656) Bool)

(assert (=> start!61272 (array_inv!14800 a!3626)))

(declare-fun b!686445 () Bool)

(declare-fun res!451585 () Bool)

(assert (=> b!686445 (=> (not res!451585) (not e!390908))))

(declare-fun arrayContainsKey!0 (array!39656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686445 (= res!451585 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686446 () Bool)

(assert (=> b!686446 (= e!390908 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!315038 () List!13045)

(assert (=> b!686446 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315038)))

(declare-fun lt!315042 () Unit!24187)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39656 (_ BitVec 64) (_ BitVec 32) List!13045 List!13045) Unit!24187)

(assert (=> b!686446 (= lt!315042 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315038))))

(declare-fun -!173 (List!13045 (_ BitVec 64)) List!13045)

(assert (=> b!686446 (= (-!173 lt!315038 k!2843) acc!681)))

(declare-fun $colon$colon!373 (List!13045 (_ BitVec 64)) List!13045)

(assert (=> b!686446 (= lt!315038 ($colon$colon!373 acc!681 k!2843))))

(declare-fun lt!315035 () Unit!24187)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13045) Unit!24187)

(assert (=> b!686446 (= lt!315035 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!208 (List!13045 List!13045) Bool)

(assert (=> b!686446 (subseq!208 acc!681 acc!681)))

(declare-fun lt!315040 () Unit!24187)

(declare-fun lemmaListSubSeqRefl!0 (List!13045) Unit!24187)

(assert (=> b!686446 (= lt!315040 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686446 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315043 () Unit!24187)

(assert (=> b!686446 (= lt!315043 e!390909)))

(declare-fun c!77798 () Bool)

(assert (=> b!686446 (= c!77798 (validKeyInArray!0 (select (arr!19004 a!3626) from!3004)))))

(declare-fun lt!315041 () Unit!24187)

(assert (=> b!686446 (= lt!315041 e!390907)))

(declare-fun c!77797 () Bool)

(assert (=> b!686446 (= c!77797 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686446 (arrayContainsKey!0 (array!39657 (store (arr!19004 a!3626) i!1382 k!2843) (size!19378 a!3626)) k!2843 from!3004)))

(declare-fun b!686447 () Bool)

(declare-fun res!451580 () Bool)

(assert (=> b!686447 (=> (not res!451580) (not e!390908))))

(assert (=> b!686447 (= res!451580 (not (contains!3622 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686448 () Bool)

(declare-fun e!390904 () Bool)

(assert (=> b!686448 (= e!390904 (not (contains!3622 acc!681 k!2843)))))

(declare-fun b!686449 () Bool)

(assert (=> b!686449 (= e!390906 e!390904)))

(declare-fun res!451578 () Bool)

(assert (=> b!686449 (=> (not res!451578) (not e!390904))))

(assert (=> b!686449 (= res!451578 (bvsle from!3004 i!1382))))

(declare-fun b!686450 () Bool)

(declare-fun lt!315036 () Unit!24187)

(assert (=> b!686450 (= e!390909 lt!315036)))

(declare-fun lt!315039 () Unit!24187)

(assert (=> b!686450 (= lt!315039 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686450 (subseq!208 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39656 List!13045 List!13045 (_ BitVec 32)) Unit!24187)

(assert (=> b!686450 (= lt!315036 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!373 acc!681 (select (arr!19004 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686450 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!61272 res!451573) b!686435))

(assert (= (and b!686435 res!451581) b!686443))

(assert (= (and b!686443 res!451586) b!686447))

(assert (= (and b!686447 res!451580) b!686439))

(assert (= (and b!686439 res!451576) b!686438))

(assert (= (and b!686439 (not res!451575)) b!686449))

(assert (= (and b!686449 res!451578) b!686448))

(assert (= (and b!686439 res!451583) b!686436))

(assert (= (and b!686436 res!451574) b!686441))

(assert (= (and b!686441 res!451579) b!686433))

(assert (= (and b!686433 res!451582) b!686442))

(assert (= (and b!686442 res!451577) b!686445))

(assert (= (and b!686445 res!451585) b!686437))

(assert (= (and b!686437 res!451584) b!686446))

(assert (= (and b!686446 c!77797) b!686434))

(assert (= (and b!686446 (not c!77797)) b!686440))

(assert (= (and b!686446 c!77798) b!686450))

(assert (= (and b!686446 (not c!77798)) b!686444))

(declare-fun m!650529 () Bool)

(assert (=> b!686434 m!650529))

(declare-fun m!650531 () Bool)

(assert (=> b!686445 m!650531))

(declare-fun m!650533 () Bool)

(assert (=> b!686443 m!650533))

(declare-fun m!650535 () Bool)

(assert (=> b!686447 m!650535))

(declare-fun m!650537 () Bool)

(assert (=> b!686448 m!650537))

(declare-fun m!650539 () Bool)

(assert (=> b!686441 m!650539))

(assert (=> b!686438 m!650537))

(declare-fun m!650541 () Bool)

(assert (=> b!686442 m!650541))

(declare-fun m!650543 () Bool)

(assert (=> b!686450 m!650543))

(declare-fun m!650545 () Bool)

(assert (=> b!686450 m!650545))

(declare-fun m!650547 () Bool)

(assert (=> b!686450 m!650547))

(declare-fun m!650549 () Bool)

(assert (=> b!686450 m!650549))

(assert (=> b!686450 m!650545))

(assert (=> b!686450 m!650547))

(declare-fun m!650551 () Bool)

(assert (=> b!686450 m!650551))

(declare-fun m!650553 () Bool)

(assert (=> b!686450 m!650553))

(declare-fun m!650555 () Bool)

(assert (=> b!686435 m!650555))

(declare-fun m!650557 () Bool)

(assert (=> start!61272 m!650557))

(declare-fun m!650559 () Bool)

(assert (=> b!686446 m!650559))

(assert (=> b!686446 m!650543))

(assert (=> b!686446 m!650545))

(declare-fun m!650561 () Bool)

(assert (=> b!686446 m!650561))

(declare-fun m!650563 () Bool)

(assert (=> b!686446 m!650563))

(assert (=> b!686446 m!650551))

(declare-fun m!650565 () Bool)

(assert (=> b!686446 m!650565))

(assert (=> b!686446 m!650545))

(declare-fun m!650567 () Bool)

(assert (=> b!686446 m!650567))

(declare-fun m!650569 () Bool)

(assert (=> b!686446 m!650569))

(declare-fun m!650571 () Bool)

(assert (=> b!686446 m!650571))

(declare-fun m!650573 () Bool)

(assert (=> b!686446 m!650573))

(declare-fun m!650575 () Bool)

(assert (=> b!686446 m!650575))

(assert (=> b!686446 m!650553))

(declare-fun m!650577 () Bool)

(assert (=> b!686436 m!650577))

(push 1)

