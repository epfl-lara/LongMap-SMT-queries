; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60124 () Bool)

(assert start!60124)

(declare-fun b!669277 () Bool)

(declare-datatypes ((Unit!23449 0))(
  ( (Unit!23450) )
))
(declare-fun e!382876 () Unit!23449)

(declare-fun Unit!23451 () Unit!23449)

(assert (=> b!669277 (= e!382876 Unit!23451)))

(declare-fun b!669278 () Bool)

(declare-fun e!382873 () Bool)

(declare-datatypes ((List!12692 0))(
  ( (Nil!12689) (Cons!12688 (h!13736 (_ BitVec 64)) (t!18912 List!12692)) )
))
(declare-fun lt!311572 () List!12692)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3344 (List!12692 (_ BitVec 64)) Bool)

(assert (=> b!669278 (= e!382873 (not (contains!3344 lt!311572 k!2843)))))

(declare-fun b!669279 () Bool)

(declare-fun e!382875 () Bool)

(declare-fun e!382870 () Bool)

(assert (=> b!669279 (= e!382875 e!382870)))

(declare-fun res!436134 () Bool)

(assert (=> b!669279 (=> (not res!436134) (not e!382870))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669279 (= res!436134 (bvsle from!3004 i!1382))))

(declare-fun b!669280 () Bool)

(declare-fun res!436120 () Bool)

(declare-fun e!382868 () Bool)

