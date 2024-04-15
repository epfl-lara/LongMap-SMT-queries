; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102838 () Bool)

(assert start!102838)

(declare-fun b!1236015 () Bool)

(declare-fun e!700666 () Bool)

(declare-fun e!700667 () Bool)

(assert (=> b!1236015 (= e!700666 e!700667)))

(declare-fun res!824069 () Bool)

(assert (=> b!1236015 (=> (not res!824069) (not e!700667))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79606 0))(
  ( (array!79607 (arr!38411 (Array (_ BitVec 32) (_ BitVec 64))) (size!38949 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79606)

(assert (=> b!1236015 (= res!824069 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38949 a!3835))))))

(declare-datatypes ((Unit!40841 0))(
  ( (Unit!40842) )
))
(declare-fun lt!560500 () Unit!40841)

(declare-fun e!700664 () Unit!40841)

(assert (=> b!1236015 (= lt!560500 e!700664)))

(declare-fun c!120838 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236015 (= c!120838 (validKeyInArray!0 (select (arr!38411 a!3835) from!3213)))))

(declare-fun b!1236016 () Bool)

(declare-fun res!824071 () Bool)

(assert (=> b!1236016 (=> (not res!824071) (not e!700666))))

(declare-datatypes ((List!27285 0))(
  ( (Nil!27282) (Cons!27281 (h!28490 (_ BitVec 64)) (t!40739 List!27285)) )
))
(declare-fun acc!846 () List!27285)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7257 (List!27285 (_ BitVec 64)) Bool)

(assert (=> b!1236016 (= res!824071 (contains!7257 acc!846 k0!2925))))

(declare-fun b!1236017 () Bool)

(declare-fun res!824065 () Bool)

(assert (=> b!1236017 (=> (not res!824065) (not e!700666))))

