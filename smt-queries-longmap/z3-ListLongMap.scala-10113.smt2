; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119174 () Bool)

(assert start!119174)

(declare-fun b!1390203 () Bool)

(declare-fun e!787318 () Bool)

(assert (=> b!1390203 (= e!787318 (not true))))

(declare-fun e!787319 () Bool)

(assert (=> b!1390203 e!787319))

(declare-fun res!930367 () Bool)

(assert (=> b!1390203 (=> (not res!930367) (not e!787319))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95111 0))(
  ( (array!95112 (arr!45921 (Array (_ BitVec 32) (_ BitVec 64))) (size!46471 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95111)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95111 (_ BitVec 32)) Bool)

(assert (=> b!1390203 (= res!930367 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46480 0))(
  ( (Unit!46481) )
))
(declare-fun lt!610758 () Unit!46480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46480)

(assert (=> b!1390203 (= lt!610758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10238 0))(
  ( (MissingZero!10238 (index!43323 (_ BitVec 32))) (Found!10238 (index!43324 (_ BitVec 32))) (Intermediate!10238 (undefined!11050 Bool) (index!43325 (_ BitVec 32)) (x!125004 (_ BitVec 32))) (Undefined!10238) (MissingVacant!10238 (index!43326 (_ BitVec 32))) )
))
(declare-fun lt!610757 () SeekEntryResult!10238)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95111 (_ BitVec 32)) SeekEntryResult!10238)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390203 (= lt!610757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45921 a!2901) j!112) mask!2840) (select (arr!45921 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390204 () Bool)

(declare-fun res!930365 () Bool)

(assert (=> b!1390204 (=> (not res!930365) (not e!787318))))

(assert (=> b!1390204 (= res!930365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390205 () Bool)

(declare-fun res!930368 () Bool)

(assert (=> b!1390205 (=> (not res!930368) (not e!787318))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390205 (= res!930368 (and (= (size!46471 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46471 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46471 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390206 () Bool)

(declare-fun res!930369 () Bool)

(assert (=> b!1390206 (=> (not res!930369) (not e!787318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390206 (= res!930369 (validKeyInArray!0 (select (arr!45921 a!2901) j!112)))))

(declare-fun b!1390207 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95111 (_ BitVec 32)) SeekEntryResult!10238)

(assert (=> b!1390207 (= e!787319 (= (seekEntryOrOpen!0 (select (arr!45921 a!2901) j!112) a!2901 mask!2840) (Found!10238 j!112)))))

(declare-fun res!930364 () Bool)

(assert (=> start!119174 (=> (not res!930364) (not e!787318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119174 (= res!930364 (validMask!0 mask!2840))))

(assert (=> start!119174 e!787318))

(assert (=> start!119174 true))

(declare-fun array_inv!34949 (array!95111) Bool)

(assert (=> start!119174 (array_inv!34949 a!2901)))

(declare-fun b!1390208 () Bool)

(declare-fun res!930366 () Bool)

(assert (=> b!1390208 (=> (not res!930366) (not e!787318))))

(assert (=> b!1390208 (= res!930366 (validKeyInArray!0 (select (arr!45921 a!2901) i!1037)))))

(declare-fun b!1390209 () Bool)

(declare-fun res!930370 () Bool)

(assert (=> b!1390209 (=> (not res!930370) (not e!787318))))

(declare-datatypes ((List!32440 0))(
  ( (Nil!32437) (Cons!32436 (h!33654 (_ BitVec 64)) (t!47134 List!32440)) )
))
(declare-fun arrayNoDuplicates!0 (array!95111 (_ BitVec 32) List!32440) Bool)

(assert (=> b!1390209 (= res!930370 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32437))))

(assert (= (and start!119174 res!930364) b!1390205))

(assert (= (and b!1390205 res!930368) b!1390208))

(assert (= (and b!1390208 res!930366) b!1390206))

(assert (= (and b!1390206 res!930369) b!1390204))

(assert (= (and b!1390204 res!930365) b!1390209))

(assert (= (and b!1390209 res!930370) b!1390203))

(assert (= (and b!1390203 res!930367) b!1390207))

(declare-fun m!1275995 () Bool)

(assert (=> b!1390204 m!1275995))

(declare-fun m!1275997 () Bool)

(assert (=> b!1390209 m!1275997))

(declare-fun m!1275999 () Bool)

(assert (=> b!1390203 m!1275999))

(declare-fun m!1276001 () Bool)

(assert (=> b!1390203 m!1276001))

(assert (=> b!1390203 m!1275999))

(declare-fun m!1276003 () Bool)

(assert (=> b!1390203 m!1276003))

(assert (=> b!1390203 m!1276001))

(assert (=> b!1390203 m!1275999))

(declare-fun m!1276005 () Bool)

(assert (=> b!1390203 m!1276005))

(declare-fun m!1276007 () Bool)

(assert (=> b!1390203 m!1276007))

(assert (=> b!1390207 m!1275999))

(assert (=> b!1390207 m!1275999))

(declare-fun m!1276009 () Bool)

(assert (=> b!1390207 m!1276009))

(declare-fun m!1276011 () Bool)

(assert (=> b!1390208 m!1276011))

(assert (=> b!1390208 m!1276011))

(declare-fun m!1276013 () Bool)

(assert (=> b!1390208 m!1276013))

(declare-fun m!1276015 () Bool)

(assert (=> start!119174 m!1276015))

(declare-fun m!1276017 () Bool)

(assert (=> start!119174 m!1276017))

(assert (=> b!1390206 m!1275999))

(assert (=> b!1390206 m!1275999))

(declare-fun m!1276019 () Bool)

(assert (=> b!1390206 m!1276019))

(check-sat (not b!1390207) (not b!1390209) (not b!1390204) (not b!1390203) (not start!119174) (not b!1390208) (not b!1390206))
