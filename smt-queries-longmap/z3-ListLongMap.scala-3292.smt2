; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45684 () Bool)

(assert start!45684)

(declare-fun b!504405 () Bool)

(declare-fun res!305700 () Bool)

(declare-fun e!295310 () Bool)

(assert (=> b!504405 (=> (not res!305700) (not e!295310))))

(declare-datatypes ((array!32450 0))(
  ( (array!32451 (arr!15605 (Array (_ BitVec 32) (_ BitVec 64))) (size!15970 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32450)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504405 (= res!305700 (validKeyInArray!0 (select (arr!15605 a!3235) j!176)))))

(declare-fun b!504406 () Bool)

(declare-fun res!305712 () Bool)

(assert (=> b!504406 (=> (not res!305712) (not e!295310))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!504406 (= res!305712 (validKeyInArray!0 k0!2280))))

(declare-fun b!504407 () Bool)

(declare-fun res!305702 () Bool)

(declare-fun e!295306 () Bool)

(assert (=> b!504407 (=> res!305702 e!295306)))

(declare-fun e!295307 () Bool)

(assert (=> b!504407 (= res!305702 e!295307)))

(declare-fun res!305711 () Bool)

(assert (=> b!504407 (=> (not res!305711) (not e!295307))))

(declare-datatypes ((SeekEntryResult!4069 0))(
  ( (MissingZero!4069 (index!18464 (_ BitVec 32))) (Found!4069 (index!18465 (_ BitVec 32))) (Intermediate!4069 (undefined!4881 Bool) (index!18466 (_ BitVec 32)) (x!47489 (_ BitVec 32))) (Undefined!4069) (MissingVacant!4069 (index!18467 (_ BitVec 32))) )
))
(declare-fun lt!229597 () SeekEntryResult!4069)

(assert (=> b!504407 (= res!305711 (bvsgt #b00000000000000000000000000000000 (x!47489 lt!229597)))))

(declare-fun res!305714 () Bool)

(assert (=> start!45684 (=> (not res!305714) (not e!295310))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45684 (= res!305714 (validMask!0 mask!3524))))

(assert (=> start!45684 e!295310))

(assert (=> start!45684 true))

(declare-fun array_inv!11488 (array!32450) Bool)

(assert (=> start!45684 (array_inv!11488 a!3235)))

(declare-fun b!504408 () Bool)

(declare-fun res!305701 () Bool)

(assert (=> b!504408 (=> (not res!305701) (not e!295310))))

(declare-fun arrayContainsKey!0 (array!32450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504408 (= res!305701 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504409 () Bool)

(declare-fun lt!229590 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32450 (_ BitVec 32)) SeekEntryResult!4069)

(assert (=> b!504409 (= e!295307 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229590 (index!18466 lt!229597) (select (arr!15605 a!3235) j!176) a!3235 mask!3524) (Found!4069 j!176))))))

(declare-fun b!504410 () Bool)

(declare-fun res!305706 () Bool)

(declare-fun e!295308 () Bool)

(assert (=> b!504410 (=> (not res!305706) (not e!295308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32450 (_ BitVec 32)) Bool)

(assert (=> b!504410 (= res!305706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504411 () Bool)

(declare-fun res!305708 () Bool)

(declare-fun e!295303 () Bool)

(assert (=> b!504411 (=> res!305708 e!295303)))

(get-info :version)

(assert (=> b!504411 (= res!305708 (or (undefined!4881 lt!229597) (not ((_ is Intermediate!4069) lt!229597))))))

(declare-fun b!504412 () Bool)

(declare-fun e!295309 () Bool)

(assert (=> b!504412 (= e!295309 false)))

(declare-fun b!504413 () Bool)

(declare-datatypes ((Unit!15346 0))(
  ( (Unit!15347) )
))
(declare-fun e!295304 () Unit!15346)

(declare-fun Unit!15348 () Unit!15346)

(assert (=> b!504413 (= e!295304 Unit!15348)))

(declare-fun lt!229591 () Unit!15346)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32450 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15346)

(assert (=> b!504413 (= lt!229591 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229590 #b00000000000000000000000000000000 (index!18466 lt!229597) (x!47489 lt!229597) mask!3524))))

(declare-fun res!305709 () Bool)

(declare-fun lt!229593 () array!32450)

(declare-fun lt!229599 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32450 (_ BitVec 32)) SeekEntryResult!4069)

(assert (=> b!504413 (= res!305709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229590 lt!229599 lt!229593 mask!3524) (Intermediate!4069 false (index!18466 lt!229597) (x!47489 lt!229597))))))

(assert (=> b!504413 (=> (not res!305709) (not e!295309))))

(assert (=> b!504413 e!295309))

(declare-fun b!504414 () Bool)

(assert (=> b!504414 (= e!295308 (not e!295303))))

(declare-fun res!305710 () Bool)

(assert (=> b!504414 (=> res!305710 e!295303)))

(declare-fun lt!229595 () (_ BitVec 32))

(assert (=> b!504414 (= res!305710 (= lt!229597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229595 lt!229599 lt!229593 mask!3524)))))

(assert (=> b!504414 (= lt!229597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229590 (select (arr!15605 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504414 (= lt!229595 (toIndex!0 lt!229599 mask!3524))))

(assert (=> b!504414 (= lt!229599 (select (store (arr!15605 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504414 (= lt!229590 (toIndex!0 (select (arr!15605 a!3235) j!176) mask!3524))))

(assert (=> b!504414 (= lt!229593 (array!32451 (store (arr!15605 a!3235) i!1204 k0!2280) (size!15970 a!3235)))))

(declare-fun e!295311 () Bool)

(assert (=> b!504414 e!295311))

(declare-fun res!305707 () Bool)

(assert (=> b!504414 (=> (not res!305707) (not e!295311))))

(assert (=> b!504414 (= res!305707 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229600 () Unit!15346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15346)

(assert (=> b!504414 (= lt!229600 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504415 () Bool)

(assert (=> b!504415 (= e!295303 e!295306)))

(declare-fun res!305713 () Bool)

(assert (=> b!504415 (=> res!305713 e!295306)))

(assert (=> b!504415 (= res!305713 (or (bvsgt (x!47489 lt!229597) #b01111111111111111111111111111110) (bvslt lt!229590 #b00000000000000000000000000000000) (bvsge lt!229590 (size!15970 a!3235)) (bvslt (index!18466 lt!229597) #b00000000000000000000000000000000) (bvsge (index!18466 lt!229597) (size!15970 a!3235)) (not (= lt!229597 (Intermediate!4069 false (index!18466 lt!229597) (x!47489 lt!229597))))))))

(assert (=> b!504415 (= (index!18466 lt!229597) i!1204)))

(declare-fun lt!229596 () Unit!15346)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32450 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15346)

(assert (=> b!504415 (= lt!229596 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229590 #b00000000000000000000000000000000 (index!18466 lt!229597) (x!47489 lt!229597) mask!3524))))

(assert (=> b!504415 (and (or (= (select (arr!15605 a!3235) (index!18466 lt!229597)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15605 a!3235) (index!18466 lt!229597)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15605 a!3235) (index!18466 lt!229597)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15605 a!3235) (index!18466 lt!229597)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229594 () Unit!15346)

(assert (=> b!504415 (= lt!229594 e!295304)))

(declare-fun c!59631 () Bool)

(assert (=> b!504415 (= c!59631 (= (select (arr!15605 a!3235) (index!18466 lt!229597)) (select (arr!15605 a!3235) j!176)))))

(assert (=> b!504415 (and (bvslt (x!47489 lt!229597) #b01111111111111111111111111111110) (or (= (select (arr!15605 a!3235) (index!18466 lt!229597)) (select (arr!15605 a!3235) j!176)) (= (select (arr!15605 a!3235) (index!18466 lt!229597)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15605 a!3235) (index!18466 lt!229597)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504416 () Bool)

(assert (=> b!504416 (= e!295306 true)))

(declare-fun lt!229592 () SeekEntryResult!4069)

(assert (=> b!504416 (= lt!229592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229590 lt!229599 lt!229593 mask!3524))))

(declare-fun b!504417 () Bool)

(assert (=> b!504417 (= e!295310 e!295308)))

(declare-fun res!305705 () Bool)

(assert (=> b!504417 (=> (not res!305705) (not e!295308))))

(declare-fun lt!229598 () SeekEntryResult!4069)

(assert (=> b!504417 (= res!305705 (or (= lt!229598 (MissingZero!4069 i!1204)) (= lt!229598 (MissingVacant!4069 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32450 (_ BitVec 32)) SeekEntryResult!4069)

(assert (=> b!504417 (= lt!229598 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504418 () Bool)

(declare-fun res!305704 () Bool)

(assert (=> b!504418 (=> (not res!305704) (not e!295310))))

(assert (=> b!504418 (= res!305704 (and (= (size!15970 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15970 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15970 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504419 () Bool)

(assert (=> b!504419 (= e!295311 (= (seekEntryOrOpen!0 (select (arr!15605 a!3235) j!176) a!3235 mask!3524) (Found!4069 j!176)))))

(declare-fun b!504420 () Bool)

(declare-fun res!305703 () Bool)

(assert (=> b!504420 (=> (not res!305703) (not e!295308))))

(declare-datatypes ((List!9802 0))(
  ( (Nil!9799) (Cons!9798 (h!10675 (_ BitVec 64)) (t!16021 List!9802)) )
))
(declare-fun arrayNoDuplicates!0 (array!32450 (_ BitVec 32) List!9802) Bool)

(assert (=> b!504420 (= res!305703 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9799))))

(declare-fun b!504421 () Bool)

(declare-fun Unit!15349 () Unit!15346)

(assert (=> b!504421 (= e!295304 Unit!15349)))

(assert (= (and start!45684 res!305714) b!504418))

(assert (= (and b!504418 res!305704) b!504405))

(assert (= (and b!504405 res!305700) b!504406))

(assert (= (and b!504406 res!305712) b!504408))

(assert (= (and b!504408 res!305701) b!504417))

(assert (= (and b!504417 res!305705) b!504410))

(assert (= (and b!504410 res!305706) b!504420))

(assert (= (and b!504420 res!305703) b!504414))

(assert (= (and b!504414 res!305707) b!504419))

(assert (= (and b!504414 (not res!305710)) b!504411))

(assert (= (and b!504411 (not res!305708)) b!504415))

(assert (= (and b!504415 c!59631) b!504413))

(assert (= (and b!504415 (not c!59631)) b!504421))

(assert (= (and b!504413 res!305709) b!504412))

(assert (= (and b!504415 (not res!305713)) b!504407))

(assert (= (and b!504407 res!305711) b!504409))

(assert (= (and b!504407 (not res!305702)) b!504416))

(declare-fun m!484639 () Bool)

(assert (=> b!504406 m!484639))

(declare-fun m!484641 () Bool)

(assert (=> b!504415 m!484641))

(declare-fun m!484643 () Bool)

(assert (=> b!504415 m!484643))

(declare-fun m!484645 () Bool)

(assert (=> b!504415 m!484645))

(declare-fun m!484647 () Bool)

(assert (=> b!504417 m!484647))

(declare-fun m!484649 () Bool)

(assert (=> b!504416 m!484649))

(declare-fun m!484651 () Bool)

(assert (=> b!504413 m!484651))

(assert (=> b!504413 m!484649))

(assert (=> b!504419 m!484645))

(assert (=> b!504419 m!484645))

(declare-fun m!484653 () Bool)

(assert (=> b!504419 m!484653))

(declare-fun m!484655 () Bool)

(assert (=> b!504408 m!484655))

(declare-fun m!484657 () Bool)

(assert (=> b!504420 m!484657))

(assert (=> b!504409 m!484645))

(assert (=> b!504409 m!484645))

(declare-fun m!484659 () Bool)

(assert (=> b!504409 m!484659))

(declare-fun m!484661 () Bool)

(assert (=> start!45684 m!484661))

(declare-fun m!484663 () Bool)

(assert (=> start!45684 m!484663))

(declare-fun m!484665 () Bool)

(assert (=> b!504410 m!484665))

(assert (=> b!504405 m!484645))

(assert (=> b!504405 m!484645))

(declare-fun m!484667 () Bool)

(assert (=> b!504405 m!484667))

(declare-fun m!484669 () Bool)

(assert (=> b!504414 m!484669))

(declare-fun m!484671 () Bool)

(assert (=> b!504414 m!484671))

(declare-fun m!484673 () Bool)

(assert (=> b!504414 m!484673))

(declare-fun m!484675 () Bool)

(assert (=> b!504414 m!484675))

(assert (=> b!504414 m!484645))

(declare-fun m!484677 () Bool)

(assert (=> b!504414 m!484677))

(assert (=> b!504414 m!484645))

(declare-fun m!484679 () Bool)

(assert (=> b!504414 m!484679))

(assert (=> b!504414 m!484645))

(declare-fun m!484681 () Bool)

(assert (=> b!504414 m!484681))

(declare-fun m!484683 () Bool)

(assert (=> b!504414 m!484683))

(check-sat (not b!504415) (not b!504420) (not b!504405) (not b!504408) (not start!45684) (not b!504413) (not b!504409) (not b!504410) (not b!504406) (not b!504417) (not b!504416) (not b!504414) (not b!504419))
(check-sat)
