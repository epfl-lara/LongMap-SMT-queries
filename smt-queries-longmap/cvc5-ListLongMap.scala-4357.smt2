; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60170 () Bool)

(assert start!60170)

(declare-fun b!672262 () Bool)

(declare-fun res!438908 () Bool)

(declare-fun e!384065 () Bool)

(assert (=> b!672262 (=> (not res!438908) (not e!384065))))

(declare-datatypes ((List!12842 0))(
  ( (Nil!12839) (Cons!12838 (h!13883 (_ BitVec 64)) (t!19070 List!12842)) )
))
(declare-fun lt!312284 () List!12842)

(declare-fun contains!3419 (List!12842 (_ BitVec 64)) Bool)

(assert (=> b!672262 (= res!438908 (not (contains!3419 lt!312284 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672263 () Bool)

(declare-datatypes ((Unit!23616 0))(
  ( (Unit!23617) )
))
(declare-fun e!384068 () Unit!23616)

(declare-fun Unit!23618 () Unit!23616)

(assert (=> b!672263 (= e!384068 Unit!23618)))

(declare-fun b!672264 () Bool)

(declare-fun res!438913 () Bool)

(assert (=> b!672264 (=> (not res!438913) (not e!384065))))

(assert (=> b!672264 (= res!438913 (not (contains!3419 lt!312284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672266 () Bool)

(declare-fun res!438922 () Bool)

(declare-fun e!384066 () Bool)

(assert (=> b!672266 (=> (not res!438922) (not e!384066))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672266 (= res!438922 (validKeyInArray!0 k!2843))))

(declare-fun b!672267 () Bool)

(declare-fun e!384074 () Bool)

(declare-fun e!384067 () Bool)

(assert (=> b!672267 (= e!384074 e!384067)))

(declare-fun res!438910 () Bool)

(assert (=> b!672267 (=> (not res!438910) (not e!384067))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672267 (= res!438910 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672268 () Bool)

(declare-fun res!438901 () Bool)

(assert (=> b!672268 (=> (not res!438901) (not e!384066))))

(declare-datatypes ((array!39217 0))(
  ( (array!39218 (arr!18801 (Array (_ BitVec 32) (_ BitVec 64))) (size!19165 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39217)

(assert (=> b!672268 (= res!438901 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19165 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672269 () Bool)

(declare-fun res!438920 () Bool)

(assert (=> b!672269 (=> (not res!438920) (not e!384065))))

(declare-fun noDuplicate!666 (List!12842) Bool)

(assert (=> b!672269 (= res!438920 (noDuplicate!666 lt!312284))))

(declare-fun b!672270 () Bool)

(declare-fun res!438909 () Bool)

(assert (=> b!672270 (=> (not res!438909) (not e!384066))))

(declare-fun arrayContainsKey!0 (array!39217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672270 (= res!438909 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672271 () Bool)

(declare-fun res!438914 () Bool)

(assert (=> b!672271 (=> (not res!438914) (not e!384066))))

(assert (=> b!672271 (= res!438914 (validKeyInArray!0 (select (arr!18801 a!3626) from!3004)))))

(declare-fun b!672272 () Bool)

(declare-fun res!438907 () Bool)

(assert (=> b!672272 (=> (not res!438907) (not e!384066))))

(declare-fun acc!681 () List!12842)

(assert (=> b!672272 (= res!438907 (not (contains!3419 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672273 () Bool)

(declare-fun e!384069 () Bool)

(assert (=> b!672273 (= e!384069 (contains!3419 lt!312284 k!2843))))

(declare-fun b!672274 () Bool)

(declare-fun e!384073 () Bool)

(assert (=> b!672274 (= e!384073 (not (contains!3419 acc!681 k!2843)))))

(declare-fun b!672275 () Bool)

(declare-fun e!384075 () Bool)

(assert (=> b!672275 (= e!384075 e!384073)))

(declare-fun res!438904 () Bool)

(assert (=> b!672275 (=> (not res!438904) (not e!384073))))

(assert (=> b!672275 (= res!438904 (bvsle from!3004 i!1382))))

(declare-fun b!672276 () Bool)

(declare-fun res!438911 () Bool)

(assert (=> b!672276 (=> (not res!438911) (not e!384065))))

(assert (=> b!672276 (= res!438911 e!384074)))

(declare-fun res!438921 () Bool)

(assert (=> b!672276 (=> res!438921 e!384074)))

(assert (=> b!672276 (= res!438921 e!384069)))

(declare-fun res!438916 () Bool)

(assert (=> b!672276 (=> (not res!438916) (not e!384069))))

(assert (=> b!672276 (= res!438916 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672277 () Bool)

(declare-fun res!438923 () Bool)

(assert (=> b!672277 (=> (not res!438923) (not e!384066))))

(declare-fun arrayNoDuplicates!0 (array!39217 (_ BitVec 32) List!12842) Bool)

(assert (=> b!672277 (= res!438923 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12839))))

(declare-fun b!672278 () Bool)

(declare-fun Unit!23619 () Unit!23616)

(assert (=> b!672278 (= e!384068 Unit!23619)))

(assert (=> b!672278 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312286 () Unit!23616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39217 (_ BitVec 64) (_ BitVec 32)) Unit!23616)

(assert (=> b!672278 (= lt!312286 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672278 false))

(declare-fun b!672279 () Bool)

(declare-fun res!438919 () Bool)

(assert (=> b!672279 (=> (not res!438919) (not e!384066))))

(assert (=> b!672279 (= res!438919 e!384075)))

(declare-fun res!438915 () Bool)

(assert (=> b!672279 (=> res!438915 e!384075)))

(declare-fun e!384071 () Bool)

(assert (=> b!672279 (= res!438915 e!384071)))

(declare-fun res!438902 () Bool)

(assert (=> b!672279 (=> (not res!438902) (not e!384071))))

(assert (=> b!672279 (= res!438902 (bvsgt from!3004 i!1382))))

(declare-fun res!438905 () Bool)

(assert (=> start!60170 (=> (not res!438905) (not e!384066))))

(assert (=> start!60170 (= res!438905 (and (bvslt (size!19165 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19165 a!3626))))))

(assert (=> start!60170 e!384066))

(assert (=> start!60170 true))

(declare-fun array_inv!14597 (array!39217) Bool)

(assert (=> start!60170 (array_inv!14597 a!3626)))

(declare-fun b!672265 () Bool)

(declare-fun res!438900 () Bool)

(assert (=> b!672265 (=> (not res!438900) (not e!384066))))

(assert (=> b!672265 (= res!438900 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19165 a!3626))))))

(declare-fun b!672280 () Bool)

(declare-fun e!384070 () Bool)

(assert (=> b!672280 (= e!384070 e!384065)))

(declare-fun res!438903 () Bool)

(assert (=> b!672280 (=> (not res!438903) (not e!384065))))

(assert (=> b!672280 (= res!438903 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!269 (List!12842 (_ BitVec 64)) List!12842)

(assert (=> b!672280 (= lt!312284 ($colon$colon!269 acc!681 (select (arr!18801 a!3626) from!3004)))))

(declare-fun b!672281 () Bool)

(declare-fun res!438917 () Bool)

(assert (=> b!672281 (=> (not res!438917) (not e!384066))))

(assert (=> b!672281 (= res!438917 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672282 () Bool)

(assert (=> b!672282 (= e!384065 false)))

(declare-fun lt!312283 () Bool)

(assert (=> b!672282 (= lt!312283 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312284))))

(declare-fun b!672283 () Bool)

(assert (=> b!672283 (= e!384067 (not (contains!3419 lt!312284 k!2843)))))

(declare-fun b!672284 () Bool)

(assert (=> b!672284 (= e!384066 e!384070)))

(declare-fun res!438906 () Bool)

(assert (=> b!672284 (=> (not res!438906) (not e!384070))))

(assert (=> b!672284 (= res!438906 (not (= (select (arr!18801 a!3626) from!3004) k!2843)))))

(declare-fun lt!312285 () Unit!23616)

(assert (=> b!672284 (= lt!312285 e!384068)))

(declare-fun c!77048 () Bool)

(assert (=> b!672284 (= c!77048 (= (select (arr!18801 a!3626) from!3004) k!2843))))

(declare-fun b!672285 () Bool)

(declare-fun res!438918 () Bool)

(assert (=> b!672285 (=> (not res!438918) (not e!384066))))

(assert (=> b!672285 (= res!438918 (not (contains!3419 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672286 () Bool)

(assert (=> b!672286 (= e!384071 (contains!3419 acc!681 k!2843))))

(declare-fun b!672287 () Bool)

(declare-fun res!438912 () Bool)

(assert (=> b!672287 (=> (not res!438912) (not e!384066))))

(assert (=> b!672287 (= res!438912 (noDuplicate!666 acc!681))))

(assert (= (and start!60170 res!438905) b!672287))

(assert (= (and b!672287 res!438912) b!672272))

(assert (= (and b!672272 res!438907) b!672285))

(assert (= (and b!672285 res!438918) b!672279))

(assert (= (and b!672279 res!438902) b!672286))

(assert (= (and b!672279 (not res!438915)) b!672275))

(assert (= (and b!672275 res!438904) b!672274))

(assert (= (and b!672279 res!438919) b!672277))

(assert (= (and b!672277 res!438923) b!672281))

(assert (= (and b!672281 res!438917) b!672265))

(assert (= (and b!672265 res!438900) b!672266))

(assert (= (and b!672266 res!438922) b!672270))

(assert (= (and b!672270 res!438909) b!672268))

(assert (= (and b!672268 res!438901) b!672271))

(assert (= (and b!672271 res!438914) b!672284))

(assert (= (and b!672284 c!77048) b!672278))

(assert (= (and b!672284 (not c!77048)) b!672263))

(assert (= (and b!672284 res!438906) b!672280))

(assert (= (and b!672280 res!438903) b!672269))

(assert (= (and b!672269 res!438920) b!672264))

(assert (= (and b!672264 res!438913) b!672262))

(assert (= (and b!672262 res!438908) b!672276))

(assert (= (and b!672276 res!438916) b!672273))

(assert (= (and b!672276 (not res!438921)) b!672267))

(assert (= (and b!672267 res!438910) b!672283))

(assert (= (and b!672276 res!438911) b!672282))

(declare-fun m!641315 () Bool)

(assert (=> b!672269 m!641315))

(declare-fun m!641317 () Bool)

(assert (=> b!672273 m!641317))

(declare-fun m!641319 () Bool)

(assert (=> b!672281 m!641319))

(declare-fun m!641321 () Bool)

(assert (=> b!672282 m!641321))

(declare-fun m!641323 () Bool)

(assert (=> b!672284 m!641323))

(declare-fun m!641325 () Bool)

(assert (=> b!672278 m!641325))

(declare-fun m!641327 () Bool)

(assert (=> b!672278 m!641327))

(declare-fun m!641329 () Bool)

(assert (=> b!672285 m!641329))

(declare-fun m!641331 () Bool)

(assert (=> b!672286 m!641331))

(declare-fun m!641333 () Bool)

(assert (=> b!672264 m!641333))

(declare-fun m!641335 () Bool)

(assert (=> start!60170 m!641335))

(assert (=> b!672274 m!641331))

(assert (=> b!672271 m!641323))

(assert (=> b!672271 m!641323))

(declare-fun m!641337 () Bool)

(assert (=> b!672271 m!641337))

(declare-fun m!641339 () Bool)

(assert (=> b!672277 m!641339))

(assert (=> b!672283 m!641317))

(declare-fun m!641341 () Bool)

(assert (=> b!672287 m!641341))

(declare-fun m!641343 () Bool)

(assert (=> b!672270 m!641343))

(assert (=> b!672280 m!641323))

(assert (=> b!672280 m!641323))

(declare-fun m!641345 () Bool)

(assert (=> b!672280 m!641345))

(declare-fun m!641347 () Bool)

(assert (=> b!672272 m!641347))

(declare-fun m!641349 () Bool)

(assert (=> b!672266 m!641349))

(declare-fun m!641351 () Bool)

(assert (=> b!672262 m!641351))

(push 1)

