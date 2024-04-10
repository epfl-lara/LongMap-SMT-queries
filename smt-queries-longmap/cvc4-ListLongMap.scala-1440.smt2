; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27808 () Bool)

(assert start!27808)

(declare-fun b!286273 () Bool)

(declare-fun res!148425 () Bool)

(declare-fun e!181403 () Bool)

(assert (=> b!286273 (=> (not res!148425) (not e!181403))))

(declare-datatypes ((array!14329 0))(
  ( (array!14330 (arr!6799 (Array (_ BitVec 32) (_ BitVec 64))) (size!7151 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14329)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286273 (= res!148425 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286271 () Bool)

(declare-fun res!148423 () Bool)

(assert (=> b!286271 (=> (not res!148423) (not e!181403))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286271 (= res!148423 (and (= (size!7151 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7151 a!3312))))))

(declare-fun b!286272 () Bool)

(declare-fun res!148422 () Bool)

(assert (=> b!286272 (=> (not res!148422) (not e!181403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286272 (= res!148422 (validKeyInArray!0 k!2524))))

(declare-fun res!148424 () Bool)

(assert (=> start!27808 (=> (not res!148424) (not e!181403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27808 (= res!148424 (validMask!0 mask!3809))))

(assert (=> start!27808 e!181403))

(assert (=> start!27808 true))

(declare-fun array_inv!4762 (array!14329) Bool)

(assert (=> start!27808 (array_inv!4762 a!3312)))

(declare-datatypes ((SeekEntryResult!1948 0))(
  ( (MissingZero!1948 (index!9962 (_ BitVec 32))) (Found!1948 (index!9963 (_ BitVec 32))) (Intermediate!1948 (undefined!2760 Bool) (index!9964 (_ BitVec 32)) (x!28180 (_ BitVec 32))) (Undefined!1948) (MissingVacant!1948 (index!9965 (_ BitVec 32))) )
))
(declare-fun lt!141049 () SeekEntryResult!1948)

(declare-fun b!286274 () Bool)

(assert (=> b!286274 (= e!181403 (and (or (= lt!141049 (MissingZero!1948 i!1256)) (= lt!141049 (MissingVacant!1948 i!1256))) (bvsgt #b00000000000000000000000000000000 (size!7151 a!3312))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14329 (_ BitVec 32)) SeekEntryResult!1948)

(assert (=> b!286274 (= lt!141049 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!27808 res!148424) b!286271))

(assert (= (and b!286271 res!148423) b!286272))

(assert (= (and b!286272 res!148422) b!286273))

(assert (= (and b!286273 res!148425) b!286274))

(declare-fun m!300995 () Bool)

(assert (=> b!286273 m!300995))

(declare-fun m!300997 () Bool)

(assert (=> b!286272 m!300997))

(declare-fun m!300999 () Bool)

(assert (=> start!27808 m!300999))

(declare-fun m!301001 () Bool)

(assert (=> start!27808 m!301001))

(declare-fun m!301003 () Bool)

(assert (=> b!286274 m!301003))

(push 1)

(assert (not b!286274))

(assert (not start!27808))

(assert (not b!286273))

(assert (not b!286272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

