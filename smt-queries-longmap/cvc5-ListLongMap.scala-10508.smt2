; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123864 () Bool)

(assert start!123864)

(declare-fun b!1435305 () Bool)

(declare-fun e!810072 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97608 0))(
  ( (array!97609 (arr!47105 (Array (_ BitVec 32) (_ BitVec 64))) (size!47655 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97608)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11384 0))(
  ( (MissingZero!11384 (index!47928 (_ BitVec 32))) (Found!11384 (index!47929 (_ BitVec 32))) (Intermediate!11384 (undefined!12196 Bool) (index!47930 (_ BitVec 32)) (x!129598 (_ BitVec 32))) (Undefined!11384) (MissingVacant!11384 (index!47931 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97608 (_ BitVec 32)) SeekEntryResult!11384)

(assert (=> b!1435305 (= e!810072 (= (seekEntryOrOpen!0 (select (arr!47105 a!2831) j!81) a!2831 mask!2608) (Found!11384 j!81)))))

(declare-fun b!1435306 () Bool)

(declare-fun e!810076 () Bool)

(assert (=> b!1435306 (= e!810076 true)))

(declare-fun lt!631829 () (_ BitVec 64))

(declare-fun lt!631828 () (_ BitVec 32))

(declare-fun lt!631833 () array!97608)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!631831 () SeekEntryResult!11384)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97608 (_ BitVec 32)) SeekEntryResult!11384)

(assert (=> b!1435306 (= lt!631831 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631828 lt!631829 lt!631833 mask!2608))))

(declare-fun b!1435307 () Bool)

(declare-fun e!810071 () Bool)

(declare-fun e!810077 () Bool)

(assert (=> b!1435307 (= e!810071 (not e!810077))))

(declare-fun res!968316 () Bool)

