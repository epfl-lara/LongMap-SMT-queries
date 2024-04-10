; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60172 () Bool)

(assert start!60172)

(declare-fun b!672340 () Bool)

(declare-fun res!438988 () Bool)

(declare-fun e!384106 () Bool)

(assert (=> b!672340 (=> (not res!438988) (not e!384106))))

(declare-datatypes ((List!12843 0))(
  ( (Nil!12840) (Cons!12839 (h!13884 (_ BitVec 64)) (t!19071 List!12843)) )
))
(declare-fun acc!681 () List!12843)

(declare-fun contains!3420 (List!12843 (_ BitVec 64)) Bool)

(assert (=> b!672340 (= res!438988 (not (contains!3420 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672341 () Bool)

(declare-fun e!384099 () Bool)

(declare-fun e!384100 () Bool)

(assert (=> b!672341 (= e!384099 e!384100)))

(declare-fun res!438993 () Bool)

(assert (=> b!672341 (=> (not res!438993) (not e!384100))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!672341 (= res!438993 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39219 0))(
  ( (array!39220 (arr!18802 (Array (_ BitVec 32) (_ BitVec 64))) (size!19166 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39219)

(declare-fun lt!312296 () List!12843)

(declare-fun $colon$colon!270 (List!12843 (_ BitVec 64)) List!12843)

(assert (=> b!672341 (= lt!312296 ($colon$colon!270 acc!681 (select (arr!18802 a!3626) from!3004)))))

(declare-fun b!672342 () Bool)

(declare-fun res!438991 () Bool)

(assert (=> b!672342 (=> (not res!438991) (not e!384100))))

(assert (=> b!672342 (= res!438991 (not (contains!3420 lt!312296 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672343 () Bool)

(assert (=> b!672343 (= e!384100 false)))

(declare-fun lt!312298 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39219 (_ BitVec 32) List!12843) Bool)

(assert (=> b!672343 (= lt!312298 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312296))))

(declare-fun b!672344 () Bool)

(declare-fun e!384098 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!672344 (= e!384098 (contains!3420 lt!312296 k0!2843))))

(declare-fun b!672345 () Bool)

(declare-fun res!438994 () Bool)

(assert (=> b!672345 (=> (not res!438994) (not e!384100))))

(declare-fun noDuplicate!667 (List!12843) Bool)

(assert (=> b!672345 (= res!438994 (noDuplicate!667 lt!312296))))

(declare-fun b!672346 () Bool)

(declare-fun res!438978 () Bool)

(assert (=> b!672346 (=> (not res!438978) (not e!384100))))

(declare-fun e!384107 () Bool)

(assert (=> b!672346 (= res!438978 e!384107)))

(declare-fun res!438977 () Bool)

(assert (=> b!672346 (=> res!438977 e!384107)))

(assert (=> b!672346 (= res!438977 e!384098)))

(declare-fun res!438981 () Bool)

(assert (=> b!672346 (=> (not res!438981) (not e!384098))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672346 (= res!438981 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672347 () Bool)

(declare-fun res!438973 () Bool)

(assert (=> b!672347 (=> (not res!438973) (not e!384106))))

(declare-fun e!384101 () Bool)

(assert (=> b!672347 (= res!438973 e!384101)))

(declare-fun res!438972 () Bool)

(assert (=> b!672347 (=> res!438972 e!384101)))

(declare-fun e!384102 () Bool)

(assert (=> b!672347 (= res!438972 e!384102)))

(declare-fun res!438985 () Bool)

(assert (=> b!672347 (=> (not res!438985) (not e!384102))))

(assert (=> b!672347 (= res!438985 (bvsgt from!3004 i!1382))))

(declare-fun b!672348 () Bool)

(declare-fun e!384108 () Bool)

(assert (=> b!672348 (= e!384108 (not (contains!3420 acc!681 k0!2843)))))

(declare-fun res!438983 () Bool)

(assert (=> start!60172 (=> (not res!438983) (not e!384106))))

(assert (=> start!60172 (= res!438983 (and (bvslt (size!19166 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19166 a!3626))))))

(assert (=> start!60172 e!384106))

(assert (=> start!60172 true))

(declare-fun array_inv!14598 (array!39219) Bool)

(assert (=> start!60172 (array_inv!14598 a!3626)))

(declare-fun b!672349 () Bool)

(declare-fun res!438995 () Bool)

(assert (=> b!672349 (=> (not res!438995) (not e!384106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672349 (= res!438995 (validKeyInArray!0 (select (arr!18802 a!3626) from!3004)))))

(declare-fun b!672350 () Bool)

(declare-fun res!438987 () Bool)

(assert (=> b!672350 (=> (not res!438987) (not e!384106))))

(assert (=> b!672350 (= res!438987 (noDuplicate!667 acc!681))))

(declare-fun b!672351 () Bool)

(declare-fun res!438984 () Bool)

(assert (=> b!672351 (=> (not res!438984) (not e!384106))))

(declare-fun arrayContainsKey!0 (array!39219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672351 (= res!438984 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672352 () Bool)

(assert (=> b!672352 (= e!384106 e!384099)))

(declare-fun res!438975 () Bool)

(assert (=> b!672352 (=> (not res!438975) (not e!384099))))

(assert (=> b!672352 (= res!438975 (not (= (select (arr!18802 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23620 0))(
  ( (Unit!23621) )
))
(declare-fun lt!312297 () Unit!23620)

(declare-fun e!384104 () Unit!23620)

(assert (=> b!672352 (= lt!312297 e!384104)))

(declare-fun c!77051 () Bool)

(assert (=> b!672352 (= c!77051 (= (select (arr!18802 a!3626) from!3004) k0!2843))))

(declare-fun b!672353 () Bool)

(assert (=> b!672353 (= e!384101 e!384108)))

(declare-fun res!438974 () Bool)

(assert (=> b!672353 (=> (not res!438974) (not e!384108))))

(assert (=> b!672353 (= res!438974 (bvsle from!3004 i!1382))))

(declare-fun b!672354 () Bool)

(assert (=> b!672354 (= e!384102 (contains!3420 acc!681 k0!2843))))

(declare-fun b!672355 () Bool)

(declare-fun res!438990 () Bool)

(assert (=> b!672355 (=> (not res!438990) (not e!384106))))

(assert (=> b!672355 (= res!438990 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672356 () Bool)

(declare-fun res!438982 () Bool)

(assert (=> b!672356 (=> (not res!438982) (not e!384106))))

(assert (=> b!672356 (= res!438982 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12840))))

(declare-fun b!672357 () Bool)

(declare-fun res!438989 () Bool)

(assert (=> b!672357 (=> (not res!438989) (not e!384106))))

(assert (=> b!672357 (= res!438989 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19166 a!3626))))))

(declare-fun b!672358 () Bool)

(declare-fun res!438980 () Bool)

(assert (=> b!672358 (=> (not res!438980) (not e!384106))))

(assert (=> b!672358 (= res!438980 (validKeyInArray!0 k0!2843))))

(declare-fun b!672359 () Bool)

(declare-fun e!384103 () Bool)

(assert (=> b!672359 (= e!384103 (not (contains!3420 lt!312296 k0!2843)))))

(declare-fun b!672360 () Bool)

(declare-fun res!438979 () Bool)

(assert (=> b!672360 (=> (not res!438979) (not e!384100))))

(assert (=> b!672360 (= res!438979 (not (contains!3420 lt!312296 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672361 () Bool)

(declare-fun res!438992 () Bool)

(assert (=> b!672361 (=> (not res!438992) (not e!384106))))

(assert (=> b!672361 (= res!438992 (not (contains!3420 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672362 () Bool)

(assert (=> b!672362 (= e!384107 e!384103)))

(declare-fun res!438986 () Bool)

(assert (=> b!672362 (=> (not res!438986) (not e!384103))))

(assert (=> b!672362 (= res!438986 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672363 () Bool)

(declare-fun Unit!23622 () Unit!23620)

(assert (=> b!672363 (= e!384104 Unit!23622)))

(assert (=> b!672363 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312295 () Unit!23620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39219 (_ BitVec 64) (_ BitVec 32)) Unit!23620)

(assert (=> b!672363 (= lt!312295 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672363 false))

(declare-fun b!672364 () Bool)

(declare-fun res!438976 () Bool)

(assert (=> b!672364 (=> (not res!438976) (not e!384106))))

(assert (=> b!672364 (= res!438976 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19166 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672365 () Bool)

(declare-fun Unit!23623 () Unit!23620)

(assert (=> b!672365 (= e!384104 Unit!23623)))

(assert (= (and start!60172 res!438983) b!672350))

(assert (= (and b!672350 res!438987) b!672361))

(assert (= (and b!672361 res!438992) b!672340))

(assert (= (and b!672340 res!438988) b!672347))

(assert (= (and b!672347 res!438985) b!672354))

(assert (= (and b!672347 (not res!438972)) b!672353))

(assert (= (and b!672353 res!438974) b!672348))

(assert (= (and b!672347 res!438973) b!672356))

(assert (= (and b!672356 res!438982) b!672355))

(assert (= (and b!672355 res!438990) b!672357))

(assert (= (and b!672357 res!438989) b!672358))

(assert (= (and b!672358 res!438980) b!672351))

(assert (= (and b!672351 res!438984) b!672364))

(assert (= (and b!672364 res!438976) b!672349))

(assert (= (and b!672349 res!438995) b!672352))

(assert (= (and b!672352 c!77051) b!672363))

(assert (= (and b!672352 (not c!77051)) b!672365))

(assert (= (and b!672352 res!438975) b!672341))

(assert (= (and b!672341 res!438993) b!672345))

(assert (= (and b!672345 res!438994) b!672360))

(assert (= (and b!672360 res!438979) b!672342))

(assert (= (and b!672342 res!438991) b!672346))

(assert (= (and b!672346 res!438981) b!672344))

(assert (= (and b!672346 (not res!438977)) b!672362))

(assert (= (and b!672362 res!438986) b!672359))

(assert (= (and b!672346 res!438978) b!672343))

(declare-fun m!641353 () Bool)

(assert (=> b!672350 m!641353))

(declare-fun m!641355 () Bool)

(assert (=> b!672355 m!641355))

(declare-fun m!641357 () Bool)

(assert (=> b!672354 m!641357))

(declare-fun m!641359 () Bool)

(assert (=> b!672356 m!641359))

(declare-fun m!641361 () Bool)

(assert (=> b!672349 m!641361))

(assert (=> b!672349 m!641361))

(declare-fun m!641363 () Bool)

(assert (=> b!672349 m!641363))

(declare-fun m!641365 () Bool)

(assert (=> b!672351 m!641365))

(declare-fun m!641367 () Bool)

(assert (=> b!672359 m!641367))

(declare-fun m!641369 () Bool)

(assert (=> b!672340 m!641369))

(declare-fun m!641371 () Bool)

(assert (=> b!672342 m!641371))

(declare-fun m!641373 () Bool)

(assert (=> b!672358 m!641373))

(declare-fun m!641375 () Bool)

(assert (=> b!672360 m!641375))

(assert (=> b!672341 m!641361))

(assert (=> b!672341 m!641361))

(declare-fun m!641377 () Bool)

(assert (=> b!672341 m!641377))

(declare-fun m!641379 () Bool)

(assert (=> b!672361 m!641379))

(declare-fun m!641381 () Bool)

(assert (=> start!60172 m!641381))

(declare-fun m!641383 () Bool)

(assert (=> b!672345 m!641383))

(declare-fun m!641385 () Bool)

(assert (=> b!672363 m!641385))

(declare-fun m!641387 () Bool)

(assert (=> b!672363 m!641387))

(assert (=> b!672352 m!641361))

(assert (=> b!672348 m!641357))

(assert (=> b!672344 m!641367))

(declare-fun m!641389 () Bool)

(assert (=> b!672343 m!641389))

(check-sat (not b!672358) (not b!672343) (not b!672351) (not b!672355) (not b!672359) (not b!672348) (not b!672340) (not b!672350) (not b!672341) (not b!672354) (not b!672345) (not b!672356) (not b!672349) (not b!672363) (not b!672344) (not b!672342) (not start!60172) (not b!672360) (not b!672361))
(check-sat)
