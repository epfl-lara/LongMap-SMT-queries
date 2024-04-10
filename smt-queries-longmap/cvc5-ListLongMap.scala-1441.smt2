; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27810 () Bool)

(assert start!27810)

(declare-fun b!286287 () Bool)

(declare-fun res!148439 () Bool)

(declare-fun e!181412 () Bool)

(assert (=> b!286287 (=> (not res!148439) (not e!181412))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286287 (= res!148439 (validKeyInArray!0 k!2524))))

(declare-fun b!286288 () Bool)

(declare-fun res!148438 () Bool)

(assert (=> b!286288 (=> (not res!148438) (not e!181412))))

(declare-datatypes ((array!14331 0))(
  ( (array!14332 (arr!6800 (Array (_ BitVec 32) (_ BitVec 64))) (size!7152 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14331)

(declare-fun arrayContainsKey!0 (array!14331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286288 (= res!148438 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286289 () Bool)

(declare-fun res!148440 () Bool)

(declare-fun e!181411 () Bool)

(assert (=> b!286289 (=> (not res!148440) (not e!181411))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14331 (_ BitVec 32)) Bool)

(assert (=> b!286289 (= res!148440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!148443 () Bool)

(assert (=> start!27810 (=> (not res!148443) (not e!181412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27810 (= res!148443 (validMask!0 mask!3809))))

(assert (=> start!27810 e!181412))

(assert (=> start!27810 true))

(declare-fun array_inv!4763 (array!14331) Bool)

(assert (=> start!27810 (array_inv!4763 a!3312)))

(declare-fun b!286290 () Bool)

(declare-fun res!148441 () Bool)

(assert (=> b!286290 (=> (not res!148441) (not e!181412))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286290 (= res!148441 (and (= (size!7152 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7152 a!3312))))))

(declare-fun b!286291 () Bool)

(assert (=> b!286291 (= e!181412 e!181411)))

(declare-fun res!148442 () Bool)

(assert (=> b!286291 (=> (not res!148442) (not e!181411))))

(declare-datatypes ((SeekEntryResult!1949 0))(
  ( (MissingZero!1949 (index!9966 (_ BitVec 32))) (Found!1949 (index!9967 (_ BitVec 32))) (Intermediate!1949 (undefined!2761 Bool) (index!9968 (_ BitVec 32)) (x!28189 (_ BitVec 32))) (Undefined!1949) (MissingVacant!1949 (index!9969 (_ BitVec 32))) )
))
(declare-fun lt!141052 () SeekEntryResult!1949)

(assert (=> b!286291 (= res!148442 (or (= lt!141052 (MissingZero!1949 i!1256)) (= lt!141052 (MissingVacant!1949 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14331 (_ BitVec 32)) SeekEntryResult!1949)

(assert (=> b!286291 (= lt!141052 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286292 () Bool)

(assert (=> b!286292 (= e!181411 (bvslt mask!3809 #b00000000000000000000000000000000))))

(assert (= (and start!27810 res!148443) b!286290))

(assert (= (and b!286290 res!148441) b!286287))

(assert (= (and b!286287 res!148439) b!286288))

(assert (= (and b!286288 res!148438) b!286291))

(assert (= (and b!286291 res!148442) b!286289))

(assert (= (and b!286289 res!148440) b!286292))

(declare-fun m!301005 () Bool)

(assert (=> b!286291 m!301005))

(declare-fun m!301007 () Bool)

(assert (=> b!286287 m!301007))

(declare-fun m!301009 () Bool)

(assert (=> b!286288 m!301009))

(declare-fun m!301011 () Bool)

(assert (=> start!27810 m!301011))

(declare-fun m!301013 () Bool)

(assert (=> start!27810 m!301013))

(declare-fun m!301015 () Bool)

(assert (=> b!286289 m!301015))

(push 1)

(assert (not b!286288))

(assert (not b!286287))

(assert (not b!286291))

(assert (not b!286289))

(assert (not start!27810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

