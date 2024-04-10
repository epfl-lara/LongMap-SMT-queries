; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31510 () Bool)

(assert start!31510)

(declare-fun b!315339 () Bool)

(declare-fun res!170796 () Bool)

(declare-fun e!196301 () Bool)

(assert (=> b!315339 (=> (not res!170796) (not e!196301))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315339 (= res!170796 (validKeyInArray!0 k0!2441))))

(declare-fun b!315340 () Bool)

(declare-fun res!170789 () Bool)

(assert (=> b!315340 (=> (not res!170789) (not e!196301))))

(declare-datatypes ((array!16085 0))(
  ( (array!16086 (arr!7614 (Array (_ BitVec 32) (_ BitVec 64))) (size!7966 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16085)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16085 (_ BitVec 32)) Bool)

(assert (=> b!315340 (= res!170789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315341 () Bool)

(declare-fun e!196302 () Bool)

(assert (=> b!315341 (= e!196301 e!196302)))

(declare-fun res!170793 () Bool)

(assert (=> b!315341 (=> (not res!170793) (not e!196302))))

(declare-datatypes ((SeekEntryResult!2754 0))(
  ( (MissingZero!2754 (index!13192 (_ BitVec 32))) (Found!2754 (index!13193 (_ BitVec 32))) (Intermediate!2754 (undefined!3566 Bool) (index!13194 (_ BitVec 32)) (x!31431 (_ BitVec 32))) (Undefined!2754) (MissingVacant!2754 (index!13195 (_ BitVec 32))) )
))
(declare-fun lt!154219 () SeekEntryResult!2754)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16085 (_ BitVec 32)) SeekEntryResult!2754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315341 (= res!170793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154219))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315341 (= lt!154219 (Intermediate!2754 false resIndex!52 resX!52))))

(declare-fun b!315342 () Bool)

(declare-fun e!196300 () Bool)

(assert (=> b!315342 (= e!196300 (not false))))

(declare-fun lt!154220 () SeekEntryResult!2754)

(declare-fun lt!154221 () SeekEntryResult!2754)

(get-info :version)

