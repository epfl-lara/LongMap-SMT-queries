; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118874 () Bool)

(assert start!118874)

(declare-fun b!1388540 () Bool)

(declare-fun res!928828 () Bool)

(declare-fun e!786577 () Bool)

(assert (=> b!1388540 (=> (not res!928828) (not e!786577))))

(declare-datatypes ((array!94952 0))(
  ( (array!94953 (arr!45849 (Array (_ BitVec 32) (_ BitVec 64))) (size!46399 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94952)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388540 (= res!928828 (validKeyInArray!0 (select (arr!45849 a!2901) i!1037)))))

(declare-fun res!928826 () Bool)

(assert (=> start!118874 (=> (not res!928826) (not e!786577))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118874 (= res!928826 (validMask!0 mask!2840))))

(assert (=> start!118874 e!786577))

(assert (=> start!118874 true))

(declare-fun array_inv!34877 (array!94952) Bool)

(assert (=> start!118874 (array_inv!34877 a!2901)))

(declare-fun b!1388541 () Bool)

(declare-fun res!928825 () Bool)

(assert (=> b!1388541 (=> (not res!928825) (not e!786577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94952 (_ BitVec 32)) Bool)

(assert (=> b!1388541 (= res!928825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388542 () Bool)

(declare-fun res!928824 () Bool)

(assert (=> b!1388542 (=> (not res!928824) (not e!786577))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388542 (= res!928824 (and (= (size!46399 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46399 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46399 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388543 () Bool)

(declare-fun res!928827 () Bool)

(assert (=> b!1388543 (=> (not res!928827) (not e!786577))))

(assert (=> b!1388543 (= res!928827 (validKeyInArray!0 (select (arr!45849 a!2901) j!112)))))

(declare-fun b!1388544 () Bool)

(assert (=> b!1388544 (= e!786577 (bvsgt #b00000000000000000000000000000000 (size!46399 a!2901)))))

(assert (= (and start!118874 res!928826) b!1388542))

(assert (= (and b!1388542 res!928824) b!1388540))

(assert (= (and b!1388540 res!928828) b!1388543))

(assert (= (and b!1388543 res!928827) b!1388541))

(assert (= (and b!1388541 res!928825) b!1388544))

(declare-fun m!1274291 () Bool)

(assert (=> b!1388540 m!1274291))

(assert (=> b!1388540 m!1274291))

(declare-fun m!1274293 () Bool)

(assert (=> b!1388540 m!1274293))

(declare-fun m!1274295 () Bool)

(assert (=> start!118874 m!1274295))

(declare-fun m!1274297 () Bool)

(assert (=> start!118874 m!1274297))

(declare-fun m!1274299 () Bool)

(assert (=> b!1388541 m!1274299))

(declare-fun m!1274301 () Bool)

(assert (=> b!1388543 m!1274301))

(assert (=> b!1388543 m!1274301))

(declare-fun m!1274303 () Bool)

(assert (=> b!1388543 m!1274303))

(check-sat (not b!1388543) (not start!118874) (not b!1388540) (not b!1388541))
(check-sat)
