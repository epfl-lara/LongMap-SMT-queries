; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101830 () Bool)

(assert start!101830)

(declare-fun res!815138 () Bool)

(declare-fun e!696560 () Bool)

(assert (=> start!101830 (=> (not res!815138) (not e!696560))))

(declare-datatypes ((array!79169 0))(
  ( (array!79170 (arr!38210 (Array (_ BitVec 32) (_ BitVec 64))) (size!38746 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79169)

(assert (=> start!101830 (= res!815138 (bvslt (size!38746 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101830 e!696560))

(declare-fun array_inv!29058 (array!79169) Bool)

(assert (=> start!101830 (array_inv!29058 a!3806)))

(assert (=> start!101830 true))

(declare-fun b!1226490 () Bool)

(assert (=> b!1226490 (= e!696560 false)))

(declare-fun lt!558822 () Bool)

(declare-datatypes ((List!26983 0))(
  ( (Nil!26980) (Cons!26979 (h!28188 (_ BitVec 64)) (t!40446 List!26983)) )
))
(declare-fun acc!823 () List!26983)

(declare-fun contains!7045 (List!26983 (_ BitVec 64)) Bool)

(assert (=> b!1226490 (= lt!558822 (contains!7045 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226491 () Bool)

(declare-fun res!815139 () Bool)

(assert (=> b!1226491 (=> (not res!815139) (not e!696560))))

(assert (=> b!1226491 (= res!815139 (not (contains!7045 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226492 () Bool)

(declare-fun res!815142 () Bool)

(assert (=> b!1226492 (=> (not res!815142) (not e!696560))))

(declare-fun noDuplicate!1642 (List!26983) Bool)

(assert (=> b!1226492 (= res!815142 (noDuplicate!1642 acc!823))))

(declare-fun b!1226493 () Bool)

(declare-fun res!815140 () Bool)

(assert (=> b!1226493 (=> (not res!815140) (not e!696560))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226493 (= res!815140 (validKeyInArray!0 k!2913))))

(declare-fun b!1226494 () Bool)

(declare-fun res!815141 () Bool)

(assert (=> b!1226494 (=> (not res!815141) (not e!696560))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226494 (= res!815141 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38746 a!3806)) (bvslt from!3184 (size!38746 a!3806))))))

(assert (= (and start!101830 res!815138) b!1226493))

(assert (= (and b!1226493 res!815140) b!1226494))

(assert (= (and b!1226494 res!815141) b!1226492))

(assert (= (and b!1226492 res!815142) b!1226491))

(assert (= (and b!1226491 res!815139) b!1226490))

(declare-fun m!1131573 () Bool)

(assert (=> b!1226490 m!1131573))

(declare-fun m!1131575 () Bool)

(assert (=> b!1226491 m!1131575))

(declare-fun m!1131577 () Bool)

(assert (=> start!101830 m!1131577))

(declare-fun m!1131579 () Bool)

(assert (=> b!1226492 m!1131579))

(declare-fun m!1131581 () Bool)

(assert (=> b!1226493 m!1131581))

(push 1)

(assert (not start!101830))

(assert (not b!1226493))

(assert (not b!1226492))

(assert (not b!1226491))

(assert (not b!1226490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

