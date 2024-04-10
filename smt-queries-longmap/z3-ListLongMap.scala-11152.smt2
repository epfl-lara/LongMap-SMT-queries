; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130276 () Bool)

(assert start!130276)

(declare-fun b!1529532 () Bool)

(declare-fun res!1047250 () Bool)

(declare-fun e!852372 () Bool)

(assert (=> b!1529532 (=> (not res!1047250) (not e!852372))))

(declare-datatypes ((array!101626 0))(
  ( (array!101627 (arr!49038 (Array (_ BitVec 32) (_ BitVec 64))) (size!49588 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101626)

(declare-datatypes ((List!35521 0))(
  ( (Nil!35518) (Cons!35517 (h!36953 (_ BitVec 64)) (t!50215 List!35521)) )
))
(declare-fun arrayNoDuplicates!0 (array!101626 (_ BitVec 32) List!35521) Bool)

(assert (=> b!1529532 (= res!1047250 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35518))))

(declare-fun b!1529533 () Bool)

(declare-fun res!1047241 () Bool)

(assert (=> b!1529533 (=> (not res!1047241) (not e!852372))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529533 (= res!1047241 (validKeyInArray!0 (select (arr!49038 a!2804) i!961)))))

(declare-fun b!1529534 () Bool)

(declare-fun res!1047247 () Bool)

(assert (=> b!1529534 (=> (not res!1047247) (not e!852372))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529534 (= res!1047247 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49588 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49588 a!2804))))))

(declare-fun b!1529535 () Bool)

(declare-fun res!1047249 () Bool)

