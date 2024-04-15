; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123278 () Bool)

(assert start!123278)

(declare-fun b!1429680 () Bool)

(declare-fun res!964367 () Bool)

(declare-fun e!807227 () Bool)

(assert (=> b!1429680 (=> (not res!964367) (not e!807227))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97392 0))(
  ( (array!97393 (arr!47008 (Array (_ BitVec 32) (_ BitVec 64))) (size!47560 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97392)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429680 (= res!964367 (and (= (size!47560 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47560 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47560 a!2831)) (not (= i!982 j!81))))))

(declare-fun e!807225 () Bool)

(declare-fun b!1429681 () Bool)

(declare-datatypes ((SeekEntryResult!11314 0))(
  ( (MissingZero!11314 (index!47648 (_ BitVec 32))) (Found!11314 (index!47649 (_ BitVec 32))) (Intermediate!11314 (undefined!12126 Bool) (index!47650 (_ BitVec 32)) (x!129273 (_ BitVec 32))) (Undefined!11314) (MissingVacant!11314 (index!47651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97392 (_ BitVec 32)) SeekEntryResult!11314)

(assert (=> b!1429681 (= e!807225 (= (seekEntryOrOpen!0 (select (arr!47008 a!2831) j!81) a!2831 mask!2608) (Found!11314 j!81)))))

(declare-fun b!1429682 () Bool)

(declare-fun e!807226 () Bool)

(declare-fun e!807223 () Bool)

(assert (=> b!1429682 (= e!807226 e!807223)))

(declare-fun res!964370 () Bool)

(assert (=> b!1429682 (=> (not res!964370) (not e!807223))))

(declare-fun lt!629299 () (_ BitVec 64))

(declare-fun lt!629302 () array!97392)

(declare-fun lt!629303 () SeekEntryResult!11314)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97392 (_ BitVec 32)) SeekEntryResult!11314)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429682 (= res!964370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629299 mask!2608) lt!629299 lt!629302 mask!2608) lt!629303))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429682 (= lt!629303 (Intermediate!11314 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429682 (= lt!629299 (select (store (arr!47008 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429682 (= lt!629302 (array!97393 (store (arr!47008 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47560 a!2831)))))

(declare-fun b!1429683 () Bool)

(declare-fun res!964372 () Bool)

(assert (=> b!1429683 (=> (not res!964372) (not e!807223))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!629301 () SeekEntryResult!11314)

(assert (=> b!1429683 (= res!964372 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47008 a!2831) j!81) a!2831 mask!2608) lt!629301))))

(declare-fun b!1429684 () Bool)

(assert (=> b!1429684 (= e!807227 e!807226)))

(declare-fun res!964362 () Bool)

(assert (=> b!1429684 (=> (not res!964362) (not e!807226))))

(assert (=> b!1429684 (= res!964362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47008 a!2831) j!81) mask!2608) (select (arr!47008 a!2831) j!81) a!2831 mask!2608) lt!629301))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429684 (= lt!629301 (Intermediate!11314 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429685 () Bool)

(declare-fun res!964369 () Bool)

(assert (=> b!1429685 (=> (not res!964369) (not e!807227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97392 (_ BitVec 32)) Bool)

(assert (=> b!1429685 (= res!964369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429686 () Bool)

(declare-fun res!964361 () Bool)

(assert (=> b!1429686 (=> (not res!964361) (not e!807227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429686 (= res!964361 (validKeyInArray!0 (select (arr!47008 a!2831) i!982)))))

(declare-fun b!1429687 () Bool)

(declare-fun res!964371 () Bool)

(assert (=> b!1429687 (=> (not res!964371) (not e!807227))))

(assert (=> b!1429687 (= res!964371 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47560 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47560 a!2831))))))

(declare-fun b!1429688 () Bool)

(declare-fun res!964363 () Bool)

(assert (=> b!1429688 (=> (not res!964363) (not e!807227))))

(declare-datatypes ((List!33596 0))(
  ( (Nil!33593) (Cons!33592 (h!34906 (_ BitVec 64)) (t!48282 List!33596)) )
))
(declare-fun arrayNoDuplicates!0 (array!97392 (_ BitVec 32) List!33596) Bool)

(assert (=> b!1429688 (= res!964363 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33593))))

(declare-fun b!1429689 () Bool)

(declare-fun res!964360 () Bool)

(assert (=> b!1429689 (=> (not res!964360) (not e!807227))))

(assert (=> b!1429689 (= res!964360 (validKeyInArray!0 (select (arr!47008 a!2831) j!81)))))

(declare-fun b!1429690 () Bool)

(declare-fun res!964366 () Bool)

(assert (=> b!1429690 (=> (not res!964366) (not e!807223))))

(assert (=> b!1429690 (= res!964366 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629299 lt!629302 mask!2608) lt!629303))))

(declare-fun b!1429691 () Bool)

(declare-fun res!964364 () Bool)

(assert (=> b!1429691 (=> (not res!964364) (not e!807223))))

(assert (=> b!1429691 (= res!964364 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429692 () Bool)

(assert (=> b!1429692 (= e!807223 (not true))))

(assert (=> b!1429692 e!807225))

(declare-fun res!964365 () Bool)

(assert (=> b!1429692 (=> (not res!964365) (not e!807225))))

(assert (=> b!1429692 (= res!964365 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48213 0))(
  ( (Unit!48214) )
))
(declare-fun lt!629300 () Unit!48213)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48213)

(assert (=> b!1429692 (= lt!629300 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!964368 () Bool)

(assert (=> start!123278 (=> (not res!964368) (not e!807227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123278 (= res!964368 (validMask!0 mask!2608))))

(assert (=> start!123278 e!807227))

(assert (=> start!123278 true))

(declare-fun array_inv!36241 (array!97392) Bool)

(assert (=> start!123278 (array_inv!36241 a!2831)))

(assert (= (and start!123278 res!964368) b!1429680))

(assert (= (and b!1429680 res!964367) b!1429686))

(assert (= (and b!1429686 res!964361) b!1429689))

(assert (= (and b!1429689 res!964360) b!1429685))

(assert (= (and b!1429685 res!964369) b!1429688))

(assert (= (and b!1429688 res!964363) b!1429687))

(assert (= (and b!1429687 res!964371) b!1429684))

(assert (= (and b!1429684 res!964362) b!1429682))

(assert (= (and b!1429682 res!964370) b!1429683))

(assert (= (and b!1429683 res!964372) b!1429690))

(assert (= (and b!1429690 res!964366) b!1429691))

(assert (= (and b!1429691 res!964364) b!1429692))

(assert (= (and b!1429692 res!964365) b!1429681))

(declare-fun m!1319301 () Bool)

(assert (=> b!1429683 m!1319301))

(assert (=> b!1429683 m!1319301))

(declare-fun m!1319303 () Bool)

(assert (=> b!1429683 m!1319303))

(declare-fun m!1319305 () Bool)

(assert (=> b!1429688 m!1319305))

(declare-fun m!1319307 () Bool)

(assert (=> b!1429692 m!1319307))

(declare-fun m!1319309 () Bool)

(assert (=> b!1429692 m!1319309))

(declare-fun m!1319311 () Bool)

(assert (=> start!123278 m!1319311))

(declare-fun m!1319313 () Bool)

(assert (=> start!123278 m!1319313))

(assert (=> b!1429689 m!1319301))

(assert (=> b!1429689 m!1319301))

(declare-fun m!1319315 () Bool)

(assert (=> b!1429689 m!1319315))

(declare-fun m!1319317 () Bool)

(assert (=> b!1429690 m!1319317))

(assert (=> b!1429684 m!1319301))

(assert (=> b!1429684 m!1319301))

(declare-fun m!1319319 () Bool)

(assert (=> b!1429684 m!1319319))

(assert (=> b!1429684 m!1319319))

(assert (=> b!1429684 m!1319301))

(declare-fun m!1319321 () Bool)

(assert (=> b!1429684 m!1319321))

(assert (=> b!1429681 m!1319301))

(assert (=> b!1429681 m!1319301))

(declare-fun m!1319323 () Bool)

(assert (=> b!1429681 m!1319323))

(declare-fun m!1319325 () Bool)

(assert (=> b!1429682 m!1319325))

(assert (=> b!1429682 m!1319325))

(declare-fun m!1319327 () Bool)

(assert (=> b!1429682 m!1319327))

(declare-fun m!1319329 () Bool)

(assert (=> b!1429682 m!1319329))

(declare-fun m!1319331 () Bool)

(assert (=> b!1429682 m!1319331))

(declare-fun m!1319333 () Bool)

(assert (=> b!1429686 m!1319333))

(assert (=> b!1429686 m!1319333))

(declare-fun m!1319335 () Bool)

(assert (=> b!1429686 m!1319335))

(declare-fun m!1319337 () Bool)

(assert (=> b!1429685 m!1319337))

(check-sat (not b!1429684) (not b!1429690) (not b!1429688) (not b!1429681) (not b!1429685) (not b!1429683) (not b!1429686) (not start!123278) (not b!1429692) (not b!1429689) (not b!1429682))
(check-sat)
