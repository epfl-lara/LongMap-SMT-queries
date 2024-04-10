; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102630 () Bool)

(assert start!102630)

(declare-fun b!1233665 () Bool)

(declare-fun e!699838 () Bool)

(assert (=> b!1233665 (= e!699838 (not true))))

(declare-datatypes ((array!79520 0))(
  ( (array!79521 (arr!38369 (Array (_ BitVec 32) (_ BitVec 64))) (size!38905 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79520)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233665 (not (arrayContainsKey!0 a!3806 (select (arr!38369 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40844 0))(
  ( (Unit!40845) )
))
(declare-fun lt!559721 () Unit!40844)

(declare-datatypes ((List!27142 0))(
  ( (Nil!27139) (Cons!27138 (h!28347 (_ BitVec 64)) (t!40605 List!27142)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79520 (_ BitVec 32) (_ BitVec 64) List!27142) Unit!40844)

(assert (=> b!1233665 (= lt!559721 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38369 a!3806) from!3184) (Cons!27138 (select (arr!38369 a!3806) from!3184) Nil!27139)))))

(declare-fun e!699840 () Bool)

(assert (=> b!1233665 e!699840))

(declare-fun res!821845 () Bool)

(assert (=> b!1233665 (=> (not res!821845) (not e!699840))))

(declare-fun arrayNoDuplicates!0 (array!79520 (_ BitVec 32) List!27142) Bool)

(assert (=> b!1233665 (= res!821845 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27139))))

(declare-fun acc!823 () List!27142)

(declare-fun lt!559720 () Unit!40844)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79520 List!27142 List!27142 (_ BitVec 32)) Unit!40844)

(assert (=> b!1233665 (= lt!559720 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27139 from!3184))))

(assert (=> b!1233665 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27138 (select (arr!38369 a!3806) from!3184) acc!823))))

(declare-fun b!1233666 () Bool)

(declare-fun res!821854 () Bool)

(assert (=> b!1233666 (=> (not res!821854) (not e!699838))))

(assert (=> b!1233666 (= res!821854 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233667 () Bool)

(assert (=> b!1233667 (= e!699840 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27138 (select (arr!38369 a!3806) from!3184) Nil!27139)))))

(declare-fun b!1233668 () Bool)

(declare-fun res!821850 () Bool)

(assert (=> b!1233668 (=> (not res!821850) (not e!699838))))

(declare-fun noDuplicate!1801 (List!27142) Bool)

(assert (=> b!1233668 (= res!821850 (noDuplicate!1801 acc!823))))

(declare-fun b!1233669 () Bool)

(declare-fun res!821848 () Bool)

(assert (=> b!1233669 (=> (not res!821848) (not e!699838))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1233669 (= res!821848 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!821852 () Bool)

(assert (=> start!102630 (=> (not res!821852) (not e!699838))))

(assert (=> start!102630 (= res!821852 (bvslt (size!38905 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102630 e!699838))

(declare-fun array_inv!29217 (array!79520) Bool)

(assert (=> start!102630 (array_inv!29217 a!3806)))

(assert (=> start!102630 true))

(declare-fun b!1233670 () Bool)

(declare-fun res!821846 () Bool)

(assert (=> b!1233670 (=> (not res!821846) (not e!699838))))

(declare-fun contains!7204 (List!27142 (_ BitVec 64)) Bool)

(assert (=> b!1233670 (= res!821846 (not (contains!7204 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233671 () Bool)

(declare-fun res!821851 () Bool)

(assert (=> b!1233671 (=> (not res!821851) (not e!699838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233671 (= res!821851 (validKeyInArray!0 k!2913))))

(declare-fun b!1233672 () Bool)

(declare-fun res!821849 () Bool)

(assert (=> b!1233672 (=> (not res!821849) (not e!699838))))

(assert (=> b!1233672 (= res!821849 (not (contains!7204 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233673 () Bool)

(declare-fun res!821853 () Bool)

(assert (=> b!1233673 (=> (not res!821853) (not e!699838))))

(assert (=> b!1233673 (= res!821853 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38905 a!3806)) (bvslt from!3184 (size!38905 a!3806))))))

(declare-fun b!1233674 () Bool)

(declare-fun res!821847 () Bool)

(assert (=> b!1233674 (=> (not res!821847) (not e!699838))))

(assert (=> b!1233674 (= res!821847 (validKeyInArray!0 (select (arr!38369 a!3806) from!3184)))))

(assert (= (and start!102630 res!821852) b!1233671))

(assert (= (and b!1233671 res!821851) b!1233673))

(assert (= (and b!1233673 res!821853) b!1233668))

(assert (= (and b!1233668 res!821850) b!1233670))

(assert (= (and b!1233670 res!821846) b!1233672))

(assert (= (and b!1233672 res!821849) b!1233669))

(assert (= (and b!1233669 res!821848) b!1233666))

(assert (= (and b!1233666 res!821854) b!1233674))

(assert (= (and b!1233674 res!821847) b!1233665))

(assert (= (and b!1233665 res!821845) b!1233667))

(declare-fun m!1137721 () Bool)

(assert (=> start!102630 m!1137721))

(declare-fun m!1137723 () Bool)

(assert (=> b!1233668 m!1137723))

(declare-fun m!1137725 () Bool)

(assert (=> b!1233672 m!1137725))

(declare-fun m!1137727 () Bool)

(assert (=> b!1233667 m!1137727))

(declare-fun m!1137729 () Bool)

(assert (=> b!1233667 m!1137729))

(declare-fun m!1137731 () Bool)

(assert (=> b!1233666 m!1137731))

(declare-fun m!1137733 () Bool)

(assert (=> b!1233670 m!1137733))

(assert (=> b!1233674 m!1137727))

(assert (=> b!1233674 m!1137727))

(declare-fun m!1137735 () Bool)

(assert (=> b!1233674 m!1137735))

(declare-fun m!1137737 () Bool)

(assert (=> b!1233669 m!1137737))

(declare-fun m!1137739 () Bool)

(assert (=> b!1233665 m!1137739))

(declare-fun m!1137741 () Bool)

(assert (=> b!1233665 m!1137741))

(assert (=> b!1233665 m!1137727))

(declare-fun m!1137743 () Bool)

(assert (=> b!1233665 m!1137743))

(assert (=> b!1233665 m!1137727))

(declare-fun m!1137745 () Bool)

(assert (=> b!1233665 m!1137745))

(assert (=> b!1233665 m!1137727))

(declare-fun m!1137747 () Bool)

(assert (=> b!1233665 m!1137747))

(declare-fun m!1137749 () Bool)

(assert (=> b!1233671 m!1137749))

(push 1)

(assert (not b!1233666))

(assert (not b!1233669))

(assert (not b!1233671))

(assert (not b!1233668))

(assert (not b!1233672))

(assert (not start!102630))

(assert (not b!1233670))

(assert (not b!1233674))

(assert (not b!1233667))

(assert (not b!1233665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

