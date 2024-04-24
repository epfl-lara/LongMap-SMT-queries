; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60088 () Bool)

(assert start!60088)

(declare-fun b!667927 () Bool)

(declare-fun res!434991 () Bool)

(declare-fun e!382282 () Bool)

(assert (=> b!667927 (=> (not res!434991) (not e!382282))))

(declare-datatypes ((List!12674 0))(
  ( (Nil!12671) (Cons!12670 (h!13718 (_ BitVec 64)) (t!18894 List!12674)) )
))
(declare-fun acc!681 () List!12674)

(declare-fun noDuplicate!600 (List!12674) Bool)

(assert (=> b!667927 (= res!434991 (noDuplicate!600 acc!681))))

(declare-fun b!667928 () Bool)

(declare-datatypes ((Unit!23359 0))(
  ( (Unit!23360) )
))
(declare-fun e!382283 () Unit!23359)

(declare-fun Unit!23361 () Unit!23359)

(assert (=> b!667928 (= e!382283 Unit!23361)))

(declare-fun b!667929 () Bool)

(declare-fun e!382279 () Bool)

(declare-fun e!382280 () Bool)

(assert (=> b!667929 (= e!382279 e!382280)))

(declare-fun res!434985 () Bool)

(assert (=> b!667929 (=> (not res!434985) (not e!382280))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667929 (= res!434985 (bvsle from!3004 i!1382))))

(declare-fun b!667930 () Bool)

(declare-fun res!435002 () Bool)

(assert (=> b!667930 (=> (not res!435002) (not e!382282))))

(declare-fun contains!3326 (List!12674 (_ BitVec 64)) Bool)

