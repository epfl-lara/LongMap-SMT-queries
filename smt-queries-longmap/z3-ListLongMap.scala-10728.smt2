; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125476 () Bool)

(assert start!125476)

(declare-fun b!1468150 () Bool)

(declare-fun res!996809 () Bool)

(declare-fun e!824436 () Bool)

(assert (=> b!1468150 (=> (not res!996809) (not e!824436))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98902 0))(
  ( (array!98903 (arr!47740 (Array (_ BitVec 32) (_ BitVec 64))) (size!48292 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98902)

(assert (=> b!1468150 (= res!996809 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48292 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48292 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48292 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468151 () Bool)

(declare-fun res!996812 () Bool)

(declare-fun e!824435 () Bool)

(assert (=> b!1468151 (=> (not res!996812) (not e!824435))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12005 0))(
  ( (MissingZero!12005 (index!50412 (_ BitVec 32))) (Found!12005 (index!50413 (_ BitVec 32))) (Intermediate!12005 (undefined!12817 Bool) (index!50414 (_ BitVec 32)) (x!132001 (_ BitVec 32))) (Undefined!12005) (MissingVacant!12005 (index!50415 (_ BitVec 32))) )
))
(declare-fun lt!642035 () SeekEntryResult!12005)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98902 (_ BitVec 32)) SeekEntryResult!12005)

(assert (=> b!1468151 (= res!996812 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47740 a!2862) j!93) a!2862 mask!2687) lt!642035))))

(declare-fun b!1468152 () Bool)

(assert (=> b!1468152 (= e!824436 e!824435)))

(declare-fun res!996810 () Bool)

(assert (=> b!1468152 (=> (not res!996810) (not e!824435))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468152 (= res!996810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47740 a!2862) j!93) mask!2687) (select (arr!47740 a!2862) j!93) a!2862 mask!2687) lt!642035))))

(assert (=> b!1468152 (= lt!642035 (Intermediate!12005 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468153 () Bool)

(declare-fun res!996806 () Bool)

(assert (=> b!1468153 (=> (not res!996806) (not e!824436))))

(declare-datatypes ((List!34319 0))(
  ( (Nil!34316) (Cons!34315 (h!35665 (_ BitVec 64)) (t!49005 List!34319)) )
))
(declare-fun arrayNoDuplicates!0 (array!98902 (_ BitVec 32) List!34319) Bool)

(assert (=> b!1468153 (= res!996806 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34316))))

(declare-fun res!996814 () Bool)

(assert (=> start!125476 (=> (not res!996814) (not e!824436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125476 (= res!996814 (validMask!0 mask!2687))))

(assert (=> start!125476 e!824436))

(assert (=> start!125476 true))

(declare-fun array_inv!36973 (array!98902) Bool)

(assert (=> start!125476 (array_inv!36973 a!2862)))

(declare-fun b!1468154 () Bool)

(declare-fun res!996808 () Bool)

(assert (=> b!1468154 (=> (not res!996808) (not e!824436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98902 (_ BitVec 32)) Bool)

(assert (=> b!1468154 (= res!996808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468155 () Bool)

(declare-fun res!996813 () Bool)

(assert (=> b!1468155 (=> (not res!996813) (not e!824436))))

(assert (=> b!1468155 (= res!996813 (and (= (size!48292 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48292 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48292 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468156 () Bool)

(assert (=> b!1468156 (= e!824435 false)))

(declare-fun lt!642036 () SeekEntryResult!12005)

(assert (=> b!1468156 (= lt!642036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98903 (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48292 a!2862)) mask!2687))))

(declare-fun b!1468157 () Bool)

(declare-fun res!996811 () Bool)

(assert (=> b!1468157 (=> (not res!996811) (not e!824436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468157 (= res!996811 (validKeyInArray!0 (select (arr!47740 a!2862) i!1006)))))

(declare-fun b!1468158 () Bool)

(declare-fun res!996807 () Bool)

(assert (=> b!1468158 (=> (not res!996807) (not e!824436))))

(assert (=> b!1468158 (= res!996807 (validKeyInArray!0 (select (arr!47740 a!2862) j!93)))))

(assert (= (and start!125476 res!996814) b!1468155))

(assert (= (and b!1468155 res!996813) b!1468157))

(assert (= (and b!1468157 res!996811) b!1468158))

(assert (= (and b!1468158 res!996807) b!1468154))

(assert (= (and b!1468154 res!996808) b!1468153))

(assert (= (and b!1468153 res!996806) b!1468150))

(assert (= (and b!1468150 res!996809) b!1468152))

(assert (= (and b!1468152 res!996810) b!1468151))

(assert (= (and b!1468151 res!996812) b!1468156))

(declare-fun m!1354713 () Bool)

(assert (=> b!1468151 m!1354713))

(assert (=> b!1468151 m!1354713))

(declare-fun m!1354715 () Bool)

(assert (=> b!1468151 m!1354715))

(declare-fun m!1354717 () Bool)

(assert (=> start!125476 m!1354717))

(declare-fun m!1354719 () Bool)

(assert (=> start!125476 m!1354719))

(assert (=> b!1468158 m!1354713))

(assert (=> b!1468158 m!1354713))

(declare-fun m!1354721 () Bool)

(assert (=> b!1468158 m!1354721))

(declare-fun m!1354723 () Bool)

(assert (=> b!1468154 m!1354723))

(assert (=> b!1468152 m!1354713))

(assert (=> b!1468152 m!1354713))

(declare-fun m!1354725 () Bool)

(assert (=> b!1468152 m!1354725))

(assert (=> b!1468152 m!1354725))

(assert (=> b!1468152 m!1354713))

(declare-fun m!1354727 () Bool)

(assert (=> b!1468152 m!1354727))

(declare-fun m!1354729 () Bool)

(assert (=> b!1468157 m!1354729))

(assert (=> b!1468157 m!1354729))

(declare-fun m!1354731 () Bool)

(assert (=> b!1468157 m!1354731))

(declare-fun m!1354733 () Bool)

(assert (=> b!1468156 m!1354733))

(declare-fun m!1354735 () Bool)

(assert (=> b!1468156 m!1354735))

(assert (=> b!1468156 m!1354735))

(declare-fun m!1354737 () Bool)

(assert (=> b!1468156 m!1354737))

(assert (=> b!1468156 m!1354737))

(assert (=> b!1468156 m!1354735))

(declare-fun m!1354739 () Bool)

(assert (=> b!1468156 m!1354739))

(declare-fun m!1354741 () Bool)

(assert (=> b!1468153 m!1354741))

(assert (=> b!1468150 m!1354733))

(declare-fun m!1354743 () Bool)

(assert (=> b!1468150 m!1354743))

(check-sat (not b!1468152) (not b!1468154) (not b!1468156) (not b!1468158) (not start!125476) (not b!1468151) (not b!1468153) (not b!1468157))
(check-sat)
