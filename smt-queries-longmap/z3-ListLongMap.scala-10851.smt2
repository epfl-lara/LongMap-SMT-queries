; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126968 () Bool)

(assert start!126968)

(declare-fun res!1015538 () Bool)

(declare-fun e!836107 () Bool)

(assert (=> start!126968 (=> (not res!1015538) (not e!836107))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126968 (= res!1015538 (validMask!0 mask!2687))))

(assert (=> start!126968 e!836107))

(assert (=> start!126968 true))

(declare-datatypes ((array!99676 0))(
  ( (array!99677 (arr!48109 (Array (_ BitVec 32) (_ BitVec 64))) (size!48661 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99676)

(declare-fun array_inv!37342 (array!99676) Bool)

(assert (=> start!126968 (array_inv!37342 a!2862)))

(declare-fun b!1492528 () Bool)

(declare-fun e!836104 () Bool)

(declare-fun e!836101 () Bool)

(assert (=> b!1492528 (= e!836104 (not e!836101))))

(declare-fun res!1015539 () Bool)

(assert (=> b!1492528 (=> res!1015539 e!836101)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1492528 (= res!1015539 (or (and (= (select (arr!48109 a!2862) index!646) (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48109 a!2862) index!646) (select (arr!48109 a!2862) j!93))) (= (select (arr!48109 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836102 () Bool)

(assert (=> b!1492528 e!836102))

(declare-fun res!1015528 () Bool)

(assert (=> b!1492528 (=> (not res!1015528) (not e!836102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99676 (_ BitVec 32)) Bool)

(assert (=> b!1492528 (= res!1015528 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49929 0))(
  ( (Unit!49930) )
))
(declare-fun lt!650504 () Unit!49929)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49929)

(assert (=> b!1492528 (= lt!650504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492529 () Bool)

(declare-fun res!1015530 () Bool)

(assert (=> b!1492529 (=> (not res!1015530) (not e!836107))))

(declare-datatypes ((List!34688 0))(
  ( (Nil!34685) (Cons!34684 (h!36070 (_ BitVec 64)) (t!49374 List!34688)) )
))
(declare-fun arrayNoDuplicates!0 (array!99676 (_ BitVec 32) List!34688) Bool)

(assert (=> b!1492529 (= res!1015530 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34685))))

(declare-fun b!1492530 () Bool)

(declare-fun e!836108 () Bool)

(assert (=> b!1492530 (= e!836107 e!836108)))

(declare-fun res!1015543 () Bool)

(assert (=> b!1492530 (=> (not res!1015543) (not e!836108))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492530 (= res!1015543 (= (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650503 () array!99676)

(assert (=> b!1492530 (= lt!650503 (array!99677 (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48661 a!2862)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1492531 () Bool)

(assert (=> b!1492531 (= e!836102 (or (= (select (arr!48109 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48109 a!2862) intermediateBeforeIndex!19) (select (arr!48109 a!2862) j!93))))))

(declare-fun b!1492532 () Bool)

(declare-fun e!836105 () Bool)

(assert (=> b!1492532 (= e!836108 e!836105)))

(declare-fun res!1015533 () Bool)

(assert (=> b!1492532 (=> (not res!1015533) (not e!836105))))

(declare-datatypes ((SeekEntryResult!12374 0))(
  ( (MissingZero!12374 (index!51888 (_ BitVec 32))) (Found!12374 (index!51889 (_ BitVec 32))) (Intermediate!12374 (undefined!13186 Bool) (index!51890 (_ BitVec 32)) (x!133475 (_ BitVec 32))) (Undefined!12374) (MissingVacant!12374 (index!51891 (_ BitVec 32))) )
))
(declare-fun lt!650499 () SeekEntryResult!12374)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99676 (_ BitVec 32)) SeekEntryResult!12374)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492532 (= res!1015533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!650499))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492532 (= lt!650499 (Intermediate!12374 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492533 () Bool)

(declare-fun res!1015534 () Bool)

(assert (=> b!1492533 (=> (not res!1015534) (not e!836104))))

(assert (=> b!1492533 (= res!1015534 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492534 () Bool)

(declare-fun res!1015542 () Bool)

(assert (=> b!1492534 (=> (not res!1015542) (not e!836107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492534 (= res!1015542 (validKeyInArray!0 (select (arr!48109 a!2862) i!1006)))))

(declare-fun b!1492535 () Bool)

(declare-fun res!1015540 () Bool)

(assert (=> b!1492535 (=> (not res!1015540) (not e!836104))))

(declare-fun e!836106 () Bool)

(assert (=> b!1492535 (= res!1015540 e!836106)))

(declare-fun c!138031 () Bool)

(assert (=> b!1492535 (= c!138031 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492536 () Bool)

(declare-fun res!1015531 () Bool)

(assert (=> b!1492536 (=> (not res!1015531) (not e!836107))))

(assert (=> b!1492536 (= res!1015531 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48661 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48661 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48661 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492537 () Bool)

(assert (=> b!1492537 (= e!836105 e!836104)))

(declare-fun res!1015537 () Bool)

(assert (=> b!1492537 (=> (not res!1015537) (not e!836104))))

(declare-fun lt!650500 () SeekEntryResult!12374)

(assert (=> b!1492537 (= res!1015537 (= lt!650500 (Intermediate!12374 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650502 () (_ BitVec 64))

(assert (=> b!1492537 (= lt!650500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650502 mask!2687) lt!650502 lt!650503 mask!2687))))

(assert (=> b!1492537 (= lt!650502 (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492538 () Bool)

(declare-fun res!1015536 () Bool)

(assert (=> b!1492538 (=> (not res!1015536) (not e!836102))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99676 (_ BitVec 32)) SeekEntryResult!12374)

(assert (=> b!1492538 (= res!1015536 (= (seekEntryOrOpen!0 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) (Found!12374 j!93)))))

(declare-fun b!1492539 () Bool)

(declare-fun res!1015541 () Bool)

(assert (=> b!1492539 (=> (not res!1015541) (not e!836107))))

(assert (=> b!1492539 (= res!1015541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492540 () Bool)

(declare-fun res!1015535 () Bool)

(assert (=> b!1492540 (=> (not res!1015535) (not e!836105))))

(assert (=> b!1492540 (= res!1015535 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!650499))))

(declare-fun b!1492541 () Bool)

(declare-fun res!1015532 () Bool)

(assert (=> b!1492541 (=> (not res!1015532) (not e!836107))))

(assert (=> b!1492541 (= res!1015532 (validKeyInArray!0 (select (arr!48109 a!2862) j!93)))))

(declare-fun b!1492542 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99676 (_ BitVec 32)) SeekEntryResult!12374)

(assert (=> b!1492542 (= e!836106 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650502 lt!650503 mask!2687) (seekEntryOrOpen!0 lt!650502 lt!650503 mask!2687)))))

(declare-fun b!1492543 () Bool)

(assert (=> b!1492543 (= e!836106 (= lt!650500 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650502 lt!650503 mask!2687)))))

(declare-fun b!1492544 () Bool)

(declare-fun res!1015529 () Bool)

(assert (=> b!1492544 (=> (not res!1015529) (not e!836107))))

(assert (=> b!1492544 (= res!1015529 (and (= (size!48661 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48661 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48661 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492545 () Bool)

(declare-fun lt!650501 () (_ BitVec 32))

(assert (=> b!1492545 (= e!836101 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (and (bvsge lt!650501 #b00000000000000000000000000000000) (bvslt lt!650501 (size!48661 a!2862)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492545 (= lt!650501 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!126968 res!1015538) b!1492544))

(assert (= (and b!1492544 res!1015529) b!1492534))

(assert (= (and b!1492534 res!1015542) b!1492541))

(assert (= (and b!1492541 res!1015532) b!1492539))

(assert (= (and b!1492539 res!1015541) b!1492529))

(assert (= (and b!1492529 res!1015530) b!1492536))

(assert (= (and b!1492536 res!1015531) b!1492530))

(assert (= (and b!1492530 res!1015543) b!1492532))

(assert (= (and b!1492532 res!1015533) b!1492540))

(assert (= (and b!1492540 res!1015535) b!1492537))

(assert (= (and b!1492537 res!1015537) b!1492535))

(assert (= (and b!1492535 c!138031) b!1492543))

(assert (= (and b!1492535 (not c!138031)) b!1492542))

(assert (= (and b!1492535 res!1015540) b!1492533))

(assert (= (and b!1492533 res!1015534) b!1492528))

(assert (= (and b!1492528 res!1015528) b!1492538))

(assert (= (and b!1492538 res!1015536) b!1492531))

(assert (= (and b!1492528 (not res!1015539)) b!1492545))

(declare-fun m!1375929 () Bool)

(assert (=> start!126968 m!1375929))

(declare-fun m!1375931 () Bool)

(assert (=> start!126968 m!1375931))

(declare-fun m!1375933 () Bool)

(assert (=> b!1492540 m!1375933))

(assert (=> b!1492540 m!1375933))

(declare-fun m!1375935 () Bool)

(assert (=> b!1492540 m!1375935))

(declare-fun m!1375937 () Bool)

(assert (=> b!1492545 m!1375937))

(declare-fun m!1375939 () Bool)

(assert (=> b!1492530 m!1375939))

(declare-fun m!1375941 () Bool)

(assert (=> b!1492530 m!1375941))

(declare-fun m!1375943 () Bool)

(assert (=> b!1492542 m!1375943))

(declare-fun m!1375945 () Bool)

(assert (=> b!1492542 m!1375945))

(assert (=> b!1492532 m!1375933))

(assert (=> b!1492532 m!1375933))

(declare-fun m!1375947 () Bool)

(assert (=> b!1492532 m!1375947))

(assert (=> b!1492532 m!1375947))

(assert (=> b!1492532 m!1375933))

(declare-fun m!1375949 () Bool)

(assert (=> b!1492532 m!1375949))

(declare-fun m!1375951 () Bool)

(assert (=> b!1492531 m!1375951))

(assert (=> b!1492531 m!1375933))

(declare-fun m!1375953 () Bool)

(assert (=> b!1492539 m!1375953))

(declare-fun m!1375955 () Bool)

(assert (=> b!1492537 m!1375955))

(assert (=> b!1492537 m!1375955))

(declare-fun m!1375957 () Bool)

(assert (=> b!1492537 m!1375957))

(assert (=> b!1492537 m!1375939))

(declare-fun m!1375959 () Bool)

(assert (=> b!1492537 m!1375959))

(declare-fun m!1375961 () Bool)

(assert (=> b!1492534 m!1375961))

(assert (=> b!1492534 m!1375961))

(declare-fun m!1375963 () Bool)

(assert (=> b!1492534 m!1375963))

(declare-fun m!1375965 () Bool)

(assert (=> b!1492543 m!1375965))

(assert (=> b!1492541 m!1375933))

(assert (=> b!1492541 m!1375933))

(declare-fun m!1375967 () Bool)

(assert (=> b!1492541 m!1375967))

(declare-fun m!1375969 () Bool)

(assert (=> b!1492529 m!1375969))

(assert (=> b!1492538 m!1375933))

(assert (=> b!1492538 m!1375933))

(declare-fun m!1375971 () Bool)

(assert (=> b!1492538 m!1375971))

(declare-fun m!1375973 () Bool)

(assert (=> b!1492528 m!1375973))

(assert (=> b!1492528 m!1375939))

(declare-fun m!1375975 () Bool)

(assert (=> b!1492528 m!1375975))

(declare-fun m!1375977 () Bool)

(assert (=> b!1492528 m!1375977))

(declare-fun m!1375979 () Bool)

(assert (=> b!1492528 m!1375979))

(assert (=> b!1492528 m!1375933))

(check-sat (not b!1492538) (not start!126968) (not b!1492545) (not b!1492543) (not b!1492537) (not b!1492532) (not b!1492529) (not b!1492540) (not b!1492542) (not b!1492528) (not b!1492541) (not b!1492534) (not b!1492539))
(check-sat)
(get-model)

(declare-fun b!1492672 () Bool)

(declare-fun e!836167 () SeekEntryResult!12374)

(declare-fun e!836169 () SeekEntryResult!12374)

(assert (=> b!1492672 (= e!836167 e!836169)))

(declare-fun lt!650546 () (_ BitVec 64))

(declare-fun c!138046 () Bool)

(assert (=> b!1492672 (= c!138046 (or (= lt!650546 (select (arr!48109 a!2862) j!93)) (= (bvadd lt!650546 lt!650546) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156673 () Bool)

(declare-fun e!836171 () Bool)

(assert (=> d!156673 e!836171))

(declare-fun c!138044 () Bool)

(declare-fun lt!650545 () SeekEntryResult!12374)

(get-info :version)

(assert (=> d!156673 (= c!138044 (and ((_ is Intermediate!12374) lt!650545) (undefined!13186 lt!650545)))))

(assert (=> d!156673 (= lt!650545 e!836167)))

(declare-fun c!138045 () Bool)

(assert (=> d!156673 (= c!138045 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156673 (= lt!650546 (select (arr!48109 a!2862) (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687)))))

(assert (=> d!156673 (validMask!0 mask!2687)))

(assert (=> d!156673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!650545)))

(declare-fun b!1492673 () Bool)

(assert (=> b!1492673 (and (bvsge (index!51890 lt!650545) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650545) (size!48661 a!2862)))))

(declare-fun res!1015648 () Bool)

(assert (=> b!1492673 (= res!1015648 (= (select (arr!48109 a!2862) (index!51890 lt!650545)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836168 () Bool)

(assert (=> b!1492673 (=> res!1015648 e!836168)))

(declare-fun b!1492674 () Bool)

(assert (=> b!1492674 (and (bvsge (index!51890 lt!650545) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650545) (size!48661 a!2862)))))

(assert (=> b!1492674 (= e!836168 (= (select (arr!48109 a!2862) (index!51890 lt!650545)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492675 () Bool)

(assert (=> b!1492675 (and (bvsge (index!51890 lt!650545) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650545) (size!48661 a!2862)))))

(declare-fun res!1015646 () Bool)

(assert (=> b!1492675 (= res!1015646 (= (select (arr!48109 a!2862) (index!51890 lt!650545)) (select (arr!48109 a!2862) j!93)))))

(assert (=> b!1492675 (=> res!1015646 e!836168)))

(declare-fun e!836170 () Bool)

(assert (=> b!1492675 (= e!836170 e!836168)))

(declare-fun b!1492676 () Bool)

(assert (=> b!1492676 (= e!836169 (Intermediate!12374 false (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1492677 () Bool)

(assert (=> b!1492677 (= e!836171 e!836170)))

(declare-fun res!1015647 () Bool)

(assert (=> b!1492677 (= res!1015647 (and ((_ is Intermediate!12374) lt!650545) (not (undefined!13186 lt!650545)) (bvslt (x!133475 lt!650545) #b01111111111111111111111111111110) (bvsge (x!133475 lt!650545) #b00000000000000000000000000000000) (bvsge (x!133475 lt!650545) #b00000000000000000000000000000000)))))

(assert (=> b!1492677 (=> (not res!1015647) (not e!836170))))

(declare-fun b!1492678 () Bool)

(assert (=> b!1492678 (= e!836171 (bvsge (x!133475 lt!650545) #b01111111111111111111111111111110))))

(declare-fun b!1492679 () Bool)

(assert (=> b!1492679 (= e!836169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48109 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492680 () Bool)

(assert (=> b!1492680 (= e!836167 (Intermediate!12374 true (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156673 c!138045) b!1492680))

(assert (= (and d!156673 (not c!138045)) b!1492672))

(assert (= (and b!1492672 c!138046) b!1492676))

(assert (= (and b!1492672 (not c!138046)) b!1492679))

(assert (= (and d!156673 c!138044) b!1492678))

(assert (= (and d!156673 (not c!138044)) b!1492677))

(assert (= (and b!1492677 res!1015647) b!1492675))

(assert (= (and b!1492675 (not res!1015646)) b!1492673))

(assert (= (and b!1492673 (not res!1015648)) b!1492674))

(declare-fun m!1376085 () Bool)

(assert (=> b!1492675 m!1376085))

(assert (=> b!1492674 m!1376085))

(assert (=> b!1492679 m!1375947))

(declare-fun m!1376087 () Bool)

(assert (=> b!1492679 m!1376087))

(assert (=> b!1492679 m!1376087))

(assert (=> b!1492679 m!1375933))

(declare-fun m!1376089 () Bool)

(assert (=> b!1492679 m!1376089))

(assert (=> b!1492673 m!1376085))

(assert (=> d!156673 m!1375947))

(declare-fun m!1376091 () Bool)

(assert (=> d!156673 m!1376091))

(assert (=> d!156673 m!1375929))

(assert (=> b!1492532 d!156673))

(declare-fun d!156675 () Bool)

(declare-fun lt!650552 () (_ BitVec 32))

(declare-fun lt!650551 () (_ BitVec 32))

(assert (=> d!156675 (= lt!650552 (bvmul (bvxor lt!650551 (bvlshr lt!650551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156675 (= lt!650551 ((_ extract 31 0) (bvand (bvxor (select (arr!48109 a!2862) j!93) (bvlshr (select (arr!48109 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156675 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015649 (let ((h!36073 ((_ extract 31 0) (bvand (bvxor (select (arr!48109 a!2862) j!93) (bvlshr (select (arr!48109 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133479 (bvmul (bvxor h!36073 (bvlshr h!36073 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133479 (bvlshr x!133479 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015649 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015649 #b00000000000000000000000000000000))))))

(assert (=> d!156675 (= (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) (bvand (bvxor lt!650552 (bvlshr lt!650552 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492532 d!156675))

(declare-fun b!1492681 () Bool)

(declare-fun e!836172 () SeekEntryResult!12374)

(declare-fun e!836174 () SeekEntryResult!12374)

(assert (=> b!1492681 (= e!836172 e!836174)))

(declare-fun c!138049 () Bool)

(declare-fun lt!650554 () (_ BitVec 64))

(assert (=> b!1492681 (= c!138049 (or (= lt!650554 lt!650502) (= (bvadd lt!650554 lt!650554) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156677 () Bool)

(declare-fun e!836176 () Bool)

(assert (=> d!156677 e!836176))

(declare-fun c!138047 () Bool)

(declare-fun lt!650553 () SeekEntryResult!12374)

(assert (=> d!156677 (= c!138047 (and ((_ is Intermediate!12374) lt!650553) (undefined!13186 lt!650553)))))

(assert (=> d!156677 (= lt!650553 e!836172)))

(declare-fun c!138048 () Bool)

(assert (=> d!156677 (= c!138048 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156677 (= lt!650554 (select (arr!48109 lt!650503) index!646))))

(assert (=> d!156677 (validMask!0 mask!2687)))

(assert (=> d!156677 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650502 lt!650503 mask!2687) lt!650553)))

(declare-fun b!1492682 () Bool)

(assert (=> b!1492682 (and (bvsge (index!51890 lt!650553) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650553) (size!48661 lt!650503)))))

(declare-fun res!1015652 () Bool)

(assert (=> b!1492682 (= res!1015652 (= (select (arr!48109 lt!650503) (index!51890 lt!650553)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836173 () Bool)

(assert (=> b!1492682 (=> res!1015652 e!836173)))

(declare-fun b!1492683 () Bool)

(assert (=> b!1492683 (and (bvsge (index!51890 lt!650553) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650553) (size!48661 lt!650503)))))

(assert (=> b!1492683 (= e!836173 (= (select (arr!48109 lt!650503) (index!51890 lt!650553)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492684 () Bool)

(assert (=> b!1492684 (and (bvsge (index!51890 lt!650553) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650553) (size!48661 lt!650503)))))

(declare-fun res!1015650 () Bool)

(assert (=> b!1492684 (= res!1015650 (= (select (arr!48109 lt!650503) (index!51890 lt!650553)) lt!650502))))

(assert (=> b!1492684 (=> res!1015650 e!836173)))

(declare-fun e!836175 () Bool)

(assert (=> b!1492684 (= e!836175 e!836173)))

(declare-fun b!1492685 () Bool)

(assert (=> b!1492685 (= e!836174 (Intermediate!12374 false index!646 x!665))))

(declare-fun b!1492686 () Bool)

(assert (=> b!1492686 (= e!836176 e!836175)))

(declare-fun res!1015651 () Bool)

(assert (=> b!1492686 (= res!1015651 (and ((_ is Intermediate!12374) lt!650553) (not (undefined!13186 lt!650553)) (bvslt (x!133475 lt!650553) #b01111111111111111111111111111110) (bvsge (x!133475 lt!650553) #b00000000000000000000000000000000) (bvsge (x!133475 lt!650553) x!665)))))

(assert (=> b!1492686 (=> (not res!1015651) (not e!836175))))

(declare-fun b!1492687 () Bool)

(assert (=> b!1492687 (= e!836176 (bvsge (x!133475 lt!650553) #b01111111111111111111111111111110))))

(declare-fun b!1492688 () Bool)

(assert (=> b!1492688 (= e!836174 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650502 lt!650503 mask!2687))))

(declare-fun b!1492689 () Bool)

(assert (=> b!1492689 (= e!836172 (Intermediate!12374 true index!646 x!665))))

(assert (= (and d!156677 c!138048) b!1492689))

(assert (= (and d!156677 (not c!138048)) b!1492681))

(assert (= (and b!1492681 c!138049) b!1492685))

(assert (= (and b!1492681 (not c!138049)) b!1492688))

(assert (= (and d!156677 c!138047) b!1492687))

(assert (= (and d!156677 (not c!138047)) b!1492686))

(assert (= (and b!1492686 res!1015651) b!1492684))

(assert (= (and b!1492684 (not res!1015650)) b!1492682))

(assert (= (and b!1492682 (not res!1015652)) b!1492683))

(declare-fun m!1376093 () Bool)

(assert (=> b!1492684 m!1376093))

(assert (=> b!1492683 m!1376093))

(assert (=> b!1492688 m!1375937))

(assert (=> b!1492688 m!1375937))

(declare-fun m!1376095 () Bool)

(assert (=> b!1492688 m!1376095))

(assert (=> b!1492682 m!1376093))

(declare-fun m!1376097 () Bool)

(assert (=> d!156677 m!1376097))

(assert (=> d!156677 m!1375929))

(assert (=> b!1492543 d!156677))

(declare-fun d!156679 () Bool)

(assert (=> d!156679 (= (validKeyInArray!0 (select (arr!48109 a!2862) i!1006)) (and (not (= (select (arr!48109 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48109 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492534 d!156679))

(declare-fun d!156681 () Bool)

(declare-fun lt!650557 () (_ BitVec 32))

(assert (=> d!156681 (and (bvsge lt!650557 #b00000000000000000000000000000000) (bvslt lt!650557 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156681 (= lt!650557 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156681 (validMask!0 mask!2687)))

(assert (=> d!156681 (= (nextIndex!0 index!646 x!665 mask!2687) lt!650557)))

(declare-fun bs!42829 () Bool)

(assert (= bs!42829 d!156681))

(declare-fun m!1376099 () Bool)

(assert (=> bs!42829 m!1376099))

(assert (=> bs!42829 m!1375929))

(assert (=> b!1492545 d!156681))

(declare-fun d!156683 () Bool)

(assert (=> d!156683 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126968 d!156683))

(declare-fun d!156685 () Bool)

(assert (=> d!156685 (= (array_inv!37342 a!2862) (bvsge (size!48661 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126968 d!156685))

(declare-fun b!1492690 () Bool)

(declare-fun e!836177 () SeekEntryResult!12374)

(declare-fun e!836179 () SeekEntryResult!12374)

(assert (=> b!1492690 (= e!836177 e!836179)))

(declare-fun c!138052 () Bool)

(declare-fun lt!650559 () (_ BitVec 64))

(assert (=> b!1492690 (= c!138052 (or (= lt!650559 lt!650502) (= (bvadd lt!650559 lt!650559) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156687 () Bool)

(declare-fun e!836181 () Bool)

(assert (=> d!156687 e!836181))

(declare-fun c!138050 () Bool)

(declare-fun lt!650558 () SeekEntryResult!12374)

(assert (=> d!156687 (= c!138050 (and ((_ is Intermediate!12374) lt!650558) (undefined!13186 lt!650558)))))

(assert (=> d!156687 (= lt!650558 e!836177)))

(declare-fun c!138051 () Bool)

(assert (=> d!156687 (= c!138051 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156687 (= lt!650559 (select (arr!48109 lt!650503) (toIndex!0 lt!650502 mask!2687)))))

(assert (=> d!156687 (validMask!0 mask!2687)))

(assert (=> d!156687 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650502 mask!2687) lt!650502 lt!650503 mask!2687) lt!650558)))

(declare-fun b!1492691 () Bool)

(assert (=> b!1492691 (and (bvsge (index!51890 lt!650558) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650558) (size!48661 lt!650503)))))

(declare-fun res!1015655 () Bool)

(assert (=> b!1492691 (= res!1015655 (= (select (arr!48109 lt!650503) (index!51890 lt!650558)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836178 () Bool)

(assert (=> b!1492691 (=> res!1015655 e!836178)))

(declare-fun b!1492692 () Bool)

(assert (=> b!1492692 (and (bvsge (index!51890 lt!650558) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650558) (size!48661 lt!650503)))))

(assert (=> b!1492692 (= e!836178 (= (select (arr!48109 lt!650503) (index!51890 lt!650558)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492693 () Bool)

(assert (=> b!1492693 (and (bvsge (index!51890 lt!650558) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650558) (size!48661 lt!650503)))))

(declare-fun res!1015653 () Bool)

(assert (=> b!1492693 (= res!1015653 (= (select (arr!48109 lt!650503) (index!51890 lt!650558)) lt!650502))))

(assert (=> b!1492693 (=> res!1015653 e!836178)))

(declare-fun e!836180 () Bool)

(assert (=> b!1492693 (= e!836180 e!836178)))

(declare-fun b!1492694 () Bool)

(assert (=> b!1492694 (= e!836179 (Intermediate!12374 false (toIndex!0 lt!650502 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1492695 () Bool)

(assert (=> b!1492695 (= e!836181 e!836180)))

(declare-fun res!1015654 () Bool)

(assert (=> b!1492695 (= res!1015654 (and ((_ is Intermediate!12374) lt!650558) (not (undefined!13186 lt!650558)) (bvslt (x!133475 lt!650558) #b01111111111111111111111111111110) (bvsge (x!133475 lt!650558) #b00000000000000000000000000000000) (bvsge (x!133475 lt!650558) #b00000000000000000000000000000000)))))

(assert (=> b!1492695 (=> (not res!1015654) (not e!836180))))

(declare-fun b!1492696 () Bool)

(assert (=> b!1492696 (= e!836181 (bvsge (x!133475 lt!650558) #b01111111111111111111111111111110))))

(declare-fun b!1492697 () Bool)

(assert (=> b!1492697 (= e!836179 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!650502 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!650502 lt!650503 mask!2687))))

(declare-fun b!1492698 () Bool)

(assert (=> b!1492698 (= e!836177 (Intermediate!12374 true (toIndex!0 lt!650502 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156687 c!138051) b!1492698))

(assert (= (and d!156687 (not c!138051)) b!1492690))

(assert (= (and b!1492690 c!138052) b!1492694))

(assert (= (and b!1492690 (not c!138052)) b!1492697))

(assert (= (and d!156687 c!138050) b!1492696))

(assert (= (and d!156687 (not c!138050)) b!1492695))

(assert (= (and b!1492695 res!1015654) b!1492693))

(assert (= (and b!1492693 (not res!1015653)) b!1492691))

(assert (= (and b!1492691 (not res!1015655)) b!1492692))

(declare-fun m!1376101 () Bool)

(assert (=> b!1492693 m!1376101))

(assert (=> b!1492692 m!1376101))

(assert (=> b!1492697 m!1375955))

(declare-fun m!1376103 () Bool)

(assert (=> b!1492697 m!1376103))

(assert (=> b!1492697 m!1376103))

(declare-fun m!1376105 () Bool)

(assert (=> b!1492697 m!1376105))

(assert (=> b!1492691 m!1376101))

(assert (=> d!156687 m!1375955))

(declare-fun m!1376107 () Bool)

(assert (=> d!156687 m!1376107))

(assert (=> d!156687 m!1375929))

(assert (=> b!1492537 d!156687))

(declare-fun d!156689 () Bool)

(declare-fun lt!650561 () (_ BitVec 32))

(declare-fun lt!650560 () (_ BitVec 32))

(assert (=> d!156689 (= lt!650561 (bvmul (bvxor lt!650560 (bvlshr lt!650560 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156689 (= lt!650560 ((_ extract 31 0) (bvand (bvxor lt!650502 (bvlshr lt!650502 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156689 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015649 (let ((h!36073 ((_ extract 31 0) (bvand (bvxor lt!650502 (bvlshr lt!650502 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133479 (bvmul (bvxor h!36073 (bvlshr h!36073 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133479 (bvlshr x!133479 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015649 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015649 #b00000000000000000000000000000000))))))

(assert (=> d!156689 (= (toIndex!0 lt!650502 mask!2687) (bvand (bvxor lt!650561 (bvlshr lt!650561 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492537 d!156689))

(declare-fun b!1492738 () Bool)

(declare-fun e!836207 () SeekEntryResult!12374)

(declare-fun lt!650572 () SeekEntryResult!12374)

(assert (=> b!1492738 (= e!836207 (MissingZero!12374 (index!51890 lt!650572)))))

(declare-fun b!1492739 () Bool)

(assert (=> b!1492739 (= e!836207 (seekKeyOrZeroReturnVacant!0 (x!133475 lt!650572) (index!51890 lt!650572) (index!51890 lt!650572) (select (arr!48109 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492740 () Bool)

(declare-fun e!836208 () SeekEntryResult!12374)

(assert (=> b!1492740 (= e!836208 Undefined!12374)))

(declare-fun b!1492741 () Bool)

(declare-fun c!138068 () Bool)

(declare-fun lt!650574 () (_ BitVec 64))

(assert (=> b!1492741 (= c!138068 (= lt!650574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836206 () SeekEntryResult!12374)

(assert (=> b!1492741 (= e!836206 e!836207)))

(declare-fun b!1492742 () Bool)

(assert (=> b!1492742 (= e!836208 e!836206)))

(assert (=> b!1492742 (= lt!650574 (select (arr!48109 a!2862) (index!51890 lt!650572)))))

(declare-fun c!138070 () Bool)

(assert (=> b!1492742 (= c!138070 (= lt!650574 (select (arr!48109 a!2862) j!93)))))

(declare-fun d!156691 () Bool)

(declare-fun lt!650573 () SeekEntryResult!12374)

(assert (=> d!156691 (and (or ((_ is Undefined!12374) lt!650573) (not ((_ is Found!12374) lt!650573)) (and (bvsge (index!51889 lt!650573) #b00000000000000000000000000000000) (bvslt (index!51889 lt!650573) (size!48661 a!2862)))) (or ((_ is Undefined!12374) lt!650573) ((_ is Found!12374) lt!650573) (not ((_ is MissingZero!12374) lt!650573)) (and (bvsge (index!51888 lt!650573) #b00000000000000000000000000000000) (bvslt (index!51888 lt!650573) (size!48661 a!2862)))) (or ((_ is Undefined!12374) lt!650573) ((_ is Found!12374) lt!650573) ((_ is MissingZero!12374) lt!650573) (not ((_ is MissingVacant!12374) lt!650573)) (and (bvsge (index!51891 lt!650573) #b00000000000000000000000000000000) (bvslt (index!51891 lt!650573) (size!48661 a!2862)))) (or ((_ is Undefined!12374) lt!650573) (ite ((_ is Found!12374) lt!650573) (= (select (arr!48109 a!2862) (index!51889 lt!650573)) (select (arr!48109 a!2862) j!93)) (ite ((_ is MissingZero!12374) lt!650573) (= (select (arr!48109 a!2862) (index!51888 lt!650573)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12374) lt!650573) (= (select (arr!48109 a!2862) (index!51891 lt!650573)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156691 (= lt!650573 e!836208)))

(declare-fun c!138069 () Bool)

(assert (=> d!156691 (= c!138069 (and ((_ is Intermediate!12374) lt!650572) (undefined!13186 lt!650572)))))

(assert (=> d!156691 (= lt!650572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) (select (arr!48109 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156691 (validMask!0 mask!2687)))

(assert (=> d!156691 (= (seekEntryOrOpen!0 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!650573)))

(declare-fun b!1492743 () Bool)

(assert (=> b!1492743 (= e!836206 (Found!12374 (index!51890 lt!650572)))))

(assert (= (and d!156691 c!138069) b!1492740))

(assert (= (and d!156691 (not c!138069)) b!1492742))

(assert (= (and b!1492742 c!138070) b!1492743))

(assert (= (and b!1492742 (not c!138070)) b!1492741))

(assert (= (and b!1492741 c!138068) b!1492738))

(assert (= (and b!1492741 (not c!138068)) b!1492739))

(assert (=> b!1492739 m!1375933))

(declare-fun m!1376117 () Bool)

(assert (=> b!1492739 m!1376117))

(declare-fun m!1376119 () Bool)

(assert (=> b!1492742 m!1376119))

(declare-fun m!1376121 () Bool)

(assert (=> d!156691 m!1376121))

(assert (=> d!156691 m!1375929))

(declare-fun m!1376123 () Bool)

(assert (=> d!156691 m!1376123))

(assert (=> d!156691 m!1375947))

(assert (=> d!156691 m!1375933))

(assert (=> d!156691 m!1375949))

(assert (=> d!156691 m!1375933))

(assert (=> d!156691 m!1375947))

(declare-fun m!1376125 () Bool)

(assert (=> d!156691 m!1376125))

(assert (=> b!1492538 d!156691))

(declare-fun d!156699 () Bool)

(declare-fun res!1015673 () Bool)

(declare-fun e!836225 () Bool)

(assert (=> d!156699 (=> res!1015673 e!836225)))

(assert (=> d!156699 (= res!1015673 (bvsge j!93 (size!48661 a!2862)))))

(assert (=> d!156699 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!836225)))

(declare-fun b!1492767 () Bool)

(declare-fun e!836229 () Bool)

(assert (=> b!1492767 (= e!836225 e!836229)))

(declare-fun c!138079 () Bool)

(assert (=> b!1492767 (= c!138079 (validKeyInArray!0 (select (arr!48109 a!2862) j!93)))))

(declare-fun b!1492769 () Bool)

(declare-fun call!67931 () Bool)

(assert (=> b!1492769 (= e!836229 call!67931)))

(declare-fun b!1492771 () Bool)

(declare-fun e!836228 () Bool)

(assert (=> b!1492771 (= e!836228 call!67931)))

(declare-fun b!1492772 () Bool)

(assert (=> b!1492772 (= e!836229 e!836228)))

(declare-fun lt!650596 () (_ BitVec 64))

(assert (=> b!1492772 (= lt!650596 (select (arr!48109 a!2862) j!93))))

(declare-fun lt!650594 () Unit!49929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99676 (_ BitVec 64) (_ BitVec 32)) Unit!49929)

(assert (=> b!1492772 (= lt!650594 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650596 j!93))))

(declare-fun arrayContainsKey!0 (array!99676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1492772 (arrayContainsKey!0 a!2862 lt!650596 #b00000000000000000000000000000000)))

(declare-fun lt!650593 () Unit!49929)

(assert (=> b!1492772 (= lt!650593 lt!650594)))

(declare-fun res!1015675 () Bool)

(assert (=> b!1492772 (= res!1015675 (= (seekEntryOrOpen!0 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) (Found!12374 j!93)))))

(assert (=> b!1492772 (=> (not res!1015675) (not e!836228))))

(declare-fun bm!67928 () Bool)

(assert (=> bm!67928 (= call!67931 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156699 (not res!1015673)) b!1492767))

(assert (= (and b!1492767 c!138079) b!1492772))

(assert (= (and b!1492767 (not c!138079)) b!1492769))

(assert (= (and b!1492772 res!1015675) b!1492771))

(assert (= (or b!1492771 b!1492769) bm!67928))

(assert (=> b!1492767 m!1375933))

(assert (=> b!1492767 m!1375933))

(assert (=> b!1492767 m!1375967))

(assert (=> b!1492772 m!1375933))

(declare-fun m!1376141 () Bool)

(assert (=> b!1492772 m!1376141))

(declare-fun m!1376143 () Bool)

(assert (=> b!1492772 m!1376143))

(assert (=> b!1492772 m!1375933))

(assert (=> b!1492772 m!1375971))

(declare-fun m!1376147 () Bool)

(assert (=> bm!67928 m!1376147))

(assert (=> b!1492528 d!156699))

(declare-fun d!156707 () Bool)

(assert (=> d!156707 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!650603 () Unit!49929)

(declare-fun choose!38 (array!99676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49929)

(assert (=> d!156707 (= lt!650603 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156707 (validMask!0 mask!2687)))

(assert (=> d!156707 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!650603)))

(declare-fun bs!42832 () Bool)

(assert (= bs!42832 d!156707))

(assert (=> bs!42832 m!1375979))

(declare-fun m!1376151 () Bool)

(assert (=> bs!42832 m!1376151))

(assert (=> bs!42832 m!1375929))

(assert (=> b!1492528 d!156707))

(declare-fun d!156711 () Bool)

(declare-fun res!1015677 () Bool)

(declare-fun e!836230 () Bool)

(assert (=> d!156711 (=> res!1015677 e!836230)))

(assert (=> d!156711 (= res!1015677 (bvsge #b00000000000000000000000000000000 (size!48661 a!2862)))))

(assert (=> d!156711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!836230)))

(declare-fun b!1492774 () Bool)

(declare-fun e!836232 () Bool)

(assert (=> b!1492774 (= e!836230 e!836232)))

(declare-fun c!138080 () Bool)

(assert (=> b!1492774 (= c!138080 (validKeyInArray!0 (select (arr!48109 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492775 () Bool)

(declare-fun call!67932 () Bool)

(assert (=> b!1492775 (= e!836232 call!67932)))

(declare-fun b!1492776 () Bool)

(declare-fun e!836231 () Bool)

(assert (=> b!1492776 (= e!836231 call!67932)))

(declare-fun b!1492777 () Bool)

(assert (=> b!1492777 (= e!836232 e!836231)))

(declare-fun lt!650606 () (_ BitVec 64))

(assert (=> b!1492777 (= lt!650606 (select (arr!48109 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!650605 () Unit!49929)

(assert (=> b!1492777 (= lt!650605 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650606 #b00000000000000000000000000000000))))

(assert (=> b!1492777 (arrayContainsKey!0 a!2862 lt!650606 #b00000000000000000000000000000000)))

(declare-fun lt!650604 () Unit!49929)

(assert (=> b!1492777 (= lt!650604 lt!650605)))

(declare-fun res!1015678 () Bool)

(assert (=> b!1492777 (= res!1015678 (= (seekEntryOrOpen!0 (select (arr!48109 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12374 #b00000000000000000000000000000000)))))

(assert (=> b!1492777 (=> (not res!1015678) (not e!836231))))

(declare-fun bm!67929 () Bool)

(assert (=> bm!67929 (= call!67932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156711 (not res!1015677)) b!1492774))

(assert (= (and b!1492774 c!138080) b!1492777))

(assert (= (and b!1492774 (not c!138080)) b!1492775))

(assert (= (and b!1492777 res!1015678) b!1492776))

(assert (= (or b!1492776 b!1492775) bm!67929))

(declare-fun m!1376153 () Bool)

(assert (=> b!1492774 m!1376153))

(assert (=> b!1492774 m!1376153))

(declare-fun m!1376155 () Bool)

(assert (=> b!1492774 m!1376155))

(assert (=> b!1492777 m!1376153))

(declare-fun m!1376157 () Bool)

(assert (=> b!1492777 m!1376157))

(declare-fun m!1376159 () Bool)

(assert (=> b!1492777 m!1376159))

(assert (=> b!1492777 m!1376153))

(declare-fun m!1376161 () Bool)

(assert (=> b!1492777 m!1376161))

(declare-fun m!1376163 () Bool)

(assert (=> bm!67929 m!1376163))

(assert (=> b!1492539 d!156711))

(declare-fun b!1492778 () Bool)

(declare-fun e!836233 () SeekEntryResult!12374)

(declare-fun e!836235 () SeekEntryResult!12374)

(assert (=> b!1492778 (= e!836233 e!836235)))

(declare-fun c!138083 () Bool)

(declare-fun lt!650608 () (_ BitVec 64))

(assert (=> b!1492778 (= c!138083 (or (= lt!650608 (select (arr!48109 a!2862) j!93)) (= (bvadd lt!650608 lt!650608) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156713 () Bool)

(declare-fun e!836237 () Bool)

(assert (=> d!156713 e!836237))

(declare-fun c!138081 () Bool)

(declare-fun lt!650607 () SeekEntryResult!12374)

(assert (=> d!156713 (= c!138081 (and ((_ is Intermediate!12374) lt!650607) (undefined!13186 lt!650607)))))

(assert (=> d!156713 (= lt!650607 e!836233)))

(declare-fun c!138082 () Bool)

(assert (=> d!156713 (= c!138082 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156713 (= lt!650608 (select (arr!48109 a!2862) index!646))))

(assert (=> d!156713 (validMask!0 mask!2687)))

(assert (=> d!156713 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!650607)))

(declare-fun b!1492779 () Bool)

(assert (=> b!1492779 (and (bvsge (index!51890 lt!650607) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650607) (size!48661 a!2862)))))

(declare-fun res!1015681 () Bool)

(assert (=> b!1492779 (= res!1015681 (= (select (arr!48109 a!2862) (index!51890 lt!650607)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836234 () Bool)

(assert (=> b!1492779 (=> res!1015681 e!836234)))

(declare-fun b!1492780 () Bool)

(assert (=> b!1492780 (and (bvsge (index!51890 lt!650607) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650607) (size!48661 a!2862)))))

(assert (=> b!1492780 (= e!836234 (= (select (arr!48109 a!2862) (index!51890 lt!650607)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492781 () Bool)

(assert (=> b!1492781 (and (bvsge (index!51890 lt!650607) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650607) (size!48661 a!2862)))))

(declare-fun res!1015679 () Bool)

(assert (=> b!1492781 (= res!1015679 (= (select (arr!48109 a!2862) (index!51890 lt!650607)) (select (arr!48109 a!2862) j!93)))))

(assert (=> b!1492781 (=> res!1015679 e!836234)))

(declare-fun e!836236 () Bool)

(assert (=> b!1492781 (= e!836236 e!836234)))

(declare-fun b!1492782 () Bool)

(assert (=> b!1492782 (= e!836235 (Intermediate!12374 false index!646 x!665))))

(declare-fun b!1492783 () Bool)

(assert (=> b!1492783 (= e!836237 e!836236)))

(declare-fun res!1015680 () Bool)

(assert (=> b!1492783 (= res!1015680 (and ((_ is Intermediate!12374) lt!650607) (not (undefined!13186 lt!650607)) (bvslt (x!133475 lt!650607) #b01111111111111111111111111111110) (bvsge (x!133475 lt!650607) #b00000000000000000000000000000000) (bvsge (x!133475 lt!650607) x!665)))))

(assert (=> b!1492783 (=> (not res!1015680) (not e!836236))))

(declare-fun b!1492784 () Bool)

(assert (=> b!1492784 (= e!836237 (bvsge (x!133475 lt!650607) #b01111111111111111111111111111110))))

(declare-fun b!1492785 () Bool)

(assert (=> b!1492785 (= e!836235 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48109 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492786 () Bool)

(assert (=> b!1492786 (= e!836233 (Intermediate!12374 true index!646 x!665))))

(assert (= (and d!156713 c!138082) b!1492786))

(assert (= (and d!156713 (not c!138082)) b!1492778))

(assert (= (and b!1492778 c!138083) b!1492782))

(assert (= (and b!1492778 (not c!138083)) b!1492785))

(assert (= (and d!156713 c!138081) b!1492784))

(assert (= (and d!156713 (not c!138081)) b!1492783))

(assert (= (and b!1492783 res!1015680) b!1492781))

(assert (= (and b!1492781 (not res!1015679)) b!1492779))

(assert (= (and b!1492779 (not res!1015681)) b!1492780))

(declare-fun m!1376165 () Bool)

(assert (=> b!1492781 m!1376165))

(assert (=> b!1492780 m!1376165))

(assert (=> b!1492785 m!1375937))

(assert (=> b!1492785 m!1375937))

(assert (=> b!1492785 m!1375933))

(declare-fun m!1376167 () Bool)

(assert (=> b!1492785 m!1376167))

(assert (=> b!1492779 m!1376165))

(assert (=> d!156713 m!1375977))

(assert (=> d!156713 m!1375929))

(assert (=> b!1492540 d!156713))

(declare-fun b!1492815 () Bool)

(declare-fun e!836258 () Bool)

(declare-fun contains!9894 (List!34688 (_ BitVec 64)) Bool)

(assert (=> b!1492815 (= e!836258 (contains!9894 Nil!34685 (select (arr!48109 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156715 () Bool)

(declare-fun res!1015688 () Bool)

(declare-fun e!836256 () Bool)

(assert (=> d!156715 (=> res!1015688 e!836256)))

(assert (=> d!156715 (= res!1015688 (bvsge #b00000000000000000000000000000000 (size!48661 a!2862)))))

(assert (=> d!156715 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34685) e!836256)))

(declare-fun b!1492816 () Bool)

(declare-fun e!836257 () Bool)

(assert (=> b!1492816 (= e!836256 e!836257)))

(declare-fun res!1015689 () Bool)

(assert (=> b!1492816 (=> (not res!1015689) (not e!836257))))

(assert (=> b!1492816 (= res!1015689 (not e!836258))))

(declare-fun res!1015690 () Bool)

(assert (=> b!1492816 (=> (not res!1015690) (not e!836258))))

(assert (=> b!1492816 (= res!1015690 (validKeyInArray!0 (select (arr!48109 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492817 () Bool)

(declare-fun e!836255 () Bool)

(declare-fun call!67935 () Bool)

(assert (=> b!1492817 (= e!836255 call!67935)))

(declare-fun bm!67932 () Bool)

(declare-fun c!138095 () Bool)

(assert (=> bm!67932 (= call!67935 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138095 (Cons!34684 (select (arr!48109 a!2862) #b00000000000000000000000000000000) Nil!34685) Nil!34685)))))

(declare-fun b!1492818 () Bool)

(assert (=> b!1492818 (= e!836257 e!836255)))

(assert (=> b!1492818 (= c!138095 (validKeyInArray!0 (select (arr!48109 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492819 () Bool)

(assert (=> b!1492819 (= e!836255 call!67935)))

(assert (= (and d!156715 (not res!1015688)) b!1492816))

(assert (= (and b!1492816 res!1015690) b!1492815))

(assert (= (and b!1492816 res!1015689) b!1492818))

(assert (= (and b!1492818 c!138095) b!1492819))

(assert (= (and b!1492818 (not c!138095)) b!1492817))

(assert (= (or b!1492819 b!1492817) bm!67932))

(assert (=> b!1492815 m!1376153))

(assert (=> b!1492815 m!1376153))

(declare-fun m!1376179 () Bool)

(assert (=> b!1492815 m!1376179))

(assert (=> b!1492816 m!1376153))

(assert (=> b!1492816 m!1376153))

(assert (=> b!1492816 m!1376155))

(assert (=> bm!67932 m!1376153))

(declare-fun m!1376181 () Bool)

(assert (=> bm!67932 m!1376181))

(assert (=> b!1492818 m!1376153))

(assert (=> b!1492818 m!1376153))

(assert (=> b!1492818 m!1376155))

(assert (=> b!1492529 d!156715))

(declare-fun d!156721 () Bool)

(assert (=> d!156721 (= (validKeyInArray!0 (select (arr!48109 a!2862) j!93)) (and (not (= (select (arr!48109 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48109 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492541 d!156721))

(declare-fun b!1492871 () Bool)

(declare-fun e!836290 () SeekEntryResult!12374)

(assert (=> b!1492871 (= e!836290 (Found!12374 index!646))))

(declare-fun lt!650645 () SeekEntryResult!12374)

(declare-fun d!156723 () Bool)

(assert (=> d!156723 (and (or ((_ is Undefined!12374) lt!650645) (not ((_ is Found!12374) lt!650645)) (and (bvsge (index!51889 lt!650645) #b00000000000000000000000000000000) (bvslt (index!51889 lt!650645) (size!48661 lt!650503)))) (or ((_ is Undefined!12374) lt!650645) ((_ is Found!12374) lt!650645) (not ((_ is MissingVacant!12374) lt!650645)) (not (= (index!51891 lt!650645) intermediateAfterIndex!19)) (and (bvsge (index!51891 lt!650645) #b00000000000000000000000000000000) (bvslt (index!51891 lt!650645) (size!48661 lt!650503)))) (or ((_ is Undefined!12374) lt!650645) (ite ((_ is Found!12374) lt!650645) (= (select (arr!48109 lt!650503) (index!51889 lt!650645)) lt!650502) (and ((_ is MissingVacant!12374) lt!650645) (= (index!51891 lt!650645) intermediateAfterIndex!19) (= (select (arr!48109 lt!650503) (index!51891 lt!650645)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!836291 () SeekEntryResult!12374)

(assert (=> d!156723 (= lt!650645 e!836291)))

(declare-fun c!138116 () Bool)

(assert (=> d!156723 (= c!138116 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!650644 () (_ BitVec 64))

(assert (=> d!156723 (= lt!650644 (select (arr!48109 lt!650503) index!646))))

(assert (=> d!156723 (validMask!0 mask!2687)))

(assert (=> d!156723 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650502 lt!650503 mask!2687) lt!650645)))

(declare-fun b!1492872 () Bool)

(declare-fun c!138114 () Bool)

(assert (=> b!1492872 (= c!138114 (= lt!650644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836289 () SeekEntryResult!12374)

(assert (=> b!1492872 (= e!836290 e!836289)))

(declare-fun b!1492873 () Bool)

(assert (=> b!1492873 (= e!836289 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650502 lt!650503 mask!2687))))

(declare-fun b!1492874 () Bool)

(assert (=> b!1492874 (= e!836291 Undefined!12374)))

(declare-fun b!1492875 () Bool)

(assert (=> b!1492875 (= e!836289 (MissingVacant!12374 intermediateAfterIndex!19))))

(declare-fun b!1492876 () Bool)

(assert (=> b!1492876 (= e!836291 e!836290)))

(declare-fun c!138115 () Bool)

(assert (=> b!1492876 (= c!138115 (= lt!650644 lt!650502))))

(assert (= (and d!156723 c!138116) b!1492874))

(assert (= (and d!156723 (not c!138116)) b!1492876))

(assert (= (and b!1492876 c!138115) b!1492871))

(assert (= (and b!1492876 (not c!138115)) b!1492872))

(assert (= (and b!1492872 c!138114) b!1492875))

(assert (= (and b!1492872 (not c!138114)) b!1492873))

(declare-fun m!1376199 () Bool)

(assert (=> d!156723 m!1376199))

(declare-fun m!1376201 () Bool)

(assert (=> d!156723 m!1376201))

(assert (=> d!156723 m!1376097))

(assert (=> d!156723 m!1375929))

(assert (=> b!1492873 m!1375937))

(assert (=> b!1492873 m!1375937))

(declare-fun m!1376203 () Bool)

(assert (=> b!1492873 m!1376203))

(assert (=> b!1492542 d!156723))

(declare-fun b!1492877 () Bool)

(declare-fun e!836293 () SeekEntryResult!12374)

(declare-fun lt!650648 () SeekEntryResult!12374)

(assert (=> b!1492877 (= e!836293 (MissingZero!12374 (index!51890 lt!650648)))))

(declare-fun b!1492878 () Bool)

(assert (=> b!1492878 (= e!836293 (seekKeyOrZeroReturnVacant!0 (x!133475 lt!650648) (index!51890 lt!650648) (index!51890 lt!650648) lt!650502 lt!650503 mask!2687))))

(declare-fun b!1492879 () Bool)

(declare-fun e!836294 () SeekEntryResult!12374)

(assert (=> b!1492879 (= e!836294 Undefined!12374)))

(declare-fun b!1492880 () Bool)

(declare-fun c!138117 () Bool)

(declare-fun lt!650650 () (_ BitVec 64))

(assert (=> b!1492880 (= c!138117 (= lt!650650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836292 () SeekEntryResult!12374)

(assert (=> b!1492880 (= e!836292 e!836293)))

(declare-fun b!1492881 () Bool)

(assert (=> b!1492881 (= e!836294 e!836292)))

(assert (=> b!1492881 (= lt!650650 (select (arr!48109 lt!650503) (index!51890 lt!650648)))))

(declare-fun c!138119 () Bool)

(assert (=> b!1492881 (= c!138119 (= lt!650650 lt!650502))))

(declare-fun d!156731 () Bool)

(declare-fun lt!650649 () SeekEntryResult!12374)

(assert (=> d!156731 (and (or ((_ is Undefined!12374) lt!650649) (not ((_ is Found!12374) lt!650649)) (and (bvsge (index!51889 lt!650649) #b00000000000000000000000000000000) (bvslt (index!51889 lt!650649) (size!48661 lt!650503)))) (or ((_ is Undefined!12374) lt!650649) ((_ is Found!12374) lt!650649) (not ((_ is MissingZero!12374) lt!650649)) (and (bvsge (index!51888 lt!650649) #b00000000000000000000000000000000) (bvslt (index!51888 lt!650649) (size!48661 lt!650503)))) (or ((_ is Undefined!12374) lt!650649) ((_ is Found!12374) lt!650649) ((_ is MissingZero!12374) lt!650649) (not ((_ is MissingVacant!12374) lt!650649)) (and (bvsge (index!51891 lt!650649) #b00000000000000000000000000000000) (bvslt (index!51891 lt!650649) (size!48661 lt!650503)))) (or ((_ is Undefined!12374) lt!650649) (ite ((_ is Found!12374) lt!650649) (= (select (arr!48109 lt!650503) (index!51889 lt!650649)) lt!650502) (ite ((_ is MissingZero!12374) lt!650649) (= (select (arr!48109 lt!650503) (index!51888 lt!650649)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12374) lt!650649) (= (select (arr!48109 lt!650503) (index!51891 lt!650649)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156731 (= lt!650649 e!836294)))

(declare-fun c!138118 () Bool)

(assert (=> d!156731 (= c!138118 (and ((_ is Intermediate!12374) lt!650648) (undefined!13186 lt!650648)))))

(assert (=> d!156731 (= lt!650648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650502 mask!2687) lt!650502 lt!650503 mask!2687))))

(assert (=> d!156731 (validMask!0 mask!2687)))

(assert (=> d!156731 (= (seekEntryOrOpen!0 lt!650502 lt!650503 mask!2687) lt!650649)))

(declare-fun b!1492882 () Bool)

(assert (=> b!1492882 (= e!836292 (Found!12374 (index!51890 lt!650648)))))

(assert (= (and d!156731 c!138118) b!1492879))

(assert (= (and d!156731 (not c!138118)) b!1492881))

(assert (= (and b!1492881 c!138119) b!1492882))

(assert (= (and b!1492881 (not c!138119)) b!1492880))

(assert (= (and b!1492880 c!138117) b!1492877))

(assert (= (and b!1492880 (not c!138117)) b!1492878))

(declare-fun m!1376205 () Bool)

(assert (=> b!1492878 m!1376205))

(declare-fun m!1376207 () Bool)

(assert (=> b!1492881 m!1376207))

(declare-fun m!1376209 () Bool)

(assert (=> d!156731 m!1376209))

(assert (=> d!156731 m!1375929))

(declare-fun m!1376211 () Bool)

(assert (=> d!156731 m!1376211))

(assert (=> d!156731 m!1375955))

(assert (=> d!156731 m!1375957))

(assert (=> d!156731 m!1375955))

(declare-fun m!1376213 () Bool)

(assert (=> d!156731 m!1376213))

(assert (=> b!1492542 d!156731))

(check-sat (not b!1492739) (not d!156723) (not d!156687) (not d!156713) (not b!1492772) (not d!156731) (not b!1492679) (not b!1492815) (not bm!67929) (not b!1492873) (not d!156681) (not b!1492767) (not d!156691) (not b!1492777) (not b!1492818) (not d!156677) (not b!1492688) (not b!1492785) (not d!156707) (not bm!67932) (not b!1492816) (not bm!67928) (not d!156673) (not b!1492878) (not b!1492774) (not b!1492697))
(check-sat)
