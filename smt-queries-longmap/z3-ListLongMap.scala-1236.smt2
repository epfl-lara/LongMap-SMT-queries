; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25976 () Bool)

(assert start!25976)

(declare-fun b!268066 () Bool)

(declare-fun res!132348 () Bool)

(declare-fun e!173213 () Bool)

(assert (=> b!268066 (=> (not res!132348) (not e!173213))))

(declare-datatypes ((array!13073 0))(
  ( (array!13074 (arr!6186 (Array (_ BitVec 32) (_ BitVec 64))) (size!6538 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13073)

(declare-datatypes ((List!3994 0))(
  ( (Nil!3991) (Cons!3990 (h!4657 (_ BitVec 64)) (t!9076 List!3994)) )
))
(declare-fun arrayNoDuplicates!0 (array!13073 (_ BitVec 32) List!3994) Bool)

(assert (=> b!268066 (= res!132348 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3991))))

(declare-fun b!268067 () Bool)

(declare-fun res!132344 () Bool)

(assert (=> b!268067 (=> (not res!132344) (not e!173213))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268067 (= res!132344 (validKeyInArray!0 k0!2581))))

(declare-fun b!268068 () Bool)

(declare-fun res!132345 () Bool)

(assert (=> b!268068 (=> (not res!132345) (not e!173213))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268068 (= res!132345 (and (= (size!6538 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6538 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6538 a!3325))))))

(declare-fun res!132347 () Bool)

(assert (=> start!25976 (=> (not res!132347) (not e!173213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25976 (= res!132347 (validMask!0 mask!3868))))

(assert (=> start!25976 e!173213))

(declare-fun array_inv!4149 (array!13073) Bool)

(assert (=> start!25976 (array_inv!4149 a!3325)))

(assert (=> start!25976 true))

(declare-fun b!268069 () Bool)

(assert (=> b!268069 (= e!173213 false)))

(declare-datatypes ((SeekEntryResult!1344 0))(
  ( (MissingZero!1344 (index!7546 (_ BitVec 32))) (Found!1344 (index!7547 (_ BitVec 32))) (Intermediate!1344 (undefined!2156 Bool) (index!7548 (_ BitVec 32)) (x!25917 (_ BitVec 32))) (Undefined!1344) (MissingVacant!1344 (index!7549 (_ BitVec 32))) )
))
(declare-fun lt!134779 () SeekEntryResult!1344)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13073 (_ BitVec 32)) SeekEntryResult!1344)

(assert (=> b!268069 (= lt!134779 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268070 () Bool)

(declare-fun res!132346 () Bool)

(assert (=> b!268070 (=> (not res!132346) (not e!173213))))

(declare-fun arrayContainsKey!0 (array!13073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268070 (= res!132346 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!25976 res!132347) b!268068))

(assert (= (and b!268068 res!132345) b!268067))

(assert (= (and b!268067 res!132344) b!268066))

(assert (= (and b!268066 res!132348) b!268070))

(assert (= (and b!268070 res!132346) b!268069))

(declare-fun m!284283 () Bool)

(assert (=> start!25976 m!284283))

(declare-fun m!284285 () Bool)

(assert (=> start!25976 m!284285))

(declare-fun m!284287 () Bool)

(assert (=> b!268066 m!284287))

(declare-fun m!284289 () Bool)

(assert (=> b!268067 m!284289))

(declare-fun m!284291 () Bool)

(assert (=> b!268069 m!284291))

(declare-fun m!284293 () Bool)

(assert (=> b!268070 m!284293))

(check-sat (not b!268070) (not b!268066) (not b!268067) (not b!268069) (not start!25976))
(check-sat)
