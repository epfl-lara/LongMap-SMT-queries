; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136334 () Bool)

(assert start!136334)

(declare-fun b!1577118 () Bool)

(declare-fun e!879673 () Bool)

(assert (=> b!1577118 (= e!879673 false)))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun lt!675937 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577118 (= lt!675937 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577115 () Bool)

(declare-fun res!1077378 () Bool)

(assert (=> b!1577115 (=> (not res!1077378) (not e!879673))))

(declare-datatypes ((array!105546 0))(
  ( (array!105547 (arr!50895 (Array (_ BitVec 32) (_ BitVec 64))) (size!51445 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105546)

(assert (=> b!1577115 (= res!1077378 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51445 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077380 () Bool)

(assert (=> start!136334 (=> (not res!1077380) (not e!879673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136334 (= res!1077380 (validMask!0 mask!910))))

(assert (=> start!136334 e!879673))

(assert (=> start!136334 true))

(declare-fun array_inv!39622 (array!105546) Bool)

(assert (=> start!136334 (array_inv!39622 _keys!610)))

(declare-fun b!1577117 () Bool)

(declare-fun res!1077381 () Bool)

(assert (=> b!1577117 (=> (not res!1077381) (not e!879673))))

(declare-fun k!768 () (_ BitVec 64))

(assert (=> b!1577117 (= res!1077381 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50895 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50895 _keys!610) ee!12) (select (arr!50895 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577116 () Bool)

(declare-fun res!1077379 () Bool)

(assert (=> b!1577116 (=> (not res!1077379) (not e!879673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577116 (= res!1077379 (validKeyInArray!0 k!768))))

(assert (= (and start!136334 res!1077380) b!1577115))

(assert (= (and b!1577115 res!1077378) b!1577116))

(assert (= (and b!1577116 res!1077379) b!1577117))

(assert (= (and b!1577117 res!1077381) b!1577118))

(declare-fun m!1449435 () Bool)

(assert (=> b!1577118 m!1449435))

(declare-fun m!1449437 () Bool)

(assert (=> start!136334 m!1449437))

(declare-fun m!1449439 () Bool)

(assert (=> start!136334 m!1449439))

(declare-fun m!1449441 () Bool)

(assert (=> b!1577117 m!1449441))

(declare-fun m!1449443 () Bool)

(assert (=> b!1577116 m!1449443))

(push 1)

(assert (not b!1577118))

(assert (not start!136334))

(assert (not b!1577116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

