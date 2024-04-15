; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60312 () Bool)

(assert start!60312)

(declare-fun b!677284 () Bool)

(declare-fun e!386045 () Bool)

(declare-fun e!386048 () Bool)

(assert (=> b!677284 (= e!386045 e!386048)))

(declare-fun res!443886 () Bool)

(assert (=> b!677284 (=> (not res!443886) (not e!386048))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677284 (= res!443886 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677285 () Bool)

(declare-fun e!386043 () Bool)

(declare-datatypes ((List!12957 0))(
  ( (Nil!12954) (Cons!12953 (h!13998 (_ BitVec 64)) (t!19176 List!12957)) )
))
(declare-fun acc!681 () List!12957)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3479 (List!12957 (_ BitVec 64)) Bool)

(assert (=> b!677285 (= e!386043 (contains!3479 acc!681 k!2843))))

(declare-fun b!677286 () Bool)

(declare-fun e!386044 () Bool)

(assert (=> b!677286 (= e!386044 (contains!3479 acc!681 k!2843))))

(declare-fun b!677287 () Bool)

(declare-fun res!443878 () Bool)

(declare-fun e!386047 () Bool)

(assert (=> b!677287 (=> (not res!443878) (not e!386047))))

(declare-datatypes ((array!39370 0))(
  ( (array!39371 (arr!18877 (Array (_ BitVec 32) (_ BitVec 64))) (size!19242 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39370)

(declare-fun arrayNoDuplicates!0 (array!39370 (_ BitVec 32) List!12957) Bool)

(assert (=> b!677287 (= res!443878 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677289 () Bool)

(declare-fun res!443889 () Bool)

(assert (=> b!677289 (=> (not res!443889) (not e!386047))))

(assert (=> b!677289 (= res!443889 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19242 a!3626))))))

(declare-fun b!677290 () Bool)

(declare-fun res!443879 () Bool)

(assert (=> b!677290 (=> (not res!443879) (not e!386047))))

(assert (=> b!677290 (= res!443879 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19242 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677291 () Bool)

(declare-fun res!443882 () Bool)

(assert (=> b!677291 (=> (not res!443882) (not e!386047))))

(assert (=> b!677291 (= res!443882 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12954))))

(declare-fun b!677292 () Bool)

(declare-fun res!443887 () Bool)

(assert (=> b!677292 (=> (not res!443887) (not e!386047))))

(assert (=> b!677292 (= res!443887 (not (contains!3479 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677293 () Bool)

(declare-fun res!443881 () Bool)

(assert (=> b!677293 (=> (not res!443881) (not e!386047))))

(assert (=> b!677293 (= res!443881 e!386045)))

(declare-fun res!443884 () Bool)

(assert (=> b!677293 (=> res!443884 e!386045)))

(assert (=> b!677293 (= res!443884 e!386043)))

(declare-fun res!443875 () Bool)

(assert (=> b!677293 (=> (not res!443875) (not e!386043))))

(assert (=> b!677293 (= res!443875 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677294 () Bool)

(declare-fun res!443873 () Bool)

(assert (=> b!677294 (=> (not res!443873) (not e!386047))))

(declare-fun arrayContainsKey!0 (array!39370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677294 (= res!443873 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677295 () Bool)

(declare-fun res!443883 () Bool)

(assert (=> b!677295 (=> (not res!443883) (not e!386047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677295 (= res!443883 (validKeyInArray!0 k!2843))))

(declare-fun b!677296 () Bool)

(assert (=> b!677296 (= e!386048 (not (contains!3479 acc!681 k!2843)))))

(declare-fun b!677297 () Bool)

(declare-fun res!443870 () Bool)

(assert (=> b!677297 (=> (not res!443870) (not e!386047))))

(declare-fun e!386042 () Bool)

(assert (=> b!677297 (= res!443870 e!386042)))

(declare-fun res!443890 () Bool)

(assert (=> b!677297 (=> res!443890 e!386042)))

(assert (=> b!677297 (= res!443890 e!386044)))

(declare-fun res!443888 () Bool)

(assert (=> b!677297 (=> (not res!443888) (not e!386044))))

(assert (=> b!677297 (= res!443888 (bvsgt from!3004 i!1382))))

(declare-fun b!677298 () Bool)

(declare-fun res!443874 () Bool)

(assert (=> b!677298 (=> (not res!443874) (not e!386047))))

(declare-fun noDuplicate!748 (List!12957) Bool)

(assert (=> b!677298 (= res!443874 (noDuplicate!748 acc!681))))

(declare-fun b!677299 () Bool)

(declare-fun res!443877 () Bool)

(assert (=> b!677299 (=> (not res!443877) (not e!386047))))

(assert (=> b!677299 (= res!443877 (not (validKeyInArray!0 (select (arr!18877 a!3626) from!3004))))))

(declare-fun b!677300 () Bool)

(declare-fun e!386046 () Bool)

(assert (=> b!677300 (= e!386042 e!386046)))

(declare-fun res!443876 () Bool)

(assert (=> b!677300 (=> (not res!443876) (not e!386046))))

(assert (=> b!677300 (= res!443876 (bvsle from!3004 i!1382))))

(declare-fun b!677288 () Bool)

(declare-fun res!443871 () Bool)

(assert (=> b!677288 (=> (not res!443871) (not e!386047))))

(assert (=> b!677288 (= res!443871 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!443872 () Bool)

(assert (=> start!60312 (=> (not res!443872) (not e!386047))))

(assert (=> start!60312 (= res!443872 (and (bvslt (size!19242 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19242 a!3626))))))

(assert (=> start!60312 e!386047))

(assert (=> start!60312 true))

(declare-fun array_inv!14760 (array!39370) Bool)

(assert (=> start!60312 (array_inv!14760 a!3626)))

(declare-fun b!677301 () Bool)

(assert (=> b!677301 (= e!386046 (not (contains!3479 acc!681 k!2843)))))

(declare-fun b!677302 () Bool)

(assert (=> b!677302 (= e!386047 (not true))))

(assert (=> b!677302 (arrayNoDuplicates!0 (array!39371 (store (arr!18877 a!3626) i!1382 k!2843) (size!19242 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23754 0))(
  ( (Unit!23755) )
))
(declare-fun lt!312576 () Unit!23754)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12957) Unit!23754)

(assert (=> b!677302 (= lt!312576 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677303 () Bool)

(declare-fun res!443880 () Bool)

(assert (=> b!677303 (=> (not res!443880) (not e!386047))))

(assert (=> b!677303 (= res!443880 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677304 () Bool)

(declare-fun res!443885 () Bool)

(assert (=> b!677304 (=> (not res!443885) (not e!386047))))

(assert (=> b!677304 (= res!443885 (not (contains!3479 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60312 res!443872) b!677298))

(assert (= (and b!677298 res!443874) b!677304))

(assert (= (and b!677304 res!443885) b!677292))

(assert (= (and b!677292 res!443887) b!677297))

(assert (= (and b!677297 res!443888) b!677286))

(assert (= (and b!677297 (not res!443890)) b!677300))

(assert (= (and b!677300 res!443876) b!677301))

(assert (= (and b!677297 res!443870) b!677291))

(assert (= (and b!677291 res!443882) b!677288))

(assert (= (and b!677288 res!443871) b!677289))

(assert (= (and b!677289 res!443889) b!677295))

(assert (= (and b!677295 res!443883) b!677294))

(assert (= (and b!677294 res!443873) b!677290))

(assert (= (and b!677290 res!443879) b!677299))

(assert (= (and b!677299 res!443877) b!677303))

(assert (= (and b!677303 res!443880) b!677293))

(assert (= (and b!677293 res!443875) b!677285))

(assert (= (and b!677293 (not res!443884)) b!677284))

(assert (= (and b!677284 res!443886) b!677296))

(assert (= (and b!677293 res!443881) b!677287))

(assert (= (and b!677287 res!443878) b!677302))

(declare-fun m!643005 () Bool)

(assert (=> b!677292 m!643005))

(declare-fun m!643007 () Bool)

(assert (=> b!677302 m!643007))

(declare-fun m!643009 () Bool)

(assert (=> b!677302 m!643009))

(declare-fun m!643011 () Bool)

(assert (=> b!677302 m!643011))

(declare-fun m!643013 () Bool)

(assert (=> b!677287 m!643013))

(declare-fun m!643015 () Bool)

(assert (=> b!677294 m!643015))

(declare-fun m!643017 () Bool)

(assert (=> start!60312 m!643017))

(declare-fun m!643019 () Bool)

(assert (=> b!677304 m!643019))

(declare-fun m!643021 () Bool)

(assert (=> b!677296 m!643021))

(declare-fun m!643023 () Bool)

(assert (=> b!677295 m!643023))

(declare-fun m!643025 () Bool)

(assert (=> b!677291 m!643025))

(assert (=> b!677286 m!643021))

(declare-fun m!643027 () Bool)

(assert (=> b!677288 m!643027))

(assert (=> b!677301 m!643021))

(declare-fun m!643029 () Bool)

(assert (=> b!677298 m!643029))

(assert (=> b!677285 m!643021))

(declare-fun m!643031 () Bool)

(assert (=> b!677299 m!643031))

(assert (=> b!677299 m!643031))

(declare-fun m!643033 () Bool)

(assert (=> b!677299 m!643033))

(push 1)

(assert (not b!677295))

(assert (not b!677286))

(assert (not b!677298))

(assert (not b!677296))

(assert (not b!677301))

(assert (not b!677288))

(assert (not b!677304))

(assert (not b!677299))

(assert (not b!677285))

(assert (not b!677291))

(assert (not b!677292))

(assert (not b!677302))

(assert (not start!60312))

(assert (not b!677294))

(assert (not b!677287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

