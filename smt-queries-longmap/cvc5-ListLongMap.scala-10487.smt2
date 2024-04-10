; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123354 () Bool)

(assert start!123354)

(declare-fun res!964862 () Bool)

(declare-fun e!807587 () Bool)

(assert (=> start!123354 (=> (not res!964862) (not e!807587))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123354 (= res!964862 (validMask!0 mask!2608))))

(assert (=> start!123354 e!807587))

(assert (=> start!123354 true))

(declare-datatypes ((array!97464 0))(
  ( (array!97465 (arr!47042 (Array (_ BitVec 32) (_ BitVec 64))) (size!47592 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97464)

(declare-fun array_inv!36070 (array!97464) Bool)

(assert (=> start!123354 (array_inv!36070 a!2831)))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun e!807586 () Bool)

(declare-fun b!1430432 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430432 (= e!807586 (or (= (select (arr!47042 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47042 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47042 a!2831) index!585) (select (arr!47042 a!2831) j!81)) (not (= (select (store (arr!47042 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun b!1430433 () Bool)

(declare-fun e!807590 () Bool)

(declare-fun e!807589 () Bool)

(assert (=> b!1430433 (= e!807590 e!807589)))

(declare-fun res!964869 () Bool)

(assert (=> b!1430433 (=> (not res!964869) (not e!807589))))

(declare-datatypes ((SeekEntryResult!11321 0))(
  ( (MissingZero!11321 (index!47676 (_ BitVec 32))) (Found!11321 (index!47677 (_ BitVec 32))) (Intermediate!11321 (undefined!12133 Bool) (index!47678 (_ BitVec 32)) (x!129313 (_ BitVec 32))) (Undefined!11321) (MissingVacant!11321 (index!47679 (_ BitVec 32))) )
))
(declare-fun lt!629758 () SeekEntryResult!11321)

(declare-fun lt!629760 () (_ BitVec 64))

(declare-fun lt!629756 () array!97464)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97464 (_ BitVec 32)) SeekEntryResult!11321)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430433 (= res!964869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629760 mask!2608) lt!629760 lt!629756 mask!2608) lt!629758))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430433 (= lt!629758 (Intermediate!11321 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430433 (= lt!629760 (select (store (arr!47042 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430433 (= lt!629756 (array!97465 (store (arr!47042 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47592 a!2831)))))

(declare-fun b!1430434 () Bool)

(declare-fun res!964863 () Bool)

(assert (=> b!1430434 (=> (not res!964863) (not e!807587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97464 (_ BitVec 32)) Bool)

(assert (=> b!1430434 (= res!964863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430435 () Bool)

(declare-fun res!964873 () Bool)

(assert (=> b!1430435 (=> (not res!964873) (not e!807589))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1430435 (= res!964873 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430436 () Bool)

(declare-fun res!964871 () Bool)

(assert (=> b!1430436 (=> (not res!964871) (not e!807587))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1430436 (= res!964871 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47592 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47592 a!2831))))))

(declare-fun b!1430437 () Bool)

(declare-fun res!964861 () Bool)

(assert (=> b!1430437 (=> (not res!964861) (not e!807587))))

(assert (=> b!1430437 (= res!964861 (and (= (size!47592 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47592 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47592 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430438 () Bool)

(declare-fun res!964865 () Bool)

(assert (=> b!1430438 (=> (not res!964865) (not e!807587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430438 (= res!964865 (validKeyInArray!0 (select (arr!47042 a!2831) i!982)))))

(declare-fun b!1430439 () Bool)

(declare-fun res!964867 () Bool)

(assert (=> b!1430439 (=> (not res!964867) (not e!807589))))

(assert (=> b!1430439 (= res!964867 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629760 lt!629756 mask!2608) lt!629758))))

(declare-fun b!1430440 () Bool)

(declare-fun res!964872 () Bool)

(assert (=> b!1430440 (=> (not res!964872) (not e!807587))))

(declare-datatypes ((List!33552 0))(
  ( (Nil!33549) (Cons!33548 (h!34865 (_ BitVec 64)) (t!48246 List!33552)) )
))
(declare-fun arrayNoDuplicates!0 (array!97464 (_ BitVec 32) List!33552) Bool)

(assert (=> b!1430440 (= res!964872 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33549))))

(declare-fun b!1430441 () Bool)

(declare-fun res!964870 () Bool)

(assert (=> b!1430441 (=> (not res!964870) (not e!807586))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97464 (_ BitVec 32)) SeekEntryResult!11321)

(assert (=> b!1430441 (= res!964870 (= (seekEntryOrOpen!0 (select (arr!47042 a!2831) j!81) a!2831 mask!2608) (Found!11321 j!81)))))

(declare-fun b!1430442 () Bool)

(assert (=> b!1430442 (= e!807587 e!807590)))

(declare-fun res!964864 () Bool)

(assert (=> b!1430442 (=> (not res!964864) (not e!807590))))

(declare-fun lt!629757 () SeekEntryResult!11321)

(assert (=> b!1430442 (= res!964864 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608) lt!629757))))

(assert (=> b!1430442 (= lt!629757 (Intermediate!11321 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430443 () Bool)

(assert (=> b!1430443 (= e!807589 (not (or (= (select (arr!47042 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47042 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47042 a!2831) index!585) (select (arr!47042 a!2831) j!81)) (not (= (select (store (arr!47042 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))))

(assert (=> b!1430443 e!807586))

(declare-fun res!964866 () Bool)

(assert (=> b!1430443 (=> (not res!964866) (not e!807586))))

(assert (=> b!1430443 (= res!964866 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48388 0))(
  ( (Unit!48389) )
))
(declare-fun lt!629759 () Unit!48388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48388)

(assert (=> b!1430443 (= lt!629759 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430444 () Bool)

(declare-fun res!964868 () Bool)

(assert (=> b!1430444 (=> (not res!964868) (not e!807587))))

(assert (=> b!1430444 (= res!964868 (validKeyInArray!0 (select (arr!47042 a!2831) j!81)))))

(declare-fun b!1430445 () Bool)

(declare-fun res!964860 () Bool)

(assert (=> b!1430445 (=> (not res!964860) (not e!807589))))

(assert (=> b!1430445 (= res!964860 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47042 a!2831) j!81) a!2831 mask!2608) lt!629757))))

(assert (= (and start!123354 res!964862) b!1430437))

(assert (= (and b!1430437 res!964861) b!1430438))

(assert (= (and b!1430438 res!964865) b!1430444))

(assert (= (and b!1430444 res!964868) b!1430434))

(assert (= (and b!1430434 res!964863) b!1430440))

(assert (= (and b!1430440 res!964872) b!1430436))

(assert (= (and b!1430436 res!964871) b!1430442))

(assert (= (and b!1430442 res!964864) b!1430433))

(assert (= (and b!1430433 res!964869) b!1430445))

(assert (= (and b!1430445 res!964860) b!1430439))

(assert (= (and b!1430439 res!964867) b!1430435))

(assert (= (and b!1430435 res!964873) b!1430443))

(assert (= (and b!1430443 res!964866) b!1430441))

(assert (= (and b!1430441 res!964870) b!1430432))

(declare-fun m!1320405 () Bool)

(assert (=> b!1430438 m!1320405))

(assert (=> b!1430438 m!1320405))

(declare-fun m!1320407 () Bool)

(assert (=> b!1430438 m!1320407))

(declare-fun m!1320409 () Bool)

(assert (=> b!1430434 m!1320409))

(declare-fun m!1320411 () Bool)

(assert (=> b!1430444 m!1320411))

(assert (=> b!1430444 m!1320411))

(declare-fun m!1320413 () Bool)

(assert (=> b!1430444 m!1320413))

(assert (=> b!1430441 m!1320411))

(assert (=> b!1430441 m!1320411))

(declare-fun m!1320415 () Bool)

(assert (=> b!1430441 m!1320415))

(declare-fun m!1320417 () Bool)

(assert (=> b!1430443 m!1320417))

(declare-fun m!1320419 () Bool)

(assert (=> b!1430443 m!1320419))

(declare-fun m!1320421 () Bool)

(assert (=> b!1430443 m!1320421))

(declare-fun m!1320423 () Bool)

(assert (=> b!1430443 m!1320423))

(assert (=> b!1430443 m!1320411))

(declare-fun m!1320425 () Bool)

(assert (=> b!1430443 m!1320425))

(declare-fun m!1320427 () Bool)

(assert (=> start!123354 m!1320427))

(declare-fun m!1320429 () Bool)

(assert (=> start!123354 m!1320429))

(assert (=> b!1430432 m!1320421))

(assert (=> b!1430432 m!1320411))

(assert (=> b!1430432 m!1320417))

(assert (=> b!1430432 m!1320419))

(assert (=> b!1430442 m!1320411))

(assert (=> b!1430442 m!1320411))

(declare-fun m!1320431 () Bool)

(assert (=> b!1430442 m!1320431))

(assert (=> b!1430442 m!1320431))

(assert (=> b!1430442 m!1320411))

(declare-fun m!1320433 () Bool)

(assert (=> b!1430442 m!1320433))

(declare-fun m!1320435 () Bool)

(assert (=> b!1430439 m!1320435))

(declare-fun m!1320437 () Bool)

(assert (=> b!1430433 m!1320437))

(assert (=> b!1430433 m!1320437))

(declare-fun m!1320439 () Bool)

(assert (=> b!1430433 m!1320439))

(assert (=> b!1430433 m!1320417))

(declare-fun m!1320441 () Bool)

(assert (=> b!1430433 m!1320441))

(assert (=> b!1430445 m!1320411))

(assert (=> b!1430445 m!1320411))

(declare-fun m!1320443 () Bool)

(assert (=> b!1430445 m!1320443))

(declare-fun m!1320445 () Bool)

(assert (=> b!1430440 m!1320445))

(push 1)

(assert (not b!1430438))

(assert (not b!1430442))

(assert (not b!1430443))

(assert (not b!1430433))

(assert (not start!123354))

(assert (not b!1430439))

(assert (not b!1430445))

(assert (not b!1430440))

(assert (not b!1430444))

(assert (not b!1430441))

(assert (not b!1430434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1430617 () Bool)

(declare-fun lt!629832 () SeekEntryResult!11321)

(assert (=> b!1430617 (and (bvsge (index!47678 lt!629832) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629832) (size!47592 a!2831)))))

(declare-fun res!964986 () Bool)

(assert (=> b!1430617 (= res!964986 (= (select (arr!47042 a!2831) (index!47678 lt!629832)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807676 () Bool)

(assert (=> b!1430617 (=> res!964986 e!807676)))

(declare-fun d!153673 () Bool)

(declare-fun e!807675 () Bool)

(assert (=> d!153673 e!807675))

(declare-fun c!132312 () Bool)

(assert (=> d!153673 (= c!132312 (and (is-Intermediate!11321 lt!629832) (undefined!12133 lt!629832)))))

(declare-fun e!807677 () SeekEntryResult!11321)

(assert (=> d!153673 (= lt!629832 e!807677)))

(declare-fun c!132311 () Bool)

(assert (=> d!153673 (= c!132311 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!629831 () (_ BitVec 64))

(assert (=> d!153673 (= lt!629831 (select (arr!47042 a!2831) (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608)))))

(assert (=> d!153673 (validMask!0 mask!2608)))

(assert (=> d!153673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608) lt!629832)))

(declare-fun e!807674 () SeekEntryResult!11321)

(declare-fun b!1430618 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430618 (= e!807674 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430619 () Bool)

(declare-fun e!807673 () Bool)

(assert (=> b!1430619 (= e!807675 e!807673)))

(declare-fun res!964987 () Bool)

(assert (=> b!1430619 (= res!964987 (and (is-Intermediate!11321 lt!629832) (not (undefined!12133 lt!629832)) (bvslt (x!129313 lt!629832) #b01111111111111111111111111111110) (bvsge (x!129313 lt!629832) #b00000000000000000000000000000000) (bvsge (x!129313 lt!629832) #b00000000000000000000000000000000)))))

(assert (=> b!1430619 (=> (not res!964987) (not e!807673))))

(declare-fun b!1430620 () Bool)

(assert (=> b!1430620 (= e!807677 e!807674)))

(declare-fun c!132310 () Bool)

(assert (=> b!1430620 (= c!132310 (or (= lt!629831 (select (arr!47042 a!2831) j!81)) (= (bvadd lt!629831 lt!629831) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430621 () Bool)

(assert (=> b!1430621 (= e!807674 (Intermediate!11321 false (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430622 () Bool)

(assert (=> b!1430622 (and (bvsge (index!47678 lt!629832) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629832) (size!47592 a!2831)))))

(assert (=> b!1430622 (= e!807676 (= (select (arr!47042 a!2831) (index!47678 lt!629832)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430623 () Bool)

(assert (=> b!1430623 (= e!807677 (Intermediate!11321 true (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430624 () Bool)

(assert (=> b!1430624 (= e!807675 (bvsge (x!129313 lt!629832) #b01111111111111111111111111111110))))

(declare-fun b!1430625 () Bool)

(assert (=> b!1430625 (and (bvsge (index!47678 lt!629832) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629832) (size!47592 a!2831)))))

(declare-fun res!964988 () Bool)

(assert (=> b!1430625 (= res!964988 (= (select (arr!47042 a!2831) (index!47678 lt!629832)) (select (arr!47042 a!2831) j!81)))))

(assert (=> b!1430625 (=> res!964988 e!807676)))

(assert (=> b!1430625 (= e!807673 e!807676)))

(assert (= (and d!153673 c!132311) b!1430623))

(assert (= (and d!153673 (not c!132311)) b!1430620))

(assert (= (and b!1430620 c!132310) b!1430621))

(assert (= (and b!1430620 (not c!132310)) b!1430618))

(assert (= (and d!153673 c!132312) b!1430624))

(assert (= (and d!153673 (not c!132312)) b!1430619))

(assert (= (and b!1430619 res!964987) b!1430625))

(assert (= (and b!1430625 (not res!964988)) b!1430617))

(assert (= (and b!1430617 (not res!964986)) b!1430622))

(declare-fun m!1320569 () Bool)

(assert (=> b!1430622 m!1320569))

(assert (=> b!1430617 m!1320569))

(assert (=> b!1430625 m!1320569))

(assert (=> b!1430618 m!1320431))

(declare-fun m!1320571 () Bool)

(assert (=> b!1430618 m!1320571))

(assert (=> b!1430618 m!1320571))

(assert (=> b!1430618 m!1320411))

(declare-fun m!1320573 () Bool)

(assert (=> b!1430618 m!1320573))

(assert (=> d!153673 m!1320431))

(declare-fun m!1320575 () Bool)

(assert (=> d!153673 m!1320575))

(assert (=> d!153673 m!1320427))

(assert (=> b!1430442 d!153673))

(declare-fun d!153683 () Bool)

(declare-fun lt!629855 () (_ BitVec 32))

(declare-fun lt!629854 () (_ BitVec 32))

(assert (=> d!153683 (= lt!629855 (bvmul (bvxor lt!629854 (bvlshr lt!629854 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153683 (= lt!629854 ((_ extract 31 0) (bvand (bvxor (select (arr!47042 a!2831) j!81) (bvlshr (select (arr!47042 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153683 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964989 (let ((h!34869 ((_ extract 31 0) (bvand (bvxor (select (arr!47042 a!2831) j!81) (bvlshr (select (arr!47042 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129319 (bvmul (bvxor h!34869 (bvlshr h!34869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129319 (bvlshr x!129319 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964989 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964989 #b00000000000000000000000000000000))))))

(assert (=> d!153683 (= (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) (bvand (bvxor lt!629855 (bvlshr lt!629855 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430442 d!153683))

(declare-fun b!1430735 () Bool)

(declare-fun c!132347 () Bool)

(declare-fun lt!629878 () (_ BitVec 64))

(assert (=> b!1430735 (= c!132347 (= lt!629878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807748 () SeekEntryResult!11321)

(declare-fun e!807746 () SeekEntryResult!11321)

(assert (=> b!1430735 (= e!807748 e!807746)))

(declare-fun b!1430736 () Bool)

(declare-fun lt!629877 () SeekEntryResult!11321)

(assert (=> b!1430736 (= e!807748 (Found!11321 (index!47678 lt!629877)))))

(declare-fun b!1430738 () Bool)

(declare-fun e!807747 () SeekEntryResult!11321)

(assert (=> b!1430738 (= e!807747 e!807748)))

(assert (=> b!1430738 (= lt!629878 (select (arr!47042 a!2831) (index!47678 lt!629877)))))

(declare-fun c!132348 () Bool)

(assert (=> b!1430738 (= c!132348 (= lt!629878 (select (arr!47042 a!2831) j!81)))))

(declare-fun b!1430739 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97464 (_ BitVec 32)) SeekEntryResult!11321)

(assert (=> b!1430739 (= e!807746 (seekKeyOrZeroReturnVacant!0 (x!129313 lt!629877) (index!47678 lt!629877) (index!47678 lt!629877) (select (arr!47042 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430740 () Bool)

(assert (=> b!1430740 (= e!807746 (MissingZero!11321 (index!47678 lt!629877)))))

(declare-fun b!1430737 () Bool)

(assert (=> b!1430737 (= e!807747 Undefined!11321)))

(declare-fun d!153695 () Bool)

(declare-fun lt!629876 () SeekEntryResult!11321)

(assert (=> d!153695 (and (or (is-Undefined!11321 lt!629876) (not (is-Found!11321 lt!629876)) (and (bvsge (index!47677 lt!629876) #b00000000000000000000000000000000) (bvslt (index!47677 lt!629876) (size!47592 a!2831)))) (or (is-Undefined!11321 lt!629876) (is-Found!11321 lt!629876) (not (is-MissingZero!11321 lt!629876)) (and (bvsge (index!47676 lt!629876) #b00000000000000000000000000000000) (bvslt (index!47676 lt!629876) (size!47592 a!2831)))) (or (is-Undefined!11321 lt!629876) (is-Found!11321 lt!629876) (is-MissingZero!11321 lt!629876) (not (is-MissingVacant!11321 lt!629876)) (and (bvsge (index!47679 lt!629876) #b00000000000000000000000000000000) (bvslt (index!47679 lt!629876) (size!47592 a!2831)))) (or (is-Undefined!11321 lt!629876) (ite (is-Found!11321 lt!629876) (= (select (arr!47042 a!2831) (index!47677 lt!629876)) (select (arr!47042 a!2831) j!81)) (ite (is-MissingZero!11321 lt!629876) (= (select (arr!47042 a!2831) (index!47676 lt!629876)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11321 lt!629876) (= (select (arr!47042 a!2831) (index!47679 lt!629876)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153695 (= lt!629876 e!807747)))

(declare-fun c!132349 () Bool)

(assert (=> d!153695 (= c!132349 (and (is-Intermediate!11321 lt!629877) (undefined!12133 lt!629877)))))

(assert (=> d!153695 (= lt!629877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153695 (validMask!0 mask!2608)))

(assert (=> d!153695 (= (seekEntryOrOpen!0 (select (arr!47042 a!2831) j!81) a!2831 mask!2608) lt!629876)))

(assert (= (and d!153695 c!132349) b!1430737))

(assert (= (and d!153695 (not c!132349)) b!1430738))

(assert (= (and b!1430738 c!132348) b!1430736))

(assert (= (and b!1430738 (not c!132348)) b!1430735))

(assert (= (and b!1430735 c!132347) b!1430740))

(assert (= (and b!1430735 (not c!132347)) b!1430739))

(declare-fun m!1320633 () Bool)

(assert (=> b!1430738 m!1320633))

(assert (=> b!1430739 m!1320411))

(declare-fun m!1320635 () Bool)

(assert (=> b!1430739 m!1320635))

(assert (=> d!153695 m!1320427))

(assert (=> d!153695 m!1320411))

(assert (=> d!153695 m!1320431))

(declare-fun m!1320637 () Bool)

(assert (=> d!153695 m!1320637))

(declare-fun m!1320639 () Bool)

(assert (=> d!153695 m!1320639))

(assert (=> d!153695 m!1320431))

(assert (=> d!153695 m!1320411))

(assert (=> d!153695 m!1320433))

(declare-fun m!1320641 () Bool)

(assert (=> d!153695 m!1320641))

(assert (=> b!1430441 d!153695))

(declare-fun d!153715 () Bool)

(declare-fun res!965036 () Bool)

(declare-fun e!807755 () Bool)

(assert (=> d!153715 (=> res!965036 e!807755)))

(assert (=> d!153715 (= res!965036 (bvsge j!81 (size!47592 a!2831)))))

(assert (=> d!153715 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807755)))

(declare-fun b!1430749 () Bool)

(declare-fun e!807757 () Bool)

(assert (=> b!1430749 (= e!807755 e!807757)))

(declare-fun c!132352 () Bool)

(assert (=> b!1430749 (= c!132352 (validKeyInArray!0 (select (arr!47042 a!2831) j!81)))))

(declare-fun b!1430750 () Bool)

(declare-fun e!807756 () Bool)

(assert (=> b!1430750 (= e!807757 e!807756)))

(declare-fun lt!629887 () (_ BitVec 64))

(assert (=> b!1430750 (= lt!629887 (select (arr!47042 a!2831) j!81))))

(declare-fun lt!629885 () Unit!48388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97464 (_ BitVec 64) (_ BitVec 32)) Unit!48388)

(assert (=> b!1430750 (= lt!629885 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629887 j!81))))

(declare-fun arrayContainsKey!0 (array!97464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1430750 (arrayContainsKey!0 a!2831 lt!629887 #b00000000000000000000000000000000)))

(declare-fun lt!629886 () Unit!48388)

(assert (=> b!1430750 (= lt!629886 lt!629885)))

(declare-fun res!965037 () Bool)

(assert (=> b!1430750 (= res!965037 (= (seekEntryOrOpen!0 (select (arr!47042 a!2831) j!81) a!2831 mask!2608) (Found!11321 j!81)))))

(assert (=> b!1430750 (=> (not res!965037) (not e!807756))))

(declare-fun b!1430751 () Bool)

(declare-fun call!67442 () Bool)

(assert (=> b!1430751 (= e!807756 call!67442)))

(declare-fun bm!67439 () Bool)

(assert (=> bm!67439 (= call!67442 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430752 () Bool)

(assert (=> b!1430752 (= e!807757 call!67442)))

(assert (= (and d!153715 (not res!965036)) b!1430749))

(assert (= (and b!1430749 c!132352) b!1430750))

(assert (= (and b!1430749 (not c!132352)) b!1430752))

(assert (= (and b!1430750 res!965037) b!1430751))

(assert (= (or b!1430751 b!1430752) bm!67439))

(assert (=> b!1430749 m!1320411))

(assert (=> b!1430749 m!1320411))

(assert (=> b!1430749 m!1320413))

(assert (=> b!1430750 m!1320411))

(declare-fun m!1320643 () Bool)

(assert (=> b!1430750 m!1320643))

(declare-fun m!1320645 () Bool)

(assert (=> b!1430750 m!1320645))

(assert (=> b!1430750 m!1320411))

(assert (=> b!1430750 m!1320415))

(declare-fun m!1320647 () Bool)

(assert (=> bm!67439 m!1320647))

(assert (=> b!1430443 d!153715))

(declare-fun d!153721 () Bool)

(assert (=> d!153721 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629890 () Unit!48388)

(declare-fun choose!38 (array!97464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48388)

(assert (=> d!153721 (= lt!629890 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153721 (validMask!0 mask!2608)))

(assert (=> d!153721 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629890)))

(declare-fun bs!41670 () Bool)

(assert (= bs!41670 d!153721))

(assert (=> bs!41670 m!1320423))

(declare-fun m!1320649 () Bool)

(assert (=> bs!41670 m!1320649))

(assert (=> bs!41670 m!1320427))

(assert (=> b!1430443 d!153721))

(declare-fun d!153723 () Bool)

(declare-fun res!965038 () Bool)

(declare-fun e!807758 () Bool)

(assert (=> d!153723 (=> res!965038 e!807758)))

(assert (=> d!153723 (= res!965038 (bvsge #b00000000000000000000000000000000 (size!47592 a!2831)))))

(assert (=> d!153723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807758)))

(declare-fun b!1430753 () Bool)

(declare-fun e!807760 () Bool)

(assert (=> b!1430753 (= e!807758 e!807760)))

(declare-fun c!132353 () Bool)

(assert (=> b!1430753 (= c!132353 (validKeyInArray!0 (select (arr!47042 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430754 () Bool)

(declare-fun e!807759 () Bool)

(assert (=> b!1430754 (= e!807760 e!807759)))

(declare-fun lt!629893 () (_ BitVec 64))

(assert (=> b!1430754 (= lt!629893 (select (arr!47042 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629891 () Unit!48388)

(assert (=> b!1430754 (= lt!629891 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629893 #b00000000000000000000000000000000))))

(assert (=> b!1430754 (arrayContainsKey!0 a!2831 lt!629893 #b00000000000000000000000000000000)))

(declare-fun lt!629892 () Unit!48388)

(assert (=> b!1430754 (= lt!629892 lt!629891)))

(declare-fun res!965039 () Bool)

(assert (=> b!1430754 (= res!965039 (= (seekEntryOrOpen!0 (select (arr!47042 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11321 #b00000000000000000000000000000000)))))

(assert (=> b!1430754 (=> (not res!965039) (not e!807759))))

(declare-fun b!1430755 () Bool)

(declare-fun call!67443 () Bool)

(assert (=> b!1430755 (= e!807759 call!67443)))

(declare-fun bm!67440 () Bool)

(assert (=> bm!67440 (= call!67443 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430756 () Bool)

(assert (=> b!1430756 (= e!807760 call!67443)))

(assert (= (and d!153723 (not res!965038)) b!1430753))

(assert (= (and b!1430753 c!132353) b!1430754))

(assert (= (and b!1430753 (not c!132353)) b!1430756))

(assert (= (and b!1430754 res!965039) b!1430755))

(assert (= (or b!1430755 b!1430756) bm!67440))

(declare-fun m!1320651 () Bool)

(assert (=> b!1430753 m!1320651))

(assert (=> b!1430753 m!1320651))

(declare-fun m!1320653 () Bool)

(assert (=> b!1430753 m!1320653))

(assert (=> b!1430754 m!1320651))

(declare-fun m!1320655 () Bool)

(assert (=> b!1430754 m!1320655))

(declare-fun m!1320657 () Bool)

(assert (=> b!1430754 m!1320657))

(assert (=> b!1430754 m!1320651))

(declare-fun m!1320659 () Bool)

(assert (=> b!1430754 m!1320659))

(declare-fun m!1320661 () Bool)

(assert (=> bm!67440 m!1320661))

(assert (=> b!1430434 d!153723))

(declare-fun b!1430757 () Bool)

(declare-fun lt!629895 () SeekEntryResult!11321)

(assert (=> b!1430757 (and (bvsge (index!47678 lt!629895) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629895) (size!47592 lt!629756)))))

(declare-fun res!965040 () Bool)

(assert (=> b!1430757 (= res!965040 (= (select (arr!47042 lt!629756) (index!47678 lt!629895)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807764 () Bool)

(assert (=> b!1430757 (=> res!965040 e!807764)))

(declare-fun d!153725 () Bool)

(declare-fun e!807763 () Bool)

(assert (=> d!153725 e!807763))

(declare-fun c!132356 () Bool)

(assert (=> d!153725 (= c!132356 (and (is-Intermediate!11321 lt!629895) (undefined!12133 lt!629895)))))

(declare-fun e!807765 () SeekEntryResult!11321)

(assert (=> d!153725 (= lt!629895 e!807765)))

(declare-fun c!132355 () Bool)

(assert (=> d!153725 (= c!132355 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!629894 () (_ BitVec 64))

(assert (=> d!153725 (= lt!629894 (select (arr!47042 lt!629756) (toIndex!0 lt!629760 mask!2608)))))

(assert (=> d!153725 (validMask!0 mask!2608)))

(assert (=> d!153725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629760 mask!2608) lt!629760 lt!629756 mask!2608) lt!629895)))

(declare-fun e!807762 () SeekEntryResult!11321)

(declare-fun b!1430758 () Bool)

(assert (=> b!1430758 (= e!807762 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629760 lt!629756 mask!2608))))

(declare-fun b!1430759 () Bool)

(declare-fun e!807761 () Bool)

(assert (=> b!1430759 (= e!807763 e!807761)))

(declare-fun res!965041 () Bool)

(assert (=> b!1430759 (= res!965041 (and (is-Intermediate!11321 lt!629895) (not (undefined!12133 lt!629895)) (bvslt (x!129313 lt!629895) #b01111111111111111111111111111110) (bvsge (x!129313 lt!629895) #b00000000000000000000000000000000) (bvsge (x!129313 lt!629895) #b00000000000000000000000000000000)))))

(assert (=> b!1430759 (=> (not res!965041) (not e!807761))))

(declare-fun b!1430760 () Bool)

(assert (=> b!1430760 (= e!807765 e!807762)))

(declare-fun c!132354 () Bool)

(assert (=> b!1430760 (= c!132354 (or (= lt!629894 lt!629760) (= (bvadd lt!629894 lt!629894) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430761 () Bool)

(assert (=> b!1430761 (= e!807762 (Intermediate!11321 false (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430762 () Bool)

(assert (=> b!1430762 (and (bvsge (index!47678 lt!629895) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629895) (size!47592 lt!629756)))))

(assert (=> b!1430762 (= e!807764 (= (select (arr!47042 lt!629756) (index!47678 lt!629895)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430763 () Bool)

(assert (=> b!1430763 (= e!807765 (Intermediate!11321 true (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430764 () Bool)

(assert (=> b!1430764 (= e!807763 (bvsge (x!129313 lt!629895) #b01111111111111111111111111111110))))

(declare-fun b!1430765 () Bool)

(assert (=> b!1430765 (and (bvsge (index!47678 lt!629895) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629895) (size!47592 lt!629756)))))

(declare-fun res!965042 () Bool)

(assert (=> b!1430765 (= res!965042 (= (select (arr!47042 lt!629756) (index!47678 lt!629895)) lt!629760))))

(assert (=> b!1430765 (=> res!965042 e!807764)))

(assert (=> b!1430765 (= e!807761 e!807764)))

(assert (= (and d!153725 c!132355) b!1430763))

(assert (= (and d!153725 (not c!132355)) b!1430760))

(assert (= (and b!1430760 c!132354) b!1430761))

(assert (= (and b!1430760 (not c!132354)) b!1430758))

(assert (= (and d!153725 c!132356) b!1430764))

(assert (= (and d!153725 (not c!132356)) b!1430759))

(assert (= (and b!1430759 res!965041) b!1430765))

(assert (= (and b!1430765 (not res!965042)) b!1430757))

(assert (= (and b!1430757 (not res!965040)) b!1430762))

(declare-fun m!1320663 () Bool)

(assert (=> b!1430762 m!1320663))

(assert (=> b!1430757 m!1320663))

(assert (=> b!1430765 m!1320663))

(assert (=> b!1430758 m!1320437))

(declare-fun m!1320665 () Bool)

(assert (=> b!1430758 m!1320665))

(assert (=> b!1430758 m!1320665))

(declare-fun m!1320667 () Bool)

(assert (=> b!1430758 m!1320667))

(assert (=> d!153725 m!1320437))

(declare-fun m!1320669 () Bool)

(assert (=> d!153725 m!1320669))

(assert (=> d!153725 m!1320427))

(assert (=> b!1430433 d!153725))

(declare-fun d!153727 () Bool)

(declare-fun lt!629897 () (_ BitVec 32))

(declare-fun lt!629896 () (_ BitVec 32))

(assert (=> d!153727 (= lt!629897 (bvmul (bvxor lt!629896 (bvlshr lt!629896 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153727 (= lt!629896 ((_ extract 31 0) (bvand (bvxor lt!629760 (bvlshr lt!629760 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153727 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964989 (let ((h!34869 ((_ extract 31 0) (bvand (bvxor lt!629760 (bvlshr lt!629760 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129319 (bvmul (bvxor h!34869 (bvlshr h!34869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129319 (bvlshr x!129319 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964989 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964989 #b00000000000000000000000000000000))))))

(assert (=> d!153727 (= (toIndex!0 lt!629760 mask!2608) (bvand (bvxor lt!629897 (bvlshr lt!629897 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430433 d!153727))

(declare-fun d!153729 () Bool)

(assert (=> d!153729 (= (validKeyInArray!0 (select (arr!47042 a!2831) j!81)) (and (not (= (select (arr!47042 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47042 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430444 d!153729))

(declare-fun b!1430766 () Bool)

(declare-fun lt!629899 () SeekEntryResult!11321)

(assert (=> b!1430766 (and (bvsge (index!47678 lt!629899) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629899) (size!47592 a!2831)))))

(declare-fun res!965043 () Bool)

(assert (=> b!1430766 (= res!965043 (= (select (arr!47042 a!2831) (index!47678 lt!629899)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807769 () Bool)

(assert (=> b!1430766 (=> res!965043 e!807769)))

(declare-fun d!153731 () Bool)

(declare-fun e!807768 () Bool)

(assert (=> d!153731 e!807768))

(declare-fun c!132359 () Bool)

(assert (=> d!153731 (= c!132359 (and (is-Intermediate!11321 lt!629899) (undefined!12133 lt!629899)))))

(declare-fun e!807770 () SeekEntryResult!11321)

(assert (=> d!153731 (= lt!629899 e!807770)))

(declare-fun c!132358 () Bool)

(assert (=> d!153731 (= c!132358 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!629898 () (_ BitVec 64))

(assert (=> d!153731 (= lt!629898 (select (arr!47042 a!2831) index!585))))

(assert (=> d!153731 (validMask!0 mask!2608)))

(assert (=> d!153731 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47042 a!2831) j!81) a!2831 mask!2608) lt!629899)))

(declare-fun e!807767 () SeekEntryResult!11321)

(declare-fun b!1430767 () Bool)

(assert (=> b!1430767 (= e!807767 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430768 () Bool)

(declare-fun e!807766 () Bool)

(assert (=> b!1430768 (= e!807768 e!807766)))

(declare-fun res!965044 () Bool)

(assert (=> b!1430768 (= res!965044 (and (is-Intermediate!11321 lt!629899) (not (undefined!12133 lt!629899)) (bvslt (x!129313 lt!629899) #b01111111111111111111111111111110) (bvsge (x!129313 lt!629899) #b00000000000000000000000000000000) (bvsge (x!129313 lt!629899) x!605)))))

(assert (=> b!1430768 (=> (not res!965044) (not e!807766))))

(declare-fun b!1430769 () Bool)

(assert (=> b!1430769 (= e!807770 e!807767)))

(declare-fun c!132357 () Bool)

(assert (=> b!1430769 (= c!132357 (or (= lt!629898 (select (arr!47042 a!2831) j!81)) (= (bvadd lt!629898 lt!629898) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430770 () Bool)

(assert (=> b!1430770 (= e!807767 (Intermediate!11321 false index!585 x!605))))

(declare-fun b!1430771 () Bool)

(assert (=> b!1430771 (and (bvsge (index!47678 lt!629899) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629899) (size!47592 a!2831)))))

(assert (=> b!1430771 (= e!807769 (= (select (arr!47042 a!2831) (index!47678 lt!629899)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430772 () Bool)

(assert (=> b!1430772 (= e!807770 (Intermediate!11321 true index!585 x!605))))

(declare-fun b!1430773 () Bool)

(assert (=> b!1430773 (= e!807768 (bvsge (x!129313 lt!629899) #b01111111111111111111111111111110))))

(declare-fun b!1430774 () Bool)

(assert (=> b!1430774 (and (bvsge (index!47678 lt!629899) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629899) (size!47592 a!2831)))))

(declare-fun res!965045 () Bool)

(assert (=> b!1430774 (= res!965045 (= (select (arr!47042 a!2831) (index!47678 lt!629899)) (select (arr!47042 a!2831) j!81)))))

(assert (=> b!1430774 (=> res!965045 e!807769)))

(assert (=> b!1430774 (= e!807766 e!807769)))

(assert (= (and d!153731 c!132358) b!1430772))

(assert (= (and d!153731 (not c!132358)) b!1430769))

(assert (= (and b!1430769 c!132357) b!1430770))

(assert (= (and b!1430769 (not c!132357)) b!1430767))

(assert (= (and d!153731 c!132359) b!1430773))

(assert (= (and d!153731 (not c!132359)) b!1430768))

(assert (= (and b!1430768 res!965044) b!1430774))

(assert (= (and b!1430774 (not res!965045)) b!1430766))

(assert (= (and b!1430766 (not res!965043)) b!1430771))

(declare-fun m!1320671 () Bool)

(assert (=> b!1430771 m!1320671))

(assert (=> b!1430766 m!1320671))

(assert (=> b!1430774 m!1320671))

(declare-fun m!1320673 () Bool)

(assert (=> b!1430767 m!1320673))

(assert (=> b!1430767 m!1320673))

(assert (=> b!1430767 m!1320411))

(declare-fun m!1320675 () Bool)

(assert (=> b!1430767 m!1320675))

(assert (=> d!153731 m!1320421))

(assert (=> d!153731 m!1320427))

(assert (=> b!1430445 d!153731))

(declare-fun d!153733 () Bool)

(assert (=> d!153733 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123354 d!153733))

(declare-fun d!153735 () Bool)

(assert (=> d!153735 (= (array_inv!36070 a!2831) (bvsge (size!47592 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123354 d!153735))

(declare-fun d!153737 () Bool)

(assert (=> d!153737 (= (validKeyInArray!0 (select (arr!47042 a!2831) i!982)) (and (not (= (select (arr!47042 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47042 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430438 d!153737))

(declare-fun b!1430787 () Bool)

(declare-fun lt!629907 () SeekEntryResult!11321)

(assert (=> b!1430787 (and (bvsge (index!47678 lt!629907) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629907) (size!47592 lt!629756)))))

(declare-fun res!965046 () Bool)

(assert (=> b!1430787 (= res!965046 (= (select (arr!47042 lt!629756) (index!47678 lt!629907)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807780 () Bool)

(assert (=> b!1430787 (=> res!965046 e!807780)))

(declare-fun d!153739 () Bool)

(declare-fun e!807779 () Bool)

(assert (=> d!153739 e!807779))

(declare-fun c!132368 () Bool)

(assert (=> d!153739 (= c!132368 (and (is-Intermediate!11321 lt!629907) (undefined!12133 lt!629907)))))

(declare-fun e!807781 () SeekEntryResult!11321)

(assert (=> d!153739 (= lt!629907 e!807781)))

(declare-fun c!132367 () Bool)

(assert (=> d!153739 (= c!132367 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!629906 () (_ BitVec 64))

(assert (=> d!153739 (= lt!629906 (select (arr!47042 lt!629756) index!585))))

(assert (=> d!153739 (validMask!0 mask!2608)))

(assert (=> d!153739 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629760 lt!629756 mask!2608) lt!629907)))

(declare-fun e!807778 () SeekEntryResult!11321)

(declare-fun b!1430788 () Bool)

(assert (=> b!1430788 (= e!807778 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629760 lt!629756 mask!2608))))

(declare-fun b!1430789 () Bool)

(declare-fun e!807777 () Bool)

(assert (=> b!1430789 (= e!807779 e!807777)))

(declare-fun res!965047 () Bool)

(assert (=> b!1430789 (= res!965047 (and (is-Intermediate!11321 lt!629907) (not (undefined!12133 lt!629907)) (bvslt (x!129313 lt!629907) #b01111111111111111111111111111110) (bvsge (x!129313 lt!629907) #b00000000000000000000000000000000) (bvsge (x!129313 lt!629907) x!605)))))

(assert (=> b!1430789 (=> (not res!965047) (not e!807777))))

(declare-fun b!1430790 () Bool)

(assert (=> b!1430790 (= e!807781 e!807778)))

(declare-fun c!132366 () Bool)

(assert (=> b!1430790 (= c!132366 (or (= lt!629906 lt!629760) (= (bvadd lt!629906 lt!629906) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430791 () Bool)

(assert (=> b!1430791 (= e!807778 (Intermediate!11321 false index!585 x!605))))

(declare-fun b!1430792 () Bool)

(assert (=> b!1430792 (and (bvsge (index!47678 lt!629907) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629907) (size!47592 lt!629756)))))

(assert (=> b!1430792 (= e!807780 (= (select (arr!47042 lt!629756) (index!47678 lt!629907)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430793 () Bool)

(assert (=> b!1430793 (= e!807781 (Intermediate!11321 true index!585 x!605))))

(declare-fun b!1430794 () Bool)

(assert (=> b!1430794 (= e!807779 (bvsge (x!129313 lt!629907) #b01111111111111111111111111111110))))

(declare-fun b!1430795 () Bool)

(assert (=> b!1430795 (and (bvsge (index!47678 lt!629907) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629907) (size!47592 lt!629756)))))

(declare-fun res!965048 () Bool)

(assert (=> b!1430795 (= res!965048 (= (select (arr!47042 lt!629756) (index!47678 lt!629907)) lt!629760))))

(assert (=> b!1430795 (=> res!965048 e!807780)))

(assert (=> b!1430795 (= e!807777 e!807780)))

(assert (= (and d!153739 c!132367) b!1430793))

(assert (= (and d!153739 (not c!132367)) b!1430790))

(assert (= (and b!1430790 c!132366) b!1430791))

(assert (= (and b!1430790 (not c!132366)) b!1430788))

(assert (= (and d!153739 c!132368) b!1430794))

(assert (= (and d!153739 (not c!132368)) b!1430789))

(assert (= (and b!1430789 res!965047) b!1430795))

(assert (= (and b!1430795 (not res!965048)) b!1430787))

(assert (= (and b!1430787 (not res!965046)) b!1430792))

(declare-fun m!1320677 () Bool)

(assert (=> b!1430792 m!1320677))

(assert (=> b!1430787 m!1320677))

(assert (=> b!1430795 m!1320677))

(assert (=> b!1430788 m!1320673))

(assert (=> b!1430788 m!1320673))

(declare-fun m!1320679 () Bool)

(assert (=> b!1430788 m!1320679))

(declare-fun m!1320681 () Bool)

(assert (=> d!153739 m!1320681))

(assert (=> d!153739 m!1320427))

(assert (=> b!1430439 d!153739))

(declare-fun d!153741 () Bool)

(declare-fun res!965065 () Bool)

(declare-fun e!807806 () Bool)

(assert (=> d!153741 (=> res!965065 e!807806)))

(assert (=> d!153741 (= res!965065 (bvsge #b00000000000000000000000000000000 (size!47592 a!2831)))))

(assert (=> d!153741 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33549) e!807806)))

(declare-fun b!1430834 () Bool)

(declare-fun e!807807 () Bool)

(declare-fun call!67447 () Bool)

(assert (=> b!1430834 (= e!807807 call!67447)))

(declare-fun b!1430835 () Bool)

(declare-fun e!807809 () Bool)

(declare-fun contains!9863 (List!33552 (_ BitVec 64)) Bool)

(assert (=> b!1430835 (= e!807809 (contains!9863 Nil!33549 (select (arr!47042 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67444 () Bool)

(declare-fun c!132381 () Bool)

(assert (=> bm!67444 (= call!67447 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132381 (Cons!33548 (select (arr!47042 a!2831) #b00000000000000000000000000000000) Nil!33549) Nil!33549)))))

(declare-fun b!1430836 () Bool)

(declare-fun e!807808 () Bool)

(assert (=> b!1430836 (= e!807806 e!807808)))

(declare-fun res!965064 () Bool)

(assert (=> b!1430836 (=> (not res!965064) (not e!807808))))

(assert (=> b!1430836 (= res!965064 (not e!807809))))

(declare-fun res!965063 () Bool)

(assert (=> b!1430836 (=> (not res!965063) (not e!807809))))

(assert (=> b!1430836 (= res!965063 (validKeyInArray!0 (select (arr!47042 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430837 () Bool)

(assert (=> b!1430837 (= e!807807 call!67447)))

(declare-fun b!1430838 () Bool)

(assert (=> b!1430838 (= e!807808 e!807807)))

(assert (=> b!1430838 (= c!132381 (validKeyInArray!0 (select (arr!47042 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153741 (not res!965065)) b!1430836))

(assert (= (and b!1430836 res!965063) b!1430835))

(assert (= (and b!1430836 res!965064) b!1430838))

(assert (= (and b!1430838 c!132381) b!1430837))

(assert (= (and b!1430838 (not c!132381)) b!1430834))

(assert (= (or b!1430837 b!1430834) bm!67444))

(assert (=> b!1430835 m!1320651))

(assert (=> b!1430835 m!1320651))

(declare-fun m!1320711 () Bool)

(assert (=> b!1430835 m!1320711))

(assert (=> bm!67444 m!1320651))

(declare-fun m!1320713 () Bool)

(assert (=> bm!67444 m!1320713))

(assert (=> b!1430836 m!1320651))

(assert (=> b!1430836 m!1320651))

(assert (=> b!1430836 m!1320653))

(assert (=> b!1430838 m!1320651))

(assert (=> b!1430838 m!1320651))

(assert (=> b!1430838 m!1320653))

(assert (=> b!1430440 d!153741))

(push 1)

(assert (not d!153725))

(assert (not b!1430836))

(assert (not b!1430758))

(assert (not d!153721))

(assert (not b!1430788))

(assert (not d!153695))

(assert (not b!1430767))

(assert (not b!1430750))

(assert (not d!153673))

(assert (not b!1430749))

(assert (not bm!67444))

(assert (not b!1430838))

(assert (not d!153739))

(assert (not b!1430618))

(assert (not b!1430753))

(assert (not d!153731))

(assert (not b!1430835))

(assert (not b!1430754))

(assert (not bm!67439))

(assert (not b!1430739))

(assert (not bm!67440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!153695 d!153673))

(assert (=> d!153695 d!153683))

(assert (=> d!153695 d!153733))

(declare-fun d!153755 () Bool)

(assert (=> d!153755 (= (validKeyInArray!0 (select (arr!47042 a!2831) #b00000000000000000000000000000000)) (and (not (= (select (arr!47042 a!2831) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47042 a!2831) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430836 d!153755))

(declare-fun b!1430839 () Bool)

(declare-fun lt!629924 () SeekEntryResult!11321)

(assert (=> b!1430839 (and (bvsge (index!47678 lt!629924) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629924) (size!47592 lt!629756)))))

(declare-fun res!965066 () Bool)

(assert (=> b!1430839 (= res!965066 (= (select (arr!47042 lt!629756) (index!47678 lt!629924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807813 () Bool)

(assert (=> b!1430839 (=> res!965066 e!807813)))

(declare-fun d!153757 () Bool)

(declare-fun e!807812 () Bool)

(assert (=> d!153757 e!807812))

(declare-fun c!132384 () Bool)

(assert (=> d!153757 (= c!132384 (and (is-Intermediate!11321 lt!629924) (undefined!12133 lt!629924)))))

(declare-fun e!807814 () SeekEntryResult!11321)

(assert (=> d!153757 (= lt!629924 e!807814)))

(declare-fun c!132383 () Bool)

(assert (=> d!153757 (= c!132383 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629923 () (_ BitVec 64))

(assert (=> d!153757 (= lt!629923 (select (arr!47042 lt!629756) (nextIndex!0 index!585 x!605 mask!2608)))))

(assert (=> d!153757 (validMask!0 mask!2608)))

(assert (=> d!153757 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629760 lt!629756 mask!2608) lt!629924)))

(declare-fun b!1430840 () Bool)

(declare-fun e!807811 () SeekEntryResult!11321)

(assert (=> b!1430840 (= e!807811 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!629760 lt!629756 mask!2608))))

(declare-fun b!1430841 () Bool)

(declare-fun e!807810 () Bool)

(assert (=> b!1430841 (= e!807812 e!807810)))

(declare-fun res!965067 () Bool)

(assert (=> b!1430841 (= res!965067 (and (is-Intermediate!11321 lt!629924) (not (undefined!12133 lt!629924)) (bvslt (x!129313 lt!629924) #b01111111111111111111111111111110) (bvsge (x!129313 lt!629924) #b00000000000000000000000000000000) (bvsge (x!129313 lt!629924) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1430841 (=> (not res!965067) (not e!807810))))

(declare-fun b!1430842 () Bool)

(assert (=> b!1430842 (= e!807814 e!807811)))

(declare-fun c!132382 () Bool)

(assert (=> b!1430842 (= c!132382 (or (= lt!629923 lt!629760) (= (bvadd lt!629923 lt!629923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430843 () Bool)

(assert (=> b!1430843 (= e!807811 (Intermediate!11321 false (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430844 () Bool)

(assert (=> b!1430844 (and (bvsge (index!47678 lt!629924) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629924) (size!47592 lt!629756)))))

(assert (=> b!1430844 (= e!807813 (= (select (arr!47042 lt!629756) (index!47678 lt!629924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430845 () Bool)

(assert (=> b!1430845 (= e!807814 (Intermediate!11321 true (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430846 () Bool)

(assert (=> b!1430846 (= e!807812 (bvsge (x!129313 lt!629924) #b01111111111111111111111111111110))))

(declare-fun b!1430847 () Bool)

(assert (=> b!1430847 (and (bvsge (index!47678 lt!629924) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629924) (size!47592 lt!629756)))))

(declare-fun res!965068 () Bool)

(assert (=> b!1430847 (= res!965068 (= (select (arr!47042 lt!629756) (index!47678 lt!629924)) lt!629760))))

(assert (=> b!1430847 (=> res!965068 e!807813)))

(assert (=> b!1430847 (= e!807810 e!807813)))

(assert (= (and d!153757 c!132383) b!1430845))

(assert (= (and d!153757 (not c!132383)) b!1430842))

(assert (= (and b!1430842 c!132382) b!1430843))

(assert (= (and b!1430842 (not c!132382)) b!1430840))

(assert (= (and d!153757 c!132384) b!1430846))

(assert (= (and d!153757 (not c!132384)) b!1430841))

(assert (= (and b!1430841 res!965067) b!1430847))

(assert (= (and b!1430847 (not res!965068)) b!1430839))

(assert (= (and b!1430839 (not res!965066)) b!1430844))

(declare-fun m!1320717 () Bool)

(assert (=> b!1430844 m!1320717))

(assert (=> b!1430839 m!1320717))

(assert (=> b!1430847 m!1320717))

(assert (=> b!1430840 m!1320673))

(declare-fun m!1320719 () Bool)

(assert (=> b!1430840 m!1320719))

(assert (=> b!1430840 m!1320719))

(declare-fun m!1320721 () Bool)

(assert (=> b!1430840 m!1320721))

(assert (=> d!153757 m!1320673))

(declare-fun m!1320723 () Bool)

(assert (=> d!153757 m!1320723))

(assert (=> d!153757 m!1320427))

(assert (=> b!1430788 d!153757))

(declare-fun d!153759 () Bool)

(declare-fun lt!629927 () (_ BitVec 32))

(assert (=> d!153759 (and (bvsge lt!629927 #b00000000000000000000000000000000) (bvslt lt!629927 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!153759 (= lt!629927 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!153759 (validMask!0 mask!2608)))

(assert (=> d!153759 (= (nextIndex!0 index!585 x!605 mask!2608) lt!629927)))

(declare-fun bs!41672 () Bool)

(assert (= bs!41672 d!153759))

(declare-fun m!1320725 () Bool)

(assert (=> bs!41672 m!1320725))

(assert (=> bs!41672 m!1320427))

(assert (=> b!1430788 d!153759))

(assert (=> b!1430749 d!153729))

(declare-fun d!153761 () Bool)

(declare-fun res!965069 () Bool)

(declare-fun e!807815 () Bool)

(assert (=> d!153761 (=> res!965069 e!807815)))

(assert (=> d!153761 (= res!965069 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47592 a!2831)))))

(assert (=> d!153761 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608) e!807815)))

(declare-fun b!1430848 () Bool)

(declare-fun e!807817 () Bool)

(assert (=> b!1430848 (= e!807815 e!807817)))

(declare-fun c!132385 () Bool)

(assert (=> b!1430848 (= c!132385 (validKeyInArray!0 (select (arr!47042 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1430849 () Bool)

(declare-fun e!807816 () Bool)

(assert (=> b!1430849 (= e!807817 e!807816)))

(declare-fun lt!629930 () (_ BitVec 64))

(assert (=> b!1430849 (= lt!629930 (select (arr!47042 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!629928 () Unit!48388)

(assert (=> b!1430849 (= lt!629928 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629930 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1430849 (arrayContainsKey!0 a!2831 lt!629930 #b00000000000000000000000000000000)))

(declare-fun lt!629929 () Unit!48388)

(assert (=> b!1430849 (= lt!629929 lt!629928)))

(declare-fun res!965070 () Bool)

(assert (=> b!1430849 (= res!965070 (= (seekEntryOrOpen!0 (select (arr!47042 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11321 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1430849 (=> (not res!965070) (not e!807816))))

(declare-fun b!1430850 () Bool)

(declare-fun call!67448 () Bool)

(assert (=> b!1430850 (= e!807816 call!67448)))

(declare-fun bm!67445 () Bool)

(assert (=> bm!67445 (= call!67448 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430851 () Bool)

(assert (=> b!1430851 (= e!807817 call!67448)))

(assert (= (and d!153761 (not res!965069)) b!1430848))

(assert (= (and b!1430848 c!132385) b!1430849))

(assert (= (and b!1430848 (not c!132385)) b!1430851))

(assert (= (and b!1430849 res!965070) b!1430850))

(assert (= (or b!1430850 b!1430851) bm!67445))

(declare-fun m!1320727 () Bool)

(assert (=> b!1430848 m!1320727))

(assert (=> b!1430848 m!1320727))

(declare-fun m!1320729 () Bool)

(assert (=> b!1430848 m!1320729))

(assert (=> b!1430849 m!1320727))

(declare-fun m!1320731 () Bool)

(assert (=> b!1430849 m!1320731))

(declare-fun m!1320733 () Bool)

(assert (=> b!1430849 m!1320733))

(assert (=> b!1430849 m!1320727))

(declare-fun m!1320735 () Bool)

(assert (=> b!1430849 m!1320735))

(declare-fun m!1320737 () Bool)

(assert (=> bm!67445 m!1320737))

(assert (=> bm!67440 d!153761))

(assert (=> b!1430838 d!153755))

(declare-fun d!153763 () Bool)

(assert (=> d!153763 (arrayContainsKey!0 a!2831 lt!629887 #b00000000000000000000000000000000)))

(declare-fun lt!629933 () Unit!48388)

(declare-fun choose!13 (array!97464 (_ BitVec 64) (_ BitVec 32)) Unit!48388)

(assert (=> d!153763 (= lt!629933 (choose!13 a!2831 lt!629887 j!81))))

(assert (=> d!153763 (bvsge j!81 #b00000000000000000000000000000000)))

(assert (=> d!153763 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629887 j!81) lt!629933)))

(declare-fun bs!41673 () Bool)

(assert (= bs!41673 d!153763))

(assert (=> bs!41673 m!1320645))

(declare-fun m!1320739 () Bool)

(assert (=> bs!41673 m!1320739))

(assert (=> b!1430750 d!153763))

(declare-fun d!153765 () Bool)

(declare-fun res!965075 () Bool)

(declare-fun e!807822 () Bool)

(assert (=> d!153765 (=> res!965075 e!807822)))

(assert (=> d!153765 (= res!965075 (= (select (arr!47042 a!2831) #b00000000000000000000000000000000) lt!629887))))

(assert (=> d!153765 (= (arrayContainsKey!0 a!2831 lt!629887 #b00000000000000000000000000000000) e!807822)))

(declare-fun b!1430856 () Bool)

(declare-fun e!807823 () Bool)

(assert (=> b!1430856 (= e!807822 e!807823)))

(declare-fun res!965076 () Bool)

(assert (=> b!1430856 (=> (not res!965076) (not e!807823))))

(assert (=> b!1430856 (= res!965076 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47592 a!2831)))))

(declare-fun b!1430857 () Bool)

(assert (=> b!1430857 (= e!807823 (arrayContainsKey!0 a!2831 lt!629887 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!153765 (not res!965075)) b!1430856))

(assert (= (and b!1430856 res!965076) b!1430857))

(assert (=> d!153765 m!1320651))

(declare-fun m!1320741 () Bool)

(assert (=> b!1430857 m!1320741))

(assert (=> b!1430750 d!153765))

(assert (=> b!1430750 d!153695))

(assert (=> d!153721 d!153715))

(declare-fun d!153767 () Bool)

(assert (=> d!153767 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(assert (=> d!153767 true))

(declare-fun _$72!146 () Unit!48388)

(assert (=> d!153767 (= (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) _$72!146)))

(declare-fun bs!41674 () Bool)

(assert (= bs!41674 d!153767))

(assert (=> bs!41674 m!1320423))

(assert (=> d!153721 d!153767))

(assert (=> d!153721 d!153733))

(declare-fun d!153769 () Bool)

(declare-fun res!965077 () Bool)

(declare-fun e!807824 () Bool)

(assert (=> d!153769 (=> res!965077 e!807824)))

(assert (=> d!153769 (= res!965077 (bvsge (bvadd j!81 #b00000000000000000000000000000001) (size!47592 a!2831)))))

(assert (=> d!153769 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608) e!807824)))

(declare-fun b!1430858 () Bool)

(declare-fun e!807826 () Bool)

(assert (=> b!1430858 (= e!807824 e!807826)))

(declare-fun c!132386 () Bool)

(assert (=> b!1430858 (= c!132386 (validKeyInArray!0 (select (arr!47042 a!2831) (bvadd j!81 #b00000000000000000000000000000001))))))

(declare-fun b!1430859 () Bool)

(declare-fun e!807825 () Bool)

(assert (=> b!1430859 (= e!807826 e!807825)))

(declare-fun lt!629936 () (_ BitVec 64))

(assert (=> b!1430859 (= lt!629936 (select (arr!47042 a!2831) (bvadd j!81 #b00000000000000000000000000000001)))))

(declare-fun lt!629934 () Unit!48388)

(assert (=> b!1430859 (= lt!629934 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629936 (bvadd j!81 #b00000000000000000000000000000001)))))

(assert (=> b!1430859 (arrayContainsKey!0 a!2831 lt!629936 #b00000000000000000000000000000000)))

(declare-fun lt!629935 () Unit!48388)

(assert (=> b!1430859 (= lt!629935 lt!629934)))

(declare-fun res!965078 () Bool)

(assert (=> b!1430859 (= res!965078 (= (seekEntryOrOpen!0 (select (arr!47042 a!2831) (bvadd j!81 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11321 (bvadd j!81 #b00000000000000000000000000000001))))))

(assert (=> b!1430859 (=> (not res!965078) (not e!807825))))

(declare-fun b!1430860 () Bool)

(declare-fun call!67449 () Bool)

(assert (=> b!1430860 (= e!807825 call!67449)))

(declare-fun bm!67446 () Bool)

(assert (=> bm!67446 (= call!67449 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430861 () Bool)

(assert (=> b!1430861 (= e!807826 call!67449)))

(assert (= (and d!153769 (not res!965077)) b!1430858))

(assert (= (and b!1430858 c!132386) b!1430859))

(assert (= (and b!1430858 (not c!132386)) b!1430861))

(assert (= (and b!1430859 res!965078) b!1430860))

(assert (= (or b!1430860 b!1430861) bm!67446))

(declare-fun m!1320743 () Bool)

(assert (=> b!1430858 m!1320743))

(assert (=> b!1430858 m!1320743))

(declare-fun m!1320745 () Bool)

(assert (=> b!1430858 m!1320745))

(assert (=> b!1430859 m!1320743))

(declare-fun m!1320747 () Bool)

(assert (=> b!1430859 m!1320747))

(declare-fun m!1320749 () Bool)

(assert (=> b!1430859 m!1320749))

(assert (=> b!1430859 m!1320743))

(declare-fun m!1320751 () Bool)

(assert (=> b!1430859 m!1320751))

(declare-fun m!1320753 () Bool)

(assert (=> bm!67446 m!1320753))

(assert (=> bm!67439 d!153769))

(assert (=> d!153731 d!153733))

(assert (=> d!153725 d!153733))

(assert (=> d!153739 d!153733))

(declare-fun b!1430874 () Bool)

(declare-fun e!807834 () SeekEntryResult!11321)

(assert (=> b!1430874 (= e!807834 (MissingVacant!11321 (index!47678 lt!629877)))))

(declare-fun b!1430875 () Bool)

(declare-fun e!807835 () SeekEntryResult!11321)

(assert (=> b!1430875 (= e!807835 Undefined!11321)))

(declare-fun b!1430876 () Bool)

(declare-fun c!132393 () Bool)

(declare-fun lt!629941 () (_ BitVec 64))

(assert (=> b!1430876 (= c!132393 (= lt!629941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807833 () SeekEntryResult!11321)

(assert (=> b!1430876 (= e!807833 e!807834)))

(declare-fun lt!629942 () SeekEntryResult!11321)

(declare-fun d!153771 () Bool)

(assert (=> d!153771 (and (or (is-Undefined!11321 lt!629942) (not (is-Found!11321 lt!629942)) (and (bvsge (index!47677 lt!629942) #b00000000000000000000000000000000) (bvslt (index!47677 lt!629942) (size!47592 a!2831)))) (or (is-Undefined!11321 lt!629942) (is-Found!11321 lt!629942) (not (is-MissingVacant!11321 lt!629942)) (not (= (index!47679 lt!629942) (index!47678 lt!629877))) (and (bvsge (index!47679 lt!629942) #b00000000000000000000000000000000) (bvslt (index!47679 lt!629942) (size!47592 a!2831)))) (or (is-Undefined!11321 lt!629942) (ite (is-Found!11321 lt!629942) (= (select (arr!47042 a!2831) (index!47677 lt!629942)) (select (arr!47042 a!2831) j!81)) (and (is-MissingVacant!11321 lt!629942) (= (index!47679 lt!629942) (index!47678 lt!629877)) (= (select (arr!47042 a!2831) (index!47679 lt!629942)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!153771 (= lt!629942 e!807835)))

(declare-fun c!132395 () Bool)

(assert (=> d!153771 (= c!132395 (bvsge (x!129313 lt!629877) #b01111111111111111111111111111110))))

(assert (=> d!153771 (= lt!629941 (select (arr!47042 a!2831) (index!47678 lt!629877)))))

(assert (=> d!153771 (validMask!0 mask!2608)))

(assert (=> d!153771 (= (seekKeyOrZeroReturnVacant!0 (x!129313 lt!629877) (index!47678 lt!629877) (index!47678 lt!629877) (select (arr!47042 a!2831) j!81) a!2831 mask!2608) lt!629942)))

(declare-fun b!1430877 () Bool)

(assert (=> b!1430877 (= e!807834 (seekKeyOrZeroReturnVacant!0 (bvadd (x!129313 lt!629877) #b00000000000000000000000000000001) (nextIndex!0 (index!47678 lt!629877) (x!129313 lt!629877) mask!2608) (index!47678 lt!629877) (select (arr!47042 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430878 () Bool)

(assert (=> b!1430878 (= e!807833 (Found!11321 (index!47678 lt!629877)))))

(declare-fun b!1430879 () Bool)

(assert (=> b!1430879 (= e!807835 e!807833)))

(declare-fun c!132394 () Bool)

(assert (=> b!1430879 (= c!132394 (= lt!629941 (select (arr!47042 a!2831) j!81)))))

(assert (= (and d!153771 c!132395) b!1430875))

(assert (= (and d!153771 (not c!132395)) b!1430879))

(assert (= (and b!1430879 c!132394) b!1430878))

(assert (= (and b!1430879 (not c!132394)) b!1430876))

(assert (= (and b!1430876 c!132393) b!1430874))

(assert (= (and b!1430876 (not c!132393)) b!1430877))

(declare-fun m!1320755 () Bool)

(assert (=> d!153771 m!1320755))

(declare-fun m!1320757 () Bool)

(assert (=> d!153771 m!1320757))

(assert (=> d!153771 m!1320633))

(assert (=> d!153771 m!1320427))

(declare-fun m!1320759 () Bool)

(assert (=> b!1430877 m!1320759))

(assert (=> b!1430877 m!1320759))

(assert (=> b!1430877 m!1320411))

(declare-fun m!1320761 () Bool)

(assert (=> b!1430877 m!1320761))

(assert (=> b!1430739 d!153771))

(declare-fun b!1430880 () Bool)

(declare-fun lt!629944 () SeekEntryResult!11321)

(assert (=> b!1430880 (and (bvsge (index!47678 lt!629944) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629944) (size!47592 a!2831)))))

(declare-fun res!965079 () Bool)

(assert (=> b!1430880 (= res!965079 (= (select (arr!47042 a!2831) (index!47678 lt!629944)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807839 () Bool)

(assert (=> b!1430880 (=> res!965079 e!807839)))

(declare-fun d!153773 () Bool)

(declare-fun e!807838 () Bool)

(assert (=> d!153773 e!807838))

(declare-fun c!132398 () Bool)

(assert (=> d!153773 (= c!132398 (and (is-Intermediate!11321 lt!629944) (undefined!12133 lt!629944)))))

(declare-fun e!807840 () SeekEntryResult!11321)

(assert (=> d!153773 (= lt!629944 e!807840)))

(declare-fun c!132397 () Bool)

(assert (=> d!153773 (= c!132397 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629943 () (_ BitVec 64))

(assert (=> d!153773 (= lt!629943 (select (arr!47042 a!2831) (nextIndex!0 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608)))))

(assert (=> d!153773 (validMask!0 mask!2608)))

(assert (=> d!153773 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608) lt!629944)))

(declare-fun e!807837 () SeekEntryResult!11321)

(declare-fun b!1430881 () Bool)

(assert (=> b!1430881 (= e!807837 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430882 () Bool)

(declare-fun e!807836 () Bool)

(assert (=> b!1430882 (= e!807838 e!807836)))

(declare-fun res!965080 () Bool)

(assert (=> b!1430882 (= res!965080 (and (is-Intermediate!11321 lt!629944) (not (undefined!12133 lt!629944)) (bvslt (x!129313 lt!629944) #b01111111111111111111111111111110) (bvsge (x!129313 lt!629944) #b00000000000000000000000000000000) (bvsge (x!129313 lt!629944) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1430882 (=> (not res!965080) (not e!807836))))

(declare-fun b!1430883 () Bool)

(assert (=> b!1430883 (= e!807840 e!807837)))

(declare-fun c!132396 () Bool)

(assert (=> b!1430883 (= c!132396 (or (= lt!629943 (select (arr!47042 a!2831) j!81)) (= (bvadd lt!629943 lt!629943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430884 () Bool)

(assert (=> b!1430884 (= e!807837 (Intermediate!11321 false (nextIndex!0 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1430885 () Bool)

(assert (=> b!1430885 (and (bvsge (index!47678 lt!629944) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629944) (size!47592 a!2831)))))

(assert (=> b!1430885 (= e!807839 (= (select (arr!47042 a!2831) (index!47678 lt!629944)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430886 () Bool)

(assert (=> b!1430886 (= e!807840 (Intermediate!11321 true (nextIndex!0 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1430887 () Bool)

(assert (=> b!1430887 (= e!807838 (bvsge (x!129313 lt!629944) #b01111111111111111111111111111110))))

(declare-fun b!1430888 () Bool)

(assert (=> b!1430888 (and (bvsge (index!47678 lt!629944) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629944) (size!47592 a!2831)))))

(declare-fun res!965081 () Bool)

(assert (=> b!1430888 (= res!965081 (= (select (arr!47042 a!2831) (index!47678 lt!629944)) (select (arr!47042 a!2831) j!81)))))

(assert (=> b!1430888 (=> res!965081 e!807839)))

(assert (=> b!1430888 (= e!807836 e!807839)))

(assert (= (and d!153773 c!132397) b!1430886))

(assert (= (and d!153773 (not c!132397)) b!1430883))

(assert (= (and b!1430883 c!132396) b!1430884))

(assert (= (and b!1430883 (not c!132396)) b!1430881))

(assert (= (and d!153773 c!132398) b!1430887))

(assert (= (and d!153773 (not c!132398)) b!1430882))

(assert (= (and b!1430882 res!965080) b!1430888))

(assert (= (and b!1430888 (not res!965081)) b!1430880))

(assert (= (and b!1430880 (not res!965079)) b!1430885))

(declare-fun m!1320763 () Bool)

(assert (=> b!1430885 m!1320763))

(assert (=> b!1430880 m!1320763))

(assert (=> b!1430888 m!1320763))

(assert (=> b!1430881 m!1320571))

(declare-fun m!1320765 () Bool)

(assert (=> b!1430881 m!1320765))

(assert (=> b!1430881 m!1320765))

(assert (=> b!1430881 m!1320411))

(declare-fun m!1320767 () Bool)

(assert (=> b!1430881 m!1320767))

(assert (=> d!153773 m!1320571))

(declare-fun m!1320769 () Bool)

(assert (=> d!153773 m!1320769))

(assert (=> d!153773 m!1320427))

(assert (=> b!1430618 d!153773))

(declare-fun d!153775 () Bool)

(declare-fun lt!629945 () (_ BitVec 32))

(assert (=> d!153775 (and (bvsge lt!629945 #b00000000000000000000000000000000) (bvslt lt!629945 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!153775 (= lt!629945 (choose!52 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608))))

(assert (=> d!153775 (validMask!0 mask!2608)))

(assert (=> d!153775 (= (nextIndex!0 (toIndex!0 (select (arr!47042 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629945)))

(declare-fun bs!41675 () Bool)

(assert (= bs!41675 d!153775))

(assert (=> bs!41675 m!1320431))

(declare-fun m!1320771 () Bool)

(assert (=> bs!41675 m!1320771))

(assert (=> bs!41675 m!1320427))

(assert (=> b!1430618 d!153775))

(declare-fun b!1430889 () Bool)

(declare-fun lt!629947 () SeekEntryResult!11321)

(assert (=> b!1430889 (and (bvsge (index!47678 lt!629947) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629947) (size!47592 a!2831)))))

(declare-fun res!965082 () Bool)

(assert (=> b!1430889 (= res!965082 (= (select (arr!47042 a!2831) (index!47678 lt!629947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807844 () Bool)

(assert (=> b!1430889 (=> res!965082 e!807844)))

(declare-fun d!153777 () Bool)

(declare-fun e!807843 () Bool)

(assert (=> d!153777 e!807843))

(declare-fun c!132401 () Bool)

(assert (=> d!153777 (= c!132401 (and (is-Intermediate!11321 lt!629947) (undefined!12133 lt!629947)))))

(declare-fun e!807845 () SeekEntryResult!11321)

(assert (=> d!153777 (= lt!629947 e!807845)))

(declare-fun c!132400 () Bool)

(assert (=> d!153777 (= c!132400 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629946 () (_ BitVec 64))

(assert (=> d!153777 (= lt!629946 (select (arr!47042 a!2831) (nextIndex!0 index!585 x!605 mask!2608)))))

(assert (=> d!153777 (validMask!0 mask!2608)))

(assert (=> d!153777 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608) lt!629947)))

(declare-fun e!807842 () SeekEntryResult!11321)

(declare-fun b!1430890 () Bool)

(assert (=> b!1430890 (= e!807842 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47042 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430891 () Bool)

(declare-fun e!807841 () Bool)

(assert (=> b!1430891 (= e!807843 e!807841)))

(declare-fun res!965083 () Bool)

(assert (=> b!1430891 (= res!965083 (and (is-Intermediate!11321 lt!629947) (not (undefined!12133 lt!629947)) (bvslt (x!129313 lt!629947) #b01111111111111111111111111111110) (bvsge (x!129313 lt!629947) #b00000000000000000000000000000000) (bvsge (x!129313 lt!629947) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1430891 (=> (not res!965083) (not e!807841))))

(declare-fun b!1430892 () Bool)

(assert (=> b!1430892 (= e!807845 e!807842)))

(declare-fun c!132399 () Bool)

(assert (=> b!1430892 (= c!132399 (or (= lt!629946 (select (arr!47042 a!2831) j!81)) (= (bvadd lt!629946 lt!629946) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430893 () Bool)

(assert (=> b!1430893 (= e!807842 (Intermediate!11321 false (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430894 () Bool)

(assert (=> b!1430894 (and (bvsge (index!47678 lt!629947) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629947) (size!47592 a!2831)))))

(assert (=> b!1430894 (= e!807844 (= (select (arr!47042 a!2831) (index!47678 lt!629947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430895 () Bool)

(assert (=> b!1430895 (= e!807845 (Intermediate!11321 true (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430896 () Bool)

(assert (=> b!1430896 (= e!807843 (bvsge (x!129313 lt!629947) #b01111111111111111111111111111110))))

(declare-fun b!1430897 () Bool)

(assert (=> b!1430897 (and (bvsge (index!47678 lt!629947) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629947) (size!47592 a!2831)))))

(declare-fun res!965084 () Bool)

(assert (=> b!1430897 (= res!965084 (= (select (arr!47042 a!2831) (index!47678 lt!629947)) (select (arr!47042 a!2831) j!81)))))

(assert (=> b!1430897 (=> res!965084 e!807844)))

(assert (=> b!1430897 (= e!807841 e!807844)))

(assert (= (and d!153777 c!132400) b!1430895))

(assert (= (and d!153777 (not c!132400)) b!1430892))

(assert (= (and b!1430892 c!132399) b!1430893))

(assert (= (and b!1430892 (not c!132399)) b!1430890))

(assert (= (and d!153777 c!132401) b!1430896))

(assert (= (and d!153777 (not c!132401)) b!1430891))

(assert (= (and b!1430891 res!965083) b!1430897))

(assert (= (and b!1430897 (not res!965084)) b!1430889))

(assert (= (and b!1430889 (not res!965082)) b!1430894))

(declare-fun m!1320773 () Bool)

(assert (=> b!1430894 m!1320773))

(assert (=> b!1430889 m!1320773))

(assert (=> b!1430897 m!1320773))

(assert (=> b!1430890 m!1320673))

(assert (=> b!1430890 m!1320719))

(assert (=> b!1430890 m!1320719))

(assert (=> b!1430890 m!1320411))

(declare-fun m!1320775 () Bool)

(assert (=> b!1430890 m!1320775))

(assert (=> d!153777 m!1320673))

(declare-fun m!1320777 () Bool)

(assert (=> d!153777 m!1320777))

(assert (=> d!153777 m!1320427))

(assert (=> b!1430767 d!153777))

(assert (=> b!1430767 d!153759))

(assert (=> b!1430753 d!153755))

(declare-fun d!153779 () Bool)

(declare-fun lt!629950 () Bool)

(declare-fun content!772 (List!33552) (Set (_ BitVec 64)))

(assert (=> d!153779 (= lt!629950 (set.member (select (arr!47042 a!2831) #b00000000000000000000000000000000) (content!772 Nil!33549)))))

(declare-fun e!807850 () Bool)

(assert (=> d!153779 (= lt!629950 e!807850)))

(declare-fun res!965090 () Bool)

(assert (=> d!153779 (=> (not res!965090) (not e!807850))))

(assert (=> d!153779 (= res!965090 (is-Cons!33548 Nil!33549))))

(assert (=> d!153779 (= (contains!9863 Nil!33549 (select (arr!47042 a!2831) #b00000000000000000000000000000000)) lt!629950)))

(declare-fun b!1430902 () Bool)

(declare-fun e!807851 () Bool)

(assert (=> b!1430902 (= e!807850 e!807851)))

(declare-fun res!965089 () Bool)

(assert (=> b!1430902 (=> res!965089 e!807851)))

(assert (=> b!1430902 (= res!965089 (= (h!34865 Nil!33549) (select (arr!47042 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430903 () Bool)

(assert (=> b!1430903 (= e!807851 (contains!9863 (t!48246 Nil!33549) (select (arr!47042 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153779 res!965090) b!1430902))

(assert (= (and b!1430902 (not res!965089)) b!1430903))

(declare-fun m!1320779 () Bool)

(assert (=> d!153779 m!1320779))

(assert (=> d!153779 m!1320651))

(declare-fun m!1320781 () Bool)

(assert (=> d!153779 m!1320781))

(assert (=> b!1430903 m!1320651))

(declare-fun m!1320783 () Bool)

(assert (=> b!1430903 m!1320783))

(assert (=> b!1430835 d!153779))

(assert (=> d!153673 d!153733))

(declare-fun b!1430904 () Bool)

(declare-fun lt!629952 () SeekEntryResult!11321)

(assert (=> b!1430904 (and (bvsge (index!47678 lt!629952) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629952) (size!47592 lt!629756)))))

(declare-fun res!965091 () Bool)

(assert (=> b!1430904 (= res!965091 (= (select (arr!47042 lt!629756) (index!47678 lt!629952)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807855 () Bool)

(assert (=> b!1430904 (=> res!965091 e!807855)))

(declare-fun d!153781 () Bool)

(declare-fun e!807854 () Bool)

(assert (=> d!153781 e!807854))

(declare-fun c!132404 () Bool)

(assert (=> d!153781 (= c!132404 (and (is-Intermediate!11321 lt!629952) (undefined!12133 lt!629952)))))

(declare-fun e!807856 () SeekEntryResult!11321)

(assert (=> d!153781 (= lt!629952 e!807856)))

(declare-fun c!132403 () Bool)

(assert (=> d!153781 (= c!132403 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629951 () (_ BitVec 64))

(assert (=> d!153781 (= lt!629951 (select (arr!47042 lt!629756) (nextIndex!0 (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000 mask!2608)))))

(assert (=> d!153781 (validMask!0 mask!2608)))

(assert (=> d!153781 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629760 lt!629756 mask!2608) lt!629952)))

(declare-fun e!807853 () SeekEntryResult!11321)

(declare-fun b!1430905 () Bool)

(assert (=> b!1430905 (= e!807853 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!629760 lt!629756 mask!2608))))

(declare-fun b!1430906 () Bool)

(declare-fun e!807852 () Bool)

(assert (=> b!1430906 (= e!807854 e!807852)))

(declare-fun res!965092 () Bool)

(assert (=> b!1430906 (= res!965092 (and (is-Intermediate!11321 lt!629952) (not (undefined!12133 lt!629952)) (bvslt (x!129313 lt!629952) #b01111111111111111111111111111110) (bvsge (x!129313 lt!629952) #b00000000000000000000000000000000) (bvsge (x!129313 lt!629952) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1430906 (=> (not res!965092) (not e!807852))))

(declare-fun b!1430907 () Bool)

(assert (=> b!1430907 (= e!807856 e!807853)))

(declare-fun c!132402 () Bool)

(assert (=> b!1430907 (= c!132402 (or (= lt!629951 lt!629760) (= (bvadd lt!629951 lt!629951) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430908 () Bool)

(assert (=> b!1430908 (= e!807853 (Intermediate!11321 false (nextIndex!0 (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1430909 () Bool)

(assert (=> b!1430909 (and (bvsge (index!47678 lt!629952) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629952) (size!47592 lt!629756)))))

(assert (=> b!1430909 (= e!807855 (= (select (arr!47042 lt!629756) (index!47678 lt!629952)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430910 () Bool)

(assert (=> b!1430910 (= e!807856 (Intermediate!11321 true (nextIndex!0 (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1430911 () Bool)

(assert (=> b!1430911 (= e!807854 (bvsge (x!129313 lt!629952) #b01111111111111111111111111111110))))

(declare-fun b!1430912 () Bool)

(assert (=> b!1430912 (and (bvsge (index!47678 lt!629952) #b00000000000000000000000000000000) (bvslt (index!47678 lt!629952) (size!47592 lt!629756)))))

(declare-fun res!965093 () Bool)

(assert (=> b!1430912 (= res!965093 (= (select (arr!47042 lt!629756) (index!47678 lt!629952)) lt!629760))))

(assert (=> b!1430912 (=> res!965093 e!807855)))

(assert (=> b!1430912 (= e!807852 e!807855)))

(assert (= (and d!153781 c!132403) b!1430910))

(assert (= (and d!153781 (not c!132403)) b!1430907))

(assert (= (and b!1430907 c!132402) b!1430908))

(assert (= (and b!1430907 (not c!132402)) b!1430905))

(assert (= (and d!153781 c!132404) b!1430911))

(assert (= (and d!153781 (not c!132404)) b!1430906))

(assert (= (and b!1430906 res!965092) b!1430912))

(assert (= (and b!1430912 (not res!965093)) b!1430904))

(assert (= (and b!1430904 (not res!965091)) b!1430909))

(declare-fun m!1320785 () Bool)

(assert (=> b!1430909 m!1320785))

(assert (=> b!1430904 m!1320785))

(assert (=> b!1430912 m!1320785))

(assert (=> b!1430905 m!1320665))

(declare-fun m!1320787 () Bool)

(assert (=> b!1430905 m!1320787))

(assert (=> b!1430905 m!1320787))

(declare-fun m!1320789 () Bool)

(assert (=> b!1430905 m!1320789))

(assert (=> d!153781 m!1320665))

(declare-fun m!1320791 () Bool)

(assert (=> d!153781 m!1320791))

(assert (=> d!153781 m!1320427))

(assert (=> b!1430758 d!153781))

(declare-fun d!153783 () Bool)

(declare-fun lt!629953 () (_ BitVec 32))

(assert (=> d!153783 (and (bvsge lt!629953 #b00000000000000000000000000000000) (bvslt lt!629953 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!153783 (= lt!629953 (choose!52 (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000 mask!2608))))

(assert (=> d!153783 (validMask!0 mask!2608)))

(assert (=> d!153783 (= (nextIndex!0 (toIndex!0 lt!629760 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629953)))

(declare-fun bs!41676 () Bool)

(assert (= bs!41676 d!153783))

(assert (=> bs!41676 m!1320437))

(declare-fun m!1320793 () Bool)

(assert (=> bs!41676 m!1320793))

(assert (=> bs!41676 m!1320427))

(assert (=> b!1430758 d!153783))

(declare-fun d!153785 () Bool)

(assert (=> d!153785 (arrayContainsKey!0 a!2831 lt!629893 #b00000000000000000000000000000000)))

(declare-fun lt!629954 () Unit!48388)

(assert (=> d!153785 (= lt!629954 (choose!13 a!2831 lt!629893 #b00000000000000000000000000000000))))

(assert (=> d!153785 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!153785 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629893 #b00000000000000000000000000000000) lt!629954)))

(declare-fun bs!41677 () Bool)

(assert (= bs!41677 d!153785))

(assert (=> bs!41677 m!1320657))

(declare-fun m!1320795 () Bool)

(assert (=> bs!41677 m!1320795))

(assert (=> b!1430754 d!153785))

(declare-fun d!153787 () Bool)

(declare-fun res!965094 () Bool)

(declare-fun e!807857 () Bool)

(assert (=> d!153787 (=> res!965094 e!807857)))

(assert (=> d!153787 (= res!965094 (= (select (arr!47042 a!2831) #b00000000000000000000000000000000) lt!629893))))

(assert (=> d!153787 (= (arrayContainsKey!0 a!2831 lt!629893 #b00000000000000000000000000000000) e!807857)))

(declare-fun b!1430913 () Bool)

(declare-fun e!807858 () Bool)

(assert (=> b!1430913 (= e!807857 e!807858)))

(declare-fun res!965095 () Bool)

(assert (=> b!1430913 (=> (not res!965095) (not e!807858))))

(assert (=> b!1430913 (= res!965095 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47592 a!2831)))))

(declare-fun b!1430914 () Bool)

(assert (=> b!1430914 (= e!807858 (arrayContainsKey!0 a!2831 lt!629893 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!153787 (not res!965094)) b!1430913))

(assert (= (and b!1430913 res!965095) b!1430914))

(assert (=> d!153787 m!1320651))

(declare-fun m!1320797 () Bool)

(assert (=> b!1430914 m!1320797))

(assert (=> b!1430754 d!153787))

(declare-fun b!1430915 () Bool)

(declare-fun c!132405 () Bool)

(declare-fun lt!629957 () (_ BitVec 64))

(assert (=> b!1430915 (= c!132405 (= lt!629957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807861 () SeekEntryResult!11321)

(declare-fun e!807859 () SeekEntryResult!11321)

(assert (=> b!1430915 (= e!807861 e!807859)))

(declare-fun b!1430916 () Bool)

(declare-fun lt!629956 () SeekEntryResult!11321)

(assert (=> b!1430916 (= e!807861 (Found!11321 (index!47678 lt!629956)))))

(declare-fun b!1430918 () Bool)

(declare-fun e!807860 () SeekEntryResult!11321)

(assert (=> b!1430918 (= e!807860 e!807861)))

(assert (=> b!1430918 (= lt!629957 (select (arr!47042 a!2831) (index!47678 lt!629956)))))

(declare-fun c!132406 () Bool)

(assert (=> b!1430918 (= c!132406 (= lt!629957 (select (arr!47042 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430919 () Bool)

(assert (=> b!1430919 (= e!807859 (seekKeyOrZeroReturnVacant!0 (x!129313 lt!629956) (index!47678 lt!629956) (index!47678 lt!629956) (select (arr!47042 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(declare-fun b!1430920 () Bool)

(assert (=> b!1430920 (= e!807859 (MissingZero!11321 (index!47678 lt!629956)))))

(declare-fun b!1430917 () Bool)

(assert (=> b!1430917 (= e!807860 Undefined!11321)))

(declare-fun d!153789 () Bool)

(declare-fun lt!629955 () SeekEntryResult!11321)

(assert (=> d!153789 (and (or (is-Undefined!11321 lt!629955) (not (is-Found!11321 lt!629955)) (and (bvsge (index!47677 lt!629955) #b00000000000000000000000000000000) (bvslt (index!47677 lt!629955) (size!47592 a!2831)))) (or (is-Undefined!11321 lt!629955) (is-Found!11321 lt!629955) (not (is-MissingZero!11321 lt!629955)) (and (bvsge (index!47676 lt!629955) #b00000000000000000000000000000000) (bvslt (index!47676 lt!629955) (size!47592 a!2831)))) (or (is-Undefined!11321 lt!629955) (is-Found!11321 lt!629955) (is-MissingZero!11321 lt!629955) (not (is-MissingVacant!11321 lt!629955)) (and (bvsge (index!47679 lt!629955) #b00000000000000000000000000000000) (bvslt (index!47679 lt!629955) (size!47592 a!2831)))) (or (is-Undefined!11321 lt!629955) (ite (is-Found!11321 lt!629955) (= (select (arr!47042 a!2831) (index!47677 lt!629955)) (select (arr!47042 a!2831) #b00000000000000000000000000000000)) (ite (is-MissingZero!11321 lt!629955) (= (select (arr!47042 a!2831) (index!47676 lt!629955)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11321 lt!629955) (= (select (arr!47042 a!2831) (index!47679 lt!629955)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153789 (= lt!629955 e!807860)))

(declare-fun c!132407 () Bool)

(assert (=> d!153789 (= c!132407 (and (is-Intermediate!11321 lt!629956) (undefined!12133 lt!629956)))))

(assert (=> d!153789 (= lt!629956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47042 a!2831) #b00000000000000000000000000000000) mask!2608) (select (arr!47042 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(assert (=> d!153789 (validMask!0 mask!2608)))

(assert (=> d!153789 (= (seekEntryOrOpen!0 (select (arr!47042 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) lt!629955)))

(assert (= (and d!153789 c!132407) b!1430917))

(assert (= (and d!153789 (not c!132407)) b!1430918))

(assert (= (and b!1430918 c!132406) b!1430916))

(assert (= (and b!1430918 (not c!132406)) b!1430915))

(assert (= (and b!1430915 c!132405) b!1430920))

(assert (= (and b!1430915 (not c!132405)) b!1430919))

(declare-fun m!1320799 () Bool)

(assert (=> b!1430918 m!1320799))

(assert (=> b!1430919 m!1320651))

(declare-fun m!1320801 () Bool)

(assert (=> b!1430919 m!1320801))

(assert (=> d!153789 m!1320427))

(assert (=> d!153789 m!1320651))

(declare-fun m!1320803 () Bool)

(assert (=> d!153789 m!1320803))

(declare-fun m!1320805 () Bool)

(assert (=> d!153789 m!1320805))

(declare-fun m!1320807 () Bool)

(assert (=> d!153789 m!1320807))

(assert (=> d!153789 m!1320803))

(assert (=> d!153789 m!1320651))

(declare-fun m!1320809 () Bool)

(assert (=> d!153789 m!1320809))

(declare-fun m!1320811 () Bool)

(assert (=> d!153789 m!1320811))

(assert (=> b!1430754 d!153789))

(declare-fun d!153791 () Bool)

(declare-fun res!965098 () Bool)

(declare-fun e!807862 () Bool)

(assert (=> d!153791 (=> res!965098 e!807862)))

(assert (=> d!153791 (= res!965098 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47592 a!2831)))))

(assert (=> d!153791 (= (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132381 (Cons!33548 (select (arr!47042 a!2831) #b00000000000000000000000000000000) Nil!33549) Nil!33549)) e!807862)))

(declare-fun b!1430921 () Bool)

(declare-fun e!807863 () Bool)

(declare-fun call!67450 () Bool)

(assert (=> b!1430921 (= e!807863 call!67450)))

(declare-fun b!1430922 () Bool)

(declare-fun e!807865 () Bool)

(assert (=> b!1430922 (= e!807865 (contains!9863 (ite c!132381 (Cons!33548 (select (arr!47042 a!2831) #b00000000000000000000000000000000) Nil!33549) Nil!33549) (select (arr!47042 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!132408 () Bool)

(declare-fun bm!67447 () Bool)

(assert (=> bm!67447 (= call!67450 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!132408 (Cons!33548 (select (arr!47042 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!132381 (Cons!33548 (select (arr!47042 a!2831) #b00000000000000000000000000000000) Nil!33549) Nil!33549)) (ite c!132381 (Cons!33548 (select (arr!47042 a!2831) #b00000000000000000000000000000000) Nil!33549) Nil!33549))))))

(declare-fun b!1430923 () Bool)

(declare-fun e!807864 () Bool)

(assert (=> b!1430923 (= e!807862 e!807864)))

(declare-fun res!965097 () Bool)

(assert (=> b!1430923 (=> (not res!965097) (not e!807864))))

(assert (=> b!1430923 (= res!965097 (not e!807865))))

(declare-fun res!965096 () Bool)

(assert (=> b!1430923 (=> (not res!965096) (not e!807865))))

(assert (=> b!1430923 (= res!965096 (validKeyInArray!0 (select (arr!47042 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1430924 () Bool)

(assert (=> b!1430924 (= e!807863 call!67450)))

(declare-fun b!1430925 () Bool)

(assert (=> b!1430925 (= e!807864 e!807863)))

(assert (=> b!1430925 (= c!132408 (validKeyInArray!0 (select (arr!47042 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!153791 (not res!965098)) b!1430923))

(assert (= (and b!1430923 res!965096) b!1430922))

(assert (= (and b!1430923 res!965097) b!1430925))

(assert (= (and b!1430925 c!132408) b!1430924))

(assert (= (and b!1430925 (not c!132408)) b!1430921))

(assert (= (or b!1430924 b!1430921) bm!67447))

(assert (=> b!1430922 m!1320727))

(assert (=> b!1430922 m!1320727))

(declare-fun m!1320813 () Bool)

(assert (=> b!1430922 m!1320813))

(assert (=> bm!67447 m!1320727))

(declare-fun m!1320815 () Bool)

(assert (=> bm!67447 m!1320815))

(assert (=> b!1430923 m!1320727))

(assert (=> b!1430923 m!1320727))

(assert (=> b!1430923 m!1320729))

(assert (=> b!1430925 m!1320727))

(assert (=> b!1430925 m!1320727))

(assert (=> b!1430925 m!1320729))

(assert (=> bm!67444 d!153791))

(push 1)

(assert (not d!153779))

(assert (not d!153781))

(assert (not b!1430877))

(assert (not b!1430840))

(assert (not b!1430903))

(assert (not d!153759))

(assert (not d!153767))

(assert (not b!1430914))

(assert (not bm!67445))

(assert (not b!1430919))

(assert (not b!1430859))

(assert (not bm!67446))

(assert (not b!1430858))

(assert (not b!1430923))

(assert (not d!153785))

(assert (not b!1430848))

(assert (not b!1430857))

(assert (not d!153763))

(assert (not b!1430922))

(assert (not b!1430890))

(assert (not d!153789))

(assert (not d!153777))

(assert (not b!1430849))

(assert (not d!153783))

(assert (not bm!67447))

(assert (not d!153771))

(assert (not b!1430881))

(assert (not b!1430905))

(assert (not d!153773))

(assert (not d!153757))

(assert (not b!1430925))

(assert (not d!153775))

(check-sat)

(pop 1)

(push 1)

(check-sat)

