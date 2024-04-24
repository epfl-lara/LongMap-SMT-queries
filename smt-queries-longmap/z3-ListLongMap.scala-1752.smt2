; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32054 () Bool)

(assert start!32054)

(declare-fun b!319879 () Bool)

(declare-fun res!174241 () Bool)

(declare-fun e!198582 () Bool)

(assert (=> b!319879 (=> (not res!174241) (not e!198582))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319879 (= res!174241 (validKeyInArray!0 k0!2497))))

(declare-fun res!174243 () Bool)

(assert (=> start!32054 (=> (not res!174243) (not e!198582))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32054 (= res!174243 (validMask!0 mask!3777))))

(assert (=> start!32054 e!198582))

(assert (=> start!32054 true))

(declare-datatypes ((array!16341 0))(
  ( (array!16342 (arr!7732 (Array (_ BitVec 32) (_ BitVec 64))) (size!8084 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16341)

(declare-fun array_inv!5682 (array!16341) Bool)

(assert (=> start!32054 (array_inv!5682 a!3305)))

(declare-fun b!319880 () Bool)

(declare-fun res!174244 () Bool)

(assert (=> b!319880 (=> (not res!174244) (not e!198582))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2828 0))(
  ( (MissingZero!2828 (index!13488 (_ BitVec 32))) (Found!2828 (index!13489 (_ BitVec 32))) (Intermediate!2828 (undefined!3640 Bool) (index!13490 (_ BitVec 32)) (x!31867 (_ BitVec 32))) (Undefined!2828) (MissingVacant!2828 (index!13491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16341 (_ BitVec 32)) SeekEntryResult!2828)

(assert (=> b!319880 (= res!174244 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2828 i!1250)))))

(declare-fun b!319881 () Bool)

(declare-fun lt!155916 () (_ BitVec 32))

(assert (=> b!319881 (= e!198582 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!155916 #b00000000000000000000000000000000) (bvsge lt!155916 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319881 (= lt!155916 (toIndex!0 k0!2497 mask!3777))))

(declare-fun b!319882 () Bool)

(declare-fun res!174246 () Bool)

(assert (=> b!319882 (=> (not res!174246) (not e!198582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16341 (_ BitVec 32)) Bool)

(assert (=> b!319882 (= res!174246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319883 () Bool)

(declare-fun res!174242 () Bool)

(assert (=> b!319883 (=> (not res!174242) (not e!198582))))

(declare-fun arrayContainsKey!0 (array!16341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319883 (= res!174242 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319884 () Bool)

(declare-fun res!174245 () Bool)

(assert (=> b!319884 (=> (not res!174245) (not e!198582))))

(assert (=> b!319884 (= res!174245 (and (= (size!8084 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8084 a!3305))))))

(assert (= (and start!32054 res!174243) b!319884))

(assert (= (and b!319884 res!174245) b!319879))

(assert (= (and b!319879 res!174241) b!319883))

(assert (= (and b!319883 res!174242) b!319880))

(assert (= (and b!319880 res!174244) b!319882))

(assert (= (and b!319882 res!174246) b!319881))

(declare-fun m!328585 () Bool)

(assert (=> b!319879 m!328585))

(declare-fun m!328587 () Bool)

(assert (=> b!319883 m!328587))

(declare-fun m!328589 () Bool)

(assert (=> start!32054 m!328589))

(declare-fun m!328591 () Bool)

(assert (=> start!32054 m!328591))

(declare-fun m!328593 () Bool)

(assert (=> b!319882 m!328593))

(declare-fun m!328595 () Bool)

(assert (=> b!319880 m!328595))

(declare-fun m!328597 () Bool)

(assert (=> b!319881 m!328597))

(check-sat (not b!319881) (not start!32054) (not b!319880) (not b!319879) (not b!319883) (not b!319882))
(check-sat)
(get-model)

(declare-fun d!69417 () Bool)

(declare-fun res!174287 () Bool)

(declare-fun e!198599 () Bool)

(assert (=> d!69417 (=> res!174287 e!198599)))

(assert (=> d!69417 (= res!174287 (= (select (arr!7732 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69417 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198599)))

(declare-fun b!319925 () Bool)

(declare-fun e!198600 () Bool)

(assert (=> b!319925 (= e!198599 e!198600)))

(declare-fun res!174288 () Bool)

(assert (=> b!319925 (=> (not res!174288) (not e!198600))))

(assert (=> b!319925 (= res!174288 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8084 a!3305)))))

(declare-fun b!319926 () Bool)

(assert (=> b!319926 (= e!198600 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69417 (not res!174287)) b!319925))

(assert (= (and b!319925 res!174288) b!319926))

(declare-fun m!328627 () Bool)

(assert (=> d!69417 m!328627))

(declare-fun m!328629 () Bool)

(assert (=> b!319926 m!328629))

(assert (=> b!319883 d!69417))

(declare-fun d!69419 () Bool)

(assert (=> d!69419 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319879 d!69419))

(declare-fun d!69421 () Bool)

(declare-fun lt!155928 () (_ BitVec 32))

(declare-fun lt!155927 () (_ BitVec 32))

(assert (=> d!69421 (= lt!155928 (bvmul (bvxor lt!155927 (bvlshr lt!155927 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69421 (= lt!155927 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69421 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174289 (let ((h!5294 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31870 (bvmul (bvxor h!5294 (bvlshr h!5294 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31870 (bvlshr x!31870 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174289 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174289 #b00000000000000000000000000000000))))))

(assert (=> d!69421 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!155928 (bvlshr lt!155928 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!319881 d!69421))

(declare-fun d!69427 () Bool)

(declare-fun lt!155953 () SeekEntryResult!2828)

(get-info :version)

(assert (=> d!69427 (and (or ((_ is Undefined!2828) lt!155953) (not ((_ is Found!2828) lt!155953)) (and (bvsge (index!13489 lt!155953) #b00000000000000000000000000000000) (bvslt (index!13489 lt!155953) (size!8084 a!3305)))) (or ((_ is Undefined!2828) lt!155953) ((_ is Found!2828) lt!155953) (not ((_ is MissingZero!2828) lt!155953)) (and (bvsge (index!13488 lt!155953) #b00000000000000000000000000000000) (bvslt (index!13488 lt!155953) (size!8084 a!3305)))) (or ((_ is Undefined!2828) lt!155953) ((_ is Found!2828) lt!155953) ((_ is MissingZero!2828) lt!155953) (not ((_ is MissingVacant!2828) lt!155953)) (and (bvsge (index!13491 lt!155953) #b00000000000000000000000000000000) (bvslt (index!13491 lt!155953) (size!8084 a!3305)))) (or ((_ is Undefined!2828) lt!155953) (ite ((_ is Found!2828) lt!155953) (= (select (arr!7732 a!3305) (index!13489 lt!155953)) k0!2497) (ite ((_ is MissingZero!2828) lt!155953) (= (select (arr!7732 a!3305) (index!13488 lt!155953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2828) lt!155953) (= (select (arr!7732 a!3305) (index!13491 lt!155953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!198625 () SeekEntryResult!2828)

(assert (=> d!69427 (= lt!155953 e!198625)))

(declare-fun c!50460 () Bool)

(declare-fun lt!155954 () SeekEntryResult!2828)

(assert (=> d!69427 (= c!50460 (and ((_ is Intermediate!2828) lt!155954) (undefined!3640 lt!155954)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16341 (_ BitVec 32)) SeekEntryResult!2828)

(assert (=> d!69427 (= lt!155954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69427 (validMask!0 mask!3777)))

(assert (=> d!69427 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!155953)))

(declare-fun b!319969 () Bool)

(declare-fun c!50461 () Bool)

(declare-fun lt!155955 () (_ BitVec 64))

(assert (=> b!319969 (= c!50461 (= lt!155955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198627 () SeekEntryResult!2828)

(declare-fun e!198626 () SeekEntryResult!2828)

(assert (=> b!319969 (= e!198627 e!198626)))

(declare-fun b!319970 () Bool)

(assert (=> b!319970 (= e!198625 Undefined!2828)))

(declare-fun b!319971 () Bool)

(assert (=> b!319971 (= e!198627 (Found!2828 (index!13490 lt!155954)))))

(declare-fun b!319972 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16341 (_ BitVec 32)) SeekEntryResult!2828)

(assert (=> b!319972 (= e!198626 (seekKeyOrZeroReturnVacant!0 (x!31867 lt!155954) (index!13490 lt!155954) (index!13490 lt!155954) k0!2497 a!3305 mask!3777))))

(declare-fun b!319973 () Bool)

(assert (=> b!319973 (= e!198626 (MissingZero!2828 (index!13490 lt!155954)))))

(declare-fun b!319974 () Bool)

(assert (=> b!319974 (= e!198625 e!198627)))

(assert (=> b!319974 (= lt!155955 (select (arr!7732 a!3305) (index!13490 lt!155954)))))

(declare-fun c!50462 () Bool)

(assert (=> b!319974 (= c!50462 (= lt!155955 k0!2497))))

(assert (= (and d!69427 c!50460) b!319970))

(assert (= (and d!69427 (not c!50460)) b!319974))

(assert (= (and b!319974 c!50462) b!319971))

(assert (= (and b!319974 (not c!50462)) b!319969))

(assert (= (and b!319969 c!50461) b!319973))

(assert (= (and b!319969 (not c!50461)) b!319972))

(declare-fun m!328655 () Bool)

(assert (=> d!69427 m!328655))

(declare-fun m!328657 () Bool)

(assert (=> d!69427 m!328657))

(declare-fun m!328659 () Bool)

(assert (=> d!69427 m!328659))

(assert (=> d!69427 m!328597))

(declare-fun m!328661 () Bool)

(assert (=> d!69427 m!328661))

(assert (=> d!69427 m!328597))

(assert (=> d!69427 m!328589))

(declare-fun m!328663 () Bool)

(assert (=> b!319972 m!328663))

(declare-fun m!328665 () Bool)

(assert (=> b!319974 m!328665))

(assert (=> b!319880 d!69427))

(declare-fun b!319983 () Bool)

(declare-fun e!198634 () Bool)

(declare-fun call!26036 () Bool)

(assert (=> b!319983 (= e!198634 call!26036)))

(declare-fun d!69437 () Bool)

(declare-fun res!174301 () Bool)

(declare-fun e!198636 () Bool)

(assert (=> d!69437 (=> res!174301 e!198636)))

(assert (=> d!69437 (= res!174301 (bvsge #b00000000000000000000000000000000 (size!8084 a!3305)))))

(assert (=> d!69437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198636)))

(declare-fun b!319984 () Bool)

(declare-fun e!198635 () Bool)

(assert (=> b!319984 (= e!198634 e!198635)))

(declare-fun lt!155962 () (_ BitVec 64))

(assert (=> b!319984 (= lt!155962 (select (arr!7732 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9782 0))(
  ( (Unit!9783) )
))
(declare-fun lt!155964 () Unit!9782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16341 (_ BitVec 64) (_ BitVec 32)) Unit!9782)

(assert (=> b!319984 (= lt!155964 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155962 #b00000000000000000000000000000000))))

(assert (=> b!319984 (arrayContainsKey!0 a!3305 lt!155962 #b00000000000000000000000000000000)))

(declare-fun lt!155963 () Unit!9782)

(assert (=> b!319984 (= lt!155963 lt!155964)))

(declare-fun res!174300 () Bool)

(assert (=> b!319984 (= res!174300 (= (seekEntryOrOpen!0 (select (arr!7732 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2828 #b00000000000000000000000000000000)))))

(assert (=> b!319984 (=> (not res!174300) (not e!198635))))

(declare-fun bm!26033 () Bool)

(assert (=> bm!26033 (= call!26036 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!319985 () Bool)

(assert (=> b!319985 (= e!198636 e!198634)))

(declare-fun c!50465 () Bool)

(assert (=> b!319985 (= c!50465 (validKeyInArray!0 (select (arr!7732 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!319986 () Bool)

(assert (=> b!319986 (= e!198635 call!26036)))

(assert (= (and d!69437 (not res!174301)) b!319985))

(assert (= (and b!319985 c!50465) b!319984))

(assert (= (and b!319985 (not c!50465)) b!319983))

(assert (= (and b!319984 res!174300) b!319986))

(assert (= (or b!319986 b!319983) bm!26033))

(assert (=> b!319984 m!328627))

(declare-fun m!328667 () Bool)

(assert (=> b!319984 m!328667))

(declare-fun m!328669 () Bool)

(assert (=> b!319984 m!328669))

(assert (=> b!319984 m!328627))

(declare-fun m!328671 () Bool)

(assert (=> b!319984 m!328671))

(declare-fun m!328673 () Bool)

(assert (=> bm!26033 m!328673))

(assert (=> b!319985 m!328627))

(assert (=> b!319985 m!328627))

(declare-fun m!328675 () Bool)

(assert (=> b!319985 m!328675))

(assert (=> b!319882 d!69437))

(declare-fun d!69443 () Bool)

(assert (=> d!69443 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32054 d!69443))

(declare-fun d!69449 () Bool)

(assert (=> d!69449 (= (array_inv!5682 a!3305) (bvsge (size!8084 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32054 d!69449))

(check-sat (not d!69427) (not b!319984) (not b!319926) (not b!319972) (not b!319985) (not bm!26033))
(check-sat)
