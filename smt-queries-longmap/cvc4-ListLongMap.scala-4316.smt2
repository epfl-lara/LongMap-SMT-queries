; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59928 () Bool)

(assert start!59928)

(declare-fun b!663948 () Bool)

(declare-fun res!431730 () Bool)

(declare-fun e!380873 () Bool)

(assert (=> b!663948 (=> (not res!431730) (not e!380873))))

(declare-datatypes ((List!12721 0))(
  ( (Nil!12718) (Cons!12717 (h!13762 (_ BitVec 64)) (t!18949 List!12721)) )
))
(declare-fun acc!681 () List!12721)

(declare-fun contains!3298 (List!12721 (_ BitVec 64)) Bool)

(assert (=> b!663948 (= res!431730 (not (contains!3298 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663949 () Bool)

(declare-fun e!380872 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!663949 (= e!380872 (not (contains!3298 acc!681 k!2843)))))

(declare-fun b!663950 () Bool)

(declare-fun res!431741 () Bool)

(assert (=> b!663950 (=> (not res!431741) (not e!380873))))

(declare-datatypes ((array!38975 0))(
  ( (array!38976 (arr!18680 (Array (_ BitVec 32) (_ BitVec 64))) (size!19044 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38975)

(declare-fun arrayNoDuplicates!0 (array!38975 (_ BitVec 32) List!12721) Bool)

(assert (=> b!663950 (= res!431741 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12718))))

(declare-fun b!663951 () Bool)

(declare-fun res!431733 () Bool)

(assert (=> b!663951 (=> (not res!431733) (not e!380873))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!663951 (= res!431733 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19044 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663952 () Bool)

(assert (=> b!663952 (= e!380873 (not true))))

(declare-datatypes ((Unit!23125 0))(
  ( (Unit!23126) )
))
(declare-fun lt!309427 () Unit!23125)

(declare-fun e!380870 () Unit!23125)

(assert (=> b!663952 (= lt!309427 e!380870)))

(declare-fun c!76477 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663952 (= c!76477 (validKeyInArray!0 (select (arr!18680 a!3626) from!3004)))))

(declare-fun lt!309428 () Unit!23125)

(declare-fun e!380869 () Unit!23125)

(assert (=> b!663952 (= lt!309428 e!380869)))

(declare-fun c!76478 () Bool)

(declare-fun arrayContainsKey!0 (array!38975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663952 (= c!76478 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663952 (arrayContainsKey!0 (array!38976 (store (arr!18680 a!3626) i!1382 k!2843) (size!19044 a!3626)) k!2843 from!3004)))

(declare-fun b!663953 () Bool)

(declare-fun res!431734 () Bool)

(assert (=> b!663953 (=> (not res!431734) (not e!380873))))

(declare-fun noDuplicate!545 (List!12721) Bool)

(assert (=> b!663953 (= res!431734 (noDuplicate!545 acc!681))))

(declare-fun b!663954 () Bool)

(declare-fun e!380871 () Bool)

(assert (=> b!663954 (= e!380871 e!380872)))

(declare-fun res!431738 () Bool)

(assert (=> b!663954 (=> (not res!431738) (not e!380872))))

(assert (=> b!663954 (= res!431738 (bvsle from!3004 i!1382))))

(declare-fun b!663955 () Bool)

(declare-fun Unit!23127 () Unit!23125)

(assert (=> b!663955 (= e!380869 Unit!23127)))

(declare-fun lt!309430 () Unit!23125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38975 (_ BitVec 64) (_ BitVec 32)) Unit!23125)

(assert (=> b!663955 (= lt!309430 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663955 false))

(declare-fun b!663956 () Bool)

(declare-fun res!431732 () Bool)

(assert (=> b!663956 (=> (not res!431732) (not e!380873))))

(assert (=> b!663956 (= res!431732 e!380871)))

(declare-fun res!431739 () Bool)

(assert (=> b!663956 (=> res!431739 e!380871)))

(declare-fun e!380868 () Bool)

(assert (=> b!663956 (= res!431739 e!380868)))

(declare-fun res!431729 () Bool)

(assert (=> b!663956 (=> (not res!431729) (not e!380868))))

(assert (=> b!663956 (= res!431729 (bvsgt from!3004 i!1382))))

(declare-fun res!431737 () Bool)

(assert (=> start!59928 (=> (not res!431737) (not e!380873))))

(assert (=> start!59928 (= res!431737 (and (bvslt (size!19044 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19044 a!3626))))))

(assert (=> start!59928 e!380873))

(assert (=> start!59928 true))

(declare-fun array_inv!14476 (array!38975) Bool)

(assert (=> start!59928 (array_inv!14476 a!3626)))

(declare-fun b!663957 () Bool)

(declare-fun res!431740 () Bool)

(assert (=> b!663957 (=> (not res!431740) (not e!380873))))

(assert (=> b!663957 (= res!431740 (validKeyInArray!0 k!2843))))

(declare-fun b!663958 () Bool)

(declare-fun res!431731 () Bool)

(assert (=> b!663958 (=> (not res!431731) (not e!380873))))

(assert (=> b!663958 (= res!431731 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663959 () Bool)

(declare-fun res!431735 () Bool)

(assert (=> b!663959 (=> (not res!431735) (not e!380873))))

(assert (=> b!663959 (= res!431735 (not (contains!3298 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663960 () Bool)

(assert (=> b!663960 (= e!380868 (contains!3298 acc!681 k!2843))))

(declare-fun b!663961 () Bool)

(declare-fun Unit!23128 () Unit!23125)

(assert (=> b!663961 (= e!380869 Unit!23128)))

(declare-fun b!663962 () Bool)

(declare-fun res!431736 () Bool)

(assert (=> b!663962 (=> (not res!431736) (not e!380873))))

(assert (=> b!663962 (= res!431736 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19044 a!3626))))))

(declare-fun b!663963 () Bool)

(declare-fun res!431728 () Bool)

(assert (=> b!663963 (=> (not res!431728) (not e!380873))))

(assert (=> b!663963 (= res!431728 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663964 () Bool)

(declare-fun lt!309426 () Unit!23125)

(assert (=> b!663964 (= e!380870 lt!309426)))

(declare-fun lt!309429 () Unit!23125)

(declare-fun lemmaListSubSeqRefl!0 (List!12721) Unit!23125)

(assert (=> b!663964 (= lt!309429 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!37 (List!12721 List!12721) Bool)

(assert (=> b!663964 (subseq!37 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38975 List!12721 List!12721 (_ BitVec 32)) Unit!23125)

(declare-fun $colon$colon!169 (List!12721 (_ BitVec 64)) List!12721)

(assert (=> b!663964 (= lt!309426 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!169 acc!681 (select (arr!18680 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663964 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663965 () Bool)

(declare-fun Unit!23129 () Unit!23125)

(assert (=> b!663965 (= e!380870 Unit!23129)))

(assert (= (and start!59928 res!431737) b!663953))

(assert (= (and b!663953 res!431734) b!663959))

(assert (= (and b!663959 res!431735) b!663948))

(assert (= (and b!663948 res!431730) b!663956))

(assert (= (and b!663956 res!431729) b!663960))

(assert (= (and b!663956 (not res!431739)) b!663954))

(assert (= (and b!663954 res!431738) b!663949))

(assert (= (and b!663956 res!431732) b!663950))

(assert (= (and b!663950 res!431741) b!663958))

(assert (= (and b!663958 res!431731) b!663962))

(assert (= (and b!663962 res!431736) b!663957))

(assert (= (and b!663957 res!431740) b!663963))

(assert (= (and b!663963 res!431728) b!663951))

(assert (= (and b!663951 res!431733) b!663952))

(assert (= (and b!663952 c!76478) b!663955))

(assert (= (and b!663952 (not c!76478)) b!663961))

(assert (= (and b!663952 c!76477) b!663964))

(assert (= (and b!663952 (not c!76477)) b!663965))

(declare-fun m!635389 () Bool)

(assert (=> b!663958 m!635389))

(declare-fun m!635391 () Bool)

(assert (=> b!663948 m!635391))

(declare-fun m!635393 () Bool)

(assert (=> b!663952 m!635393))

(declare-fun m!635395 () Bool)

(assert (=> b!663952 m!635395))

(declare-fun m!635397 () Bool)

(assert (=> b!663952 m!635397))

(assert (=> b!663952 m!635393))

(declare-fun m!635399 () Bool)

(assert (=> b!663952 m!635399))

(declare-fun m!635401 () Bool)

(assert (=> b!663952 m!635401))

(declare-fun m!635403 () Bool)

(assert (=> b!663949 m!635403))

(declare-fun m!635405 () Bool)

(assert (=> b!663957 m!635405))

(declare-fun m!635407 () Bool)

(assert (=> b!663959 m!635407))

(declare-fun m!635409 () Bool)

(assert (=> b!663950 m!635409))

(assert (=> b!663960 m!635403))

(declare-fun m!635411 () Bool)

(assert (=> b!663953 m!635411))

(declare-fun m!635413 () Bool)

(assert (=> b!663964 m!635413))

(assert (=> b!663964 m!635393))

(declare-fun m!635415 () Bool)

(assert (=> b!663964 m!635415))

(declare-fun m!635417 () Bool)

(assert (=> b!663964 m!635417))

(assert (=> b!663964 m!635393))

(assert (=> b!663964 m!635415))

(declare-fun m!635419 () Bool)

(assert (=> b!663964 m!635419))

(declare-fun m!635421 () Bool)

(assert (=> b!663964 m!635421))

(declare-fun m!635423 () Bool)

(assert (=> b!663955 m!635423))

(declare-fun m!635425 () Bool)

(assert (=> start!59928 m!635425))

(declare-fun m!635427 () Bool)

(assert (=> b!663963 m!635427))

(push 1)

(assert (not b!663953))

(assert (not b!663963))

(assert (not start!59928))

(assert (not b!663952))

(assert (not b!663959))

(assert (not b!663957))

(assert (not b!663949))

(assert (not b!663948))

(assert (not b!663960))

(assert (not b!663955))

(assert (not b!663958))

(assert (not b!663964))

(assert (not b!663950))

(check-sat)

