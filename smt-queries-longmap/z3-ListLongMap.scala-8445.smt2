; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102802 () Bool)

(assert start!102802)

(declare-fun b!1235463 () Bool)

(declare-fun res!823623 () Bool)

(declare-fun e!700451 () Bool)

(assert (=> b!1235463 (=> (not res!823623) (not e!700451))))

(declare-datatypes ((List!27267 0))(
  ( (Nil!27264) (Cons!27263 (h!28472 (_ BitVec 64)) (t!40721 List!27267)) )
))
(declare-fun acc!846 () List!27267)

(declare-fun contains!7239 (List!27267 (_ BitVec 64)) Bool)

(assert (=> b!1235463 (= res!823623 (not (contains!7239 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235464 () Bool)

(declare-fun res!823624 () Bool)

(assert (=> b!1235464 (=> (not res!823624) (not e!700451))))

(declare-datatypes ((array!79570 0))(
  ( (array!79571 (arr!38393 (Array (_ BitVec 32) (_ BitVec 64))) (size!38931 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79570)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79570 (_ BitVec 32) List!27267) Bool)

(assert (=> b!1235464 (= res!823624 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235465 () Bool)

(declare-fun res!823627 () Bool)

(assert (=> b!1235465 (=> (not res!823627) (not e!700451))))

(declare-fun noDuplicate!1882 (List!27267) Bool)

(assert (=> b!1235465 (= res!823627 (noDuplicate!1882 acc!846))))

(declare-fun res!823621 () Bool)

(assert (=> start!102802 (=> (not res!823621) (not e!700451))))

(assert (=> start!102802 (= res!823621 (and (bvslt (size!38931 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38931 a!3835))))))

(assert (=> start!102802 e!700451))

(declare-fun array_inv!29376 (array!79570) Bool)

(assert (=> start!102802 (array_inv!29376 a!3835)))

(assert (=> start!102802 true))

(declare-fun b!1235466 () Bool)

(declare-fun e!700449 () Bool)

(assert (=> b!1235466 (= e!700451 e!700449)))

(declare-fun res!823622 () Bool)

(assert (=> b!1235466 (=> (not res!823622) (not e!700449))))

(assert (=> b!1235466 (= res!823622 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38931 a!3835))))))

(declare-datatypes ((Unit!40787 0))(
  ( (Unit!40788) )
))
(declare-fun lt!560176 () Unit!40787)

(declare-fun e!700450 () Unit!40787)

(assert (=> b!1235466 (= lt!560176 e!700450)))

(declare-fun c!120784 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235466 (= c!120784 (validKeyInArray!0 (select (arr!38393 a!3835) from!3213)))))

(declare-fun b!1235467 () Bool)

(assert (=> b!1235467 (= e!700449 false)))

(declare-fun lt!560173 () Bool)

(assert (=> b!1235467 (= lt!560173 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235468 () Bool)

(declare-fun lt!560172 () Unit!40787)

(assert (=> b!1235468 (= e!700450 lt!560172)))

(declare-fun lt!560175 () List!27267)

(assert (=> b!1235468 (= lt!560175 (Cons!27263 (select (arr!38393 a!3835) from!3213) acc!846))))

(declare-fun lt!560177 () Unit!40787)

(declare-fun lemmaListSubSeqRefl!0 (List!27267) Unit!40787)

(assert (=> b!1235468 (= lt!560177 (lemmaListSubSeqRefl!0 lt!560175))))

(declare-fun subseq!539 (List!27267 List!27267) Bool)

(assert (=> b!1235468 (subseq!539 lt!560175 lt!560175)))

(declare-fun lt!560174 () Unit!40787)

(declare-fun subseqTail!32 (List!27267 List!27267) Unit!40787)

(assert (=> b!1235468 (= lt!560174 (subseqTail!32 lt!560175 lt!560175))))

(assert (=> b!1235468 (subseq!539 acc!846 lt!560175)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79570 List!27267 List!27267 (_ BitVec 32)) Unit!40787)

(assert (=> b!1235468 (= lt!560172 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560175 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235468 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235469 () Bool)

(declare-fun Unit!40789 () Unit!40787)

(assert (=> b!1235469 (= e!700450 Unit!40789)))

(declare-fun b!1235470 () Bool)

(declare-fun res!823626 () Bool)

(assert (=> b!1235470 (=> (not res!823626) (not e!700451))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235470 (= res!823626 (contains!7239 acc!846 k0!2925))))

(declare-fun b!1235471 () Bool)

(declare-fun res!823628 () Bool)

(assert (=> b!1235471 (=> (not res!823628) (not e!700451))))

(assert (=> b!1235471 (= res!823628 (not (contains!7239 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235472 () Bool)

(declare-fun res!823625 () Bool)

(assert (=> b!1235472 (=> (not res!823625) (not e!700451))))

(assert (=> b!1235472 (= res!823625 (not (= from!3213 (bvsub (size!38931 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!102802 res!823621) b!1235465))

(assert (= (and b!1235465 res!823627) b!1235463))

(assert (= (and b!1235463 res!823623) b!1235471))

(assert (= (and b!1235471 res!823628) b!1235464))

(assert (= (and b!1235464 res!823624) b!1235470))

(assert (= (and b!1235470 res!823626) b!1235472))

(assert (= (and b!1235472 res!823625) b!1235466))

(assert (= (and b!1235466 c!120784) b!1235468))

(assert (= (and b!1235466 (not c!120784)) b!1235469))

(assert (= (and b!1235466 res!823622) b!1235467))

(declare-fun m!1138911 () Bool)

(assert (=> b!1235468 m!1138911))

(declare-fun m!1138913 () Bool)

(assert (=> b!1235468 m!1138913))

(declare-fun m!1138915 () Bool)

(assert (=> b!1235468 m!1138915))

(declare-fun m!1138917 () Bool)

(assert (=> b!1235468 m!1138917))

(declare-fun m!1138919 () Bool)

(assert (=> b!1235468 m!1138919))

(declare-fun m!1138921 () Bool)

(assert (=> b!1235468 m!1138921))

(declare-fun m!1138923 () Bool)

(assert (=> b!1235468 m!1138923))

(declare-fun m!1138925 () Bool)

(assert (=> b!1235464 m!1138925))

(declare-fun m!1138927 () Bool)

(assert (=> b!1235465 m!1138927))

(assert (=> b!1235467 m!1138917))

(assert (=> b!1235466 m!1138919))

(assert (=> b!1235466 m!1138919))

(declare-fun m!1138929 () Bool)

(assert (=> b!1235466 m!1138929))

(declare-fun m!1138931 () Bool)

(assert (=> b!1235471 m!1138931))

(declare-fun m!1138933 () Bool)

(assert (=> b!1235463 m!1138933))

(declare-fun m!1138935 () Bool)

(assert (=> start!102802 m!1138935))

(declare-fun m!1138937 () Bool)

(assert (=> b!1235470 m!1138937))

(check-sat (not b!1235464) (not b!1235468) (not b!1235465) (not b!1235466) (not b!1235467) (not start!102802) (not b!1235470) (not b!1235471) (not b!1235463))
(check-sat)
