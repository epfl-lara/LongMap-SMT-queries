; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125430 () Bool)

(assert start!125430)

(declare-fun e!822058 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1461876 () Bool)

(declare-datatypes ((array!98773 0))(
  ( (array!98774 (arr!47671 (Array (_ BitVec 32) (_ BitVec 64))) (size!48222 (_ BitVec 32))) )
))
(declare-fun lt!640333 () array!98773)

(declare-fun lt!640332 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11820 0))(
  ( (MissingZero!11820 (index!49672 (_ BitVec 32))) (Found!11820 (index!49673 (_ BitVec 32))) (Intermediate!11820 (undefined!12632 Bool) (index!49674 (_ BitVec 32)) (x!131453 (_ BitVec 32))) (Undefined!11820) (MissingVacant!11820 (index!49675 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98773 (_ BitVec 32)) SeekEntryResult!11820)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98773 (_ BitVec 32)) SeekEntryResult!11820)

(assert (=> b!1461876 (= e!822058 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640332 lt!640333 mask!2687) (seekEntryOrOpen!0 lt!640332 lt!640333 mask!2687)))))

(declare-fun e!822060 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1461877 () Bool)

(declare-fun a!2862 () array!98773)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1461877 (= e!822060 (or (= (select (arr!47671 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47671 a!2862) intermediateBeforeIndex!19) (select (arr!47671 a!2862) j!93))))))

(declare-fun b!1461878 () Bool)

(declare-fun res!990810 () Bool)

(declare-fun e!822063 () Bool)

