; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48096 () Bool)

(assert start!48096)

(declare-fun b!529470 () Bool)

(declare-fun res!325320 () Bool)

(declare-fun e!308507 () Bool)

(assert (=> b!529470 (=> (not res!325320) (not e!308507))))

(declare-datatypes ((array!33542 0))(
  ( (array!33543 (arr!16118 (Array (_ BitVec 32) (_ BitVec 64))) (size!16483 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33542)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33542 (_ BitVec 32)) Bool)

(assert (=> b!529470 (= res!325320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529471 () Bool)

(declare-fun e!308509 () Bool)

(declare-fun e!308510 () Bool)

(assert (=> b!529471 (= e!308509 e!308510)))

(declare-fun res!325323 () Bool)

(assert (=> b!529471 (=> res!325323 e!308510)))

(declare-fun lt!243997 () Bool)

(declare-datatypes ((SeekEntryResult!4582 0))(
  ( (MissingZero!4582 (index!20552 (_ BitVec 32))) (Found!4582 (index!20553 (_ BitVec 32))) (Intermediate!4582 (undefined!5394 Bool) (index!20554 (_ BitVec 32)) (x!49535 (_ BitVec 32))) (Undefined!4582) (MissingVacant!4582 (index!20555 (_ BitVec 32))) )
))
(declare-fun lt!243995 () SeekEntryResult!4582)

(assert (=> b!529471 (= res!325323 (or (and (not lt!243997) (undefined!5394 lt!243995)) (and (not lt!243997) (not (undefined!5394 lt!243995)))))))

(get-info :version)

(assert (=> b!529471 (= lt!243997 (not ((_ is Intermediate!4582) lt!243995)))))

(declare-fun b!529472 () Bool)

(assert (=> b!529472 (= e!308507 (not e!308509))))

(declare-fun res!325319 () Bool)

(assert (=> b!529472 (=> res!325319 e!308509)))

(declare-fun lt!243998 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33542 (_ BitVec 32)) SeekEntryResult!4582)

(assert (=> b!529472 (= res!325319 (= lt!243995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243998 (select (store (arr!16118 a!3235) i!1204 k0!2280) j!176) (array!33543 (store (arr!16118 a!3235) i!1204 k0!2280) (size!16483 a!3235)) mask!3524)))))

(declare-fun lt!243999 () (_ BitVec 32))

(assert (=> b!529472 (= lt!243995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243999 (select (arr!16118 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529472 (= lt!243998 (toIndex!0 (select (store (arr!16118 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!529472 (= lt!243999 (toIndex!0 (select (arr!16118 a!3235) j!176) mask!3524))))

(declare-fun e!308511 () Bool)

(assert (=> b!529472 e!308511))

(declare-fun res!325324 () Bool)

(assert (=> b!529472 (=> (not res!325324) (not e!308511))))

(assert (=> b!529472 (= res!325324 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16762 0))(
  ( (Unit!16763) )
))
(declare-fun lt!243996 () Unit!16762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16762)

(assert (=> b!529472 (= lt!243996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529473 () Bool)

(declare-fun res!325328 () Bool)

(declare-fun e!308506 () Bool)

(assert (=> b!529473 (=> (not res!325328) (not e!308506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529473 (= res!325328 (validKeyInArray!0 (select (arr!16118 a!3235) j!176)))))

(declare-fun res!325327 () Bool)

(assert (=> start!48096 (=> (not res!325327) (not e!308506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48096 (= res!325327 (validMask!0 mask!3524))))

(assert (=> start!48096 e!308506))

(assert (=> start!48096 true))

(declare-fun array_inv!12001 (array!33542) Bool)

(assert (=> start!48096 (array_inv!12001 a!3235)))

(declare-fun b!529474 () Bool)

(declare-fun res!325326 () Bool)

(assert (=> b!529474 (=> (not res!325326) (not e!308506))))

(assert (=> b!529474 (= res!325326 (and (= (size!16483 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16483 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16483 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529475 () Bool)

(declare-fun res!325321 () Bool)

(assert (=> b!529475 (=> (not res!325321) (not e!308506))))

(declare-fun arrayContainsKey!0 (array!33542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529475 (= res!325321 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529476 () Bool)

(declare-fun res!325325 () Bool)

(assert (=> b!529476 (=> (not res!325325) (not e!308506))))

(assert (=> b!529476 (= res!325325 (validKeyInArray!0 k0!2280))))

(declare-fun b!529477 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33542 (_ BitVec 32)) SeekEntryResult!4582)

(assert (=> b!529477 (= e!308511 (= (seekEntryOrOpen!0 (select (arr!16118 a!3235) j!176) a!3235 mask!3524) (Found!4582 j!176)))))

(declare-fun b!529478 () Bool)

(declare-fun res!325318 () Bool)

(assert (=> b!529478 (=> (not res!325318) (not e!308507))))

(declare-datatypes ((List!10315 0))(
  ( (Nil!10312) (Cons!10311 (h!11251 (_ BitVec 64)) (t!16534 List!10315)) )
))
(declare-fun arrayNoDuplicates!0 (array!33542 (_ BitVec 32) List!10315) Bool)

(assert (=> b!529478 (= res!325318 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10312))))

(declare-fun b!529479 () Bool)

(assert (=> b!529479 (= e!308510 true)))

(assert (=> b!529479 false))

(declare-fun b!529480 () Bool)

(assert (=> b!529480 (= e!308506 e!308507)))

(declare-fun res!325322 () Bool)

(assert (=> b!529480 (=> (not res!325322) (not e!308507))))

(declare-fun lt!244000 () SeekEntryResult!4582)

(assert (=> b!529480 (= res!325322 (or (= lt!244000 (MissingZero!4582 i!1204)) (= lt!244000 (MissingVacant!4582 i!1204))))))

(assert (=> b!529480 (= lt!244000 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!48096 res!325327) b!529474))

(assert (= (and b!529474 res!325326) b!529473))

(assert (= (and b!529473 res!325328) b!529476))

(assert (= (and b!529476 res!325325) b!529475))

(assert (= (and b!529475 res!325321) b!529480))

(assert (= (and b!529480 res!325322) b!529470))

(assert (= (and b!529470 res!325320) b!529478))

(assert (= (and b!529478 res!325318) b!529472))

(assert (= (and b!529472 res!325324) b!529477))

(assert (= (and b!529472 (not res!325319)) b!529471))

(assert (= (and b!529471 (not res!325323)) b!529479))

(declare-fun m!509473 () Bool)

(assert (=> b!529470 m!509473))

(declare-fun m!509475 () Bool)

(assert (=> b!529476 m!509475))

(declare-fun m!509477 () Bool)

(assert (=> b!529475 m!509477))

(declare-fun m!509479 () Bool)

(assert (=> b!529480 m!509479))

(declare-fun m!509481 () Bool)

(assert (=> b!529477 m!509481))

(assert (=> b!529477 m!509481))

(declare-fun m!509483 () Bool)

(assert (=> b!529477 m!509483))

(declare-fun m!509485 () Bool)

(assert (=> b!529472 m!509485))

(declare-fun m!509487 () Bool)

(assert (=> b!529472 m!509487))

(assert (=> b!529472 m!509481))

(declare-fun m!509489 () Bool)

(assert (=> b!529472 m!509489))

(assert (=> b!529472 m!509481))

(declare-fun m!509491 () Bool)

(assert (=> b!529472 m!509491))

(assert (=> b!529472 m!509487))

(declare-fun m!509493 () Bool)

(assert (=> b!529472 m!509493))

(assert (=> b!529472 m!509481))

(declare-fun m!509495 () Bool)

(assert (=> b!529472 m!509495))

(assert (=> b!529472 m!509487))

(declare-fun m!509497 () Bool)

(assert (=> b!529472 m!509497))

(declare-fun m!509499 () Bool)

(assert (=> b!529472 m!509499))

(declare-fun m!509501 () Bool)

(assert (=> b!529478 m!509501))

(declare-fun m!509503 () Bool)

(assert (=> start!48096 m!509503))

(declare-fun m!509505 () Bool)

(assert (=> start!48096 m!509505))

(assert (=> b!529473 m!509481))

(assert (=> b!529473 m!509481))

(declare-fun m!509507 () Bool)

(assert (=> b!529473 m!509507))

(check-sat (not b!529478) (not b!529475) (not b!529476) (not b!529480) (not start!48096) (not b!529472) (not b!529477) (not b!529473) (not b!529470))
(check-sat)
