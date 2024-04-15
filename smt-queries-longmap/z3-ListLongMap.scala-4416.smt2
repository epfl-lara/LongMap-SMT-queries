; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60974 () Bool)

(assert start!60974)

(declare-fun b!683689 () Bool)

(declare-fun e!389409 () Bool)

(declare-fun e!389408 () Bool)

(assert (=> b!683689 (= e!389409 (not e!389408))))

(declare-fun res!449501 () Bool)

(assert (=> b!683689 (=> res!449501 e!389408)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!683689 (= res!449501 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13057 0))(
  ( (Nil!13054) (Cons!13053 (h!14098 (_ BitVec 64)) (t!19294 List!13057)) )
))
(declare-fun lt!313865 () List!13057)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!13057)

(declare-fun -!147 (List!13057 (_ BitVec 64)) List!13057)

(assert (=> b!683689 (= (-!147 lt!313865 k0!2843) acc!681)))

(declare-fun $colon$colon!346 (List!13057 (_ BitVec 64)) List!13057)

(assert (=> b!683689 (= lt!313865 ($colon$colon!346 acc!681 k0!2843))))

(declare-datatypes ((Unit!24035 0))(
  ( (Unit!24036) )
))
(declare-fun lt!313866 () Unit!24035)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13057) Unit!24035)

