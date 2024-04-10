; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59956 () Bool)

(assert start!59956)

(declare-fun b!664928 () Bool)

(declare-fun e!381198 () Bool)

(assert (=> b!664928 (= e!381198 true)))

(declare-fun lt!309821 () Bool)

(declare-datatypes ((List!12735 0))(
  ( (Nil!12732) (Cons!12731 (h!13776 (_ BitVec 64)) (t!18963 List!12735)) )
))
(declare-fun lt!309816 () List!12735)

(declare-fun contains!3312 (List!12735 (_ BitVec 64)) Bool)

(assert (=> b!664928 (= lt!309821 (contains!3312 lt!309816 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664929 () Bool)

(declare-fun res!432544 () Bool)

(declare-fun e!381199 () Bool)

(assert (=> b!664929 (=> (not res!432544) (not e!381199))))

(declare-datatypes ((array!39003 0))(
  ( (array!39004 (arr!18694 (Array (_ BitVec 32) (_ BitVec 64))) (size!19058 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39003)

(declare-fun arrayNoDuplicates!0 (array!39003 (_ BitVec 32) List!12735) Bool)

(assert (=> b!664929 (= res!432544 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12732))))

(declare-fun b!664930 () Bool)

(declare-fun res!432548 () Bool)

(assert (=> b!664930 (=> res!432548 e!381198)))

(declare-fun noDuplicate!559 (List!12735) Bool)

(assert (=> b!664930 (= res!432548 (not (noDuplicate!559 lt!309816)))))

(declare-fun b!664931 () Bool)

(declare-fun res!432546 () Bool)

(assert (=> b!664931 (=> (not res!432546) (not e!381199))))

(declare-fun acc!681 () List!12735)

(assert (=> b!664931 (= res!432546 (not (contains!3312 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664932 () Bool)

(assert (=> b!664932 (= e!381199 (not e!381198))))

(declare-fun res!432558 () Bool)

(assert (=> b!664932 (=> res!432558 e!381198)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664932 (= res!432558 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun -!49 (List!12735 (_ BitVec 64)) List!12735)

(assert (=> b!664932 (= (-!49 lt!309816 k0!2843) acc!681)))

(declare-fun $colon$colon!183 (List!12735 (_ BitVec 64)) List!12735)

(assert (=> b!664932 (= lt!309816 ($colon$colon!183 acc!681 k0!2843))))

(declare-datatypes ((Unit!23195 0))(
  ( (Unit!23196) )
))
(declare-fun lt!309815 () Unit!23195)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12735) Unit!23195)

(assert (=> b!664932 (= lt!309815 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!51 (List!12735 List!12735) Bool)

(assert (=> b!664932 (subseq!51 acc!681 acc!681)))

(declare-fun lt!309817 () Unit!23195)

(declare-fun lemmaListSubSeqRefl!0 (List!12735) Unit!23195)

(assert (=> b!664932 (= lt!309817 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664932 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309814 () Unit!23195)

(declare-fun e!381196 () Unit!23195)

(assert (=> b!664932 (= lt!309814 e!381196)))

(declare-fun c!76561 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664932 (= c!76561 (validKeyInArray!0 (select (arr!18694 a!3626) from!3004)))))

(declare-fun lt!309820 () Unit!23195)

(declare-fun e!381197 () Unit!23195)

(assert (=> b!664932 (= lt!309820 e!381197)))

(declare-fun c!76562 () Bool)

(declare-fun lt!309819 () Bool)

(assert (=> b!664932 (= c!76562 lt!309819)))

(declare-fun arrayContainsKey!0 (array!39003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664932 (= lt!309819 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664932 (arrayContainsKey!0 (array!39004 (store (arr!18694 a!3626) i!1382 k0!2843) (size!19058 a!3626)) k0!2843 from!3004)))

(declare-fun b!664933 () Bool)

(declare-fun res!432540 () Bool)

(assert (=> b!664933 (=> (not res!432540) (not e!381199))))

(assert (=> b!664933 (= res!432540 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664934 () Bool)

(declare-fun res!432542 () Bool)

(assert (=> b!664934 (=> res!432542 e!381198)))

(assert (=> b!664934 (= res!432542 (not (contains!3312 lt!309816 k0!2843)))))

(declare-fun b!664935 () Bool)

(declare-fun res!432545 () Bool)

(assert (=> b!664935 (=> (not res!432545) (not e!381199))))

(assert (=> b!664935 (= res!432545 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19058 a!3626))))))

(declare-fun b!664936 () Bool)

(declare-fun res!432559 () Bool)

(assert (=> b!664936 (=> (not res!432559) (not e!381199))))

(assert (=> b!664936 (= res!432559 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664937 () Bool)

(declare-fun e!381194 () Bool)

(assert (=> b!664937 (= e!381194 (not (contains!3312 acc!681 k0!2843)))))

(declare-fun b!664938 () Bool)

(declare-fun res!432543 () Bool)

(assert (=> b!664938 (=> (not res!432543) (not e!381199))))

(assert (=> b!664938 (= res!432543 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19058 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664939 () Bool)

(declare-fun res!432549 () Bool)

(assert (=> b!664939 (=> (not res!432549) (not e!381199))))

(assert (=> b!664939 (= res!432549 (noDuplicate!559 acc!681))))

(declare-fun b!664940 () Bool)

(declare-fun res!432541 () Bool)

(assert (=> b!664940 (=> (not res!432541) (not e!381199))))

(assert (=> b!664940 (= res!432541 (not (contains!3312 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664941 () Bool)

(declare-fun res!432552 () Bool)

(assert (=> b!664941 (=> (not res!432552) (not e!381199))))

(declare-fun e!381195 () Bool)

(assert (=> b!664941 (= res!432552 e!381195)))

(declare-fun res!432547 () Bool)

(assert (=> b!664941 (=> res!432547 e!381195)))

(declare-fun e!381201 () Bool)

(assert (=> b!664941 (= res!432547 e!381201)))

(declare-fun res!432560 () Bool)

(assert (=> b!664941 (=> (not res!432560) (not e!381201))))

(assert (=> b!664941 (= res!432560 (bvsgt from!3004 i!1382))))

(declare-fun b!664942 () Bool)

(declare-fun res!432551 () Bool)

(assert (=> b!664942 (=> (not res!432551) (not e!381199))))

(assert (=> b!664942 (= res!432551 (validKeyInArray!0 k0!2843))))

(declare-fun b!664943 () Bool)

(declare-fun Unit!23197 () Unit!23195)

(assert (=> b!664943 (= e!381197 Unit!23197)))

(declare-fun b!664944 () Bool)

(assert (=> b!664944 (= e!381201 (contains!3312 acc!681 k0!2843))))

(declare-fun b!664945 () Bool)

(declare-fun res!432554 () Bool)

(assert (=> b!664945 (=> res!432554 e!381198)))

(assert (=> b!664945 (= res!432554 (not (subseq!51 acc!681 lt!309816)))))

(declare-fun b!664946 () Bool)

(assert (=> b!664946 (= e!381195 e!381194)))

(declare-fun res!432556 () Bool)

(assert (=> b!664946 (=> (not res!432556) (not e!381194))))

(assert (=> b!664946 (= res!432556 (bvsle from!3004 i!1382))))

(declare-fun b!664947 () Bool)

(declare-fun res!432555 () Bool)

(assert (=> b!664947 (=> res!432555 e!381198)))

(assert (=> b!664947 (= res!432555 (contains!3312 lt!309816 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664948 () Bool)

(declare-fun Unit!23198 () Unit!23195)

(assert (=> b!664948 (= e!381196 Unit!23198)))

(declare-fun res!432550 () Bool)

(assert (=> start!59956 (=> (not res!432550) (not e!381199))))

(assert (=> start!59956 (= res!432550 (and (bvslt (size!19058 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19058 a!3626))))))

(assert (=> start!59956 e!381199))

(assert (=> start!59956 true))

(declare-fun array_inv!14490 (array!39003) Bool)

(assert (=> start!59956 (array_inv!14490 a!3626)))

(declare-fun b!664949 () Bool)

(declare-fun Unit!23199 () Unit!23195)

(assert (=> b!664949 (= e!381197 Unit!23199)))

(declare-fun lt!309818 () Unit!23195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39003 (_ BitVec 64) (_ BitVec 32)) Unit!23195)

(assert (=> b!664949 (= lt!309818 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664949 false))

(declare-fun b!664950 () Bool)

(declare-fun lt!309823 () Unit!23195)

(assert (=> b!664950 (= e!381196 lt!309823)))

(declare-fun lt!309822 () Unit!23195)

(assert (=> b!664950 (= lt!309822 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664950 (subseq!51 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39003 List!12735 List!12735 (_ BitVec 32)) Unit!23195)

(assert (=> b!664950 (= lt!309823 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!183 acc!681 (select (arr!18694 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664950 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664951 () Bool)

(declare-fun res!432557 () Bool)

(assert (=> b!664951 (=> res!432557 e!381198)))

(assert (=> b!664951 (= res!432557 (contains!3312 acc!681 k0!2843))))

(declare-fun b!664952 () Bool)

(declare-fun res!432553 () Bool)

(assert (=> b!664952 (=> res!432553 e!381198)))

(assert (=> b!664952 (= res!432553 lt!309819)))

(assert (= (and start!59956 res!432550) b!664939))

(assert (= (and b!664939 res!432549) b!664931))

(assert (= (and b!664931 res!432546) b!664940))

(assert (= (and b!664940 res!432541) b!664941))

(assert (= (and b!664941 res!432560) b!664944))

(assert (= (and b!664941 (not res!432547)) b!664946))

(assert (= (and b!664946 res!432556) b!664937))

(assert (= (and b!664941 res!432552) b!664929))

(assert (= (and b!664929 res!432544) b!664936))

(assert (= (and b!664936 res!432559) b!664935))

(assert (= (and b!664935 res!432545) b!664942))

(assert (= (and b!664942 res!432551) b!664933))

(assert (= (and b!664933 res!432540) b!664938))

(assert (= (and b!664938 res!432543) b!664932))

(assert (= (and b!664932 c!76562) b!664949))

(assert (= (and b!664932 (not c!76562)) b!664943))

(assert (= (and b!664932 c!76561) b!664950))

(assert (= (and b!664932 (not c!76561)) b!664948))

(assert (= (and b!664932 (not res!432558)) b!664930))

(assert (= (and b!664930 (not res!432548)) b!664952))

(assert (= (and b!664952 (not res!432553)) b!664951))

(assert (= (and b!664951 (not res!432557)) b!664945))

(assert (= (and b!664945 (not res!432554)) b!664934))

(assert (= (and b!664934 (not res!432542)) b!664947))

(assert (= (and b!664947 (not res!432555)) b!664928))

(declare-fun m!636109 () Bool)

(assert (=> b!664934 m!636109))

(declare-fun m!636111 () Bool)

(assert (=> b!664942 m!636111))

(declare-fun m!636113 () Bool)

(assert (=> b!664930 m!636113))

(declare-fun m!636115 () Bool)

(assert (=> b!664931 m!636115))

(declare-fun m!636117 () Bool)

(assert (=> start!59956 m!636117))

(declare-fun m!636119 () Bool)

(assert (=> b!664939 m!636119))

(declare-fun m!636121 () Bool)

(assert (=> b!664940 m!636121))

(declare-fun m!636123 () Bool)

(assert (=> b!664932 m!636123))

(declare-fun m!636125 () Bool)

(assert (=> b!664932 m!636125))

(declare-fun m!636127 () Bool)

(assert (=> b!664932 m!636127))

(declare-fun m!636129 () Bool)

(assert (=> b!664932 m!636129))

(declare-fun m!636131 () Bool)

(assert (=> b!664932 m!636131))

(declare-fun m!636133 () Bool)

(assert (=> b!664932 m!636133))

(assert (=> b!664932 m!636125))

(declare-fun m!636135 () Bool)

(assert (=> b!664932 m!636135))

(declare-fun m!636137 () Bool)

(assert (=> b!664932 m!636137))

(declare-fun m!636139 () Bool)

(assert (=> b!664932 m!636139))

(declare-fun m!636141 () Bool)

(assert (=> b!664932 m!636141))

(declare-fun m!636143 () Bool)

(assert (=> b!664932 m!636143))

(declare-fun m!636145 () Bool)

(assert (=> b!664936 m!636145))

(declare-fun m!636147 () Bool)

(assert (=> b!664947 m!636147))

(declare-fun m!636149 () Bool)

(assert (=> b!664929 m!636149))

(declare-fun m!636151 () Bool)

(assert (=> b!664933 m!636151))

(declare-fun m!636153 () Bool)

(assert (=> b!664945 m!636153))

(declare-fun m!636155 () Bool)

(assert (=> b!664949 m!636155))

(declare-fun m!636157 () Bool)

(assert (=> b!664928 m!636157))

(declare-fun m!636159 () Bool)

(assert (=> b!664951 m!636159))

(assert (=> b!664937 m!636159))

(assert (=> b!664944 m!636159))

(assert (=> b!664950 m!636123))

(assert (=> b!664950 m!636125))

(declare-fun m!636161 () Bool)

(assert (=> b!664950 m!636161))

(declare-fun m!636163 () Bool)

(assert (=> b!664950 m!636163))

(assert (=> b!664950 m!636125))

(assert (=> b!664950 m!636161))

(assert (=> b!664950 m!636131))

(assert (=> b!664950 m!636143))

(check-sat (not start!59956) (not b!664939) (not b!664945) (not b!664950) (not b!664936) (not b!664942) (not b!664937) (not b!664929) (not b!664928) (not b!664933) (not b!664940) (not b!664947) (not b!664949) (not b!664930) (not b!664931) (not b!664932) (not b!664951) (not b!664944) (not b!664934))
(check-sat)
