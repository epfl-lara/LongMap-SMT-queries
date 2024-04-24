; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27516 () Bool)

(assert start!27516)

(declare-fun b!284378 () Bool)

(declare-fun e!180415 () Bool)

(declare-fun e!180414 () Bool)

(assert (=> b!284378 (= e!180415 e!180414)))

(declare-fun res!146862 () Bool)

(assert (=> b!284378 (=> (not res!146862) (not e!180414))))

(declare-datatypes ((SeekEntryResult!1844 0))(
  ( (MissingZero!1844 (index!9546 (_ BitVec 32))) (Found!1844 (index!9547 (_ BitVec 32))) (Intermediate!1844 (undefined!2656 Bool) (index!9548 (_ BitVec 32)) (x!27867 (_ BitVec 32))) (Undefined!1844) (MissingVacant!1844 (index!9549 (_ BitVec 32))) )
))
(declare-fun lt!140543 () SeekEntryResult!1844)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284378 (= res!146862 (or (= lt!140543 (MissingZero!1844 i!1267)) (= lt!140543 (MissingVacant!1844 i!1267))))))

(declare-datatypes ((array!14165 0))(
  ( (array!14166 (arr!6721 (Array (_ BitVec 32) (_ BitVec 64))) (size!7073 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14165)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14165 (_ BitVec 32)) SeekEntryResult!1844)

(assert (=> b!284378 (= lt!140543 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284379 () Bool)

(declare-fun res!146863 () Bool)

(assert (=> b!284379 (=> (not res!146863) (not e!180415))))

(declare-fun arrayContainsKey!0 (array!14165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284379 (= res!146863 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284380 () Bool)

(declare-fun res!146865 () Bool)

(assert (=> b!284380 (=> (not res!146865) (not e!180415))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284380 (= res!146865 (and (= (size!7073 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7073 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7073 a!3325))))))

(declare-fun b!284381 () Bool)

(declare-fun res!146864 () Bool)

(assert (=> b!284381 (=> (not res!146864) (not e!180415))))

(declare-datatypes ((List!4442 0))(
  ( (Nil!4439) (Cons!4438 (h!5111 (_ BitVec 64)) (t!9516 List!4442)) )
))
(declare-fun arrayNoDuplicates!0 (array!14165 (_ BitVec 32) List!4442) Bool)

(assert (=> b!284381 (= res!146864 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4439))))

(declare-fun b!284383 () Bool)

(assert (=> b!284383 (= e!180414 false)))

(declare-fun lt!140544 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14165 (_ BitVec 32)) Bool)

(assert (=> b!284383 (= lt!140544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284382 () Bool)

(declare-fun res!146860 () Bool)

(assert (=> b!284382 (=> (not res!146860) (not e!180415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284382 (= res!146860 (validKeyInArray!0 k0!2581))))

(declare-fun res!146861 () Bool)

(assert (=> start!27516 (=> (not res!146861) (not e!180415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27516 (= res!146861 (validMask!0 mask!3868))))

(assert (=> start!27516 e!180415))

(declare-fun array_inv!4671 (array!14165) Bool)

(assert (=> start!27516 (array_inv!4671 a!3325)))

(assert (=> start!27516 true))

(assert (= (and start!27516 res!146861) b!284380))

(assert (= (and b!284380 res!146865) b!284382))

(assert (= (and b!284382 res!146860) b!284381))

(assert (= (and b!284381 res!146864) b!284379))

(assert (= (and b!284379 res!146863) b!284378))

(assert (= (and b!284378 res!146862) b!284383))

(declare-fun m!299585 () Bool)

(assert (=> b!284379 m!299585))

(declare-fun m!299587 () Bool)

(assert (=> start!27516 m!299587))

(declare-fun m!299589 () Bool)

(assert (=> start!27516 m!299589))

(declare-fun m!299591 () Bool)

(assert (=> b!284381 m!299591))

(declare-fun m!299593 () Bool)

(assert (=> b!284383 m!299593))

(declare-fun m!299595 () Bool)

(assert (=> b!284378 m!299595))

(declare-fun m!299597 () Bool)

(assert (=> b!284382 m!299597))

(check-sat (not b!284381) (not b!284378) (not b!284382) (not b!284383) (not start!27516) (not b!284379))
(check-sat)
