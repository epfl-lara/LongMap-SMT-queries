; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27756 () Bool)

(assert start!27756)

(declare-fun b!286047 () Bool)

(declare-fun res!148170 () Bool)

(declare-fun e!181295 () Bool)

(assert (=> b!286047 (=> (not res!148170) (not e!181295))))

(declare-datatypes ((array!14282 0))(
  ( (array!14283 (arr!6776 (Array (_ BitVec 32) (_ BitVec 64))) (size!7128 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14282)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286047 (= res!148170 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286045 () Bool)

(declare-fun res!148172 () Bool)

(assert (=> b!286045 (=> (not res!148172) (not e!181295))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286045 (= res!148172 (and (= (size!7128 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7128 a!3312))))))

(declare-fun res!148171 () Bool)

(assert (=> start!27756 (=> (not res!148171) (not e!181295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27756 (= res!148171 (validMask!0 mask!3809))))

(assert (=> start!27756 e!181295))

(assert (=> start!27756 true))

(declare-fun array_inv!4726 (array!14282) Bool)

(assert (=> start!27756 (array_inv!4726 a!3312)))

(declare-fun b!286048 () Bool)

(assert (=> b!286048 (= e!181295 false)))

(declare-datatypes ((SeekEntryResult!1890 0))(
  ( (MissingZero!1890 (index!9730 (_ BitVec 32))) (Found!1890 (index!9731 (_ BitVec 32))) (Intermediate!1890 (undefined!2702 Bool) (index!9732 (_ BitVec 32)) (x!28066 (_ BitVec 32))) (Undefined!1890) (MissingVacant!1890 (index!9733 (_ BitVec 32))) )
))
(declare-fun lt!141051 () SeekEntryResult!1890)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14282 (_ BitVec 32)) SeekEntryResult!1890)

(assert (=> b!286048 (= lt!141051 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286046 () Bool)

(declare-fun res!148173 () Bool)

(assert (=> b!286046 (=> (not res!148173) (not e!181295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286046 (= res!148173 (validKeyInArray!0 k!2524))))

(assert (= (and start!27756 res!148171) b!286045))

(assert (= (and b!286045 res!148172) b!286046))

(assert (= (and b!286046 res!148173) b!286047))

(assert (= (and b!286047 res!148170) b!286048))

(declare-fun m!300981 () Bool)

(assert (=> b!286047 m!300981))

(declare-fun m!300983 () Bool)

(assert (=> start!27756 m!300983))

(declare-fun m!300985 () Bool)

(assert (=> start!27756 m!300985))

(declare-fun m!300987 () Bool)

(assert (=> b!286048 m!300987))

(declare-fun m!300989 () Bool)

(assert (=> b!286046 m!300989))

(push 1)

(assert (not b!286046))

(assert (not b!286048))

(assert (not start!27756))

(assert (not b!286047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

