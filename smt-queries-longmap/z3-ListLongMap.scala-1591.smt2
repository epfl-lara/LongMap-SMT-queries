; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30172 () Bool)

(assert start!30172)

(declare-fun b!302153 () Bool)

(declare-fun res!159764 () Bool)

(declare-fun e!190518 () Bool)

(assert (=> b!302153 (=> (not res!159764) (not e!190518))))

(declare-datatypes ((array!15323 0))(
  ( (array!15324 (arr!7251 (Array (_ BitVec 32) (_ BitVec 64))) (size!7603 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15323)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302153 (= res!159764 (and (= (size!7603 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7603 a!3293))))))

(declare-fun b!302154 () Bool)

(declare-fun res!159765 () Bool)

(assert (=> b!302154 (=> (not res!159765) (not e!190518))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302154 (= res!159765 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302155 () Bool)

(declare-fun res!159767 () Bool)

(assert (=> b!302155 (=> (not res!159767) (not e!190518))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2391 0))(
  ( (MissingZero!2391 (index!11740 (_ BitVec 32))) (Found!2391 (index!11741 (_ BitVec 32))) (Intermediate!2391 (undefined!3203 Bool) (index!11742 (_ BitVec 32)) (x!30010 (_ BitVec 32))) (Undefined!2391) (MissingVacant!2391 (index!11743 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15323 (_ BitVec 32)) SeekEntryResult!2391)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302155 (= res!159767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2391 false resIndex!52 resX!52)))))

(declare-fun b!302156 () Bool)

(declare-fun res!159766 () Bool)

(assert (=> b!302156 (=> (not res!159766) (not e!190518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302156 (= res!159766 (validKeyInArray!0 k0!2441))))

(declare-fun b!302157 () Bool)

(declare-fun res!159763 () Bool)

(assert (=> b!302157 (=> (not res!159763) (not e!190518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15323 (_ BitVec 32)) Bool)

(assert (=> b!302157 (= res!159763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302158 () Bool)

(declare-fun res!159762 () Bool)

(assert (=> b!302158 (=> (not res!159762) (not e!190518))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15323 (_ BitVec 32)) SeekEntryResult!2391)

(assert (=> b!302158 (= res!159762 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2391 i!1240)))))

(declare-fun b!302159 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302159 (= e!190518 (and (= (select (arr!7251 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7603 a!3293)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun res!159768 () Bool)

(assert (=> start!30172 (=> (not res!159768) (not e!190518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30172 (= res!159768 (validMask!0 mask!3709))))

(assert (=> start!30172 e!190518))

(declare-fun array_inv!5214 (array!15323) Bool)

(assert (=> start!30172 (array_inv!5214 a!3293)))

(assert (=> start!30172 true))

(assert (= (and start!30172 res!159768) b!302153))

(assert (= (and b!302153 res!159764) b!302156))

(assert (= (and b!302156 res!159766) b!302154))

(assert (= (and b!302154 res!159765) b!302158))

(assert (= (and b!302158 res!159762) b!302157))

(assert (= (and b!302157 res!159763) b!302155))

(assert (= (and b!302155 res!159767) b!302159))

(declare-fun m!313787 () Bool)

(assert (=> b!302159 m!313787))

(declare-fun m!313789 () Bool)

(assert (=> b!302157 m!313789))

(declare-fun m!313791 () Bool)

(assert (=> b!302158 m!313791))

(declare-fun m!313793 () Bool)

(assert (=> b!302156 m!313793))

(declare-fun m!313795 () Bool)

(assert (=> b!302155 m!313795))

(assert (=> b!302155 m!313795))

(declare-fun m!313797 () Bool)

(assert (=> b!302155 m!313797))

(declare-fun m!313799 () Bool)

(assert (=> start!30172 m!313799))

(declare-fun m!313801 () Bool)

(assert (=> start!30172 m!313801))

(declare-fun m!313803 () Bool)

(assert (=> b!302154 m!313803))

(check-sat (not b!302156) (not b!302157) (not b!302158) (not start!30172) (not b!302155) (not b!302154))
(check-sat)
(get-model)

(declare-fun d!67961 () Bool)

(declare-fun res!159794 () Bool)

(declare-fun e!190530 () Bool)

(assert (=> d!67961 (=> res!159794 e!190530)))

(assert (=> d!67961 (= res!159794 (= (select (arr!7251 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67961 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190530)))

(declare-fun b!302185 () Bool)

(declare-fun e!190531 () Bool)

(assert (=> b!302185 (= e!190530 e!190531)))

(declare-fun res!159795 () Bool)

(assert (=> b!302185 (=> (not res!159795) (not e!190531))))

(assert (=> b!302185 (= res!159795 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7603 a!3293)))))

(declare-fun b!302186 () Bool)

(assert (=> b!302186 (= e!190531 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67961 (not res!159794)) b!302185))

(assert (= (and b!302185 res!159795) b!302186))

(declare-fun m!313823 () Bool)

(assert (=> d!67961 m!313823))

(declare-fun m!313825 () Bool)

(assert (=> b!302186 m!313825))

(assert (=> b!302154 d!67961))

(declare-fun d!67963 () Bool)

(assert (=> d!67963 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30172 d!67963))

(declare-fun d!67973 () Bool)

(assert (=> d!67973 (= (array_inv!5214 a!3293) (bvsge (size!7603 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30172 d!67973))

(declare-fun d!67975 () Bool)

(declare-fun res!159807 () Bool)

(declare-fun e!190546 () Bool)

(assert (=> d!67975 (=> res!159807 e!190546)))

(assert (=> d!67975 (= res!159807 (bvsge #b00000000000000000000000000000000 (size!7603 a!3293)))))

(assert (=> d!67975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190546)))

(declare-fun b!302201 () Bool)

(declare-fun e!190545 () Bool)

(declare-fun call!25885 () Bool)

(assert (=> b!302201 (= e!190545 call!25885)))

(declare-fun b!302202 () Bool)

(declare-fun e!190544 () Bool)

(assert (=> b!302202 (= e!190544 call!25885)))

(declare-fun b!302203 () Bool)

(assert (=> b!302203 (= e!190546 e!190545)))

(declare-fun c!48795 () Bool)

(assert (=> b!302203 (= c!48795 (validKeyInArray!0 (select (arr!7251 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25882 () Bool)

(assert (=> bm!25882 (= call!25885 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!302204 () Bool)

(assert (=> b!302204 (= e!190545 e!190544)))

(declare-fun lt!149999 () (_ BitVec 64))

(assert (=> b!302204 (= lt!149999 (select (arr!7251 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9383 0))(
  ( (Unit!9384) )
))
(declare-fun lt!150001 () Unit!9383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15323 (_ BitVec 64) (_ BitVec 32)) Unit!9383)

(assert (=> b!302204 (= lt!150001 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149999 #b00000000000000000000000000000000))))

(assert (=> b!302204 (arrayContainsKey!0 a!3293 lt!149999 #b00000000000000000000000000000000)))

(declare-fun lt!150000 () Unit!9383)

(assert (=> b!302204 (= lt!150000 lt!150001)))

(declare-fun res!159806 () Bool)

(assert (=> b!302204 (= res!159806 (= (seekEntryOrOpen!0 (select (arr!7251 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2391 #b00000000000000000000000000000000)))))

(assert (=> b!302204 (=> (not res!159806) (not e!190544))))

(assert (= (and d!67975 (not res!159807)) b!302203))

(assert (= (and b!302203 c!48795) b!302204))

(assert (= (and b!302203 (not c!48795)) b!302201))

(assert (= (and b!302204 res!159806) b!302202))

(assert (= (or b!302202 b!302201) bm!25882))

(assert (=> b!302203 m!313823))

(assert (=> b!302203 m!313823))

(declare-fun m!313831 () Bool)

(assert (=> b!302203 m!313831))

(declare-fun m!313833 () Bool)

(assert (=> bm!25882 m!313833))

(assert (=> b!302204 m!313823))

(declare-fun m!313835 () Bool)

(assert (=> b!302204 m!313835))

(declare-fun m!313837 () Bool)

(assert (=> b!302204 m!313837))

(assert (=> b!302204 m!313823))

(declare-fun m!313839 () Bool)

(assert (=> b!302204 m!313839))

(assert (=> b!302157 d!67975))

(declare-fun d!67979 () Bool)

(declare-fun lt!150026 () SeekEntryResult!2391)

(get-info :version)

(assert (=> d!67979 (and (or ((_ is Undefined!2391) lt!150026) (not ((_ is Found!2391) lt!150026)) (and (bvsge (index!11741 lt!150026) #b00000000000000000000000000000000) (bvslt (index!11741 lt!150026) (size!7603 a!3293)))) (or ((_ is Undefined!2391) lt!150026) ((_ is Found!2391) lt!150026) (not ((_ is MissingZero!2391) lt!150026)) (and (bvsge (index!11740 lt!150026) #b00000000000000000000000000000000) (bvslt (index!11740 lt!150026) (size!7603 a!3293)))) (or ((_ is Undefined!2391) lt!150026) ((_ is Found!2391) lt!150026) ((_ is MissingZero!2391) lt!150026) (not ((_ is MissingVacant!2391) lt!150026)) (and (bvsge (index!11743 lt!150026) #b00000000000000000000000000000000) (bvslt (index!11743 lt!150026) (size!7603 a!3293)))) (or ((_ is Undefined!2391) lt!150026) (ite ((_ is Found!2391) lt!150026) (= (select (arr!7251 a!3293) (index!11741 lt!150026)) k0!2441) (ite ((_ is MissingZero!2391) lt!150026) (= (select (arr!7251 a!3293) (index!11740 lt!150026)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2391) lt!150026) (= (select (arr!7251 a!3293) (index!11743 lt!150026)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!190578 () SeekEntryResult!2391)

(assert (=> d!67979 (= lt!150026 e!190578)))

(declare-fun c!48814 () Bool)

(declare-fun lt!150025 () SeekEntryResult!2391)

(assert (=> d!67979 (= c!48814 (and ((_ is Intermediate!2391) lt!150025) (undefined!3203 lt!150025)))))

(assert (=> d!67979 (= lt!150025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67979 (validMask!0 mask!3709)))

(assert (=> d!67979 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!150026)))

(declare-fun b!302256 () Bool)

(assert (=> b!302256 (= e!190578 Undefined!2391)))

(declare-fun e!190577 () SeekEntryResult!2391)

(declare-fun b!302257 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15323 (_ BitVec 32)) SeekEntryResult!2391)

(assert (=> b!302257 (= e!190577 (seekKeyOrZeroReturnVacant!0 (x!30010 lt!150025) (index!11742 lt!150025) (index!11742 lt!150025) k0!2441 a!3293 mask!3709))))

(declare-fun b!302258 () Bool)

(declare-fun c!48816 () Bool)

(declare-fun lt!150027 () (_ BitVec 64))

(assert (=> b!302258 (= c!48816 (= lt!150027 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!190579 () SeekEntryResult!2391)

(assert (=> b!302258 (= e!190579 e!190577)))

(declare-fun b!302259 () Bool)

(assert (=> b!302259 (= e!190579 (Found!2391 (index!11742 lt!150025)))))

(declare-fun b!302260 () Bool)

(assert (=> b!302260 (= e!190578 e!190579)))

(assert (=> b!302260 (= lt!150027 (select (arr!7251 a!3293) (index!11742 lt!150025)))))

(declare-fun c!48815 () Bool)

(assert (=> b!302260 (= c!48815 (= lt!150027 k0!2441))))

(declare-fun b!302261 () Bool)

(assert (=> b!302261 (= e!190577 (MissingZero!2391 (index!11742 lt!150025)))))

(assert (= (and d!67979 c!48814) b!302256))

(assert (= (and d!67979 (not c!48814)) b!302260))

(assert (= (and b!302260 c!48815) b!302259))

(assert (= (and b!302260 (not c!48815)) b!302258))

(assert (= (and b!302258 c!48816) b!302261))

(assert (= (and b!302258 (not c!48816)) b!302257))

(assert (=> d!67979 m!313795))

(assert (=> d!67979 m!313797))

(declare-fun m!313859 () Bool)

(assert (=> d!67979 m!313859))

(assert (=> d!67979 m!313799))

(assert (=> d!67979 m!313795))

(declare-fun m!313861 () Bool)

(assert (=> d!67979 m!313861))

(declare-fun m!313863 () Bool)

(assert (=> d!67979 m!313863))

(declare-fun m!313865 () Bool)

(assert (=> b!302257 m!313865))

(declare-fun m!313867 () Bool)

(assert (=> b!302260 m!313867))

(assert (=> b!302158 d!67979))

(declare-fun d!67991 () Bool)

(assert (=> d!67991 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!302156 d!67991))

(declare-fun b!302325 () Bool)

(declare-fun lt!150054 () SeekEntryResult!2391)

(assert (=> b!302325 (and (bvsge (index!11742 lt!150054) #b00000000000000000000000000000000) (bvslt (index!11742 lt!150054) (size!7603 a!3293)))))

(declare-fun res!159854 () Bool)

(assert (=> b!302325 (= res!159854 (= (select (arr!7251 a!3293) (index!11742 lt!150054)) k0!2441))))

(declare-fun e!190622 () Bool)

(assert (=> b!302325 (=> res!159854 e!190622)))

(declare-fun e!190624 () Bool)

(assert (=> b!302325 (= e!190624 e!190622)))

(declare-fun b!302326 () Bool)

(declare-fun e!190620 () SeekEntryResult!2391)

(assert (=> b!302326 (= e!190620 (Intermediate!2391 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!302327 () Bool)

(declare-fun e!190623 () SeekEntryResult!2391)

(assert (=> b!302327 (= e!190623 (Intermediate!2391 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!302328 () Bool)

(declare-fun e!190621 () Bool)

(assert (=> b!302328 (= e!190621 (bvsge (x!30010 lt!150054) #b01111111111111111111111111111110))))

(declare-fun b!302329 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302329 (= e!190623 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!302330 () Bool)

(assert (=> b!302330 (= e!190621 e!190624)))

(declare-fun res!159852 () Bool)

(assert (=> b!302330 (= res!159852 (and ((_ is Intermediate!2391) lt!150054) (not (undefined!3203 lt!150054)) (bvslt (x!30010 lt!150054) #b01111111111111111111111111111110) (bvsge (x!30010 lt!150054) #b00000000000000000000000000000000) (bvsge (x!30010 lt!150054) #b00000000000000000000000000000000)))))

(assert (=> b!302330 (=> (not res!159852) (not e!190624))))

(declare-fun b!302331 () Bool)

(assert (=> b!302331 (and (bvsge (index!11742 lt!150054) #b00000000000000000000000000000000) (bvslt (index!11742 lt!150054) (size!7603 a!3293)))))

(assert (=> b!302331 (= e!190622 (= (select (arr!7251 a!3293) (index!11742 lt!150054)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67993 () Bool)

(assert (=> d!67993 e!190621))

(declare-fun c!48835 () Bool)

(assert (=> d!67993 (= c!48835 (and ((_ is Intermediate!2391) lt!150054) (undefined!3203 lt!150054)))))

(assert (=> d!67993 (= lt!150054 e!190620)))

(declare-fun c!48837 () Bool)

(assert (=> d!67993 (= c!48837 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!150053 () (_ BitVec 64))

(assert (=> d!67993 (= lt!150053 (select (arr!7251 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!67993 (validMask!0 mask!3709)))

(assert (=> d!67993 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150054)))

(declare-fun b!302332 () Bool)

(assert (=> b!302332 (= e!190620 e!190623)))

(declare-fun c!48836 () Bool)

(assert (=> b!302332 (= c!48836 (or (= lt!150053 k0!2441) (= (bvadd lt!150053 lt!150053) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!302333 () Bool)

(assert (=> b!302333 (and (bvsge (index!11742 lt!150054) #b00000000000000000000000000000000) (bvslt (index!11742 lt!150054) (size!7603 a!3293)))))

(declare-fun res!159853 () Bool)

(assert (=> b!302333 (= res!159853 (= (select (arr!7251 a!3293) (index!11742 lt!150054)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!302333 (=> res!159853 e!190622)))

(assert (= (and d!67993 c!48837) b!302326))

(assert (= (and d!67993 (not c!48837)) b!302332))

(assert (= (and b!302332 c!48836) b!302327))

(assert (= (and b!302332 (not c!48836)) b!302329))

(assert (= (and d!67993 c!48835) b!302328))

(assert (= (and d!67993 (not c!48835)) b!302330))

(assert (= (and b!302330 res!159852) b!302325))

(assert (= (and b!302325 (not res!159854)) b!302333))

(assert (= (and b!302333 (not res!159853)) b!302331))

(declare-fun m!313891 () Bool)

(assert (=> b!302333 m!313891))

(assert (=> d!67993 m!313795))

(declare-fun m!313893 () Bool)

(assert (=> d!67993 m!313893))

(assert (=> d!67993 m!313799))

(assert (=> b!302331 m!313891))

(assert (=> b!302329 m!313795))

(declare-fun m!313895 () Bool)

(assert (=> b!302329 m!313895))

(assert (=> b!302329 m!313895))

(declare-fun m!313897 () Bool)

(assert (=> b!302329 m!313897))

(assert (=> b!302325 m!313891))

(assert (=> b!302155 d!67993))

(declare-fun d!68007 () Bool)

(declare-fun lt!150060 () (_ BitVec 32))

(declare-fun lt!150059 () (_ BitVec 32))

(assert (=> d!68007 (= lt!150060 (bvmul (bvxor lt!150059 (bvlshr lt!150059 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68007 (= lt!150059 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68007 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!159855 (let ((h!5333 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30017 (bvmul (bvxor h!5333 (bvlshr h!5333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30017 (bvlshr x!30017 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!159855 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!159855 #b00000000000000000000000000000000))))))

(assert (=> d!68007 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!150060 (bvlshr lt!150060 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!302155 d!68007))

(check-sat (not b!302203) (not b!302257) (not b!302329) (not d!67979) (not b!302204) (not bm!25882) (not b!302186) (not d!67993))
(check-sat)
