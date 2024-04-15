; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26498 () Bool)

(assert start!26498)

(declare-fun b!274917 () Bool)

(declare-fun res!138960 () Bool)

(declare-fun e!175908 () Bool)

(assert (=> b!274917 (=> (not res!138960) (not e!175908))))

(declare-datatypes ((array!13584 0))(
  ( (array!13585 (arr!6441 (Array (_ BitVec 32) (_ BitVec 64))) (size!6794 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13584)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274917 (= res!138960 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274918 () Bool)

(declare-fun e!175907 () Bool)

(assert (=> b!274918 (= e!175908 e!175907)))

(declare-fun res!138964 () Bool)

(assert (=> b!274918 (=> (not res!138964) (not e!175907))))

(declare-datatypes ((SeekEntryResult!1598 0))(
  ( (MissingZero!1598 (index!8562 (_ BitVec 32))) (Found!1598 (index!8563 (_ BitVec 32))) (Intermediate!1598 (undefined!2410 Bool) (index!8564 (_ BitVec 32)) (x!26866 (_ BitVec 32))) (Undefined!1598) (MissingVacant!1598 (index!8565 (_ BitVec 32))) )
))
(declare-fun lt!137081 () SeekEntryResult!1598)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274918 (= res!138964 (or (= lt!137081 (MissingZero!1598 i!1267)) (= lt!137081 (MissingVacant!1598 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13584 (_ BitVec 32)) SeekEntryResult!1598)

(assert (=> b!274918 (= lt!137081 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274919 () Bool)

(declare-fun res!138959 () Bool)

(assert (=> b!274919 (=> (not res!138959) (not e!175908))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274919 (= res!138959 (and (= (size!6794 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6794 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6794 a!3325))))))

(declare-fun res!138961 () Bool)

(assert (=> start!26498 (=> (not res!138961) (not e!175908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26498 (= res!138961 (validMask!0 mask!3868))))

(assert (=> start!26498 e!175908))

(declare-fun array_inv!4413 (array!13584) Bool)

(assert (=> start!26498 (array_inv!4413 a!3325)))

(assert (=> start!26498 true))

(declare-fun b!274920 () Bool)

(declare-fun res!138962 () Bool)

(assert (=> b!274920 (=> (not res!138962) (not e!175908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274920 (= res!138962 (validKeyInArray!0 k0!2581))))

(declare-fun b!274921 () Bool)

(declare-fun res!138963 () Bool)

(assert (=> b!274921 (=> (not res!138963) (not e!175908))))

(declare-datatypes ((List!4222 0))(
  ( (Nil!4219) (Cons!4218 (h!4885 (_ BitVec 64)) (t!9295 List!4222)) )
))
(declare-fun arrayNoDuplicates!0 (array!13584 (_ BitVec 32) List!4222) Bool)

(assert (=> b!274921 (= res!138963 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4219))))

(declare-fun b!274922 () Bool)

(assert (=> b!274922 (= e!175907 false)))

(declare-fun lt!137082 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13584 (_ BitVec 32)) Bool)

(assert (=> b!274922 (= lt!137082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26498 res!138961) b!274919))

(assert (= (and b!274919 res!138959) b!274920))

(assert (= (and b!274920 res!138962) b!274921))

(assert (= (and b!274921 res!138963) b!274917))

(assert (= (and b!274917 res!138960) b!274918))

(assert (= (and b!274918 res!138964) b!274922))

(declare-fun m!290123 () Bool)

(assert (=> b!274920 m!290123))

(declare-fun m!290125 () Bool)

(assert (=> b!274922 m!290125))

(declare-fun m!290127 () Bool)

(assert (=> start!26498 m!290127))

(declare-fun m!290129 () Bool)

(assert (=> start!26498 m!290129))

(declare-fun m!290131 () Bool)

(assert (=> b!274921 m!290131))

(declare-fun m!290133 () Bool)

(assert (=> b!274917 m!290133))

(declare-fun m!290135 () Bool)

(assert (=> b!274918 m!290135))

(check-sat (not b!274918) (not b!274922) (not b!274917) (not b!274920) (not b!274921) (not start!26498))
(check-sat)
