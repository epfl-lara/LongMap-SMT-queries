; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48114 () Bool)

(assert start!48114)

(declare-fun b!529840 () Bool)

(declare-fun e!308736 () Bool)

(assert (=> b!529840 (= e!308736 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33550 0))(
  ( (array!33551 (arr!16122 (Array (_ BitVec 32) (_ BitVec 64))) (size!16486 (_ BitVec 32))) )
))
(declare-fun lt!244295 () array!33550)

(declare-datatypes ((SeekEntryResult!4589 0))(
  ( (MissingZero!4589 (index!20580 (_ BitVec 32))) (Found!4589 (index!20581 (_ BitVec 32))) (Intermediate!4589 (undefined!5401 Bool) (index!20582 (_ BitVec 32)) (x!49555 (_ BitVec 32))) (Undefined!4589) (MissingVacant!4589 (index!20583 (_ BitVec 32))) )
))
(declare-fun lt!244290 () SeekEntryResult!4589)

(declare-fun lt!244296 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33550 (_ BitVec 32)) SeekEntryResult!4589)

(assert (=> b!529840 (= lt!244290 (seekEntryOrOpen!0 lt!244296 lt!244295 mask!3524))))

(assert (=> b!529840 false))

(declare-fun b!529841 () Bool)

(declare-fun res!325546 () Bool)

(declare-fun e!308734 () Bool)

(assert (=> b!529841 (=> (not res!325546) (not e!308734))))

(declare-fun a!3235 () array!33550)

(declare-datatypes ((List!10280 0))(
  ( (Nil!10277) (Cons!10276 (h!11216 (_ BitVec 64)) (t!16508 List!10280)) )
))
(declare-fun arrayNoDuplicates!0 (array!33550 (_ BitVec 32) List!10280) Bool)

(assert (=> b!529841 (= res!325546 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10277))))

(declare-fun b!529842 () Bool)

(declare-fun res!325550 () Bool)

(declare-fun e!308738 () Bool)

(assert (=> b!529842 (=> (not res!325550) (not e!308738))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529842 (= res!325550 (validKeyInArray!0 k!2280))))

(declare-fun b!529843 () Bool)

(declare-fun res!325547 () Bool)

