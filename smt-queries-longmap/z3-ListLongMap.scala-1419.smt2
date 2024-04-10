; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27542 () Bool)

(assert start!27542)

(declare-fun b!284592 () Bool)

(declare-fun res!147105 () Bool)

(declare-fun e!180508 () Bool)

(assert (=> b!284592 (=> (not res!147105) (not e!180508))))

(declare-datatypes ((array!14192 0))(
  ( (array!14193 (arr!6735 (Array (_ BitVec 32) (_ BitVec 64))) (size!7087 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14192)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284592 (= res!147105 (and (= (size!7087 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7087 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7087 a!3325))))))

(declare-fun b!284593 () Bool)

(declare-fun e!180507 () Bool)

(assert (=> b!284593 (= e!180508 e!180507)))

(declare-fun res!147104 () Bool)

(assert (=> b!284593 (=> (not res!147104) (not e!180507))))

(declare-datatypes ((SeekEntryResult!1893 0))(
  ( (MissingZero!1893 (index!9742 (_ BitVec 32))) (Found!1893 (index!9743 (_ BitVec 32))) (Intermediate!1893 (undefined!2705 Bool) (index!9744 (_ BitVec 32)) (x!27948 (_ BitVec 32))) (Undefined!1893) (MissingVacant!1893 (index!9745 (_ BitVec 32))) )
))
(declare-fun lt!140554 () SeekEntryResult!1893)

(assert (=> b!284593 (= res!147104 (or (= lt!140554 (MissingZero!1893 i!1267)) (= lt!140554 (MissingVacant!1893 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14192 (_ BitVec 32)) SeekEntryResult!1893)

(assert (=> b!284593 (= lt!140554 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284594 () Bool)

(declare-fun res!147101 () Bool)

(assert (=> b!284594 (=> (not res!147101) (not e!180508))))

(declare-fun arrayContainsKey!0 (array!14192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284594 (= res!147101 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!147100 () Bool)

(assert (=> start!27542 (=> (not res!147100) (not e!180508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27542 (= res!147100 (validMask!0 mask!3868))))

(assert (=> start!27542 e!180508))

(declare-fun array_inv!4698 (array!14192) Bool)

(assert (=> start!27542 (array_inv!4698 a!3325)))

(assert (=> start!27542 true))

(declare-fun b!284595 () Bool)

(declare-fun res!147103 () Bool)

(assert (=> b!284595 (=> (not res!147103) (not e!180508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284595 (= res!147103 (validKeyInArray!0 k0!2581))))

(declare-fun b!284596 () Bool)

(declare-fun res!147102 () Bool)

(assert (=> b!284596 (=> (not res!147102) (not e!180508))))

(declare-datatypes ((List!4543 0))(
  ( (Nil!4540) (Cons!4539 (h!5212 (_ BitVec 64)) (t!9625 List!4543)) )
))
(declare-fun arrayNoDuplicates!0 (array!14192 (_ BitVec 32) List!4543) Bool)

(assert (=> b!284596 (= res!147102 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4540))))

(declare-fun b!284597 () Bool)

(assert (=> b!284597 (= e!180507 false)))

(declare-fun lt!140553 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14192 (_ BitVec 32)) Bool)

(assert (=> b!284597 (= lt!140553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27542 res!147100) b!284592))

(assert (= (and b!284592 res!147105) b!284595))

(assert (= (and b!284595 res!147103) b!284596))

(assert (= (and b!284596 res!147102) b!284594))

(assert (= (and b!284594 res!147101) b!284593))

(assert (= (and b!284593 res!147104) b!284597))

(declare-fun m!299573 () Bool)

(assert (=> b!284593 m!299573))

(declare-fun m!299575 () Bool)

(assert (=> start!27542 m!299575))

(declare-fun m!299577 () Bool)

(assert (=> start!27542 m!299577))

(declare-fun m!299579 () Bool)

(assert (=> b!284595 m!299579))

(declare-fun m!299581 () Bool)

(assert (=> b!284596 m!299581))

(declare-fun m!299583 () Bool)

(assert (=> b!284597 m!299583))

(declare-fun m!299585 () Bool)

(assert (=> b!284594 m!299585))

(check-sat (not b!284594) (not b!284597) (not b!284593) (not b!284596) (not start!27542) (not b!284595))
(check-sat)
