; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126568 () Bool)

(assert start!126568)

(declare-fun b!1485682 () Bool)

(declare-fun e!832870 () Bool)

(declare-fun e!832877 () Bool)

(assert (=> b!1485682 (= e!832870 e!832877)))

(declare-fun res!1010352 () Bool)

(assert (=> b!1485682 (=> res!1010352 e!832877)))

(declare-fun lt!648177 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99530 0))(
  ( (array!99531 (arr!48041 (Array (_ BitVec 32) (_ BitVec 64))) (size!48591 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99530)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1485682 (= res!1010352 (or (and (= (select (arr!48041 a!2862) index!646) lt!648177) (= (select (arr!48041 a!2862) index!646) (select (arr!48041 a!2862) j!93))) (= (select (arr!48041 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485682 (= lt!648177 (select (store (arr!48041 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485683 () Bool)

(declare-fun res!1010344 () Bool)

(declare-fun e!832875 () Bool)

(assert (=> b!1485683 (=> (not res!1010344) (not e!832875))))

(declare-fun e!832873 () Bool)

(assert (=> b!1485683 (= res!1010344 e!832873)))

(declare-fun c!137193 () Bool)

(assert (=> b!1485683 (= c!137193 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!648175 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!648174 () array!99530)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1485684 () Bool)

(declare-datatypes ((SeekEntryResult!12281 0))(
  ( (MissingZero!12281 (index!51516 (_ BitVec 32))) (Found!12281 (index!51517 (_ BitVec 32))) (Intermediate!12281 (undefined!13093 Bool) (index!51518 (_ BitVec 32)) (x!133093 (_ BitVec 32))) (Undefined!12281) (MissingVacant!12281 (index!51519 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99530 (_ BitVec 32)) SeekEntryResult!12281)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99530 (_ BitVec 32)) SeekEntryResult!12281)

(assert (=> b!1485684 (= e!832873 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648175 lt!648174 mask!2687) (seekEntryOrOpen!0 lt!648175 lt!648174 mask!2687)))))

(declare-fun b!1485685 () Bool)

(declare-fun res!1010353 () Bool)

(declare-fun e!832869 () Bool)

(assert (=> b!1485685 (=> (not res!1010353) (not e!832869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99530 (_ BitVec 32)) Bool)

(assert (=> b!1485685 (= res!1010353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485686 () Bool)

(declare-fun res!1010354 () Bool)

(assert (=> b!1485686 (=> (not res!1010354) (not e!832869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485686 (= res!1010354 (validKeyInArray!0 (select (arr!48041 a!2862) j!93)))))

(declare-fun b!1485687 () Bool)

(declare-fun res!1010350 () Bool)

(assert (=> b!1485687 (=> (not res!1010350) (not e!832875))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485687 (= res!1010350 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485688 () Bool)

(declare-fun e!832868 () Bool)

(assert (=> b!1485688 (= e!832875 (not e!832868))))

(declare-fun res!1010342 () Bool)

(assert (=> b!1485688 (=> res!1010342 e!832868)))

(assert (=> b!1485688 (= res!1010342 (or (and (= (select (arr!48041 a!2862) index!646) (select (store (arr!48041 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48041 a!2862) index!646) (select (arr!48041 a!2862) j!93))) (= (select (arr!48041 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485688 e!832870))

(declare-fun res!1010345 () Bool)

(assert (=> b!1485688 (=> (not res!1010345) (not e!832870))))

(assert (=> b!1485688 (= res!1010345 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49902 0))(
  ( (Unit!49903) )
))
(declare-fun lt!648178 () Unit!49902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49902)

(assert (=> b!1485688 (= lt!648178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485689 () Bool)

(declare-fun res!1010347 () Bool)

(declare-fun e!832871 () Bool)

(assert (=> b!1485689 (=> (not res!1010347) (not e!832871))))

(declare-fun lt!648180 () SeekEntryResult!12281)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99530 (_ BitVec 32)) SeekEntryResult!12281)

(assert (=> b!1485689 (= res!1010347 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48041 a!2862) j!93) a!2862 mask!2687) lt!648180))))

(declare-fun b!1485690 () Bool)

(declare-fun res!1010351 () Bool)

(assert (=> b!1485690 (=> (not res!1010351) (not e!832870))))

(assert (=> b!1485690 (= res!1010351 (= (seekEntryOrOpen!0 (select (arr!48041 a!2862) j!93) a!2862 mask!2687) (Found!12281 j!93)))))

(declare-fun b!1485691 () Bool)

(assert (=> b!1485691 (= e!832871 e!832875)))

(declare-fun res!1010356 () Bool)

(assert (=> b!1485691 (=> (not res!1010356) (not e!832875))))

(declare-fun lt!648176 () SeekEntryResult!12281)

(assert (=> b!1485691 (= res!1010356 (= lt!648176 (Intermediate!12281 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485691 (= lt!648176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648175 mask!2687) lt!648175 lt!648174 mask!2687))))

(assert (=> b!1485691 (= lt!648175 (select (store (arr!48041 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485692 () Bool)

(declare-fun lt!648179 () (_ BitVec 32))

(assert (=> b!1485692 (= e!832868 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (and (bvsge lt!648179 #b00000000000000000000000000000000) (bvslt lt!648179 (size!48591 a!2862)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485692 (= lt!648179 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485693 () Bool)

(declare-fun e!832876 () Bool)

(assert (=> b!1485693 (= e!832876 (= (seekEntryOrOpen!0 lt!648175 lt!648174 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648175 lt!648174 mask!2687)))))

(declare-fun b!1485694 () Bool)

(assert (=> b!1485694 (= e!832873 (= lt!648176 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648175 lt!648174 mask!2687)))))

(declare-fun b!1485695 () Bool)

(assert (=> b!1485695 (= e!832877 e!832876)))

(declare-fun res!1010355 () Bool)

(assert (=> b!1485695 (=> (not res!1010355) (not e!832876))))

(assert (=> b!1485695 (= res!1010355 (and (= index!646 intermediateAfterIndex!19) (= lt!648177 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485696 () Bool)

(declare-fun res!1010358 () Bool)

(assert (=> b!1485696 (=> (not res!1010358) (not e!832869))))

(assert (=> b!1485696 (= res!1010358 (validKeyInArray!0 (select (arr!48041 a!2862) i!1006)))))

(declare-fun b!1485697 () Bool)

(declare-fun res!1010349 () Bool)

(assert (=> b!1485697 (=> (not res!1010349) (not e!832870))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1485697 (= res!1010349 (or (= (select (arr!48041 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48041 a!2862) intermediateBeforeIndex!19) (select (arr!48041 a!2862) j!93))))))

(declare-fun b!1485698 () Bool)

(declare-fun e!832872 () Bool)

(assert (=> b!1485698 (= e!832869 e!832872)))

(declare-fun res!1010346 () Bool)

(assert (=> b!1485698 (=> (not res!1010346) (not e!832872))))

(assert (=> b!1485698 (= res!1010346 (= (select (store (arr!48041 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485698 (= lt!648174 (array!99531 (store (arr!48041 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48591 a!2862)))))

(declare-fun b!1485699 () Bool)

(declare-fun res!1010341 () Bool)

(assert (=> b!1485699 (=> (not res!1010341) (not e!832869))))

(declare-datatypes ((List!34542 0))(
  ( (Nil!34539) (Cons!34538 (h!35912 (_ BitVec 64)) (t!49236 List!34542)) )
))
(declare-fun arrayNoDuplicates!0 (array!99530 (_ BitVec 32) List!34542) Bool)

(assert (=> b!1485699 (= res!1010341 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34539))))

(declare-fun b!1485700 () Bool)

(declare-fun res!1010359 () Bool)

(assert (=> b!1485700 (=> (not res!1010359) (not e!832869))))

(assert (=> b!1485700 (= res!1010359 (and (= (size!48591 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48591 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48591 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485701 () Bool)

(declare-fun res!1010343 () Bool)

(assert (=> b!1485701 (=> (not res!1010343) (not e!832869))))

(assert (=> b!1485701 (= res!1010343 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48591 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48591 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48591 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485702 () Bool)

(assert (=> b!1485702 (= e!832872 e!832871)))

(declare-fun res!1010357 () Bool)

(assert (=> b!1485702 (=> (not res!1010357) (not e!832871))))

(assert (=> b!1485702 (= res!1010357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48041 a!2862) j!93) mask!2687) (select (arr!48041 a!2862) j!93) a!2862 mask!2687) lt!648180))))

(assert (=> b!1485702 (= lt!648180 (Intermediate!12281 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1010348 () Bool)

(assert (=> start!126568 (=> (not res!1010348) (not e!832869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126568 (= res!1010348 (validMask!0 mask!2687))))

(assert (=> start!126568 e!832869))

(assert (=> start!126568 true))

(declare-fun array_inv!37069 (array!99530) Bool)

(assert (=> start!126568 (array_inv!37069 a!2862)))

(assert (= (and start!126568 res!1010348) b!1485700))

(assert (= (and b!1485700 res!1010359) b!1485696))

(assert (= (and b!1485696 res!1010358) b!1485686))

(assert (= (and b!1485686 res!1010354) b!1485685))

(assert (= (and b!1485685 res!1010353) b!1485699))

(assert (= (and b!1485699 res!1010341) b!1485701))

(assert (= (and b!1485701 res!1010343) b!1485698))

(assert (= (and b!1485698 res!1010346) b!1485702))

(assert (= (and b!1485702 res!1010357) b!1485689))

(assert (= (and b!1485689 res!1010347) b!1485691))

(assert (= (and b!1485691 res!1010356) b!1485683))

(assert (= (and b!1485683 c!137193) b!1485694))

(assert (= (and b!1485683 (not c!137193)) b!1485684))

(assert (= (and b!1485683 res!1010344) b!1485687))

(assert (= (and b!1485687 res!1010350) b!1485688))

(assert (= (and b!1485688 res!1010345) b!1485690))

(assert (= (and b!1485690 res!1010351) b!1485697))

(assert (= (and b!1485697 res!1010349) b!1485682))

(assert (= (and b!1485682 (not res!1010352)) b!1485695))

(assert (= (and b!1485695 res!1010355) b!1485693))

(assert (= (and b!1485688 (not res!1010342)) b!1485692))

(declare-fun m!1370773 () Bool)

(assert (=> b!1485697 m!1370773))

(declare-fun m!1370775 () Bool)

(assert (=> b!1485697 m!1370775))

(declare-fun m!1370777 () Bool)

(assert (=> b!1485682 m!1370777))

(assert (=> b!1485682 m!1370775))

(declare-fun m!1370779 () Bool)

(assert (=> b!1485682 m!1370779))

(declare-fun m!1370781 () Bool)

(assert (=> b!1485682 m!1370781))

(declare-fun m!1370783 () Bool)

(assert (=> b!1485691 m!1370783))

(assert (=> b!1485691 m!1370783))

(declare-fun m!1370785 () Bool)

(assert (=> b!1485691 m!1370785))

(assert (=> b!1485691 m!1370779))

(declare-fun m!1370787 () Bool)

(assert (=> b!1485691 m!1370787))

(declare-fun m!1370789 () Bool)

(assert (=> b!1485688 m!1370789))

(assert (=> b!1485688 m!1370779))

(assert (=> b!1485688 m!1370781))

(assert (=> b!1485688 m!1370777))

(declare-fun m!1370791 () Bool)

(assert (=> b!1485688 m!1370791))

(assert (=> b!1485688 m!1370775))

(declare-fun m!1370793 () Bool)

(assert (=> b!1485694 m!1370793))

(assert (=> b!1485686 m!1370775))

(assert (=> b!1485686 m!1370775))

(declare-fun m!1370795 () Bool)

(assert (=> b!1485686 m!1370795))

(declare-fun m!1370797 () Bool)

(assert (=> b!1485693 m!1370797))

(declare-fun m!1370799 () Bool)

(assert (=> b!1485693 m!1370799))

(declare-fun m!1370801 () Bool)

(assert (=> b!1485685 m!1370801))

(declare-fun m!1370803 () Bool)

(assert (=> start!126568 m!1370803))

(declare-fun m!1370805 () Bool)

(assert (=> start!126568 m!1370805))

(declare-fun m!1370807 () Bool)

(assert (=> b!1485699 m!1370807))

(assert (=> b!1485689 m!1370775))

(assert (=> b!1485689 m!1370775))

(declare-fun m!1370809 () Bool)

(assert (=> b!1485689 m!1370809))

(assert (=> b!1485684 m!1370799))

(assert (=> b!1485684 m!1370797))

(declare-fun m!1370811 () Bool)

(assert (=> b!1485692 m!1370811))

(assert (=> b!1485690 m!1370775))

(assert (=> b!1485690 m!1370775))

(declare-fun m!1370813 () Bool)

(assert (=> b!1485690 m!1370813))

(declare-fun m!1370815 () Bool)

(assert (=> b!1485696 m!1370815))

(assert (=> b!1485696 m!1370815))

(declare-fun m!1370817 () Bool)

(assert (=> b!1485696 m!1370817))

(assert (=> b!1485698 m!1370779))

(declare-fun m!1370819 () Bool)

(assert (=> b!1485698 m!1370819))

(assert (=> b!1485702 m!1370775))

(assert (=> b!1485702 m!1370775))

(declare-fun m!1370821 () Bool)

(assert (=> b!1485702 m!1370821))

(assert (=> b!1485702 m!1370821))

(assert (=> b!1485702 m!1370775))

(declare-fun m!1370823 () Bool)

(assert (=> b!1485702 m!1370823))

(push 1)

(assert (not b!1485699))

(assert (not start!126568))

(assert (not b!1485690))

(assert (not b!1485686))

(assert (not b!1485702))

(assert (not b!1485685))

(assert (not b!1485692))

(assert (not b!1485691))

(assert (not b!1485696))

(assert (not b!1485694))

(assert (not b!1485689))

(assert (not b!1485684))

(assert (not b!1485693))

(assert (not b!1485688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!156439 () Bool)

(assert (=> d!156439 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126568 d!156439))

(declare-fun d!156455 () Bool)

(assert (=> d!156455 (= (array_inv!37069 a!2862) (bvsge (size!48591 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126568 d!156455))

(declare-fun b!1485912 () Bool)

(declare-fun e!832992 () Bool)

(declare-fun e!832994 () Bool)

(assert (=> b!1485912 (= e!832992 e!832994)))

(declare-fun lt!648270 () (_ BitVec 64))

(assert (=> b!1485912 (= lt!648270 (select (arr!48041 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648271 () Unit!49902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99530 (_ BitVec 64) (_ BitVec 32)) Unit!49902)

(assert (=> b!1485912 (= lt!648271 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648270 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1485912 (arrayContainsKey!0 a!2862 lt!648270 #b00000000000000000000000000000000)))

(declare-fun lt!648272 () Unit!49902)

(assert (=> b!1485912 (= lt!648272 lt!648271)))

(declare-fun res!1010508 () Bool)

(assert (=> b!1485912 (= res!1010508 (= (seekEntryOrOpen!0 (select (arr!48041 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12281 #b00000000000000000000000000000000)))))

(assert (=> b!1485912 (=> (not res!1010508) (not e!832994))))

(declare-fun bm!67880 () Bool)

(declare-fun call!67883 () Bool)

(assert (=> bm!67880 (= call!67883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1485913 () Bool)

(assert (=> b!1485913 (= e!832992 call!67883)))

(declare-fun b!1485914 () Bool)

(declare-fun e!832993 () Bool)

(assert (=> b!1485914 (= e!832993 e!832992)))

(declare-fun c!137225 () Bool)

(assert (=> b!1485914 (= c!137225 (validKeyInArray!0 (select (arr!48041 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156457 () Bool)

(declare-fun res!1010509 () Bool)

(assert (=> d!156457 (=> res!1010509 e!832993)))

(assert (=> d!156457 (= res!1010509 (bvsge #b00000000000000000000000000000000 (size!48591 a!2862)))))

(assert (=> d!156457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!832993)))

(declare-fun b!1485915 () Bool)

(assert (=> b!1485915 (= e!832994 call!67883)))

(assert (= (and d!156457 (not res!1010509)) b!1485914))

(assert (= (and b!1485914 c!137225) b!1485912))

(assert (= (and b!1485914 (not c!137225)) b!1485913))

(assert (= (and b!1485912 res!1010508) b!1485915))

(assert (= (or b!1485915 b!1485913) bm!67880))

(declare-fun m!1370973 () Bool)

(assert (=> b!1485912 m!1370973))

(declare-fun m!1370975 () Bool)

(assert (=> b!1485912 m!1370975))

(declare-fun m!1370977 () Bool)

(assert (=> b!1485912 m!1370977))

(assert (=> b!1485912 m!1370973))

(declare-fun m!1370979 () Bool)

(assert (=> b!1485912 m!1370979))

(declare-fun m!1370981 () Bool)

(assert (=> bm!67880 m!1370981))

(assert (=> b!1485914 m!1370973))

(assert (=> b!1485914 m!1370973))

(declare-fun m!1370983 () Bool)

(assert (=> b!1485914 m!1370983))

(assert (=> b!1485685 d!156457))

(declare-fun b!1485980 () Bool)

(declare-fun e!833033 () SeekEntryResult!12281)

(assert (=> b!1485980 (= e!833033 (MissingVacant!12281 intermediateAfterIndex!19))))

(declare-fun b!1485981 () Bool)

(declare-fun e!833035 () SeekEntryResult!12281)

(declare-fun e!833034 () SeekEntryResult!12281)

(assert (=> b!1485981 (= e!833035 e!833034)))

(declare-fun c!137249 () Bool)

(declare-fun lt!648286 () (_ BitVec 64))

(assert (=> b!1485981 (= c!137249 (= lt!648286 lt!648175))))

(declare-fun b!1485982 () Bool)

(assert (=> b!1485982 (= e!833034 (Found!12281 index!646))))

(declare-fun b!1485983 () Bool)

(declare-fun c!137250 () Bool)

(assert (=> b!1485983 (= c!137250 (= lt!648286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485983 (= e!833034 e!833033)))

(declare-fun b!1485984 () Bool)

(assert (=> b!1485984 (= e!833035 Undefined!12281)))

(declare-fun b!1485985 () Bool)

(assert (=> b!1485985 (= e!833033 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!648175 lt!648174 mask!2687))))

(declare-fun d!156461 () Bool)

(declare-fun lt!648285 () SeekEntryResult!12281)

(assert (=> d!156461 (and (or (is-Undefined!12281 lt!648285) (not (is-Found!12281 lt!648285)) (and (bvsge (index!51517 lt!648285) #b00000000000000000000000000000000) (bvslt (index!51517 lt!648285) (size!48591 lt!648174)))) (or (is-Undefined!12281 lt!648285) (is-Found!12281 lt!648285) (not (is-MissingVacant!12281 lt!648285)) (not (= (index!51519 lt!648285) intermediateAfterIndex!19)) (and (bvsge (index!51519 lt!648285) #b00000000000000000000000000000000) (bvslt (index!51519 lt!648285) (size!48591 lt!648174)))) (or (is-Undefined!12281 lt!648285) (ite (is-Found!12281 lt!648285) (= (select (arr!48041 lt!648174) (index!51517 lt!648285)) lt!648175) (and (is-MissingVacant!12281 lt!648285) (= (index!51519 lt!648285) intermediateAfterIndex!19) (= (select (arr!48041 lt!648174) (index!51519 lt!648285)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156461 (= lt!648285 e!833035)))

(declare-fun c!137251 () Bool)

(assert (=> d!156461 (= c!137251 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156461 (= lt!648286 (select (arr!48041 lt!648174) index!646))))

(assert (=> d!156461 (validMask!0 mask!2687)))

(assert (=> d!156461 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648175 lt!648174 mask!2687) lt!648285)))

(assert (= (and d!156461 c!137251) b!1485984))

(assert (= (and d!156461 (not c!137251)) b!1485981))

(assert (= (and b!1485981 c!137249) b!1485982))

(assert (= (and b!1485981 (not c!137249)) b!1485983))

(assert (= (and b!1485983 c!137250) b!1485980))

(assert (= (and b!1485983 (not c!137250)) b!1485985))

(assert (=> b!1485985 m!1370811))

(assert (=> b!1485985 m!1370811))

(declare-fun m!1371007 () Bool)

(assert (=> b!1485985 m!1371007))

(declare-fun m!1371009 () Bool)

(assert (=> d!156461 m!1371009))

(declare-fun m!1371011 () Bool)

(assert (=> d!156461 m!1371011))

(declare-fun m!1371013 () Bool)

(assert (=> d!156461 m!1371013))

(assert (=> d!156461 m!1370803))

(assert (=> b!1485684 d!156461))

(declare-fun b!1486040 () Bool)

(declare-fun e!833066 () SeekEntryResult!12281)

(declare-fun lt!648309 () SeekEntryResult!12281)

(assert (=> b!1486040 (= e!833066 (Found!12281 (index!51518 lt!648309)))))

(declare-fun b!1486041 () Bool)

(declare-fun c!137277 () Bool)

(declare-fun lt!648310 () (_ BitVec 64))

(assert (=> b!1486041 (= c!137277 (= lt!648310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833064 () SeekEntryResult!12281)

(assert (=> b!1486041 (= e!833066 e!833064)))

(declare-fun d!156469 () Bool)

(declare-fun lt!648311 () SeekEntryResult!12281)

(assert (=> d!156469 (and (or (is-Undefined!12281 lt!648311) (not (is-Found!12281 lt!648311)) (and (bvsge (index!51517 lt!648311) #b00000000000000000000000000000000) (bvslt (index!51517 lt!648311) (size!48591 lt!648174)))) (or (is-Undefined!12281 lt!648311) (is-Found!12281 lt!648311) (not (is-MissingZero!12281 lt!648311)) (and (bvsge (index!51516 lt!648311) #b00000000000000000000000000000000) (bvslt (index!51516 lt!648311) (size!48591 lt!648174)))) (or (is-Undefined!12281 lt!648311) (is-Found!12281 lt!648311) (is-MissingZero!12281 lt!648311) (not (is-MissingVacant!12281 lt!648311)) (and (bvsge (index!51519 lt!648311) #b00000000000000000000000000000000) (bvslt (index!51519 lt!648311) (size!48591 lt!648174)))) (or (is-Undefined!12281 lt!648311) (ite (is-Found!12281 lt!648311) (= (select (arr!48041 lt!648174) (index!51517 lt!648311)) lt!648175) (ite (is-MissingZero!12281 lt!648311) (= (select (arr!48041 lt!648174) (index!51516 lt!648311)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12281 lt!648311) (= (select (arr!48041 lt!648174) (index!51519 lt!648311)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!833065 () SeekEntryResult!12281)

(assert (=> d!156469 (= lt!648311 e!833065)))

(declare-fun c!137276 () Bool)

(assert (=> d!156469 (= c!137276 (and (is-Intermediate!12281 lt!648309) (undefined!13093 lt!648309)))))

(assert (=> d!156469 (= lt!648309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648175 mask!2687) lt!648175 lt!648174 mask!2687))))

(assert (=> d!156469 (validMask!0 mask!2687)))

(assert (=> d!156469 (= (seekEntryOrOpen!0 lt!648175 lt!648174 mask!2687) lt!648311)))

(declare-fun b!1486042 () Bool)

(assert (=> b!1486042 (= e!833064 (MissingZero!12281 (index!51518 lt!648309)))))

(declare-fun b!1486043 () Bool)

(assert (=> b!1486043 (= e!833065 Undefined!12281)))

(declare-fun b!1486044 () Bool)

(assert (=> b!1486044 (= e!833065 e!833066)))

(assert (=> b!1486044 (= lt!648310 (select (arr!48041 lt!648174) (index!51518 lt!648309)))))

(declare-fun c!137278 () Bool)

(assert (=> b!1486044 (= c!137278 (= lt!648310 lt!648175))))

(declare-fun b!1486045 () Bool)

(assert (=> b!1486045 (= e!833064 (seekKeyOrZeroReturnVacant!0 (x!133093 lt!648309) (index!51518 lt!648309) (index!51518 lt!648309) lt!648175 lt!648174 mask!2687))))

(assert (= (and d!156469 c!137276) b!1486043))

(assert (= (and d!156469 (not c!137276)) b!1486044))

(assert (= (and b!1486044 c!137278) b!1486040))

(assert (= (and b!1486044 (not c!137278)) b!1486041))

(assert (= (and b!1486041 c!137277) b!1486042))

(assert (= (and b!1486041 (not c!137277)) b!1486045))

(declare-fun m!1371043 () Bool)

(assert (=> d!156469 m!1371043))

(assert (=> d!156469 m!1370783))

(declare-fun m!1371045 () Bool)

(assert (=> d!156469 m!1371045))

(assert (=> d!156469 m!1370783))

(assert (=> d!156469 m!1370785))

(assert (=> d!156469 m!1370803))

(declare-fun m!1371047 () Bool)

(assert (=> d!156469 m!1371047))

(declare-fun m!1371049 () Bool)

(assert (=> b!1486044 m!1371049))

(declare-fun m!1371051 () Bool)

(assert (=> b!1486045 m!1371051))

(assert (=> b!1485684 d!156469))

(declare-fun b!1486094 () Bool)

(declare-fun e!833093 () Bool)

(declare-fun e!833095 () Bool)

(assert (=> b!1486094 (= e!833093 e!833095)))

(declare-fun res!1010542 () Bool)

(declare-fun lt!648329 () SeekEntryResult!12281)

(assert (=> b!1486094 (= res!1010542 (and (is-Intermediate!12281 lt!648329) (not (undefined!13093 lt!648329)) (bvslt (x!133093 lt!648329) #b01111111111111111111111111111110) (bvsge (x!133093 lt!648329) #b00000000000000000000000000000000) (bvsge (x!133093 lt!648329) x!665)))))

(assert (=> b!1486094 (=> (not res!1010542) (not e!833095))))

(declare-fun b!1486095 () Bool)

(declare-fun e!833092 () SeekEntryResult!12281)

(assert (=> b!1486095 (= e!833092 (Intermediate!12281 false index!646 x!665))))

(declare-fun b!1486096 () Bool)

(assert (=> b!1486096 (= e!833093 (bvsge (x!133093 lt!648329) #b01111111111111111111111111111110))))

(declare-fun b!1486097 () Bool)

(declare-fun e!833094 () SeekEntryResult!12281)

(assert (=> b!1486097 (= e!833094 e!833092)))

(declare-fun c!137300 () Bool)

(declare-fun lt!648330 () (_ BitVec 64))

(assert (=> b!1486097 (= c!137300 (or (= lt!648330 lt!648175) (= (bvadd lt!648330 lt!648330) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486098 () Bool)

(assert (=> b!1486098 (= e!833094 (Intermediate!12281 true index!646 x!665))))

(declare-fun d!156481 () Bool)

(assert (=> d!156481 e!833093))

(declare-fun c!137302 () Bool)

(assert (=> d!156481 (= c!137302 (and (is-Intermediate!12281 lt!648329) (undefined!13093 lt!648329)))))

(assert (=> d!156481 (= lt!648329 e!833094)))

(declare-fun c!137301 () Bool)

(assert (=> d!156481 (= c!137301 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156481 (= lt!648330 (select (arr!48041 lt!648174) index!646))))

(assert (=> d!156481 (validMask!0 mask!2687)))

(assert (=> d!156481 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648175 lt!648174 mask!2687) lt!648329)))

(declare-fun b!1486099 () Bool)

(assert (=> b!1486099 (and (bvsge (index!51518 lt!648329) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648329) (size!48591 lt!648174)))))

(declare-fun e!833096 () Bool)

(assert (=> b!1486099 (= e!833096 (= (select (arr!48041 lt!648174) (index!51518 lt!648329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1486100 () Bool)

(assert (=> b!1486100 (and (bvsge (index!51518 lt!648329) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648329) (size!48591 lt!648174)))))

(declare-fun res!1010540 () Bool)

(assert (=> b!1486100 (= res!1010540 (= (select (arr!48041 lt!648174) (index!51518 lt!648329)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486100 (=> res!1010540 e!833096)))

(declare-fun b!1486101 () Bool)

(assert (=> b!1486101 (= e!833092 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!648175 lt!648174 mask!2687))))

(declare-fun b!1486102 () Bool)

(assert (=> b!1486102 (and (bvsge (index!51518 lt!648329) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648329) (size!48591 lt!648174)))))

(declare-fun res!1010541 () Bool)

(assert (=> b!1486102 (= res!1010541 (= (select (arr!48041 lt!648174) (index!51518 lt!648329)) lt!648175))))

(assert (=> b!1486102 (=> res!1010541 e!833096)))

(assert (=> b!1486102 (= e!833095 e!833096)))

(assert (= (and d!156481 c!137301) b!1486098))

(assert (= (and d!156481 (not c!137301)) b!1486097))

(assert (= (and b!1486097 c!137300) b!1486095))

(assert (= (and b!1486097 (not c!137300)) b!1486101))

(assert (= (and d!156481 c!137302) b!1486096))

(assert (= (and d!156481 (not c!137302)) b!1486094))

(assert (= (and b!1486094 res!1010542) b!1486102))

(assert (= (and b!1486102 (not res!1010541)) b!1486100))

(assert (= (and b!1486100 (not res!1010540)) b!1486099))

(declare-fun m!1371063 () Bool)

(assert (=> b!1486100 m!1371063))

(assert (=> b!1486101 m!1370811))

(assert (=> b!1486101 m!1370811))

(declare-fun m!1371065 () Bool)

(assert (=> b!1486101 m!1371065))

(assert (=> b!1486102 m!1371063))

(assert (=> d!156481 m!1371013))

(assert (=> d!156481 m!1370803))

(assert (=> b!1486099 m!1371063))

(assert (=> b!1485694 d!156481))

(assert (=> b!1485693 d!156469))

(assert (=> b!1485693 d!156461))

(declare-fun d!156485 () Bool)

(declare-fun lt!648335 () (_ BitVec 32))

(assert (=> d!156485 (and (bvsge lt!648335 #b00000000000000000000000000000000) (bvslt lt!648335 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156485 (= lt!648335 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156485 (validMask!0 mask!2687)))

(assert (=> d!156485 (= (nextIndex!0 index!646 x!665 mask!2687) lt!648335)))

(declare-fun bs!42761 () Bool)

(assert (= bs!42761 d!156485))

(declare-fun m!1371073 () Bool)

(assert (=> bs!42761 m!1371073))

(assert (=> bs!42761 m!1370803))

(assert (=> b!1485692 d!156485))

(declare-fun b!1486109 () Bool)

(declare-fun e!833101 () Bool)

(declare-fun e!833103 () Bool)

(assert (=> b!1486109 (= e!833101 e!833103)))

(declare-fun res!1010545 () Bool)

(declare-fun lt!648336 () SeekEntryResult!12281)

(assert (=> b!1486109 (= res!1010545 (and (is-Intermediate!12281 lt!648336) (not (undefined!13093 lt!648336)) (bvslt (x!133093 lt!648336) #b01111111111111111111111111111110) (bvsge (x!133093 lt!648336) #b00000000000000000000000000000000) (bvsge (x!133093 lt!648336) #b00000000000000000000000000000000)))))

(assert (=> b!1486109 (=> (not res!1010545) (not e!833103))))

(declare-fun b!1486110 () Bool)

(declare-fun e!833100 () SeekEntryResult!12281)

(assert (=> b!1486110 (= e!833100 (Intermediate!12281 false (toIndex!0 (select (arr!48041 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1486111 () Bool)

(assert (=> b!1486111 (= e!833101 (bvsge (x!133093 lt!648336) #b01111111111111111111111111111110))))

(declare-fun b!1486112 () Bool)

(declare-fun e!833102 () SeekEntryResult!12281)

(assert (=> b!1486112 (= e!833102 e!833100)))

(declare-fun lt!648337 () (_ BitVec 64))

(declare-fun c!137306 () Bool)

(assert (=> b!1486112 (= c!137306 (or (= lt!648337 (select (arr!48041 a!2862) j!93)) (= (bvadd lt!648337 lt!648337) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486113 () Bool)

(assert (=> b!1486113 (= e!833102 (Intermediate!12281 true (toIndex!0 (select (arr!48041 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156489 () Bool)

(assert (=> d!156489 e!833101))

(declare-fun c!137308 () Bool)

(assert (=> d!156489 (= c!137308 (and (is-Intermediate!12281 lt!648336) (undefined!13093 lt!648336)))))

(assert (=> d!156489 (= lt!648336 e!833102)))

(declare-fun c!137307 () Bool)

(assert (=> d!156489 (= c!137307 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156489 (= lt!648337 (select (arr!48041 a!2862) (toIndex!0 (select (arr!48041 a!2862) j!93) mask!2687)))))

(assert (=> d!156489 (validMask!0 mask!2687)))

(assert (=> d!156489 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48041 a!2862) j!93) mask!2687) (select (arr!48041 a!2862) j!93) a!2862 mask!2687) lt!648336)))

(declare-fun b!1486114 () Bool)

(assert (=> b!1486114 (and (bvsge (index!51518 lt!648336) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648336) (size!48591 a!2862)))))

(declare-fun e!833104 () Bool)

(assert (=> b!1486114 (= e!833104 (= (select (arr!48041 a!2862) (index!51518 lt!648336)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1486115 () Bool)

(assert (=> b!1486115 (and (bvsge (index!51518 lt!648336) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648336) (size!48591 a!2862)))))

(declare-fun res!1010543 () Bool)

(assert (=> b!1486115 (= res!1010543 (= (select (arr!48041 a!2862) (index!51518 lt!648336)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486115 (=> res!1010543 e!833104)))

(declare-fun b!1486116 () Bool)

(assert (=> b!1486116 (= e!833100 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48041 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48041 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1486117 () Bool)

(assert (=> b!1486117 (and (bvsge (index!51518 lt!648336) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648336) (size!48591 a!2862)))))

(declare-fun res!1010544 () Bool)

(assert (=> b!1486117 (= res!1010544 (= (select (arr!48041 a!2862) (index!51518 lt!648336)) (select (arr!48041 a!2862) j!93)))))

(assert (=> b!1486117 (=> res!1010544 e!833104)))

(assert (=> b!1486117 (= e!833103 e!833104)))

(assert (= (and d!156489 c!137307) b!1486113))

(assert (= (and d!156489 (not c!137307)) b!1486112))

(assert (= (and b!1486112 c!137306) b!1486110))

(assert (= (and b!1486112 (not c!137306)) b!1486116))

(assert (= (and d!156489 c!137308) b!1486111))

(assert (= (and d!156489 (not c!137308)) b!1486109))

(assert (= (and b!1486109 res!1010545) b!1486117))

(assert (= (and b!1486117 (not res!1010544)) b!1486115))

(assert (= (and b!1486115 (not res!1010543)) b!1486114))

(declare-fun m!1371075 () Bool)

(assert (=> b!1486115 m!1371075))

(assert (=> b!1486116 m!1370821))

(declare-fun m!1371077 () Bool)

(assert (=> b!1486116 m!1371077))

(assert (=> b!1486116 m!1371077))

(assert (=> b!1486116 m!1370775))

(declare-fun m!1371079 () Bool)

(assert (=> b!1486116 m!1371079))

(assert (=> b!1486117 m!1371075))

(assert (=> d!156489 m!1370821))

(declare-fun m!1371081 () Bool)

(assert (=> d!156489 m!1371081))

(assert (=> d!156489 m!1370803))

(assert (=> b!1486114 m!1371075))

(assert (=> b!1485702 d!156489))

(declare-fun d!156491 () Bool)

(declare-fun lt!648349 () (_ BitVec 32))

(declare-fun lt!648348 () (_ BitVec 32))

(assert (=> d!156491 (= lt!648349 (bvmul (bvxor lt!648348 (bvlshr lt!648348 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156491 (= lt!648348 ((_ extract 31 0) (bvand (bvxor (select (arr!48041 a!2862) j!93) (bvlshr (select (arr!48041 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156491 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1010546 (let ((h!35916 ((_ extract 31 0) (bvand (bvxor (select (arr!48041 a!2862) j!93) (bvlshr (select (arr!48041 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133106 (bvmul (bvxor h!35916 (bvlshr h!35916 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133106 (bvlshr x!133106 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1010546 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1010546 #b00000000000000000000000000000000))))))

(assert (=> d!156491 (= (toIndex!0 (select (arr!48041 a!2862) j!93) mask!2687) (bvand (bvxor lt!648349 (bvlshr lt!648349 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1485702 d!156491))

(declare-fun b!1486126 () Bool)

(declare-fun e!833112 () Bool)

(declare-fun e!833114 () Bool)

(assert (=> b!1486126 (= e!833112 e!833114)))

(declare-fun res!1010553 () Bool)

(declare-fun lt!648350 () SeekEntryResult!12281)

(assert (=> b!1486126 (= res!1010553 (and (is-Intermediate!12281 lt!648350) (not (undefined!13093 lt!648350)) (bvslt (x!133093 lt!648350) #b01111111111111111111111111111110) (bvsge (x!133093 lt!648350) #b00000000000000000000000000000000) (bvsge (x!133093 lt!648350) #b00000000000000000000000000000000)))))

(assert (=> b!1486126 (=> (not res!1010553) (not e!833114))))

(declare-fun b!1486127 () Bool)

(declare-fun e!833111 () SeekEntryResult!12281)

(assert (=> b!1486127 (= e!833111 (Intermediate!12281 false (toIndex!0 lt!648175 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1486128 () Bool)

(assert (=> b!1486128 (= e!833112 (bvsge (x!133093 lt!648350) #b01111111111111111111111111111110))))

(declare-fun b!1486129 () Bool)

(declare-fun e!833113 () SeekEntryResult!12281)

(assert (=> b!1486129 (= e!833113 e!833111)))

(declare-fun c!137311 () Bool)

(declare-fun lt!648351 () (_ BitVec 64))

(assert (=> b!1486129 (= c!137311 (or (= lt!648351 lt!648175) (= (bvadd lt!648351 lt!648351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486130 () Bool)

(assert (=> b!1486130 (= e!833113 (Intermediate!12281 true (toIndex!0 lt!648175 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156493 () Bool)

(assert (=> d!156493 e!833112))

(declare-fun c!137313 () Bool)

(assert (=> d!156493 (= c!137313 (and (is-Intermediate!12281 lt!648350) (undefined!13093 lt!648350)))))

(assert (=> d!156493 (= lt!648350 e!833113)))

(declare-fun c!137312 () Bool)

(assert (=> d!156493 (= c!137312 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156493 (= lt!648351 (select (arr!48041 lt!648174) (toIndex!0 lt!648175 mask!2687)))))

(assert (=> d!156493 (validMask!0 mask!2687)))

(assert (=> d!156493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648175 mask!2687) lt!648175 lt!648174 mask!2687) lt!648350)))

(declare-fun b!1486131 () Bool)

(assert (=> b!1486131 (and (bvsge (index!51518 lt!648350) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648350) (size!48591 lt!648174)))))

(declare-fun e!833115 () Bool)

(assert (=> b!1486131 (= e!833115 (= (select (arr!48041 lt!648174) (index!51518 lt!648350)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1486132 () Bool)

(assert (=> b!1486132 (and (bvsge (index!51518 lt!648350) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648350) (size!48591 lt!648174)))))

(declare-fun res!1010551 () Bool)

(assert (=> b!1486132 (= res!1010551 (= (select (arr!48041 lt!648174) (index!51518 lt!648350)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486132 (=> res!1010551 e!833115)))

(declare-fun b!1486133 () Bool)

(assert (=> b!1486133 (= e!833111 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648175 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!648175 lt!648174 mask!2687))))

(declare-fun b!1486134 () Bool)

(assert (=> b!1486134 (and (bvsge (index!51518 lt!648350) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648350) (size!48591 lt!648174)))))

(declare-fun res!1010552 () Bool)

(assert (=> b!1486134 (= res!1010552 (= (select (arr!48041 lt!648174) (index!51518 lt!648350)) lt!648175))))

(assert (=> b!1486134 (=> res!1010552 e!833115)))

(assert (=> b!1486134 (= e!833114 e!833115)))

(assert (= (and d!156493 c!137312) b!1486130))

(assert (= (and d!156493 (not c!137312)) b!1486129))

(assert (= (and b!1486129 c!137311) b!1486127))

(assert (= (and b!1486129 (not c!137311)) b!1486133))

(assert (= (and d!156493 c!137313) b!1486128))

(assert (= (and d!156493 (not c!137313)) b!1486126))

(assert (= (and b!1486126 res!1010553) b!1486134))

(assert (= (and b!1486134 (not res!1010552)) b!1486132))

(assert (= (and b!1486132 (not res!1010551)) b!1486131))

(declare-fun m!1371083 () Bool)

(assert (=> b!1486132 m!1371083))

(assert (=> b!1486133 m!1370783))

(declare-fun m!1371085 () Bool)

(assert (=> b!1486133 m!1371085))

(assert (=> b!1486133 m!1371085))

(declare-fun m!1371087 () Bool)

(assert (=> b!1486133 m!1371087))

(assert (=> b!1486134 m!1371083))

(assert (=> d!156493 m!1370783))

(declare-fun m!1371089 () Bool)

(assert (=> d!156493 m!1371089))

(assert (=> d!156493 m!1370803))

(assert (=> b!1486131 m!1371083))

(assert (=> b!1485691 d!156493))

(declare-fun d!156495 () Bool)

(declare-fun lt!648353 () (_ BitVec 32))

(declare-fun lt!648352 () (_ BitVec 32))

(assert (=> d!156495 (= lt!648353 (bvmul (bvxor lt!648352 (bvlshr lt!648352 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156495 (= lt!648352 ((_ extract 31 0) (bvand (bvxor lt!648175 (bvlshr lt!648175 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156495 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1010546 (let ((h!35916 ((_ extract 31 0) (bvand (bvxor lt!648175 (bvlshr lt!648175 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133106 (bvmul (bvxor h!35916 (bvlshr h!35916 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133106 (bvlshr x!133106 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1010546 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1010546 #b00000000000000000000000000000000))))))

(assert (=> d!156495 (= (toIndex!0 lt!648175 mask!2687) (bvand (bvxor lt!648353 (bvlshr lt!648353 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1485691 d!156495))

(declare-fun b!1486135 () Bool)

(declare-fun e!833118 () SeekEntryResult!12281)

(declare-fun lt!648354 () SeekEntryResult!12281)

(assert (=> b!1486135 (= e!833118 (Found!12281 (index!51518 lt!648354)))))

(declare-fun b!1486136 () Bool)

(declare-fun c!137315 () Bool)

(declare-fun lt!648355 () (_ BitVec 64))

(assert (=> b!1486136 (= c!137315 (= lt!648355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833116 () SeekEntryResult!12281)

(assert (=> b!1486136 (= e!833118 e!833116)))

(declare-fun d!156497 () Bool)

(declare-fun lt!648356 () SeekEntryResult!12281)

(assert (=> d!156497 (and (or (is-Undefined!12281 lt!648356) (not (is-Found!12281 lt!648356)) (and (bvsge (index!51517 lt!648356) #b00000000000000000000000000000000) (bvslt (index!51517 lt!648356) (size!48591 a!2862)))) (or (is-Undefined!12281 lt!648356) (is-Found!12281 lt!648356) (not (is-MissingZero!12281 lt!648356)) (and (bvsge (index!51516 lt!648356) #b00000000000000000000000000000000) (bvslt (index!51516 lt!648356) (size!48591 a!2862)))) (or (is-Undefined!12281 lt!648356) (is-Found!12281 lt!648356) (is-MissingZero!12281 lt!648356) (not (is-MissingVacant!12281 lt!648356)) (and (bvsge (index!51519 lt!648356) #b00000000000000000000000000000000) (bvslt (index!51519 lt!648356) (size!48591 a!2862)))) (or (is-Undefined!12281 lt!648356) (ite (is-Found!12281 lt!648356) (= (select (arr!48041 a!2862) (index!51517 lt!648356)) (select (arr!48041 a!2862) j!93)) (ite (is-MissingZero!12281 lt!648356) (= (select (arr!48041 a!2862) (index!51516 lt!648356)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12281 lt!648356) (= (select (arr!48041 a!2862) (index!51519 lt!648356)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!833117 () SeekEntryResult!12281)

(assert (=> d!156497 (= lt!648356 e!833117)))

(declare-fun c!137314 () Bool)

(assert (=> d!156497 (= c!137314 (and (is-Intermediate!12281 lt!648354) (undefined!13093 lt!648354)))))

(assert (=> d!156497 (= lt!648354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48041 a!2862) j!93) mask!2687) (select (arr!48041 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156497 (validMask!0 mask!2687)))

(assert (=> d!156497 (= (seekEntryOrOpen!0 (select (arr!48041 a!2862) j!93) a!2862 mask!2687) lt!648356)))

(declare-fun b!1486137 () Bool)

(assert (=> b!1486137 (= e!833116 (MissingZero!12281 (index!51518 lt!648354)))))

(declare-fun b!1486138 () Bool)

(assert (=> b!1486138 (= e!833117 Undefined!12281)))

(declare-fun b!1486139 () Bool)

(assert (=> b!1486139 (= e!833117 e!833118)))

(assert (=> b!1486139 (= lt!648355 (select (arr!48041 a!2862) (index!51518 lt!648354)))))

(declare-fun c!137316 () Bool)

(assert (=> b!1486139 (= c!137316 (= lt!648355 (select (arr!48041 a!2862) j!93)))))

(declare-fun b!1486140 () Bool)

(assert (=> b!1486140 (= e!833116 (seekKeyOrZeroReturnVacant!0 (x!133093 lt!648354) (index!51518 lt!648354) (index!51518 lt!648354) (select (arr!48041 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!156497 c!137314) b!1486138))

(assert (= (and d!156497 (not c!137314)) b!1486139))

(assert (= (and b!1486139 c!137316) b!1486135))

(assert (= (and b!1486139 (not c!137316)) b!1486136))

(assert (= (and b!1486136 c!137315) b!1486137))

(assert (= (and b!1486136 (not c!137315)) b!1486140))

(declare-fun m!1371091 () Bool)

(assert (=> d!156497 m!1371091))

(assert (=> d!156497 m!1370775))

(assert (=> d!156497 m!1370821))

(declare-fun m!1371093 () Bool)

(assert (=> d!156497 m!1371093))

(assert (=> d!156497 m!1370821))

(assert (=> d!156497 m!1370775))

(assert (=> d!156497 m!1370823))

(assert (=> d!156497 m!1370803))

(declare-fun m!1371099 () Bool)

(assert (=> d!156497 m!1371099))

(declare-fun m!1371101 () Bool)

(assert (=> b!1486139 m!1371101))

(assert (=> b!1486140 m!1370775))

(declare-fun m!1371105 () Bool)

(assert (=> b!1486140 m!1371105))

(assert (=> b!1485690 d!156497))

(declare-fun b!1486145 () Bool)

(declare-fun e!833123 () Bool)

(declare-fun e!833125 () Bool)

(assert (=> b!1486145 (= e!833123 e!833125)))

(declare-fun res!1010558 () Bool)

(declare-fun lt!648360 () SeekEntryResult!12281)

(assert (=> b!1486145 (= res!1010558 (and (is-Intermediate!12281 lt!648360) (not (undefined!13093 lt!648360)) (bvslt (x!133093 lt!648360) #b01111111111111111111111111111110) (bvsge (x!133093 lt!648360) #b00000000000000000000000000000000) (bvsge (x!133093 lt!648360) x!665)))))

(assert (=> b!1486145 (=> (not res!1010558) (not e!833125))))

(declare-fun b!1486146 () Bool)

(declare-fun e!833122 () SeekEntryResult!12281)

(assert (=> b!1486146 (= e!833122 (Intermediate!12281 false index!646 x!665))))

(declare-fun b!1486147 () Bool)

(assert (=> b!1486147 (= e!833123 (bvsge (x!133093 lt!648360) #b01111111111111111111111111111110))))

(declare-fun b!1486148 () Bool)

(declare-fun e!833124 () SeekEntryResult!12281)

(assert (=> b!1486148 (= e!833124 e!833122)))

(declare-fun lt!648361 () (_ BitVec 64))

(declare-fun c!137318 () Bool)

(assert (=> b!1486148 (= c!137318 (or (= lt!648361 (select (arr!48041 a!2862) j!93)) (= (bvadd lt!648361 lt!648361) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486149 () Bool)

(assert (=> b!1486149 (= e!833124 (Intermediate!12281 true index!646 x!665))))

(declare-fun d!156499 () Bool)

(assert (=> d!156499 e!833123))

(declare-fun c!137320 () Bool)

(assert (=> d!156499 (= c!137320 (and (is-Intermediate!12281 lt!648360) (undefined!13093 lt!648360)))))

(assert (=> d!156499 (= lt!648360 e!833124)))

(declare-fun c!137319 () Bool)

(assert (=> d!156499 (= c!137319 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156499 (= lt!648361 (select (arr!48041 a!2862) index!646))))

(assert (=> d!156499 (validMask!0 mask!2687)))

(assert (=> d!156499 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48041 a!2862) j!93) a!2862 mask!2687) lt!648360)))

(declare-fun b!1486150 () Bool)

(assert (=> b!1486150 (and (bvsge (index!51518 lt!648360) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648360) (size!48591 a!2862)))))

(declare-fun e!833126 () Bool)

(assert (=> b!1486150 (= e!833126 (= (select (arr!48041 a!2862) (index!51518 lt!648360)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1486151 () Bool)

(assert (=> b!1486151 (and (bvsge (index!51518 lt!648360) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648360) (size!48591 a!2862)))))

(declare-fun res!1010556 () Bool)

(assert (=> b!1486151 (= res!1010556 (= (select (arr!48041 a!2862) (index!51518 lt!648360)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486151 (=> res!1010556 e!833126)))

(declare-fun b!1486152 () Bool)

(assert (=> b!1486152 (= e!833122 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48041 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1486153 () Bool)

(assert (=> b!1486153 (and (bvsge (index!51518 lt!648360) #b00000000000000000000000000000000) (bvslt (index!51518 lt!648360) (size!48591 a!2862)))))

(declare-fun res!1010557 () Bool)

(assert (=> b!1486153 (= res!1010557 (= (select (arr!48041 a!2862) (index!51518 lt!648360)) (select (arr!48041 a!2862) j!93)))))

(assert (=> b!1486153 (=> res!1010557 e!833126)))

(assert (=> b!1486153 (= e!833125 e!833126)))

(assert (= (and d!156499 c!137319) b!1486149))

(assert (= (and d!156499 (not c!137319)) b!1486148))

(assert (= (and b!1486148 c!137318) b!1486146))

(assert (= (and b!1486148 (not c!137318)) b!1486152))

(assert (= (and d!156499 c!137320) b!1486147))

(assert (= (and d!156499 (not c!137320)) b!1486145))

(assert (= (and b!1486145 res!1010558) b!1486153))

(assert (= (and b!1486153 (not res!1010557)) b!1486151))

(assert (= (and b!1486151 (not res!1010556)) b!1486150))

(declare-fun m!1371107 () Bool)

(assert (=> b!1486151 m!1371107))

(assert (=> b!1486152 m!1370811))

(assert (=> b!1486152 m!1370811))

(assert (=> b!1486152 m!1370775))

(declare-fun m!1371109 () Bool)

(assert (=> b!1486152 m!1371109))

(assert (=> b!1486153 m!1371107))

(assert (=> d!156499 m!1370777))

(assert (=> d!156499 m!1370803))

(assert (=> b!1486150 m!1371107))

(assert (=> b!1485689 d!156499))

(declare-fun b!1486154 () Bool)

(declare-fun e!833127 () Bool)

(declare-fun e!833129 () Bool)

(assert (=> b!1486154 (= e!833127 e!833129)))

(declare-fun lt!648362 () (_ BitVec 64))

(assert (=> b!1486154 (= lt!648362 (select (arr!48041 a!2862) j!93))))

(declare-fun lt!648363 () Unit!49902)

(assert (=> b!1486154 (= lt!648363 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648362 j!93))))

(assert (=> b!1486154 (arrayContainsKey!0 a!2862 lt!648362 #b00000000000000000000000000000000)))

(declare-fun lt!648364 () Unit!49902)

(assert (=> b!1486154 (= lt!648364 lt!648363)))

(declare-fun res!1010559 () Bool)

(assert (=> b!1486154 (= res!1010559 (= (seekEntryOrOpen!0 (select (arr!48041 a!2862) j!93) a!2862 mask!2687) (Found!12281 j!93)))))

(assert (=> b!1486154 (=> (not res!1010559) (not e!833129))))

(declare-fun bm!67887 () Bool)

(declare-fun call!67890 () Bool)

(assert (=> bm!67887 (= call!67890 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1486155 () Bool)

(assert (=> b!1486155 (= e!833127 call!67890)))

(declare-fun b!1486156 () Bool)

(declare-fun e!833128 () Bool)

(assert (=> b!1486156 (= e!833128 e!833127)))

(declare-fun c!137321 () Bool)

(assert (=> b!1486156 (= c!137321 (validKeyInArray!0 (select (arr!48041 a!2862) j!93)))))

(declare-fun d!156503 () Bool)

(declare-fun res!1010560 () Bool)

(assert (=> d!156503 (=> res!1010560 e!833128)))

(assert (=> d!156503 (= res!1010560 (bvsge j!93 (size!48591 a!2862)))))

(assert (=> d!156503 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!833128)))

(declare-fun b!1486157 () Bool)

(assert (=> b!1486157 (= e!833129 call!67890)))

(assert (= (and d!156503 (not res!1010560)) b!1486156))

(assert (= (and b!1486156 c!137321) b!1486154))

(assert (= (and b!1486156 (not c!137321)) b!1486155))

(assert (= (and b!1486154 res!1010559) b!1486157))

(assert (= (or b!1486157 b!1486155) bm!67887))

(assert (=> b!1486154 m!1370775))

(declare-fun m!1371111 () Bool)

(assert (=> b!1486154 m!1371111))

(declare-fun m!1371113 () Bool)

(assert (=> b!1486154 m!1371113))

(assert (=> b!1486154 m!1370775))

(assert (=> b!1486154 m!1370813))

(declare-fun m!1371115 () Bool)

(assert (=> bm!67887 m!1371115))

(assert (=> b!1486156 m!1370775))

(assert (=> b!1486156 m!1370775))

(assert (=> b!1486156 m!1370795))

(assert (=> b!1485688 d!156503))

(declare-fun d!156505 () Bool)

(assert (=> d!156505 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!648372 () Unit!49902)

(declare-fun choose!38 (array!99530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49902)

(assert (=> d!156505 (= lt!648372 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156505 (validMask!0 mask!2687)))

(assert (=> d!156505 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!648372)))

(declare-fun bs!42763 () Bool)

(assert (= bs!42763 d!156505))

(assert (=> bs!42763 m!1370791))

(declare-fun m!1371127 () Bool)

(assert (=> bs!42763 m!1371127))

(assert (=> bs!42763 m!1370803))

(assert (=> b!1485688 d!156505))

(declare-fun d!156511 () Bool)

(declare-fun res!1010576 () Bool)

(declare-fun e!833153 () Bool)

(assert (=> d!156511 (=> res!1010576 e!833153)))

(assert (=> d!156511 (= res!1010576 (bvsge #b00000000000000000000000000000000 (size!48591 a!2862)))))

(assert (=> d!156511 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34539) e!833153)))

(declare-fun b!1486190 () Bool)

(declare-fun e!833152 () Bool)

(declare-fun e!833151 () Bool)

(assert (=> b!1486190 (= e!833152 e!833151)))

(declare-fun c!137331 () Bool)

(assert (=> b!1486190 (= c!137331 (validKeyInArray!0 (select (arr!48041 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1486191 () Bool)

(declare-fun e!833154 () Bool)

(declare-fun contains!9918 (List!34542 (_ BitVec 64)) Bool)

(assert (=> b!1486191 (= e!833154 (contains!9918 Nil!34539 (select (arr!48041 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67891 () Bool)

(declare-fun call!67894 () Bool)

(assert (=> bm!67891 (= call!67894 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137331 (Cons!34538 (select (arr!48041 a!2862) #b00000000000000000000000000000000) Nil!34539) Nil!34539)))))

(declare-fun b!1486192 () Bool)

(assert (=> b!1486192 (= e!833151 call!67894)))

(declare-fun b!1486193 () Bool)

(assert (=> b!1486193 (= e!833153 e!833152)))

(declare-fun res!1010577 () Bool)

(assert (=> b!1486193 (=> (not res!1010577) (not e!833152))))

(assert (=> b!1486193 (= res!1010577 (not e!833154))))

(declare-fun res!1010578 () Bool)

(assert (=> b!1486193 (=> (not res!1010578) (not e!833154))))

(assert (=> b!1486193 (= res!1010578 (validKeyInArray!0 (select (arr!48041 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1486194 () Bool)

(assert (=> b!1486194 (= e!833151 call!67894)))

(assert (= (and d!156511 (not res!1010576)) b!1486193))

(assert (= (and b!1486193 res!1010578) b!1486191))

(assert (= (and b!1486193 res!1010577) b!1486190))

(assert (= (and b!1486190 c!137331) b!1486192))

(assert (= (and b!1486190 (not c!137331)) b!1486194))

(assert (= (or b!1486192 b!1486194) bm!67891))

(assert (=> b!1486190 m!1370973))

(assert (=> b!1486190 m!1370973))

(assert (=> b!1486190 m!1370983))

(assert (=> b!1486191 m!1370973))

(assert (=> b!1486191 m!1370973))

(declare-fun m!1371141 () Bool)

(assert (=> b!1486191 m!1371141))

(assert (=> bm!67891 m!1370973))

(declare-fun m!1371143 () Bool)

(assert (=> bm!67891 m!1371143))

(assert (=> b!1486193 m!1370973))

(assert (=> b!1486193 m!1370973))

(assert (=> b!1486193 m!1370983))

(assert (=> b!1485699 d!156511))

(declare-fun d!156521 () Bool)

(assert (=> d!156521 (= (validKeyInArray!0 (select (arr!48041 a!2862) j!93)) (and (not (= (select (arr!48041 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48041 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1485686 d!156521))

(declare-fun d!156525 () Bool)

(assert (=> d!156525 (= (validKeyInArray!0 (select (arr!48041 a!2862) i!1006)) (and (not (= (select (arr!48041 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48041 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1485696 d!156525))

(push 1)

(assert (not b!1486193))

(assert (not b!1485985))

(assert (not b!1486156))

(assert (not b!1486190))

(assert (not d!156505))

(assert (not bm!67891))

(assert (not d!156489))

(assert (not d!156469))

(assert (not b!1486191))

(assert (not d!156493))

(assert (not d!156481))

(assert (not b!1486140))

(assert (not b!1486154))

(assert (not b!1486152))

(assert (not d!156497))

(assert (not d!156461))

(assert (not b!1486133))

(assert (not bm!67887))

(assert (not bm!67880))

(assert (not b!1486045))

(assert (not d!156499))

(assert (not b!1485914))

(assert (not b!1486116))

(assert (not b!1485912))

(assert (not b!1486101))

(assert (not d!156485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

