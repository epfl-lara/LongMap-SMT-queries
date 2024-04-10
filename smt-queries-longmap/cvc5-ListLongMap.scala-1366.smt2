; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26850 () Bool)

(assert start!26850)

(declare-fun b!278550 () Bool)

(declare-fun res!141984 () Bool)

(declare-fun e!177669 () Bool)

(assert (=> b!278550 (=> (not res!141984) (not e!177669))))

(declare-datatypes ((array!13854 0))(
  ( (array!13855 (arr!6575 (Array (_ BitVec 32) (_ BitVec 64))) (size!6927 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13854)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!278550 (= res!141984 (and (= (size!6927 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6927 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6927 a!3325))))))

(declare-fun b!278551 () Bool)

(declare-fun res!141980 () Bool)

(assert (=> b!278551 (=> (not res!141980) (not e!177669))))

(declare-datatypes ((List!4383 0))(
  ( (Nil!4380) (Cons!4379 (h!5049 (_ BitVec 64)) (t!9465 List!4383)) )
))
(declare-fun arrayNoDuplicates!0 (array!13854 (_ BitVec 32) List!4383) Bool)

(assert (=> b!278551 (= res!141980 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4380))))

(declare-fun b!278553 () Bool)

(declare-fun e!177671 () Bool)

(assert (=> b!278553 (= e!177671 false)))

(declare-fun lt!138415 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13854 (_ BitVec 32)) Bool)

(assert (=> b!278553 (= lt!138415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278554 () Bool)

(declare-fun res!141983 () Bool)

(assert (=> b!278554 (=> (not res!141983) (not e!177669))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278554 (= res!141983 (validKeyInArray!0 k!2581))))

(declare-fun b!278555 () Bool)

(assert (=> b!278555 (= e!177669 e!177671)))

(declare-fun res!141979 () Bool)

(assert (=> b!278555 (=> (not res!141979) (not e!177671))))

(declare-datatypes ((SeekEntryResult!1733 0))(
  ( (MissingZero!1733 (index!9102 (_ BitVec 32))) (Found!1733 (index!9103 (_ BitVec 32))) (Intermediate!1733 (undefined!2545 Bool) (index!9104 (_ BitVec 32)) (x!27355 (_ BitVec 32))) (Undefined!1733) (MissingVacant!1733 (index!9105 (_ BitVec 32))) )
))
(declare-fun lt!138414 () SeekEntryResult!1733)

(assert (=> b!278555 (= res!141979 (or (= lt!138414 (MissingZero!1733 i!1267)) (= lt!138414 (MissingVacant!1733 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13854 (_ BitVec 32)) SeekEntryResult!1733)

(assert (=> b!278555 (= lt!138414 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!141982 () Bool)

(assert (=> start!26850 (=> (not res!141982) (not e!177669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26850 (= res!141982 (validMask!0 mask!3868))))

(assert (=> start!26850 e!177669))

(declare-fun array_inv!4538 (array!13854) Bool)

(assert (=> start!26850 (array_inv!4538 a!3325)))

(assert (=> start!26850 true))

(declare-fun b!278552 () Bool)

(declare-fun res!141981 () Bool)

(assert (=> b!278552 (=> (not res!141981) (not e!177669))))

(declare-fun arrayContainsKey!0 (array!13854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278552 (= res!141981 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26850 res!141982) b!278550))

(assert (= (and b!278550 res!141984) b!278554))

(assert (= (and b!278554 res!141983) b!278551))

(assert (= (and b!278551 res!141980) b!278552))

(assert (= (and b!278552 res!141981) b!278555))

(assert (= (and b!278555 res!141979) b!278553))

(declare-fun m!293595 () Bool)

(assert (=> b!278553 m!293595))

(declare-fun m!293597 () Bool)

(assert (=> b!278554 m!293597))

(declare-fun m!293599 () Bool)

(assert (=> b!278551 m!293599))

(declare-fun m!293601 () Bool)

(assert (=> b!278555 m!293601))

(declare-fun m!293603 () Bool)

(assert (=> b!278552 m!293603))

(declare-fun m!293605 () Bool)

(assert (=> start!26850 m!293605))

(declare-fun m!293607 () Bool)

(assert (=> start!26850 m!293607))

(push 1)

(assert (not b!278552))

(assert (not b!278554))

(assert (not start!26850))

(assert (not b!278551))

(assert (not b!278553))

(assert (not b!278555))

