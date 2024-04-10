; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119036 () Bool)

(assert start!119036)

(declare-fun b!1389172 () Bool)

(declare-fun e!786917 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1389172 (= e!786917 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((array!95006 0))(
  ( (array!95007 (arr!45870 (Array (_ BitVec 32) (_ BitVec 64))) (size!46420 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95006)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!610491 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389172 (= lt!610491 (toIndex!0 (select (arr!45870 a!2901) j!112) mask!2840))))

(declare-fun b!1389173 () Bool)

(declare-fun res!929366 () Bool)

(assert (=> b!1389173 (=> (not res!929366) (not e!786917))))

(declare-datatypes ((List!32389 0))(
  ( (Nil!32386) (Cons!32385 (h!33600 (_ BitVec 64)) (t!47083 List!32389)) )
))
(declare-fun arrayNoDuplicates!0 (array!95006 (_ BitVec 32) List!32389) Bool)

(assert (=> b!1389173 (= res!929366 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32386))))

(declare-fun b!1389174 () Bool)

(declare-fun res!929367 () Bool)

(assert (=> b!1389174 (=> (not res!929367) (not e!786917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95006 (_ BitVec 32)) Bool)

(assert (=> b!1389174 (= res!929367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389175 () Bool)

(declare-fun res!929369 () Bool)

(assert (=> b!1389175 (=> (not res!929369) (not e!786917))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389175 (= res!929369 (and (= (size!46420 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46420 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46420 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929371 () Bool)

(assert (=> start!119036 (=> (not res!929371) (not e!786917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119036 (= res!929371 (validMask!0 mask!2840))))

(assert (=> start!119036 e!786917))

(assert (=> start!119036 true))

(declare-fun array_inv!34898 (array!95006) Bool)

(assert (=> start!119036 (array_inv!34898 a!2901)))

(declare-fun b!1389176 () Bool)

(declare-fun res!929368 () Bool)

(assert (=> b!1389176 (=> (not res!929368) (not e!786917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389176 (= res!929368 (validKeyInArray!0 (select (arr!45870 a!2901) i!1037)))))

(declare-fun b!1389177 () Bool)

(declare-fun res!929370 () Bool)

(assert (=> b!1389177 (=> (not res!929370) (not e!786917))))

(assert (=> b!1389177 (= res!929370 (validKeyInArray!0 (select (arr!45870 a!2901) j!112)))))

(assert (= (and start!119036 res!929371) b!1389175))

(assert (= (and b!1389175 res!929369) b!1389176))

(assert (= (and b!1389176 res!929368) b!1389177))

(assert (= (and b!1389177 res!929370) b!1389174))

(assert (= (and b!1389174 res!929367) b!1389173))

(assert (= (and b!1389173 res!929366) b!1389172))

(declare-fun m!1274847 () Bool)

(assert (=> b!1389177 m!1274847))

(assert (=> b!1389177 m!1274847))

(declare-fun m!1274849 () Bool)

(assert (=> b!1389177 m!1274849))

(assert (=> b!1389172 m!1274847))

(assert (=> b!1389172 m!1274847))

(declare-fun m!1274851 () Bool)

(assert (=> b!1389172 m!1274851))

(declare-fun m!1274853 () Bool)

(assert (=> b!1389173 m!1274853))

(declare-fun m!1274855 () Bool)

(assert (=> b!1389174 m!1274855))

(declare-fun m!1274857 () Bool)

(assert (=> b!1389176 m!1274857))

(assert (=> b!1389176 m!1274857))

(declare-fun m!1274859 () Bool)

(assert (=> b!1389176 m!1274859))

(declare-fun m!1274861 () Bool)

(assert (=> start!119036 m!1274861))

(declare-fun m!1274863 () Bool)

(assert (=> start!119036 m!1274863))

(check-sat (not b!1389172) (not b!1389176) (not start!119036) (not b!1389177) (not b!1389173) (not b!1389174))
(check-sat)
