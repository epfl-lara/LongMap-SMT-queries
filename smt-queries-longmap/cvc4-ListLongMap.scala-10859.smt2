; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127202 () Bool)

(assert start!127202)

(declare-fun b!1495140 () Bool)

(declare-fun res!1017188 () Bool)

(declare-fun e!837461 () Bool)

(assert (=> b!1495140 (=> res!1017188 e!837461)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12400 0))(
  ( (MissingZero!12400 (index!51992 (_ BitVec 32))) (Found!12400 (index!51993 (_ BitVec 32))) (Intermediate!12400 (undefined!13212 Bool) (index!51994 (_ BitVec 32)) (x!133596 (_ BitVec 32))) (Undefined!12400) (MissingVacant!12400 (index!51995 (_ BitVec 32))) )
))
(declare-fun lt!651624 () SeekEntryResult!12400)

(declare-fun lt!651622 () (_ BitVec 32))

(declare-datatypes ((array!99786 0))(
  ( (array!99787 (arr!48160 (Array (_ BitVec 32) (_ BitVec 64))) (size!48710 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99786)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99786 (_ BitVec 32)) SeekEntryResult!12400)

(assert (=> b!1495140 (= res!1017188 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651622 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!651624)))))

(declare-fun b!1495141 () Bool)

(declare-fun e!837455 () Bool)

(assert (=> b!1495141 (= e!837455 e!837461)))

(declare-fun res!1017186 () Bool)

(assert (=> b!1495141 (=> res!1017186 e!837461)))

