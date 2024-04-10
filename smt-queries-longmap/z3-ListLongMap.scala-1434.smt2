; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27770 () Bool)

(assert start!27770)

(declare-fun b!286039 () Bool)

(declare-fun res!148192 () Bool)

(declare-fun e!181288 () Bool)

(assert (=> b!286039 (=> (not res!148192) (not e!181288))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14291 0))(
  ( (array!14292 (arr!6780 (Array (_ BitVec 32) (_ BitVec 64))) (size!7132 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14291)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1929 0))(
  ( (MissingZero!1929 (index!9886 (_ BitVec 32))) (Found!1929 (index!9887 (_ BitVec 32))) (Intermediate!1929 (undefined!2741 Bool) (index!9888 (_ BitVec 32)) (x!28113 (_ BitVec 32))) (Undefined!1929) (MissingVacant!1929 (index!9889 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14291 (_ BitVec 32)) SeekEntryResult!1929)

(assert (=> b!286039 (= res!148192 (not (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) (MissingZero!1929 i!1256))))))

(declare-fun b!286040 () Bool)

(declare-fun res!148190 () Bool)

(assert (=> b!286040 (=> (not res!148190) (not e!181288))))

(assert (=> b!286040 (= res!148190 (and (= (size!7132 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7132 a!3312))))))

(declare-fun b!286041 () Bool)

(declare-fun res!148193 () Bool)

(assert (=> b!286041 (=> (not res!148193) (not e!181288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286041 (= res!148193 (validKeyInArray!0 k0!2524))))

(declare-fun b!286042 () Bool)

(declare-fun res!148194 () Bool)

(assert (=> b!286042 (=> (not res!148194) (not e!181288))))

(declare-fun arrayContainsKey!0 (array!14291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286042 (= res!148194 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148191 () Bool)

(assert (=> start!27770 (=> (not res!148191) (not e!181288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27770 (= res!148191 (validMask!0 mask!3809))))

(assert (=> start!27770 e!181288))

(assert (=> start!27770 true))

(declare-fun array_inv!4743 (array!14291) Bool)

(assert (=> start!27770 (array_inv!4743 a!3312)))

(declare-fun b!286043 () Bool)

(assert (=> b!286043 (= e!181288 (bvslt mask!3809 #b00000000000000000000000000000000))))

(assert (= (and start!27770 res!148191) b!286040))

(assert (= (and b!286040 res!148190) b!286041))

(assert (= (and b!286041 res!148193) b!286042))

(assert (= (and b!286042 res!148194) b!286039))

(assert (= (and b!286039 res!148192) b!286043))

(declare-fun m!300805 () Bool)

(assert (=> b!286039 m!300805))

(declare-fun m!300807 () Bool)

(assert (=> b!286041 m!300807))

(declare-fun m!300809 () Bool)

(assert (=> b!286042 m!300809))

(declare-fun m!300811 () Bool)

(assert (=> start!27770 m!300811))

(declare-fun m!300813 () Bool)

(assert (=> start!27770 m!300813))

(check-sat (not start!27770) (not b!286039) (not b!286041) (not b!286042))
(check-sat)
