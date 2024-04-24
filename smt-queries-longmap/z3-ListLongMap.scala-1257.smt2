; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26100 () Bool)

(assert start!26100)

(declare-fun b!269296 () Bool)

(declare-fun res!133513 () Bool)

(declare-fun e!173792 () Bool)

(assert (=> b!269296 (=> (not res!133513) (not e!173792))))

(declare-datatypes ((array!13196 0))(
  ( (array!13197 (arr!6247 (Array (_ BitVec 32) (_ BitVec 64))) (size!6599 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13196)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269296 (= res!133513 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269297 () Bool)

(declare-fun res!133515 () Bool)

(declare-fun e!173794 () Bool)

(assert (=> b!269297 (=> (not res!133515) (not e!173794))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13196 (_ BitVec 32)) Bool)

(assert (=> b!269297 (= res!133515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!133510 () Bool)

(assert (=> start!26100 (=> (not res!133510) (not e!173792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26100 (= res!133510 (validMask!0 mask!3868))))

(assert (=> start!26100 e!173792))

(declare-fun array_inv!4197 (array!13196) Bool)

(assert (=> start!26100 (array_inv!4197 a!3325)))

(assert (=> start!26100 true))

(declare-fun b!269298 () Bool)

(declare-datatypes ((Unit!8303 0))(
  ( (Unit!8304) )
))
(declare-fun e!173793 () Unit!8303)

(declare-fun Unit!8305 () Unit!8303)

(assert (=> b!269298 (= e!173793 Unit!8305)))

(declare-fun b!269299 () Bool)

(declare-fun res!133508 () Bool)

(assert (=> b!269299 (=> (not res!133508) (not e!173792))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269299 (= res!133508 (and (= (size!6599 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6599 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6599 a!3325))))))

(declare-fun b!269300 () Bool)

(declare-fun res!133512 () Bool)

(assert (=> b!269300 (=> (not res!133512) (not e!173792))))

(declare-datatypes ((List!3968 0))(
  ( (Nil!3965) (Cons!3964 (h!4631 (_ BitVec 64)) (t!9042 List!3968)) )
))
(declare-fun arrayNoDuplicates!0 (array!13196 (_ BitVec 32) List!3968) Bool)

(assert (=> b!269300 (= res!133512 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3965))))

(declare-fun b!269301 () Bool)

(declare-fun res!133509 () Bool)

(assert (=> b!269301 (=> (not res!133509) (not e!173794))))

(assert (=> b!269301 (= res!133509 (= startIndex!26 i!1267))))

(declare-fun b!269302 () Bool)

(declare-fun res!133514 () Bool)

(assert (=> b!269302 (=> (not res!133514) (not e!173792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269302 (= res!133514 (validKeyInArray!0 k0!2581))))

(declare-fun b!269303 () Bool)

(assert (=> b!269303 (= e!173794 false)))

(declare-fun lt!135199 () Unit!8303)

(assert (=> b!269303 (= lt!135199 e!173793)))

(declare-fun c!45445 () Bool)

(assert (=> b!269303 (= c!45445 (bvslt startIndex!26 (bvsub (size!6599 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269304 () Bool)

(assert (=> b!269304 (= e!173792 e!173794)))

(declare-fun res!133511 () Bool)

(assert (=> b!269304 (=> (not res!133511) (not e!173794))))

(declare-datatypes ((SeekEntryResult!1370 0))(
  ( (MissingZero!1370 (index!7650 (_ BitVec 32))) (Found!1370 (index!7651 (_ BitVec 32))) (Intermediate!1370 (undefined!2182 Bool) (index!7652 (_ BitVec 32)) (x!26111 (_ BitVec 32))) (Undefined!1370) (MissingVacant!1370 (index!7653 (_ BitVec 32))) )
))
(declare-fun lt!135201 () SeekEntryResult!1370)

(assert (=> b!269304 (= res!133511 (or (= lt!135201 (MissingZero!1370 i!1267)) (= lt!135201 (MissingVacant!1370 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13196 (_ BitVec 32)) SeekEntryResult!1370)

(assert (=> b!269304 (= lt!135201 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269305 () Bool)

(declare-fun lt!135200 () Unit!8303)

(assert (=> b!269305 (= e!173793 lt!135200)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13196 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8303)

(assert (=> b!269305 (= lt!135200 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13197 (store (arr!6247 a!3325) i!1267 k0!2581) (size!6599 a!3325)) mask!3868)))

(assert (= (and start!26100 res!133510) b!269299))

(assert (= (and b!269299 res!133508) b!269302))

(assert (= (and b!269302 res!133514) b!269300))

(assert (= (and b!269300 res!133512) b!269296))

(assert (= (and b!269296 res!133513) b!269304))

(assert (= (and b!269304 res!133511) b!269297))

(assert (= (and b!269297 res!133515) b!269301))

(assert (= (and b!269301 res!133509) b!269303))

(assert (= (and b!269303 c!45445) b!269305))

(assert (= (and b!269303 (not c!45445)) b!269298))

(declare-fun m!285377 () Bool)

(assert (=> b!269302 m!285377))

(declare-fun m!285379 () Bool)

(assert (=> b!269304 m!285379))

(declare-fun m!285381 () Bool)

(assert (=> start!26100 m!285381))

(declare-fun m!285383 () Bool)

(assert (=> start!26100 m!285383))

(declare-fun m!285385 () Bool)

(assert (=> b!269297 m!285385))

(declare-fun m!285387 () Bool)

(assert (=> b!269300 m!285387))

(declare-fun m!285389 () Bool)

(assert (=> b!269305 m!285389))

(declare-fun m!285391 () Bool)

(assert (=> b!269305 m!285391))

(declare-fun m!285393 () Bool)

(assert (=> b!269305 m!285393))

(declare-fun m!285395 () Bool)

(assert (=> b!269296 m!285395))

(check-sat (not b!269297) (not b!269304) (not b!269305) (not b!269296) (not b!269300) (not start!26100) (not b!269302))
(check-sat)
