; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124676 () Bool)

(assert start!124676)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!813937 () Bool)

(declare-datatypes ((array!98124 0))(
  ( (array!98125 (arr!47350 (Array (_ BitVec 32) (_ BitVec 64))) (size!47900 (_ BitVec 32))) )
))
(declare-fun lt!634279 () array!98124)

(declare-datatypes ((SeekEntryResult!11602 0))(
  ( (MissingZero!11602 (index!48800 (_ BitVec 32))) (Found!11602 (index!48801 (_ BitVec 32))) (Intermediate!11602 (undefined!12414 Bool) (index!48802 (_ BitVec 32)) (x!130491 (_ BitVec 32))) (Undefined!11602) (MissingVacant!11602 (index!48803 (_ BitVec 32))) )
))
(declare-fun lt!634277 () SeekEntryResult!11602)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634278 () (_ BitVec 64))

(declare-fun b!1444694 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98124 (_ BitVec 32)) SeekEntryResult!11602)

(assert (=> b!1444694 (= e!813937 (= lt!634277 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634278 lt!634279 mask!2687)))))

(declare-fun b!1444695 () Bool)

(declare-fun res!976657 () Bool)

(declare-fun e!813935 () Bool)

(assert (=> b!1444695 (=> (not res!976657) (not e!813935))))

(declare-fun a!2862 () array!98124)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444695 (= res!976657 (validKeyInArray!0 (select (arr!47350 a!2862) j!93)))))

(declare-fun b!1444696 () Bool)

(declare-fun res!976665 () Bool)

(assert (=> b!1444696 (=> (not res!976665) (not e!813935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98124 (_ BitVec 32)) Bool)

(assert (=> b!1444696 (= res!976665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1444697 () Bool)

(declare-fun e!813941 () Bool)

(assert (=> b!1444697 (= e!813941 (or (= (select (arr!47350 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47350 a!2862) intermediateBeforeIndex!19) (select (arr!47350 a!2862) j!93))))))

(declare-fun b!1444698 () Bool)

(declare-fun e!813940 () Bool)

(assert (=> b!1444698 (= e!813935 e!813940)))

(declare-fun res!976661 () Bool)

(assert (=> b!1444698 (=> (not res!976661) (not e!813940))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444698 (= res!976661 (= (select (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444698 (= lt!634279 (array!98125 (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47900 a!2862)))))

(declare-fun b!1444699 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98124 (_ BitVec 32)) SeekEntryResult!11602)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98124 (_ BitVec 32)) SeekEntryResult!11602)

(assert (=> b!1444699 (= e!813937 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634278 lt!634279 mask!2687) (seekEntryOrOpen!0 lt!634278 lt!634279 mask!2687)))))

(declare-fun res!976659 () Bool)

(assert (=> start!124676 (=> (not res!976659) (not e!813935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124676 (= res!976659 (validMask!0 mask!2687))))

(assert (=> start!124676 e!813935))

(assert (=> start!124676 true))

(declare-fun array_inv!36378 (array!98124) Bool)

(assert (=> start!124676 (array_inv!36378 a!2862)))

(declare-fun b!1444700 () Bool)

(declare-fun res!976660 () Bool)

(assert (=> b!1444700 (=> (not res!976660) (not e!813935))))

(assert (=> b!1444700 (= res!976660 (validKeyInArray!0 (select (arr!47350 a!2862) i!1006)))))

(declare-fun b!1444701 () Bool)

(declare-fun res!976666 () Bool)

(assert (=> b!1444701 (=> (not res!976666) (not e!813935))))

(declare-datatypes ((List!33851 0))(
  ( (Nil!33848) (Cons!33847 (h!35197 (_ BitVec 64)) (t!48545 List!33851)) )
))
(declare-fun arrayNoDuplicates!0 (array!98124 (_ BitVec 32) List!33851) Bool)

(assert (=> b!1444701 (= res!976666 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33848))))

(declare-fun b!1444702 () Bool)

(declare-fun res!976669 () Bool)

(assert (=> b!1444702 (=> (not res!976669) (not e!813935))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444702 (= res!976669 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47900 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47900 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47900 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444703 () Bool)

(declare-fun res!976655 () Bool)

(declare-fun e!813936 () Bool)

(assert (=> b!1444703 (=> (not res!976655) (not e!813936))))

(declare-fun lt!634281 () SeekEntryResult!11602)

(assert (=> b!1444703 (= res!976655 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47350 a!2862) j!93) a!2862 mask!2687) lt!634281))))

(declare-fun b!1444704 () Bool)

(declare-fun e!813939 () Bool)

(assert (=> b!1444704 (= e!813939 (not true))))

(assert (=> b!1444704 e!813941))

(declare-fun res!976662 () Bool)

(assert (=> b!1444704 (=> (not res!976662) (not e!813941))))

(assert (=> b!1444704 (= res!976662 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48700 0))(
  ( (Unit!48701) )
))
(declare-fun lt!634280 () Unit!48700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48700)

(assert (=> b!1444704 (= lt!634280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444705 () Bool)

(assert (=> b!1444705 (= e!813940 e!813936)))

(declare-fun res!976656 () Bool)

(assert (=> b!1444705 (=> (not res!976656) (not e!813936))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444705 (= res!976656 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47350 a!2862) j!93) mask!2687) (select (arr!47350 a!2862) j!93) a!2862 mask!2687) lt!634281))))

