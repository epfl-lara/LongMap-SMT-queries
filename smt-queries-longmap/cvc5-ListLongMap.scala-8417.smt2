; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102438 () Bool)

(assert start!102438)

(declare-fun b!1232132 () Bool)

(declare-fun res!820516 () Bool)

(declare-fun e!698900 () Bool)

(assert (=> b!1232132 (=> (not res!820516) (not e!698900))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79469 0))(
  ( (array!79470 (arr!38348 (Array (_ BitVec 32) (_ BitVec 64))) (size!38884 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79469)

(assert (=> b!1232132 (= res!820516 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38884 a!3806)) (bvslt from!3184 (size!38884 a!3806))))))

(declare-fun b!1232133 () Bool)

(declare-fun res!820514 () Bool)

(assert (=> b!1232133 (=> (not res!820514) (not e!698900))))

(declare-datatypes ((List!27121 0))(
  ( (Nil!27118) (Cons!27117 (h!28326 (_ BitVec 64)) (t!40584 List!27121)) )
))
(declare-fun acc!823 () List!27121)

(declare-fun noDuplicate!1780 (List!27121) Bool)

(assert (=> b!1232133 (= res!820514 (noDuplicate!1780 acc!823))))

(declare-fun b!1232134 () Bool)

(declare-fun res!820512 () Bool)

(assert (=> b!1232134 (=> (not res!820512) (not e!698900))))

(declare-fun contains!7183 (List!27121 (_ BitVec 64)) Bool)

(assert (=> b!1232134 (= res!820512 (not (contains!7183 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232135 () Bool)

(declare-fun res!820519 () Bool)

(assert (=> b!1232135 (=> (not res!820519) (not e!698900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232135 (= res!820519 (validKeyInArray!0 (select (arr!38348 a!3806) from!3184)))))

(declare-fun b!1232136 () Bool)

(declare-fun res!820513 () Bool)

(assert (=> b!1232136 (=> (not res!820513) (not e!698900))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232136 (= res!820513 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232137 () Bool)

(declare-fun e!698899 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79469 (_ BitVec 32) List!27121) Bool)

(assert (=> b!1232137 (= e!698899 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27117 (select (arr!38348 a!3806) from!3184) Nil!27118)))))

(declare-fun b!1232138 () Bool)

(assert (=> b!1232138 (= e!698900 (not true))))

(assert (=> b!1232138 e!698899))

(declare-fun res!820515 () Bool)

(assert (=> b!1232138 (=> (not res!820515) (not e!698899))))

(assert (=> b!1232138 (= res!820515 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27118))))

(declare-datatypes ((Unit!40802 0))(
  ( (Unit!40803) )
))
(declare-fun lt!559487 () Unit!40802)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79469 List!27121 List!27121 (_ BitVec 32)) Unit!40802)

(assert (=> b!1232138 (= lt!559487 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27118 from!3184))))

(assert (=> b!1232138 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27117 (select (arr!38348 a!3806) from!3184) acc!823))))

(declare-fun b!1232139 () Bool)

(declare-fun res!820510 () Bool)

(assert (=> b!1232139 (=> (not res!820510) (not e!698900))))

(assert (=> b!1232139 (= res!820510 (validKeyInArray!0 k!2913))))

(declare-fun b!1232140 () Bool)

(declare-fun res!820518 () Bool)

(assert (=> b!1232140 (=> (not res!820518) (not e!698900))))

(assert (=> b!1232140 (= res!820518 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232141 () Bool)

(declare-fun res!820511 () Bool)

(assert (=> b!1232141 (=> (not res!820511) (not e!698900))))

(assert (=> b!1232141 (= res!820511 (not (contains!7183 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!820517 () Bool)

(assert (=> start!102438 (=> (not res!820517) (not e!698900))))

(assert (=> start!102438 (= res!820517 (bvslt (size!38884 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102438 e!698900))

(declare-fun array_inv!29196 (array!79469) Bool)

(assert (=> start!102438 (array_inv!29196 a!3806)))

(assert (=> start!102438 true))

(assert (= (and start!102438 res!820517) b!1232139))

(assert (= (and b!1232139 res!820510) b!1232132))

(assert (= (and b!1232132 res!820516) b!1232133))

(assert (= (and b!1232133 res!820514) b!1232141))

(assert (= (and b!1232141 res!820511) b!1232134))

(assert (= (and b!1232134 res!820512) b!1232136))

(assert (= (and b!1232136 res!820513) b!1232140))

(assert (= (and b!1232140 res!820518) b!1232135))

(assert (= (and b!1232135 res!820519) b!1232138))

(assert (= (and b!1232138 res!820515) b!1232137))

(declare-fun m!1136161 () Bool)

(assert (=> b!1232135 m!1136161))

(assert (=> b!1232135 m!1136161))

(declare-fun m!1136163 () Bool)

(assert (=> b!1232135 m!1136163))

(assert (=> b!1232137 m!1136161))

(declare-fun m!1136165 () Bool)

(assert (=> b!1232137 m!1136165))

(declare-fun m!1136167 () Bool)

(assert (=> b!1232141 m!1136167))

(declare-fun m!1136169 () Bool)

(assert (=> start!102438 m!1136169))

(declare-fun m!1136171 () Bool)

(assert (=> b!1232133 m!1136171))

(declare-fun m!1136173 () Bool)

(assert (=> b!1232136 m!1136173))

(declare-fun m!1136175 () Bool)

(assert (=> b!1232139 m!1136175))

(declare-fun m!1136177 () Bool)

(assert (=> b!1232138 m!1136177))

(declare-fun m!1136179 () Bool)

(assert (=> b!1232138 m!1136179))

(assert (=> b!1232138 m!1136161))

(declare-fun m!1136181 () Bool)

(assert (=> b!1232138 m!1136181))

(declare-fun m!1136183 () Bool)

(assert (=> b!1232134 m!1136183))

(declare-fun m!1136185 () Bool)

(assert (=> b!1232140 m!1136185))

(push 1)

(assert (not b!1232141))

(assert (not b!1232138))

(assert (not start!102438))

(assert (not b!1232137))

(assert (not b!1232139))

(assert (not b!1232136))

(assert (not b!1232135))

(assert (not b!1232133))

(assert (not b!1232134))

(assert (not b!1232140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

