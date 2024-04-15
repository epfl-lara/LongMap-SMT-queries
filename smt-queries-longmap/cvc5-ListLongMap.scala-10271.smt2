; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120786 () Bool)

(assert start!120786)

(declare-fun b!1405371 () Bool)

(declare-fun res!943641 () Bool)

(declare-fun e!795524 () Bool)

(assert (=> b!1405371 (=> (not res!943641) (not e!795524))))

(declare-datatypes ((array!96046 0))(
  ( (array!96047 (arr!46371 (Array (_ BitVec 32) (_ BitVec 64))) (size!46923 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96046)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405371 (= res!943641 (validKeyInArray!0 (select (arr!46371 a!2901) j!112)))))

(declare-fun b!1405372 () Bool)

(assert (=> b!1405372 (= e!795524 (not true))))

(declare-fun e!795522 () Bool)

(assert (=> b!1405372 e!795522))

(declare-fun res!943645 () Bool)

(assert (=> b!1405372 (=> (not res!943645) (not e!795522))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96046 (_ BitVec 32)) Bool)

(assert (=> b!1405372 (= res!943645 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47233 0))(
  ( (Unit!47234) )
))
(declare-fun lt!618841 () Unit!47233)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47233)

(assert (=> b!1405372 (= lt!618841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10708 0))(
  ( (MissingZero!10708 (index!45209 (_ BitVec 32))) (Found!10708 (index!45210 (_ BitVec 32))) (Intermediate!10708 (undefined!11520 Bool) (index!45211 (_ BitVec 32)) (x!126816 (_ BitVec 32))) (Undefined!10708) (MissingVacant!10708 (index!45212 (_ BitVec 32))) )
))
(declare-fun lt!618842 () SeekEntryResult!10708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96046 (_ BitVec 32)) SeekEntryResult!10708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405372 (= lt!618842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) (select (arr!46371 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405373 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96046 (_ BitVec 32)) SeekEntryResult!10708)

(assert (=> b!1405373 (= e!795522 (= (seekEntryOrOpen!0 (select (arr!46371 a!2901) j!112) a!2901 mask!2840) (Found!10708 j!112)))))

(declare-fun b!1405374 () Bool)

(declare-fun res!943643 () Bool)

(assert (=> b!1405374 (=> (not res!943643) (not e!795524))))

(declare-datatypes ((List!32968 0))(
  ( (Nil!32965) (Cons!32964 (h!34218 (_ BitVec 64)) (t!47654 List!32968)) )
))
(declare-fun arrayNoDuplicates!0 (array!96046 (_ BitVec 32) List!32968) Bool)

(assert (=> b!1405374 (= res!943643 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32965))))

(declare-fun b!1405375 () Bool)

(declare-fun res!943644 () Bool)

(assert (=> b!1405375 (=> (not res!943644) (not e!795524))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405375 (= res!943644 (validKeyInArray!0 (select (arr!46371 a!2901) i!1037)))))

(declare-fun b!1405376 () Bool)

(declare-fun res!943642 () Bool)

(assert (=> b!1405376 (=> (not res!943642) (not e!795524))))

(assert (=> b!1405376 (= res!943642 (and (= (size!46923 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46923 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46923 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405377 () Bool)

(declare-fun res!943639 () Bool)

(assert (=> b!1405377 (=> (not res!943639) (not e!795524))))

(assert (=> b!1405377 (= res!943639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943640 () Bool)

(assert (=> start!120786 (=> (not res!943640) (not e!795524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120786 (= res!943640 (validMask!0 mask!2840))))

(assert (=> start!120786 e!795524))

(assert (=> start!120786 true))

(declare-fun array_inv!35604 (array!96046) Bool)

(assert (=> start!120786 (array_inv!35604 a!2901)))

(assert (= (and start!120786 res!943640) b!1405376))

(assert (= (and b!1405376 res!943642) b!1405375))

(assert (= (and b!1405375 res!943644) b!1405371))

(assert (= (and b!1405371 res!943641) b!1405377))

(assert (= (and b!1405377 res!943639) b!1405374))

(assert (= (and b!1405374 res!943643) b!1405372))

(assert (= (and b!1405372 res!943645) b!1405373))

(declare-fun m!1293701 () Bool)

(assert (=> b!1405375 m!1293701))

(assert (=> b!1405375 m!1293701))

(declare-fun m!1293703 () Bool)

(assert (=> b!1405375 m!1293703))

(declare-fun m!1293705 () Bool)

(assert (=> start!120786 m!1293705))

(declare-fun m!1293707 () Bool)

(assert (=> start!120786 m!1293707))

(declare-fun m!1293709 () Bool)

(assert (=> b!1405373 m!1293709))

(assert (=> b!1405373 m!1293709))

(declare-fun m!1293711 () Bool)

(assert (=> b!1405373 m!1293711))

(assert (=> b!1405371 m!1293709))

(assert (=> b!1405371 m!1293709))

(declare-fun m!1293713 () Bool)

(assert (=> b!1405371 m!1293713))

(assert (=> b!1405372 m!1293709))

(declare-fun m!1293715 () Bool)

(assert (=> b!1405372 m!1293715))

(assert (=> b!1405372 m!1293709))

(declare-fun m!1293717 () Bool)

(assert (=> b!1405372 m!1293717))

(assert (=> b!1405372 m!1293715))

(assert (=> b!1405372 m!1293709))

(declare-fun m!1293719 () Bool)

(assert (=> b!1405372 m!1293719))

(declare-fun m!1293721 () Bool)

(assert (=> b!1405372 m!1293721))

(declare-fun m!1293723 () Bool)

(assert (=> b!1405377 m!1293723))

(declare-fun m!1293725 () Bool)

(assert (=> b!1405374 m!1293725))

(push 1)

(assert (not b!1405371))

(assert (not b!1405374))

(assert (not b!1405373))

(assert (not b!1405377))

(assert (not b!1405375))

(assert (not b!1405372))

(assert (not start!120786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

