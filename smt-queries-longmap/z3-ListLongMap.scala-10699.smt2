; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125610 () Bool)

(assert start!125610)

(declare-fun b!1466137 () Bool)

(declare-fun e!824041 () Bool)

(declare-fun e!824038 () Bool)

(assert (=> b!1466137 (= e!824041 e!824038)))

(declare-fun res!994117 () Bool)

(assert (=> b!1466137 (=> (not res!994117) (not e!824038))))

(declare-datatypes ((SeekEntryResult!11880 0))(
  ( (MissingZero!11880 (index!49912 (_ BitVec 32))) (Found!11880 (index!49913 (_ BitVec 32))) (Intermediate!11880 (undefined!12692 Bool) (index!49914 (_ BitVec 32)) (x!131682 (_ BitVec 32))) (Undefined!11880) (MissingVacant!11880 (index!49915 (_ BitVec 32))) )
))
(declare-fun lt!641719 () SeekEntryResult!11880)

(declare-datatypes ((array!98896 0))(
  ( (array!98897 (arr!47731 (Array (_ BitVec 32) (_ BitVec 64))) (size!48282 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98896)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98896 (_ BitVec 32)) SeekEntryResult!11880)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466137 (= res!994117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47731 a!2862) j!93) mask!2687) (select (arr!47731 a!2862) j!93) a!2862 mask!2687) lt!641719))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466137 (= lt!641719 (Intermediate!11880 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466138 () Bool)

(declare-fun res!994123 () Bool)

(declare-fun e!824039 () Bool)

(assert (=> b!1466138 (=> (not res!994123) (not e!824039))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466138 (= res!994123 (and (= (size!48282 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48282 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48282 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466139 () Bool)

(declare-fun e!824035 () Bool)

(assert (=> b!1466139 (= e!824038 e!824035)))

(declare-fun res!994120 () Bool)

(assert (=> b!1466139 (=> (not res!994120) (not e!824035))))

(declare-fun lt!641725 () SeekEntryResult!11880)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466139 (= res!994120 (= lt!641725 (Intermediate!11880 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641723 () array!98896)

(declare-fun lt!641721 () (_ BitVec 64))

(assert (=> b!1466139 (= lt!641725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641721 mask!2687) lt!641721 lt!641723 mask!2687))))

(assert (=> b!1466139 (= lt!641721 (select (store (arr!47731 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466140 () Bool)

(declare-fun res!994124 () Bool)

(declare-fun e!824034 () Bool)

(assert (=> b!1466140 (=> (not res!994124) (not e!824034))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98896 (_ BitVec 32)) SeekEntryResult!11880)

(assert (=> b!1466140 (= res!994124 (= (seekEntryOrOpen!0 (select (arr!47731 a!2862) j!93) a!2862 mask!2687) (Found!11880 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!824040 () Bool)

(declare-fun b!1466141 () Bool)

(declare-fun lt!641722 () (_ BitVec 32))

(assert (=> b!1466141 (= e!824040 (not (= lt!641725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641722 lt!641721 lt!641723 mask!2687))))))

(declare-fun b!1466142 () Bool)

(declare-fun e!824043 () Bool)

(assert (=> b!1466142 (= e!824035 (not e!824043))))

(declare-fun res!994111 () Bool)

(assert (=> b!1466142 (=> res!994111 e!824043)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1466142 (= res!994111 (or (and (= (select (arr!47731 a!2862) index!646) (select (store (arr!47731 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47731 a!2862) index!646) (select (arr!47731 a!2862) j!93))) (= (select (arr!47731 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466142 e!824034))

(declare-fun res!994110 () Bool)

(assert (=> b!1466142 (=> (not res!994110) (not e!824034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98896 (_ BitVec 32)) Bool)

(assert (=> b!1466142 (= res!994110 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49289 0))(
  ( (Unit!49290) )
))
(declare-fun lt!641724 () Unit!49289)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49289)

(assert (=> b!1466142 (= lt!641724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466143 () Bool)

(declare-fun e!824037 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98896 (_ BitVec 32)) SeekEntryResult!11880)

(assert (=> b!1466143 (= e!824037 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641721 lt!641723 mask!2687) (seekEntryOrOpen!0 lt!641721 lt!641723 mask!2687)))))

(declare-fun res!994125 () Bool)

(assert (=> start!125610 (=> (not res!994125) (not e!824039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125610 (= res!994125 (validMask!0 mask!2687))))

(assert (=> start!125610 e!824039))

(assert (=> start!125610 true))

(declare-fun array_inv!37012 (array!98896) Bool)

(assert (=> start!125610 (array_inv!37012 a!2862)))

(declare-fun b!1466144 () Bool)

(declare-fun res!994116 () Bool)

(assert (=> b!1466144 (=> (not res!994116) (not e!824038))))

(assert (=> b!1466144 (= res!994116 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47731 a!2862) j!93) a!2862 mask!2687) lt!641719))))

(declare-fun b!1466145 () Bool)

(declare-fun res!994114 () Bool)

(assert (=> b!1466145 (=> (not res!994114) (not e!824035))))

(assert (=> b!1466145 (= res!994114 e!824037)))

(declare-fun c!135534 () Bool)

(assert (=> b!1466145 (= c!135534 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466146 () Bool)

(declare-fun res!994113 () Bool)

(assert (=> b!1466146 (=> (not res!994113) (not e!824039))))

(assert (=> b!1466146 (= res!994113 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48282 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48282 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48282 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466147 () Bool)

(assert (=> b!1466147 (= e!824039 e!824041)))

(declare-fun res!994118 () Bool)

(assert (=> b!1466147 (=> (not res!994118) (not e!824041))))

(assert (=> b!1466147 (= res!994118 (= (select (store (arr!47731 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466147 (= lt!641723 (array!98897 (store (arr!47731 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48282 a!2862)))))

(declare-fun b!1466148 () Bool)

(declare-fun res!994122 () Bool)

(assert (=> b!1466148 (=> (not res!994122) (not e!824039))))

(declare-datatypes ((List!34219 0))(
  ( (Nil!34216) (Cons!34215 (h!35579 (_ BitVec 64)) (t!48905 List!34219)) )
))
(declare-fun arrayNoDuplicates!0 (array!98896 (_ BitVec 32) List!34219) Bool)

(assert (=> b!1466148 (= res!994122 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34216))))

(declare-fun b!1466149 () Bool)

(declare-fun res!994112 () Bool)

(assert (=> b!1466149 (=> (not res!994112) (not e!824035))))

(assert (=> b!1466149 (= res!994112 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466150 () Bool)

(assert (=> b!1466150 (= e!824034 (or (= (select (arr!47731 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47731 a!2862) intermediateBeforeIndex!19) (select (arr!47731 a!2862) j!93))))))

(declare-fun b!1466151 () Bool)

(assert (=> b!1466151 (= e!824040 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641722 intermediateAfterIndex!19 lt!641721 lt!641723 mask!2687) (seekEntryOrOpen!0 lt!641721 lt!641723 mask!2687))))))

(declare-fun b!1466152 () Bool)

(declare-fun res!994127 () Bool)

(assert (=> b!1466152 (=> (not res!994127) (not e!824039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466152 (= res!994127 (validKeyInArray!0 (select (arr!47731 a!2862) i!1006)))))

(declare-fun b!1466153 () Bool)

(declare-fun res!994121 () Bool)

(assert (=> b!1466153 (=> (not res!994121) (not e!824039))))

(assert (=> b!1466153 (= res!994121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466154 () Bool)

(declare-fun e!824036 () Bool)

(assert (=> b!1466154 (= e!824043 e!824036)))

(declare-fun res!994115 () Bool)

(assert (=> b!1466154 (=> res!994115 e!824036)))

(assert (=> b!1466154 (= res!994115 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641722 #b00000000000000000000000000000000) (bvsge lt!641722 (size!48282 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466154 (= lt!641722 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1466155 () Bool)

(declare-fun res!994119 () Bool)

(assert (=> b!1466155 (=> (not res!994119) (not e!824039))))

(assert (=> b!1466155 (= res!994119 (validKeyInArray!0 (select (arr!47731 a!2862) j!93)))))

(declare-fun b!1466156 () Bool)

(assert (=> b!1466156 (= e!824037 (= lt!641725 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641721 lt!641723 mask!2687)))))

(declare-fun b!1466157 () Bool)

(declare-fun res!994126 () Bool)

(assert (=> b!1466157 (=> res!994126 e!824036)))

(assert (=> b!1466157 (= res!994126 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641722 (select (arr!47731 a!2862) j!93) a!2862 mask!2687) lt!641719)))))

(declare-fun b!1466158 () Bool)

(assert (=> b!1466158 (= e!824036 true)))

(declare-fun lt!641720 () Bool)

(assert (=> b!1466158 (= lt!641720 e!824040)))

(declare-fun c!135535 () Bool)

(assert (=> b!1466158 (= c!135535 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125610 res!994125) b!1466138))

(assert (= (and b!1466138 res!994123) b!1466152))

(assert (= (and b!1466152 res!994127) b!1466155))

(assert (= (and b!1466155 res!994119) b!1466153))

(assert (= (and b!1466153 res!994121) b!1466148))

(assert (= (and b!1466148 res!994122) b!1466146))

(assert (= (and b!1466146 res!994113) b!1466147))

(assert (= (and b!1466147 res!994118) b!1466137))

(assert (= (and b!1466137 res!994117) b!1466144))

(assert (= (and b!1466144 res!994116) b!1466139))

(assert (= (and b!1466139 res!994120) b!1466145))

(assert (= (and b!1466145 c!135534) b!1466156))

(assert (= (and b!1466145 (not c!135534)) b!1466143))

(assert (= (and b!1466145 res!994114) b!1466149))

(assert (= (and b!1466149 res!994112) b!1466142))

(assert (= (and b!1466142 res!994110) b!1466140))

(assert (= (and b!1466140 res!994124) b!1466150))

(assert (= (and b!1466142 (not res!994111)) b!1466154))

(assert (= (and b!1466154 (not res!994115)) b!1466157))

(assert (= (and b!1466157 (not res!994126)) b!1466158))

(assert (= (and b!1466158 c!135535) b!1466141))

(assert (= (and b!1466158 (not c!135535)) b!1466151))

(declare-fun m!1353331 () Bool)

(assert (=> b!1466150 m!1353331))

(declare-fun m!1353333 () Bool)

(assert (=> b!1466150 m!1353333))

(declare-fun m!1353335 () Bool)

(assert (=> b!1466151 m!1353335))

(declare-fun m!1353337 () Bool)

(assert (=> b!1466151 m!1353337))

(declare-fun m!1353339 () Bool)

(assert (=> b!1466142 m!1353339))

(declare-fun m!1353341 () Bool)

(assert (=> b!1466142 m!1353341))

(declare-fun m!1353343 () Bool)

(assert (=> b!1466142 m!1353343))

(declare-fun m!1353345 () Bool)

(assert (=> b!1466142 m!1353345))

(declare-fun m!1353347 () Bool)

(assert (=> b!1466142 m!1353347))

(assert (=> b!1466142 m!1353333))

(declare-fun m!1353349 () Bool)

(assert (=> b!1466148 m!1353349))

(declare-fun m!1353351 () Bool)

(assert (=> b!1466156 m!1353351))

(assert (=> b!1466147 m!1353341))

(declare-fun m!1353353 () Bool)

(assert (=> b!1466147 m!1353353))

(assert (=> b!1466157 m!1353333))

(assert (=> b!1466157 m!1353333))

(declare-fun m!1353355 () Bool)

(assert (=> b!1466157 m!1353355))

(declare-fun m!1353357 () Bool)

(assert (=> b!1466141 m!1353357))

(declare-fun m!1353359 () Bool)

(assert (=> b!1466153 m!1353359))

(declare-fun m!1353361 () Bool)

(assert (=> b!1466139 m!1353361))

(assert (=> b!1466139 m!1353361))

(declare-fun m!1353363 () Bool)

(assert (=> b!1466139 m!1353363))

(assert (=> b!1466139 m!1353341))

(declare-fun m!1353365 () Bool)

(assert (=> b!1466139 m!1353365))

(declare-fun m!1353367 () Bool)

(assert (=> b!1466154 m!1353367))

(assert (=> b!1466144 m!1353333))

(assert (=> b!1466144 m!1353333))

(declare-fun m!1353369 () Bool)

(assert (=> b!1466144 m!1353369))

(declare-fun m!1353371 () Bool)

(assert (=> b!1466152 m!1353371))

(assert (=> b!1466152 m!1353371))

(declare-fun m!1353373 () Bool)

(assert (=> b!1466152 m!1353373))

(assert (=> b!1466137 m!1353333))

(assert (=> b!1466137 m!1353333))

(declare-fun m!1353375 () Bool)

(assert (=> b!1466137 m!1353375))

(assert (=> b!1466137 m!1353375))

(assert (=> b!1466137 m!1353333))

(declare-fun m!1353377 () Bool)

(assert (=> b!1466137 m!1353377))

(declare-fun m!1353379 () Bool)

(assert (=> start!125610 m!1353379))

(declare-fun m!1353381 () Bool)

(assert (=> start!125610 m!1353381))

(assert (=> b!1466155 m!1353333))

(assert (=> b!1466155 m!1353333))

(declare-fun m!1353383 () Bool)

(assert (=> b!1466155 m!1353383))

(assert (=> b!1466140 m!1353333))

(assert (=> b!1466140 m!1353333))

(declare-fun m!1353385 () Bool)

(assert (=> b!1466140 m!1353385))

(declare-fun m!1353387 () Bool)

(assert (=> b!1466143 m!1353387))

(assert (=> b!1466143 m!1353337))

(check-sat (not b!1466137) (not b!1466153) (not b!1466142) (not b!1466139) (not b!1466155) (not b!1466140) (not b!1466151) (not start!125610) (not b!1466144) (not b!1466141) (not b!1466148) (not b!1466143) (not b!1466157) (not b!1466154) (not b!1466152) (not b!1466156))
(check-sat)
