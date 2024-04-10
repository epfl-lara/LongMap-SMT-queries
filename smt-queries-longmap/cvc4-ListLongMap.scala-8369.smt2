; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101822 () Bool)

(assert start!101822)

(declare-fun b!1226429 () Bool)

(declare-fun res!815081 () Bool)

(declare-fun e!696535 () Bool)

(assert (=> b!1226429 (=> (not res!815081) (not e!696535))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226429 (= res!815081 (validKeyInArray!0 k!2913))))

(declare-fun res!815078 () Bool)

(assert (=> start!101822 (=> (not res!815078) (not e!696535))))

(declare-datatypes ((array!79161 0))(
  ( (array!79162 (arr!38206 (Array (_ BitVec 32) (_ BitVec 64))) (size!38742 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79161)

(assert (=> start!101822 (= res!815078 (bvslt (size!38742 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101822 e!696535))

(declare-fun array_inv!29054 (array!79161) Bool)

(assert (=> start!101822 (array_inv!29054 a!3806)))

(assert (=> start!101822 true))

(declare-fun b!1226430 () Bool)

(declare-fun res!815077 () Bool)

(assert (=> b!1226430 (=> (not res!815077) (not e!696535))))

(declare-datatypes ((List!26979 0))(
  ( (Nil!26976) (Cons!26975 (h!28184 (_ BitVec 64)) (t!40442 List!26979)) )
))
(declare-fun acc!823 () List!26979)

(declare-fun noDuplicate!1638 (List!26979) Bool)

(assert (=> b!1226430 (= res!815077 (noDuplicate!1638 acc!823))))

(declare-fun b!1226431 () Bool)

(declare-fun res!815079 () Bool)

(assert (=> b!1226431 (=> (not res!815079) (not e!696535))))

(declare-fun contains!7041 (List!26979 (_ BitVec 64)) Bool)

(assert (=> b!1226431 (= res!815079 (not (contains!7041 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226432 () Bool)

(declare-fun res!815080 () Bool)

(assert (=> b!1226432 (=> (not res!815080) (not e!696535))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226432 (= res!815080 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38742 a!3806)) (bvslt from!3184 (size!38742 a!3806))))))

(declare-fun b!1226433 () Bool)

(declare-fun res!815082 () Bool)

(assert (=> b!1226433 (=> (not res!815082) (not e!696535))))

(assert (=> b!1226433 (= res!815082 (not (contains!7041 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226434 () Bool)

(assert (=> b!1226434 (= e!696535 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (= (and start!101822 res!815078) b!1226429))

(assert (= (and b!1226429 res!815081) b!1226432))

(assert (= (and b!1226432 res!815080) b!1226430))

(assert (= (and b!1226430 res!815077) b!1226431))

(assert (= (and b!1226431 res!815079) b!1226433))

(assert (= (and b!1226433 res!815082) b!1226434))

(declare-fun m!1131533 () Bool)

(assert (=> b!1226430 m!1131533))

(declare-fun m!1131535 () Bool)

(assert (=> start!101822 m!1131535))

(declare-fun m!1131537 () Bool)

(assert (=> b!1226429 m!1131537))

(declare-fun m!1131539 () Bool)

(assert (=> b!1226433 m!1131539))

(declare-fun m!1131541 () Bool)

(assert (=> b!1226431 m!1131541))

(push 1)

(assert (not b!1226429))

(assert (not b!1226433))

(assert (not b!1226430))

(assert (not b!1226431))

(assert (not start!101822))

(check-sat)

