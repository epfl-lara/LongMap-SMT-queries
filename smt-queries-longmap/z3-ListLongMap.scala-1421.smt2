; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27554 () Bool)

(assert start!27554)

(declare-fun b!284535 () Bool)

(declare-fun e!180452 () Bool)

(declare-fun e!180453 () Bool)

(assert (=> b!284535 (= e!180452 e!180453)))

(declare-fun res!147095 () Bool)

(assert (=> b!284535 (=> (not res!147095) (not e!180453))))

(declare-datatypes ((SeekEntryResult!1892 0))(
  ( (MissingZero!1892 (index!9738 (_ BitVec 32))) (Found!1892 (index!9739 (_ BitVec 32))) (Intermediate!1892 (undefined!2704 Bool) (index!9740 (_ BitVec 32)) (x!27962 (_ BitVec 32))) (Undefined!1892) (MissingVacant!1892 (index!9741 (_ BitVec 32))) )
))
(declare-fun lt!140403 () SeekEntryResult!1892)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284535 (= res!147095 (or (= lt!140403 (MissingZero!1892 i!1267)) (= lt!140403 (MissingVacant!1892 i!1267))))))

(declare-datatypes ((array!14193 0))(
  ( (array!14194 (arr!6735 (Array (_ BitVec 32) (_ BitVec 64))) (size!7088 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14193)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14193 (_ BitVec 32)) SeekEntryResult!1892)

(assert (=> b!284535 (= lt!140403 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284536 () Bool)

(declare-fun res!147097 () Bool)

(assert (=> b!284536 (=> (not res!147097) (not e!180452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284536 (= res!147097 (validKeyInArray!0 k0!2581))))

(declare-fun b!284537 () Bool)

(declare-fun res!147098 () Bool)

(assert (=> b!284537 (=> (not res!147098) (not e!180452))))

(declare-datatypes ((List!4516 0))(
  ( (Nil!4513) (Cons!4512 (h!5185 (_ BitVec 64)) (t!9589 List!4516)) )
))
(declare-fun arrayNoDuplicates!0 (array!14193 (_ BitVec 32) List!4516) Bool)

(assert (=> b!284537 (= res!147098 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4513))))

(declare-fun b!284539 () Bool)

(assert (=> b!284539 (= e!180453 false)))

(declare-fun lt!140402 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14193 (_ BitVec 32)) Bool)

(assert (=> b!284539 (= lt!140402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284540 () Bool)

(declare-fun res!147096 () Bool)

(assert (=> b!284540 (=> (not res!147096) (not e!180452))))

(declare-fun arrayContainsKey!0 (array!14193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284540 (= res!147096 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284538 () Bool)

(declare-fun res!147099 () Bool)

(assert (=> b!284538 (=> (not res!147099) (not e!180452))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284538 (= res!147099 (and (= (size!7088 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7088 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7088 a!3325))))))

(declare-fun res!147100 () Bool)

(assert (=> start!27554 (=> (not res!147100) (not e!180452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27554 (= res!147100 (validMask!0 mask!3868))))

(assert (=> start!27554 e!180452))

(declare-fun array_inv!4707 (array!14193) Bool)

(assert (=> start!27554 (array_inv!4707 a!3325)))

(assert (=> start!27554 true))

(assert (= (and start!27554 res!147100) b!284538))

(assert (= (and b!284538 res!147099) b!284536))

(assert (= (and b!284536 res!147097) b!284537))

(assert (= (and b!284537 res!147098) b!284540))

(assert (= (and b!284540 res!147096) b!284535))

(assert (= (and b!284535 res!147095) b!284539))

(declare-fun m!299051 () Bool)

(assert (=> b!284537 m!299051))

(declare-fun m!299053 () Bool)

(assert (=> b!284535 m!299053))

(declare-fun m!299055 () Bool)

(assert (=> b!284539 m!299055))

(declare-fun m!299057 () Bool)

(assert (=> start!27554 m!299057))

(declare-fun m!299059 () Bool)

(assert (=> start!27554 m!299059))

(declare-fun m!299061 () Bool)

(assert (=> b!284536 m!299061))

(declare-fun m!299063 () Bool)

(assert (=> b!284540 m!299063))

(check-sat (not b!284536) (not b!284537) (not b!284539) (not b!284540) (not b!284535) (not start!27554))
(check-sat)
