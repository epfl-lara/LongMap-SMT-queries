; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27180 () Bool)

(assert start!27180)

(declare-fun res!144348 () Bool)

(declare-fun e!178838 () Bool)

(assert (=> start!27180 (=> (not res!144348) (not e!178838))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27180 (= res!144348 (validMask!0 mask!3868))))

(assert (=> start!27180 e!178838))

(declare-datatypes ((array!13997 0))(
  ( (array!13998 (arr!6640 (Array (_ BitVec 32) (_ BitVec 64))) (size!6992 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13997)

(declare-fun array_inv!4590 (array!13997) Bool)

(assert (=> start!27180 (array_inv!4590 a!3325)))

(assert (=> start!27180 true))

(declare-fun b!281303 () Bool)

(declare-fun e!178837 () Bool)

(assert (=> b!281303 (= e!178837 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4361 0))(
  ( (Nil!4358) (Cons!4357 (h!5027 (_ BitVec 64)) (t!9435 List!4361)) )
))
(declare-fun arrayNoDuplicates!0 (array!13997 (_ BitVec 32) List!4361) Bool)

(assert (=> b!281303 (arrayNoDuplicates!0 (array!13998 (store (arr!6640 a!3325) i!1267 k0!2581) (size!6992 a!3325)) #b00000000000000000000000000000000 Nil!4358)))

(declare-datatypes ((Unit!8856 0))(
  ( (Unit!8857) )
))
(declare-fun lt!139068 () Unit!8856)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13997 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4361) Unit!8856)

(assert (=> b!281303 (= lt!139068 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4358))))

(declare-fun b!281304 () Bool)

(assert (=> b!281304 (= e!178838 e!178837)))

(declare-fun res!144350 () Bool)

(assert (=> b!281304 (=> (not res!144350) (not e!178837))))

(declare-datatypes ((SeekEntryResult!1763 0))(
  ( (MissingZero!1763 (index!9222 (_ BitVec 32))) (Found!1763 (index!9223 (_ BitVec 32))) (Intermediate!1763 (undefined!2575 Bool) (index!9224 (_ BitVec 32)) (x!27561 (_ BitVec 32))) (Undefined!1763) (MissingVacant!1763 (index!9225 (_ BitVec 32))) )
))
(declare-fun lt!139067 () SeekEntryResult!1763)

(assert (=> b!281304 (= res!144350 (or (= lt!139067 (MissingZero!1763 i!1267)) (= lt!139067 (MissingVacant!1763 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13997 (_ BitVec 32)) SeekEntryResult!1763)

(assert (=> b!281304 (= lt!139067 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281305 () Bool)

(declare-fun res!144351 () Bool)

(assert (=> b!281305 (=> (not res!144351) (not e!178838))))

(declare-fun arrayContainsKey!0 (array!13997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281305 (= res!144351 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281306 () Bool)

(declare-fun res!144352 () Bool)

(assert (=> b!281306 (=> (not res!144352) (not e!178838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281306 (= res!144352 (validKeyInArray!0 k0!2581))))

(declare-fun b!281307 () Bool)

(declare-fun res!144353 () Bool)

(assert (=> b!281307 (=> (not res!144353) (not e!178838))))

(assert (=> b!281307 (= res!144353 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4358))))

(declare-fun b!281308 () Bool)

(declare-fun res!144354 () Bool)

(assert (=> b!281308 (=> (not res!144354) (not e!178837))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281308 (= res!144354 (validKeyInArray!0 (select (arr!6640 a!3325) startIndex!26)))))

(declare-fun b!281309 () Bool)

(declare-fun res!144349 () Bool)

(assert (=> b!281309 (=> (not res!144349) (not e!178838))))

(assert (=> b!281309 (= res!144349 (and (= (size!6992 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6992 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6992 a!3325))))))

(declare-fun b!281310 () Bool)

(declare-fun res!144346 () Bool)

(assert (=> b!281310 (=> (not res!144346) (not e!178837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13997 (_ BitVec 32)) Bool)

(assert (=> b!281310 (= res!144346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281311 () Bool)

(declare-fun res!144347 () Bool)

(assert (=> b!281311 (=> (not res!144347) (not e!178837))))

(assert (=> b!281311 (= res!144347 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27180 res!144348) b!281309))

(assert (= (and b!281309 res!144349) b!281306))

(assert (= (and b!281306 res!144352) b!281307))

(assert (= (and b!281307 res!144353) b!281305))

(assert (= (and b!281305 res!144351) b!281304))

(assert (= (and b!281304 res!144350) b!281310))

(assert (= (and b!281310 res!144346) b!281311))

(assert (= (and b!281311 res!144347) b!281308))

(assert (= (and b!281308 res!144354) b!281303))

(declare-fun m!295805 () Bool)

(assert (=> b!281308 m!295805))

(assert (=> b!281308 m!295805))

(declare-fun m!295807 () Bool)

(assert (=> b!281308 m!295807))

(declare-fun m!295809 () Bool)

(assert (=> b!281304 m!295809))

(declare-fun m!295811 () Bool)

(assert (=> b!281303 m!295811))

(declare-fun m!295813 () Bool)

(assert (=> b!281303 m!295813))

(declare-fun m!295815 () Bool)

(assert (=> b!281303 m!295815))

(declare-fun m!295817 () Bool)

(assert (=> b!281310 m!295817))

(declare-fun m!295819 () Bool)

(assert (=> b!281306 m!295819))

(declare-fun m!295821 () Bool)

(assert (=> start!27180 m!295821))

(declare-fun m!295823 () Bool)

(assert (=> start!27180 m!295823))

(declare-fun m!295825 () Bool)

(assert (=> b!281305 m!295825))

(declare-fun m!295827 () Bool)

(assert (=> b!281307 m!295827))

(check-sat (not b!281304) (not start!27180) (not b!281308) (not b!281305) (not b!281310) (not b!281303) (not b!281307) (not b!281306))
(check-sat)
