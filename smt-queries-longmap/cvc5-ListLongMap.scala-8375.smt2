; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101854 () Bool)

(assert start!101854)

(declare-fun b!1226688 () Bool)

(declare-fun res!815336 () Bool)

(declare-fun e!696632 () Bool)

(assert (=> b!1226688 (=> (not res!815336) (not e!696632))))

(declare-datatypes ((List!26995 0))(
  ( (Nil!26992) (Cons!26991 (h!28200 (_ BitVec 64)) (t!40458 List!26995)) )
))
(declare-fun acc!823 () List!26995)

(declare-fun noDuplicate!1654 (List!26995) Bool)

(assert (=> b!1226688 (= res!815336 (noDuplicate!1654 acc!823))))

(declare-fun b!1226689 () Bool)

(declare-fun res!815340 () Bool)

(assert (=> b!1226689 (=> (not res!815340) (not e!696632))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226689 (= res!815340 (validKeyInArray!0 k!2913))))

(declare-fun b!1226690 () Bool)

(declare-fun res!815338 () Bool)

(assert (=> b!1226690 (=> (not res!815338) (not e!696632))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79193 0))(
  ( (array!79194 (arr!38222 (Array (_ BitVec 32) (_ BitVec 64))) (size!38758 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79193)

(assert (=> b!1226690 (= res!815338 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38758 a!3806)) (bvslt from!3184 (size!38758 a!3806))))))

(declare-fun b!1226691 () Bool)

(declare-fun res!815337 () Bool)

(assert (=> b!1226691 (=> (not res!815337) (not e!696632))))

(declare-fun contains!7057 (List!26995 (_ BitVec 64)) Bool)

(assert (=> b!1226691 (= res!815337 (not (contains!7057 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226692 () Bool)

(assert (=> b!1226692 (= e!696632 false)))

(declare-fun lt!558849 () Bool)

(assert (=> b!1226692 (= lt!558849 (contains!7057 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!815339 () Bool)

(assert (=> start!101854 (=> (not res!815339) (not e!696632))))

(assert (=> start!101854 (= res!815339 (bvslt (size!38758 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101854 e!696632))

(declare-fun array_inv!29070 (array!79193) Bool)

(assert (=> start!101854 (array_inv!29070 a!3806)))

(assert (=> start!101854 true))

(assert (= (and start!101854 res!815339) b!1226689))

(assert (= (and b!1226689 res!815340) b!1226690))

(assert (= (and b!1226690 res!815338) b!1226688))

(assert (= (and b!1226688 res!815336) b!1226691))

(assert (= (and b!1226691 res!815337) b!1226692))

(declare-fun m!1131699 () Bool)

(assert (=> b!1226692 m!1131699))

(declare-fun m!1131701 () Bool)

(assert (=> start!101854 m!1131701))

(declare-fun m!1131703 () Bool)

(assert (=> b!1226689 m!1131703))

(declare-fun m!1131705 () Bool)

(assert (=> b!1226691 m!1131705))

(declare-fun m!1131707 () Bool)

(assert (=> b!1226688 m!1131707))

(push 1)

(assert (not b!1226692))

(assert (not b!1226688))

(assert (not start!101854))

(assert (not b!1226691))

(assert (not b!1226689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

