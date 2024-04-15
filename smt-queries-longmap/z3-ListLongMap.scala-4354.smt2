; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60140 () Bool)

(assert start!60140)

(declare-fun b!671264 () Bool)

(declare-fun e!383587 () Bool)

(declare-datatypes ((List!12871 0))(
  ( (Nil!12868) (Cons!12867 (h!13912 (_ BitVec 64)) (t!19090 List!12871)) )
))
(declare-fun acc!681 () List!12871)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3393 (List!12871 (_ BitVec 64)) Bool)

(assert (=> b!671264 (= e!383587 (contains!3393 acc!681 k0!2843))))

(declare-fun b!671265 () Bool)

(declare-fun res!438138 () Bool)

(declare-fun e!383581 () Bool)

(assert (=> b!671265 (=> (not res!438138) (not e!383581))))

(declare-datatypes ((array!39198 0))(
  ( (array!39199 (arr!18791 (Array (_ BitVec 32) (_ BitVec 64))) (size!19156 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39198)

(declare-fun arrayContainsKey!0 (array!39198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671265 (= res!438138 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671266 () Bool)

(declare-datatypes ((Unit!23558 0))(
  ( (Unit!23559) )
))
(declare-fun e!383583 () Unit!23558)

(declare-fun Unit!23560 () Unit!23558)

(assert (=> b!671266 (= e!383583 Unit!23560)))

(declare-fun b!671267 () Bool)

(declare-fun res!438116 () Bool)

(declare-fun e!383579 () Bool)

(assert (=> b!671267 (=> (not res!438116) (not e!383579))))

(declare-fun lt!311921 () List!12871)

(declare-fun noDuplicate!662 (List!12871) Bool)

(assert (=> b!671267 (= res!438116 (noDuplicate!662 lt!311921))))

(declare-fun b!671268 () Bool)

(declare-fun res!438133 () Bool)

(assert (=> b!671268 (=> (not res!438133) (not e!383581))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39198 (_ BitVec 32) List!12871) Bool)

(assert (=> b!671268 (= res!438133 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671269 () Bool)

(declare-fun res!438122 () Bool)

(assert (=> b!671269 (=> (not res!438122) (not e!383581))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671269 (= res!438122 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19156 a!3626))))))

(declare-fun b!671270 () Bool)

(declare-fun res!438123 () Bool)

(assert (=> b!671270 (=> (not res!438123) (not e!383581))))

(assert (=> b!671270 (= res!438123 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12868))))

(declare-fun b!671271 () Bool)

(declare-fun e!383585 () Bool)

(assert (=> b!671271 (= e!383581 e!383585)))

(declare-fun res!438137 () Bool)

(assert (=> b!671271 (=> (not res!438137) (not e!383585))))

(assert (=> b!671271 (= res!438137 (not (= (select (arr!18791 a!3626) from!3004) k0!2843)))))

(declare-fun lt!311922 () Unit!23558)

(assert (=> b!671271 (= lt!311922 e!383583)))

(declare-fun c!76941 () Bool)

(assert (=> b!671271 (= c!76941 (= (select (arr!18791 a!3626) from!3004) k0!2843))))

(declare-fun b!671272 () Bool)

(declare-fun e!383580 () Bool)

(declare-fun e!383582 () Bool)

(assert (=> b!671272 (= e!383580 e!383582)))

(declare-fun res!438126 () Bool)

(assert (=> b!671272 (=> (not res!438126) (not e!383582))))

(assert (=> b!671272 (= res!438126 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671273 () Bool)

(declare-fun res!438134 () Bool)

(assert (=> b!671273 (=> (not res!438134) (not e!383581))))

(assert (=> b!671273 (= res!438134 (not (contains!3393 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!438121 () Bool)

(assert (=> start!60140 (=> (not res!438121) (not e!383581))))

(assert (=> start!60140 (= res!438121 (and (bvslt (size!19156 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19156 a!3626))))))

(assert (=> start!60140 e!383581))

(assert (=> start!60140 true))

(declare-fun array_inv!14674 (array!39198) Bool)

(assert (=> start!60140 (array_inv!14674 a!3626)))

(declare-fun b!671274 () Bool)

(declare-fun e!383588 () Bool)

(declare-fun e!383578 () Bool)

(assert (=> b!671274 (= e!383588 e!383578)))

(declare-fun res!438119 () Bool)

(assert (=> b!671274 (=> (not res!438119) (not e!383578))))

(assert (=> b!671274 (= res!438119 (bvsle from!3004 i!1382))))

(declare-fun b!671275 () Bool)

(declare-fun res!438120 () Bool)

(assert (=> b!671275 (=> (not res!438120) (not e!383581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671275 (= res!438120 (validKeyInArray!0 k0!2843))))

(declare-fun b!671276 () Bool)

(assert (=> b!671276 (= e!383585 e!383579)))

(declare-fun res!438125 () Bool)

(assert (=> b!671276 (=> (not res!438125) (not e!383579))))

(assert (=> b!671276 (= res!438125 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!259 (List!12871 (_ BitVec 64)) List!12871)

(assert (=> b!671276 (= lt!311921 ($colon$colon!259 acc!681 (select (arr!18791 a!3626) from!3004)))))

(declare-fun b!671277 () Bool)

(declare-fun res!438136 () Bool)

(assert (=> b!671277 (=> (not res!438136) (not e!383579))))

(assert (=> b!671277 (= res!438136 (not (contains!3393 lt!311921 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671278 () Bool)

(assert (=> b!671278 (= e!383582 (not (contains!3393 lt!311921 k0!2843)))))

(declare-fun b!671279 () Bool)

(declare-fun res!438128 () Bool)

(assert (=> b!671279 (=> (not res!438128) (not e!383581))))

(assert (=> b!671279 (= res!438128 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19156 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671280 () Bool)

(declare-fun res!438130 () Bool)

(assert (=> b!671280 (=> (not res!438130) (not e!383581))))

(assert (=> b!671280 (= res!438130 (validKeyInArray!0 (select (arr!18791 a!3626) from!3004)))))

(declare-fun b!671281 () Bool)

(declare-fun res!438135 () Bool)

(assert (=> b!671281 (=> (not res!438135) (not e!383581))))

(assert (=> b!671281 (= res!438135 (noDuplicate!662 acc!681))))

(declare-fun b!671282 () Bool)

(declare-fun res!438129 () Bool)

(assert (=> b!671282 (=> (not res!438129) (not e!383579))))

(assert (=> b!671282 (= res!438129 e!383580)))

(declare-fun res!438139 () Bool)

(assert (=> b!671282 (=> res!438139 e!383580)))

(declare-fun e!383584 () Bool)

(assert (=> b!671282 (= res!438139 e!383584)))

(declare-fun res!438118 () Bool)

(assert (=> b!671282 (=> (not res!438118) (not e!383584))))

(assert (=> b!671282 (= res!438118 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671283 () Bool)

(assert (=> b!671283 (= e!383584 (contains!3393 lt!311921 k0!2843))))

(declare-fun b!671284 () Bool)

(declare-fun Unit!23561 () Unit!23558)

(assert (=> b!671284 (= e!383583 Unit!23561)))

(assert (=> b!671284 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!311920 () Unit!23558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39198 (_ BitVec 64) (_ BitVec 32)) Unit!23558)

(assert (=> b!671284 (= lt!311920 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!671284 false))

(declare-fun b!671285 () Bool)

(declare-fun res!438117 () Bool)

(assert (=> b!671285 (=> (not res!438117) (not e!383581))))

(assert (=> b!671285 (= res!438117 e!383588)))

(declare-fun res!438127 () Bool)

(assert (=> b!671285 (=> res!438127 e!383588)))

(assert (=> b!671285 (= res!438127 e!383587)))

(declare-fun res!438131 () Bool)

(assert (=> b!671285 (=> (not res!438131) (not e!383587))))

(assert (=> b!671285 (= res!438131 (bvsgt from!3004 i!1382))))

(declare-fun b!671286 () Bool)

(declare-fun res!438132 () Bool)

(assert (=> b!671286 (=> (not res!438132) (not e!383579))))

(assert (=> b!671286 (= res!438132 (not (contains!3393 lt!311921 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671287 () Bool)

(assert (=> b!671287 (= e!383579 false)))

(declare-fun lt!311919 () Bool)

(assert (=> b!671287 (= lt!311919 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311921))))

(declare-fun b!671288 () Bool)

(declare-fun res!438124 () Bool)

(assert (=> b!671288 (=> (not res!438124) (not e!383581))))

(assert (=> b!671288 (= res!438124 (not (contains!3393 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671289 () Bool)

(assert (=> b!671289 (= e!383578 (not (contains!3393 acc!681 k0!2843)))))

(assert (= (and start!60140 res!438121) b!671281))

(assert (= (and b!671281 res!438135) b!671273))

(assert (= (and b!671273 res!438134) b!671288))

(assert (= (and b!671288 res!438124) b!671285))

(assert (= (and b!671285 res!438131) b!671264))

(assert (= (and b!671285 (not res!438127)) b!671274))

(assert (= (and b!671274 res!438119) b!671289))

(assert (= (and b!671285 res!438117) b!671270))

(assert (= (and b!671270 res!438123) b!671268))

(assert (= (and b!671268 res!438133) b!671269))

(assert (= (and b!671269 res!438122) b!671275))

(assert (= (and b!671275 res!438120) b!671265))

(assert (= (and b!671265 res!438138) b!671279))

(assert (= (and b!671279 res!438128) b!671280))

(assert (= (and b!671280 res!438130) b!671271))

(assert (= (and b!671271 c!76941) b!671284))

(assert (= (and b!671271 (not c!76941)) b!671266))

(assert (= (and b!671271 res!438137) b!671276))

(assert (= (and b!671276 res!438125) b!671267))

(assert (= (and b!671267 res!438116) b!671277))

(assert (= (and b!671277 res!438136) b!671286))

(assert (= (and b!671286 res!438132) b!671282))

(assert (= (and b!671282 res!438118) b!671283))

(assert (= (and b!671282 (not res!438139)) b!671272))

(assert (= (and b!671272 res!438126) b!671278))

(assert (= (and b!671282 res!438129) b!671287))

(declare-fun m!640191 () Bool)

(assert (=> b!671277 m!640191))

(declare-fun m!640193 () Bool)

(assert (=> b!671286 m!640193))

(declare-fun m!640195 () Bool)

(assert (=> b!671273 m!640195))

(declare-fun m!640197 () Bool)

(assert (=> b!671268 m!640197))

(declare-fun m!640199 () Bool)

(assert (=> b!671267 m!640199))

(declare-fun m!640201 () Bool)

(assert (=> b!671287 m!640201))

(declare-fun m!640203 () Bool)

(assert (=> b!671276 m!640203))

(assert (=> b!671276 m!640203))

(declare-fun m!640205 () Bool)

(assert (=> b!671276 m!640205))

(declare-fun m!640207 () Bool)

(assert (=> b!671264 m!640207))

(assert (=> b!671289 m!640207))

(declare-fun m!640209 () Bool)

(assert (=> b!671283 m!640209))

(assert (=> b!671280 m!640203))

(assert (=> b!671280 m!640203))

(declare-fun m!640211 () Bool)

(assert (=> b!671280 m!640211))

(declare-fun m!640213 () Bool)

(assert (=> b!671270 m!640213))

(declare-fun m!640215 () Bool)

(assert (=> b!671284 m!640215))

(declare-fun m!640217 () Bool)

(assert (=> b!671284 m!640217))

(assert (=> b!671271 m!640203))

(declare-fun m!640219 () Bool)

(assert (=> b!671281 m!640219))

(declare-fun m!640221 () Bool)

(assert (=> start!60140 m!640221))

(declare-fun m!640223 () Bool)

(assert (=> b!671275 m!640223))

(declare-fun m!640225 () Bool)

(assert (=> b!671288 m!640225))

(assert (=> b!671278 m!640209))

(declare-fun m!640227 () Bool)

(assert (=> b!671265 m!640227))

(check-sat (not b!671275) (not b!671273) (not b!671280) (not b!671289) (not b!671265) (not b!671270) (not b!671264) (not b!671284) (not b!671278) (not start!60140) (not b!671277) (not b!671281) (not b!671287) (not b!671288) (not b!671283) (not b!671276) (not b!671286) (not b!671268) (not b!671267))
(check-sat)
