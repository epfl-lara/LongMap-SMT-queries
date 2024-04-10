; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125210 () Bool)

(assert start!125210)

(declare-fun b!1460498 () Bool)

(declare-fun res!990268 () Bool)

(declare-fun e!821201 () Bool)

(assert (=> b!1460498 (=> (not res!990268) (not e!821201))))

(declare-datatypes ((array!98658 0))(
  ( (array!98659 (arr!47617 (Array (_ BitVec 32) (_ BitVec 64))) (size!48167 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98658)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98658 (_ BitVec 32)) Bool)

(assert (=> b!1460498 (= res!990268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460499 () Bool)

(declare-fun e!821200 () Bool)

(declare-fun e!821203 () Bool)

(assert (=> b!1460499 (= e!821200 e!821203)))

(declare-fun res!990272 () Bool)

(assert (=> b!1460499 (=> (not res!990272) (not e!821203))))

(declare-datatypes ((SeekEntryResult!11869 0))(
  ( (MissingZero!11869 (index!49868 (_ BitVec 32))) (Found!11869 (index!49869 (_ BitVec 32))) (Intermediate!11869 (undefined!12681 Bool) (index!49870 (_ BitVec 32)) (x!131470 (_ BitVec 32))) (Undefined!11869) (MissingVacant!11869 (index!49871 (_ BitVec 32))) )
))
(declare-fun lt!639843 () SeekEntryResult!11869)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98658 (_ BitVec 32)) SeekEntryResult!11869)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460499 (= res!990272 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47617 a!2862) j!93) mask!2687) (select (arr!47617 a!2862) j!93) a!2862 mask!2687) lt!639843))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460499 (= lt!639843 (Intermediate!11869 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!821199 () Bool)

(declare-fun b!1460500 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460500 (= e!821199 (not (or (and (= (select (arr!47617 a!2862) index!646) (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47617 a!2862) index!646) (select (arr!47617 a!2862) j!93))) (= (select (arr!47617 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!821202 () Bool)

(assert (=> b!1460500 e!821202))

(declare-fun res!990273 () Bool)

(assert (=> b!1460500 (=> (not res!990273) (not e!821202))))

(assert (=> b!1460500 (= res!990273 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49234 0))(
  ( (Unit!49235) )
))
(declare-fun lt!639840 () Unit!49234)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49234)

(assert (=> b!1460500 (= lt!639840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460501 () Bool)

(declare-fun res!990266 () Bool)

(assert (=> b!1460501 (=> (not res!990266) (not e!821201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460501 (= res!990266 (validKeyInArray!0 (select (arr!47617 a!2862) i!1006)))))

(declare-fun b!1460502 () Bool)

(assert (=> b!1460502 (= e!821201 e!821200)))

(declare-fun res!990271 () Bool)

(assert (=> b!1460502 (=> (not res!990271) (not e!821200))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460502 (= res!990271 (= (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639842 () array!98658)

(assert (=> b!1460502 (= lt!639842 (array!98659 (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48167 a!2862)))))

(declare-fun lt!639841 () SeekEntryResult!11869)

(declare-fun e!821204 () Bool)

(declare-fun lt!639839 () (_ BitVec 64))

(declare-fun b!1460503 () Bool)

(assert (=> b!1460503 (= e!821204 (= lt!639841 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639839 lt!639842 mask!2687)))))

(declare-fun b!1460504 () Bool)

(declare-fun res!990274 () Bool)

(assert (=> b!1460504 (=> (not res!990274) (not e!821199))))

(assert (=> b!1460504 (= res!990274 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460505 () Bool)

(declare-fun res!990263 () Bool)

(assert (=> b!1460505 (=> (not res!990263) (not e!821201))))

(assert (=> b!1460505 (= res!990263 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48167 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48167 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48167 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!990275 () Bool)

(assert (=> start!125210 (=> (not res!990275) (not e!821201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125210 (= res!990275 (validMask!0 mask!2687))))

(assert (=> start!125210 e!821201))

(assert (=> start!125210 true))

(declare-fun array_inv!36645 (array!98658) Bool)

(assert (=> start!125210 (array_inv!36645 a!2862)))

(declare-fun b!1460506 () Bool)

(declare-fun res!990265 () Bool)

(assert (=> b!1460506 (=> (not res!990265) (not e!821199))))

(assert (=> b!1460506 (= res!990265 e!821204)))

(declare-fun c!134628 () Bool)

(assert (=> b!1460506 (= c!134628 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460507 () Bool)

(declare-fun res!990270 () Bool)

(assert (=> b!1460507 (=> (not res!990270) (not e!821201))))

(assert (=> b!1460507 (= res!990270 (validKeyInArray!0 (select (arr!47617 a!2862) j!93)))))

(declare-fun b!1460508 () Bool)

(declare-fun res!990264 () Bool)

(assert (=> b!1460508 (=> (not res!990264) (not e!821203))))

(assert (=> b!1460508 (= res!990264 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47617 a!2862) j!93) a!2862 mask!2687) lt!639843))))

(declare-fun b!1460509 () Bool)

(declare-fun res!990277 () Bool)

(assert (=> b!1460509 (=> (not res!990277) (not e!821201))))

(declare-datatypes ((List!34118 0))(
  ( (Nil!34115) (Cons!34114 (h!35464 (_ BitVec 64)) (t!48812 List!34118)) )
))
(declare-fun arrayNoDuplicates!0 (array!98658 (_ BitVec 32) List!34118) Bool)

(assert (=> b!1460509 (= res!990277 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34115))))

(declare-fun b!1460510 () Bool)

(declare-fun res!990267 () Bool)

(assert (=> b!1460510 (=> (not res!990267) (not e!821201))))

(assert (=> b!1460510 (= res!990267 (and (= (size!48167 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48167 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48167 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460511 () Bool)

(assert (=> b!1460511 (= e!821202 (or (= (select (arr!47617 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47617 a!2862) intermediateBeforeIndex!19) (select (arr!47617 a!2862) j!93))))))

(declare-fun b!1460512 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98658 (_ BitVec 32)) SeekEntryResult!11869)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98658 (_ BitVec 32)) SeekEntryResult!11869)

(assert (=> b!1460512 (= e!821204 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639839 lt!639842 mask!2687) (seekEntryOrOpen!0 lt!639839 lt!639842 mask!2687)))))

(declare-fun b!1460513 () Bool)

(declare-fun res!990276 () Bool)

(assert (=> b!1460513 (=> (not res!990276) (not e!821202))))

(assert (=> b!1460513 (= res!990276 (= (seekEntryOrOpen!0 (select (arr!47617 a!2862) j!93) a!2862 mask!2687) (Found!11869 j!93)))))

(declare-fun b!1460514 () Bool)

(assert (=> b!1460514 (= e!821203 e!821199)))

(declare-fun res!990269 () Bool)

(assert (=> b!1460514 (=> (not res!990269) (not e!821199))))

(assert (=> b!1460514 (= res!990269 (= lt!639841 (Intermediate!11869 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460514 (= lt!639841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639839 mask!2687) lt!639839 lt!639842 mask!2687))))

(assert (=> b!1460514 (= lt!639839 (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125210 res!990275) b!1460510))

(assert (= (and b!1460510 res!990267) b!1460501))

(assert (= (and b!1460501 res!990266) b!1460507))

(assert (= (and b!1460507 res!990270) b!1460498))

(assert (= (and b!1460498 res!990268) b!1460509))

(assert (= (and b!1460509 res!990277) b!1460505))

(assert (= (and b!1460505 res!990263) b!1460502))

(assert (= (and b!1460502 res!990271) b!1460499))

(assert (= (and b!1460499 res!990272) b!1460508))

(assert (= (and b!1460508 res!990264) b!1460514))

(assert (= (and b!1460514 res!990269) b!1460506))

(assert (= (and b!1460506 c!134628) b!1460503))

(assert (= (and b!1460506 (not c!134628)) b!1460512))

(assert (= (and b!1460506 res!990265) b!1460504))

(assert (= (and b!1460504 res!990274) b!1460500))

(assert (= (and b!1460500 res!990273) b!1460513))

(assert (= (and b!1460513 res!990276) b!1460511))

(declare-fun m!1348175 () Bool)

(assert (=> b!1460499 m!1348175))

(assert (=> b!1460499 m!1348175))

(declare-fun m!1348177 () Bool)

(assert (=> b!1460499 m!1348177))

(assert (=> b!1460499 m!1348177))

(assert (=> b!1460499 m!1348175))

(declare-fun m!1348179 () Bool)

(assert (=> b!1460499 m!1348179))

(declare-fun m!1348181 () Bool)

(assert (=> b!1460512 m!1348181))

(declare-fun m!1348183 () Bool)

(assert (=> b!1460512 m!1348183))

(declare-fun m!1348185 () Bool)

(assert (=> b!1460509 m!1348185))

(declare-fun m!1348187 () Bool)

(assert (=> b!1460498 m!1348187))

(declare-fun m!1348189 () Bool)

(assert (=> start!125210 m!1348189))

(declare-fun m!1348191 () Bool)

(assert (=> start!125210 m!1348191))

(assert (=> b!1460513 m!1348175))

(assert (=> b!1460513 m!1348175))

(declare-fun m!1348193 () Bool)

(assert (=> b!1460513 m!1348193))

(declare-fun m!1348195 () Bool)

(assert (=> b!1460503 m!1348195))

(declare-fun m!1348197 () Bool)

(assert (=> b!1460514 m!1348197))

(assert (=> b!1460514 m!1348197))

(declare-fun m!1348199 () Bool)

(assert (=> b!1460514 m!1348199))

(declare-fun m!1348201 () Bool)

(assert (=> b!1460514 m!1348201))

(declare-fun m!1348203 () Bool)

(assert (=> b!1460514 m!1348203))

(declare-fun m!1348205 () Bool)

(assert (=> b!1460500 m!1348205))

(assert (=> b!1460500 m!1348201))

(declare-fun m!1348207 () Bool)

(assert (=> b!1460500 m!1348207))

(declare-fun m!1348209 () Bool)

(assert (=> b!1460500 m!1348209))

(declare-fun m!1348211 () Bool)

(assert (=> b!1460500 m!1348211))

(assert (=> b!1460500 m!1348175))

(assert (=> b!1460502 m!1348201))

(declare-fun m!1348213 () Bool)

(assert (=> b!1460502 m!1348213))

(declare-fun m!1348215 () Bool)

(assert (=> b!1460511 m!1348215))

(assert (=> b!1460511 m!1348175))

(declare-fun m!1348217 () Bool)

(assert (=> b!1460501 m!1348217))

(assert (=> b!1460501 m!1348217))

(declare-fun m!1348219 () Bool)

(assert (=> b!1460501 m!1348219))

(assert (=> b!1460507 m!1348175))

(assert (=> b!1460507 m!1348175))

(declare-fun m!1348221 () Bool)

(assert (=> b!1460507 m!1348221))

(assert (=> b!1460508 m!1348175))

(assert (=> b!1460508 m!1348175))

(declare-fun m!1348223 () Bool)

(assert (=> b!1460508 m!1348223))

(push 1)

(assert (not start!125210))

(assert (not b!1460514))

(assert (not b!1460503))

(assert (not b!1460513))

(assert (not b!1460498))

