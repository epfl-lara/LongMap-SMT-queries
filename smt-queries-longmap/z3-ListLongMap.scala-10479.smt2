; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123254 () Bool)

(assert start!123254)

(declare-fun b!1429215 () Bool)

(declare-fun e!807054 () Bool)

(assert (=> b!1429215 (= e!807054 (not true))))

(declare-fun e!807053 () Bool)

(assert (=> b!1429215 e!807053))

(declare-fun res!963854 () Bool)

(assert (=> b!1429215 (=> (not res!963854) (not e!807053))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97415 0))(
  ( (array!97416 (arr!47019 (Array (_ BitVec 32) (_ BitVec 64))) (size!47569 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97415)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97415 (_ BitVec 32)) Bool)

(assert (=> b!1429215 (= res!963854 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48342 0))(
  ( (Unit!48343) )
))
(declare-fun lt!629279 () Unit!48342)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48342)

(assert (=> b!1429215 (= lt!629279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!963851 () Bool)

(declare-fun e!807056 () Bool)

(assert (=> start!123254 (=> (not res!963851) (not e!807056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123254 (= res!963851 (validMask!0 mask!2608))))

(assert (=> start!123254 e!807056))

(assert (=> start!123254 true))

(declare-fun array_inv!36047 (array!97415) Bool)

(assert (=> start!123254 (array_inv!36047 a!2831)))

(declare-fun b!1429216 () Bool)

(declare-fun res!963845 () Bool)

(assert (=> b!1429216 (=> (not res!963845) (not e!807056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429216 (= res!963845 (validKeyInArray!0 (select (arr!47019 a!2831) j!81)))))

(declare-fun b!1429217 () Bool)

(declare-fun res!963844 () Bool)

(assert (=> b!1429217 (=> (not res!963844) (not e!807056))))

(declare-datatypes ((List!33529 0))(
  ( (Nil!33526) (Cons!33525 (h!34839 (_ BitVec 64)) (t!48223 List!33529)) )
))
(declare-fun arrayNoDuplicates!0 (array!97415 (_ BitVec 32) List!33529) Bool)

(assert (=> b!1429217 (= res!963844 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33526))))

(declare-fun b!1429218 () Bool)

(declare-fun res!963847 () Bool)

(assert (=> b!1429218 (=> (not res!963847) (not e!807056))))

(assert (=> b!1429218 (= res!963847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429219 () Bool)

(declare-fun res!963846 () Bool)

(assert (=> b!1429219 (=> (not res!963846) (not e!807054))))

(declare-datatypes ((SeekEntryResult!11298 0))(
  ( (MissingZero!11298 (index!47584 (_ BitVec 32))) (Found!11298 (index!47585 (_ BitVec 32))) (Intermediate!11298 (undefined!12110 Bool) (index!47586 (_ BitVec 32)) (x!129220 (_ BitVec 32))) (Undefined!11298) (MissingVacant!11298 (index!47587 (_ BitVec 32))) )
))
(declare-fun lt!629280 () SeekEntryResult!11298)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97415 (_ BitVec 32)) SeekEntryResult!11298)

(assert (=> b!1429219 (= res!963846 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47019 a!2831) j!81) a!2831 mask!2608) lt!629280))))

(declare-fun b!1429220 () Bool)

(declare-fun res!963852 () Bool)

(assert (=> b!1429220 (=> (not res!963852) (not e!807056))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429220 (= res!963852 (validKeyInArray!0 (select (arr!47019 a!2831) i!982)))))

(declare-fun b!1429221 () Bool)

(declare-fun res!963848 () Bool)

(assert (=> b!1429221 (=> (not res!963848) (not e!807054))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429221 (= res!963848 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429222 () Bool)

(declare-fun res!963855 () Bool)

(assert (=> b!1429222 (=> (not res!963855) (not e!807056))))

(assert (=> b!1429222 (= res!963855 (and (= (size!47569 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47569 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47569 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429223 () Bool)

(declare-fun res!963853 () Bool)

(assert (=> b!1429223 (=> (not res!963853) (not e!807054))))

(declare-fun lt!629281 () array!97415)

(declare-fun lt!629283 () (_ BitVec 64))

(declare-fun lt!629282 () SeekEntryResult!11298)

(assert (=> b!1429223 (= res!963853 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629283 lt!629281 mask!2608) lt!629282))))

(declare-fun b!1429224 () Bool)

(declare-fun e!807055 () Bool)

(assert (=> b!1429224 (= e!807056 e!807055)))

(declare-fun res!963849 () Bool)

(assert (=> b!1429224 (=> (not res!963849) (not e!807055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429224 (= res!963849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47019 a!2831) j!81) mask!2608) (select (arr!47019 a!2831) j!81) a!2831 mask!2608) lt!629280))))

(assert (=> b!1429224 (= lt!629280 (Intermediate!11298 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429225 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97415 (_ BitVec 32)) SeekEntryResult!11298)

(assert (=> b!1429225 (= e!807053 (= (seekEntryOrOpen!0 (select (arr!47019 a!2831) j!81) a!2831 mask!2608) (Found!11298 j!81)))))

(declare-fun b!1429226 () Bool)

(declare-fun res!963850 () Bool)

(assert (=> b!1429226 (=> (not res!963850) (not e!807056))))

(assert (=> b!1429226 (= res!963850 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47569 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47569 a!2831))))))

(declare-fun b!1429227 () Bool)

(assert (=> b!1429227 (= e!807055 e!807054)))

(declare-fun res!963856 () Bool)

(assert (=> b!1429227 (=> (not res!963856) (not e!807054))))

(assert (=> b!1429227 (= res!963856 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629283 mask!2608) lt!629283 lt!629281 mask!2608) lt!629282))))

