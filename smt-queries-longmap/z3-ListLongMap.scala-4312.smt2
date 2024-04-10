; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59902 () Bool)

(assert start!59902)

(declare-fun b!663230 () Bool)

(declare-fun e!380591 () Bool)

(declare-fun e!380592 () Bool)

(assert (=> b!663230 (= e!380591 e!380592)))

(declare-fun res!431174 () Bool)

(assert (=> b!663230 (=> res!431174 e!380592)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!663230 (= res!431174 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12708 0))(
  ( (Nil!12705) (Cons!12704 (h!13749 (_ BitVec 64)) (t!18936 List!12708)) )
))
(declare-fun lt!309231 () List!12708)

(declare-datatypes ((array!38949 0))(
  ( (array!38950 (arr!18667 (Array (_ BitVec 32) (_ BitVec 64))) (size!19031 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38949)

(declare-fun acc!681 () List!12708)

(declare-fun $colon$colon!156 (List!12708 (_ BitVec 64)) List!12708)

(assert (=> b!663230 (= lt!309231 ($colon$colon!156 acc!681 (select (arr!18667 a!3626) from!3004)))))

(declare-fun subseq!24 (List!12708 List!12708) Bool)

(assert (=> b!663230 (subseq!24 acc!681 acc!681)))

(declare-datatypes ((Unit!23062 0))(
  ( (Unit!23063) )
))
(declare-fun lt!309227 () Unit!23062)

(declare-fun lemmaListSubSeqRefl!0 (List!12708) Unit!23062)

(assert (=> b!663230 (= lt!309227 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!663231 () Bool)

(declare-fun e!380593 () Bool)

(assert (=> b!663231 (= e!380593 (not e!380591))))

(declare-fun res!431170 () Bool)

(assert (=> b!663231 (=> res!431170 e!380591)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663231 (= res!431170 (not (validKeyInArray!0 (select (arr!18667 a!3626) from!3004))))))

(declare-fun lt!309229 () Unit!23062)

(declare-fun e!380598 () Unit!23062)

(assert (=> b!663231 (= lt!309229 e!380598)))

(declare-fun c!76403 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663231 (= c!76403 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663231 (arrayContainsKey!0 (array!38950 (store (arr!18667 a!3626) i!1382 k0!2843) (size!19031 a!3626)) k0!2843 from!3004)))

(declare-fun b!663232 () Bool)

(declare-fun e!380596 () Bool)

(declare-fun contains!3285 (List!12708 (_ BitVec 64)) Bool)

(assert (=> b!663232 (= e!380596 (contains!3285 acc!681 k0!2843))))

(declare-fun b!663233 () Bool)

(declare-fun res!431171 () Bool)

(assert (=> b!663233 (=> (not res!431171) (not e!380593))))

(assert (=> b!663233 (= res!431171 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663234 () Bool)

(declare-fun res!431160 () Bool)

(assert (=> b!663234 (=> res!431160 e!380592)))

(assert (=> b!663234 (= res!431160 (contains!3285 lt!309231 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663235 () Bool)

(declare-fun res!431163 () Bool)

(assert (=> b!663235 (=> (not res!431163) (not e!380593))))

(declare-fun noDuplicate!532 (List!12708) Bool)

(assert (=> b!663235 (= res!431163 (noDuplicate!532 acc!681))))

(declare-fun b!663236 () Bool)

(declare-fun res!431167 () Bool)

(assert (=> b!663236 (=> (not res!431167) (not e!380593))))

(assert (=> b!663236 (= res!431167 (not (contains!3285 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663237 () Bool)

(declare-fun res!431161 () Bool)

(assert (=> b!663237 (=> (not res!431161) (not e!380593))))

(assert (=> b!663237 (= res!431161 (not (contains!3285 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663238 () Bool)

(declare-fun res!431164 () Bool)

(assert (=> b!663238 (=> res!431164 e!380592)))

(assert (=> b!663238 (= res!431164 (not (subseq!24 acc!681 lt!309231)))))

(declare-fun b!663239 () Bool)

(declare-fun res!431162 () Bool)

(assert (=> b!663239 (=> (not res!431162) (not e!380593))))

(assert (=> b!663239 (= res!431162 (validKeyInArray!0 k0!2843))))

(declare-fun b!663240 () Bool)

(declare-fun res!431166 () Bool)

(assert (=> b!663240 (=> (not res!431166) (not e!380593))))

(assert (=> b!663240 (= res!431166 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19031 a!3626))))))

(declare-fun b!663241 () Bool)

(declare-fun Unit!23064 () Unit!23062)

(assert (=> b!663241 (= e!380598 Unit!23064)))

(declare-fun lt!309230 () Unit!23062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38949 (_ BitVec 64) (_ BitVec 32)) Unit!23062)

(assert (=> b!663241 (= lt!309230 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663241 false))

(declare-fun b!663242 () Bool)

(declare-fun res!431165 () Bool)

(assert (=> b!663242 (=> res!431165 e!380592)))

(assert (=> b!663242 (= res!431165 (contains!3285 lt!309231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!431158 () Bool)

(assert (=> start!59902 (=> (not res!431158) (not e!380593))))

(assert (=> start!59902 (= res!431158 (and (bvslt (size!19031 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19031 a!3626))))))

(assert (=> start!59902 e!380593))

(assert (=> start!59902 true))

(declare-fun array_inv!14463 (array!38949) Bool)

(assert (=> start!59902 (array_inv!14463 a!3626)))

(declare-fun b!663243 () Bool)

(declare-fun e!380594 () Bool)

(assert (=> b!663243 (= e!380594 (not (contains!3285 acc!681 k0!2843)))))

(declare-fun b!663244 () Bool)

(declare-fun res!431172 () Bool)

(assert (=> b!663244 (=> (not res!431172) (not e!380593))))

(declare-fun arrayNoDuplicates!0 (array!38949 (_ BitVec 32) List!12708) Bool)

(assert (=> b!663244 (= res!431172 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12705))))

(declare-fun b!663245 () Bool)

(declare-fun res!431168 () Bool)

(assert (=> b!663245 (=> (not res!431168) (not e!380593))))

(assert (=> b!663245 (= res!431168 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663246 () Bool)

(declare-fun Unit!23065 () Unit!23062)

(assert (=> b!663246 (= e!380598 Unit!23065)))

(declare-fun b!663247 () Bool)

(declare-fun res!431176 () Bool)

(assert (=> b!663247 (=> (not res!431176) (not e!380593))))

(assert (=> b!663247 (= res!431176 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19031 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663248 () Bool)

(assert (=> b!663248 (= e!380592 true)))

(declare-fun lt!309228 () Bool)

(assert (=> b!663248 (= lt!309228 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309231))))

(declare-fun lt!309232 () Unit!23062)

(declare-fun noDuplicateSubseq!24 (List!12708 List!12708) Unit!23062)

(assert (=> b!663248 (= lt!309232 (noDuplicateSubseq!24 acc!681 lt!309231))))

(declare-fun b!663249 () Bool)

(declare-fun res!431175 () Bool)

(assert (=> b!663249 (=> res!431175 e!380592)))

(assert (=> b!663249 (= res!431175 (not (noDuplicate!532 lt!309231)))))

(declare-fun b!663250 () Bool)

(declare-fun res!431177 () Bool)

(assert (=> b!663250 (=> (not res!431177) (not e!380593))))

(declare-fun e!380595 () Bool)

(assert (=> b!663250 (= res!431177 e!380595)))

(declare-fun res!431159 () Bool)

(assert (=> b!663250 (=> res!431159 e!380595)))

(assert (=> b!663250 (= res!431159 e!380596)))

(declare-fun res!431169 () Bool)

(assert (=> b!663250 (=> (not res!431169) (not e!380596))))

(assert (=> b!663250 (= res!431169 (bvsgt from!3004 i!1382))))

(declare-fun b!663251 () Bool)

(assert (=> b!663251 (= e!380595 e!380594)))

(declare-fun res!431173 () Bool)

(assert (=> b!663251 (=> (not res!431173) (not e!380594))))

(assert (=> b!663251 (= res!431173 (bvsle from!3004 i!1382))))

(assert (= (and start!59902 res!431158) b!663235))

(assert (= (and b!663235 res!431163) b!663237))

(assert (= (and b!663237 res!431161) b!663236))

(assert (= (and b!663236 res!431167) b!663250))

(assert (= (and b!663250 res!431169) b!663232))

(assert (= (and b!663250 (not res!431159)) b!663251))

(assert (= (and b!663251 res!431173) b!663243))

(assert (= (and b!663250 res!431177) b!663244))

(assert (= (and b!663244 res!431172) b!663245))

(assert (= (and b!663245 res!431168) b!663240))

(assert (= (and b!663240 res!431166) b!663239))

(assert (= (and b!663239 res!431162) b!663233))

(assert (= (and b!663233 res!431171) b!663247))

(assert (= (and b!663247 res!431176) b!663231))

(assert (= (and b!663231 c!76403) b!663241))

(assert (= (and b!663231 (not c!76403)) b!663246))

(assert (= (and b!663231 (not res!431170)) b!663230))

(assert (= (and b!663230 (not res!431174)) b!663249))

(assert (= (and b!663249 (not res!431175)) b!663242))

(assert (= (and b!663242 (not res!431165)) b!663234))

(assert (= (and b!663234 (not res!431160)) b!663238))

(assert (= (and b!663238 (not res!431164)) b!663248))

(declare-fun m!634853 () Bool)

(assert (=> b!663232 m!634853))

(declare-fun m!634855 () Bool)

(assert (=> b!663248 m!634855))

(declare-fun m!634857 () Bool)

(assert (=> b!663248 m!634857))

(assert (=> b!663243 m!634853))

(declare-fun m!634859 () Bool)

(assert (=> b!663239 m!634859))

(declare-fun m!634861 () Bool)

(assert (=> b!663237 m!634861))

(declare-fun m!634863 () Bool)

(assert (=> b!663249 m!634863))

(declare-fun m!634865 () Bool)

(assert (=> b!663245 m!634865))

(declare-fun m!634867 () Bool)

(assert (=> b!663235 m!634867))

(declare-fun m!634869 () Bool)

(assert (=> start!59902 m!634869))

(declare-fun m!634871 () Bool)

(assert (=> b!663241 m!634871))

(declare-fun m!634873 () Bool)

(assert (=> b!663231 m!634873))

(declare-fun m!634875 () Bool)

(assert (=> b!663231 m!634875))

(declare-fun m!634877 () Bool)

(assert (=> b!663231 m!634877))

(assert (=> b!663231 m!634873))

(declare-fun m!634879 () Bool)

(assert (=> b!663231 m!634879))

(declare-fun m!634881 () Bool)

(assert (=> b!663231 m!634881))

(declare-fun m!634883 () Bool)

(assert (=> b!663234 m!634883))

(declare-fun m!634885 () Bool)

(assert (=> b!663238 m!634885))

(declare-fun m!634887 () Bool)

(assert (=> b!663242 m!634887))

(declare-fun m!634889 () Bool)

(assert (=> b!663233 m!634889))

(declare-fun m!634891 () Bool)

(assert (=> b!663244 m!634891))

(assert (=> b!663230 m!634873))

(assert (=> b!663230 m!634873))

(declare-fun m!634893 () Bool)

(assert (=> b!663230 m!634893))

(declare-fun m!634895 () Bool)

(assert (=> b!663230 m!634895))

(declare-fun m!634897 () Bool)

(assert (=> b!663230 m!634897))

(declare-fun m!634899 () Bool)

(assert (=> b!663236 m!634899))

(check-sat (not b!663237) (not b!663243) (not b!663238) (not start!59902) (not b!663244) (not b!663230) (not b!663235) (not b!663241) (not b!663236) (not b!663249) (not b!663248) (not b!663233) (not b!663239) (not b!663242) (not b!663245) (not b!663234) (not b!663231) (not b!663232))
(check-sat)
