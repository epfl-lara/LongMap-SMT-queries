; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26186 () Bool)

(assert start!26186)

(declare-fun b!270554 () Bool)

(declare-fun res!134544 () Bool)

(declare-fun e!174352 () Bool)

(assert (=> b!270554 (=> (not res!134544) (not e!174352))))

(declare-datatypes ((List!4099 0))(
  ( (Nil!4096) (Cons!4095 (h!4762 (_ BitVec 64)) (t!9181 List!4099)) )
))
(declare-fun noDuplicate!117 (List!4099) Bool)

(assert (=> b!270554 (= res!134544 (noDuplicate!117 Nil!4096))))

(declare-fun b!270555 () Bool)

(declare-fun res!134547 () Bool)

(declare-fun e!174351 () Bool)

(assert (=> b!270555 (=> (not res!134547) (not e!174351))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270555 (= res!134547 (validKeyInArray!0 k0!2581))))

(declare-fun b!270556 () Bool)

(assert (=> b!270556 (= e!174351 e!174352)))

(declare-fun res!134550 () Bool)

(assert (=> b!270556 (=> (not res!134550) (not e!174352))))

(declare-datatypes ((SeekEntryResult!1449 0))(
  ( (MissingZero!1449 (index!7966 (_ BitVec 32))) (Found!1449 (index!7967 (_ BitVec 32))) (Intermediate!1449 (undefined!2261 Bool) (index!7968 (_ BitVec 32)) (x!26302 (_ BitVec 32))) (Undefined!1449) (MissingVacant!1449 (index!7969 (_ BitVec 32))) )
))
(declare-fun lt!135667 () SeekEntryResult!1449)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270556 (= res!134550 (or (= lt!135667 (MissingZero!1449 i!1267)) (= lt!135667 (MissingVacant!1449 i!1267))))))

(declare-datatypes ((array!13283 0))(
  ( (array!13284 (arr!6291 (Array (_ BitVec 32) (_ BitVec 64))) (size!6643 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13283)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13283 (_ BitVec 32)) SeekEntryResult!1449)

(assert (=> b!270556 (= lt!135667 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270557 () Bool)

(declare-fun res!134549 () Bool)

(assert (=> b!270557 (=> (not res!134549) (not e!174352))))

(assert (=> b!270557 (= res!134549 (and (bvslt (size!6643 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6643 a!3325))))))

(declare-fun b!270558 () Bool)

(declare-fun res!134548 () Bool)

(assert (=> b!270558 (=> (not res!134548) (not e!174352))))

(declare-fun contains!1929 (List!4099 (_ BitVec 64)) Bool)

(assert (=> b!270558 (= res!134548 (not (contains!1929 Nil!4096 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270559 () Bool)

(declare-fun res!134553 () Bool)

(assert (=> b!270559 (=> (not res!134553) (not e!174352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13283 (_ BitVec 32)) Bool)

(assert (=> b!270559 (= res!134553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270560 () Bool)

(declare-fun res!134556 () Bool)

(assert (=> b!270560 (=> (not res!134556) (not e!174351))))

(declare-fun arrayNoDuplicates!0 (array!13283 (_ BitVec 32) List!4099) Bool)

(assert (=> b!270560 (= res!134556 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4096))))

(declare-fun b!270561 () Bool)

(declare-fun res!134545 () Bool)

(assert (=> b!270561 (=> (not res!134545) (not e!174352))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270561 (= res!134545 (validKeyInArray!0 (select (arr!6291 a!3325) startIndex!26)))))

(declare-fun b!270563 () Bool)

(declare-fun res!134555 () Bool)

(assert (=> b!270563 (=> (not res!134555) (not e!174351))))

(assert (=> b!270563 (= res!134555 (and (= (size!6643 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6643 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6643 a!3325))))))

(declare-fun b!270564 () Bool)

(declare-fun res!134552 () Bool)

(assert (=> b!270564 (=> (not res!134552) (not e!174352))))

(assert (=> b!270564 (= res!134552 (not (= startIndex!26 i!1267)))))

(declare-fun b!270565 () Bool)

(declare-fun res!134546 () Bool)

(assert (=> b!270565 (=> (not res!134546) (not e!174352))))

(assert (=> b!270565 (= res!134546 (not (contains!1929 Nil!4096 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270566 () Bool)

(declare-fun res!134554 () Bool)

(assert (=> b!270566 (=> (not res!134554) (not e!174351))))

(declare-fun arrayContainsKey!0 (array!13283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270566 (= res!134554 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270562 () Bool)

(assert (=> b!270562 (= e!174352 false)))

(declare-fun lt!135666 () Bool)

(assert (=> b!270562 (= lt!135666 (contains!1929 Nil!4096 k0!2581))))

(declare-fun res!134551 () Bool)

(assert (=> start!26186 (=> (not res!134551) (not e!174351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26186 (= res!134551 (validMask!0 mask!3868))))

(assert (=> start!26186 e!174351))

(declare-fun array_inv!4254 (array!13283) Bool)

(assert (=> start!26186 (array_inv!4254 a!3325)))

(assert (=> start!26186 true))

(assert (= (and start!26186 res!134551) b!270563))

(assert (= (and b!270563 res!134555) b!270555))

(assert (= (and b!270555 res!134547) b!270560))

(assert (= (and b!270560 res!134556) b!270566))

(assert (= (and b!270566 res!134554) b!270556))

(assert (= (and b!270556 res!134550) b!270559))

(assert (= (and b!270559 res!134553) b!270564))

(assert (= (and b!270564 res!134552) b!270561))

(assert (= (and b!270561 res!134545) b!270557))

(assert (= (and b!270557 res!134549) b!270554))

(assert (= (and b!270554 res!134544) b!270558))

(assert (= (and b!270558 res!134548) b!270565))

(assert (= (and b!270565 res!134546) b!270562))

(declare-fun m!286133 () Bool)

(assert (=> b!270565 m!286133))

(declare-fun m!286135 () Bool)

(assert (=> b!270559 m!286135))

(declare-fun m!286137 () Bool)

(assert (=> b!270562 m!286137))

(declare-fun m!286139 () Bool)

(assert (=> b!270560 m!286139))

(declare-fun m!286141 () Bool)

(assert (=> b!270566 m!286141))

(declare-fun m!286143 () Bool)

(assert (=> b!270561 m!286143))

(assert (=> b!270561 m!286143))

(declare-fun m!286145 () Bool)

(assert (=> b!270561 m!286145))

(declare-fun m!286147 () Bool)

(assert (=> b!270558 m!286147))

(declare-fun m!286149 () Bool)

(assert (=> b!270556 m!286149))

(declare-fun m!286151 () Bool)

(assert (=> b!270554 m!286151))

(declare-fun m!286153 () Bool)

(assert (=> b!270555 m!286153))

(declare-fun m!286155 () Bool)

(assert (=> start!26186 m!286155))

(declare-fun m!286157 () Bool)

(assert (=> start!26186 m!286157))

(check-sat (not b!270554) (not b!270565) (not b!270556) (not start!26186) (not b!270555) (not b!270561) (not b!270558) (not b!270559) (not b!270560) (not b!270562) (not b!270566))
(check-sat)
