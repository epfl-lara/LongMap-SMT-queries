; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60498 () Bool)

(assert start!60498)

(declare-fun b!679984 () Bool)

(declare-fun e!387350 () Bool)

(assert (=> b!679984 (= e!387350 true)))

(declare-datatypes ((List!12970 0))(
  ( (Nil!12967) (Cons!12966 (h!14011 (_ BitVec 64)) (t!19198 List!12970)) )
))
(declare-fun acc!681 () List!12970)

(declare-fun subseq!133 (List!12970 List!12970) Bool)

(assert (=> b!679984 (subseq!133 acc!681 acc!681)))

(declare-datatypes ((Unit!23834 0))(
  ( (Unit!23835) )
))
(declare-fun lt!313005 () Unit!23834)

(declare-fun lemmaListSubSeqRefl!0 (List!12970) Unit!23834)

(assert (=> b!679984 (= lt!313005 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679985 () Bool)

(declare-fun res!446304 () Bool)

(declare-fun e!387348 () Bool)

(assert (=> b!679985 (=> (not res!446304) (not e!387348))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39479 0))(
  ( (array!39480 (arr!18929 (Array (_ BitVec 32) (_ BitVec 64))) (size!19293 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39479)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!679985 (= res!446304 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19293 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679986 () Bool)

(declare-fun e!387353 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3547 (List!12970 (_ BitVec 64)) Bool)

(assert (=> b!679986 (= e!387353 (contains!3547 acc!681 k!2843))))

(declare-fun b!679987 () Bool)

(declare-fun res!446295 () Bool)

(assert (=> b!679987 (=> (not res!446295) (not e!387348))))

(declare-fun arrayContainsKey!0 (array!39479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679987 (= res!446295 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679988 () Bool)

(declare-fun res!446294 () Bool)

(assert (=> b!679988 (=> (not res!446294) (not e!387348))))

(declare-fun e!387352 () Bool)

(assert (=> b!679988 (= res!446294 e!387352)))

(declare-fun res!446305 () Bool)

(assert (=> b!679988 (=> res!446305 e!387352)))

(assert (=> b!679988 (= res!446305 e!387353)))

(declare-fun res!446299 () Bool)

(assert (=> b!679988 (=> (not res!446299) (not e!387353))))

(assert (=> b!679988 (= res!446299 (bvsgt from!3004 i!1382))))

(declare-fun b!679989 () Bool)

(declare-fun res!446297 () Bool)

(assert (=> b!679989 (=> (not res!446297) (not e!387348))))

(assert (=> b!679989 (= res!446297 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19293 a!3626))))))

(declare-fun res!446302 () Bool)

(assert (=> start!60498 (=> (not res!446302) (not e!387348))))

(assert (=> start!60498 (= res!446302 (and (bvslt (size!19293 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19293 a!3626))))))

(assert (=> start!60498 e!387348))

(assert (=> start!60498 true))

(declare-fun array_inv!14725 (array!39479) Bool)

(assert (=> start!60498 (array_inv!14725 a!3626)))

(declare-fun b!679990 () Bool)

(declare-fun e!387351 () Unit!23834)

(declare-fun Unit!23836 () Unit!23834)

(assert (=> b!679990 (= e!387351 Unit!23836)))

(declare-fun b!679991 () Bool)

(declare-fun e!387349 () Bool)

(assert (=> b!679991 (= e!387349 (not (contains!3547 acc!681 k!2843)))))

(declare-fun b!679992 () Bool)

(declare-fun res!446301 () Bool)

(assert (=> b!679992 (=> (not res!446301) (not e!387348))))

(assert (=> b!679992 (= res!446301 (not (contains!3547 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679993 () Bool)

(assert (=> b!679993 (= e!387352 e!387349)))

(declare-fun res!446298 () Bool)

(assert (=> b!679993 (=> (not res!446298) (not e!387349))))

(assert (=> b!679993 (= res!446298 (bvsle from!3004 i!1382))))

(declare-fun b!679994 () Bool)

(declare-fun Unit!23837 () Unit!23834)

(assert (=> b!679994 (= e!387351 Unit!23837)))

(declare-fun lt!313006 () Unit!23834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39479 (_ BitVec 64) (_ BitVec 32)) Unit!23834)

(assert (=> b!679994 (= lt!313006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!679994 false))

(declare-fun b!679995 () Bool)

(declare-fun res!446292 () Bool)

(assert (=> b!679995 (=> (not res!446292) (not e!387348))))

(declare-fun arrayNoDuplicates!0 (array!39479 (_ BitVec 32) List!12970) Bool)

(assert (=> b!679995 (= res!446292 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679996 () Bool)

(declare-fun res!446303 () Bool)

(assert (=> b!679996 (=> (not res!446303) (not e!387348))))

(assert (=> b!679996 (= res!446303 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12967))))

(declare-fun b!679997 () Bool)

(assert (=> b!679997 (= e!387348 (not e!387350))))

(declare-fun res!446293 () Bool)

(assert (=> b!679997 (=> res!446293 e!387350)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679997 (= res!446293 (not (validKeyInArray!0 (select (arr!18929 a!3626) from!3004))))))

(declare-fun lt!313004 () Unit!23834)

(assert (=> b!679997 (= lt!313004 e!387351)))

(declare-fun c!77213 () Bool)

(assert (=> b!679997 (= c!77213 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679997 (arrayContainsKey!0 (array!39480 (store (arr!18929 a!3626) i!1382 k!2843) (size!19293 a!3626)) k!2843 from!3004)))

(declare-fun b!679998 () Bool)

(declare-fun res!446296 () Bool)

(assert (=> b!679998 (=> (not res!446296) (not e!387348))))

(assert (=> b!679998 (= res!446296 (not (contains!3547 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679999 () Bool)

(declare-fun res!446306 () Bool)

(assert (=> b!679999 (=> (not res!446306) (not e!387348))))

(assert (=> b!679999 (= res!446306 (validKeyInArray!0 k!2843))))

(declare-fun b!680000 () Bool)

(declare-fun res!446300 () Bool)

(assert (=> b!680000 (=> (not res!446300) (not e!387348))))

(declare-fun noDuplicate!794 (List!12970) Bool)

(assert (=> b!680000 (= res!446300 (noDuplicate!794 acc!681))))

(assert (= (and start!60498 res!446302) b!680000))

(assert (= (and b!680000 res!446300) b!679998))

(assert (= (and b!679998 res!446296) b!679992))

(assert (= (and b!679992 res!446301) b!679988))

(assert (= (and b!679988 res!446299) b!679986))

(assert (= (and b!679988 (not res!446305)) b!679993))

(assert (= (and b!679993 res!446298) b!679991))

(assert (= (and b!679988 res!446294) b!679996))

(assert (= (and b!679996 res!446303) b!679995))

(assert (= (and b!679995 res!446292) b!679989))

(assert (= (and b!679989 res!446297) b!679999))

(assert (= (and b!679999 res!446306) b!679987))

(assert (= (and b!679987 res!446295) b!679985))

(assert (= (and b!679985 res!446304) b!679997))

(assert (= (and b!679997 c!77213) b!679994))

(assert (= (and b!679997 (not c!77213)) b!679990))

(assert (= (and b!679997 (not res!446293)) b!679984))

(declare-fun m!645187 () Bool)

(assert (=> start!60498 m!645187))

(declare-fun m!645189 () Bool)

(assert (=> b!679991 m!645189))

(declare-fun m!645191 () Bool)

(assert (=> b!679995 m!645191))

(assert (=> b!679986 m!645189))

(declare-fun m!645193 () Bool)

(assert (=> b!679992 m!645193))

(declare-fun m!645195 () Bool)

(assert (=> b!679987 m!645195))

(declare-fun m!645197 () Bool)

(assert (=> b!679984 m!645197))

(declare-fun m!645199 () Bool)

(assert (=> b!679984 m!645199))

(declare-fun m!645201 () Bool)

(assert (=> b!679994 m!645201))

(declare-fun m!645203 () Bool)

(assert (=> b!679999 m!645203))

(declare-fun m!645205 () Bool)

(assert (=> b!680000 m!645205))

(declare-fun m!645207 () Bool)

(assert (=> b!679996 m!645207))

(declare-fun m!645209 () Bool)

(assert (=> b!679997 m!645209))

(declare-fun m!645211 () Bool)

(assert (=> b!679997 m!645211))

(declare-fun m!645213 () Bool)

(assert (=> b!679997 m!645213))

(assert (=> b!679997 m!645209))

(declare-fun m!645215 () Bool)

(assert (=> b!679997 m!645215))

(declare-fun m!645217 () Bool)

(assert (=> b!679997 m!645217))

(declare-fun m!645219 () Bool)

(assert (=> b!679998 m!645219))

(push 1)

(assert (not b!679991))

(assert (not b!679997))

(assert (not b!679992))

(assert (not b!679999))

(assert (not b!679998))

(assert (not b!680000))

(assert (not b!679994))

(assert (not b!679984))

(assert (not b!679995))

(assert (not b!679986))

(assert (not b!679996))

(assert (not b!679987))

(assert (not start!60498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

