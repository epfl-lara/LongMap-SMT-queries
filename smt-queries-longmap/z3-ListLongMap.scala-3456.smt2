; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47996 () Bool)

(assert start!47996)

(declare-fun b!528456 () Bool)

(declare-fun res!324490 () Bool)

(declare-fun e!307969 () Bool)

(assert (=> b!528456 (=> res!324490 e!307969)))

(declare-fun e!307966 () Bool)

(assert (=> b!528456 (= res!324490 e!307966)))

(declare-fun res!324486 () Bool)

(assert (=> b!528456 (=> (not res!324486) (not e!307966))))

(declare-datatypes ((SeekEntryResult!4516 0))(
  ( (MissingZero!4516 (index!20288 (_ BitVec 32))) (Found!4516 (index!20289 (_ BitVec 32))) (Intermediate!4516 (undefined!5328 Bool) (index!20290 (_ BitVec 32)) (x!49409 (_ BitVec 32))) (Undefined!4516) (MissingVacant!4516 (index!20291 (_ BitVec 32))) )
))
(declare-fun lt!243425 () SeekEntryResult!4516)

(assert (=> b!528456 (= res!324486 (bvsgt #b00000000000000000000000000000000 (x!49409 lt!243425)))))

(declare-fun b!528457 () Bool)

(declare-datatypes ((Unit!16675 0))(
  ( (Unit!16676) )
))
(declare-fun e!307974 () Unit!16675)

(declare-fun Unit!16677 () Unit!16675)

(assert (=> b!528457 (= e!307974 Unit!16677)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!528458 () Bool)

(declare-datatypes ((array!33490 0))(
  ( (array!33491 (arr!16093 (Array (_ BitVec 32) (_ BitVec 64))) (size!16457 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33490)

(declare-fun lt!243419 () (_ BitVec 32))

(declare-fun lt!243415 () SeekEntryResult!4516)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33490 (_ BitVec 32)) SeekEntryResult!4516)

(assert (=> b!528458 (= e!307966 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243419 (index!20290 lt!243425) (select (arr!16093 a!3235) j!176) a!3235 mask!3524) lt!243415)))))

(declare-fun b!528459 () Bool)

(declare-fun e!307967 () Bool)

(declare-fun e!307973 () Bool)

(assert (=> b!528459 (= e!307967 e!307973)))

(declare-fun res!324492 () Bool)

(assert (=> b!528459 (=> (not res!324492) (not e!307973))))

(declare-fun lt!243416 () SeekEntryResult!4516)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528459 (= res!324492 (or (= lt!243416 (MissingZero!4516 i!1204)) (= lt!243416 (MissingVacant!4516 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33490 (_ BitVec 32)) SeekEntryResult!4516)

(assert (=> b!528459 (= lt!243416 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528460 () Bool)

(declare-fun res!324485 () Bool)

(assert (=> b!528460 (=> (not res!324485) (not e!307967))))

(assert (=> b!528460 (= res!324485 (and (= (size!16457 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16457 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16457 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528461 () Bool)

(declare-fun res!324493 () Bool)

(assert (=> b!528461 (=> res!324493 e!307969)))

(declare-fun lt!243417 () array!33490)

(declare-fun lt!243426 () SeekEntryResult!4516)

(declare-fun lt!243423 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33490 (_ BitVec 32)) SeekEntryResult!4516)

(assert (=> b!528461 (= res!324493 (not (= lt!243426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243419 lt!243423 lt!243417 mask!3524))))))

(declare-fun b!528462 () Bool)

(declare-fun e!307968 () Bool)

(assert (=> b!528462 (= e!307968 e!307969)))

(declare-fun res!324489 () Bool)

(assert (=> b!528462 (=> res!324489 e!307969)))

(assert (=> b!528462 (= res!324489 (or (bvsgt (x!49409 lt!243425) #b01111111111111111111111111111110) (bvslt lt!243419 #b00000000000000000000000000000000) (bvsge lt!243419 (size!16457 a!3235)) (bvslt (index!20290 lt!243425) #b00000000000000000000000000000000) (bvsge (index!20290 lt!243425) (size!16457 a!3235)) (not (= lt!243425 (Intermediate!4516 false (index!20290 lt!243425) (x!49409 lt!243425))))))))

(assert (=> b!528462 (= (index!20290 lt!243425) i!1204)))

(declare-fun lt!243418 () Unit!16675)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16675)

(assert (=> b!528462 (= lt!243418 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243419 #b00000000000000000000000000000000 (index!20290 lt!243425) (x!49409 lt!243425) mask!3524))))

(assert (=> b!528462 (and (or (= (select (arr!16093 a!3235) (index!20290 lt!243425)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16093 a!3235) (index!20290 lt!243425)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16093 a!3235) (index!20290 lt!243425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16093 a!3235) (index!20290 lt!243425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243424 () Unit!16675)

(assert (=> b!528462 (= lt!243424 e!307974)))

(declare-fun c!62294 () Bool)

(assert (=> b!528462 (= c!62294 (= (select (arr!16093 a!3235) (index!20290 lt!243425)) (select (arr!16093 a!3235) j!176)))))

(assert (=> b!528462 (and (bvslt (x!49409 lt!243425) #b01111111111111111111111111111110) (or (= (select (arr!16093 a!3235) (index!20290 lt!243425)) (select (arr!16093 a!3235) j!176)) (= (select (arr!16093 a!3235) (index!20290 lt!243425)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16093 a!3235) (index!20290 lt!243425)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!324494 () Bool)

(assert (=> start!47996 (=> (not res!324494) (not e!307967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47996 (= res!324494 (validMask!0 mask!3524))))

(assert (=> start!47996 e!307967))

(assert (=> start!47996 true))

(declare-fun array_inv!11952 (array!33490) Bool)

(assert (=> start!47996 (array_inv!11952 a!3235)))

(declare-fun b!528463 () Bool)

(declare-fun res!324487 () Bool)

(assert (=> b!528463 (=> (not res!324487) (not e!307973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33490 (_ BitVec 32)) Bool)

(assert (=> b!528463 (= res!324487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528464 () Bool)

(assert (=> b!528464 (= e!307969 true)))

(assert (=> b!528464 (= (seekEntryOrOpen!0 lt!243423 lt!243417 mask!3524) lt!243415)))

(declare-fun lt!243420 () Unit!16675)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16675)

(assert (=> b!528464 (= lt!243420 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243419 #b00000000000000000000000000000000 (index!20290 lt!243425) (x!49409 lt!243425) mask!3524))))

(declare-fun b!528465 () Bool)

(declare-fun res!324491 () Bool)

(assert (=> b!528465 (=> (not res!324491) (not e!307967))))

(declare-fun arrayContainsKey!0 (array!33490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528465 (= res!324491 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528466 () Bool)

(declare-fun Unit!16678 () Unit!16675)

(assert (=> b!528466 (= e!307974 Unit!16678)))

(declare-fun lt!243421 () Unit!16675)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16675)

(assert (=> b!528466 (= lt!243421 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243419 #b00000000000000000000000000000000 (index!20290 lt!243425) (x!49409 lt!243425) mask!3524))))

(declare-fun res!324498 () Bool)

(assert (=> b!528466 (= res!324498 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243419 lt!243423 lt!243417 mask!3524) (Intermediate!4516 false (index!20290 lt!243425) (x!49409 lt!243425))))))

(declare-fun e!307970 () Bool)

(assert (=> b!528466 (=> (not res!324498) (not e!307970))))

(assert (=> b!528466 e!307970))

(declare-fun b!528467 () Bool)

(assert (=> b!528467 (= e!307970 false)))

(declare-fun b!528468 () Bool)

(declare-fun res!324495 () Bool)

(assert (=> b!528468 (=> (not res!324495) (not e!307967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528468 (= res!324495 (validKeyInArray!0 k0!2280))))

(declare-fun b!528469 () Bool)

(declare-fun e!307972 () Bool)

(assert (=> b!528469 (= e!307972 (= (seekEntryOrOpen!0 (select (arr!16093 a!3235) j!176) a!3235 mask!3524) (Found!4516 j!176)))))

(declare-fun b!528470 () Bool)

(declare-fun res!324497 () Bool)

(assert (=> b!528470 (=> (not res!324497) (not e!307967))))

(assert (=> b!528470 (= res!324497 (validKeyInArray!0 (select (arr!16093 a!3235) j!176)))))

(declare-fun b!528471 () Bool)

(declare-fun res!324496 () Bool)

(assert (=> b!528471 (=> (not res!324496) (not e!307973))))

(declare-datatypes ((List!10158 0))(
  ( (Nil!10155) (Cons!10154 (h!11091 (_ BitVec 64)) (t!16378 List!10158)) )
))
(declare-fun arrayNoDuplicates!0 (array!33490 (_ BitVec 32) List!10158) Bool)

(assert (=> b!528471 (= res!324496 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10155))))

(declare-fun b!528472 () Bool)

(assert (=> b!528472 (= e!307973 (not e!307968))))

(declare-fun res!324488 () Bool)

(assert (=> b!528472 (=> res!324488 e!307968)))

(get-info :version)

(assert (=> b!528472 (= res!324488 (or (= lt!243425 lt!243426) (undefined!5328 lt!243425) (not ((_ is Intermediate!4516) lt!243425))))))

(declare-fun lt!243422 () (_ BitVec 32))

(assert (=> b!528472 (= lt!243426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243422 lt!243423 lt!243417 mask!3524))))

(assert (=> b!528472 (= lt!243425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243419 (select (arr!16093 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528472 (= lt!243422 (toIndex!0 lt!243423 mask!3524))))

(assert (=> b!528472 (= lt!243423 (select (store (arr!16093 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528472 (= lt!243419 (toIndex!0 (select (arr!16093 a!3235) j!176) mask!3524))))

(assert (=> b!528472 (= lt!243417 (array!33491 (store (arr!16093 a!3235) i!1204 k0!2280) (size!16457 a!3235)))))

(assert (=> b!528472 (= lt!243415 (Found!4516 j!176))))

(assert (=> b!528472 e!307972))

(declare-fun res!324499 () Bool)

(assert (=> b!528472 (=> (not res!324499) (not e!307972))))

(assert (=> b!528472 (= res!324499 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243427 () Unit!16675)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16675)

(assert (=> b!528472 (= lt!243427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47996 res!324494) b!528460))

(assert (= (and b!528460 res!324485) b!528470))

(assert (= (and b!528470 res!324497) b!528468))

(assert (= (and b!528468 res!324495) b!528465))

(assert (= (and b!528465 res!324491) b!528459))

(assert (= (and b!528459 res!324492) b!528463))

(assert (= (and b!528463 res!324487) b!528471))

(assert (= (and b!528471 res!324496) b!528472))

(assert (= (and b!528472 res!324499) b!528469))

(assert (= (and b!528472 (not res!324488)) b!528462))

(assert (= (and b!528462 c!62294) b!528466))

(assert (= (and b!528462 (not c!62294)) b!528457))

(assert (= (and b!528466 res!324498) b!528467))

(assert (= (and b!528462 (not res!324489)) b!528456))

(assert (= (and b!528456 res!324486) b!528458))

(assert (= (and b!528456 (not res!324490)) b!528461))

(assert (= (and b!528461 (not res!324493)) b!528464))

(declare-fun m!509239 () Bool)

(assert (=> b!528464 m!509239))

(declare-fun m!509241 () Bool)

(assert (=> b!528464 m!509241))

(declare-fun m!509243 () Bool)

(assert (=> b!528466 m!509243))

(declare-fun m!509245 () Bool)

(assert (=> b!528466 m!509245))

(declare-fun m!509247 () Bool)

(assert (=> b!528462 m!509247))

(declare-fun m!509249 () Bool)

(assert (=> b!528462 m!509249))

(declare-fun m!509251 () Bool)

(assert (=> b!528462 m!509251))

(assert (=> b!528458 m!509251))

(assert (=> b!528458 m!509251))

(declare-fun m!509253 () Bool)

(assert (=> b!528458 m!509253))

(declare-fun m!509255 () Bool)

(assert (=> b!528472 m!509255))

(declare-fun m!509257 () Bool)

(assert (=> b!528472 m!509257))

(declare-fun m!509259 () Bool)

(assert (=> b!528472 m!509259))

(declare-fun m!509261 () Bool)

(assert (=> b!528472 m!509261))

(assert (=> b!528472 m!509251))

(declare-fun m!509263 () Bool)

(assert (=> b!528472 m!509263))

(assert (=> b!528472 m!509251))

(declare-fun m!509265 () Bool)

(assert (=> b!528472 m!509265))

(assert (=> b!528472 m!509251))

(declare-fun m!509267 () Bool)

(assert (=> b!528472 m!509267))

(declare-fun m!509269 () Bool)

(assert (=> b!528472 m!509269))

(declare-fun m!509271 () Bool)

(assert (=> start!47996 m!509271))

(declare-fun m!509273 () Bool)

(assert (=> start!47996 m!509273))

(declare-fun m!509275 () Bool)

(assert (=> b!528468 m!509275))

(declare-fun m!509277 () Bool)

(assert (=> b!528463 m!509277))

(assert (=> b!528470 m!509251))

(assert (=> b!528470 m!509251))

(declare-fun m!509279 () Bool)

(assert (=> b!528470 m!509279))

(assert (=> b!528469 m!509251))

(assert (=> b!528469 m!509251))

(declare-fun m!509281 () Bool)

(assert (=> b!528469 m!509281))

(declare-fun m!509283 () Bool)

(assert (=> b!528465 m!509283))

(declare-fun m!509285 () Bool)

(assert (=> b!528459 m!509285))

(declare-fun m!509287 () Bool)

(assert (=> b!528471 m!509287))

(assert (=> b!528461 m!509245))

(check-sat (not b!528463) (not b!528465) (not b!528469) (not b!528462) (not b!528459) (not b!528466) (not start!47996) (not b!528472) (not b!528468) (not b!528461) (not b!528464) (not b!528458) (not b!528470) (not b!528471))
(check-sat)
