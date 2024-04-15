; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60860 () Bool)

(assert start!60860)

(declare-fun b!682435 () Bool)

(declare-fun res!448527 () Bool)

(declare-fun e!388793 () Bool)

(assert (=> b!682435 (=> (not res!448527) (not e!388793))))

(declare-fun e!388795 () Bool)

(assert (=> b!682435 (= res!448527 e!388795)))

(declare-fun res!448532 () Bool)

(assert (=> b!682435 (=> res!448532 e!388795)))

(declare-fun e!388791 () Bool)

(assert (=> b!682435 (= res!448532 e!388791)))

(declare-fun res!448536 () Bool)

(assert (=> b!682435 (=> (not res!448536) (not e!388791))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682435 (= res!448536 (bvsgt from!3004 i!1382))))

(declare-fun b!682436 () Bool)

(declare-fun res!448534 () Bool)

(assert (=> b!682436 (=> (not res!448534) (not e!388793))))

(declare-datatypes ((array!39555 0))(
  ( (array!39556 (arr!18959 (Array (_ BitVec 32) (_ BitVec 64))) (size!19324 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39555)

(declare-datatypes ((List!13039 0))(
  ( (Nil!13036) (Cons!13035 (h!14080 (_ BitVec 64)) (t!19273 List!13039)) )
))
(declare-fun arrayNoDuplicates!0 (array!39555 (_ BitVec 32) List!13039) Bool)

(assert (=> b!682436 (= res!448534 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13036))))

(declare-fun b!682437 () Bool)

(declare-datatypes ((Unit!23945 0))(
  ( (Unit!23946) )
))
(declare-fun e!388796 () Unit!23945)

(declare-fun Unit!23947 () Unit!23945)

(assert (=> b!682437 (= e!388796 Unit!23947)))

(declare-fun b!682438 () Bool)

(declare-fun e!388790 () Bool)

(declare-fun acc!681 () List!13039)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3561 (List!13039 (_ BitVec 64)) Bool)

(assert (=> b!682438 (= e!388790 (not (contains!3561 acc!681 k0!2843)))))

(declare-fun res!448533 () Bool)

(assert (=> start!60860 (=> (not res!448533) (not e!388793))))

(assert (=> start!60860 (= res!448533 (and (bvslt (size!19324 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19324 a!3626))))))

(assert (=> start!60860 e!388793))

(assert (=> start!60860 true))

(declare-fun array_inv!14842 (array!39555) Bool)

(assert (=> start!60860 (array_inv!14842 a!3626)))

(declare-fun b!682439 () Bool)

(declare-fun res!448539 () Bool)

(assert (=> b!682439 (=> (not res!448539) (not e!388793))))

(assert (=> b!682439 (= res!448539 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19324 a!3626))))))

(declare-fun b!682440 () Bool)

(declare-fun res!448535 () Bool)

(assert (=> b!682440 (=> (not res!448535) (not e!388793))))

