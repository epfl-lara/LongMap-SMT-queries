; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26018 () Bool)

(assert start!26018)

(declare-fun b!268266 () Bool)

(declare-fun e!173271 () Bool)

(assert (=> b!268266 (= e!173271 false)))

(declare-fun lt!134687 () Bool)

(declare-datatypes ((array!13104 0))(
  ( (array!13105 (arr!6201 (Array (_ BitVec 32) (_ BitVec 64))) (size!6554 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13104)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13104 (_ BitVec 32)) Bool)

(assert (=> b!268266 (= lt!134687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268267 () Bool)

(declare-fun res!132600 () Bool)

(declare-fun e!173269 () Bool)

(assert (=> b!268267 (=> (not res!132600) (not e!173269))))

(declare-datatypes ((List!3982 0))(
  ( (Nil!3979) (Cons!3978 (h!4645 (_ BitVec 64)) (t!9055 List!3982)) )
))
(declare-fun arrayNoDuplicates!0 (array!13104 (_ BitVec 32) List!3982) Bool)

(assert (=> b!268267 (= res!132600 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3979))))

(declare-fun b!268268 () Bool)

(declare-fun res!132599 () Bool)

(assert (=> b!268268 (=> (not res!132599) (not e!173269))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268268 (= res!132599 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268269 () Bool)

(declare-fun res!132597 () Bool)

(assert (=> b!268269 (=> (not res!132597) (not e!173269))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268269 (= res!132597 (and (= (size!6554 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6554 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6554 a!3325))))))

(declare-fun b!268270 () Bool)

(declare-fun res!132596 () Bool)

(assert (=> b!268270 (=> (not res!132596) (not e!173269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268270 (= res!132596 (validKeyInArray!0 k0!2581))))

(declare-fun res!132598 () Bool)

(assert (=> start!26018 (=> (not res!132598) (not e!173269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26018 (= res!132598 (validMask!0 mask!3868))))

(assert (=> start!26018 e!173269))

(declare-fun array_inv!4173 (array!13104) Bool)

(assert (=> start!26018 (array_inv!4173 a!3325)))

(assert (=> start!26018 true))

(declare-fun b!268271 () Bool)

(assert (=> b!268271 (= e!173269 e!173271)))

(declare-fun res!132601 () Bool)

(assert (=> b!268271 (=> (not res!132601) (not e!173271))))

(declare-datatypes ((SeekEntryResult!1358 0))(
  ( (MissingZero!1358 (index!7602 (_ BitVec 32))) (Found!1358 (index!7603 (_ BitVec 32))) (Intermediate!1358 (undefined!2170 Bool) (index!7604 (_ BitVec 32)) (x!25986 (_ BitVec 32))) (Undefined!1358) (MissingVacant!1358 (index!7605 (_ BitVec 32))) )
))
(declare-fun lt!134688 () SeekEntryResult!1358)

(assert (=> b!268271 (= res!132601 (or (= lt!134688 (MissingZero!1358 i!1267)) (= lt!134688 (MissingVacant!1358 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13104 (_ BitVec 32)) SeekEntryResult!1358)

(assert (=> b!268271 (= lt!134688 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26018 res!132598) b!268269))

(assert (= (and b!268269 res!132597) b!268270))

(assert (= (and b!268270 res!132596) b!268267))

(assert (= (and b!268267 res!132600) b!268268))

(assert (= (and b!268268 res!132599) b!268271))

(assert (= (and b!268271 res!132601) b!268266))

(declare-fun m!283955 () Bool)

(assert (=> b!268268 m!283955))

(declare-fun m!283957 () Bool)

(assert (=> b!268267 m!283957))

(declare-fun m!283959 () Bool)

(assert (=> b!268270 m!283959))

(declare-fun m!283961 () Bool)

(assert (=> b!268271 m!283961))

(declare-fun m!283963 () Bool)

(assert (=> start!26018 m!283963))

(declare-fun m!283965 () Bool)

(assert (=> start!26018 m!283965))

(declare-fun m!283967 () Bool)

(assert (=> b!268266 m!283967))

(check-sat (not b!268271) (not b!268267) (not b!268266) (not b!268270) (not start!26018) (not b!268268))
(check-sat)
