; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26172 () Bool)

(assert start!26172)

(declare-fun b!270376 () Bool)

(declare-fun e!174284 () Bool)

(declare-fun e!174280 () Bool)

(assert (=> b!270376 (= e!174284 e!174280)))

(declare-fun res!134376 () Bool)

(assert (=> b!270376 (=> (not res!134376) (not e!174280))))

(declare-datatypes ((SeekEntryResult!1406 0))(
  ( (MissingZero!1406 (index!7794 (_ BitVec 32))) (Found!1406 (index!7795 (_ BitVec 32))) (Intermediate!1406 (undefined!2218 Bool) (index!7796 (_ BitVec 32)) (x!26243 (_ BitVec 32))) (Undefined!1406) (MissingVacant!1406 (index!7797 (_ BitVec 32))) )
))
(declare-fun lt!135636 () SeekEntryResult!1406)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270376 (= res!134376 (or (= lt!135636 (MissingZero!1406 i!1267)) (= lt!135636 (MissingVacant!1406 i!1267))))))

(declare-datatypes ((array!13268 0))(
  ( (array!13269 (arr!6283 (Array (_ BitVec 32) (_ BitVec 64))) (size!6635 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13268)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13268 (_ BitVec 32)) SeekEntryResult!1406)

(assert (=> b!270376 (= lt!135636 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270377 () Bool)

(declare-datatypes ((Unit!8411 0))(
  ( (Unit!8412) )
))
(declare-fun e!174283 () Unit!8411)

(declare-fun lt!135637 () Unit!8411)

(assert (=> b!270377 (= e!174283 lt!135637)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13268 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8411)

(assert (=> b!270377 (= lt!135637 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135639 () array!13268)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13268 (_ BitVec 32)) Bool)

(assert (=> b!270377 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135639 mask!3868)))

(declare-fun b!270378 () Bool)

(declare-fun e!174281 () Bool)

(assert (=> b!270378 (= e!174281 (not true))))

(assert (=> b!270378 (= (seekEntryOrOpen!0 k0!2581 lt!135639 mask!3868) (Found!1406 i!1267))))

(declare-fun lt!135635 () Unit!8411)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13268 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8411)

(assert (=> b!270378 (= lt!135635 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135638 () Unit!8411)

(assert (=> b!270378 (= lt!135638 e!174283)))

(declare-fun c!45553 () Bool)

(assert (=> b!270378 (= c!45553 (bvslt startIndex!26 (bvsub (size!6635 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270379 () Bool)

(declare-fun res!134378 () Bool)

(assert (=> b!270379 (=> (not res!134378) (not e!174280))))

(assert (=> b!270379 (= res!134378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!134373 () Bool)

(assert (=> start!26172 (=> (not res!134373) (not e!174284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26172 (= res!134373 (validMask!0 mask!3868))))

(assert (=> start!26172 e!174284))

(declare-fun array_inv!4233 (array!13268) Bool)

(assert (=> start!26172 (array_inv!4233 a!3325)))

(assert (=> start!26172 true))

(declare-fun b!270380 () Bool)

(declare-fun res!134375 () Bool)

(assert (=> b!270380 (=> (not res!134375) (not e!174284))))

(declare-fun arrayContainsKey!0 (array!13268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270380 (= res!134375 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270381 () Bool)

(declare-fun Unit!8413 () Unit!8411)

(assert (=> b!270381 (= e!174283 Unit!8413)))

(declare-fun b!270382 () Bool)

(declare-fun res!134377 () Bool)

(assert (=> b!270382 (=> (not res!134377) (not e!174284))))

(declare-datatypes ((List!4004 0))(
  ( (Nil!4001) (Cons!4000 (h!4667 (_ BitVec 64)) (t!9078 List!4004)) )
))
(declare-fun arrayNoDuplicates!0 (array!13268 (_ BitVec 32) List!4004) Bool)

(assert (=> b!270382 (= res!134377 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4001))))

(declare-fun b!270383 () Bool)

(declare-fun res!134379 () Bool)

(assert (=> b!270383 (=> (not res!134379) (not e!174284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270383 (= res!134379 (validKeyInArray!0 k0!2581))))

(declare-fun b!270384 () Bool)

(declare-fun res!134372 () Bool)

(assert (=> b!270384 (=> (not res!134372) (not e!174284))))

(assert (=> b!270384 (= res!134372 (and (= (size!6635 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6635 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6635 a!3325))))))

(declare-fun b!270385 () Bool)

(assert (=> b!270385 (= e!174280 e!174281)))

(declare-fun res!134374 () Bool)

(assert (=> b!270385 (=> (not res!134374) (not e!174281))))

(assert (=> b!270385 (= res!134374 (= startIndex!26 i!1267))))

(assert (=> b!270385 (= lt!135639 (array!13269 (store (arr!6283 a!3325) i!1267 k0!2581) (size!6635 a!3325)))))

(assert (= (and start!26172 res!134373) b!270384))

(assert (= (and b!270384 res!134372) b!270383))

(assert (= (and b!270383 res!134379) b!270382))

(assert (= (and b!270382 res!134377) b!270380))

(assert (= (and b!270380 res!134375) b!270376))

(assert (= (and b!270376 res!134376) b!270379))

(assert (= (and b!270379 res!134378) b!270385))

(assert (= (and b!270385 res!134374) b!270378))

(assert (= (and b!270378 c!45553) b!270377))

(assert (= (and b!270378 (not c!45553)) b!270381))

(declare-fun m!286169 () Bool)

(assert (=> b!270377 m!286169))

(declare-fun m!286171 () Bool)

(assert (=> b!270377 m!286171))

(declare-fun m!286173 () Bool)

(assert (=> b!270382 m!286173))

(declare-fun m!286175 () Bool)

(assert (=> b!270378 m!286175))

(declare-fun m!286177 () Bool)

(assert (=> b!270378 m!286177))

(declare-fun m!286179 () Bool)

(assert (=> b!270376 m!286179))

(declare-fun m!286181 () Bool)

(assert (=> start!26172 m!286181))

(declare-fun m!286183 () Bool)

(assert (=> start!26172 m!286183))

(declare-fun m!286185 () Bool)

(assert (=> b!270385 m!286185))

(declare-fun m!286187 () Bool)

(assert (=> b!270380 m!286187))

(declare-fun m!286189 () Bool)

(assert (=> b!270383 m!286189))

(declare-fun m!286191 () Bool)

(assert (=> b!270379 m!286191))

(check-sat (not b!270376) (not b!270378) (not b!270383) (not start!26172) (not b!270380) (not b!270377) (not b!270382) (not b!270379))
(check-sat)
