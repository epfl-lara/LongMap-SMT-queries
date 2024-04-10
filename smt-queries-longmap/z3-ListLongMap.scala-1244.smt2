; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26024 () Bool)

(assert start!26024)

(declare-fun b!268485 () Bool)

(declare-fun res!132766 () Bool)

(declare-fun e!173406 () Bool)

(assert (=> b!268485 (=> (not res!132766) (not e!173406))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268485 (= res!132766 (validKeyInArray!0 k0!2581))))

(declare-fun b!268486 () Bool)

(declare-fun res!132764 () Bool)

(assert (=> b!268486 (=> (not res!132764) (not e!173406))))

(declare-datatypes ((array!13121 0))(
  ( (array!13122 (arr!6210 (Array (_ BitVec 32) (_ BitVec 64))) (size!6562 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13121)

(declare-fun arrayContainsKey!0 (array!13121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268486 (= res!132764 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268487 () Bool)

(declare-fun res!132768 () Bool)

(assert (=> b!268487 (=> (not res!132768) (not e!173406))))

(declare-datatypes ((List!4018 0))(
  ( (Nil!4015) (Cons!4014 (h!4681 (_ BitVec 64)) (t!9100 List!4018)) )
))
(declare-fun arrayNoDuplicates!0 (array!13121 (_ BitVec 32) List!4018) Bool)

(assert (=> b!268487 (= res!132768 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4015))))

(declare-fun b!268488 () Bool)

(declare-fun res!132765 () Bool)

(assert (=> b!268488 (=> (not res!132765) (not e!173406))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268488 (= res!132765 (and (= (size!6562 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6562 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6562 a!3325))))))

(declare-fun res!132767 () Bool)

(assert (=> start!26024 (=> (not res!132767) (not e!173406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26024 (= res!132767 (validMask!0 mask!3868))))

(assert (=> start!26024 e!173406))

(declare-fun array_inv!4173 (array!13121) Bool)

(assert (=> start!26024 (array_inv!4173 a!3325)))

(assert (=> start!26024 true))

(declare-fun b!268489 () Bool)

(declare-fun e!173407 () Bool)

(assert (=> b!268489 (= e!173407 false)))

(declare-fun lt!134892 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13121 (_ BitVec 32)) Bool)

(assert (=> b!268489 (= lt!134892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268490 () Bool)

(assert (=> b!268490 (= e!173406 e!173407)))

(declare-fun res!132763 () Bool)

(assert (=> b!268490 (=> (not res!132763) (not e!173407))))

(declare-datatypes ((SeekEntryResult!1368 0))(
  ( (MissingZero!1368 (index!7642 (_ BitVec 32))) (Found!1368 (index!7643 (_ BitVec 32))) (Intermediate!1368 (undefined!2180 Bool) (index!7644 (_ BitVec 32)) (x!26005 (_ BitVec 32))) (Undefined!1368) (MissingVacant!1368 (index!7645 (_ BitVec 32))) )
))
(declare-fun lt!134893 () SeekEntryResult!1368)

(assert (=> b!268490 (= res!132763 (or (= lt!134893 (MissingZero!1368 i!1267)) (= lt!134893 (MissingVacant!1368 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13121 (_ BitVec 32)) SeekEntryResult!1368)

(assert (=> b!268490 (= lt!134893 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26024 res!132767) b!268488))

(assert (= (and b!268488 res!132765) b!268485))

(assert (= (and b!268485 res!132766) b!268487))

(assert (= (and b!268487 res!132768) b!268486))

(assert (= (and b!268486 res!132764) b!268490))

(assert (= (and b!268490 res!132763) b!268489))

(declare-fun m!284603 () Bool)

(assert (=> b!268487 m!284603))

(declare-fun m!284605 () Bool)

(assert (=> b!268490 m!284605))

(declare-fun m!284607 () Bool)

(assert (=> b!268486 m!284607))

(declare-fun m!284609 () Bool)

(assert (=> b!268489 m!284609))

(declare-fun m!284611 () Bool)

(assert (=> b!268485 m!284611))

(declare-fun m!284613 () Bool)

(assert (=> start!26024 m!284613))

(declare-fun m!284615 () Bool)

(assert (=> start!26024 m!284615))

(check-sat (not b!268489) (not start!26024) (not b!268487) (not b!268486) (not b!268485) (not b!268490))
(check-sat)
