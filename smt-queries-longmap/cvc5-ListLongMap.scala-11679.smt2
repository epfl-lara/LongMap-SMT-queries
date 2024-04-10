; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136624 () Bool)

(assert start!136624)

(declare-fun res!1078174 () Bool)

(declare-fun e!880219 () Bool)

(assert (=> start!136624 (=> (not res!1078174) (not e!880219))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136624 (= res!1078174 (validMask!0 mask!918))))

(assert (=> start!136624 e!880219))

(assert (=> start!136624 true))

(declare-datatypes ((array!105686 0))(
  ( (array!105687 (arr!50956 (Array (_ BitVec 32) (_ BitVec 64))) (size!51506 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105686)

(declare-fun array_inv!39683 (array!105686) Bool)

(assert (=> start!136624 (array_inv!39683 _keys!614)))

(declare-fun b!1578128 () Bool)

(declare-fun res!1078173 () Bool)

(assert (=> b!1578128 (=> (not res!1078173) (not e!880219))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578128 (= res!1078173 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50956 _keys!614) ee!18) k!772)) (not (= (select (arr!50956 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578127 () Bool)

(declare-fun res!1078176 () Bool)

(assert (=> b!1578127 (=> (not res!1078176) (not e!880219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578127 (= res!1078176 (validKeyInArray!0 k!772))))

(declare-fun b!1578129 () Bool)

(assert (=> b!1578129 (= e!880219 false)))

(declare-fun lt!676201 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578129 (= lt!676201 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578126 () Bool)

(declare-fun res!1078175 () Bool)

(assert (=> b!1578126 (=> (not res!1078175) (not e!880219))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578126 (= res!1078175 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51506 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50956 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136624 res!1078174) b!1578126))

(assert (= (and b!1578126 res!1078175) b!1578127))

(assert (= (and b!1578127 res!1078176) b!1578128))

(assert (= (and b!1578128 res!1078173) b!1578129))

(declare-fun m!1450225 () Bool)

(assert (=> b!1578129 m!1450225))

(declare-fun m!1450227 () Bool)

(assert (=> b!1578127 m!1450227))

(declare-fun m!1450229 () Bool)

(assert (=> b!1578126 m!1450229))

(declare-fun m!1450231 () Bool)

(assert (=> b!1578128 m!1450231))

(declare-fun m!1450233 () Bool)

(assert (=> start!136624 m!1450233))

(declare-fun m!1450235 () Bool)

(assert (=> start!136624 m!1450235))

(push 1)

(assert (not start!136624))

(assert (not b!1578127))

(assert (not b!1578129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

