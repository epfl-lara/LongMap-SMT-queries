; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127328 () Bool)

(assert start!127328)

(declare-fun b!1497147 () Bool)

(declare-fun e!838378 () Bool)

(declare-fun e!838382 () Bool)

(assert (=> b!1497147 (= e!838378 e!838382)))

(declare-fun res!1018505 () Bool)

(assert (=> b!1497147 (=> (not res!1018505) (not e!838382))))

(declare-datatypes ((SeekEntryResult!12422 0))(
  ( (MissingZero!12422 (index!52080 (_ BitVec 32))) (Found!12422 (index!52081 (_ BitVec 32))) (Intermediate!12422 (undefined!13234 Bool) (index!52082 (_ BitVec 32)) (x!133699 (_ BitVec 32))) (Undefined!12422) (MissingVacant!12422 (index!52083 (_ BitVec 32))) )
))
(declare-fun lt!652174 () SeekEntryResult!12422)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1497147 (= res!1018505 (= lt!652174 (Intermediate!12422 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!652177 () (_ BitVec 64))

(declare-datatypes ((array!99784 0))(
  ( (array!99785 (arr!48157 (Array (_ BitVec 32) (_ BitVec 64))) (size!48709 (_ BitVec 32))) )
))
(declare-fun lt!652176 () array!99784)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99784 (_ BitVec 32)) SeekEntryResult!12422)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497147 (= lt!652174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652177 mask!2687) lt!652177 lt!652176 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99784)