(assert (=> b!667930 (= res!435002 (not (contains!3326 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!434998 () Bool)

(assert (=> start!60088 (=> (not res!434998) (not e!382282))))

(declare-datatypes ((array!39073 0))(
  ( (array!39074 (arr!18726 (Array (_ BitVec 32) (_ BitVec 64))) (size!19090 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39073)

(assert (=> start!60088 (= res!434998 (and (bvslt (size!19090 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19090 a!3626))))))

(assert (=> start!60088 e!382282))

(assert (=> start!60088 true))

(declare-fun array_inv!14585 (array!39073) Bool)

(assert (=> start!60088 (array_inv!14585 a!3626)))

(declare-fun b!667931 () Bool)

(declare-fun e!382284 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!667931 (= e!382284 (contains!3326 acc!681 k!2843))))

(declare-fun b!667932 () Bool)

(declare-fun res!434986 () Bool)

(assert (=> b!667932 (=> (not res!434986) (not e!382282))))

(assert (=> b!667932 (= res!434986 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19090 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667933 () Bool)

(declare-fun res!434987 () Bool)

(assert (=> b!667933 (=> (not res!434987) (not e!382282))))

(assert (=> b!667933 (= res!434987 e!382279)))

(declare-fun res!435004 () Bool)

(assert (=> b!667933 (=> res!435004 e!382279)))

(assert (=> b!667933 (= res!435004 e!382284)))

(declare-fun res!434999 () Bool)

(assert (=> b!667933 (=> (not res!434999) (not e!382284))))

(assert (=> b!667933 (= res!434999 (bvsgt from!3004 i!1382))))

(declare-fun b!667934 () Bool)

(declare-fun e!382274 () Bool)

(declare-fun e!382277 () Bool)

(assert (=> b!667934 (= e!382274 e!382277)))

(declare-fun res!435003 () Bool)

(assert (=> b!667934 (=> (not res!435003) (not e!382277))))

(assert (=> b!667934 (= res!435003 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667935 () Bool)

(declare-fun e!382276 () Bool)

(assert (=> b!667935 (= e!382282 (not e!382276))))

(declare-fun res!434995 () Bool)

(assert (=> b!667935 (=> res!434995 e!382276)))

(assert (=> b!667935 (= res!434995 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!311032 () List!12674)

(declare-fun arrayNoDuplicates!0 (array!39073 (_ BitVec 32) List!12674) Bool)

(assert (=> b!667935 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311032)))

(declare-fun lt!311030 () Unit!23359)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39073 (_ BitVec 64) (_ BitVec 32) List!12674 List!12674) Unit!23359)

(assert (=> b!667935 (= lt!311030 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311032))))

(declare-fun -!85 (List!12674 (_ BitVec 64)) List!12674)

(assert (=> b!667935 (= (-!85 lt!311032 k!2843) acc!681)))

(declare-fun $colon$colon!217 (List!12674 (_ BitVec 64)) List!12674)

(assert (=> b!667935 (= lt!311032 ($colon$colon!217 acc!681 k!2843))))

(declare-fun lt!311026 () Unit!23359)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12674) Unit!23359)

(assert (=> b!667935 (= lt!311026 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!88 (List!12674 List!12674) Bool)

(assert (=> b!667935 (subseq!88 acc!681 acc!681)))

(declare-fun lt!311035 () Unit!23359)

(declare-fun lemmaListSubSeqRefl!0 (List!12674) Unit!23359)

(assert (=> b!667935 (= lt!311035 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667935 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311028 () Unit!23359)

(declare-fun e!382275 () Unit!23359)

(assert (=> b!667935 (= lt!311028 e!382275)))

(declare-fun c!76840 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667935 (= c!76840 (validKeyInArray!0 (select (arr!18726 a!3626) from!3004)))))

(declare-fun lt!311029 () Unit!23359)

(assert (=> b!667935 (= lt!311029 e!382283)))

(declare-fun c!76841 () Bool)

(declare-fun arrayContainsKey!0 (array!39073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667935 (= c!76841 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667935 (arrayContainsKey!0 (array!39074 (store (arr!18726 a!3626) i!1382 k!2843) (size!19090 a!3626)) k!2843 from!3004)))

(declare-fun b!667936 () Bool)

(declare-fun e!382281 () Bool)

(assert (=> b!667936 (= e!382281 (contains!3326 lt!311032 k!2843))))

(declare-fun b!667937 () Bool)

(declare-fun res!434990 () Bool)

(assert (=> b!667937 (=> res!434990 e!382276)))

(assert (=> b!667937 (= res!434990 (contains!3326 lt!311032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667938 () Bool)

(declare-fun res!434997 () Bool)

(assert (=> b!667938 (=> (not res!434997) (not e!382282))))

(assert (=> b!667938 (= res!434997 (validKeyInArray!0 k!2843))))

(declare-fun b!667939 () Bool)

(assert (=> b!667939 (= e!382277 (not (contains!3326 lt!311032 k!2843)))))

(declare-fun b!667940 () Bool)

(declare-fun lt!311034 () Unit!23359)

(assert (=> b!667940 (= e!382275 lt!311034)))

(declare-fun lt!311031 () Unit!23359)

(assert (=> b!667940 (= lt!311031 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667940 (subseq!88 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39073 List!12674 List!12674 (_ BitVec 32)) Unit!23359)

(assert (=> b!667940 (= lt!311034 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!217 acc!681 (select (arr!18726 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667940 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667941 () Bool)

(declare-fun res!434994 () Bool)

(assert (=> b!667941 (=> (not res!434994) (not e!382282))))

(assert (=> b!667941 (= res!434994 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667942 () Bool)

(declare-fun res!434993 () Bool)

(assert (=> b!667942 (=> (not res!434993) (not e!382282))))

(assert (=> b!667942 (= res!434993 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12671))))

(declare-fun b!667943 () Bool)

(declare-fun res!435001 () Bool)

(assert (=> b!667943 (=> (not res!435001) (not e!382282))))

(assert (=> b!667943 (= res!435001 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19090 a!3626))))))

(declare-fun b!667944 () Bool)

(declare-fun res!434996 () Bool)

(assert (=> b!667944 (=> (not res!434996) (not e!382282))))

(assert (=> b!667944 (= res!434996 (not (contains!3326 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667945 () Bool)

(declare-fun res!434988 () Bool)

(assert (=> b!667945 (=> res!434988 e!382276)))

(assert (=> b!667945 (= res!434988 (not (noDuplicate!600 lt!311032)))))

(declare-fun b!667946 () Bool)

(assert (=> b!667946 (= e!382276 true)))

(declare-fun lt!311033 () Bool)

(assert (=> b!667946 (= lt!311033 e!382274)))

(declare-fun res!434992 () Bool)

(assert (=> b!667946 (=> res!434992 e!382274)))

(assert (=> b!667946 (= res!434992 e!382281)))

(declare-fun res!434989 () Bool)

(assert (=> b!667946 (=> (not res!434989) (not e!382281))))

(assert (=> b!667946 (= res!434989 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667947 () Bool)

(declare-fun res!435000 () Bool)

(assert (=> b!667947 (=> res!435000 e!382276)))

(assert (=> b!667947 (= res!435000 (contains!3326 lt!311032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667948 () Bool)

(declare-fun Unit!23362 () Unit!23359)

(assert (=> b!667948 (= e!382275 Unit!23362)))

(declare-fun b!667949 () Bool)

(declare-fun Unit!23363 () Unit!23359)

(assert (=> b!667949 (= e!382283 Unit!23363)))

(declare-fun lt!311027 () Unit!23359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39073 (_ BitVec 64) (_ BitVec 32)) Unit!23359)

(assert (=> b!667949 (= lt!311027 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667949 false))

(declare-fun b!667950 () Bool)

(declare-fun res!434984 () Bool)

(assert (=> b!667950 (=> (not res!434984) (not e!382282))))

(assert (=> b!667950 (= res!434984 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667951 () Bool)

(assert (=> b!667951 (= e!382280 (not (contains!3326 acc!681 k!2843)))))

(assert (= (and start!60088 res!434998) b!667927))

(assert (= (and b!667927 res!434991) b!667930))

(assert (= (and b!667930 res!435002) b!667944))

(assert (= (and b!667944 res!434996) b!667933))

(assert (= (and b!667933 res!434999) b!667931))

(assert (= (and b!667933 (not res!435004)) b!667929))

(assert (= (and b!667929 res!434985) b!667951))

(assert (= (and b!667933 res!434987) b!667942))

(assert (= (and b!667942 res!434993) b!667941))

(assert (= (and b!667941 res!434994) b!667943))

(assert (= (and b!667943 res!435001) b!667938))

(assert (= (and b!667938 res!434997) b!667950))

(assert (= (and b!667950 res!434984) b!667932))

(assert (= (and b!667932 res!434986) b!667935))

(assert (= (and b!667935 c!76841) b!667949))

(assert (= (and b!667935 (not c!76841)) b!667928))

(assert (= (and b!667935 c!76840) b!667940))

(assert (= (and b!667935 (not c!76840)) b!667948))

(assert (= (and b!667935 (not res!434995)) b!667945))

(assert (= (and b!667945 (not res!434988)) b!667947))

(assert (= (and b!667947 (not res!435000)) b!667937))

(assert (= (and b!667937 (not res!434990)) b!667946))

(assert (= (and b!667946 res!434989) b!667936))

(assert (= (and b!667946 (not res!434992)) b!667934))

(assert (= (and b!667934 res!435003) b!667939))

(declare-fun m!638889 () Bool)

(assert (=> b!667927 m!638889))

(declare-fun m!638891 () Bool)

(assert (=> b!667944 m!638891))

(declare-fun m!638893 () Bool)

(assert (=> b!667945 m!638893))

(declare-fun m!638895 () Bool)

(assert (=> b!667935 m!638895))

(declare-fun m!638897 () Bool)

(assert (=> b!667935 m!638897))

(declare-fun m!638899 () Bool)

(assert (=> b!667935 m!638899))

(declare-fun m!638901 () Bool)

(assert (=> b!667935 m!638901))

(declare-fun m!638903 () Bool)

(assert (=> b!667935 m!638903))

(declare-fun m!638905 () Bool)

(assert (=> b!667935 m!638905))

(declare-fun m!638907 () Bool)

(assert (=> b!667935 m!638907))

(declare-fun m!638909 () Bool)

(assert (=> b!667935 m!638909))

(assert (=> b!667935 m!638899))

(declare-fun m!638911 () Bool)

(assert (=> b!667935 m!638911))

(declare-fun m!638913 () Bool)

(assert (=> b!667935 m!638913))

(declare-fun m!638915 () Bool)

(assert (=> b!667935 m!638915))

(declare-fun m!638917 () Bool)

(assert (=> b!667935 m!638917))

(declare-fun m!638919 () Bool)

(assert (=> b!667935 m!638919))

(assert (=> b!667940 m!638897))

(assert (=> b!667940 m!638899))

(declare-fun m!638921 () Bool)

(assert (=> b!667940 m!638921))

(declare-fun m!638923 () Bool)

(assert (=> b!667940 m!638923))

(assert (=> b!667940 m!638899))

(assert (=> b!667940 m!638921))

(assert (=> b!667940 m!638905))

(assert (=> b!667940 m!638919))

(declare-fun m!638925 () Bool)

(assert (=> b!667931 m!638925))

(declare-fun m!638927 () Bool)

(assert (=> b!667938 m!638927))

(assert (=> b!667951 m!638925))

(declare-fun m!638929 () Bool)

(assert (=> b!667939 m!638929))

(declare-fun m!638931 () Bool)

(assert (=> b!667949 m!638931))

(declare-fun m!638933 () Bool)

(assert (=> b!667950 m!638933))

(assert (=> b!667936 m!638929))

(declare-fun m!638935 () Bool)

(assert (=> b!667941 m!638935))

(declare-fun m!638937 () Bool)

(assert (=> b!667947 m!638937))

(declare-fun m!638939 () Bool)

(assert (=> b!667937 m!638939))

(declare-fun m!638941 () Bool)

(assert (=> b!667930 m!638941))

(declare-fun m!638943 () Bool)

(assert (=> b!667942 m!638943))

(declare-fun m!638945 () Bool)

(assert (=> start!60088 m!638945))

(push 1)

(assert (not b!667951))

(assert (not b!667944))

(assert (not b!667938))

(assert (not b!667950))

(assert (not b!667927))

(assert (not b!667936))

(assert (not b!667949))

(assert (not start!60088))

(assert (not b!667942))

(assert (not b!667930))

(assert (not b!667941))

(assert (not b!667947))

(assert (not b!667945))

(assert (not b!667931))

(assert (not b!667937))

(assert (not b!667939))

(assert (not b!667940))

(assert (not b!667935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

