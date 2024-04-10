; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44702 () Bool)

(assert start!44702)

(declare-fun b!490569 () Bool)

(declare-fun res!293505 () Bool)

(declare-fun e!288366 () Bool)

(assert (=> b!490569 (=> (not res!293505) (not e!288366))))

(declare-datatypes ((array!31761 0))(
  ( (array!31762 (arr!15268 (Array (_ BitVec 32) (_ BitVec 64))) (size!15632 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31761)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31761 (_ BitVec 32)) Bool)

(assert (=> b!490569 (= res!293505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490570 () Bool)

(declare-fun res!293513 () Bool)

(assert (=> b!490570 (=> (not res!293513) (not e!288366))))

(declare-datatypes ((List!9426 0))(
  ( (Nil!9423) (Cons!9422 (h!10284 (_ BitVec 64)) (t!15654 List!9426)) )
))
(declare-fun arrayNoDuplicates!0 (array!31761 (_ BitVec 32) List!9426) Bool)

(assert (=> b!490570 (= res!293513 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9423))))

(declare-fun b!490571 () Bool)

(declare-fun res!293507 () Bool)

(declare-fun e!288365 () Bool)

(assert (=> b!490571 (=> (not res!293507) (not e!288365))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490571 (= res!293507 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490572 () Bool)

(declare-fun e!288364 () Bool)

(assert (=> b!490572 (= e!288366 (not e!288364))))

(declare-fun res!293508 () Bool)

(assert (=> b!490572 (=> res!293508 e!288364)))

(declare-fun lt!221579 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!221584 () array!31761)

(declare-datatypes ((SeekEntryResult!3735 0))(
  ( (MissingZero!3735 (index!17119 (_ BitVec 32))) (Found!3735 (index!17120 (_ BitVec 32))) (Intermediate!3735 (undefined!4547 Bool) (index!17121 (_ BitVec 32)) (x!46217 (_ BitVec 32))) (Undefined!3735) (MissingVacant!3735 (index!17122 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31761 (_ BitVec 32)) SeekEntryResult!3735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490572 (= res!293508 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15268 a!3235) j!176) mask!3524) (select (arr!15268 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221579 mask!3524) lt!221579 lt!221584 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490572 (= lt!221579 (select (store (arr!15268 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490572 (= lt!221584 (array!31762 (store (arr!15268 a!3235) i!1204 k0!2280) (size!15632 a!3235)))))

(declare-fun lt!221582 () SeekEntryResult!3735)

(assert (=> b!490572 (= lt!221582 (Found!3735 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31761 (_ BitVec 32)) SeekEntryResult!3735)

(assert (=> b!490572 (= lt!221582 (seekEntryOrOpen!0 (select (arr!15268 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490572 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14416 0))(
  ( (Unit!14417) )
))
(declare-fun lt!221583 () Unit!14416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14416)

(assert (=> b!490572 (= lt!221583 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490573 () Bool)

(declare-fun res!293512 () Bool)

(assert (=> b!490573 (=> (not res!293512) (not e!288365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490573 (= res!293512 (validKeyInArray!0 k0!2280))))

(declare-fun b!490574 () Bool)

(assert (=> b!490574 (= e!288365 e!288366)))

(declare-fun res!293506 () Bool)

(assert (=> b!490574 (=> (not res!293506) (not e!288366))))

(declare-fun lt!221580 () SeekEntryResult!3735)

(assert (=> b!490574 (= res!293506 (or (= lt!221580 (MissingZero!3735 i!1204)) (= lt!221580 (MissingVacant!3735 i!1204))))))

(assert (=> b!490574 (= lt!221580 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490575 () Bool)

(assert (=> b!490575 (= e!288364 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!490575 (= lt!221582 (seekEntryOrOpen!0 lt!221579 lt!221584 mask!3524))))

(declare-fun lt!221581 () Unit!14416)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14416)

(assert (=> b!490575 (= lt!221581 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490576 () Bool)

(declare-fun res!293511 () Bool)

(assert (=> b!490576 (=> (not res!293511) (not e!288365))))

(assert (=> b!490576 (= res!293511 (validKeyInArray!0 (select (arr!15268 a!3235) j!176)))))

(declare-fun b!490577 () Bool)

(declare-fun res!293509 () Bool)

(assert (=> b!490577 (=> (not res!293509) (not e!288365))))

(assert (=> b!490577 (= res!293509 (and (= (size!15632 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15632 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15632 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!293510 () Bool)

(assert (=> start!44702 (=> (not res!293510) (not e!288365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44702 (= res!293510 (validMask!0 mask!3524))))

(assert (=> start!44702 e!288365))

(assert (=> start!44702 true))

(declare-fun array_inv!11064 (array!31761) Bool)

(assert (=> start!44702 (array_inv!11064 a!3235)))

(assert (= (and start!44702 res!293510) b!490577))

(assert (= (and b!490577 res!293509) b!490576))

(assert (= (and b!490576 res!293511) b!490573))

(assert (= (and b!490573 res!293512) b!490571))

(assert (= (and b!490571 res!293507) b!490574))

(assert (= (and b!490574 res!293506) b!490569))

(assert (= (and b!490569 res!293505) b!490570))

(assert (= (and b!490570 res!293513) b!490572))

(assert (= (and b!490572 (not res!293508)) b!490575))

(declare-fun m!470737 () Bool)

(assert (=> b!490573 m!470737))

(declare-fun m!470739 () Bool)

(assert (=> b!490576 m!470739))

(assert (=> b!490576 m!470739))

(declare-fun m!470741 () Bool)

(assert (=> b!490576 m!470741))

(declare-fun m!470743 () Bool)

(assert (=> b!490571 m!470743))

(declare-fun m!470745 () Bool)

(assert (=> b!490575 m!470745))

(declare-fun m!470747 () Bool)

(assert (=> b!490575 m!470747))

(declare-fun m!470749 () Bool)

(assert (=> b!490569 m!470749))

(declare-fun m!470751 () Bool)

(assert (=> b!490572 m!470751))

(declare-fun m!470753 () Bool)

(assert (=> b!490572 m!470753))

(declare-fun m!470755 () Bool)

(assert (=> b!490572 m!470755))

(declare-fun m!470757 () Bool)

(assert (=> b!490572 m!470757))

(declare-fun m!470759 () Bool)

(assert (=> b!490572 m!470759))

(assert (=> b!490572 m!470739))

(declare-fun m!470761 () Bool)

(assert (=> b!490572 m!470761))

(assert (=> b!490572 m!470751))

(declare-fun m!470763 () Bool)

(assert (=> b!490572 m!470763))

(assert (=> b!490572 m!470739))

(assert (=> b!490572 m!470759))

(assert (=> b!490572 m!470739))

(declare-fun m!470765 () Bool)

(assert (=> b!490572 m!470765))

(assert (=> b!490572 m!470739))

(declare-fun m!470767 () Bool)

(assert (=> b!490572 m!470767))

(declare-fun m!470769 () Bool)

(assert (=> start!44702 m!470769))

(declare-fun m!470771 () Bool)

(assert (=> start!44702 m!470771))

(declare-fun m!470773 () Bool)

(assert (=> b!490574 m!470773))

(declare-fun m!470775 () Bool)

(assert (=> b!490570 m!470775))

(check-sat (not b!490571) (not b!490574) (not b!490570) (not b!490576) (not b!490569) (not b!490573) (not start!44702) (not b!490575) (not b!490572))
(check-sat)
