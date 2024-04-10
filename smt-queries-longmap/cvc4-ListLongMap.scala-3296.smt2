; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45724 () Bool)

(assert start!45724)

(declare-fun b!505390 () Bool)

(declare-fun e!295863 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!505390 (= e!295863 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!4087 0))(
  ( (MissingZero!4087 (index!18536 (_ BitVec 32))) (Found!4087 (index!18537 (_ BitVec 32))) (Intermediate!4087 (undefined!4899 Bool) (index!18538 (_ BitVec 32)) (x!47544 (_ BitVec 32))) (Undefined!4087) (MissingVacant!4087 (index!18539 (_ BitVec 32))) )
))
(declare-fun lt!230320 () SeekEntryResult!4087)

(declare-datatypes ((array!32480 0))(
  ( (array!32481 (arr!15620 (Array (_ BitVec 32) (_ BitVec 64))) (size!15984 (_ BitVec 32))) )
))
(declare-fun lt!230323 () array!32480)

(declare-fun lt!230329 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32480 (_ BitVec 32)) SeekEntryResult!4087)

(assert (=> b!505390 (= (seekEntryOrOpen!0 lt!230329 lt!230323 mask!3524) lt!230320)))

(declare-datatypes ((Unit!15424 0))(
  ( (Unit!15425) )
))
(declare-fun lt!230321 () Unit!15424)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!32480)

(declare-fun lt!230331 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!230322 () SeekEntryResult!4087)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15424)

