; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102820 () Bool)

(assert start!102820)

(declare-fun b!1235733 () Bool)

(declare-fun res!823843 () Bool)

(declare-fun e!700556 () Bool)

(assert (=> b!1235733 (=> (not res!823843) (not e!700556))))

(declare-datatypes ((array!79588 0))(
  ( (array!79589 (arr!38402 (Array (_ BitVec 32) (_ BitVec 64))) (size!38940 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79588)

(declare-datatypes ((List!27276 0))(
  ( (Nil!27273) (Cons!27272 (h!28481 (_ BitVec 64)) (t!40730 List!27276)) )
))
(declare-fun acc!846 () List!27276)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79588 (_ BitVec 32) List!27276) Bool)

(assert (=> b!1235733 (= res!823843 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235734 () Bool)

(declare-fun e!700558 () Bool)

(assert (=> b!1235734 (= e!700556 e!700558)))

(declare-fun res!823837 () Bool)

(assert (=> b!1235734 (=> (not res!823837) (not e!700558))))

(assert (=> b!1235734 (= res!823837 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38940 a!3835))))))

(declare-datatypes ((Unit!40814 0))(
  ( (Unit!40815) )
))
(declare-fun lt!560338 () Unit!40814)

(declare-fun e!700557 () Unit!40814)

(assert (=> b!1235734 (= lt!560338 e!700557)))

(declare-fun c!120811 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235734 (= c!120811 (validKeyInArray!0 (select (arr!38402 a!3835) from!3213)))))

(declare-fun b!1235735 () Bool)

(declare-fun lt!560337 () Unit!40814)

(assert (=> b!1235735 (= e!700557 lt!560337)))

(declare-fun lt!560335 () List!27276)

(assert (=> b!1235735 (= lt!560335 (Cons!27272 (select (arr!38402 a!3835) from!3213) acc!846))))

(declare-fun lt!560339 () Unit!40814)

(declare-fun lemmaListSubSeqRefl!0 (List!27276) Unit!40814)

(assert (=> b!1235735 (= lt!560339 (lemmaListSubSeqRefl!0 lt!560335))))

(declare-fun subseq!548 (List!27276 List!27276) Bool)

(assert (=> b!1235735 (subseq!548 lt!560335 lt!560335)))

(declare-fun lt!560334 () Unit!40814)

(declare-fun subseqTail!41 (List!27276 List!27276) Unit!40814)

(assert (=> b!1235735 (= lt!560334 (subseqTail!41 lt!560335 lt!560335))))

(assert (=> b!1235735 (subseq!548 acc!846 lt!560335)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79588 List!27276 List!27276 (_ BitVec 32)) Unit!40814)

(assert (=> b!1235735 (= lt!560337 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560335 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235735 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235736 () Bool)

(declare-fun res!823839 () Bool)

(assert (=> b!1235736 (=> (not res!823839) (not e!700556))))

(declare-fun noDuplicate!1891 (List!27276) Bool)

(assert (=> b!1235736 (= res!823839 (noDuplicate!1891 acc!846))))

(declare-fun b!1235737 () Bool)

(declare-fun res!823841 () Bool)

(assert (=> b!1235737 (=> (not res!823841) (not e!700556))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7248 (List!27276 (_ BitVec 64)) Bool)

(assert (=> b!1235737 (= res!823841 (contains!7248 acc!846 k0!2925))))

(declare-fun b!1235738 () Bool)

(declare-fun Unit!40816 () Unit!40814)

(assert (=> b!1235738 (= e!700557 Unit!40816)))

(declare-fun b!1235739 () Bool)

(assert (=> b!1235739 (= e!700558 false)))

(declare-fun lt!560336 () Bool)

(assert (=> b!1235739 (= lt!560336 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235740 () Bool)

(declare-fun res!823840 () Bool)

(assert (=> b!1235740 (=> (not res!823840) (not e!700556))))

(assert (=> b!1235740 (= res!823840 (not (= from!3213 (bvsub (size!38940 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!823838 () Bool)

(assert (=> start!102820 (=> (not res!823838) (not e!700556))))

(assert (=> start!102820 (= res!823838 (and (bvslt (size!38940 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38940 a!3835))))))

(assert (=> start!102820 e!700556))

(declare-fun array_inv!29385 (array!79588) Bool)

(assert (=> start!102820 (array_inv!29385 a!3835)))

(assert (=> start!102820 true))

(declare-fun b!1235741 () Bool)

(declare-fun res!823842 () Bool)

(assert (=> b!1235741 (=> (not res!823842) (not e!700556))))

(assert (=> b!1235741 (= res!823842 (not (contains!7248 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235742 () Bool)

(declare-fun res!823844 () Bool)

(assert (=> b!1235742 (=> (not res!823844) (not e!700556))))

(assert (=> b!1235742 (= res!823844 (not (contains!7248 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102820 res!823838) b!1235736))

(assert (= (and b!1235736 res!823839) b!1235741))

(assert (= (and b!1235741 res!823842) b!1235742))

(assert (= (and b!1235742 res!823844) b!1235733))

(assert (= (and b!1235733 res!823843) b!1235737))

(assert (= (and b!1235737 res!823841) b!1235740))

(assert (= (and b!1235740 res!823840) b!1235734))

(assert (= (and b!1235734 c!120811) b!1235735))

(assert (= (and b!1235734 (not c!120811)) b!1235738))

(assert (= (and b!1235734 res!823837) b!1235739))

(declare-fun m!1139163 () Bool)

(assert (=> b!1235736 m!1139163))

(declare-fun m!1139165 () Bool)

(assert (=> start!102820 m!1139165))

(declare-fun m!1139167 () Bool)

(assert (=> b!1235739 m!1139167))

(declare-fun m!1139169 () Bool)

(assert (=> b!1235734 m!1139169))

(assert (=> b!1235734 m!1139169))

(declare-fun m!1139171 () Bool)

(assert (=> b!1235734 m!1139171))

(declare-fun m!1139173 () Bool)

(assert (=> b!1235737 m!1139173))

(declare-fun m!1139175 () Bool)

(assert (=> b!1235735 m!1139175))

(declare-fun m!1139177 () Bool)

(assert (=> b!1235735 m!1139177))

(declare-fun m!1139179 () Bool)

(assert (=> b!1235735 m!1139179))

(declare-fun m!1139181 () Bool)

(assert (=> b!1235735 m!1139181))

(declare-fun m!1139183 () Bool)

(assert (=> b!1235735 m!1139183))

(assert (=> b!1235735 m!1139167))

(assert (=> b!1235735 m!1139169))

(declare-fun m!1139185 () Bool)

(assert (=> b!1235742 m!1139185))

(declare-fun m!1139187 () Bool)

(assert (=> b!1235741 m!1139187))

(declare-fun m!1139189 () Bool)

(assert (=> b!1235733 m!1139189))

(check-sat (not b!1235735) (not b!1235737) (not b!1235733) (not b!1235741) (not start!102820) (not b!1235742) (not b!1235736) (not b!1235734) (not b!1235739))
(check-sat)
