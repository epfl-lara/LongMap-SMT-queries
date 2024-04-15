; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25736 () Bool)

(assert start!25736)

(declare-fun b!266669 () Bool)

(declare-fun e!172473 () Bool)

(declare-fun e!172471 () Bool)

(assert (=> b!266669 (= e!172473 e!172471)))

(declare-fun res!131019 () Bool)

(assert (=> b!266669 (=> (not res!131019) (not e!172471))))

(declare-datatypes ((SeekEntryResult!1295 0))(
  ( (MissingZero!1295 (index!7350 (_ BitVec 32))) (Found!1295 (index!7351 (_ BitVec 32))) (Intermediate!1295 (undefined!2107 Bool) (index!7352 (_ BitVec 32)) (x!25667 (_ BitVec 32))) (Undefined!1295) (MissingVacant!1295 (index!7353 (_ BitVec 32))) )
))
(declare-fun lt!134358 () SeekEntryResult!1295)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266669 (= res!131019 (or (= lt!134358 (MissingZero!1295 i!1355)) (= lt!134358 (MissingVacant!1295 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12903 0))(
  ( (array!12904 (arr!6105 (Array (_ BitVec 32) (_ BitVec 64))) (size!6458 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12903)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12903 (_ BitVec 32)) SeekEntryResult!1295)

(assert (=> b!266669 (= lt!134358 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266670 () Bool)

(declare-fun res!131023 () Bool)

(assert (=> b!266670 (=> (not res!131023) (not e!172473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266670 (= res!131023 (validKeyInArray!0 k0!2698))))

(declare-fun b!266672 () Bool)

(declare-fun res!131020 () Bool)

(assert (=> b!266672 (=> (not res!131020) (not e!172473))))

(declare-fun arrayContainsKey!0 (array!12903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266672 (= res!131020 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266673 () Bool)

(declare-fun res!131017 () Bool)

(assert (=> b!266673 (=> (not res!131017) (not e!172471))))

(declare-datatypes ((List!3892 0))(
  ( (Nil!3889) (Cons!3888 (h!4555 (_ BitVec 64)) (t!8965 List!3892)) )
))
(declare-fun arrayNoDuplicates!0 (array!12903 (_ BitVec 32) List!3892) Bool)

(assert (=> b!266673 (= res!131017 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3889))))

(declare-fun res!131021 () Bool)

(assert (=> start!25736 (=> (not res!131021) (not e!172473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25736 (= res!131021 (validMask!0 mask!4002))))

(assert (=> start!25736 e!172473))

(assert (=> start!25736 true))

(declare-fun array_inv!4077 (array!12903) Bool)

(assert (=> start!25736 (array_inv!4077 a!3436)))

(declare-fun b!266671 () Bool)

(declare-fun res!131018 () Bool)

(assert (=> b!266671 (=> (not res!131018) (not e!172471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12903 (_ BitVec 32)) Bool)

(assert (=> b!266671 (= res!131018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266674 () Bool)

(assert (=> b!266674 (= e!172471 (bvsge #b00000000000000000000000000000000 (size!6458 a!3436)))))

(declare-fun b!266675 () Bool)

(declare-fun res!131022 () Bool)

(assert (=> b!266675 (=> (not res!131022) (not e!172473))))

(assert (=> b!266675 (= res!131022 (and (= (size!6458 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6458 a!3436))))))

(assert (= (and start!25736 res!131021) b!266675))

(assert (= (and b!266675 res!131022) b!266670))

(assert (= (and b!266670 res!131023) b!266672))

(assert (= (and b!266672 res!131020) b!266669))

(assert (= (and b!266669 res!131019) b!266671))

(assert (= (and b!266671 res!131018) b!266673))

(assert (= (and b!266673 res!131017) b!266674))

(declare-fun m!282737 () Bool)

(assert (=> b!266673 m!282737))

(declare-fun m!282739 () Bool)

(assert (=> b!266672 m!282739))

(declare-fun m!282741 () Bool)

(assert (=> b!266669 m!282741))

(declare-fun m!282743 () Bool)

(assert (=> b!266671 m!282743))

(declare-fun m!282745 () Bool)

(assert (=> b!266670 m!282745))

(declare-fun m!282747 () Bool)

(assert (=> start!25736 m!282747))

(declare-fun m!282749 () Bool)

(assert (=> start!25736 m!282749))

(check-sat (not b!266673) (not b!266672) (not b!266670) (not b!266669) (not start!25736) (not b!266671))
(check-sat)
