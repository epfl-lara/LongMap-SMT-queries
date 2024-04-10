; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25430 () Bool)

(assert start!25430)

(declare-fun b!264815 () Bool)

(declare-fun e!171533 () Bool)

(assert (=> b!264815 (= e!171533 false)))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12726 0))(
  ( (array!12727 (arr!6022 (Array (_ BitVec 32) (_ BitVec 64))) (size!6374 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12726)

(declare-datatypes ((SeekEntryResult!1213 0))(
  ( (MissingZero!1213 (index!7022 (_ BitVec 32))) (Found!1213 (index!7023 (_ BitVec 32))) (Intermediate!1213 (undefined!2025 Bool) (index!7024 (_ BitVec 32)) (x!25346 (_ BitVec 32))) (Undefined!1213) (MissingVacant!1213 (index!7025 (_ BitVec 32))) )
))
(declare-fun lt!133912 () SeekEntryResult!1213)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12726 (_ BitVec 32)) SeekEntryResult!1213)

(assert (=> b!264815 (= lt!133912 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264814 () Bool)

(declare-fun res!129327 () Bool)

(assert (=> b!264814 (=> (not res!129327) (not e!171533))))

(declare-fun arrayContainsKey!0 (array!12726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264814 (= res!129327 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264813 () Bool)

(declare-fun res!129325 () Bool)

(assert (=> b!264813 (=> (not res!129325) (not e!171533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264813 (= res!129325 (validKeyInArray!0 k!2698))))

(declare-fun res!129326 () Bool)

(assert (=> start!25430 (=> (not res!129326) (not e!171533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25430 (= res!129326 (validMask!0 mask!4002))))

(assert (=> start!25430 e!171533))

(assert (=> start!25430 true))

(declare-fun array_inv!3985 (array!12726) Bool)

(assert (=> start!25430 (array_inv!3985 a!3436)))

(declare-fun b!264812 () Bool)

(declare-fun res!129324 () Bool)

(assert (=> b!264812 (=> (not res!129324) (not e!171533))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264812 (= res!129324 (and (= (size!6374 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6374 a!3436))))))

(assert (= (and start!25430 res!129326) b!264812))

(assert (= (and b!264812 res!129324) b!264813))

(assert (= (and b!264813 res!129325) b!264814))

(assert (= (and b!264814 res!129327) b!264815))

(declare-fun m!281795 () Bool)

(assert (=> b!264815 m!281795))

(declare-fun m!281797 () Bool)

(assert (=> b!264814 m!281797))

(declare-fun m!281799 () Bool)

(assert (=> b!264813 m!281799))

(declare-fun m!281801 () Bool)

(assert (=> start!25430 m!281801))

(declare-fun m!281803 () Bool)

(assert (=> start!25430 m!281803))

(push 1)

(assert (not b!264813))

(assert (not b!264815))

(assert (not start!25430))

(assert (not b!264814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

