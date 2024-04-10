; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125252 () Bool)

(assert start!125252)

(declare-fun res!991348 () Bool)

(declare-fun e!821772 () Bool)

(assert (=> start!125252 (=> (not res!991348) (not e!821772))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125252 (= res!991348 (validMask!0 mask!2687))))

(assert (=> start!125252 e!821772))

(assert (=> start!125252 true))

(declare-datatypes ((array!98700 0))(
  ( (array!98701 (arr!47638 (Array (_ BitVec 32) (_ BitVec 64))) (size!48188 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98700)

(declare-fun array_inv!36666 (array!98700) Bool)

(assert (=> start!125252 (array_inv!36666 a!2862)))

(declare-fun b!1461789 () Bool)

(declare-fun res!991340 () Bool)

(declare-fun e!821773 () Bool)

(assert (=> b!1461789 (=> (not res!991340) (not e!821773))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11890 0))(
  ( (MissingZero!11890 (index!49952 (_ BitVec 32))) (Found!11890 (index!49953 (_ BitVec 32))) (Intermediate!11890 (undefined!12702 Bool) (index!49954 (_ BitVec 32)) (x!131547 (_ BitVec 32))) (Undefined!11890) (MissingVacant!11890 (index!49955 (_ BitVec 32))) )
))
(declare-fun lt!640246 () SeekEntryResult!11890)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98700 (_ BitVec 32)) SeekEntryResult!11890)

(assert (=> b!1461789 (= res!991340 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!640246))))

(declare-fun b!1461790 () Bool)

(declare-fun e!821780 () Bool)

(assert (=> b!1461790 (= e!821773 e!821780)))

(declare-fun res!991347 () Bool)

(assert (=> b!1461790 (=> (not res!991347) (not e!821780))))

(declare-fun lt!640244 () SeekEntryResult!11890)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461790 (= res!991347 (= lt!640244 (Intermediate!11890 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640245 () (_ BitVec 64))

(declare-fun lt!640243 () array!98700)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461790 (= lt!640244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640245 mask!2687) lt!640245 lt!640243 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461790 (= lt!640245 (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461791 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!821776 () Bool)

(assert (=> b!1461791 (= e!821776 (or (= (select (arr!47638 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47638 a!2862) intermediateBeforeIndex!19) (select (arr!47638 a!2862) j!93))))))

(declare-fun e!821775 () Bool)

(declare-fun b!1461792 () Bool)

(assert (=> b!1461792 (= e!821775 (= lt!640244 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640245 lt!640243 mask!2687)))))

(declare-fun b!1461793 () Bool)

(declare-fun res!991342 () Bool)

(assert (=> b!1461793 (=> (not res!991342) (not e!821776))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98700 (_ BitVec 32)) SeekEntryResult!11890)

(assert (=> b!1461793 (= res!991342 (= (seekEntryOrOpen!0 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) (Found!11890 j!93)))))

(declare-fun b!1461794 () Bool)

(declare-fun res!991352 () Bool)

(assert (=> b!1461794 (=> (not res!991352) (not e!821772))))

(declare-datatypes ((List!34139 0))(
  ( (Nil!34136) (Cons!34135 (h!35485 (_ BitVec 64)) (t!48833 List!34139)) )
))
(declare-fun arrayNoDuplicates!0 (array!98700 (_ BitVec 32) List!34139) Bool)

(assert (=> b!1461794 (= res!991352 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34136))))

(declare-fun b!1461795 () Bool)

(declare-fun res!991357 () Bool)

(assert (=> b!1461795 (=> (not res!991357) (not e!821780))))

(assert (=> b!1461795 (= res!991357 e!821775)))

(declare-fun c!134735 () Bool)

(assert (=> b!1461795 (= c!134735 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461796 () Bool)

(declare-fun e!821777 () Bool)

(assert (=> b!1461796 (= e!821777 e!821773)))

(declare-fun res!991353 () Bool)

(assert (=> b!1461796 (=> (not res!991353) (not e!821773))))

(assert (=> b!1461796 (= res!991353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47638 a!2862) j!93) mask!2687) (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!640246))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461796 (= lt!640246 (Intermediate!11890 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!821779 () Bool)

(declare-fun b!1461797 () Bool)

(declare-fun lt!640242 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98700 (_ BitVec 32)) SeekEntryResult!11890)

(assert (=> b!1461797 (= e!821779 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640242 intermediateAfterIndex!19 lt!640245 lt!640243 mask!2687) (seekEntryOrOpen!0 lt!640245 lt!640243 mask!2687))))))

