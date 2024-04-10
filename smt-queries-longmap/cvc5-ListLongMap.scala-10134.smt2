; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119514 () Bool)

(assert start!119514)

(declare-fun b!1392484 () Bool)

(declare-fun res!932065 () Bool)

(declare-fun e!788518 () Bool)

(assert (=> b!1392484 (=> (not res!932065) (not e!788518))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95247 0))(
  ( (array!95248 (arr!45983 (Array (_ BitVec 32) (_ BitVec 64))) (size!46533 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95247)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392484 (= res!932065 (and (= (size!46533 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46533 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46533 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392485 () Bool)

(declare-fun e!788516 () Bool)

(assert (=> b!1392485 (= e!788516 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun e!788517 () Bool)

(declare-fun b!1392486 () Bool)

(declare-datatypes ((SeekEntryResult!10300 0))(
  ( (MissingZero!10300 (index!43571 (_ BitVec 32))) (Found!10300 (index!43572 (_ BitVec 32))) (Intermediate!10300 (undefined!11112 Bool) (index!43573 (_ BitVec 32)) (x!125258 (_ BitVec 32))) (Undefined!10300) (MissingVacant!10300 (index!43574 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95247 (_ BitVec 32)) SeekEntryResult!10300)

(assert (=> b!1392486 (= e!788517 (= (seekEntryOrOpen!0 (select (arr!45983 a!2901) j!112) a!2901 mask!2840) (Found!10300 j!112)))))

(declare-fun b!1392487 () Bool)

(declare-fun res!932062 () Bool)

(assert (=> b!1392487 (=> (not res!932062) (not e!788518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392487 (= res!932062 (validKeyInArray!0 (select (arr!45983 a!2901) j!112)))))

(declare-fun b!1392488 () Bool)

(declare-fun res!932063 () Bool)

(assert (=> b!1392488 (=> (not res!932063) (not e!788518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95247 (_ BitVec 32)) Bool)

(assert (=> b!1392488 (= res!932063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392489 () Bool)

(declare-fun res!932058 () Bool)

(assert (=> b!1392489 (=> (not res!932058) (not e!788518))))

(assert (=> b!1392489 (= res!932058 (validKeyInArray!0 (select (arr!45983 a!2901) i!1037)))))

(declare-fun b!1392490 () Bool)

(declare-fun res!932057 () Bool)

(assert (=> b!1392490 (=> res!932057 e!788516)))

(declare-fun lt!611630 () SeekEntryResult!10300)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95247 (_ BitVec 32)) SeekEntryResult!10300)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392490 (= res!932057 (not (= lt!611630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45983 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45983 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95248 (store (arr!45983 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46533 a!2901)) mask!2840))))))

(declare-fun b!1392491 () Bool)

(assert (=> b!1392491 (= e!788518 (not e!788516))))

(declare-fun res!932061 () Bool)

(assert (=> b!1392491 (=> res!932061 e!788516)))

(assert (=> b!1392491 (= res!932061 (or (not (is-Intermediate!10300 lt!611630)) (undefined!11112 lt!611630)))))

(assert (=> b!1392491 e!788517))

(declare-fun res!932064 () Bool)

(assert (=> b!1392491 (=> (not res!932064) (not e!788517))))

(assert (=> b!1392491 (= res!932064 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46604 0))(
  ( (Unit!46605) )
))
(declare-fun lt!611631 () Unit!46604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46604)

(assert (=> b!1392491 (= lt!611631 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1392491 (= lt!611630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45983 a!2901) j!112) mask!2840) (select (arr!45983 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932059 () Bool)

(assert (=> start!119514 (=> (not res!932059) (not e!788518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119514 (= res!932059 (validMask!0 mask!2840))))

(assert (=> start!119514 e!788518))

(assert (=> start!119514 true))

(declare-fun array_inv!35011 (array!95247) Bool)

(assert (=> start!119514 (array_inv!35011 a!2901)))

(declare-fun b!1392492 () Bool)

(declare-fun res!932060 () Bool)

(assert (=> b!1392492 (=> (not res!932060) (not e!788518))))

(declare-datatypes ((List!32502 0))(
  ( (Nil!32499) (Cons!32498 (h!33728 (_ BitVec 64)) (t!47196 List!32502)) )
))
(declare-fun arrayNoDuplicates!0 (array!95247 (_ BitVec 32) List!32502) Bool)

(assert (=> b!1392492 (= res!932060 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32499))))

(assert (= (and start!119514 res!932059) b!1392484))

(assert (= (and b!1392484 res!932065) b!1392489))

(assert (= (and b!1392489 res!932058) b!1392487))

(assert (= (and b!1392487 res!932062) b!1392488))

(assert (= (and b!1392488 res!932063) b!1392492))

(assert (= (and b!1392492 res!932060) b!1392491))

(assert (= (and b!1392491 res!932064) b!1392486))

(assert (= (and b!1392491 (not res!932061)) b!1392490))

(assert (= (and b!1392490 (not res!932057)) b!1392485))

(declare-fun m!1278231 () Bool)

(assert (=> b!1392490 m!1278231))

(declare-fun m!1278233 () Bool)

(assert (=> b!1392490 m!1278233))

(assert (=> b!1392490 m!1278233))

(declare-fun m!1278235 () Bool)

(assert (=> b!1392490 m!1278235))

(assert (=> b!1392490 m!1278235))

(assert (=> b!1392490 m!1278233))

(declare-fun m!1278237 () Bool)

(assert (=> b!1392490 m!1278237))

(declare-fun m!1278239 () Bool)

(assert (=> b!1392486 m!1278239))

(assert (=> b!1392486 m!1278239))

(declare-fun m!1278241 () Bool)

(assert (=> b!1392486 m!1278241))

(assert (=> b!1392487 m!1278239))

(assert (=> b!1392487 m!1278239))

(declare-fun m!1278243 () Bool)

(assert (=> b!1392487 m!1278243))

(declare-fun m!1278245 () Bool)

(assert (=> b!1392492 m!1278245))

(declare-fun m!1278247 () Bool)

(assert (=> b!1392489 m!1278247))

(assert (=> b!1392489 m!1278247))

(declare-fun m!1278249 () Bool)

(assert (=> b!1392489 m!1278249))

(declare-fun m!1278251 () Bool)

(assert (=> b!1392488 m!1278251))

(declare-fun m!1278253 () Bool)

(assert (=> start!119514 m!1278253))

(declare-fun m!1278255 () Bool)

(assert (=> start!119514 m!1278255))

(assert (=> b!1392491 m!1278239))

(declare-fun m!1278257 () Bool)

(assert (=> b!1392491 m!1278257))

(assert (=> b!1392491 m!1278239))

(declare-fun m!1278259 () Bool)

(assert (=> b!1392491 m!1278259))

(assert (=> b!1392491 m!1278257))

(assert (=> b!1392491 m!1278239))

(declare-fun m!1278261 () Bool)

(assert (=> b!1392491 m!1278261))

(declare-fun m!1278263 () Bool)

(assert (=> b!1392491 m!1278263))

(push 1)

