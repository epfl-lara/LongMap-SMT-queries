; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26340 () Bool)

(assert start!26340)

(declare-fun b!273009 () Bool)

(declare-fun res!137001 () Bool)

(declare-fun e!175065 () Bool)

(assert (=> b!273009 (=> (not res!137001) (not e!175065))))

(declare-datatypes ((array!13437 0))(
  ( (array!13438 (arr!6368 (Array (_ BitVec 32) (_ BitVec 64))) (size!6720 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13437)

(declare-datatypes ((List!4176 0))(
  ( (Nil!4173) (Cons!4172 (h!4839 (_ BitVec 64)) (t!9258 List!4176)) )
))
(declare-fun arrayNoDuplicates!0 (array!13437 (_ BitVec 32) List!4176) Bool)

(assert (=> b!273009 (= res!137001 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4173))))

(declare-fun b!273010 () Bool)

(declare-fun res!137003 () Bool)

(assert (=> b!273010 (=> (not res!137003) (not e!175065))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273010 (= res!137003 (validKeyInArray!0 k!2581))))

(declare-fun b!273011 () Bool)

(declare-fun e!175064 () Bool)

(declare-fun e!175066 () Bool)

(assert (=> b!273011 (= e!175064 e!175066)))

(declare-fun res!137004 () Bool)

(assert (=> b!273011 (=> (not res!137004) (not e!175066))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273011 (= res!137004 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136168 () array!13437)

(assert (=> b!273011 (= lt!136168 (array!13438 (store (arr!6368 a!3325) i!1267 k!2581) (size!6720 a!3325)))))

(declare-fun b!273012 () Bool)

(declare-fun res!137007 () Bool)

(assert (=> b!273012 (=> (not res!137007) (not e!175065))))

(declare-fun arrayContainsKey!0 (array!13437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273012 (= res!137007 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!136999 () Bool)

(assert (=> start!26340 (=> (not res!136999) (not e!175065))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26340 (= res!136999 (validMask!0 mask!3868))))

(assert (=> start!26340 e!175065))

(declare-fun array_inv!4331 (array!13437) Bool)

(assert (=> start!26340 (array_inv!4331 a!3325)))

(assert (=> start!26340 true))

(declare-fun b!273013 () Bool)

(assert (=> b!273013 (= e!175065 e!175064)))

(declare-fun res!137000 () Bool)

(assert (=> b!273013 (=> (not res!137000) (not e!175064))))

(declare-datatypes ((SeekEntryResult!1526 0))(
  ( (MissingZero!1526 (index!8274 (_ BitVec 32))) (Found!1526 (index!8275 (_ BitVec 32))) (Intermediate!1526 (undefined!2338 Bool) (index!8276 (_ BitVec 32)) (x!26587 (_ BitVec 32))) (Undefined!1526) (MissingVacant!1526 (index!8277 (_ BitVec 32))) )
))
(declare-fun lt!136171 () SeekEntryResult!1526)

(assert (=> b!273013 (= res!137000 (or (= lt!136171 (MissingZero!1526 i!1267)) (= lt!136171 (MissingVacant!1526 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13437 (_ BitVec 32)) SeekEntryResult!1526)

(assert (=> b!273013 (= lt!136171 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273014 () Bool)

(declare-fun res!137002 () Bool)

(assert (=> b!273014 (=> (not res!137002) (not e!175066))))

(assert (=> b!273014 (= res!137002 (validKeyInArray!0 (select (arr!6368 a!3325) startIndex!26)))))

(declare-fun b!273015 () Bool)

(declare-fun res!137006 () Bool)

(assert (=> b!273015 (=> (not res!137006) (not e!175065))))

(assert (=> b!273015 (= res!137006 (and (= (size!6720 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6720 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6720 a!3325))))))

(declare-fun b!273016 () Bool)

(assert (=> b!273016 (= e!175066 (not true))))

(assert (=> b!273016 (= (seekEntryOrOpen!0 (select (arr!6368 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6368 a!3325) i!1267 k!2581) startIndex!26) lt!136168 mask!3868))))

(declare-datatypes ((Unit!8539 0))(
  ( (Unit!8540) )
))
(declare-fun lt!136170 () Unit!8539)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8539)

(assert (=> b!273016 (= lt!136170 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273016 (arrayNoDuplicates!0 lt!136168 #b00000000000000000000000000000000 Nil!4173)))

(declare-fun lt!136169 () Unit!8539)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4176) Unit!8539)

(assert (=> b!273016 (= lt!136169 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4173))))

(declare-fun b!273017 () Bool)

(declare-fun res!137005 () Bool)

(assert (=> b!273017 (=> (not res!137005) (not e!175064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13437 (_ BitVec 32)) Bool)

(assert (=> b!273017 (= res!137005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26340 res!136999) b!273015))

(assert (= (and b!273015 res!137006) b!273010))

(assert (= (and b!273010 res!137003) b!273009))

(assert (= (and b!273009 res!137001) b!273012))

(assert (= (and b!273012 res!137007) b!273013))

(assert (= (and b!273013 res!137000) b!273017))

(assert (= (and b!273017 res!137005) b!273011))

(assert (= (and b!273011 res!137004) b!273014))

(assert (= (and b!273014 res!137002) b!273016))

(declare-fun m!288093 () Bool)

(assert (=> b!273014 m!288093))

(assert (=> b!273014 m!288093))

(declare-fun m!288095 () Bool)

(assert (=> b!273014 m!288095))

(declare-fun m!288097 () Bool)

(assert (=> b!273009 m!288097))

(declare-fun m!288099 () Bool)

(assert (=> b!273012 m!288099))

(declare-fun m!288101 () Bool)

(assert (=> b!273017 m!288101))

(declare-fun m!288103 () Bool)

(assert (=> b!273010 m!288103))

(declare-fun m!288105 () Bool)

(assert (=> b!273016 m!288105))

(declare-fun m!288107 () Bool)

(assert (=> b!273016 m!288107))

(assert (=> b!273016 m!288093))

(declare-fun m!288109 () Bool)

(assert (=> b!273016 m!288109))

(declare-fun m!288111 () Bool)

(assert (=> b!273016 m!288111))

(assert (=> b!273016 m!288093))

(declare-fun m!288113 () Bool)

(assert (=> b!273016 m!288113))

(declare-fun m!288115 () Bool)

(assert (=> b!273016 m!288115))

(assert (=> b!273016 m!288105))

(declare-fun m!288117 () Bool)

(assert (=> b!273016 m!288117))

(assert (=> b!273011 m!288107))

(declare-fun m!288119 () Bool)

(assert (=> start!26340 m!288119))

(declare-fun m!288121 () Bool)

(assert (=> start!26340 m!288121))

(declare-fun m!288123 () Bool)

(assert (=> b!273013 m!288123))

(push 1)

