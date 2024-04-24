; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27766 () Bool)

(assert start!27766)

(declare-fun b!286114 () Bool)

(declare-fun res!148242 () Bool)

(declare-fun e!181324 () Bool)

(assert (=> b!286114 (=> (not res!148242) (not e!181324))))

(declare-datatypes ((array!14292 0))(
  ( (array!14293 (arr!6781 (Array (_ BitVec 32) (_ BitVec 64))) (size!7133 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14292)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286114 (= res!148242 (and (= (size!7133 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7133 a!3312))))))

(declare-fun b!286116 () Bool)

(declare-fun res!148241 () Bool)

(assert (=> b!286116 (=> (not res!148241) (not e!181324))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286116 (= res!148241 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286115 () Bool)

(declare-fun res!148239 () Bool)

(assert (=> b!286115 (=> (not res!148239) (not e!181324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286115 (= res!148239 (validKeyInArray!0 k0!2524))))

(declare-fun b!286117 () Bool)

(assert (=> b!286117 (= e!181324 false)))

(declare-datatypes ((SeekEntryResult!1895 0))(
  ( (MissingZero!1895 (index!9750 (_ BitVec 32))) (Found!1895 (index!9751 (_ BitVec 32))) (Intermediate!1895 (undefined!2707 Bool) (index!9752 (_ BitVec 32)) (x!28087 (_ BitVec 32))) (Undefined!1895) (MissingVacant!1895 (index!9753 (_ BitVec 32))) )
))
(declare-fun lt!141057 () SeekEntryResult!1895)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14292 (_ BitVec 32)) SeekEntryResult!1895)

(assert (=> b!286117 (= lt!141057 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!148240 () Bool)

(assert (=> start!27766 (=> (not res!148240) (not e!181324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27766 (= res!148240 (validMask!0 mask!3809))))

(assert (=> start!27766 e!181324))

(assert (=> start!27766 true))

(declare-fun array_inv!4731 (array!14292) Bool)

(assert (=> start!27766 (array_inv!4731 a!3312)))

(assert (= (and start!27766 res!148240) b!286114))

(assert (= (and b!286114 res!148242) b!286115))

(assert (= (and b!286115 res!148239) b!286116))

(assert (= (and b!286116 res!148241) b!286117))

(declare-fun m!301031 () Bool)

(assert (=> b!286116 m!301031))

(declare-fun m!301033 () Bool)

(assert (=> b!286115 m!301033))

(declare-fun m!301035 () Bool)

(assert (=> b!286117 m!301035))

(declare-fun m!301037 () Bool)

(assert (=> start!27766 m!301037))

(declare-fun m!301039 () Bool)

(assert (=> start!27766 m!301039))

(check-sat (not b!286115) (not b!286117) (not b!286116) (not start!27766))
(check-sat)
