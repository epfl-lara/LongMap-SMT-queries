; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119090 () Bool)

(assert start!119090)

(declare-fun b!1389415 () Bool)

(declare-fun res!929576 () Bool)

(declare-fun e!787033 () Bool)

(assert (=> b!1389415 (=> (not res!929576) (not e!787033))))

(declare-datatypes ((array!95027 0))(
  ( (array!95028 (arr!45879 (Array (_ BitVec 32) (_ BitVec 64))) (size!46429 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95027)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389415 (= res!929576 (validKeyInArray!0 (select (arr!45879 a!2901) i!1037)))))

(declare-fun b!1389416 () Bool)

(assert (=> b!1389416 (= e!787033 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!610563 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389416 (= lt!610563 (toIndex!0 (select (arr!45879 a!2901) j!112) mask!2840))))

(declare-fun b!1389417 () Bool)

(declare-fun res!929580 () Bool)

(assert (=> b!1389417 (=> (not res!929580) (not e!787033))))

(assert (=> b!1389417 (= res!929580 (and (= (size!46429 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46429 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46429 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389418 () Bool)

(declare-fun res!929581 () Bool)

(assert (=> b!1389418 (=> (not res!929581) (not e!787033))))

(declare-datatypes ((List!32398 0))(
  ( (Nil!32395) (Cons!32394 (h!33612 (_ BitVec 64)) (t!47092 List!32398)) )
))
(declare-fun arrayNoDuplicates!0 (array!95027 (_ BitVec 32) List!32398) Bool)

(assert (=> b!1389418 (= res!929581 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32395))))

(declare-fun res!929578 () Bool)

(assert (=> start!119090 (=> (not res!929578) (not e!787033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119090 (= res!929578 (validMask!0 mask!2840))))

(assert (=> start!119090 e!787033))

(assert (=> start!119090 true))

(declare-fun array_inv!34907 (array!95027) Bool)

(assert (=> start!119090 (array_inv!34907 a!2901)))

(declare-fun b!1389419 () Bool)

(declare-fun res!929579 () Bool)

(assert (=> b!1389419 (=> (not res!929579) (not e!787033))))

(assert (=> b!1389419 (= res!929579 (validKeyInArray!0 (select (arr!45879 a!2901) j!112)))))

(declare-fun b!1389420 () Bool)

(declare-fun res!929577 () Bool)

(assert (=> b!1389420 (=> (not res!929577) (not e!787033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95027 (_ BitVec 32)) Bool)

(assert (=> b!1389420 (= res!929577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119090 res!929578) b!1389417))

(assert (= (and b!1389417 res!929580) b!1389415))

(assert (= (and b!1389415 res!929576) b!1389419))

(assert (= (and b!1389419 res!929579) b!1389420))

(assert (= (and b!1389420 res!929577) b!1389418))

(assert (= (and b!1389418 res!929581) b!1389416))

(declare-fun m!1275057 () Bool)

(assert (=> b!1389418 m!1275057))

(declare-fun m!1275059 () Bool)

(assert (=> b!1389415 m!1275059))

(assert (=> b!1389415 m!1275059))

(declare-fun m!1275061 () Bool)

(assert (=> b!1389415 m!1275061))

(declare-fun m!1275063 () Bool)

(assert (=> b!1389420 m!1275063))

(declare-fun m!1275065 () Bool)

(assert (=> start!119090 m!1275065))

(declare-fun m!1275067 () Bool)

(assert (=> start!119090 m!1275067))

(declare-fun m!1275069 () Bool)

(assert (=> b!1389416 m!1275069))

(assert (=> b!1389416 m!1275069))

(declare-fun m!1275071 () Bool)

(assert (=> b!1389416 m!1275071))

(assert (=> b!1389419 m!1275069))

(assert (=> b!1389419 m!1275069))

(declare-fun m!1275073 () Bool)

(assert (=> b!1389419 m!1275073))

(check-sat (not b!1389418) (not b!1389419) (not b!1389415) (not b!1389416) (not b!1389420) (not start!119090))
