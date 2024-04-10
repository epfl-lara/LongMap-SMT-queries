; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27814 () Bool)

(assert start!27814)

(declare-fun b!286323 () Bool)

(declare-fun res!148476 () Bool)

(declare-fun e!181428 () Bool)

(assert (=> b!286323 (=> (not res!148476) (not e!181428))))

(declare-datatypes ((array!14335 0))(
  ( (array!14336 (arr!6802 (Array (_ BitVec 32) (_ BitVec 64))) (size!7154 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14335)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286323 (= res!148476 (and (= (size!7154 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7154 a!3312))))))

(declare-fun b!286324 () Bool)

(declare-fun res!148477 () Bool)

(assert (=> b!286324 (=> (not res!148477) (not e!181428))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286324 (= res!148477 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286325 () Bool)

(declare-fun res!148478 () Bool)

(declare-fun e!181430 () Bool)

(assert (=> b!286325 (=> (not res!148478) (not e!181430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14335 (_ BitVec 32)) Bool)

(assert (=> b!286325 (= res!148478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286326 () Bool)

(assert (=> b!286326 (= e!181428 e!181430)))

(declare-fun res!148474 () Bool)

(assert (=> b!286326 (=> (not res!148474) (not e!181430))))

(declare-datatypes ((SeekEntryResult!1951 0))(
  ( (MissingZero!1951 (index!9974 (_ BitVec 32))) (Found!1951 (index!9975 (_ BitVec 32))) (Intermediate!1951 (undefined!2763 Bool) (index!9976 (_ BitVec 32)) (x!28191 (_ BitVec 32))) (Undefined!1951) (MissingVacant!1951 (index!9977 (_ BitVec 32))) )
))
(declare-fun lt!141058 () SeekEntryResult!1951)

(assert (=> b!286326 (= res!148474 (or (= lt!141058 (MissingZero!1951 i!1256)) (= lt!141058 (MissingVacant!1951 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14335 (_ BitVec 32)) SeekEntryResult!1951)

(assert (=> b!286326 (= lt!141058 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286327 () Bool)

(declare-fun res!148479 () Bool)

(assert (=> b!286327 (=> (not res!148479) (not e!181428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286327 (= res!148479 (validKeyInArray!0 k!2524))))

(declare-fun b!286328 () Bool)

(assert (=> b!286328 (= e!181430 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun res!148475 () Bool)

(assert (=> start!27814 (=> (not res!148475) (not e!181428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27814 (= res!148475 (validMask!0 mask!3809))))

(assert (=> start!27814 e!181428))

(assert (=> start!27814 true))

(declare-fun array_inv!4765 (array!14335) Bool)

(assert (=> start!27814 (array_inv!4765 a!3312)))

(assert (= (and start!27814 res!148475) b!286323))

(assert (= (and b!286323 res!148476) b!286327))

(assert (= (and b!286327 res!148479) b!286324))

(assert (= (and b!286324 res!148477) b!286326))

(assert (= (and b!286326 res!148474) b!286325))

(assert (= (and b!286325 res!148478) b!286328))

(declare-fun m!301029 () Bool)

(assert (=> start!27814 m!301029))

(declare-fun m!301031 () Bool)

(assert (=> start!27814 m!301031))

(declare-fun m!301033 () Bool)

(assert (=> b!286326 m!301033))

(declare-fun m!301035 () Bool)

(assert (=> b!286327 m!301035))

(declare-fun m!301037 () Bool)

(assert (=> b!286324 m!301037))

(declare-fun m!301039 () Bool)

(assert (=> b!286325 m!301039))

(push 1)

(assert (not b!286326))

(assert (not b!286325))

(assert (not b!286327))

(assert (not b!286324))

(assert (not start!27814))

(check-sat)

