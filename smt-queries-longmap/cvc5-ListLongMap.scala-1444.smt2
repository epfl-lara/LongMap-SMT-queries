; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27864 () Bool)

(assert start!27864)

(declare-fun b!286557 () Bool)

(declare-fun res!148637 () Bool)

(declare-fun e!181563 () Bool)

(assert (=> b!286557 (=> (not res!148637) (not e!181563))))

(declare-datatypes ((array!14352 0))(
  ( (array!14353 (arr!6809 (Array (_ BitVec 32) (_ BitVec 64))) (size!7161 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14352)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14352 (_ BitVec 32)) Bool)

(assert (=> b!286557 (= res!148637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286558 () Bool)

(declare-fun res!148636 () Bool)

(declare-fun e!181564 () Bool)

(assert (=> b!286558 (=> (not res!148636) (not e!181564))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286558 (= res!148636 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286559 () Bool)

(declare-fun res!148638 () Bool)

(assert (=> b!286559 (=> (not res!148638) (not e!181564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286559 (= res!148638 (validKeyInArray!0 k!2524))))

(declare-fun b!286560 () Bool)

(assert (=> b!286560 (= e!181563 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141145 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286560 (= lt!141145 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!148640 () Bool)

(assert (=> start!27864 (=> (not res!148640) (not e!181564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27864 (= res!148640 (validMask!0 mask!3809))))

(assert (=> start!27864 e!181564))

(assert (=> start!27864 true))

(declare-fun array_inv!4772 (array!14352) Bool)

(assert (=> start!27864 (array_inv!4772 a!3312)))

(declare-fun b!286561 () Bool)

(assert (=> b!286561 (= e!181564 e!181563)))

(declare-fun res!148639 () Bool)

(assert (=> b!286561 (=> (not res!148639) (not e!181563))))

(declare-datatypes ((SeekEntryResult!1958 0))(
  ( (MissingZero!1958 (index!10002 (_ BitVec 32))) (Found!1958 (index!10003 (_ BitVec 32))) (Intermediate!1958 (undefined!2770 Bool) (index!10004 (_ BitVec 32)) (x!28222 (_ BitVec 32))) (Undefined!1958) (MissingVacant!1958 (index!10005 (_ BitVec 32))) )
))
(declare-fun lt!141144 () SeekEntryResult!1958)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286561 (= res!148639 (or (= lt!141144 (MissingZero!1958 i!1256)) (= lt!141144 (MissingVacant!1958 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14352 (_ BitVec 32)) SeekEntryResult!1958)

(assert (=> b!286561 (= lt!141144 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286562 () Bool)

(declare-fun res!148641 () Bool)

(assert (=> b!286562 (=> (not res!148641) (not e!181564))))

(assert (=> b!286562 (= res!148641 (and (= (size!7161 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7161 a!3312))))))

(assert (= (and start!27864 res!148640) b!286562))

(assert (= (and b!286562 res!148641) b!286559))

(assert (= (and b!286559 res!148638) b!286558))

(assert (= (and b!286558 res!148636) b!286561))

(assert (= (and b!286561 res!148639) b!286557))

(assert (= (and b!286557 res!148637) b!286560))

(declare-fun m!301203 () Bool)

(assert (=> b!286560 m!301203))

(declare-fun m!301205 () Bool)

(assert (=> start!27864 m!301205))

(declare-fun m!301207 () Bool)

(assert (=> start!27864 m!301207))

(declare-fun m!301209 () Bool)

(assert (=> b!286557 m!301209))

(declare-fun m!301211 () Bool)

(assert (=> b!286561 m!301211))

(declare-fun m!301213 () Bool)

(assert (=> b!286559 m!301213))

(declare-fun m!301215 () Bool)

(assert (=> b!286558 m!301215))

(push 1)

(assert (not b!286559))

(assert (not b!286560))

(assert (not b!286558))

(assert (not start!27864))

(assert (not b!286561))

(assert (not b!286557))

(check-sat)

(pop 1)

(push 1)

(check-sat)

