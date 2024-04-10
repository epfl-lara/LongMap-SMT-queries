; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123348 () Bool)

(assert start!123348)

(declare-fun b!1430306 () Bool)

(declare-fun res!964744 () Bool)

(declare-fun e!807543 () Bool)

(assert (=> b!1430306 (=> (not res!964744) (not e!807543))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97458 0))(
  ( (array!97459 (arr!47039 (Array (_ BitVec 32) (_ BitVec 64))) (size!47589 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97458)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430306 (= res!964744 (and (= (size!47589 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47589 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47589 a!2831)) (not (= i!982 j!81))))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun e!807541 () Bool)

(declare-fun b!1430307 () Bool)

(assert (=> b!1430307 (= e!807541 (not (or (= (select (arr!47039 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47039 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47039 a!2831) index!585) (select (arr!47039 a!2831) j!81)) (not (= (select (store (arr!47039 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= intermediateAfterIndex!13 i!982))))))

(declare-fun e!807544 () Bool)

(assert (=> b!1430307 e!807544))

(declare-fun res!964736 () Bool)

(assert (=> b!1430307 (=> (not res!964736) (not e!807544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97458 (_ BitVec 32)) Bool)

(assert (=> b!1430307 (= res!964736 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48382 0))(
  ( (Unit!48383) )
))
(declare-fun lt!629715 () Unit!48382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48382)

(assert (=> b!1430307 (= lt!629715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430308 () Bool)

(declare-fun res!964745 () Bool)

(assert (=> b!1430308 (=> (not res!964745) (not e!807541))))

(declare-fun lt!629712 () array!97458)

(declare-datatypes ((SeekEntryResult!11318 0))(
  ( (MissingZero!11318 (index!47664 (_ BitVec 32))) (Found!11318 (index!47665 (_ BitVec 32))) (Intermediate!11318 (undefined!12130 Bool) (index!47666 (_ BitVec 32)) (x!129302 (_ BitVec 32))) (Undefined!11318) (MissingVacant!11318 (index!47667 (_ BitVec 32))) )
))
(declare-fun lt!629713 () SeekEntryResult!11318)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!629714 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97458 (_ BitVec 32)) SeekEntryResult!11318)

(assert (=> b!1430308 (= res!964745 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629714 lt!629712 mask!2608) lt!629713))))

(declare-fun b!1430309 () Bool)

(assert (=> b!1430309 (= e!807544 (or (= (select (arr!47039 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47039 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47039 a!2831) index!585) (select (arr!47039 a!2831) j!81)) (not (= (select (store (arr!47039 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13)))))

(declare-fun b!1430310 () Bool)

(declare-fun res!964742 () Bool)

(assert (=> b!1430310 (=> (not res!964742) (not e!807543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430310 (= res!964742 (validKeyInArray!0 (select (arr!47039 a!2831) i!982)))))

(declare-fun b!1430311 () Bool)

(declare-fun res!964746 () Bool)

(assert (=> b!1430311 (=> (not res!964746) (not e!807541))))

(declare-fun lt!629711 () SeekEntryResult!11318)

(assert (=> b!1430311 (= res!964746 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47039 a!2831) j!81) a!2831 mask!2608) lt!629711))))

(declare-fun b!1430312 () Bool)

(declare-fun res!964739 () Bool)

(assert (=> b!1430312 (=> (not res!964739) (not e!807543))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1430312 (= res!964739 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47589 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47589 a!2831))))))

(declare-fun b!1430313 () Bool)

(declare-fun res!964735 () Bool)

(assert (=> b!1430313 (=> (not res!964735) (not e!807541))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430313 (= res!964735 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430315 () Bool)

(declare-fun res!964734 () Bool)

(assert (=> b!1430315 (=> (not res!964734) (not e!807543))))

(declare-datatypes ((List!33549 0))(
  ( (Nil!33546) (Cons!33545 (h!34862 (_ BitVec 64)) (t!48243 List!33549)) )
))
(declare-fun arrayNoDuplicates!0 (array!97458 (_ BitVec 32) List!33549) Bool)

(assert (=> b!1430315 (= res!964734 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33546))))

(declare-fun b!1430316 () Bool)

(declare-fun res!964747 () Bool)

(assert (=> b!1430316 (=> (not res!964747) (not e!807543))))

(assert (=> b!1430316 (= res!964747 (validKeyInArray!0 (select (arr!47039 a!2831) j!81)))))

(declare-fun b!1430317 () Bool)

(declare-fun res!964741 () Bool)

(assert (=> b!1430317 (=> (not res!964741) (not e!807544))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97458 (_ BitVec 32)) SeekEntryResult!11318)

(assert (=> b!1430317 (= res!964741 (= (seekEntryOrOpen!0 (select (arr!47039 a!2831) j!81) a!2831 mask!2608) (Found!11318 j!81)))))

(declare-fun b!1430318 () Bool)

(declare-fun res!964740 () Bool)

(assert (=> b!1430318 (=> (not res!964740) (not e!807543))))

(assert (=> b!1430318 (= res!964740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430319 () Bool)

(declare-fun e!807542 () Bool)

(assert (=> b!1430319 (= e!807542 e!807541)))

(declare-fun res!964743 () Bool)

(assert (=> b!1430319 (=> (not res!964743) (not e!807541))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430319 (= res!964743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629714 mask!2608) lt!629714 lt!629712 mask!2608) lt!629713))))

(assert (=> b!1430319 (= lt!629713 (Intermediate!11318 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430319 (= lt!629714 (select (store (arr!47039 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430319 (= lt!629712 (array!97459 (store (arr!47039 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47589 a!2831)))))

(declare-fun b!1430314 () Bool)

(assert (=> b!1430314 (= e!807543 e!807542)))

(declare-fun res!964737 () Bool)

(assert (=> b!1430314 (=> (not res!964737) (not e!807542))))

(assert (=> b!1430314 (= res!964737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47039 a!2831) j!81) mask!2608) (select (arr!47039 a!2831) j!81) a!2831 mask!2608) lt!629711))))

(assert (=> b!1430314 (= lt!629711 (Intermediate!11318 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!964738 () Bool)

(assert (=> start!123348 (=> (not res!964738) (not e!807543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123348 (= res!964738 (validMask!0 mask!2608))))

(assert (=> start!123348 e!807543))

(assert (=> start!123348 true))

(declare-fun array_inv!36067 (array!97458) Bool)

(assert (=> start!123348 (array_inv!36067 a!2831)))

(assert (= (and start!123348 res!964738) b!1430306))

(assert (= (and b!1430306 res!964744) b!1430310))

(assert (= (and b!1430310 res!964742) b!1430316))

(assert (= (and b!1430316 res!964747) b!1430318))

(assert (= (and b!1430318 res!964740) b!1430315))

(assert (= (and b!1430315 res!964734) b!1430312))

(assert (= (and b!1430312 res!964739) b!1430314))

(assert (= (and b!1430314 res!964737) b!1430319))

(assert (= (and b!1430319 res!964743) b!1430311))

(assert (= (and b!1430311 res!964746) b!1430308))

(assert (= (and b!1430308 res!964745) b!1430313))

(assert (= (and b!1430313 res!964735) b!1430307))

(assert (= (and b!1430307 res!964736) b!1430317))

(assert (= (and b!1430317 res!964741) b!1430309))

(declare-fun m!1320279 () Bool)

(assert (=> b!1430315 m!1320279))

(declare-fun m!1320281 () Bool)

(assert (=> b!1430311 m!1320281))

(assert (=> b!1430311 m!1320281))

(declare-fun m!1320283 () Bool)

(assert (=> b!1430311 m!1320283))

(declare-fun m!1320285 () Bool)

(assert (=> b!1430318 m!1320285))

(assert (=> b!1430316 m!1320281))

(assert (=> b!1430316 m!1320281))

(declare-fun m!1320287 () Bool)

(assert (=> b!1430316 m!1320287))

(declare-fun m!1320289 () Bool)

(assert (=> b!1430309 m!1320289))

(assert (=> b!1430309 m!1320281))

(declare-fun m!1320291 () Bool)

(assert (=> b!1430309 m!1320291))

(declare-fun m!1320293 () Bool)

(assert (=> b!1430309 m!1320293))

(assert (=> b!1430317 m!1320281))

(assert (=> b!1430317 m!1320281))

(declare-fun m!1320295 () Bool)

(assert (=> b!1430317 m!1320295))

(assert (=> b!1430314 m!1320281))

(assert (=> b!1430314 m!1320281))

(declare-fun m!1320297 () Bool)

(assert (=> b!1430314 m!1320297))

(assert (=> b!1430314 m!1320297))

(assert (=> b!1430314 m!1320281))

(declare-fun m!1320299 () Bool)

(assert (=> b!1430314 m!1320299))

(declare-fun m!1320301 () Bool)

(assert (=> b!1430319 m!1320301))

(assert (=> b!1430319 m!1320301))

(declare-fun m!1320303 () Bool)

(assert (=> b!1430319 m!1320303))

(assert (=> b!1430319 m!1320291))

(declare-fun m!1320305 () Bool)

(assert (=> b!1430319 m!1320305))

(declare-fun m!1320307 () Bool)

(assert (=> b!1430310 m!1320307))

(assert (=> b!1430310 m!1320307))

(declare-fun m!1320309 () Bool)

(assert (=> b!1430310 m!1320309))

(declare-fun m!1320311 () Bool)

(assert (=> start!123348 m!1320311))

(declare-fun m!1320313 () Bool)

(assert (=> start!123348 m!1320313))

(assert (=> b!1430307 m!1320291))

(assert (=> b!1430307 m!1320293))

(assert (=> b!1430307 m!1320289))

(declare-fun m!1320315 () Bool)

(assert (=> b!1430307 m!1320315))

(assert (=> b!1430307 m!1320281))

(declare-fun m!1320317 () Bool)

(assert (=> b!1430307 m!1320317))

(declare-fun m!1320319 () Bool)

(assert (=> b!1430308 m!1320319))

(push 1)

