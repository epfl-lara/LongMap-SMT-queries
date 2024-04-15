; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32936 () Bool)

(assert start!32936)

(declare-fun b!328123 () Bool)

(declare-fun e!201711 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328123 (= e!201711 (bvslt (bvsub #b01111111111111111111111111111110 x!1490) #b00000000000000000000000000000000))))

(declare-fun res!180744 () Bool)

(declare-fun e!201712 () Bool)

(assert (=> start!32936 (=> (not res!180744) (not e!201712))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32936 (= res!180744 (validMask!0 mask!3777))))

(assert (=> start!32936 e!201712))

(declare-datatypes ((array!16791 0))(
  ( (array!16792 (arr!7944 (Array (_ BitVec 32) (_ BitVec 64))) (size!8297 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16791)

(declare-fun array_inv!5916 (array!16791) Bool)

(assert (=> start!32936 (array_inv!5916 a!3305)))

(assert (=> start!32936 true))

(declare-fun b!328124 () Bool)

(declare-fun res!180736 () Bool)

(assert (=> b!328124 (=> (not res!180736) (not e!201712))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328124 (= res!180736 (and (= (size!8297 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8297 a!3305))))))

(declare-fun b!328125 () Bool)

(declare-fun res!180739 () Bool)

(assert (=> b!328125 (=> (not res!180739) (not e!201712))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328125 (= res!180739 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328126 () Bool)

(declare-fun res!180741 () Bool)

(assert (=> b!328126 (=> (not res!180741) (not e!201712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16791 (_ BitVec 32)) Bool)

(assert (=> b!328126 (= res!180741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328127 () Bool)

(declare-fun res!180740 () Bool)

(assert (=> b!328127 (=> (not res!180740) (not e!201712))))

(declare-datatypes ((SeekEntryResult!3074 0))(
  ( (MissingZero!3074 (index!14472 (_ BitVec 32))) (Found!3074 (index!14473 (_ BitVec 32))) (Intermediate!3074 (undefined!3886 Bool) (index!14474 (_ BitVec 32)) (x!32750 (_ BitVec 32))) (Undefined!3074) (MissingVacant!3074 (index!14475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16791 (_ BitVec 32)) SeekEntryResult!3074)

(assert (=> b!328127 (= res!180740 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3074 i!1250)))))

(declare-fun b!328128 () Bool)

(declare-fun res!180738 () Bool)

(assert (=> b!328128 (=> (not res!180738) (not e!201711))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!157673 () SeekEntryResult!3074)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16791 (_ BitVec 32)) SeekEntryResult!3074)

(assert (=> b!328128 (= res!180738 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157673))))

(declare-fun b!328129 () Bool)

(assert (=> b!328129 (= e!201712 e!201711)))

(declare-fun res!180737 () Bool)

(assert (=> b!328129 (=> (not res!180737) (not e!201711))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328129 (= res!180737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157673))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!328129 (= lt!157673 (Intermediate!3074 false resIndex!58 resX!58))))

(declare-fun b!328130 () Bool)

(declare-fun res!180743 () Bool)

(assert (=> b!328130 (=> (not res!180743) (not e!201711))))

(assert (=> b!328130 (= res!180743 (and (= (select (arr!7944 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8297 a!3305))))))

(declare-fun b!328131 () Bool)

(declare-fun res!180742 () Bool)

(assert (=> b!328131 (=> (not res!180742) (not e!201712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328131 (= res!180742 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32936 res!180744) b!328124))

(assert (= (and b!328124 res!180736) b!328131))

(assert (= (and b!328131 res!180742) b!328125))

(assert (= (and b!328125 res!180739) b!328127))

(assert (= (and b!328127 res!180740) b!328126))

(assert (= (and b!328126 res!180741) b!328129))

(assert (= (and b!328129 res!180737) b!328130))

(assert (= (and b!328130 res!180743) b!328128))

(assert (= (and b!328128 res!180738) b!328123))

(declare-fun m!333655 () Bool)

(assert (=> b!328127 m!333655))

(declare-fun m!333657 () Bool)

(assert (=> b!328130 m!333657))

(declare-fun m!333659 () Bool)

(assert (=> b!328126 m!333659))

(declare-fun m!333661 () Bool)

(assert (=> start!32936 m!333661))

(declare-fun m!333663 () Bool)

(assert (=> start!32936 m!333663))

(declare-fun m!333665 () Bool)

(assert (=> b!328131 m!333665))

(declare-fun m!333667 () Bool)

(assert (=> b!328125 m!333667))

(declare-fun m!333669 () Bool)

(assert (=> b!328129 m!333669))

(assert (=> b!328129 m!333669))

(declare-fun m!333671 () Bool)

(assert (=> b!328129 m!333671))

(declare-fun m!333673 () Bool)

(assert (=> b!328128 m!333673))

(check-sat (not b!328126) (not b!328131) (not b!328125) (not start!32936) (not b!328128) (not b!328127) (not b!328129))
(check-sat)
(get-model)

(declare-fun b!328198 () Bool)

(declare-fun e!201740 () SeekEntryResult!3074)

(declare-fun e!201738 () SeekEntryResult!3074)

(assert (=> b!328198 (= e!201740 e!201738)))

(declare-fun lt!157686 () (_ BitVec 64))

(declare-fun lt!157687 () SeekEntryResult!3074)

(assert (=> b!328198 (= lt!157686 (select (arr!7944 a!3305) (index!14474 lt!157687)))))

(declare-fun c!51338 () Bool)

(assert (=> b!328198 (= c!51338 (= lt!157686 k0!2497))))

(declare-fun b!328199 () Bool)

(declare-fun e!201739 () SeekEntryResult!3074)

(assert (=> b!328199 (= e!201739 (MissingZero!3074 (index!14474 lt!157687)))))

(declare-fun b!328200 () Bool)

(declare-fun c!51336 () Bool)

(assert (=> b!328200 (= c!51336 (= lt!157686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328200 (= e!201738 e!201739)))

(declare-fun b!328201 () Bool)

(assert (=> b!328201 (= e!201738 (Found!3074 (index!14474 lt!157687)))))

(declare-fun d!69825 () Bool)

(declare-fun lt!157688 () SeekEntryResult!3074)

(get-info :version)

(assert (=> d!69825 (and (or ((_ is Undefined!3074) lt!157688) (not ((_ is Found!3074) lt!157688)) (and (bvsge (index!14473 lt!157688) #b00000000000000000000000000000000) (bvslt (index!14473 lt!157688) (size!8297 a!3305)))) (or ((_ is Undefined!3074) lt!157688) ((_ is Found!3074) lt!157688) (not ((_ is MissingZero!3074) lt!157688)) (and (bvsge (index!14472 lt!157688) #b00000000000000000000000000000000) (bvslt (index!14472 lt!157688) (size!8297 a!3305)))) (or ((_ is Undefined!3074) lt!157688) ((_ is Found!3074) lt!157688) ((_ is MissingZero!3074) lt!157688) (not ((_ is MissingVacant!3074) lt!157688)) (and (bvsge (index!14475 lt!157688) #b00000000000000000000000000000000) (bvslt (index!14475 lt!157688) (size!8297 a!3305)))) (or ((_ is Undefined!3074) lt!157688) (ite ((_ is Found!3074) lt!157688) (= (select (arr!7944 a!3305) (index!14473 lt!157688)) k0!2497) (ite ((_ is MissingZero!3074) lt!157688) (= (select (arr!7944 a!3305) (index!14472 lt!157688)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3074) lt!157688) (= (select (arr!7944 a!3305) (index!14475 lt!157688)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69825 (= lt!157688 e!201740)))

(declare-fun c!51337 () Bool)

(assert (=> d!69825 (= c!51337 (and ((_ is Intermediate!3074) lt!157687) (undefined!3886 lt!157687)))))

(assert (=> d!69825 (= lt!157687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69825 (validMask!0 mask!3777)))

(assert (=> d!69825 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157688)))

(declare-fun b!328202 () Bool)

(assert (=> b!328202 (= e!201740 Undefined!3074)))

(declare-fun b!328203 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16791 (_ BitVec 32)) SeekEntryResult!3074)

(assert (=> b!328203 (= e!201739 (seekKeyOrZeroReturnVacant!0 (x!32750 lt!157687) (index!14474 lt!157687) (index!14474 lt!157687) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69825 c!51337) b!328202))

(assert (= (and d!69825 (not c!51337)) b!328198))

(assert (= (and b!328198 c!51338) b!328201))

(assert (= (and b!328198 (not c!51338)) b!328200))

(assert (= (and b!328200 c!51336) b!328199))

(assert (= (and b!328200 (not c!51336)) b!328203))

(declare-fun m!333715 () Bool)

(assert (=> b!328198 m!333715))

(declare-fun m!333717 () Bool)

(assert (=> d!69825 m!333717))

(assert (=> d!69825 m!333669))

(assert (=> d!69825 m!333661))

(declare-fun m!333719 () Bool)

(assert (=> d!69825 m!333719))

(declare-fun m!333721 () Bool)

(assert (=> d!69825 m!333721))

(assert (=> d!69825 m!333669))

(assert (=> d!69825 m!333671))

(declare-fun m!333723 () Bool)

(assert (=> b!328203 m!333723))

(assert (=> b!328127 d!69825))

(declare-fun d!69835 () Bool)

(assert (=> d!69835 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32936 d!69835))

(declare-fun d!69837 () Bool)

(assert (=> d!69837 (= (array_inv!5916 a!3305) (bvsge (size!8297 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32936 d!69837))

(declare-fun b!328294 () Bool)

(declare-fun e!201795 () SeekEntryResult!3074)

(assert (=> b!328294 (= e!201795 (Intermediate!3074 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328295 () Bool)

(declare-fun lt!157720 () SeekEntryResult!3074)

(assert (=> b!328295 (and (bvsge (index!14474 lt!157720) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157720) (size!8297 a!3305)))))

(declare-fun e!201791 () Bool)

(assert (=> b!328295 (= e!201791 (= (select (arr!7944 a!3305) (index!14474 lt!157720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328296 () Bool)

(declare-fun e!201794 () SeekEntryResult!3074)

(assert (=> b!328296 (= e!201795 e!201794)))

(declare-fun c!51369 () Bool)

(declare-fun lt!157719 () (_ BitVec 64))

(assert (=> b!328296 (= c!51369 (or (= lt!157719 k0!2497) (= (bvadd lt!157719 lt!157719) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69841 () Bool)

(declare-fun e!201793 () Bool)

(assert (=> d!69841 e!201793))

(declare-fun c!51371 () Bool)

(assert (=> d!69841 (= c!51371 (and ((_ is Intermediate!3074) lt!157720) (undefined!3886 lt!157720)))))

(assert (=> d!69841 (= lt!157720 e!201795)))

(declare-fun c!51370 () Bool)

(assert (=> d!69841 (= c!51370 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69841 (= lt!157719 (select (arr!7944 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69841 (validMask!0 mask!3777)))

(assert (=> d!69841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157720)))

(declare-fun b!328297 () Bool)

(assert (=> b!328297 (and (bvsge (index!14474 lt!157720) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157720) (size!8297 a!3305)))))

(declare-fun res!180832 () Bool)

(assert (=> b!328297 (= res!180832 (= (select (arr!7944 a!3305) (index!14474 lt!157720)) k0!2497))))

(assert (=> b!328297 (=> res!180832 e!201791)))

(declare-fun e!201792 () Bool)

(assert (=> b!328297 (= e!201792 e!201791)))

(declare-fun b!328298 () Bool)

(assert (=> b!328298 (and (bvsge (index!14474 lt!157720) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157720) (size!8297 a!3305)))))

(declare-fun res!180833 () Bool)

(assert (=> b!328298 (= res!180833 (= (select (arr!7944 a!3305) (index!14474 lt!157720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328298 (=> res!180833 e!201791)))

(declare-fun b!328299 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328299 (= e!201794 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328300 () Bool)

(assert (=> b!328300 (= e!201793 e!201792)))

(declare-fun res!180831 () Bool)

(assert (=> b!328300 (= res!180831 (and ((_ is Intermediate!3074) lt!157720) (not (undefined!3886 lt!157720)) (bvslt (x!32750 lt!157720) #b01111111111111111111111111111110) (bvsge (x!32750 lt!157720) #b00000000000000000000000000000000) (bvsge (x!32750 lt!157720) #b00000000000000000000000000000000)))))

(assert (=> b!328300 (=> (not res!180831) (not e!201792))))

(declare-fun b!328301 () Bool)

(assert (=> b!328301 (= e!201793 (bvsge (x!32750 lt!157720) #b01111111111111111111111111111110))))

(declare-fun b!328302 () Bool)

(assert (=> b!328302 (= e!201794 (Intermediate!3074 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!69841 c!51370) b!328294))

(assert (= (and d!69841 (not c!51370)) b!328296))

(assert (= (and b!328296 c!51369) b!328302))

(assert (= (and b!328296 (not c!51369)) b!328299))

(assert (= (and d!69841 c!51371) b!328301))

(assert (= (and d!69841 (not c!51371)) b!328300))

(assert (= (and b!328300 res!180831) b!328297))

(assert (= (and b!328297 (not res!180832)) b!328298))

(assert (= (and b!328298 (not res!180833)) b!328295))

(declare-fun m!333757 () Bool)

(assert (=> b!328297 m!333757))

(assert (=> b!328295 m!333757))

(assert (=> d!69841 m!333669))

(declare-fun m!333759 () Bool)

(assert (=> d!69841 m!333759))

(assert (=> d!69841 m!333661))

(assert (=> b!328298 m!333757))

(assert (=> b!328299 m!333669))

(declare-fun m!333761 () Bool)

(assert (=> b!328299 m!333761))

(assert (=> b!328299 m!333761))

(declare-fun m!333763 () Bool)

(assert (=> b!328299 m!333763))

(assert (=> b!328129 d!69841))

(declare-fun d!69857 () Bool)

(declare-fun lt!157737 () (_ BitVec 32))

(declare-fun lt!157736 () (_ BitVec 32))

(assert (=> d!69857 (= lt!157737 (bvmul (bvxor lt!157736 (bvlshr lt!157736 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69857 (= lt!157736 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69857 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180834 (let ((h!5379 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32758 (bvmul (bvxor h!5379 (bvlshr h!5379 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32758 (bvlshr x!32758 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180834 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180834 #b00000000000000000000000000000000))))))

(assert (=> d!69857 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157737 (bvlshr lt!157737 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328129 d!69857))

(declare-fun b!328327 () Bool)

(declare-fun e!201815 () SeekEntryResult!3074)

(assert (=> b!328327 (= e!201815 (Intermediate!3074 true index!1840 x!1490))))

(declare-fun b!328328 () Bool)

(declare-fun lt!157739 () SeekEntryResult!3074)

(assert (=> b!328328 (and (bvsge (index!14474 lt!157739) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157739) (size!8297 a!3305)))))

(declare-fun e!201811 () Bool)

(assert (=> b!328328 (= e!201811 (= (select (arr!7944 a!3305) (index!14474 lt!157739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328329 () Bool)

(declare-fun e!201814 () SeekEntryResult!3074)

(assert (=> b!328329 (= e!201815 e!201814)))

(declare-fun c!51381 () Bool)

(declare-fun lt!157738 () (_ BitVec 64))

(assert (=> b!328329 (= c!51381 (or (= lt!157738 k0!2497) (= (bvadd lt!157738 lt!157738) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69861 () Bool)

(declare-fun e!201813 () Bool)

(assert (=> d!69861 e!201813))

(declare-fun c!51383 () Bool)

(assert (=> d!69861 (= c!51383 (and ((_ is Intermediate!3074) lt!157739) (undefined!3886 lt!157739)))))

(assert (=> d!69861 (= lt!157739 e!201815)))

(declare-fun c!51382 () Bool)

(assert (=> d!69861 (= c!51382 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69861 (= lt!157738 (select (arr!7944 a!3305) index!1840))))

(assert (=> d!69861 (validMask!0 mask!3777)))

(assert (=> d!69861 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157739)))

(declare-fun b!328330 () Bool)

(assert (=> b!328330 (and (bvsge (index!14474 lt!157739) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157739) (size!8297 a!3305)))))

(declare-fun res!180842 () Bool)

(assert (=> b!328330 (= res!180842 (= (select (arr!7944 a!3305) (index!14474 lt!157739)) k0!2497))))

(assert (=> b!328330 (=> res!180842 e!201811)))

(declare-fun e!201812 () Bool)

(assert (=> b!328330 (= e!201812 e!201811)))

(declare-fun b!328331 () Bool)

(assert (=> b!328331 (and (bvsge (index!14474 lt!157739) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157739) (size!8297 a!3305)))))

(declare-fun res!180843 () Bool)

(assert (=> b!328331 (= res!180843 (= (select (arr!7944 a!3305) (index!14474 lt!157739)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328331 (=> res!180843 e!201811)))

(declare-fun b!328332 () Bool)

(assert (=> b!328332 (= e!201814 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328333 () Bool)

(assert (=> b!328333 (= e!201813 e!201812)))

(declare-fun res!180841 () Bool)

(assert (=> b!328333 (= res!180841 (and ((_ is Intermediate!3074) lt!157739) (not (undefined!3886 lt!157739)) (bvslt (x!32750 lt!157739) #b01111111111111111111111111111110) (bvsge (x!32750 lt!157739) #b00000000000000000000000000000000) (bvsge (x!32750 lt!157739) x!1490)))))

(assert (=> b!328333 (=> (not res!180841) (not e!201812))))

(declare-fun b!328334 () Bool)

(assert (=> b!328334 (= e!201813 (bvsge (x!32750 lt!157739) #b01111111111111111111111111111110))))

(declare-fun b!328335 () Bool)

(assert (=> b!328335 (= e!201814 (Intermediate!3074 false index!1840 x!1490))))

(assert (= (and d!69861 c!51382) b!328327))

(assert (= (and d!69861 (not c!51382)) b!328329))

(assert (= (and b!328329 c!51381) b!328335))

(assert (= (and b!328329 (not c!51381)) b!328332))

(assert (= (and d!69861 c!51383) b!328334))

(assert (= (and d!69861 (not c!51383)) b!328333))

(assert (= (and b!328333 res!180841) b!328330))

(assert (= (and b!328330 (not res!180842)) b!328331))

(assert (= (and b!328331 (not res!180843)) b!328328))

(declare-fun m!333779 () Bool)

(assert (=> b!328330 m!333779))

(assert (=> b!328328 m!333779))

(declare-fun m!333781 () Bool)

(assert (=> d!69861 m!333781))

(assert (=> d!69861 m!333661))

(assert (=> b!328331 m!333779))

(declare-fun m!333783 () Bool)

(assert (=> b!328332 m!333783))

(assert (=> b!328332 m!333783))

(declare-fun m!333785 () Bool)

(assert (=> b!328332 m!333785))

(assert (=> b!328128 d!69861))

(declare-fun d!69865 () Bool)

(declare-fun res!180852 () Bool)

(declare-fun e!201826 () Bool)

(assert (=> d!69865 (=> res!180852 e!201826)))

(assert (=> d!69865 (= res!180852 (= (select (arr!7944 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69865 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201826)))

(declare-fun b!328348 () Bool)

(declare-fun e!201827 () Bool)

(assert (=> b!328348 (= e!201826 e!201827)))

(declare-fun res!180853 () Bool)

(assert (=> b!328348 (=> (not res!180853) (not e!201827))))

(assert (=> b!328348 (= res!180853 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8297 a!3305)))))

(declare-fun b!328349 () Bool)

(assert (=> b!328349 (= e!201827 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69865 (not res!180852)) b!328348))

(assert (= (and b!328348 res!180853) b!328349))

(declare-fun m!333787 () Bool)

(assert (=> d!69865 m!333787))

(declare-fun m!333789 () Bool)

(assert (=> b!328349 m!333789))

(assert (=> b!328125 d!69865))

(declare-fun d!69867 () Bool)

(declare-fun res!180870 () Bool)

(declare-fun e!201850 () Bool)

(assert (=> d!69867 (=> res!180870 e!201850)))

(assert (=> d!69867 (= res!180870 (bvsge #b00000000000000000000000000000000 (size!8297 a!3305)))))

(assert (=> d!69867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201850)))

(declare-fun bm!26105 () Bool)

(declare-fun call!26108 () Bool)

(assert (=> bm!26105 (= call!26108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328378 () Bool)

(declare-fun e!201852 () Bool)

(assert (=> b!328378 (= e!201850 e!201852)))

(declare-fun c!51392 () Bool)

(assert (=> b!328378 (= c!51392 (validKeyInArray!0 (select (arr!7944 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!328379 () Bool)

(declare-fun e!201851 () Bool)

(assert (=> b!328379 (= e!201852 e!201851)))

(declare-fun lt!157765 () (_ BitVec 64))

(assert (=> b!328379 (= lt!157765 (select (arr!7944 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10160 0))(
  ( (Unit!10161) )
))
(declare-fun lt!157764 () Unit!10160)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16791 (_ BitVec 64) (_ BitVec 32)) Unit!10160)

(assert (=> b!328379 (= lt!157764 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157765 #b00000000000000000000000000000000))))

(assert (=> b!328379 (arrayContainsKey!0 a!3305 lt!157765 #b00000000000000000000000000000000)))

(declare-fun lt!157766 () Unit!10160)

(assert (=> b!328379 (= lt!157766 lt!157764)))

(declare-fun res!180871 () Bool)

(assert (=> b!328379 (= res!180871 (= (seekEntryOrOpen!0 (select (arr!7944 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3074 #b00000000000000000000000000000000)))))

(assert (=> b!328379 (=> (not res!180871) (not e!201851))))

(declare-fun b!328380 () Bool)

(assert (=> b!328380 (= e!201851 call!26108)))

(declare-fun b!328381 () Bool)

(assert (=> b!328381 (= e!201852 call!26108)))

(assert (= (and d!69867 (not res!180870)) b!328378))

(assert (= (and b!328378 c!51392) b!328379))

(assert (= (and b!328378 (not c!51392)) b!328381))

(assert (= (and b!328379 res!180871) b!328380))

(assert (= (or b!328380 b!328381) bm!26105))

(declare-fun m!333815 () Bool)

(assert (=> bm!26105 m!333815))

(assert (=> b!328378 m!333787))

(assert (=> b!328378 m!333787))

(declare-fun m!333817 () Bool)

(assert (=> b!328378 m!333817))

(assert (=> b!328379 m!333787))

(declare-fun m!333819 () Bool)

(assert (=> b!328379 m!333819))

(declare-fun m!333821 () Bool)

(assert (=> b!328379 m!333821))

(assert (=> b!328379 m!333787))

(declare-fun m!333823 () Bool)

(assert (=> b!328379 m!333823))

(assert (=> b!328126 d!69867))

(declare-fun d!69875 () Bool)

(assert (=> d!69875 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328131 d!69875))

(check-sat (not d!69825) (not d!69841) (not d!69861) (not b!328379) (not b!328203) (not b!328378) (not b!328299) (not b!328349) (not bm!26105) (not b!328332))
(check-sat)
