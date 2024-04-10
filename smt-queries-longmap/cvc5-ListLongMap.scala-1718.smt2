; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31652 () Bool)

(assert start!31652)

(declare-fun b!316536 () Bool)

(declare-fun res!171477 () Bool)

(declare-fun e!196878 () Bool)

(assert (=> b!316536 (=> (not res!171477) (not e!196878))))

(declare-datatypes ((array!16125 0))(
  ( (array!16126 (arr!7631 (Array (_ BitVec 32) (_ BitVec 64))) (size!7983 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16125)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316536 (= res!171477 (and (= (size!7983 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7983 a!3293))))))

(declare-fun b!316537 () Bool)

(declare-fun res!171476 () Bool)

(assert (=> b!316537 (=> (not res!171476) (not e!196878))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316537 (= res!171476 (validKeyInArray!0 k!2441))))

(declare-fun b!316538 () Bool)

(declare-fun e!196879 () Bool)

(assert (=> b!316538 (= e!196878 e!196879)))

(declare-fun res!171474 () Bool)

(assert (=> b!316538 (=> (not res!171474) (not e!196879))))

(declare-datatypes ((SeekEntryResult!2771 0))(
  ( (MissingZero!2771 (index!13260 (_ BitVec 32))) (Found!2771 (index!13261 (_ BitVec 32))) (Intermediate!2771 (undefined!3583 Bool) (index!13262 (_ BitVec 32)) (x!31514 (_ BitVec 32))) (Undefined!2771) (MissingVacant!2771 (index!13263 (_ BitVec 32))) )
))
(declare-fun lt!154607 () SeekEntryResult!2771)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16125 (_ BitVec 32)) SeekEntryResult!2771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316538 (= res!171474 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154607))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!316538 (= lt!154607 (Intermediate!2771 false resIndex!52 resX!52))))

(declare-fun res!171475 () Bool)

