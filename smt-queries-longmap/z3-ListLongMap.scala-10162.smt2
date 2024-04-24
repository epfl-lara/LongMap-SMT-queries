; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119924 () Bool)

(assert start!119924)

(declare-fun b!1395994 () Bool)

(declare-fun res!934725 () Bool)

(declare-fun e!790431 () Bool)

(assert (=> b!1395994 (=> (not res!934725) (not e!790431))))

(declare-datatypes ((array!95528 0))(
  ( (array!95529 (arr!46120 (Array (_ BitVec 32) (_ BitVec 64))) (size!46671 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95528)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95528 (_ BitVec 32)) Bool)

(assert (=> b!1395994 (= res!934725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!790432 () Bool)

(declare-fun b!1395996 () Bool)

(declare-datatypes ((SeekEntryResult!10340 0))(
  ( (MissingZero!10340 (index!43731 (_ BitVec 32))) (Found!10340 (index!43732 (_ BitVec 32))) (Intermediate!10340 (undefined!11152 Bool) (index!43733 (_ BitVec 32)) (x!125547 (_ BitVec 32))) (Undefined!10340) (MissingVacant!10340 (index!43734 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95528 (_ BitVec 32)) SeekEntryResult!10340)

(assert (=> b!1395996 (= e!790432 (= (seekEntryOrOpen!0 (select (arr!46120 a!2901) j!112) a!2901 mask!2840) (Found!10340 j!112)))))

(declare-fun b!1395997 () Bool)

(declare-fun res!934724 () Bool)

(assert (=> b!1395997 (=> (not res!934724) (not e!790431))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395997 (= res!934724 (and (= (size!46671 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46671 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46671 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395998 () Bool)

(declare-fun res!934726 () Bool)

(declare-fun e!790433 () Bool)

(assert (=> b!1395998 (=> res!934726 e!790433)))

(declare-fun lt!613175 () SeekEntryResult!10340)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95528 (_ BitVec 32)) SeekEntryResult!10340)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395998 (= res!934726 (= lt!613175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46120 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46120 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95529 (store (arr!46120 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46671 a!2901)) mask!2840)))))

(declare-fun b!1395999 () Bool)

(assert (=> b!1395999 (= e!790431 (not e!790433))))

(declare-fun res!934723 () Bool)

(assert (=> b!1395999 (=> res!934723 e!790433)))

(get-info :version)

(assert (=> b!1395999 (= res!934723 (or (not ((_ is Intermediate!10340) lt!613175)) (undefined!11152 lt!613175)))))

(assert (=> b!1395999 e!790432))

(declare-fun res!934718 () Bool)

(assert (=> b!1395999 (=> (not res!934718) (not e!790432))))

(assert (=> b!1395999 (= res!934718 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46711 0))(
  ( (Unit!46712) )
))
(declare-fun lt!613174 () Unit!46711)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46711)

(assert (=> b!1395999 (= lt!613174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395999 (= lt!613175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46120 a!2901) j!112) mask!2840) (select (arr!46120 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396000 () Bool)

(declare-fun res!934720 () Bool)

(assert (=> b!1396000 (=> (not res!934720) (not e!790431))))

(declare-datatypes ((List!32626 0))(
  ( (Nil!32623) (Cons!32622 (h!33863 (_ BitVec 64)) (t!47312 List!32626)) )
))
(declare-fun arrayNoDuplicates!0 (array!95528 (_ BitVec 32) List!32626) Bool)

(assert (=> b!1396000 (= res!934720 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32623))))

(declare-fun b!1395995 () Bool)

(declare-fun res!934719 () Bool)

(assert (=> b!1395995 (=> (not res!934719) (not e!790431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395995 (= res!934719 (validKeyInArray!0 (select (arr!46120 a!2901) i!1037)))))

(declare-fun res!934721 () Bool)

(assert (=> start!119924 (=> (not res!934721) (not e!790431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119924 (= res!934721 (validMask!0 mask!2840))))

(assert (=> start!119924 e!790431))

(assert (=> start!119924 true))

(declare-fun array_inv!35401 (array!95528) Bool)

(assert (=> start!119924 (array_inv!35401 a!2901)))

(declare-fun b!1396001 () Bool)

(declare-fun res!934722 () Bool)

(assert (=> b!1396001 (=> (not res!934722) (not e!790431))))

(assert (=> b!1396001 (= res!934722 (validKeyInArray!0 (select (arr!46120 a!2901) j!112)))))

(declare-fun b!1396002 () Bool)

(assert (=> b!1396002 (= e!790433 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (= (and start!119924 res!934721) b!1395997))

(assert (= (and b!1395997 res!934724) b!1395995))

(assert (= (and b!1395995 res!934719) b!1396001))

(assert (= (and b!1396001 res!934722) b!1395994))

(assert (= (and b!1395994 res!934725) b!1396000))

(assert (= (and b!1396000 res!934720) b!1395999))

(assert (= (and b!1395999 res!934718) b!1395996))

(assert (= (and b!1395999 (not res!934723)) b!1395998))

(assert (= (and b!1395998 (not res!934726)) b!1396002))

(declare-fun m!1282711 () Bool)

(assert (=> b!1395996 m!1282711))

(assert (=> b!1395996 m!1282711))

(declare-fun m!1282713 () Bool)

(assert (=> b!1395996 m!1282713))

(declare-fun m!1282715 () Bool)

(assert (=> b!1395994 m!1282715))

(declare-fun m!1282717 () Bool)

(assert (=> b!1395995 m!1282717))

(assert (=> b!1395995 m!1282717))

(declare-fun m!1282719 () Bool)

(assert (=> b!1395995 m!1282719))

(declare-fun m!1282721 () Bool)

(assert (=> b!1396000 m!1282721))

(assert (=> b!1395999 m!1282711))

(declare-fun m!1282723 () Bool)

(assert (=> b!1395999 m!1282723))

(assert (=> b!1395999 m!1282711))

(declare-fun m!1282725 () Bool)

(assert (=> b!1395999 m!1282725))

(assert (=> b!1395999 m!1282723))

(assert (=> b!1395999 m!1282711))

(declare-fun m!1282727 () Bool)

(assert (=> b!1395999 m!1282727))

(declare-fun m!1282729 () Bool)

(assert (=> b!1395999 m!1282729))

(declare-fun m!1282731 () Bool)

(assert (=> start!119924 m!1282731))

(declare-fun m!1282733 () Bool)

(assert (=> start!119924 m!1282733))

(declare-fun m!1282735 () Bool)

(assert (=> b!1395998 m!1282735))

(declare-fun m!1282737 () Bool)

(assert (=> b!1395998 m!1282737))

(assert (=> b!1395998 m!1282737))

(declare-fun m!1282739 () Bool)

(assert (=> b!1395998 m!1282739))

(assert (=> b!1395998 m!1282739))

(assert (=> b!1395998 m!1282737))

(declare-fun m!1282741 () Bool)

(assert (=> b!1395998 m!1282741))

(assert (=> b!1396001 m!1282711))

(assert (=> b!1396001 m!1282711))

(declare-fun m!1282743 () Bool)

(assert (=> b!1396001 m!1282743))

(check-sat (not b!1395996) (not b!1395998) (not b!1395994) (not b!1395995) (not b!1396001) (not start!119924) (not b!1396000) (not b!1395999))
(check-sat)