(assert (=> b!1461878 (=> (not res!990810) (not e!822063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461878 (= res!990810 (validKeyInArray!0 (select (arr!47671 a!2862) j!93)))))

(declare-fun b!1461879 () Bool)

(declare-fun e!822057 () Bool)

(declare-fun e!822059 () Bool)

(assert (=> b!1461879 (= e!822057 e!822059)))

(declare-fun res!990822 () Bool)

(assert (=> b!1461879 (=> (not res!990822) (not e!822059))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!640335 () SeekEntryResult!11820)

(assert (=> b!1461879 (= res!990822 (= lt!640335 (Intermediate!11820 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98773 (_ BitVec 32)) SeekEntryResult!11820)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461879 (= lt!640335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640332 mask!2687) lt!640332 lt!640333 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461879 (= lt!640332 (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461881 () Bool)

(assert (=> b!1461881 (= e!822058 (= lt!640335 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640332 lt!640333 mask!2687)))))

(declare-fun b!1461882 () Bool)

(declare-fun res!990813 () Bool)

(assert (=> b!1461882 (=> (not res!990813) (not e!822063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98773 (_ BitVec 32)) Bool)

(assert (=> b!1461882 (= res!990813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461883 () Bool)

(declare-fun res!990811 () Bool)

(assert (=> b!1461883 (=> (not res!990811) (not e!822059))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461883 (= res!990811 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461880 () Bool)

(declare-fun res!990812 () Bool)

(assert (=> b!1461880 (=> (not res!990812) (not e!822059))))

(assert (=> b!1461880 (= res!990812 e!822058)))

(declare-fun c!135052 () Bool)

(assert (=> b!1461880 (= c!135052 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!990814 () Bool)

(assert (=> start!125430 (=> (not res!990814) (not e!822063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125430 (= res!990814 (validMask!0 mask!2687))))

(assert (=> start!125430 e!822063))

(assert (=> start!125430 true))

(declare-fun array_inv!36952 (array!98773) Bool)

(assert (=> start!125430 (array_inv!36952 a!2862)))

(declare-fun b!1461884 () Bool)

(declare-fun res!990820 () Bool)

(assert (=> b!1461884 (=> (not res!990820) (not e!822063))))

(declare-datatypes ((List!34159 0))(
  ( (Nil!34156) (Cons!34155 (h!35516 (_ BitVec 64)) (t!48845 List!34159)) )
))
(declare-fun arrayNoDuplicates!0 (array!98773 (_ BitVec 32) List!34159) Bool)

(assert (=> b!1461884 (= res!990820 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34156))))

(declare-fun b!1461885 () Bool)

(declare-fun e!822061 () Bool)

(assert (=> b!1461885 (= e!822063 e!822061)))

(declare-fun res!990819 () Bool)

(assert (=> b!1461885 (=> (not res!990819) (not e!822061))))

(assert (=> b!1461885 (= res!990819 (= (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461885 (= lt!640333 (array!98774 (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48222 a!2862)))))

(declare-fun b!1461886 () Bool)

(assert (=> b!1461886 (= e!822059 (not (or (and (= (select (arr!47671 a!2862) index!646) (select (store (arr!47671 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47671 a!2862) index!646) (select (arr!47671 a!2862) j!93))) (= (select (arr!47671 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1461886 e!822060))

(declare-fun res!990816 () Bool)

(assert (=> b!1461886 (=> (not res!990816) (not e!822060))))

(assert (=> b!1461886 (= res!990816 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49169 0))(
  ( (Unit!49170) )
))
(declare-fun lt!640334 () Unit!49169)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49169)

(assert (=> b!1461886 (= lt!640334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461887 () Bool)

(declare-fun res!990821 () Bool)

(assert (=> b!1461887 (=> (not res!990821) (not e!822057))))

(declare-fun lt!640336 () SeekEntryResult!11820)

(assert (=> b!1461887 (= res!990821 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47671 a!2862) j!93) a!2862 mask!2687) lt!640336))))

(declare-fun b!1461888 () Bool)

(assert (=> b!1461888 (= e!822061 e!822057)))

(declare-fun res!990815 () Bool)

(assert (=> b!1461888 (=> (not res!990815) (not e!822057))))

(assert (=> b!1461888 (= res!990815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47671 a!2862) j!93) mask!2687) (select (arr!47671 a!2862) j!93) a!2862 mask!2687) lt!640336))))

(assert (=> b!1461888 (= lt!640336 (Intermediate!11820 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461889 () Bool)

(declare-fun res!990818 () Bool)

(assert (=> b!1461889 (=> (not res!990818) (not e!822063))))

(assert (=> b!1461889 (= res!990818 (validKeyInArray!0 (select (arr!47671 a!2862) i!1006)))))

(declare-fun b!1461890 () Bool)

(declare-fun res!990817 () Bool)

(assert (=> b!1461890 (=> (not res!990817) (not e!822063))))

(assert (=> b!1461890 (= res!990817 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48222 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48222 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48222 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461891 () Bool)

(declare-fun res!990824 () Bool)

(assert (=> b!1461891 (=> (not res!990824) (not e!822063))))

(assert (=> b!1461891 (= res!990824 (and (= (size!48222 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48222 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48222 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461892 () Bool)

(declare-fun res!990823 () Bool)

(assert (=> b!1461892 (=> (not res!990823) (not e!822060))))

(assert (=> b!1461892 (= res!990823 (= (seekEntryOrOpen!0 (select (arr!47671 a!2862) j!93) a!2862 mask!2687) (Found!11820 j!93)))))

(assert (= (and start!125430 res!990814) b!1461891))

(assert (= (and b!1461891 res!990824) b!1461889))

(assert (= (and b!1461889 res!990818) b!1461878))

(assert (= (and b!1461878 res!990810) b!1461882))

(assert (= (and b!1461882 res!990813) b!1461884))

(assert (= (and b!1461884 res!990820) b!1461890))

(assert (= (and b!1461890 res!990817) b!1461885))

(assert (= (and b!1461885 res!990819) b!1461888))

(assert (= (and b!1461888 res!990815) b!1461887))

(assert (= (and b!1461887 res!990821) b!1461879))

(assert (= (and b!1461879 res!990822) b!1461880))

(assert (= (and b!1461880 c!135052) b!1461881))

(assert (= (and b!1461880 (not c!135052)) b!1461876))

(assert (= (and b!1461880 res!990812) b!1461883))

(assert (= (and b!1461883 res!990811) b!1461886))

(assert (= (and b!1461886 res!990816) b!1461892))

(assert (= (and b!1461892 res!990823) b!1461877))

(declare-fun m!1349665 () Bool)

(assert (=> b!1461885 m!1349665))

(declare-fun m!1349667 () Bool)

(assert (=> b!1461885 m!1349667))

(declare-fun m!1349669 () Bool)

(assert (=> b!1461887 m!1349669))

(assert (=> b!1461887 m!1349669))

(declare-fun m!1349671 () Bool)

(assert (=> b!1461887 m!1349671))

(assert (=> b!1461878 m!1349669))

(assert (=> b!1461878 m!1349669))

(declare-fun m!1349673 () Bool)

(assert (=> b!1461878 m!1349673))

(declare-fun m!1349675 () Bool)

(assert (=> b!1461889 m!1349675))

(assert (=> b!1461889 m!1349675))

(declare-fun m!1349677 () Bool)

(assert (=> b!1461889 m!1349677))

(declare-fun m!1349679 () Bool)

(assert (=> b!1461882 m!1349679))

(declare-fun m!1349681 () Bool)

(assert (=> b!1461886 m!1349681))

(assert (=> b!1461886 m!1349665))

(declare-fun m!1349683 () Bool)

(assert (=> b!1461886 m!1349683))

(declare-fun m!1349685 () Bool)

(assert (=> b!1461886 m!1349685))

(declare-fun m!1349687 () Bool)

(assert (=> b!1461886 m!1349687))

(assert (=> b!1461886 m!1349669))

(declare-fun m!1349689 () Bool)

(assert (=> b!1461876 m!1349689))

(declare-fun m!1349691 () Bool)

(assert (=> b!1461876 m!1349691))

(declare-fun m!1349693 () Bool)

(assert (=> start!125430 m!1349693))

(declare-fun m!1349695 () Bool)

(assert (=> start!125430 m!1349695))

(declare-fun m!1349697 () Bool)

(assert (=> b!1461877 m!1349697))

(assert (=> b!1461877 m!1349669))

(declare-fun m!1349699 () Bool)

(assert (=> b!1461879 m!1349699))

(assert (=> b!1461879 m!1349699))

(declare-fun m!1349701 () Bool)

(assert (=> b!1461879 m!1349701))

(assert (=> b!1461879 m!1349665))

(declare-fun m!1349703 () Bool)

(assert (=> b!1461879 m!1349703))

(assert (=> b!1461888 m!1349669))

(assert (=> b!1461888 m!1349669))

(declare-fun m!1349705 () Bool)

(assert (=> b!1461888 m!1349705))

(assert (=> b!1461888 m!1349705))

(assert (=> b!1461888 m!1349669))

(declare-fun m!1349707 () Bool)

(assert (=> b!1461888 m!1349707))

(assert (=> b!1461892 m!1349669))

(assert (=> b!1461892 m!1349669))

(declare-fun m!1349709 () Bool)

(assert (=> b!1461892 m!1349709))

(declare-fun m!1349711 () Bool)

(assert (=> b!1461881 m!1349711))

(declare-fun m!1349713 () Bool)

(assert (=> b!1461884 m!1349713))

(check-sat (not b!1461878) (not start!125430) (not b!1461881) (not b!1461882) (not b!1461879) (not b!1461884) (not b!1461889) (not b!1461887) (not b!1461892) (not b!1461888) (not b!1461886) (not b!1461876))
(check-sat)
