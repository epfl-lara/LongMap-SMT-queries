; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120110 () Bool)

(assert start!120110)

(declare-fun b!1398427 () Bool)

(declare-fun e!791693 () Bool)

(declare-fun e!791692 () Bool)

(assert (=> b!1398427 (= e!791693 e!791692)))

(declare-fun res!937394 () Bool)

(assert (=> b!1398427 (=> res!937394 e!791692)))

(declare-datatypes ((SeekEntryResult!10493 0))(
  ( (MissingZero!10493 (index!44343 (_ BitVec 32))) (Found!10493 (index!44344 (_ BitVec 32))) (Intermediate!10493 (undefined!11305 Bool) (index!44345 (_ BitVec 32)) (x!125984 (_ BitVec 32))) (Undefined!10493) (MissingVacant!10493 (index!44346 (_ BitVec 32))) )
))
(declare-fun lt!614785 () SeekEntryResult!10493)

(declare-fun lt!614786 () SeekEntryResult!10493)

(get-info :version)

(assert (=> b!1398427 (= res!937394 (or (= lt!614785 lt!614786) (not ((_ is Intermediate!10493) lt!614786))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95592 0))(
  ( (array!95593 (arr!46150 (Array (_ BitVec 32) (_ BitVec 64))) (size!46702 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95592)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614782 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95592 (_ BitVec 32)) SeekEntryResult!10493)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398427 (= lt!614786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614782 mask!2840) lt!614782 (array!95593 (store (arr!46150 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46702 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398427 (= lt!614782 (select (store (arr!46150 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398428 () Bool)

(declare-fun res!937393 () Bool)

(declare-fun e!791690 () Bool)

(assert (=> b!1398428 (=> (not res!937393) (not e!791690))))

(assert (=> b!1398428 (= res!937393 (and (= (size!46702 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46702 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46702 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398429 () Bool)

(declare-fun res!937392 () Bool)

(assert (=> b!1398429 (=> (not res!937392) (not e!791690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398429 (= res!937392 (validKeyInArray!0 (select (arr!46150 a!2901) i!1037)))))

(declare-fun res!937396 () Bool)

(assert (=> start!120110 (=> (not res!937396) (not e!791690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120110 (= res!937396 (validMask!0 mask!2840))))

(assert (=> start!120110 e!791690))

(assert (=> start!120110 true))

(declare-fun array_inv!35383 (array!95592) Bool)

(assert (=> start!120110 (array_inv!35383 a!2901)))

(declare-fun b!1398430 () Bool)

(assert (=> b!1398430 (= e!791690 (not e!791693))))

(declare-fun res!937391 () Bool)

(assert (=> b!1398430 (=> res!937391 e!791693)))

(assert (=> b!1398430 (= res!937391 (or (not ((_ is Intermediate!10493) lt!614785)) (undefined!11305 lt!614785)))))

(declare-fun e!791689 () Bool)

(assert (=> b!1398430 e!791689))

(declare-fun res!937395 () Bool)

(assert (=> b!1398430 (=> (not res!937395) (not e!791689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95592 (_ BitVec 32)) Bool)

(assert (=> b!1398430 (= res!937395 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46833 0))(
  ( (Unit!46834) )
))
(declare-fun lt!614784 () Unit!46833)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46833)

(assert (=> b!1398430 (= lt!614784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614783 () (_ BitVec 32))

(assert (=> b!1398430 (= lt!614785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614783 (select (arr!46150 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398430 (= lt!614783 (toIndex!0 (select (arr!46150 a!2901) j!112) mask!2840))))

(declare-fun b!1398431 () Bool)

(declare-fun res!937397 () Bool)

(assert (=> b!1398431 (=> (not res!937397) (not e!791690))))

(assert (=> b!1398431 (= res!937397 (validKeyInArray!0 (select (arr!46150 a!2901) j!112)))))

(declare-fun b!1398432 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95592 (_ BitVec 32)) SeekEntryResult!10493)

(assert (=> b!1398432 (= e!791689 (= (seekEntryOrOpen!0 (select (arr!46150 a!2901) j!112) a!2901 mask!2840) (Found!10493 j!112)))))

(declare-fun b!1398433 () Bool)

(declare-fun res!937398 () Bool)

(assert (=> b!1398433 (=> (not res!937398) (not e!791690))))

(assert (=> b!1398433 (= res!937398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398434 () Bool)

(assert (=> b!1398434 (= e!791692 true)))

(assert (=> b!1398434 (and (not (undefined!11305 lt!614786)) (= (index!44345 lt!614786) i!1037) (bvslt (x!125984 lt!614786) (x!125984 lt!614785)) (= (select (store (arr!46150 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44345 lt!614786)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614781 () Unit!46833)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46833)

(assert (=> b!1398434 (= lt!614781 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614783 (x!125984 lt!614785) (index!44345 lt!614785) (x!125984 lt!614786) (index!44345 lt!614786) (undefined!11305 lt!614786) mask!2840))))

(declare-fun b!1398435 () Bool)

(declare-fun res!937399 () Bool)

(assert (=> b!1398435 (=> (not res!937399) (not e!791690))))

(declare-datatypes ((List!32747 0))(
  ( (Nil!32744) (Cons!32743 (h!33985 (_ BitVec 64)) (t!47433 List!32747)) )
))
(declare-fun arrayNoDuplicates!0 (array!95592 (_ BitVec 32) List!32747) Bool)

(assert (=> b!1398435 (= res!937399 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32744))))

(assert (= (and start!120110 res!937396) b!1398428))

(assert (= (and b!1398428 res!937393) b!1398429))

(assert (= (and b!1398429 res!937392) b!1398431))

(assert (= (and b!1398431 res!937397) b!1398433))

(assert (= (and b!1398433 res!937398) b!1398435))

(assert (= (and b!1398435 res!937399) b!1398430))

(assert (= (and b!1398430 res!937395) b!1398432))

(assert (= (and b!1398430 (not res!937391)) b!1398427))

(assert (= (and b!1398427 (not res!937394)) b!1398434))

(declare-fun m!1285129 () Bool)

(assert (=> b!1398434 m!1285129))

(declare-fun m!1285131 () Bool)

(assert (=> b!1398434 m!1285131))

(declare-fun m!1285133 () Bool)

(assert (=> b!1398434 m!1285133))

(declare-fun m!1285135 () Bool)

(assert (=> b!1398429 m!1285135))

(assert (=> b!1398429 m!1285135))

(declare-fun m!1285137 () Bool)

(assert (=> b!1398429 m!1285137))

(declare-fun m!1285139 () Bool)

(assert (=> b!1398432 m!1285139))

(assert (=> b!1398432 m!1285139))

(declare-fun m!1285141 () Bool)

(assert (=> b!1398432 m!1285141))

(assert (=> b!1398430 m!1285139))

(declare-fun m!1285143 () Bool)

(assert (=> b!1398430 m!1285143))

(assert (=> b!1398430 m!1285139))

(declare-fun m!1285145 () Bool)

(assert (=> b!1398430 m!1285145))

(assert (=> b!1398430 m!1285139))

(declare-fun m!1285147 () Bool)

(assert (=> b!1398430 m!1285147))

(declare-fun m!1285149 () Bool)

(assert (=> b!1398430 m!1285149))

(declare-fun m!1285151 () Bool)

(assert (=> b!1398435 m!1285151))

(declare-fun m!1285153 () Bool)

(assert (=> b!1398433 m!1285153))

(declare-fun m!1285155 () Bool)

(assert (=> b!1398427 m!1285155))

(assert (=> b!1398427 m!1285129))

(assert (=> b!1398427 m!1285155))

(declare-fun m!1285157 () Bool)

(assert (=> b!1398427 m!1285157))

(declare-fun m!1285159 () Bool)

(assert (=> b!1398427 m!1285159))

(assert (=> b!1398431 m!1285139))

(assert (=> b!1398431 m!1285139))

(declare-fun m!1285161 () Bool)

(assert (=> b!1398431 m!1285161))

(declare-fun m!1285163 () Bool)

(assert (=> start!120110 m!1285163))

(declare-fun m!1285165 () Bool)

(assert (=> start!120110 m!1285165))

(check-sat (not b!1398434) (not b!1398435) (not b!1398432) (not b!1398433) (not b!1398431) (not b!1398430) (not start!120110) (not b!1398429) (not b!1398427))
(check-sat)
