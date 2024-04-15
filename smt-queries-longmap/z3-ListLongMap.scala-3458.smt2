; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48006 () Bool)

(assert start!48006)

(declare-fun b!528552 () Bool)

(declare-fun e!308000 () Bool)

(assert (=> b!528552 (= e!308000 true)))

(declare-datatypes ((array!33509 0))(
  ( (array!33510 (arr!16103 (Array (_ BitVec 32) (_ BitVec 64))) (size!16468 (_ BitVec 32))) )
))
(declare-fun lt!243403 () array!33509)

(declare-fun lt!243415 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4567 0))(
  ( (MissingZero!4567 (index!20492 (_ BitVec 32))) (Found!4567 (index!20493 (_ BitVec 32))) (Intermediate!4567 (undefined!5379 Bool) (index!20494 (_ BitVec 32)) (x!49474 (_ BitVec 32))) (Undefined!4567) (MissingVacant!4567 (index!20495 (_ BitVec 32))) )
))
(declare-fun lt!243404 () SeekEntryResult!4567)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33509 (_ BitVec 32)) SeekEntryResult!4567)

(assert (=> b!528552 (= (seekEntryOrOpen!0 lt!243415 lt!243403 mask!3524) lt!243404)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243414 () (_ BitVec 32))

(declare-fun a!3235 () array!33509)

(declare-datatypes ((Unit!16714 0))(
  ( (Unit!16715) )
))
(declare-fun lt!243413 () Unit!16714)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!243412 () SeekEntryResult!4567)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16714)

