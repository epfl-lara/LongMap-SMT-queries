; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44688 () Bool)

(assert start!44688)

(declare-fun res!293316 () Bool)

(declare-fun e!288279 () Bool)

(assert (=> start!44688 (=> (not res!293316) (not e!288279))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44688 (= res!293316 (validMask!0 mask!3524))))

(assert (=> start!44688 e!288279))

(assert (=> start!44688 true))

(declare-datatypes ((array!31747 0))(
  ( (array!31748 (arr!15261 (Array (_ BitVec 32) (_ BitVec 64))) (size!15625 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31747)

(declare-fun array_inv!11057 (array!31747) Bool)

(assert (=> start!44688 (array_inv!11057 a!3235)))

(declare-fun b!490380 () Bool)

(declare-fun e!288280 () Bool)

(assert (=> b!490380 (= e!288280 (not true))))

(declare-datatypes ((SeekEntryResult!3728 0))(
  ( (MissingZero!3728 (index!17091 (_ BitVec 32))) (Found!3728 (index!17092 (_ BitVec 32))) (Intermediate!3728 (undefined!4540 Bool) (index!17093 (_ BitVec 32)) (x!46194 (_ BitVec 32))) (Undefined!3728) (MissingVacant!3728 (index!17094 (_ BitVec 32))) )
))
(declare-fun lt!221458 () SeekEntryResult!3728)

(declare-fun lt!221457 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31747 (_ BitVec 32)) SeekEntryResult!3728)

(assert (=> b!490380 (= lt!221458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221457 (select (store (arr!15261 a!3235) i!1204 k!2280) j!176) (array!31748 (store (arr!15261 a!3235) i!1204 k!2280) (size!15625 a!3235)) mask!3524))))

(declare-fun lt!221454 () SeekEntryResult!3728)

(declare-fun lt!221455 () (_ BitVec 32))

(assert (=> b!490380 (= lt!221454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221455 (select (arr!15261 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490380 (= lt!221457 (toIndex!0 (select (store (arr!15261 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490380 (= lt!221455 (toIndex!0 (select (arr!15261 a!3235) j!176) mask!3524))))

(declare-fun e!288281 () Bool)

(assert (=> b!490380 e!288281))

(declare-fun res!293324 () Bool)

(assert (=> b!490380 (=> (not res!293324) (not e!288281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31747 (_ BitVec 32)) Bool)

(assert (=> b!490380 (= res!293324 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14402 0))(
  ( (Unit!14403) )
))
(declare-fun lt!221453 () Unit!14402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14402)

(assert (=> b!490380 (= lt!221453 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490381 () Bool)

(declare-fun res!293317 () Bool)

(assert (=> b!490381 (=> (not res!293317) (not e!288279))))

(assert (=> b!490381 (= res!293317 (and (= (size!15625 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15625 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15625 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490382 () Bool)

(assert (=> b!490382 (= e!288279 e!288280)))

(declare-fun res!293319 () Bool)

(assert (=> b!490382 (=> (not res!293319) (not e!288280))))

(declare-fun lt!221456 () SeekEntryResult!3728)

(assert (=> b!490382 (= res!293319 (or (= lt!221456 (MissingZero!3728 i!1204)) (= lt!221456 (MissingVacant!3728 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31747 (_ BitVec 32)) SeekEntryResult!3728)

(assert (=> b!490382 (= lt!221456 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490383 () Bool)

(declare-fun res!293321 () Bool)

(assert (=> b!490383 (=> (not res!293321) (not e!288280))))

(declare-datatypes ((List!9419 0))(
  ( (Nil!9416) (Cons!9415 (h!10277 (_ BitVec 64)) (t!15647 List!9419)) )
))
(declare-fun arrayNoDuplicates!0 (array!31747 (_ BitVec 32) List!9419) Bool)

(assert (=> b!490383 (= res!293321 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9416))))

(declare-fun b!490384 () Bool)

(declare-fun res!293322 () Bool)

(assert (=> b!490384 (=> (not res!293322) (not e!288279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490384 (= res!293322 (validKeyInArray!0 k!2280))))

(declare-fun b!490385 () Bool)

(declare-fun res!293320 () Bool)

(assert (=> b!490385 (=> (not res!293320) (not e!288279))))

(assert (=> b!490385 (= res!293320 (validKeyInArray!0 (select (arr!15261 a!3235) j!176)))))

(declare-fun b!490386 () Bool)

(assert (=> b!490386 (= e!288281 (= (seekEntryOrOpen!0 (select (arr!15261 a!3235) j!176) a!3235 mask!3524) (Found!3728 j!176)))))

(declare-fun b!490387 () Bool)

(declare-fun res!293318 () Bool)

(assert (=> b!490387 (=> (not res!293318) (not e!288279))))

(declare-fun arrayContainsKey!0 (array!31747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490387 (= res!293318 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490388 () Bool)

(declare-fun res!293323 () Bool)

(assert (=> b!490388 (=> (not res!293323) (not e!288280))))

(assert (=> b!490388 (= res!293323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44688 res!293316) b!490381))

(assert (= (and b!490381 res!293317) b!490385))

(assert (= (and b!490385 res!293320) b!490384))

(assert (= (and b!490384 res!293322) b!490387))

(assert (= (and b!490387 res!293318) b!490382))

(assert (= (and b!490382 res!293319) b!490388))

(assert (= (and b!490388 res!293323) b!490383))

(assert (= (and b!490383 res!293321) b!490380))

(assert (= (and b!490380 res!293324) b!490386))

(declare-fun m!470469 () Bool)

(assert (=> b!490382 m!470469))

(declare-fun m!470471 () Bool)

(assert (=> b!490385 m!470471))

(assert (=> b!490385 m!470471))

(declare-fun m!470473 () Bool)

(assert (=> b!490385 m!470473))

(declare-fun m!470475 () Bool)

(assert (=> b!490388 m!470475))

(declare-fun m!470477 () Bool)

(assert (=> start!44688 m!470477))

(declare-fun m!470479 () Bool)

(assert (=> start!44688 m!470479))

(declare-fun m!470481 () Bool)

(assert (=> b!490383 m!470481))

(assert (=> b!490386 m!470471))

(assert (=> b!490386 m!470471))

(declare-fun m!470483 () Bool)

(assert (=> b!490386 m!470483))

(declare-fun m!470485 () Bool)

(assert (=> b!490384 m!470485))

(declare-fun m!470487 () Bool)

(assert (=> b!490387 m!470487))

(assert (=> b!490380 m!470471))

(declare-fun m!470489 () Bool)

(assert (=> b!490380 m!470489))

(declare-fun m!470491 () Bool)

(assert (=> b!490380 m!470491))

(declare-fun m!470493 () Bool)

(assert (=> b!490380 m!470493))

(declare-fun m!470495 () Bool)

(assert (=> b!490380 m!470495))

(declare-fun m!470497 () Bool)

(assert (=> b!490380 m!470497))

(assert (=> b!490380 m!470491))

(assert (=> b!490380 m!470471))

(declare-fun m!470499 () Bool)

(assert (=> b!490380 m!470499))

(assert (=> b!490380 m!470471))

(declare-fun m!470501 () Bool)

(assert (=> b!490380 m!470501))

(assert (=> b!490380 m!470491))

(declare-fun m!470503 () Bool)

(assert (=> b!490380 m!470503))

(push 1)

