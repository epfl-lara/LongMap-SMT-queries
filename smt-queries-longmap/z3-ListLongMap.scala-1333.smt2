; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26558 () Bool)

(assert start!26558)

(declare-fun b!275501 () Bool)

(declare-fun res!139549 () Bool)

(declare-fun e!176178 () Bool)

(assert (=> b!275501 (=> (not res!139549) (not e!176178))))

(declare-datatypes ((array!13644 0))(
  ( (array!13645 (arr!6471 (Array (_ BitVec 32) (_ BitVec 64))) (size!6824 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13644)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13644 (_ BitVec 32)) Bool)

(assert (=> b!275501 (= res!139549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275502 () Bool)

(declare-fun res!139552 () Bool)

(declare-fun e!176176 () Bool)

(assert (=> b!275502 (=> (not res!139552) (not e!176176))))

(declare-datatypes ((List!4252 0))(
  ( (Nil!4249) (Cons!4248 (h!4915 (_ BitVec 64)) (t!9325 List!4252)) )
))
(declare-fun arrayNoDuplicates!0 (array!13644 (_ BitVec 32) List!4252) Bool)

(assert (=> b!275502 (= res!139552 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4249))))

(declare-fun b!275503 () Bool)

(assert (=> b!275503 (= e!176176 e!176178)))

(declare-fun res!139543 () Bool)

(assert (=> b!275503 (=> (not res!139543) (not e!176178))))

(declare-datatypes ((SeekEntryResult!1628 0))(
  ( (MissingZero!1628 (index!8682 (_ BitVec 32))) (Found!1628 (index!8683 (_ BitVec 32))) (Intermediate!1628 (undefined!2440 Bool) (index!8684 (_ BitVec 32)) (x!26976 (_ BitVec 32))) (Undefined!1628) (MissingVacant!1628 (index!8685 (_ BitVec 32))) )
))
(declare-fun lt!137261 () SeekEntryResult!1628)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275503 (= res!139543 (or (= lt!137261 (MissingZero!1628 i!1267)) (= lt!137261 (MissingVacant!1628 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13644 (_ BitVec 32)) SeekEntryResult!1628)

(assert (=> b!275503 (= lt!137261 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275504 () Bool)

(declare-fun res!139544 () Bool)

(assert (=> b!275504 (=> (not res!139544) (not e!176176))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275504 (= res!139544 (and (= (size!6824 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6824 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6824 a!3325))))))

(declare-fun b!275505 () Bool)

(declare-fun res!139546 () Bool)

(assert (=> b!275505 (=> (not res!139546) (not e!176178))))

(assert (=> b!275505 (= res!139546 (and (bvslt startIndex!26 (bvsub (size!6824 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun res!139548 () Bool)

(assert (=> start!26558 (=> (not res!139548) (not e!176176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26558 (= res!139548 (validMask!0 mask!3868))))

(assert (=> start!26558 e!176176))

(declare-fun array_inv!4443 (array!13644) Bool)

(assert (=> start!26558 (array_inv!4443 a!3325)))

(assert (=> start!26558 true))

(declare-fun b!275506 () Bool)

(declare-fun res!139551 () Bool)

(assert (=> b!275506 (=> (not res!139551) (not e!176178))))

(assert (=> b!275506 (= res!139551 (not (= startIndex!26 i!1267)))))

(declare-fun b!275507 () Bool)

(assert (=> b!275507 (= e!176178 (not true))))

(assert (=> b!275507 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13645 (store (arr!6471 a!3325) i!1267 k0!2581) (size!6824 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8637 0))(
  ( (Unit!8638) )
))
(declare-fun lt!137262 () Unit!8637)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13644 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8637)

(assert (=> b!275507 (= lt!137262 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275508 () Bool)

(declare-fun res!139547 () Bool)

(assert (=> b!275508 (=> (not res!139547) (not e!176176))))

(declare-fun arrayContainsKey!0 (array!13644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275508 (= res!139547 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275509 () Bool)

(declare-fun res!139550 () Bool)

(assert (=> b!275509 (=> (not res!139550) (not e!176178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275509 (= res!139550 (not (validKeyInArray!0 (select (arr!6471 a!3325) startIndex!26))))))

(declare-fun b!275510 () Bool)

(declare-fun res!139545 () Bool)

(assert (=> b!275510 (=> (not res!139545) (not e!176176))))

(assert (=> b!275510 (= res!139545 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26558 res!139548) b!275504))

(assert (= (and b!275504 res!139544) b!275510))

(assert (= (and b!275510 res!139545) b!275502))

(assert (= (and b!275502 res!139552) b!275508))

(assert (= (and b!275508 res!139547) b!275503))

(assert (= (and b!275503 res!139543) b!275501))

(assert (= (and b!275501 res!139549) b!275506))

(assert (= (and b!275506 res!139551) b!275509))

(assert (= (and b!275509 res!139550) b!275505))

(assert (= (and b!275505 res!139546) b!275507))

(declare-fun m!290573 () Bool)

(assert (=> b!275501 m!290573))

(declare-fun m!290575 () Bool)

(assert (=> b!275507 m!290575))

(declare-fun m!290577 () Bool)

(assert (=> b!275507 m!290577))

(declare-fun m!290579 () Bool)

(assert (=> b!275507 m!290579))

(declare-fun m!290581 () Bool)

(assert (=> b!275509 m!290581))

(assert (=> b!275509 m!290581))

(declare-fun m!290583 () Bool)

(assert (=> b!275509 m!290583))

(declare-fun m!290585 () Bool)

(assert (=> b!275503 m!290585))

(declare-fun m!290587 () Bool)

(assert (=> b!275502 m!290587))

(declare-fun m!290589 () Bool)

(assert (=> start!26558 m!290589))

(declare-fun m!290591 () Bool)

(assert (=> start!26558 m!290591))

(declare-fun m!290593 () Bool)

(assert (=> b!275510 m!290593))

(declare-fun m!290595 () Bool)

(assert (=> b!275508 m!290595))

(check-sat (not b!275502) (not b!275503) (not b!275509) (not b!275501) (not b!275507) (not b!275508) (not b!275510) (not start!26558))
(check-sat)
