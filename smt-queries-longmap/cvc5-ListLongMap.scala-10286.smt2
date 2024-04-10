; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120876 () Bool)

(assert start!120876)

(declare-fun b!1406456 () Bool)

(declare-fun e!796050 () Bool)

(assert (=> b!1406456 (= e!796050 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96183 0))(
  ( (array!96184 (arr!46439 (Array (_ BitVec 32) (_ BitVec 64))) (size!46989 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96183)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10750 0))(
  ( (MissingZero!10750 (index!45377 (_ BitVec 32))) (Found!10750 (index!45378 (_ BitVec 32))) (Intermediate!10750 (undefined!11562 Bool) (index!45379 (_ BitVec 32)) (x!126981 (_ BitVec 32))) (Undefined!10750) (MissingVacant!10750 (index!45380 (_ BitVec 32))) )
))
(declare-fun lt!619391 () SeekEntryResult!10750)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96183 (_ BitVec 32)) SeekEntryResult!10750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406456 (= lt!619391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46439 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46439 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96184 (store (arr!46439 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46989 a!2901)) mask!2840))))

(declare-fun b!1406457 () Bool)

(declare-fun res!944678 () Bool)

(declare-fun e!796052 () Bool)

(assert (=> b!1406457 (=> (not res!944678) (not e!796052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406457 (= res!944678 (validKeyInArray!0 (select (arr!46439 a!2901) j!112)))))

(declare-fun res!944675 () Bool)

(assert (=> start!120876 (=> (not res!944675) (not e!796052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120876 (= res!944675 (validMask!0 mask!2840))))

(assert (=> start!120876 e!796052))

(assert (=> start!120876 true))

(declare-fun array_inv!35467 (array!96183) Bool)

(assert (=> start!120876 (array_inv!35467 a!2901)))

(declare-fun b!1406458 () Bool)

(declare-fun res!944680 () Bool)

(assert (=> b!1406458 (=> (not res!944680) (not e!796052))))

(assert (=> b!1406458 (= res!944680 (validKeyInArray!0 (select (arr!46439 a!2901) i!1037)))))

(declare-fun b!1406459 () Bool)

(declare-fun res!944674 () Bool)

(assert (=> b!1406459 (=> (not res!944674) (not e!796052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96183 (_ BitVec 32)) Bool)

(assert (=> b!1406459 (= res!944674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406460 () Bool)

(declare-fun res!944676 () Bool)

(assert (=> b!1406460 (=> (not res!944676) (not e!796052))))

(assert (=> b!1406460 (= res!944676 (and (= (size!46989 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46989 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46989 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406461 () Bool)

(assert (=> b!1406461 (= e!796052 (not e!796050))))

(declare-fun res!944677 () Bool)

(assert (=> b!1406461 (=> res!944677 e!796050)))

(declare-fun lt!619390 () SeekEntryResult!10750)

(assert (=> b!1406461 (= res!944677 (or (not (is-Intermediate!10750 lt!619390)) (undefined!11562 lt!619390)))))

(declare-fun e!796049 () Bool)

(assert (=> b!1406461 e!796049))

(declare-fun res!944679 () Bool)

(assert (=> b!1406461 (=> (not res!944679) (not e!796049))))

(assert (=> b!1406461 (= res!944679 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47474 0))(
  ( (Unit!47475) )
))
(declare-fun lt!619392 () Unit!47474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47474)

(assert (=> b!1406461 (= lt!619392 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406461 (= lt!619390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46439 a!2901) j!112) mask!2840) (select (arr!46439 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406462 () Bool)

(declare-fun res!944673 () Bool)

(assert (=> b!1406462 (=> (not res!944673) (not e!796052))))

(declare-datatypes ((List!32958 0))(
  ( (Nil!32955) (Cons!32954 (h!34208 (_ BitVec 64)) (t!47652 List!32958)) )
))
(declare-fun arrayNoDuplicates!0 (array!96183 (_ BitVec 32) List!32958) Bool)

(assert (=> b!1406462 (= res!944673 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32955))))

(declare-fun b!1406463 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96183 (_ BitVec 32)) SeekEntryResult!10750)

(assert (=> b!1406463 (= e!796049 (= (seekEntryOrOpen!0 (select (arr!46439 a!2901) j!112) a!2901 mask!2840) (Found!10750 j!112)))))

(assert (= (and start!120876 res!944675) b!1406460))

(assert (= (and b!1406460 res!944676) b!1406458))

(assert (= (and b!1406458 res!944680) b!1406457))

(assert (= (and b!1406457 res!944678) b!1406459))

(assert (= (and b!1406459 res!944674) b!1406462))

(assert (= (and b!1406462 res!944673) b!1406461))

(assert (= (and b!1406461 res!944679) b!1406463))

(assert (= (and b!1406461 (not res!944677)) b!1406456))

(declare-fun m!1295607 () Bool)

(assert (=> start!120876 m!1295607))

(declare-fun m!1295609 () Bool)

(assert (=> start!120876 m!1295609))

(declare-fun m!1295611 () Bool)

(assert (=> b!1406457 m!1295611))

(assert (=> b!1406457 m!1295611))

(declare-fun m!1295613 () Bool)

(assert (=> b!1406457 m!1295613))

(declare-fun m!1295615 () Bool)

(assert (=> b!1406456 m!1295615))

(declare-fun m!1295617 () Bool)

(assert (=> b!1406456 m!1295617))

(assert (=> b!1406456 m!1295617))

(declare-fun m!1295619 () Bool)

(assert (=> b!1406456 m!1295619))

(assert (=> b!1406456 m!1295619))

(assert (=> b!1406456 m!1295617))

(declare-fun m!1295621 () Bool)

(assert (=> b!1406456 m!1295621))

(declare-fun m!1295623 () Bool)

(assert (=> b!1406458 m!1295623))

(assert (=> b!1406458 m!1295623))

(declare-fun m!1295625 () Bool)

(assert (=> b!1406458 m!1295625))

(assert (=> b!1406461 m!1295611))

(declare-fun m!1295627 () Bool)

(assert (=> b!1406461 m!1295627))

(assert (=> b!1406461 m!1295611))

(declare-fun m!1295629 () Bool)

(assert (=> b!1406461 m!1295629))

(assert (=> b!1406461 m!1295627))

(assert (=> b!1406461 m!1295611))

(declare-fun m!1295631 () Bool)

(assert (=> b!1406461 m!1295631))

(declare-fun m!1295633 () Bool)

(assert (=> b!1406461 m!1295633))

(assert (=> b!1406463 m!1295611))

(assert (=> b!1406463 m!1295611))

(declare-fun m!1295635 () Bool)

(assert (=> b!1406463 m!1295635))

(declare-fun m!1295637 () Bool)

(assert (=> b!1406462 m!1295637))

(declare-fun m!1295639 () Bool)

(assert (=> b!1406459 m!1295639))

(push 1)

(assert (not start!120876))

(assert (not b!1406463))

(assert (not b!1406456))

(assert (not b!1406459))

(assert (not b!1406457))

(assert (not b!1406458))

(assert (not b!1406461))

(assert (not b!1406462))

(check-sat)

