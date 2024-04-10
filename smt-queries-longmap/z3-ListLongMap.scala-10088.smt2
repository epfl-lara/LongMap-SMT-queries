; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118868 () Bool)

(assert start!118868)

(declare-fun b!1388501 () Bool)

(declare-fun res!928784 () Bool)

(declare-fun e!786559 () Bool)

(assert (=> b!1388501 (=> (not res!928784) (not e!786559))))

(declare-datatypes ((array!94946 0))(
  ( (array!94947 (arr!45846 (Array (_ BitVec 32) (_ BitVec 64))) (size!46396 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94946)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388501 (= res!928784 (validKeyInArray!0 (select (arr!45846 a!2901) j!112)))))

(declare-fun res!928785 () Bool)

(assert (=> start!118868 (=> (not res!928785) (not e!786559))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118868 (= res!928785 (validMask!0 mask!2840))))

(assert (=> start!118868 e!786559))

(assert (=> start!118868 true))

(declare-fun array_inv!34874 (array!94946) Bool)

(assert (=> start!118868 (array_inv!34874 a!2901)))

(declare-fun b!1388500 () Bool)

(declare-fun res!928786 () Bool)

(assert (=> b!1388500 (=> (not res!928786) (not e!786559))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1388500 (= res!928786 (validKeyInArray!0 (select (arr!45846 a!2901) i!1037)))))

(declare-fun b!1388502 () Bool)

(assert (=> b!1388502 (= e!786559 (bvsgt #b00000000000000000000000000000000 (size!46396 a!2901)))))

(declare-fun b!1388499 () Bool)

(declare-fun res!928783 () Bool)

(assert (=> b!1388499 (=> (not res!928783) (not e!786559))))

(assert (=> b!1388499 (= res!928783 (and (= (size!46396 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46396 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46396 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!118868 res!928785) b!1388499))

(assert (= (and b!1388499 res!928783) b!1388500))

(assert (= (and b!1388500 res!928786) b!1388501))

(assert (= (and b!1388501 res!928784) b!1388502))

(declare-fun m!1274253 () Bool)

(assert (=> b!1388501 m!1274253))

(assert (=> b!1388501 m!1274253))

(declare-fun m!1274255 () Bool)

(assert (=> b!1388501 m!1274255))

(declare-fun m!1274257 () Bool)

(assert (=> start!118868 m!1274257))

(declare-fun m!1274259 () Bool)

(assert (=> start!118868 m!1274259))

(declare-fun m!1274261 () Bool)

(assert (=> b!1388500 m!1274261))

(assert (=> b!1388500 m!1274261))

(declare-fun m!1274263 () Bool)

(assert (=> b!1388500 m!1274263))

(check-sat (not b!1388500) (not b!1388501) (not start!118868))
(check-sat)
