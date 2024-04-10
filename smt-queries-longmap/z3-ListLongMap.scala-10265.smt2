; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120752 () Bool)

(assert start!120752)

(declare-fun b!1405053 () Bool)

(declare-fun res!943275 () Bool)

(declare-fun e!795392 () Bool)

(assert (=> b!1405053 (=> (not res!943275) (not e!795392))))

(declare-datatypes ((array!96059 0))(
  ( (array!96060 (arr!46377 (Array (_ BitVec 32) (_ BitVec 64))) (size!46927 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96059)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96059 (_ BitVec 32)) Bool)

(assert (=> b!1405053 (= res!943275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!795390 () Bool)

(declare-fun b!1405054 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10688 0))(
  ( (MissingZero!10688 (index!45129 (_ BitVec 32))) (Found!10688 (index!45130 (_ BitVec 32))) (Intermediate!10688 (undefined!11500 Bool) (index!45131 (_ BitVec 32)) (x!126751 (_ BitVec 32))) (Undefined!10688) (MissingVacant!10688 (index!45132 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96059 (_ BitVec 32)) SeekEntryResult!10688)

(assert (=> b!1405054 (= e!795390 (= (seekEntryOrOpen!0 (select (arr!46377 a!2901) j!112) a!2901 mask!2840) (Found!10688 j!112)))))

(declare-fun b!1405055 () Bool)

(declare-fun res!943273 () Bool)

(assert (=> b!1405055 (=> (not res!943273) (not e!795392))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405055 (= res!943273 (and (= (size!46927 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46927 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46927 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405056 () Bool)

(declare-fun res!943270 () Bool)

(assert (=> b!1405056 (=> (not res!943270) (not e!795392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405056 (= res!943270 (validKeyInArray!0 (select (arr!46377 a!2901) i!1037)))))

(declare-fun b!1405057 () Bool)

(assert (=> b!1405057 (= e!795392 (not true))))

(assert (=> b!1405057 e!795390))

(declare-fun res!943271 () Bool)

(assert (=> b!1405057 (=> (not res!943271) (not e!795390))))

(assert (=> b!1405057 (= res!943271 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47350 0))(
  ( (Unit!47351) )
))
(declare-fun lt!618918 () Unit!47350)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47350)

(assert (=> b!1405057 (= lt!618918 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618917 () SeekEntryResult!10688)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96059 (_ BitVec 32)) SeekEntryResult!10688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405057 (= lt!618917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46377 a!2901) j!112) mask!2840) (select (arr!46377 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405058 () Bool)

(declare-fun res!943274 () Bool)

(assert (=> b!1405058 (=> (not res!943274) (not e!795392))))

(assert (=> b!1405058 (= res!943274 (validKeyInArray!0 (select (arr!46377 a!2901) j!112)))))

(declare-fun b!1405059 () Bool)

(declare-fun res!943276 () Bool)

(assert (=> b!1405059 (=> (not res!943276) (not e!795392))))

(declare-datatypes ((List!32896 0))(
  ( (Nil!32893) (Cons!32892 (h!34146 (_ BitVec 64)) (t!47590 List!32896)) )
))
(declare-fun arrayNoDuplicates!0 (array!96059 (_ BitVec 32) List!32896) Bool)

(assert (=> b!1405059 (= res!943276 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32893))))

(declare-fun res!943272 () Bool)

(assert (=> start!120752 (=> (not res!943272) (not e!795392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120752 (= res!943272 (validMask!0 mask!2840))))

(assert (=> start!120752 e!795392))

(assert (=> start!120752 true))

(declare-fun array_inv!35405 (array!96059) Bool)

(assert (=> start!120752 (array_inv!35405 a!2901)))

(assert (= (and start!120752 res!943272) b!1405055))

(assert (= (and b!1405055 res!943273) b!1405056))

(assert (= (and b!1405056 res!943270) b!1405058))

(assert (= (and b!1405058 res!943274) b!1405053))

(assert (= (and b!1405053 res!943275) b!1405059))

(assert (= (and b!1405059 res!943276) b!1405057))

(assert (= (and b!1405057 res!943271) b!1405054))

(declare-fun m!1293743 () Bool)

(assert (=> b!1405054 m!1293743))

(assert (=> b!1405054 m!1293743))

(declare-fun m!1293745 () Bool)

(assert (=> b!1405054 m!1293745))

(assert (=> b!1405057 m!1293743))

(declare-fun m!1293747 () Bool)

(assert (=> b!1405057 m!1293747))

(assert (=> b!1405057 m!1293743))

(declare-fun m!1293749 () Bool)

(assert (=> b!1405057 m!1293749))

(assert (=> b!1405057 m!1293747))

(assert (=> b!1405057 m!1293743))

(declare-fun m!1293751 () Bool)

(assert (=> b!1405057 m!1293751))

(declare-fun m!1293753 () Bool)

(assert (=> b!1405057 m!1293753))

(declare-fun m!1293755 () Bool)

(assert (=> b!1405056 m!1293755))

(assert (=> b!1405056 m!1293755))

(declare-fun m!1293757 () Bool)

(assert (=> b!1405056 m!1293757))

(declare-fun m!1293759 () Bool)

(assert (=> b!1405059 m!1293759))

(declare-fun m!1293761 () Bool)

(assert (=> start!120752 m!1293761))

(declare-fun m!1293763 () Bool)

(assert (=> start!120752 m!1293763))

(assert (=> b!1405058 m!1293743))

(assert (=> b!1405058 m!1293743))

(declare-fun m!1293765 () Bool)

(assert (=> b!1405058 m!1293765))

(declare-fun m!1293767 () Bool)

(assert (=> b!1405053 m!1293767))

(check-sat (not b!1405056) (not b!1405054) (not start!120752) (not b!1405059) (not b!1405053) (not b!1405057) (not b!1405058))
