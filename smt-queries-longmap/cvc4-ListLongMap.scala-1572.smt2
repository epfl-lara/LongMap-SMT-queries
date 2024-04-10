; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29972 () Bool)

(assert start!29972)

(declare-fun res!158768 () Bool)

(declare-fun e!190039 () Bool)

(assert (=> start!29972 (=> (not res!158768) (not e!190039))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29972 (= res!158768 (validMask!0 mask!3709))))

(assert (=> start!29972 e!190039))

(assert (=> start!29972 true))

(declare-datatypes ((array!15205 0))(
  ( (array!15206 (arr!7195 (Array (_ BitVec 32) (_ BitVec 64))) (size!7547 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15205)

(declare-fun array_inv!5158 (array!15205) Bool)

(assert (=> start!29972 (array_inv!5158 a!3293)))

(declare-fun b!301017 () Bool)

(declare-fun res!158767 () Bool)

(assert (=> b!301017 (=> (not res!158767) (not e!190039))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301017 (= res!158767 (and (= (size!7547 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7547 a!3293))))))

(declare-fun b!301018 () Bool)

(declare-fun res!158769 () Bool)

(assert (=> b!301018 (=> (not res!158769) (not e!190039))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301018 (= res!158769 (validKeyInArray!0 k!2441))))

(declare-fun b!301019 () Bool)

(assert (=> b!301019 (= e!190039 (bvsge #b00000000000000000000000000000000 (size!7547 a!3293)))))

(assert (= (and start!29972 res!158768) b!301017))

(assert (= (and b!301017 res!158767) b!301018))

(assert (= (and b!301018 res!158769) b!301019))

(declare-fun m!312921 () Bool)

(assert (=> start!29972 m!312921))

(declare-fun m!312923 () Bool)

(assert (=> start!29972 m!312923))

(declare-fun m!312925 () Bool)

(assert (=> b!301018 m!312925))

(push 1)

(assert (not b!301018))

(assert (not start!29972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

