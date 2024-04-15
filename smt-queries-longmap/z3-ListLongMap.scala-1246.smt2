; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26036 () Bool)

(assert start!26036)

(declare-fun b!268428 () Bool)

(declare-fun e!173350 () Bool)

(assert (=> b!268428 (= e!173350 false)))

(declare-fun lt!134741 () Bool)

(declare-datatypes ((array!13122 0))(
  ( (array!13123 (arr!6210 (Array (_ BitVec 32) (_ BitVec 64))) (size!6563 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13122)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13122 (_ BitVec 32)) Bool)

(assert (=> b!268428 (= lt!134741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268429 () Bool)

(declare-fun res!132760 () Bool)

(declare-fun e!173352 () Bool)

(assert (=> b!268429 (=> (not res!132760) (not e!173352))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268429 (= res!132760 (and (= (size!6563 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6563 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6563 a!3325))))))

(declare-fun res!132763 () Bool)

(assert (=> start!26036 (=> (not res!132763) (not e!173352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26036 (= res!132763 (validMask!0 mask!3868))))

(assert (=> start!26036 e!173352))

(declare-fun array_inv!4182 (array!13122) Bool)

(assert (=> start!26036 (array_inv!4182 a!3325)))

(assert (=> start!26036 true))

(declare-fun b!268430 () Bool)

(declare-fun res!132758 () Bool)

(assert (=> b!268430 (=> (not res!132758) (not e!173352))))

(declare-datatypes ((List!3991 0))(
  ( (Nil!3988) (Cons!3987 (h!4654 (_ BitVec 64)) (t!9064 List!3991)) )
))
(declare-fun arrayNoDuplicates!0 (array!13122 (_ BitVec 32) List!3991) Bool)

(assert (=> b!268430 (= res!132758 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3988))))

(declare-fun b!268431 () Bool)

(declare-fun res!132761 () Bool)

(assert (=> b!268431 (=> (not res!132761) (not e!173352))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268431 (= res!132761 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268432 () Bool)

(declare-fun res!132759 () Bool)

(assert (=> b!268432 (=> (not res!132759) (not e!173352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268432 (= res!132759 (validKeyInArray!0 k0!2581))))

(declare-fun b!268433 () Bool)

(assert (=> b!268433 (= e!173352 e!173350)))

(declare-fun res!132762 () Bool)

(assert (=> b!268433 (=> (not res!132762) (not e!173350))))

(declare-datatypes ((SeekEntryResult!1367 0))(
  ( (MissingZero!1367 (index!7638 (_ BitVec 32))) (Found!1367 (index!7639 (_ BitVec 32))) (Intermediate!1367 (undefined!2179 Bool) (index!7640 (_ BitVec 32)) (x!26019 (_ BitVec 32))) (Undefined!1367) (MissingVacant!1367 (index!7641 (_ BitVec 32))) )
))
(declare-fun lt!134742 () SeekEntryResult!1367)

(assert (=> b!268433 (= res!132762 (or (= lt!134742 (MissingZero!1367 i!1267)) (= lt!134742 (MissingVacant!1367 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13122 (_ BitVec 32)) SeekEntryResult!1367)

(assert (=> b!268433 (= lt!134742 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26036 res!132763) b!268429))

(assert (= (and b!268429 res!132760) b!268432))

(assert (= (and b!268432 res!132759) b!268430))

(assert (= (and b!268430 res!132758) b!268431))

(assert (= (and b!268431 res!132761) b!268433))

(assert (= (and b!268433 res!132762) b!268428))

(declare-fun m!284081 () Bool)

(assert (=> b!268432 m!284081))

(declare-fun m!284083 () Bool)

(assert (=> b!268433 m!284083))

(declare-fun m!284085 () Bool)

(assert (=> b!268430 m!284085))

(declare-fun m!284087 () Bool)

(assert (=> b!268428 m!284087))

(declare-fun m!284089 () Bool)

(assert (=> b!268431 m!284089))

(declare-fun m!284091 () Bool)

(assert (=> start!26036 m!284091))

(declare-fun m!284093 () Bool)

(assert (=> start!26036 m!284093))

(check-sat (not b!268431) (not b!268430) (not b!268433) (not start!26036) (not b!268432) (not b!268428))
(check-sat)
