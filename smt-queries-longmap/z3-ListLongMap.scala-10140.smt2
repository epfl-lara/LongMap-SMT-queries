; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119606 () Bool)

(assert start!119606)

(declare-fun res!932619 () Bool)

(declare-fun e!788904 () Bool)

(assert (=> start!119606 (=> (not res!932619) (not e!788904))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119606 (= res!932619 (validMask!0 mask!2840))))

(assert (=> start!119606 e!788904))

(assert (=> start!119606 true))

(declare-datatypes ((array!95288 0))(
  ( (array!95289 (arr!46002 (Array (_ BitVec 32) (_ BitVec 64))) (size!46552 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95288)

(declare-fun array_inv!35030 (array!95288) Bool)

(assert (=> start!119606 (array_inv!35030 a!2901)))

(declare-fun b!1393211 () Bool)

(declare-fun e!788905 () Bool)

(assert (=> b!1393211 (= e!788905 true)))

(declare-datatypes ((SeekEntryResult!10319 0))(
  ( (MissingZero!10319 (index!43647 (_ BitVec 32))) (Found!10319 (index!43648 (_ BitVec 32))) (Intermediate!10319 (undefined!11131 Bool) (index!43649 (_ BitVec 32)) (x!125331 (_ BitVec 32))) (Undefined!10319) (MissingVacant!10319 (index!43650 (_ BitVec 32))) )
))
(declare-fun lt!611907 () SeekEntryResult!10319)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95288 (_ BitVec 32)) SeekEntryResult!10319)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393211 (= lt!611907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46002 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46002 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95289 (store (arr!46002 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46552 a!2901)) mask!2840))))

(declare-fun b!1393212 () Bool)

(declare-fun res!932621 () Bool)

(assert (=> b!1393212 (=> (not res!932621) (not e!788904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393212 (= res!932621 (validKeyInArray!0 (select (arr!46002 a!2901) i!1037)))))

(declare-fun b!1393213 () Bool)

(declare-fun e!788903 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95288 (_ BitVec 32)) SeekEntryResult!10319)

(assert (=> b!1393213 (= e!788903 (= (seekEntryOrOpen!0 (select (arr!46002 a!2901) j!112) a!2901 mask!2840) (Found!10319 j!112)))))

(declare-fun b!1393214 () Bool)

(assert (=> b!1393214 (= e!788904 (not e!788905))))

(declare-fun res!932622 () Bool)

(assert (=> b!1393214 (=> res!932622 e!788905)))

(declare-fun lt!611906 () SeekEntryResult!10319)

(get-info :version)

(assert (=> b!1393214 (= res!932622 (or (not ((_ is Intermediate!10319) lt!611906)) (undefined!11131 lt!611906)))))

(assert (=> b!1393214 e!788903))

(declare-fun res!932623 () Bool)

(assert (=> b!1393214 (=> (not res!932623) (not e!788903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95288 (_ BitVec 32)) Bool)

(assert (=> b!1393214 (= res!932623 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46642 0))(
  ( (Unit!46643) )
))
(declare-fun lt!611905 () Unit!46642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46642)

(assert (=> b!1393214 (= lt!611905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393214 (= lt!611906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46002 a!2901) j!112) mask!2840) (select (arr!46002 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393215 () Bool)

(declare-fun res!932625 () Bool)

(assert (=> b!1393215 (=> (not res!932625) (not e!788904))))

(assert (=> b!1393215 (= res!932625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393216 () Bool)

(declare-fun res!932624 () Bool)

(assert (=> b!1393216 (=> (not res!932624) (not e!788904))))

(declare-datatypes ((List!32521 0))(
  ( (Nil!32518) (Cons!32517 (h!33750 (_ BitVec 64)) (t!47215 List!32521)) )
))
(declare-fun arrayNoDuplicates!0 (array!95288 (_ BitVec 32) List!32521) Bool)

(assert (=> b!1393216 (= res!932624 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32518))))

(declare-fun b!1393217 () Bool)

(declare-fun res!932620 () Bool)

(assert (=> b!1393217 (=> (not res!932620) (not e!788904))))

(assert (=> b!1393217 (= res!932620 (and (= (size!46552 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46552 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46552 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393218 () Bool)

(declare-fun res!932626 () Bool)

(assert (=> b!1393218 (=> (not res!932626) (not e!788904))))

(assert (=> b!1393218 (= res!932626 (validKeyInArray!0 (select (arr!46002 a!2901) j!112)))))

(assert (= (and start!119606 res!932619) b!1393217))

(assert (= (and b!1393217 res!932620) b!1393212))

(assert (= (and b!1393212 res!932621) b!1393218))

(assert (= (and b!1393218 res!932626) b!1393215))

(assert (= (and b!1393215 res!932625) b!1393216))

(assert (= (and b!1393216 res!932624) b!1393214))

(assert (= (and b!1393214 res!932623) b!1393213))

(assert (= (and b!1393214 (not res!932622)) b!1393211))

(declare-fun m!1279027 () Bool)

(assert (=> b!1393218 m!1279027))

(assert (=> b!1393218 m!1279027))

(declare-fun m!1279029 () Bool)

(assert (=> b!1393218 m!1279029))

(declare-fun m!1279031 () Bool)

(assert (=> b!1393212 m!1279031))

(assert (=> b!1393212 m!1279031))

(declare-fun m!1279033 () Bool)

(assert (=> b!1393212 m!1279033))

(declare-fun m!1279035 () Bool)

(assert (=> start!119606 m!1279035))

(declare-fun m!1279037 () Bool)

(assert (=> start!119606 m!1279037))

(assert (=> b!1393213 m!1279027))

(assert (=> b!1393213 m!1279027))

(declare-fun m!1279039 () Bool)

(assert (=> b!1393213 m!1279039))

(declare-fun m!1279041 () Bool)

(assert (=> b!1393216 m!1279041))

(declare-fun m!1279043 () Bool)

(assert (=> b!1393211 m!1279043))

(declare-fun m!1279045 () Bool)

(assert (=> b!1393211 m!1279045))

(assert (=> b!1393211 m!1279045))

(declare-fun m!1279047 () Bool)

(assert (=> b!1393211 m!1279047))

(assert (=> b!1393211 m!1279047))

(assert (=> b!1393211 m!1279045))

(declare-fun m!1279049 () Bool)

(assert (=> b!1393211 m!1279049))

(assert (=> b!1393214 m!1279027))

(declare-fun m!1279051 () Bool)

(assert (=> b!1393214 m!1279051))

(assert (=> b!1393214 m!1279027))

(declare-fun m!1279053 () Bool)

(assert (=> b!1393214 m!1279053))

(assert (=> b!1393214 m!1279051))

(assert (=> b!1393214 m!1279027))

(declare-fun m!1279055 () Bool)

(assert (=> b!1393214 m!1279055))

(declare-fun m!1279057 () Bool)

(assert (=> b!1393214 m!1279057))

(declare-fun m!1279059 () Bool)

(assert (=> b!1393215 m!1279059))

(check-sat (not b!1393213) (not b!1393218) (not start!119606) (not b!1393214) (not b!1393215) (not b!1393211) (not b!1393216) (not b!1393212))
(check-sat)
