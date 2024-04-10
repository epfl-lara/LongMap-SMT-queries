; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27548 () Bool)

(assert start!27548)

(declare-fun b!284646 () Bool)

(declare-fun e!180535 () Bool)

(assert (=> b!284646 (= e!180535 false)))

(declare-fun lt!140571 () Bool)

(declare-datatypes ((array!14198 0))(
  ( (array!14199 (arr!6738 (Array (_ BitVec 32) (_ BitVec 64))) (size!7090 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14198)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14198 (_ BitVec 32)) Bool)

(assert (=> b!284646 (= lt!140571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284647 () Bool)

(declare-fun e!180534 () Bool)

(assert (=> b!284647 (= e!180534 e!180535)))

(declare-fun res!147158 () Bool)

(assert (=> b!284647 (=> (not res!147158) (not e!180535))))

(declare-datatypes ((SeekEntryResult!1896 0))(
  ( (MissingZero!1896 (index!9754 (_ BitVec 32))) (Found!1896 (index!9755 (_ BitVec 32))) (Intermediate!1896 (undefined!2708 Bool) (index!9756 (_ BitVec 32)) (x!27959 (_ BitVec 32))) (Undefined!1896) (MissingVacant!1896 (index!9757 (_ BitVec 32))) )
))
(declare-fun lt!140572 () SeekEntryResult!1896)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284647 (= res!147158 (or (= lt!140572 (MissingZero!1896 i!1267)) (= lt!140572 (MissingVacant!1896 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14198 (_ BitVec 32)) SeekEntryResult!1896)

(assert (=> b!284647 (= lt!140572 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284648 () Bool)

(declare-fun res!147155 () Bool)

(assert (=> b!284648 (=> (not res!147155) (not e!180534))))

(declare-datatypes ((List!4546 0))(
  ( (Nil!4543) (Cons!4542 (h!5215 (_ BitVec 64)) (t!9628 List!4546)) )
))
(declare-fun arrayNoDuplicates!0 (array!14198 (_ BitVec 32) List!4546) Bool)

(assert (=> b!284648 (= res!147155 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4543))))

(declare-fun res!147154 () Bool)

(assert (=> start!27548 (=> (not res!147154) (not e!180534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27548 (= res!147154 (validMask!0 mask!3868))))

(assert (=> start!27548 e!180534))

(declare-fun array_inv!4701 (array!14198) Bool)

(assert (=> start!27548 (array_inv!4701 a!3325)))

(assert (=> start!27548 true))

(declare-fun b!284649 () Bool)

(declare-fun res!147157 () Bool)

(assert (=> b!284649 (=> (not res!147157) (not e!180534))))

(declare-fun arrayContainsKey!0 (array!14198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284649 (= res!147157 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284650 () Bool)

(declare-fun res!147156 () Bool)

(assert (=> b!284650 (=> (not res!147156) (not e!180534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284650 (= res!147156 (validKeyInArray!0 k0!2581))))

(declare-fun b!284651 () Bool)

(declare-fun res!147159 () Bool)

(assert (=> b!284651 (=> (not res!147159) (not e!180534))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284651 (= res!147159 (and (= (size!7090 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7090 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7090 a!3325))))))

(assert (= (and start!27548 res!147154) b!284651))

(assert (= (and b!284651 res!147159) b!284650))

(assert (= (and b!284650 res!147156) b!284648))

(assert (= (and b!284648 res!147155) b!284649))

(assert (= (and b!284649 res!147157) b!284647))

(assert (= (and b!284647 res!147158) b!284646))

(declare-fun m!299615 () Bool)

(assert (=> b!284647 m!299615))

(declare-fun m!299617 () Bool)

(assert (=> b!284648 m!299617))

(declare-fun m!299619 () Bool)

(assert (=> b!284650 m!299619))

(declare-fun m!299621 () Bool)

(assert (=> start!27548 m!299621))

(declare-fun m!299623 () Bool)

(assert (=> start!27548 m!299623))

(declare-fun m!299625 () Bool)

(assert (=> b!284646 m!299625))

(declare-fun m!299627 () Bool)

(assert (=> b!284649 m!299627))

(check-sat (not b!284650) (not b!284647) (not b!284649) (not b!284646) (not start!27548) (not b!284648))
(check-sat)
