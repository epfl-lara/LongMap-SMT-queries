; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120560 () Bool)

(assert start!120560)

(declare-fun b!1403805 () Bool)

(declare-fun e!794806 () Bool)

(assert (=> b!1403805 (= e!794806 (not true))))

(declare-fun e!794805 () Bool)

(assert (=> b!1403805 e!794805))

(declare-fun res!942319 () Bool)

(assert (=> b!1403805 (=> (not res!942319) (not e!794805))))

(declare-datatypes ((array!95969 0))(
  ( (array!95970 (arr!46335 (Array (_ BitVec 32) (_ BitVec 64))) (size!46885 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95969)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95969 (_ BitVec 32)) Bool)

(assert (=> b!1403805 (= res!942319 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47308 0))(
  ( (Unit!47309) )
))
(declare-fun lt!618513 () Unit!47308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47308)

(assert (=> b!1403805 (= lt!618513 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10652 0))(
  ( (MissingZero!10652 (index!44985 (_ BitVec 32))) (Found!10652 (index!44986 (_ BitVec 32))) (Intermediate!10652 (undefined!11464 Bool) (index!44987 (_ BitVec 32)) (x!126591 (_ BitVec 32))) (Undefined!10652) (MissingVacant!10652 (index!44988 (_ BitVec 32))) )
))
(declare-fun lt!618512 () SeekEntryResult!10652)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95969 (_ BitVec 32)) SeekEntryResult!10652)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403805 (= lt!618512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46335 a!2901) j!112) mask!2840) (select (arr!46335 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942320 () Bool)

(assert (=> start!120560 (=> (not res!942320) (not e!794806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120560 (= res!942320 (validMask!0 mask!2840))))

(assert (=> start!120560 e!794806))

(assert (=> start!120560 true))

(declare-fun array_inv!35363 (array!95969) Bool)

(assert (=> start!120560 (array_inv!35363 a!2901)))

(declare-fun b!1403806 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95969 (_ BitVec 32)) SeekEntryResult!10652)

(assert (=> b!1403806 (= e!794805 (= (seekEntryOrOpen!0 (select (arr!46335 a!2901) j!112) a!2901 mask!2840) (Found!10652 j!112)))))

(declare-fun b!1403807 () Bool)

(declare-fun res!942318 () Bool)

(assert (=> b!1403807 (=> (not res!942318) (not e!794806))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403807 (= res!942318 (validKeyInArray!0 (select (arr!46335 a!2901) i!1037)))))

(declare-fun b!1403808 () Bool)

(declare-fun res!942321 () Bool)

(assert (=> b!1403808 (=> (not res!942321) (not e!794806))))

(declare-datatypes ((List!32854 0))(
  ( (Nil!32851) (Cons!32850 (h!34098 (_ BitVec 64)) (t!47548 List!32854)) )
))
(declare-fun arrayNoDuplicates!0 (array!95969 (_ BitVec 32) List!32854) Bool)

(assert (=> b!1403808 (= res!942321 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32851))))

(declare-fun b!1403809 () Bool)

(declare-fun res!942316 () Bool)

(assert (=> b!1403809 (=> (not res!942316) (not e!794806))))

(assert (=> b!1403809 (= res!942316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403810 () Bool)

(declare-fun res!942322 () Bool)

(assert (=> b!1403810 (=> (not res!942322) (not e!794806))))

(assert (=> b!1403810 (= res!942322 (validKeyInArray!0 (select (arr!46335 a!2901) j!112)))))

(declare-fun b!1403811 () Bool)

(declare-fun res!942317 () Bool)

(assert (=> b!1403811 (=> (not res!942317) (not e!794806))))

(assert (=> b!1403811 (= res!942317 (and (= (size!46885 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46885 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46885 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120560 res!942320) b!1403811))

(assert (= (and b!1403811 res!942317) b!1403807))

(assert (= (and b!1403807 res!942318) b!1403810))

(assert (= (and b!1403810 res!942322) b!1403809))

(assert (= (and b!1403809 res!942316) b!1403808))

(assert (= (and b!1403808 res!942321) b!1403805))

(assert (= (and b!1403805 res!942319) b!1403806))

(declare-fun m!1292549 () Bool)

(assert (=> b!1403809 m!1292549))

(declare-fun m!1292551 () Bool)

(assert (=> b!1403806 m!1292551))

(assert (=> b!1403806 m!1292551))

(declare-fun m!1292553 () Bool)

(assert (=> b!1403806 m!1292553))

(assert (=> b!1403805 m!1292551))

(declare-fun m!1292555 () Bool)

(assert (=> b!1403805 m!1292555))

(assert (=> b!1403805 m!1292551))

(declare-fun m!1292557 () Bool)

(assert (=> b!1403805 m!1292557))

(assert (=> b!1403805 m!1292555))

(assert (=> b!1403805 m!1292551))

(declare-fun m!1292559 () Bool)

(assert (=> b!1403805 m!1292559))

(declare-fun m!1292561 () Bool)

(assert (=> b!1403805 m!1292561))

(declare-fun m!1292563 () Bool)

(assert (=> b!1403808 m!1292563))

(assert (=> b!1403810 m!1292551))

(assert (=> b!1403810 m!1292551))

(declare-fun m!1292565 () Bool)

(assert (=> b!1403810 m!1292565))

(declare-fun m!1292567 () Bool)

(assert (=> start!120560 m!1292567))

(declare-fun m!1292569 () Bool)

(assert (=> start!120560 m!1292569))

(declare-fun m!1292571 () Bool)

(assert (=> b!1403807 m!1292571))

(assert (=> b!1403807 m!1292571))

(declare-fun m!1292573 () Bool)

(assert (=> b!1403807 m!1292573))

(check-sat (not b!1403807) (not b!1403809) (not b!1403806) (not b!1403805) (not start!120560) (not b!1403808) (not b!1403810))
