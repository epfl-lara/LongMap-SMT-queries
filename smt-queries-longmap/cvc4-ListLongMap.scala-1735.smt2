; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31866 () Bool)

(assert start!31866)

(declare-fun res!173212 () Bool)

(declare-fun e!197963 () Bool)

(assert (=> start!31866 (=> (not res!173212) (not e!197963))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31866 (= res!173212 (validMask!0 mask!3709))))

(assert (=> start!31866 e!197963))

(declare-datatypes ((array!16237 0))(
  ( (array!16238 (arr!7684 (Array (_ BitVec 32) (_ BitVec 64))) (size!8036 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16237)

(declare-fun array_inv!5647 (array!16237) Bool)

(assert (=> start!31866 (array_inv!5647 a!3293)))

(assert (=> start!31866 true))

(declare-fun lt!155429 () (_ BitVec 32))

(declare-fun b!318632 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun e!197964 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!318632 (= e!197964 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (and (bvsge lt!155429 #b00000000000000000000000000000000) (bvslt lt!155429 (size!8036 a!3293))))))))

(declare-fun e!197962 () Bool)

(assert (=> b!318632 e!197962))

(declare-fun res!173214 () Bool)

(assert (=> b!318632 (=> (not res!173214) (not e!197962))))

(declare-datatypes ((SeekEntryResult!2824 0))(
  ( (MissingZero!2824 (index!13472 (_ BitVec 32))) (Found!2824 (index!13473 (_ BitVec 32))) (Intermediate!2824 (undefined!3636 Bool) (index!13474 (_ BitVec 32)) (x!31721 (_ BitVec 32))) (Undefined!2824) (MissingVacant!2824 (index!13475 (_ BitVec 32))) )
))
(declare-fun lt!155430 () SeekEntryResult!2824)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16237 (_ BitVec 32)) SeekEntryResult!2824)

(assert (=> b!318632 (= res!173214 (= lt!155430 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155429 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318632 (= lt!155429 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318633 () Bool)

(declare-fun res!173211 () Bool)

(assert (=> b!318633 (=> (not res!173211) (not e!197963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16237 (_ BitVec 32)) Bool)

(assert (=> b!318633 (= res!173211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318634 () Bool)

(declare-fun res!173217 () Bool)

(assert (=> b!318634 (=> (not res!173217) (not e!197963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318634 (= res!173217 (validKeyInArray!0 k!2441))))

(declare-fun b!318635 () Bool)

(declare-fun e!197961 () Bool)

(assert (=> b!318635 (= e!197963 e!197961)))

(declare-fun res!173213 () Bool)

(assert (=> b!318635 (=> (not res!173213) (not e!197961))))

(declare-fun lt!155427 () SeekEntryResult!2824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318635 (= res!173213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155427))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318635 (= lt!155427 (Intermediate!2824 false resIndex!52 resX!52))))

(declare-fun b!318636 () Bool)

(declare-fun lt!155428 () array!16237)

(assert (=> b!318636 (= e!197962 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155428 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155429 k!2441 lt!155428 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318636 (= lt!155428 (array!16238 (store (arr!7684 a!3293) i!1240 k!2441) (size!8036 a!3293)))))

(declare-fun b!318637 () Bool)

(declare-fun res!173216 () Bool)

(assert (=> b!318637 (=> (not res!173216) (not e!197963))))

(declare-fun arrayContainsKey!0 (array!16237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318637 (= res!173216 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318638 () Bool)

(declare-fun res!173218 () Bool)

(assert (=> b!318638 (=> (not res!173218) (not e!197961))))

(assert (=> b!318638 (= res!173218 (and (= (select (arr!7684 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8036 a!3293))))))

(declare-fun b!318639 () Bool)

(declare-fun res!173219 () Bool)

(assert (=> b!318639 (=> (not res!173219) (not e!197963))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16237 (_ BitVec 32)) SeekEntryResult!2824)

(assert (=> b!318639 (= res!173219 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2824 i!1240)))))

(declare-fun b!318640 () Bool)

(declare-fun res!173220 () Bool)

(assert (=> b!318640 (=> (not res!173220) (not e!197963))))

(assert (=> b!318640 (= res!173220 (and (= (size!8036 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8036 a!3293))))))

(declare-fun b!318641 () Bool)

(assert (=> b!318641 (= e!197961 e!197964)))

(declare-fun res!173215 () Bool)

(assert (=> b!318641 (=> (not res!173215) (not e!197964))))

(assert (=> b!318641 (= res!173215 (and (= lt!155430 lt!155427) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7684 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318641 (= lt!155430 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31866 res!173212) b!318640))

(assert (= (and b!318640 res!173220) b!318634))

(assert (= (and b!318634 res!173217) b!318637))

(assert (= (and b!318637 res!173216) b!318639))

(assert (= (and b!318639 res!173219) b!318633))

(assert (= (and b!318633 res!173211) b!318635))

(assert (= (and b!318635 res!173213) b!318638))

(assert (= (and b!318638 res!173218) b!318641))

(assert (= (and b!318641 res!173215) b!318632))

(assert (= (and b!318632 res!173214) b!318636))

(declare-fun m!327345 () Bool)

(assert (=> b!318638 m!327345))

(declare-fun m!327347 () Bool)

(assert (=> b!318639 m!327347))

(declare-fun m!327349 () Bool)

(assert (=> b!318641 m!327349))

(declare-fun m!327351 () Bool)

(assert (=> b!318641 m!327351))

(declare-fun m!327353 () Bool)

(assert (=> b!318632 m!327353))

(declare-fun m!327355 () Bool)

(assert (=> b!318632 m!327355))

(declare-fun m!327357 () Bool)

(assert (=> b!318636 m!327357))

(declare-fun m!327359 () Bool)

(assert (=> b!318636 m!327359))

(declare-fun m!327361 () Bool)

(assert (=> b!318636 m!327361))

(declare-fun m!327363 () Bool)

(assert (=> b!318634 m!327363))

(declare-fun m!327365 () Bool)

(assert (=> start!31866 m!327365))

(declare-fun m!327367 () Bool)

(assert (=> start!31866 m!327367))

(declare-fun m!327369 () Bool)

(assert (=> b!318633 m!327369))

(declare-fun m!327371 () Bool)

(assert (=> b!318637 m!327371))

(declare-fun m!327373 () Bool)

(assert (=> b!318635 m!327373))

(assert (=> b!318635 m!327373))

(declare-fun m!327375 () Bool)

(assert (=> b!318635 m!327375))

(push 1)

(assert (not b!318635))

(assert (not b!318632))

(assert (not b!318636))

(assert (not b!318633))

(assert (not b!318634))

(assert (not b!318641))

(assert (not start!31866))

(assert (not b!318637))

(assert (not b!318639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!318698 () Bool)

(declare-fun e!198006 () SeekEntryResult!2824)

(assert (=> b!318698 (= e!198006 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!155429 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!318699 () Bool)

(declare-fun e!198002 () SeekEntryResult!2824)

(assert (=> b!318699 (= e!198002 e!198006)))

(declare-fun c!50349 () Bool)

(declare-fun lt!155444 () (_ BitVec 64))

(assert (=> b!318699 (= c!50349 (or (= lt!155444 k!2441) (= (bvadd lt!155444 lt!155444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318700 () Bool)

(declare-fun lt!155443 () SeekEntryResult!2824)

(assert (=> b!318700 (and (bvsge (index!13474 lt!155443) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155443) (size!8036 a!3293)))))

(declare-fun res!173246 () Bool)

(assert (=> b!318700 (= res!173246 (= (select (arr!7684 a!3293) (index!13474 lt!155443)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198005 () Bool)

(assert (=> b!318700 (=> res!173246 e!198005)))

(declare-fun b!318701 () Bool)

(assert (=> b!318701 (= e!198002 (Intermediate!2824 true lt!155429 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318702 () Bool)

(declare-fun e!198003 () Bool)

(assert (=> b!318702 (= e!198003 (bvsge (x!31721 lt!155443) #b01111111111111111111111111111110))))

(declare-fun d!69235 () Bool)

(assert (=> d!69235 e!198003))

(declare-fun c!50348 () Bool)

(assert (=> d!69235 (= c!50348 (and (is-Intermediate!2824 lt!155443) (undefined!3636 lt!155443)))))

(assert (=> d!69235 (= lt!155443 e!198002)))

(declare-fun c!50350 () Bool)

(assert (=> d!69235 (= c!50350 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!69235 (= lt!155444 (select (arr!7684 a!3293) lt!155429))))

(assert (=> d!69235 (validMask!0 mask!3709)))

(assert (=> d!69235 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155429 k!2441 a!3293 mask!3709) lt!155443)))

(declare-fun b!318703 () Bool)

(assert (=> b!318703 (and (bvsge (index!13474 lt!155443) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155443) (size!8036 a!3293)))))

(declare-fun res!173245 () Bool)

(assert (=> b!318703 (= res!173245 (= (select (arr!7684 a!3293) (index!13474 lt!155443)) k!2441))))

(assert (=> b!318703 (=> res!173245 e!198005)))

(declare-fun e!198004 () Bool)

(assert (=> b!318703 (= e!198004 e!198005)))

(declare-fun b!318704 () Bool)

(assert (=> b!318704 (and (bvsge (index!13474 lt!155443) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155443) (size!8036 a!3293)))))

(assert (=> b!318704 (= e!198005 (= (select (arr!7684 a!3293) (index!13474 lt!155443)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318705 () Bool)

(assert (=> b!318705 (= e!198006 (Intermediate!2824 false lt!155429 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318706 () Bool)

(assert (=> b!318706 (= e!198003 e!198004)))

(declare-fun res!173247 () Bool)

(assert (=> b!318706 (= res!173247 (and (is-Intermediate!2824 lt!155443) (not (undefined!3636 lt!155443)) (bvslt (x!31721 lt!155443) #b01111111111111111111111111111110) (bvsge (x!31721 lt!155443) #b00000000000000000000000000000000) (bvsge (x!31721 lt!155443) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!318706 (=> (not res!173247) (not e!198004))))

(assert (= (and d!69235 c!50350) b!318701))

(assert (= (and d!69235 (not c!50350)) b!318699))

(assert (= (and b!318699 c!50349) b!318705))

(assert (= (and b!318699 (not c!50349)) b!318698))

(assert (= (and d!69235 c!50348) b!318702))

(assert (= (and d!69235 (not c!50348)) b!318706))

(assert (= (and b!318706 res!173247) b!318703))

(assert (= (and b!318703 (not res!173245)) b!318700))

(assert (= (and b!318700 (not res!173246)) b!318704))

(declare-fun m!327385 () Bool)

(assert (=> d!69235 m!327385))

(assert (=> d!69235 m!327365))

(declare-fun m!327387 () Bool)

(assert (=> b!318700 m!327387))

(assert (=> b!318703 m!327387))

(assert (=> b!318704 m!327387))

(declare-fun m!327389 () Bool)

(assert (=> b!318698 m!327389))

(assert (=> b!318698 m!327389))

(declare-fun m!327391 () Bool)

(assert (=> b!318698 m!327391))

(assert (=> b!318632 d!69235))

(declare-fun d!69243 () Bool)

(declare-fun lt!155449 () (_ BitVec 32))

(assert (=> d!69243 (and (bvsge lt!155449 #b00000000000000000000000000000000) (bvslt lt!155449 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69243 (= lt!155449 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69243 (validMask!0 mask!3709)))

(assert (=> d!69243 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!155449)))

(declare-fun bs!11108 () Bool)

(assert (= bs!11108 d!69243))

(declare-fun m!327401 () Bool)

(assert (=> bs!11108 m!327401))

(assert (=> bs!11108 m!327365))

(assert (=> b!318632 d!69243))

(declare-fun d!69247 () Bool)

(declare-fun res!173264 () Bool)

(declare-fun e!198027 () Bool)

(assert (=> d!69247 (=> res!173264 e!198027)))

(assert (=> d!69247 (= res!173264 (= (select (arr!7684 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!69247 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!198027)))

(declare-fun b!318739 () Bool)

(declare-fun e!198028 () Bool)

(assert (=> b!318739 (= e!198027 e!198028)))

(declare-fun res!173265 () Bool)

(assert (=> b!318739 (=> (not res!173265) (not e!198028))))

(assert (=> b!318739 (= res!173265 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8036 a!3293)))))

(declare-fun b!318740 () Bool)

(assert (=> b!318740 (= e!198028 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69247 (not res!173264)) b!318739))

(assert (= (and b!318739 res!173265) b!318740))

(declare-fun m!327405 () Bool)

(assert (=> d!69247 m!327405))

(declare-fun m!327407 () Bool)

(assert (=> b!318740 m!327407))

(assert (=> b!318637 d!69247))

(declare-fun b!318758 () Bool)

(declare-fun e!198041 () Bool)

(declare-fun e!198040 () Bool)

(assert (=> b!318758 (= e!198041 e!198040)))

(declare-fun c!50364 () Bool)

(assert (=> b!318758 (= c!50364 (validKeyInArray!0 (select (arr!7684 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!26026 () Bool)

(declare-fun call!26029 () Bool)

(assert (=> bm!26026 (= call!26029 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!318759 () Bool)

(assert (=> b!318759 (= e!198040 call!26029)))

(declare-fun b!318760 () Bool)

(declare-fun e!198042 () Bool)

(assert (=> b!318760 (= e!198040 e!198042)))

(declare-fun lt!155466 () (_ BitVec 64))

(assert (=> b!318760 (= lt!155466 (select (arr!7684 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9794 0))(
  ( (Unit!9795) )
))
(declare-fun lt!155467 () Unit!9794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16237 (_ BitVec 64) (_ BitVec 32)) Unit!9794)

(assert (=> b!318760 (= lt!155467 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!155466 #b00000000000000000000000000000000))))

(assert (=> b!318760 (arrayContainsKey!0 a!3293 lt!155466 #b00000000000000000000000000000000)))

(declare-fun lt!155468 () Unit!9794)

(assert (=> b!318760 (= lt!155468 lt!155467)))

(declare-fun res!173273 () Bool)

(assert (=> b!318760 (= res!173273 (= (seekEntryOrOpen!0 (select (arr!7684 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2824 #b00000000000000000000000000000000)))))

(assert (=> b!318760 (=> (not res!173273) (not e!198042))))

(declare-fun d!69251 () Bool)

(declare-fun res!173274 () Bool)

(assert (=> d!69251 (=> res!173274 e!198041)))

(assert (=> d!69251 (= res!173274 (bvsge #b00000000000000000000000000000000 (size!8036 a!3293)))))

(assert (=> d!69251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!198041)))

(declare-fun b!318761 () Bool)

(assert (=> b!318761 (= e!198042 call!26029)))

(assert (= (and d!69251 (not res!173274)) b!318758))

(assert (= (and b!318758 c!50364) b!318760))

(assert (= (and b!318758 (not c!50364)) b!318759))

(assert (= (and b!318760 res!173273) b!318761))

(assert (= (or b!318761 b!318759) bm!26026))

(assert (=> b!318758 m!327405))

(assert (=> b!318758 m!327405))

(declare-fun m!327423 () Bool)

(assert (=> b!318758 m!327423))

(declare-fun m!327425 () Bool)

(assert (=> bm!26026 m!327425))

(assert (=> b!318760 m!327405))

(declare-fun m!327427 () Bool)

(assert (=> b!318760 m!327427))

(declare-fun m!327429 () Bool)

(assert (=> b!318760 m!327429))

(assert (=> b!318760 m!327405))

(declare-fun m!327431 () Bool)

(assert (=> b!318760 m!327431))

(assert (=> b!318633 d!69251))

(declare-fun d!69265 () Bool)

(assert (=> d!69265 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31866 d!69265))

(declare-fun d!69277 () Bool)

(assert (=> d!69277 (= (array_inv!5647 a!3293) (bvsge (size!8036 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31866 d!69277))

(declare-fun d!69279 () Bool)

(assert (=> d!69279 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!318634 d!69279))

(declare-fun b!318864 () Bool)

(declare-fun e!198105 () SeekEntryResult!2824)

(assert (=> b!318864 (= e!198105 Undefined!2824)))

(declare-fun d!69281 () Bool)

(declare-fun lt!155519 () SeekEntryResult!2824)

(assert (=> d!69281 (and (or (is-Undefined!2824 lt!155519) (not (is-Found!2824 lt!155519)) (and (bvsge (index!13473 lt!155519) #b00000000000000000000000000000000) (bvslt (index!13473 lt!155519) (size!8036 a!3293)))) (or (is-Undefined!2824 lt!155519) (is-Found!2824 lt!155519) (not (is-MissingZero!2824 lt!155519)) (and (bvsge (index!13472 lt!155519) #b00000000000000000000000000000000) (bvslt (index!13472 lt!155519) (size!8036 a!3293)))) (or (is-Undefined!2824 lt!155519) (is-Found!2824 lt!155519) (is-MissingZero!2824 lt!155519) (not (is-MissingVacant!2824 lt!155519)) (and (bvsge (index!13475 lt!155519) #b00000000000000000000000000000000) (bvslt (index!13475 lt!155519) (size!8036 a!3293)))) (or (is-Undefined!2824 lt!155519) (ite (is-Found!2824 lt!155519) (= (select (arr!7684 a!3293) (index!13473 lt!155519)) k!2441) (ite (is-MissingZero!2824 lt!155519) (= (select (arr!7684 a!3293) (index!13472 lt!155519)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2824 lt!155519) (= (select (arr!7684 a!3293) (index!13475 lt!155519)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69281 (= lt!155519 e!198105)))

(declare-fun c!50401 () Bool)

(declare-fun lt!155517 () SeekEntryResult!2824)

(assert (=> d!69281 (= c!50401 (and (is-Intermediate!2824 lt!155517) (undefined!3636 lt!155517)))))

(assert (=> d!69281 (= lt!155517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!69281 (validMask!0 mask!3709)))

(assert (=> d!69281 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!155519)))

(declare-fun b!318865 () Bool)

(declare-fun e!198104 () SeekEntryResult!2824)

(assert (=> b!318865 (= e!198104 (MissingZero!2824 (index!13474 lt!155517)))))

(declare-fun b!318866 () Bool)

(declare-fun c!50402 () Bool)

(declare-fun lt!155518 () (_ BitVec 64))

(assert (=> b!318866 (= c!50402 (= lt!155518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198103 () SeekEntryResult!2824)

(assert (=> b!318866 (= e!198103 e!198104)))

(declare-fun b!318867 () Bool)

(assert (=> b!318867 (= e!198105 e!198103)))

(assert (=> b!318867 (= lt!155518 (select (arr!7684 a!3293) (index!13474 lt!155517)))))

(declare-fun c!50403 () Bool)

(assert (=> b!318867 (= c!50403 (= lt!155518 k!2441))))

(declare-fun b!318868 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16237 (_ BitVec 32)) SeekEntryResult!2824)

(assert (=> b!318868 (= e!198104 (seekKeyOrZeroReturnVacant!0 (x!31721 lt!155517) (index!13474 lt!155517) (index!13474 lt!155517) k!2441 a!3293 mask!3709))))

(declare-fun b!318869 () Bool)

(assert (=> b!318869 (= e!198103 (Found!2824 (index!13474 lt!155517)))))

(assert (= (and d!69281 c!50401) b!318864))

(assert (= (and d!69281 (not c!50401)) b!318867))

(assert (= (and b!318867 c!50403) b!318869))

(assert (= (and b!318867 (not c!50403)) b!318866))

(assert (= (and b!318866 c!50402) b!318865))

(assert (= (and b!318866 (not c!50402)) b!318868))

(assert (=> d!69281 m!327373))

(assert (=> d!69281 m!327375))

(assert (=> d!69281 m!327373))

(declare-fun m!327489 () Bool)

(assert (=> d!69281 m!327489))

(declare-fun m!327491 () Bool)

(assert (=> d!69281 m!327491))

(declare-fun m!327493 () Bool)

(assert (=> d!69281 m!327493))

(assert (=> d!69281 m!327365))

(declare-fun m!327495 () Bool)

(assert (=> b!318867 m!327495))

(declare-fun m!327497 () Bool)

(assert (=> b!318868 m!327497))

(assert (=> b!318639 d!69281))

(declare-fun e!198110 () SeekEntryResult!2824)

(declare-fun b!318870 () Bool)

(assert (=> b!318870 (= e!198110 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!318871 () Bool)

(declare-fun e!198106 () SeekEntryResult!2824)

(assert (=> b!318871 (= e!198106 e!198110)))

(declare-fun c!50405 () Bool)

(declare-fun lt!155521 () (_ BitVec 64))

(assert (=> b!318871 (= c!50405 (or (= lt!155521 k!2441) (= (bvadd lt!155521 lt!155521) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318872 () Bool)

(declare-fun lt!155520 () SeekEntryResult!2824)

(assert (=> b!318872 (and (bvsge (index!13474 lt!155520) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155520) (size!8036 a!3293)))))

(declare-fun res!173307 () Bool)

(assert (=> b!318872 (= res!173307 (= (select (arr!7684 a!3293) (index!13474 lt!155520)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198109 () Bool)

(assert (=> b!318872 (=> res!173307 e!198109)))

(declare-fun b!318873 () Bool)

(assert (=> b!318873 (= e!198106 (Intermediate!2824 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!318874 () Bool)

(declare-fun e!198107 () Bool)

(assert (=> b!318874 (= e!198107 (bvsge (x!31721 lt!155520) #b01111111111111111111111111111110))))

(declare-fun d!69291 () Bool)

(assert (=> d!69291 e!198107))

(declare-fun c!50404 () Bool)

(assert (=> d!69291 (= c!50404 (and (is-Intermediate!2824 lt!155520) (undefined!3636 lt!155520)))))

(assert (=> d!69291 (= lt!155520 e!198106)))

(declare-fun c!50406 () Bool)

(assert (=> d!69291 (= c!50406 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69291 (= lt!155521 (select (arr!7684 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!69291 (validMask!0 mask!3709)))

(assert (=> d!69291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155520)))

(declare-fun b!318875 () Bool)

(assert (=> b!318875 (and (bvsge (index!13474 lt!155520) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155520) (size!8036 a!3293)))))

(declare-fun res!173306 () Bool)

(assert (=> b!318875 (= res!173306 (= (select (arr!7684 a!3293) (index!13474 lt!155520)) k!2441))))

(assert (=> b!318875 (=> res!173306 e!198109)))

(declare-fun e!198108 () Bool)

(assert (=> b!318875 (= e!198108 e!198109)))

(declare-fun b!318876 () Bool)

(assert (=> b!318876 (and (bvsge (index!13474 lt!155520) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155520) (size!8036 a!3293)))))

(assert (=> b!318876 (= e!198109 (= (select (arr!7684 a!3293) (index!13474 lt!155520)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318877 () Bool)

(assert (=> b!318877 (= e!198110 (Intermediate!2824 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!318878 () Bool)

(assert (=> b!318878 (= e!198107 e!198108)))

(declare-fun res!173308 () Bool)

(assert (=> b!318878 (= res!173308 (and (is-Intermediate!2824 lt!155520) (not (undefined!3636 lt!155520)) (bvslt (x!31721 lt!155520) #b01111111111111111111111111111110) (bvsge (x!31721 lt!155520) #b00000000000000000000000000000000) (bvsge (x!31721 lt!155520) #b00000000000000000000000000000000)))))

(assert (=> b!318878 (=> (not res!173308) (not e!198108))))

(assert (= (and d!69291 c!50406) b!318873))

(assert (= (and d!69291 (not c!50406)) b!318871))

(assert (= (and b!318871 c!50405) b!318877))

(assert (= (and b!318871 (not c!50405)) b!318870))

(assert (= (and d!69291 c!50404) b!318874))

(assert (= (and d!69291 (not c!50404)) b!318878))

(assert (= (and b!318878 res!173308) b!318875))

(assert (= (and b!318875 (not res!173306)) b!318872))

(assert (= (and b!318872 (not res!173307)) b!318876))

(assert (=> d!69291 m!327373))

(declare-fun m!327499 () Bool)

(assert (=> d!69291 m!327499))

(assert (=> d!69291 m!327365))

(declare-fun m!327501 () Bool)

(assert (=> b!318872 m!327501))

(assert (=> b!318875 m!327501))

(assert (=> b!318876 m!327501))

(assert (=> b!318870 m!327373))

(declare-fun m!327503 () Bool)

(assert (=> b!318870 m!327503))

(assert (=> b!318870 m!327503))

(declare-fun m!327505 () Bool)

(assert (=> b!318870 m!327505))

(assert (=> b!318635 d!69291))

(declare-fun d!69293 () Bool)

(declare-fun lt!155541 () (_ BitVec 32))

(declare-fun lt!155540 () (_ BitVec 32))

(assert (=> d!69293 (= lt!155541 (bvmul (bvxor lt!155540 (bvlshr lt!155540 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69293 (= lt!155540 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69293 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!173309 (let ((h!5380 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31729 (bvmul (bvxor h!5380 (bvlshr h!5380 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31729 (bvlshr x!31729 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!173309 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!173309 #b00000000000000000000000000000000))))))

(assert (=> d!69293 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!155541 (bvlshr lt!155541 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!318635 d!69293))

(declare-fun b!318912 () Bool)

(declare-fun e!198132 () SeekEntryResult!2824)

(assert (=> b!318912 (= e!198132 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 lt!155428 mask!3709))))

(declare-fun b!318913 () Bool)

(declare-fun e!198128 () SeekEntryResult!2824)

(assert (=> b!318913 (= e!198128 e!198132)))

(declare-fun c!50423 () Bool)

(declare-fun lt!155543 () (_ BitVec 64))

(assert (=> b!318913 (= c!50423 (or (= lt!155543 k!2441) (= (bvadd lt!155543 lt!155543) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318914 () Bool)

(declare-fun lt!155542 () SeekEntryResult!2824)

(assert (=> b!318914 (and (bvsge (index!13474 lt!155542) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155542) (size!8036 lt!155428)))))

(declare-fun res!173315 () Bool)

(assert (=> b!318914 (= res!173315 (= (select (arr!7684 lt!155428) (index!13474 lt!155542)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198131 () Bool)

(assert (=> b!318914 (=> res!173315 e!198131)))

(declare-fun b!318915 () Bool)

(assert (=> b!318915 (= e!198128 (Intermediate!2824 true index!1781 x!1427))))

(declare-fun b!318916 () Bool)

(declare-fun e!198129 () Bool)

(assert (=> b!318916 (= e!198129 (bvsge (x!31721 lt!155542) #b01111111111111111111111111111110))))

(declare-fun d!69299 () Bool)

(assert (=> d!69299 e!198129))

(declare-fun c!50422 () Bool)

(assert (=> d!69299 (= c!50422 (and (is-Intermediate!2824 lt!155542) (undefined!3636 lt!155542)))))

(assert (=> d!69299 (= lt!155542 e!198128)))

(declare-fun c!50424 () Bool)

(assert (=> d!69299 (= c!50424 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!69299 (= lt!155543 (select (arr!7684 lt!155428) index!1781))))

(assert (=> d!69299 (validMask!0 mask!3709)))

(assert (=> d!69299 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155428 mask!3709) lt!155542)))

(declare-fun b!318917 () Bool)

(assert (=> b!318917 (and (bvsge (index!13474 lt!155542) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155542) (size!8036 lt!155428)))))

(declare-fun res!173314 () Bool)

(assert (=> b!318917 (= res!173314 (= (select (arr!7684 lt!155428) (index!13474 lt!155542)) k!2441))))

(assert (=> b!318917 (=> res!173314 e!198131)))

(declare-fun e!198130 () Bool)

(assert (=> b!318917 (= e!198130 e!198131)))

(declare-fun b!318918 () Bool)

(assert (=> b!318918 (and (bvsge (index!13474 lt!155542) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155542) (size!8036 lt!155428)))))

(assert (=> b!318918 (= e!198131 (= (select (arr!7684 lt!155428) (index!13474 lt!155542)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318919 () Bool)

(assert (=> b!318919 (= e!198132 (Intermediate!2824 false index!1781 x!1427))))

(declare-fun b!318920 () Bool)

(assert (=> b!318920 (= e!198129 e!198130)))

(declare-fun res!173316 () Bool)

(assert (=> b!318920 (= res!173316 (and (is-Intermediate!2824 lt!155542) (not (undefined!3636 lt!155542)) (bvslt (x!31721 lt!155542) #b01111111111111111111111111111110) (bvsge (x!31721 lt!155542) #b00000000000000000000000000000000) (bvsge (x!31721 lt!155542) x!1427)))))

(assert (=> b!318920 (=> (not res!173316) (not e!198130))))

(assert (= (and d!69299 c!50424) b!318915))

(assert (= (and d!69299 (not c!50424)) b!318913))

(assert (= (and b!318913 c!50423) b!318919))

(assert (= (and b!318913 (not c!50423)) b!318912))

(assert (= (and d!69299 c!50422) b!318916))

(assert (= (and d!69299 (not c!50422)) b!318920))

(assert (= (and b!318920 res!173316) b!318917))

(assert (= (and b!318917 (not res!173314)) b!318914))

(assert (= (and b!318914 (not res!173315)) b!318918))

(declare-fun m!327535 () Bool)

(assert (=> d!69299 m!327535))

(assert (=> d!69299 m!327365))

(declare-fun m!327537 () Bool)

(assert (=> b!318914 m!327537))

(assert (=> b!318917 m!327537))

(assert (=> b!318918 m!327537))

(assert (=> b!318912 m!327355))

(assert (=> b!318912 m!327355))

(declare-fun m!327539 () Bool)

(assert (=> b!318912 m!327539))

(assert (=> b!318636 d!69299))

(declare-fun e!198137 () SeekEntryResult!2824)

(declare-fun b!318921 () Bool)

(assert (=> b!318921 (= e!198137 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!155429 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 lt!155428 mask!3709))))

(declare-fun b!318922 () Bool)

(declare-fun e!198133 () SeekEntryResult!2824)

(assert (=> b!318922 (= e!198133 e!198137)))

(declare-fun c!50426 () Bool)

(declare-fun lt!155545 () (_ BitVec 64))

(assert (=> b!318922 (= c!50426 (or (= lt!155545 k!2441) (= (bvadd lt!155545 lt!155545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318923 () Bool)

(declare-fun lt!155544 () SeekEntryResult!2824)

(assert (=> b!318923 (and (bvsge (index!13474 lt!155544) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155544) (size!8036 lt!155428)))))

(declare-fun res!173318 () Bool)

(assert (=> b!318923 (= res!173318 (= (select (arr!7684 lt!155428) (index!13474 lt!155544)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198136 () Bool)

(assert (=> b!318923 (=> res!173318 e!198136)))

(declare-fun b!318924 () Bool)

(assert (=> b!318924 (= e!198133 (Intermediate!2824 true lt!155429 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318925 () Bool)

(declare-fun e!198134 () Bool)

(assert (=> b!318925 (= e!198134 (bvsge (x!31721 lt!155544) #b01111111111111111111111111111110))))

(declare-fun d!69301 () Bool)

(assert (=> d!69301 e!198134))

(declare-fun c!50425 () Bool)

(assert (=> d!69301 (= c!50425 (and (is-Intermediate!2824 lt!155544) (undefined!3636 lt!155544)))))

(assert (=> d!69301 (= lt!155544 e!198133)))

(declare-fun c!50427 () Bool)

(assert (=> d!69301 (= c!50427 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!69301 (= lt!155545 (select (arr!7684 lt!155428) lt!155429))))

(assert (=> d!69301 (validMask!0 mask!3709)))

(assert (=> d!69301 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155429 k!2441 lt!155428 mask!3709) lt!155544)))

(declare-fun b!318926 () Bool)

(assert (=> b!318926 (and (bvsge (index!13474 lt!155544) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155544) (size!8036 lt!155428)))))

(declare-fun res!173317 () Bool)

(assert (=> b!318926 (= res!173317 (= (select (arr!7684 lt!155428) (index!13474 lt!155544)) k!2441))))

(assert (=> b!318926 (=> res!173317 e!198136)))

(declare-fun e!198135 () Bool)

(assert (=> b!318926 (= e!198135 e!198136)))

(declare-fun b!318927 () Bool)

(assert (=> b!318927 (and (bvsge (index!13474 lt!155544) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155544) (size!8036 lt!155428)))))

(assert (=> b!318927 (= e!198136 (= (select (arr!7684 lt!155428) (index!13474 lt!155544)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318928 () Bool)

(assert (=> b!318928 (= e!198137 (Intermediate!2824 false lt!155429 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318929 () Bool)

(assert (=> b!318929 (= e!198134 e!198135)))

(declare-fun res!173319 () Bool)

(assert (=> b!318929 (= res!173319 (and (is-Intermediate!2824 lt!155544) (not (undefined!3636 lt!155544)) (bvslt (x!31721 lt!155544) #b01111111111111111111111111111110) (bvsge (x!31721 lt!155544) #b00000000000000000000000000000000) (bvsge (x!31721 lt!155544) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!318929 (=> (not res!173319) (not e!198135))))

(assert (= (and d!69301 c!50427) b!318924))

(assert (= (and d!69301 (not c!50427)) b!318922))

(assert (= (and b!318922 c!50426) b!318928))

(assert (= (and b!318922 (not c!50426)) b!318921))

(assert (= (and d!69301 c!50425) b!318925))

(assert (= (and d!69301 (not c!50425)) b!318929))

(assert (= (and b!318929 res!173319) b!318926))

(assert (= (and b!318926 (not res!173317)) b!318923))

(assert (= (and b!318923 (not res!173318)) b!318927))

(declare-fun m!327541 () Bool)

(assert (=> d!69301 m!327541))

(assert (=> d!69301 m!327365))

(declare-fun m!327543 () Bool)

(assert (=> b!318923 m!327543))

(assert (=> b!318926 m!327543))

(assert (=> b!318927 m!327543))

(assert (=> b!318921 m!327389))

(assert (=> b!318921 m!327389))

(declare-fun m!327545 () Bool)

(assert (=> b!318921 m!327545))

(assert (=> b!318636 d!69301))

(declare-fun e!198142 () SeekEntryResult!2824)

(declare-fun b!318930 () Bool)

(assert (=> b!318930 (= e!198142 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!318931 () Bool)

(declare-fun e!198138 () SeekEntryResult!2824)

(assert (=> b!318931 (= e!198138 e!198142)))

(declare-fun c!50429 () Bool)

(declare-fun lt!155547 () (_ BitVec 64))

(assert (=> b!318931 (= c!50429 (or (= lt!155547 k!2441) (= (bvadd lt!155547 lt!155547) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318932 () Bool)

(declare-fun lt!155546 () SeekEntryResult!2824)

(assert (=> b!318932 (and (bvsge (index!13474 lt!155546) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155546) (size!8036 a!3293)))))

(declare-fun res!173321 () Bool)

(assert (=> b!318932 (= res!173321 (= (select (arr!7684 a!3293) (index!13474 lt!155546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198141 () Bool)

(assert (=> b!318932 (=> res!173321 e!198141)))

(declare-fun b!318933 () Bool)

(assert (=> b!318933 (= e!198138 (Intermediate!2824 true index!1781 x!1427))))

(declare-fun b!318934 () Bool)

(declare-fun e!198139 () Bool)

(assert (=> b!318934 (= e!198139 (bvsge (x!31721 lt!155546) #b01111111111111111111111111111110))))

(declare-fun d!69303 () Bool)

(assert (=> d!69303 e!198139))

(declare-fun c!50428 () Bool)

(assert (=> d!69303 (= c!50428 (and (is-Intermediate!2824 lt!155546) (undefined!3636 lt!155546)))))

(assert (=> d!69303 (= lt!155546 e!198138)))

(declare-fun c!50430 () Bool)

(assert (=> d!69303 (= c!50430 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!69303 (= lt!155547 (select (arr!7684 a!3293) index!1781))))

(assert (=> d!69303 (validMask!0 mask!3709)))

(assert (=> d!69303 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!155546)))

(declare-fun b!318935 () Bool)

(assert (=> b!318935 (and (bvsge (index!13474 lt!155546) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155546) (size!8036 a!3293)))))

(declare-fun res!173320 () Bool)

(assert (=> b!318935 (= res!173320 (= (select (arr!7684 a!3293) (index!13474 lt!155546)) k!2441))))

(assert (=> b!318935 (=> res!173320 e!198141)))

(declare-fun e!198140 () Bool)

(assert (=> b!318935 (= e!198140 e!198141)))

(declare-fun b!318936 () Bool)

(assert (=> b!318936 (and (bvsge (index!13474 lt!155546) #b00000000000000000000000000000000) (bvslt (index!13474 lt!155546) (size!8036 a!3293)))))

(assert (=> b!318936 (= e!198141 (= (select (arr!7684 a!3293) (index!13474 lt!155546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318937 () Bool)

(assert (=> b!318937 (= e!198142 (Intermediate!2824 false index!1781 x!1427))))

(declare-fun b!318938 () Bool)

(assert (=> b!318938 (= e!198139 e!198140)))

(declare-fun res!173322 () Bool)

(assert (=> b!318938 (= res!173322 (and (is-Intermediate!2824 lt!155546) (not (undefined!3636 lt!155546)) (bvslt (x!31721 lt!155546) #b01111111111111111111111111111110) (bvsge (x!31721 lt!155546) #b00000000000000000000000000000000) (bvsge (x!31721 lt!155546) x!1427)))))

(assert (=> b!318938 (=> (not res!173322) (not e!198140))))

(assert (= (and d!69303 c!50430) b!318933))

(assert (= (and d!69303 (not c!50430)) b!318931))

(assert (= (and b!318931 c!50429) b!318937))

(assert (= (and b!318931 (not c!50429)) b!318930))

(assert (= (and d!69303 c!50428) b!318934))

(assert (= (and d!69303 (not c!50428)) b!318938))

(assert (= (and b!318938 res!173322) b!318935))

(assert (= (and b!318935 (not res!173320)) b!318932))

(assert (= (and b!318932 (not res!173321)) b!318936))

(assert (=> d!69303 m!327349))

(assert (=> d!69303 m!327365))

(declare-fun m!327547 () Bool)

(assert (=> b!318932 m!327547))

(assert (=> b!318935 m!327547))

(assert (=> b!318936 m!327547))

(assert (=> b!318930 m!327355))

(assert (=> b!318930 m!327355))

(declare-fun m!327549 () Bool)

(assert (=> b!318930 m!327549))

(assert (=> b!318641 d!69303))

(push 1)

(assert (not d!69291))

(assert (not b!318758))

(assert (not b!318760))

(assert (not d!69301))

(assert (not d!69243))

(assert (not b!318912))

(assert (not b!318698))

(assert (not d!69235))

(assert (not bm!26026))

(assert (not b!318740))

(assert (not d!69281))

(assert (not b!318930))

(assert (not d!69303))

(assert (not b!318921))

(assert (not b!318870))

(assert (not b!318868))

(assert (not d!69299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

