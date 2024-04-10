; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60036 () Bool)

(assert start!60036)

(declare-fun res!435064 () Bool)

(declare-fun e!382240 () Bool)

(assert (=> start!60036 (=> (not res!435064) (not e!382240))))

(declare-datatypes ((array!39083 0))(
  ( (array!39084 (arr!18734 (Array (_ BitVec 32) (_ BitVec 64))) (size!19098 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39083)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60036 (= res!435064 (and (bvslt (size!19098 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19098 a!3626))))))

(assert (=> start!60036 e!382240))

(assert (=> start!60036 true))

(declare-fun array_inv!14530 (array!39083) Bool)

(assert (=> start!60036 (array_inv!14530 a!3626)))

(declare-fun b!667928 () Bool)

(declare-fun res!435076 () Bool)

(assert (=> b!667928 (=> (not res!435076) (not e!382240))))

(declare-datatypes ((List!12775 0))(
  ( (Nil!12772) (Cons!12771 (h!13816 (_ BitVec 64)) (t!19003 List!12775)) )
))
(declare-fun acc!681 () List!12775)

(declare-fun arrayNoDuplicates!0 (array!39083 (_ BitVec 32) List!12775) Bool)

(assert (=> b!667928 (= res!435076 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667929 () Bool)

(declare-fun e!382238 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3352 (List!12775 (_ BitVec 64)) Bool)

(assert (=> b!667929 (= e!382238 (contains!3352 acc!681 k!2843))))

(declare-fun b!667930 () Bool)

(declare-fun res!435066 () Bool)

(assert (=> b!667930 (=> (not res!435066) (not e!382240))))

(assert (=> b!667930 (= res!435066 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12772))))

(declare-fun b!667931 () Bool)

(declare-fun res!435069 () Bool)

(assert (=> b!667931 (=> (not res!435069) (not e!382240))))

(declare-fun e!382242 () Bool)

(assert (=> b!667931 (= res!435069 e!382242)))

(declare-fun res!435080 () Bool)

(assert (=> b!667931 (=> res!435080 e!382242)))

(assert (=> b!667931 (= res!435080 e!382238)))

(declare-fun res!435068 () Bool)

(assert (=> b!667931 (=> (not res!435068) (not e!382238))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667931 (= res!435068 (bvsgt from!3004 i!1382))))

(declare-fun b!667932 () Bool)

(declare-fun e!382237 () Bool)

(assert (=> b!667932 (= e!382240 (not e!382237))))

(declare-fun res!435070 () Bool)

(assert (=> b!667932 (=> res!435070 e!382237)))

(assert (=> b!667932 (= res!435070 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!311020 () List!12775)

(assert (=> b!667932 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311020)))

(declare-datatypes ((Unit!23395 0))(
  ( (Unit!23396) )
))
(declare-fun lt!311017 () Unit!23395)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39083 (_ BitVec 64) (_ BitVec 32) List!12775 List!12775) Unit!23395)

(assert (=> b!667932 (= lt!311017 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311020))))

(declare-fun -!89 (List!12775 (_ BitVec 64)) List!12775)

(assert (=> b!667932 (= (-!89 lt!311020 k!2843) acc!681)))

(declare-fun $colon$colon!223 (List!12775 (_ BitVec 64)) List!12775)

(assert (=> b!667932 (= lt!311020 ($colon$colon!223 acc!681 k!2843))))

(declare-fun lt!311015 () Unit!23395)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12775) Unit!23395)

