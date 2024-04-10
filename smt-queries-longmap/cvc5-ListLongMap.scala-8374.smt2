; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101848 () Bool)

(assert start!101848)

(declare-fun b!1226643 () Bool)

(declare-fun res!815291 () Bool)

(declare-fun e!696614 () Bool)

(assert (=> b!1226643 (=> (not res!815291) (not e!696614))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79187 0))(
  ( (array!79188 (arr!38219 (Array (_ BitVec 32) (_ BitVec 64))) (size!38755 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79187)

(assert (=> b!1226643 (= res!815291 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38755 a!3806)) (bvslt from!3184 (size!38755 a!3806))))))

(declare-fun b!1226644 () Bool)

(declare-fun res!815295 () Bool)

(assert (=> b!1226644 (=> (not res!815295) (not e!696614))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226644 (= res!815295 (validKeyInArray!0 k!2913))))

(declare-fun b!1226645 () Bool)

(assert (=> b!1226645 (= e!696614 false)))

(declare-fun lt!558840 () Bool)

(declare-datatypes ((List!26992 0))(
  ( (Nil!26989) (Cons!26988 (h!28197 (_ BitVec 64)) (t!40455 List!26992)) )
))
(declare-fun acc!823 () List!26992)

(declare-fun contains!7054 (List!26992 (_ BitVec 64)) Bool)

(assert (=> b!1226645 (= lt!558840 (contains!7054 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!815293 () Bool)

(assert (=> start!101848 (=> (not res!815293) (not e!696614))))

(assert (=> start!101848 (= res!815293 (bvslt (size!38755 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101848 e!696614))

(declare-fun array_inv!29067 (array!79187) Bool)

(assert (=> start!101848 (array_inv!29067 a!3806)))

(assert (=> start!101848 true))

(declare-fun b!1226646 () Bool)

(declare-fun res!815292 () Bool)

(assert (=> b!1226646 (=> (not res!815292) (not e!696614))))

(declare-fun noDuplicate!1651 (List!26992) Bool)

(assert (=> b!1226646 (= res!815292 (noDuplicate!1651 acc!823))))

(declare-fun b!1226647 () Bool)

(declare-fun res!815294 () Bool)

(assert (=> b!1226647 (=> (not res!815294) (not e!696614))))

(assert (=> b!1226647 (= res!815294 (not (contains!7054 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101848 res!815293) b!1226644))

(assert (= (and b!1226644 res!815295) b!1226643))

(assert (= (and b!1226643 res!815291) b!1226646))

(assert (= (and b!1226646 res!815292) b!1226647))

(assert (= (and b!1226647 res!815294) b!1226645))

(declare-fun m!1131669 () Bool)

(assert (=> b!1226647 m!1131669))

(declare-fun m!1131671 () Bool)

(assert (=> start!101848 m!1131671))

(declare-fun m!1131673 () Bool)

(assert (=> b!1226644 m!1131673))

(declare-fun m!1131675 () Bool)

(assert (=> b!1226645 m!1131675))

(declare-fun m!1131677 () Bool)

(assert (=> b!1226646 m!1131677))

(push 1)

(assert (not b!1226645))

(assert (not b!1226646))

(assert (not b!1226644))

(assert (not start!101848))

(assert (not b!1226647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

