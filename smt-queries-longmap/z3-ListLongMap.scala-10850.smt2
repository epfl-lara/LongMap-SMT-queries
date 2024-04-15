; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126962 () Bool)

(assert start!126962)

(declare-fun b!1492366 () Bool)

(declare-fun res!1015399 () Bool)

(declare-fun e!836030 () Bool)

(assert (=> b!1492366 (=> (not res!1015399) (not e!836030))))

(declare-datatypes ((array!99670 0))(
  ( (array!99671 (arr!48106 (Array (_ BitVec 32) (_ BitVec 64))) (size!48658 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99670)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492366 (= res!1015399 (validKeyInArray!0 (select (arr!48106 a!2862) i!1006)))))

(declare-fun b!1492367 () Bool)

(declare-fun e!836029 () Bool)

(declare-fun e!836033 () Bool)

(assert (=> b!1492367 (= e!836029 e!836033)))

(declare-fun res!1015384 () Bool)

(assert (=> b!1492367 (=> (not res!1015384) (not e!836033))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12371 0))(
  ( (MissingZero!12371 (index!51876 (_ BitVec 32))) (Found!12371 (index!51877 (_ BitVec 32))) (Intermediate!12371 (undefined!13183 Bool) (index!51878 (_ BitVec 32)) (x!133464 (_ BitVec 32))) (Undefined!12371) (MissingVacant!12371 (index!51879 (_ BitVec 32))) )
))
(declare-fun lt!650446 () SeekEntryResult!12371)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99670 (_ BitVec 32)) SeekEntryResult!12371)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492367 (= res!1015384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48106 a!2862) j!93) mask!2687) (select (arr!48106 a!2862) j!93) a!2862 mask!2687) lt!650446))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492367 (= lt!650446 (Intermediate!12371 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492368 () Bool)

(declare-fun res!1015396 () Bool)

(assert (=> b!1492368 (=> (not res!1015396) (not e!836033))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1492368 (= res!1015396 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48106 a!2862) j!93) a!2862 mask!2687) lt!650446))))

(declare-fun b!1492369 () Bool)

(declare-fun e!836036 () Bool)

(assert (=> b!1492369 (= e!836033 e!836036)))

(declare-fun res!1015392 () Bool)

(assert (=> b!1492369 (=> (not res!1015392) (not e!836036))))

(declare-fun lt!650447 () SeekEntryResult!12371)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492369 (= res!1015392 (= lt!650447 (Intermediate!12371 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650445 () (_ BitVec 64))

(declare-fun lt!650448 () array!99670)

(assert (=> b!1492369 (= lt!650447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650445 mask!2687) lt!650445 lt!650448 mask!2687))))