(assert (=> b!1529535 (=> (not res!1047249) (not e!852372))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1529535 (= res!1047249 (and (= (size!49588 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49588 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49588 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529536 () Bool)

(declare-fun res!1047248 () Bool)

(assert (=> b!1529536 (=> (not res!1047248) (not e!852372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101626 (_ BitVec 32)) Bool)

(assert (=> b!1529536 (= res!1047248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!852371 () Bool)

(declare-fun b!1529537 () Bool)

(declare-datatypes ((SeekEntryResult!13203 0))(
  ( (MissingZero!13203 (index!55207 (_ BitVec 32))) (Found!13203 (index!55208 (_ BitVec 32))) (Intermediate!13203 (undefined!14015 Bool) (index!55209 (_ BitVec 32)) (x!136890 (_ BitVec 32))) (Undefined!13203) (MissingVacant!13203 (index!55210 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101626 (_ BitVec 32)) SeekEntryResult!13203)

(assert (=> b!1529537 (= e!852371 (= (seekEntry!0 (select (arr!49038 a!2804) j!70) a!2804 mask!2512) (Found!13203 j!70)))))

(declare-fun b!1529538 () Bool)

(declare-fun e!852373 () Bool)

(assert (=> b!1529538 (= e!852373 true)))

(declare-fun lt!662466 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529538 (= lt!662466 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529539 () Bool)

(declare-fun res!1047239 () Bool)

(assert (=> b!1529539 (=> (not res!1047239) (not e!852372))))

(assert (=> b!1529539 (= res!1047239 (validKeyInArray!0 (select (arr!49038 a!2804) j!70)))))

(declare-fun b!1529540 () Bool)

(declare-fun e!852369 () Bool)

(assert (=> b!1529540 (= e!852369 (not e!852373))))

(declare-fun res!1047246 () Bool)

(assert (=> b!1529540 (=> res!1047246 e!852373)))

(assert (=> b!1529540 (= res!1047246 (or (not (= (select (arr!49038 a!2804) j!70) (select (store (arr!49038 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529540 e!852371))

(declare-fun res!1047242 () Bool)

(assert (=> b!1529540 (=> (not res!1047242) (not e!852371))))

(assert (=> b!1529540 (= res!1047242 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51190 0))(
  ( (Unit!51191) )
))
(declare-fun lt!662465 () Unit!51190)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51190)

(assert (=> b!1529540 (= lt!662465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1047244 () Bool)

(assert (=> start!130276 (=> (not res!1047244) (not e!852372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130276 (= res!1047244 (validMask!0 mask!2512))))

(assert (=> start!130276 e!852372))

(assert (=> start!130276 true))

(declare-fun array_inv!38066 (array!101626) Bool)

(assert (=> start!130276 (array_inv!38066 a!2804)))

(declare-fun b!1529541 () Bool)

(assert (=> b!1529541 (= e!852372 e!852369)))

(declare-fun res!1047245 () Bool)

(assert (=> b!1529541 (=> (not res!1047245) (not e!852369))))

(declare-fun lt!662467 () SeekEntryResult!13203)

(declare-fun lt!662464 () SeekEntryResult!13203)

(assert (=> b!1529541 (= res!1047245 (= lt!662467 lt!662464))))

(assert (=> b!1529541 (= lt!662464 (Intermediate!13203 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101626 (_ BitVec 32)) SeekEntryResult!13203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529541 (= lt!662467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49038 a!2804) j!70) mask!2512) (select (arr!49038 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529542 () Bool)

(declare-fun res!1047243 () Bool)

(assert (=> b!1529542 (=> (not res!1047243) (not e!852369))))

(assert (=> b!1529542 (= res!1047243 (= lt!662467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49038 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49038 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101627 (store (arr!49038 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49588 a!2804)) mask!2512)))))

(declare-fun b!1529543 () Bool)

(declare-fun res!1047240 () Bool)

(assert (=> b!1529543 (=> (not res!1047240) (not e!852369))))

(assert (=> b!1529543 (= res!1047240 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49038 a!2804) j!70) a!2804 mask!2512) lt!662464))))

(assert (= (and start!130276 res!1047244) b!1529535))

(assert (= (and b!1529535 res!1047249) b!1529533))

(assert (= (and b!1529533 res!1047241) b!1529539))

(assert (= (and b!1529539 res!1047239) b!1529536))

(assert (= (and b!1529536 res!1047248) b!1529532))

(assert (= (and b!1529532 res!1047250) b!1529534))

(assert (= (and b!1529534 res!1047247) b!1529541))

(assert (= (and b!1529541 res!1047245) b!1529543))

(assert (= (and b!1529543 res!1047240) b!1529542))

(assert (= (and b!1529542 res!1047243) b!1529540))

(assert (= (and b!1529540 res!1047242) b!1529537))

(assert (= (and b!1529540 (not res!1047246)) b!1529538))

(declare-fun m!1412483 () Bool)

(assert (=> b!1529532 m!1412483))

(declare-fun m!1412485 () Bool)

(assert (=> b!1529538 m!1412485))

(declare-fun m!1412487 () Bool)

(assert (=> b!1529541 m!1412487))

(assert (=> b!1529541 m!1412487))

(declare-fun m!1412489 () Bool)

(assert (=> b!1529541 m!1412489))

(assert (=> b!1529541 m!1412489))

(assert (=> b!1529541 m!1412487))

(declare-fun m!1412491 () Bool)

(assert (=> b!1529541 m!1412491))

(assert (=> b!1529543 m!1412487))

(assert (=> b!1529543 m!1412487))

(declare-fun m!1412493 () Bool)

(assert (=> b!1529543 m!1412493))

(assert (=> b!1529537 m!1412487))

(assert (=> b!1529537 m!1412487))

(declare-fun m!1412495 () Bool)

(assert (=> b!1529537 m!1412495))

(assert (=> b!1529540 m!1412487))

(declare-fun m!1412497 () Bool)

(assert (=> b!1529540 m!1412497))

(declare-fun m!1412499 () Bool)

(assert (=> b!1529540 m!1412499))

(declare-fun m!1412501 () Bool)

(assert (=> b!1529540 m!1412501))

(declare-fun m!1412503 () Bool)

(assert (=> b!1529540 m!1412503))

(declare-fun m!1412505 () Bool)

(assert (=> b!1529533 m!1412505))

(assert (=> b!1529533 m!1412505))

(declare-fun m!1412507 () Bool)

(assert (=> b!1529533 m!1412507))

(declare-fun m!1412509 () Bool)

(assert (=> b!1529536 m!1412509))

(assert (=> b!1529539 m!1412487))

(assert (=> b!1529539 m!1412487))

(declare-fun m!1412511 () Bool)

(assert (=> b!1529539 m!1412511))

(declare-fun m!1412513 () Bool)

(assert (=> start!130276 m!1412513))

(declare-fun m!1412515 () Bool)

(assert (=> start!130276 m!1412515))

(assert (=> b!1529542 m!1412499))

(assert (=> b!1529542 m!1412501))

(assert (=> b!1529542 m!1412501))

(declare-fun m!1412517 () Bool)

(assert (=> b!1529542 m!1412517))

(assert (=> b!1529542 m!1412517))

(assert (=> b!1529542 m!1412501))

(declare-fun m!1412519 () Bool)

(assert (=> b!1529542 m!1412519))

(check-sat (not b!1529533) (not b!1529540) (not b!1529536) (not b!1529543) (not b!1529541) (not b!1529539) (not b!1529532) (not b!1529542) (not b!1529538) (not b!1529537) (not start!130276))
(check-sat)
