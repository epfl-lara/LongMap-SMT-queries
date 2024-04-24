; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62100 () Bool)

(assert start!62100)

(declare-fun b!694685 () Bool)

(declare-datatypes ((Unit!24513 0))(
  ( (Unit!24514) )
))
(declare-fun e!395184 () Unit!24513)

(declare-fun Unit!24515 () Unit!24513)

(assert (=> b!694685 (= e!395184 Unit!24515)))

(declare-fun b!694686 () Bool)

(declare-fun res!458628 () Bool)

(declare-fun e!395190 () Bool)

(assert (=> b!694686 (=> (not res!458628) (not e!395190))))

(declare-fun e!395187 () Bool)

(assert (=> b!694686 (= res!458628 e!395187)))

(declare-fun res!458622 () Bool)

(assert (=> b!694686 (=> res!458622 e!395187)))

(declare-fun e!395193 () Bool)

(assert (=> b!694686 (= res!458622 e!395193)))

(declare-fun res!458626 () Bool)

(assert (=> b!694686 (=> (not res!458626) (not e!395193))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694686 (= res!458626 (bvsgt from!3004 i!1382))))

(declare-fun b!694687 () Bool)

(declare-fun e!395191 () Bool)

(declare-fun e!395192 () Bool)

(assert (=> b!694687 (= e!395191 e!395192)))

(declare-fun res!458614 () Bool)

(assert (=> b!694687 (=> (not res!458614) (not e!395192))))

(assert (=> b!694687 (= res!458614 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13047 0))(
  ( (Nil!13044) (Cons!13043 (h!14091 (_ BitVec 64)) (t!19318 List!13047)) )
))
(declare-fun lt!317010 () List!13047)