(assert (=> b!1495141 (= res!1017186 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651622 #b00000000000000000000000000000000) (bvsge lt!651622 (size!48710 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495141 (= lt!651622 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1495143 () Bool)

(declare-fun res!1017189 () Bool)

(declare-fun e!837459 () Bool)

(assert (=> b!1495143 (=> (not res!1017189) (not e!837459))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1495143 (= res!1017189 (and (= (size!48710 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48710 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48710 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495144 () Bool)

(declare-fun res!1017190 () Bool)

(assert (=> b!1495144 (=> (not res!1017190) (not e!837459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99786 (_ BitVec 32)) Bool)

(assert (=> b!1495144 (= res!1017190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495145 () Bool)

(declare-fun res!1017181 () Bool)

(assert (=> b!1495145 (=> (not res!1017181) (not e!837459))))

(declare-datatypes ((List!34661 0))(
  ( (Nil!34658) (Cons!34657 (h!36049 (_ BitVec 64)) (t!49355 List!34661)) )
))
(declare-fun arrayNoDuplicates!0 (array!99786 (_ BitVec 32) List!34661) Bool)

(assert (=> b!1495145 (= res!1017181 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34658))))

(declare-fun b!1495146 () Bool)

(declare-fun res!1017180 () Bool)

(declare-fun e!837453 () Bool)

(assert (=> b!1495146 (=> (not res!1017180) (not e!837453))))

(assert (=> b!1495146 (= res!1017180 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!651624))))

(declare-fun b!1495147 () Bool)

(declare-fun e!837452 () Bool)

(assert (=> b!1495147 (= e!837452 e!837453)))

(declare-fun res!1017182 () Bool)

(assert (=> b!1495147 (=> (not res!1017182) (not e!837453))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495147 (= res!1017182 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687) (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!651624))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495147 (= lt!651624 (Intermediate!12400 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495148 () Bool)

(declare-fun e!837460 () Bool)

(assert (=> b!1495148 (= e!837461 e!837460)))

(declare-fun c!138512 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495148 (= c!138512 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1495149 () Bool)

(declare-fun lt!651625 () (_ BitVec 64))

(declare-fun lt!651626 () array!99786)

(declare-fun lt!651627 () SeekEntryResult!12400)

(assert (=> b!1495149 (= e!837460 (= lt!651627 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651622 lt!651625 lt!651626 mask!2687)))))

(declare-fun b!1495150 () Bool)

(declare-fun e!837458 () Bool)

(assert (=> b!1495150 (= e!837453 e!837458)))

(declare-fun res!1017194 () Bool)

(assert (=> b!1495150 (=> (not res!1017194) (not e!837458))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495150 (= res!1017194 (= lt!651627 (Intermediate!12400 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1495150 (= lt!651627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651625 mask!2687) lt!651625 lt!651626 mask!2687))))

(assert (=> b!1495150 (= lt!651625 (select (store (arr!48160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!837454 () Bool)

(declare-fun b!1495151 () Bool)

(assert (=> b!1495151 (= e!837454 (= lt!651627 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651625 lt!651626 mask!2687)))))

(declare-fun b!1495152 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99786 (_ BitVec 32)) SeekEntryResult!12400)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99786 (_ BitVec 32)) SeekEntryResult!12400)

(assert (=> b!1495152 (= e!837454 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651625 lt!651626 mask!2687) (seekEntryOrOpen!0 lt!651625 lt!651626 mask!2687)))))

(declare-fun b!1495153 () Bool)

(declare-fun res!1017184 () Bool)

(assert (=> b!1495153 (=> (not res!1017184) (not e!837458))))

(assert (=> b!1495153 (= res!1017184 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495154 () Bool)

(declare-fun res!1017195 () Bool)

(assert (=> b!1495154 (=> (not res!1017195) (not e!837459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495154 (= res!1017195 (validKeyInArray!0 (select (arr!48160 a!2862) i!1006)))))

(declare-fun b!1495155 () Bool)

(declare-fun res!1017191 () Bool)

(assert (=> b!1495155 (=> (not res!1017191) (not e!837458))))

(assert (=> b!1495155 (= res!1017191 e!837454)))

(declare-fun c!138513 () Bool)

(assert (=> b!1495155 (= c!138513 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495142 () Bool)

(declare-fun res!1017193 () Bool)

(assert (=> b!1495142 (=> (not res!1017193) (not e!837459))))

(assert (=> b!1495142 (= res!1017193 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48710 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48710 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48710 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1017192 () Bool)

(assert (=> start!127202 (=> (not res!1017192) (not e!837459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127202 (= res!1017192 (validMask!0 mask!2687))))

(assert (=> start!127202 e!837459))

(assert (=> start!127202 true))

(declare-fun array_inv!37188 (array!99786) Bool)

(assert (=> start!127202 (array_inv!37188 a!2862)))

(declare-fun b!1495156 () Bool)

(declare-fun res!1017183 () Bool)

(assert (=> b!1495156 (=> (not res!1017183) (not e!837459))))

(assert (=> b!1495156 (= res!1017183 (validKeyInArray!0 (select (arr!48160 a!2862) j!93)))))

(declare-fun b!1495157 () Bool)

(declare-fun res!1017179 () Bool)

(declare-fun e!837456 () Bool)

(assert (=> b!1495157 (=> (not res!1017179) (not e!837456))))

(assert (=> b!1495157 (= res!1017179 (= (seekEntryOrOpen!0 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) (Found!12400 j!93)))))

(declare-fun b!1495158 () Bool)

(assert (=> b!1495158 (= e!837456 (or (= (select (arr!48160 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48160 a!2862) intermediateBeforeIndex!19) (select (arr!48160 a!2862) j!93))))))

(declare-fun b!1495159 () Bool)

(assert (=> b!1495159 (= e!837459 e!837452)))

(declare-fun res!1017187 () Bool)

(assert (=> b!1495159 (=> (not res!1017187) (not e!837452))))

(assert (=> b!1495159 (= res!1017187 (= (select (store (arr!48160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495159 (= lt!651626 (array!99787 (store (arr!48160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48710 a!2862)))))

(declare-fun b!1495160 () Bool)

(assert (=> b!1495160 (= e!837460 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651622 intermediateAfterIndex!19 lt!651625 lt!651626 mask!2687) (seekEntryOrOpen!0 lt!651625 lt!651626 mask!2687)))))

(declare-fun b!1495161 () Bool)

(assert (=> b!1495161 (= e!837458 (not e!837455))))

(declare-fun res!1017196 () Bool)

(assert (=> b!1495161 (=> res!1017196 e!837455)))

(assert (=> b!1495161 (= res!1017196 (or (and (= (select (arr!48160 a!2862) index!646) (select (store (arr!48160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48160 a!2862) index!646) (select (arr!48160 a!2862) j!93))) (= (select (arr!48160 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495161 e!837456))

(declare-fun res!1017185 () Bool)

(assert (=> b!1495161 (=> (not res!1017185) (not e!837456))))

(assert (=> b!1495161 (= res!1017185 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50140 0))(
  ( (Unit!50141) )
))
(declare-fun lt!651623 () Unit!50140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50140)

(assert (=> b!1495161 (= lt!651623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!127202 res!1017192) b!1495143))

(assert (= (and b!1495143 res!1017189) b!1495154))

(assert (= (and b!1495154 res!1017195) b!1495156))

(assert (= (and b!1495156 res!1017183) b!1495144))

(assert (= (and b!1495144 res!1017190) b!1495145))

(assert (= (and b!1495145 res!1017181) b!1495142))

(assert (= (and b!1495142 res!1017193) b!1495159))

(assert (= (and b!1495159 res!1017187) b!1495147))

(assert (= (and b!1495147 res!1017182) b!1495146))

(assert (= (and b!1495146 res!1017180) b!1495150))

(assert (= (and b!1495150 res!1017194) b!1495155))

(assert (= (and b!1495155 c!138513) b!1495151))

(assert (= (and b!1495155 (not c!138513)) b!1495152))

(assert (= (and b!1495155 res!1017191) b!1495153))

(assert (= (and b!1495153 res!1017184) b!1495161))

(assert (= (and b!1495161 res!1017185) b!1495157))

(assert (= (and b!1495157 res!1017179) b!1495158))

(assert (= (and b!1495161 (not res!1017196)) b!1495141))

(assert (= (and b!1495141 (not res!1017186)) b!1495140))

(assert (= (and b!1495140 (not res!1017188)) b!1495148))

(assert (= (and b!1495148 c!138512) b!1495149))

(assert (= (and b!1495148 (not c!138512)) b!1495160))

(declare-fun m!1378701 () Bool)

(assert (=> b!1495159 m!1378701))

(declare-fun m!1378703 () Bool)

(assert (=> b!1495159 m!1378703))

(declare-fun m!1378705 () Bool)

(assert (=> b!1495149 m!1378705))

(declare-fun m!1378707 () Bool)

(assert (=> b!1495152 m!1378707))

(declare-fun m!1378709 () Bool)

(assert (=> b!1495152 m!1378709))

(declare-fun m!1378711 () Bool)

(assert (=> start!127202 m!1378711))

(declare-fun m!1378713 () Bool)

(assert (=> start!127202 m!1378713))

(declare-fun m!1378715 () Bool)

(assert (=> b!1495158 m!1378715))

(declare-fun m!1378717 () Bool)

(assert (=> b!1495158 m!1378717))

(assert (=> b!1495156 m!1378717))

(assert (=> b!1495156 m!1378717))

(declare-fun m!1378719 () Bool)

(assert (=> b!1495156 m!1378719))

(declare-fun m!1378721 () Bool)

(assert (=> b!1495150 m!1378721))

(assert (=> b!1495150 m!1378721))

(declare-fun m!1378723 () Bool)

(assert (=> b!1495150 m!1378723))

(assert (=> b!1495150 m!1378701))

(declare-fun m!1378725 () Bool)

(assert (=> b!1495150 m!1378725))

(assert (=> b!1495146 m!1378717))

(assert (=> b!1495146 m!1378717))

(declare-fun m!1378727 () Bool)

(assert (=> b!1495146 m!1378727))

(declare-fun m!1378729 () Bool)

(assert (=> b!1495161 m!1378729))

(assert (=> b!1495161 m!1378701))

(declare-fun m!1378731 () Bool)

(assert (=> b!1495161 m!1378731))

(declare-fun m!1378733 () Bool)

(assert (=> b!1495161 m!1378733))

(declare-fun m!1378735 () Bool)

(assert (=> b!1495161 m!1378735))

(assert (=> b!1495161 m!1378717))

(declare-fun m!1378737 () Bool)

(assert (=> b!1495141 m!1378737))

(declare-fun m!1378739 () Bool)

(assert (=> b!1495145 m!1378739))

(assert (=> b!1495157 m!1378717))

(assert (=> b!1495157 m!1378717))

(declare-fun m!1378741 () Bool)

(assert (=> b!1495157 m!1378741))

(assert (=> b!1495147 m!1378717))

(assert (=> b!1495147 m!1378717))

(declare-fun m!1378743 () Bool)

(assert (=> b!1495147 m!1378743))

(assert (=> b!1495147 m!1378743))

(assert (=> b!1495147 m!1378717))

(declare-fun m!1378745 () Bool)

(assert (=> b!1495147 m!1378745))

(declare-fun m!1378747 () Bool)

(assert (=> b!1495160 m!1378747))

(assert (=> b!1495160 m!1378709))

(assert (=> b!1495140 m!1378717))

(assert (=> b!1495140 m!1378717))

(declare-fun m!1378749 () Bool)

(assert (=> b!1495140 m!1378749))

(declare-fun m!1378751 () Bool)

(assert (=> b!1495154 m!1378751))

(assert (=> b!1495154 m!1378751))

(declare-fun m!1378753 () Bool)

(assert (=> b!1495154 m!1378753))

(declare-fun m!1378755 () Bool)

(assert (=> b!1495151 m!1378755))

(declare-fun m!1378757 () Bool)

(assert (=> b!1495144 m!1378757))

(push 1)

(assert (not b!1495156))

(assert (not b!1495160))

(assert (not start!127202))

(assert (not b!1495154))

(assert (not b!1495140))

(assert (not b!1495145))

(assert (not b!1495152))

(assert (not b!1495157))

(assert (not b!1495151))

(assert (not b!1495146))

(assert (not b!1495147))

(assert (not b!1495161))

(assert (not b!1495149))

(assert (not b!1495141))

(assert (not b!1495150))

(assert (not b!1495144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!837553 () SeekEntryResult!12400)

(declare-fun b!1495316 () Bool)

(declare-fun lt!651686 () SeekEntryResult!12400)

(assert (=> b!1495316 (= e!837553 (seekKeyOrZeroReturnVacant!0 (x!133596 lt!651686) (index!51994 lt!651686) (index!51994 lt!651686) (select (arr!48160 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495317 () Bool)

(declare-fun e!837554 () SeekEntryResult!12400)

(declare-fun e!837555 () SeekEntryResult!12400)

(assert (=> b!1495317 (= e!837554 e!837555)))

(declare-fun lt!651685 () (_ BitVec 64))

(assert (=> b!1495317 (= lt!651685 (select (arr!48160 a!2862) (index!51994 lt!651686)))))

(declare-fun c!138566 () Bool)

(assert (=> b!1495317 (= c!138566 (= lt!651685 (select (arr!48160 a!2862) j!93)))))

(declare-fun b!1495318 () Bool)

(assert (=> b!1495318 (= e!837555 (Found!12400 (index!51994 lt!651686)))))

(declare-fun b!1495319 () Bool)

(declare-fun c!138567 () Bool)

(assert (=> b!1495319 (= c!138567 (= lt!651685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495319 (= e!837555 e!837553)))

(declare-fun d!157209 () Bool)

(declare-fun lt!651687 () SeekEntryResult!12400)

(assert (=> d!157209 (and (or (is-Undefined!12400 lt!651687) (not (is-Found!12400 lt!651687)) (and (bvsge (index!51993 lt!651687) #b00000000000000000000000000000000) (bvslt (index!51993 lt!651687) (size!48710 a!2862)))) (or (is-Undefined!12400 lt!651687) (is-Found!12400 lt!651687) (not (is-MissingZero!12400 lt!651687)) (and (bvsge (index!51992 lt!651687) #b00000000000000000000000000000000) (bvslt (index!51992 lt!651687) (size!48710 a!2862)))) (or (is-Undefined!12400 lt!651687) (is-Found!12400 lt!651687) (is-MissingZero!12400 lt!651687) (not (is-MissingVacant!12400 lt!651687)) (and (bvsge (index!51995 lt!651687) #b00000000000000000000000000000000) (bvslt (index!51995 lt!651687) (size!48710 a!2862)))) (or (is-Undefined!12400 lt!651687) (ite (is-Found!12400 lt!651687) (= (select (arr!48160 a!2862) (index!51993 lt!651687)) (select (arr!48160 a!2862) j!93)) (ite (is-MissingZero!12400 lt!651687) (= (select (arr!48160 a!2862) (index!51992 lt!651687)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12400 lt!651687) (= (select (arr!48160 a!2862) (index!51995 lt!651687)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157209 (= lt!651687 e!837554)))

(declare-fun c!138568 () Bool)

(assert (=> d!157209 (= c!138568 (and (is-Intermediate!12400 lt!651686) (undefined!13212 lt!651686)))))

(assert (=> d!157209 (= lt!651686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687) (select (arr!48160 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157209 (validMask!0 mask!2687)))

(assert (=> d!157209 (= (seekEntryOrOpen!0 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!651687)))

(declare-fun b!1495320 () Bool)

(assert (=> b!1495320 (= e!837553 (MissingZero!12400 (index!51994 lt!651686)))))

(declare-fun b!1495321 () Bool)

(assert (=> b!1495321 (= e!837554 Undefined!12400)))

(assert (= (and d!157209 c!138568) b!1495321))

(assert (= (and d!157209 (not c!138568)) b!1495317))

(assert (= (and b!1495317 c!138566) b!1495318))

(assert (= (and b!1495317 (not c!138566)) b!1495319))

(assert (= (and b!1495319 c!138567) b!1495320))

(assert (= (and b!1495319 (not c!138567)) b!1495316))

(assert (=> b!1495316 m!1378717))

(declare-fun m!1378831 () Bool)

(assert (=> b!1495316 m!1378831))

(declare-fun m!1378833 () Bool)

(assert (=> b!1495317 m!1378833))

(assert (=> d!157209 m!1378717))

(assert (=> d!157209 m!1378743))

(declare-fun m!1378835 () Bool)

(assert (=> d!157209 m!1378835))

(declare-fun m!1378837 () Bool)

(assert (=> d!157209 m!1378837))

(assert (=> d!157209 m!1378743))

(assert (=> d!157209 m!1378717))

(assert (=> d!157209 m!1378745))

(assert (=> d!157209 m!1378711))

(declare-fun m!1378839 () Bool)

(assert (=> d!157209 m!1378839))

(assert (=> b!1495157 d!157209))

(declare-fun d!157217 () Bool)

(assert (=> d!157217 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127202 d!157217))

(declare-fun d!157235 () Bool)

(assert (=> d!157235 (= (array_inv!37188 a!2862) (bvsge (size!48710 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127202 d!157235))

(declare-fun b!1495430 () Bool)

(declare-fun lt!651735 () SeekEntryResult!12400)

(assert (=> b!1495430 (and (bvsge (index!51994 lt!651735) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651735) (size!48710 a!2862)))))

(declare-fun res!1017269 () Bool)

(assert (=> b!1495430 (= res!1017269 (= (select (arr!48160 a!2862) (index!51994 lt!651735)) (select (arr!48160 a!2862) j!93)))))

(declare-fun e!837614 () Bool)

(assert (=> b!1495430 (=> res!1017269 e!837614)))

(declare-fun e!837616 () Bool)

(assert (=> b!1495430 (= e!837616 e!837614)))

(declare-fun b!1495431 () Bool)

(assert (=> b!1495431 (and (bvsge (index!51994 lt!651735) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651735) (size!48710 a!2862)))))

(declare-fun res!1017268 () Bool)

(assert (=> b!1495431 (= res!1017268 (= (select (arr!48160 a!2862) (index!51994 lt!651735)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495431 (=> res!1017268 e!837614)))

(declare-fun b!1495432 () Bool)

(declare-fun e!837615 () SeekEntryResult!12400)

(assert (=> b!1495432 (= e!837615 (Intermediate!12400 true (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun e!837613 () SeekEntryResult!12400)

(declare-fun b!1495433 () Bool)

(assert (=> b!1495433 (= e!837613 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48160 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495434 () Bool)

(assert (=> b!1495434 (= e!837615 e!837613)))

(declare-fun c!138614 () Bool)

(declare-fun lt!651734 () (_ BitVec 64))

(assert (=> b!1495434 (= c!138614 (or (= lt!651734 (select (arr!48160 a!2862) j!93)) (= (bvadd lt!651734 lt!651734) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495435 () Bool)

(assert (=> b!1495435 (and (bvsge (index!51994 lt!651735) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651735) (size!48710 a!2862)))))

(assert (=> b!1495435 (= e!837614 (= (select (arr!48160 a!2862) (index!51994 lt!651735)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!157237 () Bool)

(declare-fun e!837617 () Bool)

(assert (=> d!157237 e!837617))

(declare-fun c!138616 () Bool)

(assert (=> d!157237 (= c!138616 (and (is-Intermediate!12400 lt!651735) (undefined!13212 lt!651735)))))

(assert (=> d!157237 (= lt!651735 e!837615)))

(declare-fun c!138615 () Bool)

(assert (=> d!157237 (= c!138615 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157237 (= lt!651734 (select (arr!48160 a!2862) (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687)))))

(assert (=> d!157237 (validMask!0 mask!2687)))

(assert (=> d!157237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687) (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!651735)))

(declare-fun b!1495436 () Bool)

(assert (=> b!1495436 (= e!837617 e!837616)))

(declare-fun res!1017267 () Bool)

(assert (=> b!1495436 (= res!1017267 (and (is-Intermediate!12400 lt!651735) (not (undefined!13212 lt!651735)) (bvslt (x!133596 lt!651735) #b01111111111111111111111111111110) (bvsge (x!133596 lt!651735) #b00000000000000000000000000000000) (bvsge (x!133596 lt!651735) #b00000000000000000000000000000000)))))

(assert (=> b!1495436 (=> (not res!1017267) (not e!837616))))

(declare-fun b!1495437 () Bool)

(assert (=> b!1495437 (= e!837617 (bvsge (x!133596 lt!651735) #b01111111111111111111111111111110))))

(declare-fun b!1495438 () Bool)

(assert (=> b!1495438 (= e!837613 (Intermediate!12400 false (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157237 c!138615) b!1495432))

(assert (= (and d!157237 (not c!138615)) b!1495434))

(assert (= (and b!1495434 c!138614) b!1495438))

(assert (= (and b!1495434 (not c!138614)) b!1495433))

(assert (= (and d!157237 c!138616) b!1495437))

(assert (= (and d!157237 (not c!138616)) b!1495436))

(assert (= (and b!1495436 res!1017267) b!1495430))

(assert (= (and b!1495430 (not res!1017269)) b!1495431))

(assert (= (and b!1495431 (not res!1017268)) b!1495435))

(declare-fun m!1378909 () Bool)

(assert (=> b!1495430 m!1378909))

(assert (=> b!1495435 m!1378909))

(assert (=> b!1495431 m!1378909))

(assert (=> d!157237 m!1378743))

(declare-fun m!1378911 () Bool)

(assert (=> d!157237 m!1378911))

(assert (=> d!157237 m!1378711))

(assert (=> b!1495433 m!1378743))

(declare-fun m!1378913 () Bool)

(assert (=> b!1495433 m!1378913))

(assert (=> b!1495433 m!1378913))

(assert (=> b!1495433 m!1378717))

(declare-fun m!1378915 () Bool)

(assert (=> b!1495433 m!1378915))

(assert (=> b!1495147 d!157237))

(declare-fun d!157247 () Bool)

(declare-fun lt!651741 () (_ BitVec 32))

(declare-fun lt!651740 () (_ BitVec 32))

(assert (=> d!157247 (= lt!651741 (bvmul (bvxor lt!651740 (bvlshr lt!651740 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157247 (= lt!651740 ((_ extract 31 0) (bvand (bvxor (select (arr!48160 a!2862) j!93) (bvlshr (select (arr!48160 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157247 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017270 (let ((h!36052 ((_ extract 31 0) (bvand (bvxor (select (arr!48160 a!2862) j!93) (bvlshr (select (arr!48160 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133606 (bvmul (bvxor h!36052 (bvlshr h!36052 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133606 (bvlshr x!133606 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017270 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017270 #b00000000000000000000000000000000))))))

(assert (=> d!157247 (= (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687) (bvand (bvxor lt!651741 (bvlshr lt!651741 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495147 d!157247))

(declare-fun d!157249 () Bool)

(assert (=> d!157249 (= (validKeyInArray!0 (select (arr!48160 a!2862) j!93)) (and (not (= (select (arr!48160 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48160 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495156 d!157249))

(declare-fun d!157251 () Bool)

(declare-fun res!1017277 () Bool)

(declare-fun e!837627 () Bool)

(assert (=> d!157251 (=> res!1017277 e!837627)))

(assert (=> d!157251 (= res!1017277 (bvsge #b00000000000000000000000000000000 (size!48710 a!2862)))))

(assert (=> d!157251 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34658) e!837627)))

(declare-fun b!1495449 () Bool)

(declare-fun e!837626 () Bool)

(declare-fun contains!9933 (List!34661 (_ BitVec 64)) Bool)

(assert (=> b!1495449 (= e!837626 (contains!9933 Nil!34658 (select (arr!48160 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495450 () Bool)

(declare-fun e!837629 () Bool)

(declare-fun e!837628 () Bool)

(assert (=> b!1495450 (= e!837629 e!837628)))

(declare-fun c!138619 () Bool)

(assert (=> b!1495450 (= c!138619 (validKeyInArray!0 (select (arr!48160 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495451 () Bool)

(declare-fun call!68009 () Bool)

(assert (=> b!1495451 (= e!837628 call!68009)))

(declare-fun bm!68006 () Bool)

(assert (=> bm!68006 (= call!68009 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138619 (Cons!34657 (select (arr!48160 a!2862) #b00000000000000000000000000000000) Nil!34658) Nil!34658)))))

(declare-fun b!1495452 () Bool)

(assert (=> b!1495452 (= e!837627 e!837629)))

(declare-fun res!1017278 () Bool)

(assert (=> b!1495452 (=> (not res!1017278) (not e!837629))))

(assert (=> b!1495452 (= res!1017278 (not e!837626))))

(declare-fun res!1017279 () Bool)

(assert (=> b!1495452 (=> (not res!1017279) (not e!837626))))

(assert (=> b!1495452 (= res!1017279 (validKeyInArray!0 (select (arr!48160 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495453 () Bool)

(assert (=> b!1495453 (= e!837628 call!68009)))

(assert (= (and d!157251 (not res!1017277)) b!1495452))

(assert (= (and b!1495452 res!1017279) b!1495449))

(assert (= (and b!1495452 res!1017278) b!1495450))

(assert (= (and b!1495450 c!138619) b!1495451))

(assert (= (and b!1495450 (not c!138619)) b!1495453))

(assert (= (or b!1495451 b!1495453) bm!68006))

(declare-fun m!1378917 () Bool)

(assert (=> b!1495449 m!1378917))

(assert (=> b!1495449 m!1378917))

(declare-fun m!1378919 () Bool)

(assert (=> b!1495449 m!1378919))

(assert (=> b!1495450 m!1378917))

(assert (=> b!1495450 m!1378917))

(declare-fun m!1378921 () Bool)

(assert (=> b!1495450 m!1378921))

(assert (=> bm!68006 m!1378917))

(declare-fun m!1378923 () Bool)

(assert (=> bm!68006 m!1378923))

(assert (=> b!1495452 m!1378917))

(assert (=> b!1495452 m!1378917))

(assert (=> b!1495452 m!1378921))

(assert (=> b!1495145 d!157251))

(declare-fun b!1495456 () Bool)

(declare-fun lt!651747 () SeekEntryResult!12400)

(assert (=> b!1495456 (and (bvsge (index!51994 lt!651747) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651747) (size!48710 a!2862)))))

(declare-fun res!1017282 () Bool)

(assert (=> b!1495456 (= res!1017282 (= (select (arr!48160 a!2862) (index!51994 lt!651747)) (select (arr!48160 a!2862) j!93)))))

(declare-fun e!837631 () Bool)

(assert (=> b!1495456 (=> res!1017282 e!837631)))

(declare-fun e!837633 () Bool)

(assert (=> b!1495456 (= e!837633 e!837631)))

(declare-fun b!1495457 () Bool)

(assert (=> b!1495457 (and (bvsge (index!51994 lt!651747) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651747) (size!48710 a!2862)))))

(declare-fun res!1017281 () Bool)

(assert (=> b!1495457 (= res!1017281 (= (select (arr!48160 a!2862) (index!51994 lt!651747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495457 (=> res!1017281 e!837631)))

(declare-fun b!1495458 () Bool)

(declare-fun e!837632 () SeekEntryResult!12400)

(assert (=> b!1495458 (= e!837632 (Intermediate!12400 true index!646 x!665))))

(declare-fun b!1495459 () Bool)

(declare-fun e!837630 () SeekEntryResult!12400)

(assert (=> b!1495459 (= e!837630 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48160 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495460 () Bool)

(assert (=> b!1495460 (= e!837632 e!837630)))

(declare-fun lt!651746 () (_ BitVec 64))

(declare-fun c!138620 () Bool)

(assert (=> b!1495460 (= c!138620 (or (= lt!651746 (select (arr!48160 a!2862) j!93)) (= (bvadd lt!651746 lt!651746) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495461 () Bool)

(assert (=> b!1495461 (and (bvsge (index!51994 lt!651747) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651747) (size!48710 a!2862)))))

(assert (=> b!1495461 (= e!837631 (= (select (arr!48160 a!2862) (index!51994 lt!651747)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!157253 () Bool)

(declare-fun e!837634 () Bool)

(assert (=> d!157253 e!837634))

(declare-fun c!138622 () Bool)

(assert (=> d!157253 (= c!138622 (and (is-Intermediate!12400 lt!651747) (undefined!13212 lt!651747)))))

(assert (=> d!157253 (= lt!651747 e!837632)))

(declare-fun c!138621 () Bool)

(assert (=> d!157253 (= c!138621 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157253 (= lt!651746 (select (arr!48160 a!2862) index!646))))

(assert (=> d!157253 (validMask!0 mask!2687)))

(assert (=> d!157253 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!651747)))

(declare-fun b!1495462 () Bool)

(assert (=> b!1495462 (= e!837634 e!837633)))

(declare-fun res!1017280 () Bool)

(assert (=> b!1495462 (= res!1017280 (and (is-Intermediate!12400 lt!651747) (not (undefined!13212 lt!651747)) (bvslt (x!133596 lt!651747) #b01111111111111111111111111111110) (bvsge (x!133596 lt!651747) #b00000000000000000000000000000000) (bvsge (x!133596 lt!651747) x!665)))))

(assert (=> b!1495462 (=> (not res!1017280) (not e!837633))))

(declare-fun b!1495463 () Bool)

(assert (=> b!1495463 (= e!837634 (bvsge (x!133596 lt!651747) #b01111111111111111111111111111110))))

(declare-fun b!1495464 () Bool)

(assert (=> b!1495464 (= e!837630 (Intermediate!12400 false index!646 x!665))))

(assert (= (and d!157253 c!138621) b!1495458))

(assert (= (and d!157253 (not c!138621)) b!1495460))

(assert (= (and b!1495460 c!138620) b!1495464))

(assert (= (and b!1495460 (not c!138620)) b!1495459))

(assert (= (and d!157253 c!138622) b!1495463))

(assert (= (and d!157253 (not c!138622)) b!1495462))

(assert (= (and b!1495462 res!1017280) b!1495456))

(assert (= (and b!1495456 (not res!1017282)) b!1495457))

(assert (= (and b!1495457 (not res!1017281)) b!1495461))

(declare-fun m!1378925 () Bool)

(assert (=> b!1495456 m!1378925))

(assert (=> b!1495461 m!1378925))

(assert (=> b!1495457 m!1378925))

(assert (=> d!157253 m!1378733))

(assert (=> d!157253 m!1378711))

(assert (=> b!1495459 m!1378737))

(assert (=> b!1495459 m!1378737))

(assert (=> b!1495459 m!1378717))

(declare-fun m!1378927 () Bool)

(assert (=> b!1495459 m!1378927))

(assert (=> b!1495146 d!157253))

(declare-fun lt!651758 () SeekEntryResult!12400)

(declare-fun d!157255 () Bool)

(assert (=> d!157255 (and (or (is-Undefined!12400 lt!651758) (not (is-Found!12400 lt!651758)) (and (bvsge (index!51993 lt!651758) #b00000000000000000000000000000000) (bvslt (index!51993 lt!651758) (size!48710 lt!651626)))) (or (is-Undefined!12400 lt!651758) (is-Found!12400 lt!651758) (not (is-MissingVacant!12400 lt!651758)) (not (= (index!51995 lt!651758) intermediateAfterIndex!19)) (and (bvsge (index!51995 lt!651758) #b00000000000000000000000000000000) (bvslt (index!51995 lt!651758) (size!48710 lt!651626)))) (or (is-Undefined!12400 lt!651758) (ite (is-Found!12400 lt!651758) (= (select (arr!48160 lt!651626) (index!51993 lt!651758)) lt!651625) (and (is-MissingVacant!12400 lt!651758) (= (index!51995 lt!651758) intermediateAfterIndex!19) (= (select (arr!48160 lt!651626) (index!51995 lt!651758)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!837662 () SeekEntryResult!12400)

(assert (=> d!157255 (= lt!651758 e!837662)))

(declare-fun c!138641 () Bool)

(assert (=> d!157255 (= c!138641 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!651757 () (_ BitVec 64))

(assert (=> d!157255 (= lt!651757 (select (arr!48160 lt!651626) lt!651622))))

(assert (=> d!157255 (validMask!0 mask!2687)))

(assert (=> d!157255 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651622 intermediateAfterIndex!19 lt!651625 lt!651626 mask!2687) lt!651758)))

(declare-fun b!1495508 () Bool)

(declare-fun e!837663 () SeekEntryResult!12400)

(assert (=> b!1495508 (= e!837663 (MissingVacant!12400 intermediateAfterIndex!19))))

(declare-fun b!1495509 () Bool)

(assert (=> b!1495509 (= e!837662 Undefined!12400)))

(declare-fun b!1495510 () Bool)

(assert (=> b!1495510 (= e!837663 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651622 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!651625 lt!651626 mask!2687))))

(declare-fun b!1495511 () Bool)

(declare-fun e!837664 () SeekEntryResult!12400)

(assert (=> b!1495511 (= e!837664 (Found!12400 lt!651622))))

(declare-fun b!1495512 () Bool)

(declare-fun c!138642 () Bool)

(assert (=> b!1495512 (= c!138642 (= lt!651757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495512 (= e!837664 e!837663)))

(declare-fun b!1495513 () Bool)

(assert (=> b!1495513 (= e!837662 e!837664)))

(declare-fun c!138643 () Bool)

(assert (=> b!1495513 (= c!138643 (= lt!651757 lt!651625))))

(assert (= (and d!157255 c!138641) b!1495509))

(assert (= (and d!157255 (not c!138641)) b!1495513))

(assert (= (and b!1495513 c!138643) b!1495511))

(assert (= (and b!1495513 (not c!138643)) b!1495512))

(assert (= (and b!1495512 c!138642) b!1495508))

(assert (= (and b!1495512 (not c!138642)) b!1495510))

(declare-fun m!1378947 () Bool)

(assert (=> d!157255 m!1378947))

(declare-fun m!1378949 () Bool)

(assert (=> d!157255 m!1378949))

(declare-fun m!1378951 () Bool)

(assert (=> d!157255 m!1378951))

(assert (=> d!157255 m!1378711))

(declare-fun m!1378953 () Bool)

(assert (=> b!1495510 m!1378953))

(assert (=> b!1495510 m!1378953))

(declare-fun m!1378955 () Bool)

(assert (=> b!1495510 m!1378955))

(assert (=> b!1495160 d!157255))

(declare-fun b!1495514 () Bool)

(declare-fun lt!651760 () SeekEntryResult!12400)

(declare-fun e!837665 () SeekEntryResult!12400)

(assert (=> b!1495514 (= e!837665 (seekKeyOrZeroReturnVacant!0 (x!133596 lt!651760) (index!51994 lt!651760) (index!51994 lt!651760) lt!651625 lt!651626 mask!2687))))

(declare-fun b!1495515 () Bool)

(declare-fun e!837666 () SeekEntryResult!12400)

(declare-fun e!837667 () SeekEntryResult!12400)

(assert (=> b!1495515 (= e!837666 e!837667)))

(declare-fun lt!651759 () (_ BitVec 64))

(assert (=> b!1495515 (= lt!651759 (select (arr!48160 lt!651626) (index!51994 lt!651760)))))

(declare-fun c!138644 () Bool)

(assert (=> b!1495515 (= c!138644 (= lt!651759 lt!651625))))

(declare-fun b!1495516 () Bool)

(assert (=> b!1495516 (= e!837667 (Found!12400 (index!51994 lt!651760)))))

(declare-fun b!1495517 () Bool)

(declare-fun c!138645 () Bool)

(assert (=> b!1495517 (= c!138645 (= lt!651759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495517 (= e!837667 e!837665)))

(declare-fun d!157261 () Bool)

(declare-fun lt!651761 () SeekEntryResult!12400)

(assert (=> d!157261 (and (or (is-Undefined!12400 lt!651761) (not (is-Found!12400 lt!651761)) (and (bvsge (index!51993 lt!651761) #b00000000000000000000000000000000) (bvslt (index!51993 lt!651761) (size!48710 lt!651626)))) (or (is-Undefined!12400 lt!651761) (is-Found!12400 lt!651761) (not (is-MissingZero!12400 lt!651761)) (and (bvsge (index!51992 lt!651761) #b00000000000000000000000000000000) (bvslt (index!51992 lt!651761) (size!48710 lt!651626)))) (or (is-Undefined!12400 lt!651761) (is-Found!12400 lt!651761) (is-MissingZero!12400 lt!651761) (not (is-MissingVacant!12400 lt!651761)) (and (bvsge (index!51995 lt!651761) #b00000000000000000000000000000000) (bvslt (index!51995 lt!651761) (size!48710 lt!651626)))) (or (is-Undefined!12400 lt!651761) (ite (is-Found!12400 lt!651761) (= (select (arr!48160 lt!651626) (index!51993 lt!651761)) lt!651625) (ite (is-MissingZero!12400 lt!651761) (= (select (arr!48160 lt!651626) (index!51992 lt!651761)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12400 lt!651761) (= (select (arr!48160 lt!651626) (index!51995 lt!651761)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157261 (= lt!651761 e!837666)))

(declare-fun c!138646 () Bool)

(assert (=> d!157261 (= c!138646 (and (is-Intermediate!12400 lt!651760) (undefined!13212 lt!651760)))))

(assert (=> d!157261 (= lt!651760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651625 mask!2687) lt!651625 lt!651626 mask!2687))))

(assert (=> d!157261 (validMask!0 mask!2687)))

(assert (=> d!157261 (= (seekEntryOrOpen!0 lt!651625 lt!651626 mask!2687) lt!651761)))

(declare-fun b!1495518 () Bool)

(assert (=> b!1495518 (= e!837665 (MissingZero!12400 (index!51994 lt!651760)))))

(declare-fun b!1495519 () Bool)

(assert (=> b!1495519 (= e!837666 Undefined!12400)))

(assert (= (and d!157261 c!138646) b!1495519))

(assert (= (and d!157261 (not c!138646)) b!1495515))

(assert (= (and b!1495515 c!138644) b!1495516))

(assert (= (and b!1495515 (not c!138644)) b!1495517))

(assert (= (and b!1495517 c!138645) b!1495518))

(assert (= (and b!1495517 (not c!138645)) b!1495514))

(declare-fun m!1378957 () Bool)

(assert (=> b!1495514 m!1378957))

(declare-fun m!1378959 () Bool)

(assert (=> b!1495515 m!1378959))

(assert (=> d!157261 m!1378721))

(declare-fun m!1378961 () Bool)

(assert (=> d!157261 m!1378961))

(declare-fun m!1378963 () Bool)

(assert (=> d!157261 m!1378963))

(assert (=> d!157261 m!1378721))

(assert (=> d!157261 m!1378723))

(assert (=> d!157261 m!1378711))

(declare-fun m!1378965 () Bool)

(assert (=> d!157261 m!1378965))

(assert (=> b!1495160 d!157261))

(declare-fun b!1495520 () Bool)

(declare-fun lt!651763 () SeekEntryResult!12400)

(assert (=> b!1495520 (and (bvsge (index!51994 lt!651763) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651763) (size!48710 lt!651626)))))

(declare-fun res!1017294 () Bool)

(assert (=> b!1495520 (= res!1017294 (= (select (arr!48160 lt!651626) (index!51994 lt!651763)) lt!651625))))

(declare-fun e!837669 () Bool)

(assert (=> b!1495520 (=> res!1017294 e!837669)))

(declare-fun e!837671 () Bool)

(assert (=> b!1495520 (= e!837671 e!837669)))

(declare-fun b!1495521 () Bool)

(assert (=> b!1495521 (and (bvsge (index!51994 lt!651763) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651763) (size!48710 lt!651626)))))

(declare-fun res!1017293 () Bool)

(assert (=> b!1495521 (= res!1017293 (= (select (arr!48160 lt!651626) (index!51994 lt!651763)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495521 (=> res!1017293 e!837669)))

(declare-fun b!1495522 () Bool)

(declare-fun e!837670 () SeekEntryResult!12400)

(assert (=> b!1495522 (= e!837670 (Intermediate!12400 true lt!651622 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495523 () Bool)

(declare-fun e!837668 () SeekEntryResult!12400)

(assert (=> b!1495523 (= e!837668 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651622 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!651625 lt!651626 mask!2687))))

(declare-fun b!1495524 () Bool)

(assert (=> b!1495524 (= e!837670 e!837668)))

(declare-fun c!138647 () Bool)

(declare-fun lt!651762 () (_ BitVec 64))

(assert (=> b!1495524 (= c!138647 (or (= lt!651762 lt!651625) (= (bvadd lt!651762 lt!651762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495525 () Bool)

(assert (=> b!1495525 (and (bvsge (index!51994 lt!651763) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651763) (size!48710 lt!651626)))))

(assert (=> b!1495525 (= e!837669 (= (select (arr!48160 lt!651626) (index!51994 lt!651763)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!157263 () Bool)

(declare-fun e!837672 () Bool)

(assert (=> d!157263 e!837672))

(declare-fun c!138649 () Bool)

(assert (=> d!157263 (= c!138649 (and (is-Intermediate!12400 lt!651763) (undefined!13212 lt!651763)))))

(assert (=> d!157263 (= lt!651763 e!837670)))

(declare-fun c!138648 () Bool)

(assert (=> d!157263 (= c!138648 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157263 (= lt!651762 (select (arr!48160 lt!651626) lt!651622))))

(assert (=> d!157263 (validMask!0 mask!2687)))

(assert (=> d!157263 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651622 lt!651625 lt!651626 mask!2687) lt!651763)))

(declare-fun b!1495526 () Bool)

(assert (=> b!1495526 (= e!837672 e!837671)))

(declare-fun res!1017292 () Bool)

(assert (=> b!1495526 (= res!1017292 (and (is-Intermediate!12400 lt!651763) (not (undefined!13212 lt!651763)) (bvslt (x!133596 lt!651763) #b01111111111111111111111111111110) (bvsge (x!133596 lt!651763) #b00000000000000000000000000000000) (bvsge (x!133596 lt!651763) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495526 (=> (not res!1017292) (not e!837671))))

(declare-fun b!1495527 () Bool)

(assert (=> b!1495527 (= e!837672 (bvsge (x!133596 lt!651763) #b01111111111111111111111111111110))))

(declare-fun b!1495528 () Bool)

(assert (=> b!1495528 (= e!837668 (Intermediate!12400 false lt!651622 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!157263 c!138648) b!1495522))

(assert (= (and d!157263 (not c!138648)) b!1495524))

(assert (= (and b!1495524 c!138647) b!1495528))

(assert (= (and b!1495524 (not c!138647)) b!1495523))

(assert (= (and d!157263 c!138649) b!1495527))

(assert (= (and d!157263 (not c!138649)) b!1495526))

(assert (= (and b!1495526 res!1017292) b!1495520))

(assert (= (and b!1495520 (not res!1017294)) b!1495521))

(assert (= (and b!1495521 (not res!1017293)) b!1495525))

(declare-fun m!1378967 () Bool)

(assert (=> b!1495520 m!1378967))

(assert (=> b!1495525 m!1378967))

(assert (=> b!1495521 m!1378967))

(assert (=> d!157263 m!1378951))

(assert (=> d!157263 m!1378711))

(assert (=> b!1495523 m!1378953))

(assert (=> b!1495523 m!1378953))

(declare-fun m!1378969 () Bool)

(assert (=> b!1495523 m!1378969))

(assert (=> b!1495149 d!157263))

(declare-fun b!1495529 () Bool)

(declare-fun lt!651765 () SeekEntryResult!12400)

(assert (=> b!1495529 (and (bvsge (index!51994 lt!651765) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651765) (size!48710 lt!651626)))))

(declare-fun res!1017297 () Bool)

(assert (=> b!1495529 (= res!1017297 (= (select (arr!48160 lt!651626) (index!51994 lt!651765)) lt!651625))))

(declare-fun e!837674 () Bool)

(assert (=> b!1495529 (=> res!1017297 e!837674)))

(declare-fun e!837676 () Bool)

(assert (=> b!1495529 (= e!837676 e!837674)))

(declare-fun b!1495530 () Bool)

(assert (=> b!1495530 (and (bvsge (index!51994 lt!651765) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651765) (size!48710 lt!651626)))))

(declare-fun res!1017296 () Bool)

(assert (=> b!1495530 (= res!1017296 (= (select (arr!48160 lt!651626) (index!51994 lt!651765)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495530 (=> res!1017296 e!837674)))

(declare-fun b!1495531 () Bool)

(declare-fun e!837675 () SeekEntryResult!12400)

(assert (=> b!1495531 (= e!837675 (Intermediate!12400 true (toIndex!0 lt!651625 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495532 () Bool)

(declare-fun e!837673 () SeekEntryResult!12400)

(assert (=> b!1495532 (= e!837673 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651625 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651625 lt!651626 mask!2687))))

(declare-fun b!1495533 () Bool)

(assert (=> b!1495533 (= e!837675 e!837673)))

(declare-fun c!138650 () Bool)

(declare-fun lt!651764 () (_ BitVec 64))

(assert (=> b!1495533 (= c!138650 (or (= lt!651764 lt!651625) (= (bvadd lt!651764 lt!651764) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495534 () Bool)

(assert (=> b!1495534 (and (bvsge (index!51994 lt!651765) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651765) (size!48710 lt!651626)))))

(assert (=> b!1495534 (= e!837674 (= (select (arr!48160 lt!651626) (index!51994 lt!651765)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!157265 () Bool)

(declare-fun e!837677 () Bool)

(assert (=> d!157265 e!837677))

(declare-fun c!138652 () Bool)

(assert (=> d!157265 (= c!138652 (and (is-Intermediate!12400 lt!651765) (undefined!13212 lt!651765)))))

(assert (=> d!157265 (= lt!651765 e!837675)))

(declare-fun c!138651 () Bool)

(assert (=> d!157265 (= c!138651 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157265 (= lt!651764 (select (arr!48160 lt!651626) (toIndex!0 lt!651625 mask!2687)))))

(assert (=> d!157265 (validMask!0 mask!2687)))

(assert (=> d!157265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651625 mask!2687) lt!651625 lt!651626 mask!2687) lt!651765)))

(declare-fun b!1495535 () Bool)

(assert (=> b!1495535 (= e!837677 e!837676)))

(declare-fun res!1017295 () Bool)

(assert (=> b!1495535 (= res!1017295 (and (is-Intermediate!12400 lt!651765) (not (undefined!13212 lt!651765)) (bvslt (x!133596 lt!651765) #b01111111111111111111111111111110) (bvsge (x!133596 lt!651765) #b00000000000000000000000000000000) (bvsge (x!133596 lt!651765) #b00000000000000000000000000000000)))))

(assert (=> b!1495535 (=> (not res!1017295) (not e!837676))))

(declare-fun b!1495536 () Bool)

(assert (=> b!1495536 (= e!837677 (bvsge (x!133596 lt!651765) #b01111111111111111111111111111110))))

(declare-fun b!1495537 () Bool)

(assert (=> b!1495537 (= e!837673 (Intermediate!12400 false (toIndex!0 lt!651625 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157265 c!138651) b!1495531))

(assert (= (and d!157265 (not c!138651)) b!1495533))

(assert (= (and b!1495533 c!138650) b!1495537))

(assert (= (and b!1495533 (not c!138650)) b!1495532))

(assert (= (and d!157265 c!138652) b!1495536))

(assert (= (and d!157265 (not c!138652)) b!1495535))

(assert (= (and b!1495535 res!1017295) b!1495529))

(assert (= (and b!1495529 (not res!1017297)) b!1495530))

(assert (= (and b!1495530 (not res!1017296)) b!1495534))

(declare-fun m!1378971 () Bool)

(assert (=> b!1495529 m!1378971))

(assert (=> b!1495534 m!1378971))

(assert (=> b!1495530 m!1378971))

(assert (=> d!157265 m!1378721))

(declare-fun m!1378973 () Bool)

(assert (=> d!157265 m!1378973))

(assert (=> d!157265 m!1378711))

(assert (=> b!1495532 m!1378721))

(declare-fun m!1378975 () Bool)

(assert (=> b!1495532 m!1378975))

(assert (=> b!1495532 m!1378975))

(declare-fun m!1378977 () Bool)

(assert (=> b!1495532 m!1378977))

(assert (=> b!1495150 d!157265))

(declare-fun d!157267 () Bool)

(declare-fun lt!651767 () (_ BitVec 32))

(declare-fun lt!651766 () (_ BitVec 32))

(assert (=> d!157267 (= lt!651767 (bvmul (bvxor lt!651766 (bvlshr lt!651766 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157267 (= lt!651766 ((_ extract 31 0) (bvand (bvxor lt!651625 (bvlshr lt!651625 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157267 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017270 (let ((h!36052 ((_ extract 31 0) (bvand (bvxor lt!651625 (bvlshr lt!651625 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133606 (bvmul (bvxor h!36052 (bvlshr h!36052 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133606 (bvlshr x!133606 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017270 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017270 #b00000000000000000000000000000000))))))

(assert (=> d!157267 (= (toIndex!0 lt!651625 mask!2687) (bvand (bvxor lt!651767 (bvlshr lt!651767 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495150 d!157267))

(declare-fun d!157269 () Bool)

(declare-fun lt!651769 () SeekEntryResult!12400)

(assert (=> d!157269 (and (or (is-Undefined!12400 lt!651769) (not (is-Found!12400 lt!651769)) (and (bvsge (index!51993 lt!651769) #b00000000000000000000000000000000) (bvslt (index!51993 lt!651769) (size!48710 lt!651626)))) (or (is-Undefined!12400 lt!651769) (is-Found!12400 lt!651769) (not (is-MissingVacant!12400 lt!651769)) (not (= (index!51995 lt!651769) intermediateAfterIndex!19)) (and (bvsge (index!51995 lt!651769) #b00000000000000000000000000000000) (bvslt (index!51995 lt!651769) (size!48710 lt!651626)))) (or (is-Undefined!12400 lt!651769) (ite (is-Found!12400 lt!651769) (= (select (arr!48160 lt!651626) (index!51993 lt!651769)) lt!651625) (and (is-MissingVacant!12400 lt!651769) (= (index!51995 lt!651769) intermediateAfterIndex!19) (= (select (arr!48160 lt!651626) (index!51995 lt!651769)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!837678 () SeekEntryResult!12400)

(assert (=> d!157269 (= lt!651769 e!837678)))

(declare-fun c!138653 () Bool)

(assert (=> d!157269 (= c!138653 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651768 () (_ BitVec 64))

(assert (=> d!157269 (= lt!651768 (select (arr!48160 lt!651626) index!646))))

(assert (=> d!157269 (validMask!0 mask!2687)))

(assert (=> d!157269 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651625 lt!651626 mask!2687) lt!651769)))

(declare-fun b!1495538 () Bool)

(declare-fun e!837679 () SeekEntryResult!12400)

(assert (=> b!1495538 (= e!837679 (MissingVacant!12400 intermediateAfterIndex!19))))

(declare-fun b!1495539 () Bool)

(assert (=> b!1495539 (= e!837678 Undefined!12400)))

(declare-fun b!1495540 () Bool)

(assert (=> b!1495540 (= e!837679 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651625 lt!651626 mask!2687))))

(declare-fun b!1495541 () Bool)

(declare-fun e!837680 () SeekEntryResult!12400)

(assert (=> b!1495541 (= e!837680 (Found!12400 index!646))))

(declare-fun b!1495542 () Bool)

(declare-fun c!138654 () Bool)

(assert (=> b!1495542 (= c!138654 (= lt!651768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495542 (= e!837680 e!837679)))

(declare-fun b!1495543 () Bool)

(assert (=> b!1495543 (= e!837678 e!837680)))

(declare-fun c!138655 () Bool)

(assert (=> b!1495543 (= c!138655 (= lt!651768 lt!651625))))

(assert (= (and d!157269 c!138653) b!1495539))

(assert (= (and d!157269 (not c!138653)) b!1495543))

(assert (= (and b!1495543 c!138655) b!1495541))

(assert (= (and b!1495543 (not c!138655)) b!1495542))

(assert (= (and b!1495542 c!138654) b!1495538))

(assert (= (and b!1495542 (not c!138654)) b!1495540))

(declare-fun m!1378979 () Bool)

(assert (=> d!157269 m!1378979))

(declare-fun m!1378981 () Bool)

(assert (=> d!157269 m!1378981))

(declare-fun m!1378983 () Bool)

(assert (=> d!157269 m!1378983))

(assert (=> d!157269 m!1378711))

(assert (=> b!1495540 m!1378737))

(assert (=> b!1495540 m!1378737))

(declare-fun m!1378985 () Bool)

(assert (=> b!1495540 m!1378985))

(assert (=> b!1495152 d!157269))

(assert (=> b!1495152 d!157261))

(declare-fun d!157271 () Bool)

(declare-fun lt!651778 () (_ BitVec 32))

(assert (=> d!157271 (and (bvsge lt!651778 #b00000000000000000000000000000000) (bvslt lt!651778 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157271 (= lt!651778 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157271 (validMask!0 mask!2687)))

(assert (=> d!157271 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651778)))

(declare-fun bs!42914 () Bool)

(assert (= bs!42914 d!157271))

(declare-fun m!1378987 () Bool)

(assert (=> bs!42914 m!1378987))

(assert (=> bs!42914 m!1378711))

(assert (=> b!1495141 d!157271))

(declare-fun b!1495552 () Bool)

(declare-fun lt!651780 () SeekEntryResult!12400)

(assert (=> b!1495552 (and (bvsge (index!51994 lt!651780) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651780) (size!48710 a!2862)))))

(declare-fun res!1017304 () Bool)

(assert (=> b!1495552 (= res!1017304 (= (select (arr!48160 a!2862) (index!51994 lt!651780)) (select (arr!48160 a!2862) j!93)))))

(declare-fun e!837688 () Bool)

(assert (=> b!1495552 (=> res!1017304 e!837688)))

(declare-fun e!837690 () Bool)

(assert (=> b!1495552 (= e!837690 e!837688)))

(declare-fun b!1495553 () Bool)

(assert (=> b!1495553 (and (bvsge (index!51994 lt!651780) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651780) (size!48710 a!2862)))))

(declare-fun res!1017303 () Bool)

(assert (=> b!1495553 (= res!1017303 (= (select (arr!48160 a!2862) (index!51994 lt!651780)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495553 (=> res!1017303 e!837688)))

(declare-fun b!1495554 () Bool)

(declare-fun e!837689 () SeekEntryResult!12400)

(assert (=> b!1495554 (= e!837689 (Intermediate!12400 true lt!651622 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495555 () Bool)

(declare-fun e!837687 () SeekEntryResult!12400)

(assert (=> b!1495555 (= e!837687 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651622 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48160 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495556 () Bool)

(assert (=> b!1495556 (= e!837689 e!837687)))

(declare-fun c!138658 () Bool)

(declare-fun lt!651779 () (_ BitVec 64))

(assert (=> b!1495556 (= c!138658 (or (= lt!651779 (select (arr!48160 a!2862) j!93)) (= (bvadd lt!651779 lt!651779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495557 () Bool)

(assert (=> b!1495557 (and (bvsge (index!51994 lt!651780) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651780) (size!48710 a!2862)))))

(assert (=> b!1495557 (= e!837688 (= (select (arr!48160 a!2862) (index!51994 lt!651780)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!157273 () Bool)

(declare-fun e!837691 () Bool)

(assert (=> d!157273 e!837691))

(declare-fun c!138660 () Bool)

(assert (=> d!157273 (= c!138660 (and (is-Intermediate!12400 lt!651780) (undefined!13212 lt!651780)))))

(assert (=> d!157273 (= lt!651780 e!837689)))

(declare-fun c!138659 () Bool)

(assert (=> d!157273 (= c!138659 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157273 (= lt!651779 (select (arr!48160 a!2862) lt!651622))))

(assert (=> d!157273 (validMask!0 mask!2687)))

(assert (=> d!157273 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651622 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!651780)))

(declare-fun b!1495558 () Bool)

(assert (=> b!1495558 (= e!837691 e!837690)))

(declare-fun res!1017302 () Bool)

(assert (=> b!1495558 (= res!1017302 (and (is-Intermediate!12400 lt!651780) (not (undefined!13212 lt!651780)) (bvslt (x!133596 lt!651780) #b01111111111111111111111111111110) (bvsge (x!133596 lt!651780) #b00000000000000000000000000000000) (bvsge (x!133596 lt!651780) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495558 (=> (not res!1017302) (not e!837690))))

(declare-fun b!1495559 () Bool)

(assert (=> b!1495559 (= e!837691 (bvsge (x!133596 lt!651780) #b01111111111111111111111111111110))))

(declare-fun b!1495560 () Bool)

(assert (=> b!1495560 (= e!837687 (Intermediate!12400 false lt!651622 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!157273 c!138659) b!1495554))

(assert (= (and d!157273 (not c!138659)) b!1495556))

(assert (= (and b!1495556 c!138658) b!1495560))

(assert (= (and b!1495556 (not c!138658)) b!1495555))

(assert (= (and d!157273 c!138660) b!1495559))

(assert (= (and d!157273 (not c!138660)) b!1495558))

(assert (= (and b!1495558 res!1017302) b!1495552))

(assert (= (and b!1495552 (not res!1017304)) b!1495553))

(assert (= (and b!1495553 (not res!1017303)) b!1495557))

(declare-fun m!1378989 () Bool)

(assert (=> b!1495552 m!1378989))

(assert (=> b!1495557 m!1378989))

(assert (=> b!1495553 m!1378989))

(declare-fun m!1378991 () Bool)

(assert (=> d!157273 m!1378991))

(assert (=> d!157273 m!1378711))

(assert (=> b!1495555 m!1378953))

(assert (=> b!1495555 m!1378953))

(assert (=> b!1495555 m!1378717))

(declare-fun m!1378993 () Bool)

(assert (=> b!1495555 m!1378993))

(assert (=> b!1495140 d!157273))

(declare-fun b!1495573 () Bool)

(declare-fun e!837703 () Bool)

(declare-fun e!837701 () Bool)

(assert (=> b!1495573 (= e!837703 e!837701)))

(declare-fun lt!651793 () (_ BitVec 64))

(assert (=> b!1495573 (= lt!651793 (select (arr!48160 a!2862) j!93))))

(declare-fun lt!651794 () Unit!50140)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99786 (_ BitVec 64) (_ BitVec 32)) Unit!50140)

(assert (=> b!1495573 (= lt!651794 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651793 j!93))))

(declare-fun arrayContainsKey!0 (array!99786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1495573 (arrayContainsKey!0 a!2862 lt!651793 #b00000000000000000000000000000000)))

(declare-fun lt!651795 () Unit!50140)

(assert (=> b!1495573 (= lt!651795 lt!651794)))

(declare-fun res!1017311 () Bool)

(assert (=> b!1495573 (= res!1017311 (= (seekEntryOrOpen!0 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) (Found!12400 j!93)))))

(assert (=> b!1495573 (=> (not res!1017311) (not e!837701))))

(declare-fun b!1495574 () Bool)

(declare-fun e!837702 () Bool)

(assert (=> b!1495574 (= e!837702 e!837703)))

(declare-fun c!138664 () Bool)

(assert (=> b!1495574 (= c!138664 (validKeyInArray!0 (select (arr!48160 a!2862) j!93)))))

(declare-fun b!1495575 () Bool)

(declare-fun call!68018 () Bool)

(assert (=> b!1495575 (= e!837703 call!68018)))

(declare-fun b!1495576 () Bool)

(assert (=> b!1495576 (= e!837701 call!68018)))

(declare-fun d!157275 () Bool)

(declare-fun res!1017312 () Bool)

(assert (=> d!157275 (=> res!1017312 e!837702)))

(assert (=> d!157275 (= res!1017312 (bvsge j!93 (size!48710 a!2862)))))

(assert (=> d!157275 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837702)))

(declare-fun bm!68015 () Bool)

(assert (=> bm!68015 (= call!68018 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!157275 (not res!1017312)) b!1495574))

(assert (= (and b!1495574 c!138664) b!1495573))

(assert (= (and b!1495574 (not c!138664)) b!1495575))

(assert (= (and b!1495573 res!1017311) b!1495576))

(assert (= (or b!1495576 b!1495575) bm!68015))

(assert (=> b!1495573 m!1378717))

(declare-fun m!1379003 () Bool)

(assert (=> b!1495573 m!1379003))

(declare-fun m!1379005 () Bool)

(assert (=> b!1495573 m!1379005))

(assert (=> b!1495573 m!1378717))

(assert (=> b!1495573 m!1378741))

(assert (=> b!1495574 m!1378717))

(assert (=> b!1495574 m!1378717))

(assert (=> b!1495574 m!1378719))

(declare-fun m!1379007 () Bool)

(assert (=> bm!68015 m!1379007))

(assert (=> b!1495161 d!157275))

(declare-fun d!157281 () Bool)

(assert (=> d!157281 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651805 () Unit!50140)

(declare-fun choose!38 (array!99786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50140)

(assert (=> d!157281 (= lt!651805 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157281 (validMask!0 mask!2687)))

(assert (=> d!157281 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651805)))

(declare-fun bs!42916 () Bool)

(assert (= bs!42916 d!157281))

(assert (=> bs!42916 m!1378735))

(declare-fun m!1379021 () Bool)

(assert (=> bs!42916 m!1379021))

(assert (=> bs!42916 m!1378711))

(assert (=> b!1495161 d!157281))

(declare-fun b!1495598 () Bool)

(declare-fun lt!651807 () SeekEntryResult!12400)

(assert (=> b!1495598 (and (bvsge (index!51994 lt!651807) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651807) (size!48710 lt!651626)))))

(declare-fun res!1017318 () Bool)

(assert (=> b!1495598 (= res!1017318 (= (select (arr!48160 lt!651626) (index!51994 lt!651807)) lt!651625))))

(declare-fun e!837716 () Bool)

(assert (=> b!1495598 (=> res!1017318 e!837716)))

(declare-fun e!837718 () Bool)

(assert (=> b!1495598 (= e!837718 e!837716)))

(declare-fun b!1495599 () Bool)

(assert (=> b!1495599 (and (bvsge (index!51994 lt!651807) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651807) (size!48710 lt!651626)))))

(declare-fun res!1017317 () Bool)

(assert (=> b!1495599 (= res!1017317 (= (select (arr!48160 lt!651626) (index!51994 lt!651807)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495599 (=> res!1017317 e!837716)))

(declare-fun b!1495600 () Bool)

(declare-fun e!837717 () SeekEntryResult!12400)

(assert (=> b!1495600 (= e!837717 (Intermediate!12400 true index!646 x!665))))

(declare-fun b!1495601 () Bool)

(declare-fun e!837715 () SeekEntryResult!12400)

(assert (=> b!1495601 (= e!837715 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651625 lt!651626 mask!2687))))

(declare-fun b!1495602 () Bool)

(assert (=> b!1495602 (= e!837717 e!837715)))

(declare-fun c!138674 () Bool)

(declare-fun lt!651806 () (_ BitVec 64))

(assert (=> b!1495602 (= c!138674 (or (= lt!651806 lt!651625) (= (bvadd lt!651806 lt!651806) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495603 () Bool)

(assert (=> b!1495603 (and (bvsge (index!51994 lt!651807) #b00000000000000000000000000000000) (bvslt (index!51994 lt!651807) (size!48710 lt!651626)))))

(assert (=> b!1495603 (= e!837716 (= (select (arr!48160 lt!651626) (index!51994 lt!651807)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!157289 () Bool)

(declare-fun e!837719 () Bool)

(assert (=> d!157289 e!837719))

(declare-fun c!138676 () Bool)

(assert (=> d!157289 (= c!138676 (and (is-Intermediate!12400 lt!651807) (undefined!13212 lt!651807)))))

(assert (=> d!157289 (= lt!651807 e!837717)))

(declare-fun c!138675 () Bool)

(assert (=> d!157289 (= c!138675 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157289 (= lt!651806 (select (arr!48160 lt!651626) index!646))))

(assert (=> d!157289 (validMask!0 mask!2687)))

(assert (=> d!157289 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651625 lt!651626 mask!2687) lt!651807)))

(declare-fun b!1495604 () Bool)

(assert (=> b!1495604 (= e!837719 e!837718)))

(declare-fun res!1017316 () Bool)

(assert (=> b!1495604 (= res!1017316 (and (is-Intermediate!12400 lt!651807) (not (undefined!13212 lt!651807)) (bvslt (x!133596 lt!651807) #b01111111111111111111111111111110) (bvsge (x!133596 lt!651807) #b00000000000000000000000000000000) (bvsge (x!133596 lt!651807) x!665)))))

(assert (=> b!1495604 (=> (not res!1017316) (not e!837718))))

(declare-fun b!1495605 () Bool)

(assert (=> b!1495605 (= e!837719 (bvsge (x!133596 lt!651807) #b01111111111111111111111111111110))))

(declare-fun b!1495606 () Bool)

(assert (=> b!1495606 (= e!837715 (Intermediate!12400 false index!646 x!665))))

(assert (= (and d!157289 c!138675) b!1495600))

(assert (= (and d!157289 (not c!138675)) b!1495602))

(assert (= (and b!1495602 c!138674) b!1495606))

(assert (= (and b!1495602 (not c!138674)) b!1495601))

(assert (= (and d!157289 c!138676) b!1495605))

(assert (= (and d!157289 (not c!138676)) b!1495604))

(assert (= (and b!1495604 res!1017316) b!1495598))

(assert (= (and b!1495598 (not res!1017318)) b!1495599))

(assert (= (and b!1495599 (not res!1017317)) b!1495603))

(declare-fun m!1379033 () Bool)

(assert (=> b!1495598 m!1379033))

(assert (=> b!1495603 m!1379033))

(assert (=> b!1495599 m!1379033))

(assert (=> d!157289 m!1378983))

(assert (=> d!157289 m!1378711))

(assert (=> b!1495601 m!1378737))

(assert (=> b!1495601 m!1378737))

(declare-fun m!1379035 () Bool)

(assert (=> b!1495601 m!1379035))

(assert (=> b!1495151 d!157289))

(declare-fun b!1495607 () Bool)

(declare-fun e!837722 () Bool)

(declare-fun e!837720 () Bool)

(assert (=> b!1495607 (= e!837722 e!837720)))

(declare-fun lt!651808 () (_ BitVec 64))

(assert (=> b!1495607 (= lt!651808 (select (arr!48160 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651809 () Unit!50140)

(assert (=> b!1495607 (= lt!651809 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651808 #b00000000000000000000000000000000))))

(assert (=> b!1495607 (arrayContainsKey!0 a!2862 lt!651808 #b00000000000000000000000000000000)))

(declare-fun lt!651810 () Unit!50140)

(assert (=> b!1495607 (= lt!651810 lt!651809)))

(declare-fun res!1017319 () Bool)

(assert (=> b!1495607 (= res!1017319 (= (seekEntryOrOpen!0 (select (arr!48160 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12400 #b00000000000000000000000000000000)))))

(assert (=> b!1495607 (=> (not res!1017319) (not e!837720))))

(declare-fun b!1495608 () Bool)

(declare-fun e!837721 () Bool)

(assert (=> b!1495608 (= e!837721 e!837722)))

(declare-fun c!138677 () Bool)

(assert (=> b!1495608 (= c!138677 (validKeyInArray!0 (select (arr!48160 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495609 () Bool)

(declare-fun call!68019 () Bool)

(assert (=> b!1495609 (= e!837722 call!68019)))

(declare-fun b!1495610 () Bool)

(assert (=> b!1495610 (= e!837720 call!68019)))

(declare-fun d!157293 () Bool)

(declare-fun res!1017320 () Bool)

(assert (=> d!157293 (=> res!1017320 e!837721)))

(assert (=> d!157293 (= res!1017320 (bvsge #b00000000000000000000000000000000 (size!48710 a!2862)))))

(assert (=> d!157293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837721)))

(declare-fun bm!68016 () Bool)

(assert (=> bm!68016 (= call!68019 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!157293 (not res!1017320)) b!1495608))

(assert (= (and b!1495608 c!138677) b!1495607))

(assert (= (and b!1495608 (not c!138677)) b!1495609))

(assert (= (and b!1495607 res!1017319) b!1495610))

(assert (= (or b!1495610 b!1495609) bm!68016))

(assert (=> b!1495607 m!1378917))

(declare-fun m!1379037 () Bool)

(assert (=> b!1495607 m!1379037))

(declare-fun m!1379039 () Bool)

(assert (=> b!1495607 m!1379039))

(assert (=> b!1495607 m!1378917))

(declare-fun m!1379041 () Bool)

(assert (=> b!1495607 m!1379041))

(assert (=> b!1495608 m!1378917))

(assert (=> b!1495608 m!1378917))

(assert (=> b!1495608 m!1378921))

(declare-fun m!1379043 () Bool)

(assert (=> bm!68016 m!1379043))

(assert (=> b!1495144 d!157293))

(declare-fun d!157295 () Bool)

(assert (=> d!157295 (= (validKeyInArray!0 (select (arr!48160 a!2862) i!1006)) (and (not (= (select (arr!48160 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48160 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495154 d!157295))

(push 1)

(assert (not b!1495459))

(assert (not d!157261))

(assert (not b!1495523))

(assert (not d!157281))

(assert (not d!157255))

(assert (not d!157253))

(assert (not b!1495573))

(assert (not d!157273))

(assert (not b!1495449))

(assert (not d!157289))

(assert (not b!1495608))

(assert (not bm!68016))

(assert (not d!157237))

(assert (not b!1495607))

(assert (not b!1495555))

(assert (not bm!68015))

(assert (not b!1495510))

(assert (not b!1495316))

(assert (not b!1495601))

(assert (not b!1495433))

(assert (not b!1495514))

(assert (not b!1495532))

(assert (not d!157209))

(assert (not b!1495574))

(assert (not d!157271))

(assert (not d!157269))

(assert (not d!157263))

(assert (not b!1495450))

(assert (not d!157265))

(assert (not bm!68006))

(assert (not b!1495540))

(assert (not b!1495452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

