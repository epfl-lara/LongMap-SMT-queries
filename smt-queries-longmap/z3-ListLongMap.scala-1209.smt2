; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25722 () Bool)

(assert start!25722)

(declare-fun b!266725 () Bool)

(declare-fun res!131023 () Bool)

(declare-fun e!172528 () Bool)

(assert (=> b!266725 (=> (not res!131023) (not e!172528))))

(declare-datatypes ((array!12901 0))(
  ( (array!12902 (arr!6105 (Array (_ BitVec 32) (_ BitVec 64))) (size!6457 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12901)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266725 (= res!131023 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266726 () Bool)

(declare-fun e!172529 () Bool)

(assert (=> b!266726 (= e!172529 false)))

(declare-fun lt!134512 () Bool)

(declare-datatypes ((List!3919 0))(
  ( (Nil!3916) (Cons!3915 (h!4582 (_ BitVec 64)) (t!9001 List!3919)) )
))
(declare-fun arrayNoDuplicates!0 (array!12901 (_ BitVec 32) List!3919) Bool)

(assert (=> b!266726 (= lt!134512 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3916))))

(declare-fun b!266727 () Bool)

(declare-fun res!131022 () Bool)

(assert (=> b!266727 (=> (not res!131022) (not e!172528))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266727 (= res!131022 (and (= (size!6457 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6457 a!3436))))))

(declare-fun b!266728 () Bool)

(assert (=> b!266728 (= e!172528 e!172529)))

(declare-fun res!131020 () Bool)

(assert (=> b!266728 (=> (not res!131020) (not e!172529))))

(declare-datatypes ((SeekEntryResult!1296 0))(
  ( (MissingZero!1296 (index!7354 (_ BitVec 32))) (Found!1296 (index!7355 (_ BitVec 32))) (Intermediate!1296 (undefined!2108 Bool) (index!7356 (_ BitVec 32)) (x!25653 (_ BitVec 32))) (Undefined!1296) (MissingVacant!1296 (index!7357 (_ BitVec 32))) )
))
(declare-fun lt!134511 () SeekEntryResult!1296)

(assert (=> b!266728 (= res!131020 (or (= lt!134511 (MissingZero!1296 i!1355)) (= lt!134511 (MissingVacant!1296 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12901 (_ BitVec 32)) SeekEntryResult!1296)

(assert (=> b!266728 (= lt!134511 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266729 () Bool)

(declare-fun res!131021 () Bool)

(assert (=> b!266729 (=> (not res!131021) (not e!172528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266729 (= res!131021 (validKeyInArray!0 k0!2698))))

(declare-fun b!266724 () Bool)

(declare-fun res!131025 () Bool)

(assert (=> b!266724 (=> (not res!131025) (not e!172529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12901 (_ BitVec 32)) Bool)

(assert (=> b!266724 (= res!131025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131024 () Bool)

(assert (=> start!25722 (=> (not res!131024) (not e!172528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25722 (= res!131024 (validMask!0 mask!4002))))

(assert (=> start!25722 e!172528))

(assert (=> start!25722 true))

(declare-fun array_inv!4068 (array!12901) Bool)

(assert (=> start!25722 (array_inv!4068 a!3436)))

(assert (= (and start!25722 res!131024) b!266727))

(assert (= (and b!266727 res!131022) b!266729))

(assert (= (and b!266729 res!131021) b!266725))

(assert (= (and b!266725 res!131023) b!266728))

(assert (= (and b!266728 res!131020) b!266724))

(assert (= (and b!266724 res!131025) b!266726))

(declare-fun m!283259 () Bool)

(assert (=> b!266729 m!283259))

(declare-fun m!283261 () Bool)

(assert (=> b!266726 m!283261))

(declare-fun m!283263 () Bool)

(assert (=> b!266724 m!283263))

(declare-fun m!283265 () Bool)

(assert (=> start!25722 m!283265))

(declare-fun m!283267 () Bool)

(assert (=> start!25722 m!283267))

(declare-fun m!283269 () Bool)

(assert (=> b!266728 m!283269))

(declare-fun m!283271 () Bool)

(assert (=> b!266725 m!283271))

(check-sat (not b!266726) (not b!266729) (not b!266724) (not start!25722) (not b!266728) (not b!266725))
(check-sat)
