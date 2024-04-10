; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102440 () Bool)

(assert start!102440)

(declare-fun b!1232162 () Bool)

(declare-fun res!820546 () Bool)

(declare-fun e!698909 () Bool)

(assert (=> b!1232162 (=> (not res!820546) (not e!698909))))

(declare-datatypes ((List!27122 0))(
  ( (Nil!27119) (Cons!27118 (h!28327 (_ BitVec 64)) (t!40585 List!27122)) )
))
(declare-fun acc!823 () List!27122)

(declare-fun contains!7184 (List!27122 (_ BitVec 64)) Bool)

(assert (=> b!1232162 (= res!820546 (not (contains!7184 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232163 () Bool)

(declare-fun res!820542 () Bool)

(assert (=> b!1232163 (=> (not res!820542) (not e!698909))))

(declare-datatypes ((array!79471 0))(
  ( (array!79472 (arr!38349 (Array (_ BitVec 32) (_ BitVec 64))) (size!38885 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79471)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232163 (= res!820542 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232164 () Bool)

(declare-fun res!820543 () Bool)

(assert (=> b!1232164 (=> (not res!820543) (not e!698909))))

(declare-fun noDuplicate!1781 (List!27122) Bool)

(assert (=> b!1232164 (= res!820543 (noDuplicate!1781 acc!823))))

(declare-fun b!1232165 () Bool)

(declare-fun res!820541 () Bool)

(assert (=> b!1232165 (=> (not res!820541) (not e!698909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232165 (= res!820541 (validKeyInArray!0 (select (arr!38349 a!3806) from!3184)))))

(declare-fun b!1232166 () Bool)

(declare-fun res!820544 () Bool)

(assert (=> b!1232166 (=> (not res!820544) (not e!698909))))

(assert (=> b!1232166 (= res!820544 (not (contains!7184 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!820540 () Bool)

(assert (=> start!102440 (=> (not res!820540) (not e!698909))))

(assert (=> start!102440 (= res!820540 (bvslt (size!38885 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102440 e!698909))

(declare-fun array_inv!29197 (array!79471) Bool)

(assert (=> start!102440 (array_inv!29197 a!3806)))

(assert (=> start!102440 true))

(declare-fun b!1232167 () Bool)

(declare-fun res!820548 () Bool)

(assert (=> b!1232167 (=> (not res!820548) (not e!698909))))

(assert (=> b!1232167 (= res!820548 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232168 () Bool)

(assert (=> b!1232168 (= e!698909 (not true))))

(declare-fun e!698908 () Bool)

(assert (=> b!1232168 e!698908))

(declare-fun res!820549 () Bool)

(assert (=> b!1232168 (=> (not res!820549) (not e!698908))))

(declare-fun arrayNoDuplicates!0 (array!79471 (_ BitVec 32) List!27122) Bool)

(assert (=> b!1232168 (= res!820549 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27119))))

(declare-datatypes ((Unit!40804 0))(
  ( (Unit!40805) )
))
(declare-fun lt!559490 () Unit!40804)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79471 List!27122 List!27122 (_ BitVec 32)) Unit!40804)

(assert (=> b!1232168 (= lt!559490 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27119 from!3184))))

(assert (=> b!1232168 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27118 (select (arr!38349 a!3806) from!3184) acc!823))))

(declare-fun b!1232169 () Bool)

(declare-fun res!820547 () Bool)

(assert (=> b!1232169 (=> (not res!820547) (not e!698909))))

(assert (=> b!1232169 (= res!820547 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232170 () Bool)

(assert (=> b!1232170 (= e!698908 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27118 (select (arr!38349 a!3806) from!3184) Nil!27119)))))

(declare-fun b!1232171 () Bool)

(declare-fun res!820545 () Bool)

(assert (=> b!1232171 (=> (not res!820545) (not e!698909))))

(assert (=> b!1232171 (= res!820545 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38885 a!3806)) (bvslt from!3184 (size!38885 a!3806))))))

(assert (= (and start!102440 res!820540) b!1232167))

(assert (= (and b!1232167 res!820548) b!1232171))

(assert (= (and b!1232171 res!820545) b!1232164))

(assert (= (and b!1232164 res!820543) b!1232162))

(assert (= (and b!1232162 res!820546) b!1232166))

(assert (= (and b!1232166 res!820544) b!1232163))

(assert (= (and b!1232163 res!820542) b!1232169))

(assert (= (and b!1232169 res!820547) b!1232165))

(assert (= (and b!1232165 res!820541) b!1232168))

(assert (= (and b!1232168 res!820549) b!1232170))

(declare-fun m!1136187 () Bool)

(assert (=> b!1232168 m!1136187))

(declare-fun m!1136189 () Bool)

(assert (=> b!1232168 m!1136189))

(declare-fun m!1136191 () Bool)

(assert (=> b!1232168 m!1136191))

(declare-fun m!1136193 () Bool)

(assert (=> b!1232168 m!1136193))

(declare-fun m!1136195 () Bool)

(assert (=> b!1232167 m!1136195))

(declare-fun m!1136197 () Bool)

(assert (=> start!102440 m!1136197))

(declare-fun m!1136199 () Bool)

(assert (=> b!1232166 m!1136199))

(declare-fun m!1136201 () Bool)

(assert (=> b!1232162 m!1136201))

(declare-fun m!1136203 () Bool)

(assert (=> b!1232163 m!1136203))

(assert (=> b!1232170 m!1136191))

(declare-fun m!1136205 () Bool)

(assert (=> b!1232170 m!1136205))

(declare-fun m!1136207 () Bool)

(assert (=> b!1232164 m!1136207))

(declare-fun m!1136209 () Bool)

(assert (=> b!1232169 m!1136209))

(assert (=> b!1232165 m!1136191))

(assert (=> b!1232165 m!1136191))

(declare-fun m!1136211 () Bool)

(assert (=> b!1232165 m!1136211))

(check-sat (not b!1232169) (not start!102440) (not b!1232164) (not b!1232168) (not b!1232163) (not b!1232162) (not b!1232170) (not b!1232165) (not b!1232166) (not b!1232167))
(check-sat)
