; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60494 () Bool)

(assert start!60494)

(declare-fun b!679882 () Bool)

(declare-fun res!446209 () Bool)

(declare-fun e!387308 () Bool)

(assert (=> b!679882 (=> (not res!446209) (not e!387308))))

(declare-datatypes ((array!39475 0))(
  ( (array!39476 (arr!18927 (Array (_ BitVec 32) (_ BitVec 64))) (size!19291 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39475)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12968 0))(
  ( (Nil!12965) (Cons!12964 (h!14009 (_ BitVec 64)) (t!19196 List!12968)) )
))
(declare-fun acc!681 () List!12968)

(declare-fun arrayNoDuplicates!0 (array!39475 (_ BitVec 32) List!12968) Bool)

(assert (=> b!679882 (= res!446209 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679883 () Bool)

(declare-fun res!446206 () Bool)

(assert (=> b!679883 (=> (not res!446206) (not e!387308))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679883 (= res!446206 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19291 a!3626))))))

(declare-fun b!679884 () Bool)

(declare-fun res!446208 () Bool)

(assert (=> b!679884 (=> (not res!446208) (not e!387308))))

(assert (=> b!679884 (= res!446208 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19291 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!446213 () Bool)

(assert (=> start!60494 (=> (not res!446213) (not e!387308))))

(assert (=> start!60494 (= res!446213 (and (bvslt (size!19291 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19291 a!3626))))))

(assert (=> start!60494 e!387308))

(assert (=> start!60494 true))

(declare-fun array_inv!14723 (array!39475) Bool)

(assert (=> start!60494 (array_inv!14723 a!3626)))

(declare-fun b!679885 () Bool)

(declare-fun res!446207 () Bool)

(assert (=> b!679885 (=> (not res!446207) (not e!387308))))

(declare-fun contains!3545 (List!12968 (_ BitVec 64)) Bool)

(assert (=> b!679885 (= res!446207 (not (contains!3545 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679886 () Bool)

(declare-fun e!387310 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!679886 (= e!387310 (contains!3545 acc!681 k!2843))))

(declare-fun b!679887 () Bool)

(declare-fun res!446210 () Bool)

(assert (=> b!679887 (=> (not res!446210) (not e!387308))))

(assert (=> b!679887 (= res!446210 (not (contains!3545 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679888 () Bool)

(declare-fun res!446215 () Bool)

(assert (=> b!679888 (=> (not res!446215) (not e!387308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679888 (= res!446215 (validKeyInArray!0 k!2843))))

(declare-fun b!679889 () Bool)

(declare-datatypes ((Unit!23826 0))(
  ( (Unit!23827) )
))
(declare-fun e!387312 () Unit!23826)

(declare-fun Unit!23828 () Unit!23826)

(assert (=> b!679889 (= e!387312 Unit!23828)))

(declare-fun lt!312987 () Unit!23826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39475 (_ BitVec 64) (_ BitVec 32)) Unit!23826)

(assert (=> b!679889 (= lt!312987 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!679889 false))

(declare-fun b!679890 () Bool)

(declare-fun res!446211 () Bool)

(assert (=> b!679890 (=> (not res!446211) (not e!387308))))

(declare-fun arrayContainsKey!0 (array!39475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679890 (= res!446211 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679891 () Bool)

(declare-fun res!446212 () Bool)

(assert (=> b!679891 (=> (not res!446212) (not e!387308))))

(assert (=> b!679891 (= res!446212 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12965))))

(declare-fun b!679892 () Bool)

(declare-fun res!446205 () Bool)

(assert (=> b!679892 (=> (not res!446205) (not e!387308))))

(declare-fun e!387309 () Bool)

(assert (=> b!679892 (= res!446205 e!387309)))

(declare-fun res!446204 () Bool)

(assert (=> b!679892 (=> res!446204 e!387309)))

(assert (=> b!679892 (= res!446204 e!387310)))

(declare-fun res!446214 () Bool)

(assert (=> b!679892 (=> (not res!446214) (not e!387310))))

(assert (=> b!679892 (= res!446214 (bvsgt from!3004 i!1382))))

(declare-fun b!679893 () Bool)

(declare-fun e!387311 () Bool)

(assert (=> b!679893 (= e!387309 e!387311)))

(declare-fun res!446216 () Bool)

(assert (=> b!679893 (=> (not res!446216) (not e!387311))))

(assert (=> b!679893 (= res!446216 (bvsle from!3004 i!1382))))

(declare-fun b!679894 () Bool)

(declare-fun res!446202 () Bool)

(assert (=> b!679894 (=> (not res!446202) (not e!387308))))

(declare-fun noDuplicate!792 (List!12968) Bool)

(assert (=> b!679894 (= res!446202 (noDuplicate!792 acc!681))))

(declare-fun b!679895 () Bool)

(declare-fun e!387307 () Bool)

(assert (=> b!679895 (= e!387307 true)))

(declare-fun subseq!131 (List!12968 List!12968) Bool)

(assert (=> b!679895 (subseq!131 acc!681 acc!681)))

(declare-fun lt!312986 () Unit!23826)

(declare-fun lemmaListSubSeqRefl!0 (List!12968) Unit!23826)

(assert (=> b!679895 (= lt!312986 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679896 () Bool)

(assert (=> b!679896 (= e!387311 (not (contains!3545 acc!681 k!2843)))))

(declare-fun b!679897 () Bool)

(assert (=> b!679897 (= e!387308 (not e!387307))))

(declare-fun res!446203 () Bool)

(assert (=> b!679897 (=> res!446203 e!387307)))

(assert (=> b!679897 (= res!446203 (not (validKeyInArray!0 (select (arr!18927 a!3626) from!3004))))))

(declare-fun lt!312988 () Unit!23826)

(assert (=> b!679897 (= lt!312988 e!387312)))

(declare-fun c!77207 () Bool)

(assert (=> b!679897 (= c!77207 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679897 (arrayContainsKey!0 (array!39476 (store (arr!18927 a!3626) i!1382 k!2843) (size!19291 a!3626)) k!2843 from!3004)))

(declare-fun b!679898 () Bool)

(declare-fun Unit!23829 () Unit!23826)

(assert (=> b!679898 (= e!387312 Unit!23829)))

(assert (= (and start!60494 res!446213) b!679894))

(assert (= (and b!679894 res!446202) b!679885))

(assert (= (and b!679885 res!446207) b!679887))

(assert (= (and b!679887 res!446210) b!679892))

(assert (= (and b!679892 res!446214) b!679886))

(assert (= (and b!679892 (not res!446204)) b!679893))

(assert (= (and b!679893 res!446216) b!679896))

(assert (= (and b!679892 res!446205) b!679891))

(assert (= (and b!679891 res!446212) b!679882))

(assert (= (and b!679882 res!446209) b!679883))

(assert (= (and b!679883 res!446206) b!679888))

(assert (= (and b!679888 res!446215) b!679890))

(assert (= (and b!679890 res!446211) b!679884))

(assert (= (and b!679884 res!446208) b!679897))

(assert (= (and b!679897 c!77207) b!679889))

(assert (= (and b!679897 (not c!77207)) b!679898))

(assert (= (and b!679897 (not res!446203)) b!679895))

(declare-fun m!645119 () Bool)

(assert (=> b!679896 m!645119))

(declare-fun m!645121 () Bool)

(assert (=> b!679894 m!645121))

(assert (=> b!679886 m!645119))

(declare-fun m!645123 () Bool)

(assert (=> b!679882 m!645123))

(declare-fun m!645125 () Bool)

(assert (=> start!60494 m!645125))

(declare-fun m!645127 () Bool)

(assert (=> b!679890 m!645127))

(declare-fun m!645129 () Bool)

(assert (=> b!679887 m!645129))

(declare-fun m!645131 () Bool)

(assert (=> b!679895 m!645131))

(declare-fun m!645133 () Bool)

(assert (=> b!679895 m!645133))

(declare-fun m!645135 () Bool)

(assert (=> b!679885 m!645135))

(declare-fun m!645137 () Bool)

(assert (=> b!679889 m!645137))

(declare-fun m!645139 () Bool)

(assert (=> b!679897 m!645139))

(declare-fun m!645141 () Bool)

(assert (=> b!679897 m!645141))

(declare-fun m!645143 () Bool)

(assert (=> b!679897 m!645143))

(assert (=> b!679897 m!645139))

(declare-fun m!645145 () Bool)

(assert (=> b!679897 m!645145))

(declare-fun m!645147 () Bool)

(assert (=> b!679897 m!645147))

(declare-fun m!645149 () Bool)

(assert (=> b!679888 m!645149))

(declare-fun m!645151 () Bool)

(assert (=> b!679891 m!645151))

(push 1)

(assert (not b!679889))

(assert (not start!60494))

(assert (not b!679891))

(assert (not b!679896))

(assert (not b!679886))

(assert (not b!679885))

(assert (not b!679897))

(assert (not b!679888))

(assert (not b!679895))

(assert (not b!679887))

(assert (not b!679882))

(assert (not b!679894))

(assert (not b!679890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

