; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26380 () Bool)

(assert start!26380)

(declare-fun b!273549 () Bool)

(declare-fun e!175305 () Bool)

(declare-fun e!175306 () Bool)

(assert (=> b!273549 (= e!175305 e!175306)))

(declare-fun res!137547 () Bool)

(assert (=> b!273549 (=> (not res!137547) (not e!175306))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273549 (= res!137547 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13477 0))(
  ( (array!13478 (arr!6388 (Array (_ BitVec 32) (_ BitVec 64))) (size!6740 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13477)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!136443 () array!13477)

(assert (=> b!273549 (= lt!136443 (array!13478 (store (arr!6388 a!3325) i!1267 k!2581) (size!6740 a!3325)))))

(declare-fun b!273550 () Bool)

(declare-fun res!137542 () Bool)

(declare-fun e!175304 () Bool)

(assert (=> b!273550 (=> (not res!137542) (not e!175304))))

(declare-fun arrayContainsKey!0 (array!13477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273550 (= res!137542 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273551 () Bool)

(declare-fun res!137544 () Bool)

(assert (=> b!273551 (=> (not res!137544) (not e!175305))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13477 (_ BitVec 32)) Bool)

(assert (=> b!273551 (= res!137544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273552 () Bool)

(declare-fun res!137539 () Bool)

(assert (=> b!273552 (=> (not res!137539) (not e!175304))))

(declare-datatypes ((List!4196 0))(
  ( (Nil!4193) (Cons!4192 (h!4859 (_ BitVec 64)) (t!9278 List!4196)) )
))
(declare-fun arrayNoDuplicates!0 (array!13477 (_ BitVec 32) List!4196) Bool)

(assert (=> b!273552 (= res!137539 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4193))))

(declare-fun res!137540 () Bool)

(assert (=> start!26380 (=> (not res!137540) (not e!175304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26380 (= res!137540 (validMask!0 mask!3868))))

(assert (=> start!26380 e!175304))

(declare-fun array_inv!4351 (array!13477) Bool)

(assert (=> start!26380 (array_inv!4351 a!3325)))

(assert (=> start!26380 true))

(declare-fun b!273553 () Bool)

(declare-fun res!137543 () Bool)

(assert (=> b!273553 (=> (not res!137543) (not e!175304))))

(assert (=> b!273553 (= res!137543 (and (= (size!6740 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6740 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6740 a!3325))))))

(declare-fun b!273554 () Bool)

(declare-fun res!137541 () Bool)

(assert (=> b!273554 (=> (not res!137541) (not e!175304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273554 (= res!137541 (validKeyInArray!0 k!2581))))

(declare-fun b!273555 () Bool)

(assert (=> b!273555 (= e!175304 e!175305)))

(declare-fun res!137546 () Bool)

(assert (=> b!273555 (=> (not res!137546) (not e!175305))))

(declare-datatypes ((SeekEntryResult!1546 0))(
  ( (MissingZero!1546 (index!8354 (_ BitVec 32))) (Found!1546 (index!8355 (_ BitVec 32))) (Intermediate!1546 (undefined!2358 Bool) (index!8356 (_ BitVec 32)) (x!26655 (_ BitVec 32))) (Undefined!1546) (MissingVacant!1546 (index!8357 (_ BitVec 32))) )
))
(declare-fun lt!136447 () SeekEntryResult!1546)

(assert (=> b!273555 (= res!137546 (or (= lt!136447 (MissingZero!1546 i!1267)) (= lt!136447 (MissingVacant!1546 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13477 (_ BitVec 32)) SeekEntryResult!1546)

(assert (=> b!273555 (= lt!136447 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273556 () Bool)

(declare-fun res!137545 () Bool)

(assert (=> b!273556 (=> (not res!137545) (not e!175306))))

(assert (=> b!273556 (= res!137545 (validKeyInArray!0 (select (arr!6388 a!3325) startIndex!26)))))

(declare-fun b!273557 () Bool)

(assert (=> b!273557 (= e!175306 (not true))))

(assert (=> b!273557 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8579 0))(
  ( (Unit!8580) )
))
(declare-fun lt!136445 () Unit!8579)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8579)

(assert (=> b!273557 (= lt!136445 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273557 (= (seekEntryOrOpen!0 (select (arr!6388 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6388 a!3325) i!1267 k!2581) startIndex!26) lt!136443 mask!3868))))

(declare-fun lt!136444 () Unit!8579)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13477 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8579)

(assert (=> b!273557 (= lt!136444 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273557 (arrayNoDuplicates!0 lt!136443 #b00000000000000000000000000000000 Nil!4193)))

(declare-fun lt!136446 () Unit!8579)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13477 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4196) Unit!8579)

(assert (=> b!273557 (= lt!136446 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4193))))

(assert (= (and start!26380 res!137540) b!273553))

(assert (= (and b!273553 res!137543) b!273554))

(assert (= (and b!273554 res!137541) b!273552))

(assert (= (and b!273552 res!137539) b!273550))

(assert (= (and b!273550 res!137542) b!273555))

(assert (= (and b!273555 res!137546) b!273551))

(assert (= (and b!273551 res!137544) b!273549))

(assert (= (and b!273549 res!137547) b!273556))

(assert (= (and b!273556 res!137545) b!273557))

(declare-fun m!288777 () Bool)

(assert (=> b!273549 m!288777))

(declare-fun m!288779 () Bool)

(assert (=> b!273555 m!288779))

(declare-fun m!288781 () Bool)

(assert (=> b!273551 m!288781))

(declare-fun m!288783 () Bool)

(assert (=> b!273552 m!288783))

(declare-fun m!288785 () Bool)

(assert (=> b!273554 m!288785))

(declare-fun m!288787 () Bool)

(assert (=> b!273557 m!288787))

(declare-fun m!288789 () Bool)

(assert (=> b!273557 m!288789))

(declare-fun m!288791 () Bool)

(assert (=> b!273557 m!288791))

(assert (=> b!273557 m!288777))

(declare-fun m!288793 () Bool)

(assert (=> b!273557 m!288793))

(declare-fun m!288795 () Bool)

(assert (=> b!273557 m!288795))

(declare-fun m!288797 () Bool)

(assert (=> b!273557 m!288797))

(assert (=> b!273557 m!288791))

(declare-fun m!288799 () Bool)

(assert (=> b!273557 m!288799))

(declare-fun m!288801 () Bool)

(assert (=> b!273557 m!288801))

(assert (=> b!273557 m!288795))

(declare-fun m!288803 () Bool)

(assert (=> b!273557 m!288803))

(assert (=> b!273556 m!288795))

(assert (=> b!273556 m!288795))

(declare-fun m!288805 () Bool)

(assert (=> b!273556 m!288805))

(declare-fun m!288807 () Bool)

(assert (=> b!273550 m!288807))

(declare-fun m!288809 () Bool)

(assert (=> start!26380 m!288809))

(declare-fun m!288811 () Bool)

(assert (=> start!26380 m!288811))

(push 1)

