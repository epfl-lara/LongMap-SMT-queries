; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119518 () Bool)

(assert start!119518)

(declare-fun b!1392538 () Bool)

(declare-fun res!932114 () Bool)

(declare-fun e!788540 () Bool)

(assert (=> b!1392538 (=> res!932114 e!788540)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95251 0))(
  ( (array!95252 (arr!45985 (Array (_ BitVec 32) (_ BitVec 64))) (size!46535 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95251)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10302 0))(
  ( (MissingZero!10302 (index!43579 (_ BitVec 32))) (Found!10302 (index!43580 (_ BitVec 32))) (Intermediate!10302 (undefined!11114 Bool) (index!43581 (_ BitVec 32)) (x!125260 (_ BitVec 32))) (Undefined!10302) (MissingVacant!10302 (index!43582 (_ BitVec 32))) )
))
(declare-fun lt!611643 () SeekEntryResult!10302)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95251 (_ BitVec 32)) SeekEntryResult!10302)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392538 (= res!932114 (not (= lt!611643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45985 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45985 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95252 (store (arr!45985 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46535 a!2901)) mask!2840))))))

(declare-fun b!1392539 () Bool)

(declare-fun e!788543 () Bool)

(assert (=> b!1392539 (= e!788543 (not e!788540))))

(declare-fun res!932117 () Bool)

(assert (=> b!1392539 (=> res!932117 e!788540)))

(assert (=> b!1392539 (= res!932117 (or (not (is-Intermediate!10302 lt!611643)) (undefined!11114 lt!611643)))))

(declare-fun e!788541 () Bool)

(assert (=> b!1392539 e!788541))

(declare-fun res!932115 () Bool)

(assert (=> b!1392539 (=> (not res!932115) (not e!788541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95251 (_ BitVec 32)) Bool)

(assert (=> b!1392539 (= res!932115 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46608 0))(
  ( (Unit!46609) )
))
(declare-fun lt!611642 () Unit!46608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46608)

(assert (=> b!1392539 (= lt!611642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1392539 (= lt!611643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45985 a!2901) j!112) mask!2840) (select (arr!45985 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932111 () Bool)

(assert (=> start!119518 (=> (not res!932111) (not e!788543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119518 (= res!932111 (validMask!0 mask!2840))))

(assert (=> start!119518 e!788543))

(assert (=> start!119518 true))

(declare-fun array_inv!35013 (array!95251) Bool)

(assert (=> start!119518 (array_inv!35013 a!2901)))

(declare-fun b!1392540 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95251 (_ BitVec 32)) SeekEntryResult!10302)

(assert (=> b!1392540 (= e!788541 (= (seekEntryOrOpen!0 (select (arr!45985 a!2901) j!112) a!2901 mask!2840) (Found!10302 j!112)))))

(declare-fun b!1392541 () Bool)

(declare-fun res!932119 () Bool)

(assert (=> b!1392541 (=> (not res!932119) (not e!788543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392541 (= res!932119 (validKeyInArray!0 (select (arr!45985 a!2901) i!1037)))))

(declare-fun b!1392542 () Bool)

(declare-fun res!932113 () Bool)

(assert (=> b!1392542 (=> (not res!932113) (not e!788543))))

(assert (=> b!1392542 (= res!932113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392543 () Bool)

(assert (=> b!1392543 (= e!788540 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1392544 () Bool)

(declare-fun res!932118 () Bool)

(assert (=> b!1392544 (=> (not res!932118) (not e!788543))))

(declare-datatypes ((List!32504 0))(
  ( (Nil!32501) (Cons!32500 (h!33730 (_ BitVec 64)) (t!47198 List!32504)) )
))
(declare-fun arrayNoDuplicates!0 (array!95251 (_ BitVec 32) List!32504) Bool)

(assert (=> b!1392544 (= res!932118 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32501))))

(declare-fun b!1392545 () Bool)

(declare-fun res!932112 () Bool)

(assert (=> b!1392545 (=> (not res!932112) (not e!788543))))

(assert (=> b!1392545 (= res!932112 (and (= (size!46535 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46535 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46535 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392546 () Bool)

(declare-fun res!932116 () Bool)

(assert (=> b!1392546 (=> (not res!932116) (not e!788543))))

(assert (=> b!1392546 (= res!932116 (validKeyInArray!0 (select (arr!45985 a!2901) j!112)))))

(assert (= (and start!119518 res!932111) b!1392545))

(assert (= (and b!1392545 res!932112) b!1392541))

(assert (= (and b!1392541 res!932119) b!1392546))

(assert (= (and b!1392546 res!932116) b!1392542))

(assert (= (and b!1392542 res!932113) b!1392544))

(assert (= (and b!1392544 res!932118) b!1392539))

(assert (= (and b!1392539 res!932115) b!1392540))

(assert (= (and b!1392539 (not res!932117)) b!1392538))

(assert (= (and b!1392538 (not res!932114)) b!1392543))

(declare-fun m!1278299 () Bool)

(assert (=> b!1392541 m!1278299))

(assert (=> b!1392541 m!1278299))

(declare-fun m!1278301 () Bool)

(assert (=> b!1392541 m!1278301))

(declare-fun m!1278303 () Bool)

(assert (=> b!1392546 m!1278303))

(assert (=> b!1392546 m!1278303))

(declare-fun m!1278305 () Bool)

(assert (=> b!1392546 m!1278305))

(declare-fun m!1278307 () Bool)

(assert (=> b!1392544 m!1278307))

(declare-fun m!1278309 () Bool)

(assert (=> b!1392538 m!1278309))

(declare-fun m!1278311 () Bool)

(assert (=> b!1392538 m!1278311))

(assert (=> b!1392538 m!1278311))

(declare-fun m!1278313 () Bool)

(assert (=> b!1392538 m!1278313))

(assert (=> b!1392538 m!1278313))

(assert (=> b!1392538 m!1278311))

(declare-fun m!1278315 () Bool)

(assert (=> b!1392538 m!1278315))

(assert (=> b!1392540 m!1278303))

(assert (=> b!1392540 m!1278303))

(declare-fun m!1278317 () Bool)

(assert (=> b!1392540 m!1278317))

(declare-fun m!1278319 () Bool)

(assert (=> start!119518 m!1278319))

(declare-fun m!1278321 () Bool)

(assert (=> start!119518 m!1278321))

(declare-fun m!1278323 () Bool)

(assert (=> b!1392542 m!1278323))

(assert (=> b!1392539 m!1278303))

(declare-fun m!1278325 () Bool)

(assert (=> b!1392539 m!1278325))

(assert (=> b!1392539 m!1278303))

(declare-fun m!1278327 () Bool)

(assert (=> b!1392539 m!1278327))

(assert (=> b!1392539 m!1278325))

(assert (=> b!1392539 m!1278303))

(declare-fun m!1278329 () Bool)

(assert (=> b!1392539 m!1278329))

(declare-fun m!1278331 () Bool)

(assert (=> b!1392539 m!1278331))

(push 1)

(assert (not start!119518))

(assert (not b!1392546))

(assert (not b!1392544))

(assert (not b!1392538))

(assert (not b!1392542))

