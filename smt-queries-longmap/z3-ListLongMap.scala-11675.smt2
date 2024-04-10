; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136578 () Bool)

(assert start!136578)

(declare-fun res!1078043 () Bool)

(declare-fun e!880153 () Bool)

(assert (=> start!136578 (=> (not res!1078043) (not e!880153))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136578 (= res!1078043 (validMask!0 mask!918))))

(assert (=> start!136578 e!880153))

(assert (=> start!136578 true))

(declare-datatypes ((array!105661 0))(
  ( (array!105662 (arr!50945 (Array (_ BitVec 32) (_ BitVec 64))) (size!51495 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105661)

(declare-fun array_inv!39672 (array!105661) Bool)

(assert (=> start!136578 (array_inv!39672 _keys!614)))

(declare-fun b!1577994 () Bool)

(declare-fun res!1078041 () Bool)

(assert (=> b!1577994 (=> (not res!1078041) (not e!880153))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577994 (= res!1078041 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51495 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50945 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577997 () Bool)

(declare-fun lt!676159 () (_ BitVec 32))

(assert (=> b!1577997 (= e!880153 (or (bvslt lt!676159 #b00000000000000000000000000000000) (bvsge lt!676159 (bvadd #b00000000000000000000000000000001 mask!918))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577997 (= lt!676159 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1577995 () Bool)

(declare-fun res!1078042 () Bool)

(assert (=> b!1577995 (=> (not res!1078042) (not e!880153))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577995 (= res!1078042 (validKeyInArray!0 k0!772))))

(declare-fun b!1577996 () Bool)

(declare-fun res!1078044 () Bool)

(assert (=> b!1577996 (=> (not res!1078044) (not e!880153))))

(assert (=> b!1577996 (= res!1078044 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50945 _keys!614) ee!18) k0!772)) (not (= (select (arr!50945 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136578 res!1078043) b!1577994))

(assert (= (and b!1577994 res!1078041) b!1577995))

(assert (= (and b!1577995 res!1078042) b!1577996))

(assert (= (and b!1577996 res!1078044) b!1577997))

(declare-fun m!1450087 () Bool)

(assert (=> b!1577996 m!1450087))

(declare-fun m!1450089 () Bool)

(assert (=> b!1577994 m!1450089))

(declare-fun m!1450091 () Bool)

(assert (=> b!1577997 m!1450091))

(declare-fun m!1450093 () Bool)

(assert (=> b!1577995 m!1450093))

(declare-fun m!1450095 () Bool)

(assert (=> start!136578 m!1450095))

(declare-fun m!1450097 () Bool)

(assert (=> start!136578 m!1450097))

(check-sat (not b!1577995) (not start!136578) (not b!1577997))
(check-sat)
(get-model)

(declare-fun d!165997 () Bool)

(assert (=> d!165997 (= (validKeyInArray!0 k0!772) (and (not (= k0!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577995 d!165997))

(declare-fun d!165999 () Bool)

(assert (=> d!165999 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136578 d!165999))

(declare-fun d!166001 () Bool)

(assert (=> d!166001 (= (array_inv!39672 _keys!614) (bvsge (size!51495 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136578 d!166001))

(declare-fun d!166003 () Bool)

(declare-fun lt!676167 () (_ BitVec 32))

(assert (=> d!166003 (and (bvsge lt!676167 #b00000000000000000000000000000000) (bvslt lt!676167 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166003 (= lt!676167 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!166003 (validMask!0 mask!918)))

(assert (=> d!166003 (= (nextIndex!0 ee!18 x!466 mask!918) lt!676167)))

(declare-fun bs!45616 () Bool)

(assert (= bs!45616 d!166003))

(declare-fun m!1450111 () Bool)

(assert (=> bs!45616 m!1450111))

(assert (=> bs!45616 m!1450095))

(assert (=> b!1577997 d!166003))

(check-sat (not d!166003))
(check-sat)