(assert (=> b!682440 (= res!448535 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682441 () Bool)

(declare-fun res!448529 () Bool)

(assert (=> b!682441 (=> (not res!448529) (not e!388793))))

(declare-fun arrayContainsKey!0 (array!39555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682441 (= res!448529 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682442 () Bool)

(declare-fun res!448538 () Bool)

(assert (=> b!682442 (=> (not res!448538) (not e!388793))))

(declare-fun noDuplicate!830 (List!13039) Bool)

(assert (=> b!682442 (= res!448538 (noDuplicate!830 acc!681))))

(declare-fun b!682443 () Bool)

(declare-fun e!388792 () Unit!23945)

(declare-fun Unit!23948 () Unit!23945)

(assert (=> b!682443 (= e!388792 Unit!23948)))

(declare-fun b!682444 () Bool)

(declare-fun res!448531 () Bool)

(assert (=> b!682444 (=> (not res!448531) (not e!388793))))

(assert (=> b!682444 (= res!448531 (not (contains!3561 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682445 () Bool)

(declare-fun res!448530 () Bool)

(assert (=> b!682445 (=> (not res!448530) (not e!388793))))

(assert (=> b!682445 (= res!448530 (not (contains!3561 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682446 () Bool)

(declare-fun res!448540 () Bool)

(assert (=> b!682446 (=> (not res!448540) (not e!388793))))

(assert (=> b!682446 (= res!448540 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19324 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682447 () Bool)

(assert (=> b!682447 (= e!388793 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun -!129 (List!13039 (_ BitVec 64)) List!13039)

(declare-fun $colon$colon!328 (List!13039 (_ BitVec 64)) List!13039)

(assert (=> b!682447 (= (-!129 ($colon$colon!328 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!313374 () Unit!23945)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13039) Unit!23945)

(assert (=> b!682447 (= lt!313374 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!164 (List!13039 List!13039) Bool)

(assert (=> b!682447 (subseq!164 acc!681 acc!681)))

(declare-fun lt!313373 () Unit!23945)

(declare-fun lemmaListSubSeqRefl!0 (List!13039) Unit!23945)

(assert (=> b!682447 (= lt!313373 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682447 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313376 () Unit!23945)

(assert (=> b!682447 (= lt!313376 e!388792)))

(declare-fun c!77321 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682447 (= c!77321 (validKeyInArray!0 (select (arr!18959 a!3626) from!3004)))))

(declare-fun lt!313371 () Unit!23945)

(assert (=> b!682447 (= lt!313371 e!388796)))

(declare-fun c!77322 () Bool)

(assert (=> b!682447 (= c!77322 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682447 (arrayContainsKey!0 (array!39556 (store (arr!18959 a!3626) i!1382 k0!2843) (size!19324 a!3626)) k0!2843 from!3004)))

(declare-fun b!682448 () Bool)

(declare-fun res!448537 () Bool)

(assert (=> b!682448 (=> (not res!448537) (not e!388793))))

(assert (=> b!682448 (= res!448537 (validKeyInArray!0 k0!2843))))

(declare-fun b!682449 () Bool)

(assert (=> b!682449 (= e!388795 e!388790)))

(declare-fun res!448528 () Bool)

(assert (=> b!682449 (=> (not res!448528) (not e!388790))))

(assert (=> b!682449 (= res!448528 (bvsle from!3004 i!1382))))

(declare-fun b!682450 () Bool)

(declare-fun Unit!23949 () Unit!23945)

(assert (=> b!682450 (= e!388796 Unit!23949)))

(declare-fun lt!313377 () Unit!23945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39555 (_ BitVec 64) (_ BitVec 32)) Unit!23945)

(assert (=> b!682450 (= lt!313377 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682450 false))

(declare-fun b!682451 () Bool)

(declare-fun lt!313375 () Unit!23945)

(assert (=> b!682451 (= e!388792 lt!313375)))

(declare-fun lt!313372 () Unit!23945)

(assert (=> b!682451 (= lt!313372 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682451 (subseq!164 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39555 List!13039 List!13039 (_ BitVec 32)) Unit!23945)

(assert (=> b!682451 (= lt!313375 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!328 acc!681 (select (arr!18959 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682451 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682452 () Bool)

(assert (=> b!682452 (= e!388791 (contains!3561 acc!681 k0!2843))))

(assert (= (and start!60860 res!448533) b!682442))

(assert (= (and b!682442 res!448538) b!682445))

(assert (= (and b!682445 res!448530) b!682444))

(assert (= (and b!682444 res!448531) b!682435))

(assert (= (and b!682435 res!448536) b!682452))

(assert (= (and b!682435 (not res!448532)) b!682449))

(assert (= (and b!682449 res!448528) b!682438))

(assert (= (and b!682435 res!448527) b!682436))

(assert (= (and b!682436 res!448534) b!682440))

(assert (= (and b!682440 res!448535) b!682439))

(assert (= (and b!682439 res!448539) b!682448))

(assert (= (and b!682448 res!448537) b!682441))

(assert (= (and b!682441 res!448529) b!682446))

(assert (= (and b!682446 res!448540) b!682447))

(assert (= (and b!682447 c!77322) b!682450))

(assert (= (and b!682447 (not c!77322)) b!682437))

(assert (= (and b!682447 c!77321) b!682451))

(assert (= (and b!682447 (not c!77321)) b!682443))

(declare-fun m!646593 () Bool)

(assert (=> b!682444 m!646593))

(declare-fun m!646595 () Bool)

(assert (=> b!682441 m!646595))

(declare-fun m!646597 () Bool)

(assert (=> b!682451 m!646597))

(declare-fun m!646599 () Bool)

(assert (=> b!682451 m!646599))

(declare-fun m!646601 () Bool)

(assert (=> b!682451 m!646601))

(declare-fun m!646603 () Bool)

(assert (=> b!682451 m!646603))

(assert (=> b!682451 m!646599))

(assert (=> b!682451 m!646601))

(declare-fun m!646605 () Bool)

(assert (=> b!682451 m!646605))

(declare-fun m!646607 () Bool)

(assert (=> b!682451 m!646607))

(declare-fun m!646609 () Bool)

(assert (=> b!682447 m!646609))

(declare-fun m!646611 () Bool)

(assert (=> b!682447 m!646611))

(assert (=> b!682447 m!646597))

(assert (=> b!682447 m!646599))

(declare-fun m!646613 () Bool)

(assert (=> b!682447 m!646613))

(declare-fun m!646615 () Bool)

(assert (=> b!682447 m!646615))

(assert (=> b!682447 m!646605))

(declare-fun m!646617 () Bool)

(assert (=> b!682447 m!646617))

(assert (=> b!682447 m!646609))

(assert (=> b!682447 m!646599))

(declare-fun m!646619 () Bool)

(assert (=> b!682447 m!646619))

(declare-fun m!646621 () Bool)

(assert (=> b!682447 m!646621))

(assert (=> b!682447 m!646607))

(declare-fun m!646623 () Bool)

(assert (=> b!682438 m!646623))

(declare-fun m!646625 () Bool)

(assert (=> b!682440 m!646625))

(assert (=> b!682452 m!646623))

(declare-fun m!646627 () Bool)

(assert (=> b!682442 m!646627))

(declare-fun m!646629 () Bool)

(assert (=> b!682436 m!646629))

(declare-fun m!646631 () Bool)

(assert (=> start!60860 m!646631))

(declare-fun m!646633 () Bool)

(assert (=> b!682445 m!646633))

(declare-fun m!646635 () Bool)

(assert (=> b!682450 m!646635))

(declare-fun m!646637 () Bool)

(assert (=> b!682448 m!646637))

(check-sat (not b!682442) (not b!682436) (not start!60860) (not b!682440) (not b!682441) (not b!682448) (not b!682450) (not b!682438) (not b!682452) (not b!682444) (not b!682445) (not b!682447) (not b!682451))
(check-sat)
