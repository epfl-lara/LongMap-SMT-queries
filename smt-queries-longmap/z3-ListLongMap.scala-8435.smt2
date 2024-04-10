; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102746 () Bool)

(assert start!102746)

(declare-fun b!1234527 () Bool)

(declare-fun res!822692 () Bool)

(declare-fun e!700203 () Bool)

(assert (=> b!1234527 (=> res!822692 e!700203)))

(declare-datatypes ((List!27176 0))(
  ( (Nil!27173) (Cons!27172 (h!28381 (_ BitVec 64)) (t!40639 List!27176)) )
))
(declare-fun lt!559894 () List!27176)

(declare-fun contains!7238 (List!27176 (_ BitVec 64)) Bool)

(assert (=> b!1234527 (= res!822692 (contains!7238 lt!559894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234528 () Bool)

(declare-fun res!822689 () Bool)

(declare-fun e!700202 () Bool)

(assert (=> b!1234528 (=> (not res!822689) (not e!700202))))

(declare-datatypes ((array!79591 0))(
  ( (array!79592 (arr!38403 (Array (_ BitVec 32) (_ BitVec 64))) (size!38939 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79591)

(declare-fun acc!846 () List!27176)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79591 (_ BitVec 32) List!27176) Bool)

(assert (=> b!1234528 (= res!822689 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234529 () Bool)

(declare-fun res!822696 () Bool)

(assert (=> b!1234529 (=> res!822696 e!700203)))

(assert (=> b!1234529 (= res!822696 (contains!7238 lt!559894 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234530 () Bool)

(declare-fun res!822698 () Bool)

(assert (=> b!1234530 (=> (not res!822698) (not e!700202))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1234530 (= res!822698 (contains!7238 acc!846 k0!2925))))

(declare-fun b!1234531 () Bool)

(declare-fun res!822694 () Bool)

(assert (=> b!1234531 (=> (not res!822694) (not e!700202))))

(assert (=> b!1234531 (= res!822694 (not (contains!7238 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234532 () Bool)

(declare-fun res!822693 () Bool)

(assert (=> b!1234532 (=> (not res!822693) (not e!700202))))

(declare-fun noDuplicate!1835 (List!27176) Bool)

(assert (=> b!1234532 (= res!822693 (noDuplicate!1835 acc!846))))

(declare-fun res!822690 () Bool)

(assert (=> start!102746 (=> (not res!822690) (not e!700202))))

(assert (=> start!102746 (= res!822690 (and (bvslt (size!38939 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38939 a!3835))))))

(assert (=> start!102746 e!700202))

(declare-fun array_inv!29251 (array!79591) Bool)

(assert (=> start!102746 (array_inv!29251 a!3835)))

(assert (=> start!102746 true))

(declare-fun b!1234533 () Bool)

(declare-fun res!822699 () Bool)

(assert (=> b!1234533 (=> (not res!822699) (not e!700202))))

(assert (=> b!1234533 (= res!822699 (not (= from!3213 (bvsub (size!38939 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234534 () Bool)

(assert (=> b!1234534 (= e!700203 true)))

(declare-fun lt!559895 () Bool)

(assert (=> b!1234534 (= lt!559895 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559894))))

(declare-datatypes ((Unit!40876 0))(
  ( (Unit!40877) )
))
(declare-fun lt!559892 () Unit!40876)

(declare-fun noDuplicateSubseq!57 (List!27176 List!27176) Unit!40876)

(assert (=> b!1234534 (= lt!559892 (noDuplicateSubseq!57 acc!846 lt!559894))))

(declare-fun b!1234535 () Bool)

(declare-fun res!822697 () Bool)

(assert (=> b!1234535 (=> res!822697 e!700203)))

(assert (=> b!1234535 (= res!822697 (not (noDuplicate!1835 lt!559894)))))

(declare-fun b!1234536 () Bool)

(assert (=> b!1234536 (= e!700202 (not e!700203))))

(declare-fun res!822700 () Bool)

(assert (=> b!1234536 (=> res!822700 e!700203)))

(assert (=> b!1234536 (= res!822700 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!510 (List!27176 List!27176) Bool)

(assert (=> b!1234536 (subseq!510 acc!846 lt!559894)))

(declare-fun lt!559891 () Unit!40876)

(declare-fun subseqTail!3 (List!27176 List!27176) Unit!40876)

(assert (=> b!1234536 (= lt!559891 (subseqTail!3 lt!559894 lt!559894))))

(assert (=> b!1234536 (subseq!510 lt!559894 lt!559894)))

(declare-fun lt!559893 () Unit!40876)

(declare-fun lemmaListSubSeqRefl!0 (List!27176) Unit!40876)

(assert (=> b!1234536 (= lt!559893 (lemmaListSubSeqRefl!0 lt!559894))))

(assert (=> b!1234536 (= lt!559894 (Cons!27172 (select (arr!38403 a!3835) from!3213) acc!846))))

(declare-fun b!1234537 () Bool)

(declare-fun res!822695 () Bool)

(assert (=> b!1234537 (=> (not res!822695) (not e!700202))))

(assert (=> b!1234537 (= res!822695 (not (contains!7238 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234538 () Bool)

(declare-fun res!822691 () Bool)

(assert (=> b!1234538 (=> (not res!822691) (not e!700202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234538 (= res!822691 (validKeyInArray!0 (select (arr!38403 a!3835) from!3213)))))

(assert (= (and start!102746 res!822690) b!1234532))

(assert (= (and b!1234532 res!822693) b!1234537))

(assert (= (and b!1234537 res!822695) b!1234531))

(assert (= (and b!1234531 res!822694) b!1234528))

(assert (= (and b!1234528 res!822689) b!1234530))

(assert (= (and b!1234530 res!822698) b!1234533))

(assert (= (and b!1234533 res!822699) b!1234538))

(assert (= (and b!1234538 res!822691) b!1234536))

(assert (= (and b!1234536 (not res!822700)) b!1234535))

(assert (= (and b!1234535 (not res!822697)) b!1234527))

(assert (= (and b!1234527 (not res!822692)) b!1234529))

(assert (= (and b!1234529 (not res!822696)) b!1234534))

(declare-fun m!1138457 () Bool)

(assert (=> b!1234538 m!1138457))

(assert (=> b!1234538 m!1138457))

(declare-fun m!1138459 () Bool)

(assert (=> b!1234538 m!1138459))

(declare-fun m!1138461 () Bool)

(assert (=> start!102746 m!1138461))

(declare-fun m!1138463 () Bool)

(assert (=> b!1234528 m!1138463))

(declare-fun m!1138465 () Bool)

(assert (=> b!1234536 m!1138465))

(declare-fun m!1138467 () Bool)

(assert (=> b!1234536 m!1138467))

(declare-fun m!1138469 () Bool)

(assert (=> b!1234536 m!1138469))

(declare-fun m!1138471 () Bool)

(assert (=> b!1234536 m!1138471))

(assert (=> b!1234536 m!1138457))

(declare-fun m!1138473 () Bool)

(assert (=> b!1234527 m!1138473))

(declare-fun m!1138475 () Bool)

(assert (=> b!1234531 m!1138475))

(declare-fun m!1138477 () Bool)

(assert (=> b!1234535 m!1138477))

(declare-fun m!1138479 () Bool)

(assert (=> b!1234532 m!1138479))

(declare-fun m!1138481 () Bool)

(assert (=> b!1234529 m!1138481))

(declare-fun m!1138483 () Bool)

(assert (=> b!1234530 m!1138483))

(declare-fun m!1138485 () Bool)

(assert (=> b!1234534 m!1138485))

(declare-fun m!1138487 () Bool)

(assert (=> b!1234534 m!1138487))

(declare-fun m!1138489 () Bool)

(assert (=> b!1234537 m!1138489))

(check-sat (not b!1234536) (not b!1234531) (not b!1234538) (not start!102746) (not b!1234528) (not b!1234532) (not b!1234535) (not b!1234527) (not b!1234534) (not b!1234537) (not b!1234529) (not b!1234530))
(check-sat)
