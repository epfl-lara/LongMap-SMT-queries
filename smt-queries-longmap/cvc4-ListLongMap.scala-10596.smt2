; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124718 () Bool)

(assert start!124718)

(declare-fun b!1445765 () Bool)

(declare-fun e!814380 () Bool)

(declare-fun e!814381 () Bool)

(assert (=> b!1445765 (= e!814380 e!814381)))

(declare-fun res!977609 () Bool)

(assert (=> b!1445765 (=> (not res!977609) (not e!814381))))

(declare-datatypes ((SeekEntryResult!11623 0))(
  ( (MissingZero!11623 (index!48884 (_ BitVec 32))) (Found!11623 (index!48885 (_ BitVec 32))) (Intermediate!11623 (undefined!12435 Bool) (index!48886 (_ BitVec 32)) (x!130568 (_ BitVec 32))) (Undefined!11623) (MissingVacant!11623 (index!48887 (_ BitVec 32))) )
))
(declare-fun lt!634592 () SeekEntryResult!11623)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445765 (= res!977609 (= lt!634592 (Intermediate!11623 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634593 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98166 0))(
  ( (array!98167 (arr!47371 (Array (_ BitVec 32) (_ BitVec 64))) (size!47921 (_ BitVec 32))) )
))
(declare-fun lt!634596 () array!98166)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98166 (_ BitVec 32)) SeekEntryResult!11623)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445765 (= lt!634592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634593 mask!2687) lt!634593 lt!634596 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98166)

(assert (=> b!1445765 (= lt!634593 (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445766 () Bool)

(declare-fun res!977607 () Bool)

(declare-fun e!814376 () Bool)

(assert (=> b!1445766 (=> (not res!977607) (not e!814376))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98166 (_ BitVec 32)) SeekEntryResult!11623)

(assert (=> b!1445766 (= res!977607 (= (seekEntryOrOpen!0 (select (arr!47371 a!2862) j!93) a!2862 mask!2687) (Found!11623 j!93)))))

(declare-fun b!1445767 () Bool)

(declare-fun res!977611 () Bool)

(declare-fun e!814378 () Bool)

(assert (=> b!1445767 (=> (not res!977611) (not e!814378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445767 (= res!977611 (validKeyInArray!0 (select (arr!47371 a!2862) i!1006)))))

(declare-fun b!1445768 () Bool)

(declare-fun res!977612 () Bool)

(assert (=> b!1445768 (=> (not res!977612) (not e!814380))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634595 () SeekEntryResult!11623)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1445768 (= res!977612 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47371 a!2862) j!93) a!2862 mask!2687) lt!634595))))

(declare-fun b!1445769 () Bool)

(declare-fun res!977602 () Bool)

