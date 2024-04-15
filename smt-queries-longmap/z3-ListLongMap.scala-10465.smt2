; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122948 () Bool)

(assert start!122948)

(declare-fun b!1426228 () Bool)

(declare-fun res!961712 () Bool)

(declare-fun e!805622 () Bool)

(assert (=> b!1426228 (=> (not res!961712) (not e!805622))))

(declare-datatypes ((array!97266 0))(
  ( (array!97267 (arr!46951 (Array (_ BitVec 32) (_ BitVec 64))) (size!47503 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97266)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426228 (= res!961712 (validKeyInArray!0 (select (arr!46951 a!2831) j!81)))))

(declare-fun b!1426229 () Bool)

(declare-fun res!961722 () Bool)

(assert (=> b!1426229 (=> (not res!961722) (not e!805622))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426229 (= res!961722 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47503 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47503 a!2831))))))

(declare-fun b!1426230 () Bool)

(declare-fun res!961715 () Bool)

(assert (=> b!1426230 (=> (not res!961715) (not e!805622))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426230 (= res!961715 (and (= (size!47503 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47503 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47503 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426231 () Bool)

(declare-fun res!961718 () Bool)

(assert (=> b!1426231 (=> (not res!961718) (not e!805622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97266 (_ BitVec 32)) Bool)

(assert (=> b!1426231 (= res!961718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426232 () Bool)

(declare-fun res!961721 () Bool)

(declare-fun e!805620 () Bool)

(assert (=> b!1426232 (=> (not res!961721) (not e!805620))))

(declare-fun lt!627919 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11257 0))(
  ( (MissingZero!11257 (index!47420 (_ BitVec 32))) (Found!11257 (index!47421 (_ BitVec 32))) (Intermediate!11257 (undefined!12069 Bool) (index!47422 (_ BitVec 32)) (x!129040 (_ BitVec 32))) (Undefined!11257) (MissingVacant!11257 (index!47423 (_ BitVec 32))) )
))
(declare-fun lt!627920 () SeekEntryResult!11257)

(declare-fun lt!627916 () array!97266)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97266 (_ BitVec 32)) SeekEntryResult!11257)

(assert (=> b!1426232 (= res!961721 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627919 lt!627916 mask!2608) lt!627920))))

(declare-fun b!1426233 () Bool)

(declare-fun res!961723 () Bool)

(assert (=> b!1426233 (=> (not res!961723) (not e!805620))))

(declare-fun lt!627917 () SeekEntryResult!11257)

(assert (=> b!1426233 (= res!961723 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46951 a!2831) j!81) a!2831 mask!2608) lt!627917))))

(declare-fun b!1426234 () Bool)

(declare-fun e!805621 () Bool)

(assert (=> b!1426234 (= e!805621 e!805620)))

(declare-fun res!961717 () Bool)

