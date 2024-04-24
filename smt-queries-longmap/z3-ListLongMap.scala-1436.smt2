; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27772 () Bool)

(assert start!27772)

(declare-fun b!286153 () Bool)

(declare-fun e!181342 () Bool)

(assert (=> b!286153 (= e!181342 false)))

(declare-datatypes ((SeekEntryResult!1898 0))(
  ( (MissingZero!1898 (index!9762 (_ BitVec 32))) (Found!1898 (index!9763 (_ BitVec 32))) (Intermediate!1898 (undefined!2710 Bool) (index!9764 (_ BitVec 32)) (x!28098 (_ BitVec 32))) (Undefined!1898) (MissingVacant!1898 (index!9765 (_ BitVec 32))) )
))
(declare-fun lt!141066 () SeekEntryResult!1898)

(declare-datatypes ((array!14298 0))(
  ( (array!14299 (arr!6784 (Array (_ BitVec 32) (_ BitVec 64))) (size!7136 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14298)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14298 (_ BitVec 32)) SeekEntryResult!1898)

(assert (=> b!286153 (= lt!141066 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286150 () Bool)

(declare-fun res!148276 () Bool)

(assert (=> b!286150 (=> (not res!148276) (not e!181342))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286150 (= res!148276 (and (= (size!7136 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7136 a!3312))))))

(declare-fun b!286151 () Bool)

(declare-fun res!148275 () Bool)

(assert (=> b!286151 (=> (not res!148275) (not e!181342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286151 (= res!148275 (validKeyInArray!0 k0!2524))))

(declare-fun b!286152 () Bool)

(declare-fun res!148277 () Bool)

(assert (=> b!286152 (=> (not res!148277) (not e!181342))))

(declare-fun arrayContainsKey!0 (array!14298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286152 (= res!148277 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148278 () Bool)

(assert (=> start!27772 (=> (not res!148278) (not e!181342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27772 (= res!148278 (validMask!0 mask!3809))))

(assert (=> start!27772 e!181342))

(assert (=> start!27772 true))

(declare-fun array_inv!4734 (array!14298) Bool)

(assert (=> start!27772 (array_inv!4734 a!3312)))

(assert (= (and start!27772 res!148278) b!286150))

(assert (= (and b!286150 res!148276) b!286151))

(assert (= (and b!286151 res!148275) b!286152))

(assert (= (and b!286152 res!148277) b!286153))

(declare-fun m!301061 () Bool)

(assert (=> b!286153 m!301061))

(declare-fun m!301063 () Bool)

(assert (=> b!286151 m!301063))

(declare-fun m!301065 () Bool)

(assert (=> b!286152 m!301065))

(declare-fun m!301067 () Bool)

(assert (=> start!27772 m!301067))

(declare-fun m!301069 () Bool)

(assert (=> start!27772 m!301069))

(check-sat (not b!286151) (not b!286152) (not start!27772) (not b!286153))
(check-sat)
