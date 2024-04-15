; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26486 () Bool)

(assert start!26486)

(declare-fun b!274809 () Bool)

(declare-fun e!175854 () Bool)

(assert (=> b!274809 (= e!175854 false)))

(declare-fun lt!137045 () Bool)

(declare-datatypes ((array!13572 0))(
  ( (array!13573 (arr!6435 (Array (_ BitVec 32) (_ BitVec 64))) (size!6788 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13572)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13572 (_ BitVec 32)) Bool)

(assert (=> b!274809 (= lt!137045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274810 () Bool)

(declare-fun res!138855 () Bool)

(declare-fun e!175853 () Bool)

(assert (=> b!274810 (=> (not res!138855) (not e!175853))))

(declare-datatypes ((List!4216 0))(
  ( (Nil!4213) (Cons!4212 (h!4879 (_ BitVec 64)) (t!9289 List!4216)) )
))
(declare-fun arrayNoDuplicates!0 (array!13572 (_ BitVec 32) List!4216) Bool)

(assert (=> b!274810 (= res!138855 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4213))))

(declare-fun b!274811 () Bool)

(assert (=> b!274811 (= e!175853 e!175854)))

(declare-fun res!138854 () Bool)

(assert (=> b!274811 (=> (not res!138854) (not e!175854))))

(declare-datatypes ((SeekEntryResult!1592 0))(
  ( (MissingZero!1592 (index!8538 (_ BitVec 32))) (Found!1592 (index!8539 (_ BitVec 32))) (Intermediate!1592 (undefined!2404 Bool) (index!8540 (_ BitVec 32)) (x!26844 (_ BitVec 32))) (Undefined!1592) (MissingVacant!1592 (index!8541 (_ BitVec 32))) )
))
(declare-fun lt!137046 () SeekEntryResult!1592)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274811 (= res!138854 (or (= lt!137046 (MissingZero!1592 i!1267)) (= lt!137046 (MissingVacant!1592 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13572 (_ BitVec 32)) SeekEntryResult!1592)

(assert (=> b!274811 (= lt!137046 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274812 () Bool)

(declare-fun res!138851 () Bool)

(assert (=> b!274812 (=> (not res!138851) (not e!175853))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274812 (= res!138851 (and (= (size!6788 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6788 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6788 a!3325))))))

(declare-fun b!274813 () Bool)

(declare-fun res!138852 () Bool)

(assert (=> b!274813 (=> (not res!138852) (not e!175853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274813 (= res!138852 (validKeyInArray!0 k0!2581))))

(declare-fun res!138856 () Bool)

(assert (=> start!26486 (=> (not res!138856) (not e!175853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26486 (= res!138856 (validMask!0 mask!3868))))

(assert (=> start!26486 e!175853))

(declare-fun array_inv!4407 (array!13572) Bool)

(assert (=> start!26486 (array_inv!4407 a!3325)))

(assert (=> start!26486 true))

(declare-fun b!274814 () Bool)

(declare-fun res!138853 () Bool)

(assert (=> b!274814 (=> (not res!138853) (not e!175853))))

(declare-fun arrayContainsKey!0 (array!13572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274814 (= res!138853 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26486 res!138856) b!274812))

(assert (= (and b!274812 res!138851) b!274813))

(assert (= (and b!274813 res!138852) b!274810))

(assert (= (and b!274810 res!138855) b!274814))

(assert (= (and b!274814 res!138853) b!274811))

(assert (= (and b!274811 res!138854) b!274809))

(declare-fun m!290039 () Bool)

(assert (=> b!274813 m!290039))

(declare-fun m!290041 () Bool)

(assert (=> b!274814 m!290041))

(declare-fun m!290043 () Bool)

(assert (=> b!274810 m!290043))

(declare-fun m!290045 () Bool)

(assert (=> b!274811 m!290045))

(declare-fun m!290047 () Bool)

(assert (=> start!26486 m!290047))

(declare-fun m!290049 () Bool)

(assert (=> start!26486 m!290049))

(declare-fun m!290051 () Bool)

(assert (=> b!274809 m!290051))

(check-sat (not b!274811) (not b!274809) (not b!274810) (not start!26486) (not b!274814) (not b!274813))
(check-sat)
