; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26232 () Bool)

(assert start!26232)

(declare-fun b!271451 () Bool)

(declare-fun res!135441 () Bool)

(declare-fun e!174558 () Bool)

(assert (=> b!271451 (=> (not res!135441) (not e!174558))))

(declare-datatypes ((array!13329 0))(
  ( (array!13330 (arr!6314 (Array (_ BitVec 32) (_ BitVec 64))) (size!6666 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13329)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271451 (= res!135441 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271452 () Bool)

(declare-fun res!135447 () Bool)

(declare-fun e!174560 () Bool)

(assert (=> b!271452 (=> (not res!135447) (not e!174560))))

(declare-datatypes ((List!4122 0))(
  ( (Nil!4119) (Cons!4118 (h!4785 (_ BitVec 64)) (t!9204 List!4122)) )
))
(declare-fun contains!1952 (List!4122 (_ BitVec 64)) Bool)

(assert (=> b!271452 (= res!135447 (not (contains!1952 Nil!4119 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271453 () Bool)

(assert (=> b!271453 (= e!174558 e!174560)))

(declare-fun res!135453 () Bool)

(assert (=> b!271453 (=> (not res!135453) (not e!174560))))

(declare-datatypes ((SeekEntryResult!1472 0))(
  ( (MissingZero!1472 (index!8058 (_ BitVec 32))) (Found!1472 (index!8059 (_ BitVec 32))) (Intermediate!1472 (undefined!2284 Bool) (index!8060 (_ BitVec 32)) (x!26389 (_ BitVec 32))) (Undefined!1472) (MissingVacant!1472 (index!8061 (_ BitVec 32))) )
))
(declare-fun lt!135804 () SeekEntryResult!1472)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271453 (= res!135453 (or (= lt!135804 (MissingZero!1472 i!1267)) (= lt!135804 (MissingVacant!1472 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13329 (_ BitVec 32)) SeekEntryResult!1472)

(assert (=> b!271453 (= lt!135804 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271454 () Bool)

(assert (=> b!271454 (= e!174560 false)))

(declare-fun lt!135805 () Bool)

(assert (=> b!271454 (= lt!135805 (contains!1952 Nil!4119 k!2581))))

(declare-fun b!271455 () Bool)

(declare-fun res!135451 () Bool)

(assert (=> b!271455 (=> (not res!135451) (not e!174560))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271455 (= res!135451 (not (= startIndex!26 i!1267)))))

(declare-fun b!271457 () Bool)

(declare-fun res!135448 () Bool)

(assert (=> b!271457 (=> (not res!135448) (not e!174560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271457 (= res!135448 (validKeyInArray!0 (select (arr!6314 a!3325) startIndex!26)))))

(declare-fun b!271458 () Bool)

(declare-fun res!135445 () Bool)

(assert (=> b!271458 (=> (not res!135445) (not e!174558))))

(assert (=> b!271458 (= res!135445 (validKeyInArray!0 k!2581))))

(declare-fun b!271459 () Bool)

(declare-fun res!135449 () Bool)

(assert (=> b!271459 (=> (not res!135449) (not e!174558))))

(assert (=> b!271459 (= res!135449 (and (= (size!6666 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6666 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6666 a!3325))))))

(declare-fun b!271460 () Bool)

(declare-fun res!135443 () Bool)

(assert (=> b!271460 (=> (not res!135443) (not e!174558))))

(declare-fun arrayNoDuplicates!0 (array!13329 (_ BitVec 32) List!4122) Bool)

(assert (=> b!271460 (= res!135443 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4119))))

(declare-fun b!271461 () Bool)

(declare-fun res!135450 () Bool)

(assert (=> b!271461 (=> (not res!135450) (not e!174560))))

(assert (=> b!271461 (= res!135450 (not (contains!1952 Nil!4119 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271462 () Bool)

(declare-fun res!135452 () Bool)

(assert (=> b!271462 (=> (not res!135452) (not e!174560))))

(declare-fun noDuplicate!140 (List!4122) Bool)

(assert (=> b!271462 (= res!135452 (noDuplicate!140 Nil!4119))))

(declare-fun b!271463 () Bool)

(declare-fun res!135442 () Bool)

(assert (=> b!271463 (=> (not res!135442) (not e!174560))))

(assert (=> b!271463 (= res!135442 (and (bvslt (size!6666 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6666 a!3325))))))

(declare-fun b!271456 () Bool)

(declare-fun res!135444 () Bool)

(assert (=> b!271456 (=> (not res!135444) (not e!174560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13329 (_ BitVec 32)) Bool)

(assert (=> b!271456 (= res!135444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!135446 () Bool)

(assert (=> start!26232 (=> (not res!135446) (not e!174558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26232 (= res!135446 (validMask!0 mask!3868))))

(assert (=> start!26232 e!174558))

(declare-fun array_inv!4277 (array!13329) Bool)

(assert (=> start!26232 (array_inv!4277 a!3325)))

(assert (=> start!26232 true))

(assert (= (and start!26232 res!135446) b!271459))

(assert (= (and b!271459 res!135449) b!271458))

(assert (= (and b!271458 res!135445) b!271460))

(assert (= (and b!271460 res!135443) b!271451))

(assert (= (and b!271451 res!135441) b!271453))

(assert (= (and b!271453 res!135453) b!271456))

(assert (= (and b!271456 res!135444) b!271455))

(assert (= (and b!271455 res!135451) b!271457))

(assert (= (and b!271457 res!135448) b!271463))

(assert (= (and b!271463 res!135442) b!271462))

(assert (= (and b!271462 res!135452) b!271461))

(assert (= (and b!271461 res!135450) b!271452))

(assert (= (and b!271452 res!135447) b!271454))

(declare-fun m!286731 () Bool)

(assert (=> b!271462 m!286731))

(declare-fun m!286733 () Bool)

(assert (=> b!271460 m!286733))

(declare-fun m!286735 () Bool)

(assert (=> b!271461 m!286735))

(declare-fun m!286737 () Bool)

(assert (=> b!271457 m!286737))

(assert (=> b!271457 m!286737))

(declare-fun m!286739 () Bool)

(assert (=> b!271457 m!286739))

(declare-fun m!286741 () Bool)

(assert (=> b!271454 m!286741))

(declare-fun m!286743 () Bool)

(assert (=> b!271452 m!286743))

(declare-fun m!286745 () Bool)

(assert (=> b!271456 m!286745))

(declare-fun m!286747 () Bool)

(assert (=> b!271451 m!286747))

(declare-fun m!286749 () Bool)

(assert (=> start!26232 m!286749))

(declare-fun m!286751 () Bool)

(assert (=> start!26232 m!286751))

(declare-fun m!286753 () Bool)

(assert (=> b!271453 m!286753))

(declare-fun m!286755 () Bool)

(assert (=> b!271458 m!286755))

(push 1)