(assert (=> b!1497147 (= lt!652177 (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497148 () Bool)

(declare-fun res!1018502 () Bool)

(declare-fun e!838380 () Bool)

(assert (=> b!1497148 (=> (not res!1018502) (not e!838380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497148 (= res!1018502 (validKeyInArray!0 (select (arr!48157 a!2862) i!1006)))))

(declare-fun b!1497149 () Bool)

(declare-fun res!1018506 () Bool)

(assert (=> b!1497149 (=> (not res!1018506) (not e!838380))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1497149 (= res!1018506 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48709 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48709 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48709 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497150 () Bool)

(declare-fun res!1018509 () Bool)

(assert (=> b!1497150 (=> (not res!1018509) (not e!838380))))

(declare-datatypes ((List!34736 0))(
  ( (Nil!34733) (Cons!34732 (h!36130 (_ BitVec 64)) (t!49422 List!34736)) )
))
(declare-fun arrayNoDuplicates!0 (array!99784 (_ BitVec 32) List!34736) Bool)

(assert (=> b!1497150 (= res!1018509 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34733))))

(declare-fun b!1497151 () Bool)

(declare-fun e!838376 () Bool)

(assert (=> b!1497151 (= e!838376 true)))

(declare-fun lt!652173 () SeekEntryResult!12422)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99784 (_ BitVec 32)) SeekEntryResult!12422)

(assert (=> b!1497151 (= lt!652173 (seekEntryOrOpen!0 lt!652177 lt!652176 mask!2687))))

(declare-fun lt!652171 () (_ BitVec 32))

(declare-datatypes ((Unit!50025 0))(
  ( (Unit!50026) )
))
(declare-fun lt!652175 () Unit!50025)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50025)

(assert (=> b!1497151 (= lt!652175 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652171 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497152 () Bool)

(declare-fun res!1018493 () Bool)

(assert (=> b!1497152 (=> (not res!1018493) (not e!838382))))

(declare-fun e!838377 () Bool)

(assert (=> b!1497152 (= res!1018493 e!838377)))

(declare-fun c!138865 () Bool)

(assert (=> b!1497152 (= c!138865 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497154 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99784 (_ BitVec 32)) SeekEntryResult!12422)

(assert (=> b!1497154 (= e!838377 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652177 lt!652176 mask!2687) (seekEntryOrOpen!0 lt!652177 lt!652176 mask!2687)))))

(declare-fun b!1497155 () Bool)

(declare-fun e!838375 () Bool)

(assert (=> b!1497155 (= e!838375 e!838376)))

(declare-fun res!1018508 () Bool)

(assert (=> b!1497155 (=> res!1018508 e!838376)))

(assert (=> b!1497155 (= res!1018508 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652171 #b00000000000000000000000000000000) (bvsge lt!652171 (size!48709 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497155 (= lt!652171 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497156 () Bool)

(declare-fun e!838381 () Bool)

(assert (=> b!1497156 (= e!838381 e!838378)))

(declare-fun res!1018501 () Bool)

(assert (=> b!1497156 (=> (not res!1018501) (not e!838378))))

(declare-fun lt!652172 () SeekEntryResult!12422)

(assert (=> b!1497156 (= res!1018501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48157 a!2862) j!93) mask!2687) (select (arr!48157 a!2862) j!93) a!2862 mask!2687) lt!652172))))

(assert (=> b!1497156 (= lt!652172 (Intermediate!12422 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497157 () Bool)

(declare-fun res!1018507 () Bool)

(assert (=> b!1497157 (=> (not res!1018507) (not e!838380))))

(assert (=> b!1497157 (= res!1018507 (and (= (size!48709 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48709 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48709 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497158 () Bool)

(declare-fun res!1018496 () Bool)

(assert (=> b!1497158 (=> (not res!1018496) (not e!838380))))

(assert (=> b!1497158 (= res!1018496 (validKeyInArray!0 (select (arr!48157 a!2862) j!93)))))

(declare-fun b!1497159 () Bool)

(declare-fun res!1018494 () Bool)

(assert (=> b!1497159 (=> (not res!1018494) (not e!838378))))

(assert (=> b!1497159 (= res!1018494 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48157 a!2862) j!93) a!2862 mask!2687) lt!652172))))

(declare-fun b!1497160 () Bool)

(declare-fun res!1018500 () Bool)

(assert (=> b!1497160 (=> res!1018500 e!838376)))

(declare-fun e!838379 () Bool)

(assert (=> b!1497160 (= res!1018500 e!838379)))

(declare-fun c!138864 () Bool)

(assert (=> b!1497160 (= c!138864 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497161 () Bool)

(assert (=> b!1497161 (= e!838379 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652171 intermediateAfterIndex!19 lt!652177 lt!652176 mask!2687) (seekEntryOrOpen!0 lt!652177 lt!652176 mask!2687))))))

(declare-fun b!1497162 () Bool)

(assert (=> b!1497162 (= e!838379 (not (= lt!652174 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652171 lt!652177 lt!652176 mask!2687))))))

(declare-fun b!1497163 () Bool)

(declare-fun res!1018497 () Bool)

(assert (=> b!1497163 (=> res!1018497 e!838376)))

(assert (=> b!1497163 (= res!1018497 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497164 () Bool)

(assert (=> b!1497164 (= e!838380 e!838381)))

(declare-fun res!1018510 () Bool)

(assert (=> b!1497164 (=> (not res!1018510) (not e!838381))))

(assert (=> b!1497164 (= res!1018510 (= (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497164 (= lt!652176 (array!99785 (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48709 a!2862)))))

(declare-fun b!1497153 () Bool)

(declare-fun res!1018499 () Bool)

(assert (=> b!1497153 (=> res!1018499 e!838376)))

(assert (=> b!1497153 (= res!1018499 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652171 (select (arr!48157 a!2862) j!93) a!2862 mask!2687) lt!652172)))))

(declare-fun res!1018503 () Bool)

(assert (=> start!127328 (=> (not res!1018503) (not e!838380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127328 (= res!1018503 (validMask!0 mask!2687))))

(assert (=> start!127328 e!838380))

(assert (=> start!127328 true))

(declare-fun array_inv!37390 (array!99784) Bool)

(assert (=> start!127328 (array_inv!37390 a!2862)))

(declare-fun b!1497165 () Bool)

(declare-fun res!1018504 () Bool)

(assert (=> b!1497165 (=> (not res!1018504) (not e!838382))))

(assert (=> b!1497165 (= res!1018504 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1497166 () Bool)

(assert (=> b!1497166 (= e!838377 (= lt!652174 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652177 lt!652176 mask!2687)))))

(declare-fun b!1497167 () Bool)

(assert (=> b!1497167 (= e!838382 (not e!838375))))

(declare-fun res!1018498 () Bool)

(assert (=> b!1497167 (=> res!1018498 e!838375)))

(assert (=> b!1497167 (= res!1018498 (or (and (= (select (arr!48157 a!2862) index!646) (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48157 a!2862) index!646) (select (arr!48157 a!2862) j!93))) (= (select (arr!48157 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1497167 (and (= lt!652173 (Found!12422 j!93)) (or (= (select (arr!48157 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48157 a!2862) intermediateBeforeIndex!19) (select (arr!48157 a!2862) j!93))))))

(assert (=> b!1497167 (= lt!652173 (seekEntryOrOpen!0 (select (arr!48157 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99784 (_ BitVec 32)) Bool)

(assert (=> b!1497167 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652178 () Unit!50025)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50025)

(assert (=> b!1497167 (= lt!652178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497168 () Bool)

(declare-fun res!1018495 () Bool)

(assert (=> b!1497168 (=> (not res!1018495) (not e!838380))))

(assert (=> b!1497168 (= res!1018495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!127328 res!1018503) b!1497157))

(assert (= (and b!1497157 res!1018507) b!1497148))

(assert (= (and b!1497148 res!1018502) b!1497158))

(assert (= (and b!1497158 res!1018496) b!1497168))

(assert (= (and b!1497168 res!1018495) b!1497150))

(assert (= (and b!1497150 res!1018509) b!1497149))

(assert (= (and b!1497149 res!1018506) b!1497164))

(assert (= (and b!1497164 res!1018510) b!1497156))

(assert (= (and b!1497156 res!1018501) b!1497159))

(assert (= (and b!1497159 res!1018494) b!1497147))

(assert (= (and b!1497147 res!1018505) b!1497152))

(assert (= (and b!1497152 c!138865) b!1497166))

(assert (= (and b!1497152 (not c!138865)) b!1497154))

(assert (= (and b!1497152 res!1018493) b!1497165))

(assert (= (and b!1497165 res!1018504) b!1497167))

(assert (= (and b!1497167 (not res!1018498)) b!1497155))

(assert (= (and b!1497155 (not res!1018508)) b!1497153))

(assert (= (and b!1497153 (not res!1018499)) b!1497160))

(assert (= (and b!1497160 c!138864) b!1497162))

(assert (= (and b!1497160 (not c!138864)) b!1497161))

(assert (= (and b!1497160 (not res!1018500)) b!1497163))

(assert (= (and b!1497163 (not res!1018497)) b!1497151))

(declare-fun m!1379685 () Bool)

(assert (=> b!1497148 m!1379685))

(assert (=> b!1497148 m!1379685))

(declare-fun m!1379687 () Bool)

(assert (=> b!1497148 m!1379687))

(declare-fun m!1379689 () Bool)

(assert (=> b!1497147 m!1379689))

(assert (=> b!1497147 m!1379689))

(declare-fun m!1379691 () Bool)

(assert (=> b!1497147 m!1379691))

(declare-fun m!1379693 () Bool)

(assert (=> b!1497147 m!1379693))

(declare-fun m!1379695 () Bool)

(assert (=> b!1497147 m!1379695))

(declare-fun m!1379697 () Bool)

(assert (=> b!1497162 m!1379697))

(declare-fun m!1379699 () Bool)

(assert (=> b!1497168 m!1379699))

(declare-fun m!1379701 () Bool)

(assert (=> b!1497151 m!1379701))

(declare-fun m!1379703 () Bool)

(assert (=> b!1497151 m!1379703))

(declare-fun m!1379705 () Bool)

(assert (=> b!1497158 m!1379705))

(assert (=> b!1497158 m!1379705))

(declare-fun m!1379707 () Bool)

(assert (=> b!1497158 m!1379707))

(declare-fun m!1379709 () Bool)

(assert (=> b!1497150 m!1379709))

(declare-fun m!1379711 () Bool)

(assert (=> b!1497154 m!1379711))

(assert (=> b!1497154 m!1379701))

(assert (=> b!1497159 m!1379705))

(assert (=> b!1497159 m!1379705))

(declare-fun m!1379713 () Bool)

(assert (=> b!1497159 m!1379713))

(assert (=> b!1497164 m!1379693))

(declare-fun m!1379715 () Bool)

(assert (=> b!1497164 m!1379715))

(declare-fun m!1379717 () Bool)

(assert (=> b!1497155 m!1379717))

(declare-fun m!1379719 () Bool)

(assert (=> b!1497167 m!1379719))

(assert (=> b!1497167 m!1379693))

(declare-fun m!1379721 () Bool)

(assert (=> b!1497167 m!1379721))

(declare-fun m!1379723 () Bool)

(assert (=> b!1497167 m!1379723))

(declare-fun m!1379725 () Bool)

(assert (=> b!1497167 m!1379725))

(assert (=> b!1497167 m!1379705))

(declare-fun m!1379727 () Bool)

(assert (=> b!1497167 m!1379727))

(declare-fun m!1379729 () Bool)

(assert (=> b!1497167 m!1379729))

(assert (=> b!1497167 m!1379705))

(assert (=> b!1497153 m!1379705))

(assert (=> b!1497153 m!1379705))

(declare-fun m!1379731 () Bool)

(assert (=> b!1497153 m!1379731))

(declare-fun m!1379733 () Bool)

(assert (=> b!1497166 m!1379733))

(assert (=> b!1497156 m!1379705))

(assert (=> b!1497156 m!1379705))

(declare-fun m!1379735 () Bool)

(assert (=> b!1497156 m!1379735))

(assert (=> b!1497156 m!1379735))

(assert (=> b!1497156 m!1379705))

(declare-fun m!1379737 () Bool)

(assert (=> b!1497156 m!1379737))

(declare-fun m!1379739 () Bool)

(assert (=> start!127328 m!1379739))

(declare-fun m!1379741 () Bool)

(assert (=> start!127328 m!1379741))

(declare-fun m!1379743 () Bool)

(assert (=> b!1497161 m!1379743))

(assert (=> b!1497161 m!1379701))

(check-sat (not b!1497151) (not b!1497154) (not b!1497158) (not b!1497153) (not b!1497155) (not b!1497156) (not b!1497150) (not b!1497168) (not b!1497167) (not b!1497162) (not start!127328) (not b!1497161) (not b!1497147) (not b!1497166) (not b!1497148) (not b!1497159))
(check-sat)
