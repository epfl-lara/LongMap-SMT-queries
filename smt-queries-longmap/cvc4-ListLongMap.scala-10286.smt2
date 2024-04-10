; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120880 () Bool)

(assert start!120880)

(declare-fun b!1406504 () Bool)

(declare-fun res!944725 () Bool)

(declare-fun e!796073 () Bool)

(assert (=> b!1406504 (=> (not res!944725) (not e!796073))))

(declare-datatypes ((array!96187 0))(
  ( (array!96188 (arr!46441 (Array (_ BitVec 32) (_ BitVec 64))) (size!46991 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96187)

(declare-datatypes ((List!32960 0))(
  ( (Nil!32957) (Cons!32956 (h!34210 (_ BitVec 64)) (t!47654 List!32960)) )
))
(declare-fun arrayNoDuplicates!0 (array!96187 (_ BitVec 32) List!32960) Bool)

(assert (=> b!1406504 (= res!944725 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32957))))

(declare-fun b!1406505 () Bool)

(declare-fun res!944727 () Bool)

(assert (=> b!1406505 (=> (not res!944727) (not e!796073))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406505 (= res!944727 (and (= (size!46991 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46991 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46991 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406506 () Bool)

(declare-fun e!796076 () Bool)

(assert (=> b!1406506 (= e!796073 (not e!796076))))

(declare-fun res!944724 () Bool)

(assert (=> b!1406506 (=> res!944724 e!796076)))

(declare-datatypes ((SeekEntryResult!10752 0))(
  ( (MissingZero!10752 (index!45385 (_ BitVec 32))) (Found!10752 (index!45386 (_ BitVec 32))) (Intermediate!10752 (undefined!11564 Bool) (index!45387 (_ BitVec 32)) (x!126983 (_ BitVec 32))) (Undefined!10752) (MissingVacant!10752 (index!45388 (_ BitVec 32))) )
))
(declare-fun lt!619410 () SeekEntryResult!10752)

(assert (=> b!1406506 (= res!944724 (or (not (is-Intermediate!10752 lt!619410)) (undefined!11564 lt!619410)))))

(declare-fun e!796075 () Bool)

(assert (=> b!1406506 e!796075))

(declare-fun res!944722 () Bool)

(assert (=> b!1406506 (=> (not res!944722) (not e!796075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96187 (_ BitVec 32)) Bool)

(assert (=> b!1406506 (= res!944722 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47478 0))(
  ( (Unit!47479) )
))
(declare-fun lt!619408 () Unit!47478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47478)

(assert (=> b!1406506 (= lt!619408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96187 (_ BitVec 32)) SeekEntryResult!10752)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406506 (= lt!619410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46441 a!2901) j!112) mask!2840) (select (arr!46441 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944726 () Bool)

(assert (=> start!120880 (=> (not res!944726) (not e!796073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120880 (= res!944726 (validMask!0 mask!2840))))

(assert (=> start!120880 e!796073))

(assert (=> start!120880 true))

(declare-fun array_inv!35469 (array!96187) Bool)

(assert (=> start!120880 (array_inv!35469 a!2901)))

(declare-fun b!1406507 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96187 (_ BitVec 32)) SeekEntryResult!10752)

(assert (=> b!1406507 (= e!796075 (= (seekEntryOrOpen!0 (select (arr!46441 a!2901) j!112) a!2901 mask!2840) (Found!10752 j!112)))))

(declare-fun b!1406508 () Bool)

(declare-fun res!944721 () Bool)

(assert (=> b!1406508 (=> (not res!944721) (not e!796073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406508 (= res!944721 (validKeyInArray!0 (select (arr!46441 a!2901) i!1037)))))

(declare-fun b!1406509 () Bool)

(assert (=> b!1406509 (= e!796076 true)))

(declare-fun lt!619409 () SeekEntryResult!10752)

(assert (=> b!1406509 (= lt!619409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46441 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46441 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96188 (store (arr!46441 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46991 a!2901)) mask!2840))))

(declare-fun b!1406510 () Bool)

(declare-fun res!944723 () Bool)

(assert (=> b!1406510 (=> (not res!944723) (not e!796073))))

(assert (=> b!1406510 (= res!944723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406511 () Bool)

(declare-fun res!944728 () Bool)

(assert (=> b!1406511 (=> (not res!944728) (not e!796073))))

(assert (=> b!1406511 (= res!944728 (validKeyInArray!0 (select (arr!46441 a!2901) j!112)))))

(assert (= (and start!120880 res!944726) b!1406505))

(assert (= (and b!1406505 res!944727) b!1406508))

(assert (= (and b!1406508 res!944721) b!1406511))

(assert (= (and b!1406511 res!944728) b!1406510))

(assert (= (and b!1406510 res!944723) b!1406504))

(assert (= (and b!1406504 res!944725) b!1406506))

(assert (= (and b!1406506 res!944722) b!1406507))

(assert (= (and b!1406506 (not res!944724)) b!1406509))

(declare-fun m!1295675 () Bool)

(assert (=> start!120880 m!1295675))

(declare-fun m!1295677 () Bool)

(assert (=> start!120880 m!1295677))

(declare-fun m!1295679 () Bool)

(assert (=> b!1406509 m!1295679))

(declare-fun m!1295681 () Bool)

(assert (=> b!1406509 m!1295681))

(assert (=> b!1406509 m!1295681))

(declare-fun m!1295683 () Bool)

(assert (=> b!1406509 m!1295683))

(assert (=> b!1406509 m!1295683))

(assert (=> b!1406509 m!1295681))

(declare-fun m!1295685 () Bool)

(assert (=> b!1406509 m!1295685))

(declare-fun m!1295687 () Bool)

(assert (=> b!1406504 m!1295687))

(declare-fun m!1295689 () Bool)

(assert (=> b!1406506 m!1295689))

(declare-fun m!1295691 () Bool)

(assert (=> b!1406506 m!1295691))

(assert (=> b!1406506 m!1295689))

(declare-fun m!1295693 () Bool)

(assert (=> b!1406506 m!1295693))

(assert (=> b!1406506 m!1295691))

(assert (=> b!1406506 m!1295689))

(declare-fun m!1295695 () Bool)

(assert (=> b!1406506 m!1295695))

(declare-fun m!1295697 () Bool)

(assert (=> b!1406506 m!1295697))

(assert (=> b!1406511 m!1295689))

(assert (=> b!1406511 m!1295689))

(declare-fun m!1295699 () Bool)

(assert (=> b!1406511 m!1295699))

(declare-fun m!1295701 () Bool)

(assert (=> b!1406508 m!1295701))

(assert (=> b!1406508 m!1295701))

(declare-fun m!1295703 () Bool)

(assert (=> b!1406508 m!1295703))

(assert (=> b!1406507 m!1295689))

(assert (=> b!1406507 m!1295689))

(declare-fun m!1295705 () Bool)

(assert (=> b!1406507 m!1295705))

(declare-fun m!1295707 () Bool)

(assert (=> b!1406510 m!1295707))

(push 1)

(assert (not b!1406506))

(assert (not b!1406510))

(assert (not b!1406511))

(assert (not b!1406508))

(assert (not b!1406507))

(assert (not start!120880))

(assert (not b!1406509))

(assert (not b!1406504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

