; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116122 () Bool)

(assert start!116122)

(declare-fun b!1371574 () Bool)

(declare-fun res!914986 () Bool)

(declare-fun e!777009 () Bool)

(assert (=> b!1371574 (=> (not res!914986) (not e!777009))))

(declare-datatypes ((List!32060 0))(
  ( (Nil!32057) (Cons!32056 (h!33265 (_ BitVec 64)) (t!46746 List!32060)) )
))
(declare-fun acc!866 () List!32060)

(declare-fun contains!9653 (List!32060 (_ BitVec 64)) Bool)

(assert (=> b!1371574 (= res!914986 (not (contains!9653 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371575 () Bool)

(declare-fun res!914999 () Bool)

(declare-fun e!777012 () Bool)

(assert (=> b!1371575 (=> (not res!914999) (not e!777012))))

(declare-fun lt!602508 () List!32060)

(assert (=> b!1371575 (= res!914999 (not (contains!9653 lt!602508 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371576 () Bool)

(declare-fun res!914982 () Bool)

(declare-fun e!777010 () Bool)

(assert (=> b!1371576 (=> (not res!914982) (not e!777010))))

(declare-datatypes ((array!93000 0))(
  ( (array!93001 (arr!44914 (Array (_ BitVec 32) (_ BitVec 64))) (size!45466 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93000)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1371576 (= res!914982 (not (contains!9653 acc!866 (select (arr!44914 a!3861) from!3239))))))

(declare-fun b!1371577 () Bool)

(declare-fun res!914998 () Bool)

(assert (=> b!1371577 (=> (not res!914998) (not e!777012))))

(declare-fun lt!602509 () List!32060)

(declare-fun subseq!1091 (List!32060 List!32060) Bool)

(assert (=> b!1371577 (= res!914998 (subseq!1091 lt!602508 lt!602509))))

(declare-fun b!1371578 () Bool)

(declare-fun res!914992 () Bool)

(assert (=> b!1371578 (=> (not res!914992) (not e!777009))))

(declare-fun newAcc!98 () List!32060)

(assert (=> b!1371578 (= res!914992 (not (contains!9653 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371579 () Bool)

(declare-fun res!914989 () Bool)

(assert (=> b!1371579 (=> (not res!914989) (not e!777009))))

(assert (=> b!1371579 (= res!914989 (subseq!1091 newAcc!98 acc!866))))

(declare-fun b!1371580 () Bool)

(declare-fun e!777008 () Bool)

(assert (=> b!1371580 (= e!777012 e!777008)))

(declare-fun res!914984 () Bool)

(assert (=> b!1371580 (=> (not res!914984) (not e!777008))))

(declare-fun arrayNoDuplicates!0 (array!93000 (_ BitVec 32) List!32060) Bool)

(assert (=> b!1371580 (= res!914984 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602509))))

(declare-datatypes ((Unit!45156 0))(
  ( (Unit!45157) )
))
(declare-fun lt!602511 () Unit!45156)

(declare-fun noDuplicateSubseq!278 (List!32060 List!32060) Unit!45156)

(assert (=> b!1371580 (= lt!602511 (noDuplicateSubseq!278 lt!602508 lt!602509))))

(declare-fun b!1371581 () Bool)

(declare-fun res!914985 () Bool)

(assert (=> b!1371581 (=> (not res!914985) (not e!777010))))

(assert (=> b!1371581 (= res!914985 (bvslt from!3239 (size!45466 a!3861)))))

(declare-fun b!1371582 () Bool)

(assert (=> b!1371582 (= e!777010 e!777012)))

(declare-fun res!914991 () Bool)

(assert (=> b!1371582 (=> (not res!914991) (not e!777012))))

(assert (=> b!1371582 (= res!914991 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1371582 (= lt!602508 (Cons!32056 (select (arr!44914 a!3861) from!3239) newAcc!98))))

(assert (=> b!1371582 (= lt!602509 (Cons!32056 (select (arr!44914 a!3861) from!3239) acc!866))))

(declare-fun b!1371583 () Bool)

(declare-fun res!914995 () Bool)

(assert (=> b!1371583 (=> (not res!914995) (not e!777012))))

(declare-fun noDuplicate!2568 (List!32060) Bool)

(assert (=> b!1371583 (= res!914995 (noDuplicate!2568 lt!602509))))

(declare-fun b!1371584 () Bool)

(assert (=> b!1371584 (= e!777008 (bvsge (bvsub (size!45466 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45466 a!3861) from!3239)))))

(declare-fun b!1371585 () Bool)

(declare-fun res!914997 () Bool)

(assert (=> b!1371585 (=> (not res!914997) (not e!777012))))

(assert (=> b!1371585 (= res!914997 (not (contains!9653 lt!602509 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371586 () Bool)

(declare-fun res!914983 () Bool)

(assert (=> b!1371586 (=> (not res!914983) (not e!777012))))

(assert (=> b!1371586 (= res!914983 (not (contains!9653 lt!602508 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371587 () Bool)

(declare-fun res!914996 () Bool)

(assert (=> b!1371587 (=> (not res!914996) (not e!777010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371587 (= res!914996 (validKeyInArray!0 (select (arr!44914 a!3861) from!3239)))))

(declare-fun b!1371588 () Bool)

(declare-fun res!914993 () Bool)

(assert (=> b!1371588 (=> (not res!914993) (not e!777009))))

(assert (=> b!1371588 (= res!914993 (noDuplicate!2568 acc!866))))

(declare-fun res!914981 () Bool)

(assert (=> start!116122 (=> (not res!914981) (not e!777009))))

(assert (=> start!116122 (= res!914981 (and (bvslt (size!45466 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45466 a!3861))))))

(assert (=> start!116122 e!777009))

(declare-fun array_inv!34147 (array!93000) Bool)

(assert (=> start!116122 (array_inv!34147 a!3861)))

(assert (=> start!116122 true))

(declare-fun b!1371589 () Bool)

(assert (=> b!1371589 (= e!777009 e!777010)))

(declare-fun res!914994 () Bool)

(assert (=> b!1371589 (=> (not res!914994) (not e!777010))))

(assert (=> b!1371589 (= res!914994 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602510 () Unit!45156)

(assert (=> b!1371589 (= lt!602510 (noDuplicateSubseq!278 newAcc!98 acc!866))))

(declare-fun b!1371590 () Bool)

(declare-fun res!914990 () Bool)

(assert (=> b!1371590 (=> (not res!914990) (not e!777009))))

(assert (=> b!1371590 (= res!914990 (not (contains!9653 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371591 () Bool)

(declare-fun res!914987 () Bool)

(assert (=> b!1371591 (=> (not res!914987) (not e!777012))))

(assert (=> b!1371591 (= res!914987 (not (contains!9653 lt!602509 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371592 () Bool)

(declare-fun res!914988 () Bool)

(assert (=> b!1371592 (=> (not res!914988) (not e!777009))))

(assert (=> b!1371592 (= res!914988 (not (contains!9653 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116122 res!914981) b!1371588))

(assert (= (and b!1371588 res!914993) b!1371574))

(assert (= (and b!1371574 res!914986) b!1371590))

(assert (= (and b!1371590 res!914990) b!1371592))

(assert (= (and b!1371592 res!914988) b!1371578))

(assert (= (and b!1371578 res!914992) b!1371579))

(assert (= (and b!1371579 res!914989) b!1371589))

(assert (= (and b!1371589 res!914994) b!1371581))

(assert (= (and b!1371581 res!914985) b!1371587))

(assert (= (and b!1371587 res!914996) b!1371576))

(assert (= (and b!1371576 res!914982) b!1371582))

(assert (= (and b!1371582 res!914991) b!1371583))

(assert (= (and b!1371583 res!914995) b!1371585))

(assert (= (and b!1371585 res!914997) b!1371591))

(assert (= (and b!1371591 res!914987) b!1371575))

(assert (= (and b!1371575 res!914999) b!1371586))

(assert (= (and b!1371586 res!914983) b!1371577))

(assert (= (and b!1371577 res!914998) b!1371580))

(assert (= (and b!1371580 res!914984) b!1371584))

(declare-fun m!1254561 () Bool)

(assert (=> b!1371578 m!1254561))

(declare-fun m!1254563 () Bool)

(assert (=> b!1371580 m!1254563))

(declare-fun m!1254565 () Bool)

(assert (=> b!1371580 m!1254565))

(declare-fun m!1254567 () Bool)

(assert (=> b!1371591 m!1254567))

(declare-fun m!1254569 () Bool)

(assert (=> b!1371592 m!1254569))

(declare-fun m!1254571 () Bool)

(assert (=> b!1371575 m!1254571))

(declare-fun m!1254573 () Bool)

(assert (=> b!1371585 m!1254573))

(declare-fun m!1254575 () Bool)

(assert (=> b!1371574 m!1254575))

(declare-fun m!1254577 () Bool)

(assert (=> b!1371577 m!1254577))

(declare-fun m!1254579 () Bool)

(assert (=> b!1371589 m!1254579))

(declare-fun m!1254581 () Bool)

(assert (=> b!1371589 m!1254581))

(declare-fun m!1254583 () Bool)

(assert (=> b!1371576 m!1254583))

(assert (=> b!1371576 m!1254583))

(declare-fun m!1254585 () Bool)

(assert (=> b!1371576 m!1254585))

(declare-fun m!1254587 () Bool)

(assert (=> b!1371583 m!1254587))

(declare-fun m!1254589 () Bool)

(assert (=> b!1371579 m!1254589))

(assert (=> b!1371582 m!1254583))

(declare-fun m!1254591 () Bool)

(assert (=> b!1371590 m!1254591))

(declare-fun m!1254593 () Bool)

(assert (=> b!1371586 m!1254593))

(assert (=> b!1371587 m!1254583))

(assert (=> b!1371587 m!1254583))

(declare-fun m!1254595 () Bool)

(assert (=> b!1371587 m!1254595))

(declare-fun m!1254597 () Bool)

(assert (=> start!116122 m!1254597))

(declare-fun m!1254599 () Bool)

(assert (=> b!1371588 m!1254599))

(check-sat (not b!1371575) (not b!1371585) (not b!1371590) (not b!1371589) (not b!1371592) (not b!1371576) (not b!1371577) (not b!1371574) (not b!1371579) (not b!1371583) (not b!1371586) (not b!1371580) (not start!116122) (not b!1371591) (not b!1371587) (not b!1371578) (not b!1371588))
(check-sat)
