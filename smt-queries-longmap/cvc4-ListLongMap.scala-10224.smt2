; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120400 () Bool)

(assert start!120400)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95809 0))(
  ( (array!95810 (arr!46255 (Array (_ BitVec 32) (_ BitVec 64))) (size!46805 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95809)

(declare-fun lt!617058 () (_ BitVec 64))

(declare-fun b!1401608 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!793641 () Bool)

(declare-datatypes ((SeekEntryResult!10572 0))(
  ( (MissingZero!10572 (index!44665 (_ BitVec 32))) (Found!10572 (index!44666 (_ BitVec 32))) (Intermediate!10572 (undefined!11384 Bool) (index!44667 (_ BitVec 32)) (x!126295 (_ BitVec 32))) (Undefined!10572) (MissingVacant!10572 (index!44668 (_ BitVec 32))) )
))
(declare-fun lt!617061 () SeekEntryResult!10572)

(declare-fun lt!617057 () array!95809)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95809 (_ BitVec 32)) SeekEntryResult!10572)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95809 (_ BitVec 32)) SeekEntryResult!10572)

(assert (=> b!1401608 (= e!793641 (= (seekEntryOrOpen!0 lt!617058 lt!617057 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126295 lt!617061) (index!44667 lt!617061) (index!44667 lt!617061) (select (arr!46255 a!2901) j!112) lt!617057 mask!2840)))))

(declare-fun res!940121 () Bool)

(declare-fun e!793643 () Bool)

