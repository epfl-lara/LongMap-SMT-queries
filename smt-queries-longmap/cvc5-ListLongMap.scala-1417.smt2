; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27528 () Bool)

(assert start!27528)

(declare-fun res!146954 () Bool)

(declare-fun e!180444 () Bool)

(assert (=> start!27528 (=> (not res!146954) (not e!180444))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27528 (= res!146954 (validMask!0 mask!3868))))

(assert (=> start!27528 e!180444))

(declare-datatypes ((array!14178 0))(
  ( (array!14179 (arr!6728 (Array (_ BitVec 32) (_ BitVec 64))) (size!7080 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14178)

(declare-fun array_inv!4691 (array!14178) Bool)

(assert (=> start!27528 (array_inv!4691 a!3325)))

(assert (=> start!27528 true))

(declare-fun b!284445 () Bool)

(declare-fun e!180445 () Bool)

(assert (=> b!284445 (= e!180444 e!180445)))

(declare-fun res!146958 () Bool)

(assert (=> b!284445 (=> (not res!146958) (not e!180445))))

(declare-datatypes ((SeekEntryResult!1886 0))(
  ( (MissingZero!1886 (index!9714 (_ BitVec 32))) (Found!1886 (index!9715 (_ BitVec 32))) (Intermediate!1886 (undefined!2698 Bool) (index!9716 (_ BitVec 32)) (x!27925 (_ BitVec 32))) (Undefined!1886) (MissingVacant!1886 (index!9717 (_ BitVec 32))) )
))
(declare-fun lt!140518 () SeekEntryResult!1886)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284445 (= res!146958 (or (= lt!140518 (MissingZero!1886 i!1267)) (= lt!140518 (MissingVacant!1886 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14178 (_ BitVec 32)) SeekEntryResult!1886)

(assert (=> b!284445 (= lt!140518 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284446 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284446 (= e!180445 (and (bvslt startIndex!26 (bvsub (size!7080 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!284447 () Bool)

(declare-fun res!146960 () Bool)

(assert (=> b!284447 (=> (not res!146960) (not e!180445))))

(assert (=> b!284447 (= res!146960 (not (= startIndex!26 i!1267)))))

(declare-fun b!284448 () Bool)

(declare-fun res!146955 () Bool)

(assert (=> b!284448 (=> (not res!146955) (not e!180444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284448 (= res!146955 (validKeyInArray!0 k!2581))))

(declare-fun b!284449 () Bool)

(declare-fun res!146961 () Bool)

(assert (=> b!284449 (=> (not res!146961) (not e!180444))))

(declare-fun arrayContainsKey!0 (array!14178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284449 (= res!146961 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284450 () Bool)

(declare-fun res!146956 () Bool)

(assert (=> b!284450 (=> (not res!146956) (not e!180444))))

(assert (=> b!284450 (= res!146956 (and (= (size!7080 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7080 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7080 a!3325))))))

(declare-fun b!284451 () Bool)

(declare-fun res!146957 () Bool)

(assert (=> b!284451 (=> (not res!146957) (not e!180445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14178 (_ BitVec 32)) Bool)

(assert (=> b!284451 (= res!146957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284452 () Bool)

(declare-fun res!146953 () Bool)

(assert (=> b!284452 (=> (not res!146953) (not e!180445))))

(assert (=> b!284452 (= res!146953 (not (validKeyInArray!0 (select (arr!6728 a!3325) startIndex!26))))))

(declare-fun b!284453 () Bool)

(declare-fun res!146959 () Bool)

(assert (=> b!284453 (=> (not res!146959) (not e!180444))))

(declare-datatypes ((List!4536 0))(
  ( (Nil!4533) (Cons!4532 (h!5205 (_ BitVec 64)) (t!9618 List!4536)) )
))
(declare-fun arrayNoDuplicates!0 (array!14178 (_ BitVec 32) List!4536) Bool)

(assert (=> b!284453 (= res!146959 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4533))))

(assert (= (and start!27528 res!146954) b!284450))

(assert (= (and b!284450 res!146956) b!284448))

(assert (= (and b!284448 res!146955) b!284453))

(assert (= (and b!284453 res!146959) b!284449))

(assert (= (and b!284449 res!146961) b!284445))

(assert (= (and b!284445 res!146958) b!284451))

(assert (= (and b!284451 res!146957) b!284447))

(assert (= (and b!284447 res!146960) b!284452))

(assert (= (and b!284452 res!146953) b!284446))

(declare-fun m!299463 () Bool)

(assert (=> b!284445 m!299463))

(declare-fun m!299465 () Bool)

(assert (=> b!284451 m!299465))

(declare-fun m!299467 () Bool)

(assert (=> b!284448 m!299467))

(declare-fun m!299469 () Bool)

(assert (=> b!284452 m!299469))

(assert (=> b!284452 m!299469))

(declare-fun m!299471 () Bool)

(assert (=> b!284452 m!299471))

(declare-fun m!299473 () Bool)

(assert (=> b!284453 m!299473))

(declare-fun m!299475 () Bool)

(assert (=> b!284449 m!299475))

(declare-fun m!299477 () Bool)

(assert (=> start!27528 m!299477))

(declare-fun m!299479 () Bool)

(assert (=> start!27528 m!299479))

(push 1)

