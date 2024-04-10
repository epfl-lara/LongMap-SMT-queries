; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27762 () Bool)

(assert start!27762)

(declare-fun b!285986 () Bool)

(declare-fun res!148140 () Bool)

(declare-fun e!181264 () Bool)

(assert (=> b!285986 (=> (not res!148140) (not e!181264))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14283 0))(
  ( (array!14284 (arr!6776 (Array (_ BitVec 32) (_ BitVec 64))) (size!7128 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14283)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!285986 (= res!148140 (and (= (size!7128 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7128 a!3312))))))

(declare-fun b!285987 () Bool)

(declare-fun res!148139 () Bool)

(assert (=> b!285987 (=> (not res!148139) (not e!181264))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285987 (= res!148139 (validKeyInArray!0 k!2524))))

(declare-fun b!285988 () Bool)

(declare-fun res!148137 () Bool)

(assert (=> b!285988 (=> (not res!148137) (not e!181264))))

(declare-fun arrayContainsKey!0 (array!14283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285988 (= res!148137 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!285989 () Bool)

(assert (=> b!285989 (= e!181264 false)))

(declare-datatypes ((SeekEntryResult!1925 0))(
  ( (MissingZero!1925 (index!9870 (_ BitVec 32))) (Found!1925 (index!9871 (_ BitVec 32))) (Intermediate!1925 (undefined!2737 Bool) (index!9872 (_ BitVec 32)) (x!28101 (_ BitVec 32))) (Undefined!1925) (MissingVacant!1925 (index!9873 (_ BitVec 32))) )
))
(declare-fun lt!140989 () SeekEntryResult!1925)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14283 (_ BitVec 32)) SeekEntryResult!1925)

(assert (=> b!285989 (= lt!140989 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!148138 () Bool)

(assert (=> start!27762 (=> (not res!148138) (not e!181264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27762 (= res!148138 (validMask!0 mask!3809))))

(assert (=> start!27762 e!181264))

(assert (=> start!27762 true))

(declare-fun array_inv!4739 (array!14283) Bool)

(assert (=> start!27762 (array_inv!4739 a!3312)))

(assert (= (and start!27762 res!148138) b!285986))

(assert (= (and b!285986 res!148140) b!285987))

(assert (= (and b!285987 res!148139) b!285988))

(assert (= (and b!285988 res!148137) b!285989))

(declare-fun m!300765 () Bool)

(assert (=> b!285987 m!300765))

(declare-fun m!300767 () Bool)

(assert (=> b!285988 m!300767))

(declare-fun m!300769 () Bool)

(assert (=> b!285989 m!300769))

(declare-fun m!300771 () Bool)

(assert (=> start!27762 m!300771))

(declare-fun m!300773 () Bool)

(assert (=> start!27762 m!300773))

(push 1)

(assert (not b!285987))

(assert (not start!27762))

(assert (not b!285988))

(assert (not b!285989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

