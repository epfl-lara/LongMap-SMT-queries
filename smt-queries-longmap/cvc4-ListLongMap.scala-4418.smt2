; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61002 () Bool)

(assert start!61002)

(declare-fun b!684489 () Bool)

(declare-fun e!389791 () Bool)

(declare-fun e!389794 () Bool)

(assert (=> b!684489 (= e!389791 e!389794)))

(declare-fun res!450053 () Bool)

(assert (=> b!684489 (=> (not res!450053) (not e!389794))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684489 (= res!450053 (bvsle from!3004 i!1382))))

(declare-fun b!684490 () Bool)

(declare-fun res!450045 () Bool)

(declare-fun e!389793 () Bool)

(assert (=> b!684490 (=> res!450045 e!389793)))

(declare-fun lt!314352 () Bool)

(assert (=> b!684490 (= res!450045 lt!314352)))

(declare-fun b!684491 () Bool)

(declare-fun res!450054 () Bool)

(declare-fun e!389792 () Bool)

(assert (=> b!684491 (=> (not res!450054) (not e!389792))))

(declare-datatypes ((List!13027 0))(
  ( (Nil!13024) (Cons!13023 (h!14068 (_ BitVec 64)) (t!19273 List!13027)) )
))
(declare-fun acc!681 () List!13027)

(declare-fun noDuplicate!851 (List!13027) Bool)

(assert (=> b!684491 (= res!450054 (noDuplicate!851 acc!681))))

(declare-fun b!684492 () Bool)

(declare-fun res!450057 () Bool)

(assert (=> b!684492 (=> res!450057 e!389793)))

(declare-fun lt!314355 () List!13027)

(assert (=> b!684492 (= res!450057 (not (noDuplicate!851 lt!314355)))))

(declare-fun b!684493 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3604 (List!13027 (_ BitVec 64)) Bool)

(assert (=> b!684493 (= e!389794 (not (contains!3604 acc!681 k!2843)))))

(declare-fun b!684494 () Bool)

(declare-fun res!450048 () Bool)

(assert (=> b!684494 (=> (not res!450048) (not e!389792))))

