; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102656 () Bool)

(assert start!102656)

(declare-fun b!1233993 () Bool)

(declare-fun res!822210 () Bool)

(declare-fun e!699923 () Bool)

(assert (=> b!1233993 (=> (not res!822210) (not e!699923))))

(declare-datatypes ((array!79469 0))(
  ( (array!79470 (arr!38344 (Array (_ BitVec 32) (_ BitVec 64))) (size!38882 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79469)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233993 (= res!822210 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!822209 () Bool)

(assert (=> start!102656 (=> (not res!822209) (not e!699923))))

(assert (=> start!102656 (= res!822209 (bvslt (size!38882 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102656 e!699923))

(declare-fun array_inv!29327 (array!79469) Bool)

(assert (=> start!102656 (array_inv!29327 a!3806)))

(assert (=> start!102656 true))

(declare-fun b!1233994 () Bool)

(declare-fun res!822211 () Bool)

(assert (=> b!1233994 (=> (not res!822211) (not e!699923))))

(declare-datatypes ((List!27218 0))(
  ( (Nil!27215) (Cons!27214 (h!28423 (_ BitVec 64)) (t!40672 List!27218)) )
))
(declare-fun acc!823 () List!27218)

(declare-fun contains!7190 (List!27218 (_ BitVec 64)) Bool)

(assert (=> b!1233994 (= res!822211 (not (contains!7190 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233995 () Bool)

(declare-fun res!822214 () Bool)

(assert (=> b!1233995 (=> (not res!822214) (not e!699923))))

(declare-fun noDuplicate!1833 (List!27218) Bool)

(assert (=> b!1233995 (= res!822214 (noDuplicate!1833 acc!823))))

(declare-fun b!1233996 () Bool)

(declare-fun res!822212 () Bool)

(assert (=> b!1233996 (=> (not res!822212) (not e!699923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233996 (= res!822212 (validKeyInArray!0 k!2913))))

(declare-fun b!1233997 () Bool)

(declare-fun res!822213 () Bool)

(assert (=> b!1233997 (=> (not res!822213) (not e!699923))))

(assert (=> b!1233997 (= res!822213 (not (contains!7190 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233998 () Bool)

(assert (=> b!1233998 (= e!699923 false)))

(declare-fun lt!559622 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79469 (_ BitVec 32) List!27218) Bool)

(assert (=> b!1233998 (= lt!559622 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233999 () Bool)

(declare-fun res!822215 () Bool)

(assert (=> b!1233999 (=> (not res!822215) (not e!699923))))

(assert (=> b!1233999 (= res!822215 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38882 a!3806)) (bvslt from!3184 (size!38882 a!3806))))))

(assert (= (and start!102656 res!822209) b!1233996))

(assert (= (and b!1233996 res!822212) b!1233999))

(assert (= (and b!1233999 res!822215) b!1233995))

(assert (= (and b!1233995 res!822214) b!1233997))

(assert (= (and b!1233997 res!822213) b!1233994))

(assert (= (and b!1233994 res!822211) b!1233993))

(assert (= (and b!1233993 res!822210) b!1233998))

(declare-fun m!1137613 () Bool)

(assert (=> b!1233998 m!1137613))

(declare-fun m!1137615 () Bool)

(assert (=> b!1233995 m!1137615))

(declare-fun m!1137617 () Bool)

(assert (=> start!102656 m!1137617))

(declare-fun m!1137619 () Bool)

(assert (=> b!1233997 m!1137619))

(declare-fun m!1137621 () Bool)

(assert (=> b!1233996 m!1137621))

(declare-fun m!1137623 () Bool)

(assert (=> b!1233993 m!1137623))

(declare-fun m!1137625 () Bool)

(assert (=> b!1233994 m!1137625))

(push 1)

(assert (not b!1233997))

(assert (not b!1233995))

(assert (not b!1233998))

(assert (not start!102656))

(assert (not b!1233996))

(assert (not b!1233993))

(assert (not b!1233994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

