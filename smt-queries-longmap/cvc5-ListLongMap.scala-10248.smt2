; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120732 () Bool)

(assert start!120732)

(declare-fun b!1404777 () Bool)

(declare-fun res!942610 () Bool)

(declare-fun e!795471 () Bool)

(assert (=> b!1404777 (=> (not res!942610) (not e!795471))))

(declare-datatypes ((array!96063 0))(
  ( (array!96064 (arr!46380 (Array (_ BitVec 32) (_ BitVec 64))) (size!46931 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96063)

(declare-datatypes ((List!32886 0))(
  ( (Nil!32883) (Cons!32882 (h!34138 (_ BitVec 64)) (t!47572 List!32886)) )
))
(declare-fun arrayNoDuplicates!0 (array!96063 (_ BitVec 32) List!32886) Bool)

(assert (=> b!1404777 (= res!942610 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32883))))

(declare-fun b!1404778 () Bool)

(declare-fun res!942605 () Bool)

(assert (=> b!1404778 (=> (not res!942605) (not e!795471))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404778 (= res!942605 (and (= (size!46931 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46931 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46931 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404779 () Bool)

(declare-fun e!795473 () Bool)

(declare-datatypes ((SeekEntryResult!10600 0))(
  ( (MissingZero!10600 (index!44777 (_ BitVec 32))) (Found!10600 (index!44778 (_ BitVec 32))) (Intermediate!10600 (undefined!11412 Bool) (index!44779 (_ BitVec 32)) (x!126534 (_ BitVec 32))) (Undefined!10600) (MissingVacant!10600 (index!44780 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96063 (_ BitVec 32)) SeekEntryResult!10600)

(assert (=> b!1404779 (= e!795473 (= (seekEntryOrOpen!0 (select (arr!46380 a!2901) j!112) a!2901 mask!2840) (Found!10600 j!112)))))

(declare-fun res!942604 () Bool)

(assert (=> start!120732 (=> (not res!942604) (not e!795471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120732 (= res!942604 (validMask!0 mask!2840))))

(assert (=> start!120732 e!795471))

(assert (=> start!120732 true))

(declare-fun array_inv!35661 (array!96063) Bool)

(assert (=> start!120732 (array_inv!35661 a!2901)))

(declare-fun b!1404780 () Bool)

(declare-fun res!942606 () Bool)

(assert (=> b!1404780 (=> (not res!942606) (not e!795471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404780 (= res!942606 (validKeyInArray!0 (select (arr!46380 a!2901) i!1037)))))

(declare-fun b!1404781 () Bool)

(declare-fun res!942609 () Bool)

(assert (=> b!1404781 (=> (not res!942609) (not e!795471))))

(assert (=> b!1404781 (= res!942609 (validKeyInArray!0 (select (arr!46380 a!2901) j!112)))))

(declare-fun b!1404782 () Bool)

(assert (=> b!1404782 (= e!795471 (not true))))

(assert (=> b!1404782 e!795473))

(declare-fun res!942608 () Bool)

(assert (=> b!1404782 (=> (not res!942608) (not e!795473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96063 (_ BitVec 32)) Bool)

(assert (=> b!1404782 (= res!942608 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47231 0))(
  ( (Unit!47232) )
))
(declare-fun lt!618863 () Unit!47231)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47231)

(assert (=> b!1404782 (= lt!618863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618862 () SeekEntryResult!10600)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96063 (_ BitVec 32)) SeekEntryResult!10600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404782 (= lt!618862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46380 a!2901) j!112) mask!2840) (select (arr!46380 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404783 () Bool)

(declare-fun res!942607 () Bool)

(assert (=> b!1404783 (=> (not res!942607) (not e!795471))))

(assert (=> b!1404783 (= res!942607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120732 res!942604) b!1404778))

(assert (= (and b!1404778 res!942605) b!1404780))

(assert (= (and b!1404780 res!942606) b!1404781))

(assert (= (and b!1404781 res!942609) b!1404783))

(assert (= (and b!1404783 res!942607) b!1404777))

(assert (= (and b!1404777 res!942610) b!1404782))

(assert (= (and b!1404782 res!942608) b!1404779))

(declare-fun m!1293713 () Bool)

(assert (=> b!1404783 m!1293713))

(declare-fun m!1293715 () Bool)

(assert (=> b!1404777 m!1293715))

(declare-fun m!1293717 () Bool)

(assert (=> b!1404780 m!1293717))

(assert (=> b!1404780 m!1293717))

(declare-fun m!1293719 () Bool)

(assert (=> b!1404780 m!1293719))

(declare-fun m!1293721 () Bool)

(assert (=> b!1404782 m!1293721))

(declare-fun m!1293723 () Bool)

(assert (=> b!1404782 m!1293723))

(assert (=> b!1404782 m!1293721))

(declare-fun m!1293725 () Bool)

(assert (=> b!1404782 m!1293725))

(assert (=> b!1404782 m!1293723))

(assert (=> b!1404782 m!1293721))

(declare-fun m!1293727 () Bool)

(assert (=> b!1404782 m!1293727))

(declare-fun m!1293729 () Bool)

(assert (=> b!1404782 m!1293729))

(assert (=> b!1404779 m!1293721))

(assert (=> b!1404779 m!1293721))

(declare-fun m!1293731 () Bool)

(assert (=> b!1404779 m!1293731))

(assert (=> b!1404781 m!1293721))

(assert (=> b!1404781 m!1293721))

(declare-fun m!1293733 () Bool)

(assert (=> b!1404781 m!1293733))

(declare-fun m!1293735 () Bool)

(assert (=> start!120732 m!1293735))

(declare-fun m!1293737 () Bool)

(assert (=> start!120732 m!1293737))

(push 1)

(assert (not b!1404782))

(assert (not b!1404783))

(assert (not b!1404777))

(assert (not start!120732))

(assert (not b!1404780))

(assert (not b!1404781))

(assert (not b!1404779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

