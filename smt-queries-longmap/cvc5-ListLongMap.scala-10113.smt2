; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119172 () Bool)

(assert start!119172)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95109 0))(
  ( (array!95110 (arr!45920 (Array (_ BitVec 32) (_ BitVec 64))) (size!46470 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95109)

(declare-fun e!787308 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1390182 () Bool)

(declare-datatypes ((SeekEntryResult!10237 0))(
  ( (MissingZero!10237 (index!43319 (_ BitVec 32))) (Found!10237 (index!43320 (_ BitVec 32))) (Intermediate!10237 (undefined!11049 Bool) (index!43321 (_ BitVec 32)) (x!125003 (_ BitVec 32))) (Undefined!10237) (MissingVacant!10237 (index!43322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95109 (_ BitVec 32)) SeekEntryResult!10237)

(assert (=> b!1390182 (= e!787308 (= (seekEntryOrOpen!0 (select (arr!45920 a!2901) j!112) a!2901 mask!2840) (Found!10237 j!112)))))

(declare-fun b!1390183 () Bool)

(declare-fun res!930346 () Bool)

(declare-fun e!787309 () Bool)

(assert (=> b!1390183 (=> (not res!930346) (not e!787309))))

(declare-datatypes ((List!32439 0))(
  ( (Nil!32436) (Cons!32435 (h!33653 (_ BitVec 64)) (t!47133 List!32439)) )
))
(declare-fun arrayNoDuplicates!0 (array!95109 (_ BitVec 32) List!32439) Bool)

(assert (=> b!1390183 (= res!930346 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32436))))

(declare-fun b!1390184 () Bool)

(declare-fun res!930343 () Bool)

(assert (=> b!1390184 (=> (not res!930343) (not e!787309))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390184 (= res!930343 (and (= (size!46470 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46470 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46470 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390185 () Bool)

(assert (=> b!1390185 (= e!787309 (not true))))

(assert (=> b!1390185 e!787308))

(declare-fun res!930349 () Bool)

(assert (=> b!1390185 (=> (not res!930349) (not e!787308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95109 (_ BitVec 32)) Bool)

(assert (=> b!1390185 (= res!930349 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46478 0))(
  ( (Unit!46479) )
))
(declare-fun lt!610751 () Unit!46478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46478)

(assert (=> b!1390185 (= lt!610751 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610752 () SeekEntryResult!10237)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95109 (_ BitVec 32)) SeekEntryResult!10237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390185 (= lt!610752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45920 a!2901) j!112) mask!2840) (select (arr!45920 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390186 () Bool)

(declare-fun res!930345 () Bool)

(assert (=> b!1390186 (=> (not res!930345) (not e!787309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390186 (= res!930345 (validKeyInArray!0 (select (arr!45920 a!2901) j!112)))))

(declare-fun b!1390187 () Bool)

(declare-fun res!930344 () Bool)

(assert (=> b!1390187 (=> (not res!930344) (not e!787309))))

(assert (=> b!1390187 (= res!930344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390188 () Bool)

(declare-fun res!930348 () Bool)

(assert (=> b!1390188 (=> (not res!930348) (not e!787309))))

(assert (=> b!1390188 (= res!930348 (validKeyInArray!0 (select (arr!45920 a!2901) i!1037)))))

(declare-fun res!930347 () Bool)

(assert (=> start!119172 (=> (not res!930347) (not e!787309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119172 (= res!930347 (validMask!0 mask!2840))))

(assert (=> start!119172 e!787309))

(assert (=> start!119172 true))

(declare-fun array_inv!34948 (array!95109) Bool)

(assert (=> start!119172 (array_inv!34948 a!2901)))

(assert (= (and start!119172 res!930347) b!1390184))

(assert (= (and b!1390184 res!930343) b!1390188))

(assert (= (and b!1390188 res!930348) b!1390186))

(assert (= (and b!1390186 res!930345) b!1390187))

(assert (= (and b!1390187 res!930344) b!1390183))

(assert (= (and b!1390183 res!930346) b!1390185))

(assert (= (and b!1390185 res!930349) b!1390182))

(declare-fun m!1275969 () Bool)

(assert (=> b!1390188 m!1275969))

(assert (=> b!1390188 m!1275969))

(declare-fun m!1275971 () Bool)

(assert (=> b!1390188 m!1275971))

(declare-fun m!1275973 () Bool)

(assert (=> b!1390183 m!1275973))

(declare-fun m!1275975 () Bool)

(assert (=> start!119172 m!1275975))

(declare-fun m!1275977 () Bool)

(assert (=> start!119172 m!1275977))

(declare-fun m!1275979 () Bool)

(assert (=> b!1390182 m!1275979))

(assert (=> b!1390182 m!1275979))

(declare-fun m!1275981 () Bool)

(assert (=> b!1390182 m!1275981))

(assert (=> b!1390186 m!1275979))

(assert (=> b!1390186 m!1275979))

(declare-fun m!1275983 () Bool)

(assert (=> b!1390186 m!1275983))

(declare-fun m!1275985 () Bool)

(assert (=> b!1390187 m!1275985))

(assert (=> b!1390185 m!1275979))

(declare-fun m!1275987 () Bool)

(assert (=> b!1390185 m!1275987))

(assert (=> b!1390185 m!1275979))

(declare-fun m!1275989 () Bool)

(assert (=> b!1390185 m!1275989))

(assert (=> b!1390185 m!1275987))

(assert (=> b!1390185 m!1275979))

(declare-fun m!1275991 () Bool)

(assert (=> b!1390185 m!1275991))

(declare-fun m!1275993 () Bool)

(assert (=> b!1390185 m!1275993))

(push 1)

(assert (not b!1390187))

(assert (not b!1390183))

(assert (not b!1390182))

(assert (not b!1390186))

(assert (not b!1390185))

(assert (not b!1390188))

(assert (not start!119172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

