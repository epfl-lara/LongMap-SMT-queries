; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60146 () Bool)

(assert start!60146)

(declare-fun b!671498 () Bool)

(declare-fun e!383681 () Bool)

(declare-fun e!383677 () Bool)

(assert (=> b!671498 (= e!383681 e!383677)))

(declare-fun res!438351 () Bool)

(assert (=> b!671498 (=> (not res!438351) (not e!383677))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39204 0))(
  ( (array!39205 (arr!18794 (Array (_ BitVec 32) (_ BitVec 64))) (size!19159 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39204)

(assert (=> b!671498 (= res!438351 (not (= (select (arr!18794 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23570 0))(
  ( (Unit!23571) )
))
(declare-fun lt!311955 () Unit!23570)

(declare-fun e!383679 () Unit!23570)

(assert (=> b!671498 (= lt!311955 e!383679)))

(declare-fun c!76950 () Bool)

(assert (=> b!671498 (= c!76950 (= (select (arr!18794 a!3626) from!3004) k0!2843))))

(declare-fun b!671499 () Bool)

(declare-fun res!438337 () Bool)

(declare-fun e!383684 () Bool)

(assert (=> b!671499 (=> (not res!438337) (not e!383684))))

(declare-fun e!383685 () Bool)

(assert (=> b!671499 (= res!438337 e!383685)))

(declare-fun res!438342 () Bool)

(assert (=> b!671499 (=> res!438342 e!383685)))

(declare-fun e!383678 () Bool)

(assert (=> b!671499 (= res!438342 e!383678)))

(declare-fun res!438353 () Bool)

(assert (=> b!671499 (=> (not res!438353) (not e!383678))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671499 (= res!438353 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671500 () Bool)

(declare-fun res!438339 () Bool)

(assert (=> b!671500 (=> (not res!438339) (not e!383684))))

(declare-datatypes ((List!12874 0))(
  ( (Nil!12871) (Cons!12870 (h!13915 (_ BitVec 64)) (t!19093 List!12874)) )
))
(declare-fun lt!311956 () List!12874)

(declare-fun contains!3396 (List!12874 (_ BitVec 64)) Bool)

(assert (=> b!671500 (= res!438339 (not (contains!3396 lt!311956 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671501 () Bool)

(declare-fun res!438349 () Bool)

(assert (=> b!671501 (=> (not res!438349) (not e!383681))))

(declare-fun acc!681 () List!12874)

(assert (=> b!671501 (= res!438349 (not (contains!3396 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671502 () Bool)

(declare-fun Unit!23572 () Unit!23570)

(assert (=> b!671502 (= e!383679 Unit!23572)))

(declare-fun arrayContainsKey!0 (array!39204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671502 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!311957 () Unit!23570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39204 (_ BitVec 64) (_ BitVec 32)) Unit!23570)

(assert (=> b!671502 (= lt!311957 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!671502 false))

(declare-fun res!438350 () Bool)

(assert (=> start!60146 (=> (not res!438350) (not e!383681))))

(assert (=> start!60146 (= res!438350 (and (bvslt (size!19159 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19159 a!3626))))))

(assert (=> start!60146 e!383681))

(assert (=> start!60146 true))

(declare-fun array_inv!14677 (array!39204) Bool)

(assert (=> start!60146 (array_inv!14677 a!3626)))

(declare-fun b!671503 () Bool)

(assert (=> b!671503 (= e!383684 false)))

(declare-fun lt!311958 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39204 (_ BitVec 32) List!12874) Bool)

(assert (=> b!671503 (= lt!311958 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311956))))

(declare-fun b!671504 () Bool)

(declare-fun res!438345 () Bool)

(assert (=> b!671504 (=> (not res!438345) (not e!383681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671504 (= res!438345 (validKeyInArray!0 k0!2843))))

(declare-fun b!671505 () Bool)

(declare-fun res!438336 () Bool)

(assert (=> b!671505 (=> (not res!438336) (not e!383684))))

(declare-fun noDuplicate!665 (List!12874) Bool)

(assert (=> b!671505 (= res!438336 (noDuplicate!665 lt!311956))))

(declare-fun b!671506 () Bool)

(declare-fun e!383687 () Bool)

(assert (=> b!671506 (= e!383687 (not (contains!3396 lt!311956 k0!2843)))))

(declare-fun b!671507 () Bool)

(assert (=> b!671507 (= e!383678 (contains!3396 lt!311956 k0!2843))))

(declare-fun b!671508 () Bool)

(declare-fun Unit!23573 () Unit!23570)

(assert (=> b!671508 (= e!383679 Unit!23573)))

(declare-fun b!671509 () Bool)

(declare-fun res!438343 () Bool)

(assert (=> b!671509 (=> (not res!438343) (not e!383681))))

(assert (=> b!671509 (= res!438343 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671510 () Bool)

(assert (=> b!671510 (= e!383677 e!383684)))

(declare-fun res!438338 () Bool)

(assert (=> b!671510 (=> (not res!438338) (not e!383684))))

(assert (=> b!671510 (= res!438338 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!262 (List!12874 (_ BitVec 64)) List!12874)

(assert (=> b!671510 (= lt!311956 ($colon$colon!262 acc!681 (select (arr!18794 a!3626) from!3004)))))

(declare-fun b!671511 () Bool)

(declare-fun res!438352 () Bool)

(assert (=> b!671511 (=> (not res!438352) (not e!383681))))

(declare-fun e!383682 () Bool)

(assert (=> b!671511 (= res!438352 e!383682)))

(declare-fun res!438355 () Bool)

(assert (=> b!671511 (=> res!438355 e!383682)))

(declare-fun e!383680 () Bool)

(assert (=> b!671511 (= res!438355 e!383680)))

(declare-fun res!438344 () Bool)

(assert (=> b!671511 (=> (not res!438344) (not e!383680))))

(assert (=> b!671511 (= res!438344 (bvsgt from!3004 i!1382))))

(declare-fun b!671512 () Bool)

(declare-fun e!383686 () Bool)

(assert (=> b!671512 (= e!383682 e!383686)))

(declare-fun res!438354 () Bool)

(assert (=> b!671512 (=> (not res!438354) (not e!383686))))

(assert (=> b!671512 (= res!438354 (bvsle from!3004 i!1382))))

(declare-fun b!671513 () Bool)

(declare-fun res!438347 () Bool)

(assert (=> b!671513 (=> (not res!438347) (not e!383684))))

(assert (=> b!671513 (= res!438347 (not (contains!3396 lt!311956 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671514 () Bool)

(declare-fun res!438333 () Bool)

(assert (=> b!671514 (=> (not res!438333) (not e!383681))))

(assert (=> b!671514 (= res!438333 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671515 () Bool)

(declare-fun res!438346 () Bool)

(assert (=> b!671515 (=> (not res!438346) (not e!383681))))

(assert (=> b!671515 (= res!438346 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12871))))

(declare-fun b!671516 () Bool)

(declare-fun res!438332 () Bool)

(assert (=> b!671516 (=> (not res!438332) (not e!383681))))

(assert (=> b!671516 (= res!438332 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19159 a!3626))))))

(declare-fun b!671517 () Bool)

(declare-fun res!438334 () Bool)

(assert (=> b!671517 (=> (not res!438334) (not e!383681))))

(assert (=> b!671517 (= res!438334 (not (contains!3396 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671518 () Bool)

(assert (=> b!671518 (= e!383685 e!383687)))

(declare-fun res!438348 () Bool)

(assert (=> b!671518 (=> (not res!438348) (not e!383687))))

(assert (=> b!671518 (= res!438348 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671519 () Bool)

(declare-fun res!438340 () Bool)

(assert (=> b!671519 (=> (not res!438340) (not e!383681))))

(assert (=> b!671519 (= res!438340 (validKeyInArray!0 (select (arr!18794 a!3626) from!3004)))))

(declare-fun b!671520 () Bool)

(declare-fun res!438341 () Bool)

(assert (=> b!671520 (=> (not res!438341) (not e!383681))))

(assert (=> b!671520 (= res!438341 (noDuplicate!665 acc!681))))

(declare-fun b!671521 () Bool)

(assert (=> b!671521 (= e!383680 (contains!3396 acc!681 k0!2843))))

(declare-fun b!671522 () Bool)

(assert (=> b!671522 (= e!383686 (not (contains!3396 acc!681 k0!2843)))))

(declare-fun b!671523 () Bool)

(declare-fun res!438335 () Bool)

(assert (=> b!671523 (=> (not res!438335) (not e!383681))))

(assert (=> b!671523 (= res!438335 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19159 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!60146 res!438350) b!671520))

(assert (= (and b!671520 res!438341) b!671517))

(assert (= (and b!671517 res!438334) b!671501))

(assert (= (and b!671501 res!438349) b!671511))

(assert (= (and b!671511 res!438344) b!671521))

(assert (= (and b!671511 (not res!438355)) b!671512))

(assert (= (and b!671512 res!438354) b!671522))

(assert (= (and b!671511 res!438352) b!671515))

(assert (= (and b!671515 res!438346) b!671514))

(assert (= (and b!671514 res!438333) b!671516))

(assert (= (and b!671516 res!438332) b!671504))

(assert (= (and b!671504 res!438345) b!671509))

(assert (= (and b!671509 res!438343) b!671523))

(assert (= (and b!671523 res!438335) b!671519))

(assert (= (and b!671519 res!438340) b!671498))

(assert (= (and b!671498 c!76950) b!671502))

(assert (= (and b!671498 (not c!76950)) b!671508))

(assert (= (and b!671498 res!438351) b!671510))

(assert (= (and b!671510 res!438338) b!671505))

(assert (= (and b!671505 res!438336) b!671500))

(assert (= (and b!671500 res!438339) b!671513))

(assert (= (and b!671513 res!438347) b!671499))

(assert (= (and b!671499 res!438353) b!671507))

(assert (= (and b!671499 (not res!438342)) b!671518))

(assert (= (and b!671518 res!438348) b!671506))

(assert (= (and b!671499 res!438337) b!671503))

(declare-fun m!640305 () Bool)

(assert (=> b!671498 m!640305))

(declare-fun m!640307 () Bool)

(assert (=> b!671506 m!640307))

(declare-fun m!640309 () Bool)

(assert (=> b!671517 m!640309))

(assert (=> b!671519 m!640305))

(assert (=> b!671519 m!640305))

(declare-fun m!640311 () Bool)

(assert (=> b!671519 m!640311))

(declare-fun m!640313 () Bool)

(assert (=> start!60146 m!640313))

(declare-fun m!640315 () Bool)

(assert (=> b!671505 m!640315))

(declare-fun m!640317 () Bool)

(assert (=> b!671514 m!640317))

(declare-fun m!640319 () Bool)

(assert (=> b!671515 m!640319))

(declare-fun m!640321 () Bool)

(assert (=> b!671520 m!640321))

(declare-fun m!640323 () Bool)

(assert (=> b!671509 m!640323))

(declare-fun m!640325 () Bool)

(assert (=> b!671500 m!640325))

(assert (=> b!671507 m!640307))

(declare-fun m!640327 () Bool)

(assert (=> b!671522 m!640327))

(declare-fun m!640329 () Bool)

(assert (=> b!671513 m!640329))

(assert (=> b!671510 m!640305))

(assert (=> b!671510 m!640305))

(declare-fun m!640331 () Bool)

(assert (=> b!671510 m!640331))

(declare-fun m!640333 () Bool)

(assert (=> b!671503 m!640333))

(declare-fun m!640335 () Bool)

(assert (=> b!671504 m!640335))

(declare-fun m!640337 () Bool)

(assert (=> b!671501 m!640337))

(assert (=> b!671521 m!640327))

(declare-fun m!640339 () Bool)

(assert (=> b!671502 m!640339))

(declare-fun m!640341 () Bool)

(assert (=> b!671502 m!640341))

(check-sat (not b!671505) (not b!671510) (not b!671519) (not b!671504) (not start!60146) (not b!671506) (not b!671501) (not b!671520) (not b!671500) (not b!671513) (not b!671521) (not b!671514) (not b!671503) (not b!671502) (not b!671517) (not b!671515) (not b!671507) (not b!671522) (not b!671509))
(check-sat)
