; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31310 () Bool)

(assert start!31310)

(declare-fun b!314025 () Bool)

(declare-fun res!169920 () Bool)

(declare-fun e!195659 () Bool)

(assert (=> b!314025 (=> (not res!169920) (not e!195659))))

(declare-datatypes ((array!16026 0))(
  ( (array!16027 (arr!7589 (Array (_ BitVec 32) (_ BitVec 64))) (size!7941 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16026)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314025 (= res!169920 (and (= (select (arr!7589 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7941 a!3293))))))

(declare-fun b!314026 () Bool)

(declare-fun res!169916 () Bool)

(declare-fun e!195661 () Bool)

(assert (=> b!314026 (=> (not res!169916) (not e!195661))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314026 (= res!169916 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314027 () Bool)

(declare-fun res!169919 () Bool)

(assert (=> b!314027 (=> (not res!169919) (not e!195661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314027 (= res!169919 (validKeyInArray!0 k!2441))))

(declare-fun b!314028 () Bool)

(assert (=> b!314028 (= e!195659 (bvslt (bvsub #b01111111111111111111111111111110 x!1427) #b00000000000000000000000000000000))))

(declare-fun b!314029 () Bool)

(declare-fun res!169918 () Bool)

(assert (=> b!314029 (=> (not res!169918) (not e!195661))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!314029 (= res!169918 (and (= (size!7941 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7941 a!3293))))))

(declare-fun b!314030 () Bool)

(declare-fun res!169921 () Bool)

(assert (=> b!314030 (=> (not res!169921) (not e!195661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16026 (_ BitVec 32)) Bool)

(assert (=> b!314030 (= res!169921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!169917 () Bool)

(assert (=> start!31310 (=> (not res!169917) (not e!195661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31310 (= res!169917 (validMask!0 mask!3709))))

(assert (=> start!31310 e!195661))

(declare-fun array_inv!5552 (array!16026) Bool)

(assert (=> start!31310 (array_inv!5552 a!3293)))

(assert (=> start!31310 true))

(declare-fun b!314031 () Bool)

(declare-fun res!169915 () Bool)

(assert (=> b!314031 (=> (not res!169915) (not e!195661))))

(declare-datatypes ((SeekEntryResult!2729 0))(
  ( (MissingZero!2729 (index!13092 (_ BitVec 32))) (Found!2729 (index!13093 (_ BitVec 32))) (Intermediate!2729 (undefined!3541 Bool) (index!13094 (_ BitVec 32)) (x!31321 (_ BitVec 32))) (Undefined!2729) (MissingVacant!2729 (index!13095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16026 (_ BitVec 32)) SeekEntryResult!2729)

(assert (=> b!314031 (= res!169915 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2729 i!1240)))))

(declare-fun b!314032 () Bool)

(assert (=> b!314032 (= e!195661 e!195659)))

(declare-fun res!169922 () Bool)

(assert (=> b!314032 (=> (not res!169922) (not e!195659))))

(declare-fun lt!153786 () SeekEntryResult!2729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16026 (_ BitVec 32)) SeekEntryResult!2729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314032 (= res!169922 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153786))))

(assert (=> b!314032 (= lt!153786 (Intermediate!2729 false resIndex!52 resX!52))))

(declare-fun b!314033 () Bool)

(declare-fun res!169923 () Bool)

(assert (=> b!314033 (=> (not res!169923) (not e!195659))))

(assert (=> b!314033 (= res!169923 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153786))))

(assert (= (and start!31310 res!169917) b!314029))

(assert (= (and b!314029 res!169918) b!314027))

(assert (= (and b!314027 res!169919) b!314026))

(assert (= (and b!314026 res!169916) b!314031))

(assert (= (and b!314031 res!169915) b!314030))

(assert (= (and b!314030 res!169921) b!314032))

(assert (= (and b!314032 res!169922) b!314025))

(assert (= (and b!314025 res!169920) b!314033))

(assert (= (and b!314033 res!169923) b!314028))

(declare-fun m!323717 () Bool)

(assert (=> b!314030 m!323717))

(declare-fun m!323719 () Bool)

(assert (=> b!314032 m!323719))

(assert (=> b!314032 m!323719))

(declare-fun m!323721 () Bool)

(assert (=> b!314032 m!323721))

(declare-fun m!323723 () Bool)

(assert (=> b!314033 m!323723))

(declare-fun m!323725 () Bool)

(assert (=> start!31310 m!323725))

(declare-fun m!323727 () Bool)

(assert (=> start!31310 m!323727))

(declare-fun m!323729 () Bool)

(assert (=> b!314027 m!323729))

(declare-fun m!323731 () Bool)

(assert (=> b!314025 m!323731))

(declare-fun m!323733 () Bool)

(assert (=> b!314031 m!323733))

(declare-fun m!323735 () Bool)

(assert (=> b!314026 m!323735))

(push 1)

(assert (not b!314030))

(assert (not b!314027))

(assert (not b!314032))

(assert (not start!31310))

(assert (not b!314026))

(assert (not b!314033))

(assert (not b!314031))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68713 () Bool)

(declare-fun res!169988 () Bool)

(declare-fun e!195690 () Bool)

(assert (=> d!68713 (=> res!169988 e!195690)))

(assert (=> d!68713 (= res!169988 (= (select (arr!7589 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68713 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!195690)))

(declare-fun b!314098 () Bool)

(declare-fun e!195691 () Bool)

(assert (=> b!314098 (= e!195690 e!195691)))

(declare-fun res!169989 () Bool)

(assert (=> b!314098 (=> (not res!169989) (not e!195691))))

(assert (=> b!314098 (= res!169989 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7941 a!3293)))))

(declare-fun b!314099 () Bool)

(assert (=> b!314099 (= e!195691 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68713 (not res!169988)) b!314098))

(assert (= (and b!314098 res!169989) b!314099))

(declare-fun m!323781 () Bool)

(assert (=> d!68713 m!323781))

(declare-fun m!323783 () Bool)

(assert (=> b!314099 m!323783))

(assert (=> b!314026 d!68713))

(declare-fun d!68715 () Bool)

(assert (=> d!68715 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31310 d!68715))

(declare-fun d!68719 () Bool)

(assert (=> d!68719 (= (array_inv!5552 a!3293) (bvsge (size!7941 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31310 d!68719))

(declare-fun lt!153815 () SeekEntryResult!2729)

(declare-fun b!314149 () Bool)

(declare-fun e!195720 () SeekEntryResult!2729)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16026 (_ BitVec 32)) SeekEntryResult!2729)

(assert (=> b!314149 (= e!195720 (seekKeyOrZeroReturnVacant!0 (x!31321 lt!153815) (index!13094 lt!153815) (index!13094 lt!153815) k!2441 a!3293 mask!3709))))

(declare-fun b!314150 () Bool)

(declare-fun e!195718 () SeekEntryResult!2729)

(assert (=> b!314150 (= e!195718 (Found!2729 (index!13094 lt!153815)))))

(declare-fun b!314151 () Bool)

(declare-fun e!195719 () SeekEntryResult!2729)

(assert (=> b!314151 (= e!195719 Undefined!2729)))

(declare-fun b!314152 () Bool)

(assert (=> b!314152 (= e!195720 (MissingZero!2729 (index!13094 lt!153815)))))

(declare-fun b!314153 () Bool)

(assert (=> b!314153 (= e!195719 e!195718)))

(declare-fun lt!153814 () (_ BitVec 64))

(assert (=> b!314153 (= lt!153814 (select (arr!7589 a!3293) (index!13094 lt!153815)))))

(declare-fun c!49684 () Bool)

(assert (=> b!314153 (= c!49684 (= lt!153814 k!2441))))

(declare-fun b!314148 () Bool)

(declare-fun c!49686 () Bool)

(assert (=> b!314148 (= c!49686 (= lt!153814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314148 (= e!195718 e!195720)))

(declare-fun d!68721 () Bool)

(declare-fun lt!153813 () SeekEntryResult!2729)

(assert (=> d!68721 (and (or (is-Undefined!2729 lt!153813) (not (is-Found!2729 lt!153813)) (and (bvsge (index!13093 lt!153813) #b00000000000000000000000000000000) (bvslt (index!13093 lt!153813) (size!7941 a!3293)))) (or (is-Undefined!2729 lt!153813) (is-Found!2729 lt!153813) (not (is-MissingZero!2729 lt!153813)) (and (bvsge (index!13092 lt!153813) #b00000000000000000000000000000000) (bvslt (index!13092 lt!153813) (size!7941 a!3293)))) (or (is-Undefined!2729 lt!153813) (is-Found!2729 lt!153813) (is-MissingZero!2729 lt!153813) (not (is-MissingVacant!2729 lt!153813)) (and (bvsge (index!13095 lt!153813) #b00000000000000000000000000000000) (bvslt (index!13095 lt!153813) (size!7941 a!3293)))) (or (is-Undefined!2729 lt!153813) (ite (is-Found!2729 lt!153813) (= (select (arr!7589 a!3293) (index!13093 lt!153813)) k!2441) (ite (is-MissingZero!2729 lt!153813) (= (select (arr!7589 a!3293) (index!13092 lt!153813)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2729 lt!153813) (= (select (arr!7589 a!3293) (index!13095 lt!153813)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68721 (= lt!153813 e!195719)))

(declare-fun c!49685 () Bool)

(assert (=> d!68721 (= c!49685 (and (is-Intermediate!2729 lt!153815) (undefined!3541 lt!153815)))))

(assert (=> d!68721 (= lt!153815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68721 (validMask!0 mask!3709)))

(assert (=> d!68721 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153813)))

(assert (= (and d!68721 c!49685) b!314151))

(assert (= (and d!68721 (not c!49685)) b!314153))

(assert (= (and b!314153 c!49684) b!314150))

(assert (= (and b!314153 (not c!49684)) b!314148))

(assert (= (and b!314148 c!49686) b!314152))

(assert (= (and b!314148 (not c!49686)) b!314149))

(declare-fun m!323801 () Bool)

(assert (=> b!314149 m!323801))

(declare-fun m!323803 () Bool)

(assert (=> b!314153 m!323803))

(declare-fun m!323805 () Bool)

(assert (=> d!68721 m!323805))

(assert (=> d!68721 m!323719))

(assert (=> d!68721 m!323721))

(declare-fun m!323807 () Bool)

(assert (=> d!68721 m!323807))

(declare-fun m!323809 () Bool)

(assert (=> d!68721 m!323809))

(assert (=> d!68721 m!323719))

(assert (=> d!68721 m!323725))

(assert (=> b!314031 d!68721))

(declare-fun b!314201 () Bool)

(declare-fun e!195751 () Bool)

(declare-fun e!195753 () Bool)

(assert (=> b!314201 (= e!195751 e!195753)))

(declare-fun c!49701 () Bool)

(assert (=> b!314201 (= c!49701 (validKeyInArray!0 (select (arr!7589 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!314202 () Bool)

(declare-fun call!25969 () Bool)

(assert (=> b!314202 (= e!195753 call!25969)))

(declare-fun d!68735 () Bool)

(declare-fun res!170023 () Bool)

(assert (=> d!68735 (=> res!170023 e!195751)))

(assert (=> d!68735 (= res!170023 (bvsge #b00000000000000000000000000000000 (size!7941 a!3293)))))

(assert (=> d!68735 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195751)))

(declare-fun b!314203 () Bool)

(declare-fun e!195752 () Bool)

(assert (=> b!314203 (= e!195752 call!25969)))

(declare-fun b!314204 () Bool)

(assert (=> b!314204 (= e!195753 e!195752)))

(declare-fun lt!153838 () (_ BitVec 64))

(assert (=> b!314204 (= lt!153838 (select (arr!7589 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9689 0))(
  ( (Unit!9690) )
))
(declare-fun lt!153837 () Unit!9689)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16026 (_ BitVec 64) (_ BitVec 32)) Unit!9689)

(assert (=> b!314204 (= lt!153837 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153838 #b00000000000000000000000000000000))))

(assert (=> b!314204 (arrayContainsKey!0 a!3293 lt!153838 #b00000000000000000000000000000000)))

(declare-fun lt!153839 () Unit!9689)

(assert (=> b!314204 (= lt!153839 lt!153837)))

(declare-fun res!170022 () Bool)

(assert (=> b!314204 (= res!170022 (= (seekEntryOrOpen!0 (select (arr!7589 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2729 #b00000000000000000000000000000000)))))

(assert (=> b!314204 (=> (not res!170022) (not e!195752))))

(declare-fun bm!25966 () Bool)

(assert (=> bm!25966 (= call!25969 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68735 (not res!170023)) b!314201))

(assert (= (and b!314201 c!49701) b!314204))

(assert (= (and b!314201 (not c!49701)) b!314202))

(assert (= (and b!314204 res!170022) b!314203))

(assert (= (or b!314203 b!314202) bm!25966))

(assert (=> b!314201 m!323781))

(assert (=> b!314201 m!323781))

(declare-fun m!323821 () Bool)

(assert (=> b!314201 m!323821))

(assert (=> b!314204 m!323781))

(declare-fun m!323823 () Bool)

(assert (=> b!314204 m!323823))

(declare-fun m!323825 () Bool)

(assert (=> b!314204 m!323825))

(assert (=> b!314204 m!323781))

(declare-fun m!323827 () Bool)

(assert (=> b!314204 m!323827))

(declare-fun m!323831 () Bool)

(assert (=> bm!25966 m!323831))

(assert (=> b!314030 d!68735))

(declare-fun b!314241 () Bool)

(declare-fun e!195776 () Bool)

(declare-fun e!195775 () Bool)

(assert (=> b!314241 (= e!195776 e!195775)))

(declare-fun res!170033 () Bool)

(declare-fun lt!153860 () SeekEntryResult!2729)

(assert (=> b!314241 (= res!170033 (and (is-Intermediate!2729 lt!153860) (not (undefined!3541 lt!153860)) (bvslt (x!31321 lt!153860) #b01111111111111111111111111111110) (bvsge (x!31321 lt!153860) #b00000000000000000000000000000000) (bvsge (x!31321 lt!153860) x!1427)))))

(assert (=> b!314241 (=> (not res!170033) (not e!195775))))

(declare-fun b!314242 () Bool)

(declare-fun e!195777 () SeekEntryResult!2729)

(assert (=> b!314242 (= e!195777 (Intermediate!2729 false index!1781 x!1427))))

(declare-fun d!68739 () Bool)

(assert (=> d!68739 e!195776))

(declare-fun c!49719 () Bool)

(assert (=> d!68739 (= c!49719 (and (is-Intermediate!2729 lt!153860) (undefined!3541 lt!153860)))))

(declare-fun e!195774 () SeekEntryResult!2729)

(assert (=> d!68739 (= lt!153860 e!195774)))

(declare-fun c!49717 () Bool)

(assert (=> d!68739 (= c!49717 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153859 () (_ BitVec 64))

(assert (=> d!68739 (= lt!153859 (select (arr!7589 a!3293) index!1781))))

(assert (=> d!68739 (validMask!0 mask!3709)))

(assert (=> d!68739 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153860)))

(declare-fun b!314243 () Bool)

(assert (=> b!314243 (= e!195776 (bvsge (x!31321 lt!153860) #b01111111111111111111111111111110))))

(declare-fun b!314244 () Bool)

(assert (=> b!314244 (= e!195774 e!195777)))

(declare-fun c!49718 () Bool)

(assert (=> b!314244 (= c!49718 (or (= lt!153859 k!2441) (= (bvadd lt!153859 lt!153859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314245 () Bool)

(assert (=> b!314245 (and (bvsge (index!13094 lt!153860) #b00000000000000000000000000000000) (bvslt (index!13094 lt!153860) (size!7941 a!3293)))))

(declare-fun e!195773 () Bool)

(assert (=> b!314245 (= e!195773 (= (select (arr!7589 a!3293) (index!13094 lt!153860)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314246 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314246 (= e!195777 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!314247 () Bool)

(assert (=> b!314247 (and (bvsge (index!13094 lt!153860) #b00000000000000000000000000000000) (bvslt (index!13094 lt!153860) (size!7941 a!3293)))))

(declare-fun res!170031 () Bool)

(assert (=> b!314247 (= res!170031 (= (select (arr!7589 a!3293) (index!13094 lt!153860)) k!2441))))

(assert (=> b!314247 (=> res!170031 e!195773)))

(assert (=> b!314247 (= e!195775 e!195773)))

(declare-fun b!314248 () Bool)

(assert (=> b!314248 (= e!195774 (Intermediate!2729 true index!1781 x!1427))))

(declare-fun b!314249 () Bool)

(assert (=> b!314249 (and (bvsge (index!13094 lt!153860) #b00000000000000000000000000000000) (bvslt (index!13094 lt!153860) (size!7941 a!3293)))))

(declare-fun res!170032 () Bool)

(assert (=> b!314249 (= res!170032 (= (select (arr!7589 a!3293) (index!13094 lt!153860)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314249 (=> res!170032 e!195773)))

(assert (= (and d!68739 c!49717) b!314248))

(assert (= (and d!68739 (not c!49717)) b!314244))

(assert (= (and b!314244 c!49718) b!314242))

(assert (= (and b!314244 (not c!49718)) b!314246))

(assert (= (and d!68739 c!49719) b!314243))

(assert (= (and d!68739 (not c!49719)) b!314241))

(assert (= (and b!314241 res!170033) b!314247))

(assert (= (and b!314247 (not res!170031)) b!314249))

(assert (= (and b!314249 (not res!170032)) b!314245))

(declare-fun m!323849 () Bool)

(assert (=> b!314247 m!323849))

(assert (=> b!314245 m!323849))

(assert (=> b!314249 m!323849))

(declare-fun m!323851 () Bool)

(assert (=> b!314246 m!323851))

(assert (=> b!314246 m!323851))

(declare-fun m!323853 () Bool)

(assert (=> b!314246 m!323853))

(declare-fun m!323855 () Bool)

(assert (=> d!68739 m!323855))

(assert (=> d!68739 m!323725))

(assert (=> b!314033 d!68739))

(declare-fun d!68745 () Bool)

(assert (=> d!68745 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314027 d!68745))

(declare-fun b!314250 () Bool)

(declare-fun e!195781 () Bool)

(declare-fun e!195780 () Bool)

(assert (=> b!314250 (= e!195781 e!195780)))

(declare-fun res!170036 () Bool)

(declare-fun lt!153862 () SeekEntryResult!2729)

(assert (=> b!314250 (= res!170036 (and (is-Intermediate!2729 lt!153862) (not (undefined!3541 lt!153862)) (bvslt (x!31321 lt!153862) #b01111111111111111111111111111110) (bvsge (x!31321 lt!153862) #b00000000000000000000000000000000) (bvsge (x!31321 lt!153862) #b00000000000000000000000000000000)))))

(assert (=> b!314250 (=> (not res!170036) (not e!195780))))

(declare-fun b!314251 () Bool)

(declare-fun e!195782 () SeekEntryResult!2729)

(assert (=> b!314251 (= e!195782 (Intermediate!2729 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68747 () Bool)

(assert (=> d!68747 e!195781))

(declare-fun c!49722 () Bool)

(assert (=> d!68747 (= c!49722 (and (is-Intermediate!2729 lt!153862) (undefined!3541 lt!153862)))))

(declare-fun e!195779 () SeekEntryResult!2729)

(assert (=> d!68747 (= lt!153862 e!195779)))

(declare-fun c!49720 () Bool)

(assert (=> d!68747 (= c!49720 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153861 () (_ BitVec 64))

(assert (=> d!68747 (= lt!153861 (select (arr!7589 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68747 (validMask!0 mask!3709)))

(assert (=> d!68747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153862)))

(declare-fun b!314252 () Bool)

(assert (=> b!314252 (= e!195781 (bvsge (x!31321 lt!153862) #b01111111111111111111111111111110))))

(declare-fun b!314253 () Bool)

(assert (=> b!314253 (= e!195779 e!195782)))

(declare-fun c!49721 () Bool)

(assert (=> b!314253 (= c!49721 (or (= lt!153861 k!2441) (= (bvadd lt!153861 lt!153861) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314254 () Bool)

(assert (=> b!314254 (and (bvsge (index!13094 lt!153862) #b00000000000000000000000000000000) (bvslt (index!13094 lt!153862) (size!7941 a!3293)))))

(declare-fun e!195778 () Bool)

(assert (=> b!314254 (= e!195778 (= (select (arr!7589 a!3293) (index!13094 lt!153862)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314255 () Bool)

(assert (=> b!314255 (= e!195782 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!314256 () Bool)

(assert (=> b!314256 (and (bvsge (index!13094 lt!153862) #b00000000000000000000000000000000) (bvslt (index!13094 lt!153862) (size!7941 a!3293)))))

(declare-fun res!170034 () Bool)

(assert (=> b!314256 (= res!170034 (= (select (arr!7589 a!3293) (index!13094 lt!153862)) k!2441))))

(assert (=> b!314256 (=> res!170034 e!195778)))

(assert (=> b!314256 (= e!195780 e!195778)))

(declare-fun b!314257 () Bool)

(assert (=> b!314257 (= e!195779 (Intermediate!2729 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314258 () Bool)

(assert (=> b!314258 (and (bvsge (index!13094 lt!153862) #b00000000000000000000000000000000) (bvslt (index!13094 lt!153862) (size!7941 a!3293)))))

(declare-fun res!170035 () Bool)

(assert (=> b!314258 (= res!170035 (= (select (arr!7589 a!3293) (index!13094 lt!153862)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314258 (=> res!170035 e!195778)))

(assert (= (and d!68747 c!49720) b!314257))

(assert (= (and d!68747 (not c!49720)) b!314253))

(assert (= (and b!314253 c!49721) b!314251))

(assert (= (and b!314253 (not c!49721)) b!314255))

(assert (= (and d!68747 c!49722) b!314252))

(assert (= (and d!68747 (not c!49722)) b!314250))

(assert (= (and b!314250 res!170036) b!314256))

(assert (= (and b!314256 (not res!170034)) b!314258))

(assert (= (and b!314258 (not res!170035)) b!314254))

(declare-fun m!323857 () Bool)

(assert (=> b!314256 m!323857))

(assert (=> b!314254 m!323857))

(assert (=> b!314258 m!323857))

(assert (=> b!314255 m!323719))

(declare-fun m!323859 () Bool)

(assert (=> b!314255 m!323859))

(assert (=> b!314255 m!323859))

(declare-fun m!323861 () Bool)

(assert (=> b!314255 m!323861))

(assert (=> d!68747 m!323719))

(declare-fun m!323863 () Bool)

(assert (=> d!68747 m!323863))

(assert (=> d!68747 m!323725))

(assert (=> b!314032 d!68747))

(declare-fun d!68749 () Bool)

(declare-fun lt!153874 () (_ BitVec 32))

(declare-fun lt!153873 () (_ BitVec 32))

(assert (=> d!68749 (= lt!153874 (bvmul (bvxor lt!153873 (bvlshr lt!153873 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68749 (= lt!153873 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68749 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170037 (let ((h!5360 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31329 (bvmul (bvxor h!5360 (bvlshr h!5360 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31329 (bvlshr x!31329 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170037 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170037 #b00000000000000000000000000000000))))))

(assert (=> d!68749 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!153874 (bvlshr lt!153874 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314032 d!68749))

(push 1)

