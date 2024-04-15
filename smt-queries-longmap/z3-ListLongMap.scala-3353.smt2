; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46098 () Bool)

(assert start!46098)

(declare-fun b!510512 () Bool)

(declare-fun e!298347 () Bool)

(declare-fun e!298345 () Bool)

(assert (=> b!510512 (= e!298347 e!298345)))

(declare-fun res!311504 () Bool)

(assert (=> b!510512 (=> (not res!311504) (not e!298345))))

(declare-datatypes ((SeekEntryResult!4252 0))(
  ( (MissingZero!4252 (index!19196 (_ BitVec 32))) (Found!4252 (index!19197 (_ BitVec 32))) (Intermediate!4252 (undefined!5064 Bool) (index!19198 (_ BitVec 32)) (x!48160 (_ BitVec 32))) (Undefined!4252) (MissingVacant!4252 (index!19199 (_ BitVec 32))) )
))
(declare-fun lt!233383 () SeekEntryResult!4252)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510512 (= res!311504 (or (= lt!233383 (MissingZero!4252 i!1204)) (= lt!233383 (MissingVacant!4252 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32819 0))(
  ( (array!32820 (arr!15788 (Array (_ BitVec 32) (_ BitVec 64))) (size!16153 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32819)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32819 (_ BitVec 32)) SeekEntryResult!4252)

(assert (=> b!510512 (= lt!233383 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510513 () Bool)

(declare-fun res!311500 () Bool)

(assert (=> b!510513 (=> (not res!311500) (not e!298347))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510513 (= res!311500 (and (= (size!16153 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16153 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16153 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510514 () Bool)

(declare-fun res!311507 () Bool)

(assert (=> b!510514 (=> (not res!311507) (not e!298347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510514 (= res!311507 (validKeyInArray!0 (select (arr!15788 a!3235) j!176)))))

(declare-fun b!510515 () Bool)

(declare-fun res!311505 () Bool)

(assert (=> b!510515 (=> (not res!311505) (not e!298347))))

(assert (=> b!510515 (= res!311505 (validKeyInArray!0 k0!2280))))

(declare-fun e!298344 () Bool)

(declare-fun b!510516 () Bool)

(assert (=> b!510516 (= e!298344 (= (seekEntryOrOpen!0 (select (arr!15788 a!3235) j!176) a!3235 mask!3524) (Found!4252 j!176)))))

(declare-fun res!311501 () Bool)

(assert (=> start!46098 (=> (not res!311501) (not e!298347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46098 (= res!311501 (validMask!0 mask!3524))))

(assert (=> start!46098 e!298347))

(assert (=> start!46098 true))

(declare-fun array_inv!11671 (array!32819) Bool)

(assert (=> start!46098 (array_inv!11671 a!3235)))

(declare-fun b!510517 () Bool)

(declare-fun res!311502 () Bool)

(assert (=> b!510517 (=> (not res!311502) (not e!298345))))

(declare-datatypes ((List!9985 0))(
  ( (Nil!9982) (Cons!9981 (h!10858 (_ BitVec 64)) (t!16204 List!9985)) )
))
(declare-fun arrayNoDuplicates!0 (array!32819 (_ BitVec 32) List!9985) Bool)

(assert (=> b!510517 (= res!311502 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9982))))

(declare-fun b!510518 () Bool)

(assert (=> b!510518 (= e!298345 (not true))))

(declare-fun lt!233380 () (_ BitVec 32))

(declare-fun lt!233382 () SeekEntryResult!4252)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32819 (_ BitVec 32)) SeekEntryResult!4252)

(assert (=> b!510518 (= lt!233382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233380 (select (store (arr!15788 a!3235) i!1204 k0!2280) j!176) (array!32820 (store (arr!15788 a!3235) i!1204 k0!2280) (size!16153 a!3235)) mask!3524))))

(declare-fun lt!233378 () (_ BitVec 32))

(declare-fun lt!233381 () SeekEntryResult!4252)

(assert (=> b!510518 (= lt!233381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233378 (select (arr!15788 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510518 (= lt!233380 (toIndex!0 (select (store (arr!15788 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510518 (= lt!233378 (toIndex!0 (select (arr!15788 a!3235) j!176) mask!3524))))

(assert (=> b!510518 e!298344))

(declare-fun res!311499 () Bool)

(assert (=> b!510518 (=> (not res!311499) (not e!298344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32819 (_ BitVec 32)) Bool)

(assert (=> b!510518 (= res!311499 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15748 0))(
  ( (Unit!15749) )
))
(declare-fun lt!233379 () Unit!15748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15748)

(assert (=> b!510518 (= lt!233379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510519 () Bool)

(declare-fun res!311503 () Bool)

(assert (=> b!510519 (=> (not res!311503) (not e!298347))))

(declare-fun arrayContainsKey!0 (array!32819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510519 (= res!311503 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510520 () Bool)

(declare-fun res!311506 () Bool)

(assert (=> b!510520 (=> (not res!311506) (not e!298345))))

(assert (=> b!510520 (= res!311506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46098 res!311501) b!510513))

(assert (= (and b!510513 res!311500) b!510514))

(assert (= (and b!510514 res!311507) b!510515))

(assert (= (and b!510515 res!311505) b!510519))

(assert (= (and b!510519 res!311503) b!510512))

(assert (= (and b!510512 res!311504) b!510520))

(assert (= (and b!510520 res!311506) b!510517))

(assert (= (and b!510517 res!311502) b!510518))

(assert (= (and b!510518 res!311499) b!510516))

(declare-fun m!491461 () Bool)

(assert (=> b!510516 m!491461))

(assert (=> b!510516 m!491461))

(declare-fun m!491463 () Bool)

(assert (=> b!510516 m!491463))

(declare-fun m!491465 () Bool)

(assert (=> b!510515 m!491465))

(declare-fun m!491467 () Bool)

(assert (=> b!510519 m!491467))

(declare-fun m!491469 () Bool)

(assert (=> b!510517 m!491469))

(declare-fun m!491471 () Bool)

(assert (=> b!510518 m!491471))

(declare-fun m!491473 () Bool)

(assert (=> b!510518 m!491473))

(declare-fun m!491475 () Bool)

(assert (=> b!510518 m!491475))

(assert (=> b!510518 m!491475))

(declare-fun m!491477 () Bool)

(assert (=> b!510518 m!491477))

(assert (=> b!510518 m!491461))

(declare-fun m!491479 () Bool)

(assert (=> b!510518 m!491479))

(assert (=> b!510518 m!491461))

(declare-fun m!491481 () Bool)

(assert (=> b!510518 m!491481))

(assert (=> b!510518 m!491475))

(declare-fun m!491483 () Bool)

(assert (=> b!510518 m!491483))

(assert (=> b!510518 m!491461))

(declare-fun m!491485 () Bool)

(assert (=> b!510518 m!491485))

(declare-fun m!491487 () Bool)

(assert (=> start!46098 m!491487))

(declare-fun m!491489 () Bool)

(assert (=> start!46098 m!491489))

(assert (=> b!510514 m!491461))

(assert (=> b!510514 m!491461))

(declare-fun m!491491 () Bool)

(assert (=> b!510514 m!491491))

(declare-fun m!491493 () Bool)

(assert (=> b!510520 m!491493))

(declare-fun m!491495 () Bool)

(assert (=> b!510512 m!491495))

(check-sat (not b!510515) (not b!510512) (not b!510516) (not b!510518) (not b!510517) (not b!510519) (not start!46098) (not b!510520) (not b!510514))
(check-sat)
