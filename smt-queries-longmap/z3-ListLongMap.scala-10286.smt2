; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120878 () Bool)

(assert start!120878)

(declare-fun b!1406480 () Bool)

(declare-fun res!944698 () Bool)

(declare-fun e!796064 () Bool)

(assert (=> b!1406480 (=> (not res!944698) (not e!796064))))

(declare-datatypes ((array!96185 0))(
  ( (array!96186 (arr!46440 (Array (_ BitVec 32) (_ BitVec 64))) (size!46990 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96185)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96185 (_ BitVec 32)) Bool)

(assert (=> b!1406480 (= res!944698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406481 () Bool)

(declare-fun e!796061 () Bool)

(assert (=> b!1406481 (= e!796061 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10751 0))(
  ( (MissingZero!10751 (index!45381 (_ BitVec 32))) (Found!10751 (index!45382 (_ BitVec 32))) (Intermediate!10751 (undefined!11563 Bool) (index!45383 (_ BitVec 32)) (x!126982 (_ BitVec 32))) (Undefined!10751) (MissingVacant!10751 (index!45384 (_ BitVec 32))) )
))
(declare-fun lt!619399 () SeekEntryResult!10751)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96185 (_ BitVec 32)) SeekEntryResult!10751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406481 (= lt!619399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46440 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46440 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96186 (store (arr!46440 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46990 a!2901)) mask!2840))))

(declare-fun b!1406482 () Bool)

(declare-fun res!944699 () Bool)

(assert (=> b!1406482 (=> (not res!944699) (not e!796064))))

(assert (=> b!1406482 (= res!944699 (and (= (size!46990 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46990 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46990 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406483 () Bool)

(declare-fun res!944697 () Bool)

(assert (=> b!1406483 (=> (not res!944697) (not e!796064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406483 (= res!944697 (validKeyInArray!0 (select (arr!46440 a!2901) i!1037)))))

(declare-fun b!1406484 () Bool)

(declare-fun res!944701 () Bool)

(assert (=> b!1406484 (=> (not res!944701) (not e!796064))))

(declare-datatypes ((List!32959 0))(
  ( (Nil!32956) (Cons!32955 (h!34209 (_ BitVec 64)) (t!47653 List!32959)) )
))
(declare-fun arrayNoDuplicates!0 (array!96185 (_ BitVec 32) List!32959) Bool)

(assert (=> b!1406484 (= res!944701 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32956))))

(declare-fun b!1406485 () Bool)

(declare-fun res!944703 () Bool)

(assert (=> b!1406485 (=> (not res!944703) (not e!796064))))

(assert (=> b!1406485 (= res!944703 (validKeyInArray!0 (select (arr!46440 a!2901) j!112)))))

(declare-fun res!944700 () Bool)

(assert (=> start!120878 (=> (not res!944700) (not e!796064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120878 (= res!944700 (validMask!0 mask!2840))))

(assert (=> start!120878 e!796064))

(assert (=> start!120878 true))

(declare-fun array_inv!35468 (array!96185) Bool)

(assert (=> start!120878 (array_inv!35468 a!2901)))

(declare-fun e!796063 () Bool)

(declare-fun b!1406486 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96185 (_ BitVec 32)) SeekEntryResult!10751)

(assert (=> b!1406486 (= e!796063 (= (seekEntryOrOpen!0 (select (arr!46440 a!2901) j!112) a!2901 mask!2840) (Found!10751 j!112)))))

(declare-fun b!1406487 () Bool)

(assert (=> b!1406487 (= e!796064 (not e!796061))))

(declare-fun res!944702 () Bool)

(assert (=> b!1406487 (=> res!944702 e!796061)))

(declare-fun lt!619401 () SeekEntryResult!10751)

(get-info :version)

(assert (=> b!1406487 (= res!944702 (or (not ((_ is Intermediate!10751) lt!619401)) (undefined!11563 lt!619401)))))

(assert (=> b!1406487 e!796063))

(declare-fun res!944704 () Bool)

(assert (=> b!1406487 (=> (not res!944704) (not e!796063))))

(assert (=> b!1406487 (= res!944704 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47476 0))(
  ( (Unit!47477) )
))
(declare-fun lt!619400 () Unit!47476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47476)

(assert (=> b!1406487 (= lt!619400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406487 (= lt!619401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46440 a!2901) j!112) mask!2840) (select (arr!46440 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120878 res!944700) b!1406482))

(assert (= (and b!1406482 res!944699) b!1406483))

(assert (= (and b!1406483 res!944697) b!1406485))

(assert (= (and b!1406485 res!944703) b!1406480))

(assert (= (and b!1406480 res!944698) b!1406484))

(assert (= (and b!1406484 res!944701) b!1406487))

(assert (= (and b!1406487 res!944704) b!1406486))

(assert (= (and b!1406487 (not res!944702)) b!1406481))

(declare-fun m!1295641 () Bool)

(assert (=> b!1406486 m!1295641))

(assert (=> b!1406486 m!1295641))

(declare-fun m!1295643 () Bool)

(assert (=> b!1406486 m!1295643))

(assert (=> b!1406487 m!1295641))

(declare-fun m!1295645 () Bool)

(assert (=> b!1406487 m!1295645))

(assert (=> b!1406487 m!1295641))

(declare-fun m!1295647 () Bool)

(assert (=> b!1406487 m!1295647))

(assert (=> b!1406487 m!1295645))

(assert (=> b!1406487 m!1295641))

(declare-fun m!1295649 () Bool)

(assert (=> b!1406487 m!1295649))

(declare-fun m!1295651 () Bool)

(assert (=> b!1406487 m!1295651))

(declare-fun m!1295653 () Bool)

(assert (=> b!1406481 m!1295653))

(declare-fun m!1295655 () Bool)

(assert (=> b!1406481 m!1295655))

(assert (=> b!1406481 m!1295655))

(declare-fun m!1295657 () Bool)

(assert (=> b!1406481 m!1295657))

(assert (=> b!1406481 m!1295657))

(assert (=> b!1406481 m!1295655))

(declare-fun m!1295659 () Bool)

(assert (=> b!1406481 m!1295659))

(declare-fun m!1295661 () Bool)

(assert (=> b!1406484 m!1295661))

(assert (=> b!1406485 m!1295641))

(assert (=> b!1406485 m!1295641))

(declare-fun m!1295663 () Bool)

(assert (=> b!1406485 m!1295663))

(declare-fun m!1295665 () Bool)

(assert (=> b!1406480 m!1295665))

(declare-fun m!1295667 () Bool)

(assert (=> b!1406483 m!1295667))

(assert (=> b!1406483 m!1295667))

(declare-fun m!1295669 () Bool)

(assert (=> b!1406483 m!1295669))

(declare-fun m!1295671 () Bool)

(assert (=> start!120878 m!1295671))

(declare-fun m!1295673 () Bool)

(assert (=> start!120878 m!1295673))

(check-sat (not b!1406481) (not b!1406480) (not b!1406485) (not b!1406487) (not start!120878) (not b!1406484) (not b!1406483) (not b!1406486))
