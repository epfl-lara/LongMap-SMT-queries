; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127360 () Bool)

(assert start!127360)

(declare-fun b!1497000 () Bool)

(declare-fun e!838382 () Bool)

(declare-fun e!838386 () Bool)

(assert (=> b!1497000 (= e!838382 e!838386)))

(declare-fun res!1018243 () Bool)

(assert (=> b!1497000 (=> (not res!1018243) (not e!838386))))

(declare-datatypes ((SeekEntryResult!12415 0))(
  ( (MissingZero!12415 (index!52052 (_ BitVec 32))) (Found!12415 (index!52053 (_ BitVec 32))) (Intermediate!12415 (undefined!13227 Bool) (index!52054 (_ BitVec 32)) (x!133673 (_ BitVec 32))) (Undefined!12415) (MissingVacant!12415 (index!52055 (_ BitVec 32))) )
))
(declare-fun lt!652283 () SeekEntryResult!12415)

(declare-datatypes ((array!99822 0))(
  ( (array!99823 (arr!48175 (Array (_ BitVec 32) (_ BitVec 64))) (size!48725 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99822)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99822 (_ BitVec 32)) SeekEntryResult!12415)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497000 (= res!1018243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48175 a!2862) j!93) mask!2687) (select (arr!48175 a!2862) j!93) a!2862 mask!2687) lt!652283))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497000 (= lt!652283 (Intermediate!12415 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497001 () Bool)

(declare-fun e!838388 () Bool)

(assert (=> b!1497001 (= e!838388 e!838382)))

(declare-fun res!1018255 () Bool)

(assert (=> b!1497001 (=> (not res!1018255) (not e!838382))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1497001 (= res!1018255 (= (select (store (arr!48175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!652284 () array!99822)

(assert (=> b!1497001 (= lt!652284 (array!99823 (store (arr!48175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48725 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1497002 () Bool)

(declare-fun lt!652282 () (_ BitVec 32))

(declare-fun e!838383 () Bool)

(declare-fun lt!652281 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99822 (_ BitVec 32)) SeekEntryResult!12415)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99822 (_ BitVec 32)) SeekEntryResult!12415)

(assert (=> b!1497002 (= e!838383 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652282 intermediateAfterIndex!19 lt!652281 lt!652284 mask!2687) (seekEntryOrOpen!0 lt!652281 lt!652284 mask!2687))))))

(declare-fun b!1497003 () Bool)

(declare-fun res!1018257 () Bool)

(declare-fun e!838390 () Bool)

(assert (=> b!1497003 (=> res!1018257 e!838390)))

(assert (=> b!1497003 (= res!1018257 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652282 (select (arr!48175 a!2862) j!93) a!2862 mask!2687) lt!652283)))))

(declare-fun b!1497004 () Bool)

(declare-fun res!1018250 () Bool)

(declare-fun e!838389 () Bool)

(assert (=> b!1497004 (=> (not res!1018250) (not e!838389))))

(assert (=> b!1497004 (= res!1018250 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1497005 () Bool)

(declare-fun res!1018249 () Bool)

(assert (=> b!1497005 (=> (not res!1018249) (not e!838388))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1497005 (= res!1018249 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48725 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48725 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48725 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497006 () Bool)

(declare-fun res!1018248 () Bool)

(assert (=> b!1497006 (=> (not res!1018248) (not e!838388))))

(assert (=> b!1497006 (= res!1018248 (and (= (size!48725 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48725 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48725 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497007 () Bool)

(declare-fun res!1018251 () Bool)

(assert (=> b!1497007 (=> (not res!1018251) (not e!838388))))

(declare-datatypes ((List!34676 0))(
  ( (Nil!34673) (Cons!34672 (h!36069 (_ BitVec 64)) (t!49370 List!34676)) )
))
(declare-fun arrayNoDuplicates!0 (array!99822 (_ BitVec 32) List!34676) Bool)

(assert (=> b!1497007 (= res!1018251 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34673))))

(declare-fun b!1497008 () Bool)

(declare-fun res!1018241 () Bool)

(assert (=> b!1497008 (=> (not res!1018241) (not e!838388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497008 (= res!1018241 (validKeyInArray!0 (select (arr!48175 a!2862) i!1006)))))

(declare-fun b!1497009 () Bool)

(assert (=> b!1497009 (= e!838390 true)))

(declare-fun lt!652285 () SeekEntryResult!12415)

(assert (=> b!1497009 (= lt!652285 (seekEntryOrOpen!0 lt!652281 lt!652284 mask!2687))))

(declare-datatypes ((Unit!50170 0))(
  ( (Unit!50171) )
))
(declare-fun lt!652286 () Unit!50170)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50170)

(assert (=> b!1497009 (= lt!652286 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652282 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497010 () Bool)

(declare-fun res!1018242 () Bool)

(assert (=> b!1497010 (=> res!1018242 e!838390)))

(assert (=> b!1497010 (= res!1018242 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497011 () Bool)

(declare-fun res!1018253 () Bool)

(assert (=> b!1497011 (=> (not res!1018253) (not e!838388))))

(assert (=> b!1497011 (= res!1018253 (validKeyInArray!0 (select (arr!48175 a!2862) j!93)))))

(declare-fun lt!652288 () SeekEntryResult!12415)

(declare-fun e!838385 () Bool)

(declare-fun b!1497012 () Bool)

(assert (=> b!1497012 (= e!838385 (= lt!652288 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652281 lt!652284 mask!2687)))))

(declare-fun b!1497013 () Bool)

(declare-fun res!1018246 () Bool)

(assert (=> b!1497013 (=> (not res!1018246) (not e!838388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99822 (_ BitVec 32)) Bool)

(assert (=> b!1497013 (= res!1018246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1018245 () Bool)

(assert (=> start!127360 (=> (not res!1018245) (not e!838388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127360 (= res!1018245 (validMask!0 mask!2687))))

(assert (=> start!127360 e!838388))

(assert (=> start!127360 true))

(declare-fun array_inv!37203 (array!99822) Bool)

(assert (=> start!127360 (array_inv!37203 a!2862)))

(declare-fun b!1496999 () Bool)

(declare-fun e!838387 () Bool)

(assert (=> b!1496999 (= e!838389 (not e!838387))))

(declare-fun res!1018256 () Bool)

(assert (=> b!1496999 (=> res!1018256 e!838387)))

(assert (=> b!1496999 (= res!1018256 (or (and (= (select (arr!48175 a!2862) index!646) (select (store (arr!48175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48175 a!2862) index!646) (select (arr!48175 a!2862) j!93))) (= (select (arr!48175 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496999 (and (= lt!652285 (Found!12415 j!93)) (or (= (select (arr!48175 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48175 a!2862) intermediateBeforeIndex!19) (select (arr!48175 a!2862) j!93))))))

(assert (=> b!1496999 (= lt!652285 (seekEntryOrOpen!0 (select (arr!48175 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1496999 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652287 () Unit!50170)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50170)

(assert (=> b!1496999 (= lt!652287 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497014 () Bool)

(declare-fun res!1018254 () Bool)

(assert (=> b!1497014 (=> (not res!1018254) (not e!838389))))

(assert (=> b!1497014 (= res!1018254 e!838385)))

(declare-fun c!138914 () Bool)

(assert (=> b!1497014 (= c!138914 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497015 () Bool)

(declare-fun res!1018244 () Bool)

(assert (=> b!1497015 (=> (not res!1018244) (not e!838386))))

(assert (=> b!1497015 (= res!1018244 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48175 a!2862) j!93) a!2862 mask!2687) lt!652283))))

(declare-fun b!1497016 () Bool)

(assert (=> b!1497016 (= e!838383 (not (= lt!652288 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652282 lt!652281 lt!652284 mask!2687))))))

(declare-fun b!1497017 () Bool)

(assert (=> b!1497017 (= e!838385 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652281 lt!652284 mask!2687) (seekEntryOrOpen!0 lt!652281 lt!652284 mask!2687)))))

(declare-fun b!1497018 () Bool)

(declare-fun res!1018247 () Bool)

(assert (=> b!1497018 (=> res!1018247 e!838390)))

(assert (=> b!1497018 (= res!1018247 e!838383)))

(declare-fun c!138913 () Bool)

(assert (=> b!1497018 (= c!138913 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497019 () Bool)

(assert (=> b!1497019 (= e!838386 e!838389)))

(declare-fun res!1018258 () Bool)

(assert (=> b!1497019 (=> (not res!1018258) (not e!838389))))

(assert (=> b!1497019 (= res!1018258 (= lt!652288 (Intermediate!12415 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1497019 (= lt!652288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652281 mask!2687) lt!652281 lt!652284 mask!2687))))

(assert (=> b!1497019 (= lt!652281 (select (store (arr!48175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497020 () Bool)

(assert (=> b!1497020 (= e!838387 e!838390)))

(declare-fun res!1018252 () Bool)

(assert (=> b!1497020 (=> res!1018252 e!838390)))

(assert (=> b!1497020 (= res!1018252 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652282 #b00000000000000000000000000000000) (bvsge lt!652282 (size!48725 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497020 (= lt!652282 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!127360 res!1018245) b!1497006))

(assert (= (and b!1497006 res!1018248) b!1497008))

(assert (= (and b!1497008 res!1018241) b!1497011))

(assert (= (and b!1497011 res!1018253) b!1497013))

(assert (= (and b!1497013 res!1018246) b!1497007))

(assert (= (and b!1497007 res!1018251) b!1497005))

(assert (= (and b!1497005 res!1018249) b!1497001))

(assert (= (and b!1497001 res!1018255) b!1497000))

(assert (= (and b!1497000 res!1018243) b!1497015))

(assert (= (and b!1497015 res!1018244) b!1497019))

(assert (= (and b!1497019 res!1018258) b!1497014))

(assert (= (and b!1497014 c!138914) b!1497012))

(assert (= (and b!1497014 (not c!138914)) b!1497017))

(assert (= (and b!1497014 res!1018254) b!1497004))

(assert (= (and b!1497004 res!1018250) b!1496999))

(assert (= (and b!1496999 (not res!1018256)) b!1497020))

(assert (= (and b!1497020 (not res!1018252)) b!1497003))

(assert (= (and b!1497003 (not res!1018257)) b!1497018))

(assert (= (and b!1497018 c!138913) b!1497016))

(assert (= (and b!1497018 (not c!138913)) b!1497002))

(assert (= (and b!1497018 (not res!1018247)) b!1497010))

(assert (= (and b!1497010 (not res!1018242)) b!1497009))

(declare-fun m!1380115 () Bool)

(assert (=> b!1497000 m!1380115))

(assert (=> b!1497000 m!1380115))

(declare-fun m!1380117 () Bool)

(assert (=> b!1497000 m!1380117))

(assert (=> b!1497000 m!1380117))

(assert (=> b!1497000 m!1380115))

(declare-fun m!1380119 () Bool)

(assert (=> b!1497000 m!1380119))

(declare-fun m!1380121 () Bool)

(assert (=> b!1497016 m!1380121))

(declare-fun m!1380123 () Bool)

(assert (=> b!1497012 m!1380123))

(declare-fun m!1380125 () Bool)

(assert (=> b!1497019 m!1380125))

(assert (=> b!1497019 m!1380125))

(declare-fun m!1380127 () Bool)

(assert (=> b!1497019 m!1380127))

(declare-fun m!1380129 () Bool)

(assert (=> b!1497019 m!1380129))

(declare-fun m!1380131 () Bool)

(assert (=> b!1497019 m!1380131))

(assert (=> b!1497003 m!1380115))

(assert (=> b!1497003 m!1380115))

(declare-fun m!1380133 () Bool)

(assert (=> b!1497003 m!1380133))

(declare-fun m!1380135 () Bool)

(assert (=> start!127360 m!1380135))

(declare-fun m!1380137 () Bool)

(assert (=> start!127360 m!1380137))

(assert (=> b!1497001 m!1380129))

(declare-fun m!1380139 () Bool)

(assert (=> b!1497001 m!1380139))

(declare-fun m!1380141 () Bool)

(assert (=> b!1496999 m!1380141))

(assert (=> b!1496999 m!1380129))

(declare-fun m!1380143 () Bool)

(assert (=> b!1496999 m!1380143))

(declare-fun m!1380145 () Bool)

(assert (=> b!1496999 m!1380145))

(declare-fun m!1380147 () Bool)

(assert (=> b!1496999 m!1380147))

(assert (=> b!1496999 m!1380115))

(declare-fun m!1380149 () Bool)

(assert (=> b!1496999 m!1380149))

(declare-fun m!1380151 () Bool)

(assert (=> b!1496999 m!1380151))

(assert (=> b!1496999 m!1380115))

(declare-fun m!1380153 () Bool)

(assert (=> b!1497008 m!1380153))

(assert (=> b!1497008 m!1380153))

(declare-fun m!1380155 () Bool)

(assert (=> b!1497008 m!1380155))

(declare-fun m!1380157 () Bool)

(assert (=> b!1497009 m!1380157))

(declare-fun m!1380159 () Bool)

(assert (=> b!1497009 m!1380159))

(assert (=> b!1497011 m!1380115))

(assert (=> b!1497011 m!1380115))

(declare-fun m!1380161 () Bool)

(assert (=> b!1497011 m!1380161))

(declare-fun m!1380163 () Bool)

(assert (=> b!1497002 m!1380163))

(assert (=> b!1497002 m!1380157))

(declare-fun m!1380165 () Bool)

(assert (=> b!1497013 m!1380165))

(declare-fun m!1380167 () Bool)

(assert (=> b!1497007 m!1380167))

(assert (=> b!1497015 m!1380115))

(assert (=> b!1497015 m!1380115))

(declare-fun m!1380169 () Bool)

(assert (=> b!1497015 m!1380169))

(declare-fun m!1380171 () Bool)

(assert (=> b!1497020 m!1380171))

(declare-fun m!1380173 () Bool)

(assert (=> b!1497017 m!1380173))

(assert (=> b!1497017 m!1380157))

(push 1)