(declare-fun b!1461798 () Bool)

(declare-fun res!991344 () Bool)

(assert (=> b!1461798 (=> (not res!991344) (not e!821772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461798 (= res!991344 (validKeyInArray!0 (select (arr!47638 a!2862) j!93)))))

(declare-fun b!1461799 () Bool)

(declare-fun res!991356 () Bool)

(assert (=> b!1461799 (=> (not res!991356) (not e!821772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98700 (_ BitVec 32)) Bool)

(assert (=> b!1461799 (= res!991356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461800 () Bool)

(assert (=> b!1461800 (= e!821775 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640245 lt!640243 mask!2687) (seekEntryOrOpen!0 lt!640245 lt!640243 mask!2687)))))

(declare-fun b!1461801 () Bool)

(declare-fun res!991346 () Bool)

(declare-fun e!821778 () Bool)

(assert (=> b!1461801 (=> res!991346 e!821778)))

(assert (=> b!1461801 (= res!991346 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640242 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!640246)))))

(declare-fun b!1461802 () Bool)

(declare-fun res!991345 () Bool)

(assert (=> b!1461802 (=> (not res!991345) (not e!821772))))

(assert (=> b!1461802 (= res!991345 (validKeyInArray!0 (select (arr!47638 a!2862) i!1006)))))

(declare-fun b!1461803 () Bool)

(declare-fun e!821771 () Bool)

(assert (=> b!1461803 (= e!821771 e!821778)))

(declare-fun res!991354 () Bool)

(assert (=> b!1461803 (=> res!991354 e!821778)))

(assert (=> b!1461803 (= res!991354 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640242 #b00000000000000000000000000000000) (bvsge lt!640242 (size!48188 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461803 (= lt!640242 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461804 () Bool)

(assert (=> b!1461804 (= e!821772 e!821777)))

(declare-fun res!991355 () Bool)

(assert (=> b!1461804 (=> (not res!991355) (not e!821777))))

(assert (=> b!1461804 (= res!991355 (= (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461804 (= lt!640243 (array!98701 (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48188 a!2862)))))

(declare-fun b!1461805 () Bool)

(assert (=> b!1461805 (= e!821778 true)))

(declare-fun lt!640247 () Bool)

(assert (=> b!1461805 (= lt!640247 e!821779)))

(declare-fun c!134736 () Bool)

(assert (=> b!1461805 (= c!134736 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461806 () Bool)

(declare-fun res!991341 () Bool)

(assert (=> b!1461806 (=> (not res!991341) (not e!821780))))

(assert (=> b!1461806 (= res!991341 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461807 () Bool)

(assert (=> b!1461807 (= e!821779 (not (= lt!640244 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640242 lt!640245 lt!640243 mask!2687))))))

(declare-fun b!1461808 () Bool)

(declare-fun res!991351 () Bool)

(assert (=> b!1461808 (=> (not res!991351) (not e!821772))))

(assert (=> b!1461808 (= res!991351 (and (= (size!48188 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48188 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48188 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461809 () Bool)

(declare-fun res!991350 () Bool)

(assert (=> b!1461809 (=> (not res!991350) (not e!821772))))

(assert (=> b!1461809 (= res!991350 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48188 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48188 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48188 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461810 () Bool)

(assert (=> b!1461810 (= e!821780 (not e!821771))))

(declare-fun res!991343 () Bool)

(assert (=> b!1461810 (=> res!991343 e!821771)))

(assert (=> b!1461810 (= res!991343 (or (and (= (select (arr!47638 a!2862) index!646) (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47638 a!2862) index!646) (select (arr!47638 a!2862) j!93))) (= (select (arr!47638 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461810 e!821776))

(declare-fun res!991349 () Bool)

(assert (=> b!1461810 (=> (not res!991349) (not e!821776))))

(assert (=> b!1461810 (= res!991349 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49276 0))(
  ( (Unit!49277) )
))
(declare-fun lt!640248 () Unit!49276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49276)

(assert (=> b!1461810 (= lt!640248 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125252 res!991348) b!1461808))

(assert (= (and b!1461808 res!991351) b!1461802))

(assert (= (and b!1461802 res!991345) b!1461798))

(assert (= (and b!1461798 res!991344) b!1461799))

(assert (= (and b!1461799 res!991356) b!1461794))

(assert (= (and b!1461794 res!991352) b!1461809))

(assert (= (and b!1461809 res!991350) b!1461804))

(assert (= (and b!1461804 res!991355) b!1461796))

(assert (= (and b!1461796 res!991353) b!1461789))

(assert (= (and b!1461789 res!991340) b!1461790))

(assert (= (and b!1461790 res!991347) b!1461795))

(assert (= (and b!1461795 c!134735) b!1461792))

(assert (= (and b!1461795 (not c!134735)) b!1461800))

(assert (= (and b!1461795 res!991357) b!1461806))

(assert (= (and b!1461806 res!991341) b!1461810))

(assert (= (and b!1461810 res!991349) b!1461793))

(assert (= (and b!1461793 res!991342) b!1461791))

(assert (= (and b!1461810 (not res!991343)) b!1461803))

(assert (= (and b!1461803 (not res!991354)) b!1461801))

(assert (= (and b!1461801 (not res!991346)) b!1461805))

(assert (= (and b!1461805 c!134736) b!1461807))

(assert (= (and b!1461805 (not c!134736)) b!1461797))

(declare-fun m!1349325 () Bool)

(assert (=> b!1461797 m!1349325))

(declare-fun m!1349327 () Bool)

(assert (=> b!1461797 m!1349327))

(declare-fun m!1349329 () Bool)

(assert (=> b!1461807 m!1349329))

(declare-fun m!1349331 () Bool)

(assert (=> b!1461804 m!1349331))

(declare-fun m!1349333 () Bool)

(assert (=> b!1461804 m!1349333))

(declare-fun m!1349335 () Bool)

(assert (=> b!1461796 m!1349335))

(assert (=> b!1461796 m!1349335))

(declare-fun m!1349337 () Bool)

(assert (=> b!1461796 m!1349337))

(assert (=> b!1461796 m!1349337))

(assert (=> b!1461796 m!1349335))

(declare-fun m!1349339 () Bool)

(assert (=> b!1461796 m!1349339))

(declare-fun m!1349341 () Bool)

(assert (=> b!1461803 m!1349341))

(declare-fun m!1349343 () Bool)

(assert (=> b!1461791 m!1349343))

(assert (=> b!1461791 m!1349335))

(assert (=> b!1461798 m!1349335))

(assert (=> b!1461798 m!1349335))

(declare-fun m!1349345 () Bool)

(assert (=> b!1461798 m!1349345))

(assert (=> b!1461801 m!1349335))

(assert (=> b!1461801 m!1349335))

(declare-fun m!1349347 () Bool)

(assert (=> b!1461801 m!1349347))

(declare-fun m!1349349 () Bool)

(assert (=> b!1461794 m!1349349))

(declare-fun m!1349351 () Bool)

(assert (=> b!1461802 m!1349351))

(assert (=> b!1461802 m!1349351))

(declare-fun m!1349353 () Bool)

(assert (=> b!1461802 m!1349353))

(declare-fun m!1349355 () Bool)

(assert (=> b!1461790 m!1349355))

(assert (=> b!1461790 m!1349355))

(declare-fun m!1349357 () Bool)

(assert (=> b!1461790 m!1349357))

(assert (=> b!1461790 m!1349331))

(declare-fun m!1349359 () Bool)

(assert (=> b!1461790 m!1349359))

(assert (=> b!1461793 m!1349335))

(assert (=> b!1461793 m!1349335))

(declare-fun m!1349361 () Bool)

(assert (=> b!1461793 m!1349361))

(declare-fun m!1349363 () Bool)

(assert (=> b!1461810 m!1349363))

(assert (=> b!1461810 m!1349331))

(declare-fun m!1349365 () Bool)

(assert (=> b!1461810 m!1349365))

(declare-fun m!1349367 () Bool)

(assert (=> b!1461810 m!1349367))

(declare-fun m!1349369 () Bool)

(assert (=> b!1461810 m!1349369))

(assert (=> b!1461810 m!1349335))

(declare-fun m!1349371 () Bool)

(assert (=> b!1461800 m!1349371))

(assert (=> b!1461800 m!1349327))

(declare-fun m!1349373 () Bool)

(assert (=> b!1461799 m!1349373))

(declare-fun m!1349375 () Bool)

(assert (=> start!125252 m!1349375))

(declare-fun m!1349377 () Bool)

(assert (=> start!125252 m!1349377))

(declare-fun m!1349379 () Bool)

(assert (=> b!1461792 m!1349379))

(assert (=> b!1461789 m!1349335))

(assert (=> b!1461789 m!1349335))

(declare-fun m!1349381 () Bool)

(assert (=> b!1461789 m!1349381))

(push 1)

