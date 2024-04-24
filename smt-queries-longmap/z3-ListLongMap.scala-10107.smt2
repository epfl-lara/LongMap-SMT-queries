; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119324 () Bool)

(assert start!119324)

(declare-fun res!930448 () Bool)

(declare-fun e!787909 () Bool)

(assert (=> start!119324 (=> (not res!930448) (not e!787909))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119324 (= res!930448 (validMask!0 mask!2840))))

(assert (=> start!119324 e!787909))

(assert (=> start!119324 true))

(declare-datatypes ((array!95183 0))(
  ( (array!95184 (arr!45955 (Array (_ BitVec 32) (_ BitVec 64))) (size!46506 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95183)

(declare-fun array_inv!35236 (array!95183) Bool)

(assert (=> start!119324 (array_inv!35236 a!2901)))

(declare-fun b!1390969 () Bool)

(assert (=> b!1390969 (= e!787909 (not (bvsge mask!2840 #b00000000000000000000000000000000)))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95183 (_ BitVec 32)) Bool)

(assert (=> b!1390969 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46381 0))(
  ( (Unit!46382) )
))
(declare-fun lt!611041 () Unit!46381)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46381)

(assert (=> b!1390969 (= lt!611041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10175 0))(
  ( (MissingZero!10175 (index!43071 (_ BitVec 32))) (Found!10175 (index!43072 (_ BitVec 32))) (Intermediate!10175 (undefined!10987 Bool) (index!43073 (_ BitVec 32)) (x!124912 (_ BitVec 32))) (Undefined!10175) (MissingVacant!10175 (index!43074 (_ BitVec 32))) )
))
(declare-fun lt!611042 () SeekEntryResult!10175)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95183 (_ BitVec 32)) SeekEntryResult!10175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390969 (= lt!611042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45955 a!2901) j!112) mask!2840) (select (arr!45955 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390970 () Bool)

(declare-fun res!930451 () Bool)

(assert (=> b!1390970 (=> (not res!930451) (not e!787909))))

(declare-datatypes ((List!32461 0))(
  ( (Nil!32458) (Cons!32457 (h!33683 (_ BitVec 64)) (t!47147 List!32461)) )
))
(declare-fun arrayNoDuplicates!0 (array!95183 (_ BitVec 32) List!32461) Bool)

(assert (=> b!1390970 (= res!930451 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32458))))

(declare-fun b!1390971 () Bool)

(declare-fun res!930450 () Bool)

(assert (=> b!1390971 (=> (not res!930450) (not e!787909))))

(assert (=> b!1390971 (= res!930450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390972 () Bool)

(declare-fun res!930447 () Bool)

(assert (=> b!1390972 (=> (not res!930447) (not e!787909))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390972 (= res!930447 (validKeyInArray!0 (select (arr!45955 a!2901) i!1037)))))

(declare-fun b!1390973 () Bool)

(declare-fun res!930449 () Bool)

(assert (=> b!1390973 (=> (not res!930449) (not e!787909))))

(assert (=> b!1390973 (= res!930449 (validKeyInArray!0 (select (arr!45955 a!2901) j!112)))))

(declare-fun b!1390974 () Bool)

(declare-fun res!930446 () Bool)

(assert (=> b!1390974 (=> (not res!930446) (not e!787909))))

(assert (=> b!1390974 (= res!930446 (and (= (size!46506 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46506 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46506 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119324 res!930448) b!1390974))

(assert (= (and b!1390974 res!930446) b!1390972))

(assert (= (and b!1390972 res!930447) b!1390973))

(assert (= (and b!1390973 res!930449) b!1390971))

(assert (= (and b!1390971 res!930450) b!1390970))

(assert (= (and b!1390970 res!930451) b!1390969))

(declare-fun m!1276891 () Bool)

(assert (=> start!119324 m!1276891))

(declare-fun m!1276893 () Bool)

(assert (=> start!119324 m!1276893))

(declare-fun m!1276895 () Bool)

(assert (=> b!1390972 m!1276895))

(assert (=> b!1390972 m!1276895))

(declare-fun m!1276897 () Bool)

(assert (=> b!1390972 m!1276897))

(declare-fun m!1276899 () Bool)

(assert (=> b!1390973 m!1276899))

(assert (=> b!1390973 m!1276899))

(declare-fun m!1276901 () Bool)

(assert (=> b!1390973 m!1276901))

(assert (=> b!1390969 m!1276899))

(declare-fun m!1276903 () Bool)

(assert (=> b!1390969 m!1276903))

(assert (=> b!1390969 m!1276899))

(declare-fun m!1276905 () Bool)

(assert (=> b!1390969 m!1276905))

(assert (=> b!1390969 m!1276903))

(assert (=> b!1390969 m!1276899))

(declare-fun m!1276907 () Bool)

(assert (=> b!1390969 m!1276907))

(declare-fun m!1276909 () Bool)

(assert (=> b!1390969 m!1276909))

(declare-fun m!1276911 () Bool)

(assert (=> b!1390971 m!1276911))

(declare-fun m!1276913 () Bool)

(assert (=> b!1390970 m!1276913))

(check-sat (not b!1390973) (not b!1390971) (not b!1390969) (not b!1390970) (not start!119324) (not b!1390972))
(check-sat)
