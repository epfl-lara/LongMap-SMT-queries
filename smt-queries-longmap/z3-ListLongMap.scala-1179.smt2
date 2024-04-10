; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25416 () Bool)

(assert start!25416)

(declare-fun b!264724 () Bool)

(declare-fun res!129240 () Bool)

(declare-fun e!171491 () Bool)

(assert (=> b!264724 (=> (not res!129240) (not e!171491))))

(declare-datatypes ((array!12712 0))(
  ( (array!12713 (arr!6015 (Array (_ BitVec 32) (_ BitVec 64))) (size!6367 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12712)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264724 (= res!129240 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264725 () Bool)

(declare-fun res!129237 () Bool)

(assert (=> b!264725 (=> (not res!129237) (not e!171491))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264725 (= res!129237 (and (= (size!6367 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6367 a!3436))))))

(declare-fun b!264726 () Bool)

(declare-fun res!129239 () Bool)

(assert (=> b!264726 (=> (not res!129239) (not e!171491))))

(declare-datatypes ((SeekEntryResult!1206 0))(
  ( (MissingZero!1206 (index!6994 (_ BitVec 32))) (Found!1206 (index!6995 (_ BitVec 32))) (Intermediate!1206 (undefined!2018 Bool) (index!6996 (_ BitVec 32)) (x!25323 (_ BitVec 32))) (Undefined!1206) (MissingVacant!1206 (index!6997 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12712 (_ BitVec 32)) SeekEntryResult!1206)

(assert (=> b!264726 (= res!129239 (not (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) (MissingZero!1206 i!1355))))))

(declare-fun res!129238 () Bool)

(assert (=> start!25416 (=> (not res!129238) (not e!171491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25416 (= res!129238 (validMask!0 mask!4002))))

(assert (=> start!25416 e!171491))

(assert (=> start!25416 true))

(declare-fun array_inv!3978 (array!12712) Bool)

(assert (=> start!25416 (array_inv!3978 a!3436)))

(declare-fun b!264727 () Bool)

(assert (=> b!264727 (= e!171491 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun b!264728 () Bool)

(declare-fun res!129236 () Bool)

(assert (=> b!264728 (=> (not res!129236) (not e!171491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264728 (= res!129236 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25416 res!129238) b!264725))

(assert (= (and b!264725 res!129237) b!264728))

(assert (= (and b!264728 res!129236) b!264724))

(assert (= (and b!264724 res!129240) b!264726))

(assert (= (and b!264726 res!129239) b!264727))

(declare-fun m!281725 () Bool)

(assert (=> b!264724 m!281725))

(declare-fun m!281727 () Bool)

(assert (=> b!264726 m!281727))

(declare-fun m!281729 () Bool)

(assert (=> start!25416 m!281729))

(declare-fun m!281731 () Bool)

(assert (=> start!25416 m!281731))

(declare-fun m!281733 () Bool)

(assert (=> b!264728 m!281733))

(check-sat (not b!264726) (not b!264724) (not start!25416) (not b!264728))
(check-sat)
