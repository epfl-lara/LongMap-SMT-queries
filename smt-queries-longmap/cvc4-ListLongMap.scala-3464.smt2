; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48118 () Bool)

(assert start!48118)

(declare-fun b!529906 () Bool)

(declare-fun res!325614 () Bool)

(declare-fun e!308770 () Bool)

(assert (=> b!529906 (=> (not res!325614) (not e!308770))))

(declare-datatypes ((array!33554 0))(
  ( (array!33555 (arr!16124 (Array (_ BitVec 32) (_ BitVec 64))) (size!16488 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33554)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33554 (_ BitVec 32)) Bool)

(assert (=> b!529906 (= res!325614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529907 () Bool)

(declare-fun res!325617 () Bool)

(declare-fun e!308772 () Bool)

(assert (=> b!529907 (=> (not res!325617) (not e!308772))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529907 (= res!325617 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529909 () Bool)

(declare-fun res!325618 () Bool)

(assert (=> b!529909 (=> (not res!325618) (not e!308772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529909 (= res!325618 (validKeyInArray!0 k!2280))))

(declare-fun b!529910 () Bool)

(declare-fun res!325613 () Bool)

(assert (=> b!529910 (=> (not res!325613) (not e!308772))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529910 (= res!325613 (and (= (size!16488 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16488 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16488 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529911 () Bool)

(assert (=> b!529911 (= e!308772 e!308770)))

(declare-fun res!325622 () Bool)

(assert (=> b!529911 (=> (not res!325622) (not e!308770))))

(declare-datatypes ((SeekEntryResult!4591 0))(
  ( (MissingZero!4591 (index!20588 (_ BitVec 32))) (Found!4591 (index!20589 (_ BitVec 32))) (Intermediate!4591 (undefined!5403 Bool) (index!20590 (_ BitVec 32)) (x!49557 (_ BitVec 32))) (Undefined!4591) (MissingVacant!4591 (index!20591 (_ BitVec 32))) )
))
(declare-fun lt!244347 () SeekEntryResult!4591)

(assert (=> b!529911 (= res!325622 (or (= lt!244347 (MissingZero!4591 i!1204)) (= lt!244347 (MissingVacant!4591 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33554 (_ BitVec 32)) SeekEntryResult!4591)

(assert (=> b!529911 (= lt!244347 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!308774 () Bool)

(declare-fun b!529912 () Bool)

(assert (=> b!529912 (= e!308774 (= (seekEntryOrOpen!0 (select (arr!16124 a!3235) j!176) a!3235 mask!3524) (Found!4591 j!176)))))

(declare-fun b!529908 () Bool)

(declare-fun e!308773 () Bool)

(declare-fun e!308775 () Bool)

(assert (=> b!529908 (= e!308773 e!308775)))

(declare-fun res!325615 () Bool)

(assert (=> b!529908 (=> res!325615 e!308775)))

(declare-fun lt!244346 () Bool)

(declare-fun lt!244345 () SeekEntryResult!4591)

(assert (=> b!529908 (= res!325615 (or (and (not lt!244346) (undefined!5403 lt!244345)) (and (not lt!244346) (not (undefined!5403 lt!244345)))))))

(assert (=> b!529908 (= lt!244346 (not (is-Intermediate!4591 lt!244345)))))

(declare-fun res!325619 () Bool)

(assert (=> start!48118 (=> (not res!325619) (not e!308772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48118 (= res!325619 (validMask!0 mask!3524))))

(assert (=> start!48118 e!308772))

(assert (=> start!48118 true))

(declare-fun array_inv!11920 (array!33554) Bool)

(assert (=> start!48118 (array_inv!11920 a!3235)))

(declare-fun b!529913 () Bool)

(assert (=> b!529913 (= e!308770 (not e!308773))))

(declare-fun res!325612 () Bool)

(assert (=> b!529913 (=> res!325612 e!308773)))

(declare-fun lt!244343 () (_ BitVec 32))

(declare-fun lt!244350 () array!33554)

(declare-fun lt!244351 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33554 (_ BitVec 32)) SeekEntryResult!4591)

(assert (=> b!529913 (= res!325612 (= lt!244345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244343 lt!244351 lt!244350 mask!3524)))))

(declare-fun lt!244344 () (_ BitVec 32))

(assert (=> b!529913 (= lt!244345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244344 (select (arr!16124 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529913 (= lt!244343 (toIndex!0 lt!244351 mask!3524))))

(assert (=> b!529913 (= lt!244351 (select (store (arr!16124 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!529913 (= lt!244344 (toIndex!0 (select (arr!16124 a!3235) j!176) mask!3524))))

(assert (=> b!529913 (= lt!244350 (array!33555 (store (arr!16124 a!3235) i!1204 k!2280) (size!16488 a!3235)))))

(assert (=> b!529913 e!308774))

(declare-fun res!325616 () Bool)

(assert (=> b!529913 (=> (not res!325616) (not e!308774))))

(assert (=> b!529913 (= res!325616 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16794 0))(
  ( (Unit!16795) )
))
(declare-fun lt!244349 () Unit!16794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16794)

(assert (=> b!529913 (= lt!244349 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529914 () Bool)

(assert (=> b!529914 (= e!308775 true)))

(declare-fun lt!244348 () SeekEntryResult!4591)

(assert (=> b!529914 (= lt!244348 (seekEntryOrOpen!0 lt!244351 lt!244350 mask!3524))))

(assert (=> b!529914 false))

(declare-fun b!529915 () Bool)

(declare-fun res!325621 () Bool)

(assert (=> b!529915 (=> (not res!325621) (not e!308772))))

(assert (=> b!529915 (= res!325621 (validKeyInArray!0 (select (arr!16124 a!3235) j!176)))))

(declare-fun b!529916 () Bool)

(declare-fun res!325620 () Bool)

(assert (=> b!529916 (=> (not res!325620) (not e!308770))))

(declare-datatypes ((List!10282 0))(
  ( (Nil!10279) (Cons!10278 (h!11218 (_ BitVec 64)) (t!16510 List!10282)) )
))
(declare-fun arrayNoDuplicates!0 (array!33554 (_ BitVec 32) List!10282) Bool)

(assert (=> b!529916 (= res!325620 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10279))))

(assert (= (and start!48118 res!325619) b!529910))

(assert (= (and b!529910 res!325613) b!529915))

(assert (= (and b!529915 res!325621) b!529909))

(assert (= (and b!529909 res!325618) b!529907))

(assert (= (and b!529907 res!325617) b!529911))

(assert (= (and b!529911 res!325622) b!529906))

(assert (= (and b!529906 res!325614) b!529916))

(assert (= (and b!529916 res!325620) b!529913))

(assert (= (and b!529913 res!325616) b!529912))

(assert (= (and b!529913 (not res!325612)) b!529908))

(assert (= (and b!529908 (not res!325615)) b!529914))

(declare-fun m!510409 () Bool)

(assert (=> b!529911 m!510409))

(declare-fun m!510411 () Bool)

(assert (=> b!529916 m!510411))

(declare-fun m!510413 () Bool)

(assert (=> b!529907 m!510413))

(declare-fun m!510415 () Bool)

(assert (=> start!48118 m!510415))

(declare-fun m!510417 () Bool)

(assert (=> start!48118 m!510417))

(declare-fun m!510419 () Bool)

(assert (=> b!529913 m!510419))

(declare-fun m!510421 () Bool)

(assert (=> b!529913 m!510421))

(declare-fun m!510423 () Bool)

(assert (=> b!529913 m!510423))

(declare-fun m!510425 () Bool)

(assert (=> b!529913 m!510425))

(declare-fun m!510427 () Bool)

(assert (=> b!529913 m!510427))

(declare-fun m!510429 () Bool)

(assert (=> b!529913 m!510429))

(assert (=> b!529913 m!510427))

(declare-fun m!510431 () Bool)

(assert (=> b!529913 m!510431))

(assert (=> b!529913 m!510427))

(declare-fun m!510433 () Bool)

(assert (=> b!529913 m!510433))

(declare-fun m!510435 () Bool)

(assert (=> b!529913 m!510435))

(assert (=> b!529912 m!510427))

(assert (=> b!529912 m!510427))

(declare-fun m!510437 () Bool)

(assert (=> b!529912 m!510437))

(assert (=> b!529915 m!510427))

(assert (=> b!529915 m!510427))

(declare-fun m!510439 () Bool)

(assert (=> b!529915 m!510439))

(declare-fun m!510441 () Bool)

(assert (=> b!529914 m!510441))

(declare-fun m!510443 () Bool)

(assert (=> b!529909 m!510443))

(declare-fun m!510445 () Bool)

(assert (=> b!529906 m!510445))

(push 1)

