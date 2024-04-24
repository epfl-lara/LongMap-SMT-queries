; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25730 () Bool)

(assert start!25730)

(declare-fun res!131078 () Bool)

(declare-fun e!172571 () Bool)

(assert (=> start!25730 (=> (not res!131078) (not e!172571))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25730 (= res!131078 (validMask!0 mask!4002))))

(assert (=> start!25730 e!172571))

(assert (=> start!25730 true))

(declare-datatypes ((array!12904 0))(
  ( (array!12905 (arr!6106 (Array (_ BitVec 32) (_ BitVec 64))) (size!6458 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12904)

(declare-fun array_inv!4056 (array!12904) Bool)

(assert (=> start!25730 (array_inv!4056 a!3436)))

(declare-fun b!266807 () Bool)

(declare-fun res!131077 () Bool)

(declare-fun e!172570 () Bool)

(assert (=> b!266807 (=> (not res!131077) (not e!172570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12904 (_ BitVec 32)) Bool)

(assert (=> b!266807 (= res!131077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266808 () Bool)

(declare-fun res!131080 () Bool)

(assert (=> b!266808 (=> (not res!131080) (not e!172571))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266808 (= res!131080 (and (= (size!6458 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6458 a!3436))))))

(declare-fun b!266809 () Bool)

(declare-fun res!131081 () Bool)

(assert (=> b!266809 (=> (not res!131081) (not e!172571))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266809 (= res!131081 (validKeyInArray!0 k0!2698))))

(declare-fun b!266810 () Bool)

(assert (=> b!266810 (= e!172571 e!172570)))

(declare-fun res!131082 () Bool)

(assert (=> b!266810 (=> (not res!131082) (not e!172570))))

(declare-datatypes ((SeekEntryResult!1262 0))(
  ( (MissingZero!1262 (index!7218 (_ BitVec 32))) (Found!1262 (index!7219 (_ BitVec 32))) (Intermediate!1262 (undefined!2074 Bool) (index!7220 (_ BitVec 32)) (x!25627 (_ BitVec 32))) (Undefined!1262) (MissingVacant!1262 (index!7221 (_ BitVec 32))) )
))
(declare-fun lt!134583 () SeekEntryResult!1262)

(assert (=> b!266810 (= res!131082 (or (= lt!134583 (MissingZero!1262 i!1355)) (= lt!134583 (MissingVacant!1262 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12904 (_ BitVec 32)) SeekEntryResult!1262)

(assert (=> b!266810 (= lt!134583 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266811 () Bool)

(assert (=> b!266811 (= e!172570 false)))

(declare-fun lt!134582 () Bool)

(declare-datatypes ((List!3833 0))(
  ( (Nil!3830) (Cons!3829 (h!4496 (_ BitVec 64)) (t!8907 List!3833)) )
))
(declare-fun arrayNoDuplicates!0 (array!12904 (_ BitVec 32) List!3833) Bool)

(assert (=> b!266811 (= lt!134582 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3830))))

(declare-fun b!266812 () Bool)

(declare-fun res!131079 () Bool)

(assert (=> b!266812 (=> (not res!131079) (not e!172571))))

(declare-fun arrayContainsKey!0 (array!12904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266812 (= res!131079 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25730 res!131078) b!266808))

(assert (= (and b!266808 res!131080) b!266809))

(assert (= (and b!266809 res!131081) b!266812))

(assert (= (and b!266812 res!131079) b!266810))

(assert (= (and b!266810 res!131082) b!266807))

(assert (= (and b!266807 res!131077) b!266811))

(declare-fun m!283493 () Bool)

(assert (=> start!25730 m!283493))

(declare-fun m!283495 () Bool)

(assert (=> start!25730 m!283495))

(declare-fun m!283497 () Bool)

(assert (=> b!266811 m!283497))

(declare-fun m!283499 () Bool)

(assert (=> b!266812 m!283499))

(declare-fun m!283501 () Bool)

(assert (=> b!266807 m!283501))

(declare-fun m!283503 () Bool)

(assert (=> b!266809 m!283503))

(declare-fun m!283505 () Bool)

(assert (=> b!266810 m!283505))

(check-sat (not b!266807) (not b!266810) (not start!25730) (not b!266811) (not b!266812) (not b!266809))
(check-sat)
