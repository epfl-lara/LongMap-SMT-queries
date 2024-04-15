; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61266 () Bool)

(assert start!61266)

(declare-fun b!686299 () Bool)

(declare-fun res!451565 () Bool)

(declare-fun e!390778 () Bool)

(assert (=> b!686299 (=> (not res!451565) (not e!390778))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39661 0))(
  ( (array!39662 (arr!19006 (Array (_ BitVec 32) (_ BitVec 64))) (size!19380 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39661)

(assert (=> b!686299 (= res!451565 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19380 a!3626))))))

(declare-fun b!686300 () Bool)

(declare-fun res!451570 () Bool)

(assert (=> b!686300 (=> (not res!451570) (not e!390778))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!686300 (= res!451570 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19380 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686301 () Bool)

(declare-fun res!451569 () Bool)

(assert (=> b!686301 (=> (not res!451569) (not e!390778))))

(declare-datatypes ((List!13086 0))(
  ( (Nil!13083) (Cons!13082 (h!14127 (_ BitVec 64)) (t!19332 List!13086)) )
))
(declare-fun arrayNoDuplicates!0 (array!39661 (_ BitVec 32) List!13086) Bool)

(assert (=> b!686301 (= res!451569 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13083))))

(declare-fun b!686302 () Bool)

(declare-fun res!451571 () Bool)

(assert (=> b!686302 (=> (not res!451571) (not e!390778))))

(declare-fun acc!681 () List!13086)

(declare-fun contains!3608 (List!13086 (_ BitVec 64)) Bool)

(assert (=> b!686302 (= res!451571 (not (contains!3608 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686303 () Bool)

(declare-datatypes ((Unit!24180 0))(
  ( (Unit!24181) )
))
(declare-fun e!390779 () Unit!24180)

(declare-fun lt!314866 () Unit!24180)

(assert (=> b!686303 (= e!390779 lt!314866)))

(declare-fun lt!314863 () Unit!24180)

(declare-fun lemmaListSubSeqRefl!0 (List!13086) Unit!24180)

(assert (=> b!686303 (= lt!314863 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!211 (List!13086 List!13086) Bool)

(assert (=> b!686303 (subseq!211 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39661 List!13086 List!13086 (_ BitVec 32)) Unit!24180)

(declare-fun $colon$colon!375 (List!13086 (_ BitVec 64)) List!13086)

(assert (=> b!686303 (= lt!314866 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!375 acc!681 (select (arr!19006 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686303 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686304 () Bool)

(declare-fun res!451575 () Bool)

(assert (=> b!686304 (=> (not res!451575) (not e!390778))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686304 (= res!451575 (validKeyInArray!0 k!2843))))

(declare-fun b!686305 () Bool)

(declare-fun e!390776 () Bool)

(assert (=> b!686305 (= e!390776 (contains!3608 acc!681 k!2843))))

(declare-fun b!686306 () Bool)

(declare-fun res!451563 () Bool)

(assert (=> b!686306 (=> (not res!451563) (not e!390778))))

(declare-fun noDuplicate!877 (List!13086) Bool)

(assert (=> b!686306 (= res!451563 (noDuplicate!877 acc!681))))

(declare-fun b!686307 () Bool)

(declare-fun e!390777 () Bool)

(assert (=> b!686307 (= e!390777 (not (contains!3608 acc!681 k!2843)))))

(declare-fun b!686308 () Bool)

(declare-fun e!390780 () Unit!24180)

(declare-fun Unit!24182 () Unit!24180)

(assert (=> b!686308 (= e!390780 Unit!24182)))

(declare-fun b!686309 () Bool)

(declare-fun res!451564 () Bool)

(assert (=> b!686309 (=> (not res!451564) (not e!390778))))

(assert (=> b!686309 (= res!451564 (not (contains!3608 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686310 () Bool)

(declare-fun res!451568 () Bool)

(assert (=> b!686310 (=> (not res!451568) (not e!390778))))

(assert (=> b!686310 (= res!451568 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!451572 () Bool)

(assert (=> start!61266 (=> (not res!451572) (not e!390778))))

(assert (=> start!61266 (= res!451572 (and (bvslt (size!19380 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19380 a!3626))))))

(assert (=> start!61266 e!390778))

(assert (=> start!61266 true))

(declare-fun array_inv!14889 (array!39661) Bool)

(assert (=> start!61266 (array_inv!14889 a!3626)))

(declare-fun b!686311 () Bool)

(declare-fun res!451576 () Bool)

(assert (=> b!686311 (=> (not res!451576) (not e!390778))))

(declare-fun arrayContainsKey!0 (array!39661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686311 (= res!451576 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686312 () Bool)

(declare-fun Unit!24183 () Unit!24180)

(assert (=> b!686312 (= e!390779 Unit!24183)))

(declare-fun b!686313 () Bool)

(declare-fun Unit!24184 () Unit!24180)

(assert (=> b!686313 (= e!390780 Unit!24184)))

(declare-fun lt!314867 () Unit!24180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39661 (_ BitVec 64) (_ BitVec 32)) Unit!24180)

(assert (=> b!686313 (= lt!314867 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686313 false))

(declare-fun b!686314 () Bool)

(declare-fun res!451574 () Bool)

(assert (=> b!686314 (=> (not res!451574) (not e!390778))))

(declare-fun e!390782 () Bool)

(assert (=> b!686314 (= res!451574 e!390782)))

(declare-fun res!451566 () Bool)

(assert (=> b!686314 (=> res!451566 e!390782)))

(assert (=> b!686314 (= res!451566 e!390776)))

(declare-fun res!451573 () Bool)

(assert (=> b!686314 (=> (not res!451573) (not e!390776))))

(assert (=> b!686314 (= res!451573 (bvsgt from!3004 i!1382))))

(declare-fun b!686315 () Bool)

(assert (=> b!686315 (= e!390778 (not true))))

(declare-fun lt!314865 () List!13086)

(assert (=> b!686315 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314865)))

(declare-fun lt!314864 () Unit!24180)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39661 (_ BitVec 64) (_ BitVec 32) List!13086 List!13086) Unit!24180)

(assert (=> b!686315 (= lt!314864 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314865))))

(declare-fun -!176 (List!13086 (_ BitVec 64)) List!13086)

(assert (=> b!686315 (= (-!176 lt!314865 k!2843) acc!681)))

(assert (=> b!686315 (= lt!314865 ($colon$colon!375 acc!681 k!2843))))

(declare-fun lt!314860 () Unit!24180)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13086) Unit!24180)

(assert (=> b!686315 (= lt!314860 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!686315 (subseq!211 acc!681 acc!681)))

(declare-fun lt!314861 () Unit!24180)

(assert (=> b!686315 (= lt!314861 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686315 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314868 () Unit!24180)

(assert (=> b!686315 (= lt!314868 e!390779)))

(declare-fun c!77736 () Bool)

(assert (=> b!686315 (= c!77736 (validKeyInArray!0 (select (arr!19006 a!3626) from!3004)))))

(declare-fun lt!314862 () Unit!24180)

(assert (=> b!686315 (= lt!314862 e!390780)))

(declare-fun c!77735 () Bool)

(assert (=> b!686315 (= c!77735 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686315 (arrayContainsKey!0 (array!39662 (store (arr!19006 a!3626) i!1382 k!2843) (size!19380 a!3626)) k!2843 from!3004)))

(declare-fun b!686316 () Bool)

(assert (=> b!686316 (= e!390782 e!390777)))

(declare-fun res!451567 () Bool)

(assert (=> b!686316 (=> (not res!451567) (not e!390777))))

(assert (=> b!686316 (= res!451567 (bvsle from!3004 i!1382))))

(assert (= (and start!61266 res!451572) b!686306))

(assert (= (and b!686306 res!451563) b!686302))

(assert (= (and b!686302 res!451571) b!686309))

(assert (= (and b!686309 res!451564) b!686314))

(assert (= (and b!686314 res!451573) b!686305))

(assert (= (and b!686314 (not res!451566)) b!686316))

(assert (= (and b!686316 res!451567) b!686307))

(assert (= (and b!686314 res!451574) b!686301))

(assert (= (and b!686301 res!451569) b!686310))

(assert (= (and b!686310 res!451568) b!686299))

(assert (= (and b!686299 res!451565) b!686304))

(assert (= (and b!686304 res!451575) b!686311))

(assert (= (and b!686311 res!451576) b!686300))

(assert (= (and b!686300 res!451570) b!686315))

(assert (= (and b!686315 c!77735) b!686313))

(assert (= (and b!686315 (not c!77735)) b!686308))

(assert (= (and b!686315 c!77736) b!686303))

(assert (= (and b!686315 (not c!77736)) b!686312))

(declare-fun m!649897 () Bool)

(assert (=> b!686302 m!649897))

(declare-fun m!649899 () Bool)

(assert (=> b!686313 m!649899))

(declare-fun m!649901 () Bool)

(assert (=> b!686306 m!649901))

(declare-fun m!649903 () Bool)

(assert (=> b!686315 m!649903))

(declare-fun m!649905 () Bool)

(assert (=> b!686315 m!649905))

(declare-fun m!649907 () Bool)

(assert (=> b!686315 m!649907))

(declare-fun m!649909 () Bool)

(assert (=> b!686315 m!649909))

(declare-fun m!649911 () Bool)

(assert (=> b!686315 m!649911))

(declare-fun m!649913 () Bool)

(assert (=> b!686315 m!649913))

(declare-fun m!649915 () Bool)

(assert (=> b!686315 m!649915))

(declare-fun m!649917 () Bool)

(assert (=> b!686315 m!649917))

(declare-fun m!649919 () Bool)

(assert (=> b!686315 m!649919))

(declare-fun m!649921 () Bool)

(assert (=> b!686315 m!649921))

(assert (=> b!686315 m!649909))

(declare-fun m!649923 () Bool)

(assert (=> b!686315 m!649923))

(declare-fun m!649925 () Bool)

(assert (=> b!686315 m!649925))

(declare-fun m!649927 () Bool)

(assert (=> b!686315 m!649927))

(declare-fun m!649929 () Bool)

(assert (=> start!61266 m!649929))

(declare-fun m!649931 () Bool)

(assert (=> b!686301 m!649931))

(assert (=> b!686303 m!649907))

(assert (=> b!686303 m!649909))

(declare-fun m!649933 () Bool)

(assert (=> b!686303 m!649933))

(declare-fun m!649935 () Bool)

(assert (=> b!686303 m!649935))

(assert (=> b!686303 m!649909))

(assert (=> b!686303 m!649933))

(assert (=> b!686303 m!649917))

(assert (=> b!686303 m!649927))

(declare-fun m!649937 () Bool)

(assert (=> b!686309 m!649937))

(declare-fun m!649939 () Bool)

(assert (=> b!686305 m!649939))

(declare-fun m!649941 () Bool)

(assert (=> b!686310 m!649941))

(declare-fun m!649943 () Bool)

(assert (=> b!686311 m!649943))

(assert (=> b!686307 m!649939))

(declare-fun m!649945 () Bool)

(assert (=> b!686304 m!649945))

(push 1)

(assert (not start!61266))

(assert (not b!686303))

(assert (not b!686307))

(assert (not b!686309))

(assert (not b!686305))

(assert (not b!686306))

(assert (not b!686311))

(assert (not b!686313))

(assert (not b!686302))

(assert (not b!686304))

(assert (not b!686301))

(assert (not b!686315))

(assert (not b!686310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

