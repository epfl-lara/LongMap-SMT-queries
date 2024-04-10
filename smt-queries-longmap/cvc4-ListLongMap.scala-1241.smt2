; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26008 () Bool)

(assert start!26008)

(declare-fun b!268332 () Bool)

(declare-fun res!132614 () Bool)

(declare-fun e!173335 () Bool)

(assert (=> b!268332 (=> (not res!132614) (not e!173335))))

(declare-datatypes ((array!13105 0))(
  ( (array!13106 (arr!6202 (Array (_ BitVec 32) (_ BitVec 64))) (size!6554 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13105)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268332 (= res!132614 (and (= (size!6554 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6554 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6554 a!3325))))))

(declare-fun b!268333 () Bool)

(declare-fun e!173334 () Bool)

(assert (=> b!268333 (= e!173334 false)))

(declare-fun lt!134854 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13105 (_ BitVec 32)) Bool)

(assert (=> b!268333 (= lt!134854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!132615 () Bool)

(assert (=> start!26008 (=> (not res!132615) (not e!173335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26008 (= res!132615 (validMask!0 mask!3868))))

(assert (=> start!26008 e!173335))

(declare-fun array_inv!4165 (array!13105) Bool)

(assert (=> start!26008 (array_inv!4165 a!3325)))

(assert (=> start!26008 true))

(declare-fun b!268334 () Bool)

(declare-fun res!132613 () Bool)

(assert (=> b!268334 (=> (not res!132613) (not e!173335))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268334 (= res!132613 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268335 () Bool)

(declare-fun res!132610 () Bool)

(assert (=> b!268335 (=> (not res!132610) (not e!173335))))

(declare-datatypes ((List!4010 0))(
  ( (Nil!4007) (Cons!4006 (h!4673 (_ BitVec 64)) (t!9092 List!4010)) )
))
(declare-fun arrayNoDuplicates!0 (array!13105 (_ BitVec 32) List!4010) Bool)

(assert (=> b!268335 (= res!132610 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4007))))

(declare-fun b!268336 () Bool)

(declare-fun res!132612 () Bool)

(assert (=> b!268336 (=> (not res!132612) (not e!173335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268336 (= res!132612 (validKeyInArray!0 k!2581))))

(declare-fun b!268337 () Bool)

(assert (=> b!268337 (= e!173335 e!173334)))

(declare-fun res!132611 () Bool)

(assert (=> b!268337 (=> (not res!132611) (not e!173334))))

(declare-datatypes ((SeekEntryResult!1360 0))(
  ( (MissingZero!1360 (index!7610 (_ BitVec 32))) (Found!1360 (index!7611 (_ BitVec 32))) (Intermediate!1360 (undefined!2172 Bool) (index!7612 (_ BitVec 32)) (x!25973 (_ BitVec 32))) (Undefined!1360) (MissingVacant!1360 (index!7613 (_ BitVec 32))) )
))
(declare-fun lt!134853 () SeekEntryResult!1360)

(assert (=> b!268337 (= res!132611 (or (= lt!134853 (MissingZero!1360 i!1267)) (= lt!134853 (MissingVacant!1360 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13105 (_ BitVec 32)) SeekEntryResult!1360)

(assert (=> b!268337 (= lt!134853 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26008 res!132615) b!268332))

(assert (= (and b!268332 res!132614) b!268336))

(assert (= (and b!268336 res!132612) b!268335))

(assert (= (and b!268335 res!132610) b!268334))

(assert (= (and b!268334 res!132613) b!268337))

(assert (= (and b!268337 res!132611) b!268333))

(declare-fun m!284491 () Bool)

(assert (=> start!26008 m!284491))

(declare-fun m!284493 () Bool)

(assert (=> start!26008 m!284493))

(declare-fun m!284495 () Bool)

(assert (=> b!268337 m!284495))

(declare-fun m!284497 () Bool)

(assert (=> b!268336 m!284497))

(declare-fun m!284499 () Bool)

(assert (=> b!268334 m!284499))

(declare-fun m!284501 () Bool)

(assert (=> b!268335 m!284501))

(declare-fun m!284503 () Bool)

(assert (=> b!268333 m!284503))

(push 1)

(assert (not b!268336))

(assert (not b!268337))

(assert (not b!268333))

(assert (not b!268335))

