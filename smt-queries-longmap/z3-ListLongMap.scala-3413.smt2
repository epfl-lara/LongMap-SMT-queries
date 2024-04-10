; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47402 () Bool)

(assert start!47402)

(declare-fun b!521410 () Bool)

(declare-fun res!319219 () Bool)

(declare-fun e!304202 () Bool)

(assert (=> b!521410 (=> (not res!319219) (not e!304202))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521410 (= res!319219 (validKeyInArray!0 k0!2280))))

(declare-fun b!521411 () Bool)

(declare-fun e!304206 () Bool)

(assert (=> b!521411 (= e!304206 false)))

(declare-fun b!521412 () Bool)

(declare-fun res!319212 () Bool)

(declare-fun e!304205 () Bool)

(assert (=> b!521412 (=> res!319212 e!304205)))

(declare-datatypes ((SeekEntryResult!4437 0))(
  ( (MissingZero!4437 (index!19951 (_ BitVec 32))) (Found!4437 (index!19952 (_ BitVec 32))) (Intermediate!4437 (undefined!5249 Bool) (index!19953 (_ BitVec 32)) (x!48935 (_ BitVec 32))) (Undefined!4437) (MissingVacant!4437 (index!19954 (_ BitVec 32))) )
))
(declare-fun lt!238940 () SeekEntryResult!4437)

(get-info :version)

(assert (=> b!521412 (= res!319212 (or (undefined!5249 lt!238940) (not ((_ is Intermediate!4437) lt!238940))))))

(declare-fun b!521413 () Bool)

(declare-fun res!319213 () Bool)

(declare-fun e!304204 () Bool)

(assert (=> b!521413 (=> (not res!319213) (not e!304204))))

