; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102154 () Bool)

(assert start!102154)

(declare-fun b!1229602 () Bool)

(declare-fun res!818094 () Bool)

(declare-fun e!697861 () Bool)

(assert (=> b!1229602 (=> res!818094 e!697861)))

(declare-datatypes ((List!27057 0))(
  ( (Nil!27054) (Cons!27053 (h!28262 (_ BitVec 64)) (t!40520 List!27057)) )
))
(declare-fun lt!559215 () List!27057)

(declare-fun noDuplicate!1716 (List!27057) Bool)

(assert (=> b!1229602 (= res!818094 (not (noDuplicate!1716 lt!559215)))))

(declare-fun b!1229603 () Bool)

(declare-fun res!818090 () Bool)

(declare-fun e!697862 () Bool)

(assert (=> b!1229603 (=> (not res!818090) (not e!697862))))

(declare-fun acc!823 () List!27057)

(assert (=> b!1229603 (= res!818090 (noDuplicate!1716 acc!823))))

(declare-fun b!1229604 () Bool)

(declare-fun res!818097 () Bool)

(assert (=> b!1229604 (=> (not res!818097) (not e!697862))))

(declare-datatypes ((array!79329 0))(
  ( (array!79330 (arr!38284 (Array (_ BitVec 32) (_ BitVec 64))) (size!38820 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79329)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79329 (_ BitVec 32) List!27057) Bool)

(assert (=> b!1229604 (= res!818097 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229605 () Bool)

(declare-fun e!697863 () Bool)

(assert (=> b!1229605 (= e!697863 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27053 (select (arr!38284 a!3806) from!3184) Nil!27054)))))

(declare-fun b!1229606 () Bool)

(declare-fun res!818096 () Bool)

(assert (=> b!1229606 (=> res!818096 e!697861)))

(declare-fun contains!7119 (List!27057 (_ BitVec 64)) Bool)

(assert (=> b!1229606 (= res!818096 (contains!7119 lt!559215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!818099 () Bool)

(assert (=> start!102154 (=> (not res!818099) (not e!697862))))

(assert (=> start!102154 (= res!818099 (bvslt (size!38820 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102154 e!697862))

(declare-fun array_inv!29132 (array!79329) Bool)

(assert (=> start!102154 (array_inv!29132 a!3806)))

(assert (=> start!102154 true))

(declare-fun b!1229607 () Bool)

(declare-fun res!818091 () Bool)

(assert (=> b!1229607 (=> (not res!818091) (not e!697862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229607 (= res!818091 (validKeyInArray!0 (select (arr!38284 a!3806) from!3184)))))

(declare-fun b!1229608 () Bool)

(assert (=> b!1229608 (= e!697862 (not e!697861))))

(declare-fun res!818098 () Bool)

(assert (=> b!1229608 (=> res!818098 e!697861)))

(assert (=> b!1229608 (= res!818098 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229608 (= lt!559215 (Cons!27053 (select (arr!38284 a!3806) from!3184) Nil!27054))))

(assert (=> b!1229608 e!697863))

(declare-fun res!818101 () Bool)

(assert (=> b!1229608 (=> (not res!818101) (not e!697863))))

(assert (=> b!1229608 (= res!818101 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27054))))

(declare-datatypes ((Unit!40734 0))(
  ( (Unit!40735) )
))
(declare-fun lt!559217 () Unit!40734)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79329 List!27057 List!27057 (_ BitVec 32)) Unit!40734)

(assert (=> b!1229608 (= lt!559217 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27054 from!3184))))

(assert (=> b!1229608 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27053 (select (arr!38284 a!3806) from!3184) acc!823))))

(declare-fun b!1229609 () Bool)

(declare-fun res!818092 () Bool)

(assert (=> b!1229609 (=> res!818092 e!697861)))

(assert (=> b!1229609 (= res!818092 (contains!7119 lt!559215 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229610 () Bool)

(declare-fun res!818093 () Bool)

(assert (=> b!1229610 (=> (not res!818093) (not e!697862))))

(assert (=> b!1229610 (= res!818093 (not (contains!7119 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229611 () Bool)

(declare-fun res!818100 () Bool)

(assert (=> b!1229611 (=> (not res!818100) (not e!697862))))

(assert (=> b!1229611 (= res!818100 (not (contains!7119 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229612 () Bool)

(declare-fun res!818089 () Bool)

(assert (=> b!1229612 (=> (not res!818089) (not e!697862))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1229612 (= res!818089 (validKeyInArray!0 k!2913))))

(declare-fun b!1229613 () Bool)

(declare-fun res!818088 () Bool)

(assert (=> b!1229613 (=> (not res!818088) (not e!697862))))

(declare-fun arrayContainsKey!0 (array!79329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229613 (= res!818088 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229614 () Bool)

(assert (=> b!1229614 (= e!697861 true)))

(declare-fun lt!559216 () Bool)

(assert (=> b!1229614 (= lt!559216 (contains!7119 lt!559215 (select (arr!38284 a!3806) from!3184)))))

(declare-fun b!1229615 () Bool)

(declare-fun res!818095 () Bool)

(assert (=> b!1229615 (=> (not res!818095) (not e!697862))))

(assert (=> b!1229615 (= res!818095 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38820 a!3806)) (bvslt from!3184 (size!38820 a!3806))))))

(assert (= (and start!102154 res!818099) b!1229612))

(assert (= (and b!1229612 res!818089) b!1229615))

(assert (= (and b!1229615 res!818095) b!1229603))

(assert (= (and b!1229603 res!818090) b!1229610))

(assert (= (and b!1229610 res!818093) b!1229611))

(assert (= (and b!1229611 res!818100) b!1229613))

(assert (= (and b!1229613 res!818088) b!1229604))

(assert (= (and b!1229604 res!818097) b!1229607))

(assert (= (and b!1229607 res!818091) b!1229608))

(assert (= (and b!1229608 res!818101) b!1229605))

(assert (= (and b!1229608 (not res!818098)) b!1229602))

(assert (= (and b!1229602 (not res!818094)) b!1229606))

(assert (= (and b!1229606 (not res!818096)) b!1229609))

(assert (= (and b!1229609 (not res!818092)) b!1229614))

(declare-fun m!1134129 () Bool)

(assert (=> start!102154 m!1134129))

(declare-fun m!1134131 () Bool)

(assert (=> b!1229604 m!1134131))

(declare-fun m!1134133 () Bool)

(assert (=> b!1229608 m!1134133))

(declare-fun m!1134135 () Bool)

(assert (=> b!1229608 m!1134135))

(declare-fun m!1134137 () Bool)

(assert (=> b!1229608 m!1134137))

(declare-fun m!1134139 () Bool)

(assert (=> b!1229608 m!1134139))

(assert (=> b!1229605 m!1134133))

(declare-fun m!1134141 () Bool)

(assert (=> b!1229605 m!1134141))

(declare-fun m!1134143 () Bool)

(assert (=> b!1229606 m!1134143))

(declare-fun m!1134145 () Bool)

(assert (=> b!1229613 m!1134145))

(declare-fun m!1134147 () Bool)

(assert (=> b!1229612 m!1134147))

(assert (=> b!1229614 m!1134133))

(assert (=> b!1229614 m!1134133))

(declare-fun m!1134149 () Bool)

(assert (=> b!1229614 m!1134149))

(declare-fun m!1134151 () Bool)

(assert (=> b!1229602 m!1134151))

(declare-fun m!1134153 () Bool)

(assert (=> b!1229609 m!1134153))

(assert (=> b!1229607 m!1134133))

(assert (=> b!1229607 m!1134133))

(declare-fun m!1134155 () Bool)

(assert (=> b!1229607 m!1134155))

(declare-fun m!1134157 () Bool)

(assert (=> b!1229610 m!1134157))

(declare-fun m!1134159 () Bool)

(assert (=> b!1229611 m!1134159))

(declare-fun m!1134161 () Bool)

(assert (=> b!1229603 m!1134161))

(push 1)

(assert (not b!1229606))

(assert (not b!1229603))

(assert (not b!1229614))

(assert (not b!1229612))

(assert (not b!1229613))

(assert (not b!1229604))

(assert (not b!1229605))

(assert (not b!1229608))

(assert (not start!102154))

(assert (not b!1229607))

(assert (not b!1229610))

(assert (not b!1229611))

(assert (not b!1229609))

(assert (not b!1229602))

(check-sat)

(pop 1)

