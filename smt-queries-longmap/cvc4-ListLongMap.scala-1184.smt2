; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25448 () Bool)

(assert start!25448)

(declare-fun b!264921 () Bool)

(declare-fun res!129432 () Bool)

(declare-fun e!171586 () Bool)

(assert (=> b!264921 (=> (not res!129432) (not e!171586))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264921 (= res!129432 (validKeyInArray!0 k!2698))))

(declare-fun b!264923 () Bool)

(assert (=> b!264923 (= e!171586 false)))

(declare-datatypes ((array!12744 0))(
  ( (array!12745 (arr!6031 (Array (_ BitVec 32) (_ BitVec 64))) (size!6383 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12744)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1222 0))(
  ( (MissingZero!1222 (index!7058 (_ BitVec 32))) (Found!1222 (index!7059 (_ BitVec 32))) (Intermediate!1222 (undefined!2034 Bool) (index!7060 (_ BitVec 32)) (x!25379 (_ BitVec 32))) (Undefined!1222) (MissingVacant!1222 (index!7061 (_ BitVec 32))) )
))
(declare-fun lt!133939 () SeekEntryResult!1222)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12744 (_ BitVec 32)) SeekEntryResult!1222)

(assert (=> b!264923 (= lt!133939 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!129435 () Bool)

(assert (=> start!25448 (=> (not res!129435) (not e!171586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25448 (= res!129435 (validMask!0 mask!4002))))

(assert (=> start!25448 e!171586))

(assert (=> start!25448 true))

(declare-fun array_inv!3994 (array!12744) Bool)

(assert (=> start!25448 (array_inv!3994 a!3436)))

(declare-fun b!264922 () Bool)

(declare-fun res!129433 () Bool)

(assert (=> b!264922 (=> (not res!129433) (not e!171586))))

(declare-fun arrayContainsKey!0 (array!12744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264922 (= res!129433 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264920 () Bool)

(declare-fun res!129434 () Bool)

(assert (=> b!264920 (=> (not res!129434) (not e!171586))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264920 (= res!129434 (and (= (size!6383 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6383 a!3436))))))

(assert (= (and start!25448 res!129435) b!264920))

(assert (= (and b!264920 res!129434) b!264921))

(assert (= (and b!264921 res!129432) b!264922))

(assert (= (and b!264922 res!129433) b!264923))

(declare-fun m!281885 () Bool)

(assert (=> b!264921 m!281885))

(declare-fun m!281887 () Bool)

(assert (=> b!264923 m!281887))

(declare-fun m!281889 () Bool)

(assert (=> start!25448 m!281889))

(declare-fun m!281891 () Bool)

(assert (=> start!25448 m!281891))

(declare-fun m!281893 () Bool)

(assert (=> b!264922 m!281893))

(push 1)

(assert (not b!264922))

(assert (not start!25448))

(assert (not b!264921))

(assert (not b!264923))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

