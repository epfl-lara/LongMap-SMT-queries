; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27798 () Bool)

(assert start!27798)

(declare-fun res!148365 () Bool)

(declare-fun e!181372 () Bool)

(assert (=> start!27798 (=> (not res!148365) (not e!181372))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27798 (= res!148365 (validMask!0 mask!3809))))

(assert (=> start!27798 e!181372))

(assert (=> start!27798 true))

(declare-datatypes ((array!14319 0))(
  ( (array!14320 (arr!6794 (Array (_ BitVec 32) (_ BitVec 64))) (size!7146 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14319)

(declare-fun array_inv!4757 (array!14319) Bool)

(assert (=> start!27798 (array_inv!4757 a!3312)))

(declare-fun b!286211 () Bool)

(declare-fun res!148362 () Bool)

(assert (=> b!286211 (=> (not res!148362) (not e!181372))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286211 (= res!148362 (and (= (size!7146 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7146 a!3312))))))

(declare-fun b!286213 () Bool)

(declare-fun res!148363 () Bool)

(assert (=> b!286213 (=> (not res!148363) (not e!181372))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286213 (= res!148363 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286214 () Bool)

(assert (=> b!286214 (= e!181372 false)))

(declare-datatypes ((SeekEntryResult!1943 0))(
  ( (MissingZero!1943 (index!9942 (_ BitVec 32))) (Found!1943 (index!9943 (_ BitVec 32))) (Intermediate!1943 (undefined!2755 Bool) (index!9944 (_ BitVec 32)) (x!28167 (_ BitVec 32))) (Undefined!1943) (MissingVacant!1943 (index!9945 (_ BitVec 32))) )
))
(declare-fun lt!141034 () SeekEntryResult!1943)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14319 (_ BitVec 32)) SeekEntryResult!1943)

(assert (=> b!286214 (= lt!141034 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286212 () Bool)

(declare-fun res!148364 () Bool)

(assert (=> b!286212 (=> (not res!148364) (not e!181372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286212 (= res!148364 (validKeyInArray!0 k!2524))))

(assert (= (and start!27798 res!148365) b!286211))

(assert (= (and b!286211 res!148362) b!286212))

(assert (= (and b!286212 res!148364) b!286213))

(assert (= (and b!286213 res!148363) b!286214))

(declare-fun m!300945 () Bool)

(assert (=> start!27798 m!300945))

(declare-fun m!300947 () Bool)

(assert (=> start!27798 m!300947))

(declare-fun m!300949 () Bool)

(assert (=> b!286213 m!300949))

(declare-fun m!300951 () Bool)

(assert (=> b!286214 m!300951))

(declare-fun m!300953 () Bool)

(assert (=> b!286212 m!300953))

(push 1)

(assert (not b!286212))

(assert (not b!286213))

(assert (not start!27798))

(assert (not b!286214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

