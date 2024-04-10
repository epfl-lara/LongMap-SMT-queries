; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102826 () Bool)

(assert start!102826)

(declare-fun b!1235861 () Bool)

(declare-datatypes ((Unit!40973 0))(
  ( (Unit!40974) )
))
(declare-fun e!700614 () Unit!40973)

(declare-fun lt!560545 () Unit!40973)

(assert (=> b!1235861 (= e!700614 lt!560545)))

(declare-datatypes ((List!27216 0))(
  ( (Nil!27213) (Cons!27212 (h!28421 (_ BitVec 64)) (t!40679 List!27216)) )
))
(declare-fun lt!560549 () List!27216)

(declare-datatypes ((array!79671 0))(
  ( (array!79672 (arr!38443 (Array (_ BitVec 32) (_ BitVec 64))) (size!38979 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79671)

(declare-fun acc!846 () List!27216)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1235861 (= lt!560549 (Cons!27212 (select (arr!38443 a!3835) from!3213) acc!846))))

(declare-fun lt!560547 () Unit!40973)

(declare-fun lemmaListSubSeqRefl!0 (List!27216) Unit!40973)

(assert (=> b!1235861 (= lt!560547 (lemmaListSubSeqRefl!0 lt!560549))))

(declare-fun subseq!550 (List!27216 List!27216) Bool)

(assert (=> b!1235861 (subseq!550 lt!560549 lt!560549)))

(declare-fun lt!560546 () Unit!40973)

(declare-fun subseqTail!43 (List!27216 List!27216) Unit!40973)

(assert (=> b!1235861 (= lt!560546 (subseqTail!43 lt!560549 lt!560549))))

(assert (=> b!1235861 (subseq!550 acc!846 lt!560549)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79671 List!27216 List!27216 (_ BitVec 32)) Unit!40973)

(assert (=> b!1235861 (= lt!560545 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560549 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79671 (_ BitVec 32) List!27216) Bool)

(assert (=> b!1235861 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235862 () Bool)

(declare-fun res!823924 () Bool)

(declare-fun e!700617 () Bool)

(assert (=> b!1235862 (=> (not res!823924) (not e!700617))))

(declare-fun contains!7278 (List!27216 (_ BitVec 64)) Bool)

(assert (=> b!1235862 (= res!823924 (not (contains!7278 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235863 () Bool)

(declare-fun res!823919 () Bool)

(assert (=> b!1235863 (=> (not res!823919) (not e!700617))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235863 (= res!823919 (contains!7278 acc!846 k!2925))))

(declare-fun res!823917 () Bool)

(assert (=> start!102826 (=> (not res!823917) (not e!700617))))

(assert (=> start!102826 (= res!823917 (and (bvslt (size!38979 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38979 a!3835))))))

(assert (=> start!102826 e!700617))

(declare-fun array_inv!29291 (array!79671) Bool)

(assert (=> start!102826 (array_inv!29291 a!3835)))

(assert (=> start!102826 true))

(declare-fun b!1235864 () Bool)

(declare-fun res!823923 () Bool)

(assert (=> b!1235864 (=> (not res!823923) (not e!700617))))

(declare-fun noDuplicate!1875 (List!27216) Bool)

(assert (=> b!1235864 (= res!823923 (noDuplicate!1875 acc!846))))

(declare-fun b!1235865 () Bool)

(declare-fun res!823921 () Bool)

(assert (=> b!1235865 (=> (not res!823921) (not e!700617))))

(assert (=> b!1235865 (= res!823921 (not (= from!3213 (bvsub (size!38979 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235866 () Bool)

(declare-fun Unit!40975 () Unit!40973)

(assert (=> b!1235866 (= e!700614 Unit!40975)))

(declare-fun b!1235867 () Bool)

(declare-fun e!700615 () Bool)

(assert (=> b!1235867 (= e!700615 false)))

(declare-fun lt!560544 () Bool)

(assert (=> b!1235867 (= lt!560544 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235868 () Bool)

(declare-fun res!823918 () Bool)

(assert (=> b!1235868 (=> (not res!823918) (not e!700617))))

(assert (=> b!1235868 (= res!823918 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235869 () Bool)

(assert (=> b!1235869 (= e!700617 e!700615)))

(declare-fun res!823922 () Bool)

(assert (=> b!1235869 (=> (not res!823922) (not e!700615))))

(assert (=> b!1235869 (= res!823922 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38979 a!3835))))))

(declare-fun lt!560548 () Unit!40973)

(assert (=> b!1235869 (= lt!560548 e!700614)))

(declare-fun c!120832 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235869 (= c!120832 (validKeyInArray!0 (select (arr!38443 a!3835) from!3213)))))

(declare-fun b!1235870 () Bool)

(declare-fun res!823920 () Bool)

(assert (=> b!1235870 (=> (not res!823920) (not e!700617))))

(assert (=> b!1235870 (= res!823920 (not (contains!7278 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102826 res!823917) b!1235864))

(assert (= (and b!1235864 res!823923) b!1235870))

(assert (= (and b!1235870 res!823920) b!1235862))

(assert (= (and b!1235862 res!823924) b!1235868))

(assert (= (and b!1235868 res!823918) b!1235863))

(assert (= (and b!1235863 res!823919) b!1235865))

(assert (= (and b!1235865 res!823921) b!1235869))

(assert (= (and b!1235869 c!120832) b!1235861))

(assert (= (and b!1235869 (not c!120832)) b!1235866))

(assert (= (and b!1235869 res!823922) b!1235867))

(declare-fun m!1139715 () Bool)

(assert (=> b!1235861 m!1139715))

(declare-fun m!1139717 () Bool)

(assert (=> b!1235861 m!1139717))

(declare-fun m!1139719 () Bool)

(assert (=> b!1235861 m!1139719))

(declare-fun m!1139721 () Bool)

(assert (=> b!1235861 m!1139721))

(declare-fun m!1139723 () Bool)

(assert (=> b!1235861 m!1139723))

(declare-fun m!1139725 () Bool)

(assert (=> b!1235861 m!1139725))

(declare-fun m!1139727 () Bool)

(assert (=> b!1235861 m!1139727))

(declare-fun m!1139729 () Bool)

(assert (=> b!1235868 m!1139729))

(declare-fun m!1139731 () Bool)

(assert (=> b!1235862 m!1139731))

(declare-fun m!1139733 () Bool)

(assert (=> b!1235864 m!1139733))

(assert (=> b!1235869 m!1139723))

(assert (=> b!1235869 m!1139723))

(declare-fun m!1139735 () Bool)

(assert (=> b!1235869 m!1139735))

(declare-fun m!1139737 () Bool)

(assert (=> b!1235870 m!1139737))

(declare-fun m!1139739 () Bool)

(assert (=> b!1235863 m!1139739))

(assert (=> b!1235867 m!1139725))

(declare-fun m!1139741 () Bool)

(assert (=> start!102826 m!1139741))

(push 1)

(assert (not b!1235862))

