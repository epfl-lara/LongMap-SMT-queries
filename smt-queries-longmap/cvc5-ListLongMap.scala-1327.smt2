; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26520 () Bool)

(assert start!26520)

(declare-fun b!275280 () Bool)

(declare-fun res!139271 () Bool)

(declare-fun e!176116 () Bool)

(assert (=> b!275280 (=> (not res!139271) (not e!176116))))

(declare-datatypes ((array!13617 0))(
  ( (array!13618 (arr!6458 (Array (_ BitVec 32) (_ BitVec 64))) (size!6810 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13617)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275280 (= res!139271 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275281 () Bool)

(declare-fun e!176117 () Bool)

(assert (=> b!275281 (= e!176117 false)))

(declare-fun lt!137334 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13617 (_ BitVec 32)) Bool)

(assert (=> b!275281 (= lt!137334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275282 () Bool)

(declare-fun res!139272 () Bool)

(assert (=> b!275282 (=> (not res!139272) (not e!176116))))

(declare-datatypes ((List!4266 0))(
  ( (Nil!4263) (Cons!4262 (h!4929 (_ BitVec 64)) (t!9348 List!4266)) )
))
(declare-fun arrayNoDuplicates!0 (array!13617 (_ BitVec 32) List!4266) Bool)

(assert (=> b!275282 (= res!139272 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4263))))

(declare-fun b!275283 () Bool)

(declare-fun res!139273 () Bool)

(assert (=> b!275283 (=> (not res!139273) (not e!176116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275283 (= res!139273 (validKeyInArray!0 k!2581))))

(declare-fun res!139274 () Bool)

(assert (=> start!26520 (=> (not res!139274) (not e!176116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26520 (= res!139274 (validMask!0 mask!3868))))

(assert (=> start!26520 e!176116))

(declare-fun array_inv!4421 (array!13617) Bool)

(assert (=> start!26520 (array_inv!4421 a!3325)))

(assert (=> start!26520 true))

(declare-fun b!275284 () Bool)

(declare-fun res!139270 () Bool)

(assert (=> b!275284 (=> (not res!139270) (not e!176116))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275284 (= res!139270 (and (= (size!6810 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6810 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6810 a!3325))))))

(declare-fun b!275285 () Bool)

(assert (=> b!275285 (= e!176116 e!176117)))

(declare-fun res!139275 () Bool)

(assert (=> b!275285 (=> (not res!139275) (not e!176117))))

(declare-datatypes ((SeekEntryResult!1616 0))(
  ( (MissingZero!1616 (index!8634 (_ BitVec 32))) (Found!1616 (index!8635 (_ BitVec 32))) (Intermediate!1616 (undefined!2428 Bool) (index!8636 (_ BitVec 32)) (x!26917 (_ BitVec 32))) (Undefined!1616) (MissingVacant!1616 (index!8637 (_ BitVec 32))) )
))
(declare-fun lt!137335 () SeekEntryResult!1616)

(assert (=> b!275285 (= res!139275 (or (= lt!137335 (MissingZero!1616 i!1267)) (= lt!137335 (MissingVacant!1616 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13617 (_ BitVec 32)) SeekEntryResult!1616)

(assert (=> b!275285 (= lt!137335 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26520 res!139274) b!275284))

(assert (= (and b!275284 res!139270) b!275283))

(assert (= (and b!275283 res!139273) b!275282))

(assert (= (and b!275282 res!139272) b!275280))

(assert (= (and b!275280 res!139271) b!275285))

(assert (= (and b!275285 res!139275) b!275281))

(declare-fun m!290883 () Bool)

(assert (=> b!275282 m!290883))

(declare-fun m!290885 () Bool)

(assert (=> start!26520 m!290885))

(declare-fun m!290887 () Bool)

(assert (=> start!26520 m!290887))

(declare-fun m!290889 () Bool)

(assert (=> b!275280 m!290889))

(declare-fun m!290891 () Bool)

(assert (=> b!275283 m!290891))

(declare-fun m!290893 () Bool)

(assert (=> b!275285 m!290893))

(declare-fun m!290895 () Bool)

(assert (=> b!275281 m!290895))

(push 1)

