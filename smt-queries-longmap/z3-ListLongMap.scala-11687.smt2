; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137098 () Bool)

(assert start!137098)

(declare-fun b!1580770 () Bool)

(declare-fun res!1079242 () Bool)

(declare-fun e!881872 () Bool)

(assert (=> b!1580770 (=> (not res!1079242) (not e!881872))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580770 (= res!1079242 (validKeyInArray!0 k0!772))))

(declare-fun b!1580772 () Bool)

(declare-fun x!466 () (_ BitVec 32))

(assert (=> b!1580772 (= e!881872 (bvsge (bvsub #b01111111111111111111111111111111 (bvadd #b00000000000000000000000000000001 x!466)) (bvsub #b01111111111111111111111111111111 x!466)))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun lt!677118 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580772 (= lt!677118 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun res!1079241 () Bool)

(assert (=> start!137098 (=> (not res!1079241) (not e!881872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137098 (= res!1079241 (validMask!0 mask!918))))

(assert (=> start!137098 e!881872))

(assert (=> start!137098 true))

(declare-datatypes ((array!105860 0))(
  ( (array!105861 (arr!51034 (Array (_ BitVec 32) (_ BitVec 64))) (size!51585 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105860)

(declare-fun array_inv!39989 (array!105860) Bool)

(assert (=> start!137098 (array_inv!39989 _keys!614)))

(declare-fun b!1580769 () Bool)

(declare-fun res!1079240 () Bool)

(assert (=> b!1580769 (=> (not res!1079240) (not e!881872))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1580769 (= res!1079240 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51585 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51034 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580771 () Bool)

(declare-fun res!1079243 () Bool)

(assert (=> b!1580771 (=> (not res!1079243) (not e!881872))))

(assert (=> b!1580771 (= res!1079243 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51034 _keys!614) ee!18) k0!772)) (not (= (select (arr!51034 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!137098 res!1079241) b!1580769))

(assert (= (and b!1580769 res!1079240) b!1580770))

(assert (= (and b!1580770 res!1079242) b!1580771))

(assert (= (and b!1580771 res!1079243) b!1580772))

(declare-fun m!1452693 () Bool)

(assert (=> b!1580770 m!1452693))

(declare-fun m!1452695 () Bool)

(assert (=> b!1580769 m!1452695))

(declare-fun m!1452697 () Bool)

(assert (=> b!1580772 m!1452697))

(declare-fun m!1452699 () Bool)

(assert (=> b!1580771 m!1452699))

(declare-fun m!1452701 () Bool)

(assert (=> start!137098 m!1452701))

(declare-fun m!1452703 () Bool)

(assert (=> start!137098 m!1452703))

(check-sat (not b!1580770) (not start!137098) (not b!1580772))
(check-sat)
