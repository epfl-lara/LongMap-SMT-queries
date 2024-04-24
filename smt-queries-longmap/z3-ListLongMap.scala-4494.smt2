; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62488 () Bool)

(assert start!62488)

(declare-fun b!701323 () Bool)

(declare-fun e!397481 () Bool)

(declare-fun e!397480 () Bool)

(assert (=> b!701323 (= e!397481 e!397480)))

(declare-fun res!465051 () Bool)

(assert (=> b!701323 (=> (not res!465051) (not e!397480))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!701323 (= res!465051 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13155 0))(
  ( (Nil!13152) (Cons!13151 (h!14199 (_ BitVec 64)) (t!19429 List!13155)) )
))
(declare-fun newAcc!49 () List!13155)

(declare-fun lt!317660 () List!13155)

(declare-datatypes ((array!40107 0))(
  ( (array!40108 (arr!19207 (Array (_ BitVec 32) (_ BitVec 64))) (size!19590 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40107)

(declare-fun $colon$colon!470 (List!13155 (_ BitVec 64)) List!13155)

(assert (=> b!701323 (= lt!317660 ($colon$colon!470 newAcc!49 (select (arr!19207 a!3591) from!2969)))))

(declare-fun lt!317661 () List!13155)

(declare-fun acc!652 () List!13155)

(assert (=> b!701323 (= lt!317661 ($colon$colon!470 acc!652 (select (arr!19207 a!3591) from!2969)))))

(declare-fun b!701324 () Bool)

(declare-fun res!465050 () Bool)

(assert (=> b!701324 (=> (not res!465050) (not e!397480))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3807 (List!13155 (_ BitVec 64)) Bool)

(assert (=> b!701324 (= res!465050 (not (contains!3807 lt!317661 k0!2824)))))

(declare-fun b!701325 () Bool)

(declare-fun res!465053 () Bool)

(assert (=> b!701325 (=> (not res!465053) (not e!397480))))

(declare-fun arrayContainsKey!0 (array!40107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!701325 (= res!465053 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!701326 () Bool)

(declare-fun res!465040 () Bool)

(assert (=> b!701326 (=> (not res!465040) (not e!397481))))

(assert (=> b!701326 (= res!465040 (not (contains!3807 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701327 () Bool)

(declare-fun res!465036 () Bool)

(assert (=> b!701327 (=> (not res!465036) (not e!397481))))

(assert (=> b!701327 (= res!465036 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!701328 () Bool)

(declare-fun res!465043 () Bool)

(assert (=> b!701328 (=> (not res!465043) (not e!397480))))

(declare-fun noDuplicate!1081 (List!13155) Bool)

(assert (=> b!701328 (= res!465043 (noDuplicate!1081 lt!317660))))

(declare-fun b!701329 () Bool)

(declare-fun res!465037 () Bool)

(assert (=> b!701329 (=> (not res!465037) (not e!397481))))

(assert (=> b!701329 (= res!465037 (not (contains!3807 acc!652 k0!2824)))))

(declare-fun b!701330 () Bool)

(declare-fun res!465052 () Bool)

(assert (=> b!701330 (=> (not res!465052) (not e!397480))))

(declare-fun arrayNoDuplicates!0 (array!40107 (_ BitVec 32) List!13155) Bool)

(assert (=> b!701330 (= res!465052 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317661))))

(declare-fun b!701331 () Bool)

(declare-fun res!465049 () Bool)

(assert (=> b!701331 (=> (not res!465049) (not e!397480))))

(assert (=> b!701331 (= res!465049 (noDuplicate!1081 lt!317661))))

(declare-fun b!701332 () Bool)

(declare-fun res!465054 () Bool)

(assert (=> b!701332 (=> (not res!465054) (not e!397481))))

(assert (=> b!701332 (= res!465054 (not (contains!3807 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701333 () Bool)

(declare-fun res!465041 () Bool)

(assert (=> b!701333 (=> (not res!465041) (not e!397481))))

(assert (=> b!701333 (= res!465041 (not (contains!3807 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701334 () Bool)

(declare-fun res!465055 () Bool)

(assert (=> b!701334 (=> (not res!465055) (not e!397481))))

(assert (=> b!701334 (= res!465055 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19590 a!3591)))))

(declare-fun b!701335 () Bool)

(declare-fun res!465060 () Bool)

(assert (=> b!701335 (=> (not res!465060) (not e!397480))))

(declare-fun -!239 (List!13155 (_ BitVec 64)) List!13155)

(assert (=> b!701335 (= res!465060 (= (-!239 lt!317660 k0!2824) lt!317661))))

(declare-fun res!465042 () Bool)

(assert (=> start!62488 (=> (not res!465042) (not e!397481))))

(assert (=> start!62488 (= res!465042 (and (bvslt (size!19590 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19590 a!3591))))))

(assert (=> start!62488 e!397481))

(assert (=> start!62488 true))

(declare-fun array_inv!15066 (array!40107) Bool)

(assert (=> start!62488 (array_inv!15066 a!3591)))

(declare-fun b!701336 () Bool)

(declare-fun res!465057 () Bool)

(assert (=> b!701336 (=> (not res!465057) (not e!397481))))

(assert (=> b!701336 (= res!465057 (noDuplicate!1081 acc!652))))

(declare-fun b!701337 () Bool)

(declare-fun res!465048 () Bool)

(assert (=> b!701337 (=> (not res!465048) (not e!397481))))

(assert (=> b!701337 (= res!465048 (contains!3807 newAcc!49 k0!2824))))

(declare-fun b!701338 () Bool)

(declare-fun res!465061 () Bool)

(assert (=> b!701338 (=> (not res!465061) (not e!397480))))

(assert (=> b!701338 (= res!465061 (not (contains!3807 lt!317661 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701339 () Bool)

(declare-fun res!465046 () Bool)

(assert (=> b!701339 (=> (not res!465046) (not e!397481))))

(assert (=> b!701339 (= res!465046 (= (-!239 newAcc!49 k0!2824) acc!652))))

(declare-fun b!701340 () Bool)

(declare-fun res!465039 () Bool)

(assert (=> b!701340 (=> (not res!465039) (not e!397481))))

(declare-fun subseq!275 (List!13155 List!13155) Bool)

(assert (=> b!701340 (= res!465039 (subseq!275 acc!652 newAcc!49))))

(declare-fun b!701341 () Bool)

(declare-fun res!465058 () Bool)

(assert (=> b!701341 (=> (not res!465058) (not e!397481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!701341 (= res!465058 (validKeyInArray!0 (select (arr!19207 a!3591) from!2969)))))

(declare-fun b!701342 () Bool)

(assert (=> b!701342 (= e!397480 false)))

(declare-fun lt!317659 () Bool)

(assert (=> b!701342 (= lt!317659 (contains!3807 lt!317660 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!701343 () Bool)

(declare-fun res!465034 () Bool)

(assert (=> b!701343 (=> (not res!465034) (not e!397480))))

(assert (=> b!701343 (= res!465034 (contains!3807 lt!317660 k0!2824))))

(declare-fun b!701344 () Bool)

(declare-fun res!465047 () Bool)

(assert (=> b!701344 (=> (not res!465047) (not e!397481))))

(assert (=> b!701344 (= res!465047 (validKeyInArray!0 k0!2824))))

(declare-fun b!701345 () Bool)

(declare-fun res!465056 () Bool)

(assert (=> b!701345 (=> (not res!465056) (not e!397480))))

(assert (=> b!701345 (= res!465056 (not (contains!3807 lt!317660 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701346 () Bool)

(declare-fun res!465035 () Bool)

(assert (=> b!701346 (=> (not res!465035) (not e!397481))))

(assert (=> b!701346 (= res!465035 (not (contains!3807 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701347 () Bool)

(declare-fun res!465044 () Bool)

(assert (=> b!701347 (=> (not res!465044) (not e!397480))))

(assert (=> b!701347 (= res!465044 (not (contains!3807 lt!317661 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701348 () Bool)

(declare-fun res!465045 () Bool)

(assert (=> b!701348 (=> (not res!465045) (not e!397480))))

(assert (=> b!701348 (= res!465045 (subseq!275 lt!317661 lt!317660))))

(declare-fun b!701349 () Bool)

(declare-fun res!465038 () Bool)

(assert (=> b!701349 (=> (not res!465038) (not e!397481))))

(assert (=> b!701349 (= res!465038 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!701350 () Bool)

(declare-fun res!465059 () Bool)

(assert (=> b!701350 (=> (not res!465059) (not e!397481))))

(assert (=> b!701350 (= res!465059 (noDuplicate!1081 newAcc!49))))

(assert (= (and start!62488 res!465042) b!701336))

(assert (= (and b!701336 res!465057) b!701350))

(assert (= (and b!701350 res!465059) b!701333))

(assert (= (and b!701333 res!465041) b!701332))

(assert (= (and b!701332 res!465054) b!701327))

(assert (= (and b!701327 res!465036) b!701329))

(assert (= (and b!701329 res!465037) b!701344))

(assert (= (and b!701344 res!465047) b!701349))

(assert (= (and b!701349 res!465038) b!701340))

(assert (= (and b!701340 res!465039) b!701337))

(assert (= (and b!701337 res!465048) b!701339))

(assert (= (and b!701339 res!465046) b!701326))

(assert (= (and b!701326 res!465040) b!701346))

(assert (= (and b!701346 res!465035) b!701334))

(assert (= (and b!701334 res!465055) b!701341))

(assert (= (and b!701341 res!465058) b!701323))

(assert (= (and b!701323 res!465051) b!701331))

(assert (= (and b!701331 res!465049) b!701328))

(assert (= (and b!701328 res!465043) b!701347))

(assert (= (and b!701347 res!465044) b!701338))

(assert (= (and b!701338 res!465061) b!701325))

(assert (= (and b!701325 res!465053) b!701324))

(assert (= (and b!701324 res!465050) b!701330))

(assert (= (and b!701330 res!465052) b!701348))

(assert (= (and b!701348 res!465045) b!701343))

(assert (= (and b!701343 res!465034) b!701335))

(assert (= (and b!701335 res!465060) b!701345))

(assert (= (and b!701345 res!465056) b!701342))

(declare-fun m!661251 () Bool)

(assert (=> b!701348 m!661251))

(declare-fun m!661253 () Bool)

(assert (=> b!701331 m!661253))

(declare-fun m!661255 () Bool)

(assert (=> b!701341 m!661255))

(assert (=> b!701341 m!661255))

(declare-fun m!661257 () Bool)

(assert (=> b!701341 m!661257))

(declare-fun m!661259 () Bool)

(assert (=> b!701335 m!661259))

(declare-fun m!661261 () Bool)

(assert (=> b!701338 m!661261))

(declare-fun m!661263 () Bool)

(assert (=> b!701343 m!661263))

(declare-fun m!661265 () Bool)

(assert (=> b!701336 m!661265))

(declare-fun m!661267 () Bool)

(assert (=> b!701347 m!661267))

(declare-fun m!661269 () Bool)

(assert (=> b!701330 m!661269))

(declare-fun m!661271 () Bool)

(assert (=> b!701332 m!661271))

(declare-fun m!661273 () Bool)

(assert (=> b!701342 m!661273))

(declare-fun m!661275 () Bool)

(assert (=> b!701329 m!661275))

(declare-fun m!661277 () Bool)

(assert (=> b!701346 m!661277))

(declare-fun m!661279 () Bool)

(assert (=> b!701333 m!661279))

(declare-fun m!661281 () Bool)

(assert (=> b!701328 m!661281))

(declare-fun m!661283 () Bool)

(assert (=> b!701350 m!661283))

(declare-fun m!661285 () Bool)

(assert (=> b!701327 m!661285))

(declare-fun m!661287 () Bool)

(assert (=> b!701349 m!661287))

(declare-fun m!661289 () Bool)

(assert (=> b!701325 m!661289))

(declare-fun m!661291 () Bool)

(assert (=> b!701326 m!661291))

(declare-fun m!661293 () Bool)

(assert (=> b!701340 m!661293))

(assert (=> b!701323 m!661255))

(assert (=> b!701323 m!661255))

(declare-fun m!661295 () Bool)

(assert (=> b!701323 m!661295))

(assert (=> b!701323 m!661255))

(declare-fun m!661297 () Bool)

(assert (=> b!701323 m!661297))

(declare-fun m!661299 () Bool)

(assert (=> b!701345 m!661299))

(declare-fun m!661301 () Bool)

(assert (=> b!701337 m!661301))

(declare-fun m!661303 () Bool)

(assert (=> b!701344 m!661303))

(declare-fun m!661305 () Bool)

(assert (=> start!62488 m!661305))

(declare-fun m!661307 () Bool)

(assert (=> b!701324 m!661307))

(declare-fun m!661309 () Bool)

(assert (=> b!701339 m!661309))

(check-sat (not b!701338) (not b!701337) (not b!701330) (not b!701332) (not b!701346) (not b!701347) (not b!701340) (not b!701345) (not b!701335) (not start!62488) (not b!701323) (not b!701349) (not b!701333) (not b!701324) (not b!701341) (not b!701350) (not b!701339) (not b!701343) (not b!701325) (not b!701326) (not b!701342) (not b!701348) (not b!701336) (not b!701331) (not b!701327) (not b!701344) (not b!701329) (not b!701328))
(check-sat)
