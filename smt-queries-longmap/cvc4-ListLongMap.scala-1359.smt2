; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26716 () Bool)

(assert start!26716)

(declare-fun b!277418 () Bool)

(declare-fun res!141327 () Bool)

(declare-fun e!177041 () Bool)

(assert (=> b!277418 (=> (not res!141327) (not e!177041))))

(declare-datatypes ((array!13813 0))(
  ( (array!13814 (arr!6556 (Array (_ BitVec 32) (_ BitVec 64))) (size!6908 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13813)

(declare-datatypes ((List!4364 0))(
  ( (Nil!4361) (Cons!4360 (h!5027 (_ BitVec 64)) (t!9446 List!4364)) )
))
(declare-fun arrayNoDuplicates!0 (array!13813 (_ BitVec 32) List!4364) Bool)

(assert (=> b!277418 (= res!141327 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4361))))

(declare-fun res!141324 () Bool)

(assert (=> start!26716 (=> (not res!141324) (not e!177041))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26716 (= res!141324 (validMask!0 mask!3868))))

(assert (=> start!26716 e!177041))

(declare-fun array_inv!4519 (array!13813) Bool)

(assert (=> start!26716 (array_inv!4519 a!3325)))

(assert (=> start!26716 true))

(declare-fun b!277419 () Bool)

(declare-fun res!141320 () Bool)

(declare-fun e!177044 () Bool)

(assert (=> b!277419 (=> (not res!141320) (not e!177044))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277419 (= res!141320 (= startIndex!26 i!1267))))

(declare-fun b!277420 () Bool)

(assert (=> b!277420 (= e!177041 e!177044)))

(declare-fun res!141325 () Bool)

(assert (=> b!277420 (=> (not res!141325) (not e!177044))))

(declare-datatypes ((SeekEntryResult!1714 0))(
  ( (MissingZero!1714 (index!9026 (_ BitVec 32))) (Found!1714 (index!9027 (_ BitVec 32))) (Intermediate!1714 (undefined!2526 Bool) (index!9028 (_ BitVec 32)) (x!27271 (_ BitVec 32))) (Undefined!1714) (MissingVacant!1714 (index!9029 (_ BitVec 32))) )
))
(declare-fun lt!137930 () SeekEntryResult!1714)

(assert (=> b!277420 (= res!141325 (or (= lt!137930 (MissingZero!1714 i!1267)) (= lt!137930 (MissingVacant!1714 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13813 (_ BitVec 32)) SeekEntryResult!1714)

(assert (=> b!277420 (= lt!137930 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277421 () Bool)

(declare-fun res!141322 () Bool)

(assert (=> b!277421 (=> (not res!141322) (not e!177041))))

(declare-fun arrayContainsKey!0 (array!13813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277421 (= res!141322 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277422 () Bool)

(declare-datatypes ((Unit!8743 0))(
  ( (Unit!8744) )
))
(declare-fun e!177042 () Unit!8743)

(declare-fun lt!137931 () Unit!8743)

(assert (=> b!277422 (= e!177042 lt!137931)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13813 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8743)

(assert (=> b!277422 (= lt!137931 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13813 (_ BitVec 32)) Bool)

(assert (=> b!277422 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13814 (store (arr!6556 a!3325) i!1267 k!2581) (size!6908 a!3325)) mask!3868)))

(declare-fun b!277423 () Bool)

(declare-fun res!141326 () Bool)

(assert (=> b!277423 (=> (not res!141326) (not e!177041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277423 (= res!141326 (validKeyInArray!0 k!2581))))

(declare-fun b!277424 () Bool)

(declare-fun res!141323 () Bool)

(assert (=> b!277424 (=> (not res!141323) (not e!177044))))

(assert (=> b!277424 (= res!141323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277425 () Bool)

(declare-fun Unit!8745 () Unit!8743)

(assert (=> b!277425 (= e!177042 Unit!8745)))

(declare-fun b!277426 () Bool)

(assert (=> b!277426 (= e!177044 false)))

(declare-fun lt!137932 () Unit!8743)

(assert (=> b!277426 (= lt!137932 e!177042)))

(declare-fun c!45600 () Bool)

(assert (=> b!277426 (= c!45600 (bvslt startIndex!26 (bvsub (size!6908 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277427 () Bool)

(declare-fun res!141321 () Bool)

(assert (=> b!277427 (=> (not res!141321) (not e!177041))))

(assert (=> b!277427 (= res!141321 (and (= (size!6908 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6908 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6908 a!3325))))))

(assert (= (and start!26716 res!141324) b!277427))

(assert (= (and b!277427 res!141321) b!277423))

(assert (= (and b!277423 res!141326) b!277418))

(assert (= (and b!277418 res!141327) b!277421))

(assert (= (and b!277421 res!141322) b!277420))

(assert (= (and b!277420 res!141325) b!277424))

(assert (= (and b!277424 res!141323) b!277419))

(assert (= (and b!277419 res!141320) b!277426))

(assert (= (and b!277426 c!45600) b!277422))

(assert (= (and b!277426 (not c!45600)) b!277425))

(declare-fun m!292471 () Bool)

(assert (=> start!26716 m!292471))

(declare-fun m!292473 () Bool)

(assert (=> start!26716 m!292473))

(declare-fun m!292475 () Bool)

(assert (=> b!277420 m!292475))

(declare-fun m!292477 () Bool)

(assert (=> b!277418 m!292477))

(declare-fun m!292479 () Bool)

(assert (=> b!277423 m!292479))

(declare-fun m!292481 () Bool)

(assert (=> b!277424 m!292481))

(declare-fun m!292483 () Bool)

(assert (=> b!277421 m!292483))

(declare-fun m!292485 () Bool)

(assert (=> b!277422 m!292485))

(declare-fun m!292487 () Bool)

(assert (=> b!277422 m!292487))

(declare-fun m!292489 () Bool)

(assert (=> b!277422 m!292489))

(push 1)

(assert (not b!277424))

(assert (not b!277420))

(assert (not b!277423))

(assert (not start!26716))

(assert (not b!277422))

(assert (not b!277421))

