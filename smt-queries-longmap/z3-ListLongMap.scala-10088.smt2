; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119054 () Bool)

(assert start!119054)

(declare-fun b!1389630 () Bool)

(declare-fun e!787291 () Bool)

(declare-datatypes ((array!95054 0))(
  ( (array!95055 (arr!45898 (Array (_ BitVec 32) (_ BitVec 64))) (size!46449 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95054)

(assert (=> b!1389630 (= e!787291 (bvsgt #b00000000000000000000000000000000 (size!46449 a!2901)))))

(declare-fun res!929230 () Bool)

(assert (=> start!119054 (=> (not res!929230) (not e!787291))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119054 (= res!929230 (validMask!0 mask!2840))))

(assert (=> start!119054 e!787291))

(assert (=> start!119054 true))

(declare-fun array_inv!35179 (array!95054) Bool)

(assert (=> start!119054 (array_inv!35179 a!2901)))

(declare-fun b!1389627 () Bool)

(declare-fun res!929229 () Bool)

(assert (=> b!1389627 (=> (not res!929229) (not e!787291))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389627 (= res!929229 (and (= (size!46449 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46449 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46449 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389628 () Bool)

(declare-fun res!929227 () Bool)

(assert (=> b!1389628 (=> (not res!929227) (not e!787291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389628 (= res!929227 (validKeyInArray!0 (select (arr!45898 a!2901) i!1037)))))

(declare-fun b!1389629 () Bool)

(declare-fun res!929228 () Bool)

(assert (=> b!1389629 (=> (not res!929228) (not e!787291))))

(assert (=> b!1389629 (= res!929228 (validKeyInArray!0 (select (arr!45898 a!2901) j!112)))))

(assert (= (and start!119054 res!929230) b!1389627))

(assert (= (and b!1389627 res!929229) b!1389628))

(assert (= (and b!1389628 res!929227) b!1389629))

(assert (= (and b!1389629 res!929228) b!1389630))

(declare-fun m!1275613 () Bool)

(assert (=> start!119054 m!1275613))

(declare-fun m!1275615 () Bool)

(assert (=> start!119054 m!1275615))

(declare-fun m!1275617 () Bool)

(assert (=> b!1389628 m!1275617))

(assert (=> b!1389628 m!1275617))

(declare-fun m!1275619 () Bool)

(assert (=> b!1389628 m!1275619))

(declare-fun m!1275621 () Bool)

(assert (=> b!1389629 m!1275621))

(assert (=> b!1389629 m!1275621))

(declare-fun m!1275623 () Bool)

(assert (=> b!1389629 m!1275623))

(check-sat (not start!119054) (not b!1389629) (not b!1389628))
(check-sat)
