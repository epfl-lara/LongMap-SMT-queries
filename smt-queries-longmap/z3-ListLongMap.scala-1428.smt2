; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27644 () Bool)

(assert start!27644)

(declare-fun b!285198 () Bool)

(declare-fun res!147659 () Bool)

(declare-fun e!180786 () Bool)

(assert (=> b!285198 (=> (not res!147659) (not e!180786))))

(declare-datatypes ((array!14238 0))(
  ( (array!14239 (arr!6756 (Array (_ BitVec 32) (_ BitVec 64))) (size!7109 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14238)

(declare-datatypes ((List!4537 0))(
  ( (Nil!4534) (Cons!4533 (h!5206 (_ BitVec 64)) (t!9610 List!4537)) )
))
(declare-fun arrayNoDuplicates!0 (array!14238 (_ BitVec 32) List!4537) Bool)

(assert (=> b!285198 (= res!147659 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4534))))

(declare-fun b!285199 () Bool)

(declare-fun res!147660 () Bool)

(assert (=> b!285199 (=> (not res!147660) (not e!180786))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285199 (= res!147660 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285200 () Bool)

(declare-fun res!147657 () Bool)

(assert (=> b!285200 (=> (not res!147657) (not e!180786))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!285200 (= res!147657 (and (= (size!7109 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7109 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7109 a!3325))))))

(declare-fun res!147658 () Bool)

(assert (=> start!27644 (=> (not res!147658) (not e!180786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27644 (= res!147658 (validMask!0 mask!3868))))

(assert (=> start!27644 e!180786))

(declare-fun array_inv!4728 (array!14238) Bool)

(assert (=> start!27644 (array_inv!4728 a!3325)))

(assert (=> start!27644 true))

(declare-fun b!285201 () Bool)

(declare-fun e!180785 () Bool)

(assert (=> b!285201 (= e!180786 e!180785)))

(declare-fun res!147661 () Bool)

(assert (=> b!285201 (=> (not res!147661) (not e!180785))))

(declare-datatypes ((SeekEntryResult!1913 0))(
  ( (MissingZero!1913 (index!9822 (_ BitVec 32))) (Found!1913 (index!9823 (_ BitVec 32))) (Intermediate!1913 (undefined!2725 Bool) (index!9824 (_ BitVec 32)) (x!28039 (_ BitVec 32))) (Undefined!1913) (MissingVacant!1913 (index!9825 (_ BitVec 32))) )
))
(declare-fun lt!140609 () SeekEntryResult!1913)

(assert (=> b!285201 (= res!147661 (or (= lt!140609 (MissingZero!1913 i!1267)) (= lt!140609 (MissingVacant!1913 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14238 (_ BitVec 32)) SeekEntryResult!1913)

(assert (=> b!285201 (= lt!140609 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!285202 () Bool)

(assert (=> b!285202 (= e!180785 false)))

(declare-fun lt!140610 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14238 (_ BitVec 32)) Bool)

(assert (=> b!285202 (= lt!140610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285203 () Bool)

(declare-fun res!147656 () Bool)

(assert (=> b!285203 (=> (not res!147656) (not e!180786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285203 (= res!147656 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27644 res!147658) b!285200))

(assert (= (and b!285200 res!147657) b!285203))

(assert (= (and b!285203 res!147656) b!285198))

(assert (= (and b!285198 res!147659) b!285199))

(assert (= (and b!285199 res!147660) b!285201))

(assert (= (and b!285201 res!147661) b!285202))

(declare-fun m!299603 () Bool)

(assert (=> b!285201 m!299603))

(declare-fun m!299605 () Bool)

(assert (=> start!27644 m!299605))

(declare-fun m!299607 () Bool)

(assert (=> start!27644 m!299607))

(declare-fun m!299609 () Bool)

(assert (=> b!285198 m!299609))

(declare-fun m!299611 () Bool)

(assert (=> b!285203 m!299611))

(declare-fun m!299613 () Bool)

(assert (=> b!285202 m!299613))

(declare-fun m!299615 () Bool)

(assert (=> b!285199 m!299615))

(check-sat (not start!27644) (not b!285199) (not b!285202) (not b!285201) (not b!285198) (not b!285203))
(check-sat)
