; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26642 () Bool)

(assert start!26642)

(declare-fun b!276402 () Bool)

(declare-fun res!140445 () Bool)

(declare-fun e!176555 () Bool)

(assert (=> b!276402 (=> (not res!140445) (not e!176555))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276402 (= res!140445 (validKeyInArray!0 k0!2581))))

(declare-fun b!276403 () Bool)

(declare-fun res!140446 () Bool)

(assert (=> b!276403 (=> (not res!140446) (not e!176555))))

(declare-datatypes ((array!13728 0))(
  ( (array!13729 (arr!6513 (Array (_ BitVec 32) (_ BitVec 64))) (size!6866 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13728)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276403 (= res!140446 (and (= (size!6866 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6866 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6866 a!3325))))))

(declare-fun b!276404 () Bool)

(declare-fun res!140447 () Bool)

(assert (=> b!276404 (=> (not res!140447) (not e!176555))))

(declare-fun arrayContainsKey!0 (array!13728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276404 (= res!140447 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140444 () Bool)

(assert (=> start!26642 (=> (not res!140444) (not e!176555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26642 (= res!140444 (validMask!0 mask!3868))))

(assert (=> start!26642 e!176555))

(declare-fun array_inv!4485 (array!13728) Bool)

(assert (=> start!26642 (array_inv!4485 a!3325)))

(assert (=> start!26642 true))

(declare-fun b!276405 () Bool)

(declare-fun res!140448 () Bool)

(assert (=> b!276405 (=> (not res!140448) (not e!176555))))

(declare-datatypes ((List!4294 0))(
  ( (Nil!4291) (Cons!4290 (h!4957 (_ BitVec 64)) (t!9367 List!4294)) )
))
(declare-fun arrayNoDuplicates!0 (array!13728 (_ BitVec 32) List!4294) Bool)

(assert (=> b!276405 (= res!140448 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4291))))

(declare-fun b!276406 () Bool)

(declare-fun e!176554 () Bool)

(assert (=> b!276406 (= e!176555 e!176554)))

(declare-fun res!140449 () Bool)

(assert (=> b!276406 (=> (not res!140449) (not e!176554))))

(declare-datatypes ((SeekEntryResult!1670 0))(
  ( (MissingZero!1670 (index!8850 (_ BitVec 32))) (Found!1670 (index!8851 (_ BitVec 32))) (Intermediate!1670 (undefined!2482 Bool) (index!8852 (_ BitVec 32)) (x!27130 (_ BitVec 32))) (Undefined!1670) (MissingVacant!1670 (index!8853 (_ BitVec 32))) )
))
(declare-fun lt!137486 () SeekEntryResult!1670)

(assert (=> b!276406 (= res!140449 (or (= lt!137486 (MissingZero!1670 i!1267)) (= lt!137486 (MissingVacant!1670 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13728 (_ BitVec 32)) SeekEntryResult!1670)

(assert (=> b!276406 (= lt!137486 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276407 () Bool)

(assert (=> b!276407 (= e!176554 false)))

(declare-fun lt!137487 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13728 (_ BitVec 32)) Bool)

(assert (=> b!276407 (= lt!137487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26642 res!140444) b!276403))

(assert (= (and b!276403 res!140446) b!276402))

(assert (= (and b!276402 res!140445) b!276405))

(assert (= (and b!276405 res!140448) b!276404))

(assert (= (and b!276404 res!140447) b!276406))

(assert (= (and b!276406 res!140449) b!276407))

(declare-fun m!291263 () Bool)

(assert (=> b!276407 m!291263))

(declare-fun m!291265 () Bool)

(assert (=> b!276402 m!291265))

(declare-fun m!291267 () Bool)

(assert (=> b!276404 m!291267))

(declare-fun m!291269 () Bool)

(assert (=> start!26642 m!291269))

(declare-fun m!291271 () Bool)

(assert (=> start!26642 m!291271))

(declare-fun m!291273 () Bool)

(assert (=> b!276405 m!291273))

(declare-fun m!291275 () Bool)

(assert (=> b!276406 m!291275))

(check-sat (not b!276406) (not b!276407) (not start!26642) (not b!276404) (not b!276405) (not b!276402))
(check-sat)
