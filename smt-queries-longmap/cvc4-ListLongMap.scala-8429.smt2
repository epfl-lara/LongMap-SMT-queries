; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102664 () Bool)

(assert start!102664)

(declare-fun b!1234140 () Bool)

(declare-fun res!822326 () Bool)

(declare-fun e!699975 () Bool)

(assert (=> b!1234140 (=> (not res!822326) (not e!699975))))

(declare-datatypes ((List!27159 0))(
  ( (Nil!27156) (Cons!27155 (h!28364 (_ BitVec 64)) (t!40622 List!27159)) )
))
(declare-fun acc!823 () List!27159)

(declare-fun contains!7221 (List!27159 (_ BitVec 64)) Bool)

(assert (=> b!1234140 (= res!822326 (not (contains!7221 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!822324 () Bool)

(assert (=> start!102664 (=> (not res!822324) (not e!699975))))

(declare-datatypes ((array!79554 0))(
  ( (array!79555 (arr!38386 (Array (_ BitVec 32) (_ BitVec 64))) (size!38922 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79554)

(assert (=> start!102664 (= res!822324 (bvslt (size!38922 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102664 e!699975))

(declare-fun array_inv!29234 (array!79554) Bool)

(assert (=> start!102664 (array_inv!29234 a!3806)))

(assert (=> start!102664 true))

(declare-fun b!1234141 () Bool)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1234141 (= e!699975 (= (select (arr!38386 a!3806) from!3184) k!2913))))

(declare-fun b!1234142 () Bool)

(declare-fun res!822327 () Bool)

(assert (=> b!1234142 (=> (not res!822327) (not e!699975))))

(declare-fun arrayNoDuplicates!0 (array!79554 (_ BitVec 32) List!27159) Bool)

(assert (=> b!1234142 (= res!822327 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1234143 () Bool)

(declare-fun res!822325 () Bool)

(assert (=> b!1234143 (=> (not res!822325) (not e!699975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234143 (= res!822325 (validKeyInArray!0 k!2913))))

(declare-fun b!1234144 () Bool)

(declare-fun res!822322 () Bool)

(assert (=> b!1234144 (=> (not res!822322) (not e!699975))))

(declare-fun noDuplicate!1818 (List!27159) Bool)

(assert (=> b!1234144 (= res!822322 (noDuplicate!1818 acc!823))))

(declare-fun b!1234145 () Bool)

(declare-fun res!822328 () Bool)

(assert (=> b!1234145 (=> (not res!822328) (not e!699975))))

(assert (=> b!1234145 (= res!822328 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38922 a!3806)) (bvslt from!3184 (size!38922 a!3806))))))

(declare-fun b!1234146 () Bool)

(declare-fun res!822321 () Bool)

(assert (=> b!1234146 (=> (not res!822321) (not e!699975))))

(declare-fun arrayContainsKey!0 (array!79554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234146 (= res!822321 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1234147 () Bool)

(declare-fun res!822320 () Bool)

(assert (=> b!1234147 (=> (not res!822320) (not e!699975))))

(assert (=> b!1234147 (= res!822320 (not (contains!7221 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234148 () Bool)

(declare-fun res!822323 () Bool)

(assert (=> b!1234148 (=> (not res!822323) (not e!699975))))

(assert (=> b!1234148 (= res!822323 (not (validKeyInArray!0 (select (arr!38386 a!3806) from!3184))))))

(assert (= (and start!102664 res!822324) b!1234143))

(assert (= (and b!1234143 res!822325) b!1234145))

(assert (= (and b!1234145 res!822328) b!1234144))

(assert (= (and b!1234144 res!822322) b!1234147))

(assert (= (and b!1234147 res!822320) b!1234140))

(assert (= (and b!1234140 res!822326) b!1234146))

(assert (= (and b!1234146 res!822321) b!1234142))

(assert (= (and b!1234142 res!822327) b!1234148))

(assert (= (and b!1234148 res!822323) b!1234141))

(declare-fun m!1138159 () Bool)

(assert (=> b!1234144 m!1138159))

(declare-fun m!1138161 () Bool)

(assert (=> start!102664 m!1138161))

(declare-fun m!1138163 () Bool)

(assert (=> b!1234143 m!1138163))

(declare-fun m!1138165 () Bool)

(assert (=> b!1234142 m!1138165))

(declare-fun m!1138167 () Bool)

(assert (=> b!1234141 m!1138167))

(declare-fun m!1138169 () Bool)

(assert (=> b!1234140 m!1138169))

(assert (=> b!1234148 m!1138167))

(assert (=> b!1234148 m!1138167))

(declare-fun m!1138171 () Bool)

(assert (=> b!1234148 m!1138171))

(declare-fun m!1138173 () Bool)

(assert (=> b!1234147 m!1138173))

(declare-fun m!1138175 () Bool)

(assert (=> b!1234146 m!1138175))

(push 1)

(assert (not b!1234144))

(assert (not b!1234147))

(assert (not start!102664))

(assert (not b!1234148))

(assert (not b!1234140))

(assert (not b!1234142))

(assert (not b!1234143))

(assert (not b!1234146))

(check-sat)

(pop 1)

