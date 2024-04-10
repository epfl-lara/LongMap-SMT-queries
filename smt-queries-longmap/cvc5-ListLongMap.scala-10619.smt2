; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124852 () Bool)

(assert start!124852)

(declare-fun b!1449510 () Bool)

(declare-fun e!816276 () Bool)

(declare-fun e!816284 () Bool)

(assert (=> b!1449510 (= e!816276 e!816284)))

(declare-fun res!980943 () Bool)

(assert (=> b!1449510 (=> res!980943 e!816284)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98300 0))(
  ( (array!98301 (arr!47438 (Array (_ BitVec 32) (_ BitVec 64))) (size!47988 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98300)

(assert (=> b!1449510 (= res!980943 (or (and (= (select (arr!47438 a!2862) index!646) (select (store (arr!47438 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47438 a!2862) index!646) (select (arr!47438 a!2862) j!93))) (not (= (select (arr!47438 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449511 () Bool)

(declare-fun e!816277 () Bool)

(assert (=> b!1449511 (= e!816277 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11690 0))(
  ( (MissingZero!11690 (index!49152 (_ BitVec 32))) (Found!11690 (index!49153 (_ BitVec 32))) (Intermediate!11690 (undefined!12502 Bool) (index!49154 (_ BitVec 32)) (x!130819 (_ BitVec 32))) (Undefined!11690) (MissingVacant!11690 (index!49155 (_ BitVec 32))) )
))
(declare-fun lt!635928 () SeekEntryResult!11690)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98300 (_ BitVec 32)) SeekEntryResult!11690)

(assert (=> b!1449511 (= lt!635928 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47438 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449512 () Bool)

(declare-fun res!980950 () Bool)

(declare-fun e!816281 () Bool)

(assert (=> b!1449512 (=> (not res!980950) (not e!816281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449512 (= res!980950 (validKeyInArray!0 (select (arr!47438 a!2862) i!1006)))))

(declare-fun b!1449513 () Bool)

(declare-fun res!980945 () Bool)

(assert (=> b!1449513 (=> (not res!980945) (not e!816281))))

(assert (=> b!1449513 (= res!980945 (and (= (size!47988 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47988 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47988 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449514 () Bool)

(declare-fun res!980959 () Bool)

(declare-fun e!816278 () Bool)

(assert (=> b!1449514 (=> (not res!980959) (not e!816278))))

(declare-fun e!816282 () Bool)

(assert (=> b!1449514 (= res!980959 e!816282)))

(declare-fun c!133794 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449514 (= c!133794 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449515 () Bool)

(declare-fun res!980949 () Bool)

(assert (=> b!1449515 (=> (not res!980949) (not e!816281))))

(assert (=> b!1449515 (= res!980949 (validKeyInArray!0 (select (arr!47438 a!2862) j!93)))))

(declare-fun lt!635926 () SeekEntryResult!11690)

(declare-fun lt!635929 () array!98300)

(declare-fun b!1449516 () Bool)

(declare-fun lt!635931 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98300 (_ BitVec 32)) SeekEntryResult!11690)

(assert (=> b!1449516 (= e!816282 (= lt!635926 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635931 lt!635929 mask!2687)))))

(declare-fun b!1449518 () Bool)

(declare-fun e!816275 () Bool)

(assert (=> b!1449518 (= e!816281 e!816275)))

(declare-fun res!980956 () Bool)

(assert (=> b!1449518 (=> (not res!980956) (not e!816275))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449518 (= res!980956 (= (select (store (arr!47438 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449518 (= lt!635929 (array!98301 (store (arr!47438 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47988 a!2862)))))

(declare-fun b!1449519 () Bool)

(declare-fun res!980944 () Bool)

(assert (=> b!1449519 (=> (not res!980944) (not e!816278))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449519 (= res!980944 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449520 () Bool)

(assert (=> b!1449520 (= e!816278 (not e!816277))))

(declare-fun res!980947 () Bool)

(assert (=> b!1449520 (=> res!980947 e!816277)))

(assert (=> b!1449520 (= res!980947 (or (and (= (select (arr!47438 a!2862) index!646) (select (store (arr!47438 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47438 a!2862) index!646) (select (arr!47438 a!2862) j!93))) (not (= (select (arr!47438 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47438 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449520 e!816276))

(declare-fun res!980952 () Bool)

(assert (=> b!1449520 (=> (not res!980952) (not e!816276))))

(declare-fun lt!635925 () SeekEntryResult!11690)

(assert (=> b!1449520 (= res!980952 (and (= lt!635925 (Found!11690 j!93)) (or (= (select (arr!47438 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47438 a!2862) intermediateBeforeIndex!19) (select (arr!47438 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98300 (_ BitVec 32)) SeekEntryResult!11690)

(assert (=> b!1449520 (= lt!635925 (seekEntryOrOpen!0 (select (arr!47438 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98300 (_ BitVec 32)) Bool)

(assert (=> b!1449520 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48876 0))(
  ( (Unit!48877) )
))
(declare-fun lt!635930 () Unit!48876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48876)

(assert (=> b!1449520 (= lt!635930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449521 () Bool)

(declare-fun res!980957 () Bool)

(assert (=> b!1449521 (=> (not res!980957) (not e!816281))))

(declare-datatypes ((List!33939 0))(
  ( (Nil!33936) (Cons!33935 (h!35285 (_ BitVec 64)) (t!48633 List!33939)) )
))
(declare-fun arrayNoDuplicates!0 (array!98300 (_ BitVec 32) List!33939) Bool)

(assert (=> b!1449521 (= res!980957 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33936))))

(declare-fun b!1449522 () Bool)

(assert (=> b!1449522 (= e!816282 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635931 lt!635929 mask!2687) (seekEntryOrOpen!0 lt!635931 lt!635929 mask!2687)))))

(declare-fun b!1449523 () Bool)

(declare-fun res!980958 () Bool)

(declare-fun e!816280 () Bool)

(assert (=> b!1449523 (=> (not res!980958) (not e!816280))))

(declare-fun lt!635927 () SeekEntryResult!11690)

(assert (=> b!1449523 (= res!980958 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47438 a!2862) j!93) a!2862 mask!2687) lt!635927))))

(declare-fun b!1449524 () Bool)

(declare-fun res!980946 () Bool)

(assert (=> b!1449524 (=> (not res!980946) (not e!816281))))

(assert (=> b!1449524 (= res!980946 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47988 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47988 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47988 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449525 () Bool)

(assert (=> b!1449525 (= e!816275 e!816280)))

(declare-fun res!980953 () Bool)

(assert (=> b!1449525 (=> (not res!980953) (not e!816280))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449525 (= res!980953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47438 a!2862) j!93) mask!2687) (select (arr!47438 a!2862) j!93) a!2862 mask!2687) lt!635927))))

(assert (=> b!1449525 (= lt!635927 (Intermediate!11690 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!816279 () Bool)

(declare-fun b!1449526 () Bool)

(assert (=> b!1449526 (= e!816279 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449527 () Bool)

(declare-fun res!980954 () Bool)

(assert (=> b!1449527 (=> (not res!980954) (not e!816281))))

(assert (=> b!1449527 (= res!980954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449528 () Bool)

(assert (=> b!1449528 (= e!816280 e!816278)))

(declare-fun res!980951 () Bool)

(assert (=> b!1449528 (=> (not res!980951) (not e!816278))))

(assert (=> b!1449528 (= res!980951 (= lt!635926 (Intermediate!11690 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449528 (= lt!635926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635931 mask!2687) lt!635931 lt!635929 mask!2687))))

(assert (=> b!1449528 (= lt!635931 (select (store (arr!47438 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!980955 () Bool)

(assert (=> start!124852 (=> (not res!980955) (not e!816281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124852 (= res!980955 (validMask!0 mask!2687))))

(assert (=> start!124852 e!816281))

(assert (=> start!124852 true))

(declare-fun array_inv!36466 (array!98300) Bool)

(assert (=> start!124852 (array_inv!36466 a!2862)))

(declare-fun b!1449517 () Bool)

(assert (=> b!1449517 (= e!816284 e!816279)))

(declare-fun res!980948 () Bool)

(assert (=> b!1449517 (=> (not res!980948) (not e!816279))))

(assert (=> b!1449517 (= res!980948 (= lt!635925 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47438 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!124852 res!980955) b!1449513))

(assert (= (and b!1449513 res!980945) b!1449512))

(assert (= (and b!1449512 res!980950) b!1449515))

(assert (= (and b!1449515 res!980949) b!1449527))

(assert (= (and b!1449527 res!980954) b!1449521))

(assert (= (and b!1449521 res!980957) b!1449524))

(assert (= (and b!1449524 res!980946) b!1449518))

(assert (= (and b!1449518 res!980956) b!1449525))

(assert (= (and b!1449525 res!980953) b!1449523))

(assert (= (and b!1449523 res!980958) b!1449528))

(assert (= (and b!1449528 res!980951) b!1449514))

(assert (= (and b!1449514 c!133794) b!1449516))

(assert (= (and b!1449514 (not c!133794)) b!1449522))

(assert (= (and b!1449514 res!980959) b!1449519))

(assert (= (and b!1449519 res!980944) b!1449520))

(assert (= (and b!1449520 res!980952) b!1449510))

(assert (= (and b!1449510 (not res!980943)) b!1449517))

(assert (= (and b!1449517 res!980948) b!1449526))

(assert (= (and b!1449520 (not res!980947)) b!1449511))

(declare-fun m!1338217 () Bool)

(assert (=> b!1449520 m!1338217))

(declare-fun m!1338219 () Bool)

(assert (=> b!1449520 m!1338219))

(declare-fun m!1338221 () Bool)

(assert (=> b!1449520 m!1338221))

(declare-fun m!1338223 () Bool)

(assert (=> b!1449520 m!1338223))

(declare-fun m!1338225 () Bool)

(assert (=> b!1449520 m!1338225))

(declare-fun m!1338227 () Bool)

(assert (=> b!1449520 m!1338227))

(declare-fun m!1338229 () Bool)

(assert (=> b!1449520 m!1338229))

(declare-fun m!1338231 () Bool)

(assert (=> b!1449520 m!1338231))

(assert (=> b!1449520 m!1338227))

(declare-fun m!1338233 () Bool)

(assert (=> b!1449512 m!1338233))

(assert (=> b!1449512 m!1338233))

(declare-fun m!1338235 () Bool)

(assert (=> b!1449512 m!1338235))

(declare-fun m!1338237 () Bool)

(assert (=> b!1449528 m!1338237))

(assert (=> b!1449528 m!1338237))

(declare-fun m!1338239 () Bool)

(assert (=> b!1449528 m!1338239))

(assert (=> b!1449528 m!1338219))

(declare-fun m!1338241 () Bool)

(assert (=> b!1449528 m!1338241))

(declare-fun m!1338243 () Bool)

(assert (=> b!1449521 m!1338243))

(assert (=> b!1449511 m!1338227))

(assert (=> b!1449511 m!1338227))

(declare-fun m!1338245 () Bool)

(assert (=> b!1449511 m!1338245))

(assert (=> b!1449515 m!1338227))

(assert (=> b!1449515 m!1338227))

(declare-fun m!1338247 () Bool)

(assert (=> b!1449515 m!1338247))

(assert (=> b!1449523 m!1338227))

(assert (=> b!1449523 m!1338227))

(declare-fun m!1338249 () Bool)

(assert (=> b!1449523 m!1338249))

(assert (=> b!1449510 m!1338225))

(assert (=> b!1449510 m!1338219))

(assert (=> b!1449510 m!1338223))

(assert (=> b!1449510 m!1338227))

(declare-fun m!1338251 () Bool)

(assert (=> b!1449522 m!1338251))

(declare-fun m!1338253 () Bool)

(assert (=> b!1449522 m!1338253))

(declare-fun m!1338255 () Bool)

(assert (=> start!124852 m!1338255))

(declare-fun m!1338257 () Bool)

(assert (=> start!124852 m!1338257))

(declare-fun m!1338259 () Bool)

(assert (=> b!1449516 m!1338259))

(assert (=> b!1449518 m!1338219))

(declare-fun m!1338261 () Bool)

(assert (=> b!1449518 m!1338261))

(declare-fun m!1338263 () Bool)

(assert (=> b!1449527 m!1338263))

(assert (=> b!1449517 m!1338227))

(assert (=> b!1449517 m!1338227))

(declare-fun m!1338265 () Bool)

(assert (=> b!1449517 m!1338265))

(assert (=> b!1449525 m!1338227))

(assert (=> b!1449525 m!1338227))

(declare-fun m!1338267 () Bool)

(assert (=> b!1449525 m!1338267))

(assert (=> b!1449525 m!1338267))

(assert (=> b!1449525 m!1338227))

(declare-fun m!1338269 () Bool)

(assert (=> b!1449525 m!1338269))

(push 1)

