; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45418 () Bool)

(assert start!45418)

(declare-fun b!499368 () Bool)

(declare-fun res!301352 () Bool)

(declare-fun e!292631 () Bool)

(assert (=> b!499368 (=> (not res!301352) (not e!292631))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32243 0))(
  ( (array!32244 (arr!15503 (Array (_ BitVec 32) (_ BitVec 64))) (size!15867 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32243)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499368 (= res!301352 (and (= (size!15867 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15867 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15867 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!301349 () Bool)

(assert (=> start!45418 (=> (not res!301349) (not e!292631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45418 (= res!301349 (validMask!0 mask!3524))))

(assert (=> start!45418 e!292631))

(assert (=> start!45418 true))

(declare-fun array_inv!11299 (array!32243) Bool)

(assert (=> start!45418 (array_inv!11299 a!3235)))

(declare-fun b!499369 () Bool)

(declare-fun res!301344 () Bool)

(assert (=> b!499369 (=> (not res!301344) (not e!292631))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499369 (= res!301344 (validKeyInArray!0 k!2280))))

(declare-fun b!499370 () Bool)

(declare-fun e!292636 () Bool)

(assert (=> b!499370 (= e!292636 true)))

(declare-fun lt!226401 () (_ BitVec 32))

(declare-fun lt!226406 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3970 0))(
  ( (MissingZero!3970 (index!18062 (_ BitVec 32))) (Found!3970 (index!18063 (_ BitVec 32))) (Intermediate!3970 (undefined!4782 Bool) (index!18064 (_ BitVec 32)) (x!47103 (_ BitVec 32))) (Undefined!3970) (MissingVacant!3970 (index!18065 (_ BitVec 32))) )
))
(declare-fun lt!226404 () SeekEntryResult!3970)

(declare-fun lt!226405 () array!32243)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32243 (_ BitVec 32)) SeekEntryResult!3970)

(assert (=> b!499370 (= lt!226404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226401 lt!226406 lt!226405 mask!3524))))

(declare-fun b!499371 () Bool)

(declare-datatypes ((Unit!14956 0))(
  ( (Unit!14957) )
))
(declare-fun e!292633 () Unit!14956)

(declare-fun Unit!14958 () Unit!14956)

(assert (=> b!499371 (= e!292633 Unit!14958)))

(declare-fun lt!226407 () SeekEntryResult!3970)

(declare-fun lt!226408 () Unit!14956)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32243 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14956)

(assert (=> b!499371 (= lt!226408 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226401 #b00000000000000000000000000000000 (index!18064 lt!226407) (x!47103 lt!226407) mask!3524))))

(declare-fun res!301346 () Bool)

(assert (=> b!499371 (= res!301346 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226401 lt!226406 lt!226405 mask!3524) (Intermediate!3970 false (index!18064 lt!226407) (x!47103 lt!226407))))))

(declare-fun e!292634 () Bool)

(assert (=> b!499371 (=> (not res!301346) (not e!292634))))

(assert (=> b!499371 e!292634))

(declare-fun b!499372 () Bool)

(declare-fun res!301342 () Bool)

(declare-fun e!292637 () Bool)

(assert (=> b!499372 (=> (not res!301342) (not e!292637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32243 (_ BitVec 32)) Bool)

(assert (=> b!499372 (= res!301342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499373 () Bool)

(assert (=> b!499373 (= e!292631 e!292637)))

(declare-fun res!301341 () Bool)

(assert (=> b!499373 (=> (not res!301341) (not e!292637))))

(declare-fun lt!226400 () SeekEntryResult!3970)

(assert (=> b!499373 (= res!301341 (or (= lt!226400 (MissingZero!3970 i!1204)) (= lt!226400 (MissingVacant!3970 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32243 (_ BitVec 32)) SeekEntryResult!3970)

(assert (=> b!499373 (= lt!226400 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!292638 () Bool)

(declare-fun b!499374 () Bool)

(assert (=> b!499374 (= e!292638 (= (seekEntryOrOpen!0 (select (arr!15503 a!3235) j!176) a!3235 mask!3524) (Found!3970 j!176)))))

(declare-fun b!499375 () Bool)

(declare-fun e!292632 () Bool)

(assert (=> b!499375 (= e!292632 e!292636)))

(declare-fun res!301345 () Bool)

(assert (=> b!499375 (=> res!301345 e!292636)))

(assert (=> b!499375 (= res!301345 (or (bvsgt #b00000000000000000000000000000000 (x!47103 lt!226407)) (bvsgt (x!47103 lt!226407) #b01111111111111111111111111111110) (bvslt lt!226401 #b00000000000000000000000000000000) (bvsge lt!226401 (size!15867 a!3235)) (bvslt (index!18064 lt!226407) #b00000000000000000000000000000000) (bvsge (index!18064 lt!226407) (size!15867 a!3235)) (not (= lt!226407 (Intermediate!3970 false (index!18064 lt!226407) (x!47103 lt!226407))))))))

(assert (=> b!499375 (and (or (= (select (arr!15503 a!3235) (index!18064 lt!226407)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15503 a!3235) (index!18064 lt!226407)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15503 a!3235) (index!18064 lt!226407)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15503 a!3235) (index!18064 lt!226407)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226399 () Unit!14956)

(assert (=> b!499375 (= lt!226399 e!292633)))

(declare-fun c!59291 () Bool)

(assert (=> b!499375 (= c!59291 (= (select (arr!15503 a!3235) (index!18064 lt!226407)) (select (arr!15503 a!3235) j!176)))))

(assert (=> b!499375 (and (bvslt (x!47103 lt!226407) #b01111111111111111111111111111110) (or (= (select (arr!15503 a!3235) (index!18064 lt!226407)) (select (arr!15503 a!3235) j!176)) (= (select (arr!15503 a!3235) (index!18064 lt!226407)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15503 a!3235) (index!18064 lt!226407)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499376 () Bool)

(assert (=> b!499376 (= e!292637 (not e!292632))))

(declare-fun res!301347 () Bool)

(assert (=> b!499376 (=> res!301347 e!292632)))

(declare-fun lt!226403 () (_ BitVec 32))

(assert (=> b!499376 (= res!301347 (= lt!226407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226403 lt!226406 lt!226405 mask!3524)))))

(assert (=> b!499376 (= lt!226407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226401 (select (arr!15503 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499376 (= lt!226403 (toIndex!0 lt!226406 mask!3524))))

(assert (=> b!499376 (= lt!226406 (select (store (arr!15503 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499376 (= lt!226401 (toIndex!0 (select (arr!15503 a!3235) j!176) mask!3524))))

(assert (=> b!499376 (= lt!226405 (array!32244 (store (arr!15503 a!3235) i!1204 k!2280) (size!15867 a!3235)))))

(assert (=> b!499376 e!292638))

(declare-fun res!301351 () Bool)

(assert (=> b!499376 (=> (not res!301351) (not e!292638))))

(assert (=> b!499376 (= res!301351 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226402 () Unit!14956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14956)

(assert (=> b!499376 (= lt!226402 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499377 () Bool)

(declare-fun Unit!14959 () Unit!14956)

(assert (=> b!499377 (= e!292633 Unit!14959)))

(declare-fun b!499378 () Bool)

(declare-fun res!301343 () Bool)

(assert (=> b!499378 (=> res!301343 e!292632)))

(assert (=> b!499378 (= res!301343 (or (undefined!4782 lt!226407) (not (is-Intermediate!3970 lt!226407))))))

(declare-fun b!499379 () Bool)

(declare-fun res!301350 () Bool)

(assert (=> b!499379 (=> (not res!301350) (not e!292637))))

(declare-datatypes ((List!9661 0))(
  ( (Nil!9658) (Cons!9657 (h!10531 (_ BitVec 64)) (t!15889 List!9661)) )
))
(declare-fun arrayNoDuplicates!0 (array!32243 (_ BitVec 32) List!9661) Bool)

(assert (=> b!499379 (= res!301350 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9658))))

(declare-fun b!499380 () Bool)

(declare-fun res!301340 () Bool)

(assert (=> b!499380 (=> (not res!301340) (not e!292631))))

(declare-fun arrayContainsKey!0 (array!32243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499380 (= res!301340 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499381 () Bool)

(declare-fun res!301348 () Bool)

(assert (=> b!499381 (=> (not res!301348) (not e!292631))))

(assert (=> b!499381 (= res!301348 (validKeyInArray!0 (select (arr!15503 a!3235) j!176)))))

(declare-fun b!499382 () Bool)

(assert (=> b!499382 (= e!292634 false)))

(assert (= (and start!45418 res!301349) b!499368))

(assert (= (and b!499368 res!301352) b!499381))

(assert (= (and b!499381 res!301348) b!499369))

(assert (= (and b!499369 res!301344) b!499380))

(assert (= (and b!499380 res!301340) b!499373))

(assert (= (and b!499373 res!301341) b!499372))

(assert (= (and b!499372 res!301342) b!499379))

(assert (= (and b!499379 res!301350) b!499376))

(assert (= (and b!499376 res!301351) b!499374))

(assert (= (and b!499376 (not res!301347)) b!499378))

(assert (= (and b!499378 (not res!301343)) b!499375))

(assert (= (and b!499375 c!59291) b!499371))

(assert (= (and b!499375 (not c!59291)) b!499377))

(assert (= (and b!499371 res!301346) b!499382))

(assert (= (and b!499375 (not res!301345)) b!499370))

(declare-fun m!480573 () Bool)

(assert (=> b!499370 m!480573))

(declare-fun m!480575 () Bool)

(assert (=> b!499380 m!480575))

(declare-fun m!480577 () Bool)

(assert (=> b!499381 m!480577))

(assert (=> b!499381 m!480577))

(declare-fun m!480579 () Bool)

(assert (=> b!499381 m!480579))

(declare-fun m!480581 () Bool)

(assert (=> b!499379 m!480581))

(declare-fun m!480583 () Bool)

(assert (=> b!499375 m!480583))

(assert (=> b!499375 m!480577))

(declare-fun m!480585 () Bool)

(assert (=> start!45418 m!480585))

(declare-fun m!480587 () Bool)

(assert (=> start!45418 m!480587))

(declare-fun m!480589 () Bool)

(assert (=> b!499372 m!480589))

(declare-fun m!480591 () Bool)

(assert (=> b!499369 m!480591))

(declare-fun m!480593 () Bool)

(assert (=> b!499371 m!480593))

(assert (=> b!499371 m!480573))

(declare-fun m!480595 () Bool)

(assert (=> b!499376 m!480595))

(declare-fun m!480597 () Bool)

(assert (=> b!499376 m!480597))

(declare-fun m!480599 () Bool)

(assert (=> b!499376 m!480599))

(assert (=> b!499376 m!480577))

(declare-fun m!480601 () Bool)

(assert (=> b!499376 m!480601))

(assert (=> b!499376 m!480577))

(declare-fun m!480603 () Bool)

(assert (=> b!499376 m!480603))

(assert (=> b!499376 m!480577))

(declare-fun m!480605 () Bool)

(assert (=> b!499376 m!480605))

(declare-fun m!480607 () Bool)

(assert (=> b!499376 m!480607))

(declare-fun m!480609 () Bool)

(assert (=> b!499376 m!480609))

(declare-fun m!480611 () Bool)

(assert (=> b!499373 m!480611))

(assert (=> b!499374 m!480577))

(assert (=> b!499374 m!480577))

(declare-fun m!480613 () Bool)

(assert (=> b!499374 m!480613))

(push 1)

