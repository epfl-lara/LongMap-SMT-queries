; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25434 () Bool)

(assert start!25434)

(declare-fun b!264862 () Bool)

(declare-fun e!171556 () Bool)

(assert (=> b!264862 (= e!171556 false)))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12725 0))(
  ( (array!12726 (arr!6021 (Array (_ BitVec 32) (_ BitVec 64))) (size!6373 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12725)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1177 0))(
  ( (MissingZero!1177 (index!6878 (_ BitVec 32))) (Found!1177 (index!6879 (_ BitVec 32))) (Intermediate!1177 (undefined!1989 Bool) (index!6880 (_ BitVec 32)) (x!25310 (_ BitVec 32))) (Undefined!1177) (MissingVacant!1177 (index!6881 (_ BitVec 32))) )
))
(declare-fun lt!133971 () SeekEntryResult!1177)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12725 (_ BitVec 32)) SeekEntryResult!1177)

(assert (=> b!264862 (= lt!133971 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264861 () Bool)

(declare-fun res!129348 () Bool)

(assert (=> b!264861 (=> (not res!129348) (not e!171556))))

(declare-fun arrayContainsKey!0 (array!12725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264861 (= res!129348 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264860 () Bool)

(declare-fun res!129346 () Bool)

(assert (=> b!264860 (=> (not res!129346) (not e!171556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264860 (= res!129346 (validKeyInArray!0 k!2698))))

(declare-fun res!129347 () Bool)

(assert (=> start!25434 (=> (not res!129347) (not e!171556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25434 (= res!129347 (validMask!0 mask!4002))))

(assert (=> start!25434 e!171556))

(assert (=> start!25434 true))

(declare-fun array_inv!3971 (array!12725) Bool)

(assert (=> start!25434 (array_inv!3971 a!3436)))

(declare-fun b!264859 () Bool)

(declare-fun res!129345 () Bool)

(assert (=> b!264859 (=> (not res!129345) (not e!171556))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264859 (= res!129345 (and (= (size!6373 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6373 a!3436))))))

(assert (= (and start!25434 res!129347) b!264859))

(assert (= (and b!264859 res!129345) b!264860))

(assert (= (and b!264860 res!129346) b!264861))

(assert (= (and b!264861 res!129348) b!264862))

(declare-fun m!281977 () Bool)

(assert (=> b!264862 m!281977))

(declare-fun m!281979 () Bool)

(assert (=> b!264861 m!281979))

(declare-fun m!281981 () Bool)

(assert (=> b!264860 m!281981))

(declare-fun m!281983 () Bool)

(assert (=> start!25434 m!281983))

(declare-fun m!281985 () Bool)

(assert (=> start!25434 m!281985))

(push 1)

(assert (not b!264860))

(assert (not b!264861))

(assert (not start!25434))

(assert (not b!264862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

