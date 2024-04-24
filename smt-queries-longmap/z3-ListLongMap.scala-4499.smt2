; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62518 () Bool)

(assert start!62518)

(declare-fun b!702594 () Bool)

(declare-fun res!466312 () Bool)

(declare-fun e!397615 () Bool)

(assert (=> b!702594 (=> (not res!466312) (not e!397615))))

(declare-datatypes ((List!13170 0))(
  ( (Nil!13167) (Cons!13166 (h!14214 (_ BitVec 64)) (t!19444 List!13170)) )
))
(declare-fun newAcc!49 () List!13170)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3822 (List!13170 (_ BitVec 64)) Bool)

(assert (=> b!702594 (= res!466312 (contains!3822 newAcc!49 k0!2824))))

(declare-fun b!702595 () Bool)

(declare-fun res!466322 () Bool)

(declare-fun e!397617 () Bool)

(assert (=> b!702595 (=> (not res!466322) (not e!397617))))

(declare-datatypes ((array!40137 0))(
  ( (array!40138 (arr!19222 (Array (_ BitVec 32) (_ BitVec 64))) (size!19605 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40137)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun lt!317794 () List!13170)

(declare-fun arrayNoDuplicates!0 (array!40137 (_ BitVec 32) List!13170) Bool)

(assert (=> b!702595 (= res!466322 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317794))))

(declare-fun b!702596 () Bool)

(declare-fun res!466332 () Bool)

(assert (=> b!702596 (=> (not res!466332) (not e!397617))))

(declare-fun noDuplicate!1096 (List!13170) Bool)

(assert (=> b!702596 (= res!466332 (noDuplicate!1096 lt!317794))))

(declare-fun b!702597 () Bool)

(declare-fun res!466323 () Bool)

(assert (=> b!702597 (=> (not res!466323) (not e!397615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702597 (= res!466323 (validKeyInArray!0 k0!2824))))

(declare-fun b!702599 () Bool)

(declare-fun res!466325 () Bool)

(assert (=> b!702599 (=> (not res!466325) (not e!397617))))

(declare-fun lt!317795 () List!13170)

(assert (=> b!702599 (= res!466325 (not (contains!3822 lt!317795 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702600 () Bool)

(declare-fun res!466333 () Bool)

(assert (=> b!702600 (=> (not res!466333) (not e!397617))))

(declare-fun -!254 (List!13170 (_ BitVec 64)) List!13170)

(assert (=> b!702600 (= res!466333 (= (-!254 lt!317795 k0!2824) lt!317794))))

(declare-fun b!702601 () Bool)

(declare-fun res!466330 () Bool)

(assert (=> b!702601 (=> (not res!466330) (not e!397617))))

(assert (=> b!702601 (= res!466330 (not (contains!3822 lt!317794 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702602 () Bool)

(declare-fun res!466324 () Bool)

(assert (=> b!702602 (=> (not res!466324) (not e!397615))))

(assert (=> b!702602 (= res!466324 (not (contains!3822 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702603 () Bool)

(declare-fun res!466318 () Bool)

(assert (=> b!702603 (=> (not res!466318) (not e!397615))))

(assert (=> b!702603 (= res!466318 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19605 a!3591)))))

(declare-fun b!702604 () Bool)

(declare-fun res!466313 () Bool)

(assert (=> b!702604 (=> (not res!466313) (not e!397615))))

(assert (=> b!702604 (= res!466313 (noDuplicate!1096 newAcc!49))))

(declare-fun b!702605 () Bool)

(declare-fun res!466317 () Bool)

(assert (=> b!702605 (=> (not res!466317) (not e!397615))))

(declare-fun acc!652 () List!13170)

(assert (=> b!702605 (= res!466317 (not (contains!3822 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702606 () Bool)

(assert (=> b!702606 (= e!397615 e!397617)))

(declare-fun res!466321 () Bool)

(assert (=> b!702606 (=> (not res!466321) (not e!397617))))

(assert (=> b!702606 (= res!466321 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!485 (List!13170 (_ BitVec 64)) List!13170)

(assert (=> b!702606 (= lt!317795 ($colon$colon!485 newAcc!49 (select (arr!19222 a!3591) from!2969)))))

(assert (=> b!702606 (= lt!317794 ($colon$colon!485 acc!652 (select (arr!19222 a!3591) from!2969)))))

(declare-fun b!702607 () Bool)

(declare-fun res!466305 () Bool)

(assert (=> b!702607 (=> (not res!466305) (not e!397617))))

(assert (=> b!702607 (= res!466305 (not (contains!3822 lt!317795 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702608 () Bool)

(declare-fun res!466329 () Bool)

(assert (=> b!702608 (=> (not res!466329) (not e!397615))))

(assert (=> b!702608 (= res!466329 (not (contains!3822 acc!652 k0!2824)))))

(declare-fun b!702609 () Bool)

(declare-fun res!466306 () Bool)

(assert (=> b!702609 (=> (not res!466306) (not e!397615))))

(assert (=> b!702609 (= res!466306 (validKeyInArray!0 (select (arr!19222 a!3591) from!2969)))))

(declare-fun b!702610 () Bool)

(declare-fun res!466310 () Bool)

(assert (=> b!702610 (=> (not res!466310) (not e!397615))))

(assert (=> b!702610 (= res!466310 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702611 () Bool)

(assert (=> b!702611 (= e!397617 (not true))))

(assert (=> b!702611 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317795)))

(declare-datatypes ((Unit!24567 0))(
  ( (Unit!24568) )
))
(declare-fun lt!317796 () Unit!24567)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40137 (_ BitVec 64) (_ BitVec 32) List!13170 List!13170) Unit!24567)

(assert (=> b!702611 (= lt!317796 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317794 lt!317795))))

(declare-fun b!702612 () Bool)

(declare-fun res!466307 () Bool)

(assert (=> b!702612 (=> (not res!466307) (not e!397617))))

(declare-fun subseq!290 (List!13170 List!13170) Bool)

(assert (=> b!702612 (= res!466307 (subseq!290 lt!317794 lt!317795))))

(declare-fun res!466319 () Bool)

(assert (=> start!62518 (=> (not res!466319) (not e!397615))))

(assert (=> start!62518 (= res!466319 (and (bvslt (size!19605 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19605 a!3591))))))

(assert (=> start!62518 e!397615))

(assert (=> start!62518 true))

(declare-fun array_inv!15081 (array!40137) Bool)

(assert (=> start!62518 (array_inv!15081 a!3591)))

(declare-fun b!702598 () Bool)

(declare-fun res!466331 () Bool)

(assert (=> b!702598 (=> (not res!466331) (not e!397617))))

(declare-fun arrayContainsKey!0 (array!40137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702598 (= res!466331 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702613 () Bool)

(declare-fun res!466315 () Bool)

(assert (=> b!702613 (=> (not res!466315) (not e!397617))))

(assert (=> b!702613 (= res!466315 (noDuplicate!1096 lt!317795))))

(declare-fun b!702614 () Bool)

(declare-fun res!466311 () Bool)

(assert (=> b!702614 (=> (not res!466311) (not e!397615))))

(assert (=> b!702614 (= res!466311 (noDuplicate!1096 acc!652))))

(declare-fun b!702615 () Bool)

(declare-fun res!466328 () Bool)

(assert (=> b!702615 (=> (not res!466328) (not e!397615))))

(assert (=> b!702615 (= res!466328 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702616 () Bool)

(declare-fun res!466316 () Bool)

(assert (=> b!702616 (=> (not res!466316) (not e!397617))))

(assert (=> b!702616 (= res!466316 (contains!3822 lt!317795 k0!2824))))

(declare-fun b!702617 () Bool)

(declare-fun res!466314 () Bool)

(assert (=> b!702617 (=> (not res!466314) (not e!397617))))

(assert (=> b!702617 (= res!466314 (not (contains!3822 lt!317794 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702618 () Bool)

(declare-fun res!466327 () Bool)

(assert (=> b!702618 (=> (not res!466327) (not e!397615))))

(assert (=> b!702618 (= res!466327 (not (contains!3822 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702619 () Bool)

(declare-fun res!466309 () Bool)

(assert (=> b!702619 (=> (not res!466309) (not e!397617))))

(assert (=> b!702619 (= res!466309 (not (contains!3822 lt!317794 k0!2824)))))

(declare-fun b!702620 () Bool)

(declare-fun res!466326 () Bool)

(assert (=> b!702620 (=> (not res!466326) (not e!397615))))

(assert (=> b!702620 (= res!466326 (not (contains!3822 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702621 () Bool)

(declare-fun res!466320 () Bool)

(assert (=> b!702621 (=> (not res!466320) (not e!397615))))

(assert (=> b!702621 (= res!466320 (subseq!290 acc!652 newAcc!49))))

(declare-fun b!702622 () Bool)

(declare-fun res!466308 () Bool)

(assert (=> b!702622 (=> (not res!466308) (not e!397615))))

(assert (=> b!702622 (= res!466308 (= (-!254 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!62518 res!466319) b!702614))

(assert (= (and b!702614 res!466311) b!702604))

(assert (= (and b!702604 res!466313) b!702605))

(assert (= (and b!702605 res!466317) b!702620))

(assert (= (and b!702620 res!466326) b!702615))

(assert (= (and b!702615 res!466328) b!702608))

(assert (= (and b!702608 res!466329) b!702597))

(assert (= (and b!702597 res!466323) b!702610))

(assert (= (and b!702610 res!466310) b!702621))

(assert (= (and b!702621 res!466320) b!702594))

(assert (= (and b!702594 res!466312) b!702622))

(assert (= (and b!702622 res!466308) b!702602))

(assert (= (and b!702602 res!466324) b!702618))

(assert (= (and b!702618 res!466327) b!702603))

(assert (= (and b!702603 res!466318) b!702609))

(assert (= (and b!702609 res!466306) b!702606))

(assert (= (and b!702606 res!466321) b!702596))

(assert (= (and b!702596 res!466332) b!702613))

(assert (= (and b!702613 res!466315) b!702617))

(assert (= (and b!702617 res!466314) b!702601))

(assert (= (and b!702601 res!466330) b!702598))

(assert (= (and b!702598 res!466331) b!702619))

(assert (= (and b!702619 res!466309) b!702595))

(assert (= (and b!702595 res!466322) b!702612))

(assert (= (and b!702612 res!466307) b!702616))

(assert (= (and b!702616 res!466316) b!702600))

(assert (= (and b!702600 res!466333) b!702607))

(assert (= (and b!702607 res!466305) b!702599))

(assert (= (and b!702599 res!466325) b!702611))

(declare-fun m!662163 () Bool)

(assert (=> b!702620 m!662163))

(declare-fun m!662165 () Bool)

(assert (=> b!702606 m!662165))

(assert (=> b!702606 m!662165))

(declare-fun m!662167 () Bool)

(assert (=> b!702606 m!662167))

(assert (=> b!702606 m!662165))

(declare-fun m!662169 () Bool)

(assert (=> b!702606 m!662169))

(declare-fun m!662171 () Bool)

(assert (=> b!702604 m!662171))

(declare-fun m!662173 () Bool)

(assert (=> b!702599 m!662173))

(declare-fun m!662175 () Bool)

(assert (=> b!702621 m!662175))

(declare-fun m!662177 () Bool)

(assert (=> b!702607 m!662177))

(declare-fun m!662179 () Bool)

(assert (=> b!702615 m!662179))

(declare-fun m!662181 () Bool)

(assert (=> b!702619 m!662181))

(declare-fun m!662183 () Bool)

(assert (=> b!702608 m!662183))

(declare-fun m!662185 () Bool)

(assert (=> b!702616 m!662185))

(declare-fun m!662187 () Bool)

(assert (=> b!702601 m!662187))

(declare-fun m!662189 () Bool)

(assert (=> b!702594 m!662189))

(declare-fun m!662191 () Bool)

(assert (=> b!702595 m!662191))

(assert (=> b!702609 m!662165))

(assert (=> b!702609 m!662165))

(declare-fun m!662193 () Bool)

(assert (=> b!702609 m!662193))

(declare-fun m!662195 () Bool)

(assert (=> start!62518 m!662195))

(declare-fun m!662197 () Bool)

(assert (=> b!702618 m!662197))

(declare-fun m!662199 () Bool)

(assert (=> b!702613 m!662199))

(declare-fun m!662201 () Bool)

(assert (=> b!702617 m!662201))

(declare-fun m!662203 () Bool)

(assert (=> b!702605 m!662203))

(declare-fun m!662205 () Bool)

(assert (=> b!702612 m!662205))

(declare-fun m!662207 () Bool)

(assert (=> b!702622 m!662207))

(declare-fun m!662209 () Bool)

(assert (=> b!702600 m!662209))

(declare-fun m!662211 () Bool)

(assert (=> b!702610 m!662211))

(declare-fun m!662213 () Bool)

(assert (=> b!702614 m!662213))

(declare-fun m!662215 () Bool)

(assert (=> b!702598 m!662215))

(declare-fun m!662217 () Bool)

(assert (=> b!702596 m!662217))

(declare-fun m!662219 () Bool)

(assert (=> b!702611 m!662219))

(declare-fun m!662221 () Bool)

(assert (=> b!702611 m!662221))

(declare-fun m!662223 () Bool)

(assert (=> b!702597 m!662223))

(declare-fun m!662225 () Bool)

(assert (=> b!702602 m!662225))

(check-sat (not b!702605) (not b!702594) (not b!702595) (not b!702608) (not b!702607) (not b!702600) (not b!702615) (not b!702611) (not b!702622) (not b!702601) (not b!702610) (not b!702609) (not b!702597) (not b!702598) (not b!702612) (not b!702596) (not b!702604) (not start!62518) (not b!702621) (not b!702617) (not b!702614) (not b!702616) (not b!702613) (not b!702619) (not b!702618) (not b!702606) (not b!702602) (not b!702599) (not b!702620))
(check-sat)
