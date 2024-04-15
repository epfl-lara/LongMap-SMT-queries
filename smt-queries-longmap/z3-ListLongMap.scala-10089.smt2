; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118868 () Bool)

(assert start!118868)

(declare-fun b!1388444 () Bool)

(declare-fun res!928781 () Bool)

(declare-fun e!786533 () Bool)

(assert (=> b!1388444 (=> (not res!928781) (not e!786533))))

(declare-datatypes ((array!94899 0))(
  ( (array!94900 (arr!45823 (Array (_ BitVec 32) (_ BitVec 64))) (size!46375 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94899)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388444 (= res!928781 (validKeyInArray!0 (select (arr!45823 a!2901) i!1037)))))

(declare-fun b!1388445 () Bool)

(declare-fun res!928783 () Bool)

(assert (=> b!1388445 (=> (not res!928783) (not e!786533))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388445 (= res!928783 (validKeyInArray!0 (select (arr!45823 a!2901) j!112)))))

(declare-fun res!928779 () Bool)

(assert (=> start!118868 (=> (not res!928779) (not e!786533))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118868 (= res!928779 (validMask!0 mask!2840))))

(assert (=> start!118868 e!786533))

(assert (=> start!118868 true))

(declare-fun array_inv!35056 (array!94899) Bool)

(assert (=> start!118868 (array_inv!35056 a!2901)))

(declare-fun b!1388446 () Bool)

(declare-fun res!928782 () Bool)

(assert (=> b!1388446 (=> (not res!928782) (not e!786533))))

(assert (=> b!1388446 (= res!928782 (and (= (size!46375 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46375 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46375 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388447 () Bool)

(assert (=> b!1388447 (= e!786533 (bvsgt #b00000000000000000000000000000000 (size!46375 a!2901)))))

(declare-fun b!1388448 () Bool)

(declare-fun res!928780 () Bool)

(assert (=> b!1388448 (=> (not res!928780) (not e!786533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94899 (_ BitVec 32)) Bool)

(assert (=> b!1388448 (= res!928780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!118868 res!928779) b!1388446))

(assert (= (and b!1388446 res!928782) b!1388444))

(assert (= (and b!1388444 res!928781) b!1388445))

(assert (= (and b!1388445 res!928783) b!1388448))

(assert (= (and b!1388448 res!928780) b!1388447))

(declare-fun m!1273741 () Bool)

(assert (=> b!1388444 m!1273741))

(assert (=> b!1388444 m!1273741))

(declare-fun m!1273743 () Bool)

(assert (=> b!1388444 m!1273743))

(declare-fun m!1273745 () Bool)

(assert (=> b!1388445 m!1273745))

(assert (=> b!1388445 m!1273745))

(declare-fun m!1273747 () Bool)

(assert (=> b!1388445 m!1273747))

(declare-fun m!1273749 () Bool)

(assert (=> start!118868 m!1273749))

(declare-fun m!1273751 () Bool)

(assert (=> start!118868 m!1273751))

(declare-fun m!1273753 () Bool)

(assert (=> b!1388448 m!1273753))

(check-sat (not b!1388444) (not start!118868) (not b!1388445) (not b!1388448))
(check-sat)
