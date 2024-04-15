; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136340 () Bool)

(assert start!136340)

(declare-fun res!1077360 () Bool)

(declare-fun e!879529 () Bool)

(assert (=> start!136340 (=> (not res!1077360) (not e!879529))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136340 (= res!1077360 (validMask!0 mask!910))))

(assert (=> start!136340 e!879529))

(assert (=> start!136340 true))

(declare-datatypes ((array!105498 0))(
  ( (array!105499 (arr!50869 (Array (_ BitVec 32) (_ BitVec 64))) (size!51421 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105498)

(declare-fun array_inv!39805 (array!105498) Bool)

(assert (=> start!136340 (array_inv!39805 _keys!610)))

(declare-fun b!1576910 () Bool)

(declare-fun res!1077357 () Bool)

(assert (=> b!1576910 (=> (not res!1077357) (not e!879529))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun x!458 () (_ BitVec 32))

(assert (=> b!1576910 (= res!1077357 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51421 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1576912 () Bool)

(declare-fun res!1077359 () Bool)

(assert (=> b!1576912 (=> (not res!1077359) (not e!879529))))

(declare-fun k!768 () (_ BitVec 64))

(assert (=> b!1576912 (= res!1077359 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50869 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50869 _keys!610) ee!12) (select (arr!50869 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1576913 () Bool)

(assert (=> b!1576913 (= e!879529 false)))

(declare-fun lt!675687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576913 (= lt!675687 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1576911 () Bool)

(declare-fun res!1077358 () Bool)

(assert (=> b!1576911 (=> (not res!1077358) (not e!879529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576911 (= res!1077358 (validKeyInArray!0 k!768))))

(assert (= (and start!136340 res!1077360) b!1576910))

(assert (= (and b!1576910 res!1077357) b!1576911))

(assert (= (and b!1576911 res!1077358) b!1576912))

(assert (= (and b!1576912 res!1077359) b!1576913))

(declare-fun m!1448639 () Bool)

(assert (=> start!136340 m!1448639))

(declare-fun m!1448641 () Bool)

(assert (=> start!136340 m!1448641))

(declare-fun m!1448643 () Bool)

(assert (=> b!1576912 m!1448643))

(declare-fun m!1448645 () Bool)

(assert (=> b!1576913 m!1448645))

(declare-fun m!1448647 () Bool)

(assert (=> b!1576911 m!1448647))

(push 1)

(assert (not start!136340))

(assert (not b!1576911))

(assert (not b!1576913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