(assert (=> start!120400 (=> (not res!940121) (not e!793643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120400 (= res!940121 (validMask!0 mask!2840))))

(assert (=> start!120400 e!793643))

(assert (=> start!120400 true))

(declare-fun array_inv!35283 (array!95809) Bool)

(assert (=> start!120400 (array_inv!35283 a!2901)))

(declare-fun b!1401609 () Bool)

(declare-fun e!793644 () Bool)

(assert (=> b!1401609 (= e!793643 (not e!793644))))

(declare-fun res!940120 () Bool)

(assert (=> b!1401609 (=> res!940120 e!793644)))

(declare-fun lt!617055 () SeekEntryResult!10572)

(assert (=> b!1401609 (= res!940120 (or (not (is-Intermediate!10572 lt!617055)) (undefined!11384 lt!617055)))))

(declare-fun e!793645 () Bool)

(assert (=> b!1401609 e!793645))

(declare-fun res!940126 () Bool)

(assert (=> b!1401609 (=> (not res!940126) (not e!793645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95809 (_ BitVec 32)) Bool)

(assert (=> b!1401609 (= res!940126 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47148 0))(
  ( (Unit!47149) )
))
(declare-fun lt!617059 () Unit!47148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47148)

(assert (=> b!1401609 (= lt!617059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617054 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95809 (_ BitVec 32)) SeekEntryResult!10572)

(assert (=> b!1401609 (= lt!617055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617054 (select (arr!46255 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401609 (= lt!617054 (toIndex!0 (select (arr!46255 a!2901) j!112) mask!2840))))

(declare-fun b!1401610 () Bool)

(declare-fun res!940124 () Bool)

(assert (=> b!1401610 (=> (not res!940124) (not e!793643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401610 (= res!940124 (validKeyInArray!0 (select (arr!46255 a!2901) j!112)))))

(declare-fun b!1401611 () Bool)

(declare-fun res!940122 () Bool)

(assert (=> b!1401611 (=> (not res!940122) (not e!793643))))

(declare-datatypes ((List!32774 0))(
  ( (Nil!32771) (Cons!32770 (h!34018 (_ BitVec 64)) (t!47468 List!32774)) )
))
(declare-fun arrayNoDuplicates!0 (array!95809 (_ BitVec 32) List!32774) Bool)

(assert (=> b!1401611 (= res!940122 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32771))))

(declare-fun b!1401612 () Bool)

(declare-fun res!940127 () Bool)

(assert (=> b!1401612 (=> (not res!940127) (not e!793643))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401612 (= res!940127 (validKeyInArray!0 (select (arr!46255 a!2901) i!1037)))))

(declare-fun b!1401613 () Bool)

(declare-fun e!793642 () Bool)

(assert (=> b!1401613 (= e!793642 true)))

(declare-fun lt!617060 () SeekEntryResult!10572)

(assert (=> b!1401613 (= lt!617060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617054 lt!617058 lt!617057 mask!2840))))

(declare-fun b!1401614 () Bool)

(assert (=> b!1401614 (= e!793645 (= (seekEntryOrOpen!0 (select (arr!46255 a!2901) j!112) a!2901 mask!2840) (Found!10572 j!112)))))

(declare-fun b!1401615 () Bool)

(declare-fun e!793640 () Bool)

(assert (=> b!1401615 (= e!793644 e!793640)))

(declare-fun res!940129 () Bool)

(assert (=> b!1401615 (=> res!940129 e!793640)))

(assert (=> b!1401615 (= res!940129 (or (= lt!617055 lt!617061) (not (is-Intermediate!10572 lt!617061))))))

(assert (=> b!1401615 (= lt!617061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617058 mask!2840) lt!617058 lt!617057 mask!2840))))

(assert (=> b!1401615 (= lt!617058 (select (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401615 (= lt!617057 (array!95810 (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46805 a!2901)))))

(declare-fun b!1401616 () Bool)

(declare-fun res!940125 () Bool)

(assert (=> b!1401616 (=> (not res!940125) (not e!793643))))

(assert (=> b!1401616 (= res!940125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401617 () Bool)

(declare-fun res!940119 () Bool)

(assert (=> b!1401617 (=> (not res!940119) (not e!793643))))

(assert (=> b!1401617 (= res!940119 (and (= (size!46805 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46805 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46805 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401618 () Bool)

(assert (=> b!1401618 (= e!793640 e!793642)))

(declare-fun res!940123 () Bool)

(assert (=> b!1401618 (=> res!940123 e!793642)))

(assert (=> b!1401618 (= res!940123 (or (bvslt (x!126295 lt!617055) #b00000000000000000000000000000000) (bvsgt (x!126295 lt!617055) #b01111111111111111111111111111110) (bvslt (x!126295 lt!617061) #b00000000000000000000000000000000) (bvsgt (x!126295 lt!617061) #b01111111111111111111111111111110) (bvslt lt!617054 #b00000000000000000000000000000000) (bvsge lt!617054 (size!46805 a!2901)) (bvslt (index!44667 lt!617055) #b00000000000000000000000000000000) (bvsge (index!44667 lt!617055) (size!46805 a!2901)) (bvslt (index!44667 lt!617061) #b00000000000000000000000000000000) (bvsge (index!44667 lt!617061) (size!46805 a!2901)) (not (= lt!617055 (Intermediate!10572 false (index!44667 lt!617055) (x!126295 lt!617055)))) (not (= lt!617061 (Intermediate!10572 false (index!44667 lt!617061) (x!126295 lt!617061))))))))

(assert (=> b!1401618 e!793641))

(declare-fun res!940128 () Bool)

(assert (=> b!1401618 (=> (not res!940128) (not e!793641))))

(assert (=> b!1401618 (= res!940128 (and (not (undefined!11384 lt!617061)) (= (index!44667 lt!617061) i!1037) (bvslt (x!126295 lt!617061) (x!126295 lt!617055)) (= (select (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44667 lt!617061)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617056 () Unit!47148)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47148)

(assert (=> b!1401618 (= lt!617056 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617054 (x!126295 lt!617055) (index!44667 lt!617055) (x!126295 lt!617061) (index!44667 lt!617061) (undefined!11384 lt!617061) mask!2840))))

(assert (= (and start!120400 res!940121) b!1401617))

(assert (= (and b!1401617 res!940119) b!1401612))

(assert (= (and b!1401612 res!940127) b!1401610))

(assert (= (and b!1401610 res!940124) b!1401616))

(assert (= (and b!1401616 res!940125) b!1401611))

(assert (= (and b!1401611 res!940122) b!1401609))

(assert (= (and b!1401609 res!940126) b!1401614))

(assert (= (and b!1401609 (not res!940120)) b!1401615))

(assert (= (and b!1401615 (not res!940129)) b!1401618))

(assert (= (and b!1401618 res!940128) b!1401608))

(assert (= (and b!1401618 (not res!940123)) b!1401613))

(declare-fun m!1289449 () Bool)

(assert (=> b!1401611 m!1289449))

(declare-fun m!1289451 () Bool)

(assert (=> b!1401610 m!1289451))

(assert (=> b!1401610 m!1289451))

(declare-fun m!1289453 () Bool)

(assert (=> b!1401610 m!1289453))

(assert (=> b!1401609 m!1289451))

(declare-fun m!1289455 () Bool)

(assert (=> b!1401609 m!1289455))

(assert (=> b!1401609 m!1289451))

(assert (=> b!1401609 m!1289451))

(declare-fun m!1289457 () Bool)

(assert (=> b!1401609 m!1289457))

(declare-fun m!1289459 () Bool)

(assert (=> b!1401609 m!1289459))

(declare-fun m!1289461 () Bool)

(assert (=> b!1401609 m!1289461))

(declare-fun m!1289463 () Bool)

(assert (=> b!1401612 m!1289463))

(assert (=> b!1401612 m!1289463))

(declare-fun m!1289465 () Bool)

(assert (=> b!1401612 m!1289465))

(declare-fun m!1289467 () Bool)

(assert (=> b!1401618 m!1289467))

(declare-fun m!1289469 () Bool)

(assert (=> b!1401618 m!1289469))

(declare-fun m!1289471 () Bool)

(assert (=> b!1401618 m!1289471))

(declare-fun m!1289473 () Bool)

(assert (=> start!120400 m!1289473))

(declare-fun m!1289475 () Bool)

(assert (=> start!120400 m!1289475))

(assert (=> b!1401614 m!1289451))

(assert (=> b!1401614 m!1289451))

(declare-fun m!1289477 () Bool)

(assert (=> b!1401614 m!1289477))

(declare-fun m!1289479 () Bool)

(assert (=> b!1401615 m!1289479))

(assert (=> b!1401615 m!1289479))

(declare-fun m!1289481 () Bool)

(assert (=> b!1401615 m!1289481))

(assert (=> b!1401615 m!1289467))

(declare-fun m!1289483 () Bool)

(assert (=> b!1401615 m!1289483))

(declare-fun m!1289485 () Bool)

(assert (=> b!1401613 m!1289485))

(declare-fun m!1289487 () Bool)

(assert (=> b!1401616 m!1289487))

(declare-fun m!1289489 () Bool)

(assert (=> b!1401608 m!1289489))

(assert (=> b!1401608 m!1289451))

(assert (=> b!1401608 m!1289451))

(declare-fun m!1289491 () Bool)

(assert (=> b!1401608 m!1289491))

(push 1)

