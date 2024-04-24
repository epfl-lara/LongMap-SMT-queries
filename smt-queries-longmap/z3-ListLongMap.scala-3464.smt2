; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48104 () Bool)

(assert start!48104)

(declare-fun b!529779 () Bool)

(declare-fun res!325548 () Bool)

(declare-fun e!308696 () Bool)

(assert (=> b!529779 (=> (not res!325548) (not e!308696))))

(declare-datatypes ((array!33541 0))(
  ( (array!33542 (arr!16117 (Array (_ BitVec 32) (_ BitVec 64))) (size!16481 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33541)

(declare-datatypes ((List!10182 0))(
  ( (Nil!10179) (Cons!10178 (h!11118 (_ BitVec 64)) (t!16402 List!10182)) )
))
(declare-fun arrayNoDuplicates!0 (array!33541 (_ BitVec 32) List!10182) Bool)

(assert (=> b!529779 (= res!325548 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10179))))

(declare-fun b!529780 () Bool)

(declare-fun res!325542 () Bool)

(declare-fun e!308698 () Bool)

(assert (=> b!529780 (=> (not res!325542) (not e!308698))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529780 (= res!325542 (validKeyInArray!0 (select (arr!16117 a!3235) j!176)))))

(declare-fun b!529781 () Bool)

(declare-fun e!308699 () Bool)

(declare-fun e!308695 () Bool)

(assert (=> b!529781 (= e!308699 e!308695)))

(declare-fun res!325540 () Bool)

(assert (=> b!529781 (=> res!325540 e!308695)))

(declare-fun lt!244308 () Bool)

(declare-datatypes ((SeekEntryResult!4540 0))(
  ( (MissingZero!4540 (index!20384 (_ BitVec 32))) (Found!4540 (index!20385 (_ BitVec 32))) (Intermediate!4540 (undefined!5352 Bool) (index!20386 (_ BitVec 32)) (x!49503 (_ BitVec 32))) (Undefined!4540) (MissingVacant!4540 (index!20387 (_ BitVec 32))) )
))
(declare-fun lt!244306 () SeekEntryResult!4540)

(assert (=> b!529781 (= res!325540 (or (and (not lt!244308) (undefined!5352 lt!244306)) (and (not lt!244308) (not (undefined!5352 lt!244306)))))))

(get-info :version)

(assert (=> b!529781 (= lt!244308 (not ((_ is Intermediate!4540) lt!244306)))))

(declare-fun res!325546 () Bool)

(assert (=> start!48104 (=> (not res!325546) (not e!308698))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48104 (= res!325546 (validMask!0 mask!3524))))

(assert (=> start!48104 e!308698))

(assert (=> start!48104 true))

(declare-fun array_inv!11976 (array!33541) Bool)

(assert (=> start!48104 (array_inv!11976 a!3235)))

(declare-fun b!529782 () Bool)

(assert (=> b!529782 (= e!308696 (not e!308699))))

(declare-fun res!325543 () Bool)

(assert (=> b!529782 (=> res!325543 e!308699)))

(declare-fun lt!244305 () (_ BitVec 64))

(declare-fun lt!244307 () (_ BitVec 32))

(declare-fun lt!244302 () array!33541)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33541 (_ BitVec 32)) SeekEntryResult!4540)

(assert (=> b!529782 (= res!325543 (= lt!244306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244307 lt!244305 lt!244302 mask!3524)))))

(declare-fun lt!244301 () (_ BitVec 32))

