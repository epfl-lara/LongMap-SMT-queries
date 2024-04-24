; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48098 () Bool)

(assert start!48098)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33535 0))(
  ( (array!33536 (arr!16114 (Array (_ BitVec 32) (_ BitVec 64))) (size!16478 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33535)

(declare-fun e!308645 () Bool)

(declare-fun b!529680 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4537 0))(
  ( (MissingZero!4537 (index!20372 (_ BitVec 32))) (Found!4537 (index!20373 (_ BitVec 32))) (Intermediate!4537 (undefined!5349 Bool) (index!20374 (_ BitVec 32)) (x!49492 (_ BitVec 32))) (Undefined!4537) (MissingVacant!4537 (index!20375 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33535 (_ BitVec 32)) SeekEntryResult!4537)

(assert (=> b!529680 (= e!308645 (= (seekEntryOrOpen!0 (select (arr!16114 a!3235) j!176) a!3235 mask!3524) (Found!4537 j!176)))))

(declare-fun res!325449 () Bool)

(declare-fun e!308641 () Bool)

(assert (=> start!48098 (=> (not res!325449) (not e!308641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48098 (= res!325449 (validMask!0 mask!3524))))

(assert (=> start!48098 e!308641))

(assert (=> start!48098 true))

(declare-fun array_inv!11973 (array!33535) Bool)

(assert (=> start!48098 (array_inv!11973 a!3235)))

(declare-fun b!529681 () Bool)

(declare-fun res!325450 () Bool)

(declare-fun e!308646 () Bool)

(assert (=> b!529681 (=> (not res!325450) (not e!308646))))

(declare-datatypes ((List!10179 0))(
  ( (Nil!10176) (Cons!10175 (h!11115 (_ BitVec 64)) (t!16399 List!10179)) )
))
(declare-fun arrayNoDuplicates!0 (array!33535 (_ BitVec 32) List!10179) Bool)

(assert (=> b!529681 (= res!325450 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10176))))

(declare-fun b!529682 () Bool)

(assert (=> b!529682 (= e!308641 e!308646)))

(declare-fun res!325448 () Bool)

(assert (=> b!529682 (=> (not res!325448) (not e!308646))))

(declare-fun lt!244243 () SeekEntryResult!4537)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529682 (= res!325448 (or (= lt!244243 (MissingZero!4537 i!1204)) (= lt!244243 (MissingVacant!4537 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!529682 (= lt!244243 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529683 () Bool)

(declare-fun res!325445 () Bool)

(assert (=> b!529683 (=> (not res!325445) (not e!308641))))

(assert (=> b!529683 (= res!325445 (and (= (size!16478 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16478 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16478 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529684 () Bool)

(declare-fun res!325441 () Bool)

(assert (=> b!529684 (=> (not res!325441) (not e!308641))))

(declare-fun arrayContainsKey!0 (array!33535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529684 (= res!325441 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529685 () Bool)

(declare-fun e!308642 () Bool)

(assert (=> b!529685 (= e!308646 (not e!308642))))

(declare-fun res!325442 () Bool)

(assert (=> b!529685 (=> res!325442 e!308642)))

(declare-fun lt!244245 () (_ BitVec 32))

(declare-fun lt!244241 () SeekEntryResult!4537)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33535 (_ BitVec 32)) SeekEntryResult!4537)

(assert (=> b!529685 (= res!325442 (= lt!244241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244245 (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) (array!33536 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235)) mask!3524)))))

(declare-fun lt!244244 () (_ BitVec 32))

(assert (=> b!529685 (= lt!244241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244244 (select (arr!16114 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529685 (= lt!244245 (toIndex!0 (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!529685 (= lt!244244 (toIndex!0 (select (arr!16114 a!3235) j!176) mask!3524))))

(assert (=> b!529685 e!308645))

(declare-fun res!325440 () Bool)

(assert (=> b!529685 (=> (not res!325440) (not e!308645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33535 (_ BitVec 32)) Bool)

(assert (=> b!529685 (= res!325440 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16747 0))(
  ( (Unit!16748) )
))
(declare-fun lt!244242 () Unit!16747)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16747)

(assert (=> b!529685 (= lt!244242 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529686 () Bool)

(declare-fun e!308644 () Bool)

(assert (=> b!529686 (= e!308644 true)))

(assert (=> b!529686 false))

(declare-fun b!529687 () Bool)

(declare-fun res!325444 () Bool)

(assert (=> b!529687 (=> (not res!325444) (not e!308646))))

(assert (=> b!529687 (= res!325444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529688 () Bool)

(declare-fun res!325443 () Bool)

(assert (=> b!529688 (=> (not res!325443) (not e!308641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529688 (= res!325443 (validKeyInArray!0 (select (arr!16114 a!3235) j!176)))))

(declare-fun b!529689 () Bool)

(declare-fun res!325446 () Bool)

(assert (=> b!529689 (=> (not res!325446) (not e!308641))))

(assert (=> b!529689 (= res!325446 (validKeyInArray!0 k0!2280))))

(declare-fun b!529690 () Bool)

(assert (=> b!529690 (= e!308642 e!308644)))

(declare-fun res!325447 () Bool)

(assert (=> b!529690 (=> res!325447 e!308644)))

(declare-fun lt!244246 () Bool)

(assert (=> b!529690 (= res!325447 (or (and (not lt!244246) (undefined!5349 lt!244241)) (and (not lt!244246) (not (undefined!5349 lt!244241)))))))

(get-info :version)

(assert (=> b!529690 (= lt!244246 (not ((_ is Intermediate!4537) lt!244241)))))

(assert (= (and start!48098 res!325449) b!529683))

(assert (= (and b!529683 res!325445) b!529688))

(assert (= (and b!529688 res!325443) b!529689))

(assert (= (and b!529689 res!325446) b!529684))

(assert (= (and b!529684 res!325441) b!529682))

(assert (= (and b!529682 res!325448) b!529687))

(assert (= (and b!529687 res!325444) b!529681))

(assert (= (and b!529681 res!325450) b!529685))

(assert (= (and b!529685 res!325440) b!529680))

(assert (= (and b!529685 (not res!325442)) b!529690))

(assert (= (and b!529690 (not res!325447)) b!529686))

(declare-fun m!510409 () Bool)

(assert (=> b!529689 m!510409))

(declare-fun m!510411 () Bool)

(assert (=> b!529682 m!510411))

(declare-fun m!510413 () Bool)

(assert (=> b!529680 m!510413))

(assert (=> b!529680 m!510413))

(declare-fun m!510415 () Bool)

(assert (=> b!529680 m!510415))

(declare-fun m!510417 () Bool)

(assert (=> start!48098 m!510417))

(declare-fun m!510419 () Bool)

(assert (=> start!48098 m!510419))

(assert (=> b!529688 m!510413))

(assert (=> b!529688 m!510413))

(declare-fun m!510421 () Bool)

(assert (=> b!529688 m!510421))

(assert (=> b!529685 m!510413))

(declare-fun m!510423 () Bool)

(assert (=> b!529685 m!510423))

(declare-fun m!510425 () Bool)

(assert (=> b!529685 m!510425))

(declare-fun m!510427 () Bool)

(assert (=> b!529685 m!510427))

(declare-fun m!510429 () Bool)

(assert (=> b!529685 m!510429))

(assert (=> b!529685 m!510429))

(declare-fun m!510431 () Bool)

(assert (=> b!529685 m!510431))

(assert (=> b!529685 m!510413))

(declare-fun m!510433 () Bool)

(assert (=> b!529685 m!510433))

(assert (=> b!529685 m!510413))

(declare-fun m!510435 () Bool)

(assert (=> b!529685 m!510435))

(assert (=> b!529685 m!510429))

(declare-fun m!510437 () Bool)

(assert (=> b!529685 m!510437))

(declare-fun m!510439 () Bool)

(assert (=> b!529687 m!510439))

(declare-fun m!510441 () Bool)

(assert (=> b!529681 m!510441))

(declare-fun m!510443 () Bool)

(assert (=> b!529684 m!510443))

(check-sat (not b!529681) (not b!529689) (not b!529682) (not b!529680) (not b!529684) (not b!529685) (not b!529688) (not b!529687) (not start!48098))
(check-sat)
