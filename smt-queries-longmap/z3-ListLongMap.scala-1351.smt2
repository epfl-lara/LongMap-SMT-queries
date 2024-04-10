; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26666 () Bool)

(assert start!26666)

(declare-fun b!276783 () Bool)

(declare-fun res!140778 () Bool)

(declare-fun e!176772 () Bool)

(assert (=> b!276783 (=> (not res!140778) (not e!176772))))

(declare-datatypes ((array!13763 0))(
  ( (array!13764 (arr!6531 (Array (_ BitVec 32) (_ BitVec 64))) (size!6883 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13763)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276783 (= res!140778 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276784 () Bool)

(declare-fun res!140774 () Bool)

(assert (=> b!276784 (=> (not res!140774) (not e!176772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276784 (= res!140774 (validKeyInArray!0 k0!2581))))

(declare-fun b!276786 () Bool)

(declare-fun e!176773 () Bool)

(assert (=> b!276786 (= e!176773 false)))

(declare-fun lt!137746 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13763 (_ BitVec 32)) Bool)

(assert (=> b!276786 (= lt!137746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276787 () Bool)

(declare-fun res!140777 () Bool)

(assert (=> b!276787 (=> (not res!140777) (not e!176772))))

(declare-datatypes ((List!4339 0))(
  ( (Nil!4336) (Cons!4335 (h!5002 (_ BitVec 64)) (t!9421 List!4339)) )
))
(declare-fun arrayNoDuplicates!0 (array!13763 (_ BitVec 32) List!4339) Bool)

(assert (=> b!276787 (= res!140777 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4336))))

(declare-fun b!276788 () Bool)

(assert (=> b!276788 (= e!176772 e!176773)))

(declare-fun res!140776 () Bool)

(assert (=> b!276788 (=> (not res!140776) (not e!176773))))

(declare-datatypes ((SeekEntryResult!1689 0))(
  ( (MissingZero!1689 (index!8926 (_ BitVec 32))) (Found!1689 (index!8927 (_ BitVec 32))) (Intermediate!1689 (undefined!2501 Bool) (index!8928 (_ BitVec 32)) (x!27182 (_ BitVec 32))) (Undefined!1689) (MissingVacant!1689 (index!8929 (_ BitVec 32))) )
))
(declare-fun lt!137745 () SeekEntryResult!1689)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276788 (= res!140776 (or (= lt!137745 (MissingZero!1689 i!1267)) (= lt!137745 (MissingVacant!1689 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13763 (_ BitVec 32)) SeekEntryResult!1689)

(assert (=> b!276788 (= lt!137745 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276785 () Bool)

(declare-fun res!140773 () Bool)

(assert (=> b!276785 (=> (not res!140773) (not e!176772))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276785 (= res!140773 (and (= (size!6883 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6883 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6883 a!3325))))))

(declare-fun res!140775 () Bool)

(assert (=> start!26666 (=> (not res!140775) (not e!176772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26666 (= res!140775 (validMask!0 mask!3868))))

(assert (=> start!26666 e!176772))

(declare-fun array_inv!4494 (array!13763) Bool)

(assert (=> start!26666 (array_inv!4494 a!3325)))

(assert (=> start!26666 true))

(assert (= (and start!26666 res!140775) b!276785))

(assert (= (and b!276785 res!140773) b!276784))

(assert (= (and b!276784 res!140774) b!276787))

(assert (= (and b!276787 res!140777) b!276783))

(assert (= (and b!276783 res!140778) b!276788))

(assert (= (and b!276788 res!140776) b!276786))

(declare-fun m!292037 () Bool)

(assert (=> b!276783 m!292037))

(declare-fun m!292039 () Bool)

(assert (=> b!276788 m!292039))

(declare-fun m!292041 () Bool)

(assert (=> b!276786 m!292041))

(declare-fun m!292043 () Bool)

(assert (=> b!276784 m!292043))

(declare-fun m!292045 () Bool)

(assert (=> start!26666 m!292045))

(declare-fun m!292047 () Bool)

(assert (=> start!26666 m!292047))

(declare-fun m!292049 () Bool)

(assert (=> b!276787 m!292049))

(check-sat (not b!276786) (not b!276784) (not b!276788) (not b!276783) (not b!276787) (not start!26666))
(check-sat)
