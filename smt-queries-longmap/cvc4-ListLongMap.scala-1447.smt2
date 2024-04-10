; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27928 () Bool)

(assert start!27928)

(declare-fun res!148877 () Bool)

(declare-fun e!181735 () Bool)

(assert (=> start!27928 (=> (not res!148877) (not e!181735))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27928 (= res!148877 (validMask!0 mask!3809))))

(assert (=> start!27928 e!181735))

(assert (=> start!27928 true))

(declare-datatypes ((array!14377 0))(
  ( (array!14378 (arr!6820 (Array (_ BitVec 32) (_ BitVec 64))) (size!7172 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14377)

(declare-fun array_inv!4783 (array!14377) Bool)

(assert (=> start!27928 (array_inv!4783 a!3312)))

(declare-fun b!286863 () Bool)

(declare-fun res!148874 () Bool)

(declare-fun e!181736 () Bool)

(assert (=> b!286863 (=> (not res!148874) (not e!181736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14377 (_ BitVec 32)) Bool)

(assert (=> b!286863 (= res!148874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286864 () Bool)

(assert (=> b!286864 (= e!181736 false)))

(declare-fun lt!141282 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286864 (= lt!141282 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!286865 () Bool)

(declare-fun res!148875 () Bool)

(assert (=> b!286865 (=> (not res!148875) (not e!181735))))

(declare-fun arrayContainsKey!0 (array!14377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286865 (= res!148875 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286866 () Bool)

(assert (=> b!286866 (= e!181735 e!181736)))

(declare-fun res!148876 () Bool)

(assert (=> b!286866 (=> (not res!148876) (not e!181736))))

(declare-datatypes ((SeekEntryResult!1969 0))(
  ( (MissingZero!1969 (index!10046 (_ BitVec 32))) (Found!1969 (index!10047 (_ BitVec 32))) (Intermediate!1969 (undefined!2781 Bool) (index!10048 (_ BitVec 32)) (x!28260 (_ BitVec 32))) (Undefined!1969) (MissingVacant!1969 (index!10049 (_ BitVec 32))) )
))
(declare-fun lt!141283 () SeekEntryResult!1969)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286866 (= res!148876 (or (= lt!141283 (MissingZero!1969 i!1256)) (= lt!141283 (MissingVacant!1969 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14377 (_ BitVec 32)) SeekEntryResult!1969)

(assert (=> b!286866 (= lt!141283 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286867 () Bool)

(declare-fun res!148878 () Bool)

(assert (=> b!286867 (=> (not res!148878) (not e!181735))))

(assert (=> b!286867 (= res!148878 (and (= (size!7172 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7172 a!3312))))))

(declare-fun b!286868 () Bool)

(declare-fun res!148873 () Bool)

(assert (=> b!286868 (=> (not res!148873) (not e!181735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286868 (= res!148873 (validKeyInArray!0 k!2524))))

(assert (= (and start!27928 res!148877) b!286867))

(assert (= (and b!286867 res!148878) b!286868))

(assert (= (and b!286868 res!148873) b!286865))

(assert (= (and b!286865 res!148875) b!286866))

(assert (= (and b!286866 res!148876) b!286863))

(assert (= (and b!286863 res!148874) b!286864))

(declare-fun m!301435 () Bool)

(assert (=> b!286865 m!301435))

(declare-fun m!301437 () Bool)

(assert (=> start!27928 m!301437))

(declare-fun m!301439 () Bool)

(assert (=> start!27928 m!301439))

(declare-fun m!301441 () Bool)

(assert (=> b!286863 m!301441))

(declare-fun m!301443 () Bool)

(assert (=> b!286864 m!301443))

(declare-fun m!301445 () Bool)

(assert (=> b!286868 m!301445))

(declare-fun m!301447 () Bool)

(assert (=> b!286866 m!301447))

(push 1)

(assert (not b!286864))

(assert (not b!286866))

(assert (not b!286865))

(assert (not start!27928))

(assert (not b!286868))

(assert (not b!286863))

(check-sat)

