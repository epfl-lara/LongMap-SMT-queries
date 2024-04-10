; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136402 () Bool)

(assert start!136402)

(declare-fun res!1077606 () Bool)

(declare-fun e!879806 () Bool)

(assert (=> start!136402 (=> (not res!1077606) (not e!879806))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136402 (= res!1077606 (validMask!0 mask!910))))

(assert (=> start!136402 e!879806))

(assert (=> start!136402 true))

(declare-datatypes ((array!105593 0))(
  ( (array!105594 (arr!50917 (Array (_ BitVec 32) (_ BitVec 64))) (size!51467 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105593)

(declare-fun array_inv!39644 (array!105593) Bool)

(assert (=> start!136402 (array_inv!39644 _keys!610)))

(declare-fun b!1577341 () Bool)

(declare-fun res!1077604 () Bool)

(assert (=> b!1577341 (=> (not res!1077604) (not e!879806))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun x!458 () (_ BitVec 32))

(assert (=> b!1577341 (= res!1077604 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51467 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577342 () Bool)

(declare-fun res!1077605 () Bool)

(assert (=> b!1577342 (=> (not res!1077605) (not e!879806))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577342 (= res!1077605 (validKeyInArray!0 k!768))))

(declare-fun b!1577343 () Bool)

(assert (=> b!1577343 (= e!879806 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50917 _keys!610) ee!12) k!768) (= (bvadd (select (arr!50917 _keys!610) ee!12) (select (arr!50917 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50917 _keys!610) ee!12) k!768)) (not (= (select (arr!50917 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50917 _keys!610) ee!12) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136402 res!1077606) b!1577341))

(assert (= (and b!1577341 res!1077604) b!1577342))

(assert (= (and b!1577342 res!1077605) b!1577343))

(declare-fun m!1449631 () Bool)

(assert (=> start!136402 m!1449631))

(declare-fun m!1449633 () Bool)

(assert (=> start!136402 m!1449633))

(declare-fun m!1449635 () Bool)

(assert (=> b!1577342 m!1449635))

(declare-fun m!1449637 () Bool)

(assert (=> b!1577343 m!1449637))

(push 1)

(assert (not b!1577342))

(assert (not start!136402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

