; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102192 () Bool)

(assert start!102192)

(declare-fun b!1230278 () Bool)

(declare-fun res!818765 () Bool)

(declare-fun e!698057 () Bool)

(assert (=> b!1230278 (=> (not res!818765) (not e!698057))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79367 0))(
  ( (array!79368 (arr!38303 (Array (_ BitVec 32) (_ BitVec 64))) (size!38839 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79367)

(assert (=> b!1230278 (= res!818765 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38839 a!3806)) (bvslt from!3184 (size!38839 a!3806))))))

(declare-fun b!1230279 () Bool)

(declare-fun res!818764 () Bool)

(assert (=> b!1230279 (=> (not res!818764) (not e!698057))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230279 (= res!818764 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230280 () Bool)

(declare-fun res!818770 () Bool)

(assert (=> b!1230280 (=> (not res!818770) (not e!698057))))

(declare-datatypes ((List!27076 0))(
  ( (Nil!27073) (Cons!27072 (h!28281 (_ BitVec 64)) (t!40539 List!27076)) )
))
(declare-fun acc!823 () List!27076)

(declare-fun contains!7138 (List!27076 (_ BitVec 64)) Bool)

(assert (=> b!1230280 (= res!818770 (not (contains!7138 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230281 () Bool)

(declare-fun res!818769 () Bool)

(assert (=> b!1230281 (=> (not res!818769) (not e!698057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230281 (= res!818769 (validKeyInArray!0 k!2913))))

(declare-fun b!1230282 () Bool)

(declare-fun res!818767 () Bool)

(assert (=> b!1230282 (=> (not res!818767) (not e!698057))))

(declare-fun noDuplicate!1735 (List!27076) Bool)

(assert (=> b!1230282 (= res!818767 (noDuplicate!1735 acc!823))))

(declare-fun res!818768 () Bool)

(assert (=> start!102192 (=> (not res!818768) (not e!698057))))

(assert (=> start!102192 (= res!818768 (bvslt (size!38839 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102192 e!698057))

(declare-fun array_inv!29151 (array!79367) Bool)

(assert (=> start!102192 (array_inv!29151 a!3806)))

(assert (=> start!102192 true))

(declare-fun b!1230283 () Bool)

(declare-fun res!818766 () Bool)

(assert (=> b!1230283 (=> (not res!818766) (not e!698057))))

(assert (=> b!1230283 (= res!818766 (not (contains!7138 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230284 () Bool)

(assert (=> b!1230284 (= e!698057 false)))

(declare-fun lt!559355 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79367 (_ BitVec 32) List!27076) Bool)

(assert (=> b!1230284 (= lt!559355 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102192 res!818768) b!1230281))

(assert (= (and b!1230281 res!818769) b!1230278))

(assert (= (and b!1230278 res!818765) b!1230282))

(assert (= (and b!1230282 res!818767) b!1230280))

(assert (= (and b!1230280 res!818770) b!1230283))

(assert (= (and b!1230283 res!818766) b!1230279))

(assert (= (and b!1230279 res!818764) b!1230284))

(declare-fun m!1134739 () Bool)

(assert (=> b!1230282 m!1134739))

(declare-fun m!1134741 () Bool)

(assert (=> b!1230280 m!1134741))

(declare-fun m!1134743 () Bool)

(assert (=> b!1230284 m!1134743))

(declare-fun m!1134745 () Bool)

(assert (=> b!1230279 m!1134745))

(declare-fun m!1134747 () Bool)

(assert (=> b!1230281 m!1134747))

(declare-fun m!1134749 () Bool)

(assert (=> start!102192 m!1134749))

(declare-fun m!1134751 () Bool)

(assert (=> b!1230283 m!1134751))

(push 1)

(assert (not b!1230281))

(assert (not b!1230280))

(assert (not b!1230283))

(assert (not start!102192))

(assert (not b!1230279))

(assert (not b!1230284))

(assert (not b!1230282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

