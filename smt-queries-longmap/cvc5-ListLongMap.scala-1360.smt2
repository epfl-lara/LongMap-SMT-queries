; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26718 () Bool)

(assert start!26718)

(declare-fun b!277448 () Bool)

(declare-fun res!141351 () Bool)

(declare-fun e!177054 () Bool)

(assert (=> b!277448 (=> (not res!141351) (not e!177054))))

(declare-datatypes ((array!13815 0))(
  ( (array!13816 (arr!6557 (Array (_ BitVec 32) (_ BitVec 64))) (size!6909 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13815)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!277448 (= res!141351 (and (= (size!6909 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6909 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6909 a!3325))))))

(declare-fun res!141348 () Bool)

(assert (=> start!26718 (=> (not res!141348) (not e!177054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26718 (= res!141348 (validMask!0 mask!3868))))

(assert (=> start!26718 e!177054))

(declare-fun array_inv!4520 (array!13815) Bool)

(assert (=> start!26718 (array_inv!4520 a!3325)))

(assert (=> start!26718 true))

(declare-fun b!277449 () Bool)

(declare-fun res!141345 () Bool)

(declare-fun e!177053 () Bool)

(assert (=> b!277449 (=> (not res!141345) (not e!177053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13815 (_ BitVec 32)) Bool)

(assert (=> b!277449 (= res!141345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277450 () Bool)

(assert (=> b!277450 (= e!177054 e!177053)))

(declare-fun res!141347 () Bool)

(assert (=> b!277450 (=> (not res!141347) (not e!177053))))

(declare-datatypes ((SeekEntryResult!1715 0))(
  ( (MissingZero!1715 (index!9030 (_ BitVec 32))) (Found!1715 (index!9031 (_ BitVec 32))) (Intermediate!1715 (undefined!2527 Bool) (index!9032 (_ BitVec 32)) (x!27280 (_ BitVec 32))) (Undefined!1715) (MissingVacant!1715 (index!9033 (_ BitVec 32))) )
))
(declare-fun lt!137939 () SeekEntryResult!1715)

(assert (=> b!277450 (= res!141347 (or (= lt!137939 (MissingZero!1715 i!1267)) (= lt!137939 (MissingVacant!1715 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13815 (_ BitVec 32)) SeekEntryResult!1715)

(assert (=> b!277450 (= lt!137939 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277451 () Bool)

(declare-fun res!141349 () Bool)

(assert (=> b!277451 (=> (not res!141349) (not e!177053))))

(assert (=> b!277451 (= res!141349 (= startIndex!26 i!1267))))

(declare-fun b!277452 () Bool)

(declare-fun res!141344 () Bool)

(assert (=> b!277452 (=> (not res!141344) (not e!177054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277452 (= res!141344 (validKeyInArray!0 k!2581))))

(declare-fun b!277453 () Bool)

(declare-datatypes ((Unit!8746 0))(
  ( (Unit!8747) )
))
(declare-fun e!177055 () Unit!8746)

(declare-fun Unit!8748 () Unit!8746)

(assert (=> b!277453 (= e!177055 Unit!8748)))

(declare-fun b!277454 () Bool)

(declare-fun lt!137940 () Unit!8746)

(assert (=> b!277454 (= e!177055 lt!137940)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13815 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8746)

(assert (=> b!277454 (= lt!137940 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277454 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13816 (store (arr!6557 a!3325) i!1267 k!2581) (size!6909 a!3325)) mask!3868)))

(declare-fun b!277455 () Bool)

(declare-fun res!141350 () Bool)

(assert (=> b!277455 (=> (not res!141350) (not e!177054))))

(declare-fun arrayContainsKey!0 (array!13815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277455 (= res!141350 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277456 () Bool)

(declare-fun res!141346 () Bool)

(assert (=> b!277456 (=> (not res!141346) (not e!177054))))

(declare-datatypes ((List!4365 0))(
  ( (Nil!4362) (Cons!4361 (h!5028 (_ BitVec 64)) (t!9447 List!4365)) )
))
(declare-fun arrayNoDuplicates!0 (array!13815 (_ BitVec 32) List!4365) Bool)

(assert (=> b!277456 (= res!141346 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4362))))

(declare-fun b!277457 () Bool)

(assert (=> b!277457 (= e!177053 false)))

(declare-fun lt!137941 () Unit!8746)

(assert (=> b!277457 (= lt!137941 e!177055)))

(declare-fun c!45603 () Bool)

(assert (=> b!277457 (= c!45603 (bvslt startIndex!26 (bvsub (size!6909 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26718 res!141348) b!277448))

(assert (= (and b!277448 res!141351) b!277452))

(assert (= (and b!277452 res!141344) b!277456))

(assert (= (and b!277456 res!141346) b!277455))

(assert (= (and b!277455 res!141350) b!277450))

(assert (= (and b!277450 res!141347) b!277449))

(assert (= (and b!277449 res!141345) b!277451))

(assert (= (and b!277451 res!141349) b!277457))

(assert (= (and b!277457 c!45603) b!277454))

(assert (= (and b!277457 (not c!45603)) b!277453))

(declare-fun m!292491 () Bool)

(assert (=> b!277450 m!292491))

(declare-fun m!292493 () Bool)

(assert (=> b!277449 m!292493))

(declare-fun m!292495 () Bool)

(assert (=> start!26718 m!292495))

(declare-fun m!292497 () Bool)

(assert (=> start!26718 m!292497))

(declare-fun m!292499 () Bool)

(assert (=> b!277456 m!292499))

(declare-fun m!292501 () Bool)

(assert (=> b!277454 m!292501))

(declare-fun m!292503 () Bool)

(assert (=> b!277454 m!292503))

(declare-fun m!292505 () Bool)

(assert (=> b!277454 m!292505))

(declare-fun m!292507 () Bool)

(assert (=> b!277452 m!292507))

(declare-fun m!292509 () Bool)

(assert (=> b!277455 m!292509))

(push 1)

