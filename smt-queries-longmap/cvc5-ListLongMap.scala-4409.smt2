; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60858 () Bool)

(assert start!60858)

(declare-fun b!682381 () Bool)

(declare-fun res!448486 () Bool)

(declare-fun e!388772 () Bool)

(assert (=> b!682381 (=> (not res!448486) (not e!388772))))

(declare-datatypes ((List!13038 0))(
  ( (Nil!13035) (Cons!13034 (h!14079 (_ BitVec 64)) (t!19272 List!13038)) )
))
(declare-fun acc!681 () List!13038)

(declare-fun contains!3560 (List!13038 (_ BitVec 64)) Bool)

(assert (=> b!682381 (= res!448486 (not (contains!3560 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682383 () Bool)

(declare-fun e!388774 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!682383 (= e!388774 (contains!3560 acc!681 k!2843))))

(declare-fun b!682384 () Bool)

(declare-fun res!448497 () Bool)

(assert (=> b!682384 (=> (not res!448497) (not e!388772))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39553 0))(
  ( (array!39554 (arr!18958 (Array (_ BitVec 32) (_ BitVec 64))) (size!19323 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39553)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!682384 (= res!448497 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19323 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682385 () Bool)

(declare-datatypes ((Unit!23940 0))(
  ( (Unit!23941) )
))
(declare-fun e!388771 () Unit!23940)

(declare-fun Unit!23942 () Unit!23940)

(assert (=> b!682385 (= e!388771 Unit!23942)))

(declare-fun b!682386 () Bool)

(declare-fun res!448491 () Bool)

(assert (=> b!682386 (=> (not res!448491) (not e!388772))))

(assert (=> b!682386 (= res!448491 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19323 a!3626))))))

(declare-fun b!682387 () Bool)

(declare-fun res!448495 () Bool)

(assert (=> b!682387 (=> (not res!448495) (not e!388772))))

(declare-fun noDuplicate!829 (List!13038) Bool)

(assert (=> b!682387 (= res!448495 (noDuplicate!829 acc!681))))

(declare-fun b!682388 () Bool)

(declare-fun res!448485 () Bool)

(assert (=> b!682388 (=> (not res!448485) (not e!388772))))

(assert (=> b!682388 (= res!448485 (not (contains!3560 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682389 () Bool)

(declare-fun e!388769 () Bool)

(declare-fun e!388775 () Bool)

(assert (=> b!682389 (= e!388769 e!388775)))

(declare-fun res!448487 () Bool)

(assert (=> b!682389 (=> (not res!448487) (not e!388775))))

(assert (=> b!682389 (= res!448487 (bvsle from!3004 i!1382))))

(declare-fun b!682390 () Bool)

(assert (=> b!682390 (= e!388775 (not (contains!3560 acc!681 k!2843)))))

(declare-fun b!682391 () Bool)

(declare-fun res!448492 () Bool)

(assert (=> b!682391 (=> (not res!448492) (not e!388772))))

(declare-fun arrayNoDuplicates!0 (array!39553 (_ BitVec 32) List!13038) Bool)

(assert (=> b!682391 (= res!448492 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682392 () Bool)

(declare-fun Unit!23943 () Unit!23940)

(assert (=> b!682392 (= e!388771 Unit!23943)))

(declare-fun lt!313350 () Unit!23940)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39553 (_ BitVec 64) (_ BitVec 32)) Unit!23940)

(assert (=> b!682392 (= lt!313350 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682392 false))

(declare-fun b!682393 () Bool)

(assert (=> b!682393 (= e!388772 (not true))))

(declare-fun -!128 (List!13038 (_ BitVec 64)) List!13038)

(declare-fun $colon$colon!327 (List!13038 (_ BitVec 64)) List!13038)

(assert (=> b!682393 (= (-!128 ($colon$colon!327 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313353 () Unit!23940)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13038) Unit!23940)

(assert (=> b!682393 (= lt!313353 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!163 (List!13038 List!13038) Bool)

(assert (=> b!682393 (subseq!163 acc!681 acc!681)))

(declare-fun lt!313351 () Unit!23940)

(declare-fun lemmaListSubSeqRefl!0 (List!13038) Unit!23940)

(assert (=> b!682393 (= lt!313351 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682393 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313355 () Unit!23940)

(declare-fun e!388770 () Unit!23940)

(assert (=> b!682393 (= lt!313355 e!388770)))

(declare-fun c!77316 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682393 (= c!77316 (validKeyInArray!0 (select (arr!18958 a!3626) from!3004)))))

(declare-fun lt!313354 () Unit!23940)

(assert (=> b!682393 (= lt!313354 e!388771)))

(declare-fun c!77315 () Bool)

(declare-fun arrayContainsKey!0 (array!39553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682393 (= c!77315 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682393 (arrayContainsKey!0 (array!39554 (store (arr!18958 a!3626) i!1382 k!2843) (size!19323 a!3626)) k!2843 from!3004)))

(declare-fun b!682394 () Bool)

(declare-fun Unit!23944 () Unit!23940)

(assert (=> b!682394 (= e!388770 Unit!23944)))

(declare-fun res!448498 () Bool)

(assert (=> start!60858 (=> (not res!448498) (not e!388772))))

(assert (=> start!60858 (= res!448498 (and (bvslt (size!19323 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19323 a!3626))))))

(assert (=> start!60858 e!388772))

(assert (=> start!60858 true))

(declare-fun array_inv!14841 (array!39553) Bool)

(assert (=> start!60858 (array_inv!14841 a!3626)))

(declare-fun b!682382 () Bool)

(declare-fun res!448496 () Bool)

(assert (=> b!682382 (=> (not res!448496) (not e!388772))))

(assert (=> b!682382 (= res!448496 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13035))))

(declare-fun b!682395 () Bool)

(declare-fun res!448488 () Bool)

(assert (=> b!682395 (=> (not res!448488) (not e!388772))))

(assert (=> b!682395 (= res!448488 (validKeyInArray!0 k!2843))))

(declare-fun b!682396 () Bool)

(declare-fun lt!313356 () Unit!23940)

(assert (=> b!682396 (= e!388770 lt!313356)))

(declare-fun lt!313352 () Unit!23940)

(assert (=> b!682396 (= lt!313352 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682396 (subseq!163 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39553 List!13038 List!13038 (_ BitVec 32)) Unit!23940)

(assert (=> b!682396 (= lt!313356 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!327 acc!681 (select (arr!18958 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682396 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682397 () Bool)

(declare-fun res!448493 () Bool)

(assert (=> b!682397 (=> (not res!448493) (not e!388772))))

(assert (=> b!682397 (= res!448493 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682398 () Bool)

(declare-fun res!448489 () Bool)

(assert (=> b!682398 (=> (not res!448489) (not e!388772))))

(assert (=> b!682398 (= res!448489 e!388769)))

(declare-fun res!448490 () Bool)

(assert (=> b!682398 (=> res!448490 e!388769)))

(assert (=> b!682398 (= res!448490 e!388774)))

(declare-fun res!448494 () Bool)

(assert (=> b!682398 (=> (not res!448494) (not e!388774))))

(assert (=> b!682398 (= res!448494 (bvsgt from!3004 i!1382))))

(assert (= (and start!60858 res!448498) b!682387))

(assert (= (and b!682387 res!448495) b!682388))

(assert (= (and b!682388 res!448485) b!682381))

(assert (= (and b!682381 res!448486) b!682398))

(assert (= (and b!682398 res!448494) b!682383))

(assert (= (and b!682398 (not res!448490)) b!682389))

(assert (= (and b!682389 res!448487) b!682390))

(assert (= (and b!682398 res!448489) b!682382))

(assert (= (and b!682382 res!448496) b!682391))

(assert (= (and b!682391 res!448492) b!682386))

(assert (= (and b!682386 res!448491) b!682395))

(assert (= (and b!682395 res!448488) b!682397))

(assert (= (and b!682397 res!448493) b!682384))

(assert (= (and b!682384 res!448497) b!682393))

(assert (= (and b!682393 c!77315) b!682392))

(assert (= (and b!682393 (not c!77315)) b!682385))

(assert (= (and b!682393 c!77316) b!682396))

(assert (= (and b!682393 (not c!77316)) b!682394))

(declare-fun m!646547 () Bool)

(assert (=> b!682382 m!646547))

(declare-fun m!646549 () Bool)

(assert (=> start!60858 m!646549))

(declare-fun m!646551 () Bool)

(assert (=> b!682387 m!646551))

(declare-fun m!646553 () Bool)

(assert (=> b!682381 m!646553))

(declare-fun m!646555 () Bool)

(assert (=> b!682392 m!646555))

(declare-fun m!646557 () Bool)

(assert (=> b!682393 m!646557))

(declare-fun m!646559 () Bool)

(assert (=> b!682393 m!646559))

(declare-fun m!646561 () Bool)

(assert (=> b!682393 m!646561))

(declare-fun m!646563 () Bool)

(assert (=> b!682393 m!646563))

(declare-fun m!646565 () Bool)

(assert (=> b!682393 m!646565))

(declare-fun m!646567 () Bool)

(assert (=> b!682393 m!646567))

(declare-fun m!646569 () Bool)

(assert (=> b!682393 m!646569))

(declare-fun m!646571 () Bool)

(assert (=> b!682393 m!646571))

(assert (=> b!682393 m!646557))

(assert (=> b!682393 m!646563))

(declare-fun m!646573 () Bool)

(assert (=> b!682393 m!646573))

(declare-fun m!646575 () Bool)

(assert (=> b!682393 m!646575))

(declare-fun m!646577 () Bool)

(assert (=> b!682393 m!646577))

(declare-fun m!646579 () Bool)

(assert (=> b!682390 m!646579))

(declare-fun m!646581 () Bool)

(assert (=> b!682391 m!646581))

(declare-fun m!646583 () Bool)

(assert (=> b!682395 m!646583))

(assert (=> b!682396 m!646561))

(assert (=> b!682396 m!646563))

(declare-fun m!646585 () Bool)

(assert (=> b!682396 m!646585))

(declare-fun m!646587 () Bool)

(assert (=> b!682396 m!646587))

(assert (=> b!682396 m!646563))

(assert (=> b!682396 m!646585))

(assert (=> b!682396 m!646569))

(assert (=> b!682396 m!646577))

(assert (=> b!682383 m!646579))

(declare-fun m!646589 () Bool)

(assert (=> b!682397 m!646589))

(declare-fun m!646591 () Bool)

(assert (=> b!682388 m!646591))

(push 1)

(assert (not start!60858))

(assert (not b!682382))

(assert (not b!682396))

(assert (not b!682387))

(assert (not b!682388))

(assert (not b!682395))

(assert (not b!682392))

(assert (not b!682390))

(assert (not b!682383))

(assert (not b!682393))

(assert (not b!682397))

(assert (not b!682391))

(assert (not b!682381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

