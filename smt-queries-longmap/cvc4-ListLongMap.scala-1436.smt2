; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27784 () Bool)

(assert start!27784)

(declare-fun res!148278 () Bool)

(declare-fun e!181330 () Bool)

(assert (=> start!27784 (=> (not res!148278) (not e!181330))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27784 (= res!148278 (validMask!0 mask!3809))))

(assert (=> start!27784 e!181330))

(assert (=> start!27784 true))

(declare-datatypes ((array!14305 0))(
  ( (array!14306 (arr!6787 (Array (_ BitVec 32) (_ BitVec 64))) (size!7139 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14305)

(declare-fun array_inv!4750 (array!14305) Bool)

(assert (=> start!27784 (array_inv!4750 a!3312)))

(declare-fun b!286130 () Bool)

(assert (=> b!286130 (= e!181330 false)))

(declare-datatypes ((SeekEntryResult!1936 0))(
  ( (MissingZero!1936 (index!9914 (_ BitVec 32))) (Found!1936 (index!9915 (_ BitVec 32))) (Intermediate!1936 (undefined!2748 Bool) (index!9916 (_ BitVec 32)) (x!28136 (_ BitVec 32))) (Undefined!1936) (MissingVacant!1936 (index!9917 (_ BitVec 32))) )
))
(declare-fun lt!141013 () SeekEntryResult!1936)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14305 (_ BitVec 32)) SeekEntryResult!1936)

(assert (=> b!286130 (= lt!141013 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286128 () Bool)

(declare-fun res!148280 () Bool)

(assert (=> b!286128 (=> (not res!148280) (not e!181330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286128 (= res!148280 (validKeyInArray!0 k!2524))))

(declare-fun b!286129 () Bool)

(declare-fun res!148281 () Bool)

(assert (=> b!286129 (=> (not res!148281) (not e!181330))))

(declare-fun arrayContainsKey!0 (array!14305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286129 (= res!148281 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286127 () Bool)

(declare-fun res!148279 () Bool)

(assert (=> b!286127 (=> (not res!148279) (not e!181330))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286127 (= res!148279 (and (= (size!7139 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7139 a!3312))))))

(assert (= (and start!27784 res!148278) b!286127))

(assert (= (and b!286127 res!148279) b!286128))

(assert (= (and b!286128 res!148280) b!286129))

(assert (= (and b!286129 res!148281) b!286130))

(declare-fun m!300875 () Bool)

(assert (=> start!27784 m!300875))

(declare-fun m!300877 () Bool)

(assert (=> start!27784 m!300877))

(declare-fun m!300879 () Bool)

(assert (=> b!286130 m!300879))

(declare-fun m!300881 () Bool)

(assert (=> b!286128 m!300881))

(declare-fun m!300883 () Bool)

(assert (=> b!286129 m!300883))

(push 1)

(assert (not b!286130))

(assert (not b!286128))

(assert (not b!286129))

(assert (not start!27784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

