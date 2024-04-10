; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125174 () Bool)

(assert start!125174)

(declare-fun b!1459386 () Bool)

(declare-fun res!989349 () Bool)

(declare-fun e!820741 () Bool)

(assert (=> b!1459386 (=> (not res!989349) (not e!820741))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459386 (= res!989349 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!989338 () Bool)

(declare-fun e!820737 () Bool)

(assert (=> start!125174 (=> (not res!989338) (not e!820737))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125174 (= res!989338 (validMask!0 mask!2687))))

(assert (=> start!125174 e!820737))

(assert (=> start!125174 true))

(declare-datatypes ((array!98622 0))(
  ( (array!98623 (arr!47599 (Array (_ BitVec 32) (_ BitVec 64))) (size!48149 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98622)

(declare-fun array_inv!36627 (array!98622) Bool)

(assert (=> start!125174 (array_inv!36627 a!2862)))

(declare-fun b!1459387 () Bool)

(declare-fun e!820742 () Bool)

(assert (=> b!1459387 (= e!820742 e!820741)))

(declare-fun res!989342 () Bool)

(assert (=> b!1459387 (=> (not res!989342) (not e!820741))))

(declare-datatypes ((SeekEntryResult!11851 0))(
  ( (MissingZero!11851 (index!49796 (_ BitVec 32))) (Found!11851 (index!49797 (_ BitVec 32))) (Intermediate!11851 (undefined!12663 Bool) (index!49798 (_ BitVec 32)) (x!131404 (_ BitVec 32))) (Undefined!11851) (MissingVacant!11851 (index!49799 (_ BitVec 32))) )
))
(declare-fun lt!639421 () SeekEntryResult!11851)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459387 (= res!989342 (= lt!639421 (Intermediate!11851 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639425 () array!98622)

(declare-fun lt!639429 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98622 (_ BitVec 32)) SeekEntryResult!11851)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459387 (= lt!639421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639429 mask!2687) lt!639429 lt!639425 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1459387 (= lt!639429 (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459388 () Bool)

(declare-fun res!989337 () Bool)

(assert (=> b!1459388 (=> (not res!989337) (not e!820741))))

(declare-fun e!820739 () Bool)

(assert (=> b!1459388 (= res!989337 e!820739)))

(declare-fun c!134538 () Bool)

(assert (=> b!1459388 (= c!134538 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459389 () Bool)

(declare-fun res!989340 () Bool)

(declare-fun e!820744 () Bool)

(assert (=> b!1459389 (=> res!989340 e!820744)))

(assert (=> b!1459389 (= res!989340 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459390 () Bool)

(assert (=> b!1459390 (= e!820744 true)))

(declare-fun lt!639428 () SeekEntryResult!11851)

(declare-fun lt!639424 () SeekEntryResult!11851)

(assert (=> b!1459390 (= lt!639428 lt!639424)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!639427 () (_ BitVec 32))

(declare-datatypes ((Unit!49198 0))(
  ( (Unit!49199) )
))
(declare-fun lt!639426 () Unit!49198)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49198)

(assert (=> b!1459390 (= lt!639426 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639427 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459391 () Bool)

(declare-fun res!989350 () Bool)

(assert (=> b!1459391 (=> (not res!989350) (not e!820742))))

(declare-fun lt!639422 () SeekEntryResult!11851)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1459391 (= res!989350 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!639422))))

(declare-fun b!1459392 () Bool)

(declare-fun res!989343 () Bool)

(assert (=> b!1459392 (=> (not res!989343) (not e!820737))))

(declare-datatypes ((List!34100 0))(
  ( (Nil!34097) (Cons!34096 (h!35446 (_ BitVec 64)) (t!48794 List!34100)) )
))
(declare-fun arrayNoDuplicates!0 (array!98622 (_ BitVec 32) List!34100) Bool)

(assert (=> b!1459392 (= res!989343 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34097))))

(declare-fun b!1459393 () Bool)

(declare-fun res!989336 () Bool)

(assert (=> b!1459393 (=> res!989336 e!820744)))

(declare-fun e!820740 () Bool)

(assert (=> b!1459393 (= res!989336 e!820740)))

(declare-fun c!134537 () Bool)

(assert (=> b!1459393 (= c!134537 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459394 () Bool)

(declare-fun res!989334 () Bool)

(assert (=> b!1459394 (=> res!989334 e!820744)))

(assert (=> b!1459394 (= res!989334 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639427 (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!639422)))))

(declare-fun b!1459395 () Bool)

(declare-fun e!820738 () Bool)

(assert (=> b!1459395 (= e!820737 e!820738)))

(declare-fun res!989333 () Bool)

(assert (=> b!1459395 (=> (not res!989333) (not e!820738))))

(assert (=> b!1459395 (= res!989333 (= (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459395 (= lt!639425 (array!98623 (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48149 a!2862)))))

(declare-fun b!1459396 () Bool)

(assert (=> b!1459396 (= e!820738 e!820742)))

(declare-fun res!989344 () Bool)

(assert (=> b!1459396 (=> (not res!989344) (not e!820742))))

(assert (=> b!1459396 (= res!989344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47599 a!2862) j!93) mask!2687) (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!639422))))

(assert (=> b!1459396 (= lt!639422 (Intermediate!11851 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459397 () Bool)

(declare-fun res!989341 () Bool)

(assert (=> b!1459397 (=> (not res!989341) (not e!820737))))

(assert (=> b!1459397 (= res!989341 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48149 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48149 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48149 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459398 () Bool)

(assert (=> b!1459398 (= e!820740 (not (= lt!639421 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639427 lt!639429 lt!639425 mask!2687))))))

(declare-fun b!1459399 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98622 (_ BitVec 32)) SeekEntryResult!11851)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98622 (_ BitVec 32)) SeekEntryResult!11851)

(assert (=> b!1459399 (= e!820739 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639429 lt!639425 mask!2687) (seekEntryOrOpen!0 lt!639429 lt!639425 mask!2687)))))

(declare-fun b!1459400 () Bool)

(declare-fun res!989347 () Bool)

(assert (=> b!1459400 (=> (not res!989347) (not e!820737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98622 (_ BitVec 32)) Bool)

(assert (=> b!1459400 (= res!989347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459401 () Bool)

(declare-fun res!989348 () Bool)

(assert (=> b!1459401 (=> (not res!989348) (not e!820737))))

(assert (=> b!1459401 (= res!989348 (and (= (size!48149 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48149 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48149 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459402 () Bool)

(declare-fun res!989339 () Bool)

(assert (=> b!1459402 (=> (not res!989339) (not e!820737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459402 (= res!989339 (validKeyInArray!0 (select (arr!47599 a!2862) i!1006)))))

(declare-fun b!1459403 () Bool)

(declare-fun e!820743 () Bool)

(assert (=> b!1459403 (= e!820741 (not e!820743))))

(declare-fun res!989345 () Bool)

(assert (=> b!1459403 (=> res!989345 e!820743)))

(assert (=> b!1459403 (= res!989345 (or (and (= (select (arr!47599 a!2862) index!646) (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47599 a!2862) index!646) (select (arr!47599 a!2862) j!93))) (= (select (arr!47599 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459403 (and (= lt!639428 (Found!11851 j!93)) (or (= (select (arr!47599 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47599 a!2862) intermediateBeforeIndex!19) (select (arr!47599 a!2862) j!93))) (let ((bdg!53501 (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47599 a!2862) index!646) bdg!53501) (= (select (arr!47599 a!2862) index!646) (select (arr!47599 a!2862) j!93))) (= (select (arr!47599 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53501 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459403 (= lt!639428 (seekEntryOrOpen!0 (select (arr!47599 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459403 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639423 () Unit!49198)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49198)

(assert (=> b!1459403 (= lt!639423 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459404 () Bool)

(assert (=> b!1459404 (= e!820740 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639427 intermediateAfterIndex!19 lt!639429 lt!639425 mask!2687) lt!639424)))))

(declare-fun b!1459405 () Bool)

(assert (=> b!1459405 (= e!820739 (= lt!639421 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639429 lt!639425 mask!2687)))))

(declare-fun b!1459406 () Bool)

(declare-fun res!989346 () Bool)

(assert (=> b!1459406 (=> (not res!989346) (not e!820737))))

(assert (=> b!1459406 (= res!989346 (validKeyInArray!0 (select (arr!47599 a!2862) j!93)))))

(declare-fun b!1459407 () Bool)

(assert (=> b!1459407 (= e!820743 e!820744)))

(declare-fun res!989335 () Bool)

(assert (=> b!1459407 (=> res!989335 e!820744)))

(assert (=> b!1459407 (= res!989335 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639427 #b00000000000000000000000000000000) (bvsge lt!639427 (size!48149 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459407 (= lt!639427 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459407 (= lt!639424 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639429 lt!639425 mask!2687))))

(assert (=> b!1459407 (= lt!639424 (seekEntryOrOpen!0 lt!639429 lt!639425 mask!2687))))

(assert (= (and start!125174 res!989338) b!1459401))

(assert (= (and b!1459401 res!989348) b!1459402))

(assert (= (and b!1459402 res!989339) b!1459406))

(assert (= (and b!1459406 res!989346) b!1459400))

(assert (= (and b!1459400 res!989347) b!1459392))

(assert (= (and b!1459392 res!989343) b!1459397))

(assert (= (and b!1459397 res!989341) b!1459395))

(assert (= (and b!1459395 res!989333) b!1459396))

(assert (= (and b!1459396 res!989344) b!1459391))

(assert (= (and b!1459391 res!989350) b!1459387))

(assert (= (and b!1459387 res!989342) b!1459388))

(assert (= (and b!1459388 c!134538) b!1459405))

(assert (= (and b!1459388 (not c!134538)) b!1459399))

(assert (= (and b!1459388 res!989337) b!1459386))

(assert (= (and b!1459386 res!989349) b!1459403))

(assert (= (and b!1459403 (not res!989345)) b!1459407))

(assert (= (and b!1459407 (not res!989335)) b!1459394))

(assert (= (and b!1459394 (not res!989334)) b!1459393))

(assert (= (and b!1459393 c!134537) b!1459398))

(assert (= (and b!1459393 (not c!134537)) b!1459404))

(assert (= (and b!1459393 (not res!989336)) b!1459389))

(assert (= (and b!1459389 (not res!989340)) b!1459390))

(declare-fun m!1347151 () Bool)

(assert (=> b!1459390 m!1347151))

(declare-fun m!1347153 () Bool)

(assert (=> b!1459402 m!1347153))

(assert (=> b!1459402 m!1347153))

(declare-fun m!1347155 () Bool)

(assert (=> b!1459402 m!1347155))

(declare-fun m!1347157 () Bool)

(assert (=> b!1459400 m!1347157))

(declare-fun m!1347159 () Bool)

(assert (=> b!1459398 m!1347159))

(declare-fun m!1347161 () Bool)

(assert (=> b!1459395 m!1347161))

(declare-fun m!1347163 () Bool)

(assert (=> b!1459395 m!1347163))

(declare-fun m!1347165 () Bool)

(assert (=> b!1459404 m!1347165))

(declare-fun m!1347167 () Bool)

(assert (=> start!125174 m!1347167))

(declare-fun m!1347169 () Bool)

(assert (=> start!125174 m!1347169))

(declare-fun m!1347171 () Bool)

(assert (=> b!1459399 m!1347171))

(declare-fun m!1347173 () Bool)

(assert (=> b!1459399 m!1347173))

(declare-fun m!1347175 () Bool)

(assert (=> b!1459391 m!1347175))

(assert (=> b!1459391 m!1347175))

(declare-fun m!1347177 () Bool)

(assert (=> b!1459391 m!1347177))

(declare-fun m!1347179 () Bool)

(assert (=> b!1459403 m!1347179))

(assert (=> b!1459403 m!1347161))

(declare-fun m!1347181 () Bool)

(assert (=> b!1459403 m!1347181))

(declare-fun m!1347183 () Bool)

(assert (=> b!1459403 m!1347183))

(declare-fun m!1347185 () Bool)

(assert (=> b!1459403 m!1347185))

(assert (=> b!1459403 m!1347175))

(declare-fun m!1347187 () Bool)

(assert (=> b!1459403 m!1347187))

(declare-fun m!1347189 () Bool)

(assert (=> b!1459403 m!1347189))

(assert (=> b!1459403 m!1347175))

(declare-fun m!1347191 () Bool)

(assert (=> b!1459387 m!1347191))

(assert (=> b!1459387 m!1347191))

(declare-fun m!1347193 () Bool)

(assert (=> b!1459387 m!1347193))

(assert (=> b!1459387 m!1347161))

(declare-fun m!1347195 () Bool)

(assert (=> b!1459387 m!1347195))

(assert (=> b!1459396 m!1347175))

(assert (=> b!1459396 m!1347175))

(declare-fun m!1347197 () Bool)

(assert (=> b!1459396 m!1347197))

(assert (=> b!1459396 m!1347197))

(assert (=> b!1459396 m!1347175))

(declare-fun m!1347199 () Bool)

(assert (=> b!1459396 m!1347199))

(assert (=> b!1459394 m!1347175))

(assert (=> b!1459394 m!1347175))

(declare-fun m!1347201 () Bool)

(assert (=> b!1459394 m!1347201))

(declare-fun m!1347203 () Bool)

(assert (=> b!1459392 m!1347203))

(assert (=> b!1459406 m!1347175))

(assert (=> b!1459406 m!1347175))

(declare-fun m!1347205 () Bool)

(assert (=> b!1459406 m!1347205))

(declare-fun m!1347207 () Bool)

(assert (=> b!1459407 m!1347207))

(assert (=> b!1459407 m!1347171))

(assert (=> b!1459407 m!1347173))

(declare-fun m!1347209 () Bool)

(assert (=> b!1459405 m!1347209))

(push 1)

