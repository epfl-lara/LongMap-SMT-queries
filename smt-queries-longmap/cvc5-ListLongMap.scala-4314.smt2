; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59912 () Bool)

(assert start!59912)

(declare-fun b!663516 () Bool)

(declare-fun res!431400 () Bool)

(declare-fun e!380703 () Bool)

(assert (=> b!663516 (=> (not res!431400) (not e!380703))))

(declare-datatypes ((array!38959 0))(
  ( (array!38960 (arr!18672 (Array (_ BitVec 32) (_ BitVec 64))) (size!19036 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38959)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12713 0))(
  ( (Nil!12710) (Cons!12709 (h!13754 (_ BitVec 64)) (t!18941 List!12713)) )
))
(declare-fun acc!681 () List!12713)

(declare-fun arrayNoDuplicates!0 (array!38959 (_ BitVec 32) List!12713) Bool)

(assert (=> b!663516 (= res!431400 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663517 () Bool)

(declare-fun res!431403 () Bool)

(assert (=> b!663517 (=> (not res!431403) (not e!380703))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663517 (= res!431403 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19036 a!3626))))))

(declare-fun b!663518 () Bool)

(declare-fun e!380701 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3290 (List!12713 (_ BitVec 64)) Bool)

(assert (=> b!663518 (= e!380701 (contains!3290 acc!681 k!2843))))

(declare-fun b!663519 () Bool)

(declare-fun res!431393 () Bool)

(assert (=> b!663519 (=> (not res!431393) (not e!380703))))

