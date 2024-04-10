; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29978 () Bool)

(assert start!29978)

(declare-fun res!158796 () Bool)

(declare-fun e!190057 () Bool)

(assert (=> start!29978 (=> (not res!158796) (not e!190057))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29978 (= res!158796 (validMask!0 mask!3709))))

(assert (=> start!29978 e!190057))

(assert (=> start!29978 true))

(declare-datatypes ((array!15211 0))(
  ( (array!15212 (arr!7198 (Array (_ BitVec 32) (_ BitVec 64))) (size!7550 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15211)

(declare-fun array_inv!5161 (array!15211) Bool)

(assert (=> start!29978 (array_inv!5161 a!3293)))

(declare-fun b!301044 () Bool)

(declare-fun res!158794 () Bool)

(assert (=> b!301044 (=> (not res!158794) (not e!190057))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301044 (= res!158794 (and (= (size!7550 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7550 a!3293))))))

(declare-fun b!301045 () Bool)

(declare-fun res!158795 () Bool)

(assert (=> b!301045 (=> (not res!158795) (not e!190057))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301045 (= res!158795 (validKeyInArray!0 k!2441))))

(declare-fun b!301046 () Bool)

(assert (=> b!301046 (= e!190057 (and (bvslt #b00000000000000000000000000000000 (size!7550 a!3293)) (bvsge (size!7550 a!3293) #b01111111111111111111111111111111)))))

(assert (= (and start!29978 res!158796) b!301044))

(assert (= (and b!301044 res!158794) b!301045))

(assert (= (and b!301045 res!158795) b!301046))

(declare-fun m!312939 () Bool)

(assert (=> start!29978 m!312939))

(declare-fun m!312941 () Bool)

(assert (=> start!29978 m!312941))

(declare-fun m!312943 () Bool)

(assert (=> b!301045 m!312943))

(push 1)

(assert (not b!301045))

(assert (not start!29978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

