; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101966 () Bool)

(assert start!101966)

(declare-fun b!1227520 () Bool)

(declare-fun res!816144 () Bool)

(declare-fun e!697002 () Bool)

(assert (=> b!1227520 (=> (not res!816144) (not e!697002))))

(declare-datatypes ((array!79239 0))(
  ( (array!79240 (arr!38242 (Array (_ BitVec 32) (_ BitVec 64))) (size!38778 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79239)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227520 (= res!816144 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!816134 () Bool)

(assert (=> start!101966 (=> (not res!816134) (not e!697002))))

(assert (=> start!101966 (= res!816134 (bvslt (size!38778 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101966 e!697002))

(declare-fun array_inv!29090 (array!79239) Bool)

(assert (=> start!101966 (array_inv!29090 a!3806)))

(assert (=> start!101966 true))

(declare-fun b!1227521 () Bool)

(declare-fun res!816139 () Bool)

(declare-fun e!697003 () Bool)

(assert (=> b!1227521 (=> res!816139 e!697003)))

(declare-datatypes ((List!27015 0))(
  ( (Nil!27012) (Cons!27011 (h!28220 (_ BitVec 64)) (t!40478 List!27015)) )
))
(declare-fun contains!7077 (List!27015 (_ BitVec 64)) Bool)

(assert (=> b!1227521 (= res!816139 (contains!7077 Nil!27012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227522 () Bool)

(declare-fun res!816138 () Bool)

(assert (=> b!1227522 (=> (not res!816138) (not e!697002))))

(declare-fun acc!823 () List!27015)

(assert (=> b!1227522 (= res!816138 (not (contains!7077 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227523 () Bool)

(assert (=> b!1227523 (= e!697002 (not e!697003))))

(declare-fun res!816142 () Bool)

(assert (=> b!1227523 (=> res!816142 e!697003)))

(assert (=> b!1227523 (= res!816142 (bvsgt from!3184 (size!38778 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79239 (_ BitVec 32) List!27015) Bool)

(assert (=> b!1227523 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27011 (select (arr!38242 a!3806) from!3184) acc!823))))

(declare-fun b!1227524 () Bool)

(declare-fun res!816137 () Bool)

(assert (=> b!1227524 (=> (not res!816137) (not e!697002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227524 (= res!816137 (validKeyInArray!0 (select (arr!38242 a!3806) from!3184)))))

(declare-fun b!1227525 () Bool)

(assert (=> b!1227525 (= e!697003 true)))

(declare-datatypes ((Unit!40650 0))(
  ( (Unit!40651) )
))
(declare-fun lt!558921 () Unit!40650)

(declare-fun noDuplicateSubseq!34 (List!27015 List!27015) Unit!40650)

(assert (=> b!1227525 (= lt!558921 (noDuplicateSubseq!34 Nil!27012 acc!823))))

(declare-fun b!1227526 () Bool)

(declare-fun res!816141 () Bool)

(assert (=> b!1227526 (=> (not res!816141) (not e!697002))))

(declare-fun noDuplicate!1674 (List!27015) Bool)

(assert (=> b!1227526 (= res!816141 (noDuplicate!1674 acc!823))))

(declare-fun b!1227527 () Bool)

(declare-fun res!816136 () Bool)

(assert (=> b!1227527 (=> (not res!816136) (not e!697002))))

(assert (=> b!1227527 (= res!816136 (not (contains!7077 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227528 () Bool)

(declare-fun res!816140 () Bool)

(assert (=> b!1227528 (=> (not res!816140) (not e!697002))))

(assert (=> b!1227528 (= res!816140 (validKeyInArray!0 k!2913))))

(declare-fun b!1227529 () Bool)

(declare-fun res!816133 () Bool)

(assert (=> b!1227529 (=> res!816133 e!697003)))

(assert (=> b!1227529 (= res!816133 (contains!7077 Nil!27012 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227530 () Bool)

(declare-fun res!816132 () Bool)

(assert (=> b!1227530 (=> (not res!816132) (not e!697002))))

(assert (=> b!1227530 (= res!816132 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38778 a!3806)) (bvslt from!3184 (size!38778 a!3806))))))

(declare-fun b!1227531 () Bool)

(declare-fun res!816135 () Bool)

(assert (=> b!1227531 (=> (not res!816135) (not e!697002))))

(assert (=> b!1227531 (= res!816135 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227532 () Bool)

(declare-fun res!816143 () Bool)

(assert (=> b!1227532 (=> res!816143 e!697003)))

(declare-fun subseq!481 (List!27015 List!27015) Bool)

(assert (=> b!1227532 (= res!816143 (not (subseq!481 Nil!27012 acc!823)))))

(assert (= (and start!101966 res!816134) b!1227528))

(assert (= (and b!1227528 res!816140) b!1227530))

(assert (= (and b!1227530 res!816132) b!1227526))

(assert (= (and b!1227526 res!816141) b!1227527))

(assert (= (and b!1227527 res!816136) b!1227522))

(assert (= (and b!1227522 res!816138) b!1227520))

(assert (= (and b!1227520 res!816144) b!1227531))

(assert (= (and b!1227531 res!816135) b!1227524))

(assert (= (and b!1227524 res!816137) b!1227523))

(assert (= (and b!1227523 (not res!816142)) b!1227521))

(assert (= (and b!1227521 (not res!816139)) b!1227529))

(assert (= (and b!1227529 (not res!816133)) b!1227532))

(assert (= (and b!1227532 (not res!816143)) b!1227525))

(declare-fun m!1132283 () Bool)

(assert (=> start!101966 m!1132283))

(declare-fun m!1132285 () Bool)

(assert (=> b!1227525 m!1132285))

(declare-fun m!1132287 () Bool)

(assert (=> b!1227524 m!1132287))

(assert (=> b!1227524 m!1132287))

(declare-fun m!1132289 () Bool)

(assert (=> b!1227524 m!1132289))

(declare-fun m!1132291 () Bool)

(assert (=> b!1227532 m!1132291))

(declare-fun m!1132293 () Bool)

(assert (=> b!1227529 m!1132293))

(declare-fun m!1132295 () Bool)

(assert (=> b!1227520 m!1132295))

(assert (=> b!1227523 m!1132287))

(declare-fun m!1132297 () Bool)

(assert (=> b!1227523 m!1132297))

(declare-fun m!1132299 () Bool)

(assert (=> b!1227521 m!1132299))

(declare-fun m!1132301 () Bool)

(assert (=> b!1227528 m!1132301))

(declare-fun m!1132303 () Bool)

(assert (=> b!1227531 m!1132303))

(declare-fun m!1132305 () Bool)

(assert (=> b!1227527 m!1132305))

(declare-fun m!1132307 () Bool)

(assert (=> b!1227526 m!1132307))

(declare-fun m!1132309 () Bool)

(assert (=> b!1227522 m!1132309))

(push 1)

(assert (not b!1227527))

(assert (not b!1227525))

(assert (not start!101966))

(assert (not b!1227531))

(assert (not b!1227520))

(assert (not b!1227523))

(assert (not b!1227528))

(assert (not b!1227524))

(assert (not b!1227522))

(assert (not b!1227526))

(assert (not b!1227532))

(assert (not b!1227521))

(assert (not b!1227529))

(check-sat)

