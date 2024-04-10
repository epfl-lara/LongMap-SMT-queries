; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60082 () Bool)

(assert start!60082)

(declare-fun b!669653 () Bool)

(declare-datatypes ((Unit!23510 0))(
  ( (Unit!23511) )
))
(declare-fun e!382999 () Unit!23510)

(declare-fun Unit!23512 () Unit!23510)

(assert (=> b!669653 (= e!382999 Unit!23512)))

(declare-fun b!669654 () Bool)

(declare-fun res!436526 () Bool)

(declare-fun e!382993 () Bool)

(assert (=> b!669654 (=> (not res!436526) (not e!382993))))

(declare-datatypes ((array!39129 0))(
  ( (array!39130 (arr!18757 (Array (_ BitVec 32) (_ BitVec 64))) (size!19121 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39129)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669654 (= res!436526 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669655 () Bool)

(declare-fun res!436523 () Bool)

(assert (=> b!669655 (=> (not res!436523) (not e!382993))))

(declare-datatypes ((List!12798 0))(
  ( (Nil!12795) (Cons!12794 (h!13839 (_ BitVec 64)) (t!19026 List!12798)) )
))
(declare-fun acc!681 () List!12798)

(declare-fun noDuplicate!622 (List!12798) Bool)

(assert (=> b!669655 (= res!436523 (noDuplicate!622 acc!681))))

(declare-fun b!669656 () Bool)

(declare-fun res!436513 () Bool)

(assert (=> b!669656 (=> (not res!436513) (not e!382993))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669656 (= res!436513 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19121 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669657 () Bool)

(declare-fun e!382994 () Bool)

(declare-fun lt!311713 () List!12798)

(declare-fun contains!3375 (List!12798 (_ BitVec 64)) Bool)

(assert (=> b!669657 (= e!382994 (contains!3375 lt!311713 k0!2843))))

(declare-fun res!436514 () Bool)

(assert (=> start!60082 (=> (not res!436514) (not e!382993))))

(assert (=> start!60082 (= res!436514 (and (bvslt (size!19121 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19121 a!3626))))))

(assert (=> start!60082 e!382993))

(assert (=> start!60082 true))

(declare-fun array_inv!14553 (array!39129) Bool)

(assert (=> start!60082 (array_inv!14553 a!3626)))

(declare-fun b!669658 () Bool)

(declare-fun e!383000 () Bool)

(assert (=> b!669658 (= e!382993 (not e!383000))))

(declare-fun res!436521 () Bool)

(assert (=> b!669658 (=> res!436521 e!383000)))

(assert (=> b!669658 (= res!436521 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39129 (_ BitVec 32) List!12798) Bool)

(assert (=> b!669658 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311713)))

(declare-fun lt!311708 () Unit!23510)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39129 (_ BitVec 64) (_ BitVec 32) List!12798 List!12798) Unit!23510)

(assert (=> b!669658 (= lt!311708 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311713))))

(declare-fun -!112 (List!12798 (_ BitVec 64)) List!12798)

(assert (=> b!669658 (= (-!112 lt!311713 k0!2843) acc!681)))

(declare-fun $colon$colon!246 (List!12798 (_ BitVec 64)) List!12798)

(assert (=> b!669658 (= lt!311713 ($colon$colon!246 acc!681 k0!2843))))

(declare-fun lt!311706 () Unit!23510)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12798) Unit!23510)

(assert (=> b!669658 (= lt!311706 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!114 (List!12798 List!12798) Bool)

(assert (=> b!669658 (subseq!114 acc!681 acc!681)))

(declare-fun lt!311704 () Unit!23510)

(declare-fun lemmaListSubSeqRefl!0 (List!12798) Unit!23510)

(assert (=> b!669658 (= lt!311704 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669658 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311709 () Unit!23510)

(declare-fun e!382997 () Unit!23510)

(assert (=> b!669658 (= lt!311709 e!382997)))

(declare-fun c!76940 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669658 (= c!76940 (validKeyInArray!0 (select (arr!18757 a!3626) from!3004)))))

(declare-fun lt!311711 () Unit!23510)

(assert (=> b!669658 (= lt!311711 e!382999)))

(declare-fun c!76939 () Bool)

(assert (=> b!669658 (= c!76939 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669658 (arrayContainsKey!0 (array!39130 (store (arr!18757 a!3626) i!1382 k0!2843) (size!19121 a!3626)) k0!2843 from!3004)))

(declare-fun b!669659 () Bool)

(declare-fun res!436519 () Bool)

(assert (=> b!669659 (=> res!436519 e!383000)))

(assert (=> b!669659 (= res!436519 (not (noDuplicate!622 lt!311713)))))

(declare-fun b!669660 () Bool)

(declare-fun res!436516 () Bool)

(assert (=> b!669660 (=> (not res!436516) (not e!382993))))

(declare-fun e!382998 () Bool)

(assert (=> b!669660 (= res!436516 e!382998)))

(declare-fun res!436509 () Bool)

(assert (=> b!669660 (=> res!436509 e!382998)))

(declare-fun e!382991 () Bool)

(assert (=> b!669660 (= res!436509 e!382991)))

(declare-fun res!436510 () Bool)

(assert (=> b!669660 (=> (not res!436510) (not e!382991))))

(assert (=> b!669660 (= res!436510 (bvsgt from!3004 i!1382))))

(declare-fun b!669661 () Bool)

(declare-fun res!436524 () Bool)

(assert (=> b!669661 (=> (not res!436524) (not e!382993))))

(assert (=> b!669661 (= res!436524 (not (contains!3375 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669662 () Bool)

(declare-fun res!436529 () Bool)

(assert (=> b!669662 (=> (not res!436529) (not e!382993))))

(assert (=> b!669662 (= res!436529 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12795))))

(declare-fun b!669663 () Bool)

(declare-fun res!436511 () Bool)

(assert (=> b!669663 (=> (not res!436511) (not e!382993))))

(assert (=> b!669663 (= res!436511 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19121 a!3626))))))

(declare-fun b!669664 () Bool)

(declare-fun res!436528 () Bool)

(assert (=> b!669664 (=> res!436528 e!383000)))

(assert (=> b!669664 (= res!436528 (contains!3375 lt!311713 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669665 () Bool)

(declare-fun res!436512 () Bool)

(assert (=> b!669665 (=> (not res!436512) (not e!382993))))

(assert (=> b!669665 (= res!436512 (validKeyInArray!0 k0!2843))))

(declare-fun b!669666 () Bool)

(declare-fun res!436527 () Bool)

(assert (=> b!669666 (=> (not res!436527) (not e!382993))))

(assert (=> b!669666 (= res!436527 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669667 () Bool)

(declare-fun e!382992 () Bool)

(assert (=> b!669667 (= e!382992 (not (contains!3375 acc!681 k0!2843)))))

(declare-fun b!669668 () Bool)

(assert (=> b!669668 (= e!382991 (contains!3375 acc!681 k0!2843))))

(declare-fun b!669669 () Bool)

(declare-fun res!436517 () Bool)

(assert (=> b!669669 (=> (not res!436517) (not e!382993))))

(assert (=> b!669669 (= res!436517 (not (contains!3375 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669670 () Bool)

(declare-fun e!382995 () Bool)

(declare-fun e!383001 () Bool)

(assert (=> b!669670 (= e!382995 e!383001)))

(declare-fun res!436520 () Bool)

(assert (=> b!669670 (=> (not res!436520) (not e!383001))))

(assert (=> b!669670 (= res!436520 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669671 () Bool)

(assert (=> b!669671 (= e!383001 (not (contains!3375 lt!311713 k0!2843)))))

(declare-fun b!669672 () Bool)

(assert (=> b!669672 (= e!383000 true)))

(declare-fun lt!311712 () Bool)

(assert (=> b!669672 (= lt!311712 e!382995)))

(declare-fun res!436525 () Bool)

(assert (=> b!669672 (=> res!436525 e!382995)))

(assert (=> b!669672 (= res!436525 e!382994)))

(declare-fun res!436515 () Bool)

(assert (=> b!669672 (=> (not res!436515) (not e!382994))))

(assert (=> b!669672 (= res!436515 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669673 () Bool)

(declare-fun lt!311707 () Unit!23510)

(assert (=> b!669673 (= e!382997 lt!311707)))

(declare-fun lt!311710 () Unit!23510)

(assert (=> b!669673 (= lt!311710 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669673 (subseq!114 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39129 List!12798 List!12798 (_ BitVec 32)) Unit!23510)

(assert (=> b!669673 (= lt!311707 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!246 acc!681 (select (arr!18757 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669673 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669674 () Bool)

(declare-fun Unit!23513 () Unit!23510)

(assert (=> b!669674 (= e!382999 Unit!23513)))

(declare-fun lt!311705 () Unit!23510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39129 (_ BitVec 64) (_ BitVec 32)) Unit!23510)

(assert (=> b!669674 (= lt!311705 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!669674 false))

(declare-fun b!669675 () Bool)

(declare-fun Unit!23514 () Unit!23510)

(assert (=> b!669675 (= e!382997 Unit!23514)))

(declare-fun b!669676 () Bool)

(assert (=> b!669676 (= e!382998 e!382992)))

(declare-fun res!436518 () Bool)

(assert (=> b!669676 (=> (not res!436518) (not e!382992))))

(assert (=> b!669676 (= res!436518 (bvsle from!3004 i!1382))))

(declare-fun b!669677 () Bool)

(declare-fun res!436522 () Bool)

(assert (=> b!669677 (=> res!436522 e!383000)))

(assert (=> b!669677 (= res!436522 (contains!3375 lt!311713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!60082 res!436514) b!669655))

(assert (= (and b!669655 res!436523) b!669669))

(assert (= (and b!669669 res!436517) b!669661))

(assert (= (and b!669661 res!436524) b!669660))

(assert (= (and b!669660 res!436510) b!669668))

(assert (= (and b!669660 (not res!436509)) b!669676))

(assert (= (and b!669676 res!436518) b!669667))

(assert (= (and b!669660 res!436516) b!669662))

(assert (= (and b!669662 res!436529) b!669666))

(assert (= (and b!669666 res!436527) b!669663))

(assert (= (and b!669663 res!436511) b!669665))

(assert (= (and b!669665 res!436512) b!669654))

(assert (= (and b!669654 res!436526) b!669656))

(assert (= (and b!669656 res!436513) b!669658))

(assert (= (and b!669658 c!76939) b!669674))

(assert (= (and b!669658 (not c!76939)) b!669653))

(assert (= (and b!669658 c!76940) b!669673))

(assert (= (and b!669658 (not c!76940)) b!669675))

(assert (= (and b!669658 (not res!436521)) b!669659))

(assert (= (and b!669659 (not res!436519)) b!669677))

(assert (= (and b!669677 (not res!436522)) b!669664))

(assert (= (and b!669664 (not res!436528)) b!669672))

(assert (= (and b!669672 res!436515) b!669657))

(assert (= (and b!669672 (not res!436525)) b!669670))

(assert (= (and b!669670 res!436520) b!669671))

(declare-fun m!639699 () Bool)

(assert (=> b!669665 m!639699))

(declare-fun m!639701 () Bool)

(assert (=> b!669674 m!639701))

(declare-fun m!639703 () Bool)

(assert (=> b!669669 m!639703))

(declare-fun m!639705 () Bool)

(assert (=> b!669673 m!639705))

(declare-fun m!639707 () Bool)

(assert (=> b!669673 m!639707))

(declare-fun m!639709 () Bool)

(assert (=> b!669673 m!639709))

(declare-fun m!639711 () Bool)

(assert (=> b!669673 m!639711))

(assert (=> b!669673 m!639707))

(assert (=> b!669673 m!639709))

(declare-fun m!639713 () Bool)

(assert (=> b!669673 m!639713))

(declare-fun m!639715 () Bool)

(assert (=> b!669673 m!639715))

(declare-fun m!639717 () Bool)

(assert (=> b!669667 m!639717))

(assert (=> b!669658 m!639705))

(declare-fun m!639719 () Bool)

(assert (=> b!669658 m!639719))

(assert (=> b!669658 m!639707))

(declare-fun m!639721 () Bool)

(assert (=> b!669658 m!639721))

(declare-fun m!639723 () Bool)

(assert (=> b!669658 m!639723))

(declare-fun m!639725 () Bool)

(assert (=> b!669658 m!639725))

(assert (=> b!669658 m!639713))

(declare-fun m!639727 () Bool)

(assert (=> b!669658 m!639727))

(declare-fun m!639729 () Bool)

(assert (=> b!669658 m!639729))

(declare-fun m!639731 () Bool)

(assert (=> b!669658 m!639731))

(assert (=> b!669658 m!639707))

(declare-fun m!639733 () Bool)

(assert (=> b!669658 m!639733))

(declare-fun m!639735 () Bool)

(assert (=> b!669658 m!639735))

(assert (=> b!669658 m!639715))

(declare-fun m!639737 () Bool)

(assert (=> b!669671 m!639737))

(declare-fun m!639739 () Bool)

(assert (=> b!669654 m!639739))

(declare-fun m!639741 () Bool)

(assert (=> b!669677 m!639741))

(declare-fun m!639743 () Bool)

(assert (=> start!60082 m!639743))

(assert (=> b!669668 m!639717))

(declare-fun m!639745 () Bool)

(assert (=> b!669659 m!639745))

(declare-fun m!639747 () Bool)

(assert (=> b!669655 m!639747))

(declare-fun m!639749 () Bool)

(assert (=> b!669664 m!639749))

(declare-fun m!639751 () Bool)

(assert (=> b!669666 m!639751))

(declare-fun m!639753 () Bool)

(assert (=> b!669662 m!639753))

(declare-fun m!639755 () Bool)

(assert (=> b!669661 m!639755))

(assert (=> b!669657 m!639737))

(check-sat (not b!669655) (not b!669667) (not b!669659) (not b!669654) (not b!669677) (not start!60082) (not b!669666) (not b!669674) (not b!669673) (not b!669669) (not b!669662) (not b!669661) (not b!669657) (not b!669671) (not b!669664) (not b!669668) (not b!669665) (not b!669658))
(check-sat)
