; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61550 () Bool)

(assert start!61550)

(declare-fun b!688043 () Bool)

(declare-fun res!452828 () Bool)

(declare-fun e!391935 () Bool)

(assert (=> b!688043 (=> (not res!452828) (not e!391935))))

(declare-datatypes ((List!13058 0))(
  ( (Nil!13055) (Cons!13054 (h!14099 (_ BitVec 64)) (t!19322 List!13058)) )
))
(declare-fun acc!681 () List!13058)

(declare-fun noDuplicate!882 (List!13058) Bool)

(assert (=> b!688043 (= res!452828 (noDuplicate!882 acc!681))))

(declare-fun b!688044 () Bool)

(declare-fun e!391938 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3635 (List!13058 (_ BitVec 64)) Bool)

(assert (=> b!688044 (= e!391938 (not (contains!3635 acc!681 k!2843)))))

(declare-fun b!688045 () Bool)

(declare-fun res!452821 () Bool)

(declare-fun e!391936 () Bool)

(assert (=> b!688045 (=> res!452821 e!391936)))

(declare-fun lt!315611 () List!13058)

(assert (=> b!688045 (= res!452821 (contains!3635 lt!315611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688046 () Bool)

(declare-fun res!452825 () Bool)

(assert (=> b!688046 (=> (not res!452825) (not e!391935))))

(assert (=> b!688046 (= res!452825 (not (contains!3635 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688047 () Bool)

(declare-fun res!452830 () Bool)

(assert (=> b!688047 (=> res!452830 e!391936)))

(assert (=> b!688047 (= res!452830 (contains!3635 lt!315611 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688048 () Bool)

(declare-datatypes ((Unit!24252 0))(
  ( (Unit!24253) )
))
(declare-fun e!391937 () Unit!24252)

(declare-fun Unit!24254 () Unit!24252)

(assert (=> b!688048 (= e!391937 Unit!24254)))

(declare-fun b!688049 () Bool)

(declare-fun e!391943 () Bool)

(assert (=> b!688049 (= e!391943 (contains!3635 acc!681 k!2843))))

(declare-fun b!688050 () Bool)

(declare-fun res!452816 () Bool)

(assert (=> b!688050 (=> (not res!452816) (not e!391935))))

(declare-datatypes ((array!39691 0))(
  ( (array!39692 (arr!19017 (Array (_ BitVec 32) (_ BitVec 64))) (size!19399 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39691)

(declare-fun arrayContainsKey!0 (array!39691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688050 (= res!452816 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688051 () Bool)

(declare-fun e!391942 () Bool)

(assert (=> b!688051 (= e!391942 (contains!3635 lt!315611 k!2843))))

(declare-fun b!688052 () Bool)

(declare-fun res!452822 () Bool)

(assert (=> b!688052 (=> (not res!452822) (not e!391935))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39691 (_ BitVec 32) List!13058) Bool)

(assert (=> b!688052 (= res!452822 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688053 () Bool)

(declare-fun res!452823 () Bool)

(assert (=> b!688053 (=> (not res!452823) (not e!391935))))

(assert (=> b!688053 (= res!452823 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13055))))

(declare-fun b!688054 () Bool)

(declare-fun e!391941 () Bool)

(assert (=> b!688054 (= e!391941 e!391938)))

(declare-fun res!452817 () Bool)

(assert (=> b!688054 (=> (not res!452817) (not e!391938))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688054 (= res!452817 (bvsle from!3004 i!1382))))

(declare-fun b!688055 () Bool)

(declare-fun res!452813 () Bool)

(assert (=> b!688055 (=> (not res!452813) (not e!391935))))

(assert (=> b!688055 (= res!452813 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19399 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!452829 () Bool)

(assert (=> start!61550 (=> (not res!452829) (not e!391935))))

(assert (=> start!61550 (= res!452829 (and (bvslt (size!19399 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19399 a!3626))))))

(assert (=> start!61550 e!391935))

(assert (=> start!61550 true))

(declare-fun array_inv!14813 (array!39691) Bool)

(assert (=> start!61550 (array_inv!14813 a!3626)))

(declare-fun b!688056 () Bool)

(declare-fun lt!315615 () Unit!24252)

(assert (=> b!688056 (= e!391937 lt!315615)))

(declare-fun lt!315612 () Unit!24252)

(declare-fun lemmaListSubSeqRefl!0 (List!13058) Unit!24252)

(assert (=> b!688056 (= lt!315612 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!221 (List!13058 List!13058) Bool)

(assert (=> b!688056 (subseq!221 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39691 List!13058 List!13058 (_ BitVec 32)) Unit!24252)

(declare-fun $colon$colon!386 (List!13058 (_ BitVec 64)) List!13058)

(assert (=> b!688056 (= lt!315615 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!386 acc!681 (select (arr!19017 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688056 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688057 () Bool)

(assert (=> b!688057 (= e!391935 (not e!391936))))

(declare-fun res!452827 () Bool)

(assert (=> b!688057 (=> res!452827 e!391936)))

(assert (=> b!688057 (= res!452827 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688057 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315611)))

(declare-fun lt!315613 () Unit!24252)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39691 (_ BitVec 64) (_ BitVec 32) List!13058 List!13058) Unit!24252)

(assert (=> b!688057 (= lt!315613 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315611))))

(declare-fun -!186 (List!13058 (_ BitVec 64)) List!13058)

(assert (=> b!688057 (= (-!186 lt!315611 k!2843) acc!681)))

(assert (=> b!688057 (= lt!315611 ($colon$colon!386 acc!681 k!2843))))

(declare-fun lt!315616 () Unit!24252)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13058) Unit!24252)

(assert (=> b!688057 (= lt!315616 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!688057 (subseq!221 acc!681 acc!681)))

(declare-fun lt!315619 () Unit!24252)

(assert (=> b!688057 (= lt!315619 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688057 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315618 () Unit!24252)

(assert (=> b!688057 (= lt!315618 e!391937)))

(declare-fun c!77984 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688057 (= c!77984 (validKeyInArray!0 (select (arr!19017 a!3626) from!3004)))))

(declare-fun lt!315617 () Unit!24252)

(declare-fun e!391944 () Unit!24252)

(assert (=> b!688057 (= lt!315617 e!391944)))

(declare-fun c!77983 () Bool)

(assert (=> b!688057 (= c!77983 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688057 (arrayContainsKey!0 (array!39692 (store (arr!19017 a!3626) i!1382 k!2843) (size!19399 a!3626)) k!2843 from!3004)))

(declare-fun b!688058 () Bool)

(declare-fun e!391940 () Bool)

(declare-fun e!391939 () Bool)

(assert (=> b!688058 (= e!391940 e!391939)))

(declare-fun res!452824 () Bool)

(assert (=> b!688058 (=> (not res!452824) (not e!391939))))

(assert (=> b!688058 (= res!452824 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688059 () Bool)

(declare-fun res!452819 () Bool)

(assert (=> b!688059 (=> res!452819 e!391936)))

(assert (=> b!688059 (= res!452819 (not (noDuplicate!882 lt!315611)))))

(declare-fun b!688060 () Bool)

(assert (=> b!688060 (= e!391936 true)))

(declare-fun lt!315614 () Bool)

(assert (=> b!688060 (= lt!315614 e!391940)))

(declare-fun res!452831 () Bool)

(assert (=> b!688060 (=> res!452831 e!391940)))

(assert (=> b!688060 (= res!452831 e!391942)))

(declare-fun res!452814 () Bool)

(assert (=> b!688060 (=> (not res!452814) (not e!391942))))

(assert (=> b!688060 (= res!452814 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688061 () Bool)

(assert (=> b!688061 (= e!391939 (not (contains!3635 lt!315611 k!2843)))))

(declare-fun b!688062 () Bool)

(declare-fun res!452818 () Bool)

(assert (=> b!688062 (=> (not res!452818) (not e!391935))))

(assert (=> b!688062 (= res!452818 (not (contains!3635 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688063 () Bool)

(declare-fun Unit!24255 () Unit!24252)

(assert (=> b!688063 (= e!391944 Unit!24255)))

(declare-fun lt!315610 () Unit!24252)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39691 (_ BitVec 64) (_ BitVec 32)) Unit!24252)

(assert (=> b!688063 (= lt!315610 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688063 false))

(declare-fun b!688064 () Bool)

(declare-fun res!452820 () Bool)

(assert (=> b!688064 (=> (not res!452820) (not e!391935))))

(assert (=> b!688064 (= res!452820 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19399 a!3626))))))

(declare-fun b!688065 () Bool)

(declare-fun Unit!24256 () Unit!24252)

(assert (=> b!688065 (= e!391944 Unit!24256)))

(declare-fun b!688066 () Bool)

(declare-fun res!452826 () Bool)

(assert (=> b!688066 (=> (not res!452826) (not e!391935))))

(assert (=> b!688066 (= res!452826 (validKeyInArray!0 k!2843))))

(declare-fun b!688067 () Bool)

(declare-fun res!452815 () Bool)

(assert (=> b!688067 (=> (not res!452815) (not e!391935))))

(assert (=> b!688067 (= res!452815 e!391941)))

(declare-fun res!452812 () Bool)

(assert (=> b!688067 (=> res!452812 e!391941)))

(assert (=> b!688067 (= res!452812 e!391943)))

(declare-fun res!452811 () Bool)

(assert (=> b!688067 (=> (not res!452811) (not e!391943))))

(assert (=> b!688067 (= res!452811 (bvsgt from!3004 i!1382))))

(assert (= (and start!61550 res!452829) b!688043))

(assert (= (and b!688043 res!452828) b!688062))

(assert (= (and b!688062 res!452818) b!688046))

(assert (= (and b!688046 res!452825) b!688067))

(assert (= (and b!688067 res!452811) b!688049))

(assert (= (and b!688067 (not res!452812)) b!688054))

(assert (= (and b!688054 res!452817) b!688044))

(assert (= (and b!688067 res!452815) b!688053))

(assert (= (and b!688053 res!452823) b!688052))

(assert (= (and b!688052 res!452822) b!688064))

(assert (= (and b!688064 res!452820) b!688066))

(assert (= (and b!688066 res!452826) b!688050))

(assert (= (and b!688050 res!452816) b!688055))

(assert (= (and b!688055 res!452813) b!688057))

(assert (= (and b!688057 c!77983) b!688063))

(assert (= (and b!688057 (not c!77983)) b!688065))

(assert (= (and b!688057 c!77984) b!688056))

(assert (= (and b!688057 (not c!77984)) b!688048))

(assert (= (and b!688057 (not res!452827)) b!688059))

(assert (= (and b!688059 (not res!452819)) b!688045))

(assert (= (and b!688045 (not res!452821)) b!688047))

(assert (= (and b!688047 (not res!452830)) b!688060))

(assert (= (and b!688060 res!452814) b!688051))

(assert (= (and b!688060 (not res!452831)) b!688058))

(assert (= (and b!688058 res!452824) b!688061))

(declare-fun m!652025 () Bool)

(assert (=> b!688046 m!652025))

(declare-fun m!652027 () Bool)

(assert (=> b!688044 m!652027))

(declare-fun m!652029 () Bool)

(assert (=> b!688063 m!652029))

(declare-fun m!652031 () Bool)

(assert (=> b!688043 m!652031))

(declare-fun m!652033 () Bool)

(assert (=> b!688053 m!652033))

(declare-fun m!652035 () Bool)

(assert (=> b!688066 m!652035))

(declare-fun m!652037 () Bool)

(assert (=> b!688056 m!652037))

(declare-fun m!652039 () Bool)

(assert (=> b!688056 m!652039))

(declare-fun m!652041 () Bool)

(assert (=> b!688056 m!652041))

(declare-fun m!652043 () Bool)

(assert (=> b!688056 m!652043))

(assert (=> b!688056 m!652039))

(assert (=> b!688056 m!652041))

(declare-fun m!652045 () Bool)

(assert (=> b!688056 m!652045))

(declare-fun m!652047 () Bool)

(assert (=> b!688056 m!652047))

(declare-fun m!652049 () Bool)

(assert (=> b!688061 m!652049))

(declare-fun m!652051 () Bool)

(assert (=> b!688050 m!652051))

(declare-fun m!652053 () Bool)

(assert (=> start!61550 m!652053))

(declare-fun m!652055 () Bool)

(assert (=> b!688052 m!652055))

(declare-fun m!652057 () Bool)

(assert (=> b!688059 m!652057))

(assert (=> b!688049 m!652027))

(declare-fun m!652059 () Bool)

(assert (=> b!688062 m!652059))

(assert (=> b!688057 m!652037))

(assert (=> b!688057 m!652039))

(declare-fun m!652061 () Bool)

(assert (=> b!688057 m!652061))

(declare-fun m!652063 () Bool)

(assert (=> b!688057 m!652063))

(declare-fun m!652065 () Bool)

(assert (=> b!688057 m!652065))

(assert (=> b!688057 m!652045))

(declare-fun m!652067 () Bool)

(assert (=> b!688057 m!652067))

(declare-fun m!652069 () Bool)

(assert (=> b!688057 m!652069))

(assert (=> b!688057 m!652039))

(declare-fun m!652071 () Bool)

(assert (=> b!688057 m!652071))

(declare-fun m!652073 () Bool)

(assert (=> b!688057 m!652073))

(declare-fun m!652075 () Bool)

(assert (=> b!688057 m!652075))

(assert (=> b!688057 m!652047))

(declare-fun m!652077 () Bool)

(assert (=> b!688057 m!652077))

(declare-fun m!652079 () Bool)

(assert (=> b!688045 m!652079))

(assert (=> b!688051 m!652049))

(declare-fun m!652081 () Bool)

(assert (=> b!688047 m!652081))

(push 1)

(assert (not b!688053))

(assert (not b!688046))

(assert (not b!688044))

(assert (not b!688052))

(assert (not b!688051))

(assert (not b!688061))

(assert (not b!688059))

(assert (not b!688045))

(assert (not b!688063))

(assert (not b!688057))

(assert (not b!688062))

(assert (not b!688066))

(assert (not b!688050))

(assert (not b!688056))

(assert (not b!688049))

(assert (not b!688043))

(assert (not start!61550))

(assert (not b!688047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

