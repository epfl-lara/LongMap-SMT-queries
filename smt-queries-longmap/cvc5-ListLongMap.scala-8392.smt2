; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102132 () Bool)

(assert start!102132)

(declare-fun b!1229140 () Bool)

(declare-fun res!817627 () Bool)

(declare-fun e!697730 () Bool)

(assert (=> b!1229140 (=> (not res!817627) (not e!697730))))

(declare-datatypes ((List!27046 0))(
  ( (Nil!27043) (Cons!27042 (h!28251 (_ BitVec 64)) (t!40509 List!27046)) )
))
(declare-fun acc!823 () List!27046)

(declare-fun contains!7108 (List!27046 (_ BitVec 64)) Bool)

(assert (=> b!1229140 (= res!817627 (not (contains!7108 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!817637 () Bool)

(assert (=> start!102132 (=> (not res!817637) (not e!697730))))

(declare-datatypes ((array!79307 0))(
  ( (array!79308 (arr!38273 (Array (_ BitVec 32) (_ BitVec 64))) (size!38809 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79307)

(assert (=> start!102132 (= res!817637 (bvslt (size!38809 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102132 e!697730))

(declare-fun array_inv!29121 (array!79307) Bool)

(assert (=> start!102132 (array_inv!29121 a!3806)))

(assert (=> start!102132 true))

(declare-fun b!1229141 () Bool)

(declare-fun e!697729 () Bool)

(assert (=> b!1229141 (= e!697729 true)))

(declare-fun lt!559116 () Bool)

(declare-fun lt!559118 () List!27046)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229141 (= lt!559116 (contains!7108 lt!559118 (select (arr!38273 a!3806) from!3184)))))

(declare-fun b!1229142 () Bool)

(assert (=> b!1229142 (= e!697730 (not e!697729))))

(declare-fun res!817628 () Bool)

(assert (=> b!1229142 (=> res!817628 e!697729)))

(assert (=> b!1229142 (= res!817628 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229142 (= lt!559118 (Cons!27042 (select (arr!38273 a!3806) from!3184) Nil!27043))))

(declare-fun e!697728 () Bool)

(assert (=> b!1229142 e!697728))

(declare-fun res!817632 () Bool)

(assert (=> b!1229142 (=> (not res!817632) (not e!697728))))

(declare-fun arrayNoDuplicates!0 (array!79307 (_ BitVec 32) List!27046) Bool)

(assert (=> b!1229142 (= res!817632 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27043))))

(declare-datatypes ((Unit!40712 0))(
  ( (Unit!40713) )
))
(declare-fun lt!559117 () Unit!40712)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79307 List!27046 List!27046 (_ BitVec 32)) Unit!40712)

(assert (=> b!1229142 (= lt!559117 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27043 from!3184))))

(assert (=> b!1229142 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27042 (select (arr!38273 a!3806) from!3184) acc!823))))

(declare-fun b!1229143 () Bool)

(declare-fun res!817631 () Bool)

(assert (=> b!1229143 (=> (not res!817631) (not e!697730))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229143 (= res!817631 (validKeyInArray!0 k!2913))))

(declare-fun b!1229144 () Bool)

(declare-fun res!817638 () Bool)

(assert (=> b!1229144 (=> res!817638 e!697729)))

(declare-fun noDuplicate!1705 (List!27046) Bool)

(assert (=> b!1229144 (= res!817638 (not (noDuplicate!1705 lt!559118)))))

(declare-fun b!1229145 () Bool)

(declare-fun res!817635 () Bool)

(assert (=> b!1229145 (=> res!817635 e!697729)))

(assert (=> b!1229145 (= res!817635 (contains!7108 lt!559118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229146 () Bool)

(declare-fun res!817626 () Bool)

(assert (=> b!1229146 (=> res!817626 e!697729)))

(assert (=> b!1229146 (= res!817626 (contains!7108 lt!559118 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229147 () Bool)

(declare-fun res!817636 () Bool)

(assert (=> b!1229147 (=> (not res!817636) (not e!697730))))

(declare-fun arrayContainsKey!0 (array!79307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229147 (= res!817636 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229148 () Bool)

(declare-fun res!817634 () Bool)

(assert (=> b!1229148 (=> (not res!817634) (not e!697730))))

(assert (=> b!1229148 (= res!817634 (validKeyInArray!0 (select (arr!38273 a!3806) from!3184)))))

(declare-fun b!1229149 () Bool)

(declare-fun res!817630 () Bool)

(assert (=> b!1229149 (=> (not res!817630) (not e!697730))))

(assert (=> b!1229149 (= res!817630 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38809 a!3806)) (bvslt from!3184 (size!38809 a!3806))))))

(declare-fun b!1229150 () Bool)

(assert (=> b!1229150 (= e!697728 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27042 (select (arr!38273 a!3806) from!3184) Nil!27043)))))

(declare-fun b!1229151 () Bool)

(declare-fun res!817629 () Bool)

(assert (=> b!1229151 (=> (not res!817629) (not e!697730))))

(assert (=> b!1229151 (= res!817629 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229152 () Bool)

(declare-fun res!817639 () Bool)

(assert (=> b!1229152 (=> (not res!817639) (not e!697730))))

(assert (=> b!1229152 (= res!817639 (not (contains!7108 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229153 () Bool)

(declare-fun res!817633 () Bool)

(assert (=> b!1229153 (=> (not res!817633) (not e!697730))))

(assert (=> b!1229153 (= res!817633 (noDuplicate!1705 acc!823))))

(assert (= (and start!102132 res!817637) b!1229143))

(assert (= (and b!1229143 res!817631) b!1229149))

(assert (= (and b!1229149 res!817630) b!1229153))

(assert (= (and b!1229153 res!817633) b!1229140))

(assert (= (and b!1229140 res!817627) b!1229152))

(assert (= (and b!1229152 res!817639) b!1229147))

(assert (= (and b!1229147 res!817636) b!1229151))

(assert (= (and b!1229151 res!817629) b!1229148))

(assert (= (and b!1229148 res!817634) b!1229142))

(assert (= (and b!1229142 res!817632) b!1229150))

(assert (= (and b!1229142 (not res!817628)) b!1229144))

(assert (= (and b!1229144 (not res!817638)) b!1229145))

(assert (= (and b!1229145 (not res!817635)) b!1229146))

(assert (= (and b!1229146 (not res!817626)) b!1229141))

(declare-fun m!1133755 () Bool)

(assert (=> b!1229142 m!1133755))

(declare-fun m!1133757 () Bool)

(assert (=> b!1229142 m!1133757))

(declare-fun m!1133759 () Bool)

(assert (=> b!1229142 m!1133759))

(declare-fun m!1133761 () Bool)

(assert (=> b!1229142 m!1133761))

(declare-fun m!1133763 () Bool)

(assert (=> b!1229145 m!1133763))

(assert (=> b!1229141 m!1133755))

(assert (=> b!1229141 m!1133755))

(declare-fun m!1133765 () Bool)

(assert (=> b!1229141 m!1133765))

(assert (=> b!1229148 m!1133755))

(assert (=> b!1229148 m!1133755))

(declare-fun m!1133767 () Bool)

(assert (=> b!1229148 m!1133767))

(declare-fun m!1133769 () Bool)

(assert (=> b!1229147 m!1133769))

(assert (=> b!1229150 m!1133755))

(declare-fun m!1133771 () Bool)

(assert (=> b!1229150 m!1133771))

(declare-fun m!1133773 () Bool)

(assert (=> b!1229151 m!1133773))

(declare-fun m!1133775 () Bool)

(assert (=> b!1229143 m!1133775))

(declare-fun m!1133777 () Bool)

(assert (=> start!102132 m!1133777))

(declare-fun m!1133779 () Bool)

(assert (=> b!1229146 m!1133779))

(declare-fun m!1133781 () Bool)

(assert (=> b!1229144 m!1133781))

(declare-fun m!1133783 () Bool)

(assert (=> b!1229153 m!1133783))

(declare-fun m!1133785 () Bool)

(assert (=> b!1229140 m!1133785))

(declare-fun m!1133787 () Bool)

(assert (=> b!1229152 m!1133787))

(push 1)

(assert (not b!1229143))

(assert (not start!102132))

(assert (not b!1229146))

(assert (not b!1229150))

(assert (not b!1229153))

(assert (not b!1229144))

(assert (not b!1229147))

(assert (not b!1229151))

(assert (not b!1229142))

(assert (not b!1229140))

(assert (not b!1229141))

(assert (not b!1229145))

(assert (not b!1229152))

(assert (not b!1229148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

