; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27760 () Bool)

(assert start!27760)

(declare-fun res!148197 () Bool)

(declare-fun e!181307 () Bool)

(assert (=> start!27760 (=> (not res!148197) (not e!181307))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27760 (= res!148197 (validMask!0 mask!3809))))

(assert (=> start!27760 e!181307))

(assert (=> start!27760 true))

(declare-datatypes ((array!14286 0))(
  ( (array!14287 (arr!6778 (Array (_ BitVec 32) (_ BitVec 64))) (size!7130 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14286)

(declare-fun array_inv!4728 (array!14286) Bool)

(assert (=> start!27760 (array_inv!4728 a!3312)))

(declare-fun b!286071 () Bool)

(assert (=> b!286071 (= e!181307 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!286072 () Bool)

(declare-fun res!148196 () Bool)

(assert (=> b!286072 (=> (not res!148196) (not e!181307))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286072 (= res!148196 (validKeyInArray!0 k0!2524))))

(declare-fun b!286073 () Bool)

(declare-fun res!148200 () Bool)

(assert (=> b!286073 (=> (not res!148200) (not e!181307))))

(declare-fun arrayContainsKey!0 (array!14286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286073 (= res!148200 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286074 () Bool)

(declare-fun res!148199 () Bool)

(assert (=> b!286074 (=> (not res!148199) (not e!181307))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286074 (= res!148199 (and (= (size!7130 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7130 a!3312))))))

(declare-fun b!286075 () Bool)

(declare-fun res!148198 () Bool)

(assert (=> b!286075 (=> (not res!148198) (not e!181307))))

(declare-datatypes ((SeekEntryResult!1892 0))(
  ( (MissingZero!1892 (index!9738 (_ BitVec 32))) (Found!1892 (index!9739 (_ BitVec 32))) (Intermediate!1892 (undefined!2704 Bool) (index!9740 (_ BitVec 32)) (x!28076 (_ BitVec 32))) (Undefined!1892) (MissingVacant!1892 (index!9741 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14286 (_ BitVec 32)) SeekEntryResult!1892)

(assert (=> b!286075 (= res!148198 (not (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) (MissingZero!1892 i!1256))))))

(assert (= (and start!27760 res!148197) b!286074))

(assert (= (and b!286074 res!148199) b!286072))

(assert (= (and b!286072 res!148196) b!286073))

(assert (= (and b!286073 res!148200) b!286075))

(assert (= (and b!286075 res!148198) b!286071))

(declare-fun m!301001 () Bool)

(assert (=> start!27760 m!301001))

(declare-fun m!301003 () Bool)

(assert (=> start!27760 m!301003))

(declare-fun m!301005 () Bool)

(assert (=> b!286072 m!301005))

(declare-fun m!301007 () Bool)

(assert (=> b!286073 m!301007))

(declare-fun m!301009 () Bool)

(assert (=> b!286075 m!301009))

(check-sat (not b!286073) (not b!286075) (not start!27760) (not b!286072))
(check-sat)