(assert (=> b!1429227 (= lt!629282 (Intermediate!11298 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429227 (= lt!629283 (select (store (arr!47019 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429227 (= lt!629281 (array!97416 (store (arr!47019 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47569 a!2831)))))

(assert (= (and start!123254 res!963851) b!1429222))

(assert (= (and b!1429222 res!963855) b!1429220))

(assert (= (and b!1429220 res!963852) b!1429216))

(assert (= (and b!1429216 res!963845) b!1429218))

(assert (= (and b!1429218 res!963847) b!1429217))

(assert (= (and b!1429217 res!963844) b!1429226))

(assert (= (and b!1429226 res!963850) b!1429224))

(assert (= (and b!1429224 res!963849) b!1429227))

(assert (= (and b!1429227 res!963856) b!1429219))

(assert (= (and b!1429219 res!963846) b!1429223))

(assert (= (and b!1429223 res!963853) b!1429221))

(assert (= (and b!1429221 res!963848) b!1429215))

(assert (= (and b!1429215 res!963854) b!1429225))

(declare-fun m!1319321 () Bool)

(assert (=> b!1429220 m!1319321))

(assert (=> b!1429220 m!1319321))

(declare-fun m!1319323 () Bool)

(assert (=> b!1429220 m!1319323))

(declare-fun m!1319325 () Bool)

(assert (=> b!1429216 m!1319325))

(assert (=> b!1429216 m!1319325))

(declare-fun m!1319327 () Bool)

(assert (=> b!1429216 m!1319327))

(declare-fun m!1319329 () Bool)

(assert (=> start!123254 m!1319329))

(declare-fun m!1319331 () Bool)

(assert (=> start!123254 m!1319331))

(assert (=> b!1429225 m!1319325))

(assert (=> b!1429225 m!1319325))

(declare-fun m!1319333 () Bool)

(assert (=> b!1429225 m!1319333))

(declare-fun m!1319335 () Bool)

(assert (=> b!1429223 m!1319335))

(assert (=> b!1429224 m!1319325))

(assert (=> b!1429224 m!1319325))

(declare-fun m!1319337 () Bool)

(assert (=> b!1429224 m!1319337))

(assert (=> b!1429224 m!1319337))

(assert (=> b!1429224 m!1319325))

(declare-fun m!1319339 () Bool)

(assert (=> b!1429224 m!1319339))

(declare-fun m!1319341 () Bool)

(assert (=> b!1429215 m!1319341))

(declare-fun m!1319343 () Bool)

(assert (=> b!1429215 m!1319343))

(declare-fun m!1319345 () Bool)

(assert (=> b!1429217 m!1319345))

(declare-fun m!1319347 () Bool)

(assert (=> b!1429218 m!1319347))

(assert (=> b!1429219 m!1319325))

(assert (=> b!1429219 m!1319325))

(declare-fun m!1319349 () Bool)

(assert (=> b!1429219 m!1319349))

(declare-fun m!1319351 () Bool)

(assert (=> b!1429227 m!1319351))

(assert (=> b!1429227 m!1319351))

(declare-fun m!1319353 () Bool)

(assert (=> b!1429227 m!1319353))

(declare-fun m!1319355 () Bool)

(assert (=> b!1429227 m!1319355))

(declare-fun m!1319357 () Bool)

(assert (=> b!1429227 m!1319357))

(check-sat (not b!1429218) (not b!1429220) (not b!1429219) (not b!1429225) (not start!123254) (not b!1429224) (not b!1429223) (not b!1429227) (not b!1429217) (not b!1429216) (not b!1429215))
(check-sat)