(assert (=> b!683689 (= lt!313866 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!182 (List!13057 List!13057) Bool)

(assert (=> b!683689 (subseq!182 acc!681 acc!681)))

(declare-fun lt!313862 () Unit!24035)

(declare-fun lemmaListSubSeqRefl!0 (List!13057) Unit!24035)

(assert (=> b!683689 (= lt!313862 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39594 0))(
  ( (array!39595 (arr!18977 (Array (_ BitVec 32) (_ BitVec 64))) (size!19344 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39594)

(declare-fun arrayNoDuplicates!0 (array!39594 (_ BitVec 32) List!13057) Bool)

(assert (=> b!683689 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313859 () Unit!24035)

(declare-fun e!389410 () Unit!24035)

(assert (=> b!683689 (= lt!313859 e!389410)))

(declare-fun c!77463 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683689 (= c!77463 (validKeyInArray!0 (select (arr!18977 a!3626) from!3004)))))

(declare-fun lt!313860 () Unit!24035)

(declare-fun e!389414 () Unit!24035)

(assert (=> b!683689 (= lt!313860 e!389414)))

(declare-fun c!77462 () Bool)

(declare-fun lt!313861 () Bool)

(assert (=> b!683689 (= c!77462 lt!313861)))

(declare-fun arrayContainsKey!0 (array!39594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683689 (= lt!313861 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683689 (arrayContainsKey!0 (array!39595 (store (arr!18977 a!3626) i!1382 k0!2843) (size!19344 a!3626)) k0!2843 from!3004)))

(declare-fun b!683690 () Bool)

(declare-fun res!449509 () Bool)

(assert (=> b!683690 (=> (not res!449509) (not e!389409))))

(assert (=> b!683690 (= res!449509 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13054))))

(declare-fun b!683691 () Bool)

(declare-fun e!389411 () Bool)

(declare-fun contains!3579 (List!13057 (_ BitVec 64)) Bool)

(assert (=> b!683691 (= e!389411 (contains!3579 acc!681 k0!2843))))

(declare-fun b!683693 () Bool)

(declare-fun Unit!24037 () Unit!24035)

(assert (=> b!683693 (= e!389414 Unit!24037)))

(declare-fun b!683694 () Bool)

(declare-fun res!449504 () Bool)

(assert (=> b!683694 (=> (not res!449504) (not e!389409))))

(assert (=> b!683694 (= res!449504 (not (contains!3579 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683695 () Bool)

(declare-fun res!449514 () Bool)

(assert (=> b!683695 (=> (not res!449514) (not e!389409))))

(declare-fun e!389413 () Bool)

(assert (=> b!683695 (= res!449514 e!389413)))

(declare-fun res!449507 () Bool)

(assert (=> b!683695 (=> res!449507 e!389413)))

(assert (=> b!683695 (= res!449507 e!389411)))

(declare-fun res!449505 () Bool)

(assert (=> b!683695 (=> (not res!449505) (not e!389411))))

(assert (=> b!683695 (= res!449505 (bvsgt from!3004 i!1382))))

(declare-fun b!683696 () Bool)

(declare-fun res!449499 () Bool)

(assert (=> b!683696 (=> (not res!449499) (not e!389409))))

(declare-fun noDuplicate!848 (List!13057) Bool)

(assert (=> b!683696 (= res!449499 (noDuplicate!848 acc!681))))

(declare-fun b!683697 () Bool)

(declare-fun e!389407 () Bool)

(assert (=> b!683697 (= e!389407 (not (contains!3579 acc!681 k0!2843)))))

(declare-fun b!683698 () Bool)

(declare-fun lt!313858 () Unit!24035)

(assert (=> b!683698 (= e!389410 lt!313858)))

(declare-fun lt!313864 () Unit!24035)

(assert (=> b!683698 (= lt!313864 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683698 (subseq!182 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39594 List!13057 List!13057 (_ BitVec 32)) Unit!24035)

(assert (=> b!683698 (= lt!313858 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!346 acc!681 (select (arr!18977 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683698 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683699 () Bool)

(declare-fun res!449515 () Bool)

(assert (=> b!683699 (=> (not res!449515) (not e!389409))))

(assert (=> b!683699 (= res!449515 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683692 () Bool)

(assert (=> b!683692 (= e!389408 (not (contains!3579 acc!681 k0!2843)))))

(declare-fun res!449502 () Bool)

(assert (=> start!60974 (=> (not res!449502) (not e!389409))))

(assert (=> start!60974 (= res!449502 (and (bvslt (size!19344 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19344 a!3626))))))

(assert (=> start!60974 e!389409))

(assert (=> start!60974 true))

(declare-fun array_inv!14860 (array!39594) Bool)

(assert (=> start!60974 (array_inv!14860 a!3626)))

(declare-fun b!683700 () Bool)

(declare-fun res!449508 () Bool)

(assert (=> b!683700 (=> res!449508 e!389408)))

(assert (=> b!683700 (= res!449508 lt!313861)))

(declare-fun b!683701 () Bool)

(declare-fun res!449513 () Bool)

(assert (=> b!683701 (=> res!449513 e!389408)))

(assert (=> b!683701 (= res!449513 (not (noDuplicate!848 lt!313865)))))

(declare-fun b!683702 () Bool)

(declare-fun res!449500 () Bool)

(assert (=> b!683702 (=> (not res!449500) (not e!389409))))

(assert (=> b!683702 (= res!449500 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683703 () Bool)

(declare-fun res!449510 () Bool)

(assert (=> b!683703 (=> (not res!449510) (not e!389409))))

(assert (=> b!683703 (= res!449510 (not (contains!3579 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683704 () Bool)

(declare-fun Unit!24038 () Unit!24035)

(assert (=> b!683704 (= e!389414 Unit!24038)))

(declare-fun lt!313863 () Unit!24035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39594 (_ BitVec 64) (_ BitVec 32)) Unit!24035)

(assert (=> b!683704 (= lt!313863 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!683704 false))

(declare-fun b!683705 () Bool)

(declare-fun res!449503 () Bool)

(assert (=> b!683705 (=> (not res!449503) (not e!389409))))

(assert (=> b!683705 (= res!449503 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19344 a!3626))))))

(declare-fun b!683706 () Bool)

(declare-fun res!449506 () Bool)

(assert (=> b!683706 (=> (not res!449506) (not e!389409))))

(assert (=> b!683706 (= res!449506 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19344 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683707 () Bool)

(declare-fun Unit!24039 () Unit!24035)

(assert (=> b!683707 (= e!389410 Unit!24039)))

(declare-fun b!683708 () Bool)

(declare-fun res!449511 () Bool)

(assert (=> b!683708 (=> (not res!449511) (not e!389409))))

(assert (=> b!683708 (= res!449511 (validKeyInArray!0 k0!2843))))

(declare-fun b!683709 () Bool)

(assert (=> b!683709 (= e!389413 e!389407)))

(declare-fun res!449512 () Bool)

(assert (=> b!683709 (=> (not res!449512) (not e!389407))))

(assert (=> b!683709 (= res!449512 (bvsle from!3004 i!1382))))

(assert (= (and start!60974 res!449502) b!683696))

(assert (= (and b!683696 res!449499) b!683694))

(assert (= (and b!683694 res!449504) b!683703))

(assert (= (and b!683703 res!449510) b!683695))

(assert (= (and b!683695 res!449505) b!683691))

(assert (= (and b!683695 (not res!449507)) b!683709))

(assert (= (and b!683709 res!449512) b!683697))

(assert (= (and b!683695 res!449514) b!683690))

(assert (= (and b!683690 res!449509) b!683699))

(assert (= (and b!683699 res!449515) b!683705))

(assert (= (and b!683705 res!449503) b!683708))

(assert (= (and b!683708 res!449511) b!683702))

(assert (= (and b!683702 res!449500) b!683706))

(assert (= (and b!683706 res!449506) b!683689))

(assert (= (and b!683689 c!77462) b!683704))

(assert (= (and b!683689 (not c!77462)) b!683693))

(assert (= (and b!683689 c!77463) b!683698))

(assert (= (and b!683689 (not c!77463)) b!683707))

(assert (= (and b!683689 (not res!449501)) b!683701))

(assert (= (and b!683701 (not res!449513)) b!683700))

(assert (= (and b!683700 (not res!449508)) b!683692))

(declare-fun m!647667 () Bool)

(assert (=> b!683701 m!647667))

(declare-fun m!647669 () Bool)

(assert (=> b!683691 m!647669))

(declare-fun m!647671 () Bool)

(assert (=> start!60974 m!647671))

(assert (=> b!683697 m!647669))

(declare-fun m!647673 () Bool)

(assert (=> b!683708 m!647673))

(declare-fun m!647675 () Bool)

(assert (=> b!683699 m!647675))

(declare-fun m!647677 () Bool)

(assert (=> b!683690 m!647677))

(declare-fun m!647679 () Bool)

(assert (=> b!683694 m!647679))

(declare-fun m!647681 () Bool)

(assert (=> b!683703 m!647681))

(declare-fun m!647683 () Bool)

(assert (=> b!683704 m!647683))

(declare-fun m!647685 () Bool)

(assert (=> b!683696 m!647685))

(declare-fun m!647687 () Bool)

(assert (=> b!683702 m!647687))

(assert (=> b!683692 m!647669))

(declare-fun m!647689 () Bool)

(assert (=> b!683689 m!647689))

(declare-fun m!647691 () Bool)

(assert (=> b!683689 m!647691))

(declare-fun m!647693 () Bool)

(assert (=> b!683689 m!647693))

(declare-fun m!647695 () Bool)

(assert (=> b!683689 m!647695))

(declare-fun m!647697 () Bool)

(assert (=> b!683689 m!647697))

(declare-fun m!647699 () Bool)

(assert (=> b!683689 m!647699))

(declare-fun m!647701 () Bool)

(assert (=> b!683689 m!647701))

(declare-fun m!647703 () Bool)

(assert (=> b!683689 m!647703))

(assert (=> b!683689 m!647693))

(declare-fun m!647705 () Bool)

(assert (=> b!683689 m!647705))

(declare-fun m!647707 () Bool)

(assert (=> b!683689 m!647707))

(declare-fun m!647709 () Bool)

(assert (=> b!683689 m!647709))

(assert (=> b!683698 m!647691))

(assert (=> b!683698 m!647693))

(declare-fun m!647711 () Bool)

(assert (=> b!683698 m!647711))

(declare-fun m!647713 () Bool)

(assert (=> b!683698 m!647713))

(assert (=> b!683698 m!647693))

(assert (=> b!683698 m!647711))

(assert (=> b!683698 m!647699))

(assert (=> b!683698 m!647709))

(check-sat (not b!683702) (not b!683691) (not b!683690) (not b!683704) (not b!683697) (not b!683703) (not b!683694) (not b!683708) (not b!683689) (not b!683698) (not b!683692) (not b!683699) (not b!683696) (not start!60974) (not b!683701))
(check-sat)
