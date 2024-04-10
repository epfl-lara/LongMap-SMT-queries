; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26720 () Bool)

(assert start!26720)

(declare-fun b!277478 () Bool)

(declare-fun res!141371 () Bool)

(declare-fun e!177065 () Bool)

(assert (=> b!277478 (=> (not res!141371) (not e!177065))))

(declare-datatypes ((array!13817 0))(
  ( (array!13818 (arr!6558 (Array (_ BitVec 32) (_ BitVec 64))) (size!6910 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13817)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277478 (= res!141371 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277479 () Bool)

(declare-fun e!177067 () Bool)

(assert (=> b!277479 (= e!177065 e!177067)))

(declare-fun res!141374 () Bool)

(assert (=> b!277479 (=> (not res!141374) (not e!177067))))

(declare-datatypes ((SeekEntryResult!1716 0))(
  ( (MissingZero!1716 (index!9034 (_ BitVec 32))) (Found!1716 (index!9035 (_ BitVec 32))) (Intermediate!1716 (undefined!2528 Bool) (index!9036 (_ BitVec 32)) (x!27281 (_ BitVec 32))) (Undefined!1716) (MissingVacant!1716 (index!9037 (_ BitVec 32))) )
))
(declare-fun lt!137950 () SeekEntryResult!1716)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277479 (= res!141374 (or (= lt!137950 (MissingZero!1716 i!1267)) (= lt!137950 (MissingVacant!1716 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13817 (_ BitVec 32)) SeekEntryResult!1716)

(assert (=> b!277479 (= lt!137950 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277480 () Bool)

(declare-datatypes ((Unit!8749 0))(
  ( (Unit!8750) )
))
(declare-fun e!177068 () Unit!8749)

(declare-fun Unit!8751 () Unit!8749)

(assert (=> b!277480 (= e!177068 Unit!8751)))

(declare-fun b!277481 () Bool)

(declare-fun res!141372 () Bool)

(assert (=> b!277481 (=> (not res!141372) (not e!177067))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277481 (= res!141372 (= startIndex!26 i!1267))))

(declare-fun b!277482 () Bool)

(declare-fun res!141375 () Bool)

(assert (=> b!277482 (=> (not res!141375) (not e!177065))))

(assert (=> b!277482 (= res!141375 (and (= (size!6910 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6910 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6910 a!3325))))))

(declare-fun b!277483 () Bool)

(assert (=> b!277483 (= e!177067 false)))

(declare-fun lt!137948 () Unit!8749)

(assert (=> b!277483 (= lt!137948 e!177068)))

(declare-fun c!45606 () Bool)

(assert (=> b!277483 (= c!45606 (bvslt startIndex!26 (bvsub (size!6910 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141373 () Bool)

(assert (=> start!26720 (=> (not res!141373) (not e!177065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26720 (= res!141373 (validMask!0 mask!3868))))

(assert (=> start!26720 e!177065))

(declare-fun array_inv!4521 (array!13817) Bool)

(assert (=> start!26720 (array_inv!4521 a!3325)))

(assert (=> start!26720 true))

(declare-fun b!277484 () Bool)

(declare-fun res!141370 () Bool)

(assert (=> b!277484 (=> (not res!141370) (not e!177065))))

(declare-datatypes ((List!4366 0))(
  ( (Nil!4363) (Cons!4362 (h!5029 (_ BitVec 64)) (t!9448 List!4366)) )
))
(declare-fun arrayNoDuplicates!0 (array!13817 (_ BitVec 32) List!4366) Bool)

(assert (=> b!277484 (= res!141370 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4363))))

(declare-fun b!277485 () Bool)

(declare-fun lt!137949 () Unit!8749)

(assert (=> b!277485 (= e!177068 lt!137949)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8749)

(assert (=> b!277485 (= lt!137949 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13817 (_ BitVec 32)) Bool)

(assert (=> b!277485 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13818 (store (arr!6558 a!3325) i!1267 k0!2581) (size!6910 a!3325)) mask!3868)))

(declare-fun b!277486 () Bool)

(declare-fun res!141369 () Bool)

(assert (=> b!277486 (=> (not res!141369) (not e!177065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277486 (= res!141369 (validKeyInArray!0 k0!2581))))

(declare-fun b!277487 () Bool)

(declare-fun res!141368 () Bool)

(assert (=> b!277487 (=> (not res!141368) (not e!177067))))

(assert (=> b!277487 (= res!141368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26720 res!141373) b!277482))

(assert (= (and b!277482 res!141375) b!277486))

(assert (= (and b!277486 res!141369) b!277484))

(assert (= (and b!277484 res!141370) b!277478))

(assert (= (and b!277478 res!141371) b!277479))

(assert (= (and b!277479 res!141374) b!277487))

(assert (= (and b!277487 res!141368) b!277481))

(assert (= (and b!277481 res!141372) b!277483))

(assert (= (and b!277483 c!45606) b!277485))

(assert (= (and b!277483 (not c!45606)) b!277480))

(declare-fun m!292511 () Bool)

(assert (=> b!277485 m!292511))

(declare-fun m!292513 () Bool)

(assert (=> b!277485 m!292513))

(declare-fun m!292515 () Bool)

(assert (=> b!277485 m!292515))

(declare-fun m!292517 () Bool)

(assert (=> b!277479 m!292517))

(declare-fun m!292519 () Bool)

(assert (=> b!277487 m!292519))

(declare-fun m!292521 () Bool)

(assert (=> start!26720 m!292521))

(declare-fun m!292523 () Bool)

(assert (=> start!26720 m!292523))

(declare-fun m!292525 () Bool)

(assert (=> b!277484 m!292525))

(declare-fun m!292527 () Bool)

(assert (=> b!277486 m!292527))

(declare-fun m!292529 () Bool)

(assert (=> b!277478 m!292529))

(check-sat (not b!277486) (not b!277478) (not b!277479) (not b!277484) (not b!277485) (not start!26720) (not b!277487))
(check-sat)
