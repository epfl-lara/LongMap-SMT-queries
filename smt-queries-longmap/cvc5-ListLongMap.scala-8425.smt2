; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102636 () Bool)

(assert start!102636)

(declare-fun res!821937 () Bool)

(declare-fun e!699866 () Bool)

(assert (=> start!102636 (=> (not res!821937) (not e!699866))))

(declare-datatypes ((array!79526 0))(
  ( (array!79527 (arr!38372 (Array (_ BitVec 32) (_ BitVec 64))) (size!38908 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79526)

(assert (=> start!102636 (= res!821937 (bvslt (size!38908 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102636 e!699866))

(declare-fun array_inv!29220 (array!79526) Bool)

(assert (=> start!102636 (array_inv!29220 a!3806)))

(assert (=> start!102636 true))

(declare-fun b!1233755 () Bool)

(declare-fun res!821941 () Bool)

(assert (=> b!1233755 (=> (not res!821941) (not e!699866))))

(declare-datatypes ((List!27145 0))(
  ( (Nil!27142) (Cons!27141 (h!28350 (_ BitVec 64)) (t!40608 List!27145)) )
))
(declare-fun acc!823 () List!27145)

(declare-fun noDuplicate!1804 (List!27145) Bool)

(assert (=> b!1233755 (= res!821941 (noDuplicate!1804 acc!823))))

(declare-fun b!1233756 () Bool)

(declare-fun res!821938 () Bool)

(assert (=> b!1233756 (=> (not res!821938) (not e!699866))))

(declare-fun contains!7207 (List!27145 (_ BitVec 64)) Bool)

(assert (=> b!1233756 (= res!821938 (not (contains!7207 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233757 () Bool)

(declare-fun res!821943 () Bool)

(assert (=> b!1233757 (=> (not res!821943) (not e!699866))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233757 (= res!821943 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233758 () Bool)

(declare-fun res!821936 () Bool)

(assert (=> b!1233758 (=> (not res!821936) (not e!699866))))

(assert (=> b!1233758 (= res!821936 (not (contains!7207 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233759 () Bool)

(declare-fun e!699867 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79526 (_ BitVec 32) List!27145) Bool)

(assert (=> b!1233759 (= e!699867 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27141 (select (arr!38372 a!3806) from!3184) Nil!27142)))))

(declare-fun b!1233760 () Bool)

(declare-fun res!821944 () Bool)

(assert (=> b!1233760 (=> (not res!821944) (not e!699866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233760 (= res!821944 (validKeyInArray!0 k!2913))))

(declare-fun b!1233761 () Bool)

(declare-fun res!821939 () Bool)

(assert (=> b!1233761 (=> (not res!821939) (not e!699866))))

(assert (=> b!1233761 (= res!821939 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38908 a!3806)) (bvslt from!3184 (size!38908 a!3806))))))

(declare-fun b!1233762 () Bool)

(assert (=> b!1233762 (= e!699866 (not true))))

(assert (=> b!1233762 (not (arrayContainsKey!0 a!3806 (select (arr!38372 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40850 0))(
  ( (Unit!40851) )
))
(declare-fun lt!559738 () Unit!40850)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79526 (_ BitVec 32) (_ BitVec 64) List!27145) Unit!40850)

(assert (=> b!1233762 (= lt!559738 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38372 a!3806) from!3184) (Cons!27141 (select (arr!38372 a!3806) from!3184) Nil!27142)))))

(assert (=> b!1233762 e!699867))

(declare-fun res!821942 () Bool)

(assert (=> b!1233762 (=> (not res!821942) (not e!699867))))

(assert (=> b!1233762 (= res!821942 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27142))))

(declare-fun lt!559739 () Unit!40850)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79526 List!27145 List!27145 (_ BitVec 32)) Unit!40850)

(assert (=> b!1233762 (= lt!559739 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27142 from!3184))))

(assert (=> b!1233762 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27141 (select (arr!38372 a!3806) from!3184) acc!823))))

(declare-fun b!1233763 () Bool)

(declare-fun res!821935 () Bool)

(assert (=> b!1233763 (=> (not res!821935) (not e!699866))))

(assert (=> b!1233763 (= res!821935 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233764 () Bool)

(declare-fun res!821940 () Bool)

(assert (=> b!1233764 (=> (not res!821940) (not e!699866))))

(assert (=> b!1233764 (= res!821940 (validKeyInArray!0 (select (arr!38372 a!3806) from!3184)))))

(assert (= (and start!102636 res!821937) b!1233760))

(assert (= (and b!1233760 res!821944) b!1233761))

(assert (= (and b!1233761 res!821939) b!1233755))

(assert (= (and b!1233755 res!821941) b!1233758))

(assert (= (and b!1233758 res!821936) b!1233756))

(assert (= (and b!1233756 res!821938) b!1233757))

(assert (= (and b!1233757 res!821943) b!1233763))

(assert (= (and b!1233763 res!821935) b!1233764))

(assert (= (and b!1233764 res!821940) b!1233762))

(assert (= (and b!1233762 res!821942) b!1233759))

(declare-fun m!1137811 () Bool)

(assert (=> start!102636 m!1137811))

(declare-fun m!1137813 () Bool)

(assert (=> b!1233759 m!1137813))

(declare-fun m!1137815 () Bool)

(assert (=> b!1233759 m!1137815))

(declare-fun m!1137817 () Bool)

(assert (=> b!1233763 m!1137817))

(declare-fun m!1137819 () Bool)

(assert (=> b!1233755 m!1137819))

(declare-fun m!1137821 () Bool)

(assert (=> b!1233756 m!1137821))

(declare-fun m!1137823 () Bool)

(assert (=> b!1233758 m!1137823))

(declare-fun m!1137825 () Bool)

(assert (=> b!1233760 m!1137825))

(assert (=> b!1233764 m!1137813))

(assert (=> b!1233764 m!1137813))

(declare-fun m!1137827 () Bool)

(assert (=> b!1233764 m!1137827))

(declare-fun m!1137829 () Bool)

(assert (=> b!1233762 m!1137829))

(declare-fun m!1137831 () Bool)

(assert (=> b!1233762 m!1137831))

(assert (=> b!1233762 m!1137813))

(declare-fun m!1137833 () Bool)

(assert (=> b!1233762 m!1137833))

(assert (=> b!1233762 m!1137813))

(declare-fun m!1137835 () Bool)

(assert (=> b!1233762 m!1137835))

(assert (=> b!1233762 m!1137813))

(declare-fun m!1137837 () Bool)

(assert (=> b!1233762 m!1137837))

(declare-fun m!1137839 () Bool)

(assert (=> b!1233757 m!1137839))

(push 1)

(assert (not b!1233760))

(assert (not b!1233757))

(assert (not b!1233756))

(assert (not b!1233762))

(assert (not b!1233758))

(assert (not b!1233764))

(assert (not b!1233755))

(assert (not start!102636))

(assert (not b!1233763))

(assert (not b!1233759))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

