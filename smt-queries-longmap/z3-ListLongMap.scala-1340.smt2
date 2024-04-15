; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26600 () Bool)

(assert start!26600)

(declare-fun b!276008 () Bool)

(declare-fun res!140054 () Bool)

(declare-fun e!176366 () Bool)

(assert (=> b!276008 (=> (not res!140054) (not e!176366))))

(declare-datatypes ((array!13686 0))(
  ( (array!13687 (arr!6492 (Array (_ BitVec 32) (_ BitVec 64))) (size!6845 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13686)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276008 (= res!140054 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276009 () Bool)

(declare-fun res!140050 () Bool)

(assert (=> b!276009 (=> (not res!140050) (not e!176366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276009 (= res!140050 (validKeyInArray!0 k0!2581))))

(declare-fun res!140056 () Bool)

(assert (=> start!26600 (=> (not res!140056) (not e!176366))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26600 (= res!140056 (validMask!0 mask!3868))))

(assert (=> start!26600 e!176366))

(declare-fun array_inv!4464 (array!13686) Bool)

(assert (=> start!26600 (array_inv!4464 a!3325)))

(assert (=> start!26600 true))

(declare-fun b!276010 () Bool)

(declare-fun res!140055 () Bool)

(assert (=> b!276010 (=> (not res!140055) (not e!176366))))

(declare-datatypes ((List!4273 0))(
  ( (Nil!4270) (Cons!4269 (h!4936 (_ BitVec 64)) (t!9346 List!4273)) )
))
(declare-fun arrayNoDuplicates!0 (array!13686 (_ BitVec 32) List!4273) Bool)

(assert (=> b!276010 (= res!140055 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4270))))

(declare-fun b!276011 () Bool)

(declare-fun res!140051 () Bool)

(assert (=> b!276011 (=> (not res!140051) (not e!176366))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276011 (= res!140051 (and (= (size!6845 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6845 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6845 a!3325))))))

(declare-fun b!276012 () Bool)

(declare-fun e!176367 () Bool)

(assert (=> b!276012 (= e!176366 e!176367)))

(declare-fun res!140052 () Bool)

(assert (=> b!276012 (=> (not res!140052) (not e!176367))))

(declare-datatypes ((SeekEntryResult!1649 0))(
  ( (MissingZero!1649 (index!8766 (_ BitVec 32))) (Found!1649 (index!8767 (_ BitVec 32))) (Intermediate!1649 (undefined!2461 Bool) (index!8768 (_ BitVec 32)) (x!27053 (_ BitVec 32))) (Undefined!1649) (MissingVacant!1649 (index!8769 (_ BitVec 32))) )
))
(declare-fun lt!137376 () SeekEntryResult!1649)

(assert (=> b!276012 (= res!140052 (or (= lt!137376 (MissingZero!1649 i!1267)) (= lt!137376 (MissingVacant!1649 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13686 (_ BitVec 32)) SeekEntryResult!1649)

(assert (=> b!276012 (= lt!137376 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276013 () Bool)

(declare-fun res!140053 () Bool)

(assert (=> b!276013 (=> (not res!140053) (not e!176367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13686 (_ BitVec 32)) Bool)

(assert (=> b!276013 (= res!140053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276014 () Bool)

(assert (=> b!276014 (= e!176367 (bvslt (bvsub (size!6845 a!3325) startIndex!26) #b00000000000000000000000000000000))))

(assert (= (and start!26600 res!140056) b!276011))

(assert (= (and b!276011 res!140051) b!276009))

(assert (= (and b!276009 res!140050) b!276010))

(assert (= (and b!276010 res!140055) b!276008))

(assert (= (and b!276008 res!140054) b!276012))

(assert (= (and b!276012 res!140052) b!276013))

(assert (= (and b!276013 res!140053) b!276014))

(declare-fun m!290969 () Bool)

(assert (=> b!276008 m!290969))

(declare-fun m!290971 () Bool)

(assert (=> b!276010 m!290971))

(declare-fun m!290973 () Bool)

(assert (=> start!26600 m!290973))

(declare-fun m!290975 () Bool)

(assert (=> start!26600 m!290975))

(declare-fun m!290977 () Bool)

(assert (=> b!276013 m!290977))

(declare-fun m!290979 () Bool)

(assert (=> b!276009 m!290979))

(declare-fun m!290981 () Bool)

(assert (=> b!276012 m!290981))

(check-sat (not b!276013) (not b!276009) (not b!276012) (not b!276008) (not start!26600) (not b!276010))
(check-sat)
