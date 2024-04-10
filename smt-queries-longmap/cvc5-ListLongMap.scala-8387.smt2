; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101998 () Bool)

(assert start!101998)

(declare-fun res!816767 () Bool)

(declare-fun e!697146 () Bool)

(assert (=> start!101998 (=> (not res!816767) (not e!697146))))

(declare-datatypes ((array!79271 0))(
  ( (array!79272 (arr!38258 (Array (_ BitVec 32) (_ BitVec 64))) (size!38794 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79271)

(assert (=> start!101998 (= res!816767 (bvslt (size!38794 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101998 e!697146))

(declare-fun array_inv!29106 (array!79271) Bool)

(assert (=> start!101998 (array_inv!29106 a!3806)))

(assert (=> start!101998 true))

(declare-fun b!1228144 () Bool)

(declare-fun res!816757 () Bool)

(assert (=> b!1228144 (=> (not res!816757) (not e!697146))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228144 (= res!816757 (validKeyInArray!0 (select (arr!38258 a!3806) from!3184)))))

(declare-fun b!1228145 () Bool)

(declare-fun res!816764 () Bool)

(declare-fun e!697148 () Bool)

(assert (=> b!1228145 (=> res!816764 e!697148)))

(declare-datatypes ((List!27031 0))(
  ( (Nil!27028) (Cons!27027 (h!28236 (_ BitVec 64)) (t!40494 List!27031)) )
))
(declare-fun acc!823 () List!27031)

(declare-fun subseq!497 (List!27031 List!27031) Bool)

(assert (=> b!1228145 (= res!816764 (not (subseq!497 Nil!27028 acc!823)))))

(declare-fun b!1228146 () Bool)

(declare-fun res!816762 () Bool)

(assert (=> b!1228146 (=> (not res!816762) (not e!697146))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228146 (= res!816762 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228147 () Bool)

(declare-fun res!816766 () Bool)

(assert (=> b!1228147 (=> (not res!816766) (not e!697146))))

(assert (=> b!1228147 (= res!816766 (validKeyInArray!0 k!2913))))

(declare-fun b!1228148 () Bool)

(declare-fun res!816763 () Bool)

(assert (=> b!1228148 (=> (not res!816763) (not e!697146))))

(assert (=> b!1228148 (= res!816763 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38794 a!3806)) (bvslt from!3184 (size!38794 a!3806))))))

(declare-fun b!1228149 () Bool)

(assert (=> b!1228149 (= e!697148 true)))

(declare-datatypes ((Unit!40682 0))(
  ( (Unit!40683) )
))
(declare-fun lt!558969 () Unit!40682)

(declare-fun noDuplicateSubseq!50 (List!27031 List!27031) Unit!40682)

(assert (=> b!1228149 (= lt!558969 (noDuplicateSubseq!50 Nil!27028 acc!823))))

(declare-fun b!1228150 () Bool)

(declare-fun res!816765 () Bool)

(assert (=> b!1228150 (=> (not res!816765) (not e!697146))))

(declare-fun arrayNoDuplicates!0 (array!79271 (_ BitVec 32) List!27031) Bool)

(assert (=> b!1228150 (= res!816765 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228151 () Bool)

(assert (=> b!1228151 (= e!697146 (not e!697148))))

(declare-fun res!816756 () Bool)

(assert (=> b!1228151 (=> res!816756 e!697148)))

(assert (=> b!1228151 (= res!816756 (bvsgt from!3184 (size!38794 a!3806)))))

(assert (=> b!1228151 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27027 (select (arr!38258 a!3806) from!3184) acc!823))))

(declare-fun b!1228152 () Bool)

(declare-fun res!816759 () Bool)

(assert (=> b!1228152 (=> (not res!816759) (not e!697146))))

(declare-fun noDuplicate!1690 (List!27031) Bool)

(assert (=> b!1228152 (= res!816759 (noDuplicate!1690 acc!823))))

(declare-fun b!1228153 () Bool)

(declare-fun res!816761 () Bool)

(assert (=> b!1228153 (=> res!816761 e!697148)))

(declare-fun contains!7093 (List!27031 (_ BitVec 64)) Bool)

(assert (=> b!1228153 (= res!816761 (contains!7093 Nil!27028 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228154 () Bool)

(declare-fun res!816758 () Bool)

(assert (=> b!1228154 (=> (not res!816758) (not e!697146))))

(assert (=> b!1228154 (= res!816758 (not (contains!7093 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228155 () Bool)

(declare-fun res!816760 () Bool)

(assert (=> b!1228155 (=> (not res!816760) (not e!697146))))

(assert (=> b!1228155 (= res!816760 (not (contains!7093 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228156 () Bool)

(declare-fun res!816768 () Bool)

(assert (=> b!1228156 (=> res!816768 e!697148)))

(assert (=> b!1228156 (= res!816768 (contains!7093 Nil!27028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!101998 res!816767) b!1228147))

(assert (= (and b!1228147 res!816766) b!1228148))

(assert (= (and b!1228148 res!816763) b!1228152))

(assert (= (and b!1228152 res!816759) b!1228155))

(assert (= (and b!1228155 res!816760) b!1228154))

(assert (= (and b!1228154 res!816758) b!1228146))

(assert (= (and b!1228146 res!816762) b!1228150))

(assert (= (and b!1228150 res!816765) b!1228144))

(assert (= (and b!1228144 res!816757) b!1228151))

(assert (= (and b!1228151 (not res!816756)) b!1228156))

(assert (= (and b!1228156 (not res!816768)) b!1228153))

(assert (= (and b!1228153 (not res!816761)) b!1228145))

(assert (= (and b!1228145 (not res!816764)) b!1228149))

(declare-fun m!1132731 () Bool)

(assert (=> b!1228154 m!1132731))

(declare-fun m!1132733 () Bool)

(assert (=> b!1228147 m!1132733))

(declare-fun m!1132735 () Bool)

(assert (=> b!1228145 m!1132735))

(declare-fun m!1132737 () Bool)

(assert (=> b!1228149 m!1132737))

(declare-fun m!1132739 () Bool)

(assert (=> start!101998 m!1132739))

(declare-fun m!1132741 () Bool)

(assert (=> b!1228153 m!1132741))

(declare-fun m!1132743 () Bool)

(assert (=> b!1228151 m!1132743))

(declare-fun m!1132745 () Bool)

(assert (=> b!1228151 m!1132745))

(declare-fun m!1132747 () Bool)

(assert (=> b!1228146 m!1132747))

(declare-fun m!1132749 () Bool)

(assert (=> b!1228156 m!1132749))

(declare-fun m!1132751 () Bool)

(assert (=> b!1228152 m!1132751))

(declare-fun m!1132753 () Bool)

(assert (=> b!1228155 m!1132753))

(declare-fun m!1132755 () Bool)

(assert (=> b!1228150 m!1132755))

(assert (=> b!1228144 m!1132743))

(assert (=> b!1228144 m!1132743))

(declare-fun m!1132757 () Bool)

(assert (=> b!1228144 m!1132757))

(push 1)

(assert (not b!1228154))

(assert (not b!1228155))

(assert (not b!1228156))

(assert (not b!1228152))

(assert (not b!1228153))

(assert (not b!1228150))

(assert (not b!1228145))

(assert (not b!1228146))

(assert (not b!1228144))

(assert (not start!101998))

(assert (not b!1228149))

(assert (not b!1228151))

(assert (not b!1228147))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

