; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120590 () Bool)

(assert start!120590)

(declare-fun b!1404097 () Bool)

(declare-fun res!942608 () Bool)

(declare-fun e!794926 () Bool)

(assert (=> b!1404097 (=> (not res!942608) (not e!794926))))

(declare-datatypes ((array!95999 0))(
  ( (array!96000 (arr!46350 (Array (_ BitVec 32) (_ BitVec 64))) (size!46900 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95999)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404097 (= res!942608 (validKeyInArray!0 (select (arr!46350 a!2901) j!112)))))

(declare-fun b!1404098 () Bool)

(declare-fun res!942613 () Bool)

(assert (=> b!1404098 (=> (not res!942613) (not e!794926))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404098 (= res!942613 (and (= (size!46900 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46900 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46900 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404099 () Bool)

(declare-fun res!942610 () Bool)

(assert (=> b!1404099 (=> (not res!942610) (not e!794926))))

(assert (=> b!1404099 (= res!942610 (validKeyInArray!0 (select (arr!46350 a!2901) i!1037)))))

(declare-fun res!942611 () Bool)

(assert (=> start!120590 (=> (not res!942611) (not e!794926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120590 (= res!942611 (validMask!0 mask!2840))))

(assert (=> start!120590 e!794926))

(assert (=> start!120590 true))

(declare-fun array_inv!35378 (array!95999) Bool)

(assert (=> start!120590 (array_inv!35378 a!2901)))

(declare-fun b!1404100 () Bool)

(declare-fun res!942609 () Bool)

(assert (=> b!1404100 (=> (not res!942609) (not e!794926))))

(declare-datatypes ((List!32869 0))(
  ( (Nil!32866) (Cons!32865 (h!34113 (_ BitVec 64)) (t!47563 List!32869)) )
))
(declare-fun arrayNoDuplicates!0 (array!95999 (_ BitVec 32) List!32869) Bool)

(assert (=> b!1404100 (= res!942609 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32866))))

(declare-fun b!1404101 () Bool)

(declare-fun res!942612 () Bool)

(assert (=> b!1404101 (=> (not res!942612) (not e!794926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95999 (_ BitVec 32)) Bool)

(assert (=> b!1404101 (= res!942612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404102 () Bool)

(assert (=> b!1404102 (= e!794926 false)))

(declare-fun lt!618588 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404102 (= lt!618588 (toIndex!0 (select (arr!46350 a!2901) j!112) mask!2840))))

(assert (= (and start!120590 res!942611) b!1404098))

(assert (= (and b!1404098 res!942613) b!1404099))

(assert (= (and b!1404099 res!942610) b!1404097))

(assert (= (and b!1404097 res!942608) b!1404101))

(assert (= (and b!1404101 res!942612) b!1404100))

(assert (= (and b!1404100 res!942609) b!1404102))

(declare-fun m!1292901 () Bool)

(assert (=> b!1404100 m!1292901))

(declare-fun m!1292903 () Bool)

(assert (=> start!120590 m!1292903))

(declare-fun m!1292905 () Bool)

(assert (=> start!120590 m!1292905))

(declare-fun m!1292907 () Bool)

(assert (=> b!1404097 m!1292907))

(assert (=> b!1404097 m!1292907))

(declare-fun m!1292909 () Bool)

(assert (=> b!1404097 m!1292909))

(declare-fun m!1292911 () Bool)

(assert (=> b!1404099 m!1292911))

(assert (=> b!1404099 m!1292911))

(declare-fun m!1292913 () Bool)

(assert (=> b!1404099 m!1292913))

(assert (=> b!1404102 m!1292907))

(assert (=> b!1404102 m!1292907))

(declare-fun m!1292915 () Bool)

(assert (=> b!1404102 m!1292915))

(declare-fun m!1292917 () Bool)

(assert (=> b!1404101 m!1292917))

(check-sat (not b!1404101) (not b!1404102) (not b!1404097) (not b!1404100) (not start!120590) (not b!1404099))
