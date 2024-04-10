; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26608 () Bool)

(assert start!26608)

(declare-fun b!276252 () Bool)

(declare-fun res!140242 () Bool)

(declare-fun e!176513 () Bool)

(assert (=> b!276252 (=> (not res!140242) (not e!176513))))

(declare-datatypes ((array!13705 0))(
  ( (array!13706 (arr!6502 (Array (_ BitVec 32) (_ BitVec 64))) (size!6854 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13705)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276252 (= res!140242 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140243 () Bool)

(assert (=> start!26608 (=> (not res!140243) (not e!176513))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26608 (= res!140243 (validMask!0 mask!3868))))

(assert (=> start!26608 e!176513))

(declare-fun array_inv!4465 (array!13705) Bool)

(assert (=> start!26608 (array_inv!4465 a!3325)))

(assert (=> start!26608 true))

(declare-fun b!276253 () Bool)

(declare-fun res!140244 () Bool)

(assert (=> b!276253 (=> (not res!140244) (not e!176513))))

(declare-datatypes ((List!4310 0))(
  ( (Nil!4307) (Cons!4306 (h!4973 (_ BitVec 64)) (t!9392 List!4310)) )
))
(declare-fun arrayNoDuplicates!0 (array!13705 (_ BitVec 32) List!4310) Bool)

(assert (=> b!276253 (= res!140244 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4307))))

(declare-fun b!276254 () Bool)

(declare-fun e!176511 () Bool)

(assert (=> b!276254 (= e!176511 false)))

(declare-fun lt!137581 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13705 (_ BitVec 32)) Bool)

(assert (=> b!276254 (= lt!137581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276255 () Bool)

(declare-fun res!140246 () Bool)

(assert (=> b!276255 (=> (not res!140246) (not e!176513))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276255 (= res!140246 (and (= (size!6854 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6854 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6854 a!3325))))))

(declare-fun b!276256 () Bool)

(declare-fun res!140245 () Bool)

(assert (=> b!276256 (=> (not res!140245) (not e!176513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276256 (= res!140245 (validKeyInArray!0 k!2581))))

(declare-fun b!276257 () Bool)

(assert (=> b!276257 (= e!176513 e!176511)))

(declare-fun res!140247 () Bool)

(assert (=> b!276257 (=> (not res!140247) (not e!176511))))

(declare-datatypes ((SeekEntryResult!1660 0))(
  ( (MissingZero!1660 (index!8810 (_ BitVec 32))) (Found!1660 (index!8811 (_ BitVec 32))) (Intermediate!1660 (undefined!2472 Bool) (index!8812 (_ BitVec 32)) (x!27073 (_ BitVec 32))) (Undefined!1660) (MissingVacant!1660 (index!8813 (_ BitVec 32))) )
))
(declare-fun lt!137580 () SeekEntryResult!1660)

(assert (=> b!276257 (= res!140247 (or (= lt!137580 (MissingZero!1660 i!1267)) (= lt!137580 (MissingVacant!1660 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13705 (_ BitVec 32)) SeekEntryResult!1660)

(assert (=> b!276257 (= lt!137580 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26608 res!140243) b!276255))

(assert (= (and b!276255 res!140246) b!276256))

(assert (= (and b!276256 res!140245) b!276253))

(assert (= (and b!276253 res!140244) b!276252))

(assert (= (and b!276252 res!140242) b!276257))

(assert (= (and b!276257 res!140247) b!276254))

(declare-fun m!291631 () Bool)

(assert (=> b!276257 m!291631))

(declare-fun m!291633 () Bool)

(assert (=> b!276256 m!291633))

(declare-fun m!291635 () Bool)

(assert (=> start!26608 m!291635))

(declare-fun m!291637 () Bool)

(assert (=> start!26608 m!291637))

(declare-fun m!291639 () Bool)

(assert (=> b!276254 m!291639))

(declare-fun m!291641 () Bool)

(assert (=> b!276253 m!291641))

(declare-fun m!291643 () Bool)

(assert (=> b!276252 m!291643))

(push 1)

(assert (not b!276252))

(assert (not b!276256))

(assert (not b!276253))

(assert (not start!26608))

