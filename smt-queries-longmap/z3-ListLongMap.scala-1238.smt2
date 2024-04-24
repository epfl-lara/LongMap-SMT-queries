; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25986 () Bool)

(assert start!25986)

(declare-fun b!268188 () Bool)

(declare-fun res!132441 () Bool)

(declare-fun e!173266 () Bool)

(assert (=> b!268188 (=> (not res!132441) (not e!173266))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268188 (= res!132441 (validKeyInArray!0 k0!2581))))

(declare-fun res!132440 () Bool)

(assert (=> start!25986 (=> (not res!132440) (not e!173266))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25986 (= res!132440 (validMask!0 mask!3868))))

(assert (=> start!25986 e!173266))

(declare-datatypes ((array!13082 0))(
  ( (array!13083 (arr!6190 (Array (_ BitVec 32) (_ BitVec 64))) (size!6542 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13082)

(declare-fun array_inv!4140 (array!13082) Bool)

(assert (=> start!25986 (array_inv!4140 a!3325)))

(assert (=> start!25986 true))

(declare-fun b!268189 () Bool)

(declare-fun res!132442 () Bool)

(assert (=> b!268189 (=> (not res!132442) (not e!173266))))

(declare-fun arrayContainsKey!0 (array!13082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268189 (= res!132442 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268190 () Bool)

(declare-fun res!132443 () Bool)

(assert (=> b!268190 (=> (not res!132443) (not e!173266))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268190 (= res!132443 (and (= (size!6542 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6542 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6542 a!3325))))))

(declare-fun b!268191 () Bool)

(declare-fun res!132444 () Bool)

(assert (=> b!268191 (=> (not res!132444) (not e!173266))))

(declare-datatypes ((List!3911 0))(
  ( (Nil!3908) (Cons!3907 (h!4574 (_ BitVec 64)) (t!8985 List!3911)) )
))
(declare-fun arrayNoDuplicates!0 (array!13082 (_ BitVec 32) List!3911) Bool)

(assert (=> b!268191 (= res!132444 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3908))))

(declare-fun b!268192 () Bool)

(declare-datatypes ((SeekEntryResult!1313 0))(
  ( (MissingZero!1313 (index!7422 (_ BitVec 32))) (Found!1313 (index!7423 (_ BitVec 32))) (Intermediate!1313 (undefined!2125 Bool) (index!7424 (_ BitVec 32)) (x!25902 (_ BitVec 32))) (Undefined!1313) (MissingVacant!1313 (index!7425 (_ BitVec 32))) )
))
(declare-fun lt!134853 () SeekEntryResult!1313)

(assert (=> b!268192 (= e!173266 (and (or (= lt!134853 (MissingZero!1313 i!1267)) (= lt!134853 (MissingVacant!1313 i!1267))) (bvsgt #b00000000000000000000000000000000 (size!6542 a!3325))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13082 (_ BitVec 32)) SeekEntryResult!1313)

(assert (=> b!268192 (= lt!134853 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!25986 res!132440) b!268190))

(assert (= (and b!268190 res!132443) b!268188))

(assert (= (and b!268188 res!132441) b!268191))

(assert (= (and b!268191 res!132444) b!268189))

(assert (= (and b!268189 res!132442) b!268192))

(declare-fun m!284549 () Bool)

(assert (=> b!268188 m!284549))

(declare-fun m!284551 () Bool)

(assert (=> b!268192 m!284551))

(declare-fun m!284553 () Bool)

(assert (=> b!268189 m!284553))

(declare-fun m!284555 () Bool)

(assert (=> start!25986 m!284555))

(declare-fun m!284557 () Bool)

(assert (=> start!25986 m!284557))

(declare-fun m!284559 () Bool)

(assert (=> b!268191 m!284559))

(check-sat (not start!25986) (not b!268192) (not b!268189) (not b!268188) (not b!268191))
(check-sat)
