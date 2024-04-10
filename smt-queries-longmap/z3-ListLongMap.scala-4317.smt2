; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59932 () Bool)

(assert start!59932)

(declare-fun b!664056 () Bool)

(declare-datatypes ((Unit!23135 0))(
  ( (Unit!23136) )
))
(declare-fun e!380912 () Unit!23135)

(declare-fun Unit!23137 () Unit!23135)

(assert (=> b!664056 (= e!380912 Unit!23137)))

(declare-fun b!664057 () Bool)

(declare-fun res!431817 () Bool)

(declare-fun e!380911 () Bool)

(assert (=> b!664057 (=> (not res!431817) (not e!380911))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38979 0))(
  ( (array!38980 (arr!18682 (Array (_ BitVec 32) (_ BitVec 64))) (size!19046 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38979)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664057 (= res!431817 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19046 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664059 () Bool)

(declare-fun res!431823 () Bool)

(assert (=> b!664059 (=> (not res!431823) (not e!380911))))

(declare-datatypes ((List!12723 0))(
  ( (Nil!12720) (Cons!12719 (h!13764 (_ BitVec 64)) (t!18951 List!12723)) )
))
(declare-fun acc!681 () List!12723)

(declare-fun noDuplicate!547 (List!12723) Bool)

(assert (=> b!664059 (= res!431823 (noDuplicate!547 acc!681))))

(declare-fun b!664060 () Bool)

(declare-fun res!431824 () Bool)

(assert (=> b!664060 (=> (not res!431824) (not e!380911))))

(declare-fun e!380913 () Bool)

(assert (=> b!664060 (= res!431824 e!380913)))

(declare-fun res!431820 () Bool)

(assert (=> b!664060 (=> res!431820 e!380913)))

(declare-fun e!380916 () Bool)

(assert (=> b!664060 (= res!431820 e!380916)))

(declare-fun res!431819 () Bool)

(assert (=> b!664060 (=> (not res!431819) (not e!380916))))

(assert (=> b!664060 (= res!431819 (bvsgt from!3004 i!1382))))

(declare-fun b!664061 () Bool)

(declare-fun e!380910 () Bool)

(assert (=> b!664061 (= e!380913 e!380910)))

(declare-fun res!431812 () Bool)

(assert (=> b!664061 (=> (not res!431812) (not e!380910))))

(assert (=> b!664061 (= res!431812 (bvsle from!3004 i!1382))))

(declare-fun b!664062 () Bool)

(assert (=> b!664062 (= e!380911 (not true))))

(declare-fun lt!309466 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3300 (List!12723 (_ BitVec 64)) Bool)

(assert (=> b!664062 (= lt!309466 (contains!3300 acc!681 k0!2843))))

(declare-fun subseq!39 (List!12723 List!12723) Bool)

(assert (=> b!664062 (subseq!39 acc!681 acc!681)))

(declare-fun lt!309469 () Unit!23135)

(declare-fun lemmaListSubSeqRefl!0 (List!12723) Unit!23135)

(assert (=> b!664062 (= lt!309469 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!38979 (_ BitVec 32) List!12723) Bool)

(assert (=> b!664062 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309470 () Unit!23135)

(declare-fun e!380915 () Unit!23135)

(assert (=> b!664062 (= lt!309470 e!380915)))

(declare-fun c!76489 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664062 (= c!76489 (validKeyInArray!0 (select (arr!18682 a!3626) from!3004)))))

(declare-fun lt!309468 () Unit!23135)

(assert (=> b!664062 (= lt!309468 e!380912)))

(declare-fun c!76490 () Bool)

(declare-fun arrayContainsKey!0 (array!38979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664062 (= c!76490 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664062 (arrayContainsKey!0 (array!38980 (store (arr!18682 a!3626) i!1382 k0!2843) (size!19046 a!3626)) k0!2843 from!3004)))

(declare-fun b!664063 () Bool)

(declare-fun res!431813 () Bool)

(assert (=> b!664063 (=> (not res!431813) (not e!380911))))

(assert (=> b!664063 (= res!431813 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12720))))

(declare-fun b!664064 () Bool)

(declare-fun res!431825 () Bool)

(assert (=> b!664064 (=> (not res!431825) (not e!380911))))

(assert (=> b!664064 (= res!431825 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19046 a!3626))))))

(declare-fun b!664065 () Bool)

(assert (=> b!664065 (= e!380916 (contains!3300 acc!681 k0!2843))))

(declare-fun b!664058 () Bool)

(declare-fun res!431821 () Bool)

(assert (=> b!664058 (=> (not res!431821) (not e!380911))))

(assert (=> b!664058 (= res!431821 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!431814 () Bool)

(assert (=> start!59932 (=> (not res!431814) (not e!380911))))

(assert (=> start!59932 (= res!431814 (and (bvslt (size!19046 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19046 a!3626))))))

(assert (=> start!59932 e!380911))

(assert (=> start!59932 true))

(declare-fun array_inv!14478 (array!38979) Bool)

(assert (=> start!59932 (array_inv!14478 a!3626)))

(declare-fun b!664066 () Bool)

(declare-fun res!431816 () Bool)

(assert (=> b!664066 (=> (not res!431816) (not e!380911))))

(assert (=> b!664066 (= res!431816 (not (contains!3300 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664067 () Bool)

(declare-fun res!431815 () Bool)

(assert (=> b!664067 (=> (not res!431815) (not e!380911))))

(assert (=> b!664067 (= res!431815 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664068 () Bool)

(declare-fun Unit!23138 () Unit!23135)

(assert (=> b!664068 (= e!380912 Unit!23138)))

(declare-fun lt!309471 () Unit!23135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38979 (_ BitVec 64) (_ BitVec 32)) Unit!23135)

(assert (=> b!664068 (= lt!309471 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664068 false))

(declare-fun b!664069 () Bool)

(assert (=> b!664069 (= e!380910 (not (contains!3300 acc!681 k0!2843)))))

(declare-fun b!664070 () Bool)

(declare-fun lt!309472 () Unit!23135)

(assert (=> b!664070 (= e!380915 lt!309472)))

(declare-fun lt!309467 () Unit!23135)

(assert (=> b!664070 (= lt!309467 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664070 (subseq!39 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38979 List!12723 List!12723 (_ BitVec 32)) Unit!23135)

(declare-fun $colon$colon!171 (List!12723 (_ BitVec 64)) List!12723)

(assert (=> b!664070 (= lt!309472 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!171 acc!681 (select (arr!18682 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664070 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664071 () Bool)

(declare-fun Unit!23139 () Unit!23135)

(assert (=> b!664071 (= e!380915 Unit!23139)))

(declare-fun b!664072 () Bool)

(declare-fun res!431818 () Bool)

(assert (=> b!664072 (=> (not res!431818) (not e!380911))))

(assert (=> b!664072 (= res!431818 (not (contains!3300 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664073 () Bool)

(declare-fun res!431822 () Bool)

(assert (=> b!664073 (=> (not res!431822) (not e!380911))))

(assert (=> b!664073 (= res!431822 (validKeyInArray!0 k0!2843))))

(assert (= (and start!59932 res!431814) b!664059))

(assert (= (and b!664059 res!431823) b!664066))

(assert (= (and b!664066 res!431816) b!664072))

(assert (= (and b!664072 res!431818) b!664060))

(assert (= (and b!664060 res!431819) b!664065))

(assert (= (and b!664060 (not res!431820)) b!664061))

(assert (= (and b!664061 res!431812) b!664069))

(assert (= (and b!664060 res!431824) b!664063))

(assert (= (and b!664063 res!431813) b!664058))

(assert (= (and b!664058 res!431821) b!664064))

(assert (= (and b!664064 res!431825) b!664073))

(assert (= (and b!664073 res!431822) b!664067))

(assert (= (and b!664067 res!431815) b!664057))

(assert (= (and b!664057 res!431817) b!664062))

(assert (= (and b!664062 c!76490) b!664068))

(assert (= (and b!664062 (not c!76490)) b!664056))

(assert (= (and b!664062 c!76489) b!664070))

(assert (= (and b!664062 (not c!76489)) b!664071))

(declare-fun m!635469 () Bool)

(assert (=> b!664065 m!635469))

(declare-fun m!635471 () Bool)

(assert (=> b!664066 m!635471))

(declare-fun m!635473 () Bool)

(assert (=> b!664058 m!635473))

(declare-fun m!635475 () Bool)

(assert (=> b!664072 m!635475))

(declare-fun m!635477 () Bool)

(assert (=> b!664067 m!635477))

(declare-fun m!635479 () Bool)

(assert (=> b!664073 m!635479))

(declare-fun m!635481 () Bool)

(assert (=> b!664059 m!635481))

(declare-fun m!635483 () Bool)

(assert (=> b!664070 m!635483))

(declare-fun m!635485 () Bool)

(assert (=> b!664070 m!635485))

(declare-fun m!635487 () Bool)

(assert (=> b!664070 m!635487))

(declare-fun m!635489 () Bool)

(assert (=> b!664070 m!635489))

(assert (=> b!664070 m!635485))

(assert (=> b!664070 m!635487))

(declare-fun m!635491 () Bool)

(assert (=> b!664070 m!635491))

(declare-fun m!635493 () Bool)

(assert (=> b!664070 m!635493))

(assert (=> b!664069 m!635469))

(assert (=> b!664062 m!635483))

(assert (=> b!664062 m!635485))

(assert (=> b!664062 m!635469))

(declare-fun m!635495 () Bool)

(assert (=> b!664062 m!635495))

(assert (=> b!664062 m!635491))

(declare-fun m!635497 () Bool)

(assert (=> b!664062 m!635497))

(assert (=> b!664062 m!635485))

(declare-fun m!635499 () Bool)

(assert (=> b!664062 m!635499))

(declare-fun m!635501 () Bool)

(assert (=> b!664062 m!635501))

(assert (=> b!664062 m!635493))

(declare-fun m!635503 () Bool)

(assert (=> b!664068 m!635503))

(declare-fun m!635505 () Bool)

(assert (=> start!59932 m!635505))

(declare-fun m!635507 () Bool)

(assert (=> b!664063 m!635507))

(check-sat (not b!664069) (not start!59932) (not b!664063) (not b!664066) (not b!664072) (not b!664073) (not b!664065) (not b!664058) (not b!664062) (not b!664068) (not b!664070) (not b!664067) (not b!664059))