(assert (=> b!528552 (= lt!243413 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243414 #b00000000000000000000000000000000 (index!20494 lt!243412) (x!49474 lt!243412) mask!3524))))

(declare-fun res!324646 () Bool)

(declare-fun e!307998 () Bool)

(assert (=> start!48006 (=> (not res!324646) (not e!307998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48006 (= res!324646 (validMask!0 mask!3524))))

(assert (=> start!48006 e!307998))

(assert (=> start!48006 true))

(declare-fun array_inv!11986 (array!33509) Bool)

(assert (=> start!48006 (array_inv!11986 a!3235)))

(declare-fun b!528553 () Bool)

(declare-fun res!324642 () Bool)

(declare-fun e!307996 () Bool)

(assert (=> b!528553 (=> (not res!324642) (not e!307996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33509 (_ BitVec 32)) Bool)

(assert (=> b!528553 (= res!324642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!307993 () Bool)

(declare-fun b!528554 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33509 (_ BitVec 32)) SeekEntryResult!4567)

(assert (=> b!528554 (= e!307993 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243414 (index!20494 lt!243412) (select (arr!16103 a!3235) j!176) a!3235 mask!3524) lt!243404)))))

(declare-fun b!528555 () Bool)

(declare-fun e!308001 () Unit!16714)

(declare-fun Unit!16716 () Unit!16714)

(assert (=> b!528555 (= e!308001 Unit!16716)))

(declare-fun b!528556 () Bool)

(declare-fun res!324634 () Bool)

(assert (=> b!528556 (=> (not res!324634) (not e!307998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528556 (= res!324634 (validKeyInArray!0 k0!2280))))

(declare-fun b!528557 () Bool)

(declare-fun res!324641 () Bool)

(assert (=> b!528557 (=> res!324641 e!308000)))

(assert (=> b!528557 (= res!324641 e!307993)))

(declare-fun res!324638 () Bool)

(assert (=> b!528557 (=> (not res!324638) (not e!307993))))

(assert (=> b!528557 (= res!324638 (bvsgt #b00000000000000000000000000000000 (x!49474 lt!243412)))))

(declare-fun b!528558 () Bool)

(declare-fun e!307995 () Bool)

(assert (=> b!528558 (= e!307995 (= (seekEntryOrOpen!0 (select (arr!16103 a!3235) j!176) a!3235 mask!3524) (Found!4567 j!176)))))

(declare-fun b!528559 () Bool)

(declare-fun res!324633 () Bool)

(assert (=> b!528559 (=> (not res!324633) (not e!307998))))

(assert (=> b!528559 (= res!324633 (and (= (size!16468 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16468 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16468 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528560 () Bool)

(declare-fun e!307999 () Bool)

(assert (=> b!528560 (= e!307999 e!308000)))

(declare-fun res!324640 () Bool)

(assert (=> b!528560 (=> res!324640 e!308000)))

(assert (=> b!528560 (= res!324640 (or (bvsgt (x!49474 lt!243412) #b01111111111111111111111111111110) (bvslt lt!243414 #b00000000000000000000000000000000) (bvsge lt!243414 (size!16468 a!3235)) (bvslt (index!20494 lt!243412) #b00000000000000000000000000000000) (bvsge (index!20494 lt!243412) (size!16468 a!3235)) (not (= lt!243412 (Intermediate!4567 false (index!20494 lt!243412) (x!49474 lt!243412))))))))

(assert (=> b!528560 (= (index!20494 lt!243412) i!1204)))

(declare-fun lt!243407 () Unit!16714)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16714)

(assert (=> b!528560 (= lt!243407 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243414 #b00000000000000000000000000000000 (index!20494 lt!243412) (x!49474 lt!243412) mask!3524))))

(assert (=> b!528560 (and (or (= (select (arr!16103 a!3235) (index!20494 lt!243412)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16103 a!3235) (index!20494 lt!243412)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16103 a!3235) (index!20494 lt!243412)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16103 a!3235) (index!20494 lt!243412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243408 () Unit!16714)

(assert (=> b!528560 (= lt!243408 e!308001)))

(declare-fun c!62268 () Bool)

(assert (=> b!528560 (= c!62268 (= (select (arr!16103 a!3235) (index!20494 lt!243412)) (select (arr!16103 a!3235) j!176)))))

(assert (=> b!528560 (and (bvslt (x!49474 lt!243412) #b01111111111111111111111111111110) (or (= (select (arr!16103 a!3235) (index!20494 lt!243412)) (select (arr!16103 a!3235) j!176)) (= (select (arr!16103 a!3235) (index!20494 lt!243412)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16103 a!3235) (index!20494 lt!243412)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528561 () Bool)

(declare-fun Unit!16717 () Unit!16714)

(assert (=> b!528561 (= e!308001 Unit!16717)))

(declare-fun lt!243406 () Unit!16714)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16714)

(assert (=> b!528561 (= lt!243406 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243414 #b00000000000000000000000000000000 (index!20494 lt!243412) (x!49474 lt!243412) mask!3524))))

(declare-fun res!324647 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33509 (_ BitVec 32)) SeekEntryResult!4567)

(assert (=> b!528561 (= res!324647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243414 lt!243415 lt!243403 mask!3524) (Intermediate!4567 false (index!20494 lt!243412) (x!49474 lt!243412))))))

(declare-fun e!307997 () Bool)

(assert (=> b!528561 (=> (not res!324647) (not e!307997))))

(assert (=> b!528561 e!307997))

(declare-fun b!528562 () Bool)

(declare-fun res!324635 () Bool)

(assert (=> b!528562 (=> (not res!324635) (not e!307998))))

(assert (=> b!528562 (= res!324635 (validKeyInArray!0 (select (arr!16103 a!3235) j!176)))))

(declare-fun b!528563 () Bool)

(assert (=> b!528563 (= e!307997 false)))

(declare-fun b!528564 () Bool)

(assert (=> b!528564 (= e!307996 (not e!307999))))

(declare-fun res!324637 () Bool)

(assert (=> b!528564 (=> res!324637 e!307999)))

(declare-fun lt!243410 () SeekEntryResult!4567)

(get-info :version)

(assert (=> b!528564 (= res!324637 (or (= lt!243412 lt!243410) (undefined!5379 lt!243412) (not ((_ is Intermediate!4567) lt!243412))))))

(declare-fun lt!243409 () (_ BitVec 32))

(assert (=> b!528564 (= lt!243410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243409 lt!243415 lt!243403 mask!3524))))

(assert (=> b!528564 (= lt!243412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243414 (select (arr!16103 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528564 (= lt!243409 (toIndex!0 lt!243415 mask!3524))))

(assert (=> b!528564 (= lt!243415 (select (store (arr!16103 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528564 (= lt!243414 (toIndex!0 (select (arr!16103 a!3235) j!176) mask!3524))))

(assert (=> b!528564 (= lt!243403 (array!33510 (store (arr!16103 a!3235) i!1204 k0!2280) (size!16468 a!3235)))))

(assert (=> b!528564 (= lt!243404 (Found!4567 j!176))))

(assert (=> b!528564 e!307995))

(declare-fun res!324645 () Bool)

(assert (=> b!528564 (=> (not res!324645) (not e!307995))))

(assert (=> b!528564 (= res!324645 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243405 () Unit!16714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16714)

(assert (=> b!528564 (= lt!243405 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528565 () Bool)

(declare-fun res!324636 () Bool)

(assert (=> b!528565 (=> (not res!324636) (not e!307996))))

(declare-datatypes ((List!10300 0))(
  ( (Nil!10297) (Cons!10296 (h!11233 (_ BitVec 64)) (t!16519 List!10300)) )
))
(declare-fun arrayNoDuplicates!0 (array!33509 (_ BitVec 32) List!10300) Bool)

(assert (=> b!528565 (= res!324636 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10297))))

(declare-fun b!528566 () Bool)

(declare-fun res!324644 () Bool)

(assert (=> b!528566 (=> res!324644 e!308000)))

(assert (=> b!528566 (= res!324644 (not (= lt!243410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243414 lt!243415 lt!243403 mask!3524))))))

(declare-fun b!528567 () Bool)

(assert (=> b!528567 (= e!307998 e!307996)))

(declare-fun res!324639 () Bool)

(assert (=> b!528567 (=> (not res!324639) (not e!307996))))

(declare-fun lt!243411 () SeekEntryResult!4567)

(assert (=> b!528567 (= res!324639 (or (= lt!243411 (MissingZero!4567 i!1204)) (= lt!243411 (MissingVacant!4567 i!1204))))))

(assert (=> b!528567 (= lt!243411 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528568 () Bool)

(declare-fun res!324643 () Bool)

(assert (=> b!528568 (=> (not res!324643) (not e!307998))))

(declare-fun arrayContainsKey!0 (array!33509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528568 (= res!324643 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!48006 res!324646) b!528559))

(assert (= (and b!528559 res!324633) b!528562))

(assert (= (and b!528562 res!324635) b!528556))

(assert (= (and b!528556 res!324634) b!528568))

(assert (= (and b!528568 res!324643) b!528567))

(assert (= (and b!528567 res!324639) b!528553))

(assert (= (and b!528553 res!324642) b!528565))

(assert (= (and b!528565 res!324636) b!528564))

(assert (= (and b!528564 res!324645) b!528558))

(assert (= (and b!528564 (not res!324637)) b!528560))

(assert (= (and b!528560 c!62268) b!528561))

(assert (= (and b!528560 (not c!62268)) b!528555))

(assert (= (and b!528561 res!324647) b!528563))

(assert (= (and b!528560 (not res!324640)) b!528557))

(assert (= (and b!528557 res!324638) b!528554))

(assert (= (and b!528557 (not res!324641)) b!528566))

(assert (= (and b!528566 (not res!324644)) b!528552))

(declare-fun m!508603 () Bool)

(assert (=> b!528568 m!508603))

(declare-fun m!508605 () Bool)

(assert (=> b!528560 m!508605))

(declare-fun m!508607 () Bool)

(assert (=> b!528560 m!508607))

(declare-fun m!508609 () Bool)

(assert (=> b!528560 m!508609))

(declare-fun m!508611 () Bool)

(assert (=> b!528567 m!508611))

(assert (=> b!528562 m!508609))

(assert (=> b!528562 m!508609))

(declare-fun m!508613 () Bool)

(assert (=> b!528562 m!508613))

(declare-fun m!508615 () Bool)

(assert (=> b!528561 m!508615))

(declare-fun m!508617 () Bool)

(assert (=> b!528561 m!508617))

(declare-fun m!508619 () Bool)

(assert (=> b!528564 m!508619))

(declare-fun m!508621 () Bool)

(assert (=> b!528564 m!508621))

(declare-fun m!508623 () Bool)

(assert (=> b!528564 m!508623))

(declare-fun m!508625 () Bool)

(assert (=> b!528564 m!508625))

(assert (=> b!528564 m!508609))

(declare-fun m!508627 () Bool)

(assert (=> b!528564 m!508627))

(assert (=> b!528564 m!508609))

(assert (=> b!528564 m!508609))

(declare-fun m!508629 () Bool)

(assert (=> b!528564 m!508629))

(declare-fun m!508631 () Bool)

(assert (=> b!528564 m!508631))

(declare-fun m!508633 () Bool)

(assert (=> b!528564 m!508633))

(declare-fun m!508635 () Bool)

(assert (=> b!528565 m!508635))

(assert (=> b!528558 m!508609))

(assert (=> b!528558 m!508609))

(declare-fun m!508637 () Bool)

(assert (=> b!528558 m!508637))

(declare-fun m!508639 () Bool)

(assert (=> b!528552 m!508639))

(declare-fun m!508641 () Bool)

(assert (=> b!528552 m!508641))

(declare-fun m!508643 () Bool)

(assert (=> b!528553 m!508643))

(declare-fun m!508645 () Bool)

(assert (=> b!528556 m!508645))

(declare-fun m!508647 () Bool)

(assert (=> start!48006 m!508647))

(declare-fun m!508649 () Bool)

(assert (=> start!48006 m!508649))

(assert (=> b!528566 m!508617))

(assert (=> b!528554 m!508609))

(assert (=> b!528554 m!508609))

(declare-fun m!508651 () Bool)

(assert (=> b!528554 m!508651))

(check-sat (not b!528564) (not b!528552) (not b!528566) (not b!528556) (not b!528562) (not b!528553) (not b!528561) (not b!528554) (not b!528565) (not b!528567) (not b!528560) (not b!528568) (not b!528558) (not start!48006))
(check-sat)
