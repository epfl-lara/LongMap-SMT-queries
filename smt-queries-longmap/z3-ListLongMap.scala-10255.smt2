; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120584 () Bool)

(assert start!120584)

(declare-fun b!1404047 () Bool)

(declare-fun res!942558 () Bool)

(declare-fun e!794909 () Bool)

(assert (=> b!1404047 (=> (not res!942558) (not e!794909))))

(declare-datatypes ((array!95993 0))(
  ( (array!95994 (arr!46347 (Array (_ BitVec 32) (_ BitVec 64))) (size!46897 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95993)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404047 (= res!942558 (validKeyInArray!0 (select (arr!46347 a!2901) j!112)))))

(declare-fun b!1404048 () Bool)

(declare-fun res!942560 () Bool)

(assert (=> b!1404048 (=> (not res!942560) (not e!794909))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404048 (= res!942560 (validKeyInArray!0 (select (arr!46347 a!2901) i!1037)))))

(declare-fun res!942562 () Bool)

(assert (=> start!120584 (=> (not res!942562) (not e!794909))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120584 (= res!942562 (validMask!0 mask!2840))))

(assert (=> start!120584 e!794909))

(assert (=> start!120584 true))

(declare-fun array_inv!35375 (array!95993) Bool)

(assert (=> start!120584 (array_inv!35375 a!2901)))

(declare-fun b!1404049 () Bool)

(declare-fun res!942561 () Bool)

(assert (=> b!1404049 (=> (not res!942561) (not e!794909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95993 (_ BitVec 32)) Bool)

(assert (=> b!1404049 (= res!942561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404050 () Bool)

(assert (=> b!1404050 (= e!794909 false)))

(declare-fun lt!618579 () Bool)

(declare-datatypes ((List!32866 0))(
  ( (Nil!32863) (Cons!32862 (h!34110 (_ BitVec 64)) (t!47560 List!32866)) )
))
(declare-fun arrayNoDuplicates!0 (array!95993 (_ BitVec 32) List!32866) Bool)

(assert (=> b!1404050 (= lt!618579 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32863))))

(declare-fun b!1404051 () Bool)

(declare-fun res!942559 () Bool)

(assert (=> b!1404051 (=> (not res!942559) (not e!794909))))

(assert (=> b!1404051 (= res!942559 (and (= (size!46897 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46897 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46897 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120584 res!942562) b!1404051))

(assert (= (and b!1404051 res!942559) b!1404048))

(assert (= (and b!1404048 res!942560) b!1404047))

(assert (= (and b!1404047 res!942558) b!1404049))

(assert (= (and b!1404049 res!942561) b!1404050))

(declare-fun m!1292851 () Bool)

(assert (=> start!120584 m!1292851))

(declare-fun m!1292853 () Bool)

(assert (=> start!120584 m!1292853))

(declare-fun m!1292855 () Bool)

(assert (=> b!1404049 m!1292855))

(declare-fun m!1292857 () Bool)

(assert (=> b!1404047 m!1292857))

(assert (=> b!1404047 m!1292857))

(declare-fun m!1292859 () Bool)

(assert (=> b!1404047 m!1292859))

(declare-fun m!1292861 () Bool)

(assert (=> b!1404048 m!1292861))

(assert (=> b!1404048 m!1292861))

(declare-fun m!1292863 () Bool)

(assert (=> b!1404048 m!1292863))

(declare-fun m!1292865 () Bool)

(assert (=> b!1404050 m!1292865))

(check-sat (not b!1404050) (not b!1404049) (not b!1404047) (not b!1404048) (not start!120584))
