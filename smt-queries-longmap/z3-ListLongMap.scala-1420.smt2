; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27546 () Bool)

(assert start!27546)

(declare-fun b!284675 () Bool)

(declare-fun e!180551 () Bool)

(assert (=> b!284675 (= e!180551 false)))

(declare-fun lt!140625 () Bool)

(declare-datatypes ((array!14195 0))(
  ( (array!14196 (arr!6736 (Array (_ BitVec 32) (_ BitVec 64))) (size!7088 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14195)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14195 (_ BitVec 32)) Bool)

(assert (=> b!284675 (= lt!140625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284676 () Bool)

(declare-fun res!147157 () Bool)

(declare-fun e!180549 () Bool)

(assert (=> b!284676 (=> (not res!147157) (not e!180549))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284676 (= res!147157 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!147162 () Bool)

(assert (=> start!27546 (=> (not res!147162) (not e!180549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27546 (= res!147162 (validMask!0 mask!3868))))

(assert (=> start!27546 e!180549))

(declare-fun array_inv!4686 (array!14195) Bool)

(assert (=> start!27546 (array_inv!4686 a!3325)))

(assert (=> start!27546 true))

(declare-fun b!284677 () Bool)

(declare-fun res!147160 () Bool)

(assert (=> b!284677 (=> (not res!147160) (not e!180549))))

(declare-datatypes ((List!4457 0))(
  ( (Nil!4454) (Cons!4453 (h!5126 (_ BitVec 64)) (t!9531 List!4457)) )
))
(declare-fun arrayNoDuplicates!0 (array!14195 (_ BitVec 32) List!4457) Bool)

(assert (=> b!284677 (= res!147160 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4454))))

(declare-fun b!284678 () Bool)

(assert (=> b!284678 (= e!180549 e!180551)))

(declare-fun res!147158 () Bool)

(assert (=> b!284678 (=> (not res!147158) (not e!180551))))

(declare-datatypes ((SeekEntryResult!1859 0))(
  ( (MissingZero!1859 (index!9606 (_ BitVec 32))) (Found!1859 (index!9607 (_ BitVec 32))) (Intermediate!1859 (undefined!2671 Bool) (index!9608 (_ BitVec 32)) (x!27922 (_ BitVec 32))) (Undefined!1859) (MissingVacant!1859 (index!9609 (_ BitVec 32))) )
))
(declare-fun lt!140624 () SeekEntryResult!1859)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284678 (= res!147158 (or (= lt!140624 (MissingZero!1859 i!1267)) (= lt!140624 (MissingVacant!1859 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14195 (_ BitVec 32)) SeekEntryResult!1859)

(assert (=> b!284678 (= lt!140624 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284679 () Bool)

(declare-fun res!147159 () Bool)

(assert (=> b!284679 (=> (not res!147159) (not e!180549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284679 (= res!147159 (validKeyInArray!0 k0!2581))))

(declare-fun b!284680 () Bool)

(declare-fun res!147161 () Bool)

(assert (=> b!284680 (=> (not res!147161) (not e!180549))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284680 (= res!147161 (and (= (size!7088 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7088 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7088 a!3325))))))

(assert (= (and start!27546 res!147162) b!284680))

(assert (= (and b!284680 res!147161) b!284679))

(assert (= (and b!284679 res!147159) b!284677))

(assert (= (and b!284677 res!147160) b!284676))

(assert (= (and b!284676 res!147157) b!284678))

(assert (= (and b!284678 res!147158) b!284675))

(declare-fun m!299807 () Bool)

(assert (=> b!284679 m!299807))

(declare-fun m!299809 () Bool)

(assert (=> start!27546 m!299809))

(declare-fun m!299811 () Bool)

(assert (=> start!27546 m!299811))

(declare-fun m!299813 () Bool)

(assert (=> b!284678 m!299813))

(declare-fun m!299815 () Bool)

(assert (=> b!284675 m!299815))

(declare-fun m!299817 () Bool)

(assert (=> b!284676 m!299817))

(declare-fun m!299819 () Bool)

(assert (=> b!284677 m!299819))

(check-sat (not b!284679) (not b!284675) (not b!284677) (not b!284678) (not b!284676) (not start!27546))
(check-sat)
