; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60930 () Bool)

(assert start!60930)

(declare-fun b!682955 () Bool)

(declare-fun res!448780 () Bool)

(declare-fun e!389122 () Bool)

(assert (=> b!682955 (=> (not res!448780) (not e!389122))))

(declare-datatypes ((List!12903 0))(
  ( (Nil!12900) (Cons!12899 (h!13947 (_ BitVec 64)) (t!19138 List!12903)) )
))
(declare-fun acc!681 () List!12903)

(declare-fun contains!3555 (List!12903 (_ BitVec 64)) Bool)

(assert (=> b!682955 (= res!448780 (not (contains!3555 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682956 () Bool)

(declare-fun res!448786 () Bool)

(assert (=> b!682956 (=> (not res!448786) (not e!389122))))

(assert (=> b!682956 (= res!448786 (not (contains!3555 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682957 () Bool)

(declare-fun res!448782 () Bool)

(assert (=> b!682957 (=> (not res!448782) (not e!389122))))

(declare-datatypes ((array!39552 0))(
  ( (array!39553 (arr!18955 (Array (_ BitVec 32) (_ BitVec 64))) (size!19319 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39552)

(declare-fun arrayNoDuplicates!0 (array!39552 (_ BitVec 32) List!12903) Bool)

(assert (=> b!682957 (= res!448782 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12900))))

(declare-fun b!682958 () Bool)

(declare-fun res!448789 () Bool)

(assert (=> b!682958 (=> (not res!448789) (not e!389122))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682958 (= res!448789 (validKeyInArray!0 k0!2843))))

(declare-fun b!682959 () Bool)

(declare-fun res!448788 () Bool)

(assert (=> b!682959 (=> (not res!448788) (not e!389122))))

(declare-fun arrayContainsKey!0 (array!39552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682959 (= res!448788 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682960 () Bool)

(declare-datatypes ((Unit!23946 0))(
  ( (Unit!23947) )
))
(declare-fun e!389124 () Unit!23946)

(declare-fun Unit!23948 () Unit!23946)

(assert (=> b!682960 (= e!389124 Unit!23948)))

(declare-fun b!682961 () Bool)

(declare-fun res!448776 () Bool)

(assert (=> b!682961 (=> (not res!448776) (not e!389122))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682961 (= res!448776 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19319 a!3626))))))

(declare-fun b!682962 () Bool)

(declare-fun res!448784 () Bool)

(assert (=> b!682962 (=> (not res!448784) (not e!389122))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!682962 (= res!448784 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682963 () Bool)

(declare-fun e!389123 () Bool)

(assert (=> b!682963 (= e!389123 (not (contains!3555 acc!681 k0!2843)))))

(declare-fun b!682964 () Bool)

(declare-fun res!448777 () Bool)

(assert (=> b!682964 (=> (not res!448777) (not e!389122))))

(declare-fun e!389127 () Bool)

(assert (=> b!682964 (= res!448777 e!389127)))

(declare-fun res!448781 () Bool)

(assert (=> b!682964 (=> res!448781 e!389127)))

(declare-fun e!389125 () Bool)

(assert (=> b!682964 (= res!448781 e!389125)))

(declare-fun res!448778 () Bool)

(assert (=> b!682964 (=> (not res!448778) (not e!389125))))

(assert (=> b!682964 (= res!448778 (bvsgt from!3004 i!1382))))

(declare-fun res!448787 () Bool)

(assert (=> start!60930 (=> (not res!448787) (not e!389122))))

(assert (=> start!60930 (= res!448787 (and (bvslt (size!19319 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19319 a!3626))))))

(assert (=> start!60930 e!389122))

(assert (=> start!60930 true))

(declare-fun array_inv!14814 (array!39552) Bool)

(assert (=> start!60930 (array_inv!14814 a!3626)))

(declare-fun b!682965 () Bool)

(assert (=> b!682965 (= e!389122 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun -!128 (List!12903 (_ BitVec 64)) List!12903)

(declare-fun $colon$colon!326 (List!12903 (_ BitVec 64)) List!12903)

(assert (=> b!682965 (= (-!128 ($colon$colon!326 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!313735 () Unit!23946)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12903) Unit!23946)

(assert (=> b!682965 (= lt!313735 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!164 (List!12903 List!12903) Bool)

(assert (=> b!682965 (subseq!164 acc!681 acc!681)))

(declare-fun lt!313734 () Unit!23946)

(declare-fun lemmaListSubSeqRefl!0 (List!12903) Unit!23946)

(assert (=> b!682965 (= lt!313734 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682965 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313731 () Unit!23946)

(declare-fun e!389121 () Unit!23946)

(assert (=> b!682965 (= lt!313731 e!389121)))

(declare-fun c!77458 () Bool)

(assert (=> b!682965 (= c!77458 (validKeyInArray!0 (select (arr!18955 a!3626) from!3004)))))

(declare-fun lt!313732 () Unit!23946)

(assert (=> b!682965 (= lt!313732 e!389124)))

(declare-fun c!77459 () Bool)

(assert (=> b!682965 (= c!77459 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682965 (arrayContainsKey!0 (array!39553 (store (arr!18955 a!3626) i!1382 k0!2843) (size!19319 a!3626)) k0!2843 from!3004)))

(declare-fun b!682966 () Bool)

(declare-fun Unit!23949 () Unit!23946)

(assert (=> b!682966 (= e!389124 Unit!23949)))

(declare-fun lt!313733 () Unit!23946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39552 (_ BitVec 64) (_ BitVec 32)) Unit!23946)

(assert (=> b!682966 (= lt!313733 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682966 false))

(declare-fun b!682967 () Bool)

(declare-fun Unit!23950 () Unit!23946)

(assert (=> b!682967 (= e!389121 Unit!23950)))

(declare-fun b!682968 () Bool)

(declare-fun lt!313730 () Unit!23946)

(assert (=> b!682968 (= e!389121 lt!313730)))

(declare-fun lt!313729 () Unit!23946)

(assert (=> b!682968 (= lt!313729 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682968 (subseq!164 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39552 List!12903 List!12903 (_ BitVec 32)) Unit!23946)

(assert (=> b!682968 (= lt!313730 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!326 acc!681 (select (arr!18955 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682968 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682969 () Bool)

(declare-fun res!448783 () Bool)

(assert (=> b!682969 (=> (not res!448783) (not e!389122))))

(declare-fun noDuplicate!829 (List!12903) Bool)

(assert (=> b!682969 (= res!448783 (noDuplicate!829 acc!681))))

(declare-fun b!682970 () Bool)

(assert (=> b!682970 (= e!389125 (contains!3555 acc!681 k0!2843))))

(declare-fun b!682971 () Bool)

(assert (=> b!682971 (= e!389127 e!389123)))

(declare-fun res!448779 () Bool)

(assert (=> b!682971 (=> (not res!448779) (not e!389123))))

(assert (=> b!682971 (= res!448779 (bvsle from!3004 i!1382))))

(declare-fun b!682972 () Bool)

(declare-fun res!448785 () Bool)

(assert (=> b!682972 (=> (not res!448785) (not e!389122))))

(assert (=> b!682972 (= res!448785 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19319 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!60930 res!448787) b!682969))

(assert (= (and b!682969 res!448783) b!682956))

(assert (= (and b!682956 res!448786) b!682955))

(assert (= (and b!682955 res!448780) b!682964))

(assert (= (and b!682964 res!448778) b!682970))

(assert (= (and b!682964 (not res!448781)) b!682971))

(assert (= (and b!682971 res!448779) b!682963))

(assert (= (and b!682964 res!448777) b!682957))

(assert (= (and b!682957 res!448782) b!682962))

(assert (= (and b!682962 res!448784) b!682961))

(assert (= (and b!682961 res!448776) b!682958))

(assert (= (and b!682958 res!448789) b!682959))

(assert (= (and b!682959 res!448788) b!682972))

(assert (= (and b!682972 res!448785) b!682965))

(assert (= (and b!682965 c!77459) b!682966))

(assert (= (and b!682965 (not c!77459)) b!682960))

(assert (= (and b!682965 c!77458) b!682968))

(assert (= (and b!682965 (not c!77458)) b!682967))

(declare-fun m!648073 () Bool)

(assert (=> b!682958 m!648073))

(declare-fun m!648075 () Bool)

(assert (=> b!682963 m!648075))

(declare-fun m!648077 () Bool)

(assert (=> b!682965 m!648077))

(declare-fun m!648079 () Bool)

(assert (=> b!682965 m!648079))

(declare-fun m!648081 () Bool)

(assert (=> b!682965 m!648081))

(declare-fun m!648083 () Bool)

(assert (=> b!682965 m!648083))

(declare-fun m!648085 () Bool)

(assert (=> b!682965 m!648085))

(declare-fun m!648087 () Bool)

(assert (=> b!682965 m!648087))

(declare-fun m!648089 () Bool)

(assert (=> b!682965 m!648089))

(declare-fun m!648091 () Bool)

(assert (=> b!682965 m!648091))

(assert (=> b!682965 m!648077))

(assert (=> b!682965 m!648083))

(declare-fun m!648093 () Bool)

(assert (=> b!682965 m!648093))

(declare-fun m!648095 () Bool)

(assert (=> b!682965 m!648095))

(declare-fun m!648097 () Bool)

(assert (=> b!682965 m!648097))

(declare-fun m!648099 () Bool)

(assert (=> b!682959 m!648099))

(declare-fun m!648101 () Bool)

(assert (=> b!682962 m!648101))

(declare-fun m!648103 () Bool)

(assert (=> b!682955 m!648103))

(declare-fun m!648105 () Bool)

(assert (=> b!682966 m!648105))

(declare-fun m!648107 () Bool)

(assert (=> b!682956 m!648107))

(declare-fun m!648109 () Bool)

(assert (=> b!682969 m!648109))

(declare-fun m!648111 () Bool)

(assert (=> start!60930 m!648111))

(assert (=> b!682968 m!648081))

(assert (=> b!682968 m!648083))

(declare-fun m!648113 () Bool)

(assert (=> b!682968 m!648113))

(declare-fun m!648115 () Bool)

(assert (=> b!682968 m!648115))

(assert (=> b!682968 m!648083))

(assert (=> b!682968 m!648113))

(assert (=> b!682968 m!648089))

(assert (=> b!682968 m!648097))

(declare-fun m!648117 () Bool)

(assert (=> b!682957 m!648117))

(assert (=> b!682970 m!648075))

(check-sat (not b!682969) (not b!682958) (not b!682962) (not b!682968) (not b!682955) (not b!682970) (not b!682957) (not b!682956) (not start!60930) (not b!682965) (not b!682963) (not b!682959) (not b!682966))
(check-sat)
