; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26532 () Bool)

(assert start!26532)

(declare-fun b!275388 () Bool)

(declare-fun e!176170 () Bool)

(declare-fun e!176171 () Bool)

(assert (=> b!275388 (= e!176170 e!176171)))

(declare-fun res!139378 () Bool)

(assert (=> b!275388 (=> (not res!139378) (not e!176171))))

(declare-datatypes ((SeekEntryResult!1622 0))(
  ( (MissingZero!1622 (index!8658 (_ BitVec 32))) (Found!1622 (index!8659 (_ BitVec 32))) (Intermediate!1622 (undefined!2434 Bool) (index!8660 (_ BitVec 32)) (x!26939 (_ BitVec 32))) (Undefined!1622) (MissingVacant!1622 (index!8661 (_ BitVec 32))) )
))
(declare-fun lt!137371 () SeekEntryResult!1622)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275388 (= res!139378 (or (= lt!137371 (MissingZero!1622 i!1267)) (= lt!137371 (MissingVacant!1622 i!1267))))))

(declare-datatypes ((array!13629 0))(
  ( (array!13630 (arr!6464 (Array (_ BitVec 32) (_ BitVec 64))) (size!6816 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13629)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13629 (_ BitVec 32)) SeekEntryResult!1622)

(assert (=> b!275388 (= lt!137371 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!139380 () Bool)

(assert (=> start!26532 (=> (not res!139380) (not e!176170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26532 (= res!139380 (validMask!0 mask!3868))))

(assert (=> start!26532 e!176170))

(declare-fun array_inv!4427 (array!13629) Bool)

(assert (=> start!26532 (array_inv!4427 a!3325)))

(assert (=> start!26532 true))

(declare-fun b!275389 () Bool)

(declare-fun res!139379 () Bool)

(assert (=> b!275389 (=> (not res!139379) (not e!176170))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275389 (= res!139379 (and (= (size!6816 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6816 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6816 a!3325))))))

(declare-fun b!275390 () Bool)

(declare-fun res!139381 () Bool)

(assert (=> b!275390 (=> (not res!139381) (not e!176170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275390 (= res!139381 (validKeyInArray!0 k!2581))))

(declare-fun b!275391 () Bool)

(assert (=> b!275391 (= e!176171 false)))

(declare-fun lt!137370 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13629 (_ BitVec 32)) Bool)

(assert (=> b!275391 (= lt!137370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275392 () Bool)

(declare-fun res!139382 () Bool)

(assert (=> b!275392 (=> (not res!139382) (not e!176170))))

(declare-fun arrayContainsKey!0 (array!13629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275392 (= res!139382 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275393 () Bool)

(declare-fun res!139383 () Bool)

(assert (=> b!275393 (=> (not res!139383) (not e!176170))))

(declare-datatypes ((List!4272 0))(
  ( (Nil!4269) (Cons!4268 (h!4935 (_ BitVec 64)) (t!9354 List!4272)) )
))
(declare-fun arrayNoDuplicates!0 (array!13629 (_ BitVec 32) List!4272) Bool)

(assert (=> b!275393 (= res!139383 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4269))))

(assert (= (and start!26532 res!139380) b!275389))

(assert (= (and b!275389 res!139379) b!275390))

(assert (= (and b!275390 res!139381) b!275393))

(assert (= (and b!275393 res!139383) b!275392))

(assert (= (and b!275392 res!139382) b!275388))

(assert (= (and b!275388 res!139378) b!275391))

(declare-fun m!290967 () Bool)

(assert (=> b!275393 m!290967))

(declare-fun m!290969 () Bool)

(assert (=> b!275392 m!290969))

(declare-fun m!290971 () Bool)

(assert (=> b!275390 m!290971))

(declare-fun m!290973 () Bool)

(assert (=> start!26532 m!290973))

(declare-fun m!290975 () Bool)

(assert (=> start!26532 m!290975))

(declare-fun m!290977 () Bool)

(assert (=> b!275391 m!290977))

(declare-fun m!290979 () Bool)

(assert (=> b!275388 m!290979))

(push 1)

