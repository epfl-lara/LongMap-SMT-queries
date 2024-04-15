; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25454 () Bool)

(assert start!25454)

(declare-fun res!129350 () Bool)

(declare-fun e!171492 () Bool)

(assert (=> start!25454 (=> (not res!129350) (not e!171492))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25454 (= res!129350 (validMask!0 mask!4002))))

(assert (=> start!25454 e!171492))

(assert (=> start!25454 true))

(declare-datatypes ((array!12738 0))(
  ( (array!12739 (arr!6027 (Array (_ BitVec 32) (_ BitVec 64))) (size!6380 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12738)

(declare-fun array_inv!3999 (array!12738) Bool)

(assert (=> start!25454 (array_inv!3999 a!3436)))

(declare-fun b!264787 () Bool)

(declare-fun res!129349 () Bool)

(assert (=> b!264787 (=> (not res!129349) (not e!171492))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264787 (= res!129349 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!1217 0))(
  ( (MissingZero!1217 (index!7038 (_ BitVec 32))) (Found!1217 (index!7039 (_ BitVec 32))) (Intermediate!1217 (undefined!2029 Bool) (index!7040 (_ BitVec 32)) (x!25381 (_ BitVec 32))) (Undefined!1217) (MissingVacant!1217 (index!7041 (_ BitVec 32))) )
))
(declare-fun lt!133761 () SeekEntryResult!1217)

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun b!264788 () Bool)

(assert (=> b!264788 (= e!171492 (and (or (= lt!133761 (MissingZero!1217 i!1355)) (= lt!133761 (MissingVacant!1217 i!1355))) (bvsgt #b00000000000000000000000000000000 (size!6380 a!3436))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12738 (_ BitVec 32)) SeekEntryResult!1217)

(assert (=> b!264788 (= lt!133761 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264786 () Bool)

(declare-fun res!129352 () Bool)

(assert (=> b!264786 (=> (not res!129352) (not e!171492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264786 (= res!129352 (validKeyInArray!0 k0!2698))))

(declare-fun b!264785 () Bool)

(declare-fun res!129351 () Bool)

(assert (=> b!264785 (=> (not res!129351) (not e!171492))))

(assert (=> b!264785 (= res!129351 (and (= (size!6380 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6380 a!3436))))))

(assert (= (and start!25454 res!129350) b!264785))

(assert (= (and b!264785 res!129351) b!264786))

(assert (= (and b!264786 res!129352) b!264787))

(assert (= (and b!264787 res!129349) b!264788))

(declare-fun m!281279 () Bool)

(assert (=> start!25454 m!281279))

(declare-fun m!281281 () Bool)

(assert (=> start!25454 m!281281))

(declare-fun m!281283 () Bool)

(assert (=> b!264787 m!281283))

(declare-fun m!281285 () Bool)

(assert (=> b!264788 m!281285))

(declare-fun m!281287 () Bool)

(assert (=> b!264786 m!281287))

(check-sat (not b!264786) (not b!264787) (not start!25454) (not b!264788))
(check-sat)
