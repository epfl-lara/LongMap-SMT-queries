; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63256 () Bool)

(assert start!63256)

(declare-fun b!712144 () Bool)

(declare-fun res!475497 () Bool)

(declare-fun e!400681 () Bool)

(assert (=> b!712144 (=> (not res!475497) (not e!400681))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40428 0))(
  ( (array!40429 (arr!19355 (Array (_ BitVec 32) (_ BitVec 64))) (size!19764 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40428)

(assert (=> b!712144 (= res!475497 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19764 a!3591)))))

(declare-fun b!712145 () Bool)

(declare-fun res!475482 () Bool)

(assert (=> b!712145 (=> (not res!475482) (not e!400681))))

(declare-datatypes ((List!13435 0))(
  ( (Nil!13432) (Cons!13431 (h!14476 (_ BitVec 64)) (t!19738 List!13435)) )
))
(declare-fun acc!652 () List!13435)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3957 (List!13435 (_ BitVec 64)) Bool)

(assert (=> b!712145 (= res!475482 (not (contains!3957 acc!652 k0!2824)))))

(declare-fun b!712146 () Bool)

(declare-fun res!475484 () Bool)

(declare-fun e!400679 () Bool)

(assert (=> b!712146 (=> (not res!475484) (not e!400679))))

(declare-fun lt!318329 () List!13435)

(declare-fun noDuplicate!1226 (List!13435) Bool)

(assert (=> b!712146 (= res!475484 (noDuplicate!1226 lt!318329))))

(declare-fun b!712147 () Bool)

(declare-fun res!475489 () Bool)

(assert (=> b!712147 (=> (not res!475489) (not e!400679))))

(declare-fun lt!318328 () List!13435)

(declare-fun subseq!419 (List!13435 List!13435) Bool)

(assert (=> b!712147 (= res!475489 (subseq!419 lt!318328 lt!318329))))

(declare-fun b!712148 () Bool)

(declare-fun res!475478 () Bool)

(assert (=> b!712148 (=> (not res!475478) (not e!400681))))

(declare-fun arrayNoDuplicates!0 (array!40428 (_ BitVec 32) List!13435) Bool)

