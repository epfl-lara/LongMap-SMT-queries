; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26382 () Bool)

(assert start!26382)

(declare-fun b!273576 () Bool)

(declare-fun e!175318 () Bool)

(declare-fun e!175319 () Bool)

(assert (=> b!273576 (= e!175318 e!175319)))

(declare-fun res!137571 () Bool)

(assert (=> b!273576 (=> (not res!137571) (not e!175319))))

(declare-datatypes ((SeekEntryResult!1547 0))(
  ( (MissingZero!1547 (index!8358 (_ BitVec 32))) (Found!1547 (index!8359 (_ BitVec 32))) (Intermediate!1547 (undefined!2359 Bool) (index!8360 (_ BitVec 32)) (x!26664 (_ BitVec 32))) (Undefined!1547) (MissingVacant!1547 (index!8361 (_ BitVec 32))) )
))
(declare-fun lt!136460 () SeekEntryResult!1547)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273576 (= res!137571 (or (= lt!136460 (MissingZero!1547 i!1267)) (= lt!136460 (MissingVacant!1547 i!1267))))))

(declare-datatypes ((array!13479 0))(
  ( (array!13480 (arr!6389 (Array (_ BitVec 32) (_ BitVec 64))) (size!6741 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13479)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13479 (_ BitVec 32)) SeekEntryResult!1547)

(assert (=> b!273576 (= lt!136460 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273577 () Bool)

(declare-fun res!137572 () Bool)

(assert (=> b!273577 (=> (not res!137572) (not e!175318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273577 (= res!137572 (validKeyInArray!0 k!2581))))

(declare-fun b!273578 () Bool)

(declare-fun res!137573 () Bool)

(assert (=> b!273578 (=> (not res!137573) (not e!175318))))

(declare-fun arrayContainsKey!0 (array!13479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273578 (= res!137573 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273579 () Bool)

(declare-fun res!137569 () Bool)

(assert (=> b!273579 (=> (not res!137569) (not e!175318))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273579 (= res!137569 (and (= (size!6741 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6741 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6741 a!3325))))))

(declare-fun res!137566 () Bool)

(assert (=> start!26382 (=> (not res!137566) (not e!175318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26382 (= res!137566 (validMask!0 mask!3868))))

(assert (=> start!26382 e!175318))

(declare-fun array_inv!4352 (array!13479) Bool)

(assert (=> start!26382 (array_inv!4352 a!3325)))

(assert (=> start!26382 true))

(declare-fun b!273580 () Bool)

(declare-fun res!137568 () Bool)

(assert (=> b!273580 (=> (not res!137568) (not e!175318))))

(declare-datatypes ((List!4197 0))(
  ( (Nil!4194) (Cons!4193 (h!4860 (_ BitVec 64)) (t!9279 List!4197)) )
))
(declare-fun arrayNoDuplicates!0 (array!13479 (_ BitVec 32) List!4197) Bool)

(assert (=> b!273580 (= res!137568 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4194))))

(declare-fun b!273581 () Bool)

(declare-fun res!137570 () Bool)

(assert (=> b!273581 (=> (not res!137570) (not e!175319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13479 (_ BitVec 32)) Bool)

(assert (=> b!273581 (= res!137570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273582 () Bool)

(declare-fun res!137567 () Bool)

(declare-fun e!175317 () Bool)

(assert (=> b!273582 (=> (not res!137567) (not e!175317))))

(assert (=> b!273582 (= res!137567 (validKeyInArray!0 (select (arr!6389 a!3325) startIndex!26)))))

(declare-fun b!273583 () Bool)

(assert (=> b!273583 (= e!175317 (not true))))

(assert (=> b!273583 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8581 0))(
  ( (Unit!8582) )
))
(declare-fun lt!136459 () Unit!8581)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8581)

(assert (=> b!273583 (= lt!136459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136462 () array!13479)

(assert (=> b!273583 (= (seekEntryOrOpen!0 (select (arr!6389 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6389 a!3325) i!1267 k!2581) startIndex!26) lt!136462 mask!3868))))

(declare-fun lt!136461 () Unit!8581)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13479 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8581)

(assert (=> b!273583 (= lt!136461 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273583 (arrayNoDuplicates!0 lt!136462 #b00000000000000000000000000000000 Nil!4194)))

(declare-fun lt!136458 () Unit!8581)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4197) Unit!8581)

(assert (=> b!273583 (= lt!136458 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4194))))

(declare-fun b!273584 () Bool)

(assert (=> b!273584 (= e!175319 e!175317)))

(declare-fun res!137574 () Bool)

(assert (=> b!273584 (=> (not res!137574) (not e!175317))))

(assert (=> b!273584 (= res!137574 (not (= startIndex!26 i!1267)))))

(assert (=> b!273584 (= lt!136462 (array!13480 (store (arr!6389 a!3325) i!1267 k!2581) (size!6741 a!3325)))))

(assert (= (and start!26382 res!137566) b!273579))

(assert (= (and b!273579 res!137569) b!273577))

(assert (= (and b!273577 res!137572) b!273580))

(assert (= (and b!273580 res!137568) b!273578))

(assert (= (and b!273578 res!137573) b!273576))

(assert (= (and b!273576 res!137571) b!273581))

(assert (= (and b!273581 res!137570) b!273584))

(assert (= (and b!273584 res!137574) b!273582))

(assert (= (and b!273582 res!137567) b!273583))

(declare-fun m!288813 () Bool)

(assert (=> start!26382 m!288813))

(declare-fun m!288815 () Bool)

(assert (=> start!26382 m!288815))

(declare-fun m!288817 () Bool)

(assert (=> b!273576 m!288817))

(declare-fun m!288819 () Bool)

(assert (=> b!273582 m!288819))

(assert (=> b!273582 m!288819))

(declare-fun m!288821 () Bool)

(assert (=> b!273582 m!288821))

(declare-fun m!288823 () Bool)

(assert (=> b!273580 m!288823))

(declare-fun m!288825 () Bool)

(assert (=> b!273578 m!288825))

(declare-fun m!288827 () Bool)

(assert (=> b!273577 m!288827))

(declare-fun m!288829 () Bool)

(assert (=> b!273581 m!288829))

(declare-fun m!288831 () Bool)

(assert (=> b!273584 m!288831))

(declare-fun m!288833 () Bool)

(assert (=> b!273583 m!288833))

(declare-fun m!288835 () Bool)

(assert (=> b!273583 m!288835))

(assert (=> b!273583 m!288831))

(declare-fun m!288837 () Bool)

(assert (=> b!273583 m!288837))

(assert (=> b!273583 m!288819))

(declare-fun m!288839 () Bool)

(assert (=> b!273583 m!288839))

(declare-fun m!288841 () Bool)

(assert (=> b!273583 m!288841))

(assert (=> b!273583 m!288835))

(declare-fun m!288843 () Bool)

(assert (=> b!273583 m!288843))

(declare-fun m!288845 () Bool)

(assert (=> b!273583 m!288845))

(assert (=> b!273583 m!288819))

(declare-fun m!288847 () Bool)

(assert (=> b!273583 m!288847))

(push 1)

