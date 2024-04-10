; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26230 () Bool)

(assert start!26230)

(declare-fun b!271412 () Bool)

(declare-fun res!135404 () Bool)

(declare-fun e!174549 () Bool)

(assert (=> b!271412 (=> (not res!135404) (not e!174549))))

(declare-datatypes ((array!13327 0))(
  ( (array!13328 (arr!6313 (Array (_ BitVec 32) (_ BitVec 64))) (size!6665 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13327)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271412 (= res!135404 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271413 () Bool)

(declare-fun e!174551 () Bool)

(assert (=> b!271413 (= e!174551 false)))

(declare-fun lt!135799 () Bool)

(declare-datatypes ((List!4121 0))(
  ( (Nil!4118) (Cons!4117 (h!4784 (_ BitVec 64)) (t!9203 List!4121)) )
))
(declare-fun contains!1951 (List!4121 (_ BitVec 64)) Bool)

(assert (=> b!271413 (= lt!135799 (contains!1951 Nil!4118 k!2581))))

(declare-fun b!271414 () Bool)

(declare-fun res!135413 () Bool)

(assert (=> b!271414 (=> (not res!135413) (not e!174549))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271414 (= res!135413 (and (= (size!6665 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6665 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6665 a!3325))))))

(declare-fun b!271415 () Bool)

(declare-fun res!135407 () Bool)

(assert (=> b!271415 (=> (not res!135407) (not e!174551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271415 (= res!135407 (validKeyInArray!0 (select (arr!6313 a!3325) startIndex!26)))))

(declare-fun b!271416 () Bool)

(declare-fun res!135408 () Bool)

(assert (=> b!271416 (=> (not res!135408) (not e!174551))))

(declare-fun noDuplicate!139 (List!4121) Bool)

(assert (=> b!271416 (= res!135408 (noDuplicate!139 Nil!4118))))

(declare-fun b!271417 () Bool)

(declare-fun res!135414 () Bool)

(assert (=> b!271417 (=> (not res!135414) (not e!174551))))

(assert (=> b!271417 (= res!135414 (not (= startIndex!26 i!1267)))))

(declare-fun b!271418 () Bool)

(declare-fun res!135411 () Bool)

(assert (=> b!271418 (=> (not res!135411) (not e!174551))))

(assert (=> b!271418 (= res!135411 (and (bvslt (size!6665 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6665 a!3325))))))

(declare-fun b!271419 () Bool)

(declare-fun res!135405 () Bool)

(assert (=> b!271419 (=> (not res!135405) (not e!174551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13327 (_ BitVec 32)) Bool)

(assert (=> b!271419 (= res!135405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271420 () Bool)

(declare-fun res!135406 () Bool)

(assert (=> b!271420 (=> (not res!135406) (not e!174549))))

(declare-fun arrayNoDuplicates!0 (array!13327 (_ BitVec 32) List!4121) Bool)

(assert (=> b!271420 (= res!135406 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4118))))

(declare-fun b!271421 () Bool)

(declare-fun res!135402 () Bool)

(assert (=> b!271421 (=> (not res!135402) (not e!174549))))

(assert (=> b!271421 (= res!135402 (validKeyInArray!0 k!2581))))

(declare-fun b!271422 () Bool)

(declare-fun res!135412 () Bool)

(assert (=> b!271422 (=> (not res!135412) (not e!174551))))

(assert (=> b!271422 (= res!135412 (not (contains!1951 Nil!4118 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271423 () Bool)

(assert (=> b!271423 (= e!174549 e!174551)))

(declare-fun res!135410 () Bool)

(assert (=> b!271423 (=> (not res!135410) (not e!174551))))

(declare-datatypes ((SeekEntryResult!1471 0))(
  ( (MissingZero!1471 (index!8054 (_ BitVec 32))) (Found!1471 (index!8055 (_ BitVec 32))) (Intermediate!1471 (undefined!2283 Bool) (index!8056 (_ BitVec 32)) (x!26380 (_ BitVec 32))) (Undefined!1471) (MissingVacant!1471 (index!8057 (_ BitVec 32))) )
))
(declare-fun lt!135798 () SeekEntryResult!1471)

(assert (=> b!271423 (= res!135410 (or (= lt!135798 (MissingZero!1471 i!1267)) (= lt!135798 (MissingVacant!1471 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13327 (_ BitVec 32)) SeekEntryResult!1471)

(assert (=> b!271423 (= lt!135798 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!135403 () Bool)

(assert (=> start!26230 (=> (not res!135403) (not e!174549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26230 (= res!135403 (validMask!0 mask!3868))))

(assert (=> start!26230 e!174549))

(declare-fun array_inv!4276 (array!13327) Bool)

(assert (=> start!26230 (array_inv!4276 a!3325)))

(assert (=> start!26230 true))

(declare-fun b!271424 () Bool)

(declare-fun res!135409 () Bool)

(assert (=> b!271424 (=> (not res!135409) (not e!174551))))

(assert (=> b!271424 (= res!135409 (not (contains!1951 Nil!4118 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!26230 res!135403) b!271414))

(assert (= (and b!271414 res!135413) b!271421))

(assert (= (and b!271421 res!135402) b!271420))

(assert (= (and b!271420 res!135406) b!271412))

(assert (= (and b!271412 res!135404) b!271423))

(assert (= (and b!271423 res!135410) b!271419))

(assert (= (and b!271419 res!135405) b!271417))

(assert (= (and b!271417 res!135414) b!271415))

(assert (= (and b!271415 res!135407) b!271418))

(assert (= (and b!271418 res!135411) b!271416))

(assert (= (and b!271416 res!135408) b!271424))

(assert (= (and b!271424 res!135409) b!271422))

(assert (= (and b!271422 res!135412) b!271413))

(declare-fun m!286705 () Bool)

(assert (=> b!271415 m!286705))

(assert (=> b!271415 m!286705))

(declare-fun m!286707 () Bool)

(assert (=> b!271415 m!286707))

(declare-fun m!286709 () Bool)

(assert (=> b!271419 m!286709))

(declare-fun m!286711 () Bool)

(assert (=> b!271420 m!286711))

(declare-fun m!286713 () Bool)

(assert (=> b!271412 m!286713))

(declare-fun m!286715 () Bool)

(assert (=> b!271422 m!286715))

(declare-fun m!286717 () Bool)

(assert (=> b!271424 m!286717))

(declare-fun m!286719 () Bool)

(assert (=> b!271413 m!286719))

(declare-fun m!286721 () Bool)

(assert (=> b!271421 m!286721))

(declare-fun m!286723 () Bool)

(assert (=> start!26230 m!286723))

(declare-fun m!286725 () Bool)

(assert (=> start!26230 m!286725))

(declare-fun m!286727 () Bool)

(assert (=> b!271423 m!286727))

(declare-fun m!286729 () Bool)

(assert (=> b!271416 m!286729))

(push 1)

(assert (not b!271420))

(assert (not b!271415))

