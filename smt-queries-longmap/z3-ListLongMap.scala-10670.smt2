; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125376 () Bool)

(assert start!125376)

(declare-fun b!1460185 () Bool)

(declare-fun e!821363 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1460185 (= e!821363 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!11793 0))(
  ( (MissingZero!11793 (index!49564 (_ BitVec 32))) (Found!11793 (index!49565 (_ BitVec 32))) (Intermediate!11793 (undefined!12605 Bool) (index!49566 (_ BitVec 32)) (x!131354 (_ BitVec 32))) (Undefined!11793) (MissingVacant!11793 (index!49567 (_ BitVec 32))) )
))
(declare-fun lt!639685 () SeekEntryResult!11793)

(declare-fun lt!639687 () SeekEntryResult!11793)

(assert (=> b!1460185 (= lt!639685 lt!639687)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((Unit!49115 0))(
  ( (Unit!49116) )
))
(declare-fun lt!639688 () Unit!49115)

(declare-fun lt!639690 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98719 0))(
  ( (array!98720 (arr!47644 (Array (_ BitVec 32) (_ BitVec 64))) (size!48195 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98719)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49115)

(assert (=> b!1460185 (= lt!639688 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639690 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1460186 () Bool)

(declare-fun res!989418 () Bool)

(declare-fun e!821366 () Bool)

(assert (=> b!1460186 (=> (not res!989418) (not e!821366))))

(assert (=> b!1460186 (= res!989418 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460187 () Bool)

(declare-fun res!989419 () Bool)

(declare-fun e!821364 () Bool)

(assert (=> b!1460187 (=> (not res!989419) (not e!821364))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639691 () SeekEntryResult!11793)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98719 (_ BitVec 32)) SeekEntryResult!11793)

(assert (=> b!1460187 (= res!989419 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!639691))))

(declare-fun res!989412 () Bool)

(declare-fun e!821362 () Bool)

(assert (=> start!125376 (=> (not res!989412) (not e!821362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125376 (= res!989412 (validMask!0 mask!2687))))

(assert (=> start!125376 e!821362))

(assert (=> start!125376 true))

(declare-fun array_inv!36925 (array!98719) Bool)

(assert (=> start!125376 (array_inv!36925 a!2862)))

(declare-fun b!1460188 () Bool)

(declare-fun res!989409 () Bool)

(assert (=> b!1460188 (=> (not res!989409) (not e!821362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460188 (= res!989409 (validKeyInArray!0 (select (arr!47644 a!2862) i!1006)))))

(declare-fun e!821367 () Bool)

(declare-fun b!1460189 () Bool)

(declare-fun lt!639689 () array!98719)

(declare-fun lt!639684 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98719 (_ BitVec 32)) SeekEntryResult!11793)

(assert (=> b!1460189 (= e!821367 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639690 intermediateAfterIndex!19 lt!639684 lt!639689 mask!2687) lt!639687)))))

(declare-fun b!1460190 () Bool)

(declare-fun res!989407 () Bool)

(assert (=> b!1460190 (=> res!989407 e!821363)))

(assert (=> b!1460190 (= res!989407 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1460191 () Bool)

(declare-fun res!989406 () Bool)

(assert (=> b!1460191 (=> (not res!989406) (not e!821362))))

(assert (=> b!1460191 (= res!989406 (validKeyInArray!0 (select (arr!47644 a!2862) j!93)))))

(declare-fun b!1460192 () Bool)

(declare-fun res!989420 () Bool)

(assert (=> b!1460192 (=> (not res!989420) (not e!821362))))

(assert (=> b!1460192 (= res!989420 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48195 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48195 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48195 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460193 () Bool)

(declare-fun e!821361 () Bool)

(assert (=> b!1460193 (= e!821366 (not e!821361))))

(declare-fun res!989415 () Bool)

(assert (=> b!1460193 (=> res!989415 e!821361)))

(assert (=> b!1460193 (= res!989415 (or (and (= (select (arr!47644 a!2862) index!646) (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47644 a!2862) index!646) (select (arr!47644 a!2862) j!93))) (= (select (arr!47644 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1460193 (and (= lt!639685 (Found!11793 j!93)) (or (= (select (arr!47644 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47644 a!2862) intermediateBeforeIndex!19) (select (arr!47644 a!2862) j!93))) (let ((bdg!53466 (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47644 a!2862) index!646) bdg!53466) (= (select (arr!47644 a!2862) index!646) (select (arr!47644 a!2862) j!93))) (= (select (arr!47644 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53466 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98719 (_ BitVec 32)) SeekEntryResult!11793)

(assert (=> b!1460193 (= lt!639685 (seekEntryOrOpen!0 (select (arr!47644 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98719 (_ BitVec 32)) Bool)

(assert (=> b!1460193 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639683 () Unit!49115)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49115)

(assert (=> b!1460193 (= lt!639683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!639686 () SeekEntryResult!11793)

(declare-fun e!821365 () Bool)

(declare-fun b!1460194 () Bool)

(assert (=> b!1460194 (= e!821365 (= lt!639686 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639684 lt!639689 mask!2687)))))

(declare-fun b!1460195 () Bool)

(declare-fun res!989408 () Bool)

(assert (=> b!1460195 (=> (not res!989408) (not e!821362))))

(assert (=> b!1460195 (= res!989408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460196 () Bool)

(declare-fun res!989411 () Bool)

(assert (=> b!1460196 (=> res!989411 e!821363)))

(assert (=> b!1460196 (= res!989411 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639690 (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!639691)))))

(declare-fun b!1460197 () Bool)

(declare-fun e!821360 () Bool)

(assert (=> b!1460197 (= e!821362 e!821360)))

(declare-fun res!989404 () Bool)

(assert (=> b!1460197 (=> (not res!989404) (not e!821360))))

(assert (=> b!1460197 (= res!989404 (= (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460197 (= lt!639689 (array!98720 (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48195 a!2862)))))

(declare-fun b!1460198 () Bool)

(declare-fun res!989414 () Bool)

(assert (=> b!1460198 (=> (not res!989414) (not e!821362))))

(assert (=> b!1460198 (= res!989414 (and (= (size!48195 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48195 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48195 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460199 () Bool)

(assert (=> b!1460199 (= e!821367 (not (= lt!639686 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639690 lt!639684 lt!639689 mask!2687))))))

(declare-fun b!1460200 () Bool)

(declare-fun res!989410 () Bool)

(assert (=> b!1460200 (=> (not res!989410) (not e!821362))))

(declare-datatypes ((List!34132 0))(
  ( (Nil!34129) (Cons!34128 (h!35489 (_ BitVec 64)) (t!48818 List!34132)) )
))
(declare-fun arrayNoDuplicates!0 (array!98719 (_ BitVec 32) List!34132) Bool)

(assert (=> b!1460200 (= res!989410 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34129))))

(declare-fun b!1460201 () Bool)

(assert (=> b!1460201 (= e!821361 e!821363)))

(declare-fun res!989417 () Bool)

(assert (=> b!1460201 (=> res!989417 e!821363)))

(assert (=> b!1460201 (= res!989417 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639690 #b00000000000000000000000000000000) (bvsge lt!639690 (size!48195 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460201 (= lt!639690 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1460201 (= lt!639687 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639684 lt!639689 mask!2687))))

(assert (=> b!1460201 (= lt!639687 (seekEntryOrOpen!0 lt!639684 lt!639689 mask!2687))))

(declare-fun b!1460202 () Bool)

(assert (=> b!1460202 (= e!821364 e!821366)))

(declare-fun res!989416 () Bool)

(assert (=> b!1460202 (=> (not res!989416) (not e!821366))))

(assert (=> b!1460202 (= res!989416 (= lt!639686 (Intermediate!11793 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460202 (= lt!639686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639684 mask!2687) lt!639684 lt!639689 mask!2687))))

(assert (=> b!1460202 (= lt!639684 (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460203 () Bool)

(declare-fun res!989413 () Bool)

(assert (=> b!1460203 (=> res!989413 e!821363)))

(assert (=> b!1460203 (= res!989413 e!821367)))

(declare-fun c!134910 () Bool)

(assert (=> b!1460203 (= c!134910 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460204 () Bool)

(assert (=> b!1460204 (= e!821365 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639684 lt!639689 mask!2687) (seekEntryOrOpen!0 lt!639684 lt!639689 mask!2687)))))

(declare-fun b!1460205 () Bool)

(assert (=> b!1460205 (= e!821360 e!821364)))

(declare-fun res!989405 () Bool)

(assert (=> b!1460205 (=> (not res!989405) (not e!821364))))

(assert (=> b!1460205 (= res!989405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47644 a!2862) j!93) mask!2687) (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!639691))))

(assert (=> b!1460205 (= lt!639691 (Intermediate!11793 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460206 () Bool)

(declare-fun res!989403 () Bool)

(assert (=> b!1460206 (=> (not res!989403) (not e!821366))))

(assert (=> b!1460206 (= res!989403 e!821365)))

(declare-fun c!134911 () Bool)

(assert (=> b!1460206 (= c!134911 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125376 res!989412) b!1460198))

(assert (= (and b!1460198 res!989414) b!1460188))

(assert (= (and b!1460188 res!989409) b!1460191))

(assert (= (and b!1460191 res!989406) b!1460195))

(assert (= (and b!1460195 res!989408) b!1460200))

(assert (= (and b!1460200 res!989410) b!1460192))

(assert (= (and b!1460192 res!989420) b!1460197))

(assert (= (and b!1460197 res!989404) b!1460205))

(assert (= (and b!1460205 res!989405) b!1460187))

(assert (= (and b!1460187 res!989419) b!1460202))

(assert (= (and b!1460202 res!989416) b!1460206))

(assert (= (and b!1460206 c!134911) b!1460194))

(assert (= (and b!1460206 (not c!134911)) b!1460204))

(assert (= (and b!1460206 res!989403) b!1460186))

(assert (= (and b!1460186 res!989418) b!1460193))

(assert (= (and b!1460193 (not res!989415)) b!1460201))

(assert (= (and b!1460201 (not res!989417)) b!1460196))

(assert (= (and b!1460196 (not res!989411)) b!1460203))

(assert (= (and b!1460203 c!134910) b!1460199))

(assert (= (and b!1460203 (not c!134910)) b!1460189))

(assert (= (and b!1460203 (not res!989413)) b!1460190))

(assert (= (and b!1460190 (not res!989407)) b!1460185))

(declare-fun m!1348111 () Bool)

(assert (=> b!1460196 m!1348111))

(assert (=> b!1460196 m!1348111))

(declare-fun m!1348113 () Bool)

(assert (=> b!1460196 m!1348113))

(assert (=> b!1460187 m!1348111))

(assert (=> b!1460187 m!1348111))

(declare-fun m!1348115 () Bool)

(assert (=> b!1460187 m!1348115))

(declare-fun m!1348117 () Bool)

(assert (=> b!1460204 m!1348117))

(declare-fun m!1348119 () Bool)

(assert (=> b!1460204 m!1348119))

(declare-fun m!1348121 () Bool)

(assert (=> b!1460201 m!1348121))

(assert (=> b!1460201 m!1348117))

(assert (=> b!1460201 m!1348119))

(assert (=> b!1460205 m!1348111))

(assert (=> b!1460205 m!1348111))

(declare-fun m!1348123 () Bool)

(assert (=> b!1460205 m!1348123))

(assert (=> b!1460205 m!1348123))

(assert (=> b!1460205 m!1348111))

(declare-fun m!1348125 () Bool)

(assert (=> b!1460205 m!1348125))

(declare-fun m!1348127 () Bool)

(assert (=> b!1460195 m!1348127))

(declare-fun m!1348129 () Bool)

(assert (=> b!1460200 m!1348129))

(declare-fun m!1348131 () Bool)

(assert (=> b!1460185 m!1348131))

(declare-fun m!1348133 () Bool)

(assert (=> b!1460188 m!1348133))

(assert (=> b!1460188 m!1348133))

(declare-fun m!1348135 () Bool)

(assert (=> b!1460188 m!1348135))

(assert (=> b!1460191 m!1348111))

(assert (=> b!1460191 m!1348111))

(declare-fun m!1348137 () Bool)

(assert (=> b!1460191 m!1348137))

(declare-fun m!1348139 () Bool)

(assert (=> b!1460202 m!1348139))

(assert (=> b!1460202 m!1348139))

(declare-fun m!1348141 () Bool)

(assert (=> b!1460202 m!1348141))

(declare-fun m!1348143 () Bool)

(assert (=> b!1460202 m!1348143))

(declare-fun m!1348145 () Bool)

(assert (=> b!1460202 m!1348145))

(declare-fun m!1348147 () Bool)

(assert (=> b!1460199 m!1348147))

(assert (=> b!1460197 m!1348143))

(declare-fun m!1348149 () Bool)

(assert (=> b!1460197 m!1348149))

(declare-fun m!1348151 () Bool)

(assert (=> b!1460189 m!1348151))

(declare-fun m!1348153 () Bool)

(assert (=> b!1460193 m!1348153))

(assert (=> b!1460193 m!1348143))

(declare-fun m!1348155 () Bool)

(assert (=> b!1460193 m!1348155))

(declare-fun m!1348157 () Bool)

(assert (=> b!1460193 m!1348157))

(declare-fun m!1348159 () Bool)

(assert (=> b!1460193 m!1348159))

(assert (=> b!1460193 m!1348111))

(declare-fun m!1348161 () Bool)

(assert (=> b!1460193 m!1348161))

(declare-fun m!1348163 () Bool)

(assert (=> b!1460193 m!1348163))

(assert (=> b!1460193 m!1348111))

(declare-fun m!1348165 () Bool)

(assert (=> start!125376 m!1348165))

(declare-fun m!1348167 () Bool)

(assert (=> start!125376 m!1348167))

(declare-fun m!1348169 () Bool)

(assert (=> b!1460194 m!1348169))

(check-sat (not b!1460191) (not b!1460188) (not b!1460205) (not b!1460201) (not start!125376) (not b!1460196) (not b!1460204) (not b!1460200) (not b!1460194) (not b!1460193) (not b!1460189) (not b!1460199) (not b!1460202) (not b!1460185) (not b!1460187) (not b!1460195))
(check-sat)
