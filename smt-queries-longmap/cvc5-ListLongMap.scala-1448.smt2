; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27930 () Bool)

(assert start!27930)

(declare-fun b!286881 () Bool)

(declare-fun res!148894 () Bool)

(declare-fun e!181744 () Bool)

(assert (=> b!286881 (=> (not res!148894) (not e!181744))))

(declare-datatypes ((array!14379 0))(
  ( (array!14380 (arr!6821 (Array (_ BitVec 32) (_ BitVec 64))) (size!7173 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14379)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286881 (= res!148894 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286882 () Bool)

(declare-fun e!181743 () Bool)

(assert (=> b!286882 (= e!181744 e!181743)))

(declare-fun res!148892 () Bool)

(assert (=> b!286882 (=> (not res!148892) (not e!181743))))

(declare-datatypes ((SeekEntryResult!1970 0))(
  ( (MissingZero!1970 (index!10050 (_ BitVec 32))) (Found!1970 (index!10051 (_ BitVec 32))) (Intermediate!1970 (undefined!2782 Bool) (index!10052 (_ BitVec 32)) (x!28269 (_ BitVec 32))) (Undefined!1970) (MissingVacant!1970 (index!10053 (_ BitVec 32))) )
))
(declare-fun lt!141288 () SeekEntryResult!1970)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286882 (= res!148892 (or (= lt!141288 (MissingZero!1970 i!1256)) (= lt!141288 (MissingVacant!1970 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14379 (_ BitVec 32)) SeekEntryResult!1970)

(assert (=> b!286882 (= lt!141288 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286883 () Bool)

(declare-fun res!148893 () Bool)

(assert (=> b!286883 (=> (not res!148893) (not e!181744))))

(assert (=> b!286883 (= res!148893 (and (= (size!7173 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7173 a!3312))))))

(declare-fun b!286884 () Bool)

(assert (=> b!286884 (= e!181743 false)))

(declare-fun lt!141289 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286884 (= lt!141289 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!286885 () Bool)

(declare-fun res!148896 () Bool)

(assert (=> b!286885 (=> (not res!148896) (not e!181743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14379 (_ BitVec 32)) Bool)

(assert (=> b!286885 (= res!148896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!148895 () Bool)

(assert (=> start!27930 (=> (not res!148895) (not e!181744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27930 (= res!148895 (validMask!0 mask!3809))))

(assert (=> start!27930 e!181744))

(assert (=> start!27930 true))

(declare-fun array_inv!4784 (array!14379) Bool)

(assert (=> start!27930 (array_inv!4784 a!3312)))

(declare-fun b!286886 () Bool)

(declare-fun res!148891 () Bool)

(assert (=> b!286886 (=> (not res!148891) (not e!181744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286886 (= res!148891 (validKeyInArray!0 k!2524))))

(assert (= (and start!27930 res!148895) b!286883))

(assert (= (and b!286883 res!148893) b!286886))

(assert (= (and b!286886 res!148891) b!286881))

(assert (= (and b!286881 res!148894) b!286882))

(assert (= (and b!286882 res!148892) b!286885))

(assert (= (and b!286885 res!148896) b!286884))

(declare-fun m!301449 () Bool)

(assert (=> b!286881 m!301449))

(declare-fun m!301451 () Bool)

(assert (=> b!286886 m!301451))

(declare-fun m!301453 () Bool)

(assert (=> start!27930 m!301453))

(declare-fun m!301455 () Bool)

(assert (=> start!27930 m!301455))

(declare-fun m!301457 () Bool)

(assert (=> b!286885 m!301457))

(declare-fun m!301459 () Bool)

(assert (=> b!286884 m!301459))

(declare-fun m!301461 () Bool)

(assert (=> b!286882 m!301461))

(push 1)

