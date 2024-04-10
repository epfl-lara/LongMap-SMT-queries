; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121604 () Bool)

(assert start!121604)

(declare-fun b!1412676 () Bool)

(declare-fun e!799443 () Bool)

(declare-fun e!799444 () Bool)

(assert (=> b!1412676 (= e!799443 e!799444)))

(declare-fun res!949667 () Bool)

(assert (=> b!1412676 (=> res!949667 e!799444)))

(declare-datatypes ((SeekEntryResult!10919 0))(
  ( (MissingZero!10919 (index!46056 (_ BitVec 32))) (Found!10919 (index!46057 (_ BitVec 32))) (Intermediate!10919 (undefined!11731 Bool) (index!46058 (_ BitVec 32)) (x!127646 (_ BitVec 32))) (Undefined!10919) (MissingVacant!10919 (index!46059 (_ BitVec 32))) )
))
(declare-fun lt!622500 () SeekEntryResult!10919)

(declare-fun lt!622503 () SeekEntryResult!10919)

(get-info :version)

(assert (=> b!1412676 (= res!949667 (or (= lt!622500 lt!622503) (not ((_ is Intermediate!10919) lt!622503))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96542 0))(
  ( (array!96543 (arr!46608 (Array (_ BitVec 32) (_ BitVec 64))) (size!47158 (_ BitVec 32))) )
))
(declare-fun lt!622504 () array!96542)

(declare-fun lt!622502 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96542 (_ BitVec 32)) SeekEntryResult!10919)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412676 (= lt!622503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622502 mask!2840) lt!622502 lt!622504 mask!2840))))

(declare-fun a!2901 () array!96542)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412676 (= lt!622502 (select (store (arr!46608 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412676 (= lt!622504 (array!96543 (store (arr!46608 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47158 a!2901)))))

(declare-fun b!1412677 () Bool)

(declare-fun e!799446 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96542 (_ BitVec 32)) SeekEntryResult!10919)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96542 (_ BitVec 32)) SeekEntryResult!10919)

(assert (=> b!1412677 (= e!799446 (= (seekEntryOrOpen!0 lt!622502 lt!622504 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127646 lt!622503) (index!46058 lt!622503) (index!46058 lt!622503) (select (arr!46608 a!2901) j!112) lt!622504 mask!2840)))))

(declare-fun b!1412678 () Bool)

(declare-fun res!949675 () Bool)

(declare-fun e!799447 () Bool)

