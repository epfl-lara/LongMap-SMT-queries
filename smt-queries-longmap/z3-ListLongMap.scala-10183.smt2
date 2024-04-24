; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120212 () Bool)

(assert start!120212)

(declare-fun res!936656 () Bool)

(declare-fun e!791785 () Bool)

(assert (=> start!120212 (=> (not res!936656) (not e!791785))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120212 (= res!936656 (validMask!0 mask!2840))))

(assert (=> start!120212 e!791785))

(assert (=> start!120212 true))

(declare-datatypes ((array!95663 0))(
  ( (array!95664 (arr!46183 (Array (_ BitVec 32) (_ BitVec 64))) (size!46734 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95663)

(declare-fun array_inv!35464 (array!95663) Bool)

(assert (=> start!120212 (array_inv!35464 a!2901)))

(declare-fun b!1398424 () Bool)

(declare-fun res!936659 () Bool)

(assert (=> b!1398424 (=> (not res!936659) (not e!791785))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398424 (= res!936659 (and (= (size!46734 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46734 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46734 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398425 () Bool)

(declare-fun e!791783 () Bool)

(assert (=> b!1398425 (= e!791783 true)))

(declare-fun lt!614483 () (_ BitVec 64))

(declare-fun lt!614482 () array!95663)

(declare-datatypes ((SeekEntryResult!10403 0))(
  ( (MissingZero!10403 (index!43983 (_ BitVec 32))) (Found!10403 (index!43984 (_ BitVec 32))) (Intermediate!10403 (undefined!11215 Bool) (index!43985 (_ BitVec 32)) (x!125796 (_ BitVec 32))) (Undefined!10403) (MissingVacant!10403 (index!43986 (_ BitVec 32))) )
))
(declare-fun lt!614486 () SeekEntryResult!10403)

(declare-fun lt!614485 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95663 (_ BitVec 32)) SeekEntryResult!10403)

(assert (=> b!1398425 (= lt!614486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614485 lt!614483 lt!614482 mask!2840))))

(declare-fun e!791786 () Bool)

(declare-fun b!1398426 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95663 (_ BitVec 32)) SeekEntryResult!10403)

(assert (=> b!1398426 (= e!791786 (= (seekEntryOrOpen!0 (select (arr!46183 a!2901) j!112) a!2901 mask!2840) (Found!10403 j!112)))))

(declare-fun b!1398427 () Bool)

(declare-fun res!936655 () Bool)

(assert (=> b!1398427 (=> (not res!936655) (not e!791785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95663 (_ BitVec 32)) Bool)

(assert (=> b!1398427 (= res!936655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398428 () Bool)

(declare-fun res!936661 () Bool)

(assert (=> b!1398428 (=> (not res!936661) (not e!791785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398428 (= res!936661 (validKeyInArray!0 (select (arr!46183 a!2901) j!112)))))

(declare-fun b!1398429 () Bool)

(declare-fun e!791782 () Bool)

(assert (=> b!1398429 (= e!791785 (not e!791782))))

(declare-fun res!936660 () Bool)

(assert (=> b!1398429 (=> res!936660 e!791782)))

(declare-fun lt!614480 () SeekEntryResult!10403)

(get-info :version)

(assert (=> b!1398429 (= res!936660 (or (not ((_ is Intermediate!10403) lt!614480)) (undefined!11215 lt!614480)))))

(assert (=> b!1398429 e!791786))

(declare-fun res!936654 () Bool)

(assert (=> b!1398429 (=> (not res!936654) (not e!791786))))

(assert (=> b!1398429 (= res!936654 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46837 0))(
  ( (Unit!46838) )
))
(declare-fun lt!614481 () Unit!46837)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46837)

(assert (=> b!1398429 (= lt!614481 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398429 (= lt!614480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614485 (select (arr!46183 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398429 (= lt!614485 (toIndex!0 (select (arr!46183 a!2901) j!112) mask!2840))))

(declare-fun b!1398430 () Bool)

(declare-fun res!936653 () Bool)

(assert (=> b!1398430 (=> (not res!936653) (not e!791785))))

(assert (=> b!1398430 (= res!936653 (validKeyInArray!0 (select (arr!46183 a!2901) i!1037)))))

(declare-fun b!1398431 () Bool)

(declare-fun res!936657 () Bool)

(assert (=> b!1398431 (=> (not res!936657) (not e!791785))))

(declare-datatypes ((List!32689 0))(
  ( (Nil!32686) (Cons!32685 (h!33935 (_ BitVec 64)) (t!47375 List!32689)) )
))
(declare-fun arrayNoDuplicates!0 (array!95663 (_ BitVec 32) List!32689) Bool)

(assert (=> b!1398431 (= res!936657 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32686))))

(declare-fun b!1398432 () Bool)

(assert (=> b!1398432 (= e!791782 e!791783)))

(declare-fun res!936658 () Bool)

(assert (=> b!1398432 (=> res!936658 e!791783)))

(declare-fun lt!614484 () SeekEntryResult!10403)

(assert (=> b!1398432 (= res!936658 (or (= lt!614480 lt!614484) (not ((_ is Intermediate!10403) lt!614484)) (bvslt (x!125796 lt!614480) #b00000000000000000000000000000000) (bvsgt (x!125796 lt!614480) #b01111111111111111111111111111110) (bvslt lt!614485 #b00000000000000000000000000000000) (bvsge lt!614485 (size!46734 a!2901)) (bvslt (index!43985 lt!614480) #b00000000000000000000000000000000) (bvsge (index!43985 lt!614480) (size!46734 a!2901)) (not (= lt!614480 (Intermediate!10403 false (index!43985 lt!614480) (x!125796 lt!614480)))) (not (= lt!614484 (Intermediate!10403 (undefined!11215 lt!614484) (index!43985 lt!614484) (x!125796 lt!614484))))))))

(assert (=> b!1398432 (= lt!614484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614483 mask!2840) lt!614483 lt!614482 mask!2840))))

(assert (=> b!1398432 (= lt!614483 (select (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398432 (= lt!614482 (array!95664 (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46734 a!2901)))))

(assert (= (and start!120212 res!936656) b!1398424))

(assert (= (and b!1398424 res!936659) b!1398430))

(assert (= (and b!1398430 res!936653) b!1398428))

(assert (= (and b!1398428 res!936661) b!1398427))

(assert (= (and b!1398427 res!936655) b!1398431))

(assert (= (and b!1398431 res!936657) b!1398429))

(assert (= (and b!1398429 res!936654) b!1398426))

(assert (= (and b!1398429 (not res!936660)) b!1398432))

(assert (= (and b!1398432 (not res!936658)) b!1398425))

(declare-fun m!1285375 () Bool)

(assert (=> b!1398429 m!1285375))

(declare-fun m!1285377 () Bool)

(assert (=> b!1398429 m!1285377))

(assert (=> b!1398429 m!1285375))

(declare-fun m!1285379 () Bool)

(assert (=> b!1398429 m!1285379))

(declare-fun m!1285381 () Bool)

(assert (=> b!1398429 m!1285381))

(assert (=> b!1398429 m!1285375))

(declare-fun m!1285383 () Bool)

(assert (=> b!1398429 m!1285383))

(declare-fun m!1285385 () Bool)

(assert (=> b!1398431 m!1285385))

(declare-fun m!1285387 () Bool)

(assert (=> start!120212 m!1285387))

(declare-fun m!1285389 () Bool)

(assert (=> start!120212 m!1285389))

(assert (=> b!1398428 m!1285375))

(assert (=> b!1398428 m!1285375))

(declare-fun m!1285391 () Bool)

(assert (=> b!1398428 m!1285391))

(declare-fun m!1285393 () Bool)

(assert (=> b!1398432 m!1285393))

(assert (=> b!1398432 m!1285393))

(declare-fun m!1285395 () Bool)

(assert (=> b!1398432 m!1285395))

(declare-fun m!1285397 () Bool)

(assert (=> b!1398432 m!1285397))

(declare-fun m!1285399 () Bool)

(assert (=> b!1398432 m!1285399))

(declare-fun m!1285401 () Bool)

(assert (=> b!1398425 m!1285401))

(declare-fun m!1285403 () Bool)

(assert (=> b!1398430 m!1285403))

(assert (=> b!1398430 m!1285403))

(declare-fun m!1285405 () Bool)

(assert (=> b!1398430 m!1285405))

(declare-fun m!1285407 () Bool)

(assert (=> b!1398427 m!1285407))

(assert (=> b!1398426 m!1285375))

(assert (=> b!1398426 m!1285375))

(declare-fun m!1285409 () Bool)

(assert (=> b!1398426 m!1285409))

(check-sat (not b!1398428) (not b!1398427) (not b!1398431) (not start!120212) (not b!1398425) (not b!1398432) (not b!1398426) (not b!1398429) (not b!1398430))
(check-sat)
