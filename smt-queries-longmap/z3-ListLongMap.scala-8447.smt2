; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102818 () Bool)

(assert start!102818)

(declare-fun b!1235741 () Bool)

(declare-fun res!823825 () Bool)

(declare-fun e!700566 () Bool)

(assert (=> b!1235741 (=> (not res!823825) (not e!700566))))

(declare-datatypes ((List!27212 0))(
  ( (Nil!27209) (Cons!27208 (h!28417 (_ BitVec 64)) (t!40675 List!27212)) )
))
(declare-fun acc!846 () List!27212)

(declare-fun contains!7274 (List!27212 (_ BitVec 64)) Bool)

(assert (=> b!1235741 (= res!823825 (not (contains!7274 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235742 () Bool)

(declare-fun res!823823 () Bool)

(assert (=> b!1235742 (=> (not res!823823) (not e!700566))))

(assert (=> b!1235742 (= res!823823 (not (contains!7274 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235743 () Bool)

(declare-datatypes ((Unit!40961 0))(
  ( (Unit!40962) )
))
(declare-fun e!700569 () Unit!40961)

(declare-fun lt!560477 () Unit!40961)

(assert (=> b!1235743 (= e!700569 lt!560477)))

(declare-fun lt!560476 () List!27212)

(declare-datatypes ((array!79663 0))(
  ( (array!79664 (arr!38439 (Array (_ BitVec 32) (_ BitVec 64))) (size!38975 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79663)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1235743 (= lt!560476 (Cons!27208 (select (arr!38439 a!3835) from!3213) acc!846))))

(declare-fun lt!560474 () Unit!40961)

(declare-fun lemmaListSubSeqRefl!0 (List!27212) Unit!40961)

(assert (=> b!1235743 (= lt!560474 (lemmaListSubSeqRefl!0 lt!560476))))

(declare-fun subseq!546 (List!27212 List!27212) Bool)

(assert (=> b!1235743 (subseq!546 lt!560476 lt!560476)))

(declare-fun lt!560473 () Unit!40961)

(declare-fun subseqTail!39 (List!27212 List!27212) Unit!40961)

(assert (=> b!1235743 (= lt!560473 (subseqTail!39 lt!560476 lt!560476))))

(assert (=> b!1235743 (subseq!546 acc!846 lt!560476)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79663 List!27212 List!27212 (_ BitVec 32)) Unit!40961)

(assert (=> b!1235743 (= lt!560477 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560476 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79663 (_ BitVec 32) List!27212) Bool)

(assert (=> b!1235743 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235744 () Bool)

(declare-fun res!823821 () Bool)

(assert (=> b!1235744 (=> (not res!823821) (not e!700566))))

(declare-fun noDuplicate!1871 (List!27212) Bool)

(assert (=> b!1235744 (= res!823821 (noDuplicate!1871 acc!846))))

(declare-fun b!1235745 () Bool)

(declare-fun e!700567 () Bool)

(assert (=> b!1235745 (= e!700567 false)))

(declare-fun lt!560472 () Bool)

(assert (=> b!1235745 (= lt!560472 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun res!823822 () Bool)

(assert (=> start!102818 (=> (not res!823822) (not e!700566))))

(assert (=> start!102818 (= res!823822 (and (bvslt (size!38975 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38975 a!3835))))))

(assert (=> start!102818 e!700566))

(declare-fun array_inv!29287 (array!79663) Bool)

(assert (=> start!102818 (array_inv!29287 a!3835)))

(assert (=> start!102818 true))

(declare-fun b!1235746 () Bool)

(declare-fun res!823826 () Bool)

(assert (=> b!1235746 (=> (not res!823826) (not e!700566))))

(assert (=> b!1235746 (= res!823826 (not (= from!3213 (bvsub (size!38975 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235747 () Bool)

(declare-fun res!823828 () Bool)

(assert (=> b!1235747 (=> (not res!823828) (not e!700566))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235747 (= res!823828 (contains!7274 acc!846 k0!2925))))

(declare-fun b!1235748 () Bool)

(declare-fun res!823824 () Bool)

(assert (=> b!1235748 (=> (not res!823824) (not e!700566))))

(assert (=> b!1235748 (= res!823824 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235749 () Bool)

(declare-fun Unit!40963 () Unit!40961)

(assert (=> b!1235749 (= e!700569 Unit!40963)))

(declare-fun b!1235750 () Bool)

(assert (=> b!1235750 (= e!700566 e!700567)))

(declare-fun res!823827 () Bool)

(assert (=> b!1235750 (=> (not res!823827) (not e!700567))))

(assert (=> b!1235750 (= res!823827 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38975 a!3835))))))

(declare-fun lt!560475 () Unit!40961)

(assert (=> b!1235750 (= lt!560475 e!700569)))

(declare-fun c!120820 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235750 (= c!120820 (validKeyInArray!0 (select (arr!38439 a!3835) from!3213)))))

(assert (= (and start!102818 res!823822) b!1235744))

(assert (= (and b!1235744 res!823821) b!1235742))

(assert (= (and b!1235742 res!823823) b!1235741))

(assert (= (and b!1235741 res!823825) b!1235748))

(assert (= (and b!1235748 res!823824) b!1235747))

(assert (= (and b!1235747 res!823828) b!1235746))

(assert (= (and b!1235746 res!823826) b!1235750))

(assert (= (and b!1235750 c!120820) b!1235743))

(assert (= (and b!1235750 (not c!120820)) b!1235749))

(assert (= (and b!1235750 res!823827) b!1235745))

(declare-fun m!1139603 () Bool)

(assert (=> b!1235750 m!1139603))

(assert (=> b!1235750 m!1139603))

(declare-fun m!1139605 () Bool)

(assert (=> b!1235750 m!1139605))

(declare-fun m!1139607 () Bool)

(assert (=> b!1235745 m!1139607))

(declare-fun m!1139609 () Bool)

(assert (=> start!102818 m!1139609))

(declare-fun m!1139611 () Bool)

(assert (=> b!1235748 m!1139611))

(declare-fun m!1139613 () Bool)

(assert (=> b!1235742 m!1139613))

(declare-fun m!1139615 () Bool)

(assert (=> b!1235747 m!1139615))

(declare-fun m!1139617 () Bool)

(assert (=> b!1235743 m!1139617))

(declare-fun m!1139619 () Bool)

(assert (=> b!1235743 m!1139619))

(declare-fun m!1139621 () Bool)

(assert (=> b!1235743 m!1139621))

(declare-fun m!1139623 () Bool)

(assert (=> b!1235743 m!1139623))

(declare-fun m!1139625 () Bool)

(assert (=> b!1235743 m!1139625))

(assert (=> b!1235743 m!1139607))

(assert (=> b!1235743 m!1139603))

(declare-fun m!1139627 () Bool)

(assert (=> b!1235744 m!1139627))

(declare-fun m!1139629 () Bool)

(assert (=> b!1235741 m!1139629))

(check-sat (not start!102818) (not b!1235747) (not b!1235750) (not b!1235748) (not b!1235743) (not b!1235741) (not b!1235742) (not b!1235744) (not b!1235745))
(check-sat)