(assert (=> b!667932 (= lt!311015 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!91 (List!12775 List!12775) Bool)

(assert (=> b!667932 (subseq!91 acc!681 acc!681)))

(declare-fun lt!311016 () Unit!23395)

(declare-fun lemmaListSubSeqRefl!0 (List!12775) Unit!23395)

(assert (=> b!667932 (= lt!311016 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667932 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311014 () Unit!23395)

(declare-fun e!382232 () Unit!23395)

(assert (=> b!667932 (= lt!311014 e!382232)))

(declare-fun c!76801 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667932 (= c!76801 (validKeyInArray!0 (select (arr!18734 a!3626) from!3004)))))

(declare-fun lt!311018 () Unit!23395)

(declare-fun e!382239 () Unit!23395)

(assert (=> b!667932 (= lt!311018 e!382239)))

(declare-fun c!76802 () Bool)

(declare-fun arrayContainsKey!0 (array!39083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667932 (= c!76802 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667932 (arrayContainsKey!0 (array!39084 (store (arr!18734 a!3626) i!1382 k!2843) (size!19098 a!3626)) k!2843 from!3004)))

(declare-fun b!667933 () Bool)

(declare-fun res!435071 () Bool)

(assert (=> b!667933 (=> (not res!435071) (not e!382240))))

(assert (=> b!667933 (= res!435071 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667934 () Bool)

(assert (=> b!667934 (= e!382237 true)))

(declare-fun lt!311019 () Bool)

(declare-fun e!382234 () Bool)

(assert (=> b!667934 (= lt!311019 e!382234)))

(declare-fun res!435067 () Bool)

(assert (=> b!667934 (=> res!435067 e!382234)))

(declare-fun e!382241 () Bool)

(assert (=> b!667934 (= res!435067 e!382241)))

(declare-fun res!435065 () Bool)

(assert (=> b!667934 (=> (not res!435065) (not e!382241))))

(assert (=> b!667934 (= res!435065 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667935 () Bool)

(declare-fun e!382236 () Bool)

(assert (=> b!667935 (= e!382236 (not (contains!3352 lt!311020 k!2843)))))

(declare-fun b!667936 () Bool)

(declare-fun res!435073 () Bool)

(assert (=> b!667936 (=> (not res!435073) (not e!382240))))

(assert (=> b!667936 (= res!435073 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19098 a!3626))))))

(declare-fun b!667937 () Bool)

(declare-fun e!382233 () Bool)

(assert (=> b!667937 (= e!382242 e!382233)))

(declare-fun res!435074 () Bool)

(assert (=> b!667937 (=> (not res!435074) (not e!382233))))

(assert (=> b!667937 (= res!435074 (bvsle from!3004 i!1382))))

(declare-fun b!667938 () Bool)

(declare-fun res!435060 () Bool)

(assert (=> b!667938 (=> (not res!435060) (not e!382240))))

(assert (=> b!667938 (= res!435060 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19098 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667939 () Bool)

(declare-fun Unit!23397 () Unit!23395)

(assert (=> b!667939 (= e!382239 Unit!23397)))

(declare-fun b!667940 () Bool)

(declare-fun Unit!23398 () Unit!23395)

(assert (=> b!667940 (= e!382232 Unit!23398)))

(declare-fun b!667941 () Bool)

(declare-fun res!435061 () Bool)

(assert (=> b!667941 (=> (not res!435061) (not e!382240))))

(assert (=> b!667941 (= res!435061 (not (contains!3352 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667942 () Bool)

(assert (=> b!667942 (= e!382233 (not (contains!3352 acc!681 k!2843)))))

(declare-fun b!667943 () Bool)

(assert (=> b!667943 (= e!382241 (contains!3352 lt!311020 k!2843))))

(declare-fun b!667944 () Bool)

(assert (=> b!667944 (= e!382234 e!382236)))

(declare-fun res!435075 () Bool)

(assert (=> b!667944 (=> (not res!435075) (not e!382236))))

(assert (=> b!667944 (= res!435075 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667945 () Bool)

(declare-fun res!435078 () Bool)

(assert (=> b!667945 (=> res!435078 e!382237)))

(assert (=> b!667945 (= res!435078 (contains!3352 lt!311020 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667946 () Bool)

(declare-fun res!435077 () Bool)

(assert (=> b!667946 (=> res!435077 e!382237)))

(assert (=> b!667946 (= res!435077 (contains!3352 lt!311020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667947 () Bool)

(declare-fun res!435079 () Bool)

(assert (=> b!667947 (=> (not res!435079) (not e!382240))))

(declare-fun noDuplicate!599 (List!12775) Bool)

(assert (=> b!667947 (= res!435079 (noDuplicate!599 acc!681))))

(declare-fun b!667948 () Bool)

(declare-fun res!435062 () Bool)

(assert (=> b!667948 (=> (not res!435062) (not e!382240))))

(assert (=> b!667948 (= res!435062 (validKeyInArray!0 k!2843))))

(declare-fun b!667949 () Bool)

(declare-fun lt!311023 () Unit!23395)

(assert (=> b!667949 (= e!382232 lt!311023)))

(declare-fun lt!311022 () Unit!23395)

(assert (=> b!667949 (= lt!311022 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667949 (subseq!91 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39083 List!12775 List!12775 (_ BitVec 32)) Unit!23395)

(assert (=> b!667949 (= lt!311023 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!223 acc!681 (select (arr!18734 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667949 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667950 () Bool)

(declare-fun res!435072 () Bool)

(assert (=> b!667950 (=> res!435072 e!382237)))

(assert (=> b!667950 (= res!435072 (not (noDuplicate!599 lt!311020)))))

(declare-fun b!667951 () Bool)

(declare-fun res!435063 () Bool)

(assert (=> b!667951 (=> (not res!435063) (not e!382240))))

(assert (=> b!667951 (= res!435063 (not (contains!3352 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667952 () Bool)

(declare-fun Unit!23399 () Unit!23395)

(assert (=> b!667952 (= e!382239 Unit!23399)))

(declare-fun lt!311021 () Unit!23395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39083 (_ BitVec 64) (_ BitVec 32)) Unit!23395)

(assert (=> b!667952 (= lt!311021 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667952 false))

(assert (= (and start!60036 res!435064) b!667947))

(assert (= (and b!667947 res!435079) b!667951))

(assert (= (and b!667951 res!435063) b!667941))

(assert (= (and b!667941 res!435061) b!667931))

(assert (= (and b!667931 res!435068) b!667929))

(assert (= (and b!667931 (not res!435080)) b!667937))

(assert (= (and b!667937 res!435074) b!667942))

(assert (= (and b!667931 res!435069) b!667930))

(assert (= (and b!667930 res!435066) b!667928))

(assert (= (and b!667928 res!435076) b!667936))

(assert (= (and b!667936 res!435073) b!667948))

(assert (= (and b!667948 res!435062) b!667933))

(assert (= (and b!667933 res!435071) b!667938))

(assert (= (and b!667938 res!435060) b!667932))

(assert (= (and b!667932 c!76802) b!667952))

(assert (= (and b!667932 (not c!76802)) b!667939))

(assert (= (and b!667932 c!76801) b!667949))

(assert (= (and b!667932 (not c!76801)) b!667940))

(assert (= (and b!667932 (not res!435070)) b!667950))

(assert (= (and b!667950 (not res!435072)) b!667946))

(assert (= (and b!667946 (not res!435077)) b!667945))

(assert (= (and b!667945 (not res!435078)) b!667934))

(assert (= (and b!667934 res!435065) b!667943))

(assert (= (and b!667934 (not res!435067)) b!667944))

(assert (= (and b!667944 res!435075) b!667935))

(declare-fun m!638365 () Bool)

(assert (=> start!60036 m!638365))

(declare-fun m!638367 () Bool)

(assert (=> b!667952 m!638367))

(declare-fun m!638369 () Bool)

(assert (=> b!667949 m!638369))

(declare-fun m!638371 () Bool)

(assert (=> b!667949 m!638371))

(declare-fun m!638373 () Bool)

(assert (=> b!667949 m!638373))

(declare-fun m!638375 () Bool)

(assert (=> b!667949 m!638375))

(assert (=> b!667949 m!638371))

(assert (=> b!667949 m!638373))

(declare-fun m!638377 () Bool)

(assert (=> b!667949 m!638377))

(declare-fun m!638379 () Bool)

(assert (=> b!667949 m!638379))

(declare-fun m!638381 () Bool)

(assert (=> b!667943 m!638381))

(declare-fun m!638383 () Bool)

(assert (=> b!667929 m!638383))

(assert (=> b!667942 m!638383))

(declare-fun m!638385 () Bool)

(assert (=> b!667950 m!638385))

(declare-fun m!638387 () Bool)

(assert (=> b!667941 m!638387))

(declare-fun m!638389 () Bool)

(assert (=> b!667928 m!638389))

(assert (=> b!667935 m!638381))

(declare-fun m!638391 () Bool)

(assert (=> b!667930 m!638391))

(declare-fun m!638393 () Bool)

(assert (=> b!667947 m!638393))

(declare-fun m!638395 () Bool)

(assert (=> b!667948 m!638395))

(declare-fun m!638397 () Bool)

(assert (=> b!667933 m!638397))

(declare-fun m!638399 () Bool)

(assert (=> b!667945 m!638399))

(declare-fun m!638401 () Bool)

(assert (=> b!667946 m!638401))

(assert (=> b!667932 m!638369))

(assert (=> b!667932 m!638371))

(declare-fun m!638403 () Bool)

(assert (=> b!667932 m!638403))

(declare-fun m!638405 () Bool)

(assert (=> b!667932 m!638405))

(assert (=> b!667932 m!638377))

(declare-fun m!638407 () Bool)

(assert (=> b!667932 m!638407))

(declare-fun m!638409 () Bool)

(assert (=> b!667932 m!638409))

(declare-fun m!638411 () Bool)

(assert (=> b!667932 m!638411))

(declare-fun m!638413 () Bool)

(assert (=> b!667932 m!638413))

(declare-fun m!638415 () Bool)

(assert (=> b!667932 m!638415))

(assert (=> b!667932 m!638371))

(declare-fun m!638417 () Bool)

(assert (=> b!667932 m!638417))

(declare-fun m!638419 () Bool)

(assert (=> b!667932 m!638419))

(assert (=> b!667932 m!638379))

(declare-fun m!638421 () Bool)

(assert (=> b!667951 m!638421))

(push 1)

(assert (not b!667930))

(assert (not b!667946))

(assert (not b!667943))

(assert (not b!667941))

(assert (not b!667935))

(assert (not b!667933))

(assert (not b!667951))

(assert (not b!667945))

(assert (not b!667929))

(assert (not b!667932))

(assert (not b!667928))

(assert (not b!667949))

(assert (not start!60036))

(assert (not b!667950))

