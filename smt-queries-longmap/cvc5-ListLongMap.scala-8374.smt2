; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102088 () Bool)

(assert start!102088)

(declare-fun b!1227960 () Bool)

(declare-fun res!815829 () Bool)

(declare-fun e!697457 () Bool)

(assert (=> b!1227960 (=> (not res!815829) (not e!697457))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227960 (= res!815829 (validKeyInArray!0 k!2913))))

(declare-fun res!815827 () Bool)

(assert (=> start!102088 (=> (not res!815827) (not e!697457))))

(declare-datatypes ((array!79227 0))(
  ( (array!79228 (arr!38233 (Array (_ BitVec 32) (_ BitVec 64))) (size!38770 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79227)

(assert (=> start!102088 (= res!815827 (bvslt (size!38770 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102088 e!697457))

(declare-fun array_inv!29171 (array!79227) Bool)

(assert (=> start!102088 (array_inv!29171 a!3806)))

(assert (=> start!102088 true))

(declare-fun b!1227961 () Bool)

(declare-fun res!815828 () Bool)

(assert (=> b!1227961 (=> (not res!815828) (not e!697457))))

(declare-datatypes ((List!27019 0))(
  ( (Nil!27016) (Cons!27015 (h!28233 (_ BitVec 64)) (t!40474 List!27019)) )
))
(declare-fun acc!823 () List!27019)

(declare-fun contains!7090 (List!27019 (_ BitVec 64)) Bool)

(assert (=> b!1227961 (= res!815828 (not (contains!7090 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227962 () Bool)

(declare-fun res!815830 () Bool)

(assert (=> b!1227962 (=> (not res!815830) (not e!697457))))

(declare-fun noDuplicate!1671 (List!27019) Bool)

(assert (=> b!1227962 (= res!815830 (noDuplicate!1671 acc!823))))

(declare-fun b!1227963 () Bool)

(assert (=> b!1227963 (= e!697457 false)))

(declare-fun lt!559326 () Bool)

(assert (=> b!1227963 (= lt!559326 (contains!7090 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227964 () Bool)

(declare-fun res!815831 () Bool)

(assert (=> b!1227964 (=> (not res!815831) (not e!697457))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227964 (= res!815831 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38770 a!3806)) (bvslt from!3184 (size!38770 a!3806))))))

(assert (= (and start!102088 res!815827) b!1227960))

(assert (= (and b!1227960 res!815829) b!1227964))

(assert (= (and b!1227964 res!815831) b!1227962))

(assert (= (and b!1227962 res!815830) b!1227961))

(assert (= (and b!1227961 res!815828) b!1227963))

(declare-fun m!1133279 () Bool)

(assert (=> b!1227963 m!1133279))

(declare-fun m!1133281 () Bool)

(assert (=> b!1227961 m!1133281))

(declare-fun m!1133283 () Bool)

(assert (=> start!102088 m!1133283))

(declare-fun m!1133285 () Bool)

(assert (=> b!1227960 m!1133285))

(declare-fun m!1133287 () Bool)

(assert (=> b!1227962 m!1133287))

(push 1)

(assert (not b!1227960))

(assert (not b!1227961))

(assert (not b!1227962))

(assert (not b!1227963))

(assert (not start!102088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

