; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26622 () Bool)

(assert start!26622)

(declare-fun b!276425 () Bool)

(declare-fun res!140390 () Bool)

(declare-fun e!176599 () Bool)

(assert (=> b!276425 (=> (not res!140390) (not e!176599))))

(declare-datatypes ((array!13718 0))(
  ( (array!13719 (arr!6508 (Array (_ BitVec 32) (_ BitVec 64))) (size!6860 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13718)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276425 (= res!140390 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276426 () Bool)

(declare-fun e!176598 () Bool)

(assert (=> b!276426 (= e!176599 e!176598)))

(declare-fun res!140391 () Bool)

(assert (=> b!276426 (=> (not res!140391) (not e!176598))))

(declare-datatypes ((SeekEntryResult!1631 0))(
  ( (MissingZero!1631 (index!8694 (_ BitVec 32))) (Found!1631 (index!8695 (_ BitVec 32))) (Intermediate!1631 (undefined!2443 Bool) (index!8696 (_ BitVec 32)) (x!27068 (_ BitVec 32))) (Undefined!1631) (MissingVacant!1631 (index!8697 (_ BitVec 32))) )
))
(declare-fun lt!137682 () SeekEntryResult!1631)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276426 (= res!140391 (or (= lt!137682 (MissingZero!1631 i!1267)) (= lt!137682 (MissingVacant!1631 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13718 (_ BitVec 32)) SeekEntryResult!1631)

(assert (=> b!276426 (= lt!137682 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276428 () Bool)

(assert (=> b!276428 (= e!176598 false)))

(declare-fun lt!137681 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13718 (_ BitVec 32)) Bool)

(assert (=> b!276428 (= lt!137681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276429 () Bool)

(declare-fun res!140392 () Bool)

(assert (=> b!276429 (=> (not res!140392) (not e!176599))))

(declare-datatypes ((List!4229 0))(
  ( (Nil!4226) (Cons!4225 (h!4892 (_ BitVec 64)) (t!9303 List!4229)) )
))
(declare-fun arrayNoDuplicates!0 (array!13718 (_ BitVec 32) List!4229) Bool)

(assert (=> b!276429 (= res!140392 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4226))))

(declare-fun b!276430 () Bool)

(declare-fun res!140389 () Bool)

(assert (=> b!276430 (=> (not res!140389) (not e!176599))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276430 (= res!140389 (and (= (size!6860 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6860 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6860 a!3325))))))

(declare-fun res!140394 () Bool)

(assert (=> start!26622 (=> (not res!140394) (not e!176599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26622 (= res!140394 (validMask!0 mask!3868))))

(assert (=> start!26622 e!176599))

(declare-fun array_inv!4458 (array!13718) Bool)

(assert (=> start!26622 (array_inv!4458 a!3325)))

(assert (=> start!26622 true))

(declare-fun b!276427 () Bool)

(declare-fun res!140393 () Bool)

(assert (=> b!276427 (=> (not res!140393) (not e!176599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276427 (= res!140393 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26622 res!140394) b!276430))

(assert (= (and b!276430 res!140389) b!276427))

(assert (= (and b!276427 res!140393) b!276429))

(assert (= (and b!276429 res!140392) b!276425))

(assert (= (and b!276425 res!140390) b!276426))

(assert (= (and b!276426 res!140391) b!276428))

(declare-fun m!291935 () Bool)

(assert (=> b!276426 m!291935))

(declare-fun m!291937 () Bool)

(assert (=> b!276428 m!291937))

(declare-fun m!291939 () Bool)

(assert (=> b!276429 m!291939))

(declare-fun m!291941 () Bool)

(assert (=> b!276427 m!291941))

(declare-fun m!291943 () Bool)

(assert (=> start!26622 m!291943))

(declare-fun m!291945 () Bool)

(assert (=> start!26622 m!291945))

(declare-fun m!291947 () Bool)

(assert (=> b!276425 m!291947))

(check-sat (not b!276428) (not b!276429) (not b!276427) (not b!276426) (not start!26622) (not b!276425))
(check-sat)
