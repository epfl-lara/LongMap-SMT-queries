; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26852 () Bool)

(assert start!26852)

(declare-fun res!142002 () Bool)

(declare-fun e!177678 () Bool)

(assert (=> start!26852 (=> (not res!142002) (not e!177678))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26852 (= res!142002 (validMask!0 mask!3868))))

(assert (=> start!26852 e!177678))

(declare-datatypes ((array!13856 0))(
  ( (array!13857 (arr!6576 (Array (_ BitVec 32) (_ BitVec 64))) (size!6928 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13856)

(declare-fun array_inv!4539 (array!13856) Bool)

(assert (=> start!26852 (array_inv!4539 a!3325)))

(assert (=> start!26852 true))

(declare-fun b!278568 () Bool)

(declare-fun res!141999 () Bool)

(assert (=> b!278568 (=> (not res!141999) (not e!177678))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278568 (= res!141999 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278569 () Bool)

(declare-fun res!142000 () Bool)

(assert (=> b!278569 (=> (not res!142000) (not e!177678))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278569 (= res!142000 (and (= (size!6928 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6928 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6928 a!3325))))))

(declare-fun b!278570 () Bool)

(declare-fun res!142001 () Bool)

(assert (=> b!278570 (=> (not res!142001) (not e!177678))))

(declare-datatypes ((List!4384 0))(
  ( (Nil!4381) (Cons!4380 (h!5050 (_ BitVec 64)) (t!9466 List!4384)) )
))
(declare-fun arrayNoDuplicates!0 (array!13856 (_ BitVec 32) List!4384) Bool)

(assert (=> b!278570 (= res!142001 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4381))))

(declare-fun b!278571 () Bool)

(declare-fun e!177680 () Bool)

(assert (=> b!278571 (= e!177680 false)))

(declare-fun lt!138420 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13856 (_ BitVec 32)) Bool)

(assert (=> b!278571 (= lt!138420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278572 () Bool)

(declare-fun res!141997 () Bool)

(assert (=> b!278572 (=> (not res!141997) (not e!177678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278572 (= res!141997 (validKeyInArray!0 k0!2581))))

(declare-fun b!278573 () Bool)

(assert (=> b!278573 (= e!177678 e!177680)))

(declare-fun res!141998 () Bool)

(assert (=> b!278573 (=> (not res!141998) (not e!177680))))

(declare-datatypes ((SeekEntryResult!1734 0))(
  ( (MissingZero!1734 (index!9106 (_ BitVec 32))) (Found!1734 (index!9107 (_ BitVec 32))) (Intermediate!1734 (undefined!2546 Bool) (index!9108 (_ BitVec 32)) (x!27356 (_ BitVec 32))) (Undefined!1734) (MissingVacant!1734 (index!9109 (_ BitVec 32))) )
))
(declare-fun lt!138421 () SeekEntryResult!1734)

(assert (=> b!278573 (= res!141998 (or (= lt!138421 (MissingZero!1734 i!1267)) (= lt!138421 (MissingVacant!1734 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13856 (_ BitVec 32)) SeekEntryResult!1734)

(assert (=> b!278573 (= lt!138421 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26852 res!142002) b!278569))

(assert (= (and b!278569 res!142000) b!278572))

(assert (= (and b!278572 res!141997) b!278570))

(assert (= (and b!278570 res!142001) b!278568))

(assert (= (and b!278568 res!141999) b!278573))

(assert (= (and b!278573 res!141998) b!278571))

(declare-fun m!293609 () Bool)

(assert (=> b!278571 m!293609))

(declare-fun m!293611 () Bool)

(assert (=> start!26852 m!293611))

(declare-fun m!293613 () Bool)

(assert (=> start!26852 m!293613))

(declare-fun m!293615 () Bool)

(assert (=> b!278573 m!293615))

(declare-fun m!293617 () Bool)

(assert (=> b!278572 m!293617))

(declare-fun m!293619 () Bool)

(assert (=> b!278570 m!293619))

(declare-fun m!293621 () Bool)

(assert (=> b!278568 m!293621))

(check-sat (not b!278571) (not b!278570) (not b!278573) (not start!26852) (not b!278568) (not b!278572))
(check-sat)
