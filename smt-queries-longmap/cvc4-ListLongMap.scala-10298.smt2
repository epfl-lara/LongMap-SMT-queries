; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121114 () Bool)

(assert start!121114)

(declare-fun b!1408195 () Bool)

(declare-fun res!945917 () Bool)

(declare-fun e!796983 () Bool)

(assert (=> b!1408195 (=> (not res!945917) (not e!796983))))

(declare-datatypes ((array!96268 0))(
  ( (array!96269 (arr!46477 (Array (_ BitVec 32) (_ BitVec 64))) (size!47027 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96268)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408195 (= res!945917 (validKeyInArray!0 (select (arr!46477 a!2901) j!112)))))

(declare-fun res!945919 () Bool)

(assert (=> start!121114 (=> (not res!945919) (not e!796983))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121114 (= res!945919 (validMask!0 mask!2840))))

(assert (=> start!121114 e!796983))

(assert (=> start!121114 true))

(declare-fun array_inv!35505 (array!96268) Bool)

(assert (=> start!121114 (array_inv!35505 a!2901)))

(declare-fun b!1408196 () Bool)

(declare-fun e!796985 () Bool)

(assert (=> b!1408196 (= e!796985 true)))

(declare-fun lt!620192 () array!96268)

(declare-fun lt!620188 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10788 0))(
  ( (MissingZero!10788 (index!45529 (_ BitVec 32))) (Found!10788 (index!45530 (_ BitVec 32))) (Intermediate!10788 (undefined!11600 Bool) (index!45531 (_ BitVec 32)) (x!127133 (_ BitVec 32))) (Undefined!10788) (MissingVacant!10788 (index!45532 (_ BitVec 32))) )
))
(declare-fun lt!620190 () SeekEntryResult!10788)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96268 (_ BitVec 32)) SeekEntryResult!10788)