(assert (=> b!1435307 (=> res!968316 e!810077)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435307 (= res!968316 (or (= (select (arr!47105 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47105 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47105 a!2831) index!585) (select (arr!47105 a!2831) j!81)) (= (select (store (arr!47105 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1435307 e!810072))

(declare-fun res!968321 () Bool)

(assert (=> b!1435307 (=> (not res!968321) (not e!810072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97608 (_ BitVec 32)) Bool)

(assert (=> b!1435307 (= res!968321 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48514 0))(
  ( (Unit!48515) )
))
(declare-fun lt!631830 () Unit!48514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48514)

(assert (=> b!1435307 (= lt!631830 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435308 () Bool)

(declare-fun e!810075 () Bool)

(declare-fun e!810073 () Bool)

(assert (=> b!1435308 (= e!810075 e!810073)))

(declare-fun res!968326 () Bool)

(assert (=> b!1435308 (=> (not res!968326) (not e!810073))))

(declare-fun lt!631827 () SeekEntryResult!11384)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435308 (= res!968326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47105 a!2831) j!81) mask!2608) (select (arr!47105 a!2831) j!81) a!2831 mask!2608) lt!631827))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1435308 (= lt!631827 (Intermediate!11384 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435309 () Bool)

(declare-fun res!968311 () Bool)

(assert (=> b!1435309 (=> (not res!968311) (not e!810075))))

(assert (=> b!1435309 (= res!968311 (and (= (size!47655 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47655 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47655 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435310 () Bool)

(assert (=> b!1435310 (= e!810073 e!810071)))

(declare-fun res!968323 () Bool)

(assert (=> b!1435310 (=> (not res!968323) (not e!810071))))

(declare-fun lt!631832 () SeekEntryResult!11384)

(assert (=> b!1435310 (= res!968323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631829 mask!2608) lt!631829 lt!631833 mask!2608) lt!631832))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435310 (= lt!631832 (Intermediate!11384 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435310 (= lt!631829 (select (store (arr!47105 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435310 (= lt!631833 (array!97609 (store (arr!47105 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47655 a!2831)))))

(declare-fun b!1435311 () Bool)

(declare-fun res!968319 () Bool)

(assert (=> b!1435311 (=> (not res!968319) (not e!810075))))

(declare-datatypes ((List!33615 0))(
  ( (Nil!33612) (Cons!33611 (h!34946 (_ BitVec 64)) (t!48309 List!33615)) )
))
(declare-fun arrayNoDuplicates!0 (array!97608 (_ BitVec 32) List!33615) Bool)

(assert (=> b!1435311 (= res!968319 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33612))))

(declare-fun b!1435312 () Bool)

(assert (=> b!1435312 (= e!810077 e!810076)))

(declare-fun res!968322 () Bool)

(assert (=> b!1435312 (=> res!968322 e!810076)))

(assert (=> b!1435312 (= res!968322 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631828 #b00000000000000000000000000000000) (bvsge lt!631828 (size!47655 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435312 (= lt!631828 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1435313 () Bool)

(declare-fun res!968325 () Bool)

(assert (=> b!1435313 (=> (not res!968325) (not e!810075))))

(assert (=> b!1435313 (= res!968325 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47655 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47655 a!2831))))))

(declare-fun b!1435314 () Bool)

(declare-fun res!968312 () Bool)

(assert (=> b!1435314 (=> (not res!968312) (not e!810071))))

(assert (=> b!1435314 (= res!968312 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!968324 () Bool)

(assert (=> start!123864 (=> (not res!968324) (not e!810075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123864 (= res!968324 (validMask!0 mask!2608))))

(assert (=> start!123864 e!810075))

(assert (=> start!123864 true))

(declare-fun array_inv!36133 (array!97608) Bool)

(assert (=> start!123864 (array_inv!36133 a!2831)))

(declare-fun b!1435315 () Bool)

(declare-fun res!968317 () Bool)

(assert (=> b!1435315 (=> (not res!968317) (not e!810075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435315 (= res!968317 (validKeyInArray!0 (select (arr!47105 a!2831) i!982)))))

(declare-fun b!1435316 () Bool)

(declare-fun res!968313 () Bool)

(assert (=> b!1435316 (=> (not res!968313) (not e!810075))))

(assert (=> b!1435316 (= res!968313 (validKeyInArray!0 (select (arr!47105 a!2831) j!81)))))

(declare-fun b!1435317 () Bool)

(declare-fun res!968315 () Bool)

(assert (=> b!1435317 (=> (not res!968315) (not e!810075))))

(assert (=> b!1435317 (= res!968315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435318 () Bool)

(declare-fun res!968320 () Bool)

(assert (=> b!1435318 (=> (not res!968320) (not e!810071))))

(assert (=> b!1435318 (= res!968320 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631829 lt!631833 mask!2608) lt!631832))))

(declare-fun b!1435319 () Bool)

(declare-fun res!968318 () Bool)

(assert (=> b!1435319 (=> res!968318 e!810076)))

(assert (=> b!1435319 (= res!968318 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631828 (select (arr!47105 a!2831) j!81) a!2831 mask!2608) lt!631827)))))

(declare-fun b!1435320 () Bool)

(declare-fun res!968314 () Bool)

(assert (=> b!1435320 (=> (not res!968314) (not e!810071))))

(assert (=> b!1435320 (= res!968314 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47105 a!2831) j!81) a!2831 mask!2608) lt!631827))))

(assert (= (and start!123864 res!968324) b!1435309))

(assert (= (and b!1435309 res!968311) b!1435315))

(assert (= (and b!1435315 res!968317) b!1435316))

(assert (= (and b!1435316 res!968313) b!1435317))

(assert (= (and b!1435317 res!968315) b!1435311))

(assert (= (and b!1435311 res!968319) b!1435313))

(assert (= (and b!1435313 res!968325) b!1435308))

(assert (= (and b!1435308 res!968326) b!1435310))

(assert (= (and b!1435310 res!968323) b!1435320))

(assert (= (and b!1435320 res!968314) b!1435318))

(assert (= (and b!1435318 res!968320) b!1435314))

(assert (= (and b!1435314 res!968312) b!1435307))

(assert (= (and b!1435307 res!968321) b!1435305))

(assert (= (and b!1435307 (not res!968316)) b!1435312))

(assert (= (and b!1435312 (not res!968322)) b!1435319))

(assert (= (and b!1435319 (not res!968318)) b!1435306))

(declare-fun m!1324665 () Bool)

(assert (=> start!123864 m!1324665))

(declare-fun m!1324667 () Bool)

(assert (=> start!123864 m!1324667))

(declare-fun m!1324669 () Bool)

(assert (=> b!1435318 m!1324669))

(declare-fun m!1324671 () Bool)

(assert (=> b!1435310 m!1324671))

(assert (=> b!1435310 m!1324671))

(declare-fun m!1324673 () Bool)

(assert (=> b!1435310 m!1324673))

(declare-fun m!1324675 () Bool)

(assert (=> b!1435310 m!1324675))

(declare-fun m!1324677 () Bool)

(assert (=> b!1435310 m!1324677))

(declare-fun m!1324679 () Bool)

(assert (=> b!1435305 m!1324679))

(assert (=> b!1435305 m!1324679))

(declare-fun m!1324681 () Bool)

(assert (=> b!1435305 m!1324681))

(declare-fun m!1324683 () Bool)

(assert (=> b!1435306 m!1324683))

(assert (=> b!1435320 m!1324679))

(assert (=> b!1435320 m!1324679))

(declare-fun m!1324685 () Bool)

(assert (=> b!1435320 m!1324685))

(declare-fun m!1324687 () Bool)

(assert (=> b!1435315 m!1324687))

(assert (=> b!1435315 m!1324687))

(declare-fun m!1324689 () Bool)

(assert (=> b!1435315 m!1324689))

(assert (=> b!1435319 m!1324679))

(assert (=> b!1435319 m!1324679))

(declare-fun m!1324691 () Bool)

(assert (=> b!1435319 m!1324691))

(assert (=> b!1435316 m!1324679))

(assert (=> b!1435316 m!1324679))

(declare-fun m!1324693 () Bool)

(assert (=> b!1435316 m!1324693))

(assert (=> b!1435308 m!1324679))

(assert (=> b!1435308 m!1324679))

(declare-fun m!1324695 () Bool)

(assert (=> b!1435308 m!1324695))

(assert (=> b!1435308 m!1324695))

(assert (=> b!1435308 m!1324679))

(declare-fun m!1324697 () Bool)

(assert (=> b!1435308 m!1324697))

(declare-fun m!1324699 () Bool)

(assert (=> b!1435317 m!1324699))

(declare-fun m!1324701 () Bool)

(assert (=> b!1435312 m!1324701))

(declare-fun m!1324703 () Bool)

(assert (=> b!1435311 m!1324703))

(assert (=> b!1435307 m!1324675))

(declare-fun m!1324705 () Bool)

(assert (=> b!1435307 m!1324705))

(declare-fun m!1324707 () Bool)

(assert (=> b!1435307 m!1324707))

(declare-fun m!1324709 () Bool)

(assert (=> b!1435307 m!1324709))

(assert (=> b!1435307 m!1324679))

(declare-fun m!1324711 () Bool)

(assert (=> b!1435307 m!1324711))

(push 1)