(assert (=> b!1444705 (= lt!634281 (Intermediate!11602 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444706 () Bool)

(declare-fun res!976667 () Bool)

(assert (=> b!1444706 (=> (not res!976667) (not e!813941))))

(assert (=> b!1444706 (= res!976667 (= (seekEntryOrOpen!0 (select (arr!47350 a!2862) j!93) a!2862 mask!2687) (Found!11602 j!93)))))

(declare-fun b!1444707 () Bool)

(declare-fun res!976663 () Bool)

(assert (=> b!1444707 (=> (not res!976663) (not e!813935))))

(assert (=> b!1444707 (= res!976663 (and (= (size!47900 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47900 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47900 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444708 () Bool)

(assert (=> b!1444708 (= e!813936 e!813939)))

(declare-fun res!976658 () Bool)

(assert (=> b!1444708 (=> (not res!976658) (not e!813939))))

(assert (=> b!1444708 (= res!976658 (= lt!634277 (Intermediate!11602 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444708 (= lt!634277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634278 mask!2687) lt!634278 lt!634279 mask!2687))))

(assert (=> b!1444708 (= lt!634278 (select (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444709 () Bool)

(declare-fun res!976668 () Bool)

(assert (=> b!1444709 (=> (not res!976668) (not e!813939))))

(assert (=> b!1444709 (= res!976668 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444710 () Bool)

(declare-fun res!976664 () Bool)

(assert (=> b!1444710 (=> (not res!976664) (not e!813939))))

(assert (=> b!1444710 (= res!976664 e!813937)))

(declare-fun c!133530 () Bool)

(assert (=> b!1444710 (= c!133530 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124676 res!976659) b!1444707))

(assert (= (and b!1444707 res!976663) b!1444700))

(assert (= (and b!1444700 res!976660) b!1444695))

(assert (= (and b!1444695 res!976657) b!1444696))

(assert (= (and b!1444696 res!976665) b!1444701))

(assert (= (and b!1444701 res!976666) b!1444702))

(assert (= (and b!1444702 res!976669) b!1444698))

(assert (= (and b!1444698 res!976661) b!1444705))

(assert (= (and b!1444705 res!976656) b!1444703))

(assert (= (and b!1444703 res!976655) b!1444708))

(assert (= (and b!1444708 res!976658) b!1444710))

(assert (= (and b!1444710 c!133530) b!1444694))

(assert (= (and b!1444710 (not c!133530)) b!1444699))

(assert (= (and b!1444710 res!976664) b!1444709))

(assert (= (and b!1444709 res!976668) b!1444704))

(assert (= (and b!1444704 res!976662) b!1444706))

(assert (= (and b!1444706 res!976667) b!1444697))

(declare-fun m!1333701 () Bool)

(assert (=> b!1444694 m!1333701))

(declare-fun m!1333703 () Bool)

(assert (=> b!1444704 m!1333703))

(declare-fun m!1333705 () Bool)

(assert (=> b!1444704 m!1333705))

(declare-fun m!1333707 () Bool)

(assert (=> b!1444699 m!1333707))

(declare-fun m!1333709 () Bool)

(assert (=> b!1444699 m!1333709))

(declare-fun m!1333711 () Bool)

(assert (=> b!1444708 m!1333711))

(assert (=> b!1444708 m!1333711))

(declare-fun m!1333713 () Bool)

(assert (=> b!1444708 m!1333713))

(declare-fun m!1333715 () Bool)

(assert (=> b!1444708 m!1333715))

(declare-fun m!1333717 () Bool)

(assert (=> b!1444708 m!1333717))

(declare-fun m!1333719 () Bool)

(assert (=> start!124676 m!1333719))

(declare-fun m!1333721 () Bool)

(assert (=> start!124676 m!1333721))

(declare-fun m!1333723 () Bool)

(assert (=> b!1444703 m!1333723))

(assert (=> b!1444703 m!1333723))

(declare-fun m!1333725 () Bool)

(assert (=> b!1444703 m!1333725))

(declare-fun m!1333727 () Bool)

(assert (=> b!1444701 m!1333727))

(assert (=> b!1444705 m!1333723))

(assert (=> b!1444705 m!1333723))

(declare-fun m!1333729 () Bool)

(assert (=> b!1444705 m!1333729))

(assert (=> b!1444705 m!1333729))

(assert (=> b!1444705 m!1333723))

(declare-fun m!1333731 () Bool)

(assert (=> b!1444705 m!1333731))

(declare-fun m!1333733 () Bool)

(assert (=> b!1444700 m!1333733))

(assert (=> b!1444700 m!1333733))

(declare-fun m!1333735 () Bool)

(assert (=> b!1444700 m!1333735))

(declare-fun m!1333737 () Bool)

(assert (=> b!1444696 m!1333737))

(assert (=> b!1444706 m!1333723))

(assert (=> b!1444706 m!1333723))

(declare-fun m!1333739 () Bool)

(assert (=> b!1444706 m!1333739))

(declare-fun m!1333741 () Bool)

(assert (=> b!1444697 m!1333741))

(assert (=> b!1444697 m!1333723))

(assert (=> b!1444698 m!1333715))

(declare-fun m!1333743 () Bool)

(assert (=> b!1444698 m!1333743))

(assert (=> b!1444695 m!1333723))

(assert (=> b!1444695 m!1333723))

(declare-fun m!1333745 () Bool)

(assert (=> b!1444695 m!1333745))

(push 1)

