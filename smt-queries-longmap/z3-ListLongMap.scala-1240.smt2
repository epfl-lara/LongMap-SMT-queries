; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25998 () Bool)

(assert start!25998)

(declare-fun b!268289 () Bool)

(declare-fun res!132544 () Bool)

(declare-fun e!173314 () Bool)

(assert (=> b!268289 (=> (not res!132544) (not e!173314))))

(declare-datatypes ((array!13094 0))(
  ( (array!13095 (arr!6196 (Array (_ BitVec 32) (_ BitVec 64))) (size!6548 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13094)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268289 (= res!132544 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268290 () Bool)

(declare-fun e!173315 () Bool)

(assert (=> b!268290 (= e!173315 false)))

(declare-fun lt!134883 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13094 (_ BitVec 32)) Bool)

(assert (=> b!268290 (= lt!134883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!132542 () Bool)

(assert (=> start!25998 (=> (not res!132542) (not e!173314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25998 (= res!132542 (validMask!0 mask!3868))))

(assert (=> start!25998 e!173314))

(declare-fun array_inv!4146 (array!13094) Bool)

(assert (=> start!25998 (array_inv!4146 a!3325)))

(assert (=> start!25998 true))

(declare-fun b!268291 () Bool)

(declare-fun res!132543 () Bool)

(assert (=> b!268291 (=> (not res!132543) (not e!173314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268291 (= res!132543 (validKeyInArray!0 k0!2581))))

(declare-fun b!268292 () Bool)

(declare-fun res!132545 () Bool)

(assert (=> b!268292 (=> (not res!132545) (not e!173314))))

(declare-datatypes ((List!3917 0))(
  ( (Nil!3914) (Cons!3913 (h!4580 (_ BitVec 64)) (t!8991 List!3917)) )
))
(declare-fun arrayNoDuplicates!0 (array!13094 (_ BitVec 32) List!3917) Bool)

(assert (=> b!268292 (= res!132545 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3914))))

(declare-fun b!268293 () Bool)

(declare-fun res!132541 () Bool)

(assert (=> b!268293 (=> (not res!132541) (not e!173314))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268293 (= res!132541 (and (= (size!6548 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6548 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6548 a!3325))))))

(declare-fun b!268294 () Bool)

(assert (=> b!268294 (= e!173314 e!173315)))

(declare-fun res!132546 () Bool)

(assert (=> b!268294 (=> (not res!132546) (not e!173315))))

(declare-datatypes ((SeekEntryResult!1319 0))(
  ( (MissingZero!1319 (index!7446 (_ BitVec 32))) (Found!1319 (index!7447 (_ BitVec 32))) (Intermediate!1319 (undefined!2131 Bool) (index!7448 (_ BitVec 32)) (x!25924 (_ BitVec 32))) (Undefined!1319) (MissingVacant!1319 (index!7449 (_ BitVec 32))) )
))
(declare-fun lt!134882 () SeekEntryResult!1319)

(assert (=> b!268294 (= res!132546 (or (= lt!134882 (MissingZero!1319 i!1267)) (= lt!134882 (MissingVacant!1319 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13094 (_ BitVec 32)) SeekEntryResult!1319)

(assert (=> b!268294 (= lt!134882 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!25998 res!132542) b!268293))

(assert (= (and b!268293 res!132541) b!268291))

(assert (= (and b!268291 res!132543) b!268292))

(assert (= (and b!268292 res!132545) b!268289))

(assert (= (and b!268289 res!132544) b!268294))

(assert (= (and b!268294 res!132546) b!268290))

(declare-fun m!284627 () Bool)

(assert (=> b!268291 m!284627))

(declare-fun m!284629 () Bool)

(assert (=> start!25998 m!284629))

(declare-fun m!284631 () Bool)

(assert (=> start!25998 m!284631))

(declare-fun m!284633 () Bool)

(assert (=> b!268289 m!284633))

(declare-fun m!284635 () Bool)

(assert (=> b!268290 m!284635))

(declare-fun m!284637 () Bool)

(assert (=> b!268294 m!284637))

(declare-fun m!284639 () Bool)

(assert (=> b!268292 m!284639))

(check-sat (not b!268294) (not b!268289) (not b!268291) (not start!25998) (not b!268292) (not b!268290))
(check-sat)
