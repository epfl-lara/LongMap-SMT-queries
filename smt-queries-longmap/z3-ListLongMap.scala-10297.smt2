; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121100 () Bool)

(assert start!121100)

(declare-fun b!1407980 () Bool)

(declare-fun res!945759 () Bool)

(declare-fun e!796883 () Bool)

(assert (=> b!1407980 (=> (not res!945759) (not e!796883))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96207 0))(
  ( (array!96208 (arr!46447 (Array (_ BitVec 32) (_ BitVec 64))) (size!46999 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96207)

(assert (=> b!1407980 (= res!945759 (and (= (size!46999 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46999 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46999 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407981 () Bool)

(declare-fun res!945753 () Bool)

(assert (=> b!1407981 (=> (not res!945753) (not e!796883))))

(declare-datatypes ((List!33044 0))(
  ( (Nil!33041) (Cons!33040 (h!34303 (_ BitVec 64)) (t!47730 List!33044)) )
))
(declare-fun arrayNoDuplicates!0 (array!96207 (_ BitVec 32) List!33044) Bool)

(assert (=> b!1407981 (= res!945753 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33041))))

(declare-fun b!1407982 () Bool)

(declare-fun res!945757 () Bool)

(declare-fun e!796886 () Bool)

(assert (=> b!1407982 (=> res!945757 e!796886)))

(declare-datatypes ((SeekEntryResult!10784 0))(
  ( (MissingZero!10784 (index!45513 (_ BitVec 32))) (Found!10784 (index!45514 (_ BitVec 32))) (Intermediate!10784 (undefined!11596 Bool) (index!45515 (_ BitVec 32)) (x!127118 (_ BitVec 32))) (Undefined!10784) (MissingVacant!10784 (index!45516 (_ BitVec 32))) )
))
(declare-fun lt!619892 () SeekEntryResult!10784)

(declare-fun lt!619894 () (_ BitVec 32))

(assert (=> b!1407982 (= res!945757 (or (bvslt (x!127118 lt!619892) #b00000000000000000000000000000000) (bvsgt (x!127118 lt!619892) #b01111111111111111111111111111110) (bvslt lt!619894 #b00000000000000000000000000000000) (bvsge lt!619894 (size!46999 a!2901)) (bvslt (index!45515 lt!619892) #b00000000000000000000000000000000) (bvsge (index!45515 lt!619892) (size!46999 a!2901)) (not (= lt!619892 (Intermediate!10784 false (index!45515 lt!619892) (x!127118 lt!619892))))))))

(declare-fun b!1407983 () Bool)

(assert (=> b!1407983 (= e!796886 true)))

(declare-fun lt!619898 () SeekEntryResult!10784)

(declare-fun lt!619896 () array!96207)

(declare-fun lt!619897 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96207 (_ BitVec 32)) SeekEntryResult!10784)

(assert (=> b!1407983 (= lt!619898 (seekEntryOrOpen!0 lt!619897 lt!619896 mask!2840))))

(declare-datatypes ((Unit!47385 0))(
  ( (Unit!47386) )
))
(declare-fun lt!619893 () Unit!47385)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47385)

(assert (=> b!1407983 (= lt!619893 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!619894 (x!127118 lt!619892) (index!45515 lt!619892) mask!2840))))

(declare-fun b!1407984 () Bool)

(declare-fun res!945758 () Bool)

(assert (=> b!1407984 (=> (not res!945758) (not e!796883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96207 (_ BitVec 32)) Bool)

(assert (=> b!1407984 (= res!945758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407985 () Bool)

(declare-fun e!796884 () Bool)

(assert (=> b!1407985 (= e!796883 (not e!796884))))

(declare-fun res!945754 () Bool)

(assert (=> b!1407985 (=> res!945754 e!796884)))

(get-info :version)

(assert (=> b!1407985 (= res!945754 (or (not ((_ is Intermediate!10784) lt!619892)) (undefined!11596 lt!619892)))))

(assert (=> b!1407985 (= lt!619898 (Found!10784 j!112))))

(assert (=> b!1407985 (= lt!619898 (seekEntryOrOpen!0 (select (arr!46447 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1407985 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619895 () Unit!47385)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47385)

(assert (=> b!1407985 (= lt!619895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96207 (_ BitVec 32)) SeekEntryResult!10784)

(assert (=> b!1407985 (= lt!619892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619894 (select (arr!46447 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407985 (= lt!619894 (toIndex!0 (select (arr!46447 a!2901) j!112) mask!2840))))

(declare-fun res!945756 () Bool)

(assert (=> start!121100 (=> (not res!945756) (not e!796883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121100 (= res!945756 (validMask!0 mask!2840))))

(assert (=> start!121100 e!796883))

(assert (=> start!121100 true))

(declare-fun array_inv!35680 (array!96207) Bool)

(assert (=> start!121100 (array_inv!35680 a!2901)))

(declare-fun b!1407979 () Bool)

(declare-fun res!945755 () Bool)

(assert (=> b!1407979 (=> (not res!945755) (not e!796883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407979 (= res!945755 (validKeyInArray!0 (select (arr!46447 a!2901) i!1037)))))

(declare-fun b!1407986 () Bool)

(assert (=> b!1407986 (= e!796884 e!796886)))

(declare-fun res!945752 () Bool)

(assert (=> b!1407986 (=> res!945752 e!796886)))

(assert (=> b!1407986 (= res!945752 (not (= lt!619892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!619897 mask!2840) lt!619897 lt!619896 mask!2840))))))

(assert (=> b!1407986 (= lt!619897 (select (store (arr!46447 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1407986 (= lt!619896 (array!96208 (store (arr!46447 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46999 a!2901)))))

(declare-fun b!1407987 () Bool)

(declare-fun res!945760 () Bool)

(assert (=> b!1407987 (=> (not res!945760) (not e!796883))))

(assert (=> b!1407987 (= res!945760 (validKeyInArray!0 (select (arr!46447 a!2901) j!112)))))

(assert (= (and start!121100 res!945756) b!1407980))

(assert (= (and b!1407980 res!945759) b!1407979))

(assert (= (and b!1407979 res!945755) b!1407987))

(assert (= (and b!1407987 res!945760) b!1407984))

(assert (= (and b!1407984 res!945758) b!1407981))

(assert (= (and b!1407981 res!945753) b!1407985))

(assert (= (and b!1407985 (not res!945754)) b!1407986))

(assert (= (and b!1407986 (not res!945752)) b!1407982))

(assert (= (and b!1407982 (not res!945757)) b!1407983))

(declare-fun m!1296667 () Bool)

(assert (=> b!1407983 m!1296667))

(declare-fun m!1296669 () Bool)

(assert (=> b!1407983 m!1296669))

(declare-fun m!1296671 () Bool)

(assert (=> b!1407985 m!1296671))

(declare-fun m!1296673 () Bool)

(assert (=> b!1407985 m!1296673))

(assert (=> b!1407985 m!1296671))

(declare-fun m!1296675 () Bool)

(assert (=> b!1407985 m!1296675))

(assert (=> b!1407985 m!1296671))

(declare-fun m!1296677 () Bool)

(assert (=> b!1407985 m!1296677))

(declare-fun m!1296679 () Bool)

(assert (=> b!1407985 m!1296679))

(assert (=> b!1407985 m!1296671))

(declare-fun m!1296681 () Bool)

(assert (=> b!1407985 m!1296681))

(declare-fun m!1296683 () Bool)

(assert (=> b!1407981 m!1296683))

(assert (=> b!1407987 m!1296671))

(assert (=> b!1407987 m!1296671))

(declare-fun m!1296685 () Bool)

(assert (=> b!1407987 m!1296685))

(declare-fun m!1296687 () Bool)

(assert (=> b!1407984 m!1296687))

(declare-fun m!1296689 () Bool)

(assert (=> b!1407979 m!1296689))

(assert (=> b!1407979 m!1296689))

(declare-fun m!1296691 () Bool)

(assert (=> b!1407979 m!1296691))

(declare-fun m!1296693 () Bool)

(assert (=> b!1407986 m!1296693))

(assert (=> b!1407986 m!1296693))

(declare-fun m!1296695 () Bool)

(assert (=> b!1407986 m!1296695))

(declare-fun m!1296697 () Bool)

(assert (=> b!1407986 m!1296697))

(declare-fun m!1296699 () Bool)

(assert (=> b!1407986 m!1296699))

(declare-fun m!1296701 () Bool)

(assert (=> start!121100 m!1296701))

(declare-fun m!1296703 () Bool)

(assert (=> start!121100 m!1296703))

(check-sat (not b!1407986) (not start!121100) (not b!1407979) (not b!1407981) (not b!1407984) (not b!1407983) (not b!1407987) (not b!1407985))
(check-sat)
