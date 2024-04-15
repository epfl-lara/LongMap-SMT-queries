; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119166 () Bool)

(assert start!119166)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1390080 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95056 0))(
  ( (array!95057 (arr!45894 (Array (_ BitVec 32) (_ BitVec 64))) (size!46446 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95056)

(declare-fun e!787261 () Bool)

(declare-datatypes ((SeekEntryResult!10237 0))(
  ( (MissingZero!10237 (index!43319 (_ BitVec 32))) (Found!10237 (index!43320 (_ BitVec 32))) (Intermediate!10237 (undefined!11049 Bool) (index!43321 (_ BitVec 32)) (x!124992 (_ BitVec 32))) (Undefined!10237) (MissingVacant!10237 (index!43322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95056 (_ BitVec 32)) SeekEntryResult!10237)

(assert (=> b!1390080 (= e!787261 (= (seekEntryOrOpen!0 (select (arr!45894 a!2901) j!112) a!2901 mask!2840) (Found!10237 j!112)))))

(declare-fun res!930297 () Bool)

(declare-fun e!787262 () Bool)

(assert (=> start!119166 (=> (not res!930297) (not e!787262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119166 (= res!930297 (validMask!0 mask!2840))))

(assert (=> start!119166 e!787262))

(assert (=> start!119166 true))

(declare-fun array_inv!35127 (array!95056) Bool)

(assert (=> start!119166 (array_inv!35127 a!2901)))

(declare-fun b!1390081 () Bool)

(declare-fun res!930298 () Bool)

(assert (=> b!1390081 (=> (not res!930298) (not e!787262))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390081 (= res!930298 (and (= (size!46446 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46446 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46446 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390082 () Bool)

(declare-fun res!930294 () Bool)

(assert (=> b!1390082 (=> (not res!930294) (not e!787262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390082 (= res!930294 (validKeyInArray!0 (select (arr!45894 a!2901) j!112)))))

(declare-fun b!1390083 () Bool)

(declare-fun res!930293 () Bool)

(assert (=> b!1390083 (=> (not res!930293) (not e!787262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95056 (_ BitVec 32)) Bool)

(assert (=> b!1390083 (= res!930293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390084 () Bool)

(declare-fun res!930296 () Bool)

(assert (=> b!1390084 (=> (not res!930296) (not e!787262))))

(declare-datatypes ((List!32491 0))(
  ( (Nil!32488) (Cons!32487 (h!33705 (_ BitVec 64)) (t!47177 List!32491)) )
))
(declare-fun arrayNoDuplicates!0 (array!95056 (_ BitVec 32) List!32491) Bool)

(assert (=> b!1390084 (= res!930296 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32488))))

(declare-fun b!1390085 () Bool)

(assert (=> b!1390085 (= e!787262 (not true))))

(assert (=> b!1390085 e!787261))

(declare-fun res!930295 () Bool)

(assert (=> b!1390085 (=> (not res!930295) (not e!787261))))

(assert (=> b!1390085 (= res!930295 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46321 0))(
  ( (Unit!46322) )
))
(declare-fun lt!610556 () Unit!46321)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46321)

(assert (=> b!1390085 (= lt!610556 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610555 () SeekEntryResult!10237)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95056 (_ BitVec 32)) SeekEntryResult!10237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390085 (= lt!610555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45894 a!2901) j!112) mask!2840) (select (arr!45894 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390086 () Bool)

(declare-fun res!930292 () Bool)

(assert (=> b!1390086 (=> (not res!930292) (not e!787262))))

(assert (=> b!1390086 (= res!930292 (validKeyInArray!0 (select (arr!45894 a!2901) i!1037)))))

(assert (= (and start!119166 res!930297) b!1390081))

(assert (= (and b!1390081 res!930298) b!1390086))

(assert (= (and b!1390086 res!930292) b!1390082))

(assert (= (and b!1390082 res!930294) b!1390083))

(assert (= (and b!1390083 res!930293) b!1390084))

(assert (= (and b!1390084 res!930296) b!1390085))

(assert (= (and b!1390085 res!930295) b!1390080))

(declare-fun m!1275407 () Bool)

(assert (=> b!1390084 m!1275407))

(declare-fun m!1275409 () Bool)

(assert (=> start!119166 m!1275409))

(declare-fun m!1275411 () Bool)

(assert (=> start!119166 m!1275411))

(declare-fun m!1275413 () Bool)

(assert (=> b!1390086 m!1275413))

(assert (=> b!1390086 m!1275413))

(declare-fun m!1275415 () Bool)

(assert (=> b!1390086 m!1275415))

(declare-fun m!1275417 () Bool)

(assert (=> b!1390083 m!1275417))

(declare-fun m!1275419 () Bool)

(assert (=> b!1390085 m!1275419))

(declare-fun m!1275421 () Bool)

(assert (=> b!1390085 m!1275421))

(assert (=> b!1390085 m!1275419))

(declare-fun m!1275423 () Bool)

(assert (=> b!1390085 m!1275423))

(assert (=> b!1390085 m!1275421))

(assert (=> b!1390085 m!1275419))

(declare-fun m!1275425 () Bool)

(assert (=> b!1390085 m!1275425))

(declare-fun m!1275427 () Bool)

(assert (=> b!1390085 m!1275427))

(assert (=> b!1390082 m!1275419))

(assert (=> b!1390082 m!1275419))

(declare-fun m!1275429 () Bool)

(assert (=> b!1390082 m!1275429))

(assert (=> b!1390080 m!1275419))

(assert (=> b!1390080 m!1275419))

(declare-fun m!1275431 () Bool)

(assert (=> b!1390080 m!1275431))

(push 1)

(assert (not b!1390085))

(assert (not start!119166))

(assert (not b!1390086))

(assert (not b!1390083))

(assert (not b!1390082))

(assert (not b!1390080))

(assert (not b!1390084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

