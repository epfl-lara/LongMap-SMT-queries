; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45770 () Bool)

(assert start!45770)

(declare-fun b!506592 () Bool)

(declare-fun res!307611 () Bool)

(declare-fun e!296497 () Bool)

(assert (=> b!506592 (=> (not res!307611) (not e!296497))))

(declare-datatypes ((array!32527 0))(
  ( (array!32528 (arr!15643 (Array (_ BitVec 32) (_ BitVec 64))) (size!16007 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32527)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506592 (= res!307611 (validKeyInArray!0 (select (arr!15643 a!3235) j!176)))))

(declare-fun b!506593 () Bool)

(declare-fun res!307609 () Bool)

(declare-fun e!296496 () Bool)

(assert (=> b!506593 (=> (not res!307609) (not e!296496))))

(declare-datatypes ((List!9708 0))(
  ( (Nil!9705) (Cons!9704 (h!10581 (_ BitVec 64)) (t!15928 List!9708)) )
))
(declare-fun arrayNoDuplicates!0 (array!32527 (_ BitVec 32) List!9708) Bool)

(assert (=> b!506593 (= res!307609 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9705))))

(declare-fun b!506594 () Bool)

(declare-fun e!296498 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4066 0))(
  ( (MissingZero!4066 (index!18452 (_ BitVec 32))) (Found!4066 (index!18453 (_ BitVec 32))) (Intermediate!4066 (undefined!4878 Bool) (index!18454 (_ BitVec 32)) (x!47600 (_ BitVec 32))) (Undefined!4066) (MissingVacant!4066 (index!18455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32527 (_ BitVec 32)) SeekEntryResult!4066)

(assert (=> b!506594 (= e!296498 (= (seekEntryOrOpen!0 (select (arr!15643 a!3235) j!176) a!3235 mask!3524) (Found!4066 j!176)))))

(declare-fun b!506595 () Bool)

(declare-fun res!307613 () Bool)

(assert (=> b!506595 (=> (not res!307613) (not e!296497))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506595 (= res!307613 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506596 () Bool)

(declare-fun res!307606 () Bool)

(assert (=> b!506596 (=> (not res!307606) (not e!296497))))

(assert (=> b!506596 (= res!307606 (validKeyInArray!0 k0!2280))))

(declare-fun b!506597 () Bool)

(assert (=> b!506597 (= e!296497 e!296496)))

(declare-fun res!307615 () Bool)

(assert (=> b!506597 (=> (not res!307615) (not e!296496))))

(declare-fun lt!231226 () SeekEntryResult!4066)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506597 (= res!307615 (or (= lt!231226 (MissingZero!4066 i!1204)) (= lt!231226 (MissingVacant!4066 i!1204))))))

(assert (=> b!506597 (= lt!231226 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506598 () Bool)

(declare-fun res!307610 () Bool)

(assert (=> b!506598 (=> (not res!307610) (not e!296496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32527 (_ BitVec 32)) Bool)

(assert (=> b!506598 (= res!307610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!307608 () Bool)

(assert (=> start!45770 (=> (not res!307608) (not e!296497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45770 (= res!307608 (validMask!0 mask!3524))))

(assert (=> start!45770 e!296497))

(assert (=> start!45770 true))

(declare-fun array_inv!11502 (array!32527) Bool)

(assert (=> start!45770 (array_inv!11502 a!3235)))

(declare-fun b!506599 () Bool)

(declare-fun e!296494 () Bool)

(declare-fun e!296495 () Bool)

(assert (=> b!506599 (= e!296494 e!296495)))

(declare-fun res!307614 () Bool)

(assert (=> b!506599 (=> res!307614 e!296495)))

(declare-fun lt!231221 () Bool)

(declare-fun lt!231222 () SeekEntryResult!4066)

(assert (=> b!506599 (= res!307614 (or (and (not lt!231221) (undefined!4878 lt!231222)) (and (not lt!231221) (not (undefined!4878 lt!231222)))))))

(get-info :version)

(assert (=> b!506599 (= lt!231221 (not ((_ is Intermediate!4066) lt!231222)))))

(declare-fun b!506600 () Bool)

(declare-fun res!307612 () Bool)

(assert (=> b!506600 (=> (not res!307612) (not e!296497))))

(assert (=> b!506600 (= res!307612 (and (= (size!16007 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16007 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16007 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506601 () Bool)

(assert (=> b!506601 (= e!296495 true)))

(assert (=> b!506601 false))

(declare-fun b!506602 () Bool)

(assert (=> b!506602 (= e!296496 (not e!296494))))

(declare-fun res!307607 () Bool)

(assert (=> b!506602 (=> res!307607 e!296494)))

(declare-fun lt!231225 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32527 (_ BitVec 32)) SeekEntryResult!4066)

(assert (=> b!506602 (= res!307607 (= lt!231222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231225 (select (store (arr!15643 a!3235) i!1204 k0!2280) j!176) (array!32528 (store (arr!15643 a!3235) i!1204 k0!2280) (size!16007 a!3235)) mask!3524)))))

(declare-fun lt!231224 () (_ BitVec 32))

(assert (=> b!506602 (= lt!231222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231224 (select (arr!15643 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506602 (= lt!231225 (toIndex!0 (select (store (arr!15643 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506602 (= lt!231224 (toIndex!0 (select (arr!15643 a!3235) j!176) mask!3524))))

(assert (=> b!506602 e!296498))

(declare-fun res!307605 () Bool)

(assert (=> b!506602 (=> (not res!307605) (not e!296498))))

(assert (=> b!506602 (= res!307605 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15481 0))(
  ( (Unit!15482) )
))
(declare-fun lt!231223 () Unit!15481)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15481)

(assert (=> b!506602 (= lt!231223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45770 res!307608) b!506600))

(assert (= (and b!506600 res!307612) b!506592))

(assert (= (and b!506592 res!307611) b!506596))

(assert (= (and b!506596 res!307606) b!506595))

(assert (= (and b!506595 res!307613) b!506597))

(assert (= (and b!506597 res!307615) b!506598))

(assert (= (and b!506598 res!307610) b!506593))

(assert (= (and b!506593 res!307609) b!506602))

(assert (= (and b!506602 res!307605) b!506594))

(assert (= (and b!506602 (not res!307607)) b!506599))

(assert (= (and b!506599 (not res!307614)) b!506601))

(declare-fun m!487519 () Bool)

(assert (=> b!506594 m!487519))

(assert (=> b!506594 m!487519))

(declare-fun m!487521 () Bool)

(assert (=> b!506594 m!487521))

(declare-fun m!487523 () Bool)

(assert (=> b!506596 m!487523))

(assert (=> b!506592 m!487519))

(assert (=> b!506592 m!487519))

(declare-fun m!487525 () Bool)

(assert (=> b!506592 m!487525))

(declare-fun m!487527 () Bool)

(assert (=> b!506593 m!487527))

(declare-fun m!487529 () Bool)

(assert (=> b!506598 m!487529))

(declare-fun m!487531 () Bool)

(assert (=> b!506597 m!487531))

(declare-fun m!487533 () Bool)

(assert (=> b!506602 m!487533))

(declare-fun m!487535 () Bool)

(assert (=> b!506602 m!487535))

(declare-fun m!487537 () Bool)

(assert (=> b!506602 m!487537))

(assert (=> b!506602 m!487519))

(declare-fun m!487539 () Bool)

(assert (=> b!506602 m!487539))

(assert (=> b!506602 m!487519))

(declare-fun m!487541 () Bool)

(assert (=> b!506602 m!487541))

(assert (=> b!506602 m!487519))

(declare-fun m!487543 () Bool)

(assert (=> b!506602 m!487543))

(assert (=> b!506602 m!487537))

(declare-fun m!487545 () Bool)

(assert (=> b!506602 m!487545))

(assert (=> b!506602 m!487537))

(declare-fun m!487547 () Bool)

(assert (=> b!506602 m!487547))

(declare-fun m!487549 () Bool)

(assert (=> start!45770 m!487549))

(declare-fun m!487551 () Bool)

(assert (=> start!45770 m!487551))

(declare-fun m!487553 () Bool)

(assert (=> b!506595 m!487553))

(check-sat (not b!506593) (not b!506592) (not start!45770) (not b!506598) (not b!506595) (not b!506597) (not b!506602) (not b!506594) (not b!506596))
(check-sat)
