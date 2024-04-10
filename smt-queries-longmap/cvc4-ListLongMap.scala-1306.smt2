; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26398 () Bool)

(assert start!26398)

(declare-fun b!273792 () Bool)

(declare-fun res!137783 () Bool)

(declare-fun e!175414 () Bool)

(assert (=> b!273792 (=> (not res!137783) (not e!175414))))

(declare-datatypes ((array!13495 0))(
  ( (array!13496 (arr!6397 (Array (_ BitVec 32) (_ BitVec 64))) (size!6749 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13495)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273792 (= res!137783 (and (= (size!6749 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6749 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6749 a!3325))))))

(declare-fun b!273793 () Bool)

(declare-fun res!137789 () Bool)

(assert (=> b!273793 (=> (not res!137789) (not e!175414))))

(declare-datatypes ((List!4205 0))(
  ( (Nil!4202) (Cons!4201 (h!4868 (_ BitVec 64)) (t!9287 List!4205)) )
))
(declare-fun arrayNoDuplicates!0 (array!13495 (_ BitVec 32) List!4205) Bool)

(assert (=> b!273793 (= res!137789 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4202))))

(declare-fun b!273794 () Bool)

(declare-fun res!137787 () Bool)

(assert (=> b!273794 (=> (not res!137787) (not e!175414))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273794 (= res!137787 (validKeyInArray!0 k!2581))))

(declare-fun b!273795 () Bool)

(declare-fun e!175415 () Bool)

(declare-fun e!175412 () Bool)

(assert (=> b!273795 (= e!175415 e!175412)))

(declare-fun res!137784 () Bool)

(assert (=> b!273795 (=> (not res!137784) (not e!175412))))

(assert (=> b!273795 (= res!137784 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136578 () array!13495)

(assert (=> b!273795 (= lt!136578 (array!13496 (store (arr!6397 a!3325) i!1267 k!2581) (size!6749 a!3325)))))

(declare-fun b!273796 () Bool)

(assert (=> b!273796 (= e!175414 e!175415)))

(declare-fun res!137790 () Bool)

(assert (=> b!273796 (=> (not res!137790) (not e!175415))))

(declare-datatypes ((SeekEntryResult!1555 0))(
  ( (MissingZero!1555 (index!8390 (_ BitVec 32))) (Found!1555 (index!8391 (_ BitVec 32))) (Intermediate!1555 (undefined!2367 Bool) (index!8392 (_ BitVec 32)) (x!26688 (_ BitVec 32))) (Undefined!1555) (MissingVacant!1555 (index!8393 (_ BitVec 32))) )
))
(declare-fun lt!136579 () SeekEntryResult!1555)

(assert (=> b!273796 (= res!137790 (or (= lt!136579 (MissingZero!1555 i!1267)) (= lt!136579 (MissingVacant!1555 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13495 (_ BitVec 32)) SeekEntryResult!1555)

(assert (=> b!273796 (= lt!136579 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273797 () Bool)

(assert (=> b!273797 (= e!175412 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13495 (_ BitVec 32)) Bool)

(assert (=> b!273797 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8597 0))(
  ( (Unit!8598) )
))
(declare-fun lt!136581 () Unit!8597)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8597)

(assert (=> b!273797 (= lt!136581 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273797 (= (seekEntryOrOpen!0 (select (arr!6397 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6397 a!3325) i!1267 k!2581) startIndex!26) lt!136578 mask!3868))))

(declare-fun lt!136580 () Unit!8597)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13495 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8597)

(assert (=> b!273797 (= lt!136580 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273797 (arrayNoDuplicates!0 lt!136578 #b00000000000000000000000000000000 Nil!4202)))

(declare-fun lt!136582 () Unit!8597)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13495 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4205) Unit!8597)

(assert (=> b!273797 (= lt!136582 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4202))))

(declare-fun res!137782 () Bool)

(assert (=> start!26398 (=> (not res!137782) (not e!175414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26398 (= res!137782 (validMask!0 mask!3868))))

(assert (=> start!26398 e!175414))

(declare-fun array_inv!4360 (array!13495) Bool)

(assert (=> start!26398 (array_inv!4360 a!3325)))

(assert (=> start!26398 true))

(declare-fun b!273798 () Bool)

(declare-fun res!137785 () Bool)

(assert (=> b!273798 (=> (not res!137785) (not e!175414))))

(declare-fun arrayContainsKey!0 (array!13495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273798 (= res!137785 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273799 () Bool)

(declare-fun res!137788 () Bool)

(assert (=> b!273799 (=> (not res!137788) (not e!175412))))

(assert (=> b!273799 (= res!137788 (validKeyInArray!0 (select (arr!6397 a!3325) startIndex!26)))))

(declare-fun b!273800 () Bool)

(declare-fun res!137786 () Bool)

(assert (=> b!273800 (=> (not res!137786) (not e!175415))))

(assert (=> b!273800 (= res!137786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26398 res!137782) b!273792))

(assert (= (and b!273792 res!137783) b!273794))

(assert (= (and b!273794 res!137787) b!273793))

(assert (= (and b!273793 res!137789) b!273798))

(assert (= (and b!273798 res!137785) b!273796))

(assert (= (and b!273796 res!137790) b!273800))

(assert (= (and b!273800 res!137786) b!273795))

(assert (= (and b!273795 res!137784) b!273799))

(assert (= (and b!273799 res!137788) b!273797))

(declare-fun m!289101 () Bool)

(assert (=> b!273798 m!289101))

(declare-fun m!289103 () Bool)

(assert (=> b!273794 m!289103))

(declare-fun m!289105 () Bool)

(assert (=> start!26398 m!289105))

(declare-fun m!289107 () Bool)

(assert (=> start!26398 m!289107))

(declare-fun m!289109 () Bool)

(assert (=> b!273795 m!289109))

(declare-fun m!289111 () Bool)

(assert (=> b!273799 m!289111))

(assert (=> b!273799 m!289111))

(declare-fun m!289113 () Bool)

(assert (=> b!273799 m!289113))

(declare-fun m!289115 () Bool)

(assert (=> b!273797 m!289115))

(declare-fun m!289117 () Bool)

(assert (=> b!273797 m!289117))

(declare-fun m!289119 () Bool)

(assert (=> b!273797 m!289119))

(assert (=> b!273797 m!289117))

(assert (=> b!273797 m!289109))

(declare-fun m!289121 () Bool)

(assert (=> b!273797 m!289121))

(declare-fun m!289123 () Bool)

(assert (=> b!273797 m!289123))

(assert (=> b!273797 m!289111))

(declare-fun m!289125 () Bool)

(assert (=> b!273797 m!289125))

(declare-fun m!289127 () Bool)

(assert (=> b!273797 m!289127))

(assert (=> b!273797 m!289111))

(declare-fun m!289129 () Bool)

(assert (=> b!273797 m!289129))

(declare-fun m!289131 () Bool)

(assert (=> b!273796 m!289131))

(declare-fun m!289133 () Bool)

(assert (=> b!273793 m!289133))

(declare-fun m!289135 () Bool)

(assert (=> b!273800 m!289135))

(push 1)

