; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102082 () Bool)

(assert start!102082)

(declare-fun b!1227915 () Bool)

(declare-fun res!815784 () Bool)

(declare-fun e!697439 () Bool)

(assert (=> b!1227915 (=> (not res!815784) (not e!697439))))

(declare-datatypes ((List!27016 0))(
  ( (Nil!27013) (Cons!27012 (h!28230 (_ BitVec 64)) (t!40471 List!27016)) )
))
(declare-fun acc!823 () List!27016)

(declare-fun contains!7087 (List!27016 (_ BitVec 64)) Bool)

(assert (=> b!1227915 (= res!815784 (not (contains!7087 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227916 () Bool)

(assert (=> b!1227916 (= e!697439 false)))

(declare-fun lt!559317 () Bool)

(assert (=> b!1227916 (= lt!559317 (contains!7087 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!815782 () Bool)

(assert (=> start!102082 (=> (not res!815782) (not e!697439))))

(declare-datatypes ((array!79221 0))(
  ( (array!79222 (arr!38230 (Array (_ BitVec 32) (_ BitVec 64))) (size!38767 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79221)

(assert (=> start!102082 (= res!815782 (bvslt (size!38767 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102082 e!697439))

(declare-fun array_inv!29168 (array!79221) Bool)

(assert (=> start!102082 (array_inv!29168 a!3806)))

(assert (=> start!102082 true))

(declare-fun b!1227917 () Bool)

(declare-fun res!815783 () Bool)

(assert (=> b!1227917 (=> (not res!815783) (not e!697439))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227917 (= res!815783 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38767 a!3806)) (bvslt from!3184 (size!38767 a!3806))))))

(declare-fun b!1227918 () Bool)

(declare-fun res!815786 () Bool)

(assert (=> b!1227918 (=> (not res!815786) (not e!697439))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227918 (= res!815786 (validKeyInArray!0 k!2913))))

(declare-fun b!1227919 () Bool)

(declare-fun res!815785 () Bool)

(assert (=> b!1227919 (=> (not res!815785) (not e!697439))))

(declare-fun noDuplicate!1668 (List!27016) Bool)

(assert (=> b!1227919 (= res!815785 (noDuplicate!1668 acc!823))))

(assert (= (and start!102082 res!815782) b!1227918))

(assert (= (and b!1227918 res!815786) b!1227917))

(assert (= (and b!1227917 res!815783) b!1227919))

(assert (= (and b!1227919 res!815785) b!1227915))

(assert (= (and b!1227915 res!815784) b!1227916))

(declare-fun m!1133249 () Bool)

(assert (=> b!1227916 m!1133249))

(declare-fun m!1133251 () Bool)

(assert (=> start!102082 m!1133251))

(declare-fun m!1133253 () Bool)

(assert (=> b!1227918 m!1133253))

(declare-fun m!1133255 () Bool)

(assert (=> b!1227919 m!1133255))

(declare-fun m!1133257 () Bool)

(assert (=> b!1227915 m!1133257))

(push 1)

(assert (not b!1227915))

(assert (not b!1227919))

(assert (not start!102082))

(assert (not b!1227918))

(assert (not b!1227916))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

