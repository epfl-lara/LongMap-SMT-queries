; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137044 () Bool)

(assert start!137044)

(declare-fun res!1078982 () Bool)

(declare-fun e!881710 () Bool)

(assert (=> start!137044 (=> (not res!1078982) (not e!881710))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137044 (= res!1078982 (validMask!0 mask!918))))

(assert (=> start!137044 e!881710))

(assert (=> start!137044 true))

(declare-datatypes ((array!105806 0))(
  ( (array!105807 (arr!51007 (Array (_ BitVec 32) (_ BitVec 64))) (size!51558 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105806)

(declare-fun array_inv!39962 (array!105806) Bool)

(assert (=> start!137044 (array_inv!39962 _keys!614)))

(declare-fun b!1580509 () Bool)

(declare-fun res!1078979 () Bool)

(assert (=> b!1580509 (=> (not res!1078979) (not e!881710))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580509 (= res!1078979 (validKeyInArray!0 k0!772))))

(declare-fun b!1580508 () Bool)

(declare-fun res!1078981 () Bool)

(assert (=> b!1580508 (=> (not res!1078981) (not e!881710))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580508 (= res!1078981 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51558 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51007 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!677082 () (_ BitVec 32))

(declare-fun b!1580511 () Bool)

(assert (=> b!1580511 (= e!881710 (and (bvsge lt!677082 #b00000000000000000000000000000000) (bvslt lt!677082 (bvadd #b00000000000000000000000000000001 mask!918)) (bvslt (bvadd #b00000000000000000000000000000001 x!466) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580511 (= lt!677082 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun b!1580510 () Bool)

(declare-fun res!1078980 () Bool)

(assert (=> b!1580510 (=> (not res!1078980) (not e!881710))))

(assert (=> b!1580510 (= res!1078980 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51007 _keys!614) ee!18) k0!772)) (not (= (select (arr!51007 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!137044 res!1078982) b!1580508))

(assert (= (and b!1580508 res!1078981) b!1580509))

(assert (= (and b!1580509 res!1078979) b!1580510))

(assert (= (and b!1580510 res!1078980) b!1580511))

(declare-fun m!1452429 () Bool)

(assert (=> start!137044 m!1452429))

(declare-fun m!1452431 () Bool)

(assert (=> start!137044 m!1452431))

(declare-fun m!1452433 () Bool)

(assert (=> b!1580511 m!1452433))

(declare-fun m!1452435 () Bool)

(assert (=> b!1580510 m!1452435))

(declare-fun m!1452437 () Bool)

(assert (=> b!1580509 m!1452437))

(declare-fun m!1452439 () Bool)

(assert (=> b!1580508 m!1452439))

(check-sat (not b!1580511) (not start!137044) (not b!1580509))
(check-sat)
