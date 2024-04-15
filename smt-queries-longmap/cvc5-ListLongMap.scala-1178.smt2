; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25416 () Bool)

(assert start!25416)

(declare-fun b!264549 () Bool)

(declare-fun res!129113 () Bool)

(declare-fun e!171378 () Bool)

(assert (=> b!264549 (=> (not res!129113) (not e!171378))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264549 (= res!129113 (validKeyInArray!0 k!2698))))

(declare-fun b!264551 () Bool)

(assert (=> b!264551 (= e!171378 false)))

(declare-datatypes ((SeekEntryResult!1198 0))(
  ( (MissingZero!1198 (index!6962 (_ BitVec 32))) (Found!1198 (index!6963 (_ BitVec 32))) (Intermediate!1198 (undefined!2010 Bool) (index!6964 (_ BitVec 32)) (x!25306 (_ BitVec 32))) (Undefined!1198) (MissingVacant!1198 (index!6965 (_ BitVec 32))) )
))
(declare-fun lt!133713 () SeekEntryResult!1198)

(declare-datatypes ((array!12700 0))(
  ( (array!12701 (arr!6008 (Array (_ BitVec 32) (_ BitVec 64))) (size!6361 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12700)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12700 (_ BitVec 32)) SeekEntryResult!1198)

(assert (=> b!264551 (= lt!133713 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264548 () Bool)

(declare-fun res!129115 () Bool)

(assert (=> b!264548 (=> (not res!129115) (not e!171378))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264548 (= res!129115 (and (= (size!6361 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6361 a!3436))))))

(declare-fun res!129112 () Bool)

(assert (=> start!25416 (=> (not res!129112) (not e!171378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25416 (= res!129112 (validMask!0 mask!4002))))

(assert (=> start!25416 e!171378))

(assert (=> start!25416 true))

(declare-fun array_inv!3980 (array!12700) Bool)

(assert (=> start!25416 (array_inv!3980 a!3436)))

(declare-fun b!264550 () Bool)

(declare-fun res!129114 () Bool)

(assert (=> b!264550 (=> (not res!129114) (not e!171378))))

(declare-fun arrayContainsKey!0 (array!12700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264550 (= res!129114 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25416 res!129112) b!264548))

(assert (= (and b!264548 res!129115) b!264549))

(assert (= (and b!264549 res!129113) b!264550))

(assert (= (and b!264550 res!129114) b!264551))

(declare-fun m!281089 () Bool)

(assert (=> b!264549 m!281089))

(declare-fun m!281091 () Bool)

(assert (=> b!264551 m!281091))

(declare-fun m!281093 () Bool)

(assert (=> start!25416 m!281093))

(declare-fun m!281095 () Bool)

(assert (=> start!25416 m!281095))

(declare-fun m!281097 () Bool)

(assert (=> b!264550 m!281097))

(push 1)

(assert (not b!264551))

(assert (not b!264549))

(assert (not b!264550))

(assert (not start!25416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