(assert (=> b!505390 (= lt!230321 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230331 #b00000000000000000000000000000000 (index!18538 lt!230322) (x!47544 lt!230322) mask!3524))))

(declare-fun b!505391 () Bool)

(declare-fun res!306460 () Bool)

(declare-fun e!295858 () Bool)

(assert (=> b!505391 (=> (not res!306460) (not e!295858))))

(assert (=> b!505391 (= res!306460 (and (= (size!15984 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15984 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15984 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505392 () Bool)

(declare-fun res!306465 () Bool)

(assert (=> b!505392 (=> (not res!306465) (not e!295858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505392 (= res!306465 (validKeyInArray!0 k!2280))))

(declare-fun b!505393 () Bool)

(declare-fun res!306468 () Bool)

(assert (=> b!505393 (=> res!306468 e!295863)))

(declare-fun lt!230332 () SeekEntryResult!4087)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32480 (_ BitVec 32)) SeekEntryResult!4087)

(assert (=> b!505393 (= res!306468 (not (= lt!230332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230331 lt!230329 lt!230323 mask!3524))))))

(declare-fun res!306472 () Bool)

(assert (=> start!45724 (=> (not res!306472) (not e!295858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45724 (= res!306472 (validMask!0 mask!3524))))

(assert (=> start!45724 e!295858))

(assert (=> start!45724 true))

(declare-fun array_inv!11416 (array!32480) Bool)

(assert (=> start!45724 (array_inv!11416 a!3235)))

(declare-fun b!505394 () Bool)

(declare-fun e!295857 () Unit!15424)

(declare-fun Unit!15426 () Unit!15424)

(assert (=> b!505394 (= e!295857 Unit!15426)))

(declare-fun b!505395 () Bool)

(declare-fun res!306473 () Bool)

(declare-fun e!295856 () Bool)

(assert (=> b!505395 (=> (not res!306473) (not e!295856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32480 (_ BitVec 32)) Bool)

(assert (=> b!505395 (= res!306473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505396 () Bool)

(declare-fun e!295860 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32480 (_ BitVec 32)) SeekEntryResult!4087)

(assert (=> b!505396 (= e!295860 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230331 (index!18538 lt!230322) (select (arr!15620 a!3235) j!176) a!3235 mask!3524) lt!230320)))))

(declare-fun b!505397 () Bool)

(declare-fun e!295859 () Bool)

(assert (=> b!505397 (= e!295859 (= (seekEntryOrOpen!0 (select (arr!15620 a!3235) j!176) a!3235 mask!3524) (Found!4087 j!176)))))

(declare-fun b!505398 () Bool)

(declare-fun res!306467 () Bool)

(assert (=> b!505398 (=> res!306467 e!295863)))

(assert (=> b!505398 (= res!306467 e!295860)))

(declare-fun res!306461 () Bool)

(assert (=> b!505398 (=> (not res!306461) (not e!295860))))

(assert (=> b!505398 (= res!306461 (bvsgt #b00000000000000000000000000000000 (x!47544 lt!230322)))))

(declare-fun b!505399 () Bool)

(assert (=> b!505399 (= e!295858 e!295856)))

(declare-fun res!306462 () Bool)

(assert (=> b!505399 (=> (not res!306462) (not e!295856))))

(declare-fun lt!230324 () SeekEntryResult!4087)

(assert (=> b!505399 (= res!306462 (or (= lt!230324 (MissingZero!4087 i!1204)) (= lt!230324 (MissingVacant!4087 i!1204))))))

(assert (=> b!505399 (= lt!230324 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505400 () Bool)

(declare-fun res!306469 () Bool)

(assert (=> b!505400 (=> (not res!306469) (not e!295858))))

(declare-fun arrayContainsKey!0 (array!32480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505400 (= res!306469 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505401 () Bool)

(declare-fun e!295862 () Bool)

(assert (=> b!505401 (= e!295862 e!295863)))

(declare-fun res!306464 () Bool)

(assert (=> b!505401 (=> res!306464 e!295863)))

(assert (=> b!505401 (= res!306464 (or (bvsgt (x!47544 lt!230322) #b01111111111111111111111111111110) (bvslt lt!230331 #b00000000000000000000000000000000) (bvsge lt!230331 (size!15984 a!3235)) (bvslt (index!18538 lt!230322) #b00000000000000000000000000000000) (bvsge (index!18538 lt!230322) (size!15984 a!3235)) (not (= lt!230322 (Intermediate!4087 false (index!18538 lt!230322) (x!47544 lt!230322))))))))

(assert (=> b!505401 (= (index!18538 lt!230322) i!1204)))

(declare-fun lt!230326 () Unit!15424)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15424)

(assert (=> b!505401 (= lt!230326 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230331 #b00000000000000000000000000000000 (index!18538 lt!230322) (x!47544 lt!230322) mask!3524))))

(assert (=> b!505401 (and (or (= (select (arr!15620 a!3235) (index!18538 lt!230322)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15620 a!3235) (index!18538 lt!230322)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15620 a!3235) (index!18538 lt!230322)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15620 a!3235) (index!18538 lt!230322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230325 () Unit!15424)

(assert (=> b!505401 (= lt!230325 e!295857)))

(declare-fun c!59744 () Bool)

(assert (=> b!505401 (= c!59744 (= (select (arr!15620 a!3235) (index!18538 lt!230322)) (select (arr!15620 a!3235) j!176)))))

(assert (=> b!505401 (and (bvslt (x!47544 lt!230322) #b01111111111111111111111111111110) (or (= (select (arr!15620 a!3235) (index!18538 lt!230322)) (select (arr!15620 a!3235) j!176)) (= (select (arr!15620 a!3235) (index!18538 lt!230322)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15620 a!3235) (index!18538 lt!230322)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505402 () Bool)

(assert (=> b!505402 (= e!295856 (not e!295862))))

(declare-fun res!306466 () Bool)

(assert (=> b!505402 (=> res!306466 e!295862)))

(assert (=> b!505402 (= res!306466 (or (= lt!230322 lt!230332) (undefined!4899 lt!230322) (not (is-Intermediate!4087 lt!230322))))))

(declare-fun lt!230330 () (_ BitVec 32))

(assert (=> b!505402 (= lt!230332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230330 lt!230329 lt!230323 mask!3524))))

(assert (=> b!505402 (= lt!230322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230331 (select (arr!15620 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505402 (= lt!230330 (toIndex!0 lt!230329 mask!3524))))

(assert (=> b!505402 (= lt!230329 (select (store (arr!15620 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505402 (= lt!230331 (toIndex!0 (select (arr!15620 a!3235) j!176) mask!3524))))

(assert (=> b!505402 (= lt!230323 (array!32481 (store (arr!15620 a!3235) i!1204 k!2280) (size!15984 a!3235)))))

(assert (=> b!505402 (= lt!230320 (Found!4087 j!176))))

(assert (=> b!505402 e!295859))

(declare-fun res!306470 () Bool)

(assert (=> b!505402 (=> (not res!306470) (not e!295859))))

(assert (=> b!505402 (= res!306470 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230327 () Unit!15424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15424)

(assert (=> b!505402 (= lt!230327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505403 () Bool)

(declare-fun Unit!15427 () Unit!15424)

(assert (=> b!505403 (= e!295857 Unit!15427)))

(declare-fun lt!230328 () Unit!15424)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15424)

(assert (=> b!505403 (= lt!230328 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230331 #b00000000000000000000000000000000 (index!18538 lt!230322) (x!47544 lt!230322) mask!3524))))

(declare-fun res!306463 () Bool)

(assert (=> b!505403 (= res!306463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230331 lt!230329 lt!230323 mask!3524) (Intermediate!4087 false (index!18538 lt!230322) (x!47544 lt!230322))))))

(declare-fun e!295855 () Bool)

(assert (=> b!505403 (=> (not res!306463) (not e!295855))))

(assert (=> b!505403 e!295855))

(declare-fun b!505404 () Bool)

(assert (=> b!505404 (= e!295855 false)))

(declare-fun b!505405 () Bool)

(declare-fun res!306471 () Bool)

(assert (=> b!505405 (=> (not res!306471) (not e!295858))))

(assert (=> b!505405 (= res!306471 (validKeyInArray!0 (select (arr!15620 a!3235) j!176)))))

(declare-fun b!505406 () Bool)

(declare-fun res!306459 () Bool)

(assert (=> b!505406 (=> (not res!306459) (not e!295856))))

(declare-datatypes ((List!9778 0))(
  ( (Nil!9775) (Cons!9774 (h!10651 (_ BitVec 64)) (t!16006 List!9778)) )
))
(declare-fun arrayNoDuplicates!0 (array!32480 (_ BitVec 32) List!9778) Bool)

(assert (=> b!505406 (= res!306459 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9775))))

(assert (= (and start!45724 res!306472) b!505391))

(assert (= (and b!505391 res!306460) b!505405))

(assert (= (and b!505405 res!306471) b!505392))

(assert (= (and b!505392 res!306465) b!505400))

(assert (= (and b!505400 res!306469) b!505399))

(assert (= (and b!505399 res!306462) b!505395))

(assert (= (and b!505395 res!306473) b!505406))

(assert (= (and b!505406 res!306459) b!505402))

(assert (= (and b!505402 res!306470) b!505397))

(assert (= (and b!505402 (not res!306466)) b!505401))

(assert (= (and b!505401 c!59744) b!505403))

(assert (= (and b!505401 (not c!59744)) b!505394))

(assert (= (and b!505403 res!306463) b!505404))

(assert (= (and b!505401 (not res!306464)) b!505398))

(assert (= (and b!505398 res!306461) b!505396))

(assert (= (and b!505398 (not res!306467)) b!505393))

(assert (= (and b!505393 (not res!306468)) b!505390))

(declare-fun m!486055 () Bool)

(assert (=> b!505399 m!486055))

(declare-fun m!486057 () Bool)

(assert (=> b!505405 m!486057))

(assert (=> b!505405 m!486057))

(declare-fun m!486059 () Bool)

(assert (=> b!505405 m!486059))

(declare-fun m!486061 () Bool)

(assert (=> b!505400 m!486061))

(declare-fun m!486063 () Bool)

(assert (=> b!505402 m!486063))

(declare-fun m!486065 () Bool)

(assert (=> b!505402 m!486065))

(declare-fun m!486067 () Bool)

(assert (=> b!505402 m!486067))

(declare-fun m!486069 () Bool)

(assert (=> b!505402 m!486069))

(declare-fun m!486071 () Bool)

(assert (=> b!505402 m!486071))

(assert (=> b!505402 m!486057))

(declare-fun m!486073 () Bool)

(assert (=> b!505402 m!486073))

(assert (=> b!505402 m!486057))

(declare-fun m!486075 () Bool)

(assert (=> b!505402 m!486075))

(assert (=> b!505402 m!486057))

(declare-fun m!486077 () Bool)

(assert (=> b!505402 m!486077))

(declare-fun m!486079 () Bool)

(assert (=> b!505395 m!486079))

(declare-fun m!486081 () Bool)

(assert (=> start!45724 m!486081))

(declare-fun m!486083 () Bool)

(assert (=> start!45724 m!486083))

(declare-fun m!486085 () Bool)

(assert (=> b!505392 m!486085))

(assert (=> b!505396 m!486057))

(assert (=> b!505396 m!486057))

(declare-fun m!486087 () Bool)

(assert (=> b!505396 m!486087))

(declare-fun m!486089 () Bool)

(assert (=> b!505401 m!486089))

(declare-fun m!486091 () Bool)

(assert (=> b!505401 m!486091))

(assert (=> b!505401 m!486057))

(assert (=> b!505397 m!486057))

(assert (=> b!505397 m!486057))

(declare-fun m!486093 () Bool)

(assert (=> b!505397 m!486093))

(declare-fun m!486095 () Bool)

(assert (=> b!505406 m!486095))

(declare-fun m!486097 () Bool)

(assert (=> b!505390 m!486097))

(declare-fun m!486099 () Bool)

(assert (=> b!505390 m!486099))

(declare-fun m!486101 () Bool)

(assert (=> b!505393 m!486101))

(declare-fun m!486103 () Bool)

(assert (=> b!505403 m!486103))

(assert (=> b!505403 m!486101))

(push 1)

