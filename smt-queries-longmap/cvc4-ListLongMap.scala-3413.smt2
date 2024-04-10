; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47404 () Bool)

(assert start!47404)

(declare-fun b!521452 () Bool)

(declare-fun res!319257 () Bool)

(declare-fun e!304223 () Bool)

(assert (=> b!521452 (=> (not res!319257) (not e!304223))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521452 (= res!319257 (validKeyInArray!0 k!2280))))

(declare-fun b!521453 () Bool)

(declare-fun e!304222 () Bool)

(declare-fun e!304224 () Bool)

(assert (=> b!521453 (= e!304222 (not e!304224))))

(declare-fun res!319253 () Bool)

(assert (=> b!521453 (=> res!319253 e!304224)))

(declare-fun lt!238970 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!238969 () (_ BitVec 64))

(declare-datatypes ((array!33230 0))(
  ( (array!33231 (arr!15971 (Array (_ BitVec 32) (_ BitVec 64))) (size!16335 (_ BitVec 32))) )
))
(declare-fun lt!238967 () array!33230)

(declare-datatypes ((SeekEntryResult!4438 0))(
  ( (MissingZero!4438 (index!19955 (_ BitVec 32))) (Found!4438 (index!19956 (_ BitVec 32))) (Intermediate!4438 (undefined!5250 Bool) (index!19957 (_ BitVec 32)) (x!48936 (_ BitVec 32))) (Undefined!4438) (MissingVacant!4438 (index!19958 (_ BitVec 32))) )
))
(declare-fun lt!238971 () SeekEntryResult!4438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33230 (_ BitVec 32)) SeekEntryResult!4438)

(assert (=> b!521453 (= res!319253 (= lt!238971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238970 lt!238969 lt!238967 mask!3524)))))

(declare-fun lt!238972 () (_ BitVec 32))

