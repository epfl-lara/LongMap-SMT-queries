; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126806 () Bool)

(assert start!126806)

(declare-fun b!1489491 () Bool)

(declare-fun e!834709 () Bool)

(declare-fun e!834710 () Bool)

(assert (=> b!1489491 (= e!834709 e!834710)))

(declare-fun res!1013101 () Bool)

(assert (=> b!1489491 (=> (not res!1013101) (not e!834710))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99577 0))(
  ( (array!99578 (arr!48061 (Array (_ BitVec 32) (_ BitVec 64))) (size!48613 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99577)

(assert (=> b!1489491 (= res!1013101 (= (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!649421 () array!99577)

(assert (=> b!1489491 (= lt!649421 (array!99578 (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48613 a!2862)))))

(declare-fun b!1489492 () Bool)

(declare-fun e!834716 () Bool)

(declare-fun e!834714 () Bool)

(assert (=> b!1489492 (= e!834716 e!834714)))

(declare-fun res!1013095 () Bool)

(assert (=> b!1489492 (=> res!1013095 e!834714)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649426 () (_ BitVec 32))

(assert (=> b!1489492 (= res!1013095 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649426 #b00000000000000000000000000000000) (bvsge lt!649426 (size!48613 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489492 (= lt!649426 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649425 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12326 0))(
  ( (MissingZero!12326 (index!51696 (_ BitVec 32))) (Found!12326 (index!51697 (_ BitVec 32))) (Intermediate!12326 (undefined!13138 Bool) (index!51698 (_ BitVec 32)) (x!133287 (_ BitVec 32))) (Undefined!12326) (MissingVacant!12326 (index!51699 (_ BitVec 32))) )
))
(declare-fun lt!649424 () SeekEntryResult!12326)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99577 (_ BitVec 32)) SeekEntryResult!12326)

(assert (=> b!1489492 (= lt!649424 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649425 lt!649421 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99577 (_ BitVec 32)) SeekEntryResult!12326)

(assert (=> b!1489492 (= lt!649424 (seekEntryOrOpen!0 lt!649425 lt!649421 mask!2687))))

(declare-fun b!1489493 () Bool)

(declare-fun res!1013087 () Bool)

(assert (=> b!1489493 (=> res!1013087 e!834714)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489493 (= res!1013087 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489494 () Bool)

(declare-fun e!834715 () Bool)

(assert (=> b!1489494 (= e!834710 e!834715)))

(declare-fun res!1013085 () Bool)

(assert (=> b!1489494 (=> (not res!1013085) (not e!834715))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!649423 () SeekEntryResult!12326)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99577 (_ BitVec 32)) SeekEntryResult!12326)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489494 (= res!1013085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!649423))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1489494 (= lt!649423 (Intermediate!12326 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489495 () Bool)

(declare-fun res!1013088 () Bool)

(declare-fun e!834712 () Bool)

(assert (=> b!1489495 (=> (not res!1013088) (not e!834712))))

(assert (=> b!1489495 (= res!1013088 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489496 () Bool)

(declare-fun e!834711 () Bool)

(declare-fun lt!649427 () SeekEntryResult!12326)

(assert (=> b!1489496 (= e!834711 (= lt!649427 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649425 lt!649421 mask!2687)))))

(declare-fun b!1489497 () Bool)

(declare-fun res!1013091 () Bool)

(assert (=> b!1489497 (=> (not res!1013091) (not e!834709))))

(assert (=> b!1489497 (= res!1013091 (and (= (size!48613 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48613 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48613 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489498 () Bool)

(declare-fun res!1013086 () Bool)

(assert (=> b!1489498 (=> (not res!1013086) (not e!834709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489498 (= res!1013086 (validKeyInArray!0 (select (arr!48061 a!2862) i!1006)))))

(declare-fun b!1489499 () Bool)

(declare-fun res!1013099 () Bool)

(assert (=> b!1489499 (=> (not res!1013099) (not e!834709))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489499 (= res!1013099 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48613 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48613 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48613 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489500 () Bool)

(declare-fun e!834708 () Bool)

(assert (=> b!1489500 (= e!834708 (not (= lt!649427 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649426 lt!649425 lt!649421 mask!2687))))))

(declare-fun b!1489501 () Bool)

(declare-fun res!1013084 () Bool)

(assert (=> b!1489501 (=> res!1013084 e!834714)))

(assert (=> b!1489501 (= res!1013084 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649426 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!649423)))))

(declare-fun b!1489502 () Bool)

(assert (=> b!1489502 (= e!834714 true)))

(declare-fun lt!649419 () SeekEntryResult!12326)

(assert (=> b!1489502 (= lt!649419 lt!649424)))

(declare-datatypes ((Unit!49833 0))(
  ( (Unit!49834) )
))
(declare-fun lt!649422 () Unit!49833)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49833)

(assert (=> b!1489502 (= lt!649422 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649426 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489503 () Bool)

(assert (=> b!1489503 (= e!834711 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649425 lt!649421 mask!2687) (seekEntryOrOpen!0 lt!649425 lt!649421 mask!2687)))))

(declare-fun res!1013090 () Bool)

(assert (=> start!126806 (=> (not res!1013090) (not e!834709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126806 (= res!1013090 (validMask!0 mask!2687))))

(assert (=> start!126806 e!834709))

(assert (=> start!126806 true))

(declare-fun array_inv!37294 (array!99577) Bool)

(assert (=> start!126806 (array_inv!37294 a!2862)))

(declare-fun b!1489504 () Bool)

(assert (=> b!1489504 (= e!834708 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649426 intermediateAfterIndex!19 lt!649425 lt!649421 mask!2687) lt!649424)))))

(declare-fun b!1489505 () Bool)

(assert (=> b!1489505 (= e!834715 e!834712)))

(declare-fun res!1013089 () Bool)

(assert (=> b!1489505 (=> (not res!1013089) (not e!834712))))

(assert (=> b!1489505 (= res!1013089 (= lt!649427 (Intermediate!12326 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489505 (= lt!649427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649425 mask!2687) lt!649425 lt!649421 mask!2687))))

(assert (=> b!1489505 (= lt!649425 (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489506 () Bool)

(declare-fun res!1013096 () Bool)

(assert (=> b!1489506 (=> (not res!1013096) (not e!834712))))

(assert (=> b!1489506 (= res!1013096 e!834711)))

(declare-fun c!137733 () Bool)

(assert (=> b!1489506 (= c!137733 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489507 () Bool)

(declare-fun res!1013097 () Bool)

(assert (=> b!1489507 (=> (not res!1013097) (not e!834715))))

(assert (=> b!1489507 (= res!1013097 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!649423))))

(declare-fun b!1489508 () Bool)

(declare-fun res!1013098 () Bool)

(assert (=> b!1489508 (=> (not res!1013098) (not e!834709))))

(declare-datatypes ((List!34640 0))(
  ( (Nil!34637) (Cons!34636 (h!36019 (_ BitVec 64)) (t!49326 List!34640)) )
))
(declare-fun arrayNoDuplicates!0 (array!99577 (_ BitVec 32) List!34640) Bool)

(assert (=> b!1489508 (= res!1013098 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34637))))

(declare-fun b!1489509 () Bool)

(declare-fun res!1013092 () Bool)

(assert (=> b!1489509 (=> res!1013092 e!834714)))

(assert (=> b!1489509 (= res!1013092 e!834708)))

(declare-fun c!137734 () Bool)

(assert (=> b!1489509 (= c!137734 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489510 () Bool)

(assert (=> b!1489510 (= e!834712 (not e!834716))))

(declare-fun res!1013093 () Bool)

(assert (=> b!1489510 (=> res!1013093 e!834716)))

(assert (=> b!1489510 (= res!1013093 (or (and (= (select (arr!48061 a!2862) index!646) (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48061 a!2862) index!646) (select (arr!48061 a!2862) j!93))) (= (select (arr!48061 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489510 (and (= lt!649419 (Found!12326 j!93)) (or (= (select (arr!48061 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48061 a!2862) intermediateBeforeIndex!19) (select (arr!48061 a!2862) j!93))) (let ((bdg!54754 (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48061 a!2862) index!646) bdg!54754) (= (select (arr!48061 a!2862) index!646) (select (arr!48061 a!2862) j!93))) (= (select (arr!48061 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54754 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489510 (= lt!649419 (seekEntryOrOpen!0 (select (arr!48061 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99577 (_ BitVec 32)) Bool)

(assert (=> b!1489510 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649420 () Unit!49833)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49833)

(assert (=> b!1489510 (= lt!649420 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489511 () Bool)

(declare-fun res!1013100 () Bool)

(assert (=> b!1489511 (=> (not res!1013100) (not e!834709))))

(assert (=> b!1489511 (= res!1013100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489512 () Bool)

(declare-fun res!1013094 () Bool)

(assert (=> b!1489512 (=> (not res!1013094) (not e!834709))))

(assert (=> b!1489512 (= res!1013094 (validKeyInArray!0 (select (arr!48061 a!2862) j!93)))))

(assert (= (and start!126806 res!1013090) b!1489497))

(assert (= (and b!1489497 res!1013091) b!1489498))

(assert (= (and b!1489498 res!1013086) b!1489512))

(assert (= (and b!1489512 res!1013094) b!1489511))

(assert (= (and b!1489511 res!1013100) b!1489508))

(assert (= (and b!1489508 res!1013098) b!1489499))

(assert (= (and b!1489499 res!1013099) b!1489491))

(assert (= (and b!1489491 res!1013101) b!1489494))

(assert (= (and b!1489494 res!1013085) b!1489507))

(assert (= (and b!1489507 res!1013097) b!1489505))

(assert (= (and b!1489505 res!1013089) b!1489506))

(assert (= (and b!1489506 c!137733) b!1489496))

(assert (= (and b!1489506 (not c!137733)) b!1489503))

(assert (= (and b!1489506 res!1013096) b!1489495))

(assert (= (and b!1489495 res!1013088) b!1489510))

(assert (= (and b!1489510 (not res!1013093)) b!1489492))

(assert (= (and b!1489492 (not res!1013095)) b!1489501))

(assert (= (and b!1489501 (not res!1013084)) b!1489509))

(assert (= (and b!1489509 c!137734) b!1489500))

(assert (= (and b!1489509 (not c!137734)) b!1489504))

(assert (= (and b!1489509 (not res!1013092)) b!1489493))

(assert (= (and b!1489493 (not res!1013087)) b!1489502))

(declare-fun m!1373151 () Bool)

(assert (=> b!1489505 m!1373151))

(assert (=> b!1489505 m!1373151))

(declare-fun m!1373153 () Bool)

(assert (=> b!1489505 m!1373153))

(declare-fun m!1373155 () Bool)

(assert (=> b!1489505 m!1373155))

(declare-fun m!1373157 () Bool)

(assert (=> b!1489505 m!1373157))

(declare-fun m!1373159 () Bool)

(assert (=> b!1489512 m!1373159))

(assert (=> b!1489512 m!1373159))

(declare-fun m!1373161 () Bool)

(assert (=> b!1489512 m!1373161))

(declare-fun m!1373163 () Bool)

(assert (=> b!1489496 m!1373163))

(declare-fun m!1373165 () Bool)

(assert (=> b!1489502 m!1373165))

(assert (=> b!1489501 m!1373159))

(assert (=> b!1489501 m!1373159))

(declare-fun m!1373167 () Bool)

(assert (=> b!1489501 m!1373167))

(declare-fun m!1373169 () Bool)

(assert (=> b!1489498 m!1373169))

(assert (=> b!1489498 m!1373169))

(declare-fun m!1373171 () Bool)

(assert (=> b!1489498 m!1373171))

(assert (=> b!1489491 m!1373155))

(declare-fun m!1373173 () Bool)

(assert (=> b!1489491 m!1373173))

(assert (=> b!1489494 m!1373159))

(assert (=> b!1489494 m!1373159))

(declare-fun m!1373175 () Bool)

(assert (=> b!1489494 m!1373175))

(assert (=> b!1489494 m!1373175))

(assert (=> b!1489494 m!1373159))

(declare-fun m!1373177 () Bool)

(assert (=> b!1489494 m!1373177))

(declare-fun m!1373179 () Bool)

(assert (=> b!1489508 m!1373179))

(declare-fun m!1373181 () Bool)

(assert (=> b!1489503 m!1373181))

(declare-fun m!1373183 () Bool)

(assert (=> b!1489503 m!1373183))

(declare-fun m!1373185 () Bool)

(assert (=> start!126806 m!1373185))

(declare-fun m!1373187 () Bool)

(assert (=> start!126806 m!1373187))

(assert (=> b!1489507 m!1373159))

(assert (=> b!1489507 m!1373159))

(declare-fun m!1373189 () Bool)

(assert (=> b!1489507 m!1373189))

(declare-fun m!1373191 () Bool)

(assert (=> b!1489504 m!1373191))

(declare-fun m!1373193 () Bool)

(assert (=> b!1489500 m!1373193))

(declare-fun m!1373195 () Bool)

(assert (=> b!1489492 m!1373195))

(assert (=> b!1489492 m!1373181))

(assert (=> b!1489492 m!1373183))

(declare-fun m!1373197 () Bool)

(assert (=> b!1489511 m!1373197))

(declare-fun m!1373199 () Bool)

(assert (=> b!1489510 m!1373199))

(assert (=> b!1489510 m!1373155))

(declare-fun m!1373201 () Bool)

(assert (=> b!1489510 m!1373201))

(declare-fun m!1373203 () Bool)

(assert (=> b!1489510 m!1373203))

(declare-fun m!1373205 () Bool)

(assert (=> b!1489510 m!1373205))

(assert (=> b!1489510 m!1373159))

(declare-fun m!1373207 () Bool)

(assert (=> b!1489510 m!1373207))

(declare-fun m!1373209 () Bool)

(assert (=> b!1489510 m!1373209))

(assert (=> b!1489510 m!1373159))

(check-sat (not b!1489503) (not b!1489504) (not b!1489496) (not b!1489502) (not b!1489507) (not b!1489492) (not b!1489501) (not b!1489511) (not b!1489500) (not start!126806) (not b!1489505) (not b!1489508) (not b!1489510) (not b!1489494) (not b!1489498) (not b!1489512))
(check-sat)
