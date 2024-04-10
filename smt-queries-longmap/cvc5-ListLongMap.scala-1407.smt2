; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27294 () Bool)

(assert start!27294)

(declare-fun b!282795 () Bool)

(declare-fun res!145866 () Bool)

(declare-fun e!179473 () Bool)

(assert (=> b!282795 (=> (not res!145866) (not e!179473))))

(declare-datatypes ((array!14112 0))(
  ( (array!14113 (arr!6698 (Array (_ BitVec 32) (_ BitVec 64))) (size!7050 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14112)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14112 (_ BitVec 32)) Bool)

(assert (=> b!282795 (= res!145866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282796 () Bool)

(declare-fun res!145869 () Bool)

(declare-fun e!179474 () Bool)

(assert (=> b!282796 (=> (not res!145869) (not e!179474))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282796 (= res!145869 (and (= (size!7050 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7050 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7050 a!3325))))))

(declare-fun b!282797 () Bool)

(declare-fun e!179471 () Bool)

(assert (=> b!282797 (= e!179473 e!179471)))

(declare-fun res!145867 () Bool)

(assert (=> b!282797 (=> (not res!145867) (not e!179471))))

(assert (=> b!282797 (= res!145867 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139747 () array!14112)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!282797 (= lt!139747 (array!14113 (store (arr!6698 a!3325) i!1267 k!2581) (size!7050 a!3325)))))

(declare-fun res!145872 () Bool)

(assert (=> start!27294 (=> (not res!145872) (not e!179474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27294 (= res!145872 (validMask!0 mask!3868))))

(assert (=> start!27294 e!179474))

(declare-fun array_inv!4661 (array!14112) Bool)

(assert (=> start!27294 (array_inv!4661 a!3325)))

(assert (=> start!27294 true))

(declare-fun b!282798 () Bool)

(assert (=> b!282798 (= e!179474 e!179473)))

(declare-fun res!145864 () Bool)

(assert (=> b!282798 (=> (not res!145864) (not e!179473))))

(declare-datatypes ((SeekEntryResult!1856 0))(
  ( (MissingZero!1856 (index!9594 (_ BitVec 32))) (Found!1856 (index!9595 (_ BitVec 32))) (Intermediate!1856 (undefined!2668 Bool) (index!9596 (_ BitVec 32)) (x!27806 (_ BitVec 32))) (Undefined!1856) (MissingVacant!1856 (index!9597 (_ BitVec 32))) )
))
(declare-fun lt!139746 () SeekEntryResult!1856)

(assert (=> b!282798 (= res!145864 (or (= lt!139746 (MissingZero!1856 i!1267)) (= lt!139746 (MissingVacant!1856 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14112 (_ BitVec 32)) SeekEntryResult!1856)

(assert (=> b!282798 (= lt!139746 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282799 () Bool)

(declare-fun res!145871 () Bool)

(assert (=> b!282799 (=> (not res!145871) (not e!179471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282799 (= res!145871 (validKeyInArray!0 (select (arr!6698 a!3325) startIndex!26)))))

(declare-fun b!282800 () Bool)

(declare-fun res!145870 () Bool)

(assert (=> b!282800 (=> (not res!145870) (not e!179474))))

(assert (=> b!282800 (= res!145870 (validKeyInArray!0 k!2581))))

(declare-fun b!282801 () Bool)

(assert (=> b!282801 (= e!179471 (not true))))

(assert (=> b!282801 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8996 0))(
  ( (Unit!8997) )
))
(declare-fun lt!139744 () Unit!8996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8996)

(assert (=> b!282801 (= lt!139744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282801 (= (seekEntryOrOpen!0 (select (arr!6698 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6698 a!3325) i!1267 k!2581) startIndex!26) lt!139747 mask!3868))))

(declare-fun lt!139745 () Unit!8996)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14112 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8996)

(assert (=> b!282801 (= lt!139745 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4506 0))(
  ( (Nil!4503) (Cons!4502 (h!5172 (_ BitVec 64)) (t!9588 List!4506)) )
))
(declare-fun arrayNoDuplicates!0 (array!14112 (_ BitVec 32) List!4506) Bool)

(assert (=> b!282801 (arrayNoDuplicates!0 lt!139747 #b00000000000000000000000000000000 Nil!4503)))

(declare-fun lt!139743 () Unit!8996)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14112 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4506) Unit!8996)

(assert (=> b!282801 (= lt!139743 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4503))))

(declare-fun b!282802 () Bool)

(declare-fun res!145865 () Bool)

(assert (=> b!282802 (=> (not res!145865) (not e!179474))))

(assert (=> b!282802 (= res!145865 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4503))))

(declare-fun b!282803 () Bool)

(declare-fun res!145868 () Bool)

(assert (=> b!282803 (=> (not res!145868) (not e!179474))))

(declare-fun arrayContainsKey!0 (array!14112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282803 (= res!145868 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27294 res!145872) b!282796))

(assert (= (and b!282796 res!145869) b!282800))

(assert (= (and b!282800 res!145870) b!282802))

(assert (= (and b!282802 res!145865) b!282803))

(assert (= (and b!282803 res!145868) b!282798))

(assert (= (and b!282798 res!145864) b!282795))

(assert (= (and b!282795 res!145866) b!282797))

(assert (= (and b!282797 res!145867) b!282799))

(assert (= (and b!282799 res!145871) b!282801))

(declare-fun m!297483 () Bool)

(assert (=> b!282799 m!297483))

(assert (=> b!282799 m!297483))

(declare-fun m!297485 () Bool)

(assert (=> b!282799 m!297485))

(declare-fun m!297487 () Bool)

(assert (=> b!282798 m!297487))

(declare-fun m!297489 () Bool)

(assert (=> b!282800 m!297489))

(declare-fun m!297491 () Bool)

(assert (=> b!282801 m!297491))

(declare-fun m!297493 () Bool)

(assert (=> b!282801 m!297493))

(declare-fun m!297495 () Bool)

(assert (=> b!282801 m!297495))

(declare-fun m!297497 () Bool)

(assert (=> b!282801 m!297497))

(assert (=> b!282801 m!297483))

(declare-fun m!297499 () Bool)

(assert (=> b!282801 m!297499))

(declare-fun m!297501 () Bool)

(assert (=> b!282801 m!297501))

(assert (=> b!282801 m!297483))

(declare-fun m!297503 () Bool)

(assert (=> b!282801 m!297503))

(declare-fun m!297505 () Bool)

(assert (=> b!282801 m!297505))

(declare-fun m!297507 () Bool)

(assert (=> b!282801 m!297507))

(assert (=> b!282801 m!297505))

(assert (=> b!282797 m!297495))

(declare-fun m!297509 () Bool)

(assert (=> b!282795 m!297509))

(declare-fun m!297511 () Bool)

(assert (=> b!282802 m!297511))

(declare-fun m!297513 () Bool)

(assert (=> b!282803 m!297513))

(declare-fun m!297515 () Bool)

(assert (=> start!27294 m!297515))

(declare-fun m!297517 () Bool)

(assert (=> start!27294 m!297517))

(push 1)

