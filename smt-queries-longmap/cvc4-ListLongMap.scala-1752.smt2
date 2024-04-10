; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32072 () Bool)

(assert start!32072)

(declare-fun b!319968 () Bool)

(declare-fun res!174283 () Bool)

(declare-fun e!198627 () Bool)

(assert (=> b!319968 (=> (not res!174283) (not e!198627))))

(declare-datatypes ((array!16346 0))(
  ( (array!16347 (arr!7735 (Array (_ BitVec 32) (_ BitVec 64))) (size!8087 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16346)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319968 (= res!174283 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174280 () Bool)

(assert (=> start!32072 (=> (not res!174280) (not e!198627))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32072 (= res!174280 (validMask!0 mask!3777))))

(assert (=> start!32072 e!198627))

(assert (=> start!32072 true))

(declare-fun array_inv!5698 (array!16346) Bool)

(assert (=> start!32072 (array_inv!5698 a!3305)))

(declare-fun b!319969 () Bool)

(declare-fun res!174282 () Bool)

(assert (=> b!319969 (=> (not res!174282) (not e!198627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319969 (= res!174282 (validKeyInArray!0 k!2497))))

(declare-fun b!319970 () Bool)

(declare-fun res!174284 () Bool)

(assert (=> b!319970 (=> (not res!174284) (not e!198627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16346 (_ BitVec 32)) Bool)

(assert (=> b!319970 (= res!174284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319971 () Bool)

(declare-fun res!174281 () Bool)

(assert (=> b!319971 (=> (not res!174281) (not e!198627))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2866 0))(
  ( (MissingZero!2866 (index!13640 (_ BitVec 32))) (Found!2866 (index!13641 (_ BitVec 32))) (Intermediate!2866 (undefined!3678 Bool) (index!13642 (_ BitVec 32)) (x!31908 (_ BitVec 32))) (Undefined!2866) (MissingVacant!2866 (index!13643 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16346 (_ BitVec 32)) SeekEntryResult!2866)

(assert (=> b!319971 (= res!174281 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2866 i!1250)))))

(declare-fun b!319972 () Bool)

(declare-fun res!174285 () Bool)

(assert (=> b!319972 (=> (not res!174285) (not e!198627))))

(assert (=> b!319972 (= res!174285 (and (= (size!8087 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8087 a!3305))))))

(declare-fun b!319973 () Bool)

(declare-fun lt!155904 () (_ BitVec 32))

(assert (=> b!319973 (= e!198627 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!155904 #b00000000000000000000000000000000) (bvsge lt!155904 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319973 (= lt!155904 (toIndex!0 k!2497 mask!3777))))

(assert (= (and start!32072 res!174280) b!319972))

(assert (= (and b!319972 res!174285) b!319969))

(assert (= (and b!319969 res!174282) b!319968))

(assert (= (and b!319968 res!174283) b!319971))

(assert (= (and b!319971 res!174281) b!319970))

(assert (= (and b!319970 res!174284) b!319973))

(declare-fun m!328437 () Bool)

(assert (=> b!319973 m!328437))

(declare-fun m!328439 () Bool)

(assert (=> b!319968 m!328439))

(declare-fun m!328441 () Bool)

(assert (=> b!319971 m!328441))

(declare-fun m!328443 () Bool)

(assert (=> b!319970 m!328443))

(declare-fun m!328445 () Bool)

(assert (=> b!319969 m!328445))

(declare-fun m!328447 () Bool)

(assert (=> start!32072 m!328447))

(declare-fun m!328449 () Bool)

(assert (=> start!32072 m!328449))

(push 1)

(assert (not b!319971))

(assert (not b!319968))

(assert (not b!319973))

(assert (not b!319970))

(assert (not start!32072))

(assert (not b!319969))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69399 () Bool)

(assert (=> d!69399 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319969 d!69399))

(declare-fun b!320006 () Bool)

(declare-fun e!198657 () Bool)

(declare-fun e!198658 () Bool)

(assert (=> b!320006 (= e!198657 e!198658)))

(declare-fun c!50472 () Bool)

(assert (=> b!320006 (= c!50472 (validKeyInArray!0 (select (arr!7735 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!320007 () Bool)

(declare-fun call!26050 () Bool)

(assert (=> b!320007 (= e!198658 call!26050)))

(declare-fun b!320008 () Bool)

(declare-fun e!198656 () Bool)

(assert (=> b!320008 (= e!198658 e!198656)))

(declare-fun lt!155925 () (_ BitVec 64))

(assert (=> b!320008 (= lt!155925 (select (arr!7735 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9820 0))(
  ( (Unit!9821) )
))
(declare-fun lt!155926 () Unit!9820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16346 (_ BitVec 64) (_ BitVec 32)) Unit!9820)

(assert (=> b!320008 (= lt!155926 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155925 #b00000000000000000000000000000000))))

(assert (=> b!320008 (arrayContainsKey!0 a!3305 lt!155925 #b00000000000000000000000000000000)))

(declare-fun lt!155924 () Unit!9820)

(assert (=> b!320008 (= lt!155924 lt!155926)))

(declare-fun res!174310 () Bool)

(assert (=> b!320008 (= res!174310 (= (seekEntryOrOpen!0 (select (arr!7735 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2866 #b00000000000000000000000000000000)))))

(assert (=> b!320008 (=> (not res!174310) (not e!198656))))

(declare-fun d!69401 () Bool)

(declare-fun res!174309 () Bool)

(assert (=> d!69401 (=> res!174309 e!198657)))

(assert (=> d!69401 (= res!174309 (bvsge #b00000000000000000000000000000000 (size!8087 a!3305)))))

(assert (=> d!69401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198657)))

(declare-fun bm!26047 () Bool)

(assert (=> bm!26047 (= call!26050 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!320009 () Bool)

(assert (=> b!320009 (= e!198656 call!26050)))

(assert (= (and d!69401 (not res!174309)) b!320006))

(assert (= (and b!320006 c!50472) b!320008))

(assert (= (and b!320006 (not c!50472)) b!320007))

(assert (= (and b!320008 res!174310) b!320009))

(assert (= (or b!320009 b!320007) bm!26047))

(declare-fun m!328469 () Bool)

(assert (=> b!320006 m!328469))

(assert (=> b!320006 m!328469))

(declare-fun m!328471 () Bool)

(assert (=> b!320006 m!328471))

(assert (=> b!320008 m!328469))

(declare-fun m!328473 () Bool)

(assert (=> b!320008 m!328473))

(declare-fun m!328475 () Bool)

(assert (=> b!320008 m!328475))

(assert (=> b!320008 m!328469))

(declare-fun m!328477 () Bool)

(assert (=> b!320008 m!328477))

(declare-fun m!328479 () Bool)

(assert (=> bm!26047 m!328479))

(assert (=> b!319970 d!69401))

(declare-fun b!320052 () Bool)

(declare-fun e!198682 () SeekEntryResult!2866)

(declare-fun e!198680 () SeekEntryResult!2866)

(assert (=> b!320052 (= e!198682 e!198680)))

(declare-fun lt!155951 () (_ BitVec 64))

(declare-fun lt!155952 () SeekEntryResult!2866)

(assert (=> b!320052 (= lt!155951 (select (arr!7735 a!3305) (index!13642 lt!155952)))))

(declare-fun c!50496 () Bool)

(assert (=> b!320052 (= c!50496 (= lt!155951 k!2497))))

(declare-fun b!320053 () Bool)

(declare-fun c!50495 () Bool)

(assert (=> b!320053 (= c!50495 (= lt!155951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198681 () SeekEntryResult!2866)

(assert (=> b!320053 (= e!198680 e!198681)))

(declare-fun b!320054 () Bool)

(assert (=> b!320054 (= e!198682 Undefined!2866)))

(declare-fun b!320055 () Bool)

(assert (=> b!320055 (= e!198681 (MissingZero!2866 (index!13642 lt!155952)))))

(declare-fun b!320056 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16346 (_ BitVec 32)) SeekEntryResult!2866)

(assert (=> b!320056 (= e!198681 (seekKeyOrZeroReturnVacant!0 (x!31908 lt!155952) (index!13642 lt!155952) (index!13642 lt!155952) k!2497 a!3305 mask!3777))))

(declare-fun b!320057 () Bool)

(assert (=> b!320057 (= e!198680 (Found!2866 (index!13642 lt!155952)))))

(declare-fun d!69409 () Bool)

(declare-fun lt!155950 () SeekEntryResult!2866)

(assert (=> d!69409 (and (or (is-Undefined!2866 lt!155950) (not (is-Found!2866 lt!155950)) (and (bvsge (index!13641 lt!155950) #b00000000000000000000000000000000) (bvslt (index!13641 lt!155950) (size!8087 a!3305)))) (or (is-Undefined!2866 lt!155950) (is-Found!2866 lt!155950) (not (is-MissingZero!2866 lt!155950)) (and (bvsge (index!13640 lt!155950) #b00000000000000000000000000000000) (bvslt (index!13640 lt!155950) (size!8087 a!3305)))) (or (is-Undefined!2866 lt!155950) (is-Found!2866 lt!155950) (is-MissingZero!2866 lt!155950) (not (is-MissingVacant!2866 lt!155950)) (and (bvsge (index!13643 lt!155950) #b00000000000000000000000000000000) (bvslt (index!13643 lt!155950) (size!8087 a!3305)))) (or (is-Undefined!2866 lt!155950) (ite (is-Found!2866 lt!155950) (= (select (arr!7735 a!3305) (index!13641 lt!155950)) k!2497) (ite (is-MissingZero!2866 lt!155950) (= (select (arr!7735 a!3305) (index!13640 lt!155950)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2866 lt!155950) (= (select (arr!7735 a!3305) (index!13643 lt!155950)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69409 (= lt!155950 e!198682)))

(declare-fun c!50494 () Bool)

(assert (=> d!69409 (= c!50494 (and (is-Intermediate!2866 lt!155952) (undefined!3678 lt!155952)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16346 (_ BitVec 32)) SeekEntryResult!2866)

(assert (=> d!69409 (= lt!155952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69409 (validMask!0 mask!3777)))

(assert (=> d!69409 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!155950)))

(assert (= (and d!69409 c!50494) b!320054))

(assert (= (and d!69409 (not c!50494)) b!320052))

(assert (= (and b!320052 c!50496) b!320057))

(assert (= (and b!320052 (not c!50496)) b!320053))

(assert (= (and b!320053 c!50495) b!320055))

(assert (= (and b!320053 (not c!50495)) b!320056))

(declare-fun m!328493 () Bool)

(assert (=> b!320052 m!328493))

(declare-fun m!328495 () Bool)

(assert (=> b!320056 m!328495))

(declare-fun m!328497 () Bool)

(assert (=> d!69409 m!328497))

(assert (=> d!69409 m!328437))

(declare-fun m!328499 () Bool)

(assert (=> d!69409 m!328499))

(declare-fun m!328501 () Bool)

(assert (=> d!69409 m!328501))

(declare-fun m!328503 () Bool)

(assert (=> d!69409 m!328503))

(assert (=> d!69409 m!328447))

(assert (=> d!69409 m!328437))

(assert (=> b!319971 d!69409))

(declare-fun d!69417 () Bool)

(assert (=> d!69417 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32072 d!69417))

(declare-fun d!69423 () Bool)

(assert (=> d!69423 (= (array_inv!5698 a!3305) (bvsge (size!8087 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32072 d!69423))

(declare-fun d!69427 () Bool)

(declare-fun lt!155976 () (_ BitVec 32))

(declare-fun lt!155975 () (_ BitVec 32))

(assert (=> d!69427 (= lt!155976 (bvmul (bvxor lt!155975 (bvlshr lt!155975 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69427 (= lt!155975 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69427 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174316 (let ((h!5384 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31911 (bvmul (bvxor h!5384 (bvlshr h!5384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31911 (bvlshr x!31911 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174316 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174316 #b00000000000000000000000000000000))))))

(assert (=> d!69427 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!155976 (bvlshr lt!155976 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!319973 d!69427))

(declare-fun d!69429 () Bool)

(declare-fun res!174323 () Bool)

(declare-fun e!198699 () Bool)

(assert (=> d!69429 (=> res!174323 e!198699)))

(assert (=> d!69429 (= res!174323 (= (select (arr!7735 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69429 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!198699)))

(declare-fun b!320080 () Bool)

(declare-fun e!198700 () Bool)

(assert (=> b!320080 (= e!198699 e!198700)))

(declare-fun res!174324 () Bool)

(assert (=> b!320080 (=> (not res!174324) (not e!198700))))

(assert (=> b!320080 (= res!174324 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8087 a!3305)))))

(declare-fun b!320081 () Bool)

(assert (=> b!320081 (= e!198700 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69429 (not res!174323)) b!320080))

(assert (= (and b!320080 res!174324) b!320081))

(assert (=> d!69429 m!328469))

(declare-fun m!328527 () Bool)

(assert (=> b!320081 m!328527))

(assert (=> b!319968 d!69429))

(push 1)

