; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118862 () Bool)

(assert start!118862)

(declare-fun res!928743 () Bool)

(declare-fun e!786515 () Bool)

(assert (=> start!118862 (=> (not res!928743) (not e!786515))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118862 (= res!928743 (validMask!0 mask!2840))))

(assert (=> start!118862 e!786515))

(assert (=> start!118862 true))

(declare-datatypes ((array!94893 0))(
  ( (array!94894 (arr!45820 (Array (_ BitVec 32) (_ BitVec 64))) (size!46372 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94893)

(declare-fun array_inv!35053 (array!94893) Bool)

(assert (=> start!118862 (array_inv!35053 a!2901)))

(declare-fun b!1388406 () Bool)

(declare-fun res!928744 () Bool)

(assert (=> b!1388406 (=> (not res!928744) (not e!786515))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388406 (= res!928744 (and (= (size!46372 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46372 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46372 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388408 () Bool)

(declare-fun res!928741 () Bool)

(assert (=> b!1388408 (=> (not res!928741) (not e!786515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388408 (= res!928741 (validKeyInArray!0 (select (arr!45820 a!2901) j!112)))))

(declare-fun b!1388407 () Bool)

(declare-fun res!928742 () Bool)

(assert (=> b!1388407 (=> (not res!928742) (not e!786515))))

(assert (=> b!1388407 (= res!928742 (validKeyInArray!0 (select (arr!45820 a!2901) i!1037)))))

(declare-fun b!1388409 () Bool)

(assert (=> b!1388409 (= e!786515 (bvsgt #b00000000000000000000000000000000 (size!46372 a!2901)))))

(assert (= (and start!118862 res!928743) b!1388406))

(assert (= (and b!1388406 res!928744) b!1388407))

(assert (= (and b!1388407 res!928742) b!1388408))

(assert (= (and b!1388408 res!928741) b!1388409))

(declare-fun m!1273705 () Bool)

(assert (=> start!118862 m!1273705))

(declare-fun m!1273707 () Bool)

(assert (=> start!118862 m!1273707))

(declare-fun m!1273709 () Bool)

(assert (=> b!1388408 m!1273709))

(assert (=> b!1388408 m!1273709))

(declare-fun m!1273711 () Bool)

(assert (=> b!1388408 m!1273711))

(declare-fun m!1273713 () Bool)

(assert (=> b!1388407 m!1273713))

(assert (=> b!1388407 m!1273713))

(declare-fun m!1273715 () Bool)

(assert (=> b!1388407 m!1273715))

(check-sat (not b!1388408) (not start!118862) (not b!1388407))
(check-sat)