(assert (=> b!1412678 (=> (not res!949675) (not e!799447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96542 (_ BitVec 32)) Bool)

(assert (=> b!1412678 (= res!949675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!949672 () Bool)

(assert (=> start!121604 (=> (not res!949672) (not e!799447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121604 (= res!949672 (validMask!0 mask!2840))))

(assert (=> start!121604 e!799447))

(assert (=> start!121604 true))

(declare-fun array_inv!35636 (array!96542) Bool)

(assert (=> start!121604 (array_inv!35636 a!2901)))

(declare-fun b!1412679 () Bool)

(declare-fun res!949666 () Bool)

(assert (=> b!1412679 (=> (not res!949666) (not e!799447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412679 (= res!949666 (validKeyInArray!0 (select (arr!46608 a!2901) j!112)))))

(declare-fun b!1412680 () Bool)

(declare-fun e!799445 () Bool)

(assert (=> b!1412680 (= e!799445 (= (seekEntryOrOpen!0 (select (arr!46608 a!2901) j!112) a!2901 mask!2840) (Found!10919 j!112)))))

(declare-fun b!1412681 () Bool)

(assert (=> b!1412681 (= e!799444 true)))

(assert (=> b!1412681 e!799446))

(declare-fun res!949668 () Bool)

(assert (=> b!1412681 (=> (not res!949668) (not e!799446))))

(assert (=> b!1412681 (= res!949668 (and (not (undefined!11731 lt!622503)) (= (index!46058 lt!622503) i!1037) (bvslt (x!127646 lt!622503) (x!127646 lt!622500)) (= (select (store (arr!46608 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46058 lt!622503)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47812 0))(
  ( (Unit!47813) )
))
(declare-fun lt!622505 () Unit!47812)

(declare-fun lt!622501 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47812)

(assert (=> b!1412681 (= lt!622505 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622501 (x!127646 lt!622500) (index!46058 lt!622500) (x!127646 lt!622503) (index!46058 lt!622503) (undefined!11731 lt!622503) mask!2840))))

(declare-fun b!1412682 () Bool)

(declare-fun res!949669 () Bool)

(assert (=> b!1412682 (=> (not res!949669) (not e!799447))))

(assert (=> b!1412682 (= res!949669 (validKeyInArray!0 (select (arr!46608 a!2901) i!1037)))))

(declare-fun b!1412683 () Bool)

(declare-fun res!949670 () Bool)

(assert (=> b!1412683 (=> (not res!949670) (not e!799447))))

(assert (=> b!1412683 (= res!949670 (and (= (size!47158 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47158 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47158 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412684 () Bool)

(declare-fun res!949673 () Bool)

(assert (=> b!1412684 (=> (not res!949673) (not e!799447))))

(declare-datatypes ((List!33127 0))(
  ( (Nil!33124) (Cons!33123 (h!34398 (_ BitVec 64)) (t!47821 List!33127)) )
))
(declare-fun arrayNoDuplicates!0 (array!96542 (_ BitVec 32) List!33127) Bool)

(assert (=> b!1412684 (= res!949673 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33124))))

(declare-fun b!1412685 () Bool)

(assert (=> b!1412685 (= e!799447 (not e!799443))))

(declare-fun res!949671 () Bool)

(assert (=> b!1412685 (=> res!949671 e!799443)))

(assert (=> b!1412685 (= res!949671 (or (not ((_ is Intermediate!10919) lt!622500)) (undefined!11731 lt!622500)))))

(assert (=> b!1412685 e!799445))

(declare-fun res!949674 () Bool)

(assert (=> b!1412685 (=> (not res!949674) (not e!799445))))

(assert (=> b!1412685 (= res!949674 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622506 () Unit!47812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47812)

(assert (=> b!1412685 (= lt!622506 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412685 (= lt!622500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622501 (select (arr!46608 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412685 (= lt!622501 (toIndex!0 (select (arr!46608 a!2901) j!112) mask!2840))))

(assert (= (and start!121604 res!949672) b!1412683))

(assert (= (and b!1412683 res!949670) b!1412682))

(assert (= (and b!1412682 res!949669) b!1412679))

(assert (= (and b!1412679 res!949666) b!1412678))

(assert (= (and b!1412678 res!949675) b!1412684))

(assert (= (and b!1412684 res!949673) b!1412685))

(assert (= (and b!1412685 res!949674) b!1412680))

(assert (= (and b!1412685 (not res!949671)) b!1412676))

(assert (= (and b!1412676 (not res!949667)) b!1412681))

(assert (= (and b!1412681 res!949668) b!1412677))

(declare-fun m!1302795 () Bool)

(assert (=> b!1412682 m!1302795))

(assert (=> b!1412682 m!1302795))

(declare-fun m!1302797 () Bool)

(assert (=> b!1412682 m!1302797))

(declare-fun m!1302799 () Bool)

(assert (=> b!1412681 m!1302799))

(declare-fun m!1302801 () Bool)

(assert (=> b!1412681 m!1302801))

(declare-fun m!1302803 () Bool)

(assert (=> b!1412681 m!1302803))

(declare-fun m!1302805 () Bool)

(assert (=> b!1412684 m!1302805))

(declare-fun m!1302807 () Bool)

(assert (=> b!1412679 m!1302807))

(assert (=> b!1412679 m!1302807))

(declare-fun m!1302809 () Bool)

(assert (=> b!1412679 m!1302809))

(declare-fun m!1302811 () Bool)

(assert (=> b!1412676 m!1302811))

(assert (=> b!1412676 m!1302811))

(declare-fun m!1302813 () Bool)

(assert (=> b!1412676 m!1302813))

(assert (=> b!1412676 m!1302799))

(declare-fun m!1302815 () Bool)

(assert (=> b!1412676 m!1302815))

(assert (=> b!1412680 m!1302807))

(assert (=> b!1412680 m!1302807))

(declare-fun m!1302817 () Bool)

(assert (=> b!1412680 m!1302817))

(declare-fun m!1302819 () Bool)

(assert (=> start!121604 m!1302819))

(declare-fun m!1302821 () Bool)

(assert (=> start!121604 m!1302821))

(assert (=> b!1412685 m!1302807))

(declare-fun m!1302823 () Bool)

(assert (=> b!1412685 m!1302823))

(assert (=> b!1412685 m!1302807))

(assert (=> b!1412685 m!1302807))

(declare-fun m!1302825 () Bool)

(assert (=> b!1412685 m!1302825))

(declare-fun m!1302827 () Bool)

(assert (=> b!1412685 m!1302827))

(declare-fun m!1302829 () Bool)

(assert (=> b!1412685 m!1302829))

(declare-fun m!1302831 () Bool)

(assert (=> b!1412678 m!1302831))

(declare-fun m!1302833 () Bool)

(assert (=> b!1412677 m!1302833))

(assert (=> b!1412677 m!1302807))

(assert (=> b!1412677 m!1302807))

(declare-fun m!1302835 () Bool)

(assert (=> b!1412677 m!1302835))

(check-sat (not b!1412681) (not b!1412676) (not start!121604) (not b!1412678) (not b!1412677) (not b!1412685) (not b!1412680) (not b!1412684) (not b!1412679) (not b!1412682))
(check-sat)
