; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27806 () Bool)

(assert start!27806)

(declare-fun b!286260 () Bool)

(declare-fun res!148412 () Bool)

(declare-fun e!181396 () Bool)

(assert (=> b!286260 (=> (not res!148412) (not e!181396))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286260 (= res!148412 (validKeyInArray!0 k0!2524))))

(declare-fun b!286259 () Bool)

(declare-fun res!148411 () Bool)

(assert (=> b!286259 (=> (not res!148411) (not e!181396))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14327 0))(
  ( (array!14328 (arr!6798 (Array (_ BitVec 32) (_ BitVec 64))) (size!7150 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14327)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286259 (= res!148411 (and (= (size!7150 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7150 a!3312))))))

(declare-fun b!286262 () Bool)

(declare-datatypes ((SeekEntryResult!1947 0))(
  ( (MissingZero!1947 (index!9958 (_ BitVec 32))) (Found!1947 (index!9959 (_ BitVec 32))) (Intermediate!1947 (undefined!2759 Bool) (index!9960 (_ BitVec 32)) (x!28179 (_ BitVec 32))) (Undefined!1947) (MissingVacant!1947 (index!9961 (_ BitVec 32))) )
))
(declare-fun lt!141046 () SeekEntryResult!1947)

(assert (=> b!286262 (= e!181396 (and (or (= lt!141046 (MissingZero!1947 i!1256)) (= lt!141046 (MissingVacant!1947 i!1256))) (bvsgt #b00000000000000000000000000000000 (size!7150 a!3312))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14327 (_ BitVec 32)) SeekEntryResult!1947)

(assert (=> b!286262 (= lt!141046 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286261 () Bool)

(declare-fun res!148410 () Bool)

(assert (=> b!286261 (=> (not res!148410) (not e!181396))))

(declare-fun arrayContainsKey!0 (array!14327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286261 (= res!148410 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148413 () Bool)

(assert (=> start!27806 (=> (not res!148413) (not e!181396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27806 (= res!148413 (validMask!0 mask!3809))))

(assert (=> start!27806 e!181396))

(assert (=> start!27806 true))

(declare-fun array_inv!4761 (array!14327) Bool)

(assert (=> start!27806 (array_inv!4761 a!3312)))

(assert (= (and start!27806 res!148413) b!286259))

(assert (= (and b!286259 res!148411) b!286260))

(assert (= (and b!286260 res!148412) b!286261))

(assert (= (and b!286261 res!148410) b!286262))

(declare-fun m!300985 () Bool)

(assert (=> b!286260 m!300985))

(declare-fun m!300987 () Bool)

(assert (=> b!286262 m!300987))

(declare-fun m!300989 () Bool)

(assert (=> b!286261 m!300989))

(declare-fun m!300991 () Bool)

(assert (=> start!27806 m!300991))

(declare-fun m!300993 () Bool)

(assert (=> start!27806 m!300993))

(check-sat (not b!286261) (not start!27806) (not b!286260) (not b!286262))
(check-sat)
