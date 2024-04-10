; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26000 () Bool)

(assert start!26000)

(declare-fun b!268260 () Bool)

(declare-fun res!132541 () Bool)

(declare-fun e!173298 () Bool)

(assert (=> b!268260 (=> (not res!132541) (not e!173298))))

(declare-datatypes ((array!13097 0))(
  ( (array!13098 (arr!6198 (Array (_ BitVec 32) (_ BitVec 64))) (size!6550 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13097)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268260 (= res!132541 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268261 () Bool)

(declare-fun res!132538 () Bool)

(assert (=> b!268261 (=> (not res!132538) (not e!173298))))

(declare-datatypes ((List!4006 0))(
  ( (Nil!4003) (Cons!4002 (h!4669 (_ BitVec 64)) (t!9088 List!4006)) )
))
(declare-fun arrayNoDuplicates!0 (array!13097 (_ BitVec 32) List!4006) Bool)

(assert (=> b!268261 (= res!132538 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4003))))

(declare-fun res!132539 () Bool)

(assert (=> start!26000 (=> (not res!132539) (not e!173298))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26000 (= res!132539 (validMask!0 mask!3868))))

(assert (=> start!26000 e!173298))

(declare-fun array_inv!4161 (array!13097) Bool)

(assert (=> start!26000 (array_inv!4161 a!3325)))

(assert (=> start!26000 true))

(declare-fun b!268262 () Bool)

(declare-fun e!173299 () Bool)

(assert (=> b!268262 (= e!173299 false)))

(declare-fun lt!134829 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13097 (_ BitVec 32)) Bool)

(assert (=> b!268262 (= lt!134829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268263 () Bool)

(declare-fun res!132543 () Bool)

(assert (=> b!268263 (=> (not res!132543) (not e!173298))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268263 (= res!132543 (and (= (size!6550 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6550 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6550 a!3325))))))

(declare-fun b!268264 () Bool)

(declare-fun res!132540 () Bool)

(assert (=> b!268264 (=> (not res!132540) (not e!173298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268264 (= res!132540 (validKeyInArray!0 k0!2581))))

(declare-fun b!268265 () Bool)

(assert (=> b!268265 (= e!173298 e!173299)))

(declare-fun res!132542 () Bool)

(assert (=> b!268265 (=> (not res!132542) (not e!173299))))

(declare-datatypes ((SeekEntryResult!1356 0))(
  ( (MissingZero!1356 (index!7594 (_ BitVec 32))) (Found!1356 (index!7595 (_ BitVec 32))) (Intermediate!1356 (undefined!2168 Bool) (index!7596 (_ BitVec 32)) (x!25961 (_ BitVec 32))) (Undefined!1356) (MissingVacant!1356 (index!7597 (_ BitVec 32))) )
))
(declare-fun lt!134830 () SeekEntryResult!1356)

(assert (=> b!268265 (= res!132542 (or (= lt!134830 (MissingZero!1356 i!1267)) (= lt!134830 (MissingVacant!1356 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13097 (_ BitVec 32)) SeekEntryResult!1356)

(assert (=> b!268265 (= lt!134830 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26000 res!132539) b!268263))

(assert (= (and b!268263 res!132543) b!268264))

(assert (= (and b!268264 res!132540) b!268261))

(assert (= (and b!268261 res!132538) b!268260))

(assert (= (and b!268260 res!132541) b!268265))

(assert (= (and b!268265 res!132542) b!268262))

(declare-fun m!284435 () Bool)

(assert (=> b!268265 m!284435))

(declare-fun m!284437 () Bool)

(assert (=> b!268260 m!284437))

(declare-fun m!284439 () Bool)

(assert (=> b!268262 m!284439))

(declare-fun m!284441 () Bool)

(assert (=> start!26000 m!284441))

(declare-fun m!284443 () Bool)

(assert (=> start!26000 m!284443))

(declare-fun m!284445 () Bool)

(assert (=> b!268261 m!284445))

(declare-fun m!284447 () Bool)

(assert (=> b!268264 m!284447))

(check-sat (not b!268264) (not b!268261) (not start!26000) (not b!268265) (not b!268260) (not b!268262))
(check-sat)
