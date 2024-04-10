; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27536 () Bool)

(assert start!27536)

(declare-fun b!284538 () Bool)

(declare-fun res!147048 () Bool)

(declare-fun e!180480 () Bool)

(assert (=> b!284538 (=> (not res!147048) (not e!180480))))

(declare-datatypes ((array!14186 0))(
  ( (array!14187 (arr!6732 (Array (_ BitVec 32) (_ BitVec 64))) (size!7084 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14186)

(declare-datatypes ((List!4540 0))(
  ( (Nil!4537) (Cons!4536 (h!5209 (_ BitVec 64)) (t!9622 List!4540)) )
))
(declare-fun arrayNoDuplicates!0 (array!14186 (_ BitVec 32) List!4540) Bool)

(assert (=> b!284538 (= res!147048 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4537))))

(declare-fun b!284539 () Bool)

(declare-fun res!147050 () Bool)

(assert (=> b!284539 (=> (not res!147050) (not e!180480))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284539 (= res!147050 (and (= (size!7084 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7084 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7084 a!3325))))))

(declare-fun res!147046 () Bool)

(assert (=> start!27536 (=> (not res!147046) (not e!180480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27536 (= res!147046 (validMask!0 mask!3868))))

(assert (=> start!27536 e!180480))

(declare-fun array_inv!4695 (array!14186) Bool)

(assert (=> start!27536 (array_inv!4695 a!3325)))

(assert (=> start!27536 true))

(declare-fun b!284540 () Bool)

(declare-fun res!147049 () Bool)

(assert (=> b!284540 (=> (not res!147049) (not e!180480))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284540 (= res!147049 (validKeyInArray!0 k0!2581))))

(declare-fun b!284541 () Bool)

(declare-fun e!180482 () Bool)

(assert (=> b!284541 (= e!180482 false)))

(declare-fun lt!140536 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14186 (_ BitVec 32)) Bool)

(assert (=> b!284541 (= lt!140536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284542 () Bool)

(assert (=> b!284542 (= e!180480 e!180482)))

(declare-fun res!147047 () Bool)

(assert (=> b!284542 (=> (not res!147047) (not e!180482))))

(declare-datatypes ((SeekEntryResult!1890 0))(
  ( (MissingZero!1890 (index!9730 (_ BitVec 32))) (Found!1890 (index!9731 (_ BitVec 32))) (Intermediate!1890 (undefined!2702 Bool) (index!9732 (_ BitVec 32)) (x!27937 (_ BitVec 32))) (Undefined!1890) (MissingVacant!1890 (index!9733 (_ BitVec 32))) )
))
(declare-fun lt!140535 () SeekEntryResult!1890)

(assert (=> b!284542 (= res!147047 (or (= lt!140535 (MissingZero!1890 i!1267)) (= lt!140535 (MissingVacant!1890 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14186 (_ BitVec 32)) SeekEntryResult!1890)

(assert (=> b!284542 (= lt!140535 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284543 () Bool)

(declare-fun res!147051 () Bool)

(assert (=> b!284543 (=> (not res!147051) (not e!180480))))

(declare-fun arrayContainsKey!0 (array!14186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284543 (= res!147051 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27536 res!147046) b!284539))

(assert (= (and b!284539 res!147050) b!284540))

(assert (= (and b!284540 res!147049) b!284538))

(assert (= (and b!284538 res!147048) b!284543))

(assert (= (and b!284543 res!147051) b!284542))

(assert (= (and b!284542 res!147047) b!284541))

(declare-fun m!299531 () Bool)

(assert (=> b!284538 m!299531))

(declare-fun m!299533 () Bool)

(assert (=> b!284540 m!299533))

(declare-fun m!299535 () Bool)

(assert (=> b!284542 m!299535))

(declare-fun m!299537 () Bool)

(assert (=> b!284543 m!299537))

(declare-fun m!299539 () Bool)

(assert (=> start!27536 m!299539))

(declare-fun m!299541 () Bool)

(assert (=> start!27536 m!299541))

(declare-fun m!299543 () Bool)

(assert (=> b!284541 m!299543))

(check-sat (not b!284541) (not b!284543) (not b!284542) (not b!284538) (not start!27536) (not b!284540))
(check-sat)
