; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120870 () Bool)

(assert start!120870)

(declare-fun b!1406384 () Bool)

(declare-fun res!944604 () Bool)

(declare-fun e!796013 () Bool)

(assert (=> b!1406384 (=> (not res!944604) (not e!796013))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96177 0))(
  ( (array!96178 (arr!46436 (Array (_ BitVec 32) (_ BitVec 64))) (size!46986 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96177)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406384 (= res!944604 (and (= (size!46986 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46986 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46986 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406385 () Bool)

(declare-fun res!944606 () Bool)

(assert (=> b!1406385 (=> (not res!944606) (not e!796013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96177 (_ BitVec 32)) Bool)

(assert (=> b!1406385 (= res!944606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406386 () Bool)

(declare-fun res!944601 () Bool)

(assert (=> b!1406386 (=> (not res!944601) (not e!796013))))

(declare-datatypes ((List!32955 0))(
  ( (Nil!32952) (Cons!32951 (h!34205 (_ BitVec 64)) (t!47649 List!32955)) )
))
(declare-fun arrayNoDuplicates!0 (array!96177 (_ BitVec 32) List!32955) Bool)

(assert (=> b!1406386 (= res!944601 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32952))))

(declare-fun b!1406387 () Bool)

(declare-fun res!944607 () Bool)

(assert (=> b!1406387 (=> (not res!944607) (not e!796013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406387 (= res!944607 (validKeyInArray!0 (select (arr!46436 a!2901) j!112)))))

(declare-fun b!1406388 () Bool)

(declare-fun e!796014 () Bool)

(declare-datatypes ((SeekEntryResult!10747 0))(
  ( (MissingZero!10747 (index!45365 (_ BitVec 32))) (Found!10747 (index!45366 (_ BitVec 32))) (Intermediate!10747 (undefined!11559 Bool) (index!45367 (_ BitVec 32)) (x!126970 (_ BitVec 32))) (Undefined!10747) (MissingVacant!10747 (index!45368 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96177 (_ BitVec 32)) SeekEntryResult!10747)

(assert (=> b!1406388 (= e!796014 (= (seekEntryOrOpen!0 (select (arr!46436 a!2901) j!112) a!2901 mask!2840) (Found!10747 j!112)))))

(declare-fun res!944602 () Bool)

(assert (=> start!120870 (=> (not res!944602) (not e!796013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120870 (= res!944602 (validMask!0 mask!2840))))

(assert (=> start!120870 e!796013))

(assert (=> start!120870 true))

(declare-fun array_inv!35464 (array!96177) Bool)

(assert (=> start!120870 (array_inv!35464 a!2901)))

(declare-fun b!1406389 () Bool)

(declare-fun e!796015 () Bool)

(assert (=> b!1406389 (= e!796013 (not e!796015))))

(declare-fun res!944605 () Bool)

(assert (=> b!1406389 (=> res!944605 e!796015)))

(declare-fun lt!619365 () SeekEntryResult!10747)

(assert (=> b!1406389 (= res!944605 (or (not (is-Intermediate!10747 lt!619365)) (undefined!11559 lt!619365)))))

(assert (=> b!1406389 e!796014))

(declare-fun res!944608 () Bool)

(assert (=> b!1406389 (=> (not res!944608) (not e!796014))))

(assert (=> b!1406389 (= res!944608 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47468 0))(
  ( (Unit!47469) )
))
(declare-fun lt!619364 () Unit!47468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47468)

(assert (=> b!1406389 (= lt!619364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96177 (_ BitVec 32)) SeekEntryResult!10747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406389 (= lt!619365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46436 a!2901) j!112) mask!2840) (select (arr!46436 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406390 () Bool)

(declare-fun res!944603 () Bool)

(assert (=> b!1406390 (=> (not res!944603) (not e!796013))))

(assert (=> b!1406390 (= res!944603 (validKeyInArray!0 (select (arr!46436 a!2901) i!1037)))))

(declare-fun b!1406391 () Bool)

(assert (=> b!1406391 (= e!796015 true)))

(declare-fun lt!619363 () SeekEntryResult!10747)

(assert (=> b!1406391 (= lt!619363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46436 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46436 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96178 (store (arr!46436 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46986 a!2901)) mask!2840))))

(assert (= (and start!120870 res!944602) b!1406384))

(assert (= (and b!1406384 res!944604) b!1406390))

(assert (= (and b!1406390 res!944603) b!1406387))

(assert (= (and b!1406387 res!944607) b!1406385))

(assert (= (and b!1406385 res!944606) b!1406386))

(assert (= (and b!1406386 res!944601) b!1406389))

(assert (= (and b!1406389 res!944608) b!1406388))

(assert (= (and b!1406389 (not res!944605)) b!1406391))

(declare-fun m!1295505 () Bool)

(assert (=> b!1406386 m!1295505))

(declare-fun m!1295507 () Bool)

(assert (=> b!1406385 m!1295507))

(declare-fun m!1295509 () Bool)

(assert (=> b!1406387 m!1295509))

(assert (=> b!1406387 m!1295509))

(declare-fun m!1295511 () Bool)

(assert (=> b!1406387 m!1295511))

(declare-fun m!1295513 () Bool)

(assert (=> start!120870 m!1295513))

(declare-fun m!1295515 () Bool)

(assert (=> start!120870 m!1295515))

(assert (=> b!1406388 m!1295509))

(assert (=> b!1406388 m!1295509))

(declare-fun m!1295517 () Bool)

(assert (=> b!1406388 m!1295517))

(assert (=> b!1406389 m!1295509))

(declare-fun m!1295519 () Bool)

(assert (=> b!1406389 m!1295519))

(assert (=> b!1406389 m!1295509))

(declare-fun m!1295521 () Bool)

(assert (=> b!1406389 m!1295521))

(assert (=> b!1406389 m!1295519))

(assert (=> b!1406389 m!1295509))

(declare-fun m!1295523 () Bool)

(assert (=> b!1406389 m!1295523))

(declare-fun m!1295525 () Bool)

(assert (=> b!1406389 m!1295525))

(declare-fun m!1295527 () Bool)

(assert (=> b!1406391 m!1295527))

(declare-fun m!1295529 () Bool)

(assert (=> b!1406391 m!1295529))

(assert (=> b!1406391 m!1295529))

(declare-fun m!1295531 () Bool)

(assert (=> b!1406391 m!1295531))

(assert (=> b!1406391 m!1295531))

(assert (=> b!1406391 m!1295529))

(declare-fun m!1295533 () Bool)

(assert (=> b!1406391 m!1295533))

(declare-fun m!1295535 () Bool)

(assert (=> b!1406390 m!1295535))

(assert (=> b!1406390 m!1295535))

(declare-fun m!1295537 () Bool)

(assert (=> b!1406390 m!1295537))

(push 1)

(assert (not b!1406387))

(assert (not b!1406389))

(assert (not b!1406386))

(assert (not b!1406388))

(assert (not b!1406390))

(assert (not start!120870))

(assert (not b!1406391))

(assert (not b!1406385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