(assert (=> b!529782 (= lt!244306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244301 (select (arr!16117 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529782 (= lt!244307 (toIndex!0 lt!244305 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529782 (= lt!244305 (select (store (arr!16117 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529782 (= lt!244301 (toIndex!0 (select (arr!16117 a!3235) j!176) mask!3524))))

(assert (=> b!529782 (= lt!244302 (array!33542 (store (arr!16117 a!3235) i!1204 k0!2280) (size!16481 a!3235)))))

(declare-fun e!308700 () Bool)

(assert (=> b!529782 e!308700))

(declare-fun res!325545 () Bool)

(assert (=> b!529782 (=> (not res!325545) (not e!308700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33541 (_ BitVec 32)) Bool)

(assert (=> b!529782 (= res!325545 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16753 0))(
  ( (Unit!16754) )
))
(declare-fun lt!244304 () Unit!16753)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16753)

(assert (=> b!529782 (= lt!244304 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529783 () Bool)

(assert (=> b!529783 (= e!308698 e!308696)))

(declare-fun res!325541 () Bool)

(assert (=> b!529783 (=> (not res!325541) (not e!308696))))

(declare-fun lt!244309 () SeekEntryResult!4540)

(assert (=> b!529783 (= res!325541 (or (= lt!244309 (MissingZero!4540 i!1204)) (= lt!244309 (MissingVacant!4540 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33541 (_ BitVec 32)) SeekEntryResult!4540)

(assert (=> b!529783 (= lt!244309 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529784 () Bool)

(assert (=> b!529784 (= e!308700 (= (seekEntryOrOpen!0 (select (arr!16117 a!3235) j!176) a!3235 mask!3524) (Found!4540 j!176)))))

(declare-fun b!529785 () Bool)

(declare-fun res!325544 () Bool)

(assert (=> b!529785 (=> (not res!325544) (not e!308698))))

(assert (=> b!529785 (= res!325544 (validKeyInArray!0 k0!2280))))

(declare-fun b!529786 () Bool)

(declare-fun res!325547 () Bool)

(assert (=> b!529786 (=> (not res!325547) (not e!308698))))

(assert (=> b!529786 (= res!325547 (and (= (size!16481 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16481 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16481 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529787 () Bool)

(declare-fun res!325539 () Bool)

(assert (=> b!529787 (=> (not res!325539) (not e!308698))))

(declare-fun arrayContainsKey!0 (array!33541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529787 (= res!325539 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529788 () Bool)

(assert (=> b!529788 (= e!308695 true)))

(declare-fun lt!244303 () SeekEntryResult!4540)

(assert (=> b!529788 (= lt!244303 (seekEntryOrOpen!0 lt!244305 lt!244302 mask!3524))))

(assert (=> b!529788 false))

(declare-fun b!529789 () Bool)

(declare-fun res!325549 () Bool)

(assert (=> b!529789 (=> (not res!325549) (not e!308696))))

(assert (=> b!529789 (= res!325549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!48104 res!325546) b!529786))

(assert (= (and b!529786 res!325547) b!529780))

(assert (= (and b!529780 res!325542) b!529785))

(assert (= (and b!529785 res!325544) b!529787))

(assert (= (and b!529787 res!325539) b!529783))

(assert (= (and b!529783 res!325541) b!529789))

(assert (= (and b!529789 res!325549) b!529779))

(assert (= (and b!529779 res!325548) b!529782))

(assert (= (and b!529782 res!325545) b!529784))

(assert (= (and b!529782 (not res!325543)) b!529781))

(assert (= (and b!529781 (not res!325540)) b!529788))

(declare-fun m!510517 () Bool)

(assert (=> b!529783 m!510517))

(declare-fun m!510519 () Bool)

(assert (=> b!529785 m!510519))

(declare-fun m!510521 () Bool)

(assert (=> b!529787 m!510521))

(declare-fun m!510523 () Bool)

(assert (=> b!529788 m!510523))

(declare-fun m!510525 () Bool)

(assert (=> b!529782 m!510525))

(declare-fun m!510527 () Bool)

(assert (=> b!529782 m!510527))

(declare-fun m!510529 () Bool)

(assert (=> b!529782 m!510529))

(declare-fun m!510531 () Bool)

(assert (=> b!529782 m!510531))

(declare-fun m!510533 () Bool)

(assert (=> b!529782 m!510533))

(assert (=> b!529782 m!510531))

(declare-fun m!510535 () Bool)

(assert (=> b!529782 m!510535))

(assert (=> b!529782 m!510531))

(declare-fun m!510537 () Bool)

(assert (=> b!529782 m!510537))

(declare-fun m!510539 () Bool)

(assert (=> b!529782 m!510539))

(declare-fun m!510541 () Bool)

(assert (=> b!529782 m!510541))

(assert (=> b!529780 m!510531))

(assert (=> b!529780 m!510531))

(declare-fun m!510543 () Bool)

(assert (=> b!529780 m!510543))

(declare-fun m!510545 () Bool)

(assert (=> b!529779 m!510545))

(declare-fun m!510547 () Bool)

(assert (=> b!529789 m!510547))

(declare-fun m!510549 () Bool)

(assert (=> start!48104 m!510549))

(declare-fun m!510551 () Bool)

(assert (=> start!48104 m!510551))

(assert (=> b!529784 m!510531))

(assert (=> b!529784 m!510531))

(declare-fun m!510553 () Bool)

(assert (=> b!529784 m!510553))

(check-sat (not b!529787) (not b!529783) (not b!529779) (not start!48104) (not b!529788) (not b!529785) (not b!529782) (not b!529784) (not b!529780) (not b!529789))
(check-sat)