(assert (=> b!529843 (=> (not res!325547) (not e!308738))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529843 (= res!325547 (and (= (size!16486 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16486 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16486 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!308737 () Bool)

(declare-fun b!529844 () Bool)

(assert (=> b!529844 (= e!308737 (= (seekEntryOrOpen!0 (select (arr!16122 a!3235) j!176) a!3235 mask!3524) (Found!4589 j!176)))))

(declare-fun b!529845 () Bool)

(declare-fun res!325554 () Bool)

(assert (=> b!529845 (=> (not res!325554) (not e!308738))))

(assert (=> b!529845 (= res!325554 (validKeyInArray!0 (select (arr!16122 a!3235) j!176)))))

(declare-fun res!325553 () Bool)

(assert (=> start!48114 (=> (not res!325553) (not e!308738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48114 (= res!325553 (validMask!0 mask!3524))))

(assert (=> start!48114 e!308738))

(assert (=> start!48114 true))

(declare-fun array_inv!11918 (array!33550) Bool)

(assert (=> start!48114 (array_inv!11918 a!3235)))

(declare-fun b!529846 () Bool)

(declare-fun e!308735 () Bool)

(assert (=> b!529846 (= e!308735 e!308736)))

(declare-fun res!325548 () Bool)

(assert (=> b!529846 (=> res!325548 e!308736)))

(declare-fun lt!244291 () Bool)

(declare-fun lt!244294 () SeekEntryResult!4589)

(assert (=> b!529846 (= res!325548 (or (and (not lt!244291) (undefined!5401 lt!244294)) (and (not lt!244291) (not (undefined!5401 lt!244294)))))))

(assert (=> b!529846 (= lt!244291 (not (is-Intermediate!4589 lt!244294)))))

(declare-fun b!529847 () Bool)

(declare-fun res!325552 () Bool)

(assert (=> b!529847 (=> (not res!325552) (not e!308734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33550 (_ BitVec 32)) Bool)

(assert (=> b!529847 (= res!325552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529848 () Bool)

(assert (=> b!529848 (= e!308734 (not e!308735))))

(declare-fun res!325555 () Bool)

(assert (=> b!529848 (=> res!325555 e!308735)))

(declare-fun lt!244293 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33550 (_ BitVec 32)) SeekEntryResult!4589)

(assert (=> b!529848 (= res!325555 (= lt!244294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244293 lt!244296 lt!244295 mask!3524)))))

(declare-fun lt!244297 () (_ BitVec 32))

(assert (=> b!529848 (= lt!244294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244297 (select (arr!16122 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529848 (= lt!244293 (toIndex!0 lt!244296 mask!3524))))

(assert (=> b!529848 (= lt!244296 (select (store (arr!16122 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!529848 (= lt!244297 (toIndex!0 (select (arr!16122 a!3235) j!176) mask!3524))))

(assert (=> b!529848 (= lt!244295 (array!33551 (store (arr!16122 a!3235) i!1204 k!2280) (size!16486 a!3235)))))

(assert (=> b!529848 e!308737))

(declare-fun res!325549 () Bool)

(assert (=> b!529848 (=> (not res!325549) (not e!308737))))

(assert (=> b!529848 (= res!325549 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16790 0))(
  ( (Unit!16791) )
))
(declare-fun lt!244289 () Unit!16790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16790)

(assert (=> b!529848 (= lt!244289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529849 () Bool)

(assert (=> b!529849 (= e!308738 e!308734)))

(declare-fun res!325556 () Bool)

(assert (=> b!529849 (=> (not res!325556) (not e!308734))))

(declare-fun lt!244292 () SeekEntryResult!4589)

(assert (=> b!529849 (= res!325556 (or (= lt!244292 (MissingZero!4589 i!1204)) (= lt!244292 (MissingVacant!4589 i!1204))))))

(assert (=> b!529849 (= lt!244292 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529850 () Bool)

(declare-fun res!325551 () Bool)

(assert (=> b!529850 (=> (not res!325551) (not e!308738))))

(declare-fun arrayContainsKey!0 (array!33550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529850 (= res!325551 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!48114 res!325553) b!529843))

(assert (= (and b!529843 res!325547) b!529845))

(assert (= (and b!529845 res!325554) b!529842))

(assert (= (and b!529842 res!325550) b!529850))

(assert (= (and b!529850 res!325551) b!529849))

(assert (= (and b!529849 res!325556) b!529847))

(assert (= (and b!529847 res!325552) b!529841))

(assert (= (and b!529841 res!325546) b!529848))

(assert (= (and b!529848 res!325549) b!529844))

(assert (= (and b!529848 (not res!325555)) b!529846))

(assert (= (and b!529846 (not res!325548)) b!529840))

(declare-fun m!510333 () Bool)

(assert (=> b!529849 m!510333))

(declare-fun m!510335 () Bool)

(assert (=> b!529844 m!510335))

(assert (=> b!529844 m!510335))

(declare-fun m!510337 () Bool)

(assert (=> b!529844 m!510337))

(declare-fun m!510339 () Bool)

(assert (=> b!529841 m!510339))

(assert (=> b!529845 m!510335))

(assert (=> b!529845 m!510335))

(declare-fun m!510341 () Bool)

(assert (=> b!529845 m!510341))

(declare-fun m!510343 () Bool)

(assert (=> b!529850 m!510343))

(declare-fun m!510345 () Bool)

(assert (=> b!529847 m!510345))

(declare-fun m!510347 () Bool)

(assert (=> start!48114 m!510347))

(declare-fun m!510349 () Bool)

(assert (=> start!48114 m!510349))

(declare-fun m!510351 () Bool)

(assert (=> b!529840 m!510351))

(declare-fun m!510353 () Bool)

(assert (=> b!529848 m!510353))

(declare-fun m!510355 () Bool)

(assert (=> b!529848 m!510355))

(declare-fun m!510357 () Bool)

(assert (=> b!529848 m!510357))

(assert (=> b!529848 m!510335))

(declare-fun m!510359 () Bool)

(assert (=> b!529848 m!510359))

(assert (=> b!529848 m!510335))

(declare-fun m!510361 () Bool)

(assert (=> b!529848 m!510361))

(declare-fun m!510363 () Bool)

(assert (=> b!529848 m!510363))

(declare-fun m!510365 () Bool)

(assert (=> b!529848 m!510365))

(declare-fun m!510367 () Bool)

(assert (=> b!529848 m!510367))

(assert (=> b!529848 m!510335))

(declare-fun m!510369 () Bool)

(assert (=> b!529842 m!510369))

(push 1)

