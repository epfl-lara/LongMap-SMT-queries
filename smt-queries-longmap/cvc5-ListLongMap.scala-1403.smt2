; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27270 () Bool)

(assert start!27270)

(declare-fun b!282471 () Bool)

(declare-fun res!145544 () Bool)

(declare-fun e!179328 () Bool)

(assert (=> b!282471 (=> (not res!145544) (not e!179328))))

(declare-datatypes ((array!14088 0))(
  ( (array!14089 (arr!6686 (Array (_ BitVec 32) (_ BitVec 64))) (size!7038 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14088)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282471 (= res!145544 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282472 () Bool)

(declare-fun res!145547 () Bool)

(assert (=> b!282472 (=> (not res!145547) (not e!179328))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282472 (= res!145547 (and (= (size!7038 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7038 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7038 a!3325))))))

(declare-fun b!282473 () Bool)

(declare-fun res!145545 () Bool)

(declare-fun e!179330 () Bool)

(assert (=> b!282473 (=> (not res!145545) (not e!179330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14088 (_ BitVec 32)) Bool)

(assert (=> b!282473 (= res!145545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282474 () Bool)

(assert (=> b!282474 (= e!179328 e!179330)))

(declare-fun res!145540 () Bool)

(assert (=> b!282474 (=> (not res!145540) (not e!179330))))

(declare-datatypes ((SeekEntryResult!1844 0))(
  ( (MissingZero!1844 (index!9546 (_ BitVec 32))) (Found!1844 (index!9547 (_ BitVec 32))) (Intermediate!1844 (undefined!2656 Bool) (index!9548 (_ BitVec 32)) (x!27762 (_ BitVec 32))) (Undefined!1844) (MissingVacant!1844 (index!9549 (_ BitVec 32))) )
))
(declare-fun lt!139564 () SeekEntryResult!1844)

(assert (=> b!282474 (= res!145540 (or (= lt!139564 (MissingZero!1844 i!1267)) (= lt!139564 (MissingVacant!1844 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14088 (_ BitVec 32)) SeekEntryResult!1844)

(assert (=> b!282474 (= lt!139564 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282475 () Bool)

(declare-fun res!145542 () Bool)

(assert (=> b!282475 (=> (not res!145542) (not e!179328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282475 (= res!145542 (validKeyInArray!0 k!2581))))

(declare-fun b!282476 () Bool)

(declare-fun res!145541 () Bool)

(declare-fun e!179327 () Bool)

(assert (=> b!282476 (=> (not res!145541) (not e!179327))))

(assert (=> b!282476 (= res!145541 (validKeyInArray!0 (select (arr!6686 a!3325) startIndex!26)))))

(declare-fun b!282477 () Bool)

(assert (=> b!282477 (= e!179327 (not true))))

(assert (=> b!282477 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8972 0))(
  ( (Unit!8973) )
))
(declare-fun lt!139565 () Unit!8972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8972)

(assert (=> b!282477 (= lt!139565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139563 () array!14088)

(assert (=> b!282477 (= (seekEntryOrOpen!0 (select (arr!6686 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6686 a!3325) i!1267 k!2581) startIndex!26) lt!139563 mask!3868))))

(declare-fun lt!139566 () Unit!8972)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14088 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8972)

(assert (=> b!282477 (= lt!139566 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4494 0))(
  ( (Nil!4491) (Cons!4490 (h!5160 (_ BitVec 64)) (t!9576 List!4494)) )
))
(declare-fun arrayNoDuplicates!0 (array!14088 (_ BitVec 32) List!4494) Bool)

(assert (=> b!282477 (arrayNoDuplicates!0 lt!139563 #b00000000000000000000000000000000 Nil!4491)))

(declare-fun lt!139567 () Unit!8972)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14088 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4494) Unit!8972)

(assert (=> b!282477 (= lt!139567 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4491))))

(declare-fun res!145543 () Bool)

(assert (=> start!27270 (=> (not res!145543) (not e!179328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27270 (= res!145543 (validMask!0 mask!3868))))

(assert (=> start!27270 e!179328))

(declare-fun array_inv!4649 (array!14088) Bool)

(assert (=> start!27270 (array_inv!4649 a!3325)))

(assert (=> start!27270 true))

(declare-fun b!282478 () Bool)

(declare-fun res!145548 () Bool)

(assert (=> b!282478 (=> (not res!145548) (not e!179328))))

(assert (=> b!282478 (= res!145548 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4491))))

(declare-fun b!282479 () Bool)

(assert (=> b!282479 (= e!179330 e!179327)))

(declare-fun res!145546 () Bool)

(assert (=> b!282479 (=> (not res!145546) (not e!179327))))

(assert (=> b!282479 (= res!145546 (not (= startIndex!26 i!1267)))))

(assert (=> b!282479 (= lt!139563 (array!14089 (store (arr!6686 a!3325) i!1267 k!2581) (size!7038 a!3325)))))

(assert (= (and start!27270 res!145543) b!282472))

(assert (= (and b!282472 res!145547) b!282475))

(assert (= (and b!282475 res!145542) b!282478))

(assert (= (and b!282478 res!145548) b!282471))

(assert (= (and b!282471 res!145544) b!282474))

(assert (= (and b!282474 res!145540) b!282473))

(assert (= (and b!282473 res!145545) b!282479))

(assert (= (and b!282479 res!145546) b!282476))

(assert (= (and b!282476 res!145541) b!282477))

(declare-fun m!297051 () Bool)

(assert (=> b!282478 m!297051))

(declare-fun m!297053 () Bool)

(assert (=> b!282476 m!297053))

(assert (=> b!282476 m!297053))

(declare-fun m!297055 () Bool)

(assert (=> b!282476 m!297055))

(declare-fun m!297057 () Bool)

(assert (=> b!282471 m!297057))

(declare-fun m!297059 () Bool)

(assert (=> b!282477 m!297059))

(declare-fun m!297061 () Bool)

(assert (=> b!282477 m!297061))

(assert (=> b!282477 m!297061))

(declare-fun m!297063 () Bool)

(assert (=> b!282477 m!297063))

(declare-fun m!297065 () Bool)

(assert (=> b!282477 m!297065))

(declare-fun m!297067 () Bool)

(assert (=> b!282477 m!297067))

(assert (=> b!282477 m!297053))

(declare-fun m!297069 () Bool)

(assert (=> b!282477 m!297069))

(declare-fun m!297071 () Bool)

(assert (=> b!282477 m!297071))

(declare-fun m!297073 () Bool)

(assert (=> b!282477 m!297073))

(assert (=> b!282477 m!297053))

(declare-fun m!297075 () Bool)

(assert (=> b!282477 m!297075))

(assert (=> b!282479 m!297065))

(declare-fun m!297077 () Bool)

(assert (=> b!282473 m!297077))

(declare-fun m!297079 () Bool)

(assert (=> b!282474 m!297079))

(declare-fun m!297081 () Bool)

(assert (=> start!27270 m!297081))

(declare-fun m!297083 () Bool)

(assert (=> start!27270 m!297083))

(declare-fun m!297085 () Bool)

(assert (=> b!282475 m!297085))

(push 1)

