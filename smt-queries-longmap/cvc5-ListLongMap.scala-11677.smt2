; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136580 () Bool)

(assert start!136580)

(declare-fun b!1577768 () Bool)

(declare-fun e!879997 () Bool)

(assert (=> b!1577768 (= e!879997 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun lt!675903 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577768 (= lt!675903 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1577767 () Bool)

(declare-fun res!1077998 () Bool)

(assert (=> b!1577767 (=> (not res!1077998) (not e!879997))))

(declare-fun k!772 () (_ BitVec 64))

(declare-datatypes ((array!105609 0))(
  ( (array!105610 (arr!50917 (Array (_ BitVec 32) (_ BitVec 64))) (size!51469 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105609)

(assert (=> b!1577767 (= res!1077998 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50917 _keys!614) ee!18) k!772)) (not (= (select (arr!50917 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577766 () Bool)

(declare-fun res!1077999 () Bool)

(assert (=> b!1577766 (=> (not res!1077999) (not e!879997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577766 (= res!1077999 (validKeyInArray!0 k!772))))

(declare-fun res!1077996 () Bool)

(assert (=> start!136580 (=> (not res!1077996) (not e!879997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136580 (= res!1077996 (validMask!0 mask!918))))

(assert (=> start!136580 e!879997))

(assert (=> start!136580 true))

(declare-fun array_inv!39853 (array!105609) Bool)

(assert (=> start!136580 (array_inv!39853 _keys!614)))

(declare-fun b!1577765 () Bool)

(declare-fun res!1077997 () Bool)

(assert (=> b!1577765 (=> (not res!1077997) (not e!879997))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577765 (= res!1077997 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51469 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50917 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136580 res!1077996) b!1577765))

(assert (= (and b!1577765 res!1077997) b!1577766))

(assert (= (and b!1577766 res!1077999) b!1577767))

(assert (= (and b!1577767 res!1077998) b!1577768))

(declare-fun m!1449285 () Bool)

(assert (=> b!1577766 m!1449285))

(declare-fun m!1449287 () Bool)

(assert (=> b!1577768 m!1449287))

(declare-fun m!1449289 () Bool)

(assert (=> b!1577767 m!1449289))

(declare-fun m!1449291 () Bool)

(assert (=> b!1577765 m!1449291))

(declare-fun m!1449293 () Bool)

(assert (=> start!136580 m!1449293))

(declare-fun m!1449295 () Bool)

(assert (=> start!136580 m!1449295))

(push 1)

(assert (not start!136580))

(assert (not b!1577766))

(assert (not b!1577768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

