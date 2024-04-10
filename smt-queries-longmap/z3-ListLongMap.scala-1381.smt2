; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27140 () Bool)

(assert start!27140)

(declare-fun b!280716 () Bool)

(declare-fun res!143786 () Bool)

(declare-fun e!178632 () Bool)

(assert (=> b!280716 (=> (not res!143786) (not e!178632))))

(declare-datatypes ((array!13958 0))(
  ( (array!13959 (arr!6621 (Array (_ BitVec 32) (_ BitVec 64))) (size!6973 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13958)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280716 (= res!143786 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280717 () Bool)

(declare-fun res!143791 () Bool)

(assert (=> b!280717 (=> (not res!143791) (not e!178632))))

(declare-datatypes ((List!4429 0))(
  ( (Nil!4426) (Cons!4425 (h!5095 (_ BitVec 64)) (t!9511 List!4429)) )
))
(declare-fun arrayNoDuplicates!0 (array!13958 (_ BitVec 32) List!4429) Bool)

(assert (=> b!280717 (= res!143791 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4426))))

(declare-fun b!280718 () Bool)

(declare-fun res!143793 () Bool)

(declare-fun e!178633 () Bool)

(assert (=> b!280718 (=> (not res!143793) (not e!178633))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13958 (_ BitVec 32)) Bool)

(assert (=> b!280718 (= res!143793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280719 () Bool)

(declare-fun res!143788 () Bool)

(assert (=> b!280719 (=> (not res!143788) (not e!178633))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280719 (= res!143788 (validKeyInArray!0 (select (arr!6621 a!3325) startIndex!26)))))

(declare-fun b!280720 () Bool)

(declare-fun res!143789 () Bool)

(assert (=> b!280720 (=> (not res!143789) (not e!178632))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280720 (= res!143789 (and (= (size!6973 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6973 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6973 a!3325))))))

(declare-fun b!280721 () Bool)

(assert (=> b!280721 (= e!178633 (not true))))

(assert (=> b!280721 (arrayNoDuplicates!0 (array!13959 (store (arr!6621 a!3325) i!1267 k0!2581) (size!6973 a!3325)) #b00000000000000000000000000000000 Nil!4426)))

(declare-datatypes ((Unit!8842 0))(
  ( (Unit!8843) )
))
(declare-fun lt!138889 () Unit!8842)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13958 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4429) Unit!8842)

(assert (=> b!280721 (= lt!138889 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4426))))

(declare-fun res!143790 () Bool)

(assert (=> start!27140 (=> (not res!143790) (not e!178632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27140 (= res!143790 (validMask!0 mask!3868))))

(assert (=> start!27140 e!178632))

(declare-fun array_inv!4584 (array!13958) Bool)

(assert (=> start!27140 (array_inv!4584 a!3325)))

(assert (=> start!27140 true))

(declare-fun b!280722 () Bool)

(declare-fun res!143792 () Bool)

(assert (=> b!280722 (=> (not res!143792) (not e!178633))))

(assert (=> b!280722 (= res!143792 (not (= startIndex!26 i!1267)))))

(declare-fun b!280723 () Bool)

(assert (=> b!280723 (= e!178632 e!178633)))

(declare-fun res!143785 () Bool)

(assert (=> b!280723 (=> (not res!143785) (not e!178633))))

(declare-datatypes ((SeekEntryResult!1779 0))(
  ( (MissingZero!1779 (index!9286 (_ BitVec 32))) (Found!1779 (index!9287 (_ BitVec 32))) (Intermediate!1779 (undefined!2591 Bool) (index!9288 (_ BitVec 32)) (x!27521 (_ BitVec 32))) (Undefined!1779) (MissingVacant!1779 (index!9289 (_ BitVec 32))) )
))
(declare-fun lt!138888 () SeekEntryResult!1779)

(assert (=> b!280723 (= res!143785 (or (= lt!138888 (MissingZero!1779 i!1267)) (= lt!138888 (MissingVacant!1779 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13958 (_ BitVec 32)) SeekEntryResult!1779)

(assert (=> b!280723 (= lt!138888 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280724 () Bool)

(declare-fun res!143787 () Bool)

(assert (=> b!280724 (=> (not res!143787) (not e!178632))))

(assert (=> b!280724 (= res!143787 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27140 res!143790) b!280720))

(assert (= (and b!280720 res!143789) b!280724))

(assert (= (and b!280724 res!143787) b!280717))

(assert (= (and b!280717 res!143791) b!280716))

(assert (= (and b!280716 res!143786) b!280723))

(assert (= (and b!280723 res!143785) b!280718))

(assert (= (and b!280718 res!143793) b!280722))

(assert (= (and b!280722 res!143792) b!280719))

(assert (= (and b!280719 res!143788) b!280721))

(declare-fun m!295119 () Bool)

(assert (=> b!280721 m!295119))

(declare-fun m!295121 () Bool)

(assert (=> b!280721 m!295121))

(declare-fun m!295123 () Bool)

(assert (=> b!280721 m!295123))

(declare-fun m!295125 () Bool)

(assert (=> b!280723 m!295125))

(declare-fun m!295127 () Bool)

(assert (=> start!27140 m!295127))

(declare-fun m!295129 () Bool)

(assert (=> start!27140 m!295129))

(declare-fun m!295131 () Bool)

(assert (=> b!280724 m!295131))

(declare-fun m!295133 () Bool)

(assert (=> b!280716 m!295133))

(declare-fun m!295135 () Bool)

(assert (=> b!280719 m!295135))

(assert (=> b!280719 m!295135))

(declare-fun m!295137 () Bool)

(assert (=> b!280719 m!295137))

(declare-fun m!295139 () Bool)

(assert (=> b!280717 m!295139))

(declare-fun m!295141 () Bool)

(assert (=> b!280718 m!295141))

(check-sat (not start!27140) (not b!280719) (not b!280717) (not b!280724) (not b!280723) (not b!280721) (not b!280716) (not b!280718))
(check-sat)
