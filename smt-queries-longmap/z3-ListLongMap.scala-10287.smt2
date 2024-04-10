; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120884 () Bool)

(assert start!120884)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96191 0))(
  ( (array!96192 (arr!46443 (Array (_ BitVec 32) (_ BitVec 64))) (size!46993 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96191)

(declare-fun e!796099 () Bool)

(declare-fun b!1406552 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10754 0))(
  ( (MissingZero!10754 (index!45393 (_ BitVec 32))) (Found!10754 (index!45394 (_ BitVec 32))) (Intermediate!10754 (undefined!11566 Bool) (index!45395 (_ BitVec 32)) (x!126993 (_ BitVec 32))) (Undefined!10754) (MissingVacant!10754 (index!45396 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96191 (_ BitVec 32)) SeekEntryResult!10754)

(assert (=> b!1406552 (= e!796099 (= (seekEntryOrOpen!0 (select (arr!46443 a!2901) j!112) a!2901 mask!2840) (Found!10754 j!112)))))

(declare-fun b!1406553 () Bool)

(declare-fun e!796098 () Bool)

(assert (=> b!1406553 (= e!796098 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!619426 () SeekEntryResult!10754)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96191 (_ BitVec 32)) SeekEntryResult!10754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406553 (= lt!619426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46443 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46443 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96192 (store (arr!46443 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46993 a!2901)) mask!2840))))

(declare-fun b!1406554 () Bool)

(declare-fun res!944774 () Bool)

(declare-fun e!796097 () Bool)

(assert (=> b!1406554 (=> (not res!944774) (not e!796097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96191 (_ BitVec 32)) Bool)

(assert (=> b!1406554 (= res!944774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944775 () Bool)

(assert (=> start!120884 (=> (not res!944775) (not e!796097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120884 (= res!944775 (validMask!0 mask!2840))))

(assert (=> start!120884 e!796097))

(assert (=> start!120884 true))

(declare-fun array_inv!35471 (array!96191) Bool)

(assert (=> start!120884 (array_inv!35471 a!2901)))

(declare-fun b!1406555 () Bool)

(assert (=> b!1406555 (= e!796097 (not e!796098))))

(declare-fun res!944776 () Bool)

(assert (=> b!1406555 (=> res!944776 e!796098)))

(declare-fun lt!619427 () SeekEntryResult!10754)

(get-info :version)

(assert (=> b!1406555 (= res!944776 (or (not ((_ is Intermediate!10754) lt!619427)) (undefined!11566 lt!619427)))))

(assert (=> b!1406555 e!796099))

(declare-fun res!944773 () Bool)

(assert (=> b!1406555 (=> (not res!944773) (not e!796099))))

(assert (=> b!1406555 (= res!944773 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47482 0))(
  ( (Unit!47483) )
))
(declare-fun lt!619428 () Unit!47482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47482)

(assert (=> b!1406555 (= lt!619428 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406555 (= lt!619427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46443 a!2901) j!112) mask!2840) (select (arr!46443 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406556 () Bool)

(declare-fun res!944771 () Bool)

(assert (=> b!1406556 (=> (not res!944771) (not e!796097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406556 (= res!944771 (validKeyInArray!0 (select (arr!46443 a!2901) i!1037)))))

(declare-fun b!1406557 () Bool)

(declare-fun res!944770 () Bool)

(assert (=> b!1406557 (=> (not res!944770) (not e!796097))))

(assert (=> b!1406557 (= res!944770 (and (= (size!46993 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46993 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46993 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406558 () Bool)

(declare-fun res!944769 () Bool)

(assert (=> b!1406558 (=> (not res!944769) (not e!796097))))

(assert (=> b!1406558 (= res!944769 (validKeyInArray!0 (select (arr!46443 a!2901) j!112)))))

(declare-fun b!1406559 () Bool)

(declare-fun res!944772 () Bool)

(assert (=> b!1406559 (=> (not res!944772) (not e!796097))))

(declare-datatypes ((List!32962 0))(
  ( (Nil!32959) (Cons!32958 (h!34212 (_ BitVec 64)) (t!47656 List!32962)) )
))
(declare-fun arrayNoDuplicates!0 (array!96191 (_ BitVec 32) List!32962) Bool)

(assert (=> b!1406559 (= res!944772 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32959))))

(assert (= (and start!120884 res!944775) b!1406557))

(assert (= (and b!1406557 res!944770) b!1406556))

(assert (= (and b!1406556 res!944771) b!1406558))

(assert (= (and b!1406558 res!944769) b!1406554))

(assert (= (and b!1406554 res!944774) b!1406559))

(assert (= (and b!1406559 res!944772) b!1406555))

(assert (= (and b!1406555 res!944773) b!1406552))

(assert (= (and b!1406555 (not res!944776)) b!1406553))

(declare-fun m!1295743 () Bool)

(assert (=> b!1406555 m!1295743))

(declare-fun m!1295745 () Bool)

(assert (=> b!1406555 m!1295745))

(assert (=> b!1406555 m!1295743))

(declare-fun m!1295747 () Bool)

(assert (=> b!1406555 m!1295747))

(assert (=> b!1406555 m!1295745))

(assert (=> b!1406555 m!1295743))

(declare-fun m!1295749 () Bool)

(assert (=> b!1406555 m!1295749))

(declare-fun m!1295751 () Bool)

(assert (=> b!1406555 m!1295751))

(declare-fun m!1295753 () Bool)

(assert (=> b!1406556 m!1295753))

(assert (=> b!1406556 m!1295753))

(declare-fun m!1295755 () Bool)

(assert (=> b!1406556 m!1295755))

(declare-fun m!1295757 () Bool)

(assert (=> b!1406553 m!1295757))

(declare-fun m!1295759 () Bool)

(assert (=> b!1406553 m!1295759))

(assert (=> b!1406553 m!1295759))

(declare-fun m!1295761 () Bool)

(assert (=> b!1406553 m!1295761))

(assert (=> b!1406553 m!1295761))

(assert (=> b!1406553 m!1295759))

(declare-fun m!1295763 () Bool)

(assert (=> b!1406553 m!1295763))

(declare-fun m!1295765 () Bool)

(assert (=> b!1406559 m!1295765))

(assert (=> b!1406558 m!1295743))

(assert (=> b!1406558 m!1295743))

(declare-fun m!1295767 () Bool)

(assert (=> b!1406558 m!1295767))

(declare-fun m!1295769 () Bool)

(assert (=> start!120884 m!1295769))

(declare-fun m!1295771 () Bool)

(assert (=> start!120884 m!1295771))

(assert (=> b!1406552 m!1295743))

(assert (=> b!1406552 m!1295743))

(declare-fun m!1295773 () Bool)

(assert (=> b!1406552 m!1295773))

(declare-fun m!1295775 () Bool)

(assert (=> b!1406554 m!1295775))

(check-sat (not b!1406553) (not b!1406555) (not b!1406556) (not b!1406559) (not start!120884) (not b!1406552) (not b!1406554) (not b!1406558))
