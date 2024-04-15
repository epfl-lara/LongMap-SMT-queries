; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26000 () Bool)

(assert start!26000)

(declare-fun b!268095 () Bool)

(declare-fun e!173188 () Bool)

(assert (=> b!268095 (= e!173188 false)))

(declare-fun lt!134643 () Bool)

(declare-datatypes ((array!13086 0))(
  ( (array!13087 (arr!6192 (Array (_ BitVec 32) (_ BitVec 64))) (size!6545 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13086)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13086 (_ BitVec 32)) Bool)

(assert (=> b!268095 (= lt!134643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268096 () Bool)

(declare-fun res!132427 () Bool)

(declare-fun e!173190 () Bool)

(assert (=> b!268096 (=> (not res!132427) (not e!173190))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268096 (= res!132427 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268097 () Bool)

(declare-fun res!132425 () Bool)

(assert (=> b!268097 (=> (not res!132425) (not e!173190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268097 (= res!132425 (validKeyInArray!0 k0!2581))))

(declare-fun b!268098 () Bool)

(assert (=> b!268098 (= e!173190 e!173188)))

(declare-fun res!132429 () Bool)

(assert (=> b!268098 (=> (not res!132429) (not e!173188))))

(declare-datatypes ((SeekEntryResult!1349 0))(
  ( (MissingZero!1349 (index!7566 (_ BitVec 32))) (Found!1349 (index!7567 (_ BitVec 32))) (Intermediate!1349 (undefined!2161 Bool) (index!7568 (_ BitVec 32)) (x!25953 (_ BitVec 32))) (Undefined!1349) (MissingVacant!1349 (index!7569 (_ BitVec 32))) )
))
(declare-fun lt!134642 () SeekEntryResult!1349)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268098 (= res!132429 (or (= lt!134642 (MissingZero!1349 i!1267)) (= lt!134642 (MissingVacant!1349 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13086 (_ BitVec 32)) SeekEntryResult!1349)

(assert (=> b!268098 (= lt!134642 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!132430 () Bool)

(assert (=> start!26000 (=> (not res!132430) (not e!173190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26000 (= res!132430 (validMask!0 mask!3868))))

(assert (=> start!26000 e!173190))

(declare-fun array_inv!4164 (array!13086) Bool)

(assert (=> start!26000 (array_inv!4164 a!3325)))

(assert (=> start!26000 true))

(declare-fun b!268099 () Bool)

(declare-fun res!132428 () Bool)

(assert (=> b!268099 (=> (not res!132428) (not e!173190))))

(declare-datatypes ((List!3973 0))(
  ( (Nil!3970) (Cons!3969 (h!4636 (_ BitVec 64)) (t!9046 List!3973)) )
))
(declare-fun arrayNoDuplicates!0 (array!13086 (_ BitVec 32) List!3973) Bool)

(assert (=> b!268099 (= res!132428 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3970))))

(declare-fun b!268100 () Bool)

(declare-fun res!132426 () Bool)

(assert (=> b!268100 (=> (not res!132426) (not e!173190))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268100 (= res!132426 (and (= (size!6545 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6545 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6545 a!3325))))))

(assert (= (and start!26000 res!132430) b!268100))

(assert (= (and b!268100 res!132426) b!268097))

(assert (= (and b!268097 res!132425) b!268099))

(assert (= (and b!268099 res!132428) b!268096))

(assert (= (and b!268096 res!132427) b!268098))

(assert (= (and b!268098 res!132429) b!268095))

(declare-fun m!283829 () Bool)

(assert (=> start!26000 m!283829))

(declare-fun m!283831 () Bool)

(assert (=> start!26000 m!283831))

(declare-fun m!283833 () Bool)

(assert (=> b!268095 m!283833))

(declare-fun m!283835 () Bool)

(assert (=> b!268098 m!283835))

(declare-fun m!283837 () Bool)

(assert (=> b!268099 m!283837))

(declare-fun m!283839 () Bool)

(assert (=> b!268096 m!283839))

(declare-fun m!283841 () Bool)

(assert (=> b!268097 m!283841))

(check-sat (not b!268095) (not b!268098) (not b!268099) (not start!26000) (not b!268097) (not b!268096))
(check-sat)
