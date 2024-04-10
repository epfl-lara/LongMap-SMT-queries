; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60478 () Bool)

(assert start!60478)

(declare-fun b!679491 () Bool)

(declare-fun res!445851 () Bool)

(declare-fun e!387155 () Bool)

(assert (=> b!679491 (=> (not res!445851) (not e!387155))))

(declare-datatypes ((List!12960 0))(
  ( (Nil!12957) (Cons!12956 (h!14001 (_ BitVec 64)) (t!19188 List!12960)) )
))
(declare-fun acc!681 () List!12960)

(declare-fun contains!3537 (List!12960 (_ BitVec 64)) Bool)

(assert (=> b!679491 (= res!445851 (not (contains!3537 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679492 () Bool)

(declare-fun e!387153 () Bool)

(assert (=> b!679492 (= e!387153 true)))

(assert (=> b!679492 false))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((Unit!23798 0))(
  ( (Unit!23799) )
))
(declare-fun lt!312931 () Unit!23798)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39459 0))(
  ( (array!39460 (arr!18919 (Array (_ BitVec 32) (_ BitVec 64))) (size!19283 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39459 (_ BitVec 64) (_ BitVec 32)) Unit!23798)

(assert (=> b!679492 (= lt!312931 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(declare-fun b!679493 () Bool)

(declare-fun e!387152 () Bool)

(assert (=> b!679493 (= e!387152 (not (contains!3537 acc!681 k0!2843)))))

(declare-fun b!679494 () Bool)

(declare-fun e!387154 () Bool)

(assert (=> b!679494 (= e!387154 (contains!3537 acc!681 k0!2843))))

(declare-fun res!445865 () Bool)

(assert (=> start!60478 (=> (not res!445865) (not e!387155))))

(assert (=> start!60478 (= res!445865 (and (bvslt (size!19283 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19283 a!3626))))))

(assert (=> start!60478 e!387155))

(assert (=> start!60478 true))

(declare-fun array_inv!14715 (array!39459) Bool)

(assert (=> start!60478 (array_inv!14715 a!3626)))

(declare-fun b!679495 () Bool)

(assert (=> b!679495 (= e!387155 (not e!387153))))

(declare-fun res!445857 () Bool)

(assert (=> b!679495 (=> res!445857 e!387153)))

(declare-fun arrayContainsKey!0 (array!39459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679495 (= res!445857 (not (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679495 (arrayContainsKey!0 (array!39460 (store (arr!18919 a!3626) i!1382 k0!2843) (size!19283 a!3626)) k0!2843 from!3004)))

(declare-fun b!679496 () Bool)

(declare-fun res!445853 () Bool)

(assert (=> b!679496 (=> (not res!445853) (not e!387155))))

(declare-fun e!387151 () Bool)

(assert (=> b!679496 (= res!445853 e!387151)))

(declare-fun res!445858 () Bool)

(assert (=> b!679496 (=> res!445858 e!387151)))

(assert (=> b!679496 (= res!445858 e!387154)))

(declare-fun res!445852 () Bool)

(assert (=> b!679496 (=> (not res!445852) (not e!387154))))

(assert (=> b!679496 (= res!445852 (bvsgt from!3004 i!1382))))

(declare-fun b!679497 () Bool)

(declare-fun res!445863 () Bool)

(assert (=> b!679497 (=> (not res!445863) (not e!387155))))

(assert (=> b!679497 (= res!445863 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679498 () Bool)

(declare-fun res!445861 () Bool)

(assert (=> b!679498 (=> (not res!445861) (not e!387155))))

(declare-fun arrayNoDuplicates!0 (array!39459 (_ BitVec 32) List!12960) Bool)

(assert (=> b!679498 (= res!445861 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12957))))

(declare-fun b!679499 () Bool)

(declare-fun res!445854 () Bool)

(assert (=> b!679499 (=> (not res!445854) (not e!387155))))

(assert (=> b!679499 (= res!445854 (not (contains!3537 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679500 () Bool)

(assert (=> b!679500 (= e!387151 e!387152)))

(declare-fun res!445864 () Bool)

(assert (=> b!679500 (=> (not res!445864) (not e!387152))))

(assert (=> b!679500 (= res!445864 (bvsle from!3004 i!1382))))

(declare-fun b!679501 () Bool)

(declare-fun res!445856 () Bool)

(assert (=> b!679501 (=> (not res!445856) (not e!387155))))

(assert (=> b!679501 (= res!445856 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679502 () Bool)

(declare-fun res!445860 () Bool)

(assert (=> b!679502 (=> (not res!445860) (not e!387155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679502 (= res!445860 (validKeyInArray!0 k0!2843))))

(declare-fun b!679503 () Bool)

(declare-fun res!445862 () Bool)

(assert (=> b!679503 (=> (not res!445862) (not e!387155))))

(declare-fun noDuplicate!784 (List!12960) Bool)

(assert (=> b!679503 (= res!445862 (noDuplicate!784 acc!681))))

(declare-fun b!679504 () Bool)

(declare-fun res!445855 () Bool)

(assert (=> b!679504 (=> (not res!445855) (not e!387155))))

(assert (=> b!679504 (= res!445855 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19283 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679505 () Bool)

(declare-fun res!445859 () Bool)

(assert (=> b!679505 (=> (not res!445859) (not e!387155))))

(assert (=> b!679505 (= res!445859 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19283 a!3626))))))

(assert (= (and start!60478 res!445865) b!679503))

(assert (= (and b!679503 res!445862) b!679491))

(assert (= (and b!679491 res!445851) b!679499))

(assert (= (and b!679499 res!445854) b!679496))

(assert (= (and b!679496 res!445852) b!679494))

(assert (= (and b!679496 (not res!445858)) b!679500))

(assert (= (and b!679500 res!445864) b!679493))

(assert (= (and b!679496 res!445853) b!679498))

(assert (= (and b!679498 res!445861) b!679501))

(assert (= (and b!679501 res!445856) b!679505))

(assert (= (and b!679505 res!445859) b!679502))

(assert (= (and b!679502 res!445860) b!679497))

(assert (= (and b!679497 res!445863) b!679504))

(assert (= (and b!679504 res!445855) b!679495))

(assert (= (and b!679495 (not res!445857)) b!679492))

(declare-fun m!644887 () Bool)

(assert (=> b!679493 m!644887))

(declare-fun m!644889 () Bool)

(assert (=> b!679503 m!644889))

(declare-fun m!644891 () Bool)

(assert (=> b!679501 m!644891))

(declare-fun m!644893 () Bool)

(assert (=> b!679495 m!644893))

(declare-fun m!644895 () Bool)

(assert (=> b!679495 m!644895))

(declare-fun m!644897 () Bool)

(assert (=> b!679495 m!644897))

(declare-fun m!644899 () Bool)

(assert (=> b!679491 m!644899))

(declare-fun m!644901 () Bool)

(assert (=> b!679502 m!644901))

(declare-fun m!644903 () Bool)

(assert (=> b!679498 m!644903))

(declare-fun m!644905 () Bool)

(assert (=> start!60478 m!644905))

(declare-fun m!644907 () Bool)

(assert (=> b!679492 m!644907))

(declare-fun m!644909 () Bool)

(assert (=> b!679499 m!644909))

(declare-fun m!644911 () Bool)

(assert (=> b!679497 m!644911))

(assert (=> b!679494 m!644887))

(check-sat (not b!679503) (not b!679495) (not b!679501) (not b!679493) (not b!679492) (not b!679494) (not b!679502) (not start!60478) (not b!679499) (not b!679491) (not b!679498) (not b!679497))
