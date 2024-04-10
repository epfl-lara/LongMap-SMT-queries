; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26516 () Bool)

(assert start!26516)

(declare-fun b!275244 () Bool)

(declare-fun res!139234 () Bool)

(declare-fun e!176099 () Bool)

(assert (=> b!275244 (=> (not res!139234) (not e!176099))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275244 (= res!139234 (validKeyInArray!0 k0!2581))))

(declare-fun res!139239 () Bool)

(assert (=> start!26516 (=> (not res!139239) (not e!176099))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26516 (= res!139239 (validMask!0 mask!3868))))

(assert (=> start!26516 e!176099))

(declare-datatypes ((array!13613 0))(
  ( (array!13614 (arr!6456 (Array (_ BitVec 32) (_ BitVec 64))) (size!6808 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13613)

(declare-fun array_inv!4419 (array!13613) Bool)

(assert (=> start!26516 (array_inv!4419 a!3325)))

(assert (=> start!26516 true))

(declare-fun b!275245 () Bool)

(declare-fun e!176097 () Bool)

(assert (=> b!275245 (= e!176099 e!176097)))

(declare-fun res!139237 () Bool)

(assert (=> b!275245 (=> (not res!139237) (not e!176097))))

(declare-datatypes ((SeekEntryResult!1614 0))(
  ( (MissingZero!1614 (index!8626 (_ BitVec 32))) (Found!1614 (index!8627 (_ BitVec 32))) (Intermediate!1614 (undefined!2426 Bool) (index!8628 (_ BitVec 32)) (x!26907 (_ BitVec 32))) (Undefined!1614) (MissingVacant!1614 (index!8629 (_ BitVec 32))) )
))
(declare-fun lt!137322 () SeekEntryResult!1614)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275245 (= res!139237 (or (= lt!137322 (MissingZero!1614 i!1267)) (= lt!137322 (MissingVacant!1614 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13613 (_ BitVec 32)) SeekEntryResult!1614)

(assert (=> b!275245 (= lt!137322 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275246 () Bool)

(declare-fun res!139238 () Bool)

(assert (=> b!275246 (=> (not res!139238) (not e!176099))))

(declare-fun arrayContainsKey!0 (array!13613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275246 (= res!139238 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275247 () Bool)

(declare-fun res!139235 () Bool)

(assert (=> b!275247 (=> (not res!139235) (not e!176099))))

(declare-datatypes ((List!4264 0))(
  ( (Nil!4261) (Cons!4260 (h!4927 (_ BitVec 64)) (t!9346 List!4264)) )
))
(declare-fun arrayNoDuplicates!0 (array!13613 (_ BitVec 32) List!4264) Bool)

(assert (=> b!275247 (= res!139235 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4261))))

(declare-fun b!275248 () Bool)

(assert (=> b!275248 (= e!176097 false)))

(declare-fun lt!137323 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13613 (_ BitVec 32)) Bool)

(assert (=> b!275248 (= lt!137323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275249 () Bool)

(declare-fun res!139236 () Bool)

(assert (=> b!275249 (=> (not res!139236) (not e!176099))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275249 (= res!139236 (and (= (size!6808 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6808 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6808 a!3325))))))

(assert (= (and start!26516 res!139239) b!275249))

(assert (= (and b!275249 res!139236) b!275244))

(assert (= (and b!275244 res!139234) b!275247))

(assert (= (and b!275247 res!139235) b!275246))

(assert (= (and b!275246 res!139238) b!275245))

(assert (= (and b!275245 res!139237) b!275248))

(declare-fun m!290855 () Bool)

(assert (=> b!275246 m!290855))

(declare-fun m!290857 () Bool)

(assert (=> b!275244 m!290857))

(declare-fun m!290859 () Bool)

(assert (=> start!26516 m!290859))

(declare-fun m!290861 () Bool)

(assert (=> start!26516 m!290861))

(declare-fun m!290863 () Bool)

(assert (=> b!275245 m!290863))

(declare-fun m!290865 () Bool)

(assert (=> b!275248 m!290865))

(declare-fun m!290867 () Bool)

(assert (=> b!275247 m!290867))

(check-sat (not start!26516) (not b!275246) (not b!275247) (not b!275245) (not b!275244) (not b!275248))
(check-sat)
