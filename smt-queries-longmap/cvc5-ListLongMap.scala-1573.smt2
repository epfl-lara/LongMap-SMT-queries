; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29974 () Bool)

(assert start!29974)

(declare-fun res!158776 () Bool)

(declare-fun e!190045 () Bool)

(assert (=> start!29974 (=> (not res!158776) (not e!190045))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29974 (= res!158776 (validMask!0 mask!3709))))

(assert (=> start!29974 e!190045))

(assert (=> start!29974 true))

(declare-datatypes ((array!15207 0))(
  ( (array!15208 (arr!7196 (Array (_ BitVec 32) (_ BitVec 64))) (size!7548 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15207)

(declare-fun array_inv!5159 (array!15207) Bool)

(assert (=> start!29974 (array_inv!5159 a!3293)))

(declare-fun b!301026 () Bool)

(declare-fun res!158777 () Bool)

(assert (=> b!301026 (=> (not res!158777) (not e!190045))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301026 (= res!158777 (and (= (size!7548 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7548 a!3293))))))

(declare-fun b!301027 () Bool)

(declare-fun res!158778 () Bool)

(assert (=> b!301027 (=> (not res!158778) (not e!190045))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301027 (= res!158778 (validKeyInArray!0 k!2441))))

(declare-fun b!301028 () Bool)

(assert (=> b!301028 (= e!190045 (and (bvslt #b00000000000000000000000000000000 (size!7548 a!3293)) (bvsge (size!7548 a!3293) #b01111111111111111111111111111111)))))

(assert (= (and start!29974 res!158776) b!301026))

(assert (= (and b!301026 res!158777) b!301027))

(assert (= (and b!301027 res!158778) b!301028))

(declare-fun m!312927 () Bool)

(assert (=> start!29974 m!312927))

(declare-fun m!312929 () Bool)

(assert (=> start!29974 m!312929))

(declare-fun m!312931 () Bool)

(assert (=> b!301027 m!312931))

(push 1)

(assert (not b!301027))

(assert (not start!29974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

