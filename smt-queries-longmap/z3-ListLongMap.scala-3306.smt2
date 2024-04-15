; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45768 () Bool)

(assert start!45768)

(declare-fun res!307488 () Bool)

(declare-fun e!296359 () Bool)

(assert (=> start!45768 (=> (not res!307488) (not e!296359))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45768 (= res!307488 (validMask!0 mask!3524))))

(assert (=> start!45768 e!296359))

(assert (=> start!45768 true))

(declare-datatypes ((array!32534 0))(
  ( (array!32535 (arr!15647 (Array (_ BitVec 32) (_ BitVec 64))) (size!16012 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32534)

(declare-fun array_inv!11530 (array!32534) Bool)

(assert (=> start!45768 (array_inv!11530 a!3235)))

(declare-fun b!506382 () Bool)

(declare-fun res!307485 () Bool)

(assert (=> b!506382 (=> (not res!307485) (not e!296359))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506382 (= res!307485 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506383 () Bool)

(declare-fun res!307487 () Bool)

(declare-fun e!296360 () Bool)

(assert (=> b!506383 (=> (not res!307487) (not e!296360))))

(declare-datatypes ((List!9844 0))(
  ( (Nil!9841) (Cons!9840 (h!10717 (_ BitVec 64)) (t!16063 List!9844)) )
))
(declare-fun arrayNoDuplicates!0 (array!32534 (_ BitVec 32) List!9844) Bool)

(assert (=> b!506383 (= res!307487 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9841))))

(declare-fun b!506384 () Bool)

(declare-fun e!296363 () Bool)

(assert (=> b!506384 (= e!296360 (not e!296363))))

(declare-fun res!307491 () Bool)

(assert (=> b!506384 (=> res!307491 e!296363)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!230978 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4111 0))(
  ( (MissingZero!4111 (index!18632 (_ BitVec 32))) (Found!4111 (index!18633 (_ BitVec 32))) (Intermediate!4111 (undefined!4923 Bool) (index!18634 (_ BitVec 32)) (x!47643 (_ BitVec 32))) (Undefined!4111) (MissingVacant!4111 (index!18635 (_ BitVec 32))) )
))
(declare-fun lt!230979 () SeekEntryResult!4111)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32534 (_ BitVec 32)) SeekEntryResult!4111)

(assert (=> b!506384 (= res!307491 (= lt!230979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230978 (select (store (arr!15647 a!3235) i!1204 k0!2280) j!176) (array!32535 (store (arr!15647 a!3235) i!1204 k0!2280) (size!16012 a!3235)) mask!3524)))))

(declare-fun lt!230976 () (_ BitVec 32))

(assert (=> b!506384 (= lt!230979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230976 (select (arr!15647 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506384 (= lt!230978 (toIndex!0 (select (store (arr!15647 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506384 (= lt!230976 (toIndex!0 (select (arr!15647 a!3235) j!176) mask!3524))))

(declare-fun e!296364 () Bool)

(assert (=> b!506384 e!296364))

(declare-fun res!307484 () Bool)

(assert (=> b!506384 (=> (not res!307484) (not e!296364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32534 (_ BitVec 32)) Bool)

(assert (=> b!506384 (= res!307484 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15496 0))(
  ( (Unit!15497) )
))
(declare-fun lt!230977 () Unit!15496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15496)

(assert (=> b!506384 (= lt!230977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506385 () Bool)

(declare-fun res!307486 () Bool)

(assert (=> b!506385 (=> (not res!307486) (not e!296360))))

(assert (=> b!506385 (= res!307486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506386 () Bool)

(declare-fun e!296361 () Bool)

(assert (=> b!506386 (= e!296363 e!296361)))

(declare-fun res!307489 () Bool)

(assert (=> b!506386 (=> res!307489 e!296361)))

(declare-fun lt!230980 () Bool)

(assert (=> b!506386 (= res!307489 (or (and (not lt!230980) (undefined!4923 lt!230979)) (and (not lt!230980) (not (undefined!4923 lt!230979)))))))

(get-info :version)

(assert (=> b!506386 (= lt!230980 (not ((_ is Intermediate!4111) lt!230979)))))

(declare-fun b!506387 () Bool)

(declare-fun res!307492 () Bool)

(assert (=> b!506387 (=> (not res!307492) (not e!296359))))

(assert (=> b!506387 (= res!307492 (and (= (size!16012 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16012 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16012 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506388 () Bool)

(assert (=> b!506388 (= e!296359 e!296360)))

(declare-fun res!307483 () Bool)

(assert (=> b!506388 (=> (not res!307483) (not e!296360))))

(declare-fun lt!230975 () SeekEntryResult!4111)

(assert (=> b!506388 (= res!307483 (or (= lt!230975 (MissingZero!4111 i!1204)) (= lt!230975 (MissingVacant!4111 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32534 (_ BitVec 32)) SeekEntryResult!4111)

(assert (=> b!506388 (= lt!230975 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506389 () Bool)

(assert (=> b!506389 (= e!296364 (= (seekEntryOrOpen!0 (select (arr!15647 a!3235) j!176) a!3235 mask!3524) (Found!4111 j!176)))))

(declare-fun b!506390 () Bool)

(declare-fun res!307490 () Bool)

(assert (=> b!506390 (=> (not res!307490) (not e!296359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506390 (= res!307490 (validKeyInArray!0 (select (arr!15647 a!3235) j!176)))))

(declare-fun b!506391 () Bool)

(declare-fun res!307493 () Bool)

(assert (=> b!506391 (=> (not res!307493) (not e!296359))))

(assert (=> b!506391 (= res!307493 (validKeyInArray!0 k0!2280))))

(declare-fun b!506392 () Bool)

(assert (=> b!506392 (= e!296361 true)))

(assert (=> b!506392 false))

(assert (= (and start!45768 res!307488) b!506387))

(assert (= (and b!506387 res!307492) b!506390))

(assert (= (and b!506390 res!307490) b!506391))

(assert (= (and b!506391 res!307493) b!506382))

(assert (= (and b!506382 res!307485) b!506388))

(assert (= (and b!506388 res!307483) b!506385))

(assert (= (and b!506385 res!307486) b!506383))

(assert (= (and b!506383 res!307487) b!506384))

(assert (= (and b!506384 res!307484) b!506389))

(assert (= (and b!506384 (not res!307491)) b!506386))

(assert (= (and b!506386 (not res!307489)) b!506392))

(declare-fun m!486583 () Bool)

(assert (=> b!506385 m!486583))

(declare-fun m!486585 () Bool)

(assert (=> b!506391 m!486585))

(declare-fun m!486587 () Bool)

(assert (=> b!506390 m!486587))

(assert (=> b!506390 m!486587))

(declare-fun m!486589 () Bool)

(assert (=> b!506390 m!486589))

(declare-fun m!486591 () Bool)

(assert (=> b!506383 m!486591))

(declare-fun m!486593 () Bool)

(assert (=> b!506388 m!486593))

(declare-fun m!486595 () Bool)

(assert (=> b!506382 m!486595))

(assert (=> b!506389 m!486587))

(assert (=> b!506389 m!486587))

(declare-fun m!486597 () Bool)

(assert (=> b!506389 m!486597))

(declare-fun m!486599 () Bool)

(assert (=> b!506384 m!486599))

(declare-fun m!486601 () Bool)

(assert (=> b!506384 m!486601))

(declare-fun m!486603 () Bool)

(assert (=> b!506384 m!486603))

(assert (=> b!506384 m!486587))

(declare-fun m!486605 () Bool)

(assert (=> b!506384 m!486605))

(assert (=> b!506384 m!486587))

(declare-fun m!486607 () Bool)

(assert (=> b!506384 m!486607))

(assert (=> b!506384 m!486587))

(declare-fun m!486609 () Bool)

(assert (=> b!506384 m!486609))

(assert (=> b!506384 m!486603))

(declare-fun m!486611 () Bool)

(assert (=> b!506384 m!486611))

(assert (=> b!506384 m!486603))

(declare-fun m!486613 () Bool)

(assert (=> b!506384 m!486613))

(declare-fun m!486615 () Bool)

(assert (=> start!45768 m!486615))

(declare-fun m!486617 () Bool)

(assert (=> start!45768 m!486617))

(check-sat (not b!506383) (not b!506382) (not b!506389) (not b!506384) (not b!506391) (not b!506388) (not start!45768) (not b!506385) (not b!506390))
(check-sat)
