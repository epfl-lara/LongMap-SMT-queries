; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119614 () Bool)

(assert start!119614)

(declare-fun b!1393307 () Bool)

(declare-fun res!932717 () Bool)

(declare-fun e!788951 () Bool)

(assert (=> b!1393307 (=> (not res!932717) (not e!788951))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95296 0))(
  ( (array!95297 (arr!46006 (Array (_ BitVec 32) (_ BitVec 64))) (size!46556 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95296)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393307 (= res!932717 (and (= (size!46556 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46556 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46556 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393308 () Bool)

(declare-fun res!932718 () Bool)

(assert (=> b!1393308 (=> (not res!932718) (not e!788951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95296 (_ BitVec 32)) Bool)

(assert (=> b!1393308 (= res!932718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393309 () Bool)

(declare-fun res!932722 () Bool)

(assert (=> b!1393309 (=> (not res!932722) (not e!788951))))

(declare-datatypes ((List!32525 0))(
  ( (Nil!32522) (Cons!32521 (h!33754 (_ BitVec 64)) (t!47219 List!32525)) )
))
(declare-fun arrayNoDuplicates!0 (array!95296 (_ BitVec 32) List!32525) Bool)

(assert (=> b!1393309 (= res!932722 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32522))))

(declare-fun b!1393310 () Bool)

(declare-fun e!788952 () Bool)

(assert (=> b!1393310 (= e!788951 (not e!788952))))

(declare-fun res!932716 () Bool)

(assert (=> b!1393310 (=> res!932716 e!788952)))

(declare-datatypes ((SeekEntryResult!10323 0))(
  ( (MissingZero!10323 (index!43663 (_ BitVec 32))) (Found!10323 (index!43664 (_ BitVec 32))) (Intermediate!10323 (undefined!11135 Bool) (index!43665 (_ BitVec 32)) (x!125343 (_ BitVec 32))) (Undefined!10323) (MissingVacant!10323 (index!43666 (_ BitVec 32))) )
))
(declare-fun lt!611943 () SeekEntryResult!10323)

(assert (=> b!1393310 (= res!932716 (or (not (is-Intermediate!10323 lt!611943)) (undefined!11135 lt!611943)))))

(declare-fun e!788953 () Bool)

(assert (=> b!1393310 e!788953))

(declare-fun res!932721 () Bool)

(assert (=> b!1393310 (=> (not res!932721) (not e!788953))))

(assert (=> b!1393310 (= res!932721 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46650 0))(
  ( (Unit!46651) )
))
(declare-fun lt!611941 () Unit!46650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46650)

(assert (=> b!1393310 (= lt!611941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95296 (_ BitVec 32)) SeekEntryResult!10323)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393310 (= lt!611943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46006 a!2901) j!112) mask!2840) (select (arr!46006 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932719 () Bool)

(assert (=> start!119614 (=> (not res!932719) (not e!788951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119614 (= res!932719 (validMask!0 mask!2840))))

(assert (=> start!119614 e!788951))

(assert (=> start!119614 true))

(declare-fun array_inv!35034 (array!95296) Bool)

(assert (=> start!119614 (array_inv!35034 a!2901)))

(declare-fun b!1393311 () Bool)

(declare-fun res!932720 () Bool)

(assert (=> b!1393311 (=> (not res!932720) (not e!788951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393311 (= res!932720 (validKeyInArray!0 (select (arr!46006 a!2901) j!112)))))

(declare-fun b!1393312 () Bool)

(assert (=> b!1393312 (= e!788952 true)))

(declare-fun lt!611942 () SeekEntryResult!10323)

(assert (=> b!1393312 (= lt!611942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46006 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46006 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95297 (store (arr!46006 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46556 a!2901)) mask!2840))))

(declare-fun b!1393313 () Bool)

(declare-fun res!932715 () Bool)

(assert (=> b!1393313 (=> (not res!932715) (not e!788951))))

(assert (=> b!1393313 (= res!932715 (validKeyInArray!0 (select (arr!46006 a!2901) i!1037)))))

(declare-fun b!1393314 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95296 (_ BitVec 32)) SeekEntryResult!10323)

(assert (=> b!1393314 (= e!788953 (= (seekEntryOrOpen!0 (select (arr!46006 a!2901) j!112) a!2901 mask!2840) (Found!10323 j!112)))))

(assert (= (and start!119614 res!932719) b!1393307))

(assert (= (and b!1393307 res!932717) b!1393313))

(assert (= (and b!1393313 res!932715) b!1393311))

(assert (= (and b!1393311 res!932720) b!1393308))

(assert (= (and b!1393308 res!932718) b!1393309))

(assert (= (and b!1393309 res!932722) b!1393310))

(assert (= (and b!1393310 res!932721) b!1393314))

(assert (= (and b!1393310 (not res!932716)) b!1393312))

(declare-fun m!1279163 () Bool)

(assert (=> b!1393314 m!1279163))

(assert (=> b!1393314 m!1279163))

(declare-fun m!1279165 () Bool)

(assert (=> b!1393314 m!1279165))

(assert (=> b!1393310 m!1279163))

(declare-fun m!1279167 () Bool)

(assert (=> b!1393310 m!1279167))

(assert (=> b!1393310 m!1279163))

(declare-fun m!1279169 () Bool)

(assert (=> b!1393310 m!1279169))

(assert (=> b!1393310 m!1279167))

(assert (=> b!1393310 m!1279163))

(declare-fun m!1279171 () Bool)

(assert (=> b!1393310 m!1279171))

(declare-fun m!1279173 () Bool)

(assert (=> b!1393310 m!1279173))

(declare-fun m!1279175 () Bool)

(assert (=> b!1393313 m!1279175))

(assert (=> b!1393313 m!1279175))

(declare-fun m!1279177 () Bool)

(assert (=> b!1393313 m!1279177))

(assert (=> b!1393311 m!1279163))

(assert (=> b!1393311 m!1279163))

(declare-fun m!1279179 () Bool)

(assert (=> b!1393311 m!1279179))

(declare-fun m!1279181 () Bool)

(assert (=> start!119614 m!1279181))

(declare-fun m!1279183 () Bool)

(assert (=> start!119614 m!1279183))

(declare-fun m!1279185 () Bool)

(assert (=> b!1393312 m!1279185))

(declare-fun m!1279187 () Bool)

(assert (=> b!1393312 m!1279187))

(assert (=> b!1393312 m!1279187))

(declare-fun m!1279189 () Bool)

(assert (=> b!1393312 m!1279189))

(assert (=> b!1393312 m!1279189))

(assert (=> b!1393312 m!1279187))

(declare-fun m!1279191 () Bool)

(assert (=> b!1393312 m!1279191))

(declare-fun m!1279193 () Bool)

(assert (=> b!1393309 m!1279193))

(declare-fun m!1279195 () Bool)

(assert (=> b!1393308 m!1279195))

(push 1)

(assert (not b!1393310))

(assert (not start!119614))

(assert (not b!1393311))

(assert (not b!1393308))

(assert (not b!1393309))

(assert (not b!1393314))

(assert (not b!1393312))

(assert (not b!1393313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

