; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119092 () Bool)

(assert start!119092)

(declare-fun b!1389433 () Bool)

(declare-fun res!929595 () Bool)

(declare-fun e!787039 () Bool)

(assert (=> b!1389433 (=> (not res!929595) (not e!787039))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95029 0))(
  ( (array!95030 (arr!45880 (Array (_ BitVec 32) (_ BitVec 64))) (size!46430 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95029)

(assert (=> b!1389433 (= res!929595 (and (= (size!46430 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46430 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46430 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389434 () Bool)

(declare-fun res!929594 () Bool)

(assert (=> b!1389434 (=> (not res!929594) (not e!787039))))

(declare-datatypes ((List!32399 0))(
  ( (Nil!32396) (Cons!32395 (h!33613 (_ BitVec 64)) (t!47093 List!32399)) )
))
(declare-fun arrayNoDuplicates!0 (array!95029 (_ BitVec 32) List!32399) Bool)

(assert (=> b!1389434 (= res!929594 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32396))))

(declare-fun b!1389435 () Bool)

(declare-fun res!929599 () Bool)

(assert (=> b!1389435 (=> (not res!929599) (not e!787039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389435 (= res!929599 (validKeyInArray!0 (select (arr!45880 a!2901) i!1037)))))

(declare-fun b!1389436 () Bool)

(declare-fun res!929596 () Bool)

(assert (=> b!1389436 (=> (not res!929596) (not e!787039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95029 (_ BitVec 32)) Bool)

(assert (=> b!1389436 (= res!929596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389437 () Bool)

(assert (=> b!1389437 (= e!787039 false)))

(declare-fun lt!610566 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389437 (= lt!610566 (toIndex!0 (select (arr!45880 a!2901) j!112) mask!2840))))

(declare-fun b!1389438 () Bool)

(declare-fun res!929597 () Bool)

(assert (=> b!1389438 (=> (not res!929597) (not e!787039))))

(assert (=> b!1389438 (= res!929597 (validKeyInArray!0 (select (arr!45880 a!2901) j!112)))))

(declare-fun res!929598 () Bool)

(assert (=> start!119092 (=> (not res!929598) (not e!787039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119092 (= res!929598 (validMask!0 mask!2840))))

(assert (=> start!119092 e!787039))

(assert (=> start!119092 true))

(declare-fun array_inv!34908 (array!95029) Bool)

(assert (=> start!119092 (array_inv!34908 a!2901)))

(assert (= (and start!119092 res!929598) b!1389433))

(assert (= (and b!1389433 res!929595) b!1389435))

(assert (= (and b!1389435 res!929599) b!1389438))

(assert (= (and b!1389438 res!929597) b!1389436))

(assert (= (and b!1389436 res!929596) b!1389434))

(assert (= (and b!1389434 res!929594) b!1389437))

(declare-fun m!1275075 () Bool)

(assert (=> b!1389434 m!1275075))

(declare-fun m!1275077 () Bool)

(assert (=> b!1389437 m!1275077))

(assert (=> b!1389437 m!1275077))

(declare-fun m!1275079 () Bool)

(assert (=> b!1389437 m!1275079))

(assert (=> b!1389438 m!1275077))

(assert (=> b!1389438 m!1275077))

(declare-fun m!1275081 () Bool)

(assert (=> b!1389438 m!1275081))

(declare-fun m!1275083 () Bool)

(assert (=> b!1389436 m!1275083))

(declare-fun m!1275085 () Bool)

(assert (=> start!119092 m!1275085))

(declare-fun m!1275087 () Bool)

(assert (=> start!119092 m!1275087))

(declare-fun m!1275089 () Bool)

(assert (=> b!1389435 m!1275089))

(assert (=> b!1389435 m!1275089))

(declare-fun m!1275091 () Bool)

(assert (=> b!1389435 m!1275091))

(push 1)

(assert (not start!119092))

(assert (not b!1389434))

(assert (not b!1389436))

(assert (not b!1389435))

(assert (not b!1389438))

(assert (not b!1389437))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

