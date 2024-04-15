; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31494 () Bool)

(assert start!31494)

(declare-fun b!315037 () Bool)

(declare-fun e!196112 () Bool)

(declare-fun e!196113 () Bool)

(assert (=> b!315037 (= e!196112 e!196113)))

(declare-fun res!170636 () Bool)

(assert (=> b!315037 (=> (not res!170636) (not e!196113))))

(declare-datatypes ((SeekEntryResult!2747 0))(
  ( (MissingZero!2747 (index!13164 (_ BitVec 32))) (Found!2747 (index!13165 (_ BitVec 32))) (Intermediate!2747 (undefined!3559 Bool) (index!13166 (_ BitVec 32)) (x!31419 (_ BitVec 32))) (Undefined!2747) (MissingVacant!2747 (index!13167 (_ BitVec 32))) )
))
(declare-fun lt!153977 () SeekEntryResult!2747)

(declare-fun lt!153976 () SeekEntryResult!2747)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!16073 0))(
  ( (array!16074 (arr!7608 (Array (_ BitVec 32) (_ BitVec 64))) (size!7961 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16073)

(assert (=> b!315037 (= res!170636 (and (= lt!153977 lt!153976) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7608 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7608 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7608 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16073 (_ BitVec 32)) SeekEntryResult!2747)

(assert (=> b!315037 (= lt!153977 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!315038 () Bool)

(declare-fun res!170640 () Bool)

(declare-fun e!196115 () Bool)

(assert (=> b!315038 (=> (not res!170640) (not e!196115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16073 (_ BitVec 32)) Bool)

(assert (=> b!315038 (= res!170640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315039 () Bool)

(declare-fun res!170638 () Bool)

(assert (=> b!315039 (=> (not res!170638) (not e!196115))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315039 (= res!170638 (and (= (size!7961 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7961 a!3293))))))

(declare-fun b!315040 () Bool)

(assert (=> b!315040 (= e!196113 (not false))))

(declare-fun lt!153975 () SeekEntryResult!2747)

(get-info :version)

(assert (=> b!315040 (and (= lt!153977 lt!153975) ((_ is Intermediate!2747) lt!153975))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315040 (= lt!153975 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315041 () Bool)

(declare-fun res!170632 () Bool)

(assert (=> b!315041 (=> (not res!170632) (not e!196112))))

(assert (=> b!315041 (= res!170632 (and (= (select (arr!7608 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7961 a!3293))))))

(declare-fun b!315042 () Bool)

(assert (=> b!315042 (= e!196115 e!196112)))

(declare-fun res!170637 () Bool)

(assert (=> b!315042 (=> (not res!170637) (not e!196112))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315042 (= res!170637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153976))))

(assert (=> b!315042 (= lt!153976 (Intermediate!2747 false resIndex!52 resX!52))))

(declare-fun res!170633 () Bool)

(assert (=> start!31494 (=> (not res!170633) (not e!196115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31494 (= res!170633 (validMask!0 mask!3709))))

(assert (=> start!31494 e!196115))

(declare-fun array_inv!5580 (array!16073) Bool)

(assert (=> start!31494 (array_inv!5580 a!3293)))

(assert (=> start!31494 true))

(declare-fun b!315043 () Bool)

(declare-fun res!170634 () Bool)

(assert (=> b!315043 (=> (not res!170634) (not e!196115))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16073 (_ BitVec 32)) SeekEntryResult!2747)

(assert (=> b!315043 (= res!170634 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2747 i!1240)))))

(declare-fun b!315044 () Bool)

(declare-fun res!170639 () Bool)

(assert (=> b!315044 (=> (not res!170639) (not e!196115))))

(declare-fun arrayContainsKey!0 (array!16073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315044 (= res!170639 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315045 () Bool)

(declare-fun res!170635 () Bool)

(assert (=> b!315045 (=> (not res!170635) (not e!196115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315045 (= res!170635 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31494 res!170633) b!315039))

(assert (= (and b!315039 res!170638) b!315045))

(assert (= (and b!315045 res!170635) b!315044))

(assert (= (and b!315044 res!170639) b!315043))

(assert (= (and b!315043 res!170634) b!315038))

(assert (= (and b!315038 res!170640) b!315042))

(assert (= (and b!315042 res!170637) b!315041))

(assert (= (and b!315041 res!170632) b!315037))

(assert (= (and b!315037 res!170636) b!315040))

(declare-fun m!323887 () Bool)

(assert (=> b!315045 m!323887))

(declare-fun m!323889 () Bool)

(assert (=> b!315040 m!323889))

(assert (=> b!315040 m!323889))

(declare-fun m!323891 () Bool)

(assert (=> b!315040 m!323891))

(declare-fun m!323893 () Bool)

(assert (=> b!315037 m!323893))

(declare-fun m!323895 () Bool)

(assert (=> b!315037 m!323895))

(declare-fun m!323897 () Bool)

(assert (=> b!315043 m!323897))

(declare-fun m!323899 () Bool)

(assert (=> start!31494 m!323899))

(declare-fun m!323901 () Bool)

(assert (=> start!31494 m!323901))

(declare-fun m!323903 () Bool)

(assert (=> b!315041 m!323903))

(declare-fun m!323905 () Bool)

(assert (=> b!315042 m!323905))

(assert (=> b!315042 m!323905))

(declare-fun m!323907 () Bool)

(assert (=> b!315042 m!323907))

(declare-fun m!323909 () Bool)

(assert (=> b!315038 m!323909))

(declare-fun m!323911 () Bool)

(assert (=> b!315044 m!323911))

(check-sat (not b!315038) (not b!315040) (not b!315043) (not b!315037) (not b!315044) (not b!315045) (not start!31494) (not b!315042))
(check-sat)
(get-model)

(declare-fun b!315131 () Bool)

(declare-fun e!196157 () SeekEntryResult!2747)

(assert (=> b!315131 (= e!196157 Undefined!2747)))

(declare-fun b!315132 () Bool)

(declare-fun c!49832 () Bool)

(declare-fun lt!154011 () (_ BitVec 64))

(assert (=> b!315132 (= c!49832 (= lt!154011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196156 () SeekEntryResult!2747)

(declare-fun e!196158 () SeekEntryResult!2747)

(assert (=> b!315132 (= e!196156 e!196158)))

(declare-fun lt!154010 () SeekEntryResult!2747)

(declare-fun b!315133 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16073 (_ BitVec 32)) SeekEntryResult!2747)

(assert (=> b!315133 (= e!196158 (seekKeyOrZeroReturnVacant!0 (x!31419 lt!154010) (index!13166 lt!154010) (index!13166 lt!154010) k0!2441 a!3293 mask!3709))))

(declare-fun b!315134 () Bool)

(assert (=> b!315134 (= e!196158 (MissingZero!2747 (index!13166 lt!154010)))))

(declare-fun b!315135 () Bool)

(assert (=> b!315135 (= e!196156 (Found!2747 (index!13166 lt!154010)))))

(declare-fun d!68693 () Bool)

(declare-fun lt!154012 () SeekEntryResult!2747)

(assert (=> d!68693 (and (or ((_ is Undefined!2747) lt!154012) (not ((_ is Found!2747) lt!154012)) (and (bvsge (index!13165 lt!154012) #b00000000000000000000000000000000) (bvslt (index!13165 lt!154012) (size!7961 a!3293)))) (or ((_ is Undefined!2747) lt!154012) ((_ is Found!2747) lt!154012) (not ((_ is MissingZero!2747) lt!154012)) (and (bvsge (index!13164 lt!154012) #b00000000000000000000000000000000) (bvslt (index!13164 lt!154012) (size!7961 a!3293)))) (or ((_ is Undefined!2747) lt!154012) ((_ is Found!2747) lt!154012) ((_ is MissingZero!2747) lt!154012) (not ((_ is MissingVacant!2747) lt!154012)) (and (bvsge (index!13167 lt!154012) #b00000000000000000000000000000000) (bvslt (index!13167 lt!154012) (size!7961 a!3293)))) (or ((_ is Undefined!2747) lt!154012) (ite ((_ is Found!2747) lt!154012) (= (select (arr!7608 a!3293) (index!13165 lt!154012)) k0!2441) (ite ((_ is MissingZero!2747) lt!154012) (= (select (arr!7608 a!3293) (index!13164 lt!154012)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2747) lt!154012) (= (select (arr!7608 a!3293) (index!13167 lt!154012)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68693 (= lt!154012 e!196157)))

(declare-fun c!49834 () Bool)

(assert (=> d!68693 (= c!49834 (and ((_ is Intermediate!2747) lt!154010) (undefined!3559 lt!154010)))))

(assert (=> d!68693 (= lt!154010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68693 (validMask!0 mask!3709)))

(assert (=> d!68693 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154012)))

(declare-fun b!315130 () Bool)

(assert (=> b!315130 (= e!196157 e!196156)))

(assert (=> b!315130 (= lt!154011 (select (arr!7608 a!3293) (index!13166 lt!154010)))))

(declare-fun c!49833 () Bool)

(assert (=> b!315130 (= c!49833 (= lt!154011 k0!2441))))

(assert (= (and d!68693 c!49834) b!315131))

(assert (= (and d!68693 (not c!49834)) b!315130))

(assert (= (and b!315130 c!49833) b!315135))

(assert (= (and b!315130 (not c!49833)) b!315132))

(assert (= (and b!315132 c!49832) b!315134))

(assert (= (and b!315132 (not c!49832)) b!315133))

(declare-fun m!323965 () Bool)

(assert (=> b!315133 m!323965))

(declare-fun m!323967 () Bool)

(assert (=> d!68693 m!323967))

(assert (=> d!68693 m!323905))

(assert (=> d!68693 m!323899))

(assert (=> d!68693 m!323905))

(assert (=> d!68693 m!323907))

(declare-fun m!323969 () Bool)

(assert (=> d!68693 m!323969))

(declare-fun m!323971 () Bool)

(assert (=> d!68693 m!323971))

(declare-fun m!323973 () Bool)

(assert (=> b!315130 m!323973))

(assert (=> b!315043 d!68693))

(declare-fun b!315171 () Bool)

(declare-fun e!196186 () Bool)

(declare-fun e!196185 () Bool)

(assert (=> b!315171 (= e!196186 e!196185)))

(declare-fun c!49841 () Bool)

(assert (=> b!315171 (= c!49841 (validKeyInArray!0 (select (arr!7608 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!315172 () Bool)

(declare-fun e!196187 () Bool)

(assert (=> b!315172 (= e!196185 e!196187)))

(declare-fun lt!154033 () (_ BitVec 64))

(assert (=> b!315172 (= lt!154033 (select (arr!7608 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9665 0))(
  ( (Unit!9666) )
))
(declare-fun lt!154034 () Unit!9665)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16073 (_ BitVec 64) (_ BitVec 32)) Unit!9665)

(assert (=> b!315172 (= lt!154034 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154033 #b00000000000000000000000000000000))))

(assert (=> b!315172 (arrayContainsKey!0 a!3293 lt!154033 #b00000000000000000000000000000000)))

(declare-fun lt!154032 () Unit!9665)

(assert (=> b!315172 (= lt!154032 lt!154034)))

(declare-fun res!170722 () Bool)

(assert (=> b!315172 (= res!170722 (= (seekEntryOrOpen!0 (select (arr!7608 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2747 #b00000000000000000000000000000000)))))

(assert (=> b!315172 (=> (not res!170722) (not e!196187))))

(declare-fun d!68699 () Bool)

(declare-fun res!170721 () Bool)

(assert (=> d!68699 (=> res!170721 e!196186)))

(assert (=> d!68699 (= res!170721 (bvsge #b00000000000000000000000000000000 (size!7961 a!3293)))))

(assert (=> d!68699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196186)))

(declare-fun b!315173 () Bool)

(declare-fun call!25970 () Bool)

(assert (=> b!315173 (= e!196187 call!25970)))

(declare-fun b!315174 () Bool)

(assert (=> b!315174 (= e!196185 call!25970)))

(declare-fun bm!25967 () Bool)

(assert (=> bm!25967 (= call!25970 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68699 (not res!170721)) b!315171))

(assert (= (and b!315171 c!49841) b!315172))

(assert (= (and b!315171 (not c!49841)) b!315174))

(assert (= (and b!315172 res!170722) b!315173))

(assert (= (or b!315173 b!315174) bm!25967))

(declare-fun m!323997 () Bool)

(assert (=> b!315171 m!323997))

(assert (=> b!315171 m!323997))

(declare-fun m!323999 () Bool)

(assert (=> b!315171 m!323999))

(assert (=> b!315172 m!323997))

(declare-fun m!324001 () Bool)

(assert (=> b!315172 m!324001))

(declare-fun m!324003 () Bool)

(assert (=> b!315172 m!324003))

(assert (=> b!315172 m!323997))

(declare-fun m!324005 () Bool)

(assert (=> b!315172 m!324005))

(declare-fun m!324007 () Bool)

(assert (=> bm!25967 m!324007))

(assert (=> b!315038 d!68699))

(declare-fun d!68709 () Bool)

(assert (=> d!68709 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31494 d!68709))

(declare-fun d!68715 () Bool)

(assert (=> d!68715 (= (array_inv!5580 a!3293) (bvsge (size!7961 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31494 d!68715))

(declare-fun d!68717 () Bool)

(declare-fun res!170733 () Bool)

(declare-fun e!196208 () Bool)

(assert (=> d!68717 (=> res!170733 e!196208)))

(assert (=> d!68717 (= res!170733 (= (select (arr!7608 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68717 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196208)))

(declare-fun b!315209 () Bool)

(declare-fun e!196209 () Bool)

(assert (=> b!315209 (= e!196208 e!196209)))

(declare-fun res!170734 () Bool)

(assert (=> b!315209 (=> (not res!170734) (not e!196209))))

(assert (=> b!315209 (= res!170734 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7961 a!3293)))))

(declare-fun b!315210 () Bool)

(assert (=> b!315210 (= e!196209 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68717 (not res!170733)) b!315209))

(assert (= (and b!315209 res!170734) b!315210))

(assert (=> d!68717 m!323997))

(declare-fun m!324009 () Bool)

(assert (=> b!315210 m!324009))

(assert (=> b!315044 d!68717))

(declare-fun b!315280 () Bool)

(declare-fun e!196255 () SeekEntryResult!2747)

(declare-fun e!196256 () SeekEntryResult!2747)

(assert (=> b!315280 (= e!196255 e!196256)))

(declare-fun c!49876 () Bool)

(declare-fun lt!154077 () (_ BitVec 64))

(assert (=> b!315280 (= c!49876 (or (= lt!154077 k0!2441) (= (bvadd lt!154077 lt!154077) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315281 () Bool)

(declare-fun lt!154076 () SeekEntryResult!2747)

(assert (=> b!315281 (and (bvsge (index!13166 lt!154076) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154076) (size!7961 a!3293)))))

(declare-fun res!170765 () Bool)

(assert (=> b!315281 (= res!170765 (= (select (arr!7608 a!3293) (index!13166 lt!154076)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196253 () Bool)

(assert (=> b!315281 (=> res!170765 e!196253)))

(declare-fun b!315282 () Bool)

(assert (=> b!315282 (and (bvsge (index!13166 lt!154076) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154076) (size!7961 a!3293)))))

(assert (=> b!315282 (= e!196253 (= (select (arr!7608 a!3293) (index!13166 lt!154076)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315283 () Bool)

(assert (=> b!315283 (= e!196255 (Intermediate!2747 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315284 () Bool)

(assert (=> b!315284 (= e!196256 (Intermediate!2747 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315285 () Bool)

(assert (=> b!315285 (= e!196256 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315286 () Bool)

(declare-fun e!196257 () Bool)

(declare-fun e!196254 () Bool)

(assert (=> b!315286 (= e!196257 e!196254)))

(declare-fun res!170763 () Bool)

(assert (=> b!315286 (= res!170763 (and ((_ is Intermediate!2747) lt!154076) (not (undefined!3559 lt!154076)) (bvslt (x!31419 lt!154076) #b01111111111111111111111111111110) (bvsge (x!31419 lt!154076) #b00000000000000000000000000000000) (bvsge (x!31419 lt!154076) #b00000000000000000000000000000000)))))

(assert (=> b!315286 (=> (not res!170763) (not e!196254))))

(declare-fun b!315287 () Bool)

(assert (=> b!315287 (= e!196257 (bvsge (x!31419 lt!154076) #b01111111111111111111111111111110))))

(declare-fun d!68719 () Bool)

(assert (=> d!68719 e!196257))

(declare-fun c!49877 () Bool)

(assert (=> d!68719 (= c!49877 (and ((_ is Intermediate!2747) lt!154076) (undefined!3559 lt!154076)))))

(assert (=> d!68719 (= lt!154076 e!196255)))

(declare-fun c!49875 () Bool)

(assert (=> d!68719 (= c!49875 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68719 (= lt!154077 (select (arr!7608 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68719 (validMask!0 mask!3709)))

(assert (=> d!68719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154076)))

(declare-fun b!315288 () Bool)

(assert (=> b!315288 (and (bvsge (index!13166 lt!154076) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154076) (size!7961 a!3293)))))

(declare-fun res!170764 () Bool)

(assert (=> b!315288 (= res!170764 (= (select (arr!7608 a!3293) (index!13166 lt!154076)) k0!2441))))

(assert (=> b!315288 (=> res!170764 e!196253)))

(assert (=> b!315288 (= e!196254 e!196253)))

(assert (= (and d!68719 c!49875) b!315283))

(assert (= (and d!68719 (not c!49875)) b!315280))

(assert (= (and b!315280 c!49876) b!315284))

(assert (= (and b!315280 (not c!49876)) b!315285))

(assert (= (and d!68719 c!49877) b!315287))

(assert (= (and d!68719 (not c!49877)) b!315286))

(assert (= (and b!315286 res!170763) b!315288))

(assert (= (and b!315288 (not res!170764)) b!315281))

(assert (= (and b!315281 (not res!170765)) b!315282))

(declare-fun m!324057 () Bool)

(assert (=> b!315282 m!324057))

(assert (=> b!315281 m!324057))

(assert (=> b!315285 m!323905))

(declare-fun m!324059 () Bool)

(assert (=> b!315285 m!324059))

(assert (=> b!315285 m!324059))

(declare-fun m!324061 () Bool)

(assert (=> b!315285 m!324061))

(assert (=> d!68719 m!323905))

(declare-fun m!324063 () Bool)

(assert (=> d!68719 m!324063))

(assert (=> d!68719 m!323899))

(assert (=> b!315288 m!324057))

(assert (=> b!315042 d!68719))

(declare-fun d!68737 () Bool)

(declare-fun lt!154089 () (_ BitVec 32))

(declare-fun lt!154088 () (_ BitVec 32))

(assert (=> d!68737 (= lt!154089 (bvmul (bvxor lt!154088 (bvlshr lt!154088 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68737 (= lt!154088 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68737 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170766 (let ((h!5337 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31428 (bvmul (bvxor h!5337 (bvlshr h!5337 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31428 (bvlshr x!31428 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170766 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170766 #b00000000000000000000000000000000))))))

(assert (=> d!68737 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154089 (bvlshr lt!154089 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!315042 d!68737))

(declare-fun b!315301 () Bool)

(declare-fun e!196266 () SeekEntryResult!2747)

(declare-fun e!196267 () SeekEntryResult!2747)

(assert (=> b!315301 (= e!196266 e!196267)))

(declare-fun c!49885 () Bool)

(declare-fun lt!154091 () (_ BitVec 64))

(assert (=> b!315301 (= c!49885 (or (= lt!154091 k0!2441) (= (bvadd lt!154091 lt!154091) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315302 () Bool)

(declare-fun lt!154090 () SeekEntryResult!2747)

(assert (=> b!315302 (and (bvsge (index!13166 lt!154090) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154090) (size!7961 a!3293)))))

(declare-fun res!170769 () Bool)

(assert (=> b!315302 (= res!170769 (= (select (arr!7608 a!3293) (index!13166 lt!154090)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196264 () Bool)

(assert (=> b!315302 (=> res!170769 e!196264)))

(declare-fun b!315303 () Bool)

(assert (=> b!315303 (and (bvsge (index!13166 lt!154090) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154090) (size!7961 a!3293)))))

(assert (=> b!315303 (= e!196264 (= (select (arr!7608 a!3293) (index!13166 lt!154090)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315304 () Bool)

(assert (=> b!315304 (= e!196266 (Intermediate!2747 true index!1781 x!1427))))

(declare-fun b!315305 () Bool)

(assert (=> b!315305 (= e!196267 (Intermediate!2747 false index!1781 x!1427))))

(declare-fun b!315306 () Bool)

(assert (=> b!315306 (= e!196267 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315307 () Bool)

(declare-fun e!196268 () Bool)

(declare-fun e!196265 () Bool)

(assert (=> b!315307 (= e!196268 e!196265)))

(declare-fun res!170767 () Bool)

(assert (=> b!315307 (= res!170767 (and ((_ is Intermediate!2747) lt!154090) (not (undefined!3559 lt!154090)) (bvslt (x!31419 lt!154090) #b01111111111111111111111111111110) (bvsge (x!31419 lt!154090) #b00000000000000000000000000000000) (bvsge (x!31419 lt!154090) x!1427)))))

(assert (=> b!315307 (=> (not res!170767) (not e!196265))))

(declare-fun b!315308 () Bool)

(assert (=> b!315308 (= e!196268 (bvsge (x!31419 lt!154090) #b01111111111111111111111111111110))))

(declare-fun d!68739 () Bool)

(assert (=> d!68739 e!196268))

(declare-fun c!49886 () Bool)

(assert (=> d!68739 (= c!49886 (and ((_ is Intermediate!2747) lt!154090) (undefined!3559 lt!154090)))))

(assert (=> d!68739 (= lt!154090 e!196266)))

(declare-fun c!49884 () Bool)

(assert (=> d!68739 (= c!49884 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68739 (= lt!154091 (select (arr!7608 a!3293) index!1781))))

(assert (=> d!68739 (validMask!0 mask!3709)))

(assert (=> d!68739 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154090)))

(declare-fun b!315309 () Bool)

(assert (=> b!315309 (and (bvsge (index!13166 lt!154090) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154090) (size!7961 a!3293)))))

(declare-fun res!170768 () Bool)

(assert (=> b!315309 (= res!170768 (= (select (arr!7608 a!3293) (index!13166 lt!154090)) k0!2441))))

(assert (=> b!315309 (=> res!170768 e!196264)))

(assert (=> b!315309 (= e!196265 e!196264)))

(assert (= (and d!68739 c!49884) b!315304))

(assert (= (and d!68739 (not c!49884)) b!315301))

(assert (= (and b!315301 c!49885) b!315305))

(assert (= (and b!315301 (not c!49885)) b!315306))

(assert (= (and d!68739 c!49886) b!315308))

(assert (= (and d!68739 (not c!49886)) b!315307))

(assert (= (and b!315307 res!170767) b!315309))

(assert (= (and b!315309 (not res!170768)) b!315302))

(assert (= (and b!315302 (not res!170769)) b!315303))

(declare-fun m!324065 () Bool)

(assert (=> b!315303 m!324065))

(assert (=> b!315302 m!324065))

(assert (=> b!315306 m!323889))

(assert (=> b!315306 m!323889))

(declare-fun m!324067 () Bool)

(assert (=> b!315306 m!324067))

(assert (=> d!68739 m!323893))

(assert (=> d!68739 m!323899))

(assert (=> b!315309 m!324065))

(assert (=> b!315037 d!68739))

(declare-fun d!68741 () Bool)

(assert (=> d!68741 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315045 d!68741))

(declare-fun b!315310 () Bool)

(declare-fun e!196271 () SeekEntryResult!2747)

(declare-fun e!196272 () SeekEntryResult!2747)

(assert (=> b!315310 (= e!196271 e!196272)))

(declare-fun c!49888 () Bool)

(declare-fun lt!154093 () (_ BitVec 64))

(assert (=> b!315310 (= c!49888 (or (= lt!154093 k0!2441) (= (bvadd lt!154093 lt!154093) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315311 () Bool)

(declare-fun lt!154092 () SeekEntryResult!2747)

(assert (=> b!315311 (and (bvsge (index!13166 lt!154092) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154092) (size!7961 a!3293)))))

(declare-fun res!170772 () Bool)

(assert (=> b!315311 (= res!170772 (= (select (arr!7608 a!3293) (index!13166 lt!154092)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196269 () Bool)

(assert (=> b!315311 (=> res!170772 e!196269)))

(declare-fun b!315312 () Bool)

(assert (=> b!315312 (and (bvsge (index!13166 lt!154092) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154092) (size!7961 a!3293)))))

(assert (=> b!315312 (= e!196269 (= (select (arr!7608 a!3293) (index!13166 lt!154092)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315313 () Bool)

(assert (=> b!315313 (= e!196271 (Intermediate!2747 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315314 () Bool)

(assert (=> b!315314 (= e!196272 (Intermediate!2747 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315315 () Bool)

(assert (=> b!315315 (= e!196272 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315316 () Bool)

(declare-fun e!196273 () Bool)

(declare-fun e!196270 () Bool)

(assert (=> b!315316 (= e!196273 e!196270)))

(declare-fun res!170770 () Bool)

(assert (=> b!315316 (= res!170770 (and ((_ is Intermediate!2747) lt!154092) (not (undefined!3559 lt!154092)) (bvslt (x!31419 lt!154092) #b01111111111111111111111111111110) (bvsge (x!31419 lt!154092) #b00000000000000000000000000000000) (bvsge (x!31419 lt!154092) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!315316 (=> (not res!170770) (not e!196270))))

(declare-fun b!315317 () Bool)

(assert (=> b!315317 (= e!196273 (bvsge (x!31419 lt!154092) #b01111111111111111111111111111110))))

(declare-fun d!68743 () Bool)

(assert (=> d!68743 e!196273))

(declare-fun c!49889 () Bool)

(assert (=> d!68743 (= c!49889 (and ((_ is Intermediate!2747) lt!154092) (undefined!3559 lt!154092)))))

(assert (=> d!68743 (= lt!154092 e!196271)))

(declare-fun c!49887 () Bool)

(assert (=> d!68743 (= c!49887 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68743 (= lt!154093 (select (arr!7608 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68743 (validMask!0 mask!3709)))

(assert (=> d!68743 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!154092)))

(declare-fun b!315318 () Bool)

(assert (=> b!315318 (and (bvsge (index!13166 lt!154092) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154092) (size!7961 a!3293)))))

(declare-fun res!170771 () Bool)

(assert (=> b!315318 (= res!170771 (= (select (arr!7608 a!3293) (index!13166 lt!154092)) k0!2441))))

(assert (=> b!315318 (=> res!170771 e!196269)))

(assert (=> b!315318 (= e!196270 e!196269)))

(assert (= (and d!68743 c!49887) b!315313))

(assert (= (and d!68743 (not c!49887)) b!315310))

(assert (= (and b!315310 c!49888) b!315314))

(assert (= (and b!315310 (not c!49888)) b!315315))

(assert (= (and d!68743 c!49889) b!315317))

(assert (= (and d!68743 (not c!49889)) b!315316))

(assert (= (and b!315316 res!170770) b!315318))

(assert (= (and b!315318 (not res!170771)) b!315311))

(assert (= (and b!315311 (not res!170772)) b!315312))

(declare-fun m!324071 () Bool)

(assert (=> b!315312 m!324071))

(assert (=> b!315311 m!324071))

(assert (=> b!315315 m!323889))

(declare-fun m!324075 () Bool)

(assert (=> b!315315 m!324075))

(assert (=> b!315315 m!324075))

(declare-fun m!324079 () Bool)

(assert (=> b!315315 m!324079))

(assert (=> d!68743 m!323889))

(declare-fun m!324083 () Bool)

(assert (=> d!68743 m!324083))

(assert (=> d!68743 m!323899))

(assert (=> b!315318 m!324071))

(assert (=> b!315040 d!68743))

(declare-fun d!68747 () Bool)

(declare-fun lt!154099 () (_ BitVec 32))

(assert (=> d!68747 (and (bvsge lt!154099 #b00000000000000000000000000000000) (bvslt lt!154099 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68747 (= lt!154099 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68747 (validMask!0 mask!3709)))

(assert (=> d!68747 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154099)))

(declare-fun bs!10998 () Bool)

(assert (= bs!10998 d!68747))

(declare-fun m!324087 () Bool)

(assert (=> bs!10998 m!324087))

(assert (=> bs!10998 m!323899))

(assert (=> b!315040 d!68747))

(check-sat (not b!315133) (not d!68719) (not b!315285) (not d!68693) (not b!315315) (not b!315172) (not d!68743) (not b!315306) (not b!315171) (not b!315210) (not d!68747) (not bm!25967) (not d!68739))
(check-sat)