(assert (=> b!669280 (=> (not res!436120) (not e!382868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669280 (= res!436120 (validKeyInArray!0 k!2843))))

(declare-fun b!669281 () Bool)

(declare-fun res!436119 () Bool)

(assert (=> b!669281 (=> (not res!436119) (not e!382868))))

(declare-datatypes ((array!39109 0))(
  ( (array!39110 (arr!18744 (Array (_ BitVec 32) (_ BitVec 64))) (size!19108 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39109)

(declare-fun acc!681 () List!12692)

(declare-fun arrayNoDuplicates!0 (array!39109 (_ BitVec 32) List!12692) Bool)

(assert (=> b!669281 (= res!436119 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669282 () Bool)

(declare-fun res!436133 () Bool)

(assert (=> b!669282 (=> (not res!436133) (not e!382868))))

(assert (=> b!669282 (= res!436133 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19108 a!3626))))))

(declare-fun b!669284 () Bool)

(declare-fun e!382877 () Bool)

(assert (=> b!669284 (= e!382877 true)))

(declare-fun lt!311570 () Bool)

(declare-fun e!382869 () Bool)

(assert (=> b!669284 (= lt!311570 e!382869)))

(declare-fun res!436129 () Bool)

(assert (=> b!669284 (=> res!436129 e!382869)))

(declare-fun e!382871 () Bool)

(assert (=> b!669284 (= res!436129 e!382871)))

(declare-fun res!436124 () Bool)

(assert (=> b!669284 (=> (not res!436124) (not e!382871))))

(assert (=> b!669284 (= res!436124 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669285 () Bool)

(declare-fun res!436125 () Bool)

(assert (=> b!669285 (=> (not res!436125) (not e!382868))))

(assert (=> b!669285 (= res!436125 e!382875)))

(declare-fun res!436118 () Bool)

(assert (=> b!669285 (=> res!436118 e!382875)))

(declare-fun e!382878 () Bool)

(assert (=> b!669285 (= res!436118 e!382878)))

(declare-fun res!436135 () Bool)

(assert (=> b!669285 (=> (not res!436135) (not e!382878))))

(assert (=> b!669285 (= res!436135 (bvsgt from!3004 i!1382))))

(declare-fun b!669286 () Bool)

(declare-fun res!436131 () Bool)

(assert (=> b!669286 (=> (not res!436131) (not e!382868))))

(assert (=> b!669286 (= res!436131 (not (contains!3344 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669287 () Bool)

(declare-fun res!436127 () Bool)

(assert (=> b!669287 (=> res!436127 e!382877)))

(assert (=> b!669287 (= res!436127 (contains!3344 lt!311572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669288 () Bool)

(declare-fun res!436136 () Bool)

(assert (=> b!669288 (=> (not res!436136) (not e!382868))))

(assert (=> b!669288 (= res!436136 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19108 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669289 () Bool)

(assert (=> b!669289 (= e!382868 (not e!382877))))

(declare-fun res!436128 () Bool)

(assert (=> b!669289 (=> res!436128 e!382877)))

(assert (=> b!669289 (= res!436128 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669289 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311572)))

(declare-fun lt!311574 () Unit!23449)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39109 (_ BitVec 64) (_ BitVec 32) List!12692 List!12692) Unit!23449)

(assert (=> b!669289 (= lt!311574 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311572))))

(declare-fun -!103 (List!12692 (_ BitVec 64)) List!12692)

(assert (=> b!669289 (= (-!103 lt!311572 k!2843) acc!681)))

(declare-fun $colon$colon!235 (List!12692 (_ BitVec 64)) List!12692)

(assert (=> b!669289 (= lt!311572 ($colon$colon!235 acc!681 k!2843))))

(declare-fun lt!311569 () Unit!23449)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12692) Unit!23449)

(assert (=> b!669289 (= lt!311569 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!106 (List!12692 List!12692) Bool)

(assert (=> b!669289 (subseq!106 acc!681 acc!681)))

(declare-fun lt!311568 () Unit!23449)

(declare-fun lemmaListSubSeqRefl!0 (List!12692) Unit!23449)

(assert (=> b!669289 (= lt!311568 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669289 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311566 () Unit!23449)

(declare-fun e!382874 () Unit!23449)

(assert (=> b!669289 (= lt!311566 e!382874)))

(declare-fun c!76948 () Bool)

(assert (=> b!669289 (= c!76948 (validKeyInArray!0 (select (arr!18744 a!3626) from!3004)))))

(declare-fun lt!311567 () Unit!23449)

(assert (=> b!669289 (= lt!311567 e!382876)))

(declare-fun c!76949 () Bool)

(declare-fun arrayContainsKey!0 (array!39109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669289 (= c!76949 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669289 (arrayContainsKey!0 (array!39110 (store (arr!18744 a!3626) i!1382 k!2843) (size!19108 a!3626)) k!2843 from!3004)))

(declare-fun b!669290 () Bool)

(assert (=> b!669290 (= e!382878 (contains!3344 acc!681 k!2843))))

(declare-fun b!669291 () Bool)

(declare-fun Unit!23452 () Unit!23449)

(assert (=> b!669291 (= e!382874 Unit!23452)))

(declare-fun b!669283 () Bool)

(assert (=> b!669283 (= e!382870 (not (contains!3344 acc!681 k!2843)))))

(declare-fun res!436123 () Bool)

(assert (=> start!60124 (=> (not res!436123) (not e!382868))))

(assert (=> start!60124 (= res!436123 (and (bvslt (size!19108 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19108 a!3626))))))

(assert (=> start!60124 e!382868))

(assert (=> start!60124 true))

(declare-fun array_inv!14603 (array!39109) Bool)

(assert (=> start!60124 (array_inv!14603 a!3626)))

(declare-fun b!669292 () Bool)

(declare-fun res!436130 () Bool)

(assert (=> b!669292 (=> res!436130 e!382877)))

(assert (=> b!669292 (= res!436130 (contains!3344 lt!311572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669293 () Bool)

(declare-fun lt!311573 () Unit!23449)

(assert (=> b!669293 (= e!382874 lt!311573)))

(declare-fun lt!311571 () Unit!23449)

(assert (=> b!669293 (= lt!311571 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669293 (subseq!106 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39109 List!12692 List!12692 (_ BitVec 32)) Unit!23449)

(assert (=> b!669293 (= lt!311573 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!235 acc!681 (select (arr!18744 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669293 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669294 () Bool)

(declare-fun res!436138 () Bool)

(assert (=> b!669294 (=> (not res!436138) (not e!382868))))

(assert (=> b!669294 (= res!436138 (not (contains!3344 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669295 () Bool)

(assert (=> b!669295 (= e!382871 (contains!3344 lt!311572 k!2843))))

(declare-fun b!669296 () Bool)

(declare-fun Unit!23453 () Unit!23449)

(assert (=> b!669296 (= e!382876 Unit!23453)))

(declare-fun lt!311575 () Unit!23449)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39109 (_ BitVec 64) (_ BitVec 32)) Unit!23449)

(assert (=> b!669296 (= lt!311575 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669296 false))

(declare-fun b!669297 () Bool)

(declare-fun res!436121 () Bool)

(assert (=> b!669297 (=> (not res!436121) (not e!382868))))

(assert (=> b!669297 (= res!436121 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12689))))

(declare-fun b!669298 () Bool)

(declare-fun res!436137 () Bool)

(assert (=> b!669298 (=> (not res!436137) (not e!382868))))

(declare-fun noDuplicate!618 (List!12692) Bool)

(assert (=> b!669298 (= res!436137 (noDuplicate!618 acc!681))))

(declare-fun b!669299 () Bool)

(assert (=> b!669299 (= e!382869 e!382873)))

(declare-fun res!436132 () Bool)

(assert (=> b!669299 (=> (not res!436132) (not e!382873))))

(assert (=> b!669299 (= res!436132 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669300 () Bool)

(declare-fun res!436126 () Bool)

(assert (=> b!669300 (=> res!436126 e!382877)))

(assert (=> b!669300 (= res!436126 (not (noDuplicate!618 lt!311572)))))

(declare-fun b!669301 () Bool)

(declare-fun res!436122 () Bool)

(assert (=> b!669301 (=> (not res!436122) (not e!382868))))

(assert (=> b!669301 (= res!436122 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60124 res!436123) b!669298))

(assert (= (and b!669298 res!436137) b!669286))

(assert (= (and b!669286 res!436131) b!669294))

(assert (= (and b!669294 res!436138) b!669285))

(assert (= (and b!669285 res!436135) b!669290))

(assert (= (and b!669285 (not res!436118)) b!669279))

(assert (= (and b!669279 res!436134) b!669283))

(assert (= (and b!669285 res!436125) b!669297))

(assert (= (and b!669297 res!436121) b!669281))

(assert (= (and b!669281 res!436119) b!669282))

(assert (= (and b!669282 res!436133) b!669280))

(assert (= (and b!669280 res!436120) b!669301))

(assert (= (and b!669301 res!436122) b!669288))

(assert (= (and b!669288 res!436136) b!669289))

(assert (= (and b!669289 c!76949) b!669296))

(assert (= (and b!669289 (not c!76949)) b!669277))

(assert (= (and b!669289 c!76948) b!669293))

(assert (= (and b!669289 (not c!76948)) b!669291))

(assert (= (and b!669289 (not res!436128)) b!669300))

(assert (= (and b!669300 (not res!436126)) b!669287))

(assert (= (and b!669287 (not res!436127)) b!669292))

(assert (= (and b!669292 (not res!436130)) b!669284))

(assert (= (and b!669284 res!436124) b!669295))

(assert (= (and b!669284 (not res!436129)) b!669299))

(assert (= (and b!669299 res!436132) b!669278))

(declare-fun m!639933 () Bool)

(assert (=> b!669293 m!639933))

(declare-fun m!639935 () Bool)

(assert (=> b!669293 m!639935))

(declare-fun m!639937 () Bool)

(assert (=> b!669293 m!639937))

(declare-fun m!639939 () Bool)

(assert (=> b!669293 m!639939))

(assert (=> b!669293 m!639935))

(assert (=> b!669293 m!639937))

(declare-fun m!639941 () Bool)

(assert (=> b!669293 m!639941))

(declare-fun m!639943 () Bool)

(assert (=> b!669293 m!639943))

(declare-fun m!639945 () Bool)

(assert (=> b!669290 m!639945))

(declare-fun m!639947 () Bool)

(assert (=> b!669292 m!639947))

(declare-fun m!639949 () Bool)

(assert (=> b!669300 m!639949))

(declare-fun m!639951 () Bool)

(assert (=> b!669294 m!639951))

(declare-fun m!639953 () Bool)

(assert (=> b!669301 m!639953))

(declare-fun m!639955 () Bool)

(assert (=> b!669295 m!639955))

(declare-fun m!639957 () Bool)

(assert (=> b!669297 m!639957))

(declare-fun m!639959 () Bool)

(assert (=> b!669296 m!639959))

(declare-fun m!639961 () Bool)

(assert (=> start!60124 m!639961))

(declare-fun m!639963 () Bool)

(assert (=> b!669286 m!639963))

(declare-fun m!639965 () Bool)

(assert (=> b!669281 m!639965))

(declare-fun m!639967 () Bool)

(assert (=> b!669280 m!639967))

(assert (=> b!669278 m!639955))

(declare-fun m!639969 () Bool)

(assert (=> b!669289 m!639969))

(declare-fun m!639971 () Bool)

(assert (=> b!669289 m!639971))

(assert (=> b!669289 m!639933))

(assert (=> b!669289 m!639935))

(declare-fun m!639973 () Bool)

(assert (=> b!669289 m!639973))

(declare-fun m!639975 () Bool)

(assert (=> b!669289 m!639975))

(assert (=> b!669289 m!639941))

(declare-fun m!639977 () Bool)

(assert (=> b!669289 m!639977))

(declare-fun m!639979 () Bool)

(assert (=> b!669289 m!639979))

(declare-fun m!639981 () Bool)

(assert (=> b!669289 m!639981))

(assert (=> b!669289 m!639935))

(declare-fun m!639983 () Bool)

(assert (=> b!669289 m!639983))

(declare-fun m!639985 () Bool)

(assert (=> b!669289 m!639985))

(assert (=> b!669289 m!639943))

(declare-fun m!639987 () Bool)

(assert (=> b!669287 m!639987))

(assert (=> b!669283 m!639945))

(declare-fun m!639989 () Bool)

(assert (=> b!669298 m!639989))

(push 1)

(assert (not b!669286))

(assert (not b!669294))

(assert (not b!669278))

(assert (not b!669300))

(assert (not b!669281))

(assert (not b!669290))

(assert (not b!669280))

(assert (not b!669289))

(assert (not b!669296))

(assert (not b!669301))

(assert (not b!669295))

(assert (not start!60124))

(assert (not b!669298))

(assert (not b!669292))

(assert (not b!669293))

(assert (not b!669297))

(assert (not b!669287))

(assert (not b!669283))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

