; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119984 () Bool)

(assert start!119984)

(declare-fun b!1396744 () Bool)

(declare-fun res!935660 () Bool)

(declare-fun e!790747 () Bool)

(assert (=> b!1396744 (=> (not res!935660) (not e!790747))))

(declare-datatypes ((array!95513 0))(
  ( (array!95514 (arr!46110 (Array (_ BitVec 32) (_ BitVec 64))) (size!46660 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95513)

(declare-datatypes ((List!32629 0))(
  ( (Nil!32626) (Cons!32625 (h!33867 (_ BitVec 64)) (t!47323 List!32629)) )
))
(declare-fun arrayNoDuplicates!0 (array!95513 (_ BitVec 32) List!32629) Bool)

(assert (=> b!1396744 (= res!935660 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32626))))

(declare-fun res!935659 () Bool)

(assert (=> start!119984 (=> (not res!935659) (not e!790747))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119984 (= res!935659 (validMask!0 mask!2840))))

(assert (=> start!119984 e!790747))

(assert (=> start!119984 true))

(declare-fun array_inv!35138 (array!95513) Bool)

(assert (=> start!119984 (array_inv!35138 a!2901)))

(declare-fun b!1396745 () Bool)

(declare-fun res!935664 () Bool)

(assert (=> b!1396745 (=> (not res!935664) (not e!790747))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396745 (= res!935664 (validKeyInArray!0 (select (arr!46110 a!2901) j!112)))))

(declare-fun b!1396746 () Bool)

(declare-fun e!790746 () Bool)

(declare-fun e!790745 () Bool)

(assert (=> b!1396746 (= e!790746 e!790745)))

(declare-fun res!935663 () Bool)

(assert (=> b!1396746 (=> res!935663 e!790745)))

(declare-fun lt!613668 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10427 0))(
  ( (MissingZero!10427 (index!44079 (_ BitVec 32))) (Found!10427 (index!44080 (_ BitVec 32))) (Intermediate!10427 (undefined!11239 Bool) (index!44081 (_ BitVec 32)) (x!125745 (_ BitVec 32))) (Undefined!10427) (MissingVacant!10427 (index!44082 (_ BitVec 32))) )
))
(declare-fun lt!613665 () SeekEntryResult!10427)

(declare-fun lt!613667 () SeekEntryResult!10427)

(get-info :version)

(assert (=> b!1396746 (= res!935663 (or (= lt!613665 lt!613667) (not ((_ is Intermediate!10427) lt!613667)) (bvslt (x!125745 lt!613665) #b00000000000000000000000000000000) (bvsgt (x!125745 lt!613665) #b01111111111111111111111111111110) (bvslt lt!613668 #b00000000000000000000000000000000) (bvsge lt!613668 (size!46660 a!2901)) (bvslt (index!44081 lt!613665) #b00000000000000000000000000000000) (bvsge (index!44081 lt!613665) (size!46660 a!2901)) (not (= lt!613665 (Intermediate!10427 false (index!44081 lt!613665) (x!125745 lt!613665)))) (not (= lt!613667 (Intermediate!10427 (undefined!11239 lt!613667) (index!44081 lt!613667) (x!125745 lt!613667))))))))

(declare-fun lt!613666 () array!95513)

(declare-fun lt!613663 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95513 (_ BitVec 32)) SeekEntryResult!10427)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396746 (= lt!613667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613663 mask!2840) lt!613663 lt!613666 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396746 (= lt!613663 (select (store (arr!46110 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396746 (= lt!613666 (array!95514 (store (arr!46110 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46660 a!2901)))))

(declare-fun b!1396747 () Bool)

(assert (=> b!1396747 (= e!790745 true)))

(declare-fun lt!613664 () SeekEntryResult!10427)

(assert (=> b!1396747 (= lt!613664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613668 lt!613663 lt!613666 mask!2840))))

(declare-fun b!1396748 () Bool)

(declare-fun res!935662 () Bool)

(assert (=> b!1396748 (=> (not res!935662) (not e!790747))))

(assert (=> b!1396748 (= res!935662 (validKeyInArray!0 (select (arr!46110 a!2901) i!1037)))))

(declare-fun b!1396749 () Bool)

(assert (=> b!1396749 (= e!790747 (not e!790746))))

(declare-fun res!935665 () Bool)

(assert (=> b!1396749 (=> res!935665 e!790746)))

(assert (=> b!1396749 (= res!935665 (or (not ((_ is Intermediate!10427) lt!613665)) (undefined!11239 lt!613665)))))

(declare-fun e!790748 () Bool)

(assert (=> b!1396749 e!790748))

(declare-fun res!935658 () Bool)

(assert (=> b!1396749 (=> (not res!935658) (not e!790748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95513 (_ BitVec 32)) Bool)

(assert (=> b!1396749 (= res!935658 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46858 0))(
  ( (Unit!46859) )
))
(declare-fun lt!613662 () Unit!46858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46858)

(assert (=> b!1396749 (= lt!613662 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396749 (= lt!613665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613668 (select (arr!46110 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396749 (= lt!613668 (toIndex!0 (select (arr!46110 a!2901) j!112) mask!2840))))

(declare-fun b!1396750 () Bool)

(declare-fun res!935661 () Bool)

(assert (=> b!1396750 (=> (not res!935661) (not e!790747))))

(assert (=> b!1396750 (= res!935661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396751 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95513 (_ BitVec 32)) SeekEntryResult!10427)

(assert (=> b!1396751 (= e!790748 (= (seekEntryOrOpen!0 (select (arr!46110 a!2901) j!112) a!2901 mask!2840) (Found!10427 j!112)))))

(declare-fun b!1396752 () Bool)

(declare-fun res!935657 () Bool)

(assert (=> b!1396752 (=> (not res!935657) (not e!790747))))

(assert (=> b!1396752 (= res!935657 (and (= (size!46660 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46660 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46660 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119984 res!935659) b!1396752))

(assert (= (and b!1396752 res!935657) b!1396748))

(assert (= (and b!1396748 res!935662) b!1396745))

(assert (= (and b!1396745 res!935664) b!1396750))

(assert (= (and b!1396750 res!935661) b!1396744))

(assert (= (and b!1396744 res!935660) b!1396749))

(assert (= (and b!1396749 res!935658) b!1396751))

(assert (= (and b!1396749 (not res!935665)) b!1396746))

(assert (= (and b!1396746 (not res!935663)) b!1396747))

(declare-fun m!1283283 () Bool)

(assert (=> b!1396751 m!1283283))

(assert (=> b!1396751 m!1283283))

(declare-fun m!1283285 () Bool)

(assert (=> b!1396751 m!1283285))

(declare-fun m!1283287 () Bool)

(assert (=> b!1396748 m!1283287))

(assert (=> b!1396748 m!1283287))

(declare-fun m!1283289 () Bool)

(assert (=> b!1396748 m!1283289))

(declare-fun m!1283291 () Bool)

(assert (=> b!1396747 m!1283291))

(declare-fun m!1283293 () Bool)

(assert (=> start!119984 m!1283293))

(declare-fun m!1283295 () Bool)

(assert (=> start!119984 m!1283295))

(declare-fun m!1283297 () Bool)

(assert (=> b!1396744 m!1283297))

(declare-fun m!1283299 () Bool)

(assert (=> b!1396746 m!1283299))

(assert (=> b!1396746 m!1283299))

(declare-fun m!1283301 () Bool)

(assert (=> b!1396746 m!1283301))

(declare-fun m!1283303 () Bool)

(assert (=> b!1396746 m!1283303))

(declare-fun m!1283305 () Bool)

(assert (=> b!1396746 m!1283305))

(assert (=> b!1396745 m!1283283))

(assert (=> b!1396745 m!1283283))

(declare-fun m!1283307 () Bool)

(assert (=> b!1396745 m!1283307))

(declare-fun m!1283309 () Bool)

(assert (=> b!1396750 m!1283309))

(assert (=> b!1396749 m!1283283))

(declare-fun m!1283311 () Bool)

(assert (=> b!1396749 m!1283311))

(assert (=> b!1396749 m!1283283))

(declare-fun m!1283313 () Bool)

(assert (=> b!1396749 m!1283313))

(declare-fun m!1283315 () Bool)

(assert (=> b!1396749 m!1283315))

(assert (=> b!1396749 m!1283283))

(declare-fun m!1283317 () Bool)

(assert (=> b!1396749 m!1283317))

(check-sat (not b!1396744) (not b!1396751) (not b!1396748) (not b!1396750) (not start!119984) (not b!1396745) (not b!1396747) (not b!1396746) (not b!1396749))
(check-sat)
