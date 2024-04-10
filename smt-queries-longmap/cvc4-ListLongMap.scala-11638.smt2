; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135832 () Bool)

(assert start!135832)

(declare-fun res!1076382 () Bool)

(declare-fun e!878594 () Bool)

(assert (=> start!135832 (=> (not res!1076382) (not e!878594))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135832 (= res!1076382 (validMask!0 mask!898))))

(assert (=> start!135832 e!878594))

(assert (=> start!135832 true))

(declare-datatypes ((array!105391 0))(
  ( (array!105392 (arr!50835 (Array (_ BitVec 32) (_ BitVec 64))) (size!51385 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105391)

(declare-fun array_inv!39562 (array!105391) Bool)

(assert (=> start!135832 (array_inv!39562 _keys!605)))

(declare-fun b!1575289 () Bool)

(declare-fun res!1076381 () Bool)

(assert (=> b!1575289 (=> (not res!1076381) (not e!878594))))

(assert (=> b!1575289 (= res!1076381 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51385 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575290 () Bool)

(declare-fun res!1076380 () Bool)

(assert (=> b!1575290 (=> (not res!1076380) (not e!878594))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575290 (= res!1076380 (validKeyInArray!0 k!761))))

(declare-fun b!1575291 () Bool)

(declare-datatypes ((SeekEntryResult!13700 0))(
  ( (MissingZero!13700 (index!57198 (_ BitVec 32))) (Found!13700 (index!57199 (_ BitVec 32))) (Intermediate!13700 (undefined!14512 Bool) (index!57200 (_ BitVec 32)) (x!142154 (_ BitVec 32))) (Undefined!13700) (MissingVacant!13700 (index!57201 (_ BitVec 32))) )
))
(declare-fun lt!675136 () SeekEntryResult!13700)

(assert (=> b!1575291 (= e!878594 (and (is-Intermediate!13700 lt!675136) (not (undefined!14512 lt!675136)) (= (select (arr!50835 _keys!605) (index!57200 lt!675136)) k!761) (or (bvslt (index!57200 lt!675136) #b00000000000000000000000000000000) (bvsge (index!57200 lt!675136) (size!51385 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105391 (_ BitVec 32)) SeekEntryResult!13700)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575291 (= lt!675136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135832 res!1076382) b!1575289))

(assert (= (and b!1575289 res!1076381) b!1575290))

(assert (= (and b!1575290 res!1076380) b!1575291))

(declare-fun m!1448353 () Bool)

(assert (=> start!135832 m!1448353))

(declare-fun m!1448355 () Bool)

(assert (=> start!135832 m!1448355))

(declare-fun m!1448357 () Bool)

(assert (=> b!1575290 m!1448357))

(declare-fun m!1448359 () Bool)

(assert (=> b!1575291 m!1448359))

(declare-fun m!1448361 () Bool)

(assert (=> b!1575291 m!1448361))

(assert (=> b!1575291 m!1448361))

(declare-fun m!1448363 () Bool)

(assert (=> b!1575291 m!1448363))

(push 1)

(assert (not b!1575290))

(assert (not start!135832))

(assert (not b!1575291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165409 () Bool)

(assert (=> d!165409 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575290 d!165409))

(declare-fun d!165411 () Bool)

(assert (=> d!165411 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135832 d!165411))

(declare-fun d!165417 () Bool)

(assert (=> d!165417 (= (array_inv!39562 _keys!605) (bvsge (size!51385 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135832 d!165417))

(declare-fun b!1575364 () Bool)

(declare-fun e!878639 () SeekEntryResult!13700)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575364 (= e!878639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575365 () Bool)

(declare-fun lt!675165 () SeekEntryResult!13700)

(assert (=> b!1575365 (and (bvsge (index!57200 lt!675165) #b00000000000000000000000000000000) (bvslt (index!57200 lt!675165) (size!51385 _keys!605)))))

(declare-fun e!878638 () Bool)

(assert (=> b!1575365 (= e!878638 (= (select (arr!50835 _keys!605) (index!57200 lt!675165)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575366 () Bool)

(declare-fun e!878636 () Bool)

(assert (=> b!1575366 (= e!878636 (bvsge (x!142154 lt!675165) #b01111111111111111111111111111110))))

(declare-fun d!165419 () Bool)

(assert (=> d!165419 e!878636))

(declare-fun c!145744 () Bool)

(assert (=> d!165419 (= c!145744 (and (is-Intermediate!13700 lt!675165) (undefined!14512 lt!675165)))))

(declare-fun e!878637 () SeekEntryResult!13700)

(assert (=> d!165419 (= lt!675165 e!878637)))

(declare-fun c!145746 () Bool)

(assert (=> d!165419 (= c!145746 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675166 () (_ BitVec 64))

(assert (=> d!165419 (= lt!675166 (select (arr!50835 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165419 (validMask!0 mask!898)))

(assert (=> d!165419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675165)))

(declare-fun b!1575367 () Bool)

(declare-fun e!878635 () Bool)

(assert (=> b!1575367 (= e!878636 e!878635)))

(declare-fun res!1076411 () Bool)

(assert (=> b!1575367 (= res!1076411 (and (is-Intermediate!13700 lt!675165) (not (undefined!14512 lt!675165)) (bvslt (x!142154 lt!675165) #b01111111111111111111111111111110) (bvsge (x!142154 lt!675165) #b00000000000000000000000000000000) (bvsge (x!142154 lt!675165) #b00000000000000000000000000000000)))))

(assert (=> b!1575367 (=> (not res!1076411) (not e!878635))))

(declare-fun b!1575368 () Bool)

(assert (=> b!1575368 (and (bvsge (index!57200 lt!675165) #b00000000000000000000000000000000) (bvslt (index!57200 lt!675165) (size!51385 _keys!605)))))

(declare-fun res!1076410 () Bool)

(assert (=> b!1575368 (= res!1076410 (= (select (arr!50835 _keys!605) (index!57200 lt!675165)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575368 (=> res!1076410 e!878638)))

(declare-fun b!1575369 () Bool)

(assert (=> b!1575369 (= e!878637 (Intermediate!13700 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575370 () Bool)

(assert (=> b!1575370 (and (bvsge (index!57200 lt!675165) #b00000000000000000000000000000000) (bvslt (index!57200 lt!675165) (size!51385 _keys!605)))))

(declare-fun res!1076409 () Bool)

(assert (=> b!1575370 (= res!1076409 (= (select (arr!50835 _keys!605) (index!57200 lt!675165)) k!761))))

(assert (=> b!1575370 (=> res!1076409 e!878638)))

(assert (=> b!1575370 (= e!878635 e!878638)))

(declare-fun b!1575371 () Bool)

(assert (=> b!1575371 (= e!878637 e!878639)))

(declare-fun c!145745 () Bool)

(assert (=> b!1575371 (= c!145745 (or (= lt!675166 k!761) (= (bvadd lt!675166 lt!675166) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575372 () Bool)

(assert (=> b!1575372 (= e!878639 (Intermediate!13700 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165419 c!145746) b!1575369))

(assert (= (and d!165419 (not c!145746)) b!1575371))

(assert (= (and b!1575371 c!145745) b!1575372))

(assert (= (and b!1575371 (not c!145745)) b!1575364))

(assert (= (and d!165419 c!145744) b!1575366))

(assert (= (and d!165419 (not c!145744)) b!1575367))

(assert (= (and b!1575367 res!1076411) b!1575370))

(assert (= (and b!1575370 (not res!1076409)) b!1575368))

(assert (= (and b!1575368 (not res!1076410)) b!1575365))

(declare-fun m!1448381 () Bool)

(assert (=> b!1575368 m!1448381))

(assert (=> b!1575364 m!1448361))

(declare-fun m!1448383 () Bool)

(assert (=> b!1575364 m!1448383))

(assert (=> b!1575364 m!1448383))

(declare-fun m!1448385 () Bool)

(assert (=> b!1575364 m!1448385))

(assert (=> b!1575365 m!1448381))

(assert (=> b!1575370 m!1448381))

(assert (=> d!165419 m!1448361))

(declare-fun m!1448387 () Bool)

(assert (=> d!165419 m!1448387))

(assert (=> d!165419 m!1448353))

(assert (=> b!1575291 d!165419))

(declare-fun d!165425 () Bool)

(declare-fun lt!675172 () (_ BitVec 32))

(declare-fun lt!675171 () (_ BitVec 32))

(assert (=> d!165425 (= lt!675172 (bvmul (bvxor lt!675171 (bvlshr lt!675171 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165425 (= lt!675171 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165425 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076412 (let ((h!38266 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142160 (bvmul (bvxor h!38266 (bvlshr h!38266 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142160 (bvlshr x!142160 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076412 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076412 #b00000000000000000000000000000000))))))

(assert (=> d!165425 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675172 (bvlshr lt!675172 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575291 d!165425))

(push 1)

