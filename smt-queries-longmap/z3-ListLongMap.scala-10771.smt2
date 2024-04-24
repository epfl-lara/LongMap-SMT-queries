; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126402 () Bool)

(assert start!126402)

(declare-fun res!1003188 () Bool)

(declare-fun e!829353 () Bool)

(assert (=> start!126402 (=> (not res!1003188) (not e!829353))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126402 (= res!1003188 (validMask!0 mask!2687))))

(assert (=> start!126402 e!829353))

(assert (=> start!126402 true))

(declare-datatypes ((array!99346 0))(
  ( (array!99347 (arr!47947 (Array (_ BitVec 32) (_ BitVec 64))) (size!48498 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99346)

(declare-fun array_inv!37228 (array!99346) Bool)

(assert (=> start!126402 (array_inv!37228 a!2862)))

(declare-fun b!1478036 () Bool)

(declare-fun res!1003197 () Bool)

(assert (=> b!1478036 (=> (not res!1003197) (not e!829353))))

(declare-datatypes ((List!34435 0))(
  ( (Nil!34432) (Cons!34431 (h!35813 (_ BitVec 64)) (t!49121 List!34435)) )
))
(declare-fun arrayNoDuplicates!0 (array!99346 (_ BitVec 32) List!34435) Bool)

(assert (=> b!1478036 (= res!1003197 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34432))))

(declare-fun b!1478037 () Bool)

(declare-fun res!1003199 () Bool)

(assert (=> b!1478037 (=> (not res!1003199) (not e!829353))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478037 (= res!1003199 (and (= (size!48498 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48498 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48498 a!2862)) (not (= i!1006 j!93))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1478038 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!829357 () Bool)

(assert (=> b!1478038 (= e!829357 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun lt!645614 () (_ BitVec 64))

(declare-fun lt!645617 () array!99346)

(declare-fun e!829355 () Bool)

(declare-datatypes ((SeekEntryResult!12084 0))(
  ( (MissingZero!12084 (index!50728 (_ BitVec 32))) (Found!12084 (index!50729 (_ BitVec 32))) (Intermediate!12084 (undefined!12896 Bool) (index!50730 (_ BitVec 32)) (x!132516 (_ BitVec 32))) (Undefined!12084) (MissingVacant!12084 (index!50731 (_ BitVec 32))) )
))
(declare-fun lt!645618 () SeekEntryResult!12084)

(declare-fun b!1478039 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99346 (_ BitVec 32)) SeekEntryResult!12084)

(assert (=> b!1478039 (= e!829355 (= lt!645618 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645614 lt!645617 mask!2687)))))

(declare-fun b!1478040 () Bool)

(declare-fun e!829352 () Bool)

(assert (=> b!1478040 (= e!829352 e!829357)))

(declare-fun res!1003200 () Bool)

(assert (=> b!1478040 (=> (not res!1003200) (not e!829357))))

(declare-fun lt!645619 () SeekEntryResult!12084)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99346 (_ BitVec 32)) SeekEntryResult!12084)

(assert (=> b!1478040 (= res!1003200 (= lt!645619 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47947 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478041 () Bool)

(declare-fun res!1003190 () Bool)

(assert (=> b!1478041 (=> (not res!1003190) (not e!829353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99346 (_ BitVec 32)) Bool)

(assert (=> b!1478041 (= res!1003190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478042 () Bool)

(declare-fun e!829359 () Bool)

(declare-fun e!829356 () Bool)

(assert (=> b!1478042 (= e!829359 e!829356)))

(declare-fun res!1003195 () Bool)

(assert (=> b!1478042 (=> (not res!1003195) (not e!829356))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478042 (= res!1003195 (= lt!645618 (Intermediate!12084 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478042 (= lt!645618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645614 mask!2687) lt!645614 lt!645617 mask!2687))))

(assert (=> b!1478042 (= lt!645614 (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478043 () Bool)

(declare-fun e!829351 () Bool)

(assert (=> b!1478043 (= e!829353 e!829351)))

(declare-fun res!1003194 () Bool)

(assert (=> b!1478043 (=> (not res!1003194) (not e!829351))))

(assert (=> b!1478043 (= res!1003194 (= (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478043 (= lt!645617 (array!99347 (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48498 a!2862)))))

(declare-fun b!1478044 () Bool)

(declare-fun res!1003202 () Bool)

(assert (=> b!1478044 (=> (not res!1003202) (not e!829353))))

(assert (=> b!1478044 (= res!1003202 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48498 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48498 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48498 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478045 () Bool)

(declare-fun res!1003196 () Bool)

(assert (=> b!1478045 (=> (not res!1003196) (not e!829353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478045 (= res!1003196 (validKeyInArray!0 (select (arr!47947 a!2862) j!93)))))

(declare-fun b!1478046 () Bool)

(declare-fun res!1003192 () Bool)

(assert (=> b!1478046 (=> (not res!1003192) (not e!829356))))

(assert (=> b!1478046 (= res!1003192 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478047 () Bool)

(assert (=> b!1478047 (= e!829351 e!829359)))

(declare-fun res!1003201 () Bool)

(assert (=> b!1478047 (=> (not res!1003201) (not e!829359))))

(declare-fun lt!645616 () SeekEntryResult!12084)

(assert (=> b!1478047 (= res!1003201 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47947 a!2862) j!93) mask!2687) (select (arr!47947 a!2862) j!93) a!2862 mask!2687) lt!645616))))

(assert (=> b!1478047 (= lt!645616 (Intermediate!12084 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478048 () Bool)

(declare-fun res!1003198 () Bool)

(assert (=> b!1478048 (=> (not res!1003198) (not e!829356))))

(assert (=> b!1478048 (= res!1003198 e!829355)))

(declare-fun c!136954 () Bool)

(assert (=> b!1478048 (= c!136954 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478049 () Bool)

(declare-fun e!829358 () Bool)

(assert (=> b!1478049 (= e!829358 e!829352)))

(declare-fun res!1003191 () Bool)

(assert (=> b!1478049 (=> res!1003191 e!829352)))

(assert (=> b!1478049 (= res!1003191 (or (and (= (select (arr!47947 a!2862) index!646) (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47947 a!2862) index!646) (select (arr!47947 a!2862) j!93))) (not (= (select (arr!47947 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478050 () Bool)

(declare-fun res!1003189 () Bool)

(assert (=> b!1478050 (=> (not res!1003189) (not e!829359))))

(assert (=> b!1478050 (= res!1003189 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47947 a!2862) j!93) a!2862 mask!2687) lt!645616))))

(declare-fun b!1478051 () Bool)

(declare-fun res!1003193 () Bool)

(assert (=> b!1478051 (=> (not res!1003193) (not e!829353))))

(assert (=> b!1478051 (= res!1003193 (validKeyInArray!0 (select (arr!47947 a!2862) i!1006)))))

(declare-fun b!1478052 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99346 (_ BitVec 32)) SeekEntryResult!12084)

(assert (=> b!1478052 (= e!829355 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645614 lt!645617 mask!2687) (seekEntryOrOpen!0 lt!645614 lt!645617 mask!2687)))))

(declare-fun b!1478053 () Bool)

(assert (=> b!1478053 (= e!829356 (not true))))

(assert (=> b!1478053 e!829358))

(declare-fun res!1003187 () Bool)

(assert (=> b!1478053 (=> (not res!1003187) (not e!829358))))

(assert (=> b!1478053 (= res!1003187 (and (= lt!645619 (Found!12084 j!93)) (or (= (select (arr!47947 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47947 a!2862) intermediateBeforeIndex!19) (select (arr!47947 a!2862) j!93)))))))

(assert (=> b!1478053 (= lt!645619 (seekEntryOrOpen!0 (select (arr!47947 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478053 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49541 0))(
  ( (Unit!49542) )
))
(declare-fun lt!645615 () Unit!49541)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49541)

(assert (=> b!1478053 (= lt!645615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126402 res!1003188) b!1478037))

(assert (= (and b!1478037 res!1003199) b!1478051))

(assert (= (and b!1478051 res!1003193) b!1478045))

(assert (= (and b!1478045 res!1003196) b!1478041))

(assert (= (and b!1478041 res!1003190) b!1478036))

(assert (= (and b!1478036 res!1003197) b!1478044))

(assert (= (and b!1478044 res!1003202) b!1478043))

(assert (= (and b!1478043 res!1003194) b!1478047))

(assert (= (and b!1478047 res!1003201) b!1478050))

(assert (= (and b!1478050 res!1003189) b!1478042))

(assert (= (and b!1478042 res!1003195) b!1478048))

(assert (= (and b!1478048 c!136954) b!1478039))

(assert (= (and b!1478048 (not c!136954)) b!1478052))

(assert (= (and b!1478048 res!1003198) b!1478046))

(assert (= (and b!1478046 res!1003192) b!1478053))

(assert (= (and b!1478053 res!1003187) b!1478049))

(assert (= (and b!1478049 (not res!1003191)) b!1478040))

(assert (= (and b!1478040 res!1003200) b!1478038))

(declare-fun m!1364005 () Bool)

(assert (=> b!1478041 m!1364005))

(declare-fun m!1364007 () Bool)

(assert (=> b!1478040 m!1364007))

(assert (=> b!1478040 m!1364007))

(declare-fun m!1364009 () Bool)

(assert (=> b!1478040 m!1364009))

(assert (=> b!1478047 m!1364007))

(assert (=> b!1478047 m!1364007))

(declare-fun m!1364011 () Bool)

(assert (=> b!1478047 m!1364011))

(assert (=> b!1478047 m!1364011))

(assert (=> b!1478047 m!1364007))

(declare-fun m!1364013 () Bool)

(assert (=> b!1478047 m!1364013))

(declare-fun m!1364015 () Bool)

(assert (=> start!126402 m!1364015))

(declare-fun m!1364017 () Bool)

(assert (=> start!126402 m!1364017))

(declare-fun m!1364019 () Bool)

(assert (=> b!1478042 m!1364019))

(assert (=> b!1478042 m!1364019))

(declare-fun m!1364021 () Bool)

(assert (=> b!1478042 m!1364021))

(declare-fun m!1364023 () Bool)

(assert (=> b!1478042 m!1364023))

(declare-fun m!1364025 () Bool)

(assert (=> b!1478042 m!1364025))

(declare-fun m!1364027 () Bool)

(assert (=> b!1478039 m!1364027))

(assert (=> b!1478050 m!1364007))

(assert (=> b!1478050 m!1364007))

(declare-fun m!1364029 () Bool)

(assert (=> b!1478050 m!1364029))

(assert (=> b!1478043 m!1364023))

(declare-fun m!1364031 () Bool)

(assert (=> b!1478043 m!1364031))

(declare-fun m!1364033 () Bool)

(assert (=> b!1478051 m!1364033))

(assert (=> b!1478051 m!1364033))

(declare-fun m!1364035 () Bool)

(assert (=> b!1478051 m!1364035))

(declare-fun m!1364037 () Bool)

(assert (=> b!1478049 m!1364037))

(assert (=> b!1478049 m!1364023))

(declare-fun m!1364039 () Bool)

(assert (=> b!1478049 m!1364039))

(assert (=> b!1478049 m!1364007))

(declare-fun m!1364041 () Bool)

(assert (=> b!1478052 m!1364041))

(declare-fun m!1364043 () Bool)

(assert (=> b!1478052 m!1364043))

(assert (=> b!1478045 m!1364007))

(assert (=> b!1478045 m!1364007))

(declare-fun m!1364045 () Bool)

(assert (=> b!1478045 m!1364045))

(declare-fun m!1364047 () Bool)

(assert (=> b!1478036 m!1364047))

(declare-fun m!1364049 () Bool)

(assert (=> b!1478053 m!1364049))

(declare-fun m!1364051 () Bool)

(assert (=> b!1478053 m!1364051))

(assert (=> b!1478053 m!1364007))

(declare-fun m!1364053 () Bool)

(assert (=> b!1478053 m!1364053))

(declare-fun m!1364055 () Bool)

(assert (=> b!1478053 m!1364055))

(assert (=> b!1478053 m!1364007))

(check-sat (not b!1478042) (not b!1478051) (not start!126402) (not b!1478052) (not b!1478040) (not b!1478036) (not b!1478041) (not b!1478039) (not b!1478053) (not b!1478045) (not b!1478050) (not b!1478047))
(check-sat)
