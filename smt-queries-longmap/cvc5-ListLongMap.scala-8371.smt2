; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102070 () Bool)

(assert start!102070)

(declare-fun b!1227807 () Bool)

(declare-fun e!697402 () Bool)

(assert (=> b!1227807 (= e!697402 false)))

(declare-fun lt!559308 () Bool)

(declare-datatypes ((List!27010 0))(
  ( (Nil!27007) (Cons!27006 (h!28224 (_ BitVec 64)) (t!40465 List!27010)) )
))
(declare-fun acc!823 () List!27010)

(declare-fun contains!7081 (List!27010 (_ BitVec 64)) Bool)

(assert (=> b!1227807 (= lt!559308 (contains!7081 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227808 () Bool)

(declare-fun res!815677 () Bool)

(assert (=> b!1227808 (=> (not res!815677) (not e!697402))))

(declare-fun noDuplicate!1662 (List!27010) Bool)

(assert (=> b!1227808 (= res!815677 (noDuplicate!1662 acc!823))))

(declare-fun res!815674 () Bool)

(assert (=> start!102070 (=> (not res!815674) (not e!697402))))

(declare-datatypes ((array!79209 0))(
  ( (array!79210 (arr!38224 (Array (_ BitVec 32) (_ BitVec 64))) (size!38761 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79209)

(assert (=> start!102070 (= res!815674 (bvslt (size!38761 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102070 e!697402))

(declare-fun array_inv!29162 (array!79209) Bool)

(assert (=> start!102070 (array_inv!29162 a!3806)))

(assert (=> start!102070 true))

(declare-fun b!1227809 () Bool)

(declare-fun res!815678 () Bool)

(assert (=> b!1227809 (=> (not res!815678) (not e!697402))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227809 (= res!815678 (validKeyInArray!0 k!2913))))

(declare-fun b!1227810 () Bool)

(declare-fun res!815675 () Bool)

(assert (=> b!1227810 (=> (not res!815675) (not e!697402))))

(assert (=> b!1227810 (= res!815675 (not (contains!7081 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227811 () Bool)

(declare-fun res!815676 () Bool)

(assert (=> b!1227811 (=> (not res!815676) (not e!697402))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227811 (= res!815676 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38761 a!3806)) (bvslt from!3184 (size!38761 a!3806))))))

(assert (= (and start!102070 res!815674) b!1227809))

(assert (= (and b!1227809 res!815678) b!1227811))

(assert (= (and b!1227811 res!815676) b!1227808))

(assert (= (and b!1227808 res!815677) b!1227810))

(assert (= (and b!1227810 res!815675) b!1227807))

(declare-fun m!1133183 () Bool)

(assert (=> b!1227808 m!1133183))

(declare-fun m!1133185 () Bool)

(assert (=> b!1227810 m!1133185))

(declare-fun m!1133187 () Bool)

(assert (=> b!1227809 m!1133187))

(declare-fun m!1133189 () Bool)

(assert (=> start!102070 m!1133189))

(declare-fun m!1133191 () Bool)

(assert (=> b!1227807 m!1133191))

(push 1)

(assert (not b!1227807))

(assert (not b!1227809))

(assert (not b!1227810))

(assert (not start!102070))

(assert (not b!1227808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

