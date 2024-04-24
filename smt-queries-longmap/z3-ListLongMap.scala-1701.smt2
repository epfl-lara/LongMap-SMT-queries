; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31128 () Bool)

(assert start!31128)

(declare-fun b!313099 () Bool)

(declare-fun res!169469 () Bool)

(declare-fun e!195150 () Bool)

(assert (=> b!313099 (=> (not res!169469) (not e!195150))))

(declare-datatypes ((array!15998 0))(
  ( (array!15999 (arr!7579 (Array (_ BitVec 32) (_ BitVec 64))) (size!7931 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15998)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15998 (_ BitVec 32)) Bool)

(assert (=> b!313099 (= res!169469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313100 () Bool)

(declare-fun res!169462 () Bool)

(assert (=> b!313100 (=> (not res!169462) (not e!195150))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313100 (= res!169462 (validKeyInArray!0 k0!2441))))

(declare-fun b!313101 () Bool)

(declare-fun res!169468 () Bool)

(assert (=> b!313101 (=> (not res!169468) (not e!195150))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313101 (= res!169468 (and (= (size!7931 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7931 a!3293))))))

(declare-fun b!313102 () Bool)

(declare-fun res!169464 () Bool)

(assert (=> b!313102 (=> (not res!169464) (not e!195150))))

(declare-datatypes ((SeekEntryResult!2684 0))(
  ( (MissingZero!2684 (index!12912 (_ BitVec 32))) (Found!2684 (index!12913 (_ BitVec 32))) (Intermediate!2684 (undefined!3496 Bool) (index!12914 (_ BitVec 32)) (x!31228 (_ BitVec 32))) (Undefined!2684) (MissingVacant!2684 (index!12915 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15998 (_ BitVec 32)) SeekEntryResult!2684)

(assert (=> b!313102 (= res!169464 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2684 i!1240)))))

(declare-fun b!313103 () Bool)

(declare-fun res!169466 () Bool)

(declare-fun e!195149 () Bool)

(assert (=> b!313103 (=> (not res!169466) (not e!195149))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!313103 (= res!169466 (and (= (select (arr!7579 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7931 a!3293))))))

(declare-fun b!313104 () Bool)

(assert (=> b!313104 (= e!195149 (and (bvslt resX!52 #b01111111111111111111111111111110) (= (select (arr!7579 a!3293) index!1781) k0!2441)))))

(declare-fun b!313105 () Bool)

(declare-fun res!169463 () Bool)

(assert (=> b!313105 (=> (not res!169463) (not e!195150))))

(declare-fun arrayContainsKey!0 (array!15998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313105 (= res!169463 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!169465 () Bool)

(assert (=> start!31128 (=> (not res!169465) (not e!195150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31128 (= res!169465 (validMask!0 mask!3709))))

(assert (=> start!31128 e!195150))

(declare-fun array_inv!5529 (array!15998) Bool)

(assert (=> start!31128 (array_inv!5529 a!3293)))

(assert (=> start!31128 true))

(declare-fun b!313106 () Bool)

(declare-fun res!169470 () Bool)

(assert (=> b!313106 (=> (not res!169470) (not e!195149))))

(declare-fun lt!153471 () SeekEntryResult!2684)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15998 (_ BitVec 32)) SeekEntryResult!2684)

(assert (=> b!313106 (= res!169470 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153471))))

(declare-fun b!313107 () Bool)

(assert (=> b!313107 (= e!195150 e!195149)))

(declare-fun res!169467 () Bool)

(assert (=> b!313107 (=> (not res!169467) (not e!195149))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313107 (= res!169467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153471))))

(assert (=> b!313107 (= lt!153471 (Intermediate!2684 false resIndex!52 resX!52))))

(assert (= (and start!31128 res!169465) b!313101))

(assert (= (and b!313101 res!169468) b!313100))

(assert (= (and b!313100 res!169462) b!313105))

(assert (= (and b!313105 res!169463) b!313102))

(assert (= (and b!313102 res!169464) b!313099))

(assert (= (and b!313099 res!169469) b!313107))

(assert (= (and b!313107 res!169467) b!313103))

(assert (= (and b!313103 res!169466) b!313106))

(assert (= (and b!313106 res!169470) b!313104))

(declare-fun m!323311 () Bool)

(assert (=> b!313105 m!323311))

(declare-fun m!323313 () Bool)

(assert (=> b!313106 m!323313))

(declare-fun m!323315 () Bool)

(assert (=> b!313104 m!323315))

(declare-fun m!323317 () Bool)

(assert (=> b!313099 m!323317))

(declare-fun m!323319 () Bool)

(assert (=> b!313100 m!323319))

(declare-fun m!323321 () Bool)

(assert (=> start!31128 m!323321))

(declare-fun m!323323 () Bool)

(assert (=> start!31128 m!323323))

(declare-fun m!323325 () Bool)

(assert (=> b!313107 m!323325))

(assert (=> b!313107 m!323325))

(declare-fun m!323327 () Bool)

(assert (=> b!313107 m!323327))

(declare-fun m!323329 () Bool)

(assert (=> b!313102 m!323329))

(declare-fun m!323331 () Bool)

(assert (=> b!313103 m!323331))

(check-sat (not start!31128) (not b!313105) (not b!313102) (not b!313106) (not b!313099) (not b!313100) (not b!313107))
(check-sat)
(get-model)

(declare-fun b!313180 () Bool)

(declare-fun lt!153483 () SeekEntryResult!2684)

(assert (=> b!313180 (and (bvsge (index!12914 lt!153483) #b00000000000000000000000000000000) (bvslt (index!12914 lt!153483) (size!7931 a!3293)))))

(declare-fun e!195181 () Bool)

(assert (=> b!313180 (= e!195181 (= (select (arr!7579 a!3293) (index!12914 lt!153483)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195179 () SeekEntryResult!2684)

(declare-fun b!313181 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313181 (= e!195179 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313182 () Bool)

(assert (=> b!313182 (= e!195179 (Intermediate!2684 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313183 () Bool)

(assert (=> b!313183 (and (bvsge (index!12914 lt!153483) #b00000000000000000000000000000000) (bvslt (index!12914 lt!153483) (size!7931 a!3293)))))

(declare-fun res!169531 () Bool)

(assert (=> b!313183 (= res!169531 (= (select (arr!7579 a!3293) (index!12914 lt!153483)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313183 (=> res!169531 e!195181)))

(declare-fun d!68563 () Bool)

(declare-fun e!195183 () Bool)

(assert (=> d!68563 e!195183))

(declare-fun c!49431 () Bool)

(get-info :version)

(assert (=> d!68563 (= c!49431 (and ((_ is Intermediate!2684) lt!153483) (undefined!3496 lt!153483)))))

(declare-fun e!195180 () SeekEntryResult!2684)

(assert (=> d!68563 (= lt!153483 e!195180)))

(declare-fun c!49432 () Bool)

(assert (=> d!68563 (= c!49432 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153482 () (_ BitVec 64))

(assert (=> d!68563 (= lt!153482 (select (arr!7579 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68563 (validMask!0 mask!3709)))

(assert (=> d!68563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153483)))

(declare-fun b!313184 () Bool)

(declare-fun e!195182 () Bool)

(assert (=> b!313184 (= e!195183 e!195182)))

(declare-fun res!169532 () Bool)

(assert (=> b!313184 (= res!169532 (and ((_ is Intermediate!2684) lt!153483) (not (undefined!3496 lt!153483)) (bvslt (x!31228 lt!153483) #b01111111111111111111111111111110) (bvsge (x!31228 lt!153483) #b00000000000000000000000000000000) (bvsge (x!31228 lt!153483) #b00000000000000000000000000000000)))))

(assert (=> b!313184 (=> (not res!169532) (not e!195182))))

(declare-fun b!313185 () Bool)

(assert (=> b!313185 (= e!195183 (bvsge (x!31228 lt!153483) #b01111111111111111111111111111110))))

(declare-fun b!313186 () Bool)

(assert (=> b!313186 (and (bvsge (index!12914 lt!153483) #b00000000000000000000000000000000) (bvslt (index!12914 lt!153483) (size!7931 a!3293)))))

(declare-fun res!169533 () Bool)

(assert (=> b!313186 (= res!169533 (= (select (arr!7579 a!3293) (index!12914 lt!153483)) k0!2441))))

(assert (=> b!313186 (=> res!169533 e!195181)))

(assert (=> b!313186 (= e!195182 e!195181)))

(declare-fun b!313187 () Bool)

(assert (=> b!313187 (= e!195180 (Intermediate!2684 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313188 () Bool)

(assert (=> b!313188 (= e!195180 e!195179)))

(declare-fun c!49433 () Bool)

(assert (=> b!313188 (= c!49433 (or (= lt!153482 k0!2441) (= (bvadd lt!153482 lt!153482) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68563 c!49432) b!313187))

(assert (= (and d!68563 (not c!49432)) b!313188))

(assert (= (and b!313188 c!49433) b!313182))

(assert (= (and b!313188 (not c!49433)) b!313181))

(assert (= (and d!68563 c!49431) b!313185))

(assert (= (and d!68563 (not c!49431)) b!313184))

(assert (= (and b!313184 res!169532) b!313186))

(assert (= (and b!313186 (not res!169533)) b!313183))

(assert (= (and b!313183 (not res!169531)) b!313180))

(assert (=> d!68563 m!323325))

(declare-fun m!323377 () Bool)

(assert (=> d!68563 m!323377))

(assert (=> d!68563 m!323321))

(declare-fun m!323379 () Bool)

(assert (=> b!313183 m!323379))

(assert (=> b!313180 m!323379))

(assert (=> b!313186 m!323379))

(assert (=> b!313181 m!323325))

(declare-fun m!323381 () Bool)

(assert (=> b!313181 m!323381))

(assert (=> b!313181 m!323381))

(declare-fun m!323383 () Bool)

(assert (=> b!313181 m!323383))

(assert (=> b!313107 d!68563))

(declare-fun d!68571 () Bool)

(declare-fun lt!153502 () (_ BitVec 32))

(declare-fun lt!153501 () (_ BitVec 32))

(assert (=> d!68571 (= lt!153502 (bvmul (bvxor lt!153501 (bvlshr lt!153501 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68571 (= lt!153501 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68571 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169536 (let ((h!5261 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31232 (bvmul (bvxor h!5261 (bvlshr h!5261 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31232 (bvlshr x!31232 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169536 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169536 #b00000000000000000000000000000000))))))

(assert (=> d!68571 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153502 (bvlshr lt!153502 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313107 d!68571))

(declare-fun b!313282 () Bool)

(declare-fun c!49464 () Bool)

(declare-fun lt!153526 () (_ BitVec 64))

(assert (=> b!313282 (= c!49464 (= lt!153526 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195240 () SeekEntryResult!2684)

(declare-fun e!195242 () SeekEntryResult!2684)

(assert (=> b!313282 (= e!195240 e!195242)))

(declare-fun b!313283 () Bool)

(declare-fun lt!153527 () SeekEntryResult!2684)

(assert (=> b!313283 (= e!195240 (Found!2684 (index!12914 lt!153527)))))

(declare-fun b!313284 () Bool)

(declare-fun e!195241 () SeekEntryResult!2684)

(assert (=> b!313284 (= e!195241 e!195240)))

(assert (=> b!313284 (= lt!153526 (select (arr!7579 a!3293) (index!12914 lt!153527)))))

(declare-fun c!49466 () Bool)

(assert (=> b!313284 (= c!49466 (= lt!153526 k0!2441))))

(declare-fun b!313285 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15998 (_ BitVec 32)) SeekEntryResult!2684)

(assert (=> b!313285 (= e!195242 (seekKeyOrZeroReturnVacant!0 (x!31228 lt!153527) (index!12914 lt!153527) (index!12914 lt!153527) k0!2441 a!3293 mask!3709))))

(declare-fun d!68575 () Bool)

(declare-fun lt!153525 () SeekEntryResult!2684)

(assert (=> d!68575 (and (or ((_ is Undefined!2684) lt!153525) (not ((_ is Found!2684) lt!153525)) (and (bvsge (index!12913 lt!153525) #b00000000000000000000000000000000) (bvslt (index!12913 lt!153525) (size!7931 a!3293)))) (or ((_ is Undefined!2684) lt!153525) ((_ is Found!2684) lt!153525) (not ((_ is MissingZero!2684) lt!153525)) (and (bvsge (index!12912 lt!153525) #b00000000000000000000000000000000) (bvslt (index!12912 lt!153525) (size!7931 a!3293)))) (or ((_ is Undefined!2684) lt!153525) ((_ is Found!2684) lt!153525) ((_ is MissingZero!2684) lt!153525) (not ((_ is MissingVacant!2684) lt!153525)) (and (bvsge (index!12915 lt!153525) #b00000000000000000000000000000000) (bvslt (index!12915 lt!153525) (size!7931 a!3293)))) (or ((_ is Undefined!2684) lt!153525) (ite ((_ is Found!2684) lt!153525) (= (select (arr!7579 a!3293) (index!12913 lt!153525)) k0!2441) (ite ((_ is MissingZero!2684) lt!153525) (= (select (arr!7579 a!3293) (index!12912 lt!153525)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2684) lt!153525) (= (select (arr!7579 a!3293) (index!12915 lt!153525)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68575 (= lt!153525 e!195241)))

(declare-fun c!49465 () Bool)

(assert (=> d!68575 (= c!49465 (and ((_ is Intermediate!2684) lt!153527) (undefined!3496 lt!153527)))))

(assert (=> d!68575 (= lt!153527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68575 (validMask!0 mask!3709)))

(assert (=> d!68575 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153525)))

(declare-fun b!313286 () Bool)

(assert (=> b!313286 (= e!195241 Undefined!2684)))

(declare-fun b!313287 () Bool)

(assert (=> b!313287 (= e!195242 (MissingZero!2684 (index!12914 lt!153527)))))

(assert (= (and d!68575 c!49465) b!313286))

(assert (= (and d!68575 (not c!49465)) b!313284))

(assert (= (and b!313284 c!49466) b!313283))

(assert (= (and b!313284 (not c!49466)) b!313282))

(assert (= (and b!313282 c!49464) b!313287))

(assert (= (and b!313282 (not c!49464)) b!313285))

(declare-fun m!323417 () Bool)

(assert (=> b!313284 m!323417))

(declare-fun m!323421 () Bool)

(assert (=> b!313285 m!323421))

(assert (=> d!68575 m!323321))

(assert (=> d!68575 m!323325))

(assert (=> d!68575 m!323327))

(declare-fun m!323425 () Bool)

(assert (=> d!68575 m!323425))

(assert (=> d!68575 m!323325))

(declare-fun m!323427 () Bool)

(assert (=> d!68575 m!323427))

(declare-fun m!323431 () Bool)

(assert (=> d!68575 m!323431))

(assert (=> b!313102 d!68575))

(declare-fun d!68589 () Bool)

(assert (=> d!68589 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313100 d!68589))

(declare-fun b!313288 () Bool)

(declare-fun lt!153529 () SeekEntryResult!2684)

(assert (=> b!313288 (and (bvsge (index!12914 lt!153529) #b00000000000000000000000000000000) (bvslt (index!12914 lt!153529) (size!7931 a!3293)))))

(declare-fun e!195245 () Bool)

(assert (=> b!313288 (= e!195245 (= (select (arr!7579 a!3293) (index!12914 lt!153529)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195243 () SeekEntryResult!2684)

(declare-fun b!313289 () Bool)

(assert (=> b!313289 (= e!195243 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313290 () Bool)

(assert (=> b!313290 (= e!195243 (Intermediate!2684 false index!1781 x!1427))))

(declare-fun b!313291 () Bool)

(assert (=> b!313291 (and (bvsge (index!12914 lt!153529) #b00000000000000000000000000000000) (bvslt (index!12914 lt!153529) (size!7931 a!3293)))))

(declare-fun res!169570 () Bool)

(assert (=> b!313291 (= res!169570 (= (select (arr!7579 a!3293) (index!12914 lt!153529)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313291 (=> res!169570 e!195245)))

(declare-fun d!68591 () Bool)

(declare-fun e!195247 () Bool)

(assert (=> d!68591 e!195247))

(declare-fun c!49467 () Bool)

(assert (=> d!68591 (= c!49467 (and ((_ is Intermediate!2684) lt!153529) (undefined!3496 lt!153529)))))

(declare-fun e!195244 () SeekEntryResult!2684)

(assert (=> d!68591 (= lt!153529 e!195244)))

(declare-fun c!49468 () Bool)

(assert (=> d!68591 (= c!49468 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153528 () (_ BitVec 64))

(assert (=> d!68591 (= lt!153528 (select (arr!7579 a!3293) index!1781))))

(assert (=> d!68591 (validMask!0 mask!3709)))

(assert (=> d!68591 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153529)))

(declare-fun b!313292 () Bool)

(declare-fun e!195246 () Bool)

(assert (=> b!313292 (= e!195247 e!195246)))

(declare-fun res!169571 () Bool)

(assert (=> b!313292 (= res!169571 (and ((_ is Intermediate!2684) lt!153529) (not (undefined!3496 lt!153529)) (bvslt (x!31228 lt!153529) #b01111111111111111111111111111110) (bvsge (x!31228 lt!153529) #b00000000000000000000000000000000) (bvsge (x!31228 lt!153529) x!1427)))))

(assert (=> b!313292 (=> (not res!169571) (not e!195246))))

(declare-fun b!313293 () Bool)

(assert (=> b!313293 (= e!195247 (bvsge (x!31228 lt!153529) #b01111111111111111111111111111110))))

(declare-fun b!313294 () Bool)

(assert (=> b!313294 (and (bvsge (index!12914 lt!153529) #b00000000000000000000000000000000) (bvslt (index!12914 lt!153529) (size!7931 a!3293)))))

(declare-fun res!169572 () Bool)

(assert (=> b!313294 (= res!169572 (= (select (arr!7579 a!3293) (index!12914 lt!153529)) k0!2441))))

(assert (=> b!313294 (=> res!169572 e!195245)))

(assert (=> b!313294 (= e!195246 e!195245)))

(declare-fun b!313295 () Bool)

(assert (=> b!313295 (= e!195244 (Intermediate!2684 true index!1781 x!1427))))

(declare-fun b!313296 () Bool)

(assert (=> b!313296 (= e!195244 e!195243)))

(declare-fun c!49469 () Bool)

(assert (=> b!313296 (= c!49469 (or (= lt!153528 k0!2441) (= (bvadd lt!153528 lt!153528) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68591 c!49468) b!313295))

(assert (= (and d!68591 (not c!49468)) b!313296))

(assert (= (and b!313296 c!49469) b!313290))

(assert (= (and b!313296 (not c!49469)) b!313289))

(assert (= (and d!68591 c!49467) b!313293))

(assert (= (and d!68591 (not c!49467)) b!313292))

(assert (= (and b!313292 res!169571) b!313294))

(assert (= (and b!313294 (not res!169572)) b!313291))

(assert (= (and b!313291 (not res!169570)) b!313288))

(assert (=> d!68591 m!323315))

(assert (=> d!68591 m!323321))

(declare-fun m!323433 () Bool)

(assert (=> b!313291 m!323433))

(assert (=> b!313288 m!323433))

(assert (=> b!313294 m!323433))

(declare-fun m!323435 () Bool)

(assert (=> b!313289 m!323435))

(assert (=> b!313289 m!323435))

(declare-fun m!323437 () Bool)

(assert (=> b!313289 m!323437))

(assert (=> b!313106 d!68591))

(declare-fun b!313313 () Bool)

(declare-fun e!195262 () Bool)

(declare-fun call!25930 () Bool)

(assert (=> b!313313 (= e!195262 call!25930)))

(declare-fun b!313314 () Bool)

(declare-fun e!195260 () Bool)

(assert (=> b!313314 (= e!195260 e!195262)))

(declare-fun lt!153550 () (_ BitVec 64))

(assert (=> b!313314 (= lt!153550 (select (arr!7579 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9631 0))(
  ( (Unit!9632) )
))
(declare-fun lt!153548 () Unit!9631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15998 (_ BitVec 64) (_ BitVec 32)) Unit!9631)

(assert (=> b!313314 (= lt!153548 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153550 #b00000000000000000000000000000000))))

(assert (=> b!313314 (arrayContainsKey!0 a!3293 lt!153550 #b00000000000000000000000000000000)))

(declare-fun lt!153549 () Unit!9631)

(assert (=> b!313314 (= lt!153549 lt!153548)))

(declare-fun res!169581 () Bool)

(assert (=> b!313314 (= res!169581 (= (seekEntryOrOpen!0 (select (arr!7579 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2684 #b00000000000000000000000000000000)))))

(assert (=> b!313314 (=> (not res!169581) (not e!195262))))

(declare-fun bm!25927 () Bool)

(assert (=> bm!25927 (= call!25930 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68593 () Bool)

(declare-fun res!169582 () Bool)

(declare-fun e!195261 () Bool)

(assert (=> d!68593 (=> res!169582 e!195261)))

(assert (=> d!68593 (= res!169582 (bvsge #b00000000000000000000000000000000 (size!7931 a!3293)))))

(assert (=> d!68593 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195261)))

(declare-fun b!313315 () Bool)

(assert (=> b!313315 (= e!195260 call!25930)))

(declare-fun b!313316 () Bool)

(assert (=> b!313316 (= e!195261 e!195260)))

(declare-fun c!49474 () Bool)

(assert (=> b!313316 (= c!49474 (validKeyInArray!0 (select (arr!7579 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68593 (not res!169582)) b!313316))

(assert (= (and b!313316 c!49474) b!313314))

(assert (= (and b!313316 (not c!49474)) b!313315))

(assert (= (and b!313314 res!169581) b!313313))

(assert (= (or b!313313 b!313315) bm!25927))

(declare-fun m!323439 () Bool)

(assert (=> b!313314 m!323439))

(declare-fun m!323441 () Bool)

(assert (=> b!313314 m!323441))

(declare-fun m!323443 () Bool)

(assert (=> b!313314 m!323443))

(assert (=> b!313314 m!323439))

(declare-fun m!323445 () Bool)

(assert (=> b!313314 m!323445))

(declare-fun m!323447 () Bool)

(assert (=> bm!25927 m!323447))

(assert (=> b!313316 m!323439))

(assert (=> b!313316 m!323439))

(declare-fun m!323449 () Bool)

(assert (=> b!313316 m!323449))

(assert (=> b!313099 d!68593))

(declare-fun d!68601 () Bool)

(assert (=> d!68601 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31128 d!68601))

(declare-fun d!68609 () Bool)

(assert (=> d!68609 (= (array_inv!5529 a!3293) (bvsge (size!7931 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31128 d!68609))

(declare-fun d!68611 () Bool)

(declare-fun res!169589 () Bool)

(declare-fun e!195270 () Bool)

(assert (=> d!68611 (=> res!169589 e!195270)))

(assert (=> d!68611 (= res!169589 (= (select (arr!7579 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68611 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195270)))

(declare-fun b!313325 () Bool)

(declare-fun e!195271 () Bool)

(assert (=> b!313325 (= e!195270 e!195271)))

(declare-fun res!169590 () Bool)

(assert (=> b!313325 (=> (not res!169590) (not e!195271))))

(assert (=> b!313325 (= res!169590 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7931 a!3293)))))

(declare-fun b!313326 () Bool)

(assert (=> b!313326 (= e!195271 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68611 (not res!169589)) b!313325))

(assert (= (and b!313325 res!169590) b!313326))

(assert (=> d!68611 m!323439))

(declare-fun m!323461 () Bool)

(assert (=> b!313326 m!323461))

(assert (=> b!313105 d!68611))

(check-sat (not b!313326) (not b!313289) (not bm!25927) (not d!68591) (not b!313314) (not b!313316) (not b!313181) (not d!68575) (not b!313285) (not d!68563))
(check-sat)