(assert (=> b!1492369 (= lt!650445 (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1015391 () Bool)

(assert (=> start!126962 (=> (not res!1015391) (not e!836030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126962 (= res!1015391 (validMask!0 mask!2687))))

(assert (=> start!126962 e!836030))

(assert (=> start!126962 true))

(declare-fun array_inv!37339 (array!99670) Bool)

(assert (=> start!126962 (array_inv!37339 a!2862)))

(declare-fun b!1492370 () Bool)

(declare-fun e!836035 () Bool)

(assert (=> b!1492370 (= e!836036 (not e!836035))))

(declare-fun res!1015387 () Bool)

(assert (=> b!1492370 (=> res!1015387 e!836035)))

(assert (=> b!1492370 (= res!1015387 (or (and (= (select (arr!48106 a!2862) index!646) (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48106 a!2862) index!646) (select (arr!48106 a!2862) j!93))) (= (select (arr!48106 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836031 () Bool)

(assert (=> b!1492370 e!836031))

(declare-fun res!1015394 () Bool)

(assert (=> b!1492370 (=> (not res!1015394) (not e!836031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99670 (_ BitVec 32)) Bool)

(assert (=> b!1492370 (= res!1015394 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49923 0))(
  ( (Unit!49924) )
))
(declare-fun lt!650449 () Unit!49923)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49923)

(assert (=> b!1492370 (= lt!650449 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492371 () Bool)

(declare-fun res!1015386 () Bool)

(assert (=> b!1492371 (=> (not res!1015386) (not e!836036))))

(assert (=> b!1492371 (= res!1015386 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492372 () Bool)

(declare-fun res!1015398 () Bool)

(assert (=> b!1492372 (=> (not res!1015398) (not e!836030))))

(assert (=> b!1492372 (= res!1015398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!836032 () Bool)

(declare-fun b!1492373 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99670 (_ BitVec 32)) SeekEntryResult!12371)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99670 (_ BitVec 32)) SeekEntryResult!12371)

(assert (=> b!1492373 (= e!836032 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650445 lt!650448 mask!2687) (seekEntryOrOpen!0 lt!650445 lt!650448 mask!2687)))))

(declare-fun b!1492374 () Bool)

(declare-fun res!1015389 () Bool)

(assert (=> b!1492374 (=> (not res!1015389) (not e!836036))))

(assert (=> b!1492374 (= res!1015389 e!836032)))

(declare-fun c!138022 () Bool)

(assert (=> b!1492374 (= c!138022 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492375 () Bool)

(declare-fun res!1015390 () Bool)

(assert (=> b!1492375 (=> (not res!1015390) (not e!836030))))

(assert (=> b!1492375 (= res!1015390 (and (= (size!48658 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48658 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48658 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492376 () Bool)

(assert (=> b!1492376 (= e!836031 (or (= (select (arr!48106 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48106 a!2862) intermediateBeforeIndex!19) (select (arr!48106 a!2862) j!93))))))

(declare-fun b!1492377 () Bool)

(assert (=> b!1492377 (= e!836035 true)))

(declare-fun lt!650450 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492377 (= lt!650450 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492378 () Bool)

(assert (=> b!1492378 (= e!836030 e!836029)))

(declare-fun res!1015393 () Bool)

(assert (=> b!1492378 (=> (not res!1015393) (not e!836029))))

(assert (=> b!1492378 (= res!1015393 (= (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492378 (= lt!650448 (array!99671 (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48658 a!2862)))))

(declare-fun b!1492379 () Bool)

(declare-fun res!1015397 () Bool)

(assert (=> b!1492379 (=> (not res!1015397) (not e!836030))))

(declare-datatypes ((List!34685 0))(
  ( (Nil!34682) (Cons!34681 (h!36067 (_ BitVec 64)) (t!49371 List!34685)) )
))
(declare-fun arrayNoDuplicates!0 (array!99670 (_ BitVec 32) List!34685) Bool)

(assert (=> b!1492379 (= res!1015397 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34682))))

(declare-fun b!1492380 () Bool)

(declare-fun res!1015395 () Bool)

(assert (=> b!1492380 (=> (not res!1015395) (not e!836030))))

(assert (=> b!1492380 (= res!1015395 (validKeyInArray!0 (select (arr!48106 a!2862) j!93)))))

(declare-fun b!1492381 () Bool)

(declare-fun res!1015385 () Bool)

(assert (=> b!1492381 (=> (not res!1015385) (not e!836030))))

(assert (=> b!1492381 (= res!1015385 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48658 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48658 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48658 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492382 () Bool)

(assert (=> b!1492382 (= e!836032 (= lt!650447 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650445 lt!650448 mask!2687)))))

(declare-fun b!1492383 () Bool)

(declare-fun res!1015388 () Bool)

(assert (=> b!1492383 (=> (not res!1015388) (not e!836031))))

(assert (=> b!1492383 (= res!1015388 (= (seekEntryOrOpen!0 (select (arr!48106 a!2862) j!93) a!2862 mask!2687) (Found!12371 j!93)))))

(assert (= (and start!126962 res!1015391) b!1492375))

(assert (= (and b!1492375 res!1015390) b!1492366))

(assert (= (and b!1492366 res!1015399) b!1492380))

(assert (= (and b!1492380 res!1015395) b!1492372))

(assert (= (and b!1492372 res!1015398) b!1492379))

(assert (= (and b!1492379 res!1015397) b!1492381))

(assert (= (and b!1492381 res!1015385) b!1492378))

(assert (= (and b!1492378 res!1015393) b!1492367))

(assert (= (and b!1492367 res!1015384) b!1492368))

(assert (= (and b!1492368 res!1015396) b!1492369))

(assert (= (and b!1492369 res!1015392) b!1492374))

(assert (= (and b!1492374 c!138022) b!1492382))

(assert (= (and b!1492374 (not c!138022)) b!1492373))

(assert (= (and b!1492374 res!1015389) b!1492371))

(assert (= (and b!1492371 res!1015386) b!1492370))

(assert (= (and b!1492370 res!1015394) b!1492383))

(assert (= (and b!1492383 res!1015388) b!1492376))

(assert (= (and b!1492370 (not res!1015387)) b!1492377))

(declare-fun m!1375773 () Bool)

(assert (=> b!1492380 m!1375773))

(assert (=> b!1492380 m!1375773))

(declare-fun m!1375775 () Bool)

(assert (=> b!1492380 m!1375775))

(declare-fun m!1375777 () Bool)

(assert (=> start!126962 m!1375777))

(declare-fun m!1375779 () Bool)

(assert (=> start!126962 m!1375779))

(declare-fun m!1375781 () Bool)

(assert (=> b!1492377 m!1375781))

(declare-fun m!1375783 () Bool)

(assert (=> b!1492382 m!1375783))

(declare-fun m!1375785 () Bool)

(assert (=> b!1492372 m!1375785))

(declare-fun m!1375787 () Bool)

(assert (=> b!1492379 m!1375787))

(declare-fun m!1375789 () Bool)

(assert (=> b!1492370 m!1375789))

(declare-fun m!1375791 () Bool)

(assert (=> b!1492370 m!1375791))

(declare-fun m!1375793 () Bool)

(assert (=> b!1492370 m!1375793))

(declare-fun m!1375795 () Bool)

(assert (=> b!1492370 m!1375795))

(declare-fun m!1375797 () Bool)

(assert (=> b!1492370 m!1375797))

(assert (=> b!1492370 m!1375773))

(assert (=> b!1492367 m!1375773))

(assert (=> b!1492367 m!1375773))

(declare-fun m!1375799 () Bool)

(assert (=> b!1492367 m!1375799))

(assert (=> b!1492367 m!1375799))

(assert (=> b!1492367 m!1375773))

(declare-fun m!1375801 () Bool)

(assert (=> b!1492367 m!1375801))

(assert (=> b!1492368 m!1375773))

(assert (=> b!1492368 m!1375773))

(declare-fun m!1375803 () Bool)

(assert (=> b!1492368 m!1375803))

(declare-fun m!1375805 () Bool)

(assert (=> b!1492366 m!1375805))

(assert (=> b!1492366 m!1375805))

(declare-fun m!1375807 () Bool)

(assert (=> b!1492366 m!1375807))

(declare-fun m!1375809 () Bool)

(assert (=> b!1492376 m!1375809))

(assert (=> b!1492376 m!1375773))

(assert (=> b!1492378 m!1375791))

(declare-fun m!1375811 () Bool)

(assert (=> b!1492378 m!1375811))

(assert (=> b!1492383 m!1375773))

(assert (=> b!1492383 m!1375773))

(declare-fun m!1375813 () Bool)

(assert (=> b!1492383 m!1375813))

(declare-fun m!1375815 () Bool)

(assert (=> b!1492369 m!1375815))

(assert (=> b!1492369 m!1375815))

(declare-fun m!1375817 () Bool)

(assert (=> b!1492369 m!1375817))

(assert (=> b!1492369 m!1375791))

(declare-fun m!1375819 () Bool)

(assert (=> b!1492369 m!1375819))

(declare-fun m!1375821 () Bool)

(assert (=> b!1492373 m!1375821))

(declare-fun m!1375823 () Bool)

(assert (=> b!1492373 m!1375823))

(check-sat (not b!1492383) (not b!1492367) (not b!1492377) (not b!1492382) (not start!126962) (not b!1492370) (not b!1492368) (not b!1492372) (not b!1492373) (not b!1492369) (not b!1492366) (not b!1492379) (not b!1492380))
(check-sat)
