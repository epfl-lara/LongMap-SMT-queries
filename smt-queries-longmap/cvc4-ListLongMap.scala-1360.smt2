; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26722 () Bool)

(assert start!26722)

(declare-fun b!277508 () Bool)

(declare-fun res!141396 () Bool)

(declare-fun e!177079 () Bool)

(assert (=> b!277508 (=> (not res!141396) (not e!177079))))

(declare-datatypes ((array!13819 0))(
  ( (array!13820 (arr!6559 (Array (_ BitVec 32) (_ BitVec 64))) (size!6911 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13819)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277508 (= res!141396 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277509 () Bool)

(declare-datatypes ((Unit!8752 0))(
  ( (Unit!8753) )
))
(declare-fun e!177080 () Unit!8752)

(declare-fun lt!137958 () Unit!8752)

(assert (=> b!277509 (= e!177080 lt!137958)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8752)

(assert (=> b!277509 (= lt!137958 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13819 (_ BitVec 32)) Bool)

(assert (=> b!277509 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13820 (store (arr!6559 a!3325) i!1267 k!2581) (size!6911 a!3325)) mask!3868)))

(declare-fun b!277510 () Bool)

(declare-fun res!141398 () Bool)

(declare-fun e!177077 () Bool)

(assert (=> b!277510 (=> (not res!141398) (not e!177077))))

(assert (=> b!277510 (= res!141398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277511 () Bool)

(assert (=> b!277511 (= e!177079 e!177077)))

(declare-fun res!141397 () Bool)

(assert (=> b!277511 (=> (not res!141397) (not e!177077))))

(declare-datatypes ((SeekEntryResult!1717 0))(
  ( (MissingZero!1717 (index!9038 (_ BitVec 32))) (Found!1717 (index!9039 (_ BitVec 32))) (Intermediate!1717 (undefined!2529 Bool) (index!9040 (_ BitVec 32)) (x!27282 (_ BitVec 32))) (Undefined!1717) (MissingVacant!1717 (index!9041 (_ BitVec 32))) )
))
(declare-fun lt!137957 () SeekEntryResult!1717)

(assert (=> b!277511 (= res!141397 (or (= lt!137957 (MissingZero!1717 i!1267)) (= lt!137957 (MissingVacant!1717 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13819 (_ BitVec 32)) SeekEntryResult!1717)

(assert (=> b!277511 (= lt!137957 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277512 () Bool)

(declare-fun res!141394 () Bool)

(assert (=> b!277512 (=> (not res!141394) (not e!177079))))

(assert (=> b!277512 (= res!141394 (and (= (size!6911 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6911 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6911 a!3325))))))

(declare-fun b!277513 () Bool)

(declare-fun Unit!8754 () Unit!8752)

(assert (=> b!277513 (= e!177080 Unit!8754)))

(declare-fun b!277514 () Bool)

(declare-fun res!141395 () Bool)

(assert (=> b!277514 (=> (not res!141395) (not e!177077))))

(assert (=> b!277514 (= res!141395 (= startIndex!26 i!1267))))

(declare-fun b!277515 () Bool)

(declare-fun res!141399 () Bool)

(assert (=> b!277515 (=> (not res!141399) (not e!177079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277515 (= res!141399 (validKeyInArray!0 k!2581))))

(declare-fun b!277516 () Bool)

(assert (=> b!277516 (= e!177077 false)))

(declare-fun lt!137959 () Unit!8752)

(assert (=> b!277516 (= lt!137959 e!177080)))

(declare-fun c!45609 () Bool)

(assert (=> b!277516 (= c!45609 (bvslt startIndex!26 (bvsub (size!6911 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141393 () Bool)

(assert (=> start!26722 (=> (not res!141393) (not e!177079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26722 (= res!141393 (validMask!0 mask!3868))))

(assert (=> start!26722 e!177079))

(declare-fun array_inv!4522 (array!13819) Bool)

(assert (=> start!26722 (array_inv!4522 a!3325)))

(assert (=> start!26722 true))

(declare-fun b!277517 () Bool)

(declare-fun res!141392 () Bool)

(assert (=> b!277517 (=> (not res!141392) (not e!177079))))

(declare-datatypes ((List!4367 0))(
  ( (Nil!4364) (Cons!4363 (h!5030 (_ BitVec 64)) (t!9449 List!4367)) )
))
(declare-fun arrayNoDuplicates!0 (array!13819 (_ BitVec 32) List!4367) Bool)

(assert (=> b!277517 (= res!141392 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4364))))

(assert (= (and start!26722 res!141393) b!277512))

(assert (= (and b!277512 res!141394) b!277515))

(assert (= (and b!277515 res!141399) b!277517))

(assert (= (and b!277517 res!141392) b!277508))

(assert (= (and b!277508 res!141396) b!277511))

(assert (= (and b!277511 res!141397) b!277510))

(assert (= (and b!277510 res!141398) b!277514))

(assert (= (and b!277514 res!141395) b!277516))

(assert (= (and b!277516 c!45609) b!277509))

(assert (= (and b!277516 (not c!45609)) b!277513))

(declare-fun m!292531 () Bool)

(assert (=> b!277517 m!292531))

(declare-fun m!292533 () Bool)

(assert (=> b!277510 m!292533))

(declare-fun m!292535 () Bool)

(assert (=> b!277515 m!292535))

(declare-fun m!292537 () Bool)

(assert (=> b!277511 m!292537))

(declare-fun m!292539 () Bool)

(assert (=> b!277509 m!292539))

(declare-fun m!292541 () Bool)

(assert (=> b!277509 m!292541))

(declare-fun m!292543 () Bool)

(assert (=> b!277509 m!292543))

(declare-fun m!292545 () Bool)

(assert (=> b!277508 m!292545))

(declare-fun m!292547 () Bool)

(assert (=> start!26722 m!292547))

(declare-fun m!292549 () Bool)

(assert (=> start!26722 m!292549))

(push 1)

(assert (not b!277511))

(assert (not b!277517))

(assert (not b!277515))

(assert (not b!277510))

(assert (not start!26722))

(assert (not b!277509))

(assert (not b!277508))

(check-sat)

