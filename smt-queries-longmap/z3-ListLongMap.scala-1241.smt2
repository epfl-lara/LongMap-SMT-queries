; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26006 () Bool)

(assert start!26006)

(declare-fun b!268314 () Bool)

(declare-fun res!132596 () Bool)

(declare-fun e!173327 () Bool)

(assert (=> b!268314 (=> (not res!132596) (not e!173327))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268314 (= res!132596 (validKeyInArray!0 k0!2581))))

(declare-fun b!268315 () Bool)

(declare-fun e!173325 () Bool)

(assert (=> b!268315 (= e!173325 false)))

(declare-fun lt!134847 () Bool)

(declare-datatypes ((array!13103 0))(
  ( (array!13104 (arr!6201 (Array (_ BitVec 32) (_ BitVec 64))) (size!6553 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13103)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13103 (_ BitVec 32)) Bool)

(assert (=> b!268315 (= lt!134847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268316 () Bool)

(declare-fun res!132592 () Bool)

(assert (=> b!268316 (=> (not res!132592) (not e!173327))))

(declare-fun arrayContainsKey!0 (array!13103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268316 (= res!132592 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268317 () Bool)

(declare-fun res!132594 () Bool)

(assert (=> b!268317 (=> (not res!132594) (not e!173327))))

(declare-datatypes ((List!4009 0))(
  ( (Nil!4006) (Cons!4005 (h!4672 (_ BitVec 64)) (t!9091 List!4009)) )
))
(declare-fun arrayNoDuplicates!0 (array!13103 (_ BitVec 32) List!4009) Bool)

(assert (=> b!268317 (= res!132594 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4006))))

(declare-fun res!132597 () Bool)

(assert (=> start!26006 (=> (not res!132597) (not e!173327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26006 (= res!132597 (validMask!0 mask!3868))))

(assert (=> start!26006 e!173327))

(declare-fun array_inv!4164 (array!13103) Bool)

(assert (=> start!26006 (array_inv!4164 a!3325)))

(assert (=> start!26006 true))

(declare-fun b!268318 () Bool)

(declare-fun res!132593 () Bool)

(assert (=> b!268318 (=> (not res!132593) (not e!173327))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268318 (= res!132593 (and (= (size!6553 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6553 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6553 a!3325))))))

(declare-fun b!268319 () Bool)

(assert (=> b!268319 (= e!173327 e!173325)))

(declare-fun res!132595 () Bool)

(assert (=> b!268319 (=> (not res!132595) (not e!173325))))

(declare-datatypes ((SeekEntryResult!1359 0))(
  ( (MissingZero!1359 (index!7606 (_ BitVec 32))) (Found!1359 (index!7607 (_ BitVec 32))) (Intermediate!1359 (undefined!2171 Bool) (index!7608 (_ BitVec 32)) (x!25972 (_ BitVec 32))) (Undefined!1359) (MissingVacant!1359 (index!7609 (_ BitVec 32))) )
))
(declare-fun lt!134848 () SeekEntryResult!1359)

(assert (=> b!268319 (= res!132595 (or (= lt!134848 (MissingZero!1359 i!1267)) (= lt!134848 (MissingVacant!1359 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13103 (_ BitVec 32)) SeekEntryResult!1359)

(assert (=> b!268319 (= lt!134848 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26006 res!132597) b!268318))

(assert (= (and b!268318 res!132593) b!268314))

(assert (= (and b!268314 res!132596) b!268317))

(assert (= (and b!268317 res!132594) b!268316))

(assert (= (and b!268316 res!132592) b!268319))

(assert (= (and b!268319 res!132595) b!268315))

(declare-fun m!284477 () Bool)

(assert (=> b!268319 m!284477))

(declare-fun m!284479 () Bool)

(assert (=> b!268316 m!284479))

(declare-fun m!284481 () Bool)

(assert (=> b!268314 m!284481))

(declare-fun m!284483 () Bool)

(assert (=> b!268315 m!284483))

(declare-fun m!284485 () Bool)

(assert (=> b!268317 m!284485))

(declare-fun m!284487 () Bool)

(assert (=> start!26006 m!284487))

(declare-fun m!284489 () Bool)

(assert (=> start!26006 m!284489))

(check-sat (not b!268319) (not b!268315) (not start!26006) (not b!268314) (not b!268316) (not b!268317))
(check-sat)
