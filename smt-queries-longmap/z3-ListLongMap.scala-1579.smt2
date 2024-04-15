; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30006 () Bool)

(assert start!30006)

(declare-fun b!300973 () Bool)

(declare-fun res!158869 () Bool)

(declare-fun e!189976 () Bool)

(assert (=> b!300973 (=> (not res!158869) (not e!189976))))

(declare-datatypes ((array!15233 0))(
  ( (array!15234 (arr!7209 (Array (_ BitVec 32) (_ BitVec 64))) (size!7562 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15233)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300973 (= res!158869 (and (= (size!7562 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7562 a!3293))))))

(declare-fun b!300974 () Bool)

(declare-fun res!158870 () Bool)

(assert (=> b!300974 (=> (not res!158870) (not e!189976))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300974 (= res!158870 (validKeyInArray!0 k0!2441))))

(declare-fun res!158874 () Bool)

(assert (=> start!30006 (=> (not res!158874) (not e!189976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30006 (= res!158874 (validMask!0 mask!3709))))

(assert (=> start!30006 e!189976))

(assert (=> start!30006 true))

(declare-fun array_inv!5181 (array!15233) Bool)

(assert (=> start!30006 (array_inv!5181 a!3293)))

(declare-fun b!300975 () Bool)

(declare-fun res!158872 () Bool)

(assert (=> b!300975 (=> (not res!158872) (not e!189976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15233 (_ BitVec 32)) Bool)

(assert (=> b!300975 (= res!158872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!300976 () Bool)

(declare-fun res!158873 () Bool)

(assert (=> b!300976 (=> (not res!158873) (not e!189976))))

(declare-datatypes ((SeekEntryResult!2348 0))(
  ( (MissingZero!2348 (index!11568 (_ BitVec 32))) (Found!2348 (index!11569 (_ BitVec 32))) (Intermediate!2348 (undefined!3160 Bool) (index!11570 (_ BitVec 32)) (x!29863 (_ BitVec 32))) (Undefined!2348) (MissingVacant!2348 (index!11571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15233 (_ BitVec 32)) SeekEntryResult!2348)

(assert (=> b!300976 (= res!158873 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2348 i!1240)))))

(declare-fun b!300977 () Bool)

(declare-fun res!158871 () Bool)

(assert (=> b!300977 (=> (not res!158871) (not e!189976))))

(declare-fun arrayContainsKey!0 (array!15233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300977 (= res!158871 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!300978 () Bool)

(assert (=> b!300978 (= e!189976 (bvslt mask!3709 #b00000000000000000000000000000000))))

(assert (= (and start!30006 res!158874) b!300973))

(assert (= (and b!300973 res!158869) b!300974))

(assert (= (and b!300974 res!158870) b!300977))

(assert (= (and b!300977 res!158871) b!300976))

(assert (= (and b!300976 res!158873) b!300975))

(assert (= (and b!300975 res!158872) b!300978))

(declare-fun m!312349 () Bool)

(assert (=> b!300976 m!312349))

(declare-fun m!312351 () Bool)

(assert (=> b!300975 m!312351))

(declare-fun m!312353 () Bool)

(assert (=> start!30006 m!312353))

(declare-fun m!312355 () Bool)

(assert (=> start!30006 m!312355))

(declare-fun m!312357 () Bool)

(assert (=> b!300977 m!312357))

(declare-fun m!312359 () Bool)

(assert (=> b!300974 m!312359))

(check-sat (not b!300976) (not b!300975) (not b!300974) (not b!300977) (not start!30006))
(check-sat)
