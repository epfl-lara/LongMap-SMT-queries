; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103084 () Bool)

(assert start!103084)

(declare-fun b!1237505 () Bool)

(declare-fun res!824713 () Bool)

(declare-fun e!701597 () Bool)

(assert (=> b!1237505 (=> (not res!824713) (not e!701597))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79727 0))(
  ( (array!79728 (arr!38465 (Array (_ BitVec 32) (_ BitVec 64))) (size!39002 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79727)

(assert (=> b!1237505 (= res!824713 (not (= from!3213 (bvsub (size!39002 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237506 () Bool)

(declare-datatypes ((Unit!40976 0))(
  ( (Unit!40977) )
))
(declare-fun e!701598 () Unit!40976)

(declare-fun lt!561212 () Unit!40976)

(assert (=> b!1237506 (= e!701598 lt!561212)))

(declare-datatypes ((List!27251 0))(
  ( (Nil!27248) (Cons!27247 (h!28465 (_ BitVec 64)) (t!40706 List!27251)) )
))
(declare-fun acc!846 () List!27251)

(declare-fun lt!561210 () List!27251)

(assert (=> b!1237506 (= lt!561210 (Cons!27247 (select (arr!38465 a!3835) from!3213) acc!846))))

(declare-fun lt!561214 () Unit!40976)

(declare-fun lemmaListSubSeqRefl!0 (List!27251) Unit!40976)

(assert (=> b!1237506 (= lt!561214 (lemmaListSubSeqRefl!0 lt!561210))))

(declare-fun subseq!560 (List!27251 List!27251) Bool)

(assert (=> b!1237506 (subseq!560 lt!561210 lt!561210)))

(declare-fun lt!561211 () Unit!40976)

(declare-fun subseqTail!53 (List!27251 List!27251) Unit!40976)

(assert (=> b!1237506 (= lt!561211 (subseqTail!53 lt!561210 lt!561210))))

(assert (=> b!1237506 (subseq!560 acc!846 lt!561210)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79727 List!27251 List!27251 (_ BitVec 32)) Unit!40976)

(assert (=> b!1237506 (= lt!561212 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561210 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79727 (_ BitVec 32) List!27251) Bool)

(assert (=> b!1237506 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1237507 () Bool)

(declare-fun e!701600 () Bool)

(assert (=> b!1237507 (= e!701597 e!701600)))

(declare-fun res!824710 () Bool)

(assert (=> b!1237507 (=> (not res!824710) (not e!701600))))

(assert (=> b!1237507 (= res!824710 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39002 a!3835))))))

(declare-fun lt!561215 () Unit!40976)

(assert (=> b!1237507 (= lt!561215 e!701598)))

(declare-fun c!121265 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237507 (= c!121265 (validKeyInArray!0 (select (arr!38465 a!3835) from!3213)))))

(declare-fun b!1237508 () Bool)

(declare-fun res!824715 () Bool)

(assert (=> b!1237508 (=> (not res!824715) (not e!701597))))

(declare-fun contains!7322 (List!27251 (_ BitVec 64)) Bool)

(assert (=> b!1237508 (= res!824715 (not (contains!7322 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237509 () Bool)

(declare-fun res!824716 () Bool)

(assert (=> b!1237509 (=> (not res!824716) (not e!701597))))

(declare-fun noDuplicate!1903 (List!27251) Bool)

(assert (=> b!1237509 (= res!824716 (noDuplicate!1903 acc!846))))

(declare-fun b!1237510 () Bool)

(assert (=> b!1237510 (= e!701600 (not true))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1237510 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!561213 () Unit!40976)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79727 (_ BitVec 32) (_ BitVec 64) List!27251) Unit!40976)

(assert (=> b!1237510 (= lt!561213 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1237511 () Bool)

(declare-fun res!824711 () Bool)

(assert (=> b!1237511 (=> (not res!824711) (not e!701597))))

(assert (=> b!1237511 (= res!824711 (not (contains!7322 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824714 () Bool)

(assert (=> start!103084 (=> (not res!824714) (not e!701597))))

(assert (=> start!103084 (= res!824714 (and (bvslt (size!39002 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39002 a!3835))))))

(assert (=> start!103084 e!701597))

(declare-fun array_inv!29403 (array!79727) Bool)

(assert (=> start!103084 (array_inv!29403 a!3835)))

(assert (=> start!103084 true))

(declare-fun b!1237512 () Bool)

(declare-fun Unit!40978 () Unit!40976)

(assert (=> b!1237512 (= e!701598 Unit!40978)))

(declare-fun b!1237513 () Bool)

(declare-fun res!824717 () Bool)

(assert (=> b!1237513 (=> (not res!824717) (not e!701597))))

(assert (=> b!1237513 (= res!824717 (contains!7322 acc!846 k0!2925))))

(declare-fun b!1237514 () Bool)

(declare-fun res!824718 () Bool)

(assert (=> b!1237514 (=> (not res!824718) (not e!701600))))

(assert (=> b!1237514 (= res!824718 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1237515 () Bool)

(declare-fun res!824712 () Bool)

(assert (=> b!1237515 (=> (not res!824712) (not e!701597))))

(assert (=> b!1237515 (= res!824712 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103084 res!824714) b!1237509))

(assert (= (and b!1237509 res!824716) b!1237508))

(assert (= (and b!1237508 res!824715) b!1237511))

(assert (= (and b!1237511 res!824711) b!1237515))

(assert (= (and b!1237515 res!824712) b!1237513))

(assert (= (and b!1237513 res!824717) b!1237505))

(assert (= (and b!1237505 res!824713) b!1237507))

(assert (= (and b!1237507 c!121265) b!1237506))

(assert (= (and b!1237507 (not c!121265)) b!1237512))

(assert (= (and b!1237507 res!824710) b!1237514))

(assert (= (and b!1237514 res!824718) b!1237510))

(declare-fun m!1141667 () Bool)

(assert (=> b!1237513 m!1141667))

(declare-fun m!1141669 () Bool)

(assert (=> b!1237509 m!1141669))

(declare-fun m!1141671 () Bool)

(assert (=> b!1237510 m!1141671))

(declare-fun m!1141673 () Bool)

(assert (=> b!1237510 m!1141673))

(declare-fun m!1141675 () Bool)

(assert (=> b!1237508 m!1141675))

(declare-fun m!1141677 () Bool)

(assert (=> b!1237511 m!1141677))

(declare-fun m!1141679 () Bool)

(assert (=> start!103084 m!1141679))

(declare-fun m!1141681 () Bool)

(assert (=> b!1237506 m!1141681))

(declare-fun m!1141683 () Bool)

(assert (=> b!1237506 m!1141683))

(declare-fun m!1141685 () Bool)

(assert (=> b!1237506 m!1141685))

(declare-fun m!1141687 () Bool)

(assert (=> b!1237506 m!1141687))

(declare-fun m!1141689 () Bool)

(assert (=> b!1237506 m!1141689))

(declare-fun m!1141691 () Bool)

(assert (=> b!1237506 m!1141691))

(declare-fun m!1141693 () Bool)

(assert (=> b!1237506 m!1141693))

(assert (=> b!1237514 m!1141691))

(declare-fun m!1141695 () Bool)

(assert (=> b!1237515 m!1141695))

(assert (=> b!1237507 m!1141693))

(assert (=> b!1237507 m!1141693))

(declare-fun m!1141697 () Bool)

(assert (=> b!1237507 m!1141697))

(check-sat (not b!1237513) (not b!1237507) (not b!1237515) (not start!103084) (not b!1237506) (not b!1237509) (not b!1237508) (not b!1237514) (not b!1237511) (not b!1237510))
(check-sat)
