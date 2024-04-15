; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45828 () Bool)

(assert start!45828)

(declare-datatypes ((array!32594 0))(
  ( (array!32595 (arr!15677 (Array (_ BitVec 32) (_ BitVec 64))) (size!16042 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32594)

(declare-fun b!507372 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!296902 () Bool)

(declare-datatypes ((SeekEntryResult!4141 0))(
  ( (MissingZero!4141 (index!18752 (_ BitVec 32))) (Found!4141 (index!18753 (_ BitVec 32))) (Intermediate!4141 (undefined!4953 Bool) (index!18754 (_ BitVec 32)) (x!47753 (_ BitVec 32))) (Undefined!4141) (MissingVacant!4141 (index!18755 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32594 (_ BitVec 32)) SeekEntryResult!4141)

(assert (=> b!507372 (= e!296902 (= (seekEntryOrOpen!0 (select (arr!15677 a!3235) j!176) a!3235 mask!3524) (Found!4141 j!176)))))

(declare-fun b!507373 () Bool)

(declare-fun res!308476 () Bool)

(declare-fun e!296903 () Bool)

(assert (=> b!507373 (=> (not res!308476) (not e!296903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32594 (_ BitVec 32)) Bool)

(assert (=> b!507373 (= res!308476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507374 () Bool)

(declare-fun e!296900 () Bool)

(assert (=> b!507374 (= e!296903 (not e!296900))))

(declare-fun res!308480 () Bool)

(assert (=> b!507374 (=> res!308480 e!296900)))

(declare-fun lt!231657 () SeekEntryResult!4141)

(declare-fun lt!231658 () (_ BitVec 32))

(declare-fun lt!231664 () array!32594)

(declare-fun lt!231663 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32594 (_ BitVec 32)) SeekEntryResult!4141)

(assert (=> b!507374 (= res!308480 (= lt!231657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231658 lt!231663 lt!231664 mask!3524)))))

(declare-fun lt!231661 () (_ BitVec 32))

(assert (=> b!507374 (= lt!231657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231661 (select (arr!15677 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507374 (= lt!231658 (toIndex!0 lt!231663 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507374 (= lt!231663 (select (store (arr!15677 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507374 (= lt!231661 (toIndex!0 (select (arr!15677 a!3235) j!176) mask!3524))))

(assert (=> b!507374 (= lt!231664 (array!32595 (store (arr!15677 a!3235) i!1204 k0!2280) (size!16042 a!3235)))))

(assert (=> b!507374 e!296902))

(declare-fun res!308478 () Bool)

(assert (=> b!507374 (=> (not res!308478) (not e!296902))))

(assert (=> b!507374 (= res!308478 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15556 0))(
  ( (Unit!15557) )
))
(declare-fun lt!231656 () Unit!15556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15556)

(assert (=> b!507374 (= lt!231656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507375 () Bool)

(declare-fun res!308477 () Bool)

(declare-fun e!296901 () Bool)

(assert (=> b!507375 (=> (not res!308477) (not e!296901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507375 (= res!308477 (validKeyInArray!0 k0!2280))))

(declare-fun b!507376 () Bool)

(declare-fun res!308474 () Bool)

(assert (=> b!507376 (=> (not res!308474) (not e!296901))))

(assert (=> b!507376 (= res!308474 (and (= (size!16042 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16042 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16042 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507377 () Bool)

(declare-fun res!308473 () Bool)

(assert (=> b!507377 (=> (not res!308473) (not e!296903))))

(declare-datatypes ((List!9874 0))(
  ( (Nil!9871) (Cons!9870 (h!10747 (_ BitVec 64)) (t!16093 List!9874)) )
))
(declare-fun arrayNoDuplicates!0 (array!32594 (_ BitVec 32) List!9874) Bool)

(assert (=> b!507377 (= res!308473 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9871))))

(declare-fun res!308482 () Bool)

(assert (=> start!45828 (=> (not res!308482) (not e!296901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45828 (= res!308482 (validMask!0 mask!3524))))

(assert (=> start!45828 e!296901))

(assert (=> start!45828 true))

(declare-fun array_inv!11560 (array!32594) Bool)

(assert (=> start!45828 (array_inv!11560 a!3235)))

(declare-fun b!507378 () Bool)

(declare-fun e!296899 () Bool)

(assert (=> b!507378 (= e!296899 true)))

(declare-fun lt!231659 () SeekEntryResult!4141)

(assert (=> b!507378 (= lt!231659 (seekEntryOrOpen!0 lt!231663 lt!231664 mask!3524))))

(assert (=> b!507378 false))

(declare-fun b!507379 () Bool)

(declare-fun res!308481 () Bool)

(assert (=> b!507379 (=> (not res!308481) (not e!296901))))

(declare-fun arrayContainsKey!0 (array!32594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507379 (= res!308481 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507380 () Bool)

(declare-fun res!308483 () Bool)

(assert (=> b!507380 (=> (not res!308483) (not e!296901))))

(assert (=> b!507380 (= res!308483 (validKeyInArray!0 (select (arr!15677 a!3235) j!176)))))

(declare-fun b!507381 () Bool)

(assert (=> b!507381 (= e!296900 e!296899)))

(declare-fun res!308475 () Bool)

(assert (=> b!507381 (=> res!308475 e!296899)))

(declare-fun lt!231662 () Bool)

(assert (=> b!507381 (= res!308475 (or (and (not lt!231662) (undefined!4953 lt!231657)) (and (not lt!231662) (not (undefined!4953 lt!231657)))))))

(get-info :version)

(assert (=> b!507381 (= lt!231662 (not ((_ is Intermediate!4141) lt!231657)))))

(declare-fun b!507382 () Bool)

(assert (=> b!507382 (= e!296901 e!296903)))

(declare-fun res!308479 () Bool)

(assert (=> b!507382 (=> (not res!308479) (not e!296903))))

(declare-fun lt!231660 () SeekEntryResult!4141)

(assert (=> b!507382 (= res!308479 (or (= lt!231660 (MissingZero!4141 i!1204)) (= lt!231660 (MissingVacant!4141 i!1204))))))

(assert (=> b!507382 (= lt!231660 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45828 res!308482) b!507376))

(assert (= (and b!507376 res!308474) b!507380))

(assert (= (and b!507380 res!308483) b!507375))

(assert (= (and b!507375 res!308477) b!507379))

(assert (= (and b!507379 res!308481) b!507382))

(assert (= (and b!507382 res!308479) b!507373))

(assert (= (and b!507373 res!308476) b!507377))

(assert (= (and b!507377 res!308473) b!507374))

(assert (= (and b!507374 res!308478) b!507372))

(assert (= (and b!507374 (not res!308480)) b!507381))

(assert (= (and b!507381 (not res!308475)) b!507378))

(declare-fun m!487693 () Bool)

(assert (=> b!507382 m!487693))

(declare-fun m!487695 () Bool)

(assert (=> b!507378 m!487695))

(declare-fun m!487697 () Bool)

(assert (=> b!507377 m!487697))

(declare-fun m!487699 () Bool)

(assert (=> b!507375 m!487699))

(declare-fun m!487701 () Bool)

(assert (=> start!45828 m!487701))

(declare-fun m!487703 () Bool)

(assert (=> start!45828 m!487703))

(declare-fun m!487705 () Bool)

(assert (=> b!507380 m!487705))

(assert (=> b!507380 m!487705))

(declare-fun m!487707 () Bool)

(assert (=> b!507380 m!487707))

(declare-fun m!487709 () Bool)

(assert (=> b!507373 m!487709))

(declare-fun m!487711 () Bool)

(assert (=> b!507379 m!487711))

(assert (=> b!507372 m!487705))

(assert (=> b!507372 m!487705))

(declare-fun m!487713 () Bool)

(assert (=> b!507372 m!487713))

(declare-fun m!487715 () Bool)

(assert (=> b!507374 m!487715))

(declare-fun m!487717 () Bool)

(assert (=> b!507374 m!487717))

(declare-fun m!487719 () Bool)

(assert (=> b!507374 m!487719))

(declare-fun m!487721 () Bool)

(assert (=> b!507374 m!487721))

(declare-fun m!487723 () Bool)

(assert (=> b!507374 m!487723))

(assert (=> b!507374 m!487705))

(declare-fun m!487725 () Bool)

(assert (=> b!507374 m!487725))

(assert (=> b!507374 m!487705))

(declare-fun m!487727 () Bool)

(assert (=> b!507374 m!487727))

(assert (=> b!507374 m!487705))

(declare-fun m!487729 () Bool)

(assert (=> b!507374 m!487729))

(check-sat (not b!507378) (not b!507375) (not b!507374) (not b!507379) (not b!507377) (not b!507382) (not start!45828) (not b!507372) (not b!507373) (not b!507380))
(check-sat)
