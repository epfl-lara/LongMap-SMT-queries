; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44694 () Bool)

(assert start!44694)

(declare-fun res!293404 () Bool)

(declare-fun e!288317 () Bool)

(assert (=> start!44694 (=> (not res!293404) (not e!288317))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44694 (= res!293404 (validMask!0 mask!3524))))

(assert (=> start!44694 e!288317))

(assert (=> start!44694 true))

(declare-datatypes ((array!31753 0))(
  ( (array!31754 (arr!15264 (Array (_ BitVec 32) (_ BitVec 64))) (size!15628 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31753)

(declare-fun array_inv!11060 (array!31753) Bool)

(assert (=> start!44694 (array_inv!11060 a!3235)))

(declare-fun b!490461 () Bool)

(declare-fun e!288318 () Bool)

(assert (=> b!490461 (= e!288317 e!288318)))

(declare-fun res!293398 () Bool)

(assert (=> b!490461 (=> (not res!293398) (not e!288318))))

(declare-datatypes ((SeekEntryResult!3731 0))(
  ( (MissingZero!3731 (index!17103 (_ BitVec 32))) (Found!3731 (index!17104 (_ BitVec 32))) (Intermediate!3731 (undefined!4543 Bool) (index!17105 (_ BitVec 32)) (x!46205 (_ BitVec 32))) (Undefined!3731) (MissingVacant!3731 (index!17106 (_ BitVec 32))) )
))
(declare-fun lt!221510 () SeekEntryResult!3731)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490461 (= res!293398 (or (= lt!221510 (MissingZero!3731 i!1204)) (= lt!221510 (MissingVacant!3731 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31753 (_ BitVec 32)) SeekEntryResult!3731)

(assert (=> b!490461 (= lt!221510 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490462 () Bool)

(declare-fun res!293403 () Bool)

(assert (=> b!490462 (=> (not res!293403) (not e!288318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31753 (_ BitVec 32)) Bool)

(assert (=> b!490462 (= res!293403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490463 () Bool)

(declare-fun e!288315 () Bool)

(assert (=> b!490463 (= e!288318 (not e!288315))))

(declare-fun res!293402 () Bool)

(assert (=> b!490463 (=> res!293402 e!288315)))

(declare-fun lt!221511 () (_ BitVec 64))

(declare-fun lt!221512 () array!31753)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31753 (_ BitVec 32)) SeekEntryResult!3731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490463 (= res!293402 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15264 a!3235) j!176) mask!3524) (select (arr!15264 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221511 mask!3524) lt!221511 lt!221512 mask!3524))))))

(assert (=> b!490463 (= lt!221511 (select (store (arr!15264 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490463 (= lt!221512 (array!31754 (store (arr!15264 a!3235) i!1204 k!2280) (size!15628 a!3235)))))

(declare-fun lt!221509 () SeekEntryResult!3731)

(assert (=> b!490463 (= lt!221509 (Found!3731 j!176))))

(assert (=> b!490463 (= lt!221509 (seekEntryOrOpen!0 (select (arr!15264 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490463 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14408 0))(
  ( (Unit!14409) )
))
(declare-fun lt!221507 () Unit!14408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14408)

(assert (=> b!490463 (= lt!221507 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490464 () Bool)

(declare-fun res!293397 () Bool)

(assert (=> b!490464 (=> (not res!293397) (not e!288318))))

(declare-datatypes ((List!9422 0))(
  ( (Nil!9419) (Cons!9418 (h!10280 (_ BitVec 64)) (t!15650 List!9422)) )
))
(declare-fun arrayNoDuplicates!0 (array!31753 (_ BitVec 32) List!9422) Bool)

(assert (=> b!490464 (= res!293397 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9419))))

(declare-fun b!490465 () Bool)

(assert (=> b!490465 (= e!288315 true)))

(assert (=> b!490465 (= lt!221509 (seekEntryOrOpen!0 lt!221511 lt!221512 mask!3524))))

(declare-fun lt!221508 () Unit!14408)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14408)

(assert (=> b!490465 (= lt!221508 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490466 () Bool)

(declare-fun res!293401 () Bool)

(assert (=> b!490466 (=> (not res!293401) (not e!288317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490466 (= res!293401 (validKeyInArray!0 k!2280))))

(declare-fun b!490467 () Bool)

(declare-fun res!293400 () Bool)

(assert (=> b!490467 (=> (not res!293400) (not e!288317))))

(assert (=> b!490467 (= res!293400 (validKeyInArray!0 (select (arr!15264 a!3235) j!176)))))

(declare-fun b!490468 () Bool)

(declare-fun res!293405 () Bool)

(assert (=> b!490468 (=> (not res!293405) (not e!288317))))

(declare-fun arrayContainsKey!0 (array!31753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490468 (= res!293405 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490469 () Bool)

(declare-fun res!293399 () Bool)

(assert (=> b!490469 (=> (not res!293399) (not e!288317))))

(assert (=> b!490469 (= res!293399 (and (= (size!15628 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15628 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15628 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44694 res!293404) b!490469))

(assert (= (and b!490469 res!293399) b!490467))

(assert (= (and b!490467 res!293400) b!490466))

(assert (= (and b!490466 res!293401) b!490468))

(assert (= (and b!490468 res!293405) b!490461))

(assert (= (and b!490461 res!293398) b!490462))

(assert (= (and b!490462 res!293403) b!490464))

(assert (= (and b!490464 res!293397) b!490463))

(assert (= (and b!490463 (not res!293402)) b!490465))

(declare-fun m!470577 () Bool)

(assert (=> b!490467 m!470577))

(assert (=> b!490467 m!470577))

(declare-fun m!470579 () Bool)

(assert (=> b!490467 m!470579))

(declare-fun m!470581 () Bool)

(assert (=> b!490462 m!470581))

(declare-fun m!470583 () Bool)

(assert (=> b!490461 m!470583))

(declare-fun m!470585 () Bool)

(assert (=> start!44694 m!470585))

(declare-fun m!470587 () Bool)

(assert (=> start!44694 m!470587))

(declare-fun m!470589 () Bool)

(assert (=> b!490468 m!470589))

(declare-fun m!470591 () Bool)

(assert (=> b!490466 m!470591))

(declare-fun m!470593 () Bool)

(assert (=> b!490465 m!470593))

(declare-fun m!470595 () Bool)

(assert (=> b!490465 m!470595))

(declare-fun m!470597 () Bool)

(assert (=> b!490464 m!470597))

(declare-fun m!470599 () Bool)

(assert (=> b!490463 m!470599))

(declare-fun m!470601 () Bool)

(assert (=> b!490463 m!470601))

(declare-fun m!470603 () Bool)

(assert (=> b!490463 m!470603))

(declare-fun m!470605 () Bool)

(assert (=> b!490463 m!470605))

(assert (=> b!490463 m!470577))

(declare-fun m!470607 () Bool)

(assert (=> b!490463 m!470607))

(declare-fun m!470609 () Bool)

(assert (=> b!490463 m!470609))

(declare-fun m!470611 () Bool)

(assert (=> b!490463 m!470611))

(assert (=> b!490463 m!470577))

(assert (=> b!490463 m!470605))

(assert (=> b!490463 m!470577))

(declare-fun m!470613 () Bool)

(assert (=> b!490463 m!470613))

(assert (=> b!490463 m!470577))

(declare-fun m!470615 () Bool)

(assert (=> b!490463 m!470615))

(assert (=> b!490463 m!470609))

(push 1)

