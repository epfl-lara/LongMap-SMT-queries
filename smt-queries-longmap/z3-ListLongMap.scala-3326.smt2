; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45950 () Bool)

(assert start!45950)

(declare-fun b!508623 () Bool)

(declare-fun res!309470 () Bool)

(declare-fun e!297558 () Bool)

(assert (=> b!508623 (=> (not res!309470) (not e!297558))))

(declare-datatypes ((array!32661 0))(
  ( (array!32662 (arr!15709 (Array (_ BitVec 32) (_ BitVec 64))) (size!16073 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32661)

(declare-datatypes ((List!9867 0))(
  ( (Nil!9864) (Cons!9863 (h!10740 (_ BitVec 64)) (t!16095 List!9867)) )
))
(declare-fun arrayNoDuplicates!0 (array!32661 (_ BitVec 32) List!9867) Bool)

(assert (=> b!508623 (= res!309470 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9864))))

(declare-fun b!508624 () Bool)

(declare-fun res!309473 () Bool)

(declare-fun e!297561 () Bool)

(assert (=> b!508624 (=> (not res!309473) (not e!297561))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508624 (= res!309473 (validKeyInArray!0 k0!2280))))

(declare-fun b!508625 () Bool)

(assert (=> b!508625 (= e!297558 (not true))))

(declare-fun e!297560 () Bool)

(assert (=> b!508625 e!297560))

(declare-fun res!309468 () Bool)

(assert (=> b!508625 (=> (not res!309468) (not e!297560))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32661 (_ BitVec 32)) Bool)

(assert (=> b!508625 (= res!309468 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15610 0))(
  ( (Unit!15611) )
))
(declare-fun lt!232315 () Unit!15610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15610)

(assert (=> b!508625 (= lt!232315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!309475 () Bool)

(assert (=> start!45950 (=> (not res!309475) (not e!297561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45950 (= res!309475 (validMask!0 mask!3524))))

(assert (=> start!45950 e!297561))

(assert (=> start!45950 true))

(declare-fun array_inv!11505 (array!32661) Bool)

(assert (=> start!45950 (array_inv!11505 a!3235)))

(declare-fun b!508626 () Bool)

(declare-fun res!309472 () Bool)

(assert (=> b!508626 (=> (not res!309472) (not e!297561))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508626 (= res!309472 (and (= (size!16073 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16073 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16073 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508627 () Bool)

(declare-fun res!309474 () Bool)

(assert (=> b!508627 (=> (not res!309474) (not e!297561))))

(assert (=> b!508627 (= res!309474 (validKeyInArray!0 (select (arr!15709 a!3235) j!176)))))

(declare-fun b!508628 () Bool)

(declare-fun res!309471 () Bool)

(assert (=> b!508628 (=> (not res!309471) (not e!297561))))

(declare-fun arrayContainsKey!0 (array!32661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508628 (= res!309471 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508629 () Bool)

(declare-datatypes ((SeekEntryResult!4176 0))(
  ( (MissingZero!4176 (index!18892 (_ BitVec 32))) (Found!4176 (index!18893 (_ BitVec 32))) (Intermediate!4176 (undefined!4988 Bool) (index!18894 (_ BitVec 32)) (x!47873 (_ BitVec 32))) (Undefined!4176) (MissingVacant!4176 (index!18895 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32661 (_ BitVec 32)) SeekEntryResult!4176)

(assert (=> b!508629 (= e!297560 (= (seekEntryOrOpen!0 (select (arr!15709 a!3235) j!176) a!3235 mask!3524) (Found!4176 j!176)))))

(declare-fun b!508630 () Bool)

(assert (=> b!508630 (= e!297561 e!297558)))

(declare-fun res!309469 () Bool)

(assert (=> b!508630 (=> (not res!309469) (not e!297558))))

(declare-fun lt!232314 () SeekEntryResult!4176)

(assert (=> b!508630 (= res!309469 (or (= lt!232314 (MissingZero!4176 i!1204)) (= lt!232314 (MissingVacant!4176 i!1204))))))

(assert (=> b!508630 (= lt!232314 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508631 () Bool)

(declare-fun res!309476 () Bool)

(assert (=> b!508631 (=> (not res!309476) (not e!297558))))

(assert (=> b!508631 (= res!309476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45950 res!309475) b!508626))

(assert (= (and b!508626 res!309472) b!508627))

(assert (= (and b!508627 res!309474) b!508624))

(assert (= (and b!508624 res!309473) b!508628))

(assert (= (and b!508628 res!309471) b!508630))

(assert (= (and b!508630 res!309469) b!508631))

(assert (= (and b!508631 res!309476) b!508623))

(assert (= (and b!508623 res!309470) b!508625))

(assert (= (and b!508625 res!309468) b!508629))

(declare-fun m!489381 () Bool)

(assert (=> b!508630 m!489381))

(declare-fun m!489383 () Bool)

(assert (=> b!508628 m!489383))

(declare-fun m!489385 () Bool)

(assert (=> b!508623 m!489385))

(declare-fun m!489387 () Bool)

(assert (=> b!508624 m!489387))

(declare-fun m!489389 () Bool)

(assert (=> start!45950 m!489389))

(declare-fun m!489391 () Bool)

(assert (=> start!45950 m!489391))

(declare-fun m!489393 () Bool)

(assert (=> b!508631 m!489393))

(declare-fun m!489395 () Bool)

(assert (=> b!508625 m!489395))

(declare-fun m!489397 () Bool)

(assert (=> b!508625 m!489397))

(declare-fun m!489399 () Bool)

(assert (=> b!508629 m!489399))

(assert (=> b!508629 m!489399))

(declare-fun m!489401 () Bool)

(assert (=> b!508629 m!489401))

(assert (=> b!508627 m!489399))

(assert (=> b!508627 m!489399))

(declare-fun m!489403 () Bool)

(assert (=> b!508627 m!489403))

(check-sat (not b!508630) (not b!508629) (not b!508631) (not b!508623) (not b!508624) (not b!508625) (not start!45950) (not b!508628) (not b!508627))
(check-sat)
