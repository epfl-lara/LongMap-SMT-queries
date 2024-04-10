; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118876 () Bool)

(assert start!118876)

(declare-fun b!1388555 () Bool)

(declare-fun res!928842 () Bool)

(declare-fun e!786584 () Bool)

(assert (=> b!1388555 (=> (not res!928842) (not e!786584))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!94954 0))(
  ( (array!94955 (arr!45850 (Array (_ BitVec 32) (_ BitVec 64))) (size!46400 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94954)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388555 (= res!928842 (and (= (size!46400 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46400 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46400 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!928843 () Bool)

(assert (=> start!118876 (=> (not res!928843) (not e!786584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118876 (= res!928843 (validMask!0 mask!2840))))

(assert (=> start!118876 e!786584))

(assert (=> start!118876 true))

(declare-fun array_inv!34878 (array!94954) Bool)

(assert (=> start!118876 (array_inv!34878 a!2901)))

(declare-fun b!1388556 () Bool)

(assert (=> b!1388556 (= e!786584 (bvsgt #b00000000000000000000000000000000 (size!46400 a!2901)))))

(declare-fun b!1388557 () Bool)

(declare-fun res!928839 () Bool)

(assert (=> b!1388557 (=> (not res!928839) (not e!786584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388557 (= res!928839 (validKeyInArray!0 (select (arr!45850 a!2901) i!1037)))))

(declare-fun b!1388558 () Bool)

(declare-fun res!928841 () Bool)

(assert (=> b!1388558 (=> (not res!928841) (not e!786584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94954 (_ BitVec 32)) Bool)

(assert (=> b!1388558 (= res!928841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388559 () Bool)

(declare-fun res!928840 () Bool)

(assert (=> b!1388559 (=> (not res!928840) (not e!786584))))

(assert (=> b!1388559 (= res!928840 (validKeyInArray!0 (select (arr!45850 a!2901) j!112)))))

(assert (= (and start!118876 res!928843) b!1388555))

(assert (= (and b!1388555 res!928842) b!1388557))

(assert (= (and b!1388557 res!928839) b!1388559))

(assert (= (and b!1388559 res!928840) b!1388558))

(assert (= (and b!1388558 res!928841) b!1388556))

(declare-fun m!1274305 () Bool)

(assert (=> start!118876 m!1274305))

(declare-fun m!1274307 () Bool)

(assert (=> start!118876 m!1274307))

(declare-fun m!1274309 () Bool)

(assert (=> b!1388557 m!1274309))

(assert (=> b!1388557 m!1274309))

(declare-fun m!1274311 () Bool)

(assert (=> b!1388557 m!1274311))

(declare-fun m!1274313 () Bool)

(assert (=> b!1388558 m!1274313))

(declare-fun m!1274315 () Bool)

(assert (=> b!1388559 m!1274315))

(assert (=> b!1388559 m!1274315))

(declare-fun m!1274317 () Bool)

(assert (=> b!1388559 m!1274317))

(push 1)

(assert (not b!1388559))

(assert (not start!118876))

(assert (not b!1388557))

(assert (not b!1388558))

(check-sat)

(pop 1)

