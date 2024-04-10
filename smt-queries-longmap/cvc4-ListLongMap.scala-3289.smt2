; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45682 () Bool)

(assert start!45682)

(declare-fun b!504319 () Bool)

(declare-fun res!305519 () Bool)

(declare-fun e!295291 () Bool)

(assert (=> b!504319 (=> (not res!305519) (not e!295291))))

(declare-datatypes ((array!32438 0))(
  ( (array!32439 (arr!15599 (Array (_ BitVec 32) (_ BitVec 64))) (size!15963 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32438)

(declare-datatypes ((List!9757 0))(
  ( (Nil!9754) (Cons!9753 (h!10630 (_ BitVec 64)) (t!15985 List!9757)) )
))
(declare-fun arrayNoDuplicates!0 (array!32438 (_ BitVec 32) List!9757) Bool)

(assert (=> b!504319 (= res!305519 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9754))))

(declare-fun b!504320 () Bool)

(declare-fun res!305515 () Bool)

(assert (=> b!504320 (=> (not res!305515) (not e!295291))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32438 (_ BitVec 32)) Bool)

(assert (=> b!504320 (= res!305515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504321 () Bool)

(declare-datatypes ((Unit!15340 0))(
  ( (Unit!15341) )
))
(declare-fun e!295296 () Unit!15340)

(declare-fun Unit!15342 () Unit!15340)

(assert (=> b!504321 (= e!295296 Unit!15342)))

(declare-fun b!504323 () Bool)

(declare-fun Unit!15343 () Unit!15340)

(assert (=> b!504323 (= e!295296 Unit!15343)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!229597 () Unit!15340)

(declare-datatypes ((SeekEntryResult!4066 0))(
  ( (MissingZero!4066 (index!18452 (_ BitVec 32))) (Found!4066 (index!18453 (_ BitVec 32))) (Intermediate!4066 (undefined!4878 Bool) (index!18454 (_ BitVec 32)) (x!47467 (_ BitVec 32))) (Undefined!4066) (MissingVacant!4066 (index!18455 (_ BitVec 32))) )
))
(declare-fun lt!229596 () SeekEntryResult!4066)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!229603 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32438 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15340)

(assert (=> b!504323 (= lt!229597 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229603 #b00000000000000000000000000000000 (index!18454 lt!229596) (x!47467 lt!229596) mask!3524))))

(declare-fun res!305528 () Bool)

(declare-fun lt!229602 () (_ BitVec 64))

(declare-fun lt!229598 () array!32438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32438 (_ BitVec 32)) SeekEntryResult!4066)

(assert (=> b!504323 (= res!305528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229603 lt!229602 lt!229598 mask!3524) (Intermediate!4066 false (index!18454 lt!229596) (x!47467 lt!229596))))))

(declare-fun e!295289 () Bool)

(assert (=> b!504323 (=> (not res!305528) (not e!295289))))

(assert (=> b!504323 e!295289))

(declare-fun b!504324 () Bool)

(declare-fun res!305524 () Bool)

(declare-fun e!295288 () Bool)

(assert (=> b!504324 (=> res!305524 e!295288)))

(assert (=> b!504324 (= res!305524 (or (undefined!4878 lt!229596) (not (is-Intermediate!4066 lt!229596))))))

(declare-fun b!504325 () Bool)

(declare-fun res!305517 () Bool)

(declare-fun e!295290 () Bool)

(assert (=> b!504325 (=> res!305517 e!295290)))

(declare-fun e!295294 () Bool)

(assert (=> b!504325 (= res!305517 e!295294)))

(declare-fun res!305525 () Bool)

(assert (=> b!504325 (=> (not res!305525) (not e!295294))))

(assert (=> b!504325 (= res!305525 (bvsgt #b00000000000000000000000000000000 (x!47467 lt!229596)))))

(declare-fun b!504326 () Bool)

(assert (=> b!504326 (= e!295289 false)))

(declare-fun b!504327 () Bool)

(declare-fun res!305522 () Bool)

(declare-fun e!295293 () Bool)

(assert (=> b!504327 (=> (not res!305522) (not e!295293))))

(assert (=> b!504327 (= res!305522 (and (= (size!15963 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15963 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15963 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504328 () Bool)

(declare-fun res!305527 () Bool)

(assert (=> b!504328 (=> (not res!305527) (not e!295293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504328 (= res!305527 (validKeyInArray!0 k!2280))))

(declare-fun e!295295 () Bool)

(declare-fun b!504329 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32438 (_ BitVec 32)) SeekEntryResult!4066)

(assert (=> b!504329 (= e!295295 (= (seekEntryOrOpen!0 (select (arr!15599 a!3235) j!176) a!3235 mask!3524) (Found!4066 j!176)))))

(declare-fun b!504330 () Bool)

(declare-fun res!305514 () Bool)

(assert (=> b!504330 (=> (not res!305514) (not e!295293))))

(declare-fun arrayContainsKey!0 (array!32438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504330 (= res!305514 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504331 () Bool)

(declare-fun res!305516 () Bool)

(assert (=> b!504331 (=> (not res!305516) (not e!295293))))

(assert (=> b!504331 (= res!305516 (validKeyInArray!0 (select (arr!15599 a!3235) j!176)))))

(declare-fun b!504332 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32438 (_ BitVec 32)) SeekEntryResult!4066)

(assert (=> b!504332 (= e!295294 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229603 (index!18454 lt!229596) (select (arr!15599 a!3235) j!176) a!3235 mask!3524) (Found!4066 j!176))))))

(declare-fun b!504333 () Bool)

(assert (=> b!504333 (= e!295291 (not e!295288))))

(declare-fun res!305526 () Bool)

(assert (=> b!504333 (=> res!305526 e!295288)))

(declare-fun lt!229601 () (_ BitVec 32))

(assert (=> b!504333 (= res!305526 (= lt!229596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229601 lt!229602 lt!229598 mask!3524)))))

(assert (=> b!504333 (= lt!229596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229603 (select (arr!15599 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504333 (= lt!229601 (toIndex!0 lt!229602 mask!3524))))

(assert (=> b!504333 (= lt!229602 (select (store (arr!15599 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504333 (= lt!229603 (toIndex!0 (select (arr!15599 a!3235) j!176) mask!3524))))

(assert (=> b!504333 (= lt!229598 (array!32439 (store (arr!15599 a!3235) i!1204 k!2280) (size!15963 a!3235)))))

(assert (=> b!504333 e!295295))

(declare-fun res!305523 () Bool)

(assert (=> b!504333 (=> (not res!305523) (not e!295295))))

(assert (=> b!504333 (= res!305523 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229593 () Unit!15340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15340)

(assert (=> b!504333 (= lt!229593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!305520 () Bool)

(assert (=> start!45682 (=> (not res!305520) (not e!295293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45682 (= res!305520 (validMask!0 mask!3524))))

(assert (=> start!45682 e!295293))

(assert (=> start!45682 true))

(declare-fun array_inv!11395 (array!32438) Bool)

(assert (=> start!45682 (array_inv!11395 a!3235)))

(declare-fun b!504322 () Bool)

(assert (=> b!504322 (= e!295293 e!295291)))

(declare-fun res!305518 () Bool)

(assert (=> b!504322 (=> (not res!305518) (not e!295291))))

(declare-fun lt!229599 () SeekEntryResult!4066)

(assert (=> b!504322 (= res!305518 (or (= lt!229599 (MissingZero!4066 i!1204)) (= lt!229599 (MissingVacant!4066 i!1204))))))

(assert (=> b!504322 (= lt!229599 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504334 () Bool)

(assert (=> b!504334 (= e!295288 e!295290)))

(declare-fun res!305521 () Bool)

(assert (=> b!504334 (=> res!305521 e!295290)))

(assert (=> b!504334 (= res!305521 (or (bvsgt (x!47467 lt!229596) #b01111111111111111111111111111110) (bvslt lt!229603 #b00000000000000000000000000000000) (bvsge lt!229603 (size!15963 a!3235)) (bvslt (index!18454 lt!229596) #b00000000000000000000000000000000) (bvsge (index!18454 lt!229596) (size!15963 a!3235)) (not (= lt!229596 (Intermediate!4066 false (index!18454 lt!229596) (x!47467 lt!229596))))))))

(assert (=> b!504334 (= (index!18454 lt!229596) i!1204)))

(declare-fun lt!229595 () Unit!15340)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32438 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15340)

(assert (=> b!504334 (= lt!229595 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229603 #b00000000000000000000000000000000 (index!18454 lt!229596) (x!47467 lt!229596) mask!3524))))

(assert (=> b!504334 (and (or (= (select (arr!15599 a!3235) (index!18454 lt!229596)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15599 a!3235) (index!18454 lt!229596)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15599 a!3235) (index!18454 lt!229596)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15599 a!3235) (index!18454 lt!229596)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229594 () Unit!15340)

(assert (=> b!504334 (= lt!229594 e!295296)))

(declare-fun c!59681 () Bool)

(assert (=> b!504334 (= c!59681 (= (select (arr!15599 a!3235) (index!18454 lt!229596)) (select (arr!15599 a!3235) j!176)))))

(assert (=> b!504334 (and (bvslt (x!47467 lt!229596) #b01111111111111111111111111111110) (or (= (select (arr!15599 a!3235) (index!18454 lt!229596)) (select (arr!15599 a!3235) j!176)) (= (select (arr!15599 a!3235) (index!18454 lt!229596)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15599 a!3235) (index!18454 lt!229596)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504335 () Bool)

(assert (=> b!504335 (= e!295290 true)))

(declare-fun lt!229600 () SeekEntryResult!4066)

(assert (=> b!504335 (= lt!229600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229603 lt!229602 lt!229598 mask!3524))))

(assert (= (and start!45682 res!305520) b!504327))

(assert (= (and b!504327 res!305522) b!504331))

(assert (= (and b!504331 res!305516) b!504328))

(assert (= (and b!504328 res!305527) b!504330))

(assert (= (and b!504330 res!305514) b!504322))

(assert (= (and b!504322 res!305518) b!504320))

(assert (= (and b!504320 res!305515) b!504319))

(assert (= (and b!504319 res!305519) b!504333))

(assert (= (and b!504333 res!305523) b!504329))

(assert (= (and b!504333 (not res!305526)) b!504324))

(assert (= (and b!504324 (not res!305524)) b!504334))

(assert (= (and b!504334 c!59681) b!504323))

(assert (= (and b!504334 (not c!59681)) b!504321))

(assert (= (and b!504323 res!305528) b!504326))

(assert (= (and b!504334 (not res!305521)) b!504325))

(assert (= (and b!504325 res!305525) b!504332))

(assert (= (and b!504325 (not res!305517)) b!504335))

(declare-fun m!485069 () Bool)

(assert (=> b!504334 m!485069))

(declare-fun m!485071 () Bool)

(assert (=> b!504334 m!485071))

(declare-fun m!485073 () Bool)

(assert (=> b!504334 m!485073))

(declare-fun m!485075 () Bool)

(assert (=> b!504335 m!485075))

(declare-fun m!485077 () Bool)

(assert (=> b!504328 m!485077))

(declare-fun m!485079 () Bool)

(assert (=> b!504320 m!485079))

(assert (=> b!504331 m!485073))

(assert (=> b!504331 m!485073))

(declare-fun m!485081 () Bool)

(assert (=> b!504331 m!485081))

(declare-fun m!485083 () Bool)

(assert (=> b!504319 m!485083))

(assert (=> b!504333 m!485073))

(declare-fun m!485085 () Bool)

(assert (=> b!504333 m!485085))

(declare-fun m!485087 () Bool)

(assert (=> b!504333 m!485087))

(declare-fun m!485089 () Bool)

(assert (=> b!504333 m!485089))

(declare-fun m!485091 () Bool)

(assert (=> b!504333 m!485091))

(declare-fun m!485093 () Bool)

(assert (=> b!504333 m!485093))

(assert (=> b!504333 m!485073))

(declare-fun m!485095 () Bool)

(assert (=> b!504333 m!485095))

(assert (=> b!504333 m!485073))

(declare-fun m!485097 () Bool)

(assert (=> b!504333 m!485097))

(declare-fun m!485099 () Bool)

(assert (=> b!504333 m!485099))

(declare-fun m!485101 () Bool)

(assert (=> b!504330 m!485101))

(declare-fun m!485103 () Bool)

(assert (=> start!45682 m!485103))

(declare-fun m!485105 () Bool)

(assert (=> start!45682 m!485105))

(declare-fun m!485107 () Bool)

(assert (=> b!504322 m!485107))

(assert (=> b!504329 m!485073))

(assert (=> b!504329 m!485073))

(declare-fun m!485109 () Bool)

(assert (=> b!504329 m!485109))

(assert (=> b!504332 m!485073))

(assert (=> b!504332 m!485073))

(declare-fun m!485111 () Bool)

(assert (=> b!504332 m!485111))

(declare-fun m!485113 () Bool)

(assert (=> b!504323 m!485113))

(assert (=> b!504323 m!485075))

(push 1)

