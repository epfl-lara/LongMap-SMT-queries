; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119118 () Bool)

(assert start!119118)

(declare-fun b!1389667 () Bool)

(declare-fun res!929829 () Bool)

(declare-fun e!787118 () Bool)

(assert (=> b!1389667 (=> (not res!929829) (not e!787118))))

(declare-datatypes ((array!95055 0))(
  ( (array!95056 (arr!45893 (Array (_ BitVec 32) (_ BitVec 64))) (size!46443 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95055)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389667 (= res!929829 (validKeyInArray!0 (select (arr!45893 a!2901) j!112)))))

(declare-fun b!1389668 () Bool)

(declare-fun res!929831 () Bool)

(assert (=> b!1389668 (=> (not res!929831) (not e!787118))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389668 (= res!929831 (validKeyInArray!0 (select (arr!45893 a!2901) i!1037)))))

(declare-fun res!929828 () Bool)

(assert (=> start!119118 (=> (not res!929828) (not e!787118))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119118 (= res!929828 (validMask!0 mask!2840))))

(assert (=> start!119118 e!787118))

(assert (=> start!119118 true))

(declare-fun array_inv!34921 (array!95055) Bool)

(assert (=> start!119118 (array_inv!34921 a!2901)))

(declare-fun b!1389669 () Bool)

(declare-fun res!929832 () Bool)

(assert (=> b!1389669 (=> (not res!929832) (not e!787118))))

(declare-datatypes ((List!32412 0))(
  ( (Nil!32409) (Cons!32408 (h!33626 (_ BitVec 64)) (t!47106 List!32412)) )
))
(declare-fun arrayNoDuplicates!0 (array!95055 (_ BitVec 32) List!32412) Bool)

(assert (=> b!1389669 (= res!929832 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32409))))

(declare-fun b!1389670 () Bool)

(assert (=> b!1389670 (= e!787118 false)))

(declare-datatypes ((SeekEntryResult!10210 0))(
  ( (MissingZero!10210 (index!43211 (_ BitVec 32))) (Found!10210 (index!43212 (_ BitVec 32))) (Intermediate!10210 (undefined!11022 Bool) (index!43213 (_ BitVec 32)) (x!124904 (_ BitVec 32))) (Undefined!10210) (MissingVacant!10210 (index!43214 (_ BitVec 32))) )
))
(declare-fun lt!610605 () SeekEntryResult!10210)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95055 (_ BitVec 32)) SeekEntryResult!10210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389670 (= lt!610605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45893 a!2901) j!112) mask!2840) (select (arr!45893 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389671 () Bool)

(declare-fun res!929830 () Bool)

(assert (=> b!1389671 (=> (not res!929830) (not e!787118))))

(assert (=> b!1389671 (= res!929830 (and (= (size!46443 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46443 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46443 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389672 () Bool)

(declare-fun res!929833 () Bool)

(assert (=> b!1389672 (=> (not res!929833) (not e!787118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95055 (_ BitVec 32)) Bool)

(assert (=> b!1389672 (= res!929833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119118 res!929828) b!1389671))

(assert (= (and b!1389671 res!929830) b!1389668))

(assert (= (and b!1389668 res!929831) b!1389667))

(assert (= (and b!1389667 res!929829) b!1389672))

(assert (= (and b!1389672 res!929833) b!1389669))

(assert (= (and b!1389669 res!929832) b!1389670))

(declare-fun m!1275327 () Bool)

(assert (=> b!1389672 m!1275327))

(declare-fun m!1275329 () Bool)

(assert (=> start!119118 m!1275329))

(declare-fun m!1275331 () Bool)

(assert (=> start!119118 m!1275331))

(declare-fun m!1275333 () Bool)

(assert (=> b!1389669 m!1275333))

(declare-fun m!1275335 () Bool)

(assert (=> b!1389670 m!1275335))

(assert (=> b!1389670 m!1275335))

(declare-fun m!1275337 () Bool)

(assert (=> b!1389670 m!1275337))

(assert (=> b!1389670 m!1275337))

(assert (=> b!1389670 m!1275335))

(declare-fun m!1275339 () Bool)

(assert (=> b!1389670 m!1275339))

(declare-fun m!1275341 () Bool)

(assert (=> b!1389668 m!1275341))

(assert (=> b!1389668 m!1275341))

(declare-fun m!1275343 () Bool)

(assert (=> b!1389668 m!1275343))

(assert (=> b!1389667 m!1275335))

(assert (=> b!1389667 m!1275335))

(declare-fun m!1275345 () Bool)

(assert (=> b!1389667 m!1275345))

(push 1)

(assert (not b!1389672))

(assert (not b!1389669))

(assert (not b!1389670))

(assert (not b!1389668))

(assert (not start!119118))

(assert (not b!1389667))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

