; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136616 () Bool)

(assert start!136616)

(declare-fun res!1078126 () Bool)

(declare-fun e!880196 () Bool)

(assert (=> start!136616 (=> (not res!1078126) (not e!880196))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136616 (= res!1078126 (validMask!0 mask!918))))

(assert (=> start!136616 e!880196))

(assert (=> start!136616 true))

(declare-datatypes ((array!105678 0))(
  ( (array!105679 (arr!50952 (Array (_ BitVec 32) (_ BitVec 64))) (size!51502 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105678)

(declare-fun array_inv!39679 (array!105678) Bool)

(assert (=> start!136616 (array_inv!39679 _keys!614)))

(declare-fun b!1578080 () Bool)

(declare-fun res!1078128 () Bool)

(assert (=> b!1578080 (=> (not res!1078128) (not e!880196))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578080 (= res!1078128 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50952 _keys!614) ee!18) k!772)) (not (= (select (arr!50952 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578079 () Bool)

(declare-fun res!1078125 () Bool)

(assert (=> b!1578079 (=> (not res!1078125) (not e!880196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578079 (= res!1078125 (validKeyInArray!0 k!772))))

(declare-fun b!1578081 () Bool)

(assert (=> b!1578081 (= e!880196 false)))

(declare-fun lt!676189 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578081 (= lt!676189 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578078 () Bool)

(declare-fun res!1078127 () Bool)

(assert (=> b!1578078 (=> (not res!1078127) (not e!880196))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578078 (= res!1078127 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51502 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50952 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136616 res!1078126) b!1578078))

(assert (= (and b!1578078 res!1078127) b!1578079))

(assert (= (and b!1578079 res!1078125) b!1578080))

(assert (= (and b!1578080 res!1078128) b!1578081))

(declare-fun m!1450177 () Bool)

(assert (=> b!1578078 m!1450177))

(declare-fun m!1450179 () Bool)

(assert (=> b!1578080 m!1450179))

(declare-fun m!1450181 () Bool)

(assert (=> start!136616 m!1450181))

(declare-fun m!1450183 () Bool)

(assert (=> start!136616 m!1450183))

(declare-fun m!1450185 () Bool)

(assert (=> b!1578081 m!1450185))

(declare-fun m!1450187 () Bool)

(assert (=> b!1578079 m!1450187))

(push 1)

(assert (not b!1578081))

(assert (not start!136616))

(assert (not b!1578079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

