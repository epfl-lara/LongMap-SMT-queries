; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119720 () Bool)

(assert start!119720)

(declare-fun b!1394602 () Bool)

(declare-fun res!934067 () Bool)

(declare-fun e!789572 () Bool)

(assert (=> b!1394602 (=> (not res!934067) (not e!789572))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95355 0))(
  ( (array!95356 (arr!46036 (Array (_ BitVec 32) (_ BitVec 64))) (size!46588 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95355)

(assert (=> b!1394602 (= res!934067 (and (= (size!46588 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46588 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46588 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394603 () Bool)

(declare-fun res!934066 () Bool)

(assert (=> b!1394603 (=> (not res!934066) (not e!789572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394603 (= res!934066 (validKeyInArray!0 (select (arr!46036 a!2901) j!112)))))

(declare-fun b!1394604 () Bool)

(declare-fun e!789573 () Bool)

(declare-fun e!789575 () Bool)

(assert (=> b!1394604 (= e!789573 e!789575)))

(declare-fun res!934064 () Bool)

(assert (=> b!1394604 (=> res!934064 e!789575)))

(declare-fun lt!612476 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10379 0))(
  ( (MissingZero!10379 (index!43887 (_ BitVec 32))) (Found!10379 (index!43888 (_ BitVec 32))) (Intermediate!10379 (undefined!11191 Bool) (index!43889 (_ BitVec 32)) (x!125548 (_ BitVec 32))) (Undefined!10379) (MissingVacant!10379 (index!43890 (_ BitVec 32))) )
))
(declare-fun lt!612475 () SeekEntryResult!10379)

(declare-fun lt!612471 () array!95355)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95355 (_ BitVec 32)) SeekEntryResult!10379)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394604 (= res!934064 (not (= lt!612475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612476 mask!2840) lt!612476 lt!612471 mask!2840))))))

(assert (=> b!1394604 (= lt!612476 (select (store (arr!46036 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394604 (= lt!612471 (array!95356 (store (arr!46036 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46588 a!2901)))))

(declare-fun res!934065 () Bool)

(assert (=> start!119720 (=> (not res!934065) (not e!789572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119720 (= res!934065 (validMask!0 mask!2840))))

(assert (=> start!119720 e!789572))

(assert (=> start!119720 true))

(declare-fun array_inv!35269 (array!95355) Bool)

(assert (=> start!119720 (array_inv!35269 a!2901)))

(declare-fun b!1394605 () Bool)

(assert (=> b!1394605 (= e!789575 true)))

(declare-fun lt!612474 () SeekEntryResult!10379)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95355 (_ BitVec 32)) SeekEntryResult!10379)

(assert (=> b!1394605 (= lt!612474 (seekEntryOrOpen!0 lt!612476 lt!612471 mask!2840))))

(declare-fun lt!612473 () (_ BitVec 32))

(declare-datatypes ((Unit!46605 0))(
  ( (Unit!46606) )
))
(declare-fun lt!612472 () Unit!46605)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46605)

(assert (=> b!1394605 (= lt!612472 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612473 (x!125548 lt!612475) (index!43889 lt!612475) mask!2840))))

(declare-fun b!1394606 () Bool)

(declare-fun res!934068 () Bool)

(assert (=> b!1394606 (=> (not res!934068) (not e!789572))))

(declare-datatypes ((List!32633 0))(
  ( (Nil!32630) (Cons!32629 (h!33862 (_ BitVec 64)) (t!47319 List!32633)) )
))
(declare-fun arrayNoDuplicates!0 (array!95355 (_ BitVec 32) List!32633) Bool)

(assert (=> b!1394606 (= res!934068 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32630))))

(declare-fun b!1394607 () Bool)

(declare-fun res!934063 () Bool)

(assert (=> b!1394607 (=> res!934063 e!789575)))

(assert (=> b!1394607 (= res!934063 (or (bvslt (x!125548 lt!612475) #b00000000000000000000000000000000) (bvsgt (x!125548 lt!612475) #b01111111111111111111111111111110) (bvslt lt!612473 #b00000000000000000000000000000000) (bvsge lt!612473 (size!46588 a!2901)) (bvslt (index!43889 lt!612475) #b00000000000000000000000000000000) (bvsge (index!43889 lt!612475) (size!46588 a!2901)) (not (= lt!612475 (Intermediate!10379 false (index!43889 lt!612475) (x!125548 lt!612475))))))))

(declare-fun b!1394608 () Bool)

(assert (=> b!1394608 (= e!789572 (not e!789573))))

(declare-fun res!934062 () Bool)

(assert (=> b!1394608 (=> res!934062 e!789573)))

(get-info :version)

(assert (=> b!1394608 (= res!934062 (or (not ((_ is Intermediate!10379) lt!612475)) (undefined!11191 lt!612475)))))

(assert (=> b!1394608 (= lt!612474 (Found!10379 j!112))))

(assert (=> b!1394608 (= lt!612474 (seekEntryOrOpen!0 (select (arr!46036 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95355 (_ BitVec 32)) Bool)

(assert (=> b!1394608 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612470 () Unit!46605)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46605)

(assert (=> b!1394608 (= lt!612470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394608 (= lt!612475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612473 (select (arr!46036 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394608 (= lt!612473 (toIndex!0 (select (arr!46036 a!2901) j!112) mask!2840))))

(declare-fun b!1394609 () Bool)

(declare-fun res!934061 () Bool)

(assert (=> b!1394609 (=> (not res!934061) (not e!789572))))

(assert (=> b!1394609 (= res!934061 (validKeyInArray!0 (select (arr!46036 a!2901) i!1037)))))

(declare-fun b!1394610 () Bool)

(declare-fun res!934069 () Bool)

(assert (=> b!1394610 (=> (not res!934069) (not e!789572))))

(assert (=> b!1394610 (= res!934069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119720 res!934065) b!1394602))

(assert (= (and b!1394602 res!934067) b!1394609))

(assert (= (and b!1394609 res!934061) b!1394603))

(assert (= (and b!1394603 res!934066) b!1394610))

(assert (= (and b!1394610 res!934069) b!1394606))

(assert (= (and b!1394606 res!934068) b!1394608))

(assert (= (and b!1394608 (not res!934062)) b!1394604))

(assert (= (and b!1394604 (not res!934064)) b!1394607))

(assert (= (and b!1394607 (not res!934063)) b!1394605))

(declare-fun m!1280569 () Bool)

(assert (=> b!1394609 m!1280569))

(assert (=> b!1394609 m!1280569))

(declare-fun m!1280571 () Bool)

(assert (=> b!1394609 m!1280571))

(declare-fun m!1280573 () Bool)

(assert (=> b!1394603 m!1280573))

(assert (=> b!1394603 m!1280573))

(declare-fun m!1280575 () Bool)

(assert (=> b!1394603 m!1280575))

(declare-fun m!1280577 () Bool)

(assert (=> start!119720 m!1280577))

(declare-fun m!1280579 () Bool)

(assert (=> start!119720 m!1280579))

(assert (=> b!1394608 m!1280573))

(declare-fun m!1280581 () Bool)

(assert (=> b!1394608 m!1280581))

(assert (=> b!1394608 m!1280573))

(declare-fun m!1280583 () Bool)

(assert (=> b!1394608 m!1280583))

(assert (=> b!1394608 m!1280573))

(declare-fun m!1280585 () Bool)

(assert (=> b!1394608 m!1280585))

(assert (=> b!1394608 m!1280573))

(declare-fun m!1280587 () Bool)

(assert (=> b!1394608 m!1280587))

(declare-fun m!1280589 () Bool)

(assert (=> b!1394608 m!1280589))

(declare-fun m!1280591 () Bool)

(assert (=> b!1394610 m!1280591))

(declare-fun m!1280593 () Bool)

(assert (=> b!1394606 m!1280593))

(declare-fun m!1280595 () Bool)

(assert (=> b!1394604 m!1280595))

(assert (=> b!1394604 m!1280595))

(declare-fun m!1280597 () Bool)

(assert (=> b!1394604 m!1280597))

(declare-fun m!1280599 () Bool)

(assert (=> b!1394604 m!1280599))

(declare-fun m!1280601 () Bool)

(assert (=> b!1394604 m!1280601))

(declare-fun m!1280603 () Bool)

(assert (=> b!1394605 m!1280603))

(declare-fun m!1280605 () Bool)

(assert (=> b!1394605 m!1280605))

(check-sat (not b!1394606) (not b!1394609) (not b!1394603) (not b!1394604) (not b!1394605) (not start!119720) (not b!1394608) (not b!1394610))
(check-sat)
