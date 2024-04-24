; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27850 () Bool)

(assert start!27850)

(declare-fun b!286550 () Bool)

(declare-fun e!181562 () Bool)

(declare-fun e!181561 () Bool)

(assert (=> b!286550 (= e!181562 e!181561)))

(declare-fun res!148605 () Bool)

(assert (=> b!286550 (=> (not res!148605) (not e!181561))))

(declare-datatypes ((SeekEntryResult!1919 0))(
  ( (MissingZero!1919 (index!9846 (_ BitVec 32))) (Found!1919 (index!9847 (_ BitVec 32))) (Intermediate!1919 (undefined!2731 Bool) (index!9848 (_ BitVec 32)) (x!28175 (_ BitVec 32))) (Undefined!1919) (MissingVacant!1919 (index!9849 (_ BitVec 32))) )
))
(declare-fun lt!141186 () SeekEntryResult!1919)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286550 (= res!148605 (or (= lt!141186 (MissingZero!1919 i!1256)) (= lt!141186 (MissingVacant!1919 i!1256))))))

(declare-datatypes ((array!14343 0))(
  ( (array!14344 (arr!6805 (Array (_ BitVec 32) (_ BitVec 64))) (size!7157 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14343)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14343 (_ BitVec 32)) SeekEntryResult!1919)

(assert (=> b!286550 (= lt!141186 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286551 () Bool)

(declare-fun res!148607 () Bool)

(assert (=> b!286551 (=> (not res!148607) (not e!181562))))

(declare-fun arrayContainsKey!0 (array!14343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286551 (= res!148607 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286552 () Bool)

(declare-fun res!148608 () Bool)

(assert (=> b!286552 (=> (not res!148608) (not e!181562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286552 (= res!148608 (validKeyInArray!0 k0!2524))))

(declare-fun b!286553 () Bool)

(assert (=> b!286553 (= e!181561 false)))

(declare-fun lt!141185 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286553 (= lt!141185 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!148604 () Bool)

(assert (=> start!27850 (=> (not res!148604) (not e!181562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27850 (= res!148604 (validMask!0 mask!3809))))

(assert (=> start!27850 e!181562))

(assert (=> start!27850 true))

(declare-fun array_inv!4755 (array!14343) Bool)

(assert (=> start!27850 (array_inv!4755 a!3312)))

(declare-fun b!286554 () Bool)

(declare-fun res!148603 () Bool)

(assert (=> b!286554 (=> (not res!148603) (not e!181561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14343 (_ BitVec 32)) Bool)

(assert (=> b!286554 (= res!148603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286555 () Bool)

(declare-fun res!148606 () Bool)

(assert (=> b!286555 (=> (not res!148606) (not e!181562))))

(assert (=> b!286555 (= res!148606 (and (= (size!7157 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7157 a!3312))))))

(assert (= (and start!27850 res!148604) b!286555))

(assert (= (and b!286555 res!148606) b!286552))

(assert (= (and b!286552 res!148608) b!286551))

(assert (= (and b!286551 res!148607) b!286550))

(assert (= (and b!286550 res!148605) b!286554))

(assert (= (and b!286554 res!148603) b!286553))

(declare-fun m!301367 () Bool)

(assert (=> b!286554 m!301367))

(declare-fun m!301369 () Bool)

(assert (=> b!286550 m!301369))

(declare-fun m!301371 () Bool)

(assert (=> b!286552 m!301371))

(declare-fun m!301373 () Bool)

(assert (=> start!27850 m!301373))

(declare-fun m!301375 () Bool)

(assert (=> start!27850 m!301375))

(declare-fun m!301377 () Bool)

(assert (=> b!286551 m!301377))

(declare-fun m!301379 () Bool)

(assert (=> b!286553 m!301379))

(check-sat (not b!286552) (not b!286553) (not b!286554) (not b!286550) (not b!286551) (not start!27850))
(check-sat)