(assert (=> b!1408196 (= lt!620190 (seekEntryOrOpen!0 lt!620188 lt!620192 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620187 () (_ BitVec 32))

(declare-fun lt!620189 () SeekEntryResult!10788)

(declare-datatypes ((Unit!47550 0))(
  ( (Unit!47551) )
))
(declare-fun lt!620193 () Unit!47550)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47550)

(assert (=> b!1408196 (= lt!620193 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620187 (x!127133 lt!620189) (index!45531 lt!620189) mask!2840))))

(declare-fun b!1408197 () Bool)

(declare-fun res!945918 () Bool)

(assert (=> b!1408197 (=> res!945918 e!796985)))

(assert (=> b!1408197 (= res!945918 (or (bvslt (x!127133 lt!620189) #b00000000000000000000000000000000) (bvsgt (x!127133 lt!620189) #b01111111111111111111111111111110) (bvslt lt!620187 #b00000000000000000000000000000000) (bvsge lt!620187 (size!47027 a!2901)) (bvslt (index!45531 lt!620189) #b00000000000000000000000000000000) (bvsge (index!45531 lt!620189) (size!47027 a!2901)) (not (= lt!620189 (Intermediate!10788 false (index!45531 lt!620189) (x!127133 lt!620189))))))))

(declare-fun b!1408198 () Bool)

(declare-fun e!796982 () Bool)

(assert (=> b!1408198 (= e!796982 e!796985)))

(declare-fun res!945925 () Bool)

(assert (=> b!1408198 (=> res!945925 e!796985)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96268 (_ BitVec 32)) SeekEntryResult!10788)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408198 (= res!945925 (not (= lt!620189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620188 mask!2840) lt!620188 lt!620192 mask!2840))))))

(assert (=> b!1408198 (= lt!620188 (select (store (arr!46477 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408198 (= lt!620192 (array!96269 (store (arr!46477 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47027 a!2901)))))

(declare-fun b!1408199 () Bool)

(assert (=> b!1408199 (= e!796983 (not e!796982))))

(declare-fun res!945923 () Bool)

(assert (=> b!1408199 (=> res!945923 e!796982)))

(assert (=> b!1408199 (= res!945923 (or (not (is-Intermediate!10788 lt!620189)) (undefined!11600 lt!620189)))))

(assert (=> b!1408199 (= lt!620190 (Found!10788 j!112))))

(assert (=> b!1408199 (= lt!620190 (seekEntryOrOpen!0 (select (arr!46477 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96268 (_ BitVec 32)) Bool)

(assert (=> b!1408199 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620191 () Unit!47550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47550)

(assert (=> b!1408199 (= lt!620191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408199 (= lt!620189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620187 (select (arr!46477 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408199 (= lt!620187 (toIndex!0 (select (arr!46477 a!2901) j!112) mask!2840))))

(declare-fun b!1408200 () Bool)

(declare-fun res!945921 () Bool)

(assert (=> b!1408200 (=> (not res!945921) (not e!796983))))

(assert (=> b!1408200 (= res!945921 (validKeyInArray!0 (select (arr!46477 a!2901) i!1037)))))

(declare-fun b!1408201 () Bool)

(declare-fun res!945924 () Bool)

(assert (=> b!1408201 (=> (not res!945924) (not e!796983))))

(declare-datatypes ((List!32996 0))(
  ( (Nil!32993) (Cons!32992 (h!34255 (_ BitVec 64)) (t!47690 List!32996)) )
))
(declare-fun arrayNoDuplicates!0 (array!96268 (_ BitVec 32) List!32996) Bool)

(assert (=> b!1408201 (= res!945924 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32993))))

(declare-fun b!1408202 () Bool)

(declare-fun res!945920 () Bool)

(assert (=> b!1408202 (=> (not res!945920) (not e!796983))))

(assert (=> b!1408202 (= res!945920 (and (= (size!47027 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47027 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47027 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408203 () Bool)

(declare-fun res!945922 () Bool)

(assert (=> b!1408203 (=> (not res!945922) (not e!796983))))

(assert (=> b!1408203 (= res!945922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121114 res!945919) b!1408202))

(assert (= (and b!1408202 res!945920) b!1408200))

(assert (= (and b!1408200 res!945921) b!1408195))

(assert (= (and b!1408195 res!945917) b!1408203))

(assert (= (and b!1408203 res!945922) b!1408201))

(assert (= (and b!1408201 res!945924) b!1408199))

(assert (= (and b!1408199 (not res!945923)) b!1408198))

(assert (= (and b!1408198 (not res!945925)) b!1408197))

(assert (= (and b!1408197 (not res!945918)) b!1408196))

(declare-fun m!1297393 () Bool)

(assert (=> b!1408199 m!1297393))

(declare-fun m!1297395 () Bool)

(assert (=> b!1408199 m!1297395))

(assert (=> b!1408199 m!1297393))

(declare-fun m!1297397 () Bool)

(assert (=> b!1408199 m!1297397))

(assert (=> b!1408199 m!1297393))

(declare-fun m!1297399 () Bool)

(assert (=> b!1408199 m!1297399))

(assert (=> b!1408199 m!1297393))

(declare-fun m!1297401 () Bool)

(assert (=> b!1408199 m!1297401))

(declare-fun m!1297403 () Bool)

(assert (=> b!1408199 m!1297403))

(declare-fun m!1297405 () Bool)

(assert (=> b!1408200 m!1297405))

(assert (=> b!1408200 m!1297405))

(declare-fun m!1297407 () Bool)

(assert (=> b!1408200 m!1297407))

(declare-fun m!1297409 () Bool)

(assert (=> b!1408196 m!1297409))

(declare-fun m!1297411 () Bool)

(assert (=> b!1408196 m!1297411))

(assert (=> b!1408195 m!1297393))

(assert (=> b!1408195 m!1297393))

(declare-fun m!1297413 () Bool)

(assert (=> b!1408195 m!1297413))

(declare-fun m!1297415 () Bool)

(assert (=> b!1408198 m!1297415))

(assert (=> b!1408198 m!1297415))

(declare-fun m!1297417 () Bool)

(assert (=> b!1408198 m!1297417))

(declare-fun m!1297419 () Bool)

(assert (=> b!1408198 m!1297419))

(declare-fun m!1297421 () Bool)

(assert (=> b!1408198 m!1297421))

(declare-fun m!1297423 () Bool)

(assert (=> start!121114 m!1297423))

(declare-fun m!1297425 () Bool)

(assert (=> start!121114 m!1297425))

(declare-fun m!1297427 () Bool)

(assert (=> b!1408203 m!1297427))

(declare-fun m!1297429 () Bool)

(assert (=> b!1408201 m!1297429))

(push 1)