(declare-datatypes ((array!39611 0))(
  ( (array!39612 (arr!18986 (Array (_ BitVec 32) (_ BitVec 64))) (size!19353 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39611)

(declare-fun arrayContainsKey!0 (array!39611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684494 (= res!450048 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684495 () Bool)

(assert (=> b!684495 (= e!389792 (not e!389793))))

(declare-fun res!450049 () Bool)

(assert (=> b!684495 (=> res!450049 e!389793)))

(assert (=> b!684495 (= res!450049 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!155 (List!13027 (_ BitVec 64)) List!13027)

(assert (=> b!684495 (= (-!155 lt!314355 k!2843) acc!681)))

(declare-fun $colon$colon!355 (List!13027 (_ BitVec 64)) List!13027)

(assert (=> b!684495 (= lt!314355 ($colon$colon!355 acc!681 k!2843))))

(declare-datatypes ((Unit!24097 0))(
  ( (Unit!24098) )
))
(declare-fun lt!314347 () Unit!24097)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13027) Unit!24097)

(assert (=> b!684495 (= lt!314347 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!190 (List!13027 List!13027) Bool)

(assert (=> b!684495 (subseq!190 acc!681 acc!681)))

(declare-fun lt!314348 () Unit!24097)

(declare-fun lemmaListSubSeqRefl!0 (List!13027) Unit!24097)

(assert (=> b!684495 (= lt!314348 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39611 (_ BitVec 32) List!13027) Bool)

(assert (=> b!684495 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314349 () Unit!24097)

(declare-fun e!389790 () Unit!24097)

(assert (=> b!684495 (= lt!314349 e!389790)))

(declare-fun c!77590 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684495 (= c!77590 (validKeyInArray!0 (select (arr!18986 a!3626) from!3004)))))

(declare-fun lt!314353 () Unit!24097)

(declare-fun e!389795 () Unit!24097)

(assert (=> b!684495 (= lt!314353 e!389795)))

(declare-fun c!77591 () Bool)

(assert (=> b!684495 (= c!77591 lt!314352)))

(assert (=> b!684495 (= lt!314352 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684495 (arrayContainsKey!0 (array!39612 (store (arr!18986 a!3626) i!1382 k!2843) (size!19353 a!3626)) k!2843 from!3004)))

(declare-fun b!684496 () Bool)

(declare-fun Unit!24099 () Unit!24097)

(assert (=> b!684496 (= e!389795 Unit!24099)))

(declare-fun lt!314350 () Unit!24097)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39611 (_ BitVec 64) (_ BitVec 32)) Unit!24097)

(assert (=> b!684496 (= lt!314350 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684496 false))

(declare-fun b!684497 () Bool)

(declare-fun Unit!24100 () Unit!24097)

(assert (=> b!684497 (= e!389795 Unit!24100)))

(declare-fun b!684498 () Bool)

(declare-fun res!450052 () Bool)

(assert (=> b!684498 (=> (not res!450052) (not e!389792))))

(assert (=> b!684498 (= res!450052 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13024))))

(declare-fun b!684500 () Bool)

(declare-fun res!450058 () Bool)

(assert (=> b!684500 (=> (not res!450058) (not e!389792))))

(assert (=> b!684500 (= res!450058 (not (contains!3604 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684501 () Bool)

(declare-fun res!450047 () Bool)

(assert (=> b!684501 (=> (not res!450047) (not e!389792))))

(assert (=> b!684501 (= res!450047 (not (contains!3604 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684502 () Bool)

(declare-fun res!450055 () Bool)

(assert (=> b!684502 (=> (not res!450055) (not e!389792))))

(assert (=> b!684502 (= res!450055 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19353 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684503 () Bool)

(declare-fun res!450050 () Bool)

(assert (=> b!684503 (=> (not res!450050) (not e!389792))))

(assert (=> b!684503 (= res!450050 e!389791)))

(declare-fun res!450051 () Bool)

(assert (=> b!684503 (=> res!450051 e!389791)))

(declare-fun e!389789 () Bool)

(assert (=> b!684503 (= res!450051 e!389789)))

(declare-fun res!450044 () Bool)

(assert (=> b!684503 (=> (not res!450044) (not e!389789))))

(assert (=> b!684503 (= res!450044 (bvsgt from!3004 i!1382))))

(declare-fun b!684504 () Bool)

(assert (=> b!684504 (= e!389789 (contains!3604 acc!681 k!2843))))

(declare-fun b!684499 () Bool)

(declare-fun res!450059 () Bool)

(assert (=> b!684499 (=> (not res!450059) (not e!389792))))

(assert (=> b!684499 (= res!450059 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19353 a!3626))))))

(declare-fun res!450056 () Bool)

(assert (=> start!61002 (=> (not res!450056) (not e!389792))))

(assert (=> start!61002 (= res!450056 (and (bvslt (size!19353 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19353 a!3626))))))

(assert (=> start!61002 e!389792))

(assert (=> start!61002 true))

(declare-fun array_inv!14782 (array!39611) Bool)

(assert (=> start!61002 (array_inv!14782 a!3626)))

(declare-fun b!684505 () Bool)

(declare-fun res!450043 () Bool)

(assert (=> b!684505 (=> (not res!450043) (not e!389792))))

(assert (=> b!684505 (= res!450043 (validKeyInArray!0 k!2843))))

(declare-fun b!684506 () Bool)

(declare-fun lt!314351 () Unit!24097)

(assert (=> b!684506 (= e!389790 lt!314351)))

(declare-fun lt!314356 () Unit!24097)

(assert (=> b!684506 (= lt!314356 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684506 (subseq!190 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39611 List!13027 List!13027 (_ BitVec 32)) Unit!24097)

(assert (=> b!684506 (= lt!314351 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!355 acc!681 (select (arr!18986 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684506 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684507 () Bool)

(assert (=> b!684507 (= e!389793 true)))

(declare-fun lt!314354 () Bool)

(assert (=> b!684507 (= lt!314354 (contains!3604 acc!681 k!2843))))

(declare-fun b!684508 () Bool)

(declare-fun res!450046 () Bool)

(assert (=> b!684508 (=> (not res!450046) (not e!389792))))

(assert (=> b!684508 (= res!450046 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684509 () Bool)

(declare-fun Unit!24101 () Unit!24097)

(assert (=> b!684509 (= e!389790 Unit!24101)))

(assert (= (and start!61002 res!450056) b!684491))

(assert (= (and b!684491 res!450054) b!684500))

(assert (= (and b!684500 res!450058) b!684501))

(assert (= (and b!684501 res!450047) b!684503))

(assert (= (and b!684503 res!450044) b!684504))

(assert (= (and b!684503 (not res!450051)) b!684489))

(assert (= (and b!684489 res!450053) b!684493))

(assert (= (and b!684503 res!450050) b!684498))

(assert (= (and b!684498 res!450052) b!684508))

(assert (= (and b!684508 res!450046) b!684499))

(assert (= (and b!684499 res!450059) b!684505))

(assert (= (and b!684505 res!450043) b!684494))

(assert (= (and b!684494 res!450048) b!684502))

(assert (= (and b!684502 res!450055) b!684495))

(assert (= (and b!684495 c!77591) b!684496))

(assert (= (and b!684495 (not c!77591)) b!684497))

(assert (= (and b!684495 c!77590) b!684506))

(assert (= (and b!684495 (not c!77590)) b!684509))

(assert (= (and b!684495 (not res!450049)) b!684492))

(assert (= (and b!684492 (not res!450057)) b!684490))

(assert (= (and b!684490 (not res!450045)) b!684507))

(declare-fun m!648833 () Bool)

(assert (=> start!61002 m!648833))

(declare-fun m!648835 () Bool)

(assert (=> b!684504 m!648835))

(declare-fun m!648837 () Bool)

(assert (=> b!684505 m!648837))

(declare-fun m!648839 () Bool)

(assert (=> b!684501 m!648839))

(declare-fun m!648841 () Bool)

(assert (=> b!684495 m!648841))

(declare-fun m!648843 () Bool)

(assert (=> b!684495 m!648843))

(declare-fun m!648845 () Bool)

(assert (=> b!684495 m!648845))

(declare-fun m!648847 () Bool)

(assert (=> b!684495 m!648847))

(declare-fun m!648849 () Bool)

(assert (=> b!684495 m!648849))

(declare-fun m!648851 () Bool)

(assert (=> b!684495 m!648851))

(declare-fun m!648853 () Bool)

(assert (=> b!684495 m!648853))

(declare-fun m!648855 () Bool)

(assert (=> b!684495 m!648855))

(assert (=> b!684495 m!648845))

(declare-fun m!648857 () Bool)

(assert (=> b!684495 m!648857))

(declare-fun m!648859 () Bool)

(assert (=> b!684495 m!648859))

(declare-fun m!648861 () Bool)

(assert (=> b!684495 m!648861))

(assert (=> b!684506 m!648843))

(assert (=> b!684506 m!648845))

(declare-fun m!648863 () Bool)

(assert (=> b!684506 m!648863))

(declare-fun m!648865 () Bool)

(assert (=> b!684506 m!648865))

(assert (=> b!684506 m!648845))

(assert (=> b!684506 m!648863))

(assert (=> b!684506 m!648851))

(assert (=> b!684506 m!648861))

(declare-fun m!648867 () Bool)

(assert (=> b!684496 m!648867))

(declare-fun m!648869 () Bool)

(assert (=> b!684508 m!648869))

(assert (=> b!684507 m!648835))

(declare-fun m!648871 () Bool)

(assert (=> b!684494 m!648871))

(declare-fun m!648873 () Bool)

(assert (=> b!684498 m!648873))

(assert (=> b!684493 m!648835))

(declare-fun m!648875 () Bool)

(assert (=> b!684492 m!648875))

(declare-fun m!648877 () Bool)

(assert (=> b!684491 m!648877))

(declare-fun m!648879 () Bool)

(assert (=> b!684500 m!648879))

(push 1)

(assert (not b!684493))

(assert (not b!684500))

(assert (not b!684508))

(assert (not b!684495))

(assert (not b!684501))

(assert (not b!684507))

(assert (not b!684492))

(assert (not b!684506))

(assert (not b!684496))

(assert (not b!684491))

(assert (not start!61002))

(assert (not b!684494))

(assert (not b!684505))

(assert (not b!684498))

(assert (not b!684504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

