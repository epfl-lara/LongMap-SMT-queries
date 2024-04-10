; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26012 () Bool)

(assert start!26012)

(declare-fun b!268373 () Bool)

(declare-fun e!173352 () Bool)

(declare-datatypes ((array!13109 0))(
  ( (array!13110 (arr!6204 (Array (_ BitVec 32) (_ BitVec 64))) (size!6556 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13109)

(assert (=> b!268373 (= e!173352 (bvsgt #b00000000000000000000000000000000 (size!6556 a!3325)))))

(declare-fun b!268374 () Bool)

(declare-fun res!132654 () Bool)

(declare-fun e!173354 () Bool)

(assert (=> b!268374 (=> (not res!132654) (not e!173354))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268374 (= res!132654 (and (= (size!6556 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6556 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6556 a!3325))))))

(declare-fun res!132656 () Bool)

(assert (=> start!26012 (=> (not res!132656) (not e!173354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26012 (= res!132656 (validMask!0 mask!3868))))

(assert (=> start!26012 e!173354))

(declare-fun array_inv!4167 (array!13109) Bool)

(assert (=> start!26012 (array_inv!4167 a!3325)))

(assert (=> start!26012 true))

(declare-fun b!268375 () Bool)

(declare-fun res!132653 () Bool)

(assert (=> b!268375 (=> (not res!132653) (not e!173352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13109 (_ BitVec 32)) Bool)

(assert (=> b!268375 (= res!132653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268376 () Bool)

(declare-fun res!132651 () Bool)

(assert (=> b!268376 (=> (not res!132651) (not e!173354))))

(declare-datatypes ((List!4012 0))(
  ( (Nil!4009) (Cons!4008 (h!4675 (_ BitVec 64)) (t!9094 List!4012)) )
))
(declare-fun arrayNoDuplicates!0 (array!13109 (_ BitVec 32) List!4012) Bool)

(assert (=> b!268376 (= res!132651 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4009))))

(declare-fun b!268377 () Bool)

(assert (=> b!268377 (= e!173354 e!173352)))

(declare-fun res!132655 () Bool)

(assert (=> b!268377 (=> (not res!132655) (not e!173352))))

(declare-datatypes ((SeekEntryResult!1362 0))(
  ( (MissingZero!1362 (index!7618 (_ BitVec 32))) (Found!1362 (index!7619 (_ BitVec 32))) (Intermediate!1362 (undefined!2174 Bool) (index!7620 (_ BitVec 32)) (x!25983 (_ BitVec 32))) (Undefined!1362) (MissingVacant!1362 (index!7621 (_ BitVec 32))) )
))
(declare-fun lt!134860 () SeekEntryResult!1362)

(assert (=> b!268377 (= res!132655 (or (= lt!134860 (MissingZero!1362 i!1267)) (= lt!134860 (MissingVacant!1362 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13109 (_ BitVec 32)) SeekEntryResult!1362)

(assert (=> b!268377 (= lt!134860 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268378 () Bool)

(declare-fun res!132652 () Bool)

(assert (=> b!268378 (=> (not res!132652) (not e!173354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268378 (= res!132652 (validKeyInArray!0 k0!2581))))

(declare-fun b!268379 () Bool)

(declare-fun res!132657 () Bool)

(assert (=> b!268379 (=> (not res!132657) (not e!173354))))

(declare-fun arrayContainsKey!0 (array!13109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268379 (= res!132657 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26012 res!132656) b!268374))

(assert (= (and b!268374 res!132654) b!268378))

(assert (= (and b!268378 res!132652) b!268376))

(assert (= (and b!268376 res!132651) b!268379))

(assert (= (and b!268379 res!132657) b!268377))

(assert (= (and b!268377 res!132655) b!268375))

(assert (= (and b!268375 res!132653) b!268373))

(declare-fun m!284519 () Bool)

(assert (=> b!268375 m!284519))

(declare-fun m!284521 () Bool)

(assert (=> b!268377 m!284521))

(declare-fun m!284523 () Bool)

(assert (=> start!26012 m!284523))

(declare-fun m!284525 () Bool)

(assert (=> start!26012 m!284525))

(declare-fun m!284527 () Bool)

(assert (=> b!268376 m!284527))

(declare-fun m!284529 () Bool)

(assert (=> b!268378 m!284529))

(declare-fun m!284531 () Bool)

(assert (=> b!268379 m!284531))

(check-sat (not b!268375) (not b!268376) (not b!268379) (not start!26012) (not b!268377) (not b!268378))
(check-sat)
