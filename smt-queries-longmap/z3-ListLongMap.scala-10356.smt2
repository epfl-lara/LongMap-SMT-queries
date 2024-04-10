; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121952 () Bool)

(assert start!121952)

(declare-fun b!1415244 () Bool)

(declare-fun e!800980 () Bool)

(declare-fun e!800979 () Bool)

(assert (=> b!1415244 (= e!800980 (not e!800979))))

(declare-fun res!951288 () Bool)

(assert (=> b!1415244 (=> res!951288 e!800979)))

(declare-datatypes ((SeekEntryResult!10961 0))(
  ( (MissingZero!10961 (index!46236 (_ BitVec 32))) (Found!10961 (index!46237 (_ BitVec 32))) (Intermediate!10961 (undefined!11773 Bool) (index!46238 (_ BitVec 32)) (x!127848 (_ BitVec 32))) (Undefined!10961) (MissingVacant!10961 (index!46239 (_ BitVec 32))) )
))
(declare-fun lt!624010 () SeekEntryResult!10961)

(get-info :version)

(assert (=> b!1415244 (= res!951288 (or (not ((_ is Intermediate!10961) lt!624010)) (undefined!11773 lt!624010)))))

(declare-fun e!800983 () Bool)

(assert (=> b!1415244 e!800983))

(declare-fun res!951291 () Bool)