(declare-datatypes ((array!39879 0))(
  ( (array!39880 (arr!19099 (Array (_ BitVec 32) (_ BitVec 64))) (size!19482 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39879)

(declare-fun acc!681 () List!13047)

(declare-fun $colon$colon!431 (List!13047 (_ BitVec 64)) List!13047)

(assert (=> b!694687 (= lt!317010 ($colon$colon!431 acc!681 (select (arr!19099 a!3626) from!3004)))))

(declare-fun b!694688 () Bool)

(declare-fun res!458634 () Bool)

(assert (=> b!694688 (=> (not res!458634) (not e!395190))))

(assert (=> b!694688 (= res!458634 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19482 a!3626))))))

(declare-fun b!694690 () Bool)

(declare-fun res!458621 () Bool)

(assert (=> b!694690 (=> (not res!458621) (not e!395190))))

(declare-fun noDuplicate!973 (List!13047) Bool)

(assert (=> b!694690 (= res!458621 (noDuplicate!973 acc!681))))

(declare-fun b!694691 () Bool)

(declare-fun res!458618 () Bool)

(assert (=> b!694691 (=> (not res!458618) (not e!395192))))

(assert (=> b!694691 (= res!458618 (noDuplicate!973 lt!317010))))

(declare-fun b!694692 () Bool)

(declare-fun res!458617 () Bool)

(assert (=> b!694692 (=> (not res!458617) (not e!395190))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694692 (= res!458617 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694693 () Bool)

(declare-fun res!458616 () Bool)

(assert (=> b!694693 (=> (not res!458616) (not e!395190))))

(declare-fun arrayNoDuplicates!0 (array!39879 (_ BitVec 32) List!13047) Bool)

(assert (=> b!694693 (= res!458616 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694694 () Bool)

(declare-fun contains!3699 (List!13047 (_ BitVec 64)) Bool)

(assert (=> b!694694 (= e!395193 (contains!3699 acc!681 k0!2843))))

(declare-fun b!694695 () Bool)

(declare-fun res!458625 () Bool)

(assert (=> b!694695 (=> (not res!458625) (not e!395190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694695 (= res!458625 (validKeyInArray!0 (select (arr!19099 a!3626) from!3004)))))

(declare-fun b!694696 () Bool)

(declare-fun res!458619 () Bool)

(assert (=> b!694696 (=> (not res!458619) (not e!395190))))

(assert (=> b!694696 (= res!458619 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19482 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694697 () Bool)

(declare-fun e!395185 () Bool)

(declare-fun e!395186 () Bool)

(assert (=> b!694697 (= e!395185 e!395186)))

(declare-fun res!458627 () Bool)

(assert (=> b!694697 (=> (not res!458627) (not e!395186))))

(assert (=> b!694697 (= res!458627 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694698 () Bool)

(declare-fun res!458636 () Bool)

(assert (=> b!694698 (=> (not res!458636) (not e!395192))))

(assert (=> b!694698 (= res!458636 (not (contains!3699 lt!317010 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!458633 () Bool)

(assert (=> start!62100 (=> (not res!458633) (not e!395190))))

(assert (=> start!62100 (= res!458633 (and (bvslt (size!19482 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19482 a!3626))))))

(assert (=> start!62100 e!395190))

(assert (=> start!62100 true))

(declare-fun array_inv!14958 (array!39879) Bool)

(assert (=> start!62100 (array_inv!14958 a!3626)))

(declare-fun b!694689 () Bool)

(declare-fun e!395183 () Bool)

(assert (=> b!694689 (= e!395187 e!395183)))

(declare-fun res!458629 () Bool)

(assert (=> b!694689 (=> (not res!458629) (not e!395183))))

(assert (=> b!694689 (= res!458629 (bvsle from!3004 i!1382))))

(declare-fun b!694699 () Bool)

(declare-fun Unit!24516 () Unit!24513)

(assert (=> b!694699 (= e!395184 Unit!24516)))

(assert (=> b!694699 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!317009 () Unit!24513)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39879 (_ BitVec 64) (_ BitVec 32)) Unit!24513)

(assert (=> b!694699 (= lt!317009 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694699 false))

(declare-fun b!694700 () Bool)

(declare-fun res!458631 () Bool)

(assert (=> b!694700 (=> (not res!458631) (not e!395190))))

(assert (=> b!694700 (= res!458631 (not (contains!3699 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694701 () Bool)

(declare-fun e!395188 () Bool)

(assert (=> b!694701 (= e!395188 (contains!3699 lt!317010 k0!2843))))

(declare-fun b!694702 () Bool)

(assert (=> b!694702 (= e!395183 (not (contains!3699 acc!681 k0!2843)))))

(declare-fun b!694703 () Bool)

(declare-fun res!458630 () Bool)

(assert (=> b!694703 (=> (not res!458630) (not e!395190))))

(assert (=> b!694703 (= res!458630 (not (contains!3699 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694704 () Bool)

(assert (=> b!694704 (= e!395190 e!395191)))

(declare-fun res!458624 () Bool)

(assert (=> b!694704 (=> (not res!458624) (not e!395191))))

(assert (=> b!694704 (= res!458624 (not (= (select (arr!19099 a!3626) from!3004) k0!2843)))))

(declare-fun lt!317011 () Unit!24513)

(assert (=> b!694704 (= lt!317011 e!395184)))

(declare-fun c!78404 () Bool)

(assert (=> b!694704 (= c!78404 (= (select (arr!19099 a!3626) from!3004) k0!2843))))

(declare-fun b!694705 () Bool)

(declare-fun res!458620 () Bool)

(assert (=> b!694705 (=> (not res!458620) (not e!395192))))

(assert (=> b!694705 (= res!458620 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!317010))))

(declare-fun b!694706 () Bool)

(assert (=> b!694706 (= e!395192 (bvsge (bvsub (size!19482 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19482 a!3626) from!3004)))))

(declare-fun b!694707 () Bool)

(declare-fun res!458635 () Bool)

(assert (=> b!694707 (=> (not res!458635) (not e!395192))))

(assert (=> b!694707 (= res!458635 (not (contains!3699 lt!317010 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694708 () Bool)

(declare-fun res!458632 () Bool)

(assert (=> b!694708 (=> (not res!458632) (not e!395190))))

(assert (=> b!694708 (= res!458632 (validKeyInArray!0 k0!2843))))

(declare-fun b!694709 () Bool)

(declare-fun res!458615 () Bool)

(assert (=> b!694709 (=> (not res!458615) (not e!395192))))

(assert (=> b!694709 (= res!458615 e!395185)))

(declare-fun res!458623 () Bool)

(assert (=> b!694709 (=> res!458623 e!395185)))

(assert (=> b!694709 (= res!458623 e!395188)))

(declare-fun res!458637 () Bool)

(assert (=> b!694709 (=> (not res!458637) (not e!395188))))

(assert (=> b!694709 (= res!458637 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694710 () Bool)

(declare-fun res!458638 () Bool)

(assert (=> b!694710 (=> (not res!458638) (not e!395190))))

(assert (=> b!694710 (= res!458638 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13044))))

(declare-fun b!694711 () Bool)

(assert (=> b!694711 (= e!395186 (not (contains!3699 lt!317010 k0!2843)))))

(assert (= (and start!62100 res!458633) b!694690))

(assert (= (and b!694690 res!458621) b!694703))

(assert (= (and b!694703 res!458630) b!694700))

(assert (= (and b!694700 res!458631) b!694686))

(assert (= (and b!694686 res!458626) b!694694))

(assert (= (and b!694686 (not res!458622)) b!694689))

(assert (= (and b!694689 res!458629) b!694702))

(assert (= (and b!694686 res!458628) b!694710))

(assert (= (and b!694710 res!458638) b!694693))

(assert (= (and b!694693 res!458616) b!694688))

(assert (= (and b!694688 res!458634) b!694708))

(assert (= (and b!694708 res!458632) b!694692))

(assert (= (and b!694692 res!458617) b!694696))

(assert (= (and b!694696 res!458619) b!694695))

(assert (= (and b!694695 res!458625) b!694704))

(assert (= (and b!694704 c!78404) b!694699))

(assert (= (and b!694704 (not c!78404)) b!694685))

(assert (= (and b!694704 res!458624) b!694687))

(assert (= (and b!694687 res!458614) b!694691))

(assert (= (and b!694691 res!458618) b!694707))

(assert (= (and b!694707 res!458635) b!694698))

(assert (= (and b!694698 res!458636) b!694709))

(assert (= (and b!694709 res!458637) b!694701))

(assert (= (and b!694709 (not res!458623)) b!694697))

(assert (= (and b!694697 res!458627) b!694711))

(assert (= (and b!694709 res!458615) b!694705))

(assert (= (and b!694705 res!458620) b!694706))

(declare-fun m!656977 () Bool)

(assert (=> b!694704 m!656977))

(declare-fun m!656979 () Bool)

(assert (=> b!694710 m!656979))

(declare-fun m!656981 () Bool)

(assert (=> b!694701 m!656981))

(declare-fun m!656983 () Bool)

(assert (=> b!694691 m!656983))

(declare-fun m!656985 () Bool)

(assert (=> b!694702 m!656985))

(declare-fun m!656987 () Bool)

(assert (=> start!62100 m!656987))

(declare-fun m!656989 () Bool)

(assert (=> b!694705 m!656989))

(assert (=> b!694687 m!656977))

(assert (=> b!694687 m!656977))

(declare-fun m!656991 () Bool)

(assert (=> b!694687 m!656991))

(declare-fun m!656993 () Bool)

(assert (=> b!694693 m!656993))

(declare-fun m!656995 () Bool)

(assert (=> b!694692 m!656995))

(declare-fun m!656997 () Bool)

(assert (=> b!694708 m!656997))

(declare-fun m!656999 () Bool)

(assert (=> b!694699 m!656999))

(declare-fun m!657001 () Bool)

(assert (=> b!694699 m!657001))

(declare-fun m!657003 () Bool)

(assert (=> b!694690 m!657003))

(assert (=> b!694695 m!656977))

(assert (=> b!694695 m!656977))

(declare-fun m!657005 () Bool)

(assert (=> b!694695 m!657005))

(assert (=> b!694711 m!656981))

(declare-fun m!657007 () Bool)

(assert (=> b!694698 m!657007))

(declare-fun m!657009 () Bool)

(assert (=> b!694700 m!657009))

(declare-fun m!657011 () Bool)

(assert (=> b!694703 m!657011))

(declare-fun m!657013 () Bool)

(assert (=> b!694707 m!657013))

(assert (=> b!694694 m!656985))

(check-sat (not b!694698) (not b!694699) (not b!694710) (not b!694694) (not b!694693) (not b!694692) (not b!694707) (not b!694695) (not start!62100) (not b!694701) (not b!694691) (not b!694700) (not b!694705) (not b!694703) (not b!694687) (not b!694690) (not b!694702) (not b!694711) (not b!694708))
(check-sat)
