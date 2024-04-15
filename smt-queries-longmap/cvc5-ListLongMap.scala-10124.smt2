; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119346 () Bool)

(assert start!119346)

(declare-fun b!1391292 () Bool)

(declare-fun res!931216 () Bool)

(declare-fun e!787874 () Bool)

(assert (=> b!1391292 (=> (not res!931216) (not e!787874))))

(declare-datatypes ((array!95134 0))(
  ( (array!95135 (arr!45930 (Array (_ BitVec 32) (_ BitVec 64))) (size!46482 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95134)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391292 (= res!931216 (validKeyInArray!0 (select (arr!45930 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1391293 () Bool)

(declare-fun e!787873 () Bool)

(declare-datatypes ((SeekEntryResult!10273 0))(
  ( (MissingZero!10273 (index!43463 (_ BitVec 32))) (Found!10273 (index!43464 (_ BitVec 32))) (Intermediate!10273 (undefined!11085 Bool) (index!43465 (_ BitVec 32)) (x!125136 (_ BitVec 32))) (Undefined!10273) (MissingVacant!10273 (index!43466 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95134 (_ BitVec 32)) SeekEntryResult!10273)

(assert (=> b!1391293 (= e!787873 (= (seekEntryOrOpen!0 (select (arr!45930 a!2901) j!112) a!2901 mask!2840) (Found!10273 j!112)))))

(declare-fun b!1391294 () Bool)

(declare-fun res!931210 () Bool)

(assert (=> b!1391294 (=> (not res!931210) (not e!787874))))

(declare-datatypes ((List!32527 0))(
  ( (Nil!32524) (Cons!32523 (h!33747 (_ BitVec 64)) (t!47213 List!32527)) )
))
(declare-fun arrayNoDuplicates!0 (array!95134 (_ BitVec 32) List!32527) Bool)

(assert (=> b!1391294 (= res!931210 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32524))))

(declare-fun b!1391295 () Bool)

(declare-fun res!931215 () Bool)

(assert (=> b!1391295 (=> (not res!931215) (not e!787874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95134 (_ BitVec 32)) Bool)

(assert (=> b!1391295 (= res!931215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391296 () Bool)

(assert (=> b!1391296 (= e!787874 (not true))))

(assert (=> b!1391296 e!787873))

(declare-fun res!931212 () Bool)

(assert (=> b!1391296 (=> (not res!931212) (not e!787873))))

(assert (=> b!1391296 (= res!931212 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46393 0))(
  ( (Unit!46394) )
))
(declare-fun lt!610996 () Unit!46393)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46393)

(assert (=> b!1391296 (= lt!610996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610997 () SeekEntryResult!10273)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95134 (_ BitVec 32)) SeekEntryResult!10273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391296 (= lt!610997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45930 a!2901) j!112) mask!2840) (select (arr!45930 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391297 () Bool)

(declare-fun res!931213 () Bool)

(assert (=> b!1391297 (=> (not res!931213) (not e!787874))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391297 (= res!931213 (and (= (size!46482 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46482 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46482 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931211 () Bool)

(assert (=> start!119346 (=> (not res!931211) (not e!787874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119346 (= res!931211 (validMask!0 mask!2840))))

(assert (=> start!119346 e!787874))

(assert (=> start!119346 true))

(declare-fun array_inv!35163 (array!95134) Bool)

(assert (=> start!119346 (array_inv!35163 a!2901)))

(declare-fun b!1391298 () Bool)

(declare-fun res!931214 () Bool)

(assert (=> b!1391298 (=> (not res!931214) (not e!787874))))

(assert (=> b!1391298 (= res!931214 (validKeyInArray!0 (select (arr!45930 a!2901) i!1037)))))

(assert (= (and start!119346 res!931211) b!1391297))

(assert (= (and b!1391297 res!931213) b!1391298))

(assert (= (and b!1391298 res!931214) b!1391292))

(assert (= (and b!1391292 res!931216) b!1391295))

(assert (= (and b!1391295 res!931215) b!1391294))

(assert (= (and b!1391294 res!931210) b!1391296))

(assert (= (and b!1391296 res!931212) b!1391293))

(declare-fun m!1276601 () Bool)

(assert (=> b!1391294 m!1276601))

(declare-fun m!1276603 () Bool)

(assert (=> b!1391296 m!1276603))

(declare-fun m!1276605 () Bool)

(assert (=> b!1391296 m!1276605))

(assert (=> b!1391296 m!1276603))

(declare-fun m!1276607 () Bool)

(assert (=> b!1391296 m!1276607))

(assert (=> b!1391296 m!1276605))

(assert (=> b!1391296 m!1276603))

(declare-fun m!1276609 () Bool)

(assert (=> b!1391296 m!1276609))

(declare-fun m!1276611 () Bool)

(assert (=> b!1391296 m!1276611))

(declare-fun m!1276613 () Bool)

(assert (=> start!119346 m!1276613))

(declare-fun m!1276615 () Bool)

(assert (=> start!119346 m!1276615))

(assert (=> b!1391293 m!1276603))

(assert (=> b!1391293 m!1276603))

(declare-fun m!1276617 () Bool)

(assert (=> b!1391293 m!1276617))

(declare-fun m!1276619 () Bool)

(assert (=> b!1391298 m!1276619))

(assert (=> b!1391298 m!1276619))

(declare-fun m!1276621 () Bool)

(assert (=> b!1391298 m!1276621))

(assert (=> b!1391292 m!1276603))

(assert (=> b!1391292 m!1276603))

(declare-fun m!1276623 () Bool)

(assert (=> b!1391292 m!1276623))

(declare-fun m!1276625 () Bool)

(assert (=> b!1391295 m!1276625))

(push 1)

(assert (not start!119346))

(assert (not b!1391293))

(assert (not b!1391292))

(assert (not b!1391295))

(assert (not b!1391296))

(assert (not b!1391298))

(assert (not b!1391294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

