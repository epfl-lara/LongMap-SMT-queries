; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26660 () Bool)

(assert start!26660)

(declare-fun b!276729 () Bool)

(declare-fun res!140720 () Bool)

(declare-fun e!176747 () Bool)

(assert (=> b!276729 (=> (not res!140720) (not e!176747))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276729 (= res!140720 (validKeyInArray!0 k0!2581))))

(declare-fun b!276730 () Bool)

(declare-fun res!140723 () Bool)

(assert (=> b!276730 (=> (not res!140723) (not e!176747))))

(declare-datatypes ((array!13757 0))(
  ( (array!13758 (arr!6528 (Array (_ BitVec 32) (_ BitVec 64))) (size!6880 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13757)

(declare-datatypes ((List!4336 0))(
  ( (Nil!4333) (Cons!4332 (h!4999 (_ BitVec 64)) (t!9418 List!4336)) )
))
(declare-fun arrayNoDuplicates!0 (array!13757 (_ BitVec 32) List!4336) Bool)

(assert (=> b!276730 (= res!140723 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4333))))

(declare-fun b!276731 () Bool)

(declare-fun e!176746 () Bool)

(assert (=> b!276731 (= e!176746 false)))

(declare-fun lt!137728 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13757 (_ BitVec 32)) Bool)

(assert (=> b!276731 (= lt!137728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276732 () Bool)

(declare-fun res!140724 () Bool)

(assert (=> b!276732 (=> (not res!140724) (not e!176747))))

(declare-fun arrayContainsKey!0 (array!13757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276732 (= res!140724 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276733 () Bool)

(declare-fun res!140721 () Bool)

(assert (=> b!276733 (=> (not res!140721) (not e!176747))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276733 (= res!140721 (and (= (size!6880 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6880 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6880 a!3325))))))

(declare-fun res!140719 () Bool)

(assert (=> start!26660 (=> (not res!140719) (not e!176747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26660 (= res!140719 (validMask!0 mask!3868))))

(assert (=> start!26660 e!176747))

(declare-fun array_inv!4491 (array!13757) Bool)

(assert (=> start!26660 (array_inv!4491 a!3325)))

(assert (=> start!26660 true))

(declare-fun b!276734 () Bool)

(assert (=> b!276734 (= e!176747 e!176746)))

(declare-fun res!140722 () Bool)

(assert (=> b!276734 (=> (not res!140722) (not e!176746))))

(declare-datatypes ((SeekEntryResult!1686 0))(
  ( (MissingZero!1686 (index!8914 (_ BitVec 32))) (Found!1686 (index!8915 (_ BitVec 32))) (Intermediate!1686 (undefined!2498 Bool) (index!8916 (_ BitVec 32)) (x!27171 (_ BitVec 32))) (Undefined!1686) (MissingVacant!1686 (index!8917 (_ BitVec 32))) )
))
(declare-fun lt!137727 () SeekEntryResult!1686)

(assert (=> b!276734 (= res!140722 (or (= lt!137727 (MissingZero!1686 i!1267)) (= lt!137727 (MissingVacant!1686 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13757 (_ BitVec 32)) SeekEntryResult!1686)

(assert (=> b!276734 (= lt!137727 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26660 res!140719) b!276733))

(assert (= (and b!276733 res!140721) b!276729))

(assert (= (and b!276729 res!140720) b!276730))

(assert (= (and b!276730 res!140723) b!276732))

(assert (= (and b!276732 res!140724) b!276734))

(assert (= (and b!276734 res!140722) b!276731))

(declare-fun m!291995 () Bool)

(assert (=> b!276732 m!291995))

(declare-fun m!291997 () Bool)

(assert (=> b!276731 m!291997))

(declare-fun m!291999 () Bool)

(assert (=> b!276730 m!291999))

(declare-fun m!292001 () Bool)

(assert (=> b!276729 m!292001))

(declare-fun m!292003 () Bool)

(assert (=> start!26660 m!292003))

(declare-fun m!292005 () Bool)

(assert (=> start!26660 m!292005))

(declare-fun m!292007 () Bool)

(assert (=> b!276734 m!292007))

(check-sat (not start!26660) (not b!276732) (not b!276730) (not b!276734) (not b!276729) (not b!276731))
(check-sat)
