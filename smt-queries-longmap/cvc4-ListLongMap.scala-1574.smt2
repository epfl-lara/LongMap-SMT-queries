; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29998 () Bool)

(assert start!29998)

(declare-fun res!158830 () Bool)

(declare-fun e!190075 () Bool)

(assert (=> start!29998 (=> (not res!158830) (not e!190075))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29998 (= res!158830 (validMask!0 mask!3709))))

(assert (=> start!29998 e!190075))

(assert (=> start!29998 true))

(declare-datatypes ((array!15218 0))(
  ( (array!15219 (arr!7201 (Array (_ BitVec 32) (_ BitVec 64))) (size!7553 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15218)

(declare-fun array_inv!5164 (array!15218) Bool)

(assert (=> start!29998 (array_inv!5164 a!3293)))

(declare-fun b!301080 () Bool)

(declare-fun res!158832 () Bool)

(assert (=> b!301080 (=> (not res!158832) (not e!190075))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301080 (= res!158832 (validKeyInArray!0 k!2441))))

(declare-fun b!301079 () Bool)

(declare-fun res!158829 () Bool)

(assert (=> b!301079 (=> (not res!158829) (not e!190075))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301079 (= res!158829 (and (= (size!7553 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7553 a!3293))))))

(declare-fun b!301082 () Bool)

(assert (=> b!301082 (= e!190075 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun b!301081 () Bool)

(declare-fun res!158831 () Bool)

(assert (=> b!301081 (=> (not res!158831) (not e!190075))))

(declare-fun arrayContainsKey!0 (array!15218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301081 (= res!158831 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!29998 res!158830) b!301079))

(assert (= (and b!301079 res!158829) b!301080))

(assert (= (and b!301080 res!158832) b!301081))

(assert (= (and b!301081 res!158831) b!301082))

(declare-fun m!312961 () Bool)

(assert (=> start!29998 m!312961))

(declare-fun m!312963 () Bool)

(assert (=> start!29998 m!312963))

(declare-fun m!312965 () Bool)

(assert (=> b!301080 m!312965))

(declare-fun m!312967 () Bool)

(assert (=> b!301081 m!312967))

(push 1)

