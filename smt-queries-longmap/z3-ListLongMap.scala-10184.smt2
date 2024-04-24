; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120218 () Bool)

(assert start!120218)

(declare-fun b!1398505 () Bool)

(declare-fun res!936737 () Bool)

(declare-fun e!791827 () Bool)

(assert (=> b!1398505 (=> (not res!936737) (not e!791827))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95669 0))(
  ( (array!95670 (arr!46186 (Array (_ BitVec 32) (_ BitVec 64))) (size!46737 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95669)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398505 (= res!936737 (and (= (size!46737 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46737 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46737 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398506 () Bool)

(declare-fun res!936742 () Bool)

(assert (=> b!1398506 (=> (not res!936742) (not e!791827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95669 (_ BitVec 32)) Bool)

(assert (=> b!1398506 (= res!936742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!791829 () Bool)

(declare-fun b!1398507 () Bool)

(declare-datatypes ((SeekEntryResult!10406 0))(
  ( (MissingZero!10406 (index!43995 (_ BitVec 32))) (Found!10406 (index!43996 (_ BitVec 32))) (Intermediate!10406 (undefined!11218 Bool) (index!43997 (_ BitVec 32)) (x!125807 (_ BitVec 32))) (Undefined!10406) (MissingVacant!10406 (index!43998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95669 (_ BitVec 32)) SeekEntryResult!10406)

(assert (=> b!1398507 (= e!791829 (= (seekEntryOrOpen!0 (select (arr!46186 a!2901) j!112) a!2901 mask!2840) (Found!10406 j!112)))))

(declare-fun b!1398508 () Bool)

(declare-fun res!936741 () Bool)

(assert (=> b!1398508 (=> (not res!936741) (not e!791827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398508 (= res!936741 (validKeyInArray!0 (select (arr!46186 a!2901) i!1037)))))

(declare-fun b!1398509 () Bool)

(declare-fun e!791830 () Bool)

(declare-fun e!791828 () Bool)

(assert (=> b!1398509 (= e!791830 e!791828)))

(declare-fun res!936735 () Bool)

(assert (=> b!1398509 (=> res!936735 e!791828)))

(declare-fun lt!614546 () (_ BitVec 32))

(declare-fun lt!614549 () SeekEntryResult!10406)

(declare-fun lt!614545 () SeekEntryResult!10406)

(get-info :version)

(assert (=> b!1398509 (= res!936735 (or (= lt!614545 lt!614549) (not ((_ is Intermediate!10406) lt!614549)) (bvslt (x!125807 lt!614545) #b00000000000000000000000000000000) (bvsgt (x!125807 lt!614545) #b01111111111111111111111111111110) (bvslt lt!614546 #b00000000000000000000000000000000) (bvsge lt!614546 (size!46737 a!2901)) (bvslt (index!43997 lt!614545) #b00000000000000000000000000000000) (bvsge (index!43997 lt!614545) (size!46737 a!2901)) (not (= lt!614545 (Intermediate!10406 false (index!43997 lt!614545) (x!125807 lt!614545)))) (not (= lt!614549 (Intermediate!10406 (undefined!11218 lt!614549) (index!43997 lt!614549) (x!125807 lt!614549))))))))

(declare-fun lt!614543 () (_ BitVec 64))

(declare-fun lt!614547 () array!95669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95669 (_ BitVec 32)) SeekEntryResult!10406)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398509 (= lt!614549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614543 mask!2840) lt!614543 lt!614547 mask!2840))))

(assert (=> b!1398509 (= lt!614543 (select (store (arr!46186 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398509 (= lt!614547 (array!95670 (store (arr!46186 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46737 a!2901)))))

(declare-fun b!1398510 () Bool)

(declare-fun res!936740 () Bool)

(assert (=> b!1398510 (=> (not res!936740) (not e!791827))))

(assert (=> b!1398510 (= res!936740 (validKeyInArray!0 (select (arr!46186 a!2901) j!112)))))

(declare-fun res!936734 () Bool)

(assert (=> start!120218 (=> (not res!936734) (not e!791827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120218 (= res!936734 (validMask!0 mask!2840))))

(assert (=> start!120218 e!791827))

(assert (=> start!120218 true))

(declare-fun array_inv!35467 (array!95669) Bool)

(assert (=> start!120218 (array_inv!35467 a!2901)))

(declare-fun b!1398511 () Bool)

(assert (=> b!1398511 (= e!791828 true)))

(declare-fun lt!614548 () SeekEntryResult!10406)

(assert (=> b!1398511 (= lt!614548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614546 lt!614543 lt!614547 mask!2840))))

(declare-fun b!1398512 () Bool)

(assert (=> b!1398512 (= e!791827 (not e!791830))))

(declare-fun res!936738 () Bool)

(assert (=> b!1398512 (=> res!936738 e!791830)))

(assert (=> b!1398512 (= res!936738 (or (not ((_ is Intermediate!10406) lt!614545)) (undefined!11218 lt!614545)))))

(assert (=> b!1398512 e!791829))

(declare-fun res!936736 () Bool)

(assert (=> b!1398512 (=> (not res!936736) (not e!791829))))

(assert (=> b!1398512 (= res!936736 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46843 0))(
  ( (Unit!46844) )
))
(declare-fun lt!614544 () Unit!46843)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46843)

(assert (=> b!1398512 (= lt!614544 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398512 (= lt!614545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614546 (select (arr!46186 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398512 (= lt!614546 (toIndex!0 (select (arr!46186 a!2901) j!112) mask!2840))))

(declare-fun b!1398513 () Bool)

(declare-fun res!936739 () Bool)

(assert (=> b!1398513 (=> (not res!936739) (not e!791827))))

(declare-datatypes ((List!32692 0))(
  ( (Nil!32689) (Cons!32688 (h!33938 (_ BitVec 64)) (t!47378 List!32692)) )
))
(declare-fun arrayNoDuplicates!0 (array!95669 (_ BitVec 32) List!32692) Bool)

(assert (=> b!1398513 (= res!936739 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32689))))

(assert (= (and start!120218 res!936734) b!1398505))

(assert (= (and b!1398505 res!936737) b!1398508))

(assert (= (and b!1398508 res!936741) b!1398510))

(assert (= (and b!1398510 res!936740) b!1398506))

(assert (= (and b!1398506 res!936742) b!1398513))

(assert (= (and b!1398513 res!936739) b!1398512))

(assert (= (and b!1398512 res!936736) b!1398507))

(assert (= (and b!1398512 (not res!936738)) b!1398509))

(assert (= (and b!1398509 (not res!936735)) b!1398511))

(declare-fun m!1285483 () Bool)

(assert (=> b!1398507 m!1285483))

(assert (=> b!1398507 m!1285483))

(declare-fun m!1285485 () Bool)

(assert (=> b!1398507 m!1285485))

(declare-fun m!1285487 () Bool)

(assert (=> b!1398513 m!1285487))

(assert (=> b!1398512 m!1285483))

(declare-fun m!1285489 () Bool)

(assert (=> b!1398512 m!1285489))

(assert (=> b!1398512 m!1285483))

(declare-fun m!1285491 () Bool)

(assert (=> b!1398512 m!1285491))

(assert (=> b!1398512 m!1285483))

(declare-fun m!1285493 () Bool)

(assert (=> b!1398512 m!1285493))

(declare-fun m!1285495 () Bool)

(assert (=> b!1398512 m!1285495))

(declare-fun m!1285497 () Bool)

(assert (=> b!1398506 m!1285497))

(declare-fun m!1285499 () Bool)

(assert (=> b!1398511 m!1285499))

(declare-fun m!1285501 () Bool)

(assert (=> b!1398509 m!1285501))

(assert (=> b!1398509 m!1285501))

(declare-fun m!1285503 () Bool)

(assert (=> b!1398509 m!1285503))

(declare-fun m!1285505 () Bool)

(assert (=> b!1398509 m!1285505))

(declare-fun m!1285507 () Bool)

(assert (=> b!1398509 m!1285507))

(assert (=> b!1398510 m!1285483))

(assert (=> b!1398510 m!1285483))

(declare-fun m!1285509 () Bool)

(assert (=> b!1398510 m!1285509))

(declare-fun m!1285511 () Bool)

(assert (=> b!1398508 m!1285511))

(assert (=> b!1398508 m!1285511))

(declare-fun m!1285513 () Bool)

(assert (=> b!1398508 m!1285513))

(declare-fun m!1285515 () Bool)

(assert (=> start!120218 m!1285515))

(declare-fun m!1285517 () Bool)

(assert (=> start!120218 m!1285517))

(check-sat (not b!1398506) (not b!1398510) (not b!1398511) (not b!1398513) (not b!1398509) (not b!1398508) (not b!1398507) (not start!120218) (not b!1398512))
(check-sat)
