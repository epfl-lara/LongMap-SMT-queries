; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136642 () Bool)

(assert start!136642)

(declare-fun res!1078243 () Bool)

(declare-fun e!880273 () Bool)

(assert (=> start!136642 (=> (not res!1078243) (not e!880273))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136642 (= res!1078243 (validMask!0 mask!918))))

(assert (=> start!136642 e!880273))

(assert (=> start!136642 true))

(declare-datatypes ((array!105704 0))(
  ( (array!105705 (arr!50965 (Array (_ BitVec 32) (_ BitVec 64))) (size!51515 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105704)

(declare-fun array_inv!39692 (array!105704) Bool)

(assert (=> start!136642 (array_inv!39692 _keys!614)))

(declare-fun b!1578196 () Bool)

(declare-fun res!1078244 () Bool)

(assert (=> b!1578196 (=> (not res!1078244) (not e!880273))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578196 (= res!1078244 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51515 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50965 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578197 () Bool)

(declare-fun res!1078245 () Bool)

(assert (=> b!1578197 (=> (not res!1078245) (not e!880273))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578197 (= res!1078245 (validKeyInArray!0 k!772))))

(declare-fun b!1578198 () Bool)

(assert (=> b!1578198 (= e!880273 (bvsge ee!18 (size!51515 _keys!614)))))

(assert (= (and start!136642 res!1078243) b!1578196))

(assert (= (and b!1578196 res!1078244) b!1578197))

(assert (= (and b!1578197 res!1078245) b!1578198))

(declare-fun m!1450297 () Bool)

(assert (=> start!136642 m!1450297))

(declare-fun m!1450299 () Bool)

(assert (=> start!136642 m!1450299))

(declare-fun m!1450301 () Bool)

(assert (=> b!1578196 m!1450301))

(declare-fun m!1450303 () Bool)

(assert (=> b!1578197 m!1450303))

(push 1)

(assert (not b!1578197))

(assert (not start!136642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

