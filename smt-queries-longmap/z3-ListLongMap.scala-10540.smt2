; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124338 () Bool)

(assert start!124338)

(declare-fun res!971221 () Bool)

(declare-fun e!811543 () Bool)

(assert (=> start!124338 (=> (not res!971221) (not e!811543))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124338 (= res!971221 (validMask!0 mask!2687))))

(assert (=> start!124338 e!811543))

(assert (=> start!124338 true))

(declare-datatypes ((array!97825 0))(
  ( (array!97826 (arr!47202 (Array (_ BitVec 32) (_ BitVec 64))) (size!47752 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97825)

(declare-fun array_inv!36230 (array!97825) Bool)

(assert (=> start!124338 (array_inv!36230 a!2862)))

(declare-fun b!1438663 () Bool)

(declare-fun res!971213 () Bool)

(assert (=> b!1438663 (=> (not res!971213) (not e!811543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97825 (_ BitVec 32)) Bool)

(assert (=> b!1438663 (= res!971213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438664 () Bool)

(declare-fun res!971218 () Bool)

(assert (=> b!1438664 (=> (not res!971218) (not e!811543))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438664 (= res!971218 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47752 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47752 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47752 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47202 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438665 () Bool)

(declare-fun res!971216 () Bool)

(assert (=> b!1438665 (=> (not res!971216) (not e!811543))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438665 (= res!971216 (validKeyInArray!0 (select (arr!47202 a!2862) j!93)))))

(declare-fun b!1438666 () Bool)

(declare-fun e!811542 () Bool)

(assert (=> b!1438666 (= e!811543 e!811542)))

(declare-fun res!971215 () Bool)

(assert (=> b!1438666 (=> (not res!971215) (not e!811542))))

(declare-datatypes ((SeekEntryResult!11454 0))(
  ( (MissingZero!11454 (index!48208 (_ BitVec 32))) (Found!11454 (index!48209 (_ BitVec 32))) (Intermediate!11454 (undefined!12266 Bool) (index!48210 (_ BitVec 32)) (x!129945 (_ BitVec 32))) (Undefined!11454) (MissingVacant!11454 (index!48211 (_ BitVec 32))) )
))
(declare-fun lt!632628 () SeekEntryResult!11454)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97825 (_ BitVec 32)) SeekEntryResult!11454)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438666 (= res!971215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47202 a!2862) j!93) mask!2687) (select (arr!47202 a!2862) j!93) a!2862 mask!2687) lt!632628))))

(assert (=> b!1438666 (= lt!632628 (Intermediate!11454 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438667 () Bool)

(declare-fun res!971220 () Bool)

(assert (=> b!1438667 (=> (not res!971220) (not e!811543))))

(assert (=> b!1438667 (= res!971220 (and (= (size!47752 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47752 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47752 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438668 () Bool)

(declare-fun res!971217 () Bool)

(assert (=> b!1438668 (=> (not res!971217) (not e!811542))))

(assert (=> b!1438668 (= res!971217 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47202 a!2862) j!93) a!2862 mask!2687) lt!632628))))

(declare-fun b!1438669 () Bool)

(assert (=> b!1438669 (= e!811542 false)))

(declare-fun lt!632627 () SeekEntryResult!11454)

(assert (=> b!1438669 (= lt!632627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47202 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47202 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97826 (store (arr!47202 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47752 a!2862)) mask!2687))))

(declare-fun b!1438670 () Bool)

(declare-fun res!971219 () Bool)

(assert (=> b!1438670 (=> (not res!971219) (not e!811543))))

(assert (=> b!1438670 (= res!971219 (validKeyInArray!0 (select (arr!47202 a!2862) i!1006)))))

(declare-fun b!1438671 () Bool)

(declare-fun res!971214 () Bool)

(assert (=> b!1438671 (=> (not res!971214) (not e!811543))))

(declare-datatypes ((List!33703 0))(
  ( (Nil!33700) (Cons!33699 (h!35046 (_ BitVec 64)) (t!48397 List!33703)) )
))
(declare-fun arrayNoDuplicates!0 (array!97825 (_ BitVec 32) List!33703) Bool)

(assert (=> b!1438671 (= res!971214 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33700))))

(assert (= (and start!124338 res!971221) b!1438667))

(assert (= (and b!1438667 res!971220) b!1438670))

(assert (= (and b!1438670 res!971219) b!1438665))

(assert (= (and b!1438665 res!971216) b!1438663))

(assert (= (and b!1438663 res!971213) b!1438671))

(assert (= (and b!1438671 res!971214) b!1438664))

(assert (= (and b!1438664 res!971218) b!1438666))

(assert (= (and b!1438666 res!971215) b!1438668))

(assert (= (and b!1438668 res!971217) b!1438669))

(declare-fun m!1327767 () Bool)

(assert (=> b!1438666 m!1327767))

(assert (=> b!1438666 m!1327767))

(declare-fun m!1327769 () Bool)

(assert (=> b!1438666 m!1327769))

(assert (=> b!1438666 m!1327769))

(assert (=> b!1438666 m!1327767))

(declare-fun m!1327771 () Bool)

(assert (=> b!1438666 m!1327771))

(declare-fun m!1327773 () Bool)

(assert (=> b!1438670 m!1327773))

(assert (=> b!1438670 m!1327773))

(declare-fun m!1327775 () Bool)

(assert (=> b!1438670 m!1327775))

(declare-fun m!1327777 () Bool)

(assert (=> start!124338 m!1327777))

(declare-fun m!1327779 () Bool)

(assert (=> start!124338 m!1327779))

(declare-fun m!1327781 () Bool)

(assert (=> b!1438664 m!1327781))

(declare-fun m!1327783 () Bool)

(assert (=> b!1438664 m!1327783))

(assert (=> b!1438669 m!1327781))

(declare-fun m!1327785 () Bool)

(assert (=> b!1438669 m!1327785))

(assert (=> b!1438669 m!1327785))

(declare-fun m!1327787 () Bool)

(assert (=> b!1438669 m!1327787))

(assert (=> b!1438669 m!1327787))

(assert (=> b!1438669 m!1327785))

(declare-fun m!1327789 () Bool)

(assert (=> b!1438669 m!1327789))

(declare-fun m!1327791 () Bool)

(assert (=> b!1438663 m!1327791))

(declare-fun m!1327793 () Bool)

(assert (=> b!1438671 m!1327793))

(assert (=> b!1438668 m!1327767))

(assert (=> b!1438668 m!1327767))

(declare-fun m!1327795 () Bool)

(assert (=> b!1438668 m!1327795))

(assert (=> b!1438665 m!1327767))

(assert (=> b!1438665 m!1327767))

(declare-fun m!1327797 () Bool)

(assert (=> b!1438665 m!1327797))

(check-sat (not b!1438670) (not start!124338) (not b!1438666) (not b!1438671) (not b!1438668) (not b!1438669) (not b!1438663) (not b!1438665))
(check-sat)
