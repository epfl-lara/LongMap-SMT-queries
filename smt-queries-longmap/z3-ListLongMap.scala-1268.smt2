; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26166 () Bool)

(assert start!26166)

(declare-fun b!270286 () Bool)

(declare-fun e!174238 () Bool)

(declare-fun e!174235 () Bool)

(assert (=> b!270286 (= e!174238 e!174235)))

(declare-fun res!134307 () Bool)

(assert (=> b!270286 (=> (not res!134307) (not e!174235))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270286 (= res!134307 (= startIndex!26 i!1267))))

(declare-datatypes ((array!13262 0))(
  ( (array!13263 (arr!6280 (Array (_ BitVec 32) (_ BitVec 64))) (size!6632 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13262)

(declare-fun lt!135592 () array!13262)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!270286 (= lt!135592 (array!13263 (store (arr!6280 a!3325) i!1267 k0!2581) (size!6632 a!3325)))))

(declare-fun b!270288 () Bool)

(declare-fun res!134304 () Bool)

(declare-fun e!174237 () Bool)

(assert (=> b!270288 (=> (not res!134304) (not e!174237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270288 (= res!134304 (validKeyInArray!0 k0!2581))))

(declare-fun b!270289 () Bool)

(declare-fun res!134303 () Bool)

(assert (=> b!270289 (=> (not res!134303) (not e!174237))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270289 (= res!134303 (and (= (size!6632 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6632 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6632 a!3325))))))

(declare-fun b!270290 () Bool)

(declare-datatypes ((Unit!8402 0))(
  ( (Unit!8403) )
))
(declare-fun e!174236 () Unit!8402)

(declare-fun Unit!8404 () Unit!8402)

(assert (=> b!270290 (= e!174236 Unit!8404)))

(declare-fun b!270291 () Bool)

(declare-fun res!134302 () Bool)

(assert (=> b!270291 (=> (not res!134302) (not e!174237))))

(declare-datatypes ((List!4001 0))(
  ( (Nil!3998) (Cons!3997 (h!4664 (_ BitVec 64)) (t!9075 List!4001)) )
))
(declare-fun arrayNoDuplicates!0 (array!13262 (_ BitVec 32) List!4001) Bool)

(assert (=> b!270291 (= res!134302 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3998))))

(declare-fun b!270292 () Bool)

(declare-fun res!134305 () Bool)

(assert (=> b!270292 (=> (not res!134305) (not e!174237))))

(declare-fun arrayContainsKey!0 (array!13262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270292 (= res!134305 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270293 () Bool)

(assert (=> b!270293 (= e!174235 (not true))))

(declare-datatypes ((SeekEntryResult!1403 0))(
  ( (MissingZero!1403 (index!7782 (_ BitVec 32))) (Found!1403 (index!7783 (_ BitVec 32))) (Intermediate!1403 (undefined!2215 Bool) (index!7784 (_ BitVec 32)) (x!26232 (_ BitVec 32))) (Undefined!1403) (MissingVacant!1403 (index!7785 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13262 (_ BitVec 32)) SeekEntryResult!1403)

(assert (=> b!270293 (= (seekEntryOrOpen!0 k0!2581 lt!135592 mask!3868) (Found!1403 i!1267))))

(declare-fun lt!135591 () Unit!8402)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13262 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8402)

(assert (=> b!270293 (= lt!135591 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135590 () Unit!8402)

(assert (=> b!270293 (= lt!135590 e!174236)))

(declare-fun c!45544 () Bool)

(assert (=> b!270293 (= c!45544 (bvslt startIndex!26 (bvsub (size!6632 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270294 () Bool)

(declare-fun res!134301 () Bool)

(assert (=> b!270294 (=> (not res!134301) (not e!174238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13262 (_ BitVec 32)) Bool)

(assert (=> b!270294 (= res!134301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270295 () Bool)

(declare-fun lt!135594 () Unit!8402)

(assert (=> b!270295 (= e!174236 lt!135594)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13262 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8402)

(assert (=> b!270295 (= lt!135594 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270295 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135592 mask!3868)))

(declare-fun res!134306 () Bool)

(assert (=> start!26166 (=> (not res!134306) (not e!174237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26166 (= res!134306 (validMask!0 mask!3868))))

(assert (=> start!26166 e!174237))

(declare-fun array_inv!4230 (array!13262) Bool)

(assert (=> start!26166 (array_inv!4230 a!3325)))

(assert (=> start!26166 true))

(declare-fun b!270287 () Bool)

(assert (=> b!270287 (= e!174237 e!174238)))

(declare-fun res!134300 () Bool)

(assert (=> b!270287 (=> (not res!134300) (not e!174238))))

(declare-fun lt!135593 () SeekEntryResult!1403)

(assert (=> b!270287 (= res!134300 (or (= lt!135593 (MissingZero!1403 i!1267)) (= lt!135593 (MissingVacant!1403 i!1267))))))

(assert (=> b!270287 (= lt!135593 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26166 res!134306) b!270289))

(assert (= (and b!270289 res!134303) b!270288))

(assert (= (and b!270288 res!134304) b!270291))

(assert (= (and b!270291 res!134302) b!270292))

(assert (= (and b!270292 res!134305) b!270287))

(assert (= (and b!270287 res!134300) b!270294))

(assert (= (and b!270294 res!134301) b!270286))

(assert (= (and b!270286 res!134307) b!270293))

(assert (= (and b!270293 c!45544) b!270295))

(assert (= (and b!270293 (not c!45544)) b!270290))

(declare-fun m!286097 () Bool)

(assert (=> b!270293 m!286097))

(declare-fun m!286099 () Bool)

(assert (=> b!270293 m!286099))

(declare-fun m!286101 () Bool)

(assert (=> b!270295 m!286101))

(declare-fun m!286103 () Bool)

(assert (=> b!270295 m!286103))

(declare-fun m!286105 () Bool)

(assert (=> b!270294 m!286105))

(declare-fun m!286107 () Bool)

(assert (=> b!270292 m!286107))

(declare-fun m!286109 () Bool)

(assert (=> start!26166 m!286109))

(declare-fun m!286111 () Bool)

(assert (=> start!26166 m!286111))

(declare-fun m!286113 () Bool)

(assert (=> b!270288 m!286113))

(declare-fun m!286115 () Bool)

(assert (=> b!270291 m!286115))

(declare-fun m!286117 () Bool)

(assert (=> b!270286 m!286117))

(declare-fun m!286119 () Bool)

(assert (=> b!270287 m!286119))

(check-sat (not b!270294) (not b!270287) (not b!270288) (not b!270293) (not b!270295) (not b!270291) (not b!270292) (not start!26166))
(check-sat)
