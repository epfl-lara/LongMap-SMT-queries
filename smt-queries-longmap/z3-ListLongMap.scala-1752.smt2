; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32054 () Bool)

(assert start!32054)

(declare-fun b!319657 () Bool)

(declare-fun res!174116 () Bool)

(declare-fun e!198440 () Bool)

(assert (=> b!319657 (=> (not res!174116) (not e!198440))))

(declare-datatypes ((array!16332 0))(
  ( (array!16333 (arr!7728 (Array (_ BitVec 32) (_ BitVec 64))) (size!8081 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16332)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319657 (= res!174116 (and (= (size!8081 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8081 a!3305))))))

(declare-fun b!319658 () Bool)

(declare-fun res!174115 () Bool)

(assert (=> b!319658 (=> (not res!174115) (not e!198440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16332 (_ BitVec 32)) Bool)

(assert (=> b!319658 (= res!174115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319659 () Bool)

(declare-fun res!174119 () Bool)

(assert (=> b!319659 (=> (not res!174119) (not e!198440))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2858 0))(
  ( (MissingZero!2858 (index!13608 (_ BitVec 32))) (Found!2858 (index!13609 (_ BitVec 32))) (Intermediate!2858 (undefined!3670 Bool) (index!13610 (_ BitVec 32)) (x!31895 (_ BitVec 32))) (Undefined!2858) (MissingVacant!2858 (index!13611 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16332 (_ BitVec 32)) SeekEntryResult!2858)

(assert (=> b!319659 (= res!174119 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2858 i!1250)))))

(declare-fun b!319660 () Bool)

(declare-fun res!174118 () Bool)

(assert (=> b!319660 (=> (not res!174118) (not e!198440))))

(declare-fun arrayContainsKey!0 (array!16332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319660 (= res!174118 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319661 () Bool)

(declare-fun lt!155663 () (_ BitVec 32))

(assert (=> b!319661 (= e!198440 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!155663 #b00000000000000000000000000000000) (bvsge lt!155663 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319661 (= lt!155663 (toIndex!0 k0!2497 mask!3777))))

(declare-fun b!319662 () Bool)

(declare-fun res!174120 () Bool)

(assert (=> b!319662 (=> (not res!174120) (not e!198440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319662 (= res!174120 (validKeyInArray!0 k0!2497))))

(declare-fun res!174117 () Bool)

(assert (=> start!32054 (=> (not res!174117) (not e!198440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32054 (= res!174117 (validMask!0 mask!3777))))

(assert (=> start!32054 e!198440))

(assert (=> start!32054 true))

(declare-fun array_inv!5700 (array!16332) Bool)

(assert (=> start!32054 (array_inv!5700 a!3305)))

(assert (= (and start!32054 res!174117) b!319657))

(assert (= (and b!319657 res!174116) b!319662))

(assert (= (and b!319662 res!174120) b!319660))

(assert (= (and b!319660 res!174118) b!319659))

(assert (= (and b!319659 res!174119) b!319658))

(assert (= (and b!319658 res!174115) b!319661))

(declare-fun m!327679 () Bool)

(assert (=> b!319658 m!327679))

(declare-fun m!327681 () Bool)

(assert (=> b!319662 m!327681))

(declare-fun m!327683 () Bool)

(assert (=> b!319659 m!327683))

(declare-fun m!327685 () Bool)

(assert (=> b!319661 m!327685))

(declare-fun m!327687 () Bool)

(assert (=> b!319660 m!327687))

(declare-fun m!327689 () Bool)

(assert (=> start!32054 m!327689))

(declare-fun m!327691 () Bool)

(assert (=> start!32054 m!327691))

(check-sat (not b!319661) (not b!319660) (not b!319659) (not b!319662) (not b!319658) (not start!32054))
(check-sat)
(get-model)

(declare-fun d!69183 () Bool)

(declare-fun lt!155675 () (_ BitVec 32))

(declare-fun lt!155674 () (_ BitVec 32))

(assert (=> d!69183 (= lt!155675 (bvmul (bvxor lt!155674 (bvlshr lt!155674 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69183 (= lt!155674 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69183 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174157 (let ((h!5350 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31898 (bvmul (bvxor h!5350 (bvlshr h!5350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31898 (bvlshr x!31898 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174157 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174157 #b00000000000000000000000000000000))))))

(assert (=> d!69183 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!155675 (bvlshr lt!155675 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!319661 d!69183))

(declare-fun d!69185 () Bool)

(assert (=> d!69185 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319662 d!69185))

(declare-fun b!319711 () Bool)

(declare-fun e!198461 () SeekEntryResult!2858)

(assert (=> b!319711 (= e!198461 Undefined!2858)))

(declare-fun e!198460 () SeekEntryResult!2858)

(declare-fun b!319712 () Bool)

(declare-fun lt!155688 () SeekEntryResult!2858)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16332 (_ BitVec 32)) SeekEntryResult!2858)

(assert (=> b!319712 (= e!198460 (seekKeyOrZeroReturnVacant!0 (x!31895 lt!155688) (index!13610 lt!155688) (index!13610 lt!155688) k0!2497 a!3305 mask!3777))))

(declare-fun d!69189 () Bool)

(declare-fun lt!155689 () SeekEntryResult!2858)

(get-info :version)

(assert (=> d!69189 (and (or ((_ is Undefined!2858) lt!155689) (not ((_ is Found!2858) lt!155689)) (and (bvsge (index!13609 lt!155689) #b00000000000000000000000000000000) (bvslt (index!13609 lt!155689) (size!8081 a!3305)))) (or ((_ is Undefined!2858) lt!155689) ((_ is Found!2858) lt!155689) (not ((_ is MissingZero!2858) lt!155689)) (and (bvsge (index!13608 lt!155689) #b00000000000000000000000000000000) (bvslt (index!13608 lt!155689) (size!8081 a!3305)))) (or ((_ is Undefined!2858) lt!155689) ((_ is Found!2858) lt!155689) ((_ is MissingZero!2858) lt!155689) (not ((_ is MissingVacant!2858) lt!155689)) (and (bvsge (index!13611 lt!155689) #b00000000000000000000000000000000) (bvslt (index!13611 lt!155689) (size!8081 a!3305)))) (or ((_ is Undefined!2858) lt!155689) (ite ((_ is Found!2858) lt!155689) (= (select (arr!7728 a!3305) (index!13609 lt!155689)) k0!2497) (ite ((_ is MissingZero!2858) lt!155689) (= (select (arr!7728 a!3305) (index!13608 lt!155689)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2858) lt!155689) (= (select (arr!7728 a!3305) (index!13611 lt!155689)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69189 (= lt!155689 e!198461)))

(declare-fun c!50402 () Bool)

(assert (=> d!69189 (= c!50402 (and ((_ is Intermediate!2858) lt!155688) (undefined!3670 lt!155688)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16332 (_ BitVec 32)) SeekEntryResult!2858)

(assert (=> d!69189 (= lt!155688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69189 (validMask!0 mask!3777)))

(assert (=> d!69189 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!155689)))

(declare-fun b!319713 () Bool)

(assert (=> b!319713 (= e!198460 (MissingZero!2858 (index!13610 lt!155688)))))

(declare-fun b!319714 () Bool)

(declare-fun e!198459 () SeekEntryResult!2858)

(assert (=> b!319714 (= e!198459 (Found!2858 (index!13610 lt!155688)))))

(declare-fun b!319715 () Bool)

(declare-fun c!50401 () Bool)

(declare-fun lt!155690 () (_ BitVec 64))

(assert (=> b!319715 (= c!50401 (= lt!155690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!319715 (= e!198459 e!198460)))

(declare-fun b!319716 () Bool)

(assert (=> b!319716 (= e!198461 e!198459)))

(assert (=> b!319716 (= lt!155690 (select (arr!7728 a!3305) (index!13610 lt!155688)))))

(declare-fun c!50400 () Bool)

(assert (=> b!319716 (= c!50400 (= lt!155690 k0!2497))))

(assert (= (and d!69189 c!50402) b!319711))

(assert (= (and d!69189 (not c!50402)) b!319716))

(assert (= (and b!319716 c!50400) b!319714))

(assert (= (and b!319716 (not c!50400)) b!319715))

(assert (= (and b!319715 c!50401) b!319713))

(assert (= (and b!319715 (not c!50401)) b!319712))

(declare-fun m!327721 () Bool)

(assert (=> b!319712 m!327721))

(assert (=> d!69189 m!327685))

(declare-fun m!327723 () Bool)

(assert (=> d!69189 m!327723))

(assert (=> d!69189 m!327689))

(declare-fun m!327725 () Bool)

(assert (=> d!69189 m!327725))

(assert (=> d!69189 m!327685))

(declare-fun m!327727 () Bool)

(assert (=> d!69189 m!327727))

(declare-fun m!327729 () Bool)

(assert (=> d!69189 m!327729))

(declare-fun m!327731 () Bool)

(assert (=> b!319716 m!327731))

(assert (=> b!319659 d!69189))

(declare-fun d!69203 () Bool)

(assert (=> d!69203 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32054 d!69203))

(declare-fun d!69205 () Bool)

(assert (=> d!69205 (= (array_inv!5700 a!3305) (bvsge (size!8081 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32054 d!69205))

(declare-fun b!319769 () Bool)

(declare-fun e!198494 () Bool)

(declare-fun e!198492 () Bool)

(assert (=> b!319769 (= e!198494 e!198492)))

(declare-fun lt!155723 () (_ BitVec 64))

(assert (=> b!319769 (= lt!155723 (select (arr!7728 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9782 0))(
  ( (Unit!9783) )
))
(declare-fun lt!155722 () Unit!9782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16332 (_ BitVec 64) (_ BitVec 32)) Unit!9782)

(assert (=> b!319769 (= lt!155722 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155723 #b00000000000000000000000000000000))))

(assert (=> b!319769 (arrayContainsKey!0 a!3305 lt!155723 #b00000000000000000000000000000000)))

(declare-fun lt!155721 () Unit!9782)

(assert (=> b!319769 (= lt!155721 lt!155722)))

(declare-fun res!174168 () Bool)

(assert (=> b!319769 (= res!174168 (= (seekEntryOrOpen!0 (select (arr!7728 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2858 #b00000000000000000000000000000000)))))

(assert (=> b!319769 (=> (not res!174168) (not e!198492))))

(declare-fun b!319770 () Bool)

(declare-fun call!26023 () Bool)

(assert (=> b!319770 (= e!198494 call!26023)))

(declare-fun b!319771 () Bool)

(assert (=> b!319771 (= e!198492 call!26023)))

(declare-fun bm!26020 () Bool)

(assert (=> bm!26020 (= call!26023 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!319772 () Bool)

(declare-fun e!198493 () Bool)

(assert (=> b!319772 (= e!198493 e!198494)))

(declare-fun c!50425 () Bool)

(assert (=> b!319772 (= c!50425 (validKeyInArray!0 (select (arr!7728 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69207 () Bool)

(declare-fun res!174167 () Bool)

(assert (=> d!69207 (=> res!174167 e!198493)))

(assert (=> d!69207 (= res!174167 (bvsge #b00000000000000000000000000000000 (size!8081 a!3305)))))

(assert (=> d!69207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198493)))

(assert (= (and d!69207 (not res!174167)) b!319772))

(assert (= (and b!319772 c!50425) b!319769))

(assert (= (and b!319772 (not c!50425)) b!319770))

(assert (= (and b!319769 res!174168) b!319771))

(assert (= (or b!319771 b!319770) bm!26020))

(declare-fun m!327757 () Bool)

(assert (=> b!319769 m!327757))

(declare-fun m!327759 () Bool)

(assert (=> b!319769 m!327759))

(declare-fun m!327761 () Bool)

(assert (=> b!319769 m!327761))

(assert (=> b!319769 m!327757))

(declare-fun m!327763 () Bool)

(assert (=> b!319769 m!327763))

(declare-fun m!327765 () Bool)

(assert (=> bm!26020 m!327765))

(assert (=> b!319772 m!327757))

(assert (=> b!319772 m!327757))

(declare-fun m!327767 () Bool)

(assert (=> b!319772 m!327767))

(assert (=> b!319658 d!69207))

(declare-fun d!69215 () Bool)

(declare-fun res!174180 () Bool)

(declare-fun e!198508 () Bool)

(assert (=> d!69215 (=> res!174180 e!198508)))

(assert (=> d!69215 (= res!174180 (= (select (arr!7728 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69215 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198508)))

(declare-fun b!319789 () Bool)

(declare-fun e!198509 () Bool)

(assert (=> b!319789 (= e!198508 e!198509)))

(declare-fun res!174181 () Bool)

(assert (=> b!319789 (=> (not res!174181) (not e!198509))))

(assert (=> b!319789 (= res!174181 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8081 a!3305)))))

(declare-fun b!319790 () Bool)

(assert (=> b!319790 (= e!198509 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69215 (not res!174180)) b!319789))

(assert (= (and b!319789 res!174181) b!319790))

(assert (=> d!69215 m!327757))

(declare-fun m!327781 () Bool)

(assert (=> b!319790 m!327781))

(assert (=> b!319660 d!69215))

(check-sat (not b!319769) (not b!319712) (not bm!26020) (not d!69189) (not b!319772) (not b!319790))
(check-sat)
