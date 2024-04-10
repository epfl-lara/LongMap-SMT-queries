; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136622 () Bool)

(assert start!136622)

(declare-fun b!1578114 () Bool)

(declare-fun res!1078164 () Bool)

(declare-fun e!880213 () Bool)

(assert (=> b!1578114 (=> (not res!1078164) (not e!880213))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105684 0))(
  ( (array!105685 (arr!50955 (Array (_ BitVec 32) (_ BitVec 64))) (size!51505 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105684)

(assert (=> b!1578114 (= res!1078164 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51505 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50955 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578117 () Bool)

(assert (=> b!1578117 (= e!880213 false)))

(declare-fun lt!676198 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578117 (= lt!676198 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun res!1078161 () Bool)

(assert (=> start!136622 (=> (not res!1078161) (not e!880213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136622 (= res!1078161 (validMask!0 mask!918))))

(assert (=> start!136622 e!880213))

(assert (=> start!136622 true))

(declare-fun array_inv!39682 (array!105684) Bool)

(assert (=> start!136622 (array_inv!39682 _keys!614)))

(declare-fun b!1578115 () Bool)

(declare-fun res!1078162 () Bool)

(assert (=> b!1578115 (=> (not res!1078162) (not e!880213))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578115 (= res!1078162 (validKeyInArray!0 k!772))))

(declare-fun b!1578116 () Bool)

(declare-fun res!1078163 () Bool)

(assert (=> b!1578116 (=> (not res!1078163) (not e!880213))))

(assert (=> b!1578116 (= res!1078163 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50955 _keys!614) ee!18) k!772)) (not (= (select (arr!50955 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136622 res!1078161) b!1578114))

(assert (= (and b!1578114 res!1078164) b!1578115))

(assert (= (and b!1578115 res!1078162) b!1578116))

(assert (= (and b!1578116 res!1078163) b!1578117))

(declare-fun m!1450213 () Bool)

(assert (=> b!1578114 m!1450213))

(declare-fun m!1450215 () Bool)

(assert (=> b!1578117 m!1450215))

(declare-fun m!1450217 () Bool)

(assert (=> start!136622 m!1450217))

(declare-fun m!1450219 () Bool)

(assert (=> start!136622 m!1450219))

(declare-fun m!1450221 () Bool)

(assert (=> b!1578116 m!1450221))

(declare-fun m!1450223 () Bool)

(assert (=> b!1578115 m!1450223))

(push 1)

(assert (not b!1578115))

(assert (not b!1578117))

(assert (not start!136622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

