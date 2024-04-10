; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26548 () Bool)

(assert start!26548)

(declare-fun b!275532 () Bool)

(declare-fun e!176242 () Bool)

(assert (=> b!275532 (= e!176242 false)))

(declare-fun lt!137419 () Bool)

(declare-datatypes ((array!13645 0))(
  ( (array!13646 (arr!6472 (Array (_ BitVec 32) (_ BitVec 64))) (size!6824 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13645)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13645 (_ BitVec 32)) Bool)

(assert (=> b!275532 (= lt!137419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275533 () Bool)

(declare-fun res!139524 () Bool)

(declare-fun e!176241 () Bool)

(assert (=> b!275533 (=> (not res!139524) (not e!176241))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275533 (= res!139524 (and (= (size!6824 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6824 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6824 a!3325))))))

(declare-fun b!275534 () Bool)

(assert (=> b!275534 (= e!176241 e!176242)))

(declare-fun res!139523 () Bool)

(assert (=> b!275534 (=> (not res!139523) (not e!176242))))

(declare-datatypes ((SeekEntryResult!1630 0))(
  ( (MissingZero!1630 (index!8690 (_ BitVec 32))) (Found!1630 (index!8691 (_ BitVec 32))) (Intermediate!1630 (undefined!2442 Bool) (index!8692 (_ BitVec 32)) (x!26963 (_ BitVec 32))) (Undefined!1630) (MissingVacant!1630 (index!8693 (_ BitVec 32))) )
))
(declare-fun lt!137418 () SeekEntryResult!1630)

(assert (=> b!275534 (= res!139523 (or (= lt!137418 (MissingZero!1630 i!1267)) (= lt!137418 (MissingVacant!1630 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13645 (_ BitVec 32)) SeekEntryResult!1630)

(assert (=> b!275534 (= lt!137418 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275535 () Bool)

(declare-fun res!139526 () Bool)

(assert (=> b!275535 (=> (not res!139526) (not e!176241))))

(declare-datatypes ((List!4280 0))(
  ( (Nil!4277) (Cons!4276 (h!4943 (_ BitVec 64)) (t!9362 List!4280)) )
))
(declare-fun arrayNoDuplicates!0 (array!13645 (_ BitVec 32) List!4280) Bool)

(assert (=> b!275535 (= res!139526 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4277))))

(declare-fun b!275536 () Bool)

(declare-fun res!139527 () Bool)

(assert (=> b!275536 (=> (not res!139527) (not e!176241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275536 (= res!139527 (validKeyInArray!0 k!2581))))

(declare-fun b!275537 () Bool)

(declare-fun res!139525 () Bool)

(assert (=> b!275537 (=> (not res!139525) (not e!176241))))

(declare-fun arrayContainsKey!0 (array!13645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275537 (= res!139525 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139522 () Bool)

(assert (=> start!26548 (=> (not res!139522) (not e!176241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26548 (= res!139522 (validMask!0 mask!3868))))

(assert (=> start!26548 e!176241))

(declare-fun array_inv!4435 (array!13645) Bool)

(assert (=> start!26548 (array_inv!4435 a!3325)))

(assert (=> start!26548 true))

(assert (= (and start!26548 res!139522) b!275533))

(assert (= (and b!275533 res!139524) b!275536))

(assert (= (and b!275536 res!139527) b!275535))

(assert (= (and b!275535 res!139526) b!275537))

(assert (= (and b!275537 res!139525) b!275534))

(assert (= (and b!275534 res!139523) b!275532))

(declare-fun m!291079 () Bool)

(assert (=> start!26548 m!291079))

(declare-fun m!291081 () Bool)

(assert (=> start!26548 m!291081))

(declare-fun m!291083 () Bool)

(assert (=> b!275537 m!291083))

(declare-fun m!291085 () Bool)

(assert (=> b!275534 m!291085))

(declare-fun m!291087 () Bool)

(assert (=> b!275535 m!291087))

(declare-fun m!291089 () Bool)

(assert (=> b!275532 m!291089))

(declare-fun m!291091 () Bool)

(assert (=> b!275536 m!291091))

(push 1)

(assert (not b!275532))

(assert (not b!275534))

(assert (not b!275537))

(assert (not start!26548))

(assert (not b!275536))

(assert (not b!275535))

(check-sat)

