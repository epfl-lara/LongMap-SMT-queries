; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123094 () Bool)

(assert start!123094)

(declare-fun e!806284 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97357 0))(
  ( (array!97358 (arr!46993 (Array (_ BitVec 32) (_ BitVec 64))) (size!47543 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97357)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1427583 () Bool)

(declare-datatypes ((SeekEntryResult!11272 0))(
  ( (MissingZero!11272 (index!47480 (_ BitVec 32))) (Found!11272 (index!47481 (_ BitVec 32))) (Intermediate!11272 (undefined!12084 Bool) (index!47482 (_ BitVec 32)) (x!129110 (_ BitVec 32))) (Undefined!11272) (MissingVacant!11272 (index!47483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97357 (_ BitVec 32)) SeekEntryResult!11272)

(assert (=> b!1427583 (= e!806284 (= (seekEntryOrOpen!0 (select (arr!46993 a!2831) j!81) a!2831 mask!2608) (Found!11272 j!81)))))

(declare-fun b!1427584 () Bool)

(declare-fun res!962616 () Bool)

(declare-fun e!806287 () Bool)

(assert (=> b!1427584 (=> (not res!962616) (not e!806287))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427584 (= res!962616 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47543 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47543 a!2831))))))

(declare-fun b!1427585 () Bool)

(declare-fun res!962625 () Bool)

(assert (=> b!1427585 (=> (not res!962625) (not e!806287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97357 (_ BitVec 32)) Bool)

(assert (=> b!1427585 (= res!962625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427586 () Bool)

(declare-fun res!962622 () Bool)

(declare-fun e!806286 () Bool)

(assert (=> b!1427586 (=> (not res!962622) (not e!806286))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427586 (= res!962622 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427587 () Bool)

(declare-fun res!962620 () Bool)

(assert (=> b!1427587 (=> (not res!962620) (not e!806286))))

(declare-fun lt!628627 () SeekEntryResult!11272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97357 (_ BitVec 32)) SeekEntryResult!11272)

(assert (=> b!1427587 (= res!962620 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46993 a!2831) j!81) a!2831 mask!2608) lt!628627))))

(declare-fun b!1427588 () Bool)

(declare-fun res!962614 () Bool)

(assert (=> b!1427588 (=> (not res!962614) (not e!806287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427588 (= res!962614 (validKeyInArray!0 (select (arr!46993 a!2831) j!81)))))

(declare-fun b!1427589 () Bool)

(assert (=> b!1427589 (= e!806286 (not (or (= (select (arr!46993 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!46993 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1427589 e!806284))

(declare-fun res!962621 () Bool)

(assert (=> b!1427589 (=> (not res!962621) (not e!806284))))

(assert (=> b!1427589 (= res!962621 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48290 0))(
  ( (Unit!48291) )
))
(declare-fun lt!628625 () Unit!48290)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48290)

(assert (=> b!1427589 (= lt!628625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427591 () Bool)

(declare-fun e!806285 () Bool)

(assert (=> b!1427591 (= e!806287 e!806285)))

(declare-fun res!962618 () Bool)

(assert (=> b!1427591 (=> (not res!962618) (not e!806285))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427591 (= res!962618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608) (select (arr!46993 a!2831) j!81) a!2831 mask!2608) lt!628627))))

(assert (=> b!1427591 (= lt!628627 (Intermediate!11272 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427592 () Bool)

(declare-fun res!962617 () Bool)

(assert (=> b!1427592 (=> (not res!962617) (not e!806287))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427592 (= res!962617 (and (= (size!47543 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47543 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47543 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427593 () Bool)

(declare-fun res!962624 () Bool)

(assert (=> b!1427593 (=> (not res!962624) (not e!806286))))

(declare-fun lt!628628 () (_ BitVec 64))

(declare-fun lt!628629 () SeekEntryResult!11272)

(declare-fun lt!628626 () array!97357)

(assert (=> b!1427593 (= res!962624 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628628 lt!628626 mask!2608) lt!628629))))

(declare-fun b!1427594 () Bool)

(assert (=> b!1427594 (= e!806285 e!806286)))

(declare-fun res!962626 () Bool)

(assert (=> b!1427594 (=> (not res!962626) (not e!806286))))

(assert (=> b!1427594 (= res!962626 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628628 mask!2608) lt!628628 lt!628626 mask!2608) lt!628629))))

(assert (=> b!1427594 (= lt!628629 (Intermediate!11272 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427594 (= lt!628628 (select (store (arr!46993 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427594 (= lt!628626 (array!97358 (store (arr!46993 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47543 a!2831)))))

(declare-fun b!1427595 () Bool)

(declare-fun res!962623 () Bool)

(assert (=> b!1427595 (=> (not res!962623) (not e!806287))))

(assert (=> b!1427595 (= res!962623 (validKeyInArray!0 (select (arr!46993 a!2831) i!982)))))

(declare-fun res!962615 () Bool)

(assert (=> start!123094 (=> (not res!962615) (not e!806287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123094 (= res!962615 (validMask!0 mask!2608))))

(assert (=> start!123094 e!806287))

(assert (=> start!123094 true))

(declare-fun array_inv!36021 (array!97357) Bool)

(assert (=> start!123094 (array_inv!36021 a!2831)))

(declare-fun b!1427590 () Bool)

(declare-fun res!962619 () Bool)

(assert (=> b!1427590 (=> (not res!962619) (not e!806287))))

(declare-datatypes ((List!33503 0))(
  ( (Nil!33500) (Cons!33499 (h!34807 (_ BitVec 64)) (t!48197 List!33503)) )
))
(declare-fun arrayNoDuplicates!0 (array!97357 (_ BitVec 32) List!33503) Bool)

(assert (=> b!1427590 (= res!962619 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33500))))

(assert (= (and start!123094 res!962615) b!1427592))

(assert (= (and b!1427592 res!962617) b!1427595))

(assert (= (and b!1427595 res!962623) b!1427588))

(assert (= (and b!1427588 res!962614) b!1427585))

(assert (= (and b!1427585 res!962625) b!1427590))

(assert (= (and b!1427590 res!962619) b!1427584))

(assert (= (and b!1427584 res!962616) b!1427591))

(assert (= (and b!1427591 res!962618) b!1427594))

(assert (= (and b!1427594 res!962626) b!1427587))

(assert (= (and b!1427587 res!962620) b!1427593))

(assert (= (and b!1427593 res!962624) b!1427586))

(assert (= (and b!1427586 res!962622) b!1427589))

(assert (= (and b!1427589 res!962621) b!1427583))

(declare-fun m!1317953 () Bool)

(assert (=> b!1427589 m!1317953))

(declare-fun m!1317955 () Bool)

(assert (=> b!1427589 m!1317955))

(declare-fun m!1317957 () Bool)

(assert (=> b!1427589 m!1317957))

(declare-fun m!1317959 () Bool)

(assert (=> b!1427594 m!1317959))

(assert (=> b!1427594 m!1317959))

(declare-fun m!1317961 () Bool)

(assert (=> b!1427594 m!1317961))

(declare-fun m!1317963 () Bool)

(assert (=> b!1427594 m!1317963))

(declare-fun m!1317965 () Bool)

(assert (=> b!1427594 m!1317965))

(declare-fun m!1317967 () Bool)

(assert (=> b!1427591 m!1317967))

(assert (=> b!1427591 m!1317967))

(declare-fun m!1317969 () Bool)

(assert (=> b!1427591 m!1317969))

(assert (=> b!1427591 m!1317969))

(assert (=> b!1427591 m!1317967))

(declare-fun m!1317971 () Bool)

(assert (=> b!1427591 m!1317971))

(declare-fun m!1317973 () Bool)

(assert (=> b!1427590 m!1317973))

(assert (=> b!1427587 m!1317967))

(assert (=> b!1427587 m!1317967))

(declare-fun m!1317975 () Bool)

(assert (=> b!1427587 m!1317975))

(declare-fun m!1317977 () Bool)

(assert (=> b!1427595 m!1317977))

(assert (=> b!1427595 m!1317977))

(declare-fun m!1317979 () Bool)

(assert (=> b!1427595 m!1317979))

(declare-fun m!1317981 () Bool)

(assert (=> b!1427585 m!1317981))

(declare-fun m!1317983 () Bool)

(assert (=> start!123094 m!1317983))

(declare-fun m!1317985 () Bool)

(assert (=> start!123094 m!1317985))

(declare-fun m!1317987 () Bool)

(assert (=> b!1427593 m!1317987))

(assert (=> b!1427583 m!1317967))

(assert (=> b!1427583 m!1317967))

(declare-fun m!1317989 () Bool)

(assert (=> b!1427583 m!1317989))

(assert (=> b!1427588 m!1317967))

(assert (=> b!1427588 m!1317967))

(declare-fun m!1317991 () Bool)

(assert (=> b!1427588 m!1317991))

(push 1)

(assert (not b!1427587))

(assert (not b!1427583))

(assert (not b!1427591))

(assert (not b!1427589))

(assert (not b!1427595))

(assert (not b!1427593))

(assert (not b!1427594))

(assert (not b!1427588))

(assert (not start!123094))

(assert (not b!1427585))

(assert (not b!1427590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1427684 () Bool)

(declare-fun e!806342 () Bool)

(declare-fun e!806343 () Bool)

(assert (=> b!1427684 (= e!806342 e!806343)))

(declare-fun res!962661 () Bool)

(declare-fun lt!628667 () SeekEntryResult!11272)

(assert (=> b!1427684 (= res!962661 (and (is-Intermediate!11272 lt!628667) (not (undefined!12084 lt!628667)) (bvslt (x!129110 lt!628667) #b01111111111111111111111111111110) (bvsge (x!129110 lt!628667) #b00000000000000000000000000000000) (bvsge (x!129110 lt!628667) #b00000000000000000000000000000000)))))

(assert (=> b!1427684 (=> (not res!962661) (not e!806343))))

(declare-fun b!1427685 () Bool)

(assert (=> b!1427685 (and (bvsge (index!47482 lt!628667) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628667) (size!47543 a!2831)))))

(declare-fun res!962660 () Bool)

(assert (=> b!1427685 (= res!962660 (= (select (arr!46993 a!2831) (index!47482 lt!628667)) (select (arr!46993 a!2831) j!81)))))

(declare-fun e!806345 () Bool)

(assert (=> b!1427685 (=> res!962660 e!806345)))

(assert (=> b!1427685 (= e!806343 e!806345)))

(declare-fun b!1427686 () Bool)

(declare-fun e!806344 () SeekEntryResult!11272)

(assert (=> b!1427686 (= e!806344 (Intermediate!11272 false (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427687 () Bool)

(assert (=> b!1427687 (and (bvsge (index!47482 lt!628667) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628667) (size!47543 a!2831)))))

(assert (=> b!1427687 (= e!806345 (= (select (arr!46993 a!2831) (index!47482 lt!628667)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427688 () Bool)

(assert (=> b!1427688 (and (bvsge (index!47482 lt!628667) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628667) (size!47543 a!2831)))))

(declare-fun res!962662 () Bool)

(assert (=> b!1427688 (= res!962662 (= (select (arr!46993 a!2831) (index!47482 lt!628667)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427688 (=> res!962662 e!806345)))

(declare-fun b!1427690 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427690 (= e!806344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46993 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427691 () Bool)

(declare-fun e!806341 () SeekEntryResult!11272)

(assert (=> b!1427691 (= e!806341 (Intermediate!11272 true (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427692 () Bool)

(assert (=> b!1427692 (= e!806341 e!806344)))

(declare-fun c!132003 () Bool)

(declare-fun lt!628668 () (_ BitVec 64))

(assert (=> b!1427692 (= c!132003 (or (= lt!628668 (select (arr!46993 a!2831) j!81)) (= (bvadd lt!628668 lt!628668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427689 () Bool)

(assert (=> b!1427689 (= e!806342 (bvsge (x!129110 lt!628667) #b01111111111111111111111111111110))))

(declare-fun d!153369 () Bool)

(assert (=> d!153369 e!806342))

(declare-fun c!132002 () Bool)

(assert (=> d!153369 (= c!132002 (and (is-Intermediate!11272 lt!628667) (undefined!12084 lt!628667)))))

(assert (=> d!153369 (= lt!628667 e!806341)))

(declare-fun c!132004 () Bool)

(assert (=> d!153369 (= c!132004 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153369 (= lt!628668 (select (arr!46993 a!2831) (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608)))))

(assert (=> d!153369 (validMask!0 mask!2608)))

(assert (=> d!153369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608) (select (arr!46993 a!2831) j!81) a!2831 mask!2608) lt!628667)))

(assert (= (and d!153369 c!132004) b!1427691))

(assert (= (and d!153369 (not c!132004)) b!1427692))

(assert (= (and b!1427692 c!132003) b!1427686))

(assert (= (and b!1427692 (not c!132003)) b!1427690))

(assert (= (and d!153369 c!132002) b!1427689))

(assert (= (and d!153369 (not c!132002)) b!1427684))

(assert (= (and b!1427684 res!962661) b!1427685))

(assert (= (and b!1427685 (not res!962660)) b!1427688))

(assert (= (and b!1427688 (not res!962662)) b!1427687))

(assert (=> d!153369 m!1317969))

(declare-fun m!1318027 () Bool)

(assert (=> d!153369 m!1318027))

(assert (=> d!153369 m!1317983))

(declare-fun m!1318029 () Bool)

(assert (=> b!1427688 m!1318029))

(assert (=> b!1427685 m!1318029))

(assert (=> b!1427690 m!1317969))

(declare-fun m!1318031 () Bool)

(assert (=> b!1427690 m!1318031))

(assert (=> b!1427690 m!1318031))

(assert (=> b!1427690 m!1317967))

(declare-fun m!1318033 () Bool)

(assert (=> b!1427690 m!1318033))

(assert (=> b!1427687 m!1318029))

(assert (=> b!1427591 d!153369))

(declare-fun d!153383 () Bool)

(declare-fun lt!628676 () (_ BitVec 32))

(declare-fun lt!628675 () (_ BitVec 32))

(assert (=> d!153383 (= lt!628676 (bvmul (bvxor lt!628675 (bvlshr lt!628675 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153383 (= lt!628675 ((_ extract 31 0) (bvand (bvxor (select (arr!46993 a!2831) j!81) (bvlshr (select (arr!46993 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153383 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962664 (let ((h!34809 ((_ extract 31 0) (bvand (bvxor (select (arr!46993 a!2831) j!81) (bvlshr (select (arr!46993 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129115 (bvmul (bvxor h!34809 (bvlshr h!34809 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129115 (bvlshr x!129115 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962664 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962664 #b00000000000000000000000000000000))))))

(assert (=> d!153383 (= (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608) (bvand (bvxor lt!628676 (bvlshr lt!628676 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427591 d!153383))

(declare-fun b!1427702 () Bool)

(declare-fun e!806352 () Bool)

(declare-fun e!806353 () Bool)

(assert (=> b!1427702 (= e!806352 e!806353)))

(declare-fun res!962669 () Bool)

(declare-fun lt!628677 () SeekEntryResult!11272)

(assert (=> b!1427702 (= res!962669 (and (is-Intermediate!11272 lt!628677) (not (undefined!12084 lt!628677)) (bvslt (x!129110 lt!628677) #b01111111111111111111111111111110) (bvsge (x!129110 lt!628677) #b00000000000000000000000000000000) (bvsge (x!129110 lt!628677) x!605)))))

(assert (=> b!1427702 (=> (not res!962669) (not e!806353))))

(declare-fun b!1427703 () Bool)

(assert (=> b!1427703 (and (bvsge (index!47482 lt!628677) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628677) (size!47543 lt!628626)))))

(declare-fun res!962668 () Bool)

(assert (=> b!1427703 (= res!962668 (= (select (arr!46993 lt!628626) (index!47482 lt!628677)) lt!628628))))

(declare-fun e!806355 () Bool)

(assert (=> b!1427703 (=> res!962668 e!806355)))

(assert (=> b!1427703 (= e!806353 e!806355)))

(declare-fun b!1427704 () Bool)

(declare-fun e!806354 () SeekEntryResult!11272)

(assert (=> b!1427704 (= e!806354 (Intermediate!11272 false index!585 x!605))))

(declare-fun b!1427705 () Bool)

(assert (=> b!1427705 (and (bvsge (index!47482 lt!628677) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628677) (size!47543 lt!628626)))))

(assert (=> b!1427705 (= e!806355 (= (select (arr!46993 lt!628626) (index!47482 lt!628677)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427706 () Bool)

(assert (=> b!1427706 (and (bvsge (index!47482 lt!628677) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628677) (size!47543 lt!628626)))))

(declare-fun res!962670 () Bool)

(assert (=> b!1427706 (= res!962670 (= (select (arr!46993 lt!628626) (index!47482 lt!628677)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427706 (=> res!962670 e!806355)))

(declare-fun b!1427708 () Bool)

(assert (=> b!1427708 (= e!806354 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628628 lt!628626 mask!2608))))

(declare-fun b!1427709 () Bool)

(declare-fun e!806351 () SeekEntryResult!11272)

(assert (=> b!1427709 (= e!806351 (Intermediate!11272 true index!585 x!605))))

(declare-fun b!1427710 () Bool)

(assert (=> b!1427710 (= e!806351 e!806354)))

(declare-fun c!132009 () Bool)

(declare-fun lt!628678 () (_ BitVec 64))

(assert (=> b!1427710 (= c!132009 (or (= lt!628678 lt!628628) (= (bvadd lt!628678 lt!628678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427707 () Bool)

(assert (=> b!1427707 (= e!806352 (bvsge (x!129110 lt!628677) #b01111111111111111111111111111110))))

(declare-fun d!153387 () Bool)

(assert (=> d!153387 e!806352))

(declare-fun c!132008 () Bool)

(assert (=> d!153387 (= c!132008 (and (is-Intermediate!11272 lt!628677) (undefined!12084 lt!628677)))))

(assert (=> d!153387 (= lt!628677 e!806351)))

(declare-fun c!132010 () Bool)

(assert (=> d!153387 (= c!132010 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153387 (= lt!628678 (select (arr!46993 lt!628626) index!585))))

(assert (=> d!153387 (validMask!0 mask!2608)))

(assert (=> d!153387 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628628 lt!628626 mask!2608) lt!628677)))

(assert (= (and d!153387 c!132010) b!1427709))

(assert (= (and d!153387 (not c!132010)) b!1427710))

(assert (= (and b!1427710 c!132009) b!1427704))

(assert (= (and b!1427710 (not c!132009)) b!1427708))

(assert (= (and d!153387 c!132008) b!1427707))

(assert (= (and d!153387 (not c!132008)) b!1427702))

(assert (= (and b!1427702 res!962669) b!1427703))

(assert (= (and b!1427703 (not res!962668)) b!1427706))

(assert (= (and b!1427706 (not res!962670)) b!1427705))

(declare-fun m!1318043 () Bool)

(assert (=> d!153387 m!1318043))

(assert (=> d!153387 m!1317983))

(declare-fun m!1318045 () Bool)

(assert (=> b!1427706 m!1318045))

(assert (=> b!1427703 m!1318045))

(declare-fun m!1318047 () Bool)

(assert (=> b!1427708 m!1318047))

(assert (=> b!1427708 m!1318047))

(declare-fun m!1318049 () Bool)

(assert (=> b!1427708 m!1318049))

(assert (=> b!1427705 m!1318045))

(assert (=> b!1427593 d!153387))

(declare-fun d!153389 () Bool)

(assert (=> d!153389 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123094 d!153389))

(declare-fun d!153397 () Bool)

(assert (=> d!153397 (= (array_inv!36021 a!2831) (bvsge (size!47543 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123094 d!153397))

(declare-fun b!1427817 () Bool)

(declare-fun c!132048 () Bool)

(declare-fun lt!628730 () (_ BitVec 64))

(assert (=> b!1427817 (= c!132048 (= lt!628730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806422 () SeekEntryResult!11272)

(declare-fun e!806420 () SeekEntryResult!11272)

(assert (=> b!1427817 (= e!806422 e!806420)))

(declare-fun b!1427818 () Bool)

(declare-fun lt!628731 () SeekEntryResult!11272)

(assert (=> b!1427818 (= e!806420 (MissingZero!11272 (index!47482 lt!628731)))))

(declare-fun b!1427819 () Bool)

(declare-fun e!806421 () SeekEntryResult!11272)

(assert (=> b!1427819 (= e!806421 e!806422)))

(assert (=> b!1427819 (= lt!628730 (select (arr!46993 a!2831) (index!47482 lt!628731)))))

(declare-fun c!132050 () Bool)

(assert (=> b!1427819 (= c!132050 (= lt!628730 (select (arr!46993 a!2831) j!81)))))

(declare-fun b!1427820 () Bool)

(assert (=> b!1427820 (= e!806421 Undefined!11272)))

(declare-fun b!1427821 () Bool)

(assert (=> b!1427821 (= e!806422 (Found!11272 (index!47482 lt!628731)))))

(declare-fun d!153401 () Bool)

(declare-fun lt!628729 () SeekEntryResult!11272)

(assert (=> d!153401 (and (or (is-Undefined!11272 lt!628729) (not (is-Found!11272 lt!628729)) (and (bvsge (index!47481 lt!628729) #b00000000000000000000000000000000) (bvslt (index!47481 lt!628729) (size!47543 a!2831)))) (or (is-Undefined!11272 lt!628729) (is-Found!11272 lt!628729) (not (is-MissingZero!11272 lt!628729)) (and (bvsge (index!47480 lt!628729) #b00000000000000000000000000000000) (bvslt (index!47480 lt!628729) (size!47543 a!2831)))) (or (is-Undefined!11272 lt!628729) (is-Found!11272 lt!628729) (is-MissingZero!11272 lt!628729) (not (is-MissingVacant!11272 lt!628729)) (and (bvsge (index!47483 lt!628729) #b00000000000000000000000000000000) (bvslt (index!47483 lt!628729) (size!47543 a!2831)))) (or (is-Undefined!11272 lt!628729) (ite (is-Found!11272 lt!628729) (= (select (arr!46993 a!2831) (index!47481 lt!628729)) (select (arr!46993 a!2831) j!81)) (ite (is-MissingZero!11272 lt!628729) (= (select (arr!46993 a!2831) (index!47480 lt!628729)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11272 lt!628729) (= (select (arr!46993 a!2831) (index!47483 lt!628729)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153401 (= lt!628729 e!806421)))

(declare-fun c!132049 () Bool)

(assert (=> d!153401 (= c!132049 (and (is-Intermediate!11272 lt!628731) (undefined!12084 lt!628731)))))

(assert (=> d!153401 (= lt!628731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608) (select (arr!46993 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153401 (validMask!0 mask!2608)))

(assert (=> d!153401 (= (seekEntryOrOpen!0 (select (arr!46993 a!2831) j!81) a!2831 mask!2608) lt!628729)))

(declare-fun b!1427822 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97357 (_ BitVec 32)) SeekEntryResult!11272)

(assert (=> b!1427822 (= e!806420 (seekKeyOrZeroReturnVacant!0 (x!129110 lt!628731) (index!47482 lt!628731) (index!47482 lt!628731) (select (arr!46993 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!153401 c!132049) b!1427820))

(assert (= (and d!153401 (not c!132049)) b!1427819))

(assert (= (and b!1427819 c!132050) b!1427821))

(assert (= (and b!1427819 (not c!132050)) b!1427817))

(assert (= (and b!1427817 c!132048) b!1427818))

(assert (= (and b!1427817 (not c!132048)) b!1427822))

(declare-fun m!1318119 () Bool)

(assert (=> b!1427819 m!1318119))

(declare-fun m!1318121 () Bool)

(assert (=> d!153401 m!1318121))

(declare-fun m!1318123 () Bool)

(assert (=> d!153401 m!1318123))

(declare-fun m!1318125 () Bool)

(assert (=> d!153401 m!1318125))

(assert (=> d!153401 m!1317969))

(assert (=> d!153401 m!1317967))

(assert (=> d!153401 m!1317971))

(assert (=> d!153401 m!1317983))

(assert (=> d!153401 m!1317967))

(assert (=> d!153401 m!1317969))

(assert (=> b!1427822 m!1317967))

(declare-fun m!1318127 () Bool)

(assert (=> b!1427822 m!1318127))

(assert (=> b!1427583 d!153401))

(declare-fun b!1427823 () Bool)

(declare-fun e!806424 () Bool)

(declare-fun e!806425 () Bool)

(assert (=> b!1427823 (= e!806424 e!806425)))

(declare-fun res!962704 () Bool)

(declare-fun lt!628732 () SeekEntryResult!11272)

(assert (=> b!1427823 (= res!962704 (and (is-Intermediate!11272 lt!628732) (not (undefined!12084 lt!628732)) (bvslt (x!129110 lt!628732) #b01111111111111111111111111111110) (bvsge (x!129110 lt!628732) #b00000000000000000000000000000000) (bvsge (x!129110 lt!628732) #b00000000000000000000000000000000)))))

(assert (=> b!1427823 (=> (not res!962704) (not e!806425))))

(declare-fun b!1427824 () Bool)

(assert (=> b!1427824 (and (bvsge (index!47482 lt!628732) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628732) (size!47543 lt!628626)))))

(declare-fun res!962703 () Bool)

(assert (=> b!1427824 (= res!962703 (= (select (arr!46993 lt!628626) (index!47482 lt!628732)) lt!628628))))

(declare-fun e!806427 () Bool)

(assert (=> b!1427824 (=> res!962703 e!806427)))

(assert (=> b!1427824 (= e!806425 e!806427)))

(declare-fun b!1427825 () Bool)

(declare-fun e!806426 () SeekEntryResult!11272)

(assert (=> b!1427825 (= e!806426 (Intermediate!11272 false (toIndex!0 lt!628628 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427826 () Bool)

(assert (=> b!1427826 (and (bvsge (index!47482 lt!628732) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628732) (size!47543 lt!628626)))))

(assert (=> b!1427826 (= e!806427 (= (select (arr!46993 lt!628626) (index!47482 lt!628732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427827 () Bool)

(assert (=> b!1427827 (and (bvsge (index!47482 lt!628732) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628732) (size!47543 lt!628626)))))

(declare-fun res!962705 () Bool)

(assert (=> b!1427827 (= res!962705 (= (select (arr!46993 lt!628626) (index!47482 lt!628732)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427827 (=> res!962705 e!806427)))

(declare-fun b!1427829 () Bool)

(assert (=> b!1427829 (= e!806426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628628 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628628 lt!628626 mask!2608))))

(declare-fun b!1427830 () Bool)

(declare-fun e!806423 () SeekEntryResult!11272)

(assert (=> b!1427830 (= e!806423 (Intermediate!11272 true (toIndex!0 lt!628628 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427831 () Bool)

(assert (=> b!1427831 (= e!806423 e!806426)))

(declare-fun c!132052 () Bool)

(declare-fun lt!628733 () (_ BitVec 64))

(assert (=> b!1427831 (= c!132052 (or (= lt!628733 lt!628628) (= (bvadd lt!628733 lt!628733) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427828 () Bool)

(assert (=> b!1427828 (= e!806424 (bvsge (x!129110 lt!628732) #b01111111111111111111111111111110))))

(declare-fun d!153431 () Bool)

(assert (=> d!153431 e!806424))

(declare-fun c!132051 () Bool)

(assert (=> d!153431 (= c!132051 (and (is-Intermediate!11272 lt!628732) (undefined!12084 lt!628732)))))

(assert (=> d!153431 (= lt!628732 e!806423)))

(declare-fun c!132053 () Bool)

(assert (=> d!153431 (= c!132053 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153431 (= lt!628733 (select (arr!46993 lt!628626) (toIndex!0 lt!628628 mask!2608)))))

(assert (=> d!153431 (validMask!0 mask!2608)))

(assert (=> d!153431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628628 mask!2608) lt!628628 lt!628626 mask!2608) lt!628732)))

(assert (= (and d!153431 c!132053) b!1427830))

(assert (= (and d!153431 (not c!132053)) b!1427831))

(assert (= (and b!1427831 c!132052) b!1427825))

(assert (= (and b!1427831 (not c!132052)) b!1427829))

(assert (= (and d!153431 c!132051) b!1427828))

(assert (= (and d!153431 (not c!132051)) b!1427823))

(assert (= (and b!1427823 res!962704) b!1427824))

(assert (= (and b!1427824 (not res!962703)) b!1427827))

(assert (= (and b!1427827 (not res!962705)) b!1427826))

(assert (=> d!153431 m!1317959))

(declare-fun m!1318129 () Bool)

(assert (=> d!153431 m!1318129))

(assert (=> d!153431 m!1317983))

(declare-fun m!1318131 () Bool)

(assert (=> b!1427827 m!1318131))

(assert (=> b!1427824 m!1318131))

(assert (=> b!1427829 m!1317959))

(declare-fun m!1318133 () Bool)

(assert (=> b!1427829 m!1318133))

(assert (=> b!1427829 m!1318133))

(declare-fun m!1318135 () Bool)

(assert (=> b!1427829 m!1318135))

(assert (=> b!1427826 m!1318131))

(assert (=> b!1427594 d!153431))

(declare-fun d!153433 () Bool)

(declare-fun lt!628735 () (_ BitVec 32))

(declare-fun lt!628734 () (_ BitVec 32))

(assert (=> d!153433 (= lt!628735 (bvmul (bvxor lt!628734 (bvlshr lt!628734 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153433 (= lt!628734 ((_ extract 31 0) (bvand (bvxor lt!628628 (bvlshr lt!628628 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153433 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962664 (let ((h!34809 ((_ extract 31 0) (bvand (bvxor lt!628628 (bvlshr lt!628628 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129115 (bvmul (bvxor h!34809 (bvlshr h!34809 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129115 (bvlshr x!129115 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962664 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962664 #b00000000000000000000000000000000))))))

(assert (=> d!153433 (= (toIndex!0 lt!628628 mask!2608) (bvand (bvxor lt!628735 (bvlshr lt!628735 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427594 d!153433))

(declare-fun d!153435 () Bool)

(assert (=> d!153435 (= (validKeyInArray!0 (select (arr!46993 a!2831) i!982)) (and (not (= (select (arr!46993 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46993 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427595 d!153435))

(declare-fun d!153437 () Bool)

(declare-fun res!962710 () Bool)

(declare-fun e!806434 () Bool)

(assert (=> d!153437 (=> res!962710 e!806434)))

(assert (=> d!153437 (= res!962710 (bvsge #b00000000000000000000000000000000 (size!47543 a!2831)))))

(assert (=> d!153437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806434)))

(declare-fun b!1427840 () Bool)

(declare-fun e!806435 () Bool)

(declare-fun e!806436 () Bool)

(assert (=> b!1427840 (= e!806435 e!806436)))

(declare-fun lt!628742 () (_ BitVec 64))

(assert (=> b!1427840 (= lt!628742 (select (arr!46993 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628744 () Unit!48290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97357 (_ BitVec 64) (_ BitVec 32)) Unit!48290)

(assert (=> b!1427840 (= lt!628744 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628742 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1427840 (arrayContainsKey!0 a!2831 lt!628742 #b00000000000000000000000000000000)))

(declare-fun lt!628743 () Unit!48290)

(assert (=> b!1427840 (= lt!628743 lt!628744)))

(declare-fun res!962711 () Bool)

(assert (=> b!1427840 (= res!962711 (= (seekEntryOrOpen!0 (select (arr!46993 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11272 #b00000000000000000000000000000000)))))

(assert (=> b!1427840 (=> (not res!962711) (not e!806436))))

(declare-fun b!1427841 () Bool)

(declare-fun call!67377 () Bool)

(assert (=> b!1427841 (= e!806436 call!67377)))

(declare-fun bm!67374 () Bool)

(assert (=> bm!67374 (= call!67377 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427842 () Bool)

(assert (=> b!1427842 (= e!806434 e!806435)))

(declare-fun c!132056 () Bool)

(assert (=> b!1427842 (= c!132056 (validKeyInArray!0 (select (arr!46993 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427843 () Bool)

(assert (=> b!1427843 (= e!806435 call!67377)))

(assert (= (and d!153437 (not res!962710)) b!1427842))

(assert (= (and b!1427842 c!132056) b!1427840))

(assert (= (and b!1427842 (not c!132056)) b!1427843))

(assert (= (and b!1427840 res!962711) b!1427841))

(assert (= (or b!1427841 b!1427843) bm!67374))

(declare-fun m!1318137 () Bool)

(assert (=> b!1427840 m!1318137))

(declare-fun m!1318139 () Bool)

(assert (=> b!1427840 m!1318139))

(declare-fun m!1318141 () Bool)

(assert (=> b!1427840 m!1318141))

(assert (=> b!1427840 m!1318137))

(declare-fun m!1318143 () Bool)

(assert (=> b!1427840 m!1318143))

(declare-fun m!1318145 () Bool)

(assert (=> bm!67374 m!1318145))

(assert (=> b!1427842 m!1318137))

(assert (=> b!1427842 m!1318137))

(declare-fun m!1318147 () Bool)

(assert (=> b!1427842 m!1318147))

(assert (=> b!1427585 d!153437))

(declare-fun b!1427844 () Bool)

(declare-fun e!806438 () Bool)

(declare-fun e!806439 () Bool)

(assert (=> b!1427844 (= e!806438 e!806439)))

(declare-fun res!962713 () Bool)

(declare-fun lt!628745 () SeekEntryResult!11272)

(assert (=> b!1427844 (= res!962713 (and (is-Intermediate!11272 lt!628745) (not (undefined!12084 lt!628745)) (bvslt (x!129110 lt!628745) #b01111111111111111111111111111110) (bvsge (x!129110 lt!628745) #b00000000000000000000000000000000) (bvsge (x!129110 lt!628745) x!605)))))

(assert (=> b!1427844 (=> (not res!962713) (not e!806439))))

(declare-fun b!1427845 () Bool)

(assert (=> b!1427845 (and (bvsge (index!47482 lt!628745) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628745) (size!47543 a!2831)))))

(declare-fun res!962712 () Bool)

(assert (=> b!1427845 (= res!962712 (= (select (arr!46993 a!2831) (index!47482 lt!628745)) (select (arr!46993 a!2831) j!81)))))

(declare-fun e!806441 () Bool)

(assert (=> b!1427845 (=> res!962712 e!806441)))

(assert (=> b!1427845 (= e!806439 e!806441)))

(declare-fun b!1427846 () Bool)

(declare-fun e!806440 () SeekEntryResult!11272)

(assert (=> b!1427846 (= e!806440 (Intermediate!11272 false index!585 x!605))))

(declare-fun b!1427847 () Bool)

(assert (=> b!1427847 (and (bvsge (index!47482 lt!628745) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628745) (size!47543 a!2831)))))

(assert (=> b!1427847 (= e!806441 (= (select (arr!46993 a!2831) (index!47482 lt!628745)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427848 () Bool)

(assert (=> b!1427848 (and (bvsge (index!47482 lt!628745) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628745) (size!47543 a!2831)))))

(declare-fun res!962714 () Bool)

(assert (=> b!1427848 (= res!962714 (= (select (arr!46993 a!2831) (index!47482 lt!628745)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427848 (=> res!962714 e!806441)))

(declare-fun b!1427850 () Bool)

(assert (=> b!1427850 (= e!806440 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46993 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427851 () Bool)

(declare-fun e!806437 () SeekEntryResult!11272)

(assert (=> b!1427851 (= e!806437 (Intermediate!11272 true index!585 x!605))))

(declare-fun b!1427852 () Bool)

(assert (=> b!1427852 (= e!806437 e!806440)))

(declare-fun c!132058 () Bool)

(declare-fun lt!628746 () (_ BitVec 64))

(assert (=> b!1427852 (= c!132058 (or (= lt!628746 (select (arr!46993 a!2831) j!81)) (= (bvadd lt!628746 lt!628746) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427849 () Bool)

(assert (=> b!1427849 (= e!806438 (bvsge (x!129110 lt!628745) #b01111111111111111111111111111110))))

(declare-fun d!153439 () Bool)

(assert (=> d!153439 e!806438))

(declare-fun c!132057 () Bool)

(assert (=> d!153439 (= c!132057 (and (is-Intermediate!11272 lt!628745) (undefined!12084 lt!628745)))))

(assert (=> d!153439 (= lt!628745 e!806437)))

(declare-fun c!132059 () Bool)

(assert (=> d!153439 (= c!132059 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153439 (= lt!628746 (select (arr!46993 a!2831) index!585))))

(assert (=> d!153439 (validMask!0 mask!2608)))

(assert (=> d!153439 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46993 a!2831) j!81) a!2831 mask!2608) lt!628745)))

(assert (= (and d!153439 c!132059) b!1427851))

(assert (= (and d!153439 (not c!132059)) b!1427852))

(assert (= (and b!1427852 c!132058) b!1427846))

(assert (= (and b!1427852 (not c!132058)) b!1427850))

(assert (= (and d!153439 c!132057) b!1427849))

(assert (= (and d!153439 (not c!132057)) b!1427844))

(assert (= (and b!1427844 res!962713) b!1427845))

(assert (= (and b!1427845 (not res!962712)) b!1427848))

(assert (= (and b!1427848 (not res!962714)) b!1427847))

(assert (=> d!153439 m!1317953))

(assert (=> d!153439 m!1317983))

(declare-fun m!1318149 () Bool)

(assert (=> b!1427848 m!1318149))

(assert (=> b!1427845 m!1318149))

(assert (=> b!1427850 m!1318047))

(assert (=> b!1427850 m!1318047))

(assert (=> b!1427850 m!1317967))

(declare-fun m!1318151 () Bool)

(assert (=> b!1427850 m!1318151))

(assert (=> b!1427847 m!1318149))

(assert (=> b!1427587 d!153439))

(declare-fun d!153441 () Bool)

(assert (=> d!153441 (= (validKeyInArray!0 (select (arr!46993 a!2831) j!81)) (and (not (= (select (arr!46993 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46993 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427588 d!153441))

(declare-fun d!153443 () Bool)

(declare-fun res!962715 () Bool)

(declare-fun e!806442 () Bool)

(assert (=> d!153443 (=> res!962715 e!806442)))

(assert (=> d!153443 (= res!962715 (bvsge j!81 (size!47543 a!2831)))))

(assert (=> d!153443 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806442)))

(declare-fun b!1427853 () Bool)

(declare-fun e!806443 () Bool)

(declare-fun e!806444 () Bool)

(assert (=> b!1427853 (= e!806443 e!806444)))

(declare-fun lt!628747 () (_ BitVec 64))

(assert (=> b!1427853 (= lt!628747 (select (arr!46993 a!2831) j!81))))

(declare-fun lt!628749 () Unit!48290)

(assert (=> b!1427853 (= lt!628749 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628747 j!81))))

(assert (=> b!1427853 (arrayContainsKey!0 a!2831 lt!628747 #b00000000000000000000000000000000)))

(declare-fun lt!628748 () Unit!48290)

(assert (=> b!1427853 (= lt!628748 lt!628749)))

(declare-fun res!962716 () Bool)

(assert (=> b!1427853 (= res!962716 (= (seekEntryOrOpen!0 (select (arr!46993 a!2831) j!81) a!2831 mask!2608) (Found!11272 j!81)))))

(assert (=> b!1427853 (=> (not res!962716) (not e!806444))))

(declare-fun b!1427854 () Bool)

(declare-fun call!67378 () Bool)

(assert (=> b!1427854 (= e!806444 call!67378)))

(declare-fun bm!67375 () Bool)

(assert (=> bm!67375 (= call!67378 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427855 () Bool)

(assert (=> b!1427855 (= e!806442 e!806443)))

(declare-fun c!132060 () Bool)

(assert (=> b!1427855 (= c!132060 (validKeyInArray!0 (select (arr!46993 a!2831) j!81)))))

(declare-fun b!1427856 () Bool)

(assert (=> b!1427856 (= e!806443 call!67378)))

(assert (= (and d!153443 (not res!962715)) b!1427855))

(assert (= (and b!1427855 c!132060) b!1427853))

(assert (= (and b!1427855 (not c!132060)) b!1427856))

(assert (= (and b!1427853 res!962716) b!1427854))

(assert (= (or b!1427854 b!1427856) bm!67375))

(assert (=> b!1427853 m!1317967))

(declare-fun m!1318153 () Bool)

(assert (=> b!1427853 m!1318153))

(declare-fun m!1318155 () Bool)

(assert (=> b!1427853 m!1318155))

(assert (=> b!1427853 m!1317967))

(assert (=> b!1427853 m!1317989))

(declare-fun m!1318157 () Bool)

(assert (=> bm!67375 m!1318157))

(assert (=> b!1427855 m!1317967))

(assert (=> b!1427855 m!1317967))

(assert (=> b!1427855 m!1317991))

(assert (=> b!1427589 d!153443))

(declare-fun d!153445 () Bool)

(assert (=> d!153445 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628758 () Unit!48290)

(declare-fun choose!38 (array!97357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48290)

(assert (=> d!153445 (= lt!628758 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153445 (validMask!0 mask!2608)))

(assert (=> d!153445 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628758)))

(declare-fun bs!41611 () Bool)

(assert (= bs!41611 d!153445))

(assert (=> bs!41611 m!1317955))

(declare-fun m!1318159 () Bool)

(assert (=> bs!41611 m!1318159))

(assert (=> bs!41611 m!1317983))

(assert (=> b!1427589 d!153445))

(declare-fun b!1427895 () Bool)

(declare-fun e!806473 () Bool)

(declare-fun e!806472 () Bool)

(assert (=> b!1427895 (= e!806473 e!806472)))

(declare-fun c!132074 () Bool)

(assert (=> b!1427895 (= c!132074 (validKeyInArray!0 (select (arr!46993 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427896 () Bool)

(declare-fun call!67383 () Bool)

(assert (=> b!1427896 (= e!806472 call!67383)))

(declare-fun d!153447 () Bool)

(declare-fun res!962729 () Bool)

(declare-fun e!806470 () Bool)

(assert (=> d!153447 (=> res!962729 e!806470)))

(assert (=> d!153447 (= res!962729 (bvsge #b00000000000000000000000000000000 (size!47543 a!2831)))))

(assert (=> d!153447 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33500) e!806470)))

(declare-fun b!1427897 () Bool)

(declare-fun e!806471 () Bool)

(declare-fun contains!9854 (List!33503 (_ BitVec 64)) Bool)

(assert (=> b!1427897 (= e!806471 (contains!9854 Nil!33500 (select (arr!46993 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427898 () Bool)

(assert (=> b!1427898 (= e!806472 call!67383)))

(declare-fun bm!67380 () Bool)

(assert (=> bm!67380 (= call!67383 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132074 (Cons!33499 (select (arr!46993 a!2831) #b00000000000000000000000000000000) Nil!33500) Nil!33500)))))

(declare-fun b!1427899 () Bool)

(assert (=> b!1427899 (= e!806470 e!806473)))

(declare-fun res!962730 () Bool)

(assert (=> b!1427899 (=> (not res!962730) (not e!806473))))

(assert (=> b!1427899 (= res!962730 (not e!806471))))

(declare-fun res!962731 () Bool)

(assert (=> b!1427899 (=> (not res!962731) (not e!806471))))

(assert (=> b!1427899 (= res!962731 (validKeyInArray!0 (select (arr!46993 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153447 (not res!962729)) b!1427899))

(assert (= (and b!1427899 res!962731) b!1427897))

(assert (= (and b!1427899 res!962730) b!1427895))

(assert (= (and b!1427895 c!132074) b!1427898))

(assert (= (and b!1427895 (not c!132074)) b!1427896))

(assert (= (or b!1427898 b!1427896) bm!67380))

(assert (=> b!1427895 m!1318137))

(assert (=> b!1427895 m!1318137))

(assert (=> b!1427895 m!1318147))

(assert (=> b!1427897 m!1318137))

(assert (=> b!1427897 m!1318137))

(declare-fun m!1318171 () Bool)

(assert (=> b!1427897 m!1318171))

(assert (=> bm!67380 m!1318137))

(declare-fun m!1318173 () Bool)

(assert (=> bm!67380 m!1318173))

(assert (=> b!1427899 m!1318137))

(assert (=> b!1427899 m!1318137))

(assert (=> b!1427899 m!1318147))

(assert (=> b!1427590 d!153447))

(push 1)

(assert (not d!153439))

(assert (not bm!67380))

(assert (not b!1427690))

(assert (not b!1427829))

(assert (not bm!67374))

(assert (not b!1427708))

(assert (not b!1427853))

(assert (not b!1427822))

(assert (not b!1427855))

(assert (not b!1427895))

(assert (not b!1427842))

(assert (not b!1427899))

(assert (not b!1427850))

