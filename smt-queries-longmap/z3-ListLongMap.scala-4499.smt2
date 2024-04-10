; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62464 () Bool)

(assert start!62464)

(declare-fun b!702488 () Bool)

(declare-fun res!466320 () Bool)

(declare-fun e!397508 () Bool)

(assert (=> b!702488 (=> (not res!466320) (not e!397508))))

(declare-datatypes ((List!13269 0))(
  ( (Nil!13266) (Cons!13265 (h!14310 (_ BitVec 64)) (t!19551 List!13269)) )
))
(declare-fun lt!317706 () List!13269)

(declare-fun contains!3846 (List!13269 (_ BitVec 64)) Bool)

(assert (=> b!702488 (= res!466320 (not (contains!3846 lt!317706 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702489 () Bool)

(declare-fun res!466299 () Bool)

(assert (=> b!702489 (=> (not res!466299) (not e!397508))))

(declare-fun lt!317705 () List!13269)

(assert (=> b!702489 (= res!466299 (not (contains!3846 lt!317705 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702490 () Bool)

(declare-fun e!397510 () Bool)

(assert (=> b!702490 (= e!397510 e!397508)))

(declare-fun res!466314 () Bool)

(assert (=> b!702490 (=> (not res!466314) (not e!397508))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!702490 (= res!466314 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun newAcc!49 () List!13269)

(declare-datatypes ((array!40143 0))(
  ( (array!40144 (arr!19228 (Array (_ BitVec 32) (_ BitVec 64))) (size!19613 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40143)

(declare-fun $colon$colon!489 (List!13269 (_ BitVec 64)) List!13269)

(assert (=> b!702490 (= lt!317706 ($colon$colon!489 newAcc!49 (select (arr!19228 a!3591) from!2969)))))

(declare-fun acc!652 () List!13269)

(assert (=> b!702490 (= lt!317705 ($colon$colon!489 acc!652 (select (arr!19228 a!3591) from!2969)))))

(declare-fun b!702491 () Bool)

(declare-fun res!466301 () Bool)

(assert (=> b!702491 (=> (not res!466301) (not e!397508))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!702491 (= res!466301 (not (contains!3846 lt!317705 k0!2824)))))

(declare-fun b!702492 () Bool)

(declare-fun res!466304 () Bool)

(assert (=> b!702492 (=> (not res!466304) (not e!397508))))

(declare-fun noDuplicate!1093 (List!13269) Bool)

(assert (=> b!702492 (= res!466304 (noDuplicate!1093 lt!317706))))

(declare-fun b!702493 () Bool)

(declare-fun res!466306 () Bool)

(assert (=> b!702493 (=> (not res!466306) (not e!397510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702493 (= res!466306 (validKeyInArray!0 k0!2824))))

(declare-fun b!702495 () Bool)

(declare-fun res!466319 () Bool)

(assert (=> b!702495 (=> (not res!466319) (not e!397510))))

(assert (=> b!702495 (= res!466319 (validKeyInArray!0 (select (arr!19228 a!3591) from!2969)))))

(declare-fun b!702496 () Bool)

(declare-fun res!466322 () Bool)

(assert (=> b!702496 (=> (not res!466322) (not e!397510))))

(assert (=> b!702496 (= res!466322 (not (contains!3846 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702497 () Bool)

(declare-fun res!466317 () Bool)

(assert (=> b!702497 (=> (not res!466317) (not e!397508))))

(assert (=> b!702497 (= res!466317 (contains!3846 lt!317706 k0!2824))))

(declare-fun b!702498 () Bool)

(declare-fun res!466318 () Bool)

(assert (=> b!702498 (=> (not res!466318) (not e!397510))))

(declare-fun -!256 (List!13269 (_ BitVec 64)) List!13269)

(assert (=> b!702498 (= res!466318 (= (-!256 newAcc!49 k0!2824) acc!652))))

(declare-fun b!702499 () Bool)

(declare-fun res!466325 () Bool)

(assert (=> b!702499 (=> (not res!466325) (not e!397510))))

(declare-fun arrayContainsKey!0 (array!40143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702499 (= res!466325 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702500 () Bool)

(declare-fun res!466309 () Bool)

(assert (=> b!702500 (=> (not res!466309) (not e!397510))))

(assert (=> b!702500 (= res!466309 (not (contains!3846 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702501 () Bool)

(declare-fun res!466302 () Bool)

(assert (=> b!702501 (=> (not res!466302) (not e!397510))))

(assert (=> b!702501 (= res!466302 (not (contains!3846 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702502 () Bool)

(declare-fun res!466313 () Bool)

(assert (=> b!702502 (=> (not res!466313) (not e!397508))))

(assert (=> b!702502 (= res!466313 (not (contains!3846 lt!317706 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702503 () Bool)

(declare-fun res!466303 () Bool)

(assert (=> b!702503 (=> (not res!466303) (not e!397508))))

(assert (=> b!702503 (= res!466303 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!466298 () Bool)

(assert (=> start!62464 (=> (not res!466298) (not e!397510))))

(assert (=> start!62464 (= res!466298 (and (bvslt (size!19613 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19613 a!3591))))))

(assert (=> start!62464 e!397510))

(assert (=> start!62464 true))

(declare-fun array_inv!15024 (array!40143) Bool)

(assert (=> start!62464 (array_inv!15024 a!3591)))

(declare-fun b!702494 () Bool)

(declare-fun res!466311 () Bool)

(assert (=> b!702494 (=> (not res!466311) (not e!397508))))

(assert (=> b!702494 (= res!466311 (noDuplicate!1093 lt!317705))))

(declare-fun b!702504 () Bool)

(declare-fun res!466323 () Bool)

(assert (=> b!702504 (=> (not res!466323) (not e!397510))))

(assert (=> b!702504 (= res!466323 (not (contains!3846 acc!652 k0!2824)))))

(declare-fun b!702505 () Bool)

(declare-fun res!466321 () Bool)

(assert (=> b!702505 (=> (not res!466321) (not e!397510))))

(declare-fun subseq!291 (List!13269 List!13269) Bool)

(assert (=> b!702505 (= res!466321 (subseq!291 acc!652 newAcc!49))))

(declare-fun b!702506 () Bool)

(declare-fun res!466307 () Bool)

(assert (=> b!702506 (=> (not res!466307) (not e!397508))))

(declare-fun arrayNoDuplicates!0 (array!40143 (_ BitVec 32) List!13269) Bool)

(assert (=> b!702506 (= res!466307 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317705))))

(declare-fun b!702507 () Bool)

(declare-fun res!466308 () Bool)

(assert (=> b!702507 (=> (not res!466308) (not e!397510))))

(assert (=> b!702507 (= res!466308 (noDuplicate!1093 acc!652))))

(declare-fun b!702508 () Bool)

(declare-fun res!466300 () Bool)

(assert (=> b!702508 (=> (not res!466300) (not e!397510))))

(assert (=> b!702508 (= res!466300 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702509 () Bool)

(declare-fun res!466326 () Bool)

(assert (=> b!702509 (=> (not res!466326) (not e!397508))))

(assert (=> b!702509 (= res!466326 (= (-!256 lt!317706 k0!2824) lt!317705))))

(declare-fun b!702510 () Bool)

(assert (=> b!702510 (= e!397508 (not true))))

(assert (=> b!702510 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317706)))

(declare-datatypes ((Unit!24590 0))(
  ( (Unit!24591) )
))
(declare-fun lt!317704 () Unit!24590)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40143 (_ BitVec 64) (_ BitVec 32) List!13269 List!13269) Unit!24590)

(assert (=> b!702510 (= lt!317704 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317705 lt!317706))))

(declare-fun b!702511 () Bool)

(declare-fun res!466315 () Bool)

(assert (=> b!702511 (=> (not res!466315) (not e!397508))))

(assert (=> b!702511 (= res!466315 (subseq!291 lt!317705 lt!317706))))

(declare-fun b!702512 () Bool)

(declare-fun res!466310 () Bool)

(assert (=> b!702512 (=> (not res!466310) (not e!397510))))

(assert (=> b!702512 (= res!466310 (contains!3846 newAcc!49 k0!2824))))

(declare-fun b!702513 () Bool)

(declare-fun res!466324 () Bool)

(assert (=> b!702513 (=> (not res!466324) (not e!397508))))

(assert (=> b!702513 (= res!466324 (not (contains!3846 lt!317705 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702514 () Bool)

(declare-fun res!466312 () Bool)

(assert (=> b!702514 (=> (not res!466312) (not e!397510))))

(assert (=> b!702514 (= res!466312 (noDuplicate!1093 newAcc!49))))

(declare-fun b!702515 () Bool)

(declare-fun res!466305 () Bool)

(assert (=> b!702515 (=> (not res!466305) (not e!397510))))

(assert (=> b!702515 (= res!466305 (not (contains!3846 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702516 () Bool)

(declare-fun res!466316 () Bool)

(assert (=> b!702516 (=> (not res!466316) (not e!397510))))

(assert (=> b!702516 (= res!466316 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19613 a!3591)))))

(assert (= (and start!62464 res!466298) b!702507))

(assert (= (and b!702507 res!466308) b!702514))

(assert (= (and b!702514 res!466312) b!702496))

(assert (= (and b!702496 res!466322) b!702500))

(assert (= (and b!702500 res!466309) b!702499))

(assert (= (and b!702499 res!466325) b!702504))

(assert (= (and b!702504 res!466323) b!702493))

(assert (= (and b!702493 res!466306) b!702508))

(assert (= (and b!702508 res!466300) b!702505))

(assert (= (and b!702505 res!466321) b!702512))

(assert (= (and b!702512 res!466310) b!702498))

(assert (= (and b!702498 res!466318) b!702501))

(assert (= (and b!702501 res!466302) b!702515))

(assert (= (and b!702515 res!466305) b!702516))

(assert (= (and b!702516 res!466316) b!702495))

(assert (= (and b!702495 res!466319) b!702490))

(assert (= (and b!702490 res!466314) b!702494))

(assert (= (and b!702494 res!466311) b!702492))

(assert (= (and b!702492 res!466304) b!702513))

(assert (= (and b!702513 res!466324) b!702489))

(assert (= (and b!702489 res!466299) b!702503))

(assert (= (and b!702503 res!466303) b!702491))

(assert (= (and b!702491 res!466301) b!702506))

(assert (= (and b!702506 res!466307) b!702511))

(assert (= (and b!702511 res!466315) b!702497))

(assert (= (and b!702497 res!466317) b!702509))

(assert (= (and b!702509 res!466326) b!702488))

(assert (= (and b!702488 res!466320) b!702502))

(assert (= (and b!702502 res!466313) b!702510))

(declare-fun m!661571 () Bool)

(assert (=> b!702514 m!661571))

(declare-fun m!661573 () Bool)

(assert (=> b!702495 m!661573))

(assert (=> b!702495 m!661573))

(declare-fun m!661575 () Bool)

(assert (=> b!702495 m!661575))

(declare-fun m!661577 () Bool)

(assert (=> b!702493 m!661577))

(declare-fun m!661579 () Bool)

(assert (=> b!702507 m!661579))

(declare-fun m!661581 () Bool)

(assert (=> b!702497 m!661581))

(declare-fun m!661583 () Bool)

(assert (=> b!702515 m!661583))

(declare-fun m!661585 () Bool)

(assert (=> b!702496 m!661585))

(declare-fun m!661587 () Bool)

(assert (=> b!702494 m!661587))

(declare-fun m!661589 () Bool)

(assert (=> b!702491 m!661589))

(declare-fun m!661591 () Bool)

(assert (=> b!702505 m!661591))

(declare-fun m!661593 () Bool)

(assert (=> b!702511 m!661593))

(declare-fun m!661595 () Bool)

(assert (=> b!702501 m!661595))

(declare-fun m!661597 () Bool)

(assert (=> b!702513 m!661597))

(declare-fun m!661599 () Bool)

(assert (=> start!62464 m!661599))

(declare-fun m!661601 () Bool)

(assert (=> b!702510 m!661601))

(declare-fun m!661603 () Bool)

(assert (=> b!702510 m!661603))

(declare-fun m!661605 () Bool)

(assert (=> b!702492 m!661605))

(declare-fun m!661607 () Bool)

(assert (=> b!702489 m!661607))

(declare-fun m!661609 () Bool)

(assert (=> b!702509 m!661609))

(declare-fun m!661611 () Bool)

(assert (=> b!702512 m!661611))

(declare-fun m!661613 () Bool)

(assert (=> b!702502 m!661613))

(declare-fun m!661615 () Bool)

(assert (=> b!702504 m!661615))

(declare-fun m!661617 () Bool)

(assert (=> b!702506 m!661617))

(declare-fun m!661619 () Bool)

(assert (=> b!702488 m!661619))

(declare-fun m!661621 () Bool)

(assert (=> b!702498 m!661621))

(declare-fun m!661623 () Bool)

(assert (=> b!702508 m!661623))

(declare-fun m!661625 () Bool)

(assert (=> b!702499 m!661625))

(declare-fun m!661627 () Bool)

(assert (=> b!702503 m!661627))

(declare-fun m!661629 () Bool)

(assert (=> b!702500 m!661629))

(assert (=> b!702490 m!661573))

(assert (=> b!702490 m!661573))

(declare-fun m!661631 () Bool)

(assert (=> b!702490 m!661631))

(assert (=> b!702490 m!661573))

(declare-fun m!661633 () Bool)

(assert (=> b!702490 m!661633))

(check-sat (not b!702492) (not b!702499) (not b!702494) (not b!702493) (not b!702505) (not b!702491) (not b!702508) (not b!702489) (not b!702503) (not b!702513) (not b!702512) (not b!702501) (not b!702515) (not b!702507) (not b!702500) (not b!702498) (not b!702510) (not start!62464) (not b!702490) (not b!702514) (not b!702511) (not b!702506) (not b!702504) (not b!702488) (not b!702497) (not b!702495) (not b!702496) (not b!702509) (not b!702502))
(check-sat)
