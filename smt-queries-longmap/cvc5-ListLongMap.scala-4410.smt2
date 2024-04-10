; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60872 () Bool)

(assert start!60872)

(declare-fun b!682731 () Bool)

(declare-datatypes ((Unit!23967 0))(
  ( (Unit!23968) )
))
(declare-fun e!388985 () Unit!23967)

(declare-fun lt!313628 () Unit!23967)

(assert (=> b!682731 (= e!388985 lt!313628)))

(declare-fun lt!313631 () Unit!23967)

(declare-datatypes ((List!13001 0))(
  ( (Nil!12998) (Cons!12997 (h!14042 (_ BitVec 64)) (t!19244 List!13001)) )
))
(declare-fun acc!681 () List!13001)

(declare-fun lemmaListSubSeqRefl!0 (List!13001) Unit!23967)

(assert (=> b!682731 (= lt!313631 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!164 (List!13001 List!13001) Bool)

(assert (=> b!682731 (subseq!164 acc!681 acc!681)))

(declare-datatypes ((array!39556 0))(
  ( (array!39557 (arr!18960 (Array (_ BitVec 32) (_ BitVec 64))) (size!19324 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39556)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39556 List!13001 List!13001 (_ BitVec 32)) Unit!23967)

(declare-fun $colon$colon!329 (List!13001 (_ BitVec 64)) List!13001)

(assert (=> b!682731 (= lt!313628 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!329 acc!681 (select (arr!18960 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39556 (_ BitVec 32) List!13001) Bool)

(assert (=> b!682731 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682732 () Bool)

(declare-fun res!448673 () Bool)

(declare-fun e!388981 () Bool)

(assert (=> b!682732 (=> (not res!448673) (not e!388981))))

(declare-fun noDuplicate!825 (List!13001) Bool)

(assert (=> b!682732 (= res!448673 (noDuplicate!825 acc!681))))

(declare-fun b!682733 () Bool)

(declare-fun res!448671 () Bool)

(assert (=> b!682733 (=> (not res!448671) (not e!388981))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682733 (= res!448671 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19324 a!3626))))))

(declare-fun b!682735 () Bool)

(declare-fun res!448664 () Bool)

(assert (=> b!682735 (=> (not res!448664) (not e!388981))))

(assert (=> b!682735 (= res!448664 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12998))))

(declare-fun b!682736 () Bool)

(declare-fun res!448675 () Bool)

(assert (=> b!682736 (=> (not res!448675) (not e!388981))))

(assert (=> b!682736 (= res!448675 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682737 () Bool)

(declare-fun res!448667 () Bool)

(assert (=> b!682737 (=> (not res!448667) (not e!388981))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682737 (= res!448667 (validKeyInArray!0 k!2843))))

(declare-fun b!682738 () Bool)

(declare-fun e!388980 () Unit!23967)

(declare-fun Unit!23969 () Unit!23967)

(assert (=> b!682738 (= e!388980 Unit!23969)))

(declare-fun lt!313632 () Unit!23967)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39556 (_ BitVec 64) (_ BitVec 32)) Unit!23967)

(assert (=> b!682738 (= lt!313632 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682738 false))

(declare-fun b!682739 () Bool)

(declare-fun res!448676 () Bool)

(assert (=> b!682739 (=> (not res!448676) (not e!388981))))

(declare-fun contains!3578 (List!13001 (_ BitVec 64)) Bool)

(assert (=> b!682739 (= res!448676 (not (contains!3578 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682740 () Bool)

(declare-fun res!448668 () Bool)

(assert (=> b!682740 (=> (not res!448668) (not e!388981))))

(assert (=> b!682740 (= res!448668 (not (contains!3578 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682741 () Bool)

(declare-fun res!448666 () Bool)

(assert (=> b!682741 (=> (not res!448666) (not e!388981))))

(assert (=> b!682741 (= res!448666 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19324 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682742 () Bool)

(declare-fun res!448674 () Bool)

(assert (=> b!682742 (=> (not res!448674) (not e!388981))))

(declare-fun arrayContainsKey!0 (array!39556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682742 (= res!448674 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!448663 () Bool)

(assert (=> start!60872 (=> (not res!448663) (not e!388981))))

(assert (=> start!60872 (= res!448663 (and (bvslt (size!19324 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19324 a!3626))))))

(assert (=> start!60872 e!388981))

(assert (=> start!60872 true))

(declare-fun array_inv!14756 (array!39556) Bool)

(assert (=> start!60872 (array_inv!14756 a!3626)))

(declare-fun b!682734 () Bool)

(declare-fun res!448669 () Bool)

(assert (=> b!682734 (=> (not res!448669) (not e!388981))))

(declare-fun e!388984 () Bool)

(assert (=> b!682734 (= res!448669 e!388984)))

(declare-fun res!448665 () Bool)

(assert (=> b!682734 (=> res!448665 e!388984)))

(declare-fun e!388983 () Bool)

(assert (=> b!682734 (= res!448665 e!388983)))

(declare-fun res!448670 () Bool)

(assert (=> b!682734 (=> (not res!448670) (not e!388983))))

(assert (=> b!682734 (= res!448670 (bvsgt from!3004 i!1382))))

(declare-fun b!682743 () Bool)

(declare-fun e!388982 () Bool)

(assert (=> b!682743 (= e!388982 (not (contains!3578 acc!681 k!2843)))))

(declare-fun b!682744 () Bool)

(declare-fun Unit!23970 () Unit!23967)

(assert (=> b!682744 (= e!388980 Unit!23970)))

(declare-fun b!682745 () Bool)

(assert (=> b!682745 (= e!388984 e!388982)))

(declare-fun res!448672 () Bool)

(assert (=> b!682745 (=> (not res!448672) (not e!388982))))

(assert (=> b!682745 (= res!448672 (bvsle from!3004 i!1382))))

(declare-fun b!682746 () Bool)

(declare-fun Unit!23971 () Unit!23967)

(assert (=> b!682746 (= e!388985 Unit!23971)))

(declare-fun b!682747 () Bool)

(assert (=> b!682747 (= e!388981 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun -!129 (List!13001 (_ BitVec 64)) List!13001)

(assert (=> b!682747 (= (-!129 ($colon$colon!329 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313630 () Unit!23967)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13001) Unit!23967)

(assert (=> b!682747 (= lt!313630 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!682747 (subseq!164 acc!681 acc!681)))

(declare-fun lt!313633 () Unit!23967)

(assert (=> b!682747 (= lt!313633 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682747 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313629 () Unit!23967)

(assert (=> b!682747 (= lt!313629 e!388985)))

(declare-fun c!77402 () Bool)

(assert (=> b!682747 (= c!77402 (validKeyInArray!0 (select (arr!18960 a!3626) from!3004)))))

(declare-fun lt!313627 () Unit!23967)

(assert (=> b!682747 (= lt!313627 e!388980)))

(declare-fun c!77401 () Bool)

(assert (=> b!682747 (= c!77401 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682747 (arrayContainsKey!0 (array!39557 (store (arr!18960 a!3626) i!1382 k!2843) (size!19324 a!3626)) k!2843 from!3004)))

(declare-fun b!682748 () Bool)

(assert (=> b!682748 (= e!388983 (contains!3578 acc!681 k!2843))))

(assert (= (and start!60872 res!448663) b!682732))

(assert (= (and b!682732 res!448673) b!682740))

(assert (= (and b!682740 res!448668) b!682739))

(assert (= (and b!682739 res!448676) b!682734))

(assert (= (and b!682734 res!448670) b!682748))

(assert (= (and b!682734 (not res!448665)) b!682745))

(assert (= (and b!682745 res!448672) b!682743))

(assert (= (and b!682734 res!448669) b!682735))

(assert (= (and b!682735 res!448664) b!682736))

(assert (= (and b!682736 res!448675) b!682733))

(assert (= (and b!682733 res!448671) b!682737))

(assert (= (and b!682737 res!448667) b!682742))

(assert (= (and b!682742 res!448674) b!682741))

(assert (= (and b!682741 res!448666) b!682747))

(assert (= (and b!682747 c!77401) b!682738))

(assert (= (and b!682747 (not c!77401)) b!682744))

(assert (= (and b!682747 c!77402) b!682731))

(assert (= (and b!682747 (not c!77402)) b!682746))

(declare-fun m!647375 () Bool)

(assert (=> b!682736 m!647375))

(declare-fun m!647377 () Bool)

(assert (=> b!682731 m!647377))

(declare-fun m!647379 () Bool)

(assert (=> b!682731 m!647379))

(declare-fun m!647381 () Bool)

(assert (=> b!682731 m!647381))

(declare-fun m!647383 () Bool)

(assert (=> b!682731 m!647383))

(assert (=> b!682731 m!647379))

(assert (=> b!682731 m!647381))

(declare-fun m!647385 () Bool)

(assert (=> b!682731 m!647385))

(declare-fun m!647387 () Bool)

(assert (=> b!682731 m!647387))

(declare-fun m!647389 () Bool)

(assert (=> start!60872 m!647389))

(declare-fun m!647391 () Bool)

(assert (=> b!682732 m!647391))

(declare-fun m!647393 () Bool)

(assert (=> b!682747 m!647393))

(declare-fun m!647395 () Bool)

(assert (=> b!682747 m!647395))

(assert (=> b!682747 m!647377))

(assert (=> b!682747 m!647379))

(declare-fun m!647397 () Bool)

(assert (=> b!682747 m!647397))

(declare-fun m!647399 () Bool)

(assert (=> b!682747 m!647399))

(assert (=> b!682747 m!647385))

(declare-fun m!647401 () Bool)

(assert (=> b!682747 m!647401))

(assert (=> b!682747 m!647393))

(assert (=> b!682747 m!647379))

(declare-fun m!647403 () Bool)

(assert (=> b!682747 m!647403))

(declare-fun m!647405 () Bool)

(assert (=> b!682747 m!647405))

(assert (=> b!682747 m!647387))

(declare-fun m!647407 () Bool)

(assert (=> b!682739 m!647407))

(declare-fun m!647409 () Bool)

(assert (=> b!682743 m!647409))

(assert (=> b!682748 m!647409))

(declare-fun m!647411 () Bool)

(assert (=> b!682738 m!647411))

(declare-fun m!647413 () Bool)

(assert (=> b!682740 m!647413))

(declare-fun m!647415 () Bool)

(assert (=> b!682735 m!647415))

(declare-fun m!647417 () Bool)

(assert (=> b!682742 m!647417))

(declare-fun m!647419 () Bool)

(assert (=> b!682737 m!647419))

(push 1)

