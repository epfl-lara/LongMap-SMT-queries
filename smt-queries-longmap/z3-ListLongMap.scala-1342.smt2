; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26610 () Bool)

(assert start!26610)

(declare-fun b!276317 () Bool)

(declare-fun e!176545 () Bool)

(declare-fun e!176546 () Bool)

(assert (=> b!276317 (= e!176545 e!176546)))

(declare-fun res!140285 () Bool)

(assert (=> b!276317 (=> (not res!140285) (not e!176546))))

(declare-datatypes ((SeekEntryResult!1625 0))(
  ( (MissingZero!1625 (index!8670 (_ BitVec 32))) (Found!1625 (index!8671 (_ BitVec 32))) (Intermediate!1625 (undefined!2437 Bool) (index!8672 (_ BitVec 32)) (x!27046 (_ BitVec 32))) (Undefined!1625) (MissingVacant!1625 (index!8673 (_ BitVec 32))) )
))
(declare-fun lt!137646 () SeekEntryResult!1625)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276317 (= res!140285 (or (= lt!137646 (MissingZero!1625 i!1267)) (= lt!137646 (MissingVacant!1625 i!1267))))))

(declare-datatypes ((array!13706 0))(
  ( (array!13707 (arr!6502 (Array (_ BitVec 32) (_ BitVec 64))) (size!6854 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13706)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13706 (_ BitVec 32)) SeekEntryResult!1625)

(assert (=> b!276317 (= lt!137646 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276318 () Bool)

(declare-fun res!140284 () Bool)

(assert (=> b!276318 (=> (not res!140284) (not e!176545))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276318 (= res!140284 (and (= (size!6854 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6854 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6854 a!3325))))))

(declare-fun b!276319 () Bool)

(declare-fun res!140281 () Bool)

(assert (=> b!276319 (=> (not res!140281) (not e!176545))))

(declare-fun arrayContainsKey!0 (array!13706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276319 (= res!140281 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276320 () Bool)

(declare-fun res!140286 () Bool)

(assert (=> b!276320 (=> (not res!140286) (not e!176545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276320 (= res!140286 (validKeyInArray!0 k0!2581))))

(declare-fun b!276321 () Bool)

(assert (=> b!276321 (= e!176546 false)))

(declare-fun lt!137645 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13706 (_ BitVec 32)) Bool)

(assert (=> b!276321 (= lt!137645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140283 () Bool)

(assert (=> start!26610 (=> (not res!140283) (not e!176545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26610 (= res!140283 (validMask!0 mask!3868))))

(assert (=> start!26610 e!176545))

(declare-fun array_inv!4452 (array!13706) Bool)

(assert (=> start!26610 (array_inv!4452 a!3325)))

(assert (=> start!26610 true))

(declare-fun b!276322 () Bool)

(declare-fun res!140282 () Bool)

(assert (=> b!276322 (=> (not res!140282) (not e!176545))))

(declare-datatypes ((List!4223 0))(
  ( (Nil!4220) (Cons!4219 (h!4886 (_ BitVec 64)) (t!9297 List!4223)) )
))
(declare-fun arrayNoDuplicates!0 (array!13706 (_ BitVec 32) List!4223) Bool)

(assert (=> b!276322 (= res!140282 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4220))))

(assert (= (and start!26610 res!140283) b!276318))

(assert (= (and b!276318 res!140284) b!276320))

(assert (= (and b!276320 res!140286) b!276322))

(assert (= (and b!276322 res!140282) b!276319))

(assert (= (and b!276319 res!140281) b!276317))

(assert (= (and b!276317 res!140285) b!276321))

(declare-fun m!291851 () Bool)

(assert (=> b!276321 m!291851))

(declare-fun m!291853 () Bool)

(assert (=> b!276317 m!291853))

(declare-fun m!291855 () Bool)

(assert (=> b!276319 m!291855))

(declare-fun m!291857 () Bool)

(assert (=> b!276322 m!291857))

(declare-fun m!291859 () Bool)

(assert (=> b!276320 m!291859))

(declare-fun m!291861 () Bool)

(assert (=> start!26610 m!291861))

(declare-fun m!291863 () Bool)

(assert (=> start!26610 m!291863))

(check-sat (not b!276321) (not b!276319) (not start!26610) (not b!276317) (not b!276322) (not b!276320))
(check-sat)
