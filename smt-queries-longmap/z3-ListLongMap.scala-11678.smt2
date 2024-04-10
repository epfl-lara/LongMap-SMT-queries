; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136620 () Bool)

(assert start!136620)

(declare-fun b!1578102 () Bool)

(declare-fun res!1078152 () Bool)

(declare-fun e!880207 () Bool)

(assert (=> b!1578102 (=> (not res!1078152) (not e!880207))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105682 0))(
  ( (array!105683 (arr!50954 (Array (_ BitVec 32) (_ BitVec 64))) (size!51504 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105682)

(declare-fun x!466 () (_ BitVec 32))

(assert (=> b!1578102 (= res!1078152 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51504 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50954 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578103 () Bool)

(declare-fun res!1078150 () Bool)

(assert (=> b!1578103 (=> (not res!1078150) (not e!880207))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578103 (= res!1078150 (validKeyInArray!0 k0!772))))

(declare-fun res!1078149 () Bool)

(assert (=> start!136620 (=> (not res!1078149) (not e!880207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136620 (= res!1078149 (validMask!0 mask!918))))

(assert (=> start!136620 e!880207))

(assert (=> start!136620 true))

(declare-fun array_inv!39681 (array!105682) Bool)

(assert (=> start!136620 (array_inv!39681 _keys!614)))

(declare-fun b!1578105 () Bool)

(assert (=> b!1578105 (= e!880207 false)))

(declare-fun lt!676195 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578105 (= lt!676195 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578104 () Bool)

(declare-fun res!1078151 () Bool)

(assert (=> b!1578104 (=> (not res!1078151) (not e!880207))))

(assert (=> b!1578104 (= res!1078151 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50954 _keys!614) ee!18) k0!772)) (not (= (select (arr!50954 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136620 res!1078149) b!1578102))

(assert (= (and b!1578102 res!1078152) b!1578103))

(assert (= (and b!1578103 res!1078150) b!1578104))

(assert (= (and b!1578104 res!1078151) b!1578105))

(declare-fun m!1450201 () Bool)

(assert (=> b!1578103 m!1450201))

(declare-fun m!1450203 () Bool)

(assert (=> b!1578105 m!1450203))

(declare-fun m!1450205 () Bool)

(assert (=> b!1578102 m!1450205))

(declare-fun m!1450207 () Bool)

(assert (=> start!136620 m!1450207))

(declare-fun m!1450209 () Bool)

(assert (=> start!136620 m!1450209))

(declare-fun m!1450211 () Bool)

(assert (=> b!1578104 m!1450211))

(check-sat (not b!1578105) (not start!136620) (not b!1578103))