(assert (=> b!663519 (= res!431393 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19036 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663520 () Bool)

(declare-fun res!431398 () Bool)

(assert (=> b!663520 (=> (not res!431398) (not e!380703))))

(declare-fun e!380705 () Bool)

(assert (=> b!663520 (= res!431398 e!380705)))

(declare-fun res!431394 () Bool)

(assert (=> b!663520 (=> res!431394 e!380705)))

(assert (=> b!663520 (= res!431394 e!380701)))

(declare-fun res!431399 () Bool)

(assert (=> b!663520 (=> (not res!431399) (not e!380701))))

(assert (=> b!663520 (= res!431399 (bvsgt from!3004 i!1382))))

(declare-fun b!663521 () Bool)

(declare-fun res!431392 () Bool)

(assert (=> b!663521 (=> (not res!431392) (not e!380703))))

(assert (=> b!663521 (= res!431392 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12710))))

(declare-fun b!663522 () Bool)

(declare-fun res!431405 () Bool)

(assert (=> b!663522 (=> (not res!431405) (not e!380703))))

(assert (=> b!663522 (= res!431405 (not (contains!3290 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663523 () Bool)

(declare-datatypes ((Unit!23085 0))(
  ( (Unit!23086) )
))
(declare-fun e!380704 () Unit!23085)

(declare-fun Unit!23087 () Unit!23085)

(assert (=> b!663523 (= e!380704 Unit!23087)))

(declare-fun b!663525 () Bool)

(declare-fun e!380706 () Unit!23085)

(declare-fun Unit!23088 () Unit!23085)

(assert (=> b!663525 (= e!380706 Unit!23088)))

(declare-fun lt!309310 () Unit!23085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38959 (_ BitVec 64) (_ BitVec 32)) Unit!23085)

(assert (=> b!663525 (= lt!309310 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663525 false))

(declare-fun b!663526 () Bool)

(declare-fun e!380700 () Bool)

(assert (=> b!663526 (= e!380705 e!380700)))

(declare-fun res!431402 () Bool)

(assert (=> b!663526 (=> (not res!431402) (not e!380700))))

(assert (=> b!663526 (= res!431402 (bvsle from!3004 i!1382))))

(declare-fun b!663527 () Bool)

(declare-fun Unit!23089 () Unit!23085)

(assert (=> b!663527 (= e!380706 Unit!23089)))

(declare-fun b!663528 () Bool)

(assert (=> b!663528 (= e!380700 (not (contains!3290 acc!681 k!2843)))))

(declare-fun b!663529 () Bool)

(declare-fun res!431396 () Bool)

(assert (=> b!663529 (=> (not res!431396) (not e!380703))))

(declare-fun arrayContainsKey!0 (array!38959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663529 (= res!431396 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663530 () Bool)

(declare-fun lt!309308 () Unit!23085)

(assert (=> b!663530 (= e!380704 lt!309308)))

(declare-fun lt!309306 () Unit!23085)

(declare-fun lemmaListSubSeqRefl!0 (List!12713) Unit!23085)

(assert (=> b!663530 (= lt!309306 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!29 (List!12713 List!12713) Bool)

(assert (=> b!663530 (subseq!29 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38959 List!12713 List!12713 (_ BitVec 32)) Unit!23085)

(declare-fun $colon$colon!161 (List!12713 (_ BitVec 64)) List!12713)

(assert (=> b!663530 (= lt!309308 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!161 acc!681 (select (arr!18672 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663530 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!431404 () Bool)

(assert (=> start!59912 (=> (not res!431404) (not e!380703))))

(assert (=> start!59912 (= res!431404 (and (bvslt (size!19036 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19036 a!3626))))))

(assert (=> start!59912 e!380703))

(assert (=> start!59912 true))

(declare-fun array_inv!14468 (array!38959) Bool)

(assert (=> start!59912 (array_inv!14468 a!3626)))

(declare-fun b!663524 () Bool)

(declare-fun res!431397 () Bool)

(assert (=> b!663524 (=> (not res!431397) (not e!380703))))

(assert (=> b!663524 (= res!431397 (not (contains!3290 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663531 () Bool)

(declare-fun res!431395 () Bool)

(assert (=> b!663531 (=> (not res!431395) (not e!380703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663531 (= res!431395 (validKeyInArray!0 k!2843))))

(declare-fun b!663532 () Bool)

(assert (=> b!663532 (= e!380703 (not true))))

(declare-fun lt!309309 () Unit!23085)

(assert (=> b!663532 (= lt!309309 e!380704)))

(declare-fun c!76430 () Bool)

(assert (=> b!663532 (= c!76430 (validKeyInArray!0 (select (arr!18672 a!3626) from!3004)))))

(declare-fun lt!309307 () Unit!23085)

(assert (=> b!663532 (= lt!309307 e!380706)))

(declare-fun c!76429 () Bool)

(assert (=> b!663532 (= c!76429 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663532 (arrayContainsKey!0 (array!38960 (store (arr!18672 a!3626) i!1382 k!2843) (size!19036 a!3626)) k!2843 from!3004)))

(declare-fun b!663533 () Bool)

(declare-fun res!431401 () Bool)

(assert (=> b!663533 (=> (not res!431401) (not e!380703))))

(declare-fun noDuplicate!537 (List!12713) Bool)

(assert (=> b!663533 (= res!431401 (noDuplicate!537 acc!681))))

(assert (= (and start!59912 res!431404) b!663533))

(assert (= (and b!663533 res!431401) b!663524))

(assert (= (and b!663524 res!431397) b!663522))

(assert (= (and b!663522 res!431405) b!663520))

(assert (= (and b!663520 res!431399) b!663518))

(assert (= (and b!663520 (not res!431394)) b!663526))

(assert (= (and b!663526 res!431402) b!663528))

(assert (= (and b!663520 res!431398) b!663521))

(assert (= (and b!663521 res!431392) b!663516))

(assert (= (and b!663516 res!431400) b!663517))

(assert (= (and b!663517 res!431403) b!663531))

(assert (= (and b!663531 res!431395) b!663529))

(assert (= (and b!663529 res!431396) b!663519))

(assert (= (and b!663519 res!431393) b!663532))

(assert (= (and b!663532 c!76429) b!663525))

(assert (= (and b!663532 (not c!76429)) b!663527))

(assert (= (and b!663532 c!76430) b!663530))

(assert (= (and b!663532 (not c!76430)) b!663523))

(declare-fun m!635069 () Bool)

(assert (=> b!663529 m!635069))

(declare-fun m!635071 () Bool)

(assert (=> b!663524 m!635071))

(declare-fun m!635073 () Bool)

(assert (=> b!663525 m!635073))

(declare-fun m!635075 () Bool)

(assert (=> b!663531 m!635075))

(declare-fun m!635077 () Bool)

(assert (=> b!663521 m!635077))

(declare-fun m!635079 () Bool)

(assert (=> start!59912 m!635079))

(declare-fun m!635081 () Bool)

(assert (=> b!663516 m!635081))

(declare-fun m!635083 () Bool)

(assert (=> b!663518 m!635083))

(assert (=> b!663528 m!635083))

(declare-fun m!635085 () Bool)

(assert (=> b!663533 m!635085))

(declare-fun m!635087 () Bool)

(assert (=> b!663532 m!635087))

(declare-fun m!635089 () Bool)

(assert (=> b!663532 m!635089))

(declare-fun m!635091 () Bool)

(assert (=> b!663532 m!635091))

(assert (=> b!663532 m!635087))

(declare-fun m!635093 () Bool)

(assert (=> b!663532 m!635093))

(declare-fun m!635095 () Bool)

(assert (=> b!663532 m!635095))

(declare-fun m!635097 () Bool)

(assert (=> b!663530 m!635097))

(assert (=> b!663530 m!635087))

(declare-fun m!635099 () Bool)

(assert (=> b!663530 m!635099))

(declare-fun m!635101 () Bool)

(assert (=> b!663530 m!635101))

(assert (=> b!663530 m!635087))

(assert (=> b!663530 m!635099))

(declare-fun m!635103 () Bool)

(assert (=> b!663530 m!635103))

(declare-fun m!635105 () Bool)

(assert (=> b!663530 m!635105))

(declare-fun m!635107 () Bool)

(assert (=> b!663522 m!635107))

(push 1)

(assert (not b!663524))

(assert (not b!663531))

(assert (not b!663533))

(assert (not start!59912))

(assert (not b!663521))

(assert (not b!663516))

(assert (not b!663532))

(assert (not b!663528))

(assert (not b!663529))

(assert (not b!663522))

(assert (not b!663530))

(assert (not b!663525))

(assert (not b!663518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

