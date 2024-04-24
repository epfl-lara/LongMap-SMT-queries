; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119996 () Bool)

(assert start!119996)

(declare-fun res!935043 () Bool)

(declare-fun e!790698 () Bool)

(assert (=> start!119996 (=> (not res!935043) (not e!790698))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119996 (= res!935043 (validMask!0 mask!2840))))

(assert (=> start!119996 e!790698))

(assert (=> start!119996 true))

(declare-datatypes ((array!95549 0))(
  ( (array!95550 (arr!46129 (Array (_ BitVec 32) (_ BitVec 64))) (size!46680 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95549)

(declare-fun array_inv!35410 (array!95549) Bool)

(assert (=> start!119996 (array_inv!35410 a!2901)))

(declare-fun b!1396483 () Bool)

(declare-fun res!935048 () Bool)

(assert (=> b!1396483 (=> (not res!935048) (not e!790698))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396483 (= res!935048 (validKeyInArray!0 (select (arr!46129 a!2901) i!1037)))))

(declare-fun b!1396484 () Bool)

(declare-fun e!790700 () Bool)

(assert (=> b!1396484 (= e!790700 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1396485 () Bool)

(declare-fun res!935050 () Bool)

(assert (=> b!1396485 (=> res!935050 e!790700)))

(declare-datatypes ((SeekEntryResult!10349 0))(
  ( (MissingZero!10349 (index!43767 (_ BitVec 32))) (Found!10349 (index!43768 (_ BitVec 32))) (Intermediate!10349 (undefined!11161 Bool) (index!43769 (_ BitVec 32)) (x!125586 (_ BitVec 32))) (Undefined!10349) (MissingVacant!10349 (index!43770 (_ BitVec 32))) )
))
(declare-fun lt!613357 () SeekEntryResult!10349)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95549 (_ BitVec 32)) SeekEntryResult!10349)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396485 (= res!935050 (= lt!613357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46129 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46129 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95550 (store (arr!46129 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46680 a!2901)) mask!2840)))))

(declare-fun b!1396486 () Bool)

(declare-fun res!935049 () Bool)

(assert (=> b!1396486 (=> (not res!935049) (not e!790698))))

(assert (=> b!1396486 (= res!935049 (and (= (size!46680 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46680 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46680 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396487 () Bool)

(declare-fun res!935046 () Bool)

(assert (=> b!1396487 (=> (not res!935046) (not e!790698))))

(declare-datatypes ((List!32635 0))(
  ( (Nil!32632) (Cons!32631 (h!33875 (_ BitVec 64)) (t!47321 List!32635)) )
))
(declare-fun arrayNoDuplicates!0 (array!95549 (_ BitVec 32) List!32635) Bool)

(assert (=> b!1396487 (= res!935046 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32632))))

(declare-fun b!1396488 () Bool)

(declare-fun res!935045 () Bool)

(assert (=> b!1396488 (=> (not res!935045) (not e!790698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95549 (_ BitVec 32)) Bool)

(assert (=> b!1396488 (= res!935045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396489 () Bool)

(assert (=> b!1396489 (= e!790698 (not e!790700))))

(declare-fun res!935042 () Bool)

(assert (=> b!1396489 (=> res!935042 e!790700)))

(get-info :version)

(assert (=> b!1396489 (= res!935042 (or (not ((_ is Intermediate!10349) lt!613357)) (undefined!11161 lt!613357)))))

(declare-fun e!790697 () Bool)

(assert (=> b!1396489 e!790697))

(declare-fun res!935047 () Bool)

(assert (=> b!1396489 (=> (not res!935047) (not e!790697))))

(assert (=> b!1396489 (= res!935047 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46729 0))(
  ( (Unit!46730) )
))
(declare-fun lt!613358 () Unit!46729)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46729)

(assert (=> b!1396489 (= lt!613358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396489 (= lt!613357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46129 a!2901) j!112) mask!2840) (select (arr!46129 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396490 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95549 (_ BitVec 32)) SeekEntryResult!10349)

(assert (=> b!1396490 (= e!790697 (= (seekEntryOrOpen!0 (select (arr!46129 a!2901) j!112) a!2901 mask!2840) (Found!10349 j!112)))))

(declare-fun b!1396491 () Bool)

(declare-fun res!935044 () Bool)

(assert (=> b!1396491 (=> (not res!935044) (not e!790698))))

(assert (=> b!1396491 (= res!935044 (validKeyInArray!0 (select (arr!46129 a!2901) j!112)))))

(assert (= (and start!119996 res!935043) b!1396486))

(assert (= (and b!1396486 res!935049) b!1396483))

(assert (= (and b!1396483 res!935048) b!1396491))

(assert (= (and b!1396491 res!935044) b!1396488))

(assert (= (and b!1396488 res!935045) b!1396487))

(assert (= (and b!1396487 res!935046) b!1396489))

(assert (= (and b!1396489 res!935047) b!1396490))

(assert (= (and b!1396489 (not res!935042)) b!1396485))

(assert (= (and b!1396485 (not res!935050)) b!1396484))

(declare-fun m!1283167 () Bool)

(assert (=> b!1396485 m!1283167))

(declare-fun m!1283169 () Bool)

(assert (=> b!1396485 m!1283169))

(assert (=> b!1396485 m!1283169))

(declare-fun m!1283171 () Bool)

(assert (=> b!1396485 m!1283171))

(assert (=> b!1396485 m!1283171))

(assert (=> b!1396485 m!1283169))

(declare-fun m!1283173 () Bool)

(assert (=> b!1396485 m!1283173))

(declare-fun m!1283175 () Bool)

(assert (=> b!1396487 m!1283175))

(declare-fun m!1283177 () Bool)

(assert (=> b!1396489 m!1283177))

(declare-fun m!1283179 () Bool)

(assert (=> b!1396489 m!1283179))

(assert (=> b!1396489 m!1283177))

(declare-fun m!1283181 () Bool)

(assert (=> b!1396489 m!1283181))

(assert (=> b!1396489 m!1283179))

(assert (=> b!1396489 m!1283177))

(declare-fun m!1283183 () Bool)

(assert (=> b!1396489 m!1283183))

(declare-fun m!1283185 () Bool)

(assert (=> b!1396489 m!1283185))

(assert (=> b!1396490 m!1283177))

(assert (=> b!1396490 m!1283177))

(declare-fun m!1283187 () Bool)

(assert (=> b!1396490 m!1283187))

(declare-fun m!1283189 () Bool)

(assert (=> b!1396488 m!1283189))

(declare-fun m!1283191 () Bool)

(assert (=> start!119996 m!1283191))

(declare-fun m!1283193 () Bool)

(assert (=> start!119996 m!1283193))

(declare-fun m!1283195 () Bool)

(assert (=> b!1396483 m!1283195))

(assert (=> b!1396483 m!1283195))

(declare-fun m!1283197 () Bool)

(assert (=> b!1396483 m!1283197))

(assert (=> b!1396491 m!1283177))

(assert (=> b!1396491 m!1283177))

(declare-fun m!1283199 () Bool)

(assert (=> b!1396491 m!1283199))

(check-sat (not b!1396485) (not b!1396490) (not b!1396483) (not b!1396489) (not b!1396488) (not start!119996) (not b!1396487) (not b!1396491))
(check-sat)
