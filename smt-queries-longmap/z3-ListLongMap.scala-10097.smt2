; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119042 () Bool)

(assert start!119042)

(declare-fun b!1389226 () Bool)

(declare-fun e!786935 () Bool)

(assert (=> b!1389226 (= e!786935 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95012 0))(
  ( (array!95013 (arr!45873 (Array (_ BitVec 32) (_ BitVec 64))) (size!46423 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95012)

(declare-fun lt!610500 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389226 (= lt!610500 (toIndex!0 (select (arr!45873 a!2901) j!112) mask!2840))))

(declare-fun b!1389227 () Bool)

(declare-fun res!929425 () Bool)

(assert (=> b!1389227 (=> (not res!929425) (not e!786935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95012 (_ BitVec 32)) Bool)

(assert (=> b!1389227 (= res!929425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389228 () Bool)

(declare-fun res!929420 () Bool)

(assert (=> b!1389228 (=> (not res!929420) (not e!786935))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389228 (= res!929420 (validKeyInArray!0 (select (arr!45873 a!2901) i!1037)))))

(declare-fun b!1389229 () Bool)

(declare-fun res!929422 () Bool)

(assert (=> b!1389229 (=> (not res!929422) (not e!786935))))

(assert (=> b!1389229 (= res!929422 (and (= (size!46423 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46423 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46423 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389230 () Bool)

(declare-fun res!929423 () Bool)

(assert (=> b!1389230 (=> (not res!929423) (not e!786935))))

(assert (=> b!1389230 (= res!929423 (validKeyInArray!0 (select (arr!45873 a!2901) j!112)))))

(declare-fun b!1389231 () Bool)

(declare-fun res!929424 () Bool)

(assert (=> b!1389231 (=> (not res!929424) (not e!786935))))

(declare-datatypes ((List!32392 0))(
  ( (Nil!32389) (Cons!32388 (h!33603 (_ BitVec 64)) (t!47086 List!32392)) )
))
(declare-fun arrayNoDuplicates!0 (array!95012 (_ BitVec 32) List!32392) Bool)

(assert (=> b!1389231 (= res!929424 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32389))))

(declare-fun res!929421 () Bool)

(assert (=> start!119042 (=> (not res!929421) (not e!786935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119042 (= res!929421 (validMask!0 mask!2840))))

(assert (=> start!119042 e!786935))

(assert (=> start!119042 true))

(declare-fun array_inv!34901 (array!95012) Bool)

(assert (=> start!119042 (array_inv!34901 a!2901)))

(assert (= (and start!119042 res!929421) b!1389229))

(assert (= (and b!1389229 res!929422) b!1389228))

(assert (= (and b!1389228 res!929420) b!1389230))

(assert (= (and b!1389230 res!929423) b!1389227))

(assert (= (and b!1389227 res!929425) b!1389231))

(assert (= (and b!1389231 res!929424) b!1389226))

(declare-fun m!1274901 () Bool)

(assert (=> b!1389230 m!1274901))

(assert (=> b!1389230 m!1274901))

(declare-fun m!1274903 () Bool)

(assert (=> b!1389230 m!1274903))

(declare-fun m!1274905 () Bool)

(assert (=> b!1389228 m!1274905))

(assert (=> b!1389228 m!1274905))

(declare-fun m!1274907 () Bool)

(assert (=> b!1389228 m!1274907))

(assert (=> b!1389226 m!1274901))

(assert (=> b!1389226 m!1274901))

(declare-fun m!1274909 () Bool)

(assert (=> b!1389226 m!1274909))

(declare-fun m!1274911 () Bool)

(assert (=> b!1389231 m!1274911))

(declare-fun m!1274913 () Bool)

(assert (=> start!119042 m!1274913))

(declare-fun m!1274915 () Bool)

(assert (=> start!119042 m!1274915))

(declare-fun m!1274917 () Bool)

(assert (=> b!1389227 m!1274917))

(check-sat (not b!1389227) (not b!1389228) (not b!1389231) (not start!119042) (not b!1389230) (not b!1389226))
