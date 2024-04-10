; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131386 () Bool)

(assert start!131386)

(declare-fun b!1540535 () Bool)

(declare-fun e!856782 () Bool)

(declare-fun e!856783 () Bool)

(assert (=> b!1540535 (= e!856782 e!856783)))

(declare-fun res!1057232 () Bool)

(assert (=> b!1540535 (=> (not res!1057232) (not e!856783))))

(declare-datatypes ((SeekEntryResult!13503 0))(
  ( (MissingZero!13503 (index!56407 (_ BitVec 32))) (Found!13503 (index!56408 (_ BitVec 32))) (Intermediate!13503 (undefined!14315 Bool) (index!56409 (_ BitVec 32)) (x!138142 (_ BitVec 32))) (Undefined!13503) (MissingVacant!13503 (index!56410 (_ BitVec 32))) )
))
(declare-fun lt!665403 () SeekEntryResult!13503)

(declare-fun lt!665400 () SeekEntryResult!13503)

(assert (=> b!1540535 (= res!1057232 (= lt!665403 lt!665400))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102334 0))(
  ( (array!102335 (arr!49377 (Array (_ BitVec 32) (_ BitVec 64))) (size!49927 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102334)

(declare-fun lt!665401 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102334 (_ BitVec 32)) SeekEntryResult!13503)

(assert (=> b!1540535 (= lt!665403 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 (select (arr!49377 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540536 () Bool)

(declare-fun res!1057231 () Bool)

(declare-fun e!856786 () Bool)

(assert (=> b!1540536 (=> (not res!1057231) (not e!856786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102334 (_ BitVec 32)) Bool)

(assert (=> b!1540536 (= res!1057231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540537 () Bool)

(declare-fun res!1057229 () Bool)

(assert (=> b!1540537 (=> (not res!1057229) (not e!856786))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540537 (= res!1057229 (validKeyInArray!0 (select (arr!49377 a!2792) i!951)))))

(declare-fun b!1540538 () Bool)

(declare-fun res!1057226 () Bool)

(assert (=> b!1540538 (=> (not res!1057226) (not e!856786))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540538 (= res!1057226 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49927 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49927 a!2792)) (= (select (arr!49377 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540539 () Bool)

(declare-fun e!856785 () Bool)

(assert (=> b!1540539 (= e!856786 e!856785)))

(declare-fun res!1057234 () Bool)

(assert (=> b!1540539 (=> (not res!1057234) (not e!856785))))

(declare-fun lt!665402 () SeekEntryResult!13503)

(assert (=> b!1540539 (= res!1057234 (and (= lt!665402 lt!665400) (not (= (select (arr!49377 a!2792) index!463) (select (arr!49377 a!2792) j!64)))))))

(assert (=> b!1540539 (= lt!665400 (Found!13503 j!64))))

(assert (=> b!1540539 (= lt!665402 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49377 a!2792) j!64) a!2792 mask!2480))))

(declare-fun lt!665399 () array!102334)

(declare-fun lt!665398 () (_ BitVec 64))

(declare-fun b!1540540 () Bool)

(assert (=> b!1540540 (= e!856783 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!665398 lt!665399 mask!2480) lt!665402)))))

(assert (=> b!1540540 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 lt!665398 lt!665399 mask!2480) lt!665403)))

(assert (=> b!1540540 (= lt!665398 (select (store (arr!49377 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(assert (=> b!1540540 (= lt!665399 (array!102335 (store (arr!49377 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49927 a!2792)))))

(declare-datatypes ((Unit!51446 0))(
  ( (Unit!51447) )
))
(declare-fun lt!665404 () Unit!51446)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51446)

(assert (=> b!1540540 (= lt!665404 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 mask!2480))))

(declare-fun res!1057225 () Bool)

(assert (=> start!131386 (=> (not res!1057225) (not e!856786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131386 (= res!1057225 (validMask!0 mask!2480))))

(assert (=> start!131386 e!856786))

(assert (=> start!131386 true))

(declare-fun array_inv!38405 (array!102334) Bool)

(assert (=> start!131386 (array_inv!38405 a!2792)))

(declare-fun b!1540541 () Bool)

(declare-fun res!1057233 () Bool)

(assert (=> b!1540541 (=> (not res!1057233) (not e!856786))))

(declare-datatypes ((List!35851 0))(
  ( (Nil!35848) (Cons!35847 (h!37292 (_ BitVec 64)) (t!50545 List!35851)) )
))
(declare-fun arrayNoDuplicates!0 (array!102334 (_ BitVec 32) List!35851) Bool)

(assert (=> b!1540541 (= res!1057233 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35848))))

(declare-fun b!1540542 () Bool)

(assert (=> b!1540542 (= e!856785 e!856782)))

(declare-fun res!1057227 () Bool)

(assert (=> b!1540542 (=> (not res!1057227) (not e!856782))))

(assert (=> b!1540542 (= res!1057227 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665401 #b00000000000000000000000000000000) (bvslt lt!665401 (size!49927 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540542 (= lt!665401 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540543 () Bool)

(declare-fun res!1057228 () Bool)

(assert (=> b!1540543 (=> (not res!1057228) (not e!856786))))

(assert (=> b!1540543 (= res!1057228 (validKeyInArray!0 (select (arr!49377 a!2792) j!64)))))

(declare-fun b!1540544 () Bool)

(declare-fun res!1057230 () Bool)

(assert (=> b!1540544 (=> (not res!1057230) (not e!856786))))

(assert (=> b!1540544 (= res!1057230 (and (= (size!49927 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49927 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49927 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131386 res!1057225) b!1540544))

(assert (= (and b!1540544 res!1057230) b!1540537))

(assert (= (and b!1540537 res!1057229) b!1540543))

(assert (= (and b!1540543 res!1057228) b!1540536))

(assert (= (and b!1540536 res!1057231) b!1540541))

(assert (= (and b!1540541 res!1057233) b!1540538))

(assert (= (and b!1540538 res!1057226) b!1540539))

(assert (= (and b!1540539 res!1057234) b!1540542))

(assert (= (and b!1540542 res!1057227) b!1540535))

(assert (= (and b!1540535 res!1057232) b!1540540))

(declare-fun m!1422657 () Bool)

(assert (=> b!1540538 m!1422657))

(declare-fun m!1422659 () Bool)

(assert (=> start!131386 m!1422659))

(declare-fun m!1422661 () Bool)

(assert (=> start!131386 m!1422661))

(declare-fun m!1422663 () Bool)

(assert (=> b!1540540 m!1422663))

(declare-fun m!1422665 () Bool)

(assert (=> b!1540540 m!1422665))

(declare-fun m!1422667 () Bool)

(assert (=> b!1540540 m!1422667))

(declare-fun m!1422669 () Bool)

(assert (=> b!1540540 m!1422669))

(declare-fun m!1422671 () Bool)

(assert (=> b!1540540 m!1422671))

(declare-fun m!1422673 () Bool)

(assert (=> b!1540535 m!1422673))

(assert (=> b!1540535 m!1422673))

(declare-fun m!1422675 () Bool)

(assert (=> b!1540535 m!1422675))

(assert (=> b!1540543 m!1422673))

(assert (=> b!1540543 m!1422673))

(declare-fun m!1422677 () Bool)

(assert (=> b!1540543 m!1422677))

(declare-fun m!1422679 () Bool)

(assert (=> b!1540542 m!1422679))

(declare-fun m!1422681 () Bool)

(assert (=> b!1540539 m!1422681))

(assert (=> b!1540539 m!1422673))

(assert (=> b!1540539 m!1422673))

(declare-fun m!1422683 () Bool)

(assert (=> b!1540539 m!1422683))

(declare-fun m!1422685 () Bool)

(assert (=> b!1540541 m!1422685))

(declare-fun m!1422687 () Bool)

(assert (=> b!1540536 m!1422687))

(declare-fun m!1422689 () Bool)

(assert (=> b!1540537 m!1422689))

(assert (=> b!1540537 m!1422689))

(declare-fun m!1422691 () Bool)

(assert (=> b!1540537 m!1422691))

(check-sat (not b!1540539) (not b!1540542) (not b!1540535) (not b!1540541) (not b!1540543) (not b!1540537) (not start!131386) (not b!1540540) (not b!1540536))
(check-sat)
(get-model)

(declare-fun b!1540587 () Bool)

(declare-fun e!856810 () SeekEntryResult!13503)

(assert (=> b!1540587 (= e!856810 (Found!13503 index!463))))

(declare-fun b!1540588 () Bool)

(declare-fun e!856808 () SeekEntryResult!13503)

(assert (=> b!1540588 (= e!856808 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 lt!665398 lt!665399 mask!2480))))

(declare-fun b!1540590 () Bool)

(declare-fun e!856809 () SeekEntryResult!13503)

(assert (=> b!1540590 (= e!856809 e!856810)))

(declare-fun c!141221 () Bool)

(declare-fun lt!665431 () (_ BitVec 64))

(assert (=> b!1540590 (= c!141221 (= lt!665431 lt!665398))))

(declare-fun b!1540591 () Bool)

(declare-fun c!141219 () Bool)

(assert (=> b!1540591 (= c!141219 (= lt!665431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540591 (= e!856810 e!856808)))

(declare-fun b!1540592 () Bool)

(assert (=> b!1540592 (= e!856808 (MissingVacant!13503 vacantIndex!5))))

(declare-fun b!1540589 () Bool)

(assert (=> b!1540589 (= e!856809 Undefined!13503)))

(declare-fun lt!665430 () SeekEntryResult!13503)

(declare-fun d!160543 () Bool)

(get-info :version)

(assert (=> d!160543 (and (or ((_ is Undefined!13503) lt!665430) (not ((_ is Found!13503) lt!665430)) (and (bvsge (index!56408 lt!665430) #b00000000000000000000000000000000) (bvslt (index!56408 lt!665430) (size!49927 lt!665399)))) (or ((_ is Undefined!13503) lt!665430) ((_ is Found!13503) lt!665430) (not ((_ is MissingVacant!13503) lt!665430)) (not (= (index!56410 lt!665430) vacantIndex!5)) (and (bvsge (index!56410 lt!665430) #b00000000000000000000000000000000) (bvslt (index!56410 lt!665430) (size!49927 lt!665399)))) (or ((_ is Undefined!13503) lt!665430) (ite ((_ is Found!13503) lt!665430) (= (select (arr!49377 lt!665399) (index!56408 lt!665430)) lt!665398) (and ((_ is MissingVacant!13503) lt!665430) (= (index!56410 lt!665430) vacantIndex!5) (= (select (arr!49377 lt!665399) (index!56410 lt!665430)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160543 (= lt!665430 e!856809)))

(declare-fun c!141220 () Bool)

(assert (=> d!160543 (= c!141220 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160543 (= lt!665431 (select (arr!49377 lt!665399) index!463))))

(assert (=> d!160543 (validMask!0 mask!2480)))

(assert (=> d!160543 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!665398 lt!665399 mask!2480) lt!665430)))

(assert (= (and d!160543 c!141220) b!1540589))

(assert (= (and d!160543 (not c!141220)) b!1540590))

(assert (= (and b!1540590 c!141221) b!1540587))

(assert (= (and b!1540590 (not c!141221)) b!1540591))

(assert (= (and b!1540591 c!141219) b!1540592))

(assert (= (and b!1540591 (not c!141219)) b!1540588))

(assert (=> b!1540588 m!1422679))

(assert (=> b!1540588 m!1422679))

(declare-fun m!1422729 () Bool)

(assert (=> b!1540588 m!1422729))

(declare-fun m!1422731 () Bool)

(assert (=> d!160543 m!1422731))

(declare-fun m!1422733 () Bool)

(assert (=> d!160543 m!1422733))

(declare-fun m!1422735 () Bool)

(assert (=> d!160543 m!1422735))

(assert (=> d!160543 m!1422659))

(assert (=> b!1540540 d!160543))

(declare-fun b!1540593 () Bool)

(declare-fun e!856813 () SeekEntryResult!13503)

(assert (=> b!1540593 (= e!856813 (Found!13503 lt!665401))))

(declare-fun b!1540594 () Bool)

(declare-fun e!856811 () SeekEntryResult!13503)

(assert (=> b!1540594 (= e!856811 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!665401 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 lt!665398 lt!665399 mask!2480))))

(declare-fun b!1540596 () Bool)

(declare-fun e!856812 () SeekEntryResult!13503)

(assert (=> b!1540596 (= e!856812 e!856813)))

(declare-fun c!141224 () Bool)

(declare-fun lt!665433 () (_ BitVec 64))

(assert (=> b!1540596 (= c!141224 (= lt!665433 lt!665398))))

(declare-fun b!1540597 () Bool)

(declare-fun c!141222 () Bool)

(assert (=> b!1540597 (= c!141222 (= lt!665433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540597 (= e!856813 e!856811)))

(declare-fun b!1540598 () Bool)

(assert (=> b!1540598 (= e!856811 (MissingVacant!13503 vacantIndex!5))))

(declare-fun b!1540595 () Bool)

(assert (=> b!1540595 (= e!856812 Undefined!13503)))

(declare-fun d!160545 () Bool)

(declare-fun lt!665432 () SeekEntryResult!13503)

(assert (=> d!160545 (and (or ((_ is Undefined!13503) lt!665432) (not ((_ is Found!13503) lt!665432)) (and (bvsge (index!56408 lt!665432) #b00000000000000000000000000000000) (bvslt (index!56408 lt!665432) (size!49927 lt!665399)))) (or ((_ is Undefined!13503) lt!665432) ((_ is Found!13503) lt!665432) (not ((_ is MissingVacant!13503) lt!665432)) (not (= (index!56410 lt!665432) vacantIndex!5)) (and (bvsge (index!56410 lt!665432) #b00000000000000000000000000000000) (bvslt (index!56410 lt!665432) (size!49927 lt!665399)))) (or ((_ is Undefined!13503) lt!665432) (ite ((_ is Found!13503) lt!665432) (= (select (arr!49377 lt!665399) (index!56408 lt!665432)) lt!665398) (and ((_ is MissingVacant!13503) lt!665432) (= (index!56410 lt!665432) vacantIndex!5) (= (select (arr!49377 lt!665399) (index!56410 lt!665432)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160545 (= lt!665432 e!856812)))

(declare-fun c!141223 () Bool)

(assert (=> d!160545 (= c!141223 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!160545 (= lt!665433 (select (arr!49377 lt!665399) lt!665401))))

(assert (=> d!160545 (validMask!0 mask!2480)))

(assert (=> d!160545 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 lt!665398 lt!665399 mask!2480) lt!665432)))

(assert (= (and d!160545 c!141223) b!1540595))

(assert (= (and d!160545 (not c!141223)) b!1540596))

(assert (= (and b!1540596 c!141224) b!1540593))

(assert (= (and b!1540596 (not c!141224)) b!1540597))

(assert (= (and b!1540597 c!141222) b!1540598))

(assert (= (and b!1540597 (not c!141222)) b!1540594))

(declare-fun m!1422737 () Bool)

(assert (=> b!1540594 m!1422737))

(assert (=> b!1540594 m!1422737))

(declare-fun m!1422739 () Bool)

(assert (=> b!1540594 m!1422739))

(declare-fun m!1422741 () Bool)

(assert (=> d!160545 m!1422741))

(declare-fun m!1422743 () Bool)

(assert (=> d!160545 m!1422743))

(declare-fun m!1422745 () Bool)

(assert (=> d!160545 m!1422745))

(assert (=> d!160545 m!1422659))

(assert (=> b!1540540 d!160545))

(declare-fun d!160547 () Bool)

(declare-fun e!856816 () Bool)

(assert (=> d!160547 e!856816))

(declare-fun res!1057267 () Bool)

(assert (=> d!160547 (=> (not res!1057267) (not e!856816))))

(assert (=> d!160547 (= res!1057267 (and (or (bvslt i!951 #b00000000000000000000000000000000) (bvsge i!951 (size!49927 a!2792)) (and (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49927 a!2792)))) (or (bvslt i!951 #b00000000000000000000000000000000) (bvsge i!951 (size!49927 a!2792)) (and (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49927 a!2792)))) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49927 a!2792))))))

(declare-fun lt!665436 () Unit!51446)

(declare-fun choose!81 (array!102334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51446)

(assert (=> d!160547 (= lt!665436 (choose!81 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 mask!2480))))

(assert (=> d!160547 (validMask!0 mask!2480)))

(assert (=> d!160547 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 mask!2480) lt!665436)))

(declare-fun b!1540601 () Bool)

(assert (=> b!1540601 (= e!856816 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 (select (store (arr!49377 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102335 (store (arr!49377 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49927 a!2792)) mask!2480) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 (select (arr!49377 a!2792) j!64) a!2792 mask!2480)))))

(assert (= (and d!160547 res!1057267) b!1540601))

(declare-fun m!1422747 () Bool)

(assert (=> d!160547 m!1422747))

(assert (=> d!160547 m!1422659))

(assert (=> b!1540601 m!1422671))

(assert (=> b!1540601 m!1422663))

(assert (=> b!1540601 m!1422663))

(declare-fun m!1422749 () Bool)

(assert (=> b!1540601 m!1422749))

(assert (=> b!1540601 m!1422673))

(assert (=> b!1540601 m!1422675))

(assert (=> b!1540601 m!1422673))

(assert (=> b!1540540 d!160547))

(declare-fun b!1540602 () Bool)

(declare-fun e!856819 () SeekEntryResult!13503)

(assert (=> b!1540602 (= e!856819 (Found!13503 index!463))))

(declare-fun e!856817 () SeekEntryResult!13503)

(declare-fun b!1540603 () Bool)

(assert (=> b!1540603 (= e!856817 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49377 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540605 () Bool)

(declare-fun e!856818 () SeekEntryResult!13503)

(assert (=> b!1540605 (= e!856818 e!856819)))

(declare-fun c!141227 () Bool)

(declare-fun lt!665438 () (_ BitVec 64))

(assert (=> b!1540605 (= c!141227 (= lt!665438 (select (arr!49377 a!2792) j!64)))))

(declare-fun b!1540606 () Bool)

(declare-fun c!141225 () Bool)

(assert (=> b!1540606 (= c!141225 (= lt!665438 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540606 (= e!856819 e!856817)))

(declare-fun b!1540607 () Bool)

(assert (=> b!1540607 (= e!856817 (MissingVacant!13503 vacantIndex!5))))

(declare-fun b!1540604 () Bool)

(assert (=> b!1540604 (= e!856818 Undefined!13503)))

(declare-fun d!160549 () Bool)

(declare-fun lt!665437 () SeekEntryResult!13503)

(assert (=> d!160549 (and (or ((_ is Undefined!13503) lt!665437) (not ((_ is Found!13503) lt!665437)) (and (bvsge (index!56408 lt!665437) #b00000000000000000000000000000000) (bvslt (index!56408 lt!665437) (size!49927 a!2792)))) (or ((_ is Undefined!13503) lt!665437) ((_ is Found!13503) lt!665437) (not ((_ is MissingVacant!13503) lt!665437)) (not (= (index!56410 lt!665437) vacantIndex!5)) (and (bvsge (index!56410 lt!665437) #b00000000000000000000000000000000) (bvslt (index!56410 lt!665437) (size!49927 a!2792)))) (or ((_ is Undefined!13503) lt!665437) (ite ((_ is Found!13503) lt!665437) (= (select (arr!49377 a!2792) (index!56408 lt!665437)) (select (arr!49377 a!2792) j!64)) (and ((_ is MissingVacant!13503) lt!665437) (= (index!56410 lt!665437) vacantIndex!5) (= (select (arr!49377 a!2792) (index!56410 lt!665437)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160549 (= lt!665437 e!856818)))

(declare-fun c!141226 () Bool)

(assert (=> d!160549 (= c!141226 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160549 (= lt!665438 (select (arr!49377 a!2792) index!463))))

(assert (=> d!160549 (validMask!0 mask!2480)))

(assert (=> d!160549 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49377 a!2792) j!64) a!2792 mask!2480) lt!665437)))

(assert (= (and d!160549 c!141226) b!1540604))

(assert (= (and d!160549 (not c!141226)) b!1540605))

(assert (= (and b!1540605 c!141227) b!1540602))

(assert (= (and b!1540605 (not c!141227)) b!1540606))

(assert (= (and b!1540606 c!141225) b!1540607))

(assert (= (and b!1540606 (not c!141225)) b!1540603))

(assert (=> b!1540603 m!1422679))

(assert (=> b!1540603 m!1422679))

(assert (=> b!1540603 m!1422673))

(declare-fun m!1422751 () Bool)

(assert (=> b!1540603 m!1422751))

(declare-fun m!1422753 () Bool)

(assert (=> d!160549 m!1422753))

(declare-fun m!1422755 () Bool)

(assert (=> d!160549 m!1422755))

(assert (=> d!160549 m!1422681))

(assert (=> d!160549 m!1422659))

(assert (=> b!1540539 d!160549))

(declare-fun d!160551 () Bool)

(declare-fun res!1057273 () Bool)

(declare-fun e!856828 () Bool)

(assert (=> d!160551 (=> res!1057273 e!856828)))

(assert (=> d!160551 (= res!1057273 (bvsge #b00000000000000000000000000000000 (size!49927 a!2792)))))

(assert (=> d!160551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856828)))

(declare-fun bm!68652 () Bool)

(declare-fun call!68655 () Bool)

(assert (=> bm!68652 (= call!68655 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1540616 () Bool)

(declare-fun e!856826 () Bool)

(assert (=> b!1540616 (= e!856828 e!856826)))

(declare-fun c!141230 () Bool)

(assert (=> b!1540616 (= c!141230 (validKeyInArray!0 (select (arr!49377 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540617 () Bool)

(declare-fun e!856827 () Bool)

(assert (=> b!1540617 (= e!856827 call!68655)))

(declare-fun b!1540618 () Bool)

(assert (=> b!1540618 (= e!856826 call!68655)))

(declare-fun b!1540619 () Bool)

(assert (=> b!1540619 (= e!856826 e!856827)))

(declare-fun lt!665447 () (_ BitVec 64))

(assert (=> b!1540619 (= lt!665447 (select (arr!49377 a!2792) #b00000000000000000000000000000000))))

(declare-fun lt!665445 () Unit!51446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102334 (_ BitVec 64) (_ BitVec 32)) Unit!51446)

(assert (=> b!1540619 (= lt!665445 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665447 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1540619 (arrayContainsKey!0 a!2792 lt!665447 #b00000000000000000000000000000000)))

(declare-fun lt!665446 () Unit!51446)

(assert (=> b!1540619 (= lt!665446 lt!665445)))

(declare-fun res!1057272 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102334 (_ BitVec 32)) SeekEntryResult!13503)

(assert (=> b!1540619 (= res!1057272 (= (seekEntryOrOpen!0 (select (arr!49377 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13503 #b00000000000000000000000000000000)))))

(assert (=> b!1540619 (=> (not res!1057272) (not e!856827))))

(assert (= (and d!160551 (not res!1057273)) b!1540616))

(assert (= (and b!1540616 c!141230) b!1540619))

(assert (= (and b!1540616 (not c!141230)) b!1540618))

(assert (= (and b!1540619 res!1057272) b!1540617))

(assert (= (or b!1540617 b!1540618) bm!68652))

(declare-fun m!1422757 () Bool)

(assert (=> bm!68652 m!1422757))

(declare-fun m!1422759 () Bool)

(assert (=> b!1540616 m!1422759))

(assert (=> b!1540616 m!1422759))

(declare-fun m!1422761 () Bool)

(assert (=> b!1540616 m!1422761))

(assert (=> b!1540619 m!1422759))

(declare-fun m!1422763 () Bool)

(assert (=> b!1540619 m!1422763))

(declare-fun m!1422765 () Bool)

(assert (=> b!1540619 m!1422765))

(assert (=> b!1540619 m!1422759))

(declare-fun m!1422767 () Bool)

(assert (=> b!1540619 m!1422767))

(assert (=> b!1540536 d!160551))

(declare-fun b!1540638 () Bool)

(declare-fun e!856844 () Bool)

(declare-fun contains!10019 (List!35851 (_ BitVec 64)) Bool)

(assert (=> b!1540638 (= e!856844 (contains!10019 Nil!35848 (select (arr!49377 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540639 () Bool)

(declare-fun e!856846 () Bool)

(declare-fun e!856845 () Bool)

(assert (=> b!1540639 (= e!856846 e!856845)))

(declare-fun c!141235 () Bool)

(assert (=> b!1540639 (= c!141235 (validKeyInArray!0 (select (arr!49377 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540640 () Bool)

(declare-fun call!68660 () Bool)

(assert (=> b!1540640 (= e!856845 call!68660)))

(declare-fun d!160559 () Bool)

(declare-fun res!1057284 () Bool)

(declare-fun e!856843 () Bool)

(assert (=> d!160559 (=> res!1057284 e!856843)))

(assert (=> d!160559 (= res!1057284 (bvsge #b00000000000000000000000000000000 (size!49927 a!2792)))))

(assert (=> d!160559 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35848) e!856843)))

(declare-fun bm!68657 () Bool)

(assert (=> bm!68657 (= call!68660 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141235 (Cons!35847 (select (arr!49377 a!2792) #b00000000000000000000000000000000) Nil!35848) Nil!35848)))))

(declare-fun b!1540641 () Bool)

(assert (=> b!1540641 (= e!856843 e!856846)))

(declare-fun res!1057285 () Bool)

(assert (=> b!1540641 (=> (not res!1057285) (not e!856846))))

(assert (=> b!1540641 (= res!1057285 (not e!856844))))

(declare-fun res!1057286 () Bool)

(assert (=> b!1540641 (=> (not res!1057286) (not e!856844))))

(assert (=> b!1540641 (= res!1057286 (validKeyInArray!0 (select (arr!49377 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540642 () Bool)

(assert (=> b!1540642 (= e!856845 call!68660)))

(assert (= (and d!160559 (not res!1057284)) b!1540641))

(assert (= (and b!1540641 res!1057286) b!1540638))

(assert (= (and b!1540641 res!1057285) b!1540639))

(assert (= (and b!1540639 c!141235) b!1540642))

(assert (= (and b!1540639 (not c!141235)) b!1540640))

(assert (= (or b!1540642 b!1540640) bm!68657))

(assert (=> b!1540638 m!1422759))

(assert (=> b!1540638 m!1422759))

(declare-fun m!1422769 () Bool)

(assert (=> b!1540638 m!1422769))

(assert (=> b!1540639 m!1422759))

(assert (=> b!1540639 m!1422759))

(assert (=> b!1540639 m!1422761))

(assert (=> bm!68657 m!1422759))

(declare-fun m!1422771 () Bool)

(assert (=> bm!68657 m!1422771))

(assert (=> b!1540641 m!1422759))

(assert (=> b!1540641 m!1422759))

(assert (=> b!1540641 m!1422761))

(assert (=> b!1540541 d!160559))

(declare-fun b!1540643 () Bool)

(declare-fun e!856849 () SeekEntryResult!13503)

(assert (=> b!1540643 (= e!856849 (Found!13503 lt!665401))))

(declare-fun e!856847 () SeekEntryResult!13503)

(declare-fun b!1540644 () Bool)

(assert (=> b!1540644 (= e!856847 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!665401 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 (select (arr!49377 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540646 () Bool)

(declare-fun e!856848 () SeekEntryResult!13503)

(assert (=> b!1540646 (= e!856848 e!856849)))

(declare-fun lt!665455 () (_ BitVec 64))

(declare-fun c!141238 () Bool)

(assert (=> b!1540646 (= c!141238 (= lt!665455 (select (arr!49377 a!2792) j!64)))))

(declare-fun b!1540647 () Bool)

(declare-fun c!141236 () Bool)

(assert (=> b!1540647 (= c!141236 (= lt!665455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540647 (= e!856849 e!856847)))

(declare-fun b!1540648 () Bool)

(assert (=> b!1540648 (= e!856847 (MissingVacant!13503 vacantIndex!5))))

(declare-fun b!1540645 () Bool)

(assert (=> b!1540645 (= e!856848 Undefined!13503)))

(declare-fun d!160561 () Bool)

(declare-fun lt!665454 () SeekEntryResult!13503)

(assert (=> d!160561 (and (or ((_ is Undefined!13503) lt!665454) (not ((_ is Found!13503) lt!665454)) (and (bvsge (index!56408 lt!665454) #b00000000000000000000000000000000) (bvslt (index!56408 lt!665454) (size!49927 a!2792)))) (or ((_ is Undefined!13503) lt!665454) ((_ is Found!13503) lt!665454) (not ((_ is MissingVacant!13503) lt!665454)) (not (= (index!56410 lt!665454) vacantIndex!5)) (and (bvsge (index!56410 lt!665454) #b00000000000000000000000000000000) (bvslt (index!56410 lt!665454) (size!49927 a!2792)))) (or ((_ is Undefined!13503) lt!665454) (ite ((_ is Found!13503) lt!665454) (= (select (arr!49377 a!2792) (index!56408 lt!665454)) (select (arr!49377 a!2792) j!64)) (and ((_ is MissingVacant!13503) lt!665454) (= (index!56410 lt!665454) vacantIndex!5) (= (select (arr!49377 a!2792) (index!56410 lt!665454)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160561 (= lt!665454 e!856848)))

(declare-fun c!141237 () Bool)

(assert (=> d!160561 (= c!141237 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!160561 (= lt!665455 (select (arr!49377 a!2792) lt!665401))))

(assert (=> d!160561 (validMask!0 mask!2480)))

(assert (=> d!160561 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665401 vacantIndex!5 (select (arr!49377 a!2792) j!64) a!2792 mask!2480) lt!665454)))

(assert (= (and d!160561 c!141237) b!1540645))

(assert (= (and d!160561 (not c!141237)) b!1540646))

(assert (= (and b!1540646 c!141238) b!1540643))

(assert (= (and b!1540646 (not c!141238)) b!1540647))

(assert (= (and b!1540647 c!141236) b!1540648))

(assert (= (and b!1540647 (not c!141236)) b!1540644))

(assert (=> b!1540644 m!1422737))

(assert (=> b!1540644 m!1422737))

(assert (=> b!1540644 m!1422673))

(declare-fun m!1422773 () Bool)

(assert (=> b!1540644 m!1422773))

(declare-fun m!1422775 () Bool)

(assert (=> d!160561 m!1422775))

(declare-fun m!1422777 () Bool)

(assert (=> d!160561 m!1422777))

(declare-fun m!1422779 () Bool)

(assert (=> d!160561 m!1422779))

(assert (=> d!160561 m!1422659))

(assert (=> b!1540535 d!160561))

(declare-fun d!160563 () Bool)

(assert (=> d!160563 (= (validKeyInArray!0 (select (arr!49377 a!2792) i!951)) (and (not (= (select (arr!49377 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49377 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540537 d!160563))

(declare-fun d!160565 () Bool)

(declare-fun lt!665465 () (_ BitVec 32))

(assert (=> d!160565 (and (bvsge lt!665465 #b00000000000000000000000000000000) (bvslt lt!665465 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160565 (= lt!665465 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160565 (validMask!0 mask!2480)))

(assert (=> d!160565 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665465)))

(declare-fun bs!44227 () Bool)

(assert (= bs!44227 d!160565))

(declare-fun m!1422793 () Bool)

(assert (=> bs!44227 m!1422793))

(assert (=> bs!44227 m!1422659))

(assert (=> b!1540542 d!160565))

(declare-fun d!160569 () Bool)

(assert (=> d!160569 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131386 d!160569))

(declare-fun d!160577 () Bool)

(assert (=> d!160577 (= (array_inv!38405 a!2792) (bvsge (size!49927 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131386 d!160577))

(declare-fun d!160581 () Bool)

(assert (=> d!160581 (= (validKeyInArray!0 (select (arr!49377 a!2792) j!64)) (and (not (= (select (arr!49377 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49377 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540543 d!160581))

(check-sat (not d!160549) (not b!1540644) (not d!160543) (not b!1540638) (not d!160561) (not b!1540619) (not b!1540639) (not b!1540603) (not d!160545) (not bm!68652) (not d!160565) (not b!1540616) (not b!1540601) (not d!160547) (not b!1540594) (not b!1540588) (not bm!68657) (not b!1540641))
(check-sat)
