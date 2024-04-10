; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120108 () Bool)

(assert start!120108)

(declare-fun res!937344 () Bool)

(declare-fun e!791686 () Bool)

(assert (=> start!120108 (=> (not res!937344) (not e!791686))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120108 (= res!937344 (validMask!0 mask!2840))))

(assert (=> start!120108 e!791686))

(assert (=> start!120108 true))

(declare-datatypes ((array!95637 0))(
  ( (array!95638 (arr!46172 (Array (_ BitVec 32) (_ BitVec 64))) (size!46722 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95637)

(declare-fun array_inv!35200 (array!95637) Bool)

(assert (=> start!120108 (array_inv!35200 a!2901)))

(declare-fun b!1398427 () Bool)

(declare-fun res!937348 () Bool)

(assert (=> b!1398427 (=> (not res!937348) (not e!791686))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398427 (= res!937348 (validKeyInArray!0 (select (arr!46172 a!2901) i!1037)))))

(declare-fun b!1398428 () Bool)

(declare-fun e!791684 () Bool)

(assert (=> b!1398428 (= e!791684 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10489 0))(
  ( (MissingZero!10489 (index!44327 (_ BitVec 32))) (Found!10489 (index!44328 (_ BitVec 32))) (Intermediate!10489 (undefined!11301 Bool) (index!44329 (_ BitVec 32)) (x!125975 (_ BitVec 32))) (Undefined!10489) (MissingVacant!10489 (index!44330 (_ BitVec 32))) )
))
(declare-fun lt!614918 () SeekEntryResult!10489)

(declare-fun lt!614921 () SeekEntryResult!10489)

(assert (=> b!1398428 (and (not (undefined!11301 lt!614918)) (= (index!44329 lt!614918) i!1037) (bvslt (x!125975 lt!614918) (x!125975 lt!614921)) (= (select (store (arr!46172 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44329 lt!614918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614919 () (_ BitVec 32))

(declare-datatypes ((Unit!46982 0))(
  ( (Unit!46983) )
))
(declare-fun lt!614917 () Unit!46982)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46982)

(assert (=> b!1398428 (= lt!614917 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614919 (x!125975 lt!614921) (index!44329 lt!614921) (x!125975 lt!614918) (index!44329 lt!614918) (undefined!11301 lt!614918) mask!2840))))

(declare-fun b!1398429 () Bool)

(declare-fun res!937342 () Bool)

(assert (=> b!1398429 (=> (not res!937342) (not e!791686))))

(assert (=> b!1398429 (= res!937342 (and (= (size!46722 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46722 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46722 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398430 () Bool)

(declare-fun res!937346 () Bool)

(assert (=> b!1398430 (=> (not res!937346) (not e!791686))))

(declare-datatypes ((List!32691 0))(
  ( (Nil!32688) (Cons!32687 (h!33929 (_ BitVec 64)) (t!47385 List!32691)) )
))
(declare-fun arrayNoDuplicates!0 (array!95637 (_ BitVec 32) List!32691) Bool)

(assert (=> b!1398430 (= res!937346 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32688))))

(declare-fun b!1398431 () Bool)

(declare-fun res!937343 () Bool)

(assert (=> b!1398431 (=> (not res!937343) (not e!791686))))

(assert (=> b!1398431 (= res!937343 (validKeyInArray!0 (select (arr!46172 a!2901) j!112)))))

(declare-fun b!1398432 () Bool)

(declare-fun e!791687 () Bool)

(assert (=> b!1398432 (= e!791687 e!791684)))

(declare-fun res!937345 () Bool)

(assert (=> b!1398432 (=> res!937345 e!791684)))

(assert (=> b!1398432 (= res!937345 (or (= lt!614921 lt!614918) (not (is-Intermediate!10489 lt!614918))))))

(declare-fun lt!614920 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95637 (_ BitVec 32)) SeekEntryResult!10489)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398432 (= lt!614918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614920 mask!2840) lt!614920 (array!95638 (store (arr!46172 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46722 a!2901)) mask!2840))))

(assert (=> b!1398432 (= lt!614920 (select (store (arr!46172 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun e!791685 () Bool)

(declare-fun b!1398433 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95637 (_ BitVec 32)) SeekEntryResult!10489)

(assert (=> b!1398433 (= e!791685 (= (seekEntryOrOpen!0 (select (arr!46172 a!2901) j!112) a!2901 mask!2840) (Found!10489 j!112)))))

(declare-fun b!1398434 () Bool)

(assert (=> b!1398434 (= e!791686 (not e!791687))))

(declare-fun res!937341 () Bool)

(assert (=> b!1398434 (=> res!937341 e!791687)))

(assert (=> b!1398434 (= res!937341 (or (not (is-Intermediate!10489 lt!614921)) (undefined!11301 lt!614921)))))

(assert (=> b!1398434 e!791685))

(declare-fun res!937340 () Bool)

(assert (=> b!1398434 (=> (not res!937340) (not e!791685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95637 (_ BitVec 32)) Bool)

(assert (=> b!1398434 (= res!937340 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614922 () Unit!46982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46982)

(assert (=> b!1398434 (= lt!614922 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398434 (= lt!614921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614919 (select (arr!46172 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398434 (= lt!614919 (toIndex!0 (select (arr!46172 a!2901) j!112) mask!2840))))

(declare-fun b!1398435 () Bool)

(declare-fun res!937347 () Bool)

(assert (=> b!1398435 (=> (not res!937347) (not e!791686))))

(assert (=> b!1398435 (= res!937347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120108 res!937344) b!1398429))

(assert (= (and b!1398429 res!937342) b!1398427))

(assert (= (and b!1398427 res!937348) b!1398431))

(assert (= (and b!1398431 res!937343) b!1398435))

(assert (= (and b!1398435 res!937347) b!1398430))

(assert (= (and b!1398430 res!937346) b!1398434))

(assert (= (and b!1398434 res!937340) b!1398433))

(assert (= (and b!1398434 (not res!937341)) b!1398432))

(assert (= (and b!1398432 (not res!937345)) b!1398428))

(declare-fun m!1285551 () Bool)

(assert (=> b!1398430 m!1285551))

(declare-fun m!1285553 () Bool)

(assert (=> b!1398435 m!1285553))

(declare-fun m!1285555 () Bool)

(assert (=> b!1398434 m!1285555))

(declare-fun m!1285557 () Bool)

(assert (=> b!1398434 m!1285557))

(assert (=> b!1398434 m!1285555))

(assert (=> b!1398434 m!1285555))

(declare-fun m!1285559 () Bool)

(assert (=> b!1398434 m!1285559))

(declare-fun m!1285561 () Bool)

(assert (=> b!1398434 m!1285561))

(declare-fun m!1285563 () Bool)

(assert (=> b!1398434 m!1285563))

(declare-fun m!1285565 () Bool)

(assert (=> start!120108 m!1285565))

(declare-fun m!1285567 () Bool)

(assert (=> start!120108 m!1285567))

(assert (=> b!1398433 m!1285555))

(assert (=> b!1398433 m!1285555))

(declare-fun m!1285569 () Bool)

(assert (=> b!1398433 m!1285569))

(declare-fun m!1285571 () Bool)

(assert (=> b!1398427 m!1285571))

(assert (=> b!1398427 m!1285571))

(declare-fun m!1285573 () Bool)

(assert (=> b!1398427 m!1285573))

(declare-fun m!1285575 () Bool)

(assert (=> b!1398432 m!1285575))

(declare-fun m!1285577 () Bool)

(assert (=> b!1398432 m!1285577))

(assert (=> b!1398432 m!1285575))

(declare-fun m!1285579 () Bool)

(assert (=> b!1398432 m!1285579))

(declare-fun m!1285581 () Bool)

(assert (=> b!1398432 m!1285581))

(assert (=> b!1398428 m!1285577))

(declare-fun m!1285583 () Bool)

(assert (=> b!1398428 m!1285583))

(declare-fun m!1285585 () Bool)

(assert (=> b!1398428 m!1285585))

(assert (=> b!1398431 m!1285555))

(assert (=> b!1398431 m!1285555))

(declare-fun m!1285587 () Bool)

(assert (=> b!1398431 m!1285587))

(push 1)

