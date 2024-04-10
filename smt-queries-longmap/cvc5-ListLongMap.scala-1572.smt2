; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29968 () Bool)

(assert start!29968)

(declare-fun res!158749 () Bool)

(declare-fun e!190026 () Bool)

(assert (=> start!29968 (=> (not res!158749) (not e!190026))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29968 (= res!158749 (validMask!0 mask!3709))))

(assert (=> start!29968 e!190026))

(assert (=> start!29968 true))

(declare-datatypes ((array!15201 0))(
  ( (array!15202 (arr!7193 (Array (_ BitVec 32) (_ BitVec 64))) (size!7545 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15201)

(declare-fun array_inv!5156 (array!15201) Bool)

(assert (=> start!29968 (array_inv!5156 a!3293)))

(declare-fun b!300999 () Bool)

(declare-fun res!158751 () Bool)

(assert (=> b!300999 (=> (not res!158751) (not e!190026))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300999 (= res!158751 (and (= (size!7545 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7545 a!3293))))))

(declare-fun b!301000 () Bool)

(declare-fun res!158750 () Bool)

(assert (=> b!301000 (=> (not res!158750) (not e!190026))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301000 (= res!158750 (validKeyInArray!0 k!2441))))

(declare-fun b!301001 () Bool)

(assert (=> b!301001 (= e!190026 (bvsge #b00000000000000000000000000000000 (size!7545 a!3293)))))

(assert (= (and start!29968 res!158749) b!300999))

(assert (= (and b!300999 res!158751) b!301000))

(assert (= (and b!301000 res!158750) b!301001))

(declare-fun m!312909 () Bool)

(assert (=> start!29968 m!312909))

(declare-fun m!312911 () Bool)

(assert (=> start!29968 m!312911))

(declare-fun m!312913 () Bool)

(assert (=> b!301000 m!312913))

(push 1)

(assert (not start!29968))

(assert (not b!301000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