(declare-datatypes ((array!33228 0))(
  ( (array!33229 (arr!15970 (Array (_ BitVec 32) (_ BitVec 64))) (size!16334 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33228)

(declare-datatypes ((List!10128 0))(
  ( (Nil!10125) (Cons!10124 (h!11046 (_ BitVec 64)) (t!16356 List!10128)) )
))
(declare-fun arrayNoDuplicates!0 (array!33228 (_ BitVec 32) List!10128) Bool)

(assert (=> b!521413 (= res!319213 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10125))))

(declare-fun b!521414 () Bool)

(assert (=> b!521414 (= e!304202 e!304204)))

(declare-fun res!319218 () Bool)

(assert (=> b!521414 (=> (not res!319218) (not e!304204))))

(declare-fun lt!238945 () SeekEntryResult!4437)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521414 (= res!319218 (or (= lt!238945 (MissingZero!4437 i!1204)) (= lt!238945 (MissingVacant!4437 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33228 (_ BitVec 32)) SeekEntryResult!4437)

(assert (=> b!521414 (= lt!238945 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521415 () Bool)

(declare-fun res!319214 () Bool)

(assert (=> b!521415 (=> (not res!319214) (not e!304202))))

(declare-fun arrayContainsKey!0 (array!33228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521415 (= res!319214 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!319217 () Bool)

(assert (=> start!47402 (=> (not res!319217) (not e!304202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47402 (= res!319217 (validMask!0 mask!3524))))

(assert (=> start!47402 e!304202))

(assert (=> start!47402 true))

(declare-fun array_inv!11766 (array!33228) Bool)

(assert (=> start!47402 (array_inv!11766 a!3235)))

(declare-fun b!521416 () Bool)

(declare-fun res!319215 () Bool)

(assert (=> b!521416 (=> (not res!319215) (not e!304204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33228 (_ BitVec 32)) Bool)

(assert (=> b!521416 (= res!319215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!304203 () Bool)

(declare-fun b!521417 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521417 (= e!304203 (= (seekEntryOrOpen!0 (select (arr!15970 a!3235) j!176) a!3235 mask!3524) (Found!4437 j!176)))))

(declare-fun b!521418 () Bool)

(assert (=> b!521418 (= e!304205 true)))

(assert (=> b!521418 (and (or (= (select (arr!15970 a!3235) (index!19953 lt!238940)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15970 a!3235) (index!19953 lt!238940)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15970 a!3235) (index!19953 lt!238940)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15970 a!3235) (index!19953 lt!238940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16200 0))(
  ( (Unit!16201) )
))
(declare-fun lt!238941 () Unit!16200)

(declare-fun e!304201 () Unit!16200)

(assert (=> b!521418 (= lt!238941 e!304201)))

(declare-fun c!61400 () Bool)

(assert (=> b!521418 (= c!61400 (= (select (arr!15970 a!3235) (index!19953 lt!238940)) (select (arr!15970 a!3235) j!176)))))

(assert (=> b!521418 (and (bvslt (x!48935 lt!238940) #b01111111111111111111111111111110) (or (= (select (arr!15970 a!3235) (index!19953 lt!238940)) (select (arr!15970 a!3235) j!176)) (= (select (arr!15970 a!3235) (index!19953 lt!238940)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15970 a!3235) (index!19953 lt!238940)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521419 () Bool)

(declare-fun Unit!16202 () Unit!16200)

(assert (=> b!521419 (= e!304201 Unit!16202)))

(declare-fun lt!238943 () Unit!16200)

(declare-fun lt!238942 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33228 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16200)

(assert (=> b!521419 (= lt!238943 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238942 #b00000000000000000000000000000000 (index!19953 lt!238940) (x!48935 lt!238940) mask!3524))))

(declare-fun res!319222 () Bool)

(declare-fun lt!238946 () array!33228)

(declare-fun lt!238947 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33228 (_ BitVec 32)) SeekEntryResult!4437)

(assert (=> b!521419 (= res!319222 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238942 lt!238947 lt!238946 mask!3524) (Intermediate!4437 false (index!19953 lt!238940) (x!48935 lt!238940))))))

(assert (=> b!521419 (=> (not res!319222) (not e!304206))))

(assert (=> b!521419 e!304206))

(declare-fun b!521420 () Bool)

(declare-fun Unit!16203 () Unit!16200)

(assert (=> b!521420 (= e!304201 Unit!16203)))

(declare-fun b!521421 () Bool)

(declare-fun res!319221 () Bool)

(assert (=> b!521421 (=> (not res!319221) (not e!304202))))

(assert (=> b!521421 (= res!319221 (validKeyInArray!0 (select (arr!15970 a!3235) j!176)))))

(declare-fun b!521422 () Bool)

(declare-fun res!319223 () Bool)

(assert (=> b!521422 (=> (not res!319223) (not e!304202))))

(assert (=> b!521422 (= res!319223 (and (= (size!16334 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16334 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16334 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521423 () Bool)

(assert (=> b!521423 (= e!304204 (not e!304205))))

(declare-fun res!319220 () Bool)

(assert (=> b!521423 (=> res!319220 e!304205)))

(declare-fun lt!238944 () (_ BitVec 32))

(assert (=> b!521423 (= res!319220 (= lt!238940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238944 lt!238947 lt!238946 mask!3524)))))

(assert (=> b!521423 (= lt!238940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238942 (select (arr!15970 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521423 (= lt!238944 (toIndex!0 lt!238947 mask!3524))))

(assert (=> b!521423 (= lt!238947 (select (store (arr!15970 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521423 (= lt!238942 (toIndex!0 (select (arr!15970 a!3235) j!176) mask!3524))))

(assert (=> b!521423 (= lt!238946 (array!33229 (store (arr!15970 a!3235) i!1204 k0!2280) (size!16334 a!3235)))))

(assert (=> b!521423 e!304203))

(declare-fun res!319216 () Bool)

(assert (=> b!521423 (=> (not res!319216) (not e!304203))))

(assert (=> b!521423 (= res!319216 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238948 () Unit!16200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16200)

(assert (=> b!521423 (= lt!238948 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47402 res!319217) b!521422))

(assert (= (and b!521422 res!319223) b!521421))

(assert (= (and b!521421 res!319221) b!521410))

(assert (= (and b!521410 res!319219) b!521415))

(assert (= (and b!521415 res!319214) b!521414))

(assert (= (and b!521414 res!319218) b!521416))

(assert (= (and b!521416 res!319215) b!521413))

(assert (= (and b!521413 res!319213) b!521423))

(assert (= (and b!521423 res!319216) b!521417))

(assert (= (and b!521423 (not res!319220)) b!521412))

(assert (= (and b!521412 (not res!319212)) b!521418))

(assert (= (and b!521418 c!61400) b!521419))

(assert (= (and b!521418 (not c!61400)) b!521420))

(assert (= (and b!521419 res!319222) b!521411))

(declare-fun m!502323 () Bool)

(assert (=> b!521416 m!502323))

(declare-fun m!502325 () Bool)

(assert (=> b!521423 m!502325))

(declare-fun m!502327 () Bool)

(assert (=> b!521423 m!502327))

(declare-fun m!502329 () Bool)

(assert (=> b!521423 m!502329))

(declare-fun m!502331 () Bool)

(assert (=> b!521423 m!502331))

(declare-fun m!502333 () Bool)

(assert (=> b!521423 m!502333))

(assert (=> b!521423 m!502327))

(declare-fun m!502335 () Bool)

(assert (=> b!521423 m!502335))

(assert (=> b!521423 m!502327))

(declare-fun m!502337 () Bool)

(assert (=> b!521423 m!502337))

(declare-fun m!502339 () Bool)

(assert (=> b!521423 m!502339))

(declare-fun m!502341 () Bool)

(assert (=> b!521423 m!502341))

(declare-fun m!502343 () Bool)

(assert (=> b!521415 m!502343))

(assert (=> b!521421 m!502327))

(assert (=> b!521421 m!502327))

(declare-fun m!502345 () Bool)

(assert (=> b!521421 m!502345))

(assert (=> b!521417 m!502327))

(assert (=> b!521417 m!502327))

(declare-fun m!502347 () Bool)

(assert (=> b!521417 m!502347))

(declare-fun m!502349 () Bool)

(assert (=> b!521410 m!502349))

(declare-fun m!502351 () Bool)

(assert (=> b!521413 m!502351))

(declare-fun m!502353 () Bool)

(assert (=> b!521419 m!502353))

(declare-fun m!502355 () Bool)

(assert (=> b!521419 m!502355))

(declare-fun m!502357 () Bool)

(assert (=> b!521414 m!502357))

(declare-fun m!502359 () Bool)

(assert (=> start!47402 m!502359))

(declare-fun m!502361 () Bool)

(assert (=> start!47402 m!502361))

(declare-fun m!502363 () Bool)

(assert (=> b!521418 m!502363))

(assert (=> b!521418 m!502327))

(check-sat (not b!521410) (not b!521414) (not b!521417) (not b!521415) (not start!47402) (not b!521413) (not b!521423) (not b!521416) (not b!521419) (not b!521421))
(check-sat)
