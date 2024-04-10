; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125566 () Bool)

(assert start!125566)

(declare-fun b!1469163 () Bool)

(declare-fun res!997708 () Bool)

(declare-fun e!824828 () Bool)

(assert (=> b!1469163 (=> (not res!997708) (not e!824828))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99014 0))(
  ( (array!99015 (arr!47795 (Array (_ BitVec 32) (_ BitVec 64))) (size!48345 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99014)

(assert (=> b!1469163 (= res!997708 (and (= (size!48345 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48345 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48345 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997706 () Bool)

(assert (=> start!125566 (=> (not res!997706) (not e!824828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125566 (= res!997706 (validMask!0 mask!2687))))

(assert (=> start!125566 e!824828))

(assert (=> start!125566 true))

(declare-fun array_inv!36823 (array!99014) Bool)

(assert (=> start!125566 (array_inv!36823 a!2862)))

(declare-fun b!1469164 () Bool)

(declare-fun e!824829 () Bool)

(declare-fun e!824831 () Bool)

(assert (=> b!1469164 (= e!824829 e!824831)))

(declare-fun res!997707 () Bool)

(assert (=> b!1469164 (=> (not res!997707) (not e!824831))))

(declare-datatypes ((SeekEntryResult!12035 0))(
  ( (MissingZero!12035 (index!50532 (_ BitVec 32))) (Found!12035 (index!50533 (_ BitVec 32))) (Intermediate!12035 (undefined!12847 Bool) (index!50534 (_ BitVec 32)) (x!132116 (_ BitVec 32))) (Undefined!12035) (MissingVacant!12035 (index!50535 (_ BitVec 32))) )
))
(declare-fun lt!642459 () SeekEntryResult!12035)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469164 (= res!997707 (= lt!642459 (Intermediate!12035 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642455 () array!99014)

(declare-fun lt!642458 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99014 (_ BitVec 32)) SeekEntryResult!12035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469164 (= lt!642459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642458 mask!2687) lt!642458 lt!642455 mask!2687))))

(assert (=> b!1469164 (= lt!642458 (select (store (arr!47795 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469165 () Bool)

(declare-fun e!824827 () Bool)

(assert (=> b!1469165 (= e!824828 e!824827)))

(declare-fun res!997702 () Bool)

(assert (=> b!1469165 (=> (not res!997702) (not e!824827))))

(assert (=> b!1469165 (= res!997702 (= (select (store (arr!47795 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469165 (= lt!642455 (array!99015 (store (arr!47795 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48345 a!2862)))))

(declare-fun b!1469166 () Bool)

(declare-fun res!997703 () Bool)

(assert (=> b!1469166 (=> (not res!997703) (not e!824828))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469166 (= res!997703 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48345 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48345 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48345 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469167 () Bool)

(declare-fun res!997705 () Bool)

(assert (=> b!1469167 (=> (not res!997705) (not e!824828))))

(declare-datatypes ((List!34296 0))(
  ( (Nil!34293) (Cons!34292 (h!35642 (_ BitVec 64)) (t!48990 List!34296)) )
))
(declare-fun arrayNoDuplicates!0 (array!99014 (_ BitVec 32) List!34296) Bool)

(assert (=> b!1469167 (= res!997705 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34293))))

(declare-fun b!1469168 () Bool)

(assert (=> b!1469168 (= e!824827 e!824829)))

(declare-fun res!997699 () Bool)

(assert (=> b!1469168 (=> (not res!997699) (not e!824829))))

(declare-fun lt!642456 () SeekEntryResult!12035)

(assert (=> b!1469168 (= res!997699 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47795 a!2862) j!93) mask!2687) (select (arr!47795 a!2862) j!93) a!2862 mask!2687) lt!642456))))

(assert (=> b!1469168 (= lt!642456 (Intermediate!12035 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469169 () Bool)

(declare-fun res!997704 () Bool)

(assert (=> b!1469169 (=> (not res!997704) (not e!824828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99014 (_ BitVec 32)) Bool)

(assert (=> b!1469169 (= res!997704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469170 () Bool)

(assert (=> b!1469170 (= e!824831 false)))

(declare-fun lt!642457 () Bool)

(declare-fun e!824830 () Bool)

(assert (=> b!1469170 (= lt!642457 e!824830)))

(declare-fun c!135243 () Bool)

(assert (=> b!1469170 (= c!135243 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469171 () Bool)

(declare-fun res!997701 () Bool)

(assert (=> b!1469171 (=> (not res!997701) (not e!824828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469171 (= res!997701 (validKeyInArray!0 (select (arr!47795 a!2862) i!1006)))))

(declare-fun b!1469172 () Bool)

(assert (=> b!1469172 (= e!824830 (not (= lt!642459 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642458 lt!642455 mask!2687))))))

(declare-fun b!1469173 () Bool)

(declare-fun res!997700 () Bool)

(assert (=> b!1469173 (=> (not res!997700) (not e!824828))))

(assert (=> b!1469173 (= res!997700 (validKeyInArray!0 (select (arr!47795 a!2862) j!93)))))

(declare-fun b!1469174 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99014 (_ BitVec 32)) SeekEntryResult!12035)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99014 (_ BitVec 32)) SeekEntryResult!12035)

(assert (=> b!1469174 (= e!824830 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642458 lt!642455 mask!2687) (seekEntryOrOpen!0 lt!642458 lt!642455 mask!2687))))))

(declare-fun b!1469175 () Bool)

(declare-fun res!997698 () Bool)

(assert (=> b!1469175 (=> (not res!997698) (not e!824829))))

(assert (=> b!1469175 (= res!997698 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47795 a!2862) j!93) a!2862 mask!2687) lt!642456))))

(assert (= (and start!125566 res!997706) b!1469163))

(assert (= (and b!1469163 res!997708) b!1469171))

(assert (= (and b!1469171 res!997701) b!1469173))

(assert (= (and b!1469173 res!997700) b!1469169))

(assert (= (and b!1469169 res!997704) b!1469167))

(assert (= (and b!1469167 res!997705) b!1469166))

(assert (= (and b!1469166 res!997703) b!1469165))

(assert (= (and b!1469165 res!997702) b!1469168))

(assert (= (and b!1469168 res!997699) b!1469175))

(assert (= (and b!1469175 res!997698) b!1469164))

(assert (= (and b!1469164 res!997707) b!1469170))

(assert (= (and b!1469170 c!135243) b!1469172))

(assert (= (and b!1469170 (not c!135243)) b!1469174))

(declare-fun m!1356349 () Bool)

(assert (=> b!1469172 m!1356349))

(declare-fun m!1356351 () Bool)

(assert (=> b!1469175 m!1356351))

(assert (=> b!1469175 m!1356351))

(declare-fun m!1356353 () Bool)

(assert (=> b!1469175 m!1356353))

(declare-fun m!1356355 () Bool)

(assert (=> b!1469167 m!1356355))

(declare-fun m!1356357 () Bool)

(assert (=> b!1469164 m!1356357))

(assert (=> b!1469164 m!1356357))

(declare-fun m!1356359 () Bool)

(assert (=> b!1469164 m!1356359))

(declare-fun m!1356361 () Bool)

(assert (=> b!1469164 m!1356361))

(declare-fun m!1356363 () Bool)

(assert (=> b!1469164 m!1356363))

(assert (=> b!1469173 m!1356351))

(assert (=> b!1469173 m!1356351))

(declare-fun m!1356365 () Bool)

(assert (=> b!1469173 m!1356365))

(declare-fun m!1356367 () Bool)

(assert (=> b!1469171 m!1356367))

(assert (=> b!1469171 m!1356367))

(declare-fun m!1356369 () Bool)

(assert (=> b!1469171 m!1356369))

(declare-fun m!1356371 () Bool)

(assert (=> b!1469169 m!1356371))

(declare-fun m!1356373 () Bool)

(assert (=> start!125566 m!1356373))

(declare-fun m!1356375 () Bool)

(assert (=> start!125566 m!1356375))

(assert (=> b!1469168 m!1356351))

(assert (=> b!1469168 m!1356351))

(declare-fun m!1356377 () Bool)

(assert (=> b!1469168 m!1356377))

(assert (=> b!1469168 m!1356377))

(assert (=> b!1469168 m!1356351))

(declare-fun m!1356379 () Bool)

(assert (=> b!1469168 m!1356379))

(declare-fun m!1356381 () Bool)

(assert (=> b!1469174 m!1356381))

(declare-fun m!1356383 () Bool)

(assert (=> b!1469174 m!1356383))

(assert (=> b!1469165 m!1356361))

(declare-fun m!1356385 () Bool)

(assert (=> b!1469165 m!1356385))

(push 1)

