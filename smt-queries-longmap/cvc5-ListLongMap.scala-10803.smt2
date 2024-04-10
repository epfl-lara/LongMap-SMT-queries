; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126406 () Bool)

(assert start!126406)

(declare-fun b!1482179 () Bool)

(declare-fun e!831184 () Bool)

(assert (=> b!1482179 (= e!831184 (not true))))

(declare-fun e!831182 () Bool)

(assert (=> b!1482179 e!831182))

(declare-fun res!1007421 () Bool)

(assert (=> b!1482179 (=> (not res!1007421) (not e!831182))))

(declare-datatypes ((array!99425 0))(
  ( (array!99426 (arr!47990 (Array (_ BitVec 32) (_ BitVec 64))) (size!48540 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99425)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99425 (_ BitVec 32)) Bool)

(assert (=> b!1482179 (= res!1007421 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49800 0))(
  ( (Unit!49801) )
))
(declare-fun lt!646998 () Unit!49800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49800)

(assert (=> b!1482179 (= lt!646998 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482180 () Bool)

(declare-fun e!831181 () Bool)

(declare-fun e!831180 () Bool)

(assert (=> b!1482180 (= e!831181 e!831180)))

(declare-fun res!1007418 () Bool)

(assert (=> b!1482180 (=> (not res!1007418) (not e!831180))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1482180 (= res!1007418 (= (select (store (arr!47990 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646995 () array!99425)

(assert (=> b!1482180 (= lt!646995 (array!99426 (store (arr!47990 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48540 a!2862)))))

(declare-fun b!1482181 () Bool)

(declare-fun e!831185 () Bool)

(assert (=> b!1482181 (= e!831180 e!831185)))

(declare-fun res!1007422 () Bool)

(assert (=> b!1482181 (=> (not res!1007422) (not e!831185))))

(declare-datatypes ((SeekEntryResult!12230 0))(
  ( (MissingZero!12230 (index!51312 (_ BitVec 32))) (Found!12230 (index!51313 (_ BitVec 32))) (Intermediate!12230 (undefined!13042 Bool) (index!51314 (_ BitVec 32)) (x!132897 (_ BitVec 32))) (Undefined!12230) (MissingVacant!12230 (index!51315 (_ BitVec 32))) )
))
(declare-fun lt!646994 () SeekEntryResult!12230)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99425 (_ BitVec 32)) SeekEntryResult!12230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482181 (= res!1007422 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47990 a!2862) j!93) mask!2687) (select (arr!47990 a!2862) j!93) a!2862 mask!2687) lt!646994))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482181 (= lt!646994 (Intermediate!12230 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482182 () Bool)

(declare-fun res!1007428 () Bool)

(assert (=> b!1482182 (=> (not res!1007428) (not e!831181))))

(assert (=> b!1482182 (= res!1007428 (and (= (size!48540 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48540 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48540 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482183 () Bool)

(declare-fun res!1007419 () Bool)

(assert (=> b!1482183 (=> (not res!1007419) (not e!831184))))

(declare-fun e!831179 () Bool)

(assert (=> b!1482183 (= res!1007419 e!831179)))

(declare-fun c!136902 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1482183 (= c!136902 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482184 () Bool)

(declare-fun res!1007425 () Bool)

(assert (=> b!1482184 (=> (not res!1007425) (not e!831182))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99425 (_ BitVec 32)) SeekEntryResult!12230)

(assert (=> b!1482184 (= res!1007425 (= (seekEntryOrOpen!0 (select (arr!47990 a!2862) j!93) a!2862 mask!2687) (Found!12230 j!93)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1482185 () Bool)

(assert (=> b!1482185 (= e!831182 (and (or (= (select (arr!47990 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47990 a!2862) intermediateBeforeIndex!19) (select (arr!47990 a!2862) j!93))) (or (and (= (select (arr!47990 a!2862) index!646) (select (store (arr!47990 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47990 a!2862) index!646) (select (arr!47990 a!2862) j!93))) (= (select (arr!47990 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47990 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1482186 () Bool)

(declare-fun res!1007430 () Bool)

(assert (=> b!1482186 (=> (not res!1007430) (not e!831181))))

(assert (=> b!1482186 (= res!1007430 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48540 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48540 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48540 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1007417 () Bool)

(assert (=> start!126406 (=> (not res!1007417) (not e!831181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126406 (= res!1007417 (validMask!0 mask!2687))))

(assert (=> start!126406 e!831181))

(assert (=> start!126406 true))

(declare-fun array_inv!37018 (array!99425) Bool)

(assert (=> start!126406 (array_inv!37018 a!2862)))

(declare-fun b!1482187 () Bool)

(declare-fun res!1007429 () Bool)

(assert (=> b!1482187 (=> (not res!1007429) (not e!831181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482187 (= res!1007429 (validKeyInArray!0 (select (arr!47990 a!2862) j!93)))))

(declare-fun b!1482188 () Bool)

(declare-fun res!1007423 () Bool)

(assert (=> b!1482188 (=> (not res!1007423) (not e!831181))))

(assert (=> b!1482188 (= res!1007423 (validKeyInArray!0 (select (arr!47990 a!2862) i!1006)))))

(declare-fun b!1482189 () Bool)

(declare-fun res!1007427 () Bool)

(assert (=> b!1482189 (=> (not res!1007427) (not e!831184))))

(assert (=> b!1482189 (= res!1007427 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482190 () Bool)

(declare-fun lt!646996 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99425 (_ BitVec 32)) SeekEntryResult!12230)

(assert (=> b!1482190 (= e!831179 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646996 lt!646995 mask!2687) (seekEntryOrOpen!0 lt!646996 lt!646995 mask!2687)))))

(declare-fun b!1482191 () Bool)

(declare-fun res!1007426 () Bool)

(assert (=> b!1482191 (=> (not res!1007426) (not e!831185))))

(assert (=> b!1482191 (= res!1007426 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47990 a!2862) j!93) a!2862 mask!2687) lt!646994))))

(declare-fun lt!646997 () SeekEntryResult!12230)

(declare-fun b!1482192 () Bool)

(assert (=> b!1482192 (= e!831179 (= lt!646997 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646996 lt!646995 mask!2687)))))

(declare-fun b!1482193 () Bool)

(declare-fun res!1007431 () Bool)

(assert (=> b!1482193 (=> (not res!1007431) (not e!831181))))

(declare-datatypes ((List!34491 0))(
  ( (Nil!34488) (Cons!34487 (h!35858 (_ BitVec 64)) (t!49185 List!34491)) )
))
(declare-fun arrayNoDuplicates!0 (array!99425 (_ BitVec 32) List!34491) Bool)

(assert (=> b!1482193 (= res!1007431 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34488))))

(declare-fun b!1482194 () Bool)

(assert (=> b!1482194 (= e!831185 e!831184)))

(declare-fun res!1007424 () Bool)

(assert (=> b!1482194 (=> (not res!1007424) (not e!831184))))

(assert (=> b!1482194 (= res!1007424 (= lt!646997 (Intermediate!12230 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482194 (= lt!646997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646996 mask!2687) lt!646996 lt!646995 mask!2687))))

(assert (=> b!1482194 (= lt!646996 (select (store (arr!47990 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482195 () Bool)

(declare-fun res!1007420 () Bool)

(assert (=> b!1482195 (=> (not res!1007420) (not e!831181))))

(assert (=> b!1482195 (= res!1007420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126406 res!1007417) b!1482182))

(assert (= (and b!1482182 res!1007428) b!1482188))

(assert (= (and b!1482188 res!1007423) b!1482187))

(assert (= (and b!1482187 res!1007429) b!1482195))

(assert (= (and b!1482195 res!1007420) b!1482193))

(assert (= (and b!1482193 res!1007431) b!1482186))

(assert (= (and b!1482186 res!1007430) b!1482180))

(assert (= (and b!1482180 res!1007418) b!1482181))

(assert (= (and b!1482181 res!1007422) b!1482191))

(assert (= (and b!1482191 res!1007426) b!1482194))

(assert (= (and b!1482194 res!1007424) b!1482183))

(assert (= (and b!1482183 c!136902) b!1482192))

(assert (= (and b!1482183 (not c!136902)) b!1482190))

(assert (= (and b!1482183 res!1007419) b!1482189))

(assert (= (and b!1482189 res!1007427) b!1482179))

(assert (= (and b!1482179 res!1007421) b!1482184))

(assert (= (and b!1482184 res!1007425) b!1482185))

(declare-fun m!1367905 () Bool)

(assert (=> b!1482195 m!1367905))

(declare-fun m!1367907 () Bool)

(assert (=> start!126406 m!1367907))

(declare-fun m!1367909 () Bool)

(assert (=> start!126406 m!1367909))

(declare-fun m!1367911 () Bool)

(assert (=> b!1482188 m!1367911))

(assert (=> b!1482188 m!1367911))

(declare-fun m!1367913 () Bool)

(assert (=> b!1482188 m!1367913))

(declare-fun m!1367915 () Bool)

(assert (=> b!1482184 m!1367915))

(assert (=> b!1482184 m!1367915))

(declare-fun m!1367917 () Bool)

(assert (=> b!1482184 m!1367917))

(declare-fun m!1367919 () Bool)

(assert (=> b!1482180 m!1367919))

(declare-fun m!1367921 () Bool)

(assert (=> b!1482180 m!1367921))

(assert (=> b!1482181 m!1367915))

(assert (=> b!1482181 m!1367915))

(declare-fun m!1367923 () Bool)

(assert (=> b!1482181 m!1367923))

(assert (=> b!1482181 m!1367923))

(assert (=> b!1482181 m!1367915))

(declare-fun m!1367925 () Bool)

(assert (=> b!1482181 m!1367925))

(declare-fun m!1367927 () Bool)

(assert (=> b!1482192 m!1367927))

(declare-fun m!1367929 () Bool)

(assert (=> b!1482193 m!1367929))

(declare-fun m!1367931 () Bool)

(assert (=> b!1482194 m!1367931))

(assert (=> b!1482194 m!1367931))

(declare-fun m!1367933 () Bool)

(assert (=> b!1482194 m!1367933))

(assert (=> b!1482194 m!1367919))

(declare-fun m!1367935 () Bool)

(assert (=> b!1482194 m!1367935))

(assert (=> b!1482185 m!1367919))

(declare-fun m!1367937 () Bool)

(assert (=> b!1482185 m!1367937))

(declare-fun m!1367939 () Bool)

(assert (=> b!1482185 m!1367939))

(declare-fun m!1367941 () Bool)

(assert (=> b!1482185 m!1367941))

(assert (=> b!1482185 m!1367915))

(assert (=> b!1482187 m!1367915))

(assert (=> b!1482187 m!1367915))

(declare-fun m!1367943 () Bool)

(assert (=> b!1482187 m!1367943))

(assert (=> b!1482191 m!1367915))

(assert (=> b!1482191 m!1367915))

(declare-fun m!1367945 () Bool)

(assert (=> b!1482191 m!1367945))

(declare-fun m!1367947 () Bool)

(assert (=> b!1482179 m!1367947))

(declare-fun m!1367949 () Bool)

(assert (=> b!1482179 m!1367949))

(declare-fun m!1367951 () Bool)

(assert (=> b!1482190 m!1367951))

(declare-fun m!1367953 () Bool)

(assert (=> b!1482190 m!1367953))

(push 1)

