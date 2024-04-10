; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136330 () Bool)

(assert start!136330)

(declare-fun b!1577094 () Bool)

(declare-fun e!879661 () Bool)

(assert (=> b!1577094 (= e!879661 false)))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun lt!675931 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577094 (= lt!675931 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun res!1077355 () Bool)

(assert (=> start!136330 (=> (not res!1077355) (not e!879661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136330 (= res!1077355 (validMask!0 mask!910))))

(assert (=> start!136330 e!879661))

(assert (=> start!136330 true))

(declare-datatypes ((array!105542 0))(
  ( (array!105543 (arr!50893 (Array (_ BitVec 32) (_ BitVec 64))) (size!51443 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105542)

(declare-fun array_inv!39620 (array!105542) Bool)

(assert (=> start!136330 (array_inv!39620 _keys!610)))

(declare-fun b!1577091 () Bool)

(declare-fun res!1077357 () Bool)

(assert (=> b!1577091 (=> (not res!1077357) (not e!879661))))

(assert (=> b!1577091 (= res!1077357 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51443 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577092 () Bool)

(declare-fun res!1077356 () Bool)

(assert (=> b!1577092 (=> (not res!1077356) (not e!879661))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577092 (= res!1077356 (validKeyInArray!0 k!768))))

(declare-fun b!1577093 () Bool)

(declare-fun res!1077354 () Bool)

(assert (=> b!1577093 (=> (not res!1077354) (not e!879661))))

(assert (=> b!1577093 (= res!1077354 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50893 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50893 _keys!610) ee!12) (select (arr!50893 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136330 res!1077355) b!1577091))

(assert (= (and b!1577091 res!1077357) b!1577092))

(assert (= (and b!1577092 res!1077356) b!1577093))

(assert (= (and b!1577093 res!1077354) b!1577094))

(declare-fun m!1449415 () Bool)

(assert (=> b!1577094 m!1449415))

(declare-fun m!1449417 () Bool)

(assert (=> start!136330 m!1449417))

(declare-fun m!1449419 () Bool)

(assert (=> start!136330 m!1449419))

(declare-fun m!1449421 () Bool)

(assert (=> b!1577092 m!1449421))

(declare-fun m!1449423 () Bool)

(assert (=> b!1577093 m!1449423))

(push 1)

(assert (not start!136330))

(assert (not b!1577092))

(assert (not b!1577094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

