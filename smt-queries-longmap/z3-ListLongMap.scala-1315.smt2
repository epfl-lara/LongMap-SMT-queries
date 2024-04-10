; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26450 () Bool)

(assert start!26450)

(declare-fun b!274526 () Bool)

(declare-fun res!138520 () Bool)

(declare-fun e!175758 () Bool)

(assert (=> b!274526 (=> (not res!138520) (not e!175758))))

(declare-datatypes ((array!13547 0))(
  ( (array!13548 (arr!6423 (Array (_ BitVec 32) (_ BitVec 64))) (size!6775 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13547)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13547 (_ BitVec 32)) Bool)

(assert (=> b!274526 (= res!138520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274527 () Bool)

(declare-fun res!138524 () Bool)

(declare-fun e!175756 () Bool)

(assert (=> b!274527 (=> (not res!138524) (not e!175756))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274527 (= res!138524 (validKeyInArray!0 k0!2581))))

(declare-fun b!274528 () Bool)

(declare-fun res!138522 () Bool)

(assert (=> b!274528 (=> (not res!138522) (not e!175756))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274528 (= res!138522 (and (= (size!6775 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6775 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6775 a!3325))))))

(declare-fun b!274529 () Bool)

(declare-fun e!175760 () Bool)

(assert (=> b!274529 (= e!175758 e!175760)))

(declare-fun res!138525 () Bool)

(assert (=> b!274529 (=> (not res!138525) (not e!175760))))

(assert (=> b!274529 (= res!138525 (not (= startIndex!26 i!1267)))))

(declare-fun lt!137000 () array!13547)

(assert (=> b!274529 (= lt!137000 (array!13548 (store (arr!6423 a!3325) i!1267 k0!2581) (size!6775 a!3325)))))

(declare-fun b!274530 () Bool)

(declare-fun res!138521 () Bool)

(assert (=> b!274530 (=> (not res!138521) (not e!175760))))

(assert (=> b!274530 (= res!138521 (validKeyInArray!0 (select (arr!6423 a!3325) startIndex!26)))))

(declare-fun b!274532 () Bool)

(declare-fun e!175759 () Bool)

(assert (=> b!274532 (= e!175759 (bvsle startIndex!26 (size!6775 a!3325)))))

(assert (=> b!274532 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!137000 mask!3868)))

(declare-datatypes ((Unit!8649 0))(
  ( (Unit!8650) )
))
(declare-fun lt!137002 () Unit!8649)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8649)

(assert (=> b!274532 (= lt!137002 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274533 () Bool)

(declare-fun res!138518 () Bool)

(assert (=> b!274533 (=> (not res!138518) (not e!175756))))

(declare-fun arrayContainsKey!0 (array!13547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274533 (= res!138518 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274534 () Bool)

(assert (=> b!274534 (= e!175760 (not e!175759))))

(declare-fun res!138516 () Bool)

(assert (=> b!274534 (=> res!138516 e!175759)))

(assert (=> b!274534 (= res!138516 (or (bvsge startIndex!26 (bvsub (size!6775 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274534 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!137004 () Unit!8649)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8649)

(assert (=> b!274534 (= lt!137004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1581 0))(
  ( (MissingZero!1581 (index!8494 (_ BitVec 32))) (Found!1581 (index!8495 (_ BitVec 32))) (Intermediate!1581 (undefined!2393 Bool) (index!8496 (_ BitVec 32)) (x!26786 (_ BitVec 32))) (Undefined!1581) (MissingVacant!1581 (index!8497 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13547 (_ BitVec 32)) SeekEntryResult!1581)

(assert (=> b!274534 (= (seekEntryOrOpen!0 (select (arr!6423 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6423 a!3325) i!1267 k0!2581) startIndex!26) lt!137000 mask!3868))))

(declare-fun lt!137001 () Unit!8649)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8649)

(assert (=> b!274534 (= lt!137001 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4231 0))(
  ( (Nil!4228) (Cons!4227 (h!4894 (_ BitVec 64)) (t!9313 List!4231)) )
))
(declare-fun arrayNoDuplicates!0 (array!13547 (_ BitVec 32) List!4231) Bool)

(assert (=> b!274534 (arrayNoDuplicates!0 lt!137000 #b00000000000000000000000000000000 Nil!4228)))

(declare-fun lt!137003 () Unit!8649)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13547 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4231) Unit!8649)

(assert (=> b!274534 (= lt!137003 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4228))))

(declare-fun b!274535 () Bool)

(declare-fun res!138519 () Bool)

(assert (=> b!274535 (=> (not res!138519) (not e!175756))))

(assert (=> b!274535 (= res!138519 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4228))))

(declare-fun b!274531 () Bool)

(assert (=> b!274531 (= e!175756 e!175758)))

(declare-fun res!138517 () Bool)

(assert (=> b!274531 (=> (not res!138517) (not e!175758))))

(declare-fun lt!137005 () SeekEntryResult!1581)

(assert (=> b!274531 (= res!138517 (or (= lt!137005 (MissingZero!1581 i!1267)) (= lt!137005 (MissingVacant!1581 i!1267))))))

(assert (=> b!274531 (= lt!137005 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!138523 () Bool)

(assert (=> start!26450 (=> (not res!138523) (not e!175756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26450 (= res!138523 (validMask!0 mask!3868))))

(assert (=> start!26450 e!175756))

(declare-fun array_inv!4386 (array!13547) Bool)

(assert (=> start!26450 (array_inv!4386 a!3325)))

(assert (=> start!26450 true))

(assert (= (and start!26450 res!138523) b!274528))

(assert (= (and b!274528 res!138522) b!274527))

(assert (= (and b!274527 res!138524) b!274535))

(assert (= (and b!274535 res!138519) b!274533))

(assert (= (and b!274533 res!138518) b!274531))

(assert (= (and b!274531 res!138517) b!274526))

(assert (= (and b!274526 res!138520) b!274529))

(assert (= (and b!274529 res!138525) b!274530))

(assert (= (and b!274530 res!138521) b!274534))

(assert (= (and b!274534 (not res!138516)) b!274532))

(declare-fun m!290077 () Bool)

(assert (=> b!274535 m!290077))

(declare-fun m!290079 () Bool)

(assert (=> b!274534 m!290079))

(declare-fun m!290081 () Bool)

(assert (=> b!274534 m!290081))

(declare-fun m!290083 () Bool)

(assert (=> b!274534 m!290083))

(declare-fun m!290085 () Bool)

(assert (=> b!274534 m!290085))

(declare-fun m!290087 () Bool)

(assert (=> b!274534 m!290087))

(declare-fun m!290089 () Bool)

(assert (=> b!274534 m!290089))

(declare-fun m!290091 () Bool)

(assert (=> b!274534 m!290091))

(declare-fun m!290093 () Bool)

(assert (=> b!274534 m!290093))

(assert (=> b!274534 m!290081))

(declare-fun m!290095 () Bool)

(assert (=> b!274534 m!290095))

(assert (=> b!274534 m!290087))

(declare-fun m!290097 () Bool)

(assert (=> b!274534 m!290097))

(declare-fun m!290099 () Bool)

(assert (=> start!26450 m!290099))

(declare-fun m!290101 () Bool)

(assert (=> start!26450 m!290101))

(declare-fun m!290103 () Bool)

(assert (=> b!274531 m!290103))

(declare-fun m!290105 () Bool)

(assert (=> b!274526 m!290105))

(declare-fun m!290107 () Bool)

(assert (=> b!274527 m!290107))

(declare-fun m!290109 () Bool)

(assert (=> b!274533 m!290109))

(declare-fun m!290111 () Bool)

(assert (=> b!274532 m!290111))

(declare-fun m!290113 () Bool)

(assert (=> b!274532 m!290113))

(assert (=> b!274529 m!290083))

(assert (=> b!274530 m!290087))

(assert (=> b!274530 m!290087))

(declare-fun m!290115 () Bool)

(assert (=> b!274530 m!290115))

(check-sat (not b!274526) (not b!274530) (not start!26450) (not b!274533) (not b!274531) (not b!274527) (not b!274534) (not b!274532) (not b!274535))
(check-sat)
