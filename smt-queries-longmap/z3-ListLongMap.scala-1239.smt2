; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25992 () Bool)

(assert start!25992)

(declare-fun res!132489 () Bool)

(declare-fun e!173287 () Bool)

(assert (=> start!25992 (=> (not res!132489) (not e!173287))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25992 (= res!132489 (validMask!0 mask!3868))))

(assert (=> start!25992 e!173287))

(declare-datatypes ((array!13088 0))(
  ( (array!13089 (arr!6193 (Array (_ BitVec 32) (_ BitVec 64))) (size!6545 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13088)

(declare-fun array_inv!4143 (array!13088) Bool)

(assert (=> start!25992 (array_inv!4143 a!3325)))

(assert (=> start!25992 true))

(declare-fun b!268235 () Bool)

(declare-fun res!132487 () Bool)

(assert (=> b!268235 (=> (not res!132487) (not e!173287))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268235 (= res!132487 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268236 () Bool)

(declare-fun res!132492 () Bool)

(assert (=> b!268236 (=> (not res!132492) (not e!173287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268236 (= res!132492 (validKeyInArray!0 k0!2581))))

(declare-fun b!268237 () Bool)

(declare-fun res!132491 () Bool)

(assert (=> b!268237 (=> (not res!132491) (not e!173287))))

(declare-datatypes ((List!3914 0))(
  ( (Nil!3911) (Cons!3910 (h!4577 (_ BitVec 64)) (t!8988 List!3914)) )
))
(declare-fun arrayNoDuplicates!0 (array!13088 (_ BitVec 32) List!3914) Bool)

(assert (=> b!268237 (= res!132491 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3911))))

(declare-fun b!268238 () Bool)

(declare-fun e!173286 () Bool)

(assert (=> b!268238 (= e!173286 false)))

(declare-fun lt!134864 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13088 (_ BitVec 32)) Bool)

(assert (=> b!268238 (= lt!134864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268239 () Bool)

(assert (=> b!268239 (= e!173287 e!173286)))

(declare-fun res!132488 () Bool)

(assert (=> b!268239 (=> (not res!132488) (not e!173286))))

(declare-datatypes ((SeekEntryResult!1316 0))(
  ( (MissingZero!1316 (index!7434 (_ BitVec 32))) (Found!1316 (index!7435 (_ BitVec 32))) (Intermediate!1316 (undefined!2128 Bool) (index!7436 (_ BitVec 32)) (x!25913 (_ BitVec 32))) (Undefined!1316) (MissingVacant!1316 (index!7437 (_ BitVec 32))) )
))
(declare-fun lt!134865 () SeekEntryResult!1316)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268239 (= res!132488 (or (= lt!134865 (MissingZero!1316 i!1267)) (= lt!134865 (MissingVacant!1316 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13088 (_ BitVec 32)) SeekEntryResult!1316)

(assert (=> b!268239 (= lt!134865 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268240 () Bool)

(declare-fun res!132490 () Bool)

(assert (=> b!268240 (=> (not res!132490) (not e!173287))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268240 (= res!132490 (and (= (size!6545 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6545 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6545 a!3325))))))

(assert (= (and start!25992 res!132489) b!268240))

(assert (= (and b!268240 res!132490) b!268236))

(assert (= (and b!268236 res!132492) b!268237))

(assert (= (and b!268237 res!132491) b!268235))

(assert (= (and b!268235 res!132487) b!268239))

(assert (= (and b!268239 res!132488) b!268238))

(declare-fun m!284585 () Bool)

(assert (=> b!268235 m!284585))

(declare-fun m!284587 () Bool)

(assert (=> start!25992 m!284587))

(declare-fun m!284589 () Bool)

(assert (=> start!25992 m!284589))

(declare-fun m!284591 () Bool)

(assert (=> b!268236 m!284591))

(declare-fun m!284593 () Bool)

(assert (=> b!268239 m!284593))

(declare-fun m!284595 () Bool)

(assert (=> b!268237 m!284595))

(declare-fun m!284597 () Bool)

(assert (=> b!268238 m!284597))

(check-sat (not b!268235) (not b!268239) (not b!268237) (not start!25992) (not b!268238) (not b!268236))
(check-sat)
