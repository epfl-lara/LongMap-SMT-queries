; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29994 () Bool)

(assert start!29994)

(declare-fun res!158807 () Bool)

(declare-fun e!190063 () Bool)

(assert (=> start!29994 (=> (not res!158807) (not e!190063))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29994 (= res!158807 (validMask!0 mask!3709))))

(assert (=> start!29994 e!190063))

(assert (=> start!29994 true))

(declare-datatypes ((array!15214 0))(
  ( (array!15215 (arr!7199 (Array (_ BitVec 32) (_ BitVec 64))) (size!7551 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15214)

(declare-fun array_inv!5162 (array!15214) Bool)

(assert (=> start!29994 (array_inv!5162 a!3293)))

(declare-fun b!301058 () Bool)

(assert (=> b!301058 (= e!190063 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun b!301057 () Bool)

(declare-fun res!158808 () Bool)

(assert (=> b!301057 (=> (not res!158808) (not e!190063))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301057 (= res!158808 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301056 () Bool)

(declare-fun res!158806 () Bool)

(assert (=> b!301056 (=> (not res!158806) (not e!190063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301056 (= res!158806 (validKeyInArray!0 k!2441))))

(declare-fun b!301055 () Bool)

(declare-fun res!158805 () Bool)

(assert (=> b!301055 (=> (not res!158805) (not e!190063))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301055 (= res!158805 (and (= (size!7551 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7551 a!3293))))))

(assert (= (and start!29994 res!158807) b!301055))

(assert (= (and b!301055 res!158805) b!301056))

(assert (= (and b!301056 res!158806) b!301057))

(assert (= (and b!301057 res!158808) b!301058))

(declare-fun m!312945 () Bool)

(assert (=> start!29994 m!312945))

(declare-fun m!312947 () Bool)

(assert (=> start!29994 m!312947))

(declare-fun m!312949 () Bool)

(assert (=> b!301057 m!312949))

(declare-fun m!312951 () Bool)

(assert (=> b!301056 m!312951))

(push 1)

(assert (not b!301056))

(assert (not start!29994))

(assert (not b!301057))

(check-sat)

