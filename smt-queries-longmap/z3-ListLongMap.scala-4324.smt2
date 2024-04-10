; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59974 () Bool)

(assert start!59974)

(declare-fun b!665603 () Bool)

(declare-datatypes ((Unit!23240 0))(
  ( (Unit!23241) )
))
(declare-fun e!381416 () Unit!23240)

(declare-fun Unit!23242 () Unit!23240)

(assert (=> b!665603 (= e!381416 Unit!23242)))

(declare-fun lt!310091 () Unit!23240)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39021 0))(
  ( (array!39022 (arr!18703 (Array (_ BitVec 32) (_ BitVec 64))) (size!19067 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39021 (_ BitVec 64) (_ BitVec 32)) Unit!23240)

(assert (=> b!665603 (= lt!310091 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665603 false))

(declare-fun b!665604 () Bool)

(declare-fun e!381417 () Bool)

(assert (=> b!665604 (= e!381417 true)))

(declare-fun lt!310090 () Bool)

(declare-datatypes ((List!12744 0))(
  ( (Nil!12741) (Cons!12740 (h!13785 (_ BitVec 64)) (t!18972 List!12744)) )
))
(declare-fun lt!310089 () List!12744)

(declare-fun contains!3321 (List!12744 (_ BitVec 64)) Bool)

(assert (=> b!665604 (= lt!310090 (contains!3321 lt!310089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665605 () Bool)

(declare-fun res!433108 () Bool)

(declare-fun e!381412 () Bool)

(assert (=> b!665605 (=> (not res!433108) (not e!381412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665605 (= res!433108 (validKeyInArray!0 k0!2843))))

(declare-fun b!665606 () Bool)

(declare-fun res!433109 () Bool)

(assert (=> b!665606 (=> (not res!433109) (not e!381412))))

(declare-fun acc!681 () List!12744)

(assert (=> b!665606 (= res!433109 (not (contains!3321 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665607 () Bool)

(declare-fun res!433110 () Bool)

(assert (=> b!665607 (=> res!433110 e!381417)))

(assert (=> b!665607 (= res!433110 (contains!3321 acc!681 k0!2843))))

(declare-fun b!665608 () Bool)

(declare-fun Unit!23243 () Unit!23240)

(assert (=> b!665608 (= e!381416 Unit!23243)))

(declare-fun b!665609 () Bool)

(declare-fun res!433116 () Bool)

(assert (=> b!665609 (=> (not res!433116) (not e!381412))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665609 (= res!433116 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19067 a!3626))))))

(declare-fun b!665610 () Bool)

(declare-fun e!381415 () Bool)

(assert (=> b!665610 (= e!381415 (not (contains!3321 acc!681 k0!2843)))))

(declare-fun b!665611 () Bool)

(declare-fun e!381410 () Unit!23240)

(declare-fun Unit!23244 () Unit!23240)

(assert (=> b!665611 (= e!381410 Unit!23244)))

(declare-fun b!665613 () Bool)

(declare-fun res!433125 () Bool)

(assert (=> b!665613 (=> (not res!433125) (not e!381412))))

(declare-fun arrayContainsKey!0 (array!39021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665613 (= res!433125 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665614 () Bool)

(declare-fun lt!310087 () Unit!23240)

(assert (=> b!665614 (= e!381410 lt!310087)))

(declare-fun lt!310088 () Unit!23240)

(declare-fun lemmaListSubSeqRefl!0 (List!12744) Unit!23240)

(assert (=> b!665614 (= lt!310088 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!60 (List!12744 List!12744) Bool)

(assert (=> b!665614 (subseq!60 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39021 List!12744 List!12744 (_ BitVec 32)) Unit!23240)

(declare-fun $colon$colon!192 (List!12744 (_ BitVec 64)) List!12744)

(assert (=> b!665614 (= lt!310087 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!192 acc!681 (select (arr!18703 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39021 (_ BitVec 32) List!12744) Bool)

(assert (=> b!665614 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665615 () Bool)

(declare-fun res!433115 () Bool)

(assert (=> b!665615 (=> (not res!433115) (not e!381412))))

(assert (=> b!665615 (= res!433115 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12741))))

(declare-fun b!665616 () Bool)

(declare-fun res!433120 () Bool)

(assert (=> b!665616 (=> res!433120 e!381417)))

(assert (=> b!665616 (= res!433120 (not (subseq!60 acc!681 lt!310089)))))

(declare-fun b!665617 () Bool)

(declare-fun res!433112 () Bool)

(assert (=> b!665617 (=> res!433112 e!381417)))

(declare-fun lt!310086 () Bool)

(assert (=> b!665617 (= res!433112 lt!310086)))

(declare-fun b!665618 () Bool)

(declare-fun res!433122 () Bool)

(assert (=> b!665618 (=> (not res!433122) (not e!381412))))

(assert (=> b!665618 (= res!433122 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665619 () Bool)

(declare-fun e!381414 () Bool)

(assert (=> b!665619 (= e!381414 e!381415)))

(declare-fun res!433124 () Bool)

(assert (=> b!665619 (=> (not res!433124) (not e!381415))))

(assert (=> b!665619 (= res!433124 (bvsle from!3004 i!1382))))

(declare-fun b!665620 () Bool)

(declare-fun res!433113 () Bool)

(assert (=> b!665620 (=> (not res!433113) (not e!381412))))

(assert (=> b!665620 (= res!433113 (not (contains!3321 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665621 () Bool)

(declare-fun res!433107 () Bool)

(assert (=> b!665621 (=> (not res!433107) (not e!381412))))

(assert (=> b!665621 (= res!433107 e!381414)))

(declare-fun res!433114 () Bool)

(assert (=> b!665621 (=> res!433114 e!381414)))

(declare-fun e!381411 () Bool)

(assert (=> b!665621 (= res!433114 e!381411)))

(declare-fun res!433119 () Bool)

(assert (=> b!665621 (=> (not res!433119) (not e!381411))))

(assert (=> b!665621 (= res!433119 (bvsgt from!3004 i!1382))))

(declare-fun b!665622 () Bool)

(declare-fun res!433121 () Bool)

(assert (=> b!665622 (=> (not res!433121) (not e!381412))))

(declare-fun noDuplicate!568 (List!12744) Bool)

(assert (=> b!665622 (= res!433121 (noDuplicate!568 acc!681))))

(declare-fun b!665623 () Bool)

(declare-fun res!433118 () Bool)

(assert (=> b!665623 (=> res!433118 e!381417)))

(assert (=> b!665623 (= res!433118 (not (noDuplicate!568 lt!310089)))))

(declare-fun res!433127 () Bool)

(assert (=> start!59974 (=> (not res!433127) (not e!381412))))

(assert (=> start!59974 (= res!433127 (and (bvslt (size!19067 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19067 a!3626))))))

(assert (=> start!59974 e!381412))

(assert (=> start!59974 true))

(declare-fun array_inv!14499 (array!39021) Bool)

(assert (=> start!59974 (array_inv!14499 a!3626)))

(declare-fun b!665612 () Bool)

(assert (=> b!665612 (= e!381411 (contains!3321 acc!681 k0!2843))))

(declare-fun b!665624 () Bool)

(declare-fun res!433111 () Bool)

(assert (=> b!665624 (=> res!433111 e!381417)))

(assert (=> b!665624 (= res!433111 (contains!3321 lt!310089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665625 () Bool)

(declare-fun res!433117 () Bool)

(assert (=> b!665625 (=> res!433117 e!381417)))

(assert (=> b!665625 (= res!433117 (not (contains!3321 lt!310089 k0!2843)))))

(declare-fun b!665626 () Bool)

(assert (=> b!665626 (= e!381412 (not e!381417))))

(declare-fun res!433126 () Bool)

(assert (=> b!665626 (=> res!433126 e!381417)))

(assert (=> b!665626 (= res!433126 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!58 (List!12744 (_ BitVec 64)) List!12744)

(assert (=> b!665626 (= (-!58 lt!310089 k0!2843) acc!681)))

(assert (=> b!665626 (= lt!310089 ($colon$colon!192 acc!681 k0!2843))))

(declare-fun lt!310092 () Unit!23240)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12744) Unit!23240)

(assert (=> b!665626 (= lt!310092 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665626 (subseq!60 acc!681 acc!681)))

(declare-fun lt!310093 () Unit!23240)

(assert (=> b!665626 (= lt!310093 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665626 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310084 () Unit!23240)

(assert (=> b!665626 (= lt!310084 e!381410)))

(declare-fun c!76616 () Bool)

(assert (=> b!665626 (= c!76616 (validKeyInArray!0 (select (arr!18703 a!3626) from!3004)))))

(declare-fun lt!310085 () Unit!23240)

(assert (=> b!665626 (= lt!310085 e!381416)))

(declare-fun c!76615 () Bool)

(assert (=> b!665626 (= c!76615 lt!310086)))

(assert (=> b!665626 (= lt!310086 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665626 (arrayContainsKey!0 (array!39022 (store (arr!18703 a!3626) i!1382 k0!2843) (size!19067 a!3626)) k0!2843 from!3004)))

(declare-fun b!665627 () Bool)

(declare-fun res!433123 () Bool)

(assert (=> b!665627 (=> (not res!433123) (not e!381412))))

(assert (=> b!665627 (= res!433123 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19067 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!59974 res!433127) b!665622))

(assert (= (and b!665622 res!433121) b!665620))

(assert (= (and b!665620 res!433113) b!665606))

(assert (= (and b!665606 res!433109) b!665621))

(assert (= (and b!665621 res!433119) b!665612))

(assert (= (and b!665621 (not res!433114)) b!665619))

(assert (= (and b!665619 res!433124) b!665610))

(assert (= (and b!665621 res!433107) b!665615))

(assert (= (and b!665615 res!433115) b!665618))

(assert (= (and b!665618 res!433122) b!665609))

(assert (= (and b!665609 res!433116) b!665605))

(assert (= (and b!665605 res!433108) b!665613))

(assert (= (and b!665613 res!433125) b!665627))

(assert (= (and b!665627 res!433123) b!665626))

(assert (= (and b!665626 c!76615) b!665603))

(assert (= (and b!665626 (not c!76615)) b!665608))

(assert (= (and b!665626 c!76616) b!665614))

(assert (= (and b!665626 (not c!76616)) b!665611))

(assert (= (and b!665626 (not res!433126)) b!665623))

(assert (= (and b!665623 (not res!433118)) b!665617))

(assert (= (and b!665617 (not res!433112)) b!665607))

(assert (= (and b!665607 (not res!433110)) b!665616))

(assert (= (and b!665616 (not res!433120)) b!665625))

(assert (= (and b!665625 (not res!433117)) b!665624))

(assert (= (and b!665624 (not res!433111)) b!665604))

(declare-fun m!636613 () Bool)

(assert (=> b!665613 m!636613))

(declare-fun m!636615 () Bool)

(assert (=> b!665604 m!636615))

(declare-fun m!636617 () Bool)

(assert (=> b!665615 m!636617))

(declare-fun m!636619 () Bool)

(assert (=> b!665603 m!636619))

(declare-fun m!636621 () Bool)

(assert (=> b!665612 m!636621))

(declare-fun m!636623 () Bool)

(assert (=> b!665622 m!636623))

(declare-fun m!636625 () Bool)

(assert (=> b!665620 m!636625))

(declare-fun m!636627 () Bool)

(assert (=> b!665626 m!636627))

(declare-fun m!636629 () Bool)

(assert (=> b!665626 m!636629))

(declare-fun m!636631 () Bool)

(assert (=> b!665626 m!636631))

(declare-fun m!636633 () Bool)

(assert (=> b!665626 m!636633))

(declare-fun m!636635 () Bool)

(assert (=> b!665626 m!636635))

(declare-fun m!636637 () Bool)

(assert (=> b!665626 m!636637))

(declare-fun m!636639 () Bool)

(assert (=> b!665626 m!636639))

(declare-fun m!636641 () Bool)

(assert (=> b!665626 m!636641))

(assert (=> b!665626 m!636639))

(declare-fun m!636643 () Bool)

(assert (=> b!665626 m!636643))

(declare-fun m!636645 () Bool)

(assert (=> b!665626 m!636645))

(declare-fun m!636647 () Bool)

(assert (=> b!665626 m!636647))

(declare-fun m!636649 () Bool)

(assert (=> b!665618 m!636649))

(declare-fun m!636651 () Bool)

(assert (=> b!665605 m!636651))

(declare-fun m!636653 () Bool)

(assert (=> b!665623 m!636653))

(declare-fun m!636655 () Bool)

(assert (=> start!59974 m!636655))

(declare-fun m!636657 () Bool)

(assert (=> b!665624 m!636657))

(declare-fun m!636659 () Bool)

(assert (=> b!665606 m!636659))

(assert (=> b!665607 m!636621))

(assert (=> b!665614 m!636627))

(assert (=> b!665614 m!636639))

(declare-fun m!636661 () Bool)

(assert (=> b!665614 m!636661))

(declare-fun m!636663 () Bool)

(assert (=> b!665614 m!636663))

(assert (=> b!665614 m!636639))

(assert (=> b!665614 m!636661))

(assert (=> b!665614 m!636633))

(assert (=> b!665614 m!636647))

(declare-fun m!636665 () Bool)

(assert (=> b!665616 m!636665))

(assert (=> b!665610 m!636621))

(declare-fun m!636667 () Bool)

(assert (=> b!665625 m!636667))

(check-sat (not b!665605) (not b!665606) (not b!665626) (not start!59974) (not b!665613) (not b!665614) (not b!665625) (not b!665620) (not b!665618) (not b!665603) (not b!665607) (not b!665624) (not b!665615) (not b!665604) (not b!665622) (not b!665616) (not b!665623) (not b!665610) (not b!665612))
