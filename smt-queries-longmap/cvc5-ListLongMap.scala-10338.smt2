; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121578 () Bool)

(assert start!121578)

(declare-fun b!1412286 () Bool)

(declare-fun e!799209 () Bool)

(declare-fun e!799210 () Bool)

(assert (=> b!1412286 (= e!799209 e!799210)))

(declare-fun res!949278 () Bool)

(assert (=> b!1412286 (=> res!949278 e!799210)))

(declare-datatypes ((SeekEntryResult!10906 0))(
  ( (MissingZero!10906 (index!46004 (_ BitVec 32))) (Found!10906 (index!46005 (_ BitVec 32))) (Intermediate!10906 (undefined!11718 Bool) (index!46006 (_ BitVec 32)) (x!127601 (_ BitVec 32))) (Undefined!10906) (MissingVacant!10906 (index!46007 (_ BitVec 32))) )
))
(declare-fun lt!622229 () SeekEntryResult!10906)

(declare-fun lt!622232 () SeekEntryResult!10906)

(assert (=> b!1412286 (= res!949278 (or (= lt!622229 lt!622232) (not (is-Intermediate!10906 lt!622232))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622233 () (_ BitVec 64))

(declare-datatypes ((array!96516 0))(
  ( (array!96517 (arr!46595 (Array (_ BitVec 32) (_ BitVec 64))) (size!47145 (_ BitVec 32))) )
))
(declare-fun lt!622230 () array!96516)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96516 (_ BitVec 32)) SeekEntryResult!10906)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412286 (= lt!622232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622233 mask!2840) lt!622233 lt!622230 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun a!2901 () array!96516)

