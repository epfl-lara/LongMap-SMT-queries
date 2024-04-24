; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60246 () Bool)

(assert start!60246)

(declare-fun b!673188 () Bool)

(declare-fun e!384511 () Bool)

(declare-datatypes ((List!12753 0))(
  ( (Nil!12750) (Cons!12749 (h!13797 (_ BitVec 64)) (t!18973 List!12753)) )
))
(declare-fun lt!312494 () List!12753)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3405 (List!12753 (_ BitVec 64)) Bool)

(assert (=> b!673188 (= e!384511 (contains!3405 lt!312494 k0!2843))))

(declare-fun b!673189 () Bool)

(declare-fun res!439675 () Bool)

(declare-fun e!384504 () Bool)

(assert (=> b!673189 (=> (not res!439675) (not e!384504))))

(declare-datatypes ((array!39231 0))(
  ( (array!39232 (arr!18805 (Array (_ BitVec 32) (_ BitVec 64))) (size!19169 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39231)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun acc!681 () List!12753)

(declare-fun arrayNoDuplicates!0 (array!39231 (_ BitVec 32) List!12753) Bool)

(assert (=> b!673189 (= res!439675 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673190 () Bool)

(declare-fun res!439680 () Bool)

(declare-fun e!384512 () Bool)

(assert (=> b!673190 (=> (not res!439680) (not e!384512))))

(declare-fun e!384505 () Bool)

(assert (=> b!673190 (= res!439680 e!384505)))

(declare-fun res!439670 () Bool)

(assert (=> b!673190 (=> res!439670 e!384505)))

(assert (=> b!673190 (= res!439670 e!384511)))

(declare-fun res!439677 () Bool)

(assert (=> b!673190 (=> (not res!439677) (not e!384511))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673190 (= res!439677 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673191 () Bool)

(declare-fun e!384506 () Bool)

(assert (=> b!673191 (= e!384506 e!384512)))

(declare-fun res!439683 () Bool)

(assert (=> b!673191 (=> (not res!439683) (not e!384512))))

(assert (=> b!673191 (= res!439683 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!275 (List!12753 (_ BitVec 64)) List!12753)

(assert (=> b!673191 (= lt!312494 ($colon$colon!275 acc!681 (select (arr!18805 a!3626) from!3004)))))

(declare-fun b!673192 () Bool)

(declare-fun res!439669 () Bool)

(assert (=> b!673192 (=> (not res!439669) (not e!384504))))

(declare-fun arrayContainsKey!0 (array!39231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673192 (= res!439669 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673193 () Bool)

(declare-fun res!439679 () Bool)

(assert (=> b!673193 (=> (not res!439679) (not e!384504))))

(declare-fun e!384513 () Bool)

(assert (=> b!673193 (= res!439679 e!384513)))

(declare-fun res!439661 () Bool)

(assert (=> b!673193 (=> res!439661 e!384513)))

(declare-fun e!384503 () Bool)

(assert (=> b!673193 (= res!439661 e!384503)))

(declare-fun res!439684 () Bool)

(assert (=> b!673193 (=> (not res!439684) (not e!384503))))

(assert (=> b!673193 (= res!439684 (bvsgt from!3004 i!1382))))

(declare-fun b!673194 () Bool)

(declare-fun e!384507 () Bool)

(assert (=> b!673194 (= e!384505 e!384507)))

(declare-fun res!439665 () Bool)

(assert (=> b!673194 (=> (not res!439665) (not e!384507))))

(assert (=> b!673194 (= res!439665 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673195 () Bool)

(declare-fun res!439676 () Bool)

(assert (=> b!673195 (=> (not res!439676) (not e!384504))))

(declare-fun noDuplicate!679 (List!12753) Bool)

(assert (=> b!673195 (= res!439676 (noDuplicate!679 acc!681))))

(declare-fun b!673196 () Bool)

(declare-fun res!439681 () Bool)

(assert (=> b!673196 (=> (not res!439681) (not e!384504))))

(assert (=> b!673196 (= res!439681 (not (contains!3405 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673197 () Bool)

(declare-fun res!439672 () Bool)

(assert (=> b!673197 (=> (not res!439672) (not e!384512))))

(assert (=> b!673197 (= res!439672 (not (contains!3405 lt!312494 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673198 () Bool)

(declare-fun e!384510 () Bool)

(assert (=> b!673198 (= e!384510 (not (contains!3405 acc!681 k0!2843)))))

(declare-fun b!673199 () Bool)

(declare-fun res!439667 () Bool)

(assert (=> b!673199 (=> (not res!439667) (not e!384504))))

(assert (=> b!673199 (= res!439667 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19169 a!3626))))))

(declare-fun b!673200 () Bool)

(declare-fun res!439668 () Bool)

(assert (=> b!673200 (=> (not res!439668) (not e!384512))))

(assert (=> b!673200 (= res!439668 (not (contains!3405 lt!312494 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673201 () Bool)

(assert (=> b!673201 (= e!384512 false)))

(declare-fun lt!312496 () Bool)

(assert (=> b!673201 (= lt!312496 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312494))))

(declare-fun b!673202 () Bool)

(declare-fun res!439666 () Bool)

(assert (=> b!673202 (=> (not res!439666) (not e!384504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673202 (= res!439666 (validKeyInArray!0 k0!2843))))

(declare-fun b!673203 () Bool)

(assert (=> b!673203 (= e!384503 (contains!3405 acc!681 k0!2843))))

(declare-fun b!673204 () Bool)

(declare-fun res!439674 () Bool)

(assert (=> b!673204 (=> (not res!439674) (not e!384504))))

(assert (=> b!673204 (= res!439674 (not (contains!3405 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673205 () Bool)

(declare-fun res!439673 () Bool)

(assert (=> b!673205 (=> (not res!439673) (not e!384504))))

(assert (=> b!673205 (= res!439673 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12750))))

(declare-fun b!673206 () Bool)

(declare-fun res!439663 () Bool)

(assert (=> b!673206 (=> (not res!439663) (not e!384504))))

(assert (=> b!673206 (= res!439663 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19169 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673207 () Bool)

(assert (=> b!673207 (= e!384513 e!384510)))

(declare-fun res!439678 () Bool)

(assert (=> b!673207 (=> (not res!439678) (not e!384510))))

(assert (=> b!673207 (= res!439678 (bvsle from!3004 i!1382))))

(declare-fun b!673208 () Bool)

(declare-datatypes ((Unit!23631 0))(
  ( (Unit!23632) )
))
(declare-fun e!384509 () Unit!23631)

(declare-fun Unit!23633 () Unit!23631)

(assert (=> b!673208 (= e!384509 Unit!23633)))

(assert (=> b!673208 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312495 () Unit!23631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39231 (_ BitVec 64) (_ BitVec 32)) Unit!23631)

(assert (=> b!673208 (= lt!312495 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673208 false))

(declare-fun b!673209 () Bool)

(declare-fun Unit!23634 () Unit!23631)

(assert (=> b!673209 (= e!384509 Unit!23634)))

(declare-fun b!673210 () Bool)

(assert (=> b!673210 (= e!384507 (not (contains!3405 lt!312494 k0!2843)))))

(declare-fun res!439662 () Bool)

(assert (=> start!60246 (=> (not res!439662) (not e!384504))))

(assert (=> start!60246 (= res!439662 (and (bvslt (size!19169 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19169 a!3626))))))

(assert (=> start!60246 e!384504))

(assert (=> start!60246 true))

(declare-fun array_inv!14664 (array!39231) Bool)

(assert (=> start!60246 (array_inv!14664 a!3626)))

(declare-fun b!673211 () Bool)

(declare-fun res!439664 () Bool)

(assert (=> b!673211 (=> (not res!439664) (not e!384504))))

(assert (=> b!673211 (= res!439664 (validKeyInArray!0 (select (arr!18805 a!3626) from!3004)))))

(declare-fun b!673212 () Bool)

(assert (=> b!673212 (= e!384504 e!384506)))

(declare-fun res!439671 () Bool)

(assert (=> b!673212 (=> (not res!439671) (not e!384506))))

(assert (=> b!673212 (= res!439671 (not (= (select (arr!18805 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312493 () Unit!23631)

(assert (=> b!673212 (= lt!312493 e!384509)))

(declare-fun c!77132 () Bool)

(assert (=> b!673212 (= c!77132 (= (select (arr!18805 a!3626) from!3004) k0!2843))))

(declare-fun b!673213 () Bool)

(declare-fun res!439682 () Bool)

(assert (=> b!673213 (=> (not res!439682) (not e!384512))))

(assert (=> b!673213 (= res!439682 (noDuplicate!679 lt!312494))))

(assert (= (and start!60246 res!439662) b!673195))

(assert (= (and b!673195 res!439676) b!673204))

(assert (= (and b!673204 res!439674) b!673196))

(assert (= (and b!673196 res!439681) b!673193))

(assert (= (and b!673193 res!439684) b!673203))

(assert (= (and b!673193 (not res!439661)) b!673207))

(assert (= (and b!673207 res!439678) b!673198))

(assert (= (and b!673193 res!439679) b!673205))

(assert (= (and b!673205 res!439673) b!673189))

(assert (= (and b!673189 res!439675) b!673199))

(assert (= (and b!673199 res!439667) b!673202))

(assert (= (and b!673202 res!439666) b!673192))

(assert (= (and b!673192 res!439669) b!673206))

(assert (= (and b!673206 res!439663) b!673211))

(assert (= (and b!673211 res!439664) b!673212))

(assert (= (and b!673212 c!77132) b!673208))

(assert (= (and b!673212 (not c!77132)) b!673209))

(assert (= (and b!673212 res!439671) b!673191))

(assert (= (and b!673191 res!439683) b!673213))

(assert (= (and b!673213 res!439682) b!673200))

(assert (= (and b!673200 res!439668) b!673197))

(assert (= (and b!673197 res!439672) b!673190))

(assert (= (and b!673190 res!439677) b!673188))

(assert (= (and b!673190 (not res!439670)) b!673194))

(assert (= (and b!673194 res!439665) b!673210))

(assert (= (and b!673190 res!439680) b!673201))

(declare-fun m!642355 () Bool)

(assert (=> b!673188 m!642355))

(declare-fun m!642357 () Bool)

(assert (=> b!673208 m!642357))

(declare-fun m!642359 () Bool)

(assert (=> b!673208 m!642359))

(declare-fun m!642361 () Bool)

(assert (=> b!673205 m!642361))

(declare-fun m!642363 () Bool)

(assert (=> b!673189 m!642363))

(declare-fun m!642365 () Bool)

(assert (=> b!673192 m!642365))

(declare-fun m!642367 () Bool)

(assert (=> b!673212 m!642367))

(declare-fun m!642369 () Bool)

(assert (=> b!673198 m!642369))

(declare-fun m!642371 () Bool)

(assert (=> b!673197 m!642371))

(declare-fun m!642373 () Bool)

(assert (=> b!673213 m!642373))

(declare-fun m!642375 () Bool)

(assert (=> b!673201 m!642375))

(declare-fun m!642377 () Bool)

(assert (=> start!60246 m!642377))

(declare-fun m!642379 () Bool)

(assert (=> b!673200 m!642379))

(assert (=> b!673210 m!642355))

(declare-fun m!642381 () Bool)

(assert (=> b!673204 m!642381))

(declare-fun m!642383 () Bool)

(assert (=> b!673195 m!642383))

(declare-fun m!642385 () Bool)

(assert (=> b!673202 m!642385))

(assert (=> b!673203 m!642369))

(declare-fun m!642387 () Bool)

(assert (=> b!673196 m!642387))

(assert (=> b!673211 m!642367))

(assert (=> b!673211 m!642367))

(declare-fun m!642389 () Bool)

(assert (=> b!673211 m!642389))

(assert (=> b!673191 m!642367))

(assert (=> b!673191 m!642367))

(declare-fun m!642391 () Bool)

(assert (=> b!673191 m!642391))

(check-sat (not b!673196) (not b!673208) (not b!673198) (not b!673201) (not b!673203) (not b!673192) (not b!673210) (not b!673195) (not b!673188) (not b!673197) (not b!673211) (not b!673213) (not b!673191) (not b!673189) (not b!673200) (not b!673205) (not b!673204) (not b!673202) (not start!60246))
(check-sat)
