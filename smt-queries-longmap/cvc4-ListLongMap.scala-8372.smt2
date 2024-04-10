; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101840 () Bool)

(assert start!101840)

(declare-fun res!815230 () Bool)

(declare-fun e!696589 () Bool)

(assert (=> start!101840 (=> (not res!815230) (not e!696589))))

(declare-datatypes ((array!79179 0))(
  ( (array!79180 (arr!38215 (Array (_ BitVec 32) (_ BitVec 64))) (size!38751 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79179)

(assert (=> start!101840 (= res!815230 (bvslt (size!38751 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101840 e!696589))

(declare-fun array_inv!29063 (array!79179) Bool)

(assert (=> start!101840 (array_inv!29063 a!3806)))

(assert (=> start!101840 true))

(declare-fun b!1226581 () Bool)

(declare-fun res!815234 () Bool)

(assert (=> b!1226581 (=> (not res!815234) (not e!696589))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226581 (= res!815234 (validKeyInArray!0 k!2913))))

(declare-fun b!1226582 () Bool)

(declare-fun res!815232 () Bool)

(assert (=> b!1226582 (=> (not res!815232) (not e!696589))))

(declare-datatypes ((List!26988 0))(
  ( (Nil!26985) (Cons!26984 (h!28193 (_ BitVec 64)) (t!40451 List!26988)) )
))
(declare-fun acc!823 () List!26988)

(declare-fun noDuplicate!1647 (List!26988) Bool)

(assert (=> b!1226582 (= res!815232 (noDuplicate!1647 acc!823))))

(declare-fun b!1226583 () Bool)

(declare-fun res!815231 () Bool)

(assert (=> b!1226583 (=> (not res!815231) (not e!696589))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226583 (= res!815231 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38751 a!3806)) (bvslt from!3184 (size!38751 a!3806))))))

(declare-fun b!1226584 () Bool)

(declare-fun res!815233 () Bool)

(assert (=> b!1226584 (=> (not res!815233) (not e!696589))))

(declare-fun contains!7050 (List!26988 (_ BitVec 64)) Bool)

(assert (=> b!1226584 (= res!815233 (not (contains!7050 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226585 () Bool)

(assert (=> b!1226585 (= e!696589 (bvsgt from!3184 (size!38751 a!3806)))))

(declare-fun b!1226586 () Bool)

(declare-fun res!815229 () Bool)

(assert (=> b!1226586 (=> (not res!815229) (not e!696589))))

(assert (=> b!1226586 (= res!815229 (not (contains!7050 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226587 () Bool)

(declare-fun res!815235 () Bool)

(assert (=> b!1226587 (=> (not res!815235) (not e!696589))))

(declare-fun arrayContainsKey!0 (array!79179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226587 (= res!815235 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!101840 res!815230) b!1226581))

(assert (= (and b!1226581 res!815234) b!1226583))

(assert (= (and b!1226583 res!815231) b!1226582))

(assert (= (and b!1226582 res!815232) b!1226586))

(assert (= (and b!1226586 res!815229) b!1226584))

(assert (= (and b!1226584 res!815233) b!1226587))

(assert (= (and b!1226587 res!815235) b!1226585))

(declare-fun m!1131627 () Bool)

(assert (=> start!101840 m!1131627))

(declare-fun m!1131629 () Bool)

(assert (=> b!1226587 m!1131629))

(declare-fun m!1131631 () Bool)

(assert (=> b!1226584 m!1131631))

(declare-fun m!1131633 () Bool)

(assert (=> b!1226582 m!1131633))

(declare-fun m!1131635 () Bool)

(assert (=> b!1226586 m!1131635))

(declare-fun m!1131637 () Bool)

(assert (=> b!1226581 m!1131637))

(push 1)

(assert (not b!1226584))

(assert (not start!101840))

(assert (not b!1226582))

(assert (not b!1226581))

(assert (not b!1226587))

(assert (not b!1226586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