(assert (=> b!1236017 (= res!824065 (not (contains!7257 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236018 () Bool)

(declare-fun res!824070 () Bool)

(assert (=> b!1236018 (=> (not res!824070) (not e!700666))))

(declare-fun arrayNoDuplicates!0 (array!79606 (_ BitVec 32) List!27285) Bool)

(assert (=> b!1236018 (= res!824070 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236019 () Bool)

(declare-fun res!824066 () Bool)

(assert (=> b!1236019 (=> (not res!824066) (not e!700666))))

(assert (=> b!1236019 (= res!824066 (not (contains!7257 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236020 () Bool)

(declare-fun res!824067 () Bool)

(assert (=> b!1236020 (=> (not res!824067) (not e!700666))))

(declare-fun noDuplicate!1900 (List!27285) Bool)

(assert (=> b!1236020 (= res!824067 (noDuplicate!1900 acc!846))))

(declare-fun b!1236014 () Bool)

(declare-fun lt!560497 () Unit!40841)

(assert (=> b!1236014 (= e!700664 lt!560497)))

(declare-fun lt!560498 () List!27285)

(assert (=> b!1236014 (= lt!560498 (Cons!27281 (select (arr!38411 a!3835) from!3213) acc!846))))

(declare-fun lt!560496 () Unit!40841)

(declare-fun lemmaListSubSeqRefl!0 (List!27285) Unit!40841)

(assert (=> b!1236014 (= lt!560496 (lemmaListSubSeqRefl!0 lt!560498))))

(declare-fun subseq!557 (List!27285 List!27285) Bool)

(assert (=> b!1236014 (subseq!557 lt!560498 lt!560498)))

(declare-fun lt!560499 () Unit!40841)

(declare-fun subseqTail!50 (List!27285 List!27285) Unit!40841)

(assert (=> b!1236014 (= lt!560499 (subseqTail!50 lt!560498 lt!560498))))

(assert (=> b!1236014 (subseq!557 acc!846 lt!560498)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79606 List!27285 List!27285 (_ BitVec 32)) Unit!40841)

(assert (=> b!1236014 (= lt!560497 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560498 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1236014 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!824072 () Bool)

(assert (=> start!102838 (=> (not res!824072) (not e!700666))))

(assert (=> start!102838 (= res!824072 (and (bvslt (size!38949 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38949 a!3835))))))

(assert (=> start!102838 e!700666))

(declare-fun array_inv!29394 (array!79606) Bool)

(assert (=> start!102838 (array_inv!29394 a!3835)))

(assert (=> start!102838 true))

(declare-fun b!1236021 () Bool)

(declare-fun Unit!40843 () Unit!40841)

(assert (=> b!1236021 (= e!700664 Unit!40843)))

(declare-fun b!1236022 () Bool)

(declare-fun res!824068 () Bool)

(assert (=> b!1236022 (=> (not res!824068) (not e!700666))))

(assert (=> b!1236022 (= res!824068 (not (= from!3213 (bvsub (size!38949 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236023 () Bool)

(assert (=> b!1236023 (= e!700667 (not true))))

(declare-fun arrayContainsKey!0 (array!79606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236023 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560501 () Unit!40841)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79606 (_ BitVec 32) (_ BitVec 64) List!27285) Unit!40841)

(assert (=> b!1236023 (= lt!560501 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1236024 () Bool)

(declare-fun res!824064 () Bool)

(assert (=> b!1236024 (=> (not res!824064) (not e!700667))))

(assert (=> b!1236024 (= res!824064 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(assert (= (and start!102838 res!824072) b!1236020))

(assert (= (and b!1236020 res!824067) b!1236019))

(assert (= (and b!1236019 res!824066) b!1236017))

(assert (= (and b!1236017 res!824065) b!1236018))

(assert (= (and b!1236018 res!824070) b!1236016))

(assert (= (and b!1236016 res!824071) b!1236022))

(assert (= (and b!1236022 res!824068) b!1236015))

(assert (= (and b!1236015 c!120838) b!1236014))

(assert (= (and b!1236015 (not c!120838)) b!1236021))

(assert (= (and b!1236015 res!824069) b!1236024))

(assert (= (and b!1236024 res!824064) b!1236023))

(declare-fun m!1139427 () Bool)

(assert (=> b!1236017 m!1139427))

(declare-fun m!1139429 () Bool)

(assert (=> b!1236018 m!1139429))

(declare-fun m!1139431 () Bool)

(assert (=> start!102838 m!1139431))

(declare-fun m!1139433 () Bool)

(assert (=> b!1236014 m!1139433))

(declare-fun m!1139435 () Bool)

(assert (=> b!1236014 m!1139435))

(declare-fun m!1139437 () Bool)

(assert (=> b!1236014 m!1139437))

(declare-fun m!1139439 () Bool)

(assert (=> b!1236014 m!1139439))

(declare-fun m!1139441 () Bool)

(assert (=> b!1236014 m!1139441))

(declare-fun m!1139443 () Bool)

(assert (=> b!1236014 m!1139443))

(declare-fun m!1139445 () Bool)

(assert (=> b!1236014 m!1139445))

(declare-fun m!1139447 () Bool)

(assert (=> b!1236019 m!1139447))

(declare-fun m!1139449 () Bool)

(assert (=> b!1236023 m!1139449))

(declare-fun m!1139451 () Bool)

(assert (=> b!1236023 m!1139451))

(declare-fun m!1139453 () Bool)

(assert (=> b!1236020 m!1139453))

(assert (=> b!1236015 m!1139445))

(assert (=> b!1236015 m!1139445))

(declare-fun m!1139455 () Bool)

(assert (=> b!1236015 m!1139455))

(declare-fun m!1139457 () Bool)

(assert (=> b!1236016 m!1139457))

(assert (=> b!1236024 m!1139443))

(check-sat (not b!1236015) (not b!1236020) (not b!1236018) (not start!102838) (not b!1236023) (not b!1236017) (not b!1236014) (not b!1236024) (not b!1236019) (not b!1236016))
(check-sat)
