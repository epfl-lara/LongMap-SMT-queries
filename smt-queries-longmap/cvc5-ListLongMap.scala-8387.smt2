; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101996 () Bool)

(assert start!101996)

(declare-fun b!1228114 () Bool)

(declare-fun e!697097 () Bool)

(assert (=> b!1228114 (= e!697097 true)))

(declare-datatypes ((Unit!40533 0))(
  ( (Unit!40534) )
))
(declare-fun lt!558794 () Unit!40533)

(declare-datatypes ((List!27095 0))(
  ( (Nil!27092) (Cons!27091 (h!28300 (_ BitVec 64)) (t!40549 List!27095)) )
))
(declare-fun acc!823 () List!27095)

(declare-fun noDuplicateSubseq!52 (List!27095 List!27095) Unit!40533)

(assert (=> b!1228114 (= lt!558794 (noDuplicateSubseq!52 Nil!27092 acc!823))))

(declare-fun b!1228115 () Bool)

(declare-fun res!816776 () Bool)

(declare-fun e!697095 () Bool)

(assert (=> b!1228115 (=> (not res!816776) (not e!697095))))

(declare-datatypes ((array!79196 0))(
  ( (array!79197 (arr!38221 (Array (_ BitVec 32) (_ BitVec 64))) (size!38759 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79196)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228115 (= res!816776 (validKeyInArray!0 (select (arr!38221 a!3806) from!3184)))))

(declare-fun b!1228116 () Bool)

(declare-fun res!816783 () Bool)

(assert (=> b!1228116 (=> res!816783 e!697097)))

(declare-fun contains!7067 (List!27095 (_ BitVec 64)) Bool)

(assert (=> b!1228116 (= res!816783 (contains!7067 Nil!27092 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228117 () Bool)

(declare-fun res!816773 () Bool)

(assert (=> b!1228117 (=> res!816773 e!697097)))

(assert (=> b!1228117 (= res!816773 (contains!7067 Nil!27092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228118 () Bool)

(declare-fun res!816779 () Bool)

(assert (=> b!1228118 (=> (not res!816779) (not e!697095))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228118 (= res!816779 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228119 () Bool)

(declare-fun res!816780 () Bool)

(assert (=> b!1228119 (=> res!816780 e!697097)))

(declare-fun subseq!499 (List!27095 List!27095) Bool)

(assert (=> b!1228119 (= res!816780 (not (subseq!499 Nil!27092 acc!823)))))

(declare-fun b!1228120 () Bool)

(declare-fun res!816781 () Bool)

(assert (=> b!1228120 (=> (not res!816781) (not e!697095))))

(declare-fun arrayNoDuplicates!0 (array!79196 (_ BitVec 32) List!27095) Bool)

(assert (=> b!1228120 (= res!816781 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228121 () Bool)

(declare-fun res!816784 () Bool)

(assert (=> b!1228121 (=> (not res!816784) (not e!697095))))

(assert (=> b!1228121 (= res!816784 (not (contains!7067 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228122 () Bool)

(declare-fun res!816778 () Bool)

(assert (=> b!1228122 (=> (not res!816778) (not e!697095))))

(assert (=> b!1228122 (= res!816778 (validKeyInArray!0 k!2913))))

(declare-fun b!1228123 () Bool)

(declare-fun res!816782 () Bool)

(assert (=> b!1228123 (=> (not res!816782) (not e!697095))))

(assert (=> b!1228123 (= res!816782 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38759 a!3806)) (bvslt from!3184 (size!38759 a!3806))))))

(declare-fun b!1228113 () Bool)

(declare-fun res!816785 () Bool)

(assert (=> b!1228113 (=> (not res!816785) (not e!697095))))

(assert (=> b!1228113 (= res!816785 (not (contains!7067 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816777 () Bool)

(assert (=> start!101996 (=> (not res!816777) (not e!697095))))

(assert (=> start!101996 (= res!816777 (bvslt (size!38759 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101996 e!697095))

(declare-fun array_inv!29204 (array!79196) Bool)

(assert (=> start!101996 (array_inv!29204 a!3806)))

(assert (=> start!101996 true))

(declare-fun b!1228124 () Bool)

(assert (=> b!1228124 (= e!697095 (not e!697097))))

(declare-fun res!816774 () Bool)

(assert (=> b!1228124 (=> res!816774 e!697097)))

(assert (=> b!1228124 (= res!816774 (bvsgt from!3184 (size!38759 a!3806)))))

(assert (=> b!1228124 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27091 (select (arr!38221 a!3806) from!3184) acc!823))))

(declare-fun b!1228125 () Bool)

(declare-fun res!816775 () Bool)

(assert (=> b!1228125 (=> (not res!816775) (not e!697095))))

(declare-fun noDuplicate!1710 (List!27095) Bool)

(assert (=> b!1228125 (= res!816775 (noDuplicate!1710 acc!823))))

(assert (= (and start!101996 res!816777) b!1228122))

(assert (= (and b!1228122 res!816778) b!1228123))

(assert (= (and b!1228123 res!816782) b!1228125))

(assert (= (and b!1228125 res!816775) b!1228113))

(assert (= (and b!1228113 res!816785) b!1228121))

(assert (= (and b!1228121 res!816784) b!1228118))

(assert (= (and b!1228118 res!816779) b!1228120))

(assert (= (and b!1228120 res!816781) b!1228115))

(assert (= (and b!1228115 res!816776) b!1228124))

(assert (= (and b!1228124 (not res!816774)) b!1228117))

(assert (= (and b!1228117 (not res!816773)) b!1228116))

(assert (= (and b!1228116 (not res!816783)) b!1228119))

(assert (= (and b!1228119 (not res!816780)) b!1228114))

(declare-fun m!1132223 () Bool)

(assert (=> b!1228119 m!1132223))

(declare-fun m!1132225 () Bool)

(assert (=> b!1228125 m!1132225))

(declare-fun m!1132227 () Bool)

(assert (=> b!1228122 m!1132227))

(declare-fun m!1132229 () Bool)

(assert (=> b!1228114 m!1132229))

(declare-fun m!1132231 () Bool)

(assert (=> b!1228118 m!1132231))

(declare-fun m!1132233 () Bool)

(assert (=> b!1228116 m!1132233))

(declare-fun m!1132235 () Bool)

(assert (=> b!1228121 m!1132235))

(declare-fun m!1132237 () Bool)

(assert (=> b!1228115 m!1132237))

(assert (=> b!1228115 m!1132237))

(declare-fun m!1132239 () Bool)

(assert (=> b!1228115 m!1132239))

(declare-fun m!1132241 () Bool)

(assert (=> b!1228113 m!1132241))

(declare-fun m!1132243 () Bool)

(assert (=> start!101996 m!1132243))

(declare-fun m!1132245 () Bool)

(assert (=> b!1228117 m!1132245))

(declare-fun m!1132247 () Bool)

(assert (=> b!1228120 m!1132247))

(assert (=> b!1228124 m!1132237))

(declare-fun m!1132249 () Bool)

(assert (=> b!1228124 m!1132249))

(push 1)

(assert (not b!1228120))

(assert (not b!1228117))

(assert (not b!1228115))

(assert (not b!1228118))

(assert (not b!1228125))

(assert (not b!1228119))

(assert (not b!1228124))

(assert (not b!1228113))

(assert (not start!101996))

(assert (not b!1228122))

(assert (not b!1228116))

(assert (not b!1228114))

(assert (not b!1228121))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