(assert (=> b!315342 (and (= lt!154220 lt!154221) ((_ is Intermediate!2754) lt!154221))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315342 (= lt!154221 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315343 () Bool)

(declare-fun res!170791 () Bool)

(assert (=> b!315343 (=> (not res!170791) (not e!196302))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315343 (= res!170791 (and (= (select (arr!7614 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7966 a!3293))))))

(declare-fun b!315344 () Bool)

(assert (=> b!315344 (= e!196302 e!196300)))

(declare-fun res!170794 () Bool)

(assert (=> b!315344 (=> (not res!170794) (not e!196300))))

(assert (=> b!315344 (= res!170794 (and (= lt!154220 lt!154219) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7614 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7614 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7614 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315344 (= lt!154220 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!315345 () Bool)

(declare-fun res!170795 () Bool)

(assert (=> b!315345 (=> (not res!170795) (not e!196301))))

(assert (=> b!315345 (= res!170795 (and (= (size!7966 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7966 a!3293))))))

(declare-fun b!315346 () Bool)

(declare-fun res!170788 () Bool)

(assert (=> b!315346 (=> (not res!170788) (not e!196301))))

(declare-fun arrayContainsKey!0 (array!16085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315346 (= res!170788 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315347 () Bool)

(declare-fun res!170790 () Bool)

(assert (=> b!315347 (=> (not res!170790) (not e!196301))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16085 (_ BitVec 32)) SeekEntryResult!2754)

(assert (=> b!315347 (= res!170790 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2754 i!1240)))))

(declare-fun res!170792 () Bool)

(assert (=> start!31510 (=> (not res!170792) (not e!196301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31510 (= res!170792 (validMask!0 mask!3709))))

(assert (=> start!31510 e!196301))

(declare-fun array_inv!5577 (array!16085) Bool)

(assert (=> start!31510 (array_inv!5577 a!3293)))

(assert (=> start!31510 true))

(assert (= (and start!31510 res!170792) b!315345))

(assert (= (and b!315345 res!170795) b!315339))

(assert (= (and b!315339 res!170796) b!315346))

(assert (= (and b!315346 res!170788) b!315347))

(assert (= (and b!315347 res!170790) b!315340))

(assert (= (and b!315340 res!170789) b!315341))

(assert (= (and b!315341 res!170793) b!315343))

(assert (= (and b!315343 res!170791) b!315344))

(assert (= (and b!315344 res!170794) b!315342))

(declare-fun m!324643 () Bool)

(assert (=> b!315342 m!324643))

(assert (=> b!315342 m!324643))

(declare-fun m!324645 () Bool)

(assert (=> b!315342 m!324645))

(declare-fun m!324647 () Bool)

(assert (=> b!315347 m!324647))

(declare-fun m!324649 () Bool)

(assert (=> b!315341 m!324649))

(assert (=> b!315341 m!324649))

(declare-fun m!324651 () Bool)

(assert (=> b!315341 m!324651))

(declare-fun m!324653 () Bool)

(assert (=> b!315346 m!324653))

(declare-fun m!324655 () Bool)

(assert (=> start!31510 m!324655))

(declare-fun m!324657 () Bool)

(assert (=> start!31510 m!324657))

(declare-fun m!324659 () Bool)

(assert (=> b!315343 m!324659))

(declare-fun m!324661 () Bool)

(assert (=> b!315340 m!324661))

(declare-fun m!324663 () Bool)

(assert (=> b!315344 m!324663))

(declare-fun m!324665 () Bool)

(assert (=> b!315344 m!324665))

(declare-fun m!324667 () Bool)

(assert (=> b!315339 m!324667))

(check-sat (not b!315347) (not b!315346) (not b!315339) (not b!315344) (not b!315342) (not b!315341) (not b!315340) (not start!31510))
(check-sat)
(get-model)

(declare-fun b!315393 () Bool)

(declare-fun lt!154236 () SeekEntryResult!2754)

(assert (=> b!315393 (and (bvsge (index!13194 lt!154236) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154236) (size!7966 a!3293)))))

(declare-fun res!170831 () Bool)

(assert (=> b!315393 (= res!170831 (= (select (arr!7614 a!3293) (index!13194 lt!154236)) k0!2441))))

(declare-fun e!196330 () Bool)

(assert (=> b!315393 (=> res!170831 e!196330)))

(declare-fun e!196327 () Bool)

(assert (=> b!315393 (= e!196327 e!196330)))

(declare-fun b!315394 () Bool)

(declare-fun e!196326 () SeekEntryResult!2754)

(declare-fun e!196329 () SeekEntryResult!2754)

(assert (=> b!315394 (= e!196326 e!196329)))

(declare-fun c!49898 () Bool)

(declare-fun lt!154235 () (_ BitVec 64))

(assert (=> b!315394 (= c!49898 (or (= lt!154235 k0!2441) (= (bvadd lt!154235 lt!154235) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315395 () Bool)

(assert (=> b!315395 (= e!196329 (Intermediate!2754 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315396 () Bool)

(declare-fun e!196328 () Bool)

(assert (=> b!315396 (= e!196328 (bvsge (x!31431 lt!154236) #b01111111111111111111111111111110))))

(declare-fun d!68899 () Bool)

(assert (=> d!68899 e!196328))

(declare-fun c!49899 () Bool)

(assert (=> d!68899 (= c!49899 (and ((_ is Intermediate!2754) lt!154236) (undefined!3566 lt!154236)))))

(assert (=> d!68899 (= lt!154236 e!196326)))

(declare-fun c!49897 () Bool)

(assert (=> d!68899 (= c!49897 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68899 (= lt!154235 (select (arr!7614 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68899 (validMask!0 mask!3709)))

(assert (=> d!68899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154236)))

(declare-fun b!315397 () Bool)

(assert (=> b!315397 (and (bvsge (index!13194 lt!154236) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154236) (size!7966 a!3293)))))

(declare-fun res!170830 () Bool)

(assert (=> b!315397 (= res!170830 (= (select (arr!7614 a!3293) (index!13194 lt!154236)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315397 (=> res!170830 e!196330)))

(declare-fun b!315398 () Bool)

(assert (=> b!315398 (= e!196328 e!196327)))

(declare-fun res!170832 () Bool)

(assert (=> b!315398 (= res!170832 (and ((_ is Intermediate!2754) lt!154236) (not (undefined!3566 lt!154236)) (bvslt (x!31431 lt!154236) #b01111111111111111111111111111110) (bvsge (x!31431 lt!154236) #b00000000000000000000000000000000) (bvsge (x!31431 lt!154236) #b00000000000000000000000000000000)))))

(assert (=> b!315398 (=> (not res!170832) (not e!196327))))

(declare-fun b!315399 () Bool)

(assert (=> b!315399 (and (bvsge (index!13194 lt!154236) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154236) (size!7966 a!3293)))))

(assert (=> b!315399 (= e!196330 (= (select (arr!7614 a!3293) (index!13194 lt!154236)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315400 () Bool)

(assert (=> b!315400 (= e!196326 (Intermediate!2754 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315401 () Bool)

(assert (=> b!315401 (= e!196329 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!68899 c!49897) b!315400))

(assert (= (and d!68899 (not c!49897)) b!315394))

(assert (= (and b!315394 c!49898) b!315395))

(assert (= (and b!315394 (not c!49898)) b!315401))

(assert (= (and d!68899 c!49899) b!315396))

(assert (= (and d!68899 (not c!49899)) b!315398))

(assert (= (and b!315398 res!170832) b!315393))

(assert (= (and b!315393 (not res!170831)) b!315397))

(assert (= (and b!315397 (not res!170830)) b!315399))

(assert (=> b!315401 m!324649))

(declare-fun m!324695 () Bool)

(assert (=> b!315401 m!324695))

(assert (=> b!315401 m!324695))

(declare-fun m!324697 () Bool)

(assert (=> b!315401 m!324697))

(declare-fun m!324699 () Bool)

(assert (=> b!315399 m!324699))

(assert (=> d!68899 m!324649))

(declare-fun m!324701 () Bool)

(assert (=> d!68899 m!324701))

(assert (=> d!68899 m!324655))

(assert (=> b!315393 m!324699))

(assert (=> b!315397 m!324699))

(assert (=> b!315341 d!68899))

(declare-fun d!68905 () Bool)

(declare-fun lt!154242 () (_ BitVec 32))

(declare-fun lt!154241 () (_ BitVec 32))

(assert (=> d!68905 (= lt!154242 (bvmul (bvxor lt!154241 (bvlshr lt!154241 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68905 (= lt!154241 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68905 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170833 (let ((h!5367 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31434 (bvmul (bvxor h!5367 (bvlshr h!5367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31434 (bvlshr x!31434 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170833 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170833 #b00000000000000000000000000000000))))))

(assert (=> d!68905 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154242 (bvlshr lt!154242 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!315341 d!68905))

(declare-fun d!68915 () Bool)

(declare-fun res!170850 () Bool)

(declare-fun e!196347 () Bool)

(assert (=> d!68915 (=> res!170850 e!196347)))

(assert (=> d!68915 (= res!170850 (= (select (arr!7614 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68915 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196347)))

(declare-fun b!315418 () Bool)

(declare-fun e!196348 () Bool)

(assert (=> b!315418 (= e!196347 e!196348)))

(declare-fun res!170851 () Bool)

(assert (=> b!315418 (=> (not res!170851) (not e!196348))))

(assert (=> b!315418 (= res!170851 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7966 a!3293)))))

(declare-fun b!315419 () Bool)

(assert (=> b!315419 (= e!196348 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68915 (not res!170850)) b!315418))

(assert (= (and b!315418 res!170851) b!315419))

(declare-fun m!324711 () Bool)

(assert (=> d!68915 m!324711))

(declare-fun m!324713 () Bool)

(assert (=> b!315419 m!324713))

(assert (=> b!315346 d!68915))

(declare-fun d!68919 () Bool)

(declare-fun lt!154259 () SeekEntryResult!2754)

(assert (=> d!68919 (and (or ((_ is Undefined!2754) lt!154259) (not ((_ is Found!2754) lt!154259)) (and (bvsge (index!13193 lt!154259) #b00000000000000000000000000000000) (bvslt (index!13193 lt!154259) (size!7966 a!3293)))) (or ((_ is Undefined!2754) lt!154259) ((_ is Found!2754) lt!154259) (not ((_ is MissingZero!2754) lt!154259)) (and (bvsge (index!13192 lt!154259) #b00000000000000000000000000000000) (bvslt (index!13192 lt!154259) (size!7966 a!3293)))) (or ((_ is Undefined!2754) lt!154259) ((_ is Found!2754) lt!154259) ((_ is MissingZero!2754) lt!154259) (not ((_ is MissingVacant!2754) lt!154259)) (and (bvsge (index!13195 lt!154259) #b00000000000000000000000000000000) (bvslt (index!13195 lt!154259) (size!7966 a!3293)))) (or ((_ is Undefined!2754) lt!154259) (ite ((_ is Found!2754) lt!154259) (= (select (arr!7614 a!3293) (index!13193 lt!154259)) k0!2441) (ite ((_ is MissingZero!2754) lt!154259) (= (select (arr!7614 a!3293) (index!13192 lt!154259)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2754) lt!154259) (= (select (arr!7614 a!3293) (index!13195 lt!154259)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!196364 () SeekEntryResult!2754)

(assert (=> d!68919 (= lt!154259 e!196364)))

(declare-fun c!49909 () Bool)

(declare-fun lt!154258 () SeekEntryResult!2754)

(assert (=> d!68919 (= c!49909 (and ((_ is Intermediate!2754) lt!154258) (undefined!3566 lt!154258)))))

(assert (=> d!68919 (= lt!154258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68919 (validMask!0 mask!3709)))

(assert (=> d!68919 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154259)))

(declare-fun b!315444 () Bool)

(declare-fun e!196366 () SeekEntryResult!2754)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16085 (_ BitVec 32)) SeekEntryResult!2754)

(assert (=> b!315444 (= e!196366 (seekKeyOrZeroReturnVacant!0 (x!31431 lt!154258) (index!13194 lt!154258) (index!13194 lt!154258) k0!2441 a!3293 mask!3709))))

(declare-fun b!315445 () Bool)

(assert (=> b!315445 (= e!196364 Undefined!2754)))

(declare-fun b!315446 () Bool)

(declare-fun c!49911 () Bool)

(declare-fun lt!154260 () (_ BitVec 64))

(assert (=> b!315446 (= c!49911 (= lt!154260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196365 () SeekEntryResult!2754)

(assert (=> b!315446 (= e!196365 e!196366)))

(declare-fun b!315447 () Bool)

(assert (=> b!315447 (= e!196366 (MissingZero!2754 (index!13194 lt!154258)))))

(declare-fun b!315448 () Bool)

(assert (=> b!315448 (= e!196365 (Found!2754 (index!13194 lt!154258)))))

(declare-fun b!315449 () Bool)

(assert (=> b!315449 (= e!196364 e!196365)))

(assert (=> b!315449 (= lt!154260 (select (arr!7614 a!3293) (index!13194 lt!154258)))))

(declare-fun c!49910 () Bool)

(assert (=> b!315449 (= c!49910 (= lt!154260 k0!2441))))

(assert (= (and d!68919 c!49909) b!315445))

(assert (= (and d!68919 (not c!49909)) b!315449))

(assert (= (and b!315449 c!49910) b!315448))

(assert (= (and b!315449 (not c!49910)) b!315446))

(assert (= (and b!315446 c!49911) b!315447))

(assert (= (and b!315446 (not c!49911)) b!315444))

(declare-fun m!324725 () Bool)

(assert (=> d!68919 m!324725))

(declare-fun m!324727 () Bool)

(assert (=> d!68919 m!324727))

(assert (=> d!68919 m!324649))

(assert (=> d!68919 m!324651))

(assert (=> d!68919 m!324649))

(assert (=> d!68919 m!324655))

(declare-fun m!324729 () Bool)

(assert (=> d!68919 m!324729))

(declare-fun m!324731 () Bool)

(assert (=> b!315444 m!324731))

(declare-fun m!324733 () Bool)

(assert (=> b!315449 m!324733))

(assert (=> b!315347 d!68919))

(declare-fun b!315458 () Bool)

(declare-fun lt!154266 () SeekEntryResult!2754)

(assert (=> b!315458 (and (bvsge (index!13194 lt!154266) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154266) (size!7966 a!3293)))))

(declare-fun res!170859 () Bool)

(assert (=> b!315458 (= res!170859 (= (select (arr!7614 a!3293) (index!13194 lt!154266)) k0!2441))))

(declare-fun e!196375 () Bool)

(assert (=> b!315458 (=> res!170859 e!196375)))

(declare-fun e!196372 () Bool)

(assert (=> b!315458 (= e!196372 e!196375)))

(declare-fun b!315459 () Bool)

(declare-fun e!196371 () SeekEntryResult!2754)

(declare-fun e!196374 () SeekEntryResult!2754)

(assert (=> b!315459 (= e!196371 e!196374)))

(declare-fun c!49917 () Bool)

(declare-fun lt!154265 () (_ BitVec 64))

(assert (=> b!315459 (= c!49917 (or (= lt!154265 k0!2441) (= (bvadd lt!154265 lt!154265) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315460 () Bool)

(assert (=> b!315460 (= e!196374 (Intermediate!2754 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315461 () Bool)

(declare-fun e!196373 () Bool)

(assert (=> b!315461 (= e!196373 (bvsge (x!31431 lt!154266) #b01111111111111111111111111111110))))

(declare-fun d!68923 () Bool)

(assert (=> d!68923 e!196373))

(declare-fun c!49918 () Bool)

(assert (=> d!68923 (= c!49918 (and ((_ is Intermediate!2754) lt!154266) (undefined!3566 lt!154266)))))

(assert (=> d!68923 (= lt!154266 e!196371)))

(declare-fun c!49916 () Bool)

(assert (=> d!68923 (= c!49916 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68923 (= lt!154265 (select (arr!7614 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68923 (validMask!0 mask!3709)))

(assert (=> d!68923 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!154266)))

(declare-fun b!315462 () Bool)

(assert (=> b!315462 (and (bvsge (index!13194 lt!154266) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154266) (size!7966 a!3293)))))

(declare-fun res!170858 () Bool)

(assert (=> b!315462 (= res!170858 (= (select (arr!7614 a!3293) (index!13194 lt!154266)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315462 (=> res!170858 e!196375)))

(declare-fun b!315463 () Bool)

(assert (=> b!315463 (= e!196373 e!196372)))

(declare-fun res!170860 () Bool)

(assert (=> b!315463 (= res!170860 (and ((_ is Intermediate!2754) lt!154266) (not (undefined!3566 lt!154266)) (bvslt (x!31431 lt!154266) #b01111111111111111111111111111110) (bvsge (x!31431 lt!154266) #b00000000000000000000000000000000) (bvsge (x!31431 lt!154266) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!315463 (=> (not res!170860) (not e!196372))))

(declare-fun b!315464 () Bool)

(assert (=> b!315464 (and (bvsge (index!13194 lt!154266) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154266) (size!7966 a!3293)))))

(assert (=> b!315464 (= e!196375 (= (select (arr!7614 a!3293) (index!13194 lt!154266)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315465 () Bool)

(assert (=> b!315465 (= e!196371 (Intermediate!2754 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315466 () Bool)

(assert (=> b!315466 (= e!196374 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!68923 c!49916) b!315465))

(assert (= (and d!68923 (not c!49916)) b!315459))

(assert (= (and b!315459 c!49917) b!315460))

(assert (= (and b!315459 (not c!49917)) b!315466))

(assert (= (and d!68923 c!49918) b!315461))

(assert (= (and d!68923 (not c!49918)) b!315463))

(assert (= (and b!315463 res!170860) b!315458))

(assert (= (and b!315458 (not res!170859)) b!315462))

(assert (= (and b!315462 (not res!170858)) b!315464))

(assert (=> b!315466 m!324643))

(declare-fun m!324735 () Bool)

(assert (=> b!315466 m!324735))

(assert (=> b!315466 m!324735))

(declare-fun m!324737 () Bool)

(assert (=> b!315466 m!324737))

(declare-fun m!324739 () Bool)

(assert (=> b!315464 m!324739))

(assert (=> d!68923 m!324643))

(declare-fun m!324741 () Bool)

(assert (=> d!68923 m!324741))

(assert (=> d!68923 m!324655))

(assert (=> b!315458 m!324739))

(assert (=> b!315462 m!324739))

(assert (=> b!315342 d!68923))

(declare-fun d!68925 () Bool)

(declare-fun lt!154273 () (_ BitVec 32))

(assert (=> d!68925 (and (bvsge lt!154273 #b00000000000000000000000000000000) (bvslt lt!154273 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68925 (= lt!154273 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68925 (validMask!0 mask!3709)))

(assert (=> d!68925 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154273)))

(declare-fun bs!11027 () Bool)

(assert (= bs!11027 d!68925))

(declare-fun m!324743 () Bool)

(assert (=> bs!11027 m!324743))

(assert (=> bs!11027 m!324655))

(assert (=> b!315342 d!68925))

(declare-fun d!68927 () Bool)

(assert (=> d!68927 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315339 d!68927))

(declare-fun b!315495 () Bool)

(declare-fun lt!154275 () SeekEntryResult!2754)

(assert (=> b!315495 (and (bvsge (index!13194 lt!154275) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154275) (size!7966 a!3293)))))

(declare-fun res!170874 () Bool)

(assert (=> b!315495 (= res!170874 (= (select (arr!7614 a!3293) (index!13194 lt!154275)) k0!2441))))

(declare-fun e!196396 () Bool)

(assert (=> b!315495 (=> res!170874 e!196396)))

(declare-fun e!196393 () Bool)

(assert (=> b!315495 (= e!196393 e!196396)))

(declare-fun b!315496 () Bool)

(declare-fun e!196392 () SeekEntryResult!2754)

(declare-fun e!196395 () SeekEntryResult!2754)

(assert (=> b!315496 (= e!196392 e!196395)))

(declare-fun c!49928 () Bool)

(declare-fun lt!154274 () (_ BitVec 64))

(assert (=> b!315496 (= c!49928 (or (= lt!154274 k0!2441) (= (bvadd lt!154274 lt!154274) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315497 () Bool)

(assert (=> b!315497 (= e!196395 (Intermediate!2754 false index!1781 x!1427))))

(declare-fun b!315498 () Bool)

(declare-fun e!196394 () Bool)

(assert (=> b!315498 (= e!196394 (bvsge (x!31431 lt!154275) #b01111111111111111111111111111110))))

(declare-fun d!68929 () Bool)

(assert (=> d!68929 e!196394))

(declare-fun c!49929 () Bool)

(assert (=> d!68929 (= c!49929 (and ((_ is Intermediate!2754) lt!154275) (undefined!3566 lt!154275)))))

(assert (=> d!68929 (= lt!154275 e!196392)))

(declare-fun c!49927 () Bool)

(assert (=> d!68929 (= c!49927 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68929 (= lt!154274 (select (arr!7614 a!3293) index!1781))))

(assert (=> d!68929 (validMask!0 mask!3709)))

(assert (=> d!68929 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154275)))

(declare-fun b!315499 () Bool)

(assert (=> b!315499 (and (bvsge (index!13194 lt!154275) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154275) (size!7966 a!3293)))))

(declare-fun res!170873 () Bool)

(assert (=> b!315499 (= res!170873 (= (select (arr!7614 a!3293) (index!13194 lt!154275)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315499 (=> res!170873 e!196396)))

(declare-fun b!315500 () Bool)

(assert (=> b!315500 (= e!196394 e!196393)))

(declare-fun res!170875 () Bool)

(assert (=> b!315500 (= res!170875 (and ((_ is Intermediate!2754) lt!154275) (not (undefined!3566 lt!154275)) (bvslt (x!31431 lt!154275) #b01111111111111111111111111111110) (bvsge (x!31431 lt!154275) #b00000000000000000000000000000000) (bvsge (x!31431 lt!154275) x!1427)))))

(assert (=> b!315500 (=> (not res!170875) (not e!196393))))

(declare-fun b!315501 () Bool)

(assert (=> b!315501 (and (bvsge (index!13194 lt!154275) #b00000000000000000000000000000000) (bvslt (index!13194 lt!154275) (size!7966 a!3293)))))

(assert (=> b!315501 (= e!196396 (= (select (arr!7614 a!3293) (index!13194 lt!154275)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315502 () Bool)

(assert (=> b!315502 (= e!196392 (Intermediate!2754 true index!1781 x!1427))))

(declare-fun b!315503 () Bool)

(assert (=> b!315503 (= e!196395 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!68929 c!49927) b!315502))

(assert (= (and d!68929 (not c!49927)) b!315496))

(assert (= (and b!315496 c!49928) b!315497))

(assert (= (and b!315496 (not c!49928)) b!315503))

(assert (= (and d!68929 c!49929) b!315498))

(assert (= (and d!68929 (not c!49929)) b!315500))

(assert (= (and b!315500 res!170875) b!315495))

(assert (= (and b!315495 (not res!170874)) b!315499))

(assert (= (and b!315499 (not res!170873)) b!315501))

(assert (=> b!315503 m!324643))

(assert (=> b!315503 m!324643))

(declare-fun m!324745 () Bool)

(assert (=> b!315503 m!324745))

(declare-fun m!324749 () Bool)

(assert (=> b!315501 m!324749))

(assert (=> d!68929 m!324663))

(assert (=> d!68929 m!324655))

(assert (=> b!315495 m!324749))

(assert (=> b!315499 m!324749))

(assert (=> b!315344 d!68929))

(declare-fun d!68931 () Bool)

(assert (=> d!68931 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31510 d!68931))

(declare-fun d!68947 () Bool)

(assert (=> d!68947 (= (array_inv!5577 a!3293) (bvsge (size!7966 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31510 d!68947))

(declare-fun bm!25993 () Bool)

(declare-fun call!25996 () Bool)

(assert (=> bm!25993 (= call!25996 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!315557 () Bool)

(declare-fun e!196429 () Bool)

(assert (=> b!315557 (= e!196429 call!25996)))

(declare-fun b!315559 () Bool)

(declare-fun e!196430 () Bool)

(declare-fun e!196428 () Bool)

(assert (=> b!315559 (= e!196430 e!196428)))

(declare-fun c!49947 () Bool)

(assert (=> b!315559 (= c!49947 (validKeyInArray!0 (select (arr!7614 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!315560 () Bool)

(assert (=> b!315560 (= e!196428 call!25996)))

(declare-fun d!68949 () Bool)

(declare-fun res!170898 () Bool)

(assert (=> d!68949 (=> res!170898 e!196430)))

(assert (=> d!68949 (= res!170898 (bvsge #b00000000000000000000000000000000 (size!7966 a!3293)))))

(assert (=> d!68949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196430)))

(declare-fun b!315558 () Bool)

(assert (=> b!315558 (= e!196428 e!196429)))

(declare-fun lt!154307 () (_ BitVec 64))

(assert (=> b!315558 (= lt!154307 (select (arr!7614 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9705 0))(
  ( (Unit!9706) )
))
(declare-fun lt!154309 () Unit!9705)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16085 (_ BitVec 64) (_ BitVec 32)) Unit!9705)

(assert (=> b!315558 (= lt!154309 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154307 #b00000000000000000000000000000000))))

(assert (=> b!315558 (arrayContainsKey!0 a!3293 lt!154307 #b00000000000000000000000000000000)))

(declare-fun lt!154308 () Unit!9705)

(assert (=> b!315558 (= lt!154308 lt!154309)))

(declare-fun res!170897 () Bool)

(assert (=> b!315558 (= res!170897 (= (seekEntryOrOpen!0 (select (arr!7614 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2754 #b00000000000000000000000000000000)))))

(assert (=> b!315558 (=> (not res!170897) (not e!196429))))

(assert (= (and d!68949 (not res!170898)) b!315559))

(assert (= (and b!315559 c!49947) b!315558))

(assert (= (and b!315559 (not c!49947)) b!315560))

(assert (= (and b!315558 res!170897) b!315557))

(assert (= (or b!315557 b!315560) bm!25993))

(declare-fun m!324783 () Bool)

(assert (=> bm!25993 m!324783))

(assert (=> b!315559 m!324711))

(assert (=> b!315559 m!324711))

(declare-fun m!324785 () Bool)

(assert (=> b!315559 m!324785))

(assert (=> b!315558 m!324711))

(declare-fun m!324787 () Bool)

(assert (=> b!315558 m!324787))

(declare-fun m!324789 () Bool)

(assert (=> b!315558 m!324789))

(assert (=> b!315558 m!324711))

(declare-fun m!324791 () Bool)

(assert (=> b!315558 m!324791))

(assert (=> b!315340 d!68949))

(check-sat (not b!315559) (not bm!25993) (not b!315503) (not d!68899) (not d!68925) (not d!68923) (not b!315401) (not b!315419) (not b!315444) (not d!68929) (not d!68919) (not b!315558) (not b!315466))
(check-sat)
