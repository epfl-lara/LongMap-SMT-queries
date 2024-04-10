; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124694 () Bool)

(assert start!124694)

(declare-fun b!1445153 () Bool)

(declare-fun res!977067 () Bool)

(declare-fun e!814125 () Bool)

(assert (=> b!1445153 (=> (not res!977067) (not e!814125))))

(declare-datatypes ((array!98142 0))(
  ( (array!98143 (arr!47359 (Array (_ BitVec 32) (_ BitVec 64))) (size!47909 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98142)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445153 (= res!977067 (validKeyInArray!0 (select (arr!47359 a!2862) j!93)))))

(declare-fun b!1445154 () Bool)

(declare-fun res!977069 () Bool)

(assert (=> b!1445154 (=> (not res!977069) (not e!814125))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445154 (= res!977069 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47909 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47909 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47909 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445155 () Bool)

(declare-fun res!977073 () Bool)

(declare-fun e!814130 () Bool)

(assert (=> b!1445155 (=> (not res!977073) (not e!814130))))

(declare-datatypes ((SeekEntryResult!11611 0))(
  ( (MissingZero!11611 (index!48836 (_ BitVec 32))) (Found!11611 (index!48837 (_ BitVec 32))) (Intermediate!11611 (undefined!12423 Bool) (index!48838 (_ BitVec 32)) (x!130524 (_ BitVec 32))) (Undefined!11611) (MissingVacant!11611 (index!48839 (_ BitVec 32))) )
))
(declare-fun lt!634412 () SeekEntryResult!11611)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98142 (_ BitVec 32)) SeekEntryResult!11611)

(assert (=> b!1445155 (= res!977073 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47359 a!2862) j!93) a!2862 mask!2687) lt!634412))))

(declare-fun b!1445156 () Bool)

(declare-fun e!814127 () Bool)

(assert (=> b!1445156 (= e!814125 e!814127)))

(declare-fun res!977063 () Bool)

