; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27726 () Bool)

(assert start!27726)

(declare-fun res!148046 () Bool)

(declare-fun e!181210 () Bool)

(assert (=> start!27726 (=> (not res!148046) (not e!181210))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27726 (= res!148046 (validMask!0 mask!3809))))

(assert (=> start!27726 e!181210))

(assert (=> start!27726 true))

(declare-datatypes ((array!14262 0))(
  ( (array!14263 (arr!6767 (Array (_ BitVec 32) (_ BitVec 64))) (size!7119 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14262)

(declare-fun array_inv!4730 (array!14262) Bool)

(assert (=> start!27726 (array_inv!4730 a!3312)))

(declare-fun b!285894 () Bool)

(declare-fun res!148045 () Bool)

(assert (=> b!285894 (=> (not res!148045) (not e!181210))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285894 (= res!148045 (and (= (size!7119 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7119 a!3312))))))

(declare-fun b!285895 () Bool)

(declare-fun res!148047 () Bool)

(assert (=> b!285895 (=> (not res!148047) (not e!181210))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285895 (= res!148047 (validKeyInArray!0 k!2524))))

(declare-fun b!285896 () Bool)

(assert (=> b!285896 (= e!181210 (bvsge #b00000000000000000000000000000000 (size!7119 a!3312)))))

(assert (= (and start!27726 res!148046) b!285894))

(assert (= (and b!285894 res!148045) b!285895))

(assert (= (and b!285895 res!148047) b!285896))

(declare-fun m!300705 () Bool)

(assert (=> start!27726 m!300705))

(declare-fun m!300707 () Bool)

(assert (=> start!27726 m!300707))

(declare-fun m!300709 () Bool)

(assert (=> b!285895 m!300709))

(push 1)

(assert (not start!27726))

(assert (not b!285895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