(declare-fun a!3235 () array!33230)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521453 (= lt!238971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238972 (select (arr!15971 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521453 (= lt!238970 (toIndex!0 lt!238969 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521453 (= lt!238969 (select (store (arr!15971 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521453 (= lt!238972 (toIndex!0 (select (arr!15971 a!3235) j!176) mask!3524))))

(assert (=> b!521453 (= lt!238967 (array!33231 (store (arr!15971 a!3235) i!1204 k!2280) (size!16335 a!3235)))))

(declare-fun e!304225 () Bool)

(assert (=> b!521453 e!304225))

(declare-fun res!319252 () Bool)

(assert (=> b!521453 (=> (not res!319252) (not e!304225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33230 (_ BitVec 32)) Bool)

(assert (=> b!521453 (= res!319252 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16204 0))(
  ( (Unit!16205) )
))
(declare-fun lt!238974 () Unit!16204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16204)

(assert (=> b!521453 (= lt!238974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521454 () Bool)

(declare-fun res!319251 () Bool)

(assert (=> b!521454 (=> (not res!319251) (not e!304222))))

(assert (=> b!521454 (= res!319251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521455 () Bool)

(declare-fun res!319254 () Bool)

(assert (=> b!521455 (=> (not res!319254) (not e!304222))))

(declare-datatypes ((List!10129 0))(
  ( (Nil!10126) (Cons!10125 (h!11047 (_ BitVec 64)) (t!16357 List!10129)) )
))
(declare-fun arrayNoDuplicates!0 (array!33230 (_ BitVec 32) List!10129) Bool)

(assert (=> b!521455 (= res!319254 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10126))))

(declare-fun b!521456 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33230 (_ BitVec 32)) SeekEntryResult!4438)

(assert (=> b!521456 (= e!304225 (= (seekEntryOrOpen!0 (select (arr!15971 a!3235) j!176) a!3235 mask!3524) (Found!4438 j!176)))))

(declare-fun b!521457 () Bool)

(declare-fun e!304221 () Bool)

(assert (=> b!521457 (= e!304221 false)))

(declare-fun b!521458 () Bool)

(assert (=> b!521458 (= e!304224 true)))

(assert (=> b!521458 (and (or (= (select (arr!15971 a!3235) (index!19957 lt!238971)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15971 a!3235) (index!19957 lt!238971)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15971 a!3235) (index!19957 lt!238971)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15971 a!3235) (index!19957 lt!238971)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238973 () Unit!16204)

(declare-fun e!304227 () Unit!16204)

(assert (=> b!521458 (= lt!238973 e!304227)))

(declare-fun c!61403 () Bool)

(assert (=> b!521458 (= c!61403 (= (select (arr!15971 a!3235) (index!19957 lt!238971)) (select (arr!15971 a!3235) j!176)))))

(assert (=> b!521458 (and (bvslt (x!48936 lt!238971) #b01111111111111111111111111111110) (or (= (select (arr!15971 a!3235) (index!19957 lt!238971)) (select (arr!15971 a!3235) j!176)) (= (select (arr!15971 a!3235) (index!19957 lt!238971)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15971 a!3235) (index!19957 lt!238971)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521459 () Bool)

(declare-fun res!319256 () Bool)

(assert (=> b!521459 (=> (not res!319256) (not e!304223))))

(assert (=> b!521459 (= res!319256 (and (= (size!16335 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16335 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16335 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521460 () Bool)

(declare-fun Unit!16206 () Unit!16204)

(assert (=> b!521460 (= e!304227 Unit!16206)))

(declare-fun b!521461 () Bool)

(declare-fun Unit!16207 () Unit!16204)

(assert (=> b!521461 (= e!304227 Unit!16207)))

(declare-fun lt!238975 () Unit!16204)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33230 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16204)

(assert (=> b!521461 (= lt!238975 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238972 #b00000000000000000000000000000000 (index!19957 lt!238971) (x!48936 lt!238971) mask!3524))))

(declare-fun res!319259 () Bool)

(assert (=> b!521461 (= res!319259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238972 lt!238969 lt!238967 mask!3524) (Intermediate!4438 false (index!19957 lt!238971) (x!48936 lt!238971))))))

(assert (=> b!521461 (=> (not res!319259) (not e!304221))))

(assert (=> b!521461 e!304221))

(declare-fun res!319249 () Bool)

(assert (=> start!47404 (=> (not res!319249) (not e!304223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47404 (= res!319249 (validMask!0 mask!3524))))

(assert (=> start!47404 e!304223))

(assert (=> start!47404 true))

(declare-fun array_inv!11767 (array!33230) Bool)

(assert (=> start!47404 (array_inv!11767 a!3235)))

(declare-fun b!521462 () Bool)

(declare-fun res!319250 () Bool)

(assert (=> b!521462 (=> res!319250 e!304224)))

(assert (=> b!521462 (= res!319250 (or (undefined!5250 lt!238971) (not (is-Intermediate!4438 lt!238971))))))

(declare-fun b!521463 () Bool)

(assert (=> b!521463 (= e!304223 e!304222)))

(declare-fun res!319255 () Bool)

(assert (=> b!521463 (=> (not res!319255) (not e!304222))))

(declare-fun lt!238968 () SeekEntryResult!4438)

(assert (=> b!521463 (= res!319255 (or (= lt!238968 (MissingZero!4438 i!1204)) (= lt!238968 (MissingVacant!4438 i!1204))))))

(assert (=> b!521463 (= lt!238968 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521464 () Bool)

(declare-fun res!319258 () Bool)

(assert (=> b!521464 (=> (not res!319258) (not e!304223))))

(assert (=> b!521464 (= res!319258 (validKeyInArray!0 (select (arr!15971 a!3235) j!176)))))

(declare-fun b!521465 () Bool)

(declare-fun res!319248 () Bool)

(assert (=> b!521465 (=> (not res!319248) (not e!304223))))

(declare-fun arrayContainsKey!0 (array!33230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521465 (= res!319248 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47404 res!319249) b!521459))

(assert (= (and b!521459 res!319256) b!521464))

(assert (= (and b!521464 res!319258) b!521452))

(assert (= (and b!521452 res!319257) b!521465))

(assert (= (and b!521465 res!319248) b!521463))

(assert (= (and b!521463 res!319255) b!521454))

(assert (= (and b!521454 res!319251) b!521455))

(assert (= (and b!521455 res!319254) b!521453))

(assert (= (and b!521453 res!319252) b!521456))

(assert (= (and b!521453 (not res!319253)) b!521462))

(assert (= (and b!521462 (not res!319250)) b!521458))

(assert (= (and b!521458 c!61403) b!521461))

(assert (= (and b!521458 (not c!61403)) b!521460))

(assert (= (and b!521461 res!319259) b!521457))

(declare-fun m!502365 () Bool)

(assert (=> b!521453 m!502365))

(declare-fun m!502367 () Bool)

(assert (=> b!521453 m!502367))

(declare-fun m!502369 () Bool)

(assert (=> b!521453 m!502369))

(declare-fun m!502371 () Bool)

(assert (=> b!521453 m!502371))

(declare-fun m!502373 () Bool)

(assert (=> b!521453 m!502373))

(assert (=> b!521453 m!502371))

(declare-fun m!502375 () Bool)

(assert (=> b!521453 m!502375))

(assert (=> b!521453 m!502371))

(declare-fun m!502377 () Bool)

(assert (=> b!521453 m!502377))

(declare-fun m!502379 () Bool)

(assert (=> b!521453 m!502379))

(declare-fun m!502381 () Bool)

(assert (=> b!521453 m!502381))

(declare-fun m!502383 () Bool)

(assert (=> b!521455 m!502383))

(declare-fun m!502385 () Bool)

(assert (=> b!521458 m!502385))

(assert (=> b!521458 m!502371))

(assert (=> b!521464 m!502371))

(assert (=> b!521464 m!502371))

(declare-fun m!502387 () Bool)

(assert (=> b!521464 m!502387))

(declare-fun m!502389 () Bool)

(assert (=> b!521454 m!502389))

(declare-fun m!502391 () Bool)

(assert (=> b!521465 m!502391))

(assert (=> b!521456 m!502371))

(assert (=> b!521456 m!502371))

(declare-fun m!502393 () Bool)

(assert (=> b!521456 m!502393))

(declare-fun m!502395 () Bool)

(assert (=> b!521461 m!502395))

(declare-fun m!502397 () Bool)

(assert (=> b!521461 m!502397))

(declare-fun m!502399 () Bool)

(assert (=> b!521452 m!502399))

(declare-fun m!502401 () Bool)

(assert (=> start!47404 m!502401))

(declare-fun m!502403 () Bool)

(assert (=> start!47404 m!502403))

(declare-fun m!502405 () Bool)

(assert (=> b!521463 m!502405))

(push 1)