(assert (=> start!31652 (=> (not res!171475) (not e!196878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31652 (= res!171475 (validMask!0 mask!3709))))

(assert (=> start!31652 e!196878))

(declare-fun array_inv!5594 (array!16125) Bool)

(assert (=> start!31652 (array_inv!5594 a!3293)))

(assert (=> start!31652 true))

(declare-fun b!316539 () Bool)

(declare-fun res!171469 () Bool)

(assert (=> b!316539 (=> (not res!171469) (not e!196878))))

(declare-fun arrayContainsKey!0 (array!16125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316539 (= res!171469 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316540 () Bool)

(declare-fun res!171473 () Bool)

(assert (=> b!316540 (=> (not res!171473) (not e!196878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16125 (_ BitVec 32)) Bool)

(assert (=> b!316540 (= res!171473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316541 () Bool)

(declare-fun res!171471 () Bool)

(assert (=> b!316541 (=> (not res!171471) (not e!196878))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16125 (_ BitVec 32)) SeekEntryResult!2771)

(assert (=> b!316541 (= res!171471 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2771 i!1240)))))

(declare-fun b!316542 () Bool)

(declare-fun res!171470 () Bool)

(assert (=> b!316542 (=> (not res!171470) (not e!196879))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316542 (= res!171470 (and (= (select (arr!7631 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7983 a!3293))))))

(declare-fun lt!154608 () SeekEntryResult!2771)

(declare-fun e!196877 () Bool)

(declare-fun b!316543 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316543 (= e!196877 (not (= lt!154608 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))))

(declare-fun b!316544 () Bool)

(assert (=> b!316544 (= e!196879 e!196877)))

(declare-fun res!171472 () Bool)

(assert (=> b!316544 (=> (not res!171472) (not e!196877))))

(assert (=> b!316544 (= res!171472 (and (= lt!154608 lt!154607) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7631 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316544 (= lt!154608 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31652 res!171475) b!316536))

(assert (= (and b!316536 res!171477) b!316537))

(assert (= (and b!316537 res!171476) b!316539))

(assert (= (and b!316539 res!171469) b!316541))

(assert (= (and b!316541 res!171471) b!316540))

(assert (= (and b!316540 res!171473) b!316538))

(assert (= (and b!316538 res!171474) b!316542))

(assert (= (and b!316542 res!171470) b!316544))

(assert (= (and b!316544 res!171472) b!316543))

(declare-fun m!325391 () Bool)

(assert (=> b!316537 m!325391))

(declare-fun m!325393 () Bool)

(assert (=> b!316544 m!325393))

(declare-fun m!325395 () Bool)

(assert (=> b!316544 m!325395))

(declare-fun m!325397 () Bool)

(assert (=> b!316540 m!325397))

(declare-fun m!325399 () Bool)

(assert (=> b!316539 m!325399))

(declare-fun m!325401 () Bool)

(assert (=> b!316543 m!325401))

(assert (=> b!316543 m!325401))

(declare-fun m!325403 () Bool)

(assert (=> b!316543 m!325403))

(declare-fun m!325405 () Bool)

(assert (=> start!31652 m!325405))

(declare-fun m!325407 () Bool)

(assert (=> start!31652 m!325407))

(declare-fun m!325409 () Bool)

(assert (=> b!316541 m!325409))

(declare-fun m!325411 () Bool)

(assert (=> b!316542 m!325411))

(declare-fun m!325413 () Bool)

(assert (=> b!316538 m!325413))

(assert (=> b!316538 m!325413))

(declare-fun m!325415 () Bool)

(assert (=> b!316538 m!325415))

(push 1)

(assert (not start!31652))

(assert (not b!316540))

(assert (not b!316543))

(assert (not b!316537))

(assert (not b!316541))

(assert (not b!316538))

(assert (not b!316539))

(assert (not b!316544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!316625 () Bool)

(declare-fun e!196921 () Bool)

(declare-fun e!196919 () Bool)

(assert (=> b!316625 (= e!196921 e!196919)))

(declare-fun c!50163 () Bool)

(assert (=> b!316625 (= c!50163 (validKeyInArray!0 (select (arr!7631 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!69051 () Bool)

(declare-fun res!171536 () Bool)

(assert (=> d!69051 (=> res!171536 e!196921)))

(assert (=> d!69051 (= res!171536 (bvsge #b00000000000000000000000000000000 (size!7983 a!3293)))))

(assert (=> d!69051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196921)))

(declare-fun b!316626 () Bool)

(declare-fun e!196920 () Bool)

(declare-fun call!26011 () Bool)

(assert (=> b!316626 (= e!196920 call!26011)))

(declare-fun b!316627 () Bool)

(assert (=> b!316627 (= e!196919 call!26011)))

(declare-fun bm!26008 () Bool)

(assert (=> bm!26008 (= call!26011 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!316628 () Bool)

(assert (=> b!316628 (= e!196919 e!196920)))

(declare-fun lt!154638 () (_ BitVec 64))

(assert (=> b!316628 (= lt!154638 (select (arr!7631 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9782 0))(
  ( (Unit!9783) )
))
(declare-fun lt!154636 () Unit!9782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16125 (_ BitVec 64) (_ BitVec 32)) Unit!9782)

(assert (=> b!316628 (= lt!154636 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154638 #b00000000000000000000000000000000))))

(assert (=> b!316628 (arrayContainsKey!0 a!3293 lt!154638 #b00000000000000000000000000000000)))

(declare-fun lt!154637 () Unit!9782)

(assert (=> b!316628 (= lt!154637 lt!154636)))

(declare-fun res!171537 () Bool)

(assert (=> b!316628 (= res!171537 (= (seekEntryOrOpen!0 (select (arr!7631 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2771 #b00000000000000000000000000000000)))))

(assert (=> b!316628 (=> (not res!171537) (not e!196920))))

(assert (= (and d!69051 (not res!171536)) b!316625))

(assert (= (and b!316625 c!50163) b!316628))

(assert (= (and b!316625 (not c!50163)) b!316627))

(assert (= (and b!316628 res!171537) b!316626))

(assert (= (or b!316626 b!316627) bm!26008))

(declare-fun m!325479 () Bool)

(assert (=> b!316625 m!325479))

(assert (=> b!316625 m!325479))

(declare-fun m!325481 () Bool)

(assert (=> b!316625 m!325481))

(declare-fun m!325483 () Bool)

(assert (=> bm!26008 m!325483))

(assert (=> b!316628 m!325479))

(declare-fun m!325485 () Bool)

(assert (=> b!316628 m!325485))

(declare-fun m!325487 () Bool)

(assert (=> b!316628 m!325487))

(assert (=> b!316628 m!325479))

(declare-fun m!325489 () Bool)

(assert (=> b!316628 m!325489))

(assert (=> b!316540 d!69051))

(declare-fun b!316737 () Bool)

(declare-fun e!196983 () Bool)

(declare-fun lt!154680 () SeekEntryResult!2771)

(assert (=> b!316737 (= e!196983 (bvsge (x!31514 lt!154680) #b01111111111111111111111111111110))))

(declare-fun b!316738 () Bool)

(declare-fun e!196982 () SeekEntryResult!2771)

(assert (=> b!316738 (= e!196982 (Intermediate!2771 true index!1781 x!1427))))

(declare-fun b!316739 () Bool)

(assert (=> b!316739 (and (bvsge (index!13262 lt!154680) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154680) (size!7983 a!3293)))))

(declare-fun res!171577 () Bool)

(assert (=> b!316739 (= res!171577 (= (select (arr!7631 a!3293) (index!13262 lt!154680)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196985 () Bool)

(assert (=> b!316739 (=> res!171577 e!196985)))

(declare-fun b!316740 () Bool)

(assert (=> b!316740 (and (bvsge (index!13262 lt!154680) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154680) (size!7983 a!3293)))))

(declare-fun res!171578 () Bool)

(assert (=> b!316740 (= res!171578 (= (select (arr!7631 a!3293) (index!13262 lt!154680)) k!2441))))

(assert (=> b!316740 (=> res!171578 e!196985)))

(declare-fun e!196986 () Bool)

(assert (=> b!316740 (= e!196986 e!196985)))

(declare-fun b!316741 () Bool)

(assert (=> b!316741 (= e!196983 e!196986)))

(declare-fun res!171576 () Bool)

(assert (=> b!316741 (= res!171576 (and (is-Intermediate!2771 lt!154680) (not (undefined!3583 lt!154680)) (bvslt (x!31514 lt!154680) #b01111111111111111111111111111110) (bvsge (x!31514 lt!154680) #b00000000000000000000000000000000) (bvsge (x!31514 lt!154680) x!1427)))))

(assert (=> b!316741 (=> (not res!171576) (not e!196986))))

(declare-fun d!69061 () Bool)

(assert (=> d!69061 e!196983))

(declare-fun c!50201 () Bool)

(assert (=> d!69061 (= c!50201 (and (is-Intermediate!2771 lt!154680) (undefined!3583 lt!154680)))))

(assert (=> d!69061 (= lt!154680 e!196982)))

(declare-fun c!50200 () Bool)

(assert (=> d!69061 (= c!50200 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154679 () (_ BitVec 64))

(assert (=> d!69061 (= lt!154679 (select (arr!7631 a!3293) index!1781))))

(assert (=> d!69061 (validMask!0 mask!3709)))

(assert (=> d!69061 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154680)))

(declare-fun b!316742 () Bool)

(declare-fun e!196984 () SeekEntryResult!2771)

(assert (=> b!316742 (= e!196982 e!196984)))

(declare-fun c!50202 () Bool)

(assert (=> b!316742 (= c!50202 (or (= lt!154679 k!2441) (= (bvadd lt!154679 lt!154679) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316743 () Bool)

(assert (=> b!316743 (= e!196984 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316744 () Bool)

(assert (=> b!316744 (= e!196984 (Intermediate!2771 false index!1781 x!1427))))

(declare-fun b!316745 () Bool)

(assert (=> b!316745 (and (bvsge (index!13262 lt!154680) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154680) (size!7983 a!3293)))))

(assert (=> b!316745 (= e!196985 (= (select (arr!7631 a!3293) (index!13262 lt!154680)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69061 c!50200) b!316738))

(assert (= (and d!69061 (not c!50200)) b!316742))

(assert (= (and b!316742 c!50202) b!316744))

(assert (= (and b!316742 (not c!50202)) b!316743))

(assert (= (and d!69061 c!50201) b!316737))

(assert (= (and d!69061 (not c!50201)) b!316741))

(assert (= (and b!316741 res!171576) b!316740))

(assert (= (and b!316740 (not res!171578)) b!316739))

(assert (= (and b!316739 (not res!171577)) b!316745))

(declare-fun m!325535 () Bool)

(assert (=> b!316745 m!325535))

(assert (=> b!316739 m!325535))

(assert (=> d!69061 m!325393))

(assert (=> d!69061 m!325405))

(assert (=> b!316743 m!325401))

(assert (=> b!316743 m!325401))

(declare-fun m!325537 () Bool)

(assert (=> b!316743 m!325537))

(assert (=> b!316740 m!325535))

(assert (=> b!316544 d!69061))

(declare-fun d!69083 () Bool)

(declare-fun res!171593 () Bool)

(declare-fun e!197003 () Bool)

(assert (=> d!69083 (=> res!171593 e!197003)))

(assert (=> d!69083 (= res!171593 (= (select (arr!7631 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!69083 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!197003)))

(declare-fun b!316764 () Bool)

(declare-fun e!197004 () Bool)

(assert (=> b!316764 (= e!197003 e!197004)))

(declare-fun res!171594 () Bool)

(assert (=> b!316764 (=> (not res!171594) (not e!197004))))

(assert (=> b!316764 (= res!171594 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7983 a!3293)))))

(declare-fun b!316765 () Bool)

(assert (=> b!316765 (= e!197004 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69083 (not res!171593)) b!316764))

(assert (= (and b!316764 res!171594) b!316765))

(assert (=> d!69083 m!325479))

(declare-fun m!325543 () Bool)

(assert (=> b!316765 m!325543))

(assert (=> b!316539 d!69083))

(declare-fun d!69087 () Bool)

(assert (=> d!69087 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!316537 d!69087))

(declare-fun b!316770 () Bool)

(declare-fun e!197009 () Bool)

(declare-fun lt!154693 () SeekEntryResult!2771)

(assert (=> b!316770 (= e!197009 (bvsge (x!31514 lt!154693) #b01111111111111111111111111111110))))

(declare-fun e!197008 () SeekEntryResult!2771)

(declare-fun b!316771 () Bool)

(assert (=> b!316771 (= e!197008 (Intermediate!2771 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316772 () Bool)

(assert (=> b!316772 (and (bvsge (index!13262 lt!154693) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154693) (size!7983 a!3293)))))

(declare-fun res!171598 () Bool)

(assert (=> b!316772 (= res!171598 (= (select (arr!7631 a!3293) (index!13262 lt!154693)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!197011 () Bool)

(assert (=> b!316772 (=> res!171598 e!197011)))

(declare-fun b!316773 () Bool)

(assert (=> b!316773 (and (bvsge (index!13262 lt!154693) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154693) (size!7983 a!3293)))))

(declare-fun res!171599 () Bool)

(assert (=> b!316773 (= res!171599 (= (select (arr!7631 a!3293) (index!13262 lt!154693)) k!2441))))

(assert (=> b!316773 (=> res!171599 e!197011)))

(declare-fun e!197012 () Bool)

(assert (=> b!316773 (= e!197012 e!197011)))

(declare-fun b!316774 () Bool)

(assert (=> b!316774 (= e!197009 e!197012)))

(declare-fun res!171597 () Bool)

(assert (=> b!316774 (= res!171597 (and (is-Intermediate!2771 lt!154693) (not (undefined!3583 lt!154693)) (bvslt (x!31514 lt!154693) #b01111111111111111111111111111110) (bvsge (x!31514 lt!154693) #b00000000000000000000000000000000) (bvsge (x!31514 lt!154693) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!316774 (=> (not res!171597) (not e!197012))))

(declare-fun d!69091 () Bool)

(assert (=> d!69091 e!197009))

(declare-fun c!50207 () Bool)

(assert (=> d!69091 (= c!50207 (and (is-Intermediate!2771 lt!154693) (undefined!3583 lt!154693)))))

(assert (=> d!69091 (= lt!154693 e!197008)))

(declare-fun c!50206 () Bool)

(assert (=> d!69091 (= c!50206 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154692 () (_ BitVec 64))

(assert (=> d!69091 (= lt!154692 (select (arr!7631 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!69091 (validMask!0 mask!3709)))

(assert (=> d!69091 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709) lt!154693)))

(declare-fun b!316775 () Bool)

(declare-fun e!197010 () SeekEntryResult!2771)

(assert (=> b!316775 (= e!197008 e!197010)))

(declare-fun c!50208 () Bool)

(assert (=> b!316775 (= c!50208 (or (= lt!154692 k!2441) (= (bvadd lt!154692 lt!154692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316776 () Bool)

(assert (=> b!316776 (= e!197010 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316777 () Bool)

(assert (=> b!316777 (= e!197010 (Intermediate!2771 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316778 () Bool)

(assert (=> b!316778 (and (bvsge (index!13262 lt!154693) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154693) (size!7983 a!3293)))))

(assert (=> b!316778 (= e!197011 (= (select (arr!7631 a!3293) (index!13262 lt!154693)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69091 c!50206) b!316771))

(assert (= (and d!69091 (not c!50206)) b!316775))

(assert (= (and b!316775 c!50208) b!316777))

(assert (= (and b!316775 (not c!50208)) b!316776))

(assert (= (and d!69091 c!50207) b!316770))

(assert (= (and d!69091 (not c!50207)) b!316774))

(assert (= (and b!316774 res!171597) b!316773))

(assert (= (and b!316773 (not res!171599)) b!316772))

(assert (= (and b!316772 (not res!171598)) b!316778))

(declare-fun m!325557 () Bool)

(assert (=> b!316778 m!325557))

(assert (=> b!316772 m!325557))

(assert (=> d!69091 m!325401))

(declare-fun m!325559 () Bool)

(assert (=> d!69091 m!325559))

(assert (=> d!69091 m!325405))

(assert (=> b!316776 m!325401))

(declare-fun m!325561 () Bool)

(assert (=> b!316776 m!325561))

(assert (=> b!316776 m!325561))

(declare-fun m!325563 () Bool)

(assert (=> b!316776 m!325563))

(assert (=> b!316773 m!325557))

(assert (=> b!316543 d!69091))

(declare-fun d!69093 () Bool)

(declare-fun lt!154696 () (_ BitVec 32))

(assert (=> d!69093 (and (bvsge lt!154696 #b00000000000000000000000000000000) (bvslt lt!154696 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69093 (= lt!154696 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69093 (validMask!0 mask!3709)))

(assert (=> d!69093 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154696)))

(declare-fun bs!11053 () Bool)

(assert (= bs!11053 d!69093))

(declare-fun m!325567 () Bool)

(assert (=> bs!11053 m!325567))

(assert (=> bs!11053 m!325405))

(assert (=> b!316543 d!69093))

(declare-fun b!316785 () Bool)

(declare-fun e!197020 () Bool)

(declare-fun lt!154698 () SeekEntryResult!2771)

(assert (=> b!316785 (= e!197020 (bvsge (x!31514 lt!154698) #b01111111111111111111111111111110))))

(declare-fun b!316786 () Bool)

(declare-fun e!197019 () SeekEntryResult!2771)

(assert (=> b!316786 (= e!197019 (Intermediate!2771 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316787 () Bool)

(assert (=> b!316787 (and (bvsge (index!13262 lt!154698) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154698) (size!7983 a!3293)))))

(declare-fun res!171607 () Bool)

(assert (=> b!316787 (= res!171607 (= (select (arr!7631 a!3293) (index!13262 lt!154698)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!197022 () Bool)

(assert (=> b!316787 (=> res!171607 e!197022)))

(declare-fun b!316788 () Bool)

(assert (=> b!316788 (and (bvsge (index!13262 lt!154698) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154698) (size!7983 a!3293)))))

(declare-fun res!171608 () Bool)

(assert (=> b!316788 (= res!171608 (= (select (arr!7631 a!3293) (index!13262 lt!154698)) k!2441))))

(assert (=> b!316788 (=> res!171608 e!197022)))

(declare-fun e!197023 () Bool)

(assert (=> b!316788 (= e!197023 e!197022)))

(declare-fun b!316789 () Bool)

(assert (=> b!316789 (= e!197020 e!197023)))

(declare-fun res!171606 () Bool)

(assert (=> b!316789 (= res!171606 (and (is-Intermediate!2771 lt!154698) (not (undefined!3583 lt!154698)) (bvslt (x!31514 lt!154698) #b01111111111111111111111111111110) (bvsge (x!31514 lt!154698) #b00000000000000000000000000000000) (bvsge (x!31514 lt!154698) #b00000000000000000000000000000000)))))

(assert (=> b!316789 (=> (not res!171606) (not e!197023))))

(declare-fun d!69097 () Bool)

(assert (=> d!69097 e!197020))

(declare-fun c!50210 () Bool)

(assert (=> d!69097 (= c!50210 (and (is-Intermediate!2771 lt!154698) (undefined!3583 lt!154698)))))

(assert (=> d!69097 (= lt!154698 e!197019)))

(declare-fun c!50209 () Bool)

(assert (=> d!69097 (= c!50209 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154697 () (_ BitVec 64))

(assert (=> d!69097 (= lt!154697 (select (arr!7631 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!69097 (validMask!0 mask!3709)))

(assert (=> d!69097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154698)))

(declare-fun b!316790 () Bool)

(declare-fun e!197021 () SeekEntryResult!2771)

(assert (=> b!316790 (= e!197019 e!197021)))

(declare-fun c!50211 () Bool)

(assert (=> b!316790 (= c!50211 (or (= lt!154697 k!2441) (= (bvadd lt!154697 lt!154697) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316791 () Bool)

(assert (=> b!316791 (= e!197021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316792 () Bool)

(assert (=> b!316792 (= e!197021 (Intermediate!2771 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316793 () Bool)

(assert (=> b!316793 (and (bvsge (index!13262 lt!154698) #b00000000000000000000000000000000) (bvslt (index!13262 lt!154698) (size!7983 a!3293)))))

(assert (=> b!316793 (= e!197022 (= (select (arr!7631 a!3293) (index!13262 lt!154698)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69097 c!50209) b!316786))

(assert (= (and d!69097 (not c!50209)) b!316790))

(assert (= (and b!316790 c!50211) b!316792))

(assert (= (and b!316790 (not c!50211)) b!316791))

(assert (= (and d!69097 c!50210) b!316785))

(assert (= (and d!69097 (not c!50210)) b!316789))

(assert (= (and b!316789 res!171606) b!316788))

(assert (= (and b!316788 (not res!171608)) b!316787))

(assert (= (and b!316787 (not res!171607)) b!316793))

(declare-fun m!325569 () Bool)

(assert (=> b!316793 m!325569))

(assert (=> b!316787 m!325569))

(assert (=> d!69097 m!325413))

(declare-fun m!325571 () Bool)

(assert (=> d!69097 m!325571))

(assert (=> d!69097 m!325405))

(assert (=> b!316791 m!325413))

(declare-fun m!325573 () Bool)

(assert (=> b!316791 m!325573))

(assert (=> b!316791 m!325573))

(declare-fun m!325575 () Bool)

(assert (=> b!316791 m!325575))

(assert (=> b!316788 m!325569))

(assert (=> b!316538 d!69097))

(declare-fun d!69099 () Bool)

(declare-fun lt!154704 () (_ BitVec 32))

(declare-fun lt!154703 () (_ BitVec 32))

(assert (=> d!69099 (= lt!154704 (bvmul (bvxor lt!154703 (bvlshr lt!154703 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69099 (= lt!154703 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69099 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171609 (let ((h!5375 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31525 (bvmul (bvxor h!5375 (bvlshr h!5375 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31525 (bvlshr x!31525 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171609 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171609 #b00000000000000000000000000000000))))))

(assert (=> d!69099 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!154704 (bvlshr lt!154704 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!316538 d!69099))

(declare-fun b!316836 () Bool)

(declare-fun c!50232 () Bool)

(declare-fun lt!154729 () (_ BitVec 64))

(assert (=> b!316836 (= c!50232 (= lt!154729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!197049 () SeekEntryResult!2771)

(declare-fun e!197048 () SeekEntryResult!2771)

(assert (=> b!316836 (= e!197049 e!197048)))

(declare-fun b!316837 () Bool)

(declare-fun lt!154731 () SeekEntryResult!2771)

(assert (=> b!316837 (= e!197049 (Found!2771 (index!13262 lt!154731)))))

(declare-fun b!316839 () Bool)

(declare-fun e!197050 () SeekEntryResult!2771)

(assert (=> b!316839 (= e!197050 Undefined!2771)))

(declare-fun b!316840 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16125 (_ BitVec 32)) SeekEntryResult!2771)

(assert (=> b!316840 (= e!197048 (seekKeyOrZeroReturnVacant!0 (x!31514 lt!154731) (index!13262 lt!154731) (index!13262 lt!154731) k!2441 a!3293 mask!3709))))

(declare-fun b!316841 () Bool)

(assert (=> b!316841 (= e!197050 e!197049)))

(assert (=> b!316841 (= lt!154729 (select (arr!7631 a!3293) (index!13262 lt!154731)))))

(declare-fun c!50230 () Bool)

(assert (=> b!316841 (= c!50230 (= lt!154729 k!2441))))

(declare-fun d!69101 () Bool)

(declare-fun lt!154730 () SeekEntryResult!2771)

(assert (=> d!69101 (and (or (is-Undefined!2771 lt!154730) (not (is-Found!2771 lt!154730)) (and (bvsge (index!13261 lt!154730) #b00000000000000000000000000000000) (bvslt (index!13261 lt!154730) (size!7983 a!3293)))) (or (is-Undefined!2771 lt!154730) (is-Found!2771 lt!154730) (not (is-MissingZero!2771 lt!154730)) (and (bvsge (index!13260 lt!154730) #b00000000000000000000000000000000) (bvslt (index!13260 lt!154730) (size!7983 a!3293)))) (or (is-Undefined!2771 lt!154730) (is-Found!2771 lt!154730) (is-MissingZero!2771 lt!154730) (not (is-MissingVacant!2771 lt!154730)) (and (bvsge (index!13263 lt!154730) #b00000000000000000000000000000000) (bvslt (index!13263 lt!154730) (size!7983 a!3293)))) (or (is-Undefined!2771 lt!154730) (ite (is-Found!2771 lt!154730) (= (select (arr!7631 a!3293) (index!13261 lt!154730)) k!2441) (ite (is-MissingZero!2771 lt!154730) (= (select (arr!7631 a!3293) (index!13260 lt!154730)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2771 lt!154730) (= (select (arr!7631 a!3293) (index!13263 lt!154730)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69101 (= lt!154730 e!197050)))

(declare-fun c!50231 () Bool)

(assert (=> d!69101 (= c!50231 (and (is-Intermediate!2771 lt!154731) (undefined!3583 lt!154731)))))

(assert (=> d!69101 (= lt!154731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!69101 (validMask!0 mask!3709)))

(assert (=> d!69101 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!154730)))

(declare-fun b!316838 () Bool)

(assert (=> b!316838 (= e!197048 (MissingZero!2771 (index!13262 lt!154731)))))

(assert (= (and d!69101 c!50231) b!316839))

(assert (= (and d!69101 (not c!50231)) b!316841))

(assert (= (and b!316841 c!50230) b!316837))

(assert (= (and b!316841 (not c!50230)) b!316836))

(assert (= (and b!316836 c!50232) b!316838))

(assert (= (and b!316836 (not c!50232)) b!316840))

(declare-fun m!325597 () Bool)

(assert (=> b!316840 m!325597))

(declare-fun m!325599 () Bool)

(assert (=> b!316841 m!325599))

(assert (=> d!69101 m!325405))

(assert (=> d!69101 m!325413))

(assert (=> d!69101 m!325415))

(declare-fun m!325601 () Bool)

(assert (=> d!69101 m!325601))

(declare-fun m!325603 () Bool)

(assert (=> d!69101 m!325603))

(declare-fun m!325605 () Bool)

(assert (=> d!69101 m!325605))

(assert (=> d!69101 m!325413))

(assert (=> b!316541 d!69101))

(declare-fun d!69111 () Bool)

(assert (=> d!69111 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31652 d!69111))

(declare-fun d!69113 () Bool)

(assert (=> d!69113 (= (array_inv!5594 a!3293) (bvsge (size!7983 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31652 d!69113))

(push 1)

