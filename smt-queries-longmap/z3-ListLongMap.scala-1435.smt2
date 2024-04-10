; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27776 () Bool)

(assert start!27776)

(declare-fun b!286080 () Bool)

(declare-fun res!148233 () Bool)

(declare-fun e!181307 () Bool)

(assert (=> b!286080 (=> (not res!148233) (not e!181307))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286080 (= res!148233 (validKeyInArray!0 k0!2524))))

(declare-fun b!286079 () Bool)

(declare-fun res!148232 () Bool)

(assert (=> b!286079 (=> (not res!148232) (not e!181307))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14297 0))(
  ( (array!14298 (arr!6783 (Array (_ BitVec 32) (_ BitVec 64))) (size!7135 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14297)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286079 (= res!148232 (and (= (size!7135 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7135 a!3312))))))

(declare-fun res!148230 () Bool)

(assert (=> start!27776 (=> (not res!148230) (not e!181307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27776 (= res!148230 (validMask!0 mask!3809))))

(assert (=> start!27776 e!181307))

(assert (=> start!27776 true))

(declare-fun array_inv!4746 (array!14297) Bool)

(assert (=> start!27776 (array_inv!4746 a!3312)))

(declare-fun b!286082 () Bool)

(assert (=> b!286082 (= e!181307 false)))

(declare-datatypes ((SeekEntryResult!1932 0))(
  ( (MissingZero!1932 (index!9898 (_ BitVec 32))) (Found!1932 (index!9899 (_ BitVec 32))) (Intermediate!1932 (undefined!2744 Bool) (index!9900 (_ BitVec 32)) (x!28124 (_ BitVec 32))) (Undefined!1932) (MissingVacant!1932 (index!9901 (_ BitVec 32))) )
))
(declare-fun lt!141001 () SeekEntryResult!1932)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14297 (_ BitVec 32)) SeekEntryResult!1932)

(assert (=> b!286082 (= lt!141001 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286081 () Bool)

(declare-fun res!148231 () Bool)

(assert (=> b!286081 (=> (not res!148231) (not e!181307))))

(declare-fun arrayContainsKey!0 (array!14297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286081 (= res!148231 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27776 res!148230) b!286079))

(assert (= (and b!286079 res!148232) b!286080))

(assert (= (and b!286080 res!148233) b!286081))

(assert (= (and b!286081 res!148231) b!286082))

(declare-fun m!300835 () Bool)

(assert (=> b!286080 m!300835))

(declare-fun m!300837 () Bool)

(assert (=> start!27776 m!300837))

(declare-fun m!300839 () Bool)

(assert (=> start!27776 m!300839))

(declare-fun m!300841 () Bool)

(assert (=> b!286082 m!300841))

(declare-fun m!300843 () Bool)

(assert (=> b!286081 m!300843))

(check-sat (not b!286080) (not b!286081) (not start!27776) (not b!286082))
