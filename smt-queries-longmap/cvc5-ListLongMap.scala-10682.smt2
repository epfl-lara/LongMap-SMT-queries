; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125230 () Bool)

(assert start!125230)

(declare-fun b!1461063 () Bool)

(declare-fun res!990755 () Bool)

(declare-fun e!821443 () Bool)

(assert (=> b!1461063 (=> (not res!990755) (not e!821443))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98678 0))(
  ( (array!98679 (arr!47627 (Array (_ BitVec 32) (_ BitVec 64))) (size!48177 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98678)

(assert (=> b!1461063 (= res!990755 (and (= (size!48177 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48177 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48177 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461064 () Bool)

(declare-fun e!821441 () Bool)

(assert (=> b!1461064 (= e!821443 e!821441)))

(declare-fun res!990751 () Bool)

(assert (=> b!1461064 (=> (not res!990751) (not e!821441))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461064 (= res!990751 (= (select (store (arr!47627 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640011 () array!98678)

(assert (=> b!1461064 (= lt!640011 (array!98679 (store (arr!47627 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48177 a!2862)))))

(declare-fun b!1461065 () Bool)

(declare-fun e!821444 () Bool)

(assert (=> b!1461065 (= e!821444 true)))

(declare-fun lt!640017 () Bool)

(declare-fun e!821442 () Bool)

(assert (=> b!1461065 (= lt!640017 e!821442)))

(declare-fun c!134669 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461065 (= c!134669 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461067 () Bool)

(declare-fun res!990748 () Bool)

(assert (=> b!1461067 (=> (not res!990748) (not e!821443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98678 (_ BitVec 32)) Bool)

(assert (=> b!1461067 (= res!990748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!821447 () Bool)

(declare-datatypes ((SeekEntryResult!11879 0))(
  ( (MissingZero!11879 (index!49908 (_ BitVec 32))) (Found!11879 (index!49909 (_ BitVec 32))) (Intermediate!11879 (undefined!12691 Bool) (index!49910 (_ BitVec 32)) (x!131512 (_ BitVec 32))) (Undefined!11879) (MissingVacant!11879 (index!49911 (_ BitVec 32))) )
))
(declare-fun lt!640012 () SeekEntryResult!11879)

(declare-fun lt!640016 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1461068 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98678 (_ BitVec 32)) SeekEntryResult!11879)

(assert (=> b!1461068 (= e!821447 (= lt!640012 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640016 lt!640011 mask!2687)))))

(declare-fun b!1461069 () Bool)

(declare-fun e!821449 () Bool)

(assert (=> b!1461069 (= e!821449 e!821444)))

(declare-fun res!990752 () Bool)

(assert (=> b!1461069 (=> res!990752 e!821444)))

(declare-fun lt!640013 () (_ BitVec 32))

(assert (=> b!1461069 (= res!990752 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640013 #b00000000000000000000000000000000) (bvsge lt!640013 (size!48177 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461069 (= lt!640013 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461070 () Bool)

(declare-fun res!990750 () Bool)

(assert (=> b!1461070 (=> (not res!990750) (not e!821443))))

(declare-datatypes ((List!34128 0))(
  ( (Nil!34125) (Cons!34124 (h!35474 (_ BitVec 64)) (t!48822 List!34128)) )
))
(declare-fun arrayNoDuplicates!0 (array!98678 (_ BitVec 32) List!34128) Bool)

(assert (=> b!1461070 (= res!990750 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34125))))

(declare-fun b!1461071 () Bool)

(declare-fun res!990754 () Bool)

(declare-fun e!821445 () Bool)

(assert (=> b!1461071 (=> (not res!990754) (not e!821445))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98678 (_ BitVec 32)) SeekEntryResult!11879)

(assert (=> b!1461071 (= res!990754 (= (seekEntryOrOpen!0 (select (arr!47627 a!2862) j!93) a!2862 mask!2687) (Found!11879 j!93)))))

(declare-fun b!1461072 () Bool)

(declare-fun res!990746 () Bool)

(declare-fun e!821450 () Bool)

(assert (=> b!1461072 (=> (not res!990746) (not e!821450))))

(declare-fun lt!640014 () SeekEntryResult!11879)

(assert (=> b!1461072 (= res!990746 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47627 a!2862) j!93) a!2862 mask!2687) lt!640014))))

(declare-fun b!1461073 () Bool)

(declare-fun res!990756 () Bool)

(assert (=> b!1461073 (=> (not res!990756) (not e!821443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461073 (= res!990756 (validKeyInArray!0 (select (arr!47627 a!2862) i!1006)))))

(declare-fun b!1461074 () Bool)

(assert (=> b!1461074 (= e!821442 (not (= lt!640012 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640013 lt!640016 lt!640011 mask!2687))))))

(declare-fun b!1461075 () Bool)

(declare-fun res!990762 () Bool)

(declare-fun e!821446 () Bool)

(assert (=> b!1461075 (=> (not res!990762) (not e!821446))))

(assert (=> b!1461075 (= res!990762 e!821447)))

(declare-fun c!134670 () Bool)

(assert (=> b!1461075 (= c!134670 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461076 () Bool)

(assert (=> b!1461076 (= e!821450 e!821446)))

(declare-fun res!990758 () Bool)

(assert (=> b!1461076 (=> (not res!990758) (not e!821446))))

(assert (=> b!1461076 (= res!990758 (= lt!640012 (Intermediate!11879 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461076 (= lt!640012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640016 mask!2687) lt!640016 lt!640011 mask!2687))))

(assert (=> b!1461076 (= lt!640016 (select (store (arr!47627 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461077 () Bool)

(assert (=> b!1461077 (= e!821446 (not e!821449))))

(declare-fun res!990763 () Bool)

(assert (=> b!1461077 (=> res!990763 e!821449)))

(assert (=> b!1461077 (= res!990763 (or (and (= (select (arr!47627 a!2862) index!646) (select (store (arr!47627 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47627 a!2862) index!646) (select (arr!47627 a!2862) j!93))) (= (select (arr!47627 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461077 e!821445))

(declare-fun res!990759 () Bool)

(assert (=> b!1461077 (=> (not res!990759) (not e!821445))))

(assert (=> b!1461077 (= res!990759 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49254 0))(
  ( (Unit!49255) )
))
(declare-fun lt!640015 () Unit!49254)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49254)

(assert (=> b!1461077 (= lt!640015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461078 () Bool)

(declare-fun res!990761 () Bool)

(assert (=> b!1461078 (=> (not res!990761) (not e!821446))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461078 (= res!990761 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461079 () Bool)

(assert (=> b!1461079 (= e!821441 e!821450)))

(declare-fun res!990757 () Bool)

(assert (=> b!1461079 (=> (not res!990757) (not e!821450))))

(assert (=> b!1461079 (= res!990757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47627 a!2862) j!93) mask!2687) (select (arr!47627 a!2862) j!93) a!2862 mask!2687) lt!640014))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1461079 (= lt!640014 (Intermediate!11879 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461080 () Bool)

(declare-fun res!990753 () Bool)

(assert (=> b!1461080 (=> res!990753 e!821444)))

(assert (=> b!1461080 (= res!990753 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640013 (select (arr!47627 a!2862) j!93) a!2862 mask!2687) lt!640014)))))

(declare-fun b!1461081 () Bool)

(declare-fun res!990749 () Bool)

(assert (=> b!1461081 (=> (not res!990749) (not e!821443))))

(assert (=> b!1461081 (= res!990749 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48177 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48177 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48177 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461082 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98678 (_ BitVec 32)) SeekEntryResult!11879)

(assert (=> b!1461082 (= e!821442 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640013 intermediateAfterIndex!19 lt!640016 lt!640011 mask!2687) (seekEntryOrOpen!0 lt!640016 lt!640011 mask!2687))))))

(declare-fun b!1461066 () Bool)

(assert (=> b!1461066 (= e!821445 (or (= (select (arr!47627 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47627 a!2862) intermediateBeforeIndex!19) (select (arr!47627 a!2862) j!93))))))

(declare-fun res!990760 () Bool)

(assert (=> start!125230 (=> (not res!990760) (not e!821443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125230 (= res!990760 (validMask!0 mask!2687))))

(assert (=> start!125230 e!821443))

(assert (=> start!125230 true))

(declare-fun array_inv!36655 (array!98678) Bool)

(assert (=> start!125230 (array_inv!36655 a!2862)))

(declare-fun b!1461083 () Bool)

(declare-fun res!990747 () Bool)

(assert (=> b!1461083 (=> (not res!990747) (not e!821443))))

(assert (=> b!1461083 (= res!990747 (validKeyInArray!0 (select (arr!47627 a!2862) j!93)))))

(declare-fun b!1461084 () Bool)

(assert (=> b!1461084 (= e!821447 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640016 lt!640011 mask!2687) (seekEntryOrOpen!0 lt!640016 lt!640011 mask!2687)))))

(assert (= (and start!125230 res!990760) b!1461063))

(assert (= (and b!1461063 res!990755) b!1461073))

(assert (= (and b!1461073 res!990756) b!1461083))

(assert (= (and b!1461083 res!990747) b!1461067))

(assert (= (and b!1461067 res!990748) b!1461070))

(assert (= (and b!1461070 res!990750) b!1461081))

(assert (= (and b!1461081 res!990749) b!1461064))

(assert (= (and b!1461064 res!990751) b!1461079))

(assert (= (and b!1461079 res!990757) b!1461072))

(assert (= (and b!1461072 res!990746) b!1461076))

(assert (= (and b!1461076 res!990758) b!1461075))

(assert (= (and b!1461075 c!134670) b!1461068))

(assert (= (and b!1461075 (not c!134670)) b!1461084))

(assert (= (and b!1461075 res!990762) b!1461078))

(assert (= (and b!1461078 res!990761) b!1461077))

(assert (= (and b!1461077 res!990759) b!1461071))

(assert (= (and b!1461071 res!990754) b!1461066))

(assert (= (and b!1461077 (not res!990763)) b!1461069))

(assert (= (and b!1461069 (not res!990752)) b!1461080))

(assert (= (and b!1461080 (not res!990753)) b!1461065))

(assert (= (and b!1461065 c!134669) b!1461074))

(assert (= (and b!1461065 (not c!134669)) b!1461082))

(declare-fun m!1348687 () Bool)

(assert (=> b!1461064 m!1348687))

(declare-fun m!1348689 () Bool)

(assert (=> b!1461064 m!1348689))

(declare-fun m!1348691 () Bool)

(assert (=> b!1461072 m!1348691))

(assert (=> b!1461072 m!1348691))

(declare-fun m!1348693 () Bool)

(assert (=> b!1461072 m!1348693))

(declare-fun m!1348695 () Bool)

(assert (=> b!1461084 m!1348695))

(declare-fun m!1348697 () Bool)

(assert (=> b!1461084 m!1348697))

(declare-fun m!1348699 () Bool)

(assert (=> b!1461082 m!1348699))

(assert (=> b!1461082 m!1348697))

(declare-fun m!1348701 () Bool)

(assert (=> b!1461068 m!1348701))

(assert (=> b!1461079 m!1348691))

(assert (=> b!1461079 m!1348691))

(declare-fun m!1348703 () Bool)

(assert (=> b!1461079 m!1348703))

(assert (=> b!1461079 m!1348703))

(assert (=> b!1461079 m!1348691))

(declare-fun m!1348705 () Bool)

(assert (=> b!1461079 m!1348705))

(declare-fun m!1348707 () Bool)

(assert (=> b!1461070 m!1348707))

(declare-fun m!1348709 () Bool)

(assert (=> b!1461076 m!1348709))

(assert (=> b!1461076 m!1348709))

(declare-fun m!1348711 () Bool)

(assert (=> b!1461076 m!1348711))

(assert (=> b!1461076 m!1348687))

(declare-fun m!1348713 () Bool)

(assert (=> b!1461076 m!1348713))

(declare-fun m!1348715 () Bool)

(assert (=> b!1461067 m!1348715))

(declare-fun m!1348717 () Bool)

(assert (=> start!125230 m!1348717))

(declare-fun m!1348719 () Bool)

(assert (=> start!125230 m!1348719))

(assert (=> b!1461083 m!1348691))

(assert (=> b!1461083 m!1348691))

(declare-fun m!1348721 () Bool)

(assert (=> b!1461083 m!1348721))

(assert (=> b!1461071 m!1348691))

(assert (=> b!1461071 m!1348691))

(declare-fun m!1348723 () Bool)

(assert (=> b!1461071 m!1348723))

(declare-fun m!1348725 () Bool)

(assert (=> b!1461066 m!1348725))

(assert (=> b!1461066 m!1348691))

(declare-fun m!1348727 () Bool)

(assert (=> b!1461069 m!1348727))

(declare-fun m!1348729 () Bool)

(assert (=> b!1461074 m!1348729))

(declare-fun m!1348731 () Bool)

(assert (=> b!1461077 m!1348731))

(assert (=> b!1461077 m!1348687))

(declare-fun m!1348733 () Bool)

(assert (=> b!1461077 m!1348733))

(declare-fun m!1348735 () Bool)

(assert (=> b!1461077 m!1348735))

(declare-fun m!1348737 () Bool)

(assert (=> b!1461077 m!1348737))

(assert (=> b!1461077 m!1348691))

(declare-fun m!1348739 () Bool)

(assert (=> b!1461073 m!1348739))

(assert (=> b!1461073 m!1348739))

(declare-fun m!1348741 () Bool)

(assert (=> b!1461073 m!1348741))

(assert (=> b!1461080 m!1348691))

(assert (=> b!1461080 m!1348691))

(declare-fun m!1348743 () Bool)

(assert (=> b!1461080 m!1348743))

(push 1)

