; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44762 () Bool)

(assert start!44762)

(declare-fun b!491462 () Bool)

(declare-fun e!288755 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!491462 (= e!288755 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!3721 0))(
  ( (MissingZero!3721 (index!17063 (_ BitVec 32))) (Found!3721 (index!17064 (_ BitVec 32))) (Intermediate!3721 (undefined!4533 Bool) (index!17065 (_ BitVec 32)) (x!46296 (_ BitVec 32))) (Undefined!3721) (MissingVacant!3721 (index!17066 (_ BitVec 32))) )
))
(declare-fun lt!222221 () SeekEntryResult!3721)

(declare-fun lt!222224 () (_ BitVec 64))

(declare-datatypes ((array!31822 0))(
  ( (array!31823 (arr!15298 (Array (_ BitVec 32) (_ BitVec 64))) (size!15662 (_ BitVec 32))) )
))
(declare-fun lt!222223 () array!31822)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31822 (_ BitVec 32)) SeekEntryResult!3721)

(assert (=> b!491462 (= lt!222221 (seekEntryOrOpen!0 lt!222224 lt!222223 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!31822)

(declare-datatypes ((Unit!14449 0))(
  ( (Unit!14450) )
))
(declare-fun lt!222226 () Unit!14449)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31822 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14449)

(assert (=> b!491462 (= lt!222226 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491464 () Bool)

(declare-fun e!288756 () Bool)

(assert (=> b!491464 (= e!288756 (not e!288755))))

(declare-fun res!294455 () Bool)

(assert (=> b!491464 (=> res!294455 e!288755)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31822 (_ BitVec 32)) SeekEntryResult!3721)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491464 (= res!294455 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15298 a!3235) j!176) mask!3524) (select (arr!15298 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222224 mask!3524) lt!222224 lt!222223 mask!3524))))))

(assert (=> b!491464 (= lt!222224 (select (store (arr!15298 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491464 (= lt!222223 (array!31823 (store (arr!15298 a!3235) i!1204 k0!2280) (size!15662 a!3235)))))

(assert (=> b!491464 (= lt!222221 (Found!3721 j!176))))

(assert (=> b!491464 (= lt!222221 (seekEntryOrOpen!0 (select (arr!15298 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31822 (_ BitVec 32)) Bool)

(assert (=> b!491464 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222225 () Unit!14449)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14449)

(assert (=> b!491464 (= lt!222225 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491465 () Bool)

(declare-fun res!294457 () Bool)

(declare-fun e!288753 () Bool)

(assert (=> b!491465 (=> (not res!294457) (not e!288753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491465 (= res!294457 (validKeyInArray!0 k0!2280))))

(declare-fun b!491466 () Bool)

(declare-fun res!294458 () Bool)

(assert (=> b!491466 (=> (not res!294458) (not e!288753))))

(assert (=> b!491466 (= res!294458 (and (= (size!15662 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15662 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15662 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491467 () Bool)

(declare-fun res!294460 () Bool)

(assert (=> b!491467 (=> (not res!294460) (not e!288756))))

(declare-datatypes ((List!9363 0))(
  ( (Nil!9360) (Cons!9359 (h!10221 (_ BitVec 64)) (t!15583 List!9363)) )
))
(declare-fun arrayNoDuplicates!0 (array!31822 (_ BitVec 32) List!9363) Bool)

(assert (=> b!491467 (= res!294460 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9360))))

(declare-fun b!491468 () Bool)

(declare-fun res!294456 () Bool)

(assert (=> b!491468 (=> (not res!294456) (not e!288753))))

(assert (=> b!491468 (= res!294456 (validKeyInArray!0 (select (arr!15298 a!3235) j!176)))))

(declare-fun b!491469 () Bool)

(declare-fun res!294453 () Bool)

(assert (=> b!491469 (=> (not res!294453) (not e!288756))))

(assert (=> b!491469 (= res!294453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491470 () Bool)

(declare-fun res!294452 () Bool)

(assert (=> b!491470 (=> (not res!294452) (not e!288753))))

(declare-fun arrayContainsKey!0 (array!31822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491470 (= res!294452 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491463 () Bool)

(assert (=> b!491463 (= e!288753 e!288756)))

(declare-fun res!294459 () Bool)

(assert (=> b!491463 (=> (not res!294459) (not e!288756))))

(declare-fun lt!222222 () SeekEntryResult!3721)

(assert (=> b!491463 (= res!294459 (or (= lt!222222 (MissingZero!3721 i!1204)) (= lt!222222 (MissingVacant!3721 i!1204))))))

(assert (=> b!491463 (= lt!222222 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!294454 () Bool)

(assert (=> start!44762 (=> (not res!294454) (not e!288753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44762 (= res!294454 (validMask!0 mask!3524))))

(assert (=> start!44762 e!288753))

(assert (=> start!44762 true))

(declare-fun array_inv!11157 (array!31822) Bool)

(assert (=> start!44762 (array_inv!11157 a!3235)))

(assert (= (and start!44762 res!294454) b!491466))

(assert (= (and b!491466 res!294458) b!491468))

(assert (= (and b!491468 res!294456) b!491465))

(assert (= (and b!491465 res!294457) b!491470))

(assert (= (and b!491470 res!294452) b!491463))

(assert (= (and b!491463 res!294459) b!491469))

(assert (= (and b!491469 res!294453) b!491467))

(assert (= (and b!491467 res!294460) b!491464))

(assert (= (and b!491464 (not res!294455)) b!491462))

(declare-fun m!472327 () Bool)

(assert (=> b!491463 m!472327))

(declare-fun m!472329 () Bool)

(assert (=> b!491462 m!472329))

(declare-fun m!472331 () Bool)

(assert (=> b!491462 m!472331))

(declare-fun m!472333 () Bool)

(assert (=> b!491469 m!472333))

(declare-fun m!472335 () Bool)

(assert (=> b!491467 m!472335))

(declare-fun m!472337 () Bool)

(assert (=> start!44762 m!472337))

(declare-fun m!472339 () Bool)

(assert (=> start!44762 m!472339))

(declare-fun m!472341 () Bool)

(assert (=> b!491470 m!472341))

(declare-fun m!472343 () Bool)

(assert (=> b!491464 m!472343))

(declare-fun m!472345 () Bool)

(assert (=> b!491464 m!472345))

(declare-fun m!472347 () Bool)

(assert (=> b!491464 m!472347))

(declare-fun m!472349 () Bool)

(assert (=> b!491464 m!472349))

(declare-fun m!472351 () Bool)

(assert (=> b!491464 m!472351))

(declare-fun m!472353 () Bool)

(assert (=> b!491464 m!472353))

(assert (=> b!491464 m!472351))

(assert (=> b!491464 m!472349))

(assert (=> b!491464 m!472351))

(declare-fun m!472355 () Bool)

(assert (=> b!491464 m!472355))

(assert (=> b!491464 m!472351))

(declare-fun m!472357 () Bool)

(assert (=> b!491464 m!472357))

(declare-fun m!472359 () Bool)

(assert (=> b!491464 m!472359))

(assert (=> b!491464 m!472359))

(declare-fun m!472361 () Bool)

(assert (=> b!491464 m!472361))

(declare-fun m!472363 () Bool)

(assert (=> b!491465 m!472363))

(assert (=> b!491468 m!472351))

(assert (=> b!491468 m!472351))

(declare-fun m!472365 () Bool)

(assert (=> b!491468 m!472365))

(check-sat (not b!491463) (not b!491467) (not b!491465) (not b!491469) (not b!491470) (not b!491464) (not start!44762) (not b!491462) (not b!491468))
(check-sat)
