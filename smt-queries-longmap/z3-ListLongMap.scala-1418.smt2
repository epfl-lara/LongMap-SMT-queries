; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27534 () Bool)

(assert start!27534)

(declare-fun b!284567 () Bool)

(declare-fun e!180496 () Bool)

(declare-fun e!180497 () Bool)

(assert (=> b!284567 (= e!180496 e!180497)))

(declare-fun res!147053 () Bool)

(assert (=> b!284567 (=> (not res!147053) (not e!180497))))

(declare-datatypes ((SeekEntryResult!1853 0))(
  ( (MissingZero!1853 (index!9582 (_ BitVec 32))) (Found!1853 (index!9583 (_ BitVec 32))) (Intermediate!1853 (undefined!2665 Bool) (index!9584 (_ BitVec 32)) (x!27900 (_ BitVec 32))) (Undefined!1853) (MissingVacant!1853 (index!9585 (_ BitVec 32))) )
))
(declare-fun lt!140588 () SeekEntryResult!1853)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284567 (= res!147053 (or (= lt!140588 (MissingZero!1853 i!1267)) (= lt!140588 (MissingVacant!1853 i!1267))))))

(declare-datatypes ((array!14183 0))(
  ( (array!14184 (arr!6730 (Array (_ BitVec 32) (_ BitVec 64))) (size!7082 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14183)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14183 (_ BitVec 32)) SeekEntryResult!1853)

(assert (=> b!284567 (= lt!140588 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284568 () Bool)

(assert (=> b!284568 (= e!180497 false)))

(declare-fun lt!140589 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14183 (_ BitVec 32)) Bool)

(assert (=> b!284568 (= lt!140589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284569 () Bool)

(declare-fun res!147052 () Bool)

(assert (=> b!284569 (=> (not res!147052) (not e!180496))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284569 (= res!147052 (and (= (size!7082 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7082 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7082 a!3325))))))

(declare-fun b!284570 () Bool)

(declare-fun res!147051 () Bool)

(assert (=> b!284570 (=> (not res!147051) (not e!180496))))

(declare-fun arrayContainsKey!0 (array!14183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284570 (= res!147051 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284571 () Bool)

(declare-fun res!147049 () Bool)

(assert (=> b!284571 (=> (not res!147049) (not e!180496))))

(declare-datatypes ((List!4451 0))(
  ( (Nil!4448) (Cons!4447 (h!5120 (_ BitVec 64)) (t!9525 List!4451)) )
))
(declare-fun arrayNoDuplicates!0 (array!14183 (_ BitVec 32) List!4451) Bool)

(assert (=> b!284571 (= res!147049 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4448))))

(declare-fun b!284572 () Bool)

(declare-fun res!147050 () Bool)

(assert (=> b!284572 (=> (not res!147050) (not e!180496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284572 (= res!147050 (validKeyInArray!0 k0!2581))))

(declare-fun res!147054 () Bool)

(assert (=> start!27534 (=> (not res!147054) (not e!180496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27534 (= res!147054 (validMask!0 mask!3868))))

(assert (=> start!27534 e!180496))

(declare-fun array_inv!4680 (array!14183) Bool)

(assert (=> start!27534 (array_inv!4680 a!3325)))

(assert (=> start!27534 true))

(assert (= (and start!27534 res!147054) b!284569))

(assert (= (and b!284569 res!147052) b!284572))

(assert (= (and b!284572 res!147050) b!284571))

(assert (= (and b!284571 res!147049) b!284570))

(assert (= (and b!284570 res!147051) b!284567))

(assert (= (and b!284567 res!147053) b!284568))

(declare-fun m!299723 () Bool)

(assert (=> b!284570 m!299723))

(declare-fun m!299725 () Bool)

(assert (=> b!284571 m!299725))

(declare-fun m!299727 () Bool)

(assert (=> b!284567 m!299727))

(declare-fun m!299729 () Bool)

(assert (=> start!27534 m!299729))

(declare-fun m!299731 () Bool)

(assert (=> start!27534 m!299731))

(declare-fun m!299733 () Bool)

(assert (=> b!284568 m!299733))

(declare-fun m!299735 () Bool)

(assert (=> b!284572 m!299735))

(check-sat (not start!27534) (not b!284570) (not b!284572) (not b!284568) (not b!284567) (not b!284571))
(check-sat)