(assert (=> b!1445769 (=> (not res!977602) (not e!814378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98166 (_ BitVec 32)) Bool)

(assert (=> b!1445769 (= res!977602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445770 () Bool)

(assert (=> b!1445770 (= e!814381 (not (or (and (= (select (arr!47371 a!2862) index!646) (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47371 a!2862) index!646) (select (arr!47371 a!2862) j!93))) (not (= (select (arr!47371 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1445770 e!814376))

(declare-fun res!977604 () Bool)

(assert (=> b!1445770 (=> (not res!977604) (not e!814376))))

(assert (=> b!1445770 (= res!977604 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48742 0))(
  ( (Unit!48743) )
))
(declare-fun lt!634594 () Unit!48742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48742)

(assert (=> b!1445770 (= lt!634594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445772 () Bool)

(declare-fun res!977606 () Bool)

(assert (=> b!1445772 (=> (not res!977606) (not e!814378))))

(assert (=> b!1445772 (= res!977606 (and (= (size!47921 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47921 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47921 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445773 () Bool)

(declare-fun res!977603 () Bool)

(assert (=> b!1445773 (=> (not res!977603) (not e!814381))))

(declare-fun e!814382 () Bool)

(assert (=> b!1445773 (= res!977603 e!814382)))

(declare-fun c!133593 () Bool)

(assert (=> b!1445773 (= c!133593 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445774 () Bool)

(declare-fun res!977601 () Bool)

(assert (=> b!1445774 (=> (not res!977601) (not e!814378))))

(assert (=> b!1445774 (= res!977601 (validKeyInArray!0 (select (arr!47371 a!2862) j!93)))))

(declare-fun b!1445775 () Bool)

(assert (=> b!1445775 (= e!814382 (= lt!634592 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634593 lt!634596 mask!2687)))))

(declare-fun b!1445776 () Bool)

(declare-fun e!814377 () Bool)

(assert (=> b!1445776 (= e!814378 e!814377)))

(declare-fun res!977600 () Bool)

(assert (=> b!1445776 (=> (not res!977600) (not e!814377))))

(assert (=> b!1445776 (= res!977600 (= (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445776 (= lt!634596 (array!98167 (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47921 a!2862)))))

(declare-fun b!1445777 () Bool)

(declare-fun res!977605 () Bool)

(assert (=> b!1445777 (=> (not res!977605) (not e!814378))))

(declare-datatypes ((List!33872 0))(
  ( (Nil!33869) (Cons!33868 (h!35218 (_ BitVec 64)) (t!48566 List!33872)) )
))
(declare-fun arrayNoDuplicates!0 (array!98166 (_ BitVec 32) List!33872) Bool)

(assert (=> b!1445777 (= res!977605 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33869))))

(declare-fun b!1445778 () Bool)

(declare-fun res!977614 () Bool)

(assert (=> b!1445778 (=> (not res!977614) (not e!814381))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445778 (= res!977614 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445779 () Bool)

(declare-fun res!977613 () Bool)

(assert (=> b!1445779 (=> (not res!977613) (not e!814378))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445779 (= res!977613 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47921 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47921 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47921 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445780 () Bool)

(assert (=> b!1445780 (= e!814377 e!814380)))

(declare-fun res!977608 () Bool)

(assert (=> b!1445780 (=> (not res!977608) (not e!814380))))

(assert (=> b!1445780 (= res!977608 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47371 a!2862) j!93) mask!2687) (select (arr!47371 a!2862) j!93) a!2862 mask!2687) lt!634595))))

(assert (=> b!1445780 (= lt!634595 (Intermediate!11623 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445781 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98166 (_ BitVec 32)) SeekEntryResult!11623)

(assert (=> b!1445781 (= e!814382 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634593 lt!634596 mask!2687) (seekEntryOrOpen!0 lt!634593 lt!634596 mask!2687)))))

(declare-fun b!1445771 () Bool)

(assert (=> b!1445771 (= e!814376 (or (= (select (arr!47371 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47371 a!2862) intermediateBeforeIndex!19) (select (arr!47371 a!2862) j!93))))))

(declare-fun res!977610 () Bool)

(assert (=> start!124718 (=> (not res!977610) (not e!814378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124718 (= res!977610 (validMask!0 mask!2687))))

(assert (=> start!124718 e!814378))

(assert (=> start!124718 true))

(declare-fun array_inv!36399 (array!98166) Bool)

(assert (=> start!124718 (array_inv!36399 a!2862)))

(assert (= (and start!124718 res!977610) b!1445772))

(assert (= (and b!1445772 res!977606) b!1445767))

(assert (= (and b!1445767 res!977611) b!1445774))

(assert (= (and b!1445774 res!977601) b!1445769))

(assert (= (and b!1445769 res!977602) b!1445777))

(assert (= (and b!1445777 res!977605) b!1445779))

(assert (= (and b!1445779 res!977613) b!1445776))

(assert (= (and b!1445776 res!977600) b!1445780))

(assert (= (and b!1445780 res!977608) b!1445768))

(assert (= (and b!1445768 res!977612) b!1445765))

(assert (= (and b!1445765 res!977609) b!1445773))

(assert (= (and b!1445773 c!133593) b!1445775))

(assert (= (and b!1445773 (not c!133593)) b!1445781))

(assert (= (and b!1445773 res!977603) b!1445778))

(assert (= (and b!1445778 res!977614) b!1445770))

(assert (= (and b!1445770 res!977604) b!1445766))

(assert (= (and b!1445766 res!977607) b!1445771))

(declare-fun m!1334699 () Bool)

(assert (=> b!1445766 m!1334699))

(assert (=> b!1445766 m!1334699))

(declare-fun m!1334701 () Bool)

(assert (=> b!1445766 m!1334701))

(declare-fun m!1334703 () Bool)

(assert (=> b!1445771 m!1334703))

(assert (=> b!1445771 m!1334699))

(declare-fun m!1334705 () Bool)

(assert (=> b!1445775 m!1334705))

(declare-fun m!1334707 () Bool)

(assert (=> b!1445765 m!1334707))

(assert (=> b!1445765 m!1334707))

(declare-fun m!1334709 () Bool)

(assert (=> b!1445765 m!1334709))

(declare-fun m!1334711 () Bool)

(assert (=> b!1445765 m!1334711))

(declare-fun m!1334713 () Bool)

(assert (=> b!1445765 m!1334713))

(declare-fun m!1334715 () Bool)

(assert (=> b!1445769 m!1334715))

(assert (=> b!1445780 m!1334699))

(assert (=> b!1445780 m!1334699))

(declare-fun m!1334717 () Bool)

(assert (=> b!1445780 m!1334717))

(assert (=> b!1445780 m!1334717))

(assert (=> b!1445780 m!1334699))

(declare-fun m!1334719 () Bool)

(assert (=> b!1445780 m!1334719))

(assert (=> b!1445768 m!1334699))

(assert (=> b!1445768 m!1334699))

(declare-fun m!1334721 () Bool)

(assert (=> b!1445768 m!1334721))

(declare-fun m!1334723 () Bool)

(assert (=> b!1445767 m!1334723))

(assert (=> b!1445767 m!1334723))

(declare-fun m!1334725 () Bool)

(assert (=> b!1445767 m!1334725))

(declare-fun m!1334727 () Bool)

(assert (=> b!1445770 m!1334727))

(assert (=> b!1445770 m!1334711))

(declare-fun m!1334729 () Bool)

(assert (=> b!1445770 m!1334729))

(declare-fun m!1334731 () Bool)

(assert (=> b!1445770 m!1334731))

(declare-fun m!1334733 () Bool)

(assert (=> b!1445770 m!1334733))

(assert (=> b!1445770 m!1334699))

(declare-fun m!1334735 () Bool)

(assert (=> b!1445777 m!1334735))

(assert (=> b!1445774 m!1334699))

(assert (=> b!1445774 m!1334699))

(declare-fun m!1334737 () Bool)

(assert (=> b!1445774 m!1334737))

(declare-fun m!1334739 () Bool)

(assert (=> start!124718 m!1334739))

(declare-fun m!1334741 () Bool)

(assert (=> start!124718 m!1334741))

(assert (=> b!1445776 m!1334711))

(declare-fun m!1334743 () Bool)

(assert (=> b!1445776 m!1334743))

(declare-fun m!1334745 () Bool)

(assert (=> b!1445781 m!1334745))

(declare-fun m!1334747 () Bool)

(assert (=> b!1445781 m!1334747))

(push 1)

(assert (not b!1445774))

(assert (not b!1445780))

(assert (not b!1445765))

(assert (not b!1445781))

(assert (not b!1445775))

(assert (not b!1445768))

(assert (not b!1445766))

(assert (not start!124718))

(assert (not b!1445770))

(assert (not b!1445769))

(assert (not b!1445777))

(assert (not b!1445767))

(check-sat)

(pop 1)

(push 1)

(check-sat)

