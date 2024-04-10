; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25992 () Bool)

(assert start!25992)

(declare-fun b!268188 () Bool)

(declare-fun res!132467 () Bool)

(declare-fun e!173263 () Bool)

(assert (=> b!268188 (=> (not res!132467) (not e!173263))))

(declare-datatypes ((array!13089 0))(
  ( (array!13090 (arr!6194 (Array (_ BitVec 32) (_ BitVec 64))) (size!6546 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13089)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268188 (= res!132467 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268189 () Bool)

(declare-fun res!132469 () Bool)

(assert (=> b!268189 (=> (not res!132469) (not e!173263))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268189 (= res!132469 (and (= (size!6546 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6546 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6546 a!3325))))))

(declare-fun b!268191 () Bool)

(declare-fun e!173262 () Bool)

(assert (=> b!268191 (= e!173262 false)))

(declare-fun lt!134806 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13089 (_ BitVec 32)) Bool)

(assert (=> b!268191 (= lt!134806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268192 () Bool)

(assert (=> b!268192 (= e!173263 e!173262)))

(declare-fun res!132470 () Bool)

(assert (=> b!268192 (=> (not res!132470) (not e!173262))))

(declare-datatypes ((SeekEntryResult!1352 0))(
  ( (MissingZero!1352 (index!7578 (_ BitVec 32))) (Found!1352 (index!7579 (_ BitVec 32))) (Intermediate!1352 (undefined!2164 Bool) (index!7580 (_ BitVec 32)) (x!25949 (_ BitVec 32))) (Undefined!1352) (MissingVacant!1352 (index!7581 (_ BitVec 32))) )
))
(declare-fun lt!134805 () SeekEntryResult!1352)

(assert (=> b!268192 (= res!132470 (or (= lt!134805 (MissingZero!1352 i!1267)) (= lt!134805 (MissingVacant!1352 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13089 (_ BitVec 32)) SeekEntryResult!1352)

(assert (=> b!268192 (= lt!134805 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268193 () Bool)

(declare-fun res!132471 () Bool)

(assert (=> b!268193 (=> (not res!132471) (not e!173263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268193 (= res!132471 (validKeyInArray!0 k!2581))))

(declare-fun b!268190 () Bool)

(declare-fun res!132468 () Bool)

(assert (=> b!268190 (=> (not res!132468) (not e!173263))))

(declare-datatypes ((List!4002 0))(
  ( (Nil!3999) (Cons!3998 (h!4665 (_ BitVec 64)) (t!9084 List!4002)) )
))
(declare-fun arrayNoDuplicates!0 (array!13089 (_ BitVec 32) List!4002) Bool)

(assert (=> b!268190 (= res!132468 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3999))))

(declare-fun res!132466 () Bool)

(assert (=> start!25992 (=> (not res!132466) (not e!173263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25992 (= res!132466 (validMask!0 mask!3868))))

(assert (=> start!25992 e!173263))

(declare-fun array_inv!4157 (array!13089) Bool)

(assert (=> start!25992 (array_inv!4157 a!3325)))

(assert (=> start!25992 true))

(assert (= (and start!25992 res!132466) b!268189))

(assert (= (and b!268189 res!132469) b!268193))

(assert (= (and b!268193 res!132471) b!268190))

(assert (= (and b!268190 res!132468) b!268188))

(assert (= (and b!268188 res!132467) b!268192))

(assert (= (and b!268192 res!132470) b!268191))

(declare-fun m!284379 () Bool)

(assert (=> b!268188 m!284379))

(declare-fun m!284381 () Bool)

(assert (=> b!268190 m!284381))

(declare-fun m!284383 () Bool)

(assert (=> b!268191 m!284383))

(declare-fun m!284385 () Bool)

(assert (=> b!268193 m!284385))

(declare-fun m!284387 () Bool)

(assert (=> start!25992 m!284387))

(declare-fun m!284389 () Bool)

(assert (=> start!25992 m!284389))

(declare-fun m!284391 () Bool)

(assert (=> b!268192 m!284391))

(push 1)

(assert (not start!25992))