(assert (=> b!712148 (= res!475478 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712149 () Bool)

(declare-fun res!475498 () Bool)

(assert (=> b!712149 (=> (not res!475498) (not e!400681))))

(assert (=> b!712149 (= res!475498 (not (contains!3957 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712150 () Bool)

(declare-fun res!475487 () Bool)

(assert (=> b!712150 (=> (not res!475487) (not e!400679))))

(declare-fun arrayContainsKey!0 (array!40428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712150 (= res!475487 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712151 () Bool)

(declare-fun res!475488 () Bool)

(assert (=> b!712151 (=> (not res!475488) (not e!400681))))

(declare-fun newAcc!49 () List!13435)

(declare-fun -!384 (List!13435 (_ BitVec 64)) List!13435)

(assert (=> b!712151 (= res!475488 (= (-!384 newAcc!49 k0!2824) acc!652))))

(declare-fun res!475483 () Bool)

(assert (=> start!63256 (=> (not res!475483) (not e!400681))))

(assert (=> start!63256 (= res!475483 (and (bvslt (size!19764 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19764 a!3591))))))

(assert (=> start!63256 e!400681))

(assert (=> start!63256 true))

(declare-fun array_inv!15238 (array!40428) Bool)

(assert (=> start!63256 (array_inv!15238 a!3591)))

(declare-fun b!712152 () Bool)

(declare-fun res!475492 () Bool)

(assert (=> b!712152 (=> (not res!475492) (not e!400681))))

(assert (=> b!712152 (= res!475492 (not (contains!3957 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712153 () Bool)

(declare-fun res!475490 () Bool)

(assert (=> b!712153 (=> (not res!475490) (not e!400681))))

(assert (=> b!712153 (= res!475490 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!712154 () Bool)

(declare-fun res!475500 () Bool)

(assert (=> b!712154 (=> (not res!475500) (not e!400679))))

(assert (=> b!712154 (= res!475500 (not (contains!3957 lt!318329 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712155 () Bool)

(declare-fun res!475499 () Bool)

(assert (=> b!712155 (=> (not res!475499) (not e!400679))))

(assert (=> b!712155 (= res!475499 (not (contains!3957 lt!318329 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712156 () Bool)

(declare-fun res!475506 () Bool)

(assert (=> b!712156 (=> (not res!475506) (not e!400681))))

(assert (=> b!712156 (= res!475506 (subseq!419 acc!652 newAcc!49))))

(declare-fun b!712157 () Bool)

(declare-fun res!475495 () Bool)

(assert (=> b!712157 (=> (not res!475495) (not e!400679))))

(assert (=> b!712157 (= res!475495 (not (contains!3957 lt!318328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712158 () Bool)

(declare-fun res!475502 () Bool)

(assert (=> b!712158 (=> (not res!475502) (not e!400681))))

(assert (=> b!712158 (= res!475502 (not (contains!3957 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712159 () Bool)

(declare-fun res!475481 () Bool)

(assert (=> b!712159 (=> (not res!475481) (not e!400679))))

(assert (=> b!712159 (= res!475481 (= (-!384 lt!318329 k0!2824) lt!318328))))

(declare-fun b!712160 () Bool)

(declare-fun res!475496 () Bool)

(assert (=> b!712160 (=> (not res!475496) (not e!400681))))

(assert (=> b!712160 (= res!475496 (noDuplicate!1226 newAcc!49))))

(declare-fun b!712161 () Bool)

(declare-fun res!475501 () Bool)

(assert (=> b!712161 (=> (not res!475501) (not e!400679))))

(assert (=> b!712161 (= res!475501 (not (contains!3957 lt!318328 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712162 () Bool)

(assert (=> b!712162 (= e!400679 (bvsge (bvsub (size!19764 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) (bvsub (size!19764 a!3591) from!2969)))))

(declare-fun b!712163 () Bool)

(assert (=> b!712163 (= e!400681 e!400679)))

(declare-fun res!475491 () Bool)

(assert (=> b!712163 (=> (not res!475491) (not e!400679))))

(assert (=> b!712163 (= res!475491 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!529 (List!13435 (_ BitVec 64)) List!13435)

(assert (=> b!712163 (= lt!318329 ($colon$colon!529 newAcc!49 (select (arr!19355 a!3591) from!2969)))))

(assert (=> b!712163 (= lt!318328 ($colon$colon!529 acc!652 (select (arr!19355 a!3591) from!2969)))))

(declare-fun b!712164 () Bool)

(declare-fun res!475505 () Bool)

(assert (=> b!712164 (=> (not res!475505) (not e!400681))))

(assert (=> b!712164 (= res!475505 (contains!3957 newAcc!49 k0!2824))))

(declare-fun b!712165 () Bool)

(declare-fun res!475480 () Bool)

(assert (=> b!712165 (=> (not res!475480) (not e!400681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712165 (= res!475480 (validKeyInArray!0 k0!2824))))

(declare-fun b!712166 () Bool)

(declare-fun res!475479 () Bool)

(assert (=> b!712166 (=> (not res!475479) (not e!400679))))

(assert (=> b!712166 (= res!475479 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318328))))

(declare-fun b!712167 () Bool)

(declare-fun res!475485 () Bool)

(assert (=> b!712167 (=> (not res!475485) (not e!400681))))

(assert (=> b!712167 (= res!475485 (validKeyInArray!0 (select (arr!19355 a!3591) from!2969)))))

(declare-fun b!712168 () Bool)

(declare-fun res!475504 () Bool)

(assert (=> b!712168 (=> (not res!475504) (not e!400681))))

(assert (=> b!712168 (= res!475504 (not (contains!3957 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712169 () Bool)

(declare-fun res!475503 () Bool)

(assert (=> b!712169 (=> (not res!475503) (not e!400679))))

(assert (=> b!712169 (= res!475503 (contains!3957 lt!318329 k0!2824))))

(declare-fun b!712170 () Bool)

(declare-fun res!475494 () Bool)

(assert (=> b!712170 (=> (not res!475494) (not e!400679))))

(assert (=> b!712170 (= res!475494 (noDuplicate!1226 lt!318328))))

(declare-fun b!712171 () Bool)

(declare-fun res!475493 () Bool)

(assert (=> b!712171 (=> (not res!475493) (not e!400681))))

(assert (=> b!712171 (= res!475493 (noDuplicate!1226 acc!652))))

(declare-fun b!712172 () Bool)

(declare-fun res!475486 () Bool)

(assert (=> b!712172 (=> (not res!475486) (not e!400679))))

(assert (=> b!712172 (= res!475486 (not (contains!3957 lt!318328 k0!2824)))))

(assert (= (and start!63256 res!475483) b!712171))

(assert (= (and b!712171 res!475493) b!712160))

(assert (= (and b!712160 res!475496) b!712149))

(assert (= (and b!712149 res!475498) b!712168))

(assert (= (and b!712168 res!475504) b!712153))

(assert (= (and b!712153 res!475490) b!712145))

(assert (= (and b!712145 res!475482) b!712165))

(assert (= (and b!712165 res!475480) b!712148))

(assert (= (and b!712148 res!475478) b!712156))

(assert (= (and b!712156 res!475506) b!712164))

(assert (= (and b!712164 res!475505) b!712151))

(assert (= (and b!712151 res!475488) b!712158))

(assert (= (and b!712158 res!475502) b!712152))

(assert (= (and b!712152 res!475492) b!712144))

(assert (= (and b!712144 res!475497) b!712167))

(assert (= (and b!712167 res!475485) b!712163))

(assert (= (and b!712163 res!475491) b!712170))

(assert (= (and b!712170 res!475494) b!712146))

(assert (= (and b!712146 res!475484) b!712157))

(assert (= (and b!712157 res!475495) b!712161))

(assert (= (and b!712161 res!475501) b!712150))

(assert (= (and b!712150 res!475487) b!712172))

(assert (= (and b!712172 res!475486) b!712166))

(assert (= (and b!712166 res!475479) b!712147))

(assert (= (and b!712147 res!475489) b!712169))

(assert (= (and b!712169 res!475503) b!712159))

(assert (= (and b!712159 res!475481) b!712155))

(assert (= (and b!712155 res!475499) b!712154))

(assert (= (and b!712154 res!475500) b!712162))

(declare-fun m!668595 () Bool)

(assert (=> b!712160 m!668595))

(declare-fun m!668597 () Bool)

(assert (=> b!712159 m!668597))

(declare-fun m!668599 () Bool)

(assert (=> b!712150 m!668599))

(declare-fun m!668601 () Bool)

(assert (=> b!712155 m!668601))

(declare-fun m!668603 () Bool)

(assert (=> b!712149 m!668603))

(declare-fun m!668605 () Bool)

(assert (=> b!712168 m!668605))

(declare-fun m!668607 () Bool)

(assert (=> b!712161 m!668607))

(declare-fun m!668609 () Bool)

(assert (=> b!712147 m!668609))

(declare-fun m!668611 () Bool)

(assert (=> b!712166 m!668611))

(declare-fun m!668613 () Bool)

(assert (=> b!712148 m!668613))

(declare-fun m!668615 () Bool)

(assert (=> b!712145 m!668615))

(declare-fun m!668617 () Bool)

(assert (=> b!712153 m!668617))

(declare-fun m!668619 () Bool)

(assert (=> b!712164 m!668619))

(declare-fun m!668621 () Bool)

(assert (=> b!712163 m!668621))

(assert (=> b!712163 m!668621))

(declare-fun m!668623 () Bool)

(assert (=> b!712163 m!668623))

(assert (=> b!712163 m!668621))

(declare-fun m!668625 () Bool)

(assert (=> b!712163 m!668625))

(declare-fun m!668627 () Bool)

(assert (=> b!712170 m!668627))

(declare-fun m!668629 () Bool)

(assert (=> b!712172 m!668629))

(declare-fun m!668631 () Bool)

(assert (=> start!63256 m!668631))

(declare-fun m!668633 () Bool)

(assert (=> b!712154 m!668633))

(declare-fun m!668635 () Bool)

(assert (=> b!712156 m!668635))

(declare-fun m!668637 () Bool)

(assert (=> b!712171 m!668637))

(declare-fun m!668639 () Bool)

(assert (=> b!712169 m!668639))

(declare-fun m!668641 () Bool)

(assert (=> b!712157 m!668641))

(declare-fun m!668643 () Bool)

(assert (=> b!712158 m!668643))

(declare-fun m!668645 () Bool)

(assert (=> b!712146 m!668645))

(declare-fun m!668647 () Bool)

(assert (=> b!712165 m!668647))

(declare-fun m!668649 () Bool)

(assert (=> b!712152 m!668649))

(declare-fun m!668651 () Bool)

(assert (=> b!712151 m!668651))

(assert (=> b!712167 m!668621))

(assert (=> b!712167 m!668621))

(declare-fun m!668653 () Bool)

(assert (=> b!712167 m!668653))

(check-sat (not start!63256) (not b!712161) (not b!712149) (not b!712170) (not b!712153) (not b!712171) (not b!712154) (not b!712159) (not b!712152) (not b!712172) (not b!712156) (not b!712164) (not b!712147) (not b!712168) (not b!712148) (not b!712169) (not b!712157) (not b!712146) (not b!712167) (not b!712158) (not b!712145) (not b!712166) (not b!712165) (not b!712160) (not b!712151) (not b!712163) (not b!712150) (not b!712155))
(check-sat)
