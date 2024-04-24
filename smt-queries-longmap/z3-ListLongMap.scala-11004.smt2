; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129158 () Bool)

(assert start!129158)

(declare-fun b!1511937 () Bool)

(declare-fun res!1030666 () Bool)

(declare-fun e!844470 () Bool)

(assert (=> b!1511937 (=> (not res!1030666) (not e!844470))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100828 0))(
  ( (array!100829 (arr!48646 (Array (_ BitVec 32) (_ BitVec 64))) (size!49197 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100828)

(assert (=> b!1511937 (= res!1030666 (and (= (size!49197 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49197 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49197 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!844468 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1511938 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511938 (= e!844468 (not (or (not (= (select (arr!48646 a!2804) j!70) (select (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48646 a!2804) index!487) (select (arr!48646 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!844467 () Bool)

(assert (=> b!1511938 e!844467))

(declare-fun res!1030669 () Bool)

(assert (=> b!1511938 (=> (not res!1030669) (not e!844467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100828 (_ BitVec 32)) Bool)

(assert (=> b!1511938 (= res!1030669 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50323 0))(
  ( (Unit!50324) )
))
(declare-fun lt!655742 () Unit!50323)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50323)

(assert (=> b!1511938 (= lt!655742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511939 () Bool)

(declare-fun res!1030668 () Bool)

(assert (=> b!1511939 (=> (not res!1030668) (not e!844470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511939 (= res!1030668 (validKeyInArray!0 (select (arr!48646 a!2804) i!961)))))

(declare-fun b!1511940 () Bool)

(declare-fun res!1030664 () Bool)

(assert (=> b!1511940 (=> (not res!1030664) (not e!844468))))

(declare-datatypes ((SeekEntryResult!12710 0))(
  ( (MissingZero!12710 (index!53235 (_ BitVec 32))) (Found!12710 (index!53236 (_ BitVec 32))) (Intermediate!12710 (undefined!13522 Bool) (index!53237 (_ BitVec 32)) (x!135185 (_ BitVec 32))) (Undefined!12710) (MissingVacant!12710 (index!53238 (_ BitVec 32))) )
))
(declare-fun lt!655744 () SeekEntryResult!12710)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12710)

(assert (=> b!1511940 (= res!1030664 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48646 a!2804) j!70) a!2804 mask!2512) lt!655744))))

(declare-fun b!1511941 () Bool)

(declare-fun res!1030672 () Bool)

(assert (=> b!1511941 (=> (not res!1030672) (not e!844470))))

(assert (=> b!1511941 (= res!1030672 (validKeyInArray!0 (select (arr!48646 a!2804) j!70)))))

(declare-fun res!1030673 () Bool)

(assert (=> start!129158 (=> (not res!1030673) (not e!844470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129158 (= res!1030673 (validMask!0 mask!2512))))

(assert (=> start!129158 e!844470))

(assert (=> start!129158 true))

(declare-fun array_inv!37927 (array!100828) Bool)

(assert (=> start!129158 (array_inv!37927 a!2804)))

(declare-fun b!1511942 () Bool)

(declare-fun res!1030667 () Bool)

(assert (=> b!1511942 (=> (not res!1030667) (not e!844470))))

(declare-datatypes ((List!35116 0))(
  ( (Nil!35113) (Cons!35112 (h!36539 (_ BitVec 64)) (t!49802 List!35116)) )
))
(declare-fun arrayNoDuplicates!0 (array!100828 (_ BitVec 32) List!35116) Bool)

(assert (=> b!1511942 (= res!1030667 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35113))))

(declare-fun b!1511943 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12710)

(assert (=> b!1511943 (= e!844467 (= (seekEntry!0 (select (arr!48646 a!2804) j!70) a!2804 mask!2512) (Found!12710 j!70)))))

(declare-fun b!1511944 () Bool)

(declare-fun res!1030665 () Bool)

(assert (=> b!1511944 (=> (not res!1030665) (not e!844470))))

(assert (=> b!1511944 (= res!1030665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511945 () Bool)

(declare-fun res!1030670 () Bool)

(assert (=> b!1511945 (=> (not res!1030670) (not e!844470))))

(assert (=> b!1511945 (= res!1030670 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49197 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49197 a!2804))))))

(declare-fun b!1511946 () Bool)

(declare-fun res!1030671 () Bool)

(assert (=> b!1511946 (=> (not res!1030671) (not e!844468))))

(declare-fun lt!655743 () SeekEntryResult!12710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511946 (= res!1030671 (= lt!655743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100829 (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49197 a!2804)) mask!2512)))))

(declare-fun b!1511947 () Bool)

(assert (=> b!1511947 (= e!844470 e!844468)))

(declare-fun res!1030663 () Bool)

(assert (=> b!1511947 (=> (not res!1030663) (not e!844468))))

(assert (=> b!1511947 (= res!1030663 (= lt!655743 lt!655744))))

(assert (=> b!1511947 (= lt!655744 (Intermediate!12710 false resIndex!21 resX!21))))

(assert (=> b!1511947 (= lt!655743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48646 a!2804) j!70) mask!2512) (select (arr!48646 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129158 res!1030673) b!1511937))

(assert (= (and b!1511937 res!1030666) b!1511939))

(assert (= (and b!1511939 res!1030668) b!1511941))

(assert (= (and b!1511941 res!1030672) b!1511944))

(assert (= (and b!1511944 res!1030665) b!1511942))

(assert (= (and b!1511942 res!1030667) b!1511945))

(assert (= (and b!1511945 res!1030670) b!1511947))

(assert (= (and b!1511947 res!1030663) b!1511940))

(assert (= (and b!1511940 res!1030664) b!1511946))

(assert (= (and b!1511946 res!1030671) b!1511938))

(assert (= (and b!1511938 res!1030669) b!1511943))

(declare-fun m!1394451 () Bool)

(assert (=> b!1511942 m!1394451))

(declare-fun m!1394453 () Bool)

(assert (=> b!1511940 m!1394453))

(assert (=> b!1511940 m!1394453))

(declare-fun m!1394455 () Bool)

(assert (=> b!1511940 m!1394455))

(declare-fun m!1394457 () Bool)

(assert (=> b!1511939 m!1394457))

(assert (=> b!1511939 m!1394457))

(declare-fun m!1394459 () Bool)

(assert (=> b!1511939 m!1394459))

(assert (=> b!1511941 m!1394453))

(assert (=> b!1511941 m!1394453))

(declare-fun m!1394461 () Bool)

(assert (=> b!1511941 m!1394461))

(declare-fun m!1394463 () Bool)

(assert (=> b!1511946 m!1394463))

(declare-fun m!1394465 () Bool)

(assert (=> b!1511946 m!1394465))

(assert (=> b!1511946 m!1394465))

(declare-fun m!1394467 () Bool)

(assert (=> b!1511946 m!1394467))

(assert (=> b!1511946 m!1394467))

(assert (=> b!1511946 m!1394465))

(declare-fun m!1394469 () Bool)

(assert (=> b!1511946 m!1394469))

(assert (=> b!1511943 m!1394453))

(assert (=> b!1511943 m!1394453))

(declare-fun m!1394471 () Bool)

(assert (=> b!1511943 m!1394471))

(declare-fun m!1394473 () Bool)

(assert (=> start!129158 m!1394473))

(declare-fun m!1394475 () Bool)

(assert (=> start!129158 m!1394475))

(assert (=> b!1511938 m!1394453))

(declare-fun m!1394477 () Bool)

(assert (=> b!1511938 m!1394477))

(assert (=> b!1511938 m!1394463))

(declare-fun m!1394479 () Bool)

(assert (=> b!1511938 m!1394479))

(assert (=> b!1511938 m!1394465))

(declare-fun m!1394481 () Bool)

(assert (=> b!1511938 m!1394481))

(declare-fun m!1394483 () Bool)

(assert (=> b!1511944 m!1394483))

(assert (=> b!1511947 m!1394453))

(assert (=> b!1511947 m!1394453))

(declare-fun m!1394485 () Bool)

(assert (=> b!1511947 m!1394485))

(assert (=> b!1511947 m!1394485))

(assert (=> b!1511947 m!1394453))

(declare-fun m!1394487 () Bool)

(assert (=> b!1511947 m!1394487))

(check-sat (not b!1511943) (not b!1511938) (not b!1511942) (not b!1511946) (not b!1511947) (not b!1511940) (not start!129158) (not b!1511939) (not b!1511944) (not b!1511941))
(check-sat)
