; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25454 () Bool)

(assert start!25454)

(declare-fun b!264979 () Bool)

(declare-fun res!129466 () Bool)

(declare-fun e!171616 () Bool)

(assert (=> b!264979 (=> (not res!129466) (not e!171616))))

(declare-datatypes ((array!12745 0))(
  ( (array!12746 (arr!6031 (Array (_ BitVec 32) (_ BitVec 64))) (size!6383 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12745)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264979 (= res!129466 (and (= (size!6383 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6383 a!3436))))))

(declare-fun b!264981 () Bool)

(declare-fun res!129468 () Bool)

(assert (=> b!264981 (=> (not res!129468) (not e!171616))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264981 (= res!129468 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264982 () Bool)

(declare-datatypes ((SeekEntryResult!1187 0))(
  ( (MissingZero!1187 (index!6918 (_ BitVec 32))) (Found!1187 (index!6919 (_ BitVec 32))) (Intermediate!1187 (undefined!1999 Bool) (index!6920 (_ BitVec 32)) (x!25352 (_ BitVec 32))) (Undefined!1187) (MissingVacant!1187 (index!6921 (_ BitVec 32))) )
))
(declare-fun lt!134001 () SeekEntryResult!1187)

(assert (=> b!264982 (= e!171616 (and (or (= lt!134001 (MissingZero!1187 i!1355)) (= lt!134001 (MissingVacant!1187 i!1355))) (bvsgt #b00000000000000000000000000000000 (size!6383 a!3436))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12745 (_ BitVec 32)) SeekEntryResult!1187)

(assert (=> b!264982 (= lt!134001 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!129465 () Bool)

(assert (=> start!25454 (=> (not res!129465) (not e!171616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25454 (= res!129465 (validMask!0 mask!4002))))

(assert (=> start!25454 e!171616))

(assert (=> start!25454 true))

(declare-fun array_inv!3981 (array!12745) Bool)

(assert (=> start!25454 (array_inv!3981 a!3436)))

(declare-fun b!264980 () Bool)

(declare-fun res!129467 () Bool)

(assert (=> b!264980 (=> (not res!129467) (not e!171616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264980 (= res!129467 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25454 res!129465) b!264979))

(assert (= (and b!264979 res!129466) b!264980))

(assert (= (and b!264980 res!129467) b!264981))

(assert (= (and b!264981 res!129468) b!264982))

(declare-fun m!282077 () Bool)

(assert (=> b!264981 m!282077))

(declare-fun m!282079 () Bool)

(assert (=> b!264982 m!282079))

(declare-fun m!282081 () Bool)

(assert (=> start!25454 m!282081))

(declare-fun m!282083 () Bool)

(assert (=> start!25454 m!282083))

(declare-fun m!282085 () Bool)

(assert (=> b!264980 m!282085))

(check-sat (not b!264982) (not b!264981) (not start!25454) (not b!264980))
(check-sat)