(assert (=> b!1445156 (=> (not res!977063) (not e!814127))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445156 (= res!977063 (= (select (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634416 () array!98142)

(assert (=> b!1445156 (= lt!634416 (array!98143 (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47909 a!2862)))))

(declare-fun b!1445157 () Bool)

(declare-fun res!977068 () Bool)

(declare-fun e!814129 () Bool)

(assert (=> b!1445157 (=> (not res!977068) (not e!814129))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98142 (_ BitVec 32)) SeekEntryResult!11611)

(assert (=> b!1445157 (= res!977068 (= (seekEntryOrOpen!0 (select (arr!47359 a!2862) j!93) a!2862 mask!2687) (Found!11611 j!93)))))

(declare-fun b!1445158 () Bool)

(declare-fun res!977071 () Bool)

(assert (=> b!1445158 (=> (not res!977071) (not e!814125))))

(declare-datatypes ((List!33860 0))(
  ( (Nil!33857) (Cons!33856 (h!35206 (_ BitVec 64)) (t!48554 List!33860)) )
))
(declare-fun arrayNoDuplicates!0 (array!98142 (_ BitVec 32) List!33860) Bool)

(assert (=> b!1445158 (= res!977071 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33857))))

(declare-fun b!1445159 () Bool)

(declare-fun res!977060 () Bool)

(assert (=> b!1445159 (=> (not res!977060) (not e!814125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98142 (_ BitVec 32)) Bool)

(assert (=> b!1445159 (= res!977060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!814126 () Bool)

(declare-fun lt!634413 () (_ BitVec 64))

(declare-fun b!1445160 () Bool)

(declare-fun lt!634415 () SeekEntryResult!11611)

(assert (=> b!1445160 (= e!814126 (= lt!634415 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634413 lt!634416 mask!2687)))))

(declare-fun b!1445162 () Bool)

(declare-fun res!977070 () Bool)

(assert (=> b!1445162 (=> (not res!977070) (not e!814125))))

(assert (=> b!1445162 (= res!977070 (and (= (size!47909 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47909 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47909 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445163 () Bool)

(declare-fun res!977062 () Bool)

(declare-fun e!814124 () Bool)

(assert (=> b!1445163 (=> (not res!977062) (not e!814124))))

(assert (=> b!1445163 (= res!977062 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445164 () Bool)

(assert (=> b!1445164 (= e!814130 e!814124)))

(declare-fun res!977074 () Bool)

(assert (=> b!1445164 (=> (not res!977074) (not e!814124))))

(assert (=> b!1445164 (= res!977074 (= lt!634415 (Intermediate!11611 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445164 (= lt!634415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634413 mask!2687) lt!634413 lt!634416 mask!2687))))

(assert (=> b!1445164 (= lt!634413 (select (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445165 () Bool)

(assert (=> b!1445165 (= e!814127 e!814130)))

(declare-fun res!977066 () Bool)

(assert (=> b!1445165 (=> (not res!977066) (not e!814130))))

(assert (=> b!1445165 (= res!977066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47359 a!2862) j!93) mask!2687) (select (arr!47359 a!2862) j!93) a!2862 mask!2687) lt!634412))))

(assert (=> b!1445165 (= lt!634412 (Intermediate!11611 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445166 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98142 (_ BitVec 32)) SeekEntryResult!11611)

(assert (=> b!1445166 (= e!814126 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634413 lt!634416 mask!2687) (seekEntryOrOpen!0 lt!634413 lt!634416 mask!2687)))))

(declare-fun b!1445167 () Bool)

(declare-fun res!977065 () Bool)

(assert (=> b!1445167 (=> (not res!977065) (not e!814125))))

(assert (=> b!1445167 (= res!977065 (validKeyInArray!0 (select (arr!47359 a!2862) i!1006)))))

(declare-fun b!1445168 () Bool)

(assert (=> b!1445168 (= e!814124 (not true))))

(assert (=> b!1445168 e!814129))

(declare-fun res!977061 () Bool)

(assert (=> b!1445168 (=> (not res!977061) (not e!814129))))

(assert (=> b!1445168 (= res!977061 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48718 0))(
  ( (Unit!48719) )
))
(declare-fun lt!634414 () Unit!48718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48718)

(assert (=> b!1445168 (= lt!634414 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445169 () Bool)

(declare-fun res!977064 () Bool)

(assert (=> b!1445169 (=> (not res!977064) (not e!814124))))

(assert (=> b!1445169 (= res!977064 e!814126)))

(declare-fun c!133557 () Bool)

(assert (=> b!1445169 (= c!133557 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445161 () Bool)

(assert (=> b!1445161 (= e!814129 (or (= (select (arr!47359 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47359 a!2862) intermediateBeforeIndex!19) (select (arr!47359 a!2862) j!93))))))

(declare-fun res!977072 () Bool)

(assert (=> start!124694 (=> (not res!977072) (not e!814125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124694 (= res!977072 (validMask!0 mask!2687))))

(assert (=> start!124694 e!814125))

(assert (=> start!124694 true))

(declare-fun array_inv!36387 (array!98142) Bool)

(assert (=> start!124694 (array_inv!36387 a!2862)))

(assert (= (and start!124694 res!977072) b!1445162))

(assert (= (and b!1445162 res!977070) b!1445167))

(assert (= (and b!1445167 res!977065) b!1445153))

(assert (= (and b!1445153 res!977067) b!1445159))

(assert (= (and b!1445159 res!977060) b!1445158))

(assert (= (and b!1445158 res!977071) b!1445154))

(assert (= (and b!1445154 res!977069) b!1445156))

(assert (= (and b!1445156 res!977063) b!1445165))

(assert (= (and b!1445165 res!977066) b!1445155))

(assert (= (and b!1445155 res!977073) b!1445164))

(assert (= (and b!1445164 res!977074) b!1445169))

(assert (= (and b!1445169 c!133557) b!1445160))

(assert (= (and b!1445169 (not c!133557)) b!1445166))

(assert (= (and b!1445169 res!977064) b!1445163))

(assert (= (and b!1445163 res!977062) b!1445168))

(assert (= (and b!1445168 res!977061) b!1445157))

(assert (= (and b!1445157 res!977068) b!1445161))

(declare-fun m!1334127 () Bool)

(assert (=> b!1445160 m!1334127))

(declare-fun m!1334129 () Bool)

(assert (=> b!1445165 m!1334129))

(assert (=> b!1445165 m!1334129))

(declare-fun m!1334131 () Bool)

(assert (=> b!1445165 m!1334131))

(assert (=> b!1445165 m!1334131))

(assert (=> b!1445165 m!1334129))

(declare-fun m!1334133 () Bool)

(assert (=> b!1445165 m!1334133))

(declare-fun m!1334135 () Bool)

(assert (=> b!1445156 m!1334135))

(declare-fun m!1334137 () Bool)

(assert (=> b!1445156 m!1334137))

(declare-fun m!1334139 () Bool)

(assert (=> b!1445168 m!1334139))

(declare-fun m!1334141 () Bool)

(assert (=> b!1445168 m!1334141))

(assert (=> b!1445155 m!1334129))

(assert (=> b!1445155 m!1334129))

(declare-fun m!1334143 () Bool)

(assert (=> b!1445155 m!1334143))

(declare-fun m!1334145 () Bool)

(assert (=> b!1445159 m!1334145))

(declare-fun m!1334147 () Bool)

(assert (=> b!1445167 m!1334147))

(assert (=> b!1445167 m!1334147))

(declare-fun m!1334149 () Bool)

(assert (=> b!1445167 m!1334149))

(declare-fun m!1334151 () Bool)

(assert (=> b!1445164 m!1334151))

(assert (=> b!1445164 m!1334151))

(declare-fun m!1334153 () Bool)

(assert (=> b!1445164 m!1334153))

(assert (=> b!1445164 m!1334135))

(declare-fun m!1334155 () Bool)

(assert (=> b!1445164 m!1334155))

(declare-fun m!1334157 () Bool)

(assert (=> start!124694 m!1334157))

(declare-fun m!1334159 () Bool)

(assert (=> start!124694 m!1334159))

(declare-fun m!1334161 () Bool)

(assert (=> b!1445161 m!1334161))

(assert (=> b!1445161 m!1334129))

(declare-fun m!1334163 () Bool)

(assert (=> b!1445166 m!1334163))

(declare-fun m!1334165 () Bool)

(assert (=> b!1445166 m!1334165))

(assert (=> b!1445153 m!1334129))

(assert (=> b!1445153 m!1334129))

(declare-fun m!1334167 () Bool)

(assert (=> b!1445153 m!1334167))

(assert (=> b!1445157 m!1334129))

(assert (=> b!1445157 m!1334129))

(declare-fun m!1334169 () Bool)

(assert (=> b!1445157 m!1334169))

(declare-fun m!1334171 () Bool)

(assert (=> b!1445158 m!1334171))

(push 1)

(assert (not b!1445167))

