; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27540 () Bool)

(assert start!27540)

(declare-fun b!284621 () Bool)

(declare-fun res!147104 () Bool)

(declare-fun e!180523 () Bool)

(assert (=> b!284621 (=> (not res!147104) (not e!180523))))

(declare-datatypes ((array!14189 0))(
  ( (array!14190 (arr!6733 (Array (_ BitVec 32) (_ BitVec 64))) (size!7085 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14189)

(declare-datatypes ((List!4454 0))(
  ( (Nil!4451) (Cons!4450 (h!5123 (_ BitVec 64)) (t!9528 List!4454)) )
))
(declare-fun arrayNoDuplicates!0 (array!14189 (_ BitVec 32) List!4454) Bool)

(assert (=> b!284621 (= res!147104 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4451))))

(declare-fun b!284622 () Bool)

(declare-fun res!147108 () Bool)

(assert (=> b!284622 (=> (not res!147108) (not e!180523))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284622 (= res!147108 (validKeyInArray!0 k0!2581))))

(declare-fun b!284623 () Bool)

(declare-fun e!180522 () Bool)

(assert (=> b!284623 (= e!180522 false)))

(declare-fun lt!140606 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14189 (_ BitVec 32)) Bool)

(assert (=> b!284623 (= lt!140606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147103 () Bool)

(assert (=> start!27540 (=> (not res!147103) (not e!180523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27540 (= res!147103 (validMask!0 mask!3868))))

(assert (=> start!27540 e!180523))

(declare-fun array_inv!4683 (array!14189) Bool)

(assert (=> start!27540 (array_inv!4683 a!3325)))

(assert (=> start!27540 true))

(declare-fun b!284624 () Bool)

(assert (=> b!284624 (= e!180523 e!180522)))

(declare-fun res!147106 () Bool)

(assert (=> b!284624 (=> (not res!147106) (not e!180522))))

(declare-datatypes ((SeekEntryResult!1856 0))(
  ( (MissingZero!1856 (index!9594 (_ BitVec 32))) (Found!1856 (index!9595 (_ BitVec 32))) (Intermediate!1856 (undefined!2668 Bool) (index!9596 (_ BitVec 32)) (x!27911 (_ BitVec 32))) (Undefined!1856) (MissingVacant!1856 (index!9597 (_ BitVec 32))) )
))
(declare-fun lt!140607 () SeekEntryResult!1856)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284624 (= res!147106 (or (= lt!140607 (MissingZero!1856 i!1267)) (= lt!140607 (MissingVacant!1856 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14189 (_ BitVec 32)) SeekEntryResult!1856)

(assert (=> b!284624 (= lt!140607 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284625 () Bool)

(declare-fun res!147107 () Bool)

(assert (=> b!284625 (=> (not res!147107) (not e!180523))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284625 (= res!147107 (and (= (size!7085 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7085 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7085 a!3325))))))

(declare-fun b!284626 () Bool)

(declare-fun res!147105 () Bool)

(assert (=> b!284626 (=> (not res!147105) (not e!180523))))

(declare-fun arrayContainsKey!0 (array!14189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284626 (= res!147105 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27540 res!147103) b!284625))

(assert (= (and b!284625 res!147107) b!284622))

(assert (= (and b!284622 res!147108) b!284621))

(assert (= (and b!284621 res!147104) b!284626))

(assert (= (and b!284626 res!147105) b!284624))

(assert (= (and b!284624 res!147106) b!284623))

(declare-fun m!299765 () Bool)

(assert (=> b!284622 m!299765))

(declare-fun m!299767 () Bool)

(assert (=> start!27540 m!299767))

(declare-fun m!299769 () Bool)

(assert (=> start!27540 m!299769))

(declare-fun m!299771 () Bool)

(assert (=> b!284621 m!299771))

(declare-fun m!299773 () Bool)

(assert (=> b!284624 m!299773))

(declare-fun m!299775 () Bool)

(assert (=> b!284623 m!299775))

(declare-fun m!299777 () Bool)

(assert (=> b!284626 m!299777))

(check-sat (not b!284621) (not b!284624) (not start!27540) (not b!284623) (not b!284622) (not b!284626))
(check-sat)
