; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125520 () Bool)

(assert start!125520)

(declare-fun b!1463167 () Bool)

(declare-fun res!991690 () Bool)

(declare-fun e!822693 () Bool)

(assert (=> b!1463167 (=> (not res!991690) (not e!822693))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463167 (= res!991690 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463168 () Bool)

(declare-fun e!822687 () Bool)

(assert (=> b!1463168 (= e!822693 (not e!822687))))

(declare-fun res!991681 () Bool)

(assert (=> b!1463168 (=> res!991681 e!822687)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98806 0))(
  ( (array!98807 (arr!47686 (Array (_ BitVec 32) (_ BitVec 64))) (size!48237 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98806)

(assert (=> b!1463168 (= res!991681 (or (and (= (select (arr!47686 a!2862) index!646) (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47686 a!2862) index!646) (select (arr!47686 a!2862) j!93))) (= (select (arr!47686 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822688 () Bool)

(assert (=> b!1463168 e!822688))

(declare-fun res!991684 () Bool)

(assert (=> b!1463168 (=> (not res!991684) (not e!822688))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98806 (_ BitVec 32)) Bool)

(assert (=> b!1463168 (= res!991684 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49199 0))(
  ( (Unit!49200) )
))
(declare-fun lt!640776 () Unit!49199)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49199)

(assert (=> b!1463168 (= lt!640776 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463169 () Bool)

(declare-fun res!991682 () Bool)

(declare-fun e!822690 () Bool)

(assert (=> b!1463169 (=> (not res!991682) (not e!822690))))

(declare-datatypes ((SeekEntryResult!11835 0))(
  ( (MissingZero!11835 (index!49732 (_ BitVec 32))) (Found!11835 (index!49733 (_ BitVec 32))) (Intermediate!11835 (undefined!12647 Bool) (index!49734 (_ BitVec 32)) (x!131517 (_ BitVec 32))) (Undefined!11835) (MissingVacant!11835 (index!49735 (_ BitVec 32))) )
))
(declare-fun lt!640779 () SeekEntryResult!11835)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11835)

(assert (=> b!1463169 (= res!991682 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!640779))))

(declare-fun e!822689 () Bool)

(declare-fun lt!640778 () (_ BitVec 64))

(declare-fun b!1463170 () Bool)

(declare-fun lt!640780 () array!98806)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11835)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11835)

(assert (=> b!1463170 (= e!822689 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640778 lt!640780 mask!2687) (seekEntryOrOpen!0 lt!640778 lt!640780 mask!2687)))))

(declare-fun b!1463171 () Bool)

(declare-fun res!991692 () Bool)

(assert (=> b!1463171 (=> (not res!991692) (not e!822693))))

(assert (=> b!1463171 (= res!991692 e!822689)))

(declare-fun c!135265 () Bool)

(assert (=> b!1463171 (= c!135265 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463172 () Bool)

(declare-fun e!822685 () Bool)

(declare-fun e!822684 () Bool)

(assert (=> b!1463172 (= e!822685 e!822684)))

(declare-fun res!991697 () Bool)

(assert (=> b!1463172 (=> (not res!991697) (not e!822684))))

(assert (=> b!1463172 (= res!991697 (= (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463172 (= lt!640780 (array!98807 (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48237 a!2862)))))

(declare-fun b!1463173 () Bool)

(declare-fun res!991687 () Bool)

(assert (=> b!1463173 (=> (not res!991687) (not e!822685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463173 (= res!991687 (validKeyInArray!0 (select (arr!47686 a!2862) i!1006)))))

(declare-fun b!1463174 () Bool)

(declare-fun e!822686 () Bool)

(assert (=> b!1463174 (= e!822686 true)))

(declare-fun lt!640775 () Bool)

(declare-fun e!822691 () Bool)

(assert (=> b!1463174 (= lt!640775 e!822691)))

(declare-fun c!135264 () Bool)

(assert (=> b!1463174 (= c!135264 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463175 () Bool)

(declare-fun res!991683 () Bool)

(assert (=> b!1463175 (=> (not res!991683) (not e!822685))))

(declare-datatypes ((List!34174 0))(
  ( (Nil!34171) (Cons!34170 (h!35534 (_ BitVec 64)) (t!48860 List!34174)) )
))
(declare-fun arrayNoDuplicates!0 (array!98806 (_ BitVec 32) List!34174) Bool)

(assert (=> b!1463175 (= res!991683 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34171))))

(declare-fun b!1463176 () Bool)

(declare-fun res!991696 () Bool)

(assert (=> b!1463176 (=> (not res!991696) (not e!822685))))

(assert (=> b!1463176 (= res!991696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!991693 () Bool)

(assert (=> start!125520 (=> (not res!991693) (not e!822685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125520 (= res!991693 (validMask!0 mask!2687))))

(assert (=> start!125520 e!822685))

(assert (=> start!125520 true))

(declare-fun array_inv!36967 (array!98806) Bool)

(assert (=> start!125520 (array_inv!36967 a!2862)))

(declare-fun b!1463177 () Bool)

(declare-fun res!991694 () Bool)

(assert (=> b!1463177 (=> (not res!991694) (not e!822685))))

(assert (=> b!1463177 (= res!991694 (and (= (size!48237 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48237 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48237 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463178 () Bool)

(assert (=> b!1463178 (= e!822690 e!822693)))

(declare-fun res!991695 () Bool)

(assert (=> b!1463178 (=> (not res!991695) (not e!822693))))

(declare-fun lt!640774 () SeekEntryResult!11835)

(assert (=> b!1463178 (= res!991695 (= lt!640774 (Intermediate!11835 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463178 (= lt!640774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640778 mask!2687) lt!640778 lt!640780 mask!2687))))

(assert (=> b!1463178 (= lt!640778 (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463179 () Bool)

(assert (=> b!1463179 (= e!822689 (= lt!640774 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640778 lt!640780 mask!2687)))))

(declare-fun b!1463180 () Bool)

(declare-fun res!991689 () Bool)

(assert (=> b!1463180 (=> (not res!991689) (not e!822685))))

(assert (=> b!1463180 (= res!991689 (validKeyInArray!0 (select (arr!47686 a!2862) j!93)))))

(declare-fun lt!640777 () (_ BitVec 32))

(declare-fun b!1463181 () Bool)

(assert (=> b!1463181 (= e!822691 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640777 intermediateAfterIndex!19 lt!640778 lt!640780 mask!2687) (seekEntryOrOpen!0 lt!640778 lt!640780 mask!2687))))))

(declare-fun b!1463182 () Bool)

(assert (=> b!1463182 (= e!822684 e!822690)))

(declare-fun res!991686 () Bool)

(assert (=> b!1463182 (=> (not res!991686) (not e!822690))))

(assert (=> b!1463182 (= res!991686 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47686 a!2862) j!93) mask!2687) (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!640779))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1463182 (= lt!640779 (Intermediate!11835 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463183 () Bool)

(assert (=> b!1463183 (= e!822691 (not (= lt!640774 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640777 lt!640778 lt!640780 mask!2687))))))

(declare-fun b!1463184 () Bool)

(declare-fun res!991691 () Bool)

(assert (=> b!1463184 (=> (not res!991691) (not e!822688))))

(assert (=> b!1463184 (= res!991691 (= (seekEntryOrOpen!0 (select (arr!47686 a!2862) j!93) a!2862 mask!2687) (Found!11835 j!93)))))

(declare-fun b!1463185 () Bool)

(declare-fun res!991680 () Bool)

(assert (=> b!1463185 (=> (not res!991680) (not e!822685))))

(assert (=> b!1463185 (= res!991680 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48237 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48237 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48237 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463186 () Bool)

(declare-fun res!991688 () Bool)

(assert (=> b!1463186 (=> res!991688 e!822686)))

(assert (=> b!1463186 (= res!991688 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640777 (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!640779)))))

(declare-fun b!1463187 () Bool)

(assert (=> b!1463187 (= e!822687 e!822686)))

(declare-fun res!991685 () Bool)

(assert (=> b!1463187 (=> res!991685 e!822686)))

(assert (=> b!1463187 (= res!991685 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640777 #b00000000000000000000000000000000) (bvsge lt!640777 (size!48237 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463187 (= lt!640777 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1463188 () Bool)

(assert (=> b!1463188 (= e!822688 (or (= (select (arr!47686 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47686 a!2862) intermediateBeforeIndex!19) (select (arr!47686 a!2862) j!93))))))

(assert (= (and start!125520 res!991693) b!1463177))

(assert (= (and b!1463177 res!991694) b!1463173))

(assert (= (and b!1463173 res!991687) b!1463180))

(assert (= (and b!1463180 res!991689) b!1463176))

(assert (= (and b!1463176 res!991696) b!1463175))

(assert (= (and b!1463175 res!991683) b!1463185))

(assert (= (and b!1463185 res!991680) b!1463172))

(assert (= (and b!1463172 res!991697) b!1463182))

(assert (= (and b!1463182 res!991686) b!1463169))

(assert (= (and b!1463169 res!991682) b!1463178))

(assert (= (and b!1463178 res!991695) b!1463171))

(assert (= (and b!1463171 c!135265) b!1463179))

(assert (= (and b!1463171 (not c!135265)) b!1463170))

(assert (= (and b!1463171 res!991692) b!1463167))

(assert (= (and b!1463167 res!991690) b!1463168))

(assert (= (and b!1463168 res!991684) b!1463184))

(assert (= (and b!1463184 res!991691) b!1463188))

(assert (= (and b!1463168 (not res!991681)) b!1463187))

(assert (= (and b!1463187 (not res!991685)) b!1463186))

(assert (= (and b!1463186 (not res!991688)) b!1463174))

(assert (= (and b!1463174 c!135264) b!1463183))

(assert (= (and b!1463174 (not c!135264)) b!1463181))

(declare-fun m!1350721 () Bool)

(assert (=> b!1463179 m!1350721))

(declare-fun m!1350723 () Bool)

(assert (=> b!1463187 m!1350723))

(declare-fun m!1350725 () Bool)

(assert (=> b!1463175 m!1350725))

(declare-fun m!1350727 () Bool)

(assert (=> b!1463168 m!1350727))

(declare-fun m!1350729 () Bool)

(assert (=> b!1463168 m!1350729))

(declare-fun m!1350731 () Bool)

(assert (=> b!1463168 m!1350731))

(declare-fun m!1350733 () Bool)

(assert (=> b!1463168 m!1350733))

(declare-fun m!1350735 () Bool)

(assert (=> b!1463168 m!1350735))

(declare-fun m!1350737 () Bool)

(assert (=> b!1463168 m!1350737))

(declare-fun m!1350739 () Bool)

(assert (=> b!1463178 m!1350739))

(assert (=> b!1463178 m!1350739))

(declare-fun m!1350741 () Bool)

(assert (=> b!1463178 m!1350741))

(assert (=> b!1463178 m!1350729))

(declare-fun m!1350743 () Bool)

(assert (=> b!1463178 m!1350743))

(assert (=> b!1463182 m!1350737))

(assert (=> b!1463182 m!1350737))

(declare-fun m!1350745 () Bool)

(assert (=> b!1463182 m!1350745))

(assert (=> b!1463182 m!1350745))

(assert (=> b!1463182 m!1350737))

(declare-fun m!1350747 () Bool)

(assert (=> b!1463182 m!1350747))

(declare-fun m!1350749 () Bool)

(assert (=> b!1463188 m!1350749))

(assert (=> b!1463188 m!1350737))

(assert (=> b!1463169 m!1350737))

(assert (=> b!1463169 m!1350737))

(declare-fun m!1350751 () Bool)

(assert (=> b!1463169 m!1350751))

(assert (=> b!1463180 m!1350737))

(assert (=> b!1463180 m!1350737))

(declare-fun m!1350753 () Bool)

(assert (=> b!1463180 m!1350753))

(declare-fun m!1350755 () Bool)

(assert (=> b!1463170 m!1350755))

(declare-fun m!1350757 () Bool)

(assert (=> b!1463170 m!1350757))

(assert (=> b!1463184 m!1350737))

(assert (=> b!1463184 m!1350737))

(declare-fun m!1350759 () Bool)

(assert (=> b!1463184 m!1350759))

(assert (=> b!1463186 m!1350737))

(assert (=> b!1463186 m!1350737))

(declare-fun m!1350761 () Bool)

(assert (=> b!1463186 m!1350761))

(declare-fun m!1350763 () Bool)

(assert (=> b!1463176 m!1350763))

(declare-fun m!1350765 () Bool)

(assert (=> b!1463181 m!1350765))

(assert (=> b!1463181 m!1350757))

(assert (=> b!1463172 m!1350729))

(declare-fun m!1350767 () Bool)

(assert (=> b!1463172 m!1350767))

(declare-fun m!1350769 () Bool)

(assert (=> b!1463173 m!1350769))

(assert (=> b!1463173 m!1350769))

(declare-fun m!1350771 () Bool)

(assert (=> b!1463173 m!1350771))

(declare-fun m!1350773 () Bool)

(assert (=> b!1463183 m!1350773))

(declare-fun m!1350775 () Bool)

(assert (=> start!125520 m!1350775))

(declare-fun m!1350777 () Bool)

(assert (=> start!125520 m!1350777))

(check-sat (not b!1463176) (not b!1463186) (not b!1463183) (not b!1463187) (not b!1463169) (not b!1463168) (not b!1463184) (not b!1463170) (not b!1463180) (not start!125520) (not b!1463175) (not b!1463182) (not b!1463178) (not b!1463181) (not b!1463173) (not b!1463179))
(check-sat)
