; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44528 () Bool)

(assert start!44528)

(declare-fun b!488757 () Bool)

(declare-fun e!287509 () Bool)

(declare-fun e!287510 () Bool)

(assert (=> b!488757 (= e!287509 e!287510)))

(declare-fun res!291806 () Bool)

(assert (=> b!488757 (=> (not res!291806) (not e!287510))))

(declare-datatypes ((SeekEntryResult!3675 0))(
  ( (MissingZero!3675 (index!16879 (_ BitVec 32))) (Found!3675 (index!16880 (_ BitVec 32))) (Intermediate!3675 (undefined!4487 Bool) (index!16881 (_ BitVec 32)) (x!45994 (_ BitVec 32))) (Undefined!3675) (MissingVacant!3675 (index!16882 (_ BitVec 32))) )
))
(declare-fun lt!220520 () SeekEntryResult!3675)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488757 (= res!291806 (or (= lt!220520 (MissingZero!3675 i!1204)) (= lt!220520 (MissingVacant!3675 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31638 0))(
  ( (array!31639 (arr!15208 (Array (_ BitVec 32) (_ BitVec 64))) (size!15572 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31638)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31638 (_ BitVec 32)) SeekEntryResult!3675)

(assert (=> b!488757 (= lt!220520 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488758 () Bool)

(declare-fun res!291812 () Bool)

(assert (=> b!488758 (=> (not res!291812) (not e!287509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488758 (= res!291812 (validKeyInArray!0 k0!2280))))

(declare-fun b!488759 () Bool)

(declare-fun e!287508 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488759 (= e!287508 (= (seekEntryOrOpen!0 (select (arr!15208 a!3235) j!176) a!3235 mask!3524) (Found!3675 j!176)))))

(declare-fun b!488760 () Bool)

(declare-fun res!291811 () Bool)

(assert (=> b!488760 (=> (not res!291811) (not e!287510))))

(declare-datatypes ((List!9366 0))(
  ( (Nil!9363) (Cons!9362 (h!10221 (_ BitVec 64)) (t!15594 List!9366)) )
))
(declare-fun arrayNoDuplicates!0 (array!31638 (_ BitVec 32) List!9366) Bool)

(assert (=> b!488760 (= res!291811 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9363))))

(declare-fun b!488761 () Bool)

(declare-fun res!291807 () Bool)

(assert (=> b!488761 (=> (not res!291807) (not e!287509))))

(assert (=> b!488761 (= res!291807 (and (= (size!15572 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15572 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15572 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488762 () Bool)

(assert (=> b!488762 (= e!287510 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!220521 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488762 (= lt!220521 (toIndex!0 (select (store (arr!15208 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!488762 e!287508))

(declare-fun res!291804 () Bool)

(assert (=> b!488762 (=> (not res!291804) (not e!287508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31638 (_ BitVec 32)) Bool)

(assert (=> b!488762 (= res!291804 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14296 0))(
  ( (Unit!14297) )
))
(declare-fun lt!220522 () Unit!14296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14296)

(assert (=> b!488762 (= lt!220522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488763 () Bool)

(declare-fun res!291808 () Bool)

(assert (=> b!488763 (=> (not res!291808) (not e!287510))))

(assert (=> b!488763 (= res!291808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291809 () Bool)

(assert (=> start!44528 (=> (not res!291809) (not e!287509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44528 (= res!291809 (validMask!0 mask!3524))))

(assert (=> start!44528 e!287509))

(assert (=> start!44528 true))

(declare-fun array_inv!11004 (array!31638) Bool)

(assert (=> start!44528 (array_inv!11004 a!3235)))

(declare-fun b!488764 () Bool)

(declare-fun res!291805 () Bool)

(assert (=> b!488764 (=> (not res!291805) (not e!287509))))

(assert (=> b!488764 (= res!291805 (validKeyInArray!0 (select (arr!15208 a!3235) j!176)))))

(declare-fun b!488765 () Bool)

(declare-fun res!291810 () Bool)

(assert (=> b!488765 (=> (not res!291810) (not e!287509))))

(declare-fun arrayContainsKey!0 (array!31638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488765 (= res!291810 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44528 res!291809) b!488761))

(assert (= (and b!488761 res!291807) b!488764))

(assert (= (and b!488764 res!291805) b!488758))

(assert (= (and b!488758 res!291812) b!488765))

(assert (= (and b!488765 res!291810) b!488757))

(assert (= (and b!488757 res!291806) b!488763))

(assert (= (and b!488763 res!291808) b!488760))

(assert (= (and b!488760 res!291811) b!488762))

(assert (= (and b!488762 res!291804) b!488759))

(declare-fun m!468477 () Bool)

(assert (=> b!488762 m!468477))

(declare-fun m!468479 () Bool)

(assert (=> b!488762 m!468479))

(declare-fun m!468481 () Bool)

(assert (=> b!488762 m!468481))

(declare-fun m!468483 () Bool)

(assert (=> b!488762 m!468483))

(assert (=> b!488762 m!468481))

(declare-fun m!468485 () Bool)

(assert (=> b!488762 m!468485))

(declare-fun m!468487 () Bool)

(assert (=> b!488758 m!468487))

(declare-fun m!468489 () Bool)

(assert (=> b!488765 m!468489))

(declare-fun m!468491 () Bool)

(assert (=> b!488760 m!468491))

(declare-fun m!468493 () Bool)

(assert (=> b!488764 m!468493))

(assert (=> b!488764 m!468493))

(declare-fun m!468495 () Bool)

(assert (=> b!488764 m!468495))

(declare-fun m!468497 () Bool)

(assert (=> b!488757 m!468497))

(declare-fun m!468499 () Bool)

(assert (=> start!44528 m!468499))

(declare-fun m!468501 () Bool)

(assert (=> start!44528 m!468501))

(declare-fun m!468503 () Bool)

(assert (=> b!488763 m!468503))

(assert (=> b!488759 m!468493))

(assert (=> b!488759 m!468493))

(declare-fun m!468505 () Bool)

(assert (=> b!488759 m!468505))

(check-sat (not b!488758) (not b!488759) (not b!488762) (not b!488760) (not start!44528) (not b!488763) (not b!488764) (not b!488757) (not b!488765))
(check-sat)