(assert (=> b!1412286 (= lt!622233 (select (store (arr!46595 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412286 (= lt!622230 (array!96517 (store (arr!46595 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901)))))

(declare-fun b!1412287 () Bool)

(assert (=> b!1412287 (= e!799210 true)))

(declare-fun e!799214 () Bool)

(assert (=> b!1412287 e!799214))

(declare-fun res!949281 () Bool)

(assert (=> b!1412287 (=> (not res!949281) (not e!799214))))

(assert (=> b!1412287 (= res!949281 (and (not (undefined!11718 lt!622232)) (= (index!46006 lt!622232) i!1037) (bvslt (x!127601 lt!622232) (x!127601 lt!622229)) (= (select (store (arr!46595 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46006 lt!622232)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47786 0))(
  ( (Unit!47787) )
))
(declare-fun lt!622231 () Unit!47786)

(declare-fun lt!622227 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47786)

(assert (=> b!1412287 (= lt!622231 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622227 (x!127601 lt!622229) (index!46006 lt!622229) (x!127601 lt!622232) (index!46006 lt!622232) (undefined!11718 lt!622232) mask!2840))))

(declare-fun b!1412288 () Bool)

(declare-fun e!799212 () Bool)

(assert (=> b!1412288 (= e!799212 (not e!799209))))

(declare-fun res!949279 () Bool)

(assert (=> b!1412288 (=> res!949279 e!799209)))

(assert (=> b!1412288 (= res!949279 (or (not (is-Intermediate!10906 lt!622229)) (undefined!11718 lt!622229)))))

(declare-fun e!799211 () Bool)

(assert (=> b!1412288 e!799211))

(declare-fun res!949282 () Bool)

(assert (=> b!1412288 (=> (not res!949282) (not e!799211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96516 (_ BitVec 32)) Bool)

(assert (=> b!1412288 (= res!949282 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622228 () Unit!47786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47786)

(assert (=> b!1412288 (= lt!622228 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412288 (= lt!622229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622227 (select (arr!46595 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412288 (= lt!622227 (toIndex!0 (select (arr!46595 a!2901) j!112) mask!2840))))

(declare-fun b!1412289 () Bool)

(declare-fun res!949283 () Bool)

(assert (=> b!1412289 (=> (not res!949283) (not e!799212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412289 (= res!949283 (validKeyInArray!0 (select (arr!46595 a!2901) j!112)))))

(declare-fun res!949284 () Bool)

(assert (=> start!121578 (=> (not res!949284) (not e!799212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121578 (= res!949284 (validMask!0 mask!2840))))

(assert (=> start!121578 e!799212))

(assert (=> start!121578 true))

(declare-fun array_inv!35623 (array!96516) Bool)

(assert (=> start!121578 (array_inv!35623 a!2901)))

(declare-fun b!1412290 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96516 (_ BitVec 32)) SeekEntryResult!10906)

(assert (=> b!1412290 (= e!799211 (= (seekEntryOrOpen!0 (select (arr!46595 a!2901) j!112) a!2901 mask!2840) (Found!10906 j!112)))))

(declare-fun b!1412291 () Bool)

(declare-fun res!949276 () Bool)

(assert (=> b!1412291 (=> (not res!949276) (not e!799212))))

(assert (=> b!1412291 (= res!949276 (and (= (size!47145 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47145 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47145 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412292 () Bool)

(declare-fun res!949277 () Bool)

(assert (=> b!1412292 (=> (not res!949277) (not e!799212))))

(assert (=> b!1412292 (= res!949277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412293 () Bool)

(declare-fun res!949285 () Bool)

(assert (=> b!1412293 (=> (not res!949285) (not e!799212))))

(declare-datatypes ((List!33114 0))(
  ( (Nil!33111) (Cons!33110 (h!34385 (_ BitVec 64)) (t!47808 List!33114)) )
))
(declare-fun arrayNoDuplicates!0 (array!96516 (_ BitVec 32) List!33114) Bool)

(assert (=> b!1412293 (= res!949285 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33111))))

(declare-fun b!1412294 () Bool)

(declare-fun res!949280 () Bool)

(assert (=> b!1412294 (=> (not res!949280) (not e!799212))))

(assert (=> b!1412294 (= res!949280 (validKeyInArray!0 (select (arr!46595 a!2901) i!1037)))))

(declare-fun b!1412295 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96516 (_ BitVec 32)) SeekEntryResult!10906)

(assert (=> b!1412295 (= e!799214 (= (seekEntryOrOpen!0 lt!622233 lt!622230 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127601 lt!622232) (index!46006 lt!622232) (index!46006 lt!622232) (select (arr!46595 a!2901) j!112) lt!622230 mask!2840)))))

(assert (= (and start!121578 res!949284) b!1412291))

(assert (= (and b!1412291 res!949276) b!1412294))

(assert (= (and b!1412294 res!949280) b!1412289))

(assert (= (and b!1412289 res!949283) b!1412292))

(assert (= (and b!1412292 res!949277) b!1412293))

(assert (= (and b!1412293 res!949285) b!1412288))

(assert (= (and b!1412288 res!949282) b!1412290))

(assert (= (and b!1412288 (not res!949279)) b!1412286))

(assert (= (and b!1412286 (not res!949278)) b!1412287))

(assert (= (and b!1412287 res!949281) b!1412295))

(declare-fun m!1302249 () Bool)

(assert (=> b!1412287 m!1302249))

(declare-fun m!1302251 () Bool)

(assert (=> b!1412287 m!1302251))

(declare-fun m!1302253 () Bool)

(assert (=> b!1412287 m!1302253))

(declare-fun m!1302255 () Bool)

(assert (=> b!1412288 m!1302255))

(declare-fun m!1302257 () Bool)

(assert (=> b!1412288 m!1302257))

(assert (=> b!1412288 m!1302255))

(declare-fun m!1302259 () Bool)

(assert (=> b!1412288 m!1302259))

(assert (=> b!1412288 m!1302255))

(declare-fun m!1302261 () Bool)

(assert (=> b!1412288 m!1302261))

(declare-fun m!1302263 () Bool)

(assert (=> b!1412288 m!1302263))

(assert (=> b!1412290 m!1302255))

(assert (=> b!1412290 m!1302255))

(declare-fun m!1302265 () Bool)

(assert (=> b!1412290 m!1302265))

(declare-fun m!1302267 () Bool)

(assert (=> start!121578 m!1302267))

(declare-fun m!1302269 () Bool)

(assert (=> start!121578 m!1302269))

(declare-fun m!1302271 () Bool)

(assert (=> b!1412295 m!1302271))

(assert (=> b!1412295 m!1302255))

(assert (=> b!1412295 m!1302255))

(declare-fun m!1302273 () Bool)

(assert (=> b!1412295 m!1302273))

(declare-fun m!1302275 () Bool)

(assert (=> b!1412293 m!1302275))

(assert (=> b!1412289 m!1302255))

(assert (=> b!1412289 m!1302255))

(declare-fun m!1302277 () Bool)

(assert (=> b!1412289 m!1302277))

(declare-fun m!1302279 () Bool)

(assert (=> b!1412294 m!1302279))

(assert (=> b!1412294 m!1302279))

(declare-fun m!1302281 () Bool)

(assert (=> b!1412294 m!1302281))

(declare-fun m!1302283 () Bool)

(assert (=> b!1412286 m!1302283))

(assert (=> b!1412286 m!1302283))

(declare-fun m!1302285 () Bool)

(assert (=> b!1412286 m!1302285))

(assert (=> b!1412286 m!1302249))

(declare-fun m!1302287 () Bool)

(assert (=> b!1412286 m!1302287))

(declare-fun m!1302289 () Bool)

(assert (=> b!1412292 m!1302289))

(push 1)

