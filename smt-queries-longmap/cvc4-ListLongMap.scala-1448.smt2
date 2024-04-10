; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27934 () Bool)

(assert start!27934)

(declare-fun res!148927 () Bool)

(declare-fun e!181762 () Bool)

(assert (=> start!27934 (=> (not res!148927) (not e!181762))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27934 (= res!148927 (validMask!0 mask!3809))))

(assert (=> start!27934 e!181762))

(assert (=> start!27934 true))

(declare-datatypes ((array!14383 0))(
  ( (array!14384 (arr!6823 (Array (_ BitVec 32) (_ BitVec 64))) (size!7175 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14383)

(declare-fun array_inv!4786 (array!14383) Bool)

(assert (=> start!27934 (array_inv!4786 a!3312)))

(declare-fun b!286917 () Bool)

(declare-fun res!148930 () Bool)

(declare-fun e!181763 () Bool)

(assert (=> b!286917 (=> (not res!148930) (not e!181763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14383 (_ BitVec 32)) Bool)

(assert (=> b!286917 (= res!148930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286918 () Bool)

(declare-fun res!148931 () Bool)

(assert (=> b!286918 (=> (not res!148931) (not e!181762))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286918 (= res!148931 (and (= (size!7175 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7175 a!3312))))))

(declare-fun b!286919 () Bool)

(assert (=> b!286919 (= e!181763 false)))

(declare-fun lt!141301 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286919 (= lt!141301 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!286920 () Bool)

(declare-fun res!148932 () Bool)

(assert (=> b!286920 (=> (not res!148932) (not e!181762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286920 (= res!148932 (validKeyInArray!0 k!2524))))

(declare-fun b!286921 () Bool)

(assert (=> b!286921 (= e!181762 e!181763)))

(declare-fun res!148929 () Bool)

(assert (=> b!286921 (=> (not res!148929) (not e!181763))))

(declare-datatypes ((SeekEntryResult!1972 0))(
  ( (MissingZero!1972 (index!10058 (_ BitVec 32))) (Found!1972 (index!10059 (_ BitVec 32))) (Intermediate!1972 (undefined!2784 Bool) (index!10060 (_ BitVec 32)) (x!28271 (_ BitVec 32))) (Undefined!1972) (MissingVacant!1972 (index!10061 (_ BitVec 32))) )
))
(declare-fun lt!141300 () SeekEntryResult!1972)

(assert (=> b!286921 (= res!148929 (or (= lt!141300 (MissingZero!1972 i!1256)) (= lt!141300 (MissingVacant!1972 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14383 (_ BitVec 32)) SeekEntryResult!1972)

(assert (=> b!286921 (= lt!141300 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286922 () Bool)

(declare-fun res!148928 () Bool)

(assert (=> b!286922 (=> (not res!148928) (not e!181762))))

(declare-fun arrayContainsKey!0 (array!14383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286922 (= res!148928 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27934 res!148927) b!286918))

(assert (= (and b!286918 res!148931) b!286920))

(assert (= (and b!286920 res!148932) b!286922))

(assert (= (and b!286922 res!148928) b!286921))

(assert (= (and b!286921 res!148929) b!286917))

(assert (= (and b!286917 res!148930) b!286919))

(declare-fun m!301477 () Bool)

(assert (=> b!286919 m!301477))

(declare-fun m!301479 () Bool)

(assert (=> start!27934 m!301479))

(declare-fun m!301481 () Bool)

(assert (=> start!27934 m!301481))

(declare-fun m!301483 () Bool)

(assert (=> b!286922 m!301483))

(declare-fun m!301485 () Bool)

(assert (=> b!286917 m!301485))

(declare-fun m!301487 () Bool)

(assert (=> b!286921 m!301487))

(declare-fun m!301489 () Bool)

(assert (=> b!286920 m!301489))

(push 1)

(assert (not b!286922))

(assert (not start!27934))

(assert (not b!286919))

