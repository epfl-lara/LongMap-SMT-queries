; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126160 () Bool)

(assert start!126160)

(declare-fun b!1477915 () Bool)

(declare-fun res!1004084 () Bool)

(declare-fun e!829067 () Bool)

(assert (=> b!1477915 (=> (not res!1004084) (not e!829067))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99244 0))(
  ( (array!99245 (arr!47902 (Array (_ BitVec 32) (_ BitVec 64))) (size!48454 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99244)

(assert (=> b!1477915 (= res!1004084 (and (= (size!48454 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48454 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48454 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1004095 () Bool)

(assert (=> start!126160 (=> (not res!1004095) (not e!829067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126160 (= res!1004095 (validMask!0 mask!2687))))

(assert (=> start!126160 e!829067))

(assert (=> start!126160 true))

(declare-fun array_inv!37135 (array!99244) Bool)

(assert (=> start!126160 (array_inv!37135 a!2862)))

(declare-fun b!1477916 () Bool)

(declare-fun res!1004083 () Bool)

(declare-fun e!829071 () Bool)

(assert (=> b!1477916 (=> (not res!1004083) (not e!829071))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477916 (= res!1004083 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477917 () Bool)

(declare-fun e!829065 () Bool)

(declare-fun e!829063 () Bool)

(assert (=> b!1477917 (= e!829065 e!829063)))

(declare-fun res!1004097 () Bool)

(assert (=> b!1477917 (=> (not res!1004097) (not e!829063))))

(declare-datatypes ((SeekEntryResult!12167 0))(
  ( (MissingZero!12167 (index!51060 (_ BitVec 32))) (Found!12167 (index!51061 (_ BitVec 32))) (Intermediate!12167 (undefined!12979 Bool) (index!51062 (_ BitVec 32)) (x!132649 (_ BitVec 32))) (Undefined!12167) (MissingVacant!12167 (index!51063 (_ BitVec 32))) )
))
(declare-fun lt!645337 () SeekEntryResult!12167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477917 (= res!1004097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47902 a!2862) j!93) mask!2687) (select (arr!47902 a!2862) j!93) a!2862 mask!2687) lt!645337))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1477917 (= lt!645337 (Intermediate!12167 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477918 () Bool)

(assert (=> b!1477918 (= e!829071 (not true))))

(declare-fun e!829064 () Bool)

(assert (=> b!1477918 e!829064))

(declare-fun res!1004094 () Bool)

(assert (=> b!1477918 (=> (not res!1004094) (not e!829064))))

(declare-fun lt!645339 () SeekEntryResult!12167)

(assert (=> b!1477918 (= res!1004094 (and (= lt!645339 (Found!12167 j!93)) (or (= (select (arr!47902 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47902 a!2862) intermediateBeforeIndex!19) (select (arr!47902 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12167)

(assert (=> b!1477918 (= lt!645339 (seekEntryOrOpen!0 (select (arr!47902 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99244 (_ BitVec 32)) Bool)

(assert (=> b!1477918 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49515 0))(
  ( (Unit!49516) )
))
(declare-fun lt!645341 () Unit!49515)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49515)

(assert (=> b!1477918 (= lt!645341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477919 () Bool)

(declare-fun e!829066 () Bool)

(declare-fun e!829070 () Bool)

(assert (=> b!1477919 (= e!829066 e!829070)))

(declare-fun res!1004096 () Bool)

(assert (=> b!1477919 (=> (not res!1004096) (not e!829070))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12167)

(assert (=> b!1477919 (= res!1004096 (= lt!645339 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47902 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477920 () Bool)

(declare-fun res!1004092 () Bool)

(assert (=> b!1477920 (=> (not res!1004092) (not e!829067))))

(declare-datatypes ((List!34481 0))(
  ( (Nil!34478) (Cons!34477 (h!35845 (_ BitVec 64)) (t!49167 List!34481)) )
))
(declare-fun arrayNoDuplicates!0 (array!99244 (_ BitVec 32) List!34481) Bool)

(assert (=> b!1477920 (= res!1004092 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34478))))

(declare-fun b!1477921 () Bool)

(declare-fun res!1004085 () Bool)

(assert (=> b!1477921 (=> (not res!1004085) (not e!829071))))

(declare-fun e!829069 () Bool)

(assert (=> b!1477921 (= res!1004085 e!829069)))

(declare-fun c!136438 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477921 (= c!136438 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477922 () Bool)

(assert (=> b!1477922 (= e!829070 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun lt!645340 () array!99244)

(declare-fun lt!645342 () (_ BitVec 64))

(declare-fun b!1477923 () Bool)

(assert (=> b!1477923 (= e!829069 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645342 lt!645340 mask!2687) (seekEntryOrOpen!0 lt!645342 lt!645340 mask!2687)))))

(declare-fun b!1477924 () Bool)

(declare-fun res!1004088 () Bool)

(assert (=> b!1477924 (=> (not res!1004088) (not e!829067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477924 (= res!1004088 (validKeyInArray!0 (select (arr!47902 a!2862) i!1006)))))

(declare-fun b!1477925 () Bool)

(assert (=> b!1477925 (= e!829064 e!829066)))

(declare-fun res!1004098 () Bool)

(assert (=> b!1477925 (=> res!1004098 e!829066)))

(assert (=> b!1477925 (= res!1004098 (or (and (= (select (arr!47902 a!2862) index!646) (select (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47902 a!2862) index!646) (select (arr!47902 a!2862) j!93))) (not (= (select (arr!47902 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477926 () Bool)

(declare-fun res!1004089 () Bool)

(assert (=> b!1477926 (=> (not res!1004089) (not e!829063))))

(assert (=> b!1477926 (= res!1004089 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47902 a!2862) j!93) a!2862 mask!2687) lt!645337))))

(declare-fun b!1477927 () Bool)

(declare-fun res!1004093 () Bool)

(assert (=> b!1477927 (=> (not res!1004093) (not e!829067))))

(assert (=> b!1477927 (= res!1004093 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48454 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48454 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48454 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477928 () Bool)

(declare-fun res!1004090 () Bool)

(assert (=> b!1477928 (=> (not res!1004090) (not e!829067))))

(assert (=> b!1477928 (= res!1004090 (validKeyInArray!0 (select (arr!47902 a!2862) j!93)))))

(declare-fun lt!645338 () SeekEntryResult!12167)

(declare-fun b!1477929 () Bool)

(assert (=> b!1477929 (= e!829069 (= lt!645338 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645342 lt!645340 mask!2687)))))

(declare-fun b!1477930 () Bool)

(assert (=> b!1477930 (= e!829063 e!829071)))

(declare-fun res!1004091 () Bool)

(assert (=> b!1477930 (=> (not res!1004091) (not e!829071))))

(assert (=> b!1477930 (= res!1004091 (= lt!645338 (Intermediate!12167 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1477930 (= lt!645338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645342 mask!2687) lt!645342 lt!645340 mask!2687))))

(assert (=> b!1477930 (= lt!645342 (select (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477931 () Bool)

(assert (=> b!1477931 (= e!829067 e!829065)))

(declare-fun res!1004087 () Bool)

(assert (=> b!1477931 (=> (not res!1004087) (not e!829065))))

(assert (=> b!1477931 (= res!1004087 (= (select (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477931 (= lt!645340 (array!99245 (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48454 a!2862)))))

(declare-fun b!1477932 () Bool)

(declare-fun res!1004086 () Bool)

(assert (=> b!1477932 (=> (not res!1004086) (not e!829067))))

(assert (=> b!1477932 (= res!1004086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126160 res!1004095) b!1477915))

(assert (= (and b!1477915 res!1004084) b!1477924))

(assert (= (and b!1477924 res!1004088) b!1477928))

(assert (= (and b!1477928 res!1004090) b!1477932))

(assert (= (and b!1477932 res!1004086) b!1477920))

(assert (= (and b!1477920 res!1004092) b!1477927))

(assert (= (and b!1477927 res!1004093) b!1477931))

(assert (= (and b!1477931 res!1004087) b!1477917))

(assert (= (and b!1477917 res!1004097) b!1477926))

(assert (= (and b!1477926 res!1004089) b!1477930))

(assert (= (and b!1477930 res!1004091) b!1477921))

(assert (= (and b!1477921 c!136438) b!1477929))

(assert (= (and b!1477921 (not c!136438)) b!1477923))

(assert (= (and b!1477921 res!1004085) b!1477916))

(assert (= (and b!1477916 res!1004083) b!1477918))

(assert (= (and b!1477918 res!1004094) b!1477925))

(assert (= (and b!1477925 (not res!1004098)) b!1477919))

(assert (= (and b!1477919 res!1004096) b!1477922))

(declare-fun m!1363359 () Bool)

(assert (=> b!1477930 m!1363359))

(assert (=> b!1477930 m!1363359))

(declare-fun m!1363361 () Bool)

(assert (=> b!1477930 m!1363361))

(declare-fun m!1363363 () Bool)

(assert (=> b!1477930 m!1363363))

(declare-fun m!1363365 () Bool)

(assert (=> b!1477930 m!1363365))

(assert (=> b!1477931 m!1363363))

(declare-fun m!1363367 () Bool)

(assert (=> b!1477931 m!1363367))

(declare-fun m!1363369 () Bool)

(assert (=> b!1477928 m!1363369))

(assert (=> b!1477928 m!1363369))

(declare-fun m!1363371 () Bool)

(assert (=> b!1477928 m!1363371))

(declare-fun m!1363373 () Bool)

(assert (=> b!1477929 m!1363373))

(assert (=> b!1477917 m!1363369))

(assert (=> b!1477917 m!1363369))

(declare-fun m!1363375 () Bool)

(assert (=> b!1477917 m!1363375))

(assert (=> b!1477917 m!1363375))

(assert (=> b!1477917 m!1363369))

(declare-fun m!1363377 () Bool)

(assert (=> b!1477917 m!1363377))

(assert (=> b!1477926 m!1363369))

(assert (=> b!1477926 m!1363369))

(declare-fun m!1363379 () Bool)

(assert (=> b!1477926 m!1363379))

(assert (=> b!1477919 m!1363369))

(assert (=> b!1477919 m!1363369))

(declare-fun m!1363381 () Bool)

(assert (=> b!1477919 m!1363381))

(declare-fun m!1363383 () Bool)

(assert (=> b!1477932 m!1363383))

(declare-fun m!1363385 () Bool)

(assert (=> b!1477924 m!1363385))

(assert (=> b!1477924 m!1363385))

(declare-fun m!1363387 () Bool)

(assert (=> b!1477924 m!1363387))

(declare-fun m!1363389 () Bool)

(assert (=> b!1477918 m!1363389))

(declare-fun m!1363391 () Bool)

(assert (=> b!1477918 m!1363391))

(assert (=> b!1477918 m!1363369))

(declare-fun m!1363393 () Bool)

(assert (=> b!1477918 m!1363393))

(declare-fun m!1363395 () Bool)

(assert (=> b!1477918 m!1363395))

(assert (=> b!1477918 m!1363369))

(declare-fun m!1363397 () Bool)

(assert (=> b!1477923 m!1363397))

(declare-fun m!1363399 () Bool)

(assert (=> b!1477923 m!1363399))

(declare-fun m!1363401 () Bool)

(assert (=> start!126160 m!1363401))

(declare-fun m!1363403 () Bool)

(assert (=> start!126160 m!1363403))

(declare-fun m!1363405 () Bool)

(assert (=> b!1477920 m!1363405))

(declare-fun m!1363407 () Bool)

(assert (=> b!1477925 m!1363407))

(assert (=> b!1477925 m!1363363))

(declare-fun m!1363409 () Bool)

(assert (=> b!1477925 m!1363409))

(assert (=> b!1477925 m!1363369))

(check-sat (not b!1477924) (not start!126160) (not b!1477929) (not b!1477923) (not b!1477932) (not b!1477930) (not b!1477920) (not b!1477919) (not b!1477917) (not b!1477926) (not b!1477928) (not b!1477918))
(check-sat)