(assert (=> b!1415244 (=> (not res!951291) (not e!800983))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96638 0))(
  ( (array!96639 (arr!46650 (Array (_ BitVec 32) (_ BitVec 64))) (size!47200 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96638)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96638 (_ BitVec 32)) Bool)

(assert (=> b!1415244 (= res!951291 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47896 0))(
  ( (Unit!47897) )
))
(declare-fun lt!624012 () Unit!47896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47896)

(assert (=> b!1415244 (= lt!624012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624008 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96638 (_ BitVec 32)) SeekEntryResult!10961)

(assert (=> b!1415244 (= lt!624010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624008 (select (arr!46650 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415244 (= lt!624008 (toIndex!0 (select (arr!46650 a!2901) j!112) mask!2840))))

(declare-fun b!1415245 () Bool)

(declare-fun e!800981 () Bool)

(assert (=> b!1415245 (= e!800979 e!800981)))

(declare-fun res!951286 () Bool)

(assert (=> b!1415245 (=> res!951286 e!800981)))

(declare-fun lt!624011 () SeekEntryResult!10961)

(assert (=> b!1415245 (= res!951286 (or (= lt!624010 lt!624011) (not ((_ is Intermediate!10961) lt!624011))))))

(declare-fun lt!624007 () array!96638)

(declare-fun lt!624006 () (_ BitVec 64))

(assert (=> b!1415245 (= lt!624011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624006 mask!2840) lt!624006 lt!624007 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415245 (= lt!624006 (select (store (arr!46650 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415245 (= lt!624007 (array!96639 (store (arr!46650 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47200 a!2901)))))

(declare-fun res!951293 () Bool)

(assert (=> start!121952 (=> (not res!951293) (not e!800980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121952 (= res!951293 (validMask!0 mask!2840))))

(assert (=> start!121952 e!800980))

(assert (=> start!121952 true))

(declare-fun array_inv!35678 (array!96638) Bool)

(assert (=> start!121952 (array_inv!35678 a!2901)))

(declare-fun b!1415246 () Bool)

(declare-fun res!951294 () Bool)

(assert (=> b!1415246 (=> (not res!951294) (not e!800980))))

(declare-datatypes ((List!33169 0))(
  ( (Nil!33166) (Cons!33165 (h!34452 (_ BitVec 64)) (t!47863 List!33169)) )
))
(declare-fun arrayNoDuplicates!0 (array!96638 (_ BitVec 32) List!33169) Bool)

(assert (=> b!1415246 (= res!951294 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33166))))

(declare-fun b!1415247 () Bool)

(declare-fun res!951292 () Bool)

(assert (=> b!1415247 (=> (not res!951292) (not e!800980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415247 (= res!951292 (validKeyInArray!0 (select (arr!46650 a!2901) i!1037)))))

(declare-fun b!1415248 () Bool)

(assert (=> b!1415248 (= e!800981 true)))

(declare-fun e!800984 () Bool)

(assert (=> b!1415248 e!800984))

(declare-fun res!951290 () Bool)

(assert (=> b!1415248 (=> (not res!951290) (not e!800984))))

(assert (=> b!1415248 (= res!951290 (and (not (undefined!11773 lt!624011)) (= (index!46238 lt!624011) i!1037) (bvslt (x!127848 lt!624011) (x!127848 lt!624010)) (= (select (store (arr!46650 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46238 lt!624011)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624009 () Unit!47896)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47896)

(assert (=> b!1415248 (= lt!624009 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624008 (x!127848 lt!624010) (index!46238 lt!624010) (x!127848 lt!624011) (index!46238 lt!624011) (undefined!11773 lt!624011) mask!2840))))

(declare-fun b!1415249 () Bool)

(declare-fun res!951287 () Bool)

(assert (=> b!1415249 (=> (not res!951287) (not e!800980))))

(assert (=> b!1415249 (= res!951287 (and (= (size!47200 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47200 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47200 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415250 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96638 (_ BitVec 32)) SeekEntryResult!10961)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96638 (_ BitVec 32)) SeekEntryResult!10961)

(assert (=> b!1415250 (= e!800984 (= (seekEntryOrOpen!0 lt!624006 lt!624007 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127848 lt!624011) (index!46238 lt!624011) (index!46238 lt!624011) (select (arr!46650 a!2901) j!112) lt!624007 mask!2840)))))

(declare-fun b!1415251 () Bool)

(assert (=> b!1415251 (= e!800983 (= (seekEntryOrOpen!0 (select (arr!46650 a!2901) j!112) a!2901 mask!2840) (Found!10961 j!112)))))

(declare-fun b!1415252 () Bool)

(declare-fun res!951295 () Bool)

(assert (=> b!1415252 (=> (not res!951295) (not e!800980))))

(assert (=> b!1415252 (= res!951295 (validKeyInArray!0 (select (arr!46650 a!2901) j!112)))))

(declare-fun b!1415253 () Bool)

(declare-fun res!951289 () Bool)

(assert (=> b!1415253 (=> (not res!951289) (not e!800980))))

(assert (=> b!1415253 (= res!951289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121952 res!951293) b!1415249))

(assert (= (and b!1415249 res!951287) b!1415247))

(assert (= (and b!1415247 res!951292) b!1415252))

(assert (= (and b!1415252 res!951295) b!1415253))

(assert (= (and b!1415253 res!951289) b!1415246))

(assert (= (and b!1415246 res!951294) b!1415244))

(assert (= (and b!1415244 res!951291) b!1415251))

(assert (= (and b!1415244 (not res!951288)) b!1415245))

(assert (= (and b!1415245 (not res!951286)) b!1415248))

(assert (= (and b!1415248 res!951290) b!1415250))

(declare-fun m!1305447 () Bool)

(assert (=> b!1415252 m!1305447))

(assert (=> b!1415252 m!1305447))

(declare-fun m!1305449 () Bool)

(assert (=> b!1415252 m!1305449))

(assert (=> b!1415251 m!1305447))

(assert (=> b!1415251 m!1305447))

(declare-fun m!1305451 () Bool)

(assert (=> b!1415251 m!1305451))

(assert (=> b!1415244 m!1305447))

(declare-fun m!1305453 () Bool)

(assert (=> b!1415244 m!1305453))

(assert (=> b!1415244 m!1305447))

(declare-fun m!1305455 () Bool)

(assert (=> b!1415244 m!1305455))

(declare-fun m!1305457 () Bool)

(assert (=> b!1415244 m!1305457))

(assert (=> b!1415244 m!1305447))

(declare-fun m!1305459 () Bool)

(assert (=> b!1415244 m!1305459))

(declare-fun m!1305461 () Bool)

(assert (=> start!121952 m!1305461))

(declare-fun m!1305463 () Bool)

(assert (=> start!121952 m!1305463))

(declare-fun m!1305465 () Bool)

(assert (=> b!1415246 m!1305465))

(declare-fun m!1305467 () Bool)

(assert (=> b!1415247 m!1305467))

(assert (=> b!1415247 m!1305467))

(declare-fun m!1305469 () Bool)

(assert (=> b!1415247 m!1305469))

(declare-fun m!1305471 () Bool)

(assert (=> b!1415253 m!1305471))

(declare-fun m!1305473 () Bool)

(assert (=> b!1415250 m!1305473))

(assert (=> b!1415250 m!1305447))

(assert (=> b!1415250 m!1305447))

(declare-fun m!1305475 () Bool)

(assert (=> b!1415250 m!1305475))

(declare-fun m!1305477 () Bool)

(assert (=> b!1415245 m!1305477))

(assert (=> b!1415245 m!1305477))

(declare-fun m!1305479 () Bool)

(assert (=> b!1415245 m!1305479))

(declare-fun m!1305481 () Bool)

(assert (=> b!1415245 m!1305481))

(declare-fun m!1305483 () Bool)

(assert (=> b!1415245 m!1305483))

(assert (=> b!1415248 m!1305481))

(declare-fun m!1305485 () Bool)

(assert (=> b!1415248 m!1305485))

(declare-fun m!1305487 () Bool)

(assert (=> b!1415248 m!1305487))

(check-sat (not b!1415244) (not b!1415253) (not start!121952) (not b!1415246) (not b!1415252) (not b!1415247) (not b!1415251) (not b!1415245) (not b!1415250) (not b!1415248))
(check-sat)
