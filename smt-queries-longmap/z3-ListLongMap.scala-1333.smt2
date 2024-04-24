; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26556 () Bool)

(assert start!26556)

(declare-fun b!275695 () Bool)

(declare-fun e!176303 () Bool)

(assert (=> b!275695 (= e!176303 (not true))))

(declare-datatypes ((array!13652 0))(
  ( (array!13653 (arr!6475 (Array (_ BitVec 32) (_ BitVec 64))) (size!6827 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13652)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13652 (_ BitVec 32)) Bool)

(assert (=> b!275695 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13653 (store (arr!6475 a!3325) i!1267 k0!2581) (size!6827 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8663 0))(
  ( (Unit!8664) )
))
(declare-fun lt!137501 () Unit!8663)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13652 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8663)

(assert (=> b!275695 (= lt!137501 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275696 () Bool)

(declare-fun res!139660 () Bool)

(declare-fun e!176302 () Bool)

(assert (=> b!275696 (=> (not res!139660) (not e!176302))))

(declare-datatypes ((List!4196 0))(
  ( (Nil!4193) (Cons!4192 (h!4859 (_ BitVec 64)) (t!9270 List!4196)) )
))
(declare-fun arrayNoDuplicates!0 (array!13652 (_ BitVec 32) List!4196) Bool)

(assert (=> b!275696 (= res!139660 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4193))))

(declare-fun b!275697 () Bool)

(declare-fun res!139661 () Bool)

(assert (=> b!275697 (=> (not res!139661) (not e!176303))))

(assert (=> b!275697 (= res!139661 (and (bvslt startIndex!26 (bvsub (size!6827 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275698 () Bool)

(declare-fun res!139662 () Bool)

(assert (=> b!275698 (=> (not res!139662) (not e!176302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275698 (= res!139662 (validKeyInArray!0 k0!2581))))

(declare-fun b!275699 () Bool)

(declare-fun res!139667 () Bool)

(assert (=> b!275699 (=> (not res!139667) (not e!176303))))

(assert (=> b!275699 (= res!139667 (not (= startIndex!26 i!1267)))))

(declare-fun b!275700 () Bool)

(declare-fun res!139659 () Bool)

(assert (=> b!275700 (=> (not res!139659) (not e!176302))))

(assert (=> b!275700 (= res!139659 (and (= (size!6827 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6827 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6827 a!3325))))))

(declare-fun b!275701 () Bool)

(declare-fun res!139666 () Bool)

(assert (=> b!275701 (=> (not res!139666) (not e!176303))))

(assert (=> b!275701 (= res!139666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275702 () Bool)

(assert (=> b!275702 (= e!176302 e!176303)))

(declare-fun res!139665 () Bool)

(assert (=> b!275702 (=> (not res!139665) (not e!176303))))

(declare-datatypes ((SeekEntryResult!1598 0))(
  ( (MissingZero!1598 (index!8562 (_ BitVec 32))) (Found!1598 (index!8563 (_ BitVec 32))) (Intermediate!1598 (undefined!2410 Bool) (index!8564 (_ BitVec 32)) (x!26947 (_ BitVec 32))) (Undefined!1598) (MissingVacant!1598 (index!8565 (_ BitVec 32))) )
))
(declare-fun lt!137502 () SeekEntryResult!1598)

(assert (=> b!275702 (= res!139665 (or (= lt!137502 (MissingZero!1598 i!1267)) (= lt!137502 (MissingVacant!1598 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13652 (_ BitVec 32)) SeekEntryResult!1598)

(assert (=> b!275702 (= lt!137502 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275703 () Bool)

(declare-fun res!139664 () Bool)

(assert (=> b!275703 (=> (not res!139664) (not e!176302))))

(declare-fun arrayContainsKey!0 (array!13652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275703 (= res!139664 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275704 () Bool)

(declare-fun res!139663 () Bool)

(assert (=> b!275704 (=> (not res!139663) (not e!176303))))

(assert (=> b!275704 (= res!139663 (not (validKeyInArray!0 (select (arr!6475 a!3325) startIndex!26))))))

(declare-fun res!139668 () Bool)

(assert (=> start!26556 (=> (not res!139668) (not e!176302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26556 (= res!139668 (validMask!0 mask!3868))))

(assert (=> start!26556 e!176302))

(declare-fun array_inv!4425 (array!13652) Bool)

(assert (=> start!26556 (array_inv!4425 a!3325)))

(assert (=> start!26556 true))

(assert (= (and start!26556 res!139668) b!275700))

(assert (= (and b!275700 res!139659) b!275698))

(assert (= (and b!275698 res!139662) b!275696))

(assert (= (and b!275696 res!139660) b!275703))

(assert (= (and b!275703 res!139664) b!275702))

(assert (= (and b!275702 res!139665) b!275701))

(assert (= (and b!275701 res!139666) b!275699))

(assert (= (and b!275699 res!139667) b!275704))

(assert (= (and b!275704 res!139663) b!275697))

(assert (= (and b!275697 res!139661) b!275695))

(declare-fun m!291371 () Bool)

(assert (=> b!275695 m!291371))

(declare-fun m!291373 () Bool)

(assert (=> b!275695 m!291373))

(declare-fun m!291375 () Bool)

(assert (=> b!275695 m!291375))

(declare-fun m!291377 () Bool)

(assert (=> b!275698 m!291377))

(declare-fun m!291379 () Bool)

(assert (=> start!26556 m!291379))

(declare-fun m!291381 () Bool)

(assert (=> start!26556 m!291381))

(declare-fun m!291383 () Bool)

(assert (=> b!275696 m!291383))

(declare-fun m!291385 () Bool)

(assert (=> b!275703 m!291385))

(declare-fun m!291387 () Bool)

(assert (=> b!275704 m!291387))

(assert (=> b!275704 m!291387))

(declare-fun m!291389 () Bool)

(assert (=> b!275704 m!291389))

(declare-fun m!291391 () Bool)

(assert (=> b!275701 m!291391))

(declare-fun m!291393 () Bool)

(assert (=> b!275702 m!291393))

(check-sat (not start!26556) (not b!275703) (not b!275698) (not b!275702) (not b!275704) (not b!275701) (not b!275696) (not b!275695))
(check-sat)
