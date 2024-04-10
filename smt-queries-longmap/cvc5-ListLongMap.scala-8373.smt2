; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101842 () Bool)

(assert start!101842)

(declare-fun b!1226598 () Bool)

(declare-fun res!815247 () Bool)

(declare-fun e!696595 () Bool)

(assert (=> b!1226598 (=> (not res!815247) (not e!696595))))

(declare-datatypes ((List!26989 0))(
  ( (Nil!26986) (Cons!26985 (h!28194 (_ BitVec 64)) (t!40452 List!26989)) )
))
(declare-fun acc!823 () List!26989)

(declare-fun contains!7051 (List!26989 (_ BitVec 64)) Bool)

(assert (=> b!1226598 (= res!815247 (not (contains!7051 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!815246 () Bool)

(assert (=> start!101842 (=> (not res!815246) (not e!696595))))

(declare-datatypes ((array!79181 0))(
  ( (array!79182 (arr!38216 (Array (_ BitVec 32) (_ BitVec 64))) (size!38752 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79181)

(assert (=> start!101842 (= res!815246 (bvslt (size!38752 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101842 e!696595))

(declare-fun array_inv!29064 (array!79181) Bool)

(assert (=> start!101842 (array_inv!29064 a!3806)))

(assert (=> start!101842 true))

(declare-fun b!1226599 () Bool)

(declare-fun res!815249 () Bool)

(assert (=> b!1226599 (=> (not res!815249) (not e!696595))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226599 (= res!815249 (validKeyInArray!0 k!2913))))

(declare-fun b!1226600 () Bool)

(declare-fun res!815248 () Bool)

(assert (=> b!1226600 (=> (not res!815248) (not e!696595))))

(declare-fun noDuplicate!1648 (List!26989) Bool)

(assert (=> b!1226600 (= res!815248 (noDuplicate!1648 acc!823))))

(declare-fun b!1226601 () Bool)

(declare-fun res!815250 () Bool)

(assert (=> b!1226601 (=> (not res!815250) (not e!696595))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226601 (= res!815250 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38752 a!3806)) (bvslt from!3184 (size!38752 a!3806))))))

(declare-fun b!1226602 () Bool)

(assert (=> b!1226602 (= e!696595 false)))

(declare-fun lt!558831 () Bool)

(assert (=> b!1226602 (= lt!558831 (contains!7051 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!101842 res!815246) b!1226599))

(assert (= (and b!1226599 res!815249) b!1226601))

(assert (= (and b!1226601 res!815250) b!1226600))

(assert (= (and b!1226600 res!815248) b!1226598))

(assert (= (and b!1226598 res!815247) b!1226602))

(declare-fun m!1131639 () Bool)

(assert (=> b!1226599 m!1131639))

(declare-fun m!1131641 () Bool)

(assert (=> b!1226598 m!1131641))

(declare-fun m!1131643 () Bool)

(assert (=> start!101842 m!1131643))

(declare-fun m!1131645 () Bool)

(assert (=> b!1226600 m!1131645))

(declare-fun m!1131647 () Bool)

(assert (=> b!1226602 m!1131647))

(push 1)

(assert (not b!1226598))

(assert (not b!1226602))

(assert (not b!1226599))

(assert (not start!101842))

(assert (not b!1226600))

(check-sat)

(pop 1)

