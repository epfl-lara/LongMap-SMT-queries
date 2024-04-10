; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124430 () Bool)

(assert start!124430)

(declare-fun b!1439599 () Bool)

(declare-fun e!811925 () Bool)

(declare-fun e!811923 () Bool)

(assert (=> b!1439599 (= e!811925 e!811923)))

(declare-fun res!972026 () Bool)

(assert (=> b!1439599 (=> (not res!972026) (not e!811923))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11479 0))(
  ( (MissingZero!11479 (index!48308 (_ BitVec 32))) (Found!11479 (index!48309 (_ BitVec 32))) (Intermediate!11479 (undefined!12291 Bool) (index!48310 (_ BitVec 32)) (x!130040 (_ BitVec 32))) (Undefined!11479) (MissingVacant!11479 (index!48311 (_ BitVec 32))) )
))
(declare-fun lt!632841 () SeekEntryResult!11479)

(declare-datatypes ((array!97878 0))(
  ( (array!97879 (arr!47227 (Array (_ BitVec 32) (_ BitVec 64))) (size!47777 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97878)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97878 (_ BitVec 32)) SeekEntryResult!11479)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439599 (= res!972026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687) (select (arr!47227 a!2862) j!93) a!2862 mask!2687) lt!632841))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439599 (= lt!632841 (Intermediate!11479 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439600 () Bool)

(declare-fun res!972033 () Bool)

(assert (=> b!1439600 (=> (not res!972033) (not e!811925))))

(declare-datatypes ((List!33728 0))(
  ( (Nil!33725) (Cons!33724 (h!35074 (_ BitVec 64)) (t!48422 List!33728)) )
))
(declare-fun arrayNoDuplicates!0 (array!97878 (_ BitVec 32) List!33728) Bool)

(assert (=> b!1439600 (= res!972033 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33725))))

(declare-fun b!1439601 () Bool)

(declare-fun res!972032 () Bool)

(assert (=> b!1439601 (=> (not res!972032) (not e!811925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97878 (_ BitVec 32)) Bool)

(assert (=> b!1439601 (= res!972032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972027 () Bool)

(assert (=> start!124430 (=> (not res!972027) (not e!811925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124430 (= res!972027 (validMask!0 mask!2687))))

(assert (=> start!124430 e!811925))

(assert (=> start!124430 true))

(declare-fun array_inv!36255 (array!97878) Bool)

(assert (=> start!124430 (array_inv!36255 a!2862)))

(declare-fun b!1439602 () Bool)

(assert (=> b!1439602 (= e!811923 false)))

(declare-fun lt!632840 () SeekEntryResult!11479)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439602 (= lt!632840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97879 (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47777 a!2862)) mask!2687))))

(declare-fun b!1439603 () Bool)

(declare-fun res!972028 () Bool)

(assert (=> b!1439603 (=> (not res!972028) (not e!811925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439603 (= res!972028 (validKeyInArray!0 (select (arr!47227 a!2862) j!93)))))

(declare-fun b!1439604 () Bool)

(declare-fun res!972034 () Bool)

(assert (=> b!1439604 (=> (not res!972034) (not e!811925))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439604 (= res!972034 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47777 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47777 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47777 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439605 () Bool)

(declare-fun res!972031 () Bool)

(assert (=> b!1439605 (=> (not res!972031) (not e!811925))))

(assert (=> b!1439605 (= res!972031 (and (= (size!47777 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47777 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47777 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439606 () Bool)

(declare-fun res!972029 () Bool)

(assert (=> b!1439606 (=> (not res!972029) (not e!811923))))

(assert (=> b!1439606 (= res!972029 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47227 a!2862) j!93) a!2862 mask!2687) lt!632841))))

(declare-fun b!1439607 () Bool)

(declare-fun res!972030 () Bool)

(assert (=> b!1439607 (=> (not res!972030) (not e!811925))))

(assert (=> b!1439607 (= res!972030 (validKeyInArray!0 (select (arr!47227 a!2862) i!1006)))))

(assert (= (and start!124430 res!972027) b!1439605))

(assert (= (and b!1439605 res!972031) b!1439607))

(assert (= (and b!1439607 res!972030) b!1439603))

(assert (= (and b!1439603 res!972028) b!1439601))

(assert (= (and b!1439601 res!972032) b!1439600))

(assert (= (and b!1439600 res!972033) b!1439604))

(assert (= (and b!1439604 res!972034) b!1439599))

(assert (= (and b!1439599 res!972026) b!1439606))

(assert (= (and b!1439606 res!972029) b!1439602))

(declare-fun m!1328693 () Bool)

(assert (=> b!1439600 m!1328693))

(declare-fun m!1328695 () Bool)

(assert (=> b!1439602 m!1328695))

(declare-fun m!1328697 () Bool)

(assert (=> b!1439602 m!1328697))

(assert (=> b!1439602 m!1328697))

(declare-fun m!1328699 () Bool)

(assert (=> b!1439602 m!1328699))

(assert (=> b!1439602 m!1328699))

(assert (=> b!1439602 m!1328697))

(declare-fun m!1328701 () Bool)

(assert (=> b!1439602 m!1328701))

(declare-fun m!1328703 () Bool)

(assert (=> b!1439606 m!1328703))

(assert (=> b!1439606 m!1328703))

(declare-fun m!1328705 () Bool)

(assert (=> b!1439606 m!1328705))

(assert (=> b!1439603 m!1328703))

(assert (=> b!1439603 m!1328703))

(declare-fun m!1328707 () Bool)

(assert (=> b!1439603 m!1328707))

(declare-fun m!1328709 () Bool)

(assert (=> b!1439601 m!1328709))

(declare-fun m!1328711 () Bool)

(assert (=> b!1439607 m!1328711))

(assert (=> b!1439607 m!1328711))

(declare-fun m!1328713 () Bool)

(assert (=> b!1439607 m!1328713))

(assert (=> b!1439604 m!1328695))

(declare-fun m!1328715 () Bool)

(assert (=> b!1439604 m!1328715))

(declare-fun m!1328717 () Bool)

(assert (=> start!124430 m!1328717))

(declare-fun m!1328719 () Bool)

(assert (=> start!124430 m!1328719))

(assert (=> b!1439599 m!1328703))

(assert (=> b!1439599 m!1328703))

(declare-fun m!1328721 () Bool)

(assert (=> b!1439599 m!1328721))

(assert (=> b!1439599 m!1328721))

(assert (=> b!1439599 m!1328703))

(declare-fun m!1328723 () Bool)

(assert (=> b!1439599 m!1328723))

(push 1)

(assert (not b!1439599))

(assert (not b!1439601))

(assert (not start!124430))

(assert (not b!1439603))

(assert (not b!1439600))

(assert (not b!1439602))

(assert (not b!1439606))

(assert (not b!1439607))

(check-sat)

