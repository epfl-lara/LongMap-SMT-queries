; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119060 () Bool)

(assert start!119060)

(declare-fun res!929265 () Bool)

(declare-fun e!787310 () Bool)

(assert (=> start!119060 (=> (not res!929265) (not e!787310))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119060 (= res!929265 (validMask!0 mask!2840))))

(assert (=> start!119060 e!787310))

(assert (=> start!119060 true))

(declare-datatypes ((array!95060 0))(
  ( (array!95061 (arr!45901 (Array (_ BitVec 32) (_ BitVec 64))) (size!46452 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95060)

(declare-fun array_inv!35182 (array!95060) Bool)

(assert (=> start!119060 (array_inv!35182 a!2901)))

(declare-fun b!1389665 () Bool)

(assert (=> b!1389665 (= e!787310 (bvsgt #b00000000000000000000000000000000 (size!46452 a!2901)))))

(declare-fun b!1389666 () Bool)

(declare-fun res!929269 () Bool)

(assert (=> b!1389666 (=> (not res!929269) (not e!787310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95060 (_ BitVec 32)) Bool)

(assert (=> b!1389666 (= res!929269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389667 () Bool)

(declare-fun res!929268 () Bool)

(assert (=> b!1389667 (=> (not res!929268) (not e!787310))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389667 (= res!929268 (validKeyInArray!0 (select (arr!45901 a!2901) i!1037)))))

(declare-fun b!1389668 () Bool)

(declare-fun res!929267 () Bool)

(assert (=> b!1389668 (=> (not res!929267) (not e!787310))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389668 (= res!929267 (and (= (size!46452 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46452 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46452 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389669 () Bool)

(declare-fun res!929266 () Bool)

(assert (=> b!1389669 (=> (not res!929266) (not e!787310))))

(assert (=> b!1389669 (= res!929266 (validKeyInArray!0 (select (arr!45901 a!2901) j!112)))))

(assert (= (and start!119060 res!929265) b!1389668))

(assert (= (and b!1389668 res!929267) b!1389667))

(assert (= (and b!1389667 res!929268) b!1389669))

(assert (= (and b!1389669 res!929266) b!1389666))

(assert (= (and b!1389666 res!929269) b!1389665))

(declare-fun m!1275649 () Bool)

(assert (=> start!119060 m!1275649))

(declare-fun m!1275651 () Bool)

(assert (=> start!119060 m!1275651))

(declare-fun m!1275653 () Bool)

(assert (=> b!1389666 m!1275653))

(declare-fun m!1275655 () Bool)

(assert (=> b!1389667 m!1275655))

(assert (=> b!1389667 m!1275655))

(declare-fun m!1275657 () Bool)

(assert (=> b!1389667 m!1275657))

(declare-fun m!1275659 () Bool)

(assert (=> b!1389669 m!1275659))

(assert (=> b!1389669 m!1275659))

(declare-fun m!1275661 () Bool)

(assert (=> b!1389669 m!1275661))

(check-sat (not b!1389669) (not start!119060) (not b!1389666) (not b!1389667))
(check-sat)
