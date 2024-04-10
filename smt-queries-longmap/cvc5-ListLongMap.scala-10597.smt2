; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124720 () Bool)

(assert start!124720)

(declare-fun b!1445816 () Bool)

(declare-fun res!977658 () Bool)

(declare-fun e!814398 () Bool)

(assert (=> b!1445816 (=> (not res!977658) (not e!814398))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445816 (= res!977658 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1445817 () Bool)

(declare-fun e!814401 () Bool)

(declare-datatypes ((array!98168 0))(
  ( (array!98169 (arr!47372 (Array (_ BitVec 32) (_ BitVec 64))) (size!47922 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98168)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445817 (= e!814401 (or (= (select (arr!47372 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47372 a!2862) intermediateBeforeIndex!19) (select (arr!47372 a!2862) j!93))))))

(declare-fun b!1445818 () Bool)

(declare-fun res!977654 () Bool)

(declare-fun e!814397 () Bool)

(assert (=> b!1445818 (=> (not res!977654) (not e!814397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445818 (= res!977654 (validKeyInArray!0 (select (arr!47372 a!2862) i!1006)))))

(declare-fun b!1445819 () Bool)

(declare-fun res!977646 () Bool)

(assert (=> b!1445819 (=> (not res!977646) (not e!814401))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11624 0))(
  ( (MissingZero!11624 (index!48888 (_ BitVec 32))) (Found!11624 (index!48889 (_ BitVec 32))) (Intermediate!11624 (undefined!12436 Bool) (index!48890 (_ BitVec 32)) (x!130577 (_ BitVec 32))) (Undefined!11624) (MissingVacant!11624 (index!48891 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98168 (_ BitVec 32)) SeekEntryResult!11624)

(assert (=> b!1445819 (= res!977646 (= (seekEntryOrOpen!0 (select (arr!47372 a!2862) j!93) a!2862 mask!2687) (Found!11624 j!93)))))

(declare-fun res!977657 () Bool)

(assert (=> start!124720 (=> (not res!977657) (not e!814397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124720 (= res!977657 (validMask!0 mask!2687))))

(assert (=> start!124720 e!814397))

(assert (=> start!124720 true))

(declare-fun array_inv!36400 (array!98168) Bool)

(assert (=> start!124720 (array_inv!36400 a!2862)))

(declare-fun b!1445820 () Bool)

(assert (=> b!1445820 (= e!814398 (not true))))

(assert (=> b!1445820 e!814401))

(declare-fun res!977648 () Bool)

(assert (=> b!1445820 (=> (not res!977648) (not e!814401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98168 (_ BitVec 32)) Bool)

(assert (=> b!1445820 (= res!977648 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48744 0))(
  ( (Unit!48745) )
))
(declare-fun lt!634609 () Unit!48744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48744)

(assert (=> b!1445820 (= lt!634609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445821 () Bool)

(declare-fun res!977652 () Bool)

(assert (=> b!1445821 (=> (not res!977652) (not e!814397))))

(assert (=> b!1445821 (= res!977652 (and (= (size!47922 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47922 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47922 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445822 () Bool)

(declare-fun e!814399 () Bool)

(assert (=> b!1445822 (= e!814399 e!814398)))

(declare-fun res!977647 () Bool)

(assert (=> b!1445822 (=> (not res!977647) (not e!814398))))

(declare-fun lt!634607 () SeekEntryResult!11624)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445822 (= res!977647 (= lt!634607 (Intermediate!11624 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634608 () (_ BitVec 64))

(declare-fun lt!634610 () array!98168)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98168 (_ BitVec 32)) SeekEntryResult!11624)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445822 (= lt!634607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634608 mask!2687) lt!634608 lt!634610 mask!2687))))

(assert (=> b!1445822 (= lt!634608 (select (store (arr!47372 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!814402 () Bool)

(declare-fun b!1445823 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1445823 (= e!814402 (= lt!634607 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634608 lt!634610 mask!2687)))))

(declare-fun b!1445824 () Bool)

(declare-fun res!977645 () Bool)

(assert (=> b!1445824 (=> (not res!977645) (not e!814397))))

(assert (=> b!1445824 (= res!977645 (validKeyInArray!0 (select (arr!47372 a!2862) j!93)))))

(declare-fun b!1445825 () Bool)

(declare-fun e!814403 () Bool)

(assert (=> b!1445825 (= e!814403 e!814399)))

(declare-fun res!977650 () Bool)

(assert (=> b!1445825 (=> (not res!977650) (not e!814399))))

(declare-fun lt!634611 () SeekEntryResult!11624)

(assert (=> b!1445825 (= res!977650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47372 a!2862) j!93) mask!2687) (select (arr!47372 a!2862) j!93) a!2862 mask!2687) lt!634611))))

(assert (=> b!1445825 (= lt!634611 (Intermediate!11624 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445826 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98168 (_ BitVec 32)) SeekEntryResult!11624)

(assert (=> b!1445826 (= e!814402 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634608 lt!634610 mask!2687) (seekEntryOrOpen!0 lt!634608 lt!634610 mask!2687)))))

(declare-fun b!1445827 () Bool)

(declare-fun res!977653 () Bool)

(assert (=> b!1445827 (=> (not res!977653) (not e!814397))))

(assert (=> b!1445827 (= res!977653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445828 () Bool)

(assert (=> b!1445828 (= e!814397 e!814403)))

(declare-fun res!977656 () Bool)

(assert (=> b!1445828 (=> (not res!977656) (not e!814403))))

(assert (=> b!1445828 (= res!977656 (= (select (store (arr!47372 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445828 (= lt!634610 (array!98169 (store (arr!47372 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47922 a!2862)))))

(declare-fun b!1445829 () Bool)

(declare-fun res!977659 () Bool)

(assert (=> b!1445829 (=> (not res!977659) (not e!814398))))

(assert (=> b!1445829 (= res!977659 e!814402)))

(declare-fun c!133596 () Bool)

(assert (=> b!1445829 (= c!133596 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445830 () Bool)

(declare-fun res!977655 () Bool)

(assert (=> b!1445830 (=> (not res!977655) (not e!814397))))

(declare-datatypes ((List!33873 0))(
  ( (Nil!33870) (Cons!33869 (h!35219 (_ BitVec 64)) (t!48567 List!33873)) )
))
(declare-fun arrayNoDuplicates!0 (array!98168 (_ BitVec 32) List!33873) Bool)

(assert (=> b!1445830 (= res!977655 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33870))))

(declare-fun b!1445831 () Bool)

(declare-fun res!977651 () Bool)

(assert (=> b!1445831 (=> (not res!977651) (not e!814397))))

(assert (=> b!1445831 (= res!977651 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47922 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47922 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47922 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445832 () Bool)

(declare-fun res!977649 () Bool)

(assert (=> b!1445832 (=> (not res!977649) (not e!814399))))

(assert (=> b!1445832 (= res!977649 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47372 a!2862) j!93) a!2862 mask!2687) lt!634611))))

(assert (= (and start!124720 res!977657) b!1445821))

(assert (= (and b!1445821 res!977652) b!1445818))

(assert (= (and b!1445818 res!977654) b!1445824))

(assert (= (and b!1445824 res!977645) b!1445827))

(assert (= (and b!1445827 res!977653) b!1445830))

(assert (= (and b!1445830 res!977655) b!1445831))

(assert (= (and b!1445831 res!977651) b!1445828))

(assert (= (and b!1445828 res!977656) b!1445825))

(assert (= (and b!1445825 res!977650) b!1445832))

(assert (= (and b!1445832 res!977649) b!1445822))

(assert (= (and b!1445822 res!977647) b!1445829))

(assert (= (and b!1445829 c!133596) b!1445823))

(assert (= (and b!1445829 (not c!133596)) b!1445826))

(assert (= (and b!1445829 res!977659) b!1445816))

(assert (= (and b!1445816 res!977658) b!1445820))

(assert (= (and b!1445820 res!977648) b!1445819))

(assert (= (and b!1445819 res!977646) b!1445817))

(declare-fun m!1334749 () Bool)

(assert (=> b!1445822 m!1334749))

(assert (=> b!1445822 m!1334749))

(declare-fun m!1334751 () Bool)

(assert (=> b!1445822 m!1334751))

(declare-fun m!1334753 () Bool)

(assert (=> b!1445822 m!1334753))

(declare-fun m!1334755 () Bool)

(assert (=> b!1445822 m!1334755))

(declare-fun m!1334757 () Bool)

(assert (=> b!1445825 m!1334757))

(assert (=> b!1445825 m!1334757))

(declare-fun m!1334759 () Bool)

(assert (=> b!1445825 m!1334759))

(assert (=> b!1445825 m!1334759))

(assert (=> b!1445825 m!1334757))

(declare-fun m!1334761 () Bool)

(assert (=> b!1445825 m!1334761))

(declare-fun m!1334763 () Bool)

(assert (=> b!1445826 m!1334763))

(declare-fun m!1334765 () Bool)

(assert (=> b!1445826 m!1334765))

(declare-fun m!1334767 () Bool)

(assert (=> b!1445820 m!1334767))

(declare-fun m!1334769 () Bool)

(assert (=> b!1445820 m!1334769))

(declare-fun m!1334771 () Bool)

(assert (=> b!1445830 m!1334771))

(assert (=> b!1445824 m!1334757))

(assert (=> b!1445824 m!1334757))

(declare-fun m!1334773 () Bool)

(assert (=> b!1445824 m!1334773))

(declare-fun m!1334775 () Bool)

(assert (=> b!1445818 m!1334775))

(assert (=> b!1445818 m!1334775))

(declare-fun m!1334777 () Bool)

(assert (=> b!1445818 m!1334777))

(declare-fun m!1334779 () Bool)

(assert (=> start!124720 m!1334779))

(declare-fun m!1334781 () Bool)

(assert (=> start!124720 m!1334781))

(declare-fun m!1334783 () Bool)

(assert (=> b!1445817 m!1334783))

(assert (=> b!1445817 m!1334757))

(assert (=> b!1445819 m!1334757))

(assert (=> b!1445819 m!1334757))

(declare-fun m!1334785 () Bool)

(assert (=> b!1445819 m!1334785))

(assert (=> b!1445828 m!1334753))

(declare-fun m!1334787 () Bool)

(assert (=> b!1445828 m!1334787))

(declare-fun m!1334789 () Bool)

(assert (=> b!1445823 m!1334789))

(declare-fun m!1334791 () Bool)

(assert (=> b!1445827 m!1334791))

(assert (=> b!1445832 m!1334757))

(assert (=> b!1445832 m!1334757))

(declare-fun m!1334793 () Bool)

(assert (=> b!1445832 m!1334793))

(push 1)

