; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136576 () Bool)

(assert start!136576)

(declare-fun b!1577983 () Bool)

(declare-fun res!1078030 () Bool)

(declare-fun e!880148 () Bool)

(assert (=> b!1577983 (=> (not res!1078030) (not e!880148))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577983 (= res!1078030 (validKeyInArray!0 k!772))))

(declare-fun b!1577982 () Bool)

(declare-fun res!1078031 () Bool)

(assert (=> b!1577982 (=> (not res!1078031) (not e!880148))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105659 0))(
  ( (array!105660 (arr!50944 (Array (_ BitVec 32) (_ BitVec 64))) (size!51494 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105659)

(declare-fun mask!918 () (_ BitVec 32))

(assert (=> b!1577982 (= res!1078031 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51494 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50944 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577984 () Bool)

(declare-fun res!1078032 () Bool)

(assert (=> b!1577984 (=> (not res!1078032) (not e!880148))))

(assert (=> b!1577984 (= res!1078032 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50944 _keys!614) ee!18) k!772)) (not (= (select (arr!50944 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078029 () Bool)

(assert (=> start!136576 (=> (not res!1078029) (not e!880148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136576 (= res!1078029 (validMask!0 mask!918))))

(assert (=> start!136576 e!880148))

(assert (=> start!136576 true))

(declare-fun array_inv!39671 (array!105659) Bool)

(assert (=> start!136576 (array_inv!39671 _keys!614)))

(declare-fun b!1577985 () Bool)

(declare-fun lt!676156 () (_ BitVec 32))

(assert (=> b!1577985 (= e!880148 (or (bvslt lt!676156 #b00000000000000000000000000000000) (bvsge lt!676156 (bvadd #b00000000000000000000000000000001 mask!918))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577985 (= lt!676156 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136576 res!1078029) b!1577982))

(assert (= (and b!1577982 res!1078031) b!1577983))

(assert (= (and b!1577983 res!1078030) b!1577984))

(assert (= (and b!1577984 res!1078032) b!1577985))

(declare-fun m!1450075 () Bool)

(assert (=> b!1577983 m!1450075))

(declare-fun m!1450077 () Bool)

(assert (=> b!1577982 m!1450077))

(declare-fun m!1450079 () Bool)

(assert (=> b!1577984 m!1450079))

(declare-fun m!1450081 () Bool)

(assert (=> start!136576 m!1450081))

(declare-fun m!1450083 () Bool)

(assert (=> start!136576 m!1450083))

(declare-fun m!1450085 () Bool)

(assert (=> b!1577985 m!1450085))

(push 1)

(assert (not b!1577985))

(assert (not b!1577983))

(assert (not start!136576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166005 () Bool)

(declare-fun lt!676168 () (_ BitVec 32))

(assert (=> d!166005 (and (bvsge lt!676168 #b00000000000000000000000000000000) (bvslt lt!676168 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166005 (= lt!676168 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!166005 (validMask!0 mask!918)))

(assert (=> d!166005 (= (nextIndex!0 ee!18 x!466 mask!918) lt!676168)))

(declare-fun bs!45617 () Bool)

(assert (= bs!45617 d!166005))

(declare-fun m!1450113 () Bool)

(assert (=> bs!45617 m!1450113))

(assert (=> bs!45617 m!1450081))

(assert (=> b!1577985 d!166005))

(declare-fun d!166007 () Bool)

(assert (=> d!166007 (= (validKeyInArray!0 k!772) (and (not (= k!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577983 d!166007))

(declare-fun d!166009 () Bool)

(assert (=> d!166009 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136576 d!166009))

(declare-fun d!166015 () Bool)

(assert (=> d!166015 (= (array_inv!39671 _keys!614) (bvsge (size!51494 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136576 d!166015))

(push 1)

(assert (not d!166005))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