(assert (=> b!1426234 (=> (not res!961717) (not e!805620))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426234 (= res!961717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627919 mask!2608) lt!627919 lt!627916 mask!2608) lt!627920))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1426234 (= lt!627920 (Intermediate!11257 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426234 (= lt!627919 (select (store (arr!46951 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426234 (= lt!627916 (array!97267 (store (arr!46951 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47503 a!2831)))))

(declare-fun res!961713 () Bool)

(assert (=> start!122948 (=> (not res!961713) (not e!805622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122948 (= res!961713 (validMask!0 mask!2608))))

(assert (=> start!122948 e!805622))

(assert (=> start!122948 true))

(declare-fun array_inv!36184 (array!97266) Bool)

(assert (=> start!122948 (array_inv!36184 a!2831)))

(declare-fun b!1426235 () Bool)

(assert (=> b!1426235 (= e!805622 e!805621)))

(declare-fun res!961714 () Bool)

(assert (=> b!1426235 (=> (not res!961714) (not e!805621))))

(assert (=> b!1426235 (= res!961714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) (select (arr!46951 a!2831) j!81) a!2831 mask!2608) lt!627917))))

(assert (=> b!1426235 (= lt!627917 (Intermediate!11257 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426236 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97266 (_ BitVec 32)) SeekEntryResult!11257)

(assert (=> b!1426236 (= e!805620 (not (= (seekEntryOrOpen!0 (select (arr!46951 a!2831) j!81) a!2831 mask!2608) (Found!11257 j!81))))))

(assert (=> b!1426236 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48099 0))(
  ( (Unit!48100) )
))
(declare-fun lt!627918 () Unit!48099)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48099)

(assert (=> b!1426236 (= lt!627918 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426237 () Bool)

(declare-fun res!961720 () Bool)

(assert (=> b!1426237 (=> (not res!961720) (not e!805622))))

(declare-datatypes ((List!33539 0))(
  ( (Nil!33536) (Cons!33535 (h!34837 (_ BitVec 64)) (t!48225 List!33539)) )
))
(declare-fun arrayNoDuplicates!0 (array!97266 (_ BitVec 32) List!33539) Bool)

(assert (=> b!1426237 (= res!961720 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33536))))

(declare-fun b!1426238 () Bool)

(declare-fun res!961716 () Bool)

(assert (=> b!1426238 (=> (not res!961716) (not e!805620))))

(assert (=> b!1426238 (= res!961716 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426239 () Bool)

(declare-fun res!961719 () Bool)

(assert (=> b!1426239 (=> (not res!961719) (not e!805622))))

(assert (=> b!1426239 (= res!961719 (validKeyInArray!0 (select (arr!46951 a!2831) i!982)))))

(assert (= (and start!122948 res!961713) b!1426230))

(assert (= (and b!1426230 res!961715) b!1426239))

(assert (= (and b!1426239 res!961719) b!1426228))

(assert (= (and b!1426228 res!961712) b!1426231))

(assert (= (and b!1426231 res!961718) b!1426237))

(assert (= (and b!1426237 res!961720) b!1426229))

(assert (= (and b!1426229 res!961722) b!1426235))

(assert (= (and b!1426235 res!961714) b!1426234))

(assert (= (and b!1426234 res!961717) b!1426233))

(assert (= (and b!1426233 res!961723) b!1426232))

(assert (= (and b!1426232 res!961721) b!1426238))

(assert (= (and b!1426238 res!961716) b!1426236))

(declare-fun m!1316367 () Bool)

(assert (=> b!1426232 m!1316367))

(declare-fun m!1316369 () Bool)

(assert (=> b!1426237 m!1316369))

(declare-fun m!1316371 () Bool)

(assert (=> b!1426228 m!1316371))

(assert (=> b!1426228 m!1316371))

(declare-fun m!1316373 () Bool)

(assert (=> b!1426228 m!1316373))

(assert (=> b!1426233 m!1316371))

(assert (=> b!1426233 m!1316371))

(declare-fun m!1316375 () Bool)

(assert (=> b!1426233 m!1316375))

(assert (=> b!1426236 m!1316371))

(assert (=> b!1426236 m!1316371))

(declare-fun m!1316377 () Bool)

(assert (=> b!1426236 m!1316377))

(declare-fun m!1316379 () Bool)

(assert (=> b!1426236 m!1316379))

(declare-fun m!1316381 () Bool)

(assert (=> b!1426236 m!1316381))

(declare-fun m!1316383 () Bool)

(assert (=> start!122948 m!1316383))

(declare-fun m!1316385 () Bool)

(assert (=> start!122948 m!1316385))

(declare-fun m!1316387 () Bool)

(assert (=> b!1426234 m!1316387))

(assert (=> b!1426234 m!1316387))

(declare-fun m!1316389 () Bool)

(assert (=> b!1426234 m!1316389))

(declare-fun m!1316391 () Bool)

(assert (=> b!1426234 m!1316391))

(declare-fun m!1316393 () Bool)

(assert (=> b!1426234 m!1316393))

(declare-fun m!1316395 () Bool)

(assert (=> b!1426231 m!1316395))

(assert (=> b!1426235 m!1316371))

(assert (=> b!1426235 m!1316371))

(declare-fun m!1316397 () Bool)

(assert (=> b!1426235 m!1316397))

(assert (=> b!1426235 m!1316397))

(assert (=> b!1426235 m!1316371))

(declare-fun m!1316399 () Bool)

(assert (=> b!1426235 m!1316399))

(declare-fun m!1316401 () Bool)

(assert (=> b!1426239 m!1316401))

(assert (=> b!1426239 m!1316401))

(declare-fun m!1316403 () Bool)

(assert (=> b!1426239 m!1316403))

(check-sat (not b!1426234) (not b!1426231) (not b!1426239) (not start!122948) (not b!1426236) (not b!1426235) (not b!1426228) (not b!1426232) (not b!1426237) (not b!1426233))
(check-sat)
(get-model)

(declare-fun b!1426330 () Bool)

(declare-fun e!805658 () Bool)

(declare-fun e!805660 () Bool)

(assert (=> b!1426330 (= e!805658 e!805660)))

(declare-fun res!961804 () Bool)

(declare-fun lt!627956 () SeekEntryResult!11257)

(get-info :version)

(assert (=> b!1426330 (= res!961804 (and ((_ is Intermediate!11257) lt!627956) (not (undefined!12069 lt!627956)) (bvslt (x!129040 lt!627956) #b01111111111111111111111111111110) (bvsge (x!129040 lt!627956) #b00000000000000000000000000000000) (bvsge (x!129040 lt!627956) #b00000000000000000000000000000000)))))

(assert (=> b!1426330 (=> (not res!961804) (not e!805660))))

(declare-fun d!153043 () Bool)

(assert (=> d!153043 e!805658))

(declare-fun c!131754 () Bool)

(assert (=> d!153043 (= c!131754 (and ((_ is Intermediate!11257) lt!627956) (undefined!12069 lt!627956)))))

(declare-fun e!805657 () SeekEntryResult!11257)

(assert (=> d!153043 (= lt!627956 e!805657)))

(declare-fun c!131753 () Bool)

(assert (=> d!153043 (= c!131753 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!627955 () (_ BitVec 64))

(assert (=> d!153043 (= lt!627955 (select (arr!46951 lt!627916) (toIndex!0 lt!627919 mask!2608)))))

(assert (=> d!153043 (validMask!0 mask!2608)))

(assert (=> d!153043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627919 mask!2608) lt!627919 lt!627916 mask!2608) lt!627956)))

(declare-fun b!1426331 () Bool)

(assert (=> b!1426331 (and (bvsge (index!47422 lt!627956) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627956) (size!47503 lt!627916)))))

(declare-fun res!961803 () Bool)

(assert (=> b!1426331 (= res!961803 (= (select (arr!46951 lt!627916) (index!47422 lt!627956)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805659 () Bool)

(assert (=> b!1426331 (=> res!961803 e!805659)))

(declare-fun b!1426332 () Bool)

(assert (=> b!1426332 (and (bvsge (index!47422 lt!627956) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627956) (size!47503 lt!627916)))))

(assert (=> b!1426332 (= e!805659 (= (select (arr!46951 lt!627916) (index!47422 lt!627956)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426333 () Bool)

(assert (=> b!1426333 (= e!805657 (Intermediate!11257 true (toIndex!0 lt!627919 mask!2608) #b00000000000000000000000000000000))))

(declare-fun e!805661 () SeekEntryResult!11257)

(declare-fun b!1426334 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426334 (= e!805661 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!627919 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!627919 lt!627916 mask!2608))))

(declare-fun b!1426335 () Bool)

(assert (=> b!1426335 (and (bvsge (index!47422 lt!627956) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627956) (size!47503 lt!627916)))))

(declare-fun res!961802 () Bool)

(assert (=> b!1426335 (= res!961802 (= (select (arr!46951 lt!627916) (index!47422 lt!627956)) lt!627919))))

(assert (=> b!1426335 (=> res!961802 e!805659)))

(assert (=> b!1426335 (= e!805660 e!805659)))

(declare-fun b!1426336 () Bool)

(assert (=> b!1426336 (= e!805661 (Intermediate!11257 false (toIndex!0 lt!627919 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426337 () Bool)

(assert (=> b!1426337 (= e!805658 (bvsge (x!129040 lt!627956) #b01111111111111111111111111111110))))

(declare-fun b!1426338 () Bool)

(assert (=> b!1426338 (= e!805657 e!805661)))

(declare-fun c!131755 () Bool)

(assert (=> b!1426338 (= c!131755 (or (= lt!627955 lt!627919) (= (bvadd lt!627955 lt!627955) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153043 c!131753) b!1426333))

(assert (= (and d!153043 (not c!131753)) b!1426338))

(assert (= (and b!1426338 c!131755) b!1426336))

(assert (= (and b!1426338 (not c!131755)) b!1426334))

(assert (= (and d!153043 c!131754) b!1426337))

(assert (= (and d!153043 (not c!131754)) b!1426330))

(assert (= (and b!1426330 res!961804) b!1426335))

(assert (= (and b!1426335 (not res!961802)) b!1426331))

(assert (= (and b!1426331 (not res!961803)) b!1426332))

(assert (=> d!153043 m!1316387))

(declare-fun m!1316481 () Bool)

(assert (=> d!153043 m!1316481))

(assert (=> d!153043 m!1316383))

(declare-fun m!1316483 () Bool)

(assert (=> b!1426331 m!1316483))

(assert (=> b!1426335 m!1316483))

(assert (=> b!1426332 m!1316483))

(assert (=> b!1426334 m!1316387))

(declare-fun m!1316485 () Bool)

(assert (=> b!1426334 m!1316485))

(assert (=> b!1426334 m!1316485))

(declare-fun m!1316487 () Bool)

(assert (=> b!1426334 m!1316487))

(assert (=> b!1426234 d!153043))

(declare-fun d!153045 () Bool)

(declare-fun lt!627962 () (_ BitVec 32))

(declare-fun lt!627961 () (_ BitVec 32))

(assert (=> d!153045 (= lt!627962 (bvmul (bvxor lt!627961 (bvlshr lt!627961 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153045 (= lt!627961 ((_ extract 31 0) (bvand (bvxor lt!627919 (bvlshr lt!627919 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153045 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!961805 (let ((h!34840 ((_ extract 31 0) (bvand (bvxor lt!627919 (bvlshr lt!627919 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129044 (bvmul (bvxor h!34840 (bvlshr h!34840 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129044 (bvlshr x!129044 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!961805 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!961805 #b00000000000000000000000000000000))))))

(assert (=> d!153045 (= (toIndex!0 lt!627919 mask!2608) (bvand (bvxor lt!627962 (bvlshr lt!627962 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426234 d!153045))

(declare-fun d!153047 () Bool)

(assert (=> d!153047 (= (validKeyInArray!0 (select (arr!46951 a!2831) i!982)) (and (not (= (select (arr!46951 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46951 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426239 d!153047))

(declare-fun d!153049 () Bool)

(assert (=> d!153049 (= (validKeyInArray!0 (select (arr!46951 a!2831) j!81)) (and (not (= (select (arr!46951 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46951 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426228 d!153049))

(declare-fun b!1426339 () Bool)

(declare-fun e!805663 () Bool)

(declare-fun e!805665 () Bool)

(assert (=> b!1426339 (= e!805663 e!805665)))

(declare-fun res!961808 () Bool)

(declare-fun lt!627964 () SeekEntryResult!11257)

(assert (=> b!1426339 (= res!961808 (and ((_ is Intermediate!11257) lt!627964) (not (undefined!12069 lt!627964)) (bvslt (x!129040 lt!627964) #b01111111111111111111111111111110) (bvsge (x!129040 lt!627964) #b00000000000000000000000000000000) (bvsge (x!129040 lt!627964) x!605)))))

(assert (=> b!1426339 (=> (not res!961808) (not e!805665))))

(declare-fun d!153051 () Bool)

(assert (=> d!153051 e!805663))

(declare-fun c!131757 () Bool)

(assert (=> d!153051 (= c!131757 (and ((_ is Intermediate!11257) lt!627964) (undefined!12069 lt!627964)))))

(declare-fun e!805662 () SeekEntryResult!11257)

(assert (=> d!153051 (= lt!627964 e!805662)))

(declare-fun c!131756 () Bool)

(assert (=> d!153051 (= c!131756 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!627963 () (_ BitVec 64))

(assert (=> d!153051 (= lt!627963 (select (arr!46951 a!2831) index!585))))

(assert (=> d!153051 (validMask!0 mask!2608)))

(assert (=> d!153051 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46951 a!2831) j!81) a!2831 mask!2608) lt!627964)))

(declare-fun b!1426340 () Bool)

(assert (=> b!1426340 (and (bvsge (index!47422 lt!627964) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627964) (size!47503 a!2831)))))

(declare-fun res!961807 () Bool)

(assert (=> b!1426340 (= res!961807 (= (select (arr!46951 a!2831) (index!47422 lt!627964)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805664 () Bool)

(assert (=> b!1426340 (=> res!961807 e!805664)))

(declare-fun b!1426341 () Bool)

(assert (=> b!1426341 (and (bvsge (index!47422 lt!627964) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627964) (size!47503 a!2831)))))

(assert (=> b!1426341 (= e!805664 (= (select (arr!46951 a!2831) (index!47422 lt!627964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426342 () Bool)

(assert (=> b!1426342 (= e!805662 (Intermediate!11257 true index!585 x!605))))

(declare-fun b!1426343 () Bool)

(declare-fun e!805666 () SeekEntryResult!11257)

(assert (=> b!1426343 (= e!805666 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46951 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426344 () Bool)

(assert (=> b!1426344 (and (bvsge (index!47422 lt!627964) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627964) (size!47503 a!2831)))))

(declare-fun res!961806 () Bool)

(assert (=> b!1426344 (= res!961806 (= (select (arr!46951 a!2831) (index!47422 lt!627964)) (select (arr!46951 a!2831) j!81)))))

(assert (=> b!1426344 (=> res!961806 e!805664)))

(assert (=> b!1426344 (= e!805665 e!805664)))

(declare-fun b!1426345 () Bool)

(assert (=> b!1426345 (= e!805666 (Intermediate!11257 false index!585 x!605))))

(declare-fun b!1426346 () Bool)

(assert (=> b!1426346 (= e!805663 (bvsge (x!129040 lt!627964) #b01111111111111111111111111111110))))

(declare-fun b!1426347 () Bool)

(assert (=> b!1426347 (= e!805662 e!805666)))

(declare-fun c!131758 () Bool)

(assert (=> b!1426347 (= c!131758 (or (= lt!627963 (select (arr!46951 a!2831) j!81)) (= (bvadd lt!627963 lt!627963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153051 c!131756) b!1426342))

(assert (= (and d!153051 (not c!131756)) b!1426347))

(assert (= (and b!1426347 c!131758) b!1426345))

(assert (= (and b!1426347 (not c!131758)) b!1426343))

(assert (= (and d!153051 c!131757) b!1426346))

(assert (= (and d!153051 (not c!131757)) b!1426339))

(assert (= (and b!1426339 res!961808) b!1426344))

(assert (= (and b!1426344 (not res!961806)) b!1426340))

(assert (= (and b!1426340 (not res!961807)) b!1426341))

(declare-fun m!1316489 () Bool)

(assert (=> d!153051 m!1316489))

(assert (=> d!153051 m!1316383))

(declare-fun m!1316491 () Bool)

(assert (=> b!1426340 m!1316491))

(assert (=> b!1426344 m!1316491))

(assert (=> b!1426341 m!1316491))

(declare-fun m!1316493 () Bool)

(assert (=> b!1426343 m!1316493))

(assert (=> b!1426343 m!1316493))

(assert (=> b!1426343 m!1316371))

(declare-fun m!1316495 () Bool)

(assert (=> b!1426343 m!1316495))

(assert (=> b!1426233 d!153051))

(declare-fun b!1426348 () Bool)

(declare-fun e!805668 () Bool)

(declare-fun e!805670 () Bool)

(assert (=> b!1426348 (= e!805668 e!805670)))

(declare-fun res!961811 () Bool)

(declare-fun lt!627966 () SeekEntryResult!11257)

(assert (=> b!1426348 (= res!961811 (and ((_ is Intermediate!11257) lt!627966) (not (undefined!12069 lt!627966)) (bvslt (x!129040 lt!627966) #b01111111111111111111111111111110) (bvsge (x!129040 lt!627966) #b00000000000000000000000000000000) (bvsge (x!129040 lt!627966) x!605)))))

(assert (=> b!1426348 (=> (not res!961811) (not e!805670))))

(declare-fun d!153055 () Bool)

(assert (=> d!153055 e!805668))

(declare-fun c!131760 () Bool)

(assert (=> d!153055 (= c!131760 (and ((_ is Intermediate!11257) lt!627966) (undefined!12069 lt!627966)))))

(declare-fun e!805667 () SeekEntryResult!11257)

(assert (=> d!153055 (= lt!627966 e!805667)))

(declare-fun c!131759 () Bool)

(assert (=> d!153055 (= c!131759 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!627965 () (_ BitVec 64))

(assert (=> d!153055 (= lt!627965 (select (arr!46951 lt!627916) index!585))))

(assert (=> d!153055 (validMask!0 mask!2608)))

(assert (=> d!153055 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627919 lt!627916 mask!2608) lt!627966)))

(declare-fun b!1426349 () Bool)

(assert (=> b!1426349 (and (bvsge (index!47422 lt!627966) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627966) (size!47503 lt!627916)))))

(declare-fun res!961810 () Bool)

(assert (=> b!1426349 (= res!961810 (= (select (arr!46951 lt!627916) (index!47422 lt!627966)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805669 () Bool)

(assert (=> b!1426349 (=> res!961810 e!805669)))

(declare-fun b!1426350 () Bool)

(assert (=> b!1426350 (and (bvsge (index!47422 lt!627966) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627966) (size!47503 lt!627916)))))

(assert (=> b!1426350 (= e!805669 (= (select (arr!46951 lt!627916) (index!47422 lt!627966)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426351 () Bool)

(assert (=> b!1426351 (= e!805667 (Intermediate!11257 true index!585 x!605))))

(declare-fun b!1426352 () Bool)

(declare-fun e!805671 () SeekEntryResult!11257)

(assert (=> b!1426352 (= e!805671 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!627919 lt!627916 mask!2608))))

(declare-fun b!1426353 () Bool)

(assert (=> b!1426353 (and (bvsge (index!47422 lt!627966) #b00000000000000000000000000000000) (bvslt (index!47422 lt!627966) (size!47503 lt!627916)))))

(declare-fun res!961809 () Bool)

(assert (=> b!1426353 (= res!961809 (= (select (arr!46951 lt!627916) (index!47422 lt!627966)) lt!627919))))

(assert (=> b!1426353 (=> res!961809 e!805669)))

(assert (=> b!1426353 (= e!805670 e!805669)))

(declare-fun b!1426354 () Bool)

(assert (=> b!1426354 (= e!805671 (Intermediate!11257 false index!585 x!605))))

(declare-fun b!1426355 () Bool)

(assert (=> b!1426355 (= e!805668 (bvsge (x!129040 lt!627966) #b01111111111111111111111111111110))))

(declare-fun b!1426356 () Bool)

(assert (=> b!1426356 (= e!805667 e!805671)))

(declare-fun c!131761 () Bool)

(assert (=> b!1426356 (= c!131761 (or (= lt!627965 lt!627919) (= (bvadd lt!627965 lt!627965) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153055 c!131759) b!1426351))

(assert (= (and d!153055 (not c!131759)) b!1426356))

(assert (= (and b!1426356 c!131761) b!1426354))

(assert (= (and b!1426356 (not c!131761)) b!1426352))

(assert (= (and d!153055 c!131760) b!1426355))

(assert (= (and d!153055 (not c!131760)) b!1426348))

(assert (= (and b!1426348 res!961811) b!1426353))

(assert (= (and b!1426353 (not res!961809)) b!1426349))

(assert (= (and b!1426349 (not res!961810)) b!1426350))

(declare-fun m!1316497 () Bool)

(assert (=> d!153055 m!1316497))

(assert (=> d!153055 m!1316383))

(declare-fun m!1316499 () Bool)

(assert (=> b!1426349 m!1316499))

(assert (=> b!1426353 m!1316499))

(assert (=> b!1426350 m!1316499))

(assert (=> b!1426352 m!1316493))

(assert (=> b!1426352 m!1316493))

(declare-fun m!1316501 () Bool)

(assert (=> b!1426352 m!1316501))

(assert (=> b!1426232 d!153055))

(declare-fun b!1426367 () Bool)

(declare-fun e!805682 () Bool)

(declare-fun e!805681 () Bool)

(assert (=> b!1426367 (= e!805682 e!805681)))

(declare-fun res!961820 () Bool)

(assert (=> b!1426367 (=> (not res!961820) (not e!805681))))

(declare-fun e!805680 () Bool)

(assert (=> b!1426367 (= res!961820 (not e!805680))))

(declare-fun res!961818 () Bool)

(assert (=> b!1426367 (=> (not res!961818) (not e!805680))))

(assert (=> b!1426367 (= res!961818 (validKeyInArray!0 (select (arr!46951 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1426368 () Bool)

(declare-fun e!805683 () Bool)

(declare-fun call!67304 () Bool)

(assert (=> b!1426368 (= e!805683 call!67304)))

(declare-fun b!1426369 () Bool)

(declare-fun contains!9809 (List!33539 (_ BitVec 64)) Bool)

(assert (=> b!1426369 (= e!805680 (contains!9809 Nil!33536 (select (arr!46951 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1426370 () Bool)

(assert (=> b!1426370 (= e!805681 e!805683)))

(declare-fun c!131764 () Bool)

(assert (=> b!1426370 (= c!131764 (validKeyInArray!0 (select (arr!46951 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153059 () Bool)

(declare-fun res!961819 () Bool)

(assert (=> d!153059 (=> res!961819 e!805682)))

(assert (=> d!153059 (= res!961819 (bvsge #b00000000000000000000000000000000 (size!47503 a!2831)))))

(assert (=> d!153059 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33536) e!805682)))

(declare-fun bm!67301 () Bool)

(assert (=> bm!67301 (= call!67304 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131764 (Cons!33535 (select (arr!46951 a!2831) #b00000000000000000000000000000000) Nil!33536) Nil!33536)))))

(declare-fun b!1426371 () Bool)

(assert (=> b!1426371 (= e!805683 call!67304)))

(assert (= (and d!153059 (not res!961819)) b!1426367))

(assert (= (and b!1426367 res!961818) b!1426369))

(assert (= (and b!1426367 res!961820) b!1426370))

(assert (= (and b!1426370 c!131764) b!1426368))

(assert (= (and b!1426370 (not c!131764)) b!1426371))

(assert (= (or b!1426368 b!1426371) bm!67301))

(declare-fun m!1316503 () Bool)

(assert (=> b!1426367 m!1316503))

(assert (=> b!1426367 m!1316503))

(declare-fun m!1316505 () Bool)

(assert (=> b!1426367 m!1316505))

(assert (=> b!1426369 m!1316503))

(assert (=> b!1426369 m!1316503))

(declare-fun m!1316507 () Bool)

(assert (=> b!1426369 m!1316507))

(assert (=> b!1426370 m!1316503))

(assert (=> b!1426370 m!1316503))

(assert (=> b!1426370 m!1316505))

(assert (=> bm!67301 m!1316503))

(declare-fun m!1316509 () Bool)

(assert (=> bm!67301 m!1316509))

(assert (=> b!1426237 d!153059))

(declare-fun b!1426418 () Bool)

(declare-fun e!805713 () Bool)

(declare-fun call!67309 () Bool)

(assert (=> b!1426418 (= e!805713 call!67309)))

(declare-fun b!1426419 () Bool)

(declare-fun e!805711 () Bool)

(assert (=> b!1426419 (= e!805711 call!67309)))

(declare-fun b!1426420 () Bool)

(declare-fun e!805712 () Bool)

(assert (=> b!1426420 (= e!805712 e!805713)))

(declare-fun c!131784 () Bool)

(assert (=> b!1426420 (= c!131784 (validKeyInArray!0 (select (arr!46951 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153061 () Bool)

(declare-fun res!961829 () Bool)

(assert (=> d!153061 (=> res!961829 e!805712)))

(assert (=> d!153061 (= res!961829 (bvsge #b00000000000000000000000000000000 (size!47503 a!2831)))))

(assert (=> d!153061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!805712)))

(declare-fun bm!67306 () Bool)

(assert (=> bm!67306 (= call!67309 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1426421 () Bool)

(assert (=> b!1426421 (= e!805713 e!805711)))

(declare-fun lt!627995 () (_ BitVec 64))

(assert (=> b!1426421 (= lt!627995 (select (arr!46951 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!627996 () Unit!48099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97266 (_ BitVec 64) (_ BitVec 32)) Unit!48099)

(assert (=> b!1426421 (= lt!627996 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!627995 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1426421 (arrayContainsKey!0 a!2831 lt!627995 #b00000000000000000000000000000000)))

(declare-fun lt!627994 () Unit!48099)

(assert (=> b!1426421 (= lt!627994 lt!627996)))

(declare-fun res!961830 () Bool)

(assert (=> b!1426421 (= res!961830 (= (seekEntryOrOpen!0 (select (arr!46951 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11257 #b00000000000000000000000000000000)))))

(assert (=> b!1426421 (=> (not res!961830) (not e!805711))))

(assert (= (and d!153061 (not res!961829)) b!1426420))

(assert (= (and b!1426420 c!131784) b!1426421))

(assert (= (and b!1426420 (not c!131784)) b!1426418))

(assert (= (and b!1426421 res!961830) b!1426419))

(assert (= (or b!1426419 b!1426418) bm!67306))

(assert (=> b!1426420 m!1316503))

(assert (=> b!1426420 m!1316503))

(assert (=> b!1426420 m!1316505))

(declare-fun m!1316521 () Bool)

(assert (=> bm!67306 m!1316521))

(assert (=> b!1426421 m!1316503))

(declare-fun m!1316523 () Bool)

(assert (=> b!1426421 m!1316523))

(declare-fun m!1316525 () Bool)

(assert (=> b!1426421 m!1316525))

(assert (=> b!1426421 m!1316503))

(declare-fun m!1316527 () Bool)

(assert (=> b!1426421 m!1316527))

(assert (=> b!1426231 d!153061))

(declare-fun d!153065 () Bool)

(assert (=> d!153065 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122948 d!153065))

(declare-fun d!153075 () Bool)

(assert (=> d!153075 (= (array_inv!36184 a!2831) (bvsge (size!47503 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122948 d!153075))

(declare-fun b!1426498 () Bool)

(declare-fun e!805763 () SeekEntryResult!11257)

(declare-fun e!805762 () SeekEntryResult!11257)

(assert (=> b!1426498 (= e!805763 e!805762)))

(declare-fun lt!628037 () (_ BitVec 64))

(declare-fun lt!628036 () SeekEntryResult!11257)

(assert (=> b!1426498 (= lt!628037 (select (arr!46951 a!2831) (index!47422 lt!628036)))))

(declare-fun c!131811 () Bool)

(assert (=> b!1426498 (= c!131811 (= lt!628037 (select (arr!46951 a!2831) j!81)))))

(declare-fun b!1426499 () Bool)

(assert (=> b!1426499 (= e!805762 (Found!11257 (index!47422 lt!628036)))))

(declare-fun b!1426500 () Bool)

(assert (=> b!1426500 (= e!805763 Undefined!11257)))

(declare-fun b!1426501 () Bool)

(declare-fun e!805764 () SeekEntryResult!11257)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97266 (_ BitVec 32)) SeekEntryResult!11257)

(assert (=> b!1426501 (= e!805764 (seekKeyOrZeroReturnVacant!0 (x!129040 lt!628036) (index!47422 lt!628036) (index!47422 lt!628036) (select (arr!46951 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426502 () Bool)

(declare-fun c!131810 () Bool)

(assert (=> b!1426502 (= c!131810 (= lt!628037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1426502 (= e!805762 e!805764)))

(declare-fun d!153077 () Bool)

(declare-fun lt!628038 () SeekEntryResult!11257)

(assert (=> d!153077 (and (or ((_ is Undefined!11257) lt!628038) (not ((_ is Found!11257) lt!628038)) (and (bvsge (index!47421 lt!628038) #b00000000000000000000000000000000) (bvslt (index!47421 lt!628038) (size!47503 a!2831)))) (or ((_ is Undefined!11257) lt!628038) ((_ is Found!11257) lt!628038) (not ((_ is MissingZero!11257) lt!628038)) (and (bvsge (index!47420 lt!628038) #b00000000000000000000000000000000) (bvslt (index!47420 lt!628038) (size!47503 a!2831)))) (or ((_ is Undefined!11257) lt!628038) ((_ is Found!11257) lt!628038) ((_ is MissingZero!11257) lt!628038) (not ((_ is MissingVacant!11257) lt!628038)) (and (bvsge (index!47423 lt!628038) #b00000000000000000000000000000000) (bvslt (index!47423 lt!628038) (size!47503 a!2831)))) (or ((_ is Undefined!11257) lt!628038) (ite ((_ is Found!11257) lt!628038) (= (select (arr!46951 a!2831) (index!47421 lt!628038)) (select (arr!46951 a!2831) j!81)) (ite ((_ is MissingZero!11257) lt!628038) (= (select (arr!46951 a!2831) (index!47420 lt!628038)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11257) lt!628038) (= (select (arr!46951 a!2831) (index!47423 lt!628038)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153077 (= lt!628038 e!805763)))

(declare-fun c!131812 () Bool)

(assert (=> d!153077 (= c!131812 (and ((_ is Intermediate!11257) lt!628036) (undefined!12069 lt!628036)))))

(assert (=> d!153077 (= lt!628036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) (select (arr!46951 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153077 (validMask!0 mask!2608)))

(assert (=> d!153077 (= (seekEntryOrOpen!0 (select (arr!46951 a!2831) j!81) a!2831 mask!2608) lt!628038)))

(declare-fun b!1426503 () Bool)

(assert (=> b!1426503 (= e!805764 (MissingZero!11257 (index!47422 lt!628036)))))

(assert (= (and d!153077 c!131812) b!1426500))

(assert (= (and d!153077 (not c!131812)) b!1426498))

(assert (= (and b!1426498 c!131811) b!1426499))

(assert (= (and b!1426498 (not c!131811)) b!1426502))

(assert (= (and b!1426502 c!131810) b!1426503))

(assert (= (and b!1426502 (not c!131810)) b!1426501))

(declare-fun m!1316571 () Bool)

(assert (=> b!1426498 m!1316571))

(assert (=> b!1426501 m!1316371))

(declare-fun m!1316573 () Bool)

(assert (=> b!1426501 m!1316573))

(assert (=> d!153077 m!1316383))

(declare-fun m!1316575 () Bool)

(assert (=> d!153077 m!1316575))

(assert (=> d!153077 m!1316371))

(assert (=> d!153077 m!1316397))

(assert (=> d!153077 m!1316397))

(assert (=> d!153077 m!1316371))

(assert (=> d!153077 m!1316399))

(declare-fun m!1316577 () Bool)

(assert (=> d!153077 m!1316577))

(declare-fun m!1316579 () Bool)

(assert (=> d!153077 m!1316579))

(assert (=> b!1426236 d!153077))

(declare-fun b!1426508 () Bool)

(declare-fun e!805770 () Bool)

(declare-fun call!67318 () Bool)

(assert (=> b!1426508 (= e!805770 call!67318)))

(declare-fun b!1426509 () Bool)

(declare-fun e!805768 () Bool)

(assert (=> b!1426509 (= e!805768 call!67318)))

(declare-fun b!1426510 () Bool)

(declare-fun e!805769 () Bool)

(assert (=> b!1426510 (= e!805769 e!805770)))

(declare-fun c!131814 () Bool)

(assert (=> b!1426510 (= c!131814 (validKeyInArray!0 (select (arr!46951 a!2831) j!81)))))

(declare-fun d!153097 () Bool)

(declare-fun res!961860 () Bool)

(assert (=> d!153097 (=> res!961860 e!805769)))

(assert (=> d!153097 (= res!961860 (bvsge j!81 (size!47503 a!2831)))))

(assert (=> d!153097 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!805769)))

(declare-fun bm!67315 () Bool)

(assert (=> bm!67315 (= call!67318 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1426511 () Bool)

(assert (=> b!1426511 (= e!805770 e!805768)))

(declare-fun lt!628043 () (_ BitVec 64))

(assert (=> b!1426511 (= lt!628043 (select (arr!46951 a!2831) j!81))))

(declare-fun lt!628044 () Unit!48099)

(assert (=> b!1426511 (= lt!628044 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628043 j!81))))

(assert (=> b!1426511 (arrayContainsKey!0 a!2831 lt!628043 #b00000000000000000000000000000000)))

(declare-fun lt!628042 () Unit!48099)

(assert (=> b!1426511 (= lt!628042 lt!628044)))

(declare-fun res!961861 () Bool)

(assert (=> b!1426511 (= res!961861 (= (seekEntryOrOpen!0 (select (arr!46951 a!2831) j!81) a!2831 mask!2608) (Found!11257 j!81)))))

(assert (=> b!1426511 (=> (not res!961861) (not e!805768))))

(assert (= (and d!153097 (not res!961860)) b!1426510))

(assert (= (and b!1426510 c!131814) b!1426511))

(assert (= (and b!1426510 (not c!131814)) b!1426508))

(assert (= (and b!1426511 res!961861) b!1426509))

(assert (= (or b!1426509 b!1426508) bm!67315))

(assert (=> b!1426510 m!1316371))

(assert (=> b!1426510 m!1316371))

(assert (=> b!1426510 m!1316373))

(declare-fun m!1316589 () Bool)

(assert (=> bm!67315 m!1316589))

(assert (=> b!1426511 m!1316371))

(declare-fun m!1316591 () Bool)

(assert (=> b!1426511 m!1316591))

(declare-fun m!1316593 () Bool)

(assert (=> b!1426511 m!1316593))

(assert (=> b!1426511 m!1316371))

(assert (=> b!1426511 m!1316377))

(assert (=> b!1426236 d!153097))

(declare-fun d!153101 () Bool)

(assert (=> d!153101 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628055 () Unit!48099)

(declare-fun choose!38 (array!97266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48099)

(assert (=> d!153101 (= lt!628055 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153101 (validMask!0 mask!2608)))

(assert (=> d!153101 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628055)))

(declare-fun bs!41562 () Bool)

(assert (= bs!41562 d!153101))

(assert (=> bs!41562 m!1316379))

(declare-fun m!1316617 () Bool)

(assert (=> bs!41562 m!1316617))

(assert (=> bs!41562 m!1316383))

(assert (=> b!1426236 d!153101))

(declare-fun b!1426539 () Bool)

(declare-fun e!805787 () Bool)

(declare-fun e!805789 () Bool)

(assert (=> b!1426539 (= e!805787 e!805789)))

(declare-fun res!961873 () Bool)

(declare-fun lt!628057 () SeekEntryResult!11257)

(assert (=> b!1426539 (= res!961873 (and ((_ is Intermediate!11257) lt!628057) (not (undefined!12069 lt!628057)) (bvslt (x!129040 lt!628057) #b01111111111111111111111111111110) (bvsge (x!129040 lt!628057) #b00000000000000000000000000000000) (bvsge (x!129040 lt!628057) #b00000000000000000000000000000000)))))

(assert (=> b!1426539 (=> (not res!961873) (not e!805789))))

(declare-fun d!153111 () Bool)

(assert (=> d!153111 e!805787))

(declare-fun c!131825 () Bool)

(assert (=> d!153111 (= c!131825 (and ((_ is Intermediate!11257) lt!628057) (undefined!12069 lt!628057)))))

(declare-fun e!805786 () SeekEntryResult!11257)

(assert (=> d!153111 (= lt!628057 e!805786)))

(declare-fun c!131824 () Bool)

(assert (=> d!153111 (= c!131824 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628056 () (_ BitVec 64))

(assert (=> d!153111 (= lt!628056 (select (arr!46951 a!2831) (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608)))))

(assert (=> d!153111 (validMask!0 mask!2608)))

(assert (=> d!153111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) (select (arr!46951 a!2831) j!81) a!2831 mask!2608) lt!628057)))

(declare-fun b!1426540 () Bool)

(assert (=> b!1426540 (and (bvsge (index!47422 lt!628057) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628057) (size!47503 a!2831)))))

(declare-fun res!961872 () Bool)

(assert (=> b!1426540 (= res!961872 (= (select (arr!46951 a!2831) (index!47422 lt!628057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805788 () Bool)

(assert (=> b!1426540 (=> res!961872 e!805788)))

(declare-fun b!1426541 () Bool)

(assert (=> b!1426541 (and (bvsge (index!47422 lt!628057) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628057) (size!47503 a!2831)))))

(assert (=> b!1426541 (= e!805788 (= (select (arr!46951 a!2831) (index!47422 lt!628057)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426542 () Bool)

(assert (=> b!1426542 (= e!805786 (Intermediate!11257 true (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426543 () Bool)

(declare-fun e!805790 () SeekEntryResult!11257)

(assert (=> b!1426543 (= e!805790 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46951 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426544 () Bool)

(assert (=> b!1426544 (and (bvsge (index!47422 lt!628057) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628057) (size!47503 a!2831)))))

(declare-fun res!961871 () Bool)

(assert (=> b!1426544 (= res!961871 (= (select (arr!46951 a!2831) (index!47422 lt!628057)) (select (arr!46951 a!2831) j!81)))))

(assert (=> b!1426544 (=> res!961871 e!805788)))

(assert (=> b!1426544 (= e!805789 e!805788)))

(declare-fun b!1426545 () Bool)

(assert (=> b!1426545 (= e!805790 (Intermediate!11257 false (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426546 () Bool)

(assert (=> b!1426546 (= e!805787 (bvsge (x!129040 lt!628057) #b01111111111111111111111111111110))))

(declare-fun b!1426547 () Bool)

(assert (=> b!1426547 (= e!805786 e!805790)))

(declare-fun c!131826 () Bool)

(assert (=> b!1426547 (= c!131826 (or (= lt!628056 (select (arr!46951 a!2831) j!81)) (= (bvadd lt!628056 lt!628056) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153111 c!131824) b!1426542))

(assert (= (and d!153111 (not c!131824)) b!1426547))

(assert (= (and b!1426547 c!131826) b!1426545))

(assert (= (and b!1426547 (not c!131826)) b!1426543))

(assert (= (and d!153111 c!131825) b!1426546))

(assert (= (and d!153111 (not c!131825)) b!1426539))

(assert (= (and b!1426539 res!961873) b!1426544))

(assert (= (and b!1426544 (not res!961871)) b!1426540))

(assert (= (and b!1426540 (not res!961872)) b!1426541))

(assert (=> d!153111 m!1316397))

(declare-fun m!1316619 () Bool)

(assert (=> d!153111 m!1316619))

(assert (=> d!153111 m!1316383))

(declare-fun m!1316621 () Bool)

(assert (=> b!1426540 m!1316621))

(assert (=> b!1426544 m!1316621))

(assert (=> b!1426541 m!1316621))

(assert (=> b!1426543 m!1316397))

(declare-fun m!1316623 () Bool)

(assert (=> b!1426543 m!1316623))

(assert (=> b!1426543 m!1316623))

(assert (=> b!1426543 m!1316371))

(declare-fun m!1316625 () Bool)

(assert (=> b!1426543 m!1316625))

(assert (=> b!1426235 d!153111))

(declare-fun d!153113 () Bool)

(declare-fun lt!628059 () (_ BitVec 32))

(declare-fun lt!628058 () (_ BitVec 32))

(assert (=> d!153113 (= lt!628059 (bvmul (bvxor lt!628058 (bvlshr lt!628058 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153113 (= lt!628058 ((_ extract 31 0) (bvand (bvxor (select (arr!46951 a!2831) j!81) (bvlshr (select (arr!46951 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153113 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!961805 (let ((h!34840 ((_ extract 31 0) (bvand (bvxor (select (arr!46951 a!2831) j!81) (bvlshr (select (arr!46951 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129044 (bvmul (bvxor h!34840 (bvlshr h!34840 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129044 (bvlshr x!129044 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!961805 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!961805 #b00000000000000000000000000000000))))))

(assert (=> d!153113 (= (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) (bvand (bvxor lt!628059 (bvlshr lt!628059 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426235 d!153113))

(check-sat (not b!1426369) (not b!1426352) (not d!153111) (not bm!67301) (not b!1426511) (not b!1426421) (not d!153077) (not bm!67306) (not b!1426370) (not b!1426343) (not d!153051) (not b!1426334) (not d!153055) (not b!1426543) (not b!1426420) (not d!153043) (not b!1426501) (not bm!67315) (not d!153101) (not b!1426510) (not b!1426367))
(check-sat)
